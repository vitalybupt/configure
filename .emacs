;;{{{ Setup Load Path

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq load-path (append
                 load-path
                 '("~/etc/Emacs")
                 ))
					;(setq load-path (cons (expand-file-name "d:/Gnus/lisp") load-path))
;;}}} End Load Path;;;;;;;;;;;;;;;;

(require 'ido)
(ido-mode t)

(require 'recentf)
(setq recentf-auto-cleanup 'never) ;; disable before we start recentf!
(recentf-mode 1)

;;{{{ Global Settings...
(setq-default ispell-program-name "aspell")
(fset 'yes-or-no-p 'y-or-n-p)
(transient-mark-mode t)
(column-number-mode t)
(display-time-mode t)
(setq auto-save-interval 300)
;; avoid jump to former paenthese 
(setq show-paren-mode 't)
(setq show-paren-style 'parentheses)	; seems does not work
;; avoid jump when scrolling
(setq scroll-setp 1
      scroll-margin 3
      scroll-conservatively 10000)
;; Show buffer name in title
(setq frame-title-format "emacs@%b")
;; auto show image
(auto-image-file-mode)
;; do not backup files
;;(setq make-backup-file nil)
;; big file highligh too slow;
(setq lazy-lock-defer-on-scrolling t)
;;(setq font-lock-support-mode 'lazy-lock-mode)
(setq font-lock-maximum-decoration t)
;; auto complete function
(global-set-key "\M- " 'hippie-expand)
(setq hippie-expand-try-functions-list 
      '(try-complete-file-name-partially 
	try-complete-file-name 
	try-expand-all-abbrevs 
	try-expand-list 
	try-expand-line 
	try-expand-dabbrev 
	try-expand-dabbrev-all-buffers 
	try-expand-dabbrev-from-kill 
	try-complete-lisp-symbol-partially 
	try-complete-lisp-symbol))
;; match the next bracket 
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
	((looking-at "\\s\)") (forward-char 1) (backward-list 1))
	(t (self-insert-command (or arg 1)))))
(global-set-key "%" 'match-paren) 
;; hot key for goto-line
(global-set-key "\M-g" 'goto-line)
;;}}}


;;{{{ Color Themes
;; color-theme.el
;; so beautiful color themes
(require 'color-theme)
(eval-after-load "color-theme"
 '(progn
    (color-theme-initialize)
    (color-theme-subtle-hacker)))
(color-theme-subtle-hacker)
;;}}}

;;{{{ Show Line Number
;; wb-line-nubmer.el
(set-scroll-bar-mode nil)
;;(require 'wb-line-number)
;;(wb-line-number-enable)
;; setnu.el to show line, no so good
;;(require 'setnu)
;;(setnu-mode t)
;;}}}

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-compression-mode t nil (jka-compr))
 '(case-fold-search t)
 '(column-number-mode t)
 '(current-language-environment "Chinese-GB")
 '(default-input-method "chinese-py-punct")
 '(display-time-mode t)
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(global-font-lock-mode t nil (font-lock))
 '(ltext-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
 '(make-backup-files nil)
 '(package-selected-packages
   (quote
    (go-mode helm less-css-mode ztree yaml-mode vbasense uncrustify-mode sr-speedbar screenshot magit lua-mode json-mode groovy-mode gradle-mode flymake-lua cmake-font-lock)))
 '(show-paren-mode t)
 '(tool-bar-mode nil nil (tool-bar)))

;; Customaztions for slime-mode
;(add-to-list 'load-path "/home/zjw/etc/Emacs/slime")
;(setq inferior-lisp-program "/home/zjw/programs/bin/sbcl")
;(require 'slime)
;;(slime-setup)
;(slime-setup '(slime-fancy))

;; Customizations for rfc-mode
(setq auto-mode-alist
      (cons '("/rfc[0-9]+\\.txt\\(\\.gz\\)?\\'" . rfcview-mode)
	    auto-mode-alist))
(autoload 'rfcview-mode "rfcview" nil t)

;; Customizations for clearcase-mode
;;(load "clearcase")
;;(load "vc-clearcase-auto")

;; Customizations for fold-mode, seems conflict to emacs-23
;(setq fold-mode-prefix-key "\C-c\C-o")
;(setq fold-autoclose-other-folds nil)
;(require 'fold nil t)
;(when (featurep 'fold)
;  (add-hook 'find-file-hook 'fold-find-file-hook t))

(if (fboundp 'global-font-lock-mode)
    (global-font-lock-mode 1)) 

(setq default-fill-column 60)

;; Xrefactory configuration part ;;
;; some Xrefactory defaults can be set here
;; (defvar xref-current-project nil) ;; can be also "my_project_name"
;; (defvar xref-key-binding 'global) ;; can be also 'local or 'none
;; (setq load-path (cons "/home/zjw/etc/Emacs/xref/emacs" load-path))
;; (setq exec-path (cons "/home/zjw/etc/Emacs/xref" exec-path))
;; (load "xrefactory")
;; end of Xrefactory configuration part ;;
;; (message "xrefactory loaded")

;;(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
;; )


;;(create-fontset-from-fontset-spec
;;"-*-lucidatypewriter-bold-r-normal-*-16-140-*-*-*-*-fontset-lucida,"
;;)
;;(set-default-font "fontset-lucida")
;;(set-default-font "Bitstream Vera Sans Mono-14")
;;(set-frame-font "Bitstream Vera Sans Mono:pixelsize=21")
(set-frame-font "DejaVu Sans Mono::pixelsize=23")
(setq x-select-enable-clipboard t)

(defconst my-c-style
  '((c-tab-always-indent           . t)
    (c-comment-only-line-offset    . 4)
    (c-hanging-braces-alist        . ((substatement-open after)
                                      (brace-list-open)))
    (c-hanging-colons-alist        . ((member-init-intro before)
                                      (inher-intro)
                                      (case-label after)
                                      (label after)
                                      (access-label after)))
    (c-cleanup-list                . (scope-operator
                                      empty-defun-braces
                                      defun-close-semi))
    (c-offsets-alist               . ((arglist-close     . c-lineup-arglist)
                                      (substatement-open . 0)
                                      (case-label        . 4)
                                      (block-open        . 0)
                                      (knr-argdecl-intro . -)))
    (c-echo-syntactic-information-p . t)
    )
  "My C Programming Style")

;; Customizations for all of c-mode, c++-mode, and objc-mode
(defun my-c-mode-common-hook ()
  ;; add my personal style and set it for the current buffer
  (c-add-style "PERSONAL" my-c-style t)
  ;; offset customizations not in my-c-style
  (c-set-offset 'member-init-intro '++)
  ;; other customizations
  (setq tab-width 8
        ;; this will make sure spaces are used instead of tabs
        indent-tabs-mode nil)
  ;; we like auto-newline and hungry-delete
  (c-toggle-auto-hungry-state 1)
  ;; keybindings for C, C++, and Objective-C.  We can put these in
  ;; c-mode-map because c++-mode-map and objc-mode-map inherit it
  (define-key c-mode-map "\C-m" 'newline-and-indent)
  )


(setq auto-mode-alist
      (cons '("\\.test\\'" . tcl-mode)
	    auto-mode-alist))

;; Customizations for ans-mode
(setq load-path (cons "/home/zjw/etc/Emacs/asn.1/" load-path))
;;; ASN.1 Mode
(autoload 'asn1-diff-mode "asn1-diff"
  "Major mode for editing comparison of ASN.1 specifications." t)
(autoload 'asn1-diff "asn1-diff"
  "For comparing ASN.1 specifications." t)
(autoload 'asn1-mode "asn1-mode"
  "Major mode for editing ASN.1 specifications." t)
(setq auto-mode-alist
      (cons '("\\.[Aa][Ss][Nn]\\([1]\\|[pP][pP]?\\)?$" . asn1-mode)
	    auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.[Aa][Ss][Nn][dD]$" . asn1-diff-mode2) auto-mode-alist))

;; Customizations for org-mode
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(setq org-log-done 'time)
(setq org-agenda-files (list "~/documents/work/notes/note.org"
                             "~/documents/work/notes/work.org"
			     "~/documents/work/notes/tasks.org"))
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cl" 'org-store-link)
(setq auto-mode-alist
      (cons '("\\.map\\'" . lua-mode)
	    auto-mode-alist))

;; Customizations for muse-mode
;;(add-to-list 'load-path "/home/zjw/etc/Emacs/muse")

;;(require 'muse-mode)     ; load authoring mode

;;(require 'muse-html)     ; load publishing styles I use
;;(require 'muse-latex)
;;(require 'muse-texinfo)
;;(require 'muse-docbook)

;;(require 'muse-project)  ; publish files in projects


;; Customizations for cscpoe-mode
(require 'xcscope)
(define-key global-map [(control f3)]  'cscope-set-initial-directory)
(define-key global-map [(control f4)]  'cscope-unset-initial-directory)
(define-key global-map [(control f5)]  'cscope-find-this-symbol)
(define-key global-map [(control f6)]  'cscope-find-global-definition)
(define-key global-map [(control f7)]
 'cscope-find-global-definition-no-prompting)
(define-key global-map [(control f8)]  'cscope-pop-mark)
(define-key global-map [(control f9)]  'cscope-next-symbol)
(define-key global-map [(control f10)] 'cscope-next-file)
(define-key global-map [(control f11)] 'cscope-prev-symbol)
(define-key global-map [(control f12)] 'cscope-prev-file)
(define-key global-map [(meta f9)]  'cscope-display-buffer)
(define-key global-map [(meta f10)] 'cscope-display-buffer-toggle)
(setq cscope-database-regexps
      '(
	( "/mmpbxtools/.*"
	  ( "/local/projects/mmpbxtools/")
	  t
	  )

	( "/local/dect_firmware/.*"
	  ( "/home/zjw/documents/cscope-database/default")
	  t
	  )
	( "/local/tablet_code/.*"
	  ( "/home/zjw/documents/cscope-database/default")
	  t
	  )
	( "/vobs/import/.*"
	  ( "/home/zjw/documents/cscope-database/default")
	  t
	  )
	( "/local/dect_code/.*"
	  ( "/home/zjw/documents/cscope-database/default")
	  t
	  )
	( "/local/mmpbxtools/.*"
	  ( "/local/mmpbxtools/cmake")
	  t
	  )
	( "/vobs/linux/fs/uClibc/.*"
	  ( "/home/zjw/documents/cscope-database/default")
	  t
	  )
	( "/vobs/fsn/.*"
	  ( "/home/zjw/documents/cscope-database/default")
	  t
	  )
	( "/mmpbx.*"
	 ( "/home/zjw/documents/cscope-database/openwrt-voip")
	 t
	 )
	( "/phoenix.*"
	  ( "/home/zjw/documents/cscope-database/openwrt-voip")
	  t
	  )
	( "/griffin.*"
	  ( "/home/zjw/documents/cscope-database/openwrt-voip")
	  t
	  )
	( "/xChange.*"
	  ( "/home/zjw/documents/cscope-database/openwrt-voip")
	  t
	  )
	( "/mmbrcm.*"
	  ( "/home/zjw/documents/cscope-database/openwrt-voip")
	  t
	  )
	( "/radvision.*"
	  ( "/home/zjw/documents/cscope-database/openwrt-voip")
	  t
	  )
	( "/apps/voice.*"
	  ( "/home/zjw/documents/cscope-database/openwrt-voip")
	  t
	  )
	( "/char/slicslac.*"
	  ( "/home/zjw/documents/cscope-database/openwrt-voip")
	  t
	  )

	)
      )

;; (setq ediff-window-setup-function 'ediff-setup-windows-plain)
;; (custom-set-faces
;;   ;; custom-set-faces was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  )


(defun join-lines () (interactive)
 (setq fill-column 100000)
 (fill-paragraph nil)
 (setq fill-column 78)
)


(setq auto-mode-alist (cons '("\\.lua$" . lua-mode) auto-mode-alist))

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)

(global-set-key "\C-Z" nil)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; use fold-dwim to fold xml file        ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'nxml-mode-hook 'my-fold-dwim-hook)
(defun my-fold-dwin-hook ()
   (fold-dwim-turn-on-hs-and-hide)
   )
  
(defun my-xhtml-extras ()
   (make-local-variable 'outline-regexp)
   (setq outline-regexp "\\s *<\\([h][1-6]\\|html\\|body\\|head\\)\\b")
   (make-local-variable 'outline-level)
   (setq outline-level 'my-xhtml-outline-level)
   (outline-minor-mode 1)
   (hs-minor-mode 1))
(defun my-xhtml-outline-level ()
   (save-excursion (re-search-forward html-outline-level))
   (let ((tag (buffer-substring (match-beginning 1) (match-end 1))))
     (if (eq (length tag) 2)
         (- (aref tag 1) ?0)
       0)))
(add-to-list 'hs-special-modes-alist
              '(nxml-mode
                "<!--\\|<[^/>]>\\|<[^/][^>]*[^/]>"
                ""
                "<!--" ;; won't work on its own; uses syntax table
                (lambda (arg) (my-nxml-forward-element))
                nil))
(defun my-nxml-forward-element ()
   (let ((nxml-sexp-element-flag))
     (setq nxml-sexp-element-flag (not (looking-at "<!--")))
     (unless (looking-at outline-regexp)
       (condition-case nil
           (nxml-forward-balanced-item 1)
         (error nil)))))
;;(setq default-frame-alist '((font . "DejaVu LGC Sans Mono-15")))

(require 'nyan-mode)

(global-unset-key (kbd "C-z"))

(require 'tail)

(require 'tramp)
(setq tramp-default-method "ssh")
(setq tramp-use-ssh-controlmaster-options nil)
(require 'package)
(add-to-list 'package-archives 
;;	     '("marmalade" . "http://marmalade-repo.org/packages/"))
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)

(setq tramp-ssh-controlmaster-options
      "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")

(setq url-proxy-services
   '(("no_proxy" . "^\\(localhost\\|10.*\\)")
     ("http" . "127.0.0.1:3128")
     ("https" . "127.0.0.1:3128")))

(setq url-http-proxy-basic-auth-storage
    (list (list "edgmnproxy01.eu.thmulti.com:80"
                (cons "Input your LDAP UID !"
                      (base64-encode-string "zjw:Z5j4w321")))))

;(add-hook ¡®c-mode-hook (lambda () (add-to-list ¡®write-file-functions ¡®delete-trailing-whitespace)))

(add-to-list 'auto-mode-alist '("\\.ttcn3\\'" . ttcn-3-mode))

;(add-to-list 'load-path "/home/zjw/etc/Emacs/helm-master/")
;(require 'helm-onfig)

; Add cmake listfile names to the mode list.
(setq auto-mode-alist
	  (append
	   '(("CMakeLists\\.txt\\'" . cmake-mode))
	   '(("\\.cmake\\'" . cmake-mode))
	   auto-mode-alist))

(autoload 'cmake-font-lock-activate "cmake-font-lock" nil t)
(add-hook 'cmake-mode-hook 'cmake-font-lock-activate)

(require 'ttcn3)


(defun copy-lines-matching-re (re)
  "find all lines matching the regexp RE in the current buffer
putting the matching lines in a buffer named *matching*"
  (interactive "sRegexp to match: ")
  (let ((result-buffer (get-buffer-create "*matching*")))
    (with-current-buffer result-buffer 
      (erase-buffer))
    (save-match-data 
      (save-excursion
        (goto-char (point-min))
        (while (re-search-forward re nil t)
          (princ (buffer-substring-no-properties (line-beginning-position) 
                                                 (line-beginning-position 2))
                 result-buffer))))
    (pop-to-buffer result-buffer)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)   

(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js-mode))

(defun my-put-file-name-on-clipboard ()
  "Put the current file name on the clipboard"
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (with-temp-buffer
        (insert filename)
        (clipboard-kill-region (point-min) (point-max)))
      (message filename))))

(setq auto-mode-alist
      (cons '("\\.gradle\\'" . groovy-mode)
	    auto-mode-alist))

(add-hook 'org-mode-hook #'(lambda ()
                             ;; make the lines in the buffer wrap around the edges of the screen.
                             ;; to press C-c q  or fill-paragraph ever again!
                             (visual-line-mode)
                             (org-indent-mode)))
