" Vim syntax file
" Language:	embperl
" Maintainer:	Lukas Zapletal <Lukas.Zapletal@seznam.cz>
" Version: 1.0
" URL: http://vim.sourceforge.net/scripts/search_results.php?keywords=Embperl
" Last change:	2001 May 1

" Example .vimrc:
" 
" 	let perl_fold=1
"		augroup filetypedetect
"		autocmd! BufNewFile,BufRead *.epl,*.phtml setf embperl
"		augroup END
"
"		" if you want yellow code like in Interdev:
"		autocmd BufNewFile,BufRead *.epl,*.phtml colorscheme embperl_yellow
"		

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'embperl'
endif

if version < 600
	source <sfile>:p:h/html.vim
	syn include @EmbperlPerl <sfile>:p:h/perl.vim
else
  runtime! syntax/html.vim
  unlet b:current_syntax
  syn include @EmbperlPerl syntax/perl.vim
endif

syn cluster htmlPreproc add=EmbperlInsideHtml

" these are the embperl regions, which simply contain perl expressions (except for the special [$ mode)
syn keyword embperlMeta contained if elsif else while foreach endif endwhile endforeach vars hidden
syn region EmbperlInsideHtml matchgroup=Tags start="\[+"rs=s end="+\]"re=e contains=@EmbperlPerl
syn region EmbperlInsideHtml matchgroup=Tags start=+\[-+rs=s end=+-\]+re=e contains=@EmbperlPerl
syn region EmbperlInsideHtml matchgroup=Tags start=+\[!+rs=s end=+!\]+re=e contains=@EmbperlPerl
syn region EmbperlInsideHtml matchgroup=Tags start=+\[\$+ end=+\$\]+ contains=embperlMeta,@EmbperlPerl

hi link embperlMeta 		perlStatement

let b:current_syntax = "embperl"

if main_syntax == 'embperl'
  unlet main_syntax
endif

" vim: set tabstop=2 shiftwidth=2 noexpandtab:
