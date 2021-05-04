Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BEB372B15
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 15:32:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122395.230862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldv9q-0003qp-Hv; Tue, 04 May 2021 13:32:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122395.230862; Tue, 04 May 2021 13:32:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldv9q-0003q9-E7; Tue, 04 May 2021 13:32:14 +0000
Received: by outflank-mailman (input) for mailman id 122395;
 Tue, 04 May 2021 13:32:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8884=J7=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1ldv9p-0003nw-9G
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 13:32:13 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id f25d994e-633f-4031-ab52-29192e9e6662;
 Tue, 04 May 2021 13:31:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B3A61063;
 Tue,  4 May 2021 06:31:56 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.197.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 337253F73B;
 Tue,  4 May 2021 06:31:54 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: f25d994e-633f-4031-ab52-29192e9e6662
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 1/3] docs: add doxygen support for html documentation
Date: Tue,  4 May 2021 14:31:43 +0100
Message-Id: <20210504133145.767-2-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210504133145.767-1-luca.fancellu@arm.com>
References: <20210504133145.767-1-luca.fancellu@arm.com>

Add doxygen support to build html documentation with sphinx,
to do that the following modification are applied:

1) Modify docs/configure.ac and consequently configure script
   to check, through the ./configure script, the presence in
   the system of the sphinx-build binary, if it is found then
   it checks also the presence of the doxygen binary, breathe
   and sphinx-rtd-theme python packages.
   Doxygen and the packages are required only if sphinx-build
   is found, otherwise the Makefile will simply skip the
   sphinx html generation.
   The ax_python_module.m4 support is needed to check for
   python packages.
2) Add doxygen templates and configuration file
3) Modify docs/Makefile to call in sequence doxygen and
   sphinx-build, the doxygen configuration file will be
   modified to include the xen absolute path and
   a list of header to parse.
   A doxygen_input.h file is generated to include every
   header listed in the doxy_input.list file.
4) Add preprocessor called by doxygen before parsing headers,
   it will include in every header a doxygen_include.h file
   that provides missing defines and includes that are
   usually passed by the compiler.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
v4 changes:
- create alias @keepindent/@endkeepindent for the doxygen
  command @code/@endcode
v3 changes:
- add preprocessor to handle missing defines and anonymous
  structs/unions before doxygen parsing
- modification to Makefile to handle the new process
v2 changes:
- Fix bug in Makefile when sphinx is not found in the system
---
 .gitignore                                   |    6 +
 config/Docs.mk.in                            |    2 +
 docs/Makefile                                |   42 +-
 docs/conf.py                                 |   48 +-
 docs/configure                               |  258 ++
 docs/configure.ac                            |   15 +
 docs/xen-doxygen/customdoxygen.css           |   36 +
 docs/xen-doxygen/doxy-preprocessor.py        |  110 +
 docs/xen-doxygen/doxy_input.list             |    0
 docs/xen-doxygen/doxygen_include.h.in        |   32 +
 docs/xen-doxygen/footer.html                 |   21 +
 docs/xen-doxygen/header.html                 |   56 +
 docs/xen-doxygen/mainpage.md                 |    5 +
 docs/xen-doxygen/xen_project_logo_165x67.png |  Bin 0 -> 18223 bytes
 docs/xen.doxyfile.in                         | 2316 ++++++++++++++++++
 m4/ax_python_module.m4                       |   56 +
 m4/docs_tool.m4                              |    9 +
 17 files changed, 3006 insertions(+), 6 deletions(-)
 create mode 100644 docs/xen-doxygen/customdoxygen.css
 create mode 100755 docs/xen-doxygen/doxy-preprocessor.py
 create mode 100644 docs/xen-doxygen/doxy_input.list
 create mode 100644 docs/xen-doxygen/doxygen_include.h.in
 create mode 100644 docs/xen-doxygen/footer.html
 create mode 100644 docs/xen-doxygen/header.html
 create mode 100644 docs/xen-doxygen/mainpage.md
 create mode 100644 docs/xen-doxygen/xen_project_logo_165x67.png
 create mode 100644 docs/xen.doxyfile.in
 create mode 100644 m4/ax_python_module.m4

diff --git a/.gitignore b/.gitignore
index 1c2fa1530b..d271e0ce6a 100644
--- a/.gitignore
+++ b/.gitignore
@@ -58,6 +58,12 @@ docs/man7/
 docs/man8/
 docs/pdf/
 docs/txt/
+docs/doxygen-output
+docs/sphinx
+docs/xen.doxyfile
+docs/xen.doxyfile.tmp
+docs/xen-doxygen/doxygen_include.h
+docs/xen-doxygen/doxygen_include.h.tmp
 extras/mini-os*
 install/*
 stubdom/*-minios-config.mk
diff --git a/config/Docs.mk.in b/config/Docs.mk.in
index e76e5cd5ff..dfd4a02838 100644
--- a/config/Docs.mk.in
+++ b/config/Docs.mk.in
@@ -7,3 +7,5 @@ POD2HTML            := @POD2HTML@
 POD2TEXT            := @POD2TEXT@
 PANDOC              := @PANDOC@
 PERL                := @PERL@
+SPHINXBUILD         := @SPHINXBUILD@
+DOXYGEN             := @DOXYGEN@
diff --git a/docs/Makefile b/docs/Makefile
index 8de1efb6f5..2f784c36ce 100644
--- a/docs/Makefile
+++ b/docs/Makefile
@@ -17,6 +17,18 @@ TXTSRC-y := $(sort $(shell find misc -name '*.txt' -print))
 
 PANDOCSRC-y := $(sort $(shell find designs/ features/ misc/ process/ specs/ \( -name '*.pandoc' -o -name '*.md' \) -print))
 
+# Directory in which the doxygen documentation is created
+# This must be kept in sync with breathe_projects value in conf.py
+DOXYGEN_OUTPUT = doxygen-output
+
+# Doxygen input headers from xen-doxygen/doxy_input.list file
+DOXY_LIST_SOURCES != cat "xen-doxygen/doxy_input.list"
+DOXY_LIST_SOURCES := $(realpath $(addprefix $(XEN_ROOT)/,$(DOXY_LIST_SOURCES)))
+
+DOXY_DEPS := xen.doxyfile \
+			 xen-doxygen/mainpage.md \
+			 xen-doxygen/doxygen_include.h
+
 # Documentation targets
 $(foreach i,$(MAN_SECTIONS), \
   $(eval DOC_MAN$(i) := $(patsubst man/%.$(i),man$(i)/%.$(i), \
@@ -46,8 +58,28 @@ all: build
 build: html txt pdf man-pages figs
 
 .PHONY: sphinx-html
-sphinx-html:
-	sphinx-build -b html . sphinx/html
+sphinx-html: $(DOXY_DEPS) $(DOXY_LIST_SOURCES)
+ifneq ($(SPHINXBUILD),no)
+	$(DOXYGEN) xen.doxyfile
+	XEN_ROOT=$(realpath $(XEN_ROOT)) $(SPHINXBUILD) -b html . sphinx/html
+else
+	@echo "Sphinx is not installed; skipping sphinx-html documentation."
+endif
+
+xen.doxyfile: xen.doxyfile.in xen-doxygen/doxy_input.list
+	@echo "Generating $@"
+	@sed -e "s,@XEN_BASE@,$(realpath $(XEN_ROOT)),g" $< \
+		| sed -e "s,@DOXY_OUT@,$(DOXYGEN_OUTPUT),g" > $@.tmp
+	@$(foreach inc,\
+		$(DOXY_LIST_SOURCES),\
+		echo "INPUT += \"$(inc)\"" >> $@.tmp; \
+	)
+	mv $@.tmp $@
+
+xen-doxygen/doxygen_include.h: xen-doxygen/doxygen_include.h.in
+	@echo "Generating $@"
+	@sed -e "s,@XEN_BASE@,$(realpath $(XEN_ROOT)),g" $< > $@.tmp
+	@mv $@.tmp $@
 
 .PHONY: html
 html: $(DOC_HTML) html/index.html
@@ -71,7 +103,11 @@ clean: clean-man-pages
 	$(MAKE) -C figs clean
 	rm -rf .word_count *.aux *.dvi *.bbl *.blg *.glo *.idx *~
 	rm -rf *.ilg *.log *.ind *.toc *.bak *.tmp core
-	rm -rf html txt pdf sphinx/html
+	rm -rf html txt pdf sphinx $(DOXYGEN_OUTPUT)
+	rm -f xen.doxyfile
+	rm -f xen.doxyfile.tmp
+	rm -f xen-doxygen/doxygen_include.h
+	rm -f xen-doxygen/doxygen_include.h.tmp
 
 .PHONY: distclean
 distclean: clean
diff --git a/docs/conf.py b/docs/conf.py
index 50e41501db..a48de42331 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -13,13 +13,17 @@
 # add these directories to sys.path here. If the directory is relative to the
 # documentation root, use os.path.abspath to make it absolute, like shown here.
 #
-# import os
-# import sys
+import os
+import sys
 # sys.path.insert(0, os.path.abspath('.'))
 
 
 # -- Project information -----------------------------------------------------
 
+if "XEN_ROOT" not in os.environ:
+    sys.exit("$XEN_ROOT environment variable undefined.")
+XEN_ROOT = os.path.abspath(os.environ["XEN_ROOT"])
+
 project = u'Xen'
 copyright = u'2019, The Xen development community'
 author = u'The Xen development community'
@@ -35,6 +39,7 @@ try:
             xen_subver = line.split(u"=")[1].strip()
         elif line.startswith(u"export XEN_EXTRAVERSION"):
             xen_extra = line.split(u"=")[1].split(u"$", 1)[0].strip()
+
 except:
     pass
 finally:
@@ -44,6 +49,15 @@ finally:
     else:
         version = release = u"unknown version"
 
+try:
+    xen_doxygen_output = None
+
+    for line in open(u"Makefile"):
+        if line.startswith(u"DOXYGEN_OUTPUT"):
+                xen_doxygen_output = line.split(u"=")[1].strip()
+except:
+    sys.exit("DOXYGEN_OUTPUT variable undefined.")
+
 # -- General configuration ---------------------------------------------------
 
 # If your documentation needs a minimal Sphinx version, state it here.
@@ -53,7 +67,8 @@ needs_sphinx = '1.4'
 # Add any Sphinx extension module names here, as strings. They can be
 # extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
 # ones.
-extensions = []
+# breathe -> extension that integrates doxygen xml output with sphinx
+extensions = ['breathe']
 
 # Add any paths that contain templates here, relative to this directory.
 templates_path = ['_templates']
@@ -175,6 +190,33 @@ texinfo_documents = [
      'Miscellaneous'),
 ]
 
+# -- Options for Breathe extension -------------------------------------------
+
+breathe_projects = {
+    "Xen": "{}/docs/{}/xml".format(XEN_ROOT, xen_doxygen_output)
+}
+breathe_default_project = "Xen"
+
+breathe_domain_by_extension = {
+    "h": "c",
+    "c": "c",
+}
+breathe_separate_member_pages = True
+breathe_show_enumvalue_initializer = True
+breathe_show_define_initializer = True
+
+# Qualifiers to a function are causing Sphihx/Breathe to warn about
+# Error when parsing function declaration and more.  This is a list
+# of strings that the parser additionally should accept as
+# attributes.
+cpp_id_attributes = [
+    '__syscall', '__deprecated', '__may_alias',
+    '__used', '__unused', '__weak',
+    '__DEPRECATED_MACRO', 'FUNC_NORETURN',
+    '__subsystem',
+]
+c_id_attributes = cpp_id_attributes
+
 
 # -- Options for Epub output -------------------------------------------------
 
diff --git a/docs/configure b/docs/configure
index 569bd4c2ff..0ebf046a79 100755
--- a/docs/configure
+++ b/docs/configure
@@ -588,6 +588,8 @@ ac_unique_file="misc/xen-command-line.pandoc"
 ac_subst_vars='LTLIBOBJS
 LIBOBJS
 PERL
+DOXYGEN
+SPHINXBUILD
 PANDOC
 POD2TEXT
 POD2HTML
@@ -673,6 +675,7 @@ POD2MAN
 POD2HTML
 POD2TEXT
 PANDOC
+DOXYGEN
 PERL'
 
 
@@ -1318,6 +1321,7 @@ Some influential environment variables:
   POD2HTML    Path to pod2html tool
   POD2TEXT    Path to pod2text tool
   PANDOC      Path to pandoc tool
+  DOXYGEN     Path to doxygen tool
   PERL        Path to Perl parser
 
 Use these variables to override the choices made by `configure' or to help
@@ -1800,6 +1804,7 @@ ac_configure="$SHELL $ac_aux_dir/configure"  # Please don't use this var.
 
 
 
+
 case "$host_os" in
 *freebsd*) XENSTORED_KVA=/dev/xen/xenstored ;;
 *) XENSTORED_KVA=/proc/xen/xsd_kva ;;
@@ -1812,6 +1817,53 @@ case "$host_os" in
 esac
 
 
+# ===========================================================================
+#     https://www.gnu.org/software/autoconf-archive/ax_python_module.html
+# ===========================================================================
+#
+# SYNOPSIS
+#
+#   AX_PYTHON_MODULE(modname[, fatal, python])
+#
+# DESCRIPTION
+#
+#   Checks for Python module.
+#
+#   If fatal is non-empty then absence of a module will trigger an error.
+#   The third parameter can either be "python" for Python 2 or "python3" for
+#   Python 3; defaults to Python 3.
+#
+# LICENSE
+#
+#   Copyright (c) 2008 Andrew Collier
+#
+#   Copying and distribution of this file, with or without modification, are
+#   permitted in any medium without royalty provided the copyright notice
+#   and this notice are preserved. This file is offered as-is, without any
+#   warranty.
+
+#serial 9
+
+# This is what autoupdate's m4 run will expand.  It fires
+# the warning (with _au_warn_XXX), outputs it into the
+# updated configure.ac (with AC_DIAGNOSE), and then outputs
+# the replacement expansion.
+
+
+# This is an auxiliary macro that is also run when
+# autoupdate runs m4.  It simply calls m4_warning, but
+# we need a wrapper so that each warning is emitted only
+# once.  We break the quoting in m4_warning's argument in
+# order to expand this macro's arguments, not AU_DEFUN's.
+
+
+# Finally, this is the expansion that is picked up by
+# autoconf.  It tells the user to run autoupdate, and
+# then outputs the replacement expansion.  We do not care
+# about autoupdate's warning because that contains
+# information on what to do *after* running autoupdate.
+
+
 
 
 test "x$prefix" = "xNONE" && prefix=$ac_default_prefix
@@ -2232,6 +2284,212 @@ $as_echo "$as_me: WARNING: pandoc is not available so some documentation won't b
 fi
 
 
+# If sphinx is installed, make sure to have also the dependencies to build
+# Sphinx documentation.
+for ac_prog in sphinx-build
+do
+  # Extract the first word of "$ac_prog", so it can be a program name with args.
+set dummy $ac_prog; ac_word=$2
+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+$as_echo_n "checking for $ac_word... " >&6; }
+if ${ac_cv_prog_SPHINXBUILD+:} false; then :
+  $as_echo_n "(cached) " >&6
+else
+  if test -n "$SPHINXBUILD"; then
+  ac_cv_prog_SPHINXBUILD="$SPHINXBUILD" # Let the user override the test.
+else
+as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
+for as_dir in $PATH
+do
+  IFS=$as_save_IFS
+  test -z "$as_dir" && as_dir=.
+    for ac_exec_ext in '' $ac_executable_extensions; do
+  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+    ac_cv_prog_SPHINXBUILD="$ac_prog"
+    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+    break 2
+  fi
+done
+  done
+IFS=$as_save_IFS
+
+fi
+fi
+SPHINXBUILD=$ac_cv_prog_SPHINXBUILD
+if test -n "$SPHINXBUILD"; then
+  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $SPHINXBUILD" >&5
+$as_echo "$SPHINXBUILD" >&6; }
+else
+  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
+$as_echo "no" >&6; }
+fi
+
+
+  test -n "$SPHINXBUILD" && break
+done
+test -n "$SPHINXBUILD" || SPHINXBUILD="no"
+
+    if test "x$SPHINXBUILD" = xno; then :
+  { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: sphinx-build is not available so sphinx documentation \
+won't be built" >&5
+$as_echo "$as_me: WARNING: sphinx-build is not available so sphinx documentation \
+won't be built" >&2;}
+else
+
+            # Extract the first word of "sphinx-build", so it can be a program name with args.
+set dummy sphinx-build; ac_word=$2
+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+$as_echo_n "checking for $ac_word... " >&6; }
+if ${ac_cv_path_SPHINXBUILD+:} false; then :
+  $as_echo_n "(cached) " >&6
+else
+  case $SPHINXBUILD in
+  [\\/]* | ?:[\\/]*)
+  ac_cv_path_SPHINXBUILD="$SPHINXBUILD" # Let the user override the test with a path.
+  ;;
+  *)
+  as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
+for as_dir in $PATH
+do
+  IFS=$as_save_IFS
+  test -z "$as_dir" && as_dir=.
+    for ac_exec_ext in '' $ac_executable_extensions; do
+  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+    ac_cv_path_SPHINXBUILD="$as_dir/$ac_word$ac_exec_ext"
+    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+    break 2
+  fi
+done
+  done
+IFS=$as_save_IFS
+
+  ;;
+esac
+fi
+SPHINXBUILD=$ac_cv_path_SPHINXBUILD
+if test -n "$SPHINXBUILD"; then
+  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $SPHINXBUILD" >&5
+$as_echo "$SPHINXBUILD" >&6; }
+else
+  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
+$as_echo "no" >&6; }
+fi
+
+
+
+
+    # Extract the first word of "doxygen", so it can be a program name with args.
+set dummy doxygen; ac_word=$2
+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+$as_echo_n "checking for $ac_word... " >&6; }
+if ${ac_cv_path_DOXYGEN+:} false; then :
+  $as_echo_n "(cached) " >&6
+else
+  case $DOXYGEN in
+  [\\/]* | ?:[\\/]*)
+  ac_cv_path_DOXYGEN="$DOXYGEN" # Let the user override the test with a path.
+  ;;
+  *)
+  as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
+for as_dir in $PATH
+do
+  IFS=$as_save_IFS
+  test -z "$as_dir" && as_dir=.
+    for ac_exec_ext in '' $ac_executable_extensions; do
+  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+    ac_cv_path_DOXYGEN="$as_dir/$ac_word$ac_exec_ext"
+    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+    break 2
+  fi
+done
+  done
+IFS=$as_save_IFS
+
+  ;;
+esac
+fi
+DOXYGEN=$ac_cv_path_DOXYGEN
+if test -n "$DOXYGEN"; then
+  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $DOXYGEN" >&5
+$as_echo "$DOXYGEN" >&6; }
+else
+  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
+$as_echo "no" >&6; }
+fi
+
+
+    if ! test -x "$ac_cv_path_DOXYGEN"; then :
+
+        as_fn_error $? "doxygen is needed" "$LINENO" 5
+
+fi
+
+
+    if test -z $PYTHON;
+    then
+        if test -z "";
+        then
+            PYTHON="python3"
+        else
+            PYTHON=""
+        fi
+    fi
+    PYTHON_NAME=`basename $PYTHON`
+    { $as_echo "$as_me:${as_lineno-$LINENO}: checking $PYTHON_NAME module: breathe" >&5
+$as_echo_n "checking $PYTHON_NAME module: breathe... " >&6; }
+    $PYTHON -c "import breathe" 2>/dev/null
+    if test $? -eq 0;
+    then
+        { $as_echo "$as_me:${as_lineno-$LINENO}: result: yes" >&5
+$as_echo "yes" >&6; }
+        eval HAVE_PYMOD_BREATHE=yes
+    else
+        { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
+$as_echo "no" >&6; }
+        eval HAVE_PYMOD_BREATHE=no
+        #
+        if test -n "yes"
+        then
+            as_fn_error $? "failed to find required module breathe" "$LINENO" 5
+            exit 1
+        fi
+    fi
+
+
+    if test -z $PYTHON;
+    then
+        if test -z "";
+        then
+            PYTHON="python3"
+        else
+            PYTHON=""
+        fi
+    fi
+    PYTHON_NAME=`basename $PYTHON`
+    { $as_echo "$as_me:${as_lineno-$LINENO}: checking $PYTHON_NAME module: sphinx_rtd_theme" >&5
+$as_echo_n "checking $PYTHON_NAME module: sphinx_rtd_theme... " >&6; }
+    $PYTHON -c "import sphinx_rtd_theme" 2>/dev/null
+    if test $? -eq 0;
+    then
+        { $as_echo "$as_me:${as_lineno-$LINENO}: result: yes" >&5
+$as_echo "yes" >&6; }
+        eval HAVE_PYMOD_SPHINX_RTD_THEME=yes
+    else
+        { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
+$as_echo "no" >&6; }
+        eval HAVE_PYMOD_SPHINX_RTD_THEME=no
+        #
+        if test -n "yes"
+        then
+            as_fn_error $? "failed to find required module sphinx_rtd_theme" "$LINENO" 5
+            exit 1
+        fi
+    fi
+
+
+
+fi
+
 
 # Extract the first word of "perl", so it can be a program name with args.
 set dummy perl; ac_word=$2
diff --git a/docs/configure.ac b/docs/configure.ac
index c2e5edd3b3..a2ff55f30a 100644
--- a/docs/configure.ac
+++ b/docs/configure.ac
@@ -20,6 +20,7 @@ m4_include([../m4/docs_tool.m4])
 m4_include([../m4/path_or_fail.m4])
 m4_include([../m4/features.m4])
 m4_include([../m4/paths.m4])
+m4_include([../m4/ax_python_module.m4])
 
 AX_XEN_EXPAND_CONFIG()
 
@@ -29,6 +30,20 @@ AX_DOCS_TOOL_PROG([POD2HTML], [pod2html])
 AX_DOCS_TOOL_PROG([POD2TEXT], [pod2text])
 AX_DOCS_TOOL_PROG([PANDOC], [pandoc])
 
+# If sphinx is installed, make sure to have also the dependencies to build
+# Sphinx documentation.
+AC_CHECK_PROGS([SPHINXBUILD], [sphinx-build], [no])
+    AS_IF([test "x$SPHINXBUILD" = xno],
+        [AC_MSG_WARN(sphinx-build is not available so sphinx documentation \
+won't be built)],
+        [
+            AC_PATH_PROG([SPHINXBUILD], [sphinx-build])
+            AX_DOCS_TOOL_REQ_PROG([DOXYGEN], [doxygen])
+            AX_PYTHON_MODULE([breathe],[yes])
+            AX_PYTHON_MODULE([sphinx_rtd_theme], [yes])
+        ]
+    )
+
 AC_ARG_VAR([PERL], [Path to Perl parser])
 AX_PATH_PROG_OR_FAIL([PERL], [perl])
 
diff --git a/docs/xen-doxygen/customdoxygen.css b/docs/xen-doxygen/customdoxygen.css
new file mode 100644
index 0000000000..4735e41cf5
--- /dev/null
+++ b/docs/xen-doxygen/customdoxygen.css
@@ -0,0 +1,36 @@
+/* Custom CSS for Doxygen-generated HTML
+ * Copyright (c) 2015 Intel Corporation
+ * SPDX-License-Identifier: Apache-2.0
+ */
+
+code {
+  font-family: Monaco,Menlo,Consolas,"Courier New",monospace;
+  background-color: #D8D8D8;
+  padding: 0 0.25em 0 0.25em;
+}
+
+pre.fragment {
+  display: block;
+  font-family: Monaco,Menlo,Consolas,"Courier New",monospace;
+  padding: 1rem;
+  word-break: break-all;
+  word-wrap: break-word;
+  white-space: pre;
+  background-color: #D8D8D8;
+}
+
+#projectlogo
+{
+  vertical-align: middle;
+}
+
+#projectname
+{
+  font: 200% Tahoma, Arial,sans-serif;
+  color: #3D578C;
+}
+
+#projectbrief
+{
+  color: #3D578C;
+}
diff --git a/docs/xen-doxygen/doxy-preprocessor.py b/docs/xen-doxygen/doxy-preprocessor.py
new file mode 100755
index 0000000000..496899d8e6
--- /dev/null
+++ b/docs/xen-doxygen/doxy-preprocessor.py
@@ -0,0 +1,110 @@
+#!/usr/bin/python3
+#
+# Copyright (c) 2021, Arm Limited.
+#
+# SPDX-License-Identifier: GPL-2.0
+#
+
+import os, sys, re
+
+
+# Variables that holds the preprocessed header text
+output_text = ""
+header_file_name = ""
+
+# Variables to enumerate the anonymous structs/unions
+anonymous_struct_count = 0
+anonymous_union_count = 0
+
+
+def error(text):
+    sys.stderr.write("{}\n".format(text))
+    sys.exit(1)
+
+
+def write_to_output(text):
+    sys.stdout.write(text)
+
+
+def insert_doxygen_header(text):
+    # Here the strategy is to insert the #include <doxygen_include.h> in the
+    # first line of the header
+    abspath = os.path.dirname(os.path.abspath(__file__))
+    text += "#include \"{}/doxygen_include.h\"\n".format(abspath)
+
+    return text
+
+
+def enumerate_anonymous(match):
+    global anonymous_struct_count
+    global anonymous_union_count
+
+    if "struct" in match.group(1):
+        label = "anonymous_struct_%d" % anonymous_struct_count
+        anonymous_struct_count += 1
+    else:
+        label = "anonymous_union_%d" % anonymous_union_count
+        anonymous_union_count += 1
+
+    return match.group(1) + " " + label + " {"
+
+
+def manage_anonymous_structs_unions(text):
+    # Match anonymous unions/structs with this pattern:
+    # struct/union {
+    #     [...]
+    #
+    # and substitute it in this way:
+    #
+    # struct anonymous_struct_# {
+    #     [...]
+    # or
+    # union anonymous_union_# {
+    #     [...]
+    # where # is a counter starting from zero, different between structs and
+    # unions
+    #
+    # We don't count anonymous union/struct that are part of a typedef because
+    # they don't create any issue for doxygen
+    text = re.sub(
+        "(?<!typedef\s)(struct|union)\s+?\{",
+        enumerate_anonymous,
+        text,
+        flags=re.S
+    )
+
+    return text
+
+
+def main(argv):
+    global output_text
+    global header_file_name
+
+    if len(argv) != 1:
+        error("Script called without arguments!")
+
+    header_file_name = argv[0]
+
+    # Open header file
+    input_header_file = open(header_file_name, 'r')
+    # Read all lines
+    lines = input_header_file.readlines()
+
+    # Inject config.h and some defines in the current header, during compilation
+    # this job is done by the -include argument passed to the compiler.
+    output_text = insert_doxygen_header(output_text)
+
+    # Load file content in a variable
+    for line in lines:
+        output_text += "{}".format(line)
+
+    # Try to get rid of any anonymous union/struct
+    output_text = manage_anonymous_structs_unions(output_text)
+
+    # Final stage of the preprocessor, print the output to stdout
+    write_to_output(output_text)
+
+
+if __name__ == "__main__":
+    main(sys.argv[1:])
+    sys.exit(0)
diff --git a/docs/xen-doxygen/doxy_input.list b/docs/xen-doxygen/doxy_input.list
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/docs/xen-doxygen/doxygen_include.h.in b/docs/xen-doxygen/doxygen_include.h.in
new file mode 100644
index 0000000000..df284f3931
--- /dev/null
+++ b/docs/xen-doxygen/doxygen_include.h.in
@@ -0,0 +1,32 @@
+/*
+ * Doxygen include header
+ * It supplies the xen/include/xen/config.h that is included using the -include
+ * argument of the compiler in Xen Makefile.
+ * Other macros are defined because they are usually provided by the compiler.
+ *
+ * Copyright (C) 2021 ARM Limited
+ *
+ * Author: Luca Fancellu <luca.fancellu@arm.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0
+ */
+
+#include "@XEN_BASE@/xen/include/xen/config.h"
+
+#if defined(CONFIG_X86_64)
+
+#define __x86_64__ 1
+
+#elif defined(CONFIG_ARM_64)
+
+#define __aarch64__ 1
+
+#elif defined(CONFIG_ARM_32)
+
+#define __arm__ 1
+
+#else
+
+#error Architecture not supported/recognized.
+
+#endif
diff --git a/docs/xen-doxygen/footer.html b/docs/xen-doxygen/footer.html
new file mode 100644
index 0000000000..a24bf2b9b4
--- /dev/null
+++ b/docs/xen-doxygen/footer.html
@@ -0,0 +1,21 @@
+<!-- HTML footer for doxygen 1.8.13-->
+<!-- start footer part -->
+<!--BEGIN GENERATE_TREEVIEW-->
+<div id="nav-path" class="navpath"><!-- id is needed for treeview function! -->
+  <ul>
+    $navpath
+    <li class="footer">$generatedby
+    <a href="http://www.doxygen.org/index.html">
+    <img class="footer" src="$relpath^doxygen.png" alt="doxygen"/></a> $doxygenversion </li>
+  </ul>
+</div>
+<!--END GENERATE_TREEVIEW-->
+<!--BEGIN !GENERATE_TREEVIEW-->
+<hr class="footer"/><address class="footer"><small>
+$generatedby &#160;<a href="http://www.doxygen.org/index.html">
+<img class="footer" src="$relpath^doxygen.png" alt="doxygen"/>
+</a> $doxygenversion
+</small></address>
+<!--END !GENERATE_TREEVIEW-->
+</body>
+</html>
diff --git a/docs/xen-doxygen/header.html b/docs/xen-doxygen/header.html
new file mode 100644
index 0000000000..83ac2f1835
--- /dev/null
+++ b/docs/xen-doxygen/header.html
@@ -0,0 +1,56 @@
+<!-- HTML header for doxygen 1.8.13-->
+<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
+<html xmlns="http://www.w3.org/1999/xhtml">
+<head>
+<meta http-equiv="Content-Type" content="text/xhtml;charset=UTF-8"/>
+<meta http-equiv="X-UA-Compatible" content="IE=9"/>
+<meta name="generator" content="Doxygen $doxygenversion"/>
+<meta name="viewport" content="width=device-width, initial-scale=1"/>
+<!--BEGIN PROJECT_NAME--><title>$projectname: $title</title><!--END PROJECT_NAME-->
+<!--BEGIN !PROJECT_NAME--><title>$title</title><!--END !PROJECT_NAME-->
+<link href="$relpath^tabs.css" rel="stylesheet" type="text/css"/>
+<script type="text/javascript" src="$relpath^jquery.js"></script>
+<script type="text/javascript" src="$relpath^dynsections.js"></script>
+$treeview
+$search
+$mathjax
+<link href="$relpath^$stylesheet" rel="stylesheet" type="text/css" />
+$extrastylesheet
+</head>
+<body>
+<div id="top"><!-- do not remove this div, it is closed by doxygen! -->
+
+<!--BEGIN TITLEAREA-->
+<div id="titlearea">
+<table cellspacing="0" cellpadding="0">
+ <tbody>
+ <tr style="height: 56px;">
+  <!--BEGIN PROJECT_LOGO-->
+  <td id="projectlogo"><img alt="Logo" src="$relpath^$projectlogo"/></td>
+  <!--END PROJECT_LOGO-->
+  <!--BEGIN PROJECT_NAME-->
+  <td id="projectalign" style="padding-left: 1em;">
+   <div id="projectname">$projectname
+   <!--BEGIN PROJECT_NUMBER-->&#160;<span id="projectnumber">$projectnumber</span><!--END PROJECT_NUMBER-->
+   </div>
+   <!--BEGIN PROJECT_BRIEF--><div id="projectbrief">$projectbrief</div><!--END PROJECT_BRIEF-->
+  </td>
+  <!--END PROJECT_NAME-->
+  <!--BEGIN !PROJECT_NAME-->
+   <!--BEGIN PROJECT_BRIEF-->
+    <td style="padding-left: 0.5em;">
+    <div id="projectbrief">$projectbrief</div>
+    </td>
+   <!--END PROJECT_BRIEF-->
+  <!--END !PROJECT_NAME-->
+  <!--BEGIN DISABLE_INDEX-->
+   <!--BEGIN SEARCHENGINE-->
+   <td>$searchbox</td>
+   <!--END SEARCHENGINE-->
+  <!--END DISABLE_INDEX-->
+ </tr>
+ </tbody>
+</table>
+</div>
+<!--END TITLEAREA-->
+<!-- end header part -->
diff --git a/docs/xen-doxygen/mainpage.md b/docs/xen-doxygen/mainpage.md
new file mode 100644
index 0000000000..ff548b87fc
--- /dev/null
+++ b/docs/xen-doxygen/mainpage.md
@@ -0,0 +1,5 @@
+# API Documentation   {#index}
+
+## Introduction
+
+## Licensing
diff --git a/docs/xen-doxygen/xen_project_logo_165x67.png b/docs/xen-doxygen/xen_project_logo_165x67.png
new file mode 100644
index 0000000000000000000000000000000000000000..7244959d59cdeb9f23c5202160ea45508dfc7265
GIT binary patch
literal 18223
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

literal 0
HcmV?d00001

diff --git a/docs/xen.doxyfile.in b/docs/xen.doxyfile.in
new file mode 100644
index 0000000000..00969d9b78
--- /dev/null
+++ b/docs/xen.doxyfile.in
@@ -0,0 +1,2316 @@
+# Doxyfile 1.8.13
+
+# This file describes the settings to be used by the documentation system
+# doxygen (www.doxygen.org) for a project.
+#
+# All text after a double hash (##) is considered a comment and is placed in
+# front of the TAG it is preceding.
+#
+# All text after a single hash (#) is considered a comment and will be ignored.
+# The format is:
+# TAG = value [value, ...]
+# For lists, items can also be appended using:
+# TAG += value [value, ...]
+# Values that contain spaces should be placed between quotes (\" \").
+#
+# This file is base on doc/zephyr.doxyfile.in zephry 2.3
+
+#---------------------------------------------------------------------------
+# Project related configuration options
+#---------------------------------------------------------------------------
+
+# This tag specifies the encoding used for all characters in the config file
+# that follow. The default is UTF-8 which is also the encoding used for all text
+# before the first occurrence of this tag. Doxygen uses libiconv (or the iconv
+# built into libc) for the transcoding. See
+# https://www.gnu.org/software/libiconv/ for the list of possible encodings.
+# The default value is: UTF-8.
+
+DOXYFILE_ENCODING      = UTF-8
+
+# The PROJECT_NAME tag is a single word (or a sequence of words surrounded by
+# double-quotes, unless you are using Doxywizard) that should identify the
+# project for which the documentation is generated. This name is used in the
+# title of most generated pages and in a few other places.
+# The default value is: My Project.
+
+PROJECT_NAME           = "Xen Project"
+
+# The PROJECT_NUMBER tag can be used to enter a project or revision number. This
+# could be handy for archiving the generated documentation or if some version
+# control system is used.
+
+PROJECT_NUMBER         =
+
+# Using the PROJECT_BRIEF tag one can provide an optional one line description
+# for a project that appears at the top of each page and should give viewer a
+# quick idea about the purpose of the project. Keep the description short.
+
+PROJECT_BRIEF          = "An Open Source Type 1 Hypervisor"
+
+# With the PROJECT_LOGO tag one can specify a logo or an icon that is included
+# in the documentation. The maximum height of the logo should not exceed 55
+# pixels and the maximum width should not exceed 200 pixels. Doxygen will copy
+# the logo to the output directory.
+
+PROJECT_LOGO           = "xen-doxygen/xen_project_logo_165x67.png"
+
+# The OUTPUT_DIRECTORY tag is used to specify the (relative or absolute) path
+# into which the generated documentation will be written. If a relative path is
+# entered, it will be relative to the location where doxygen was started. If
+# left blank the current directory will be used.
+
+OUTPUT_DIRECTORY       = @DOXY_OUT@
+
+# If the CREATE_SUBDIRS tag is set to YES then doxygen will create 4096 sub-
+# directories (in 2 levels) under the output directory of each output format and
+# will distribute the generated files over these directories. Enabling this
+# option can be useful when feeding doxygen a huge amount of source files, where
+# putting all generated files in the same directory would otherwise causes
+# performance problems for the file system.
+# The default value is: NO.
+
+CREATE_SUBDIRS         = NO
+
+# The OUTPUT_LANGUAGE tag is used to specify the language in which all
+# documentation generated by doxygen is written. Doxygen will use this
+# information to generate all constant output in the proper language.
+# Possible values are: Afrikaans, Arabic, Armenian, Brazilian, Catalan, Chinese,
+# Chinese-Traditional, Croatian, Czech, Danish, Dutch, English (United States),
+# Esperanto, Farsi (Persian), Finnish, French, German, Greek, Hungarian,
+# Indonesian, Italian, Japanese, Japanese-en (Japanese with English messages),
+# Korean, Korean-en (Korean with English messages), Latvian, Lithuanian,
+# Macedonian, Norwegian, Persian (Farsi), Polish, Portuguese, Romanian, Russian,
+# Serbian, Serbian-Cyrillic, Slovak, Slovene, Spanish, Swedish, Turkish,
+# Ukrainian and Vietnamese.
+# The default value is: English.
+
+OUTPUT_LANGUAGE        = English
+
+# If the BRIEF_MEMBER_DESC tag is set to YES, doxygen will include brief member
+# descriptions after the members that are listed in the file and class
+# documentation (similar to Javadoc). Set to NO to disable this.
+# The default value is: YES.
+
+BRIEF_MEMBER_DESC      = YES
+
+# If the REPEAT_BRIEF tag is set to YES, doxygen will prepend the brief
+# description of a member or function before the detailed description
+#
+# Note: If both HIDE_UNDOC_MEMBERS and BRIEF_MEMBER_DESC are set to NO, the
+# brief descriptions will be completely suppressed.
+# The default value is: YES.
+
+REPEAT_BRIEF           = YES
+
+# This tag implements a quasi-intelligent brief description abbreviator that is
+# used to form the text in various listings. Each string in this list, if found
+# as the leading text of the brief description, will be stripped from the text
+# and the result, after processing the whole list, is used as the annotated
+# text. Otherwise, the brief description is used as-is. If left blank, the
+# following values are used ($name is automatically replaced with the name of
+# the entity):The $name class, The $name widget, The $name file, is, provides,
+# specifies, contains, represents, a, an and the.
+
+ABBREVIATE_BRIEF       = YES
+
+# If the ALWAYS_DETAILED_SEC and REPEAT_BRIEF tags are both set to YES then
+# doxygen will generate a detailed section even if there is only a brief
+# description.
+# The default value is: NO.
+
+ALWAYS_DETAILED_SEC    = YES
+
+# If the INLINE_INHERITED_MEMB tag is set to YES, doxygen will show all
+# inherited members of a class in the documentation of that class as if those
+# members were ordinary class members. Constructors, destructors and assignment
+# operators of the base classes will not be shown.
+# The default value is: NO.
+
+INLINE_INHERITED_MEMB  = YES
+
+# If the FULL_PATH_NAMES tag is set to YES, doxygen will prepend the full path
+# before files name in the file list and in the header files. If set to NO the
+# shortest path that makes the file name unique will be used
+# The default value is: YES.
+
+FULL_PATH_NAMES        = YES
+
+# The STRIP_FROM_PATH tag can be used to strip a user-defined part of the path.
+# Stripping is only done if one of the specified strings matches the left-hand
+# part of the path. The tag can be used to show relative paths in the file list.
+# If left blank the directory from which doxygen is run is used as the path to
+# strip.
+#
+# Note that you can specify absolute paths here, but also relative paths, which
+# will be relative from the directory where doxygen is started.
+# This tag requires that the tag FULL_PATH_NAMES is set to YES.
+
+STRIP_FROM_PATH        = @XEN_BASE@
+
+# The STRIP_FROM_INC_PATH tag can be used to strip a user-defined part of the
+# path mentioned in the documentation of a class, which tells the reader which
+# header file to include in order to use a class. If left blank only the name of
+# the header file containing the class definition is used. Otherwise one should
+# specify the list of include paths that are normally passed to the compiler
+# using the -I flag.
+
+STRIP_FROM_INC_PATH    =
+
+# If the SHORT_NAMES tag is set to YES, doxygen will generate much shorter (but
+# less readable) file names. This can be useful is your file systems doesn't
+# support long names like on DOS, Mac, or CD-ROM.
+# The default value is: NO.
+
+SHORT_NAMES            = NO
+
+# If the JAVADOC_AUTOBRIEF tag is set to YES then doxygen will interpret the
+# first line (until the first dot) of a Javadoc-style comment as the brief
+# description. If set to NO, the Javadoc-style will behave just like regular Qt-
+# style comments (thus requiring an explicit @brief command for a brief
+# description.)
+# The default value is: NO.
+
+JAVADOC_AUTOBRIEF      = NO
+
+# If the QT_AUTOBRIEF tag is set to YES then doxygen will interpret the first
+# line (until the first dot) of a Qt-style comment as the brief description. If
+# set to NO, the Qt-style will behave just like regular Qt-style comments (thus
+# requiring an explicit \brief command for a brief description.)
+# The default value is: NO.
+
+QT_AUTOBRIEF           = NO
+
+# The MULTILINE_CPP_IS_BRIEF tag can be set to YES to make doxygen treat a
+# multi-line C++ special comment block (i.e. a block of //! or /// comments) as
+# a brief description. This used to be the default behavior. The new default is
+# to treat a multi-line C++ comment block as a detailed description. Set this
+# tag to YES if you prefer the old behavior instead.
+#
+# Note that setting this tag to YES also means that rational rose comments are
+# not recognized any more.
+# The default value is: NO.
+
+MULTILINE_CPP_IS_BRIEF = NO
+
+# If the INHERIT_DOCS tag is set to YES then an undocumented member inherits the
+# documentation from any documented member that it re-implements.
+# The default value is: YES.
+
+INHERIT_DOCS           = YES
+
+# If the SEPARATE_MEMBER_PAGES tag is set to YES then doxygen will produce a new
+# page for each member. If set to NO, the documentation of a member will be part
+# of the file/class/namespace that contains it.
+# The default value is: NO.
+
+SEPARATE_MEMBER_PAGES  = YES
+
+# The TAB_SIZE tag can be used to set the number of spaces in a tab. Doxygen
+# uses this value to replace tabs by spaces in code fragments.
+# Minimum value: 1, maximum value: 16, default value: 4.
+
+TAB_SIZE               = 8
+
+# This tag can be used to specify a number of aliases that act as commands in
+# the documentation. An alias has the form:
+# name=value
+# For example adding
+# "sideeffect=@par Side Effects:\n"
+# will allow you to put the command \sideeffect (or @sideeffect) in the
+# documentation, which will result in a user-defined paragraph with heading
+# "Side Effects:". You can put \n's in the value part of an alias to insert
+# newlines.
+
+ALIASES                = "rst=\verbatim embed:rst:leading-asterisk" \
+                         "endrst=\endverbatim" \
+                         "keepindent=\code" \
+                         "endkeepindent=\endcode"
+
+ALIASES += req{1}="\ref XEN_\1 \"XEN-\1\" "
+ALIASES += satisfy{1}="\xrefitem satisfy \"Satisfies requirement\" \"Requirement Implementation\" \1"
+ALIASES += verify{1}="\xrefitem verify \"Verifies requirement\" \"Requirement Verification\" \1"
+
+# Set the OPTIMIZE_OUTPUT_FOR_C tag to YES if your project consists of C sources
+# only. Doxygen will then generate output that is more tailored for C. For
+# instance, some of the names that are used will be different. The list of all
+# members will be omitted, etc.
+# The default value is: NO.
+
+OPTIMIZE_OUTPUT_FOR_C  = YES
+
+# Set the OPTIMIZE_OUTPUT_JAVA tag to YES if your project consists of Java or
+# Python sources only. Doxygen will then generate output that is more tailored
+# for that language. For instance, namespaces will be presented as packages,
+# qualified scopes will look different, etc.
+# The default value is: NO.
+
+OPTIMIZE_OUTPUT_JAVA   = NO
+
+# Set the OPTIMIZE_FOR_FORTRAN tag to YES if your project consists of Fortran
+# sources. Doxygen will then generate output that is tailored for Fortran.
+# The default value is: NO.
+
+OPTIMIZE_FOR_FORTRAN   = NO
+
+# Set the OPTIMIZE_OUTPUT_VHDL tag to YES if your project consists of VHDL
+# sources. Doxygen will then generate output that is tailored for VHDL.
+# The default value is: NO.
+
+OPTIMIZE_OUTPUT_VHDL   = NO
+
+# Doxygen selects the parser to use depending on the extension of the files it
+# parses. With this tag you can assign which parser to use for a given
+# extension. Doxygen has a built-in mapping, but you can override or extend it
+# using this tag. The format is ext=language, where ext is a file extension, and
+# language is one of the parsers supported by doxygen: IDL, Java, Javascript,
+# C#, C, C++, D, PHP, Objective-C, Python, Fortran (fixed format Fortran:
+# FortranFixed, free formatted Fortran: FortranFree, unknown formatted Fortran:
+# Fortran. In the later case the parser tries to guess whether the code is fixed
+# or free formatted code, this is the default for Fortran type files), VHDL. For
+# instance to make doxygen treat .inc files as Fortran files (default is PHP),
+# and .f files as C (default is Fortran), use: inc=Fortran f=C.
+#
+# Note: For files without extension you can use no_extension as a placeholder.
+#
+# Note that for custom extensions you also need to set FILE_PATTERNS otherwise
+# the files are not read by doxygen.
+
+EXTENSION_MAPPING      =
+
+# If the MARKDOWN_SUPPORT tag is enabled then doxygen pre-processes all comments
+# according to the Markdown format, which allows for more readable
+# documentation. See http://daringfireball.net/projects/markdown/ for details.
+# The output of markdown processing is further processed by doxygen, so you can
+# mix doxygen, HTML, and XML commands with Markdown formatting. Disable only in
+# case of backward compatibilities issues.
+# The default value is: YES.
+
+MARKDOWN_SUPPORT       = YES
+
+# When enabled doxygen tries to link words that correspond to documented
+# classes, or namespaces to their corresponding documentation. Such a link can
+# be prevented in individual cases by putting a % sign in front of the word or
+# globally by setting AUTOLINK_SUPPORT to NO.
+# The default value is: YES.
+
+AUTOLINK_SUPPORT       = YES
+
+# If you use STL classes (i.e. std::string, std::vector, etc.) but do not want
+# to include (a tag file for) the STL sources as input, then you should set this
+# tag to YES in order to let doxygen match functions declarations and
+# definitions whose arguments contain STL classes (e.g. func(std::string);
+# versus func(std::string) {}). This also make the inheritance and collaboration
+# diagrams that involve STL classes more complete and accurate.
+# The default value is: NO.
+
+BUILTIN_STL_SUPPORT    = NO
+
+# If you use Microsoft's C++/CLI language, you should set this option to YES to
+# enable parsing support.
+# The default value is: NO.
+
+CPP_CLI_SUPPORT        = YES
+
+# Set the SIP_SUPPORT tag to YES if your project consists of sip (see:
+# https://www.riverbankcomputing.com/software/sip/intro) sources only. Doxygen
+# will parse them like normal C++ but will assume all classes use public instead
+# of private inheritance when no explicit protection keyword is present.
+# The default value is: NO.
+
+SIP_SUPPORT            = NO
+
+# For Microsoft's IDL there are propget and propput attributes to indicate
+# getter and setter methods for a property. Setting this option to YES will make
+# doxygen to replace the get and set methods by a property in the documentation.
+# This will only work if the methods are indeed getting or setting a simple
+# type. If this is not the case, or you want to show the methods anyway, you
+# should set this option to NO.
+# The default value is: YES.
+
+IDL_PROPERTY_SUPPORT   = YES
+
+# If member grouping is used in the documentation and the DISTRIBUTE_GROUP_DOC
+# tag is set to YES then doxygen will reuse the documentation of the first
+# member in the group (if any) for the other members of the group. By default
+# all members of a group must be documented explicitly.
+# The default value is: NO.
+
+DISTRIBUTE_GROUP_DOC   = NO
+
+# Set the SUBGROUPING tag to YES to allow class member groups of the same type
+# (for instance a group of public functions) to be put as a subgroup of that
+# type (e.g. under the Public Functions section). Set it to NO to prevent
+# subgrouping. Alternatively, this can be done per class using the
+# \nosubgrouping command.
+# The default value is: YES.
+
+SUBGROUPING            = YES
+
+# When the INLINE_GROUPED_CLASSES tag is set to YES, classes, structs and unions
+# are shown inside the group in which they are included (e.g. using \ingroup)
+# instead of on a separate page (for HTML and Man pages) or section (for LaTeX
+# and RTF).
+#
+# Note that this feature does not work in combination with
+# SEPARATE_MEMBER_PAGES.
+# The default value is: NO.
+
+INLINE_GROUPED_CLASSES = NO
+
+# When the INLINE_SIMPLE_STRUCTS tag is set to YES, structs, classes, and unions
+# with only public data fields or simple typedef fields will be shown inline in
+# the documentation of the scope in which they are defined (i.e. file,
+# namespace, or group documentation), provided this scope is documented. If set
+# to NO, structs, classes, and unions are shown on a separate page (for HTML and
+# Man pages) or section (for LaTeX and RTF).
+# The default value is: NO.
+
+INLINE_SIMPLE_STRUCTS  = YES
+
+# When TYPEDEF_HIDES_STRUCT tag is enabled, a typedef of a struct, union, or
+# enum is documented as struct, union, or enum with the name of the typedef. So
+# typedef struct TypeS {} TypeT, will appear in the documentation as a struct
+# with name TypeT. When disabled the typedef will appear as a member of a file,
+# namespace, or class. And the struct will be named TypeS. This can typically be
+# useful for C code in case the coding convention dictates that all compound
+# types are typedef'ed and only the typedef is referenced, never the tag name.
+# The default value is: NO.
+
+TYPEDEF_HIDES_STRUCT   = NO
+
+# The size of the symbol lookup cache can be set using LOOKUP_CACHE_SIZE. This
+# cache is used to resolve symbols given their name and scope. Since this can be
+# an expensive process and often the same symbol appears multiple times in the
+# code, doxygen keeps a cache of pre-resolved symbols. If the cache is too small
+# doxygen will become slower. If the cache is too large, memory is wasted. The
+# cache size is given by this formula: 2^(16+LOOKUP_CACHE_SIZE). The valid range
+# is 0..9, the default is 0, corresponding to a cache size of 2^16=65536
+# symbols. At the end of a run doxygen will report the cache usage and suggest
+# the optimal cache size from a speed point of view.
+# Minimum value: 0, maximum value: 9, default value: 0.
+
+LOOKUP_CACHE_SIZE      = 9
+
+#---------------------------------------------------------------------------
+# Build related configuration options
+#---------------------------------------------------------------------------
+
+# If the EXTRACT_ALL tag is set to YES, doxygen will assume all entities in
+# documentation are documented, even if no documentation was available. Private
+# class members and static file members will be hidden unless the
+# EXTRACT_PRIVATE respectively EXTRACT_STATIC tags are set to YES.
+# Note: This will also disable the warnings about undocumented members that are
+# normally produced when WARNINGS is set to YES.
+# The default value is: NO.
+
+EXTRACT_ALL            = YES
+
+# If the EXTRACT_PRIVATE tag is set to YES, all private members of a class will
+# be included in the documentation.
+# The default value is: NO.
+
+EXTRACT_PRIVATE        = NO
+
+# If the EXTRACT_PACKAGE tag is set to YES, all members with package or internal
+# scope will be included in the documentation.
+# The default value is: NO.
+
+EXTRACT_PACKAGE        = YES
+
+# If the EXTRACT_STATIC tag is set to YES, all static members of a file will be
+# included in the documentation.
+# The default value is: NO.
+
+EXTRACT_STATIC         = YES
+
+# If the EXTRACT_LOCAL_CLASSES tag is set to YES, classes (and structs) defined
+# locally in source files will be included in the documentation. If set to NO,
+# only classes defined in header files are included. Does not have any effect
+# for Java sources.
+# The default value is: YES.
+
+EXTRACT_LOCAL_CLASSES  = YES
+
+# This flag is only useful for Objective-C code. If set to YES, local methods,
+# which are defined in the implementation section but not in the interface are
+# included in the documentation. If set to NO, only methods in the interface are
+# included.
+# The default value is: NO.
+
+EXTRACT_LOCAL_METHODS  = YES
+
+# If this flag is set to YES, the members of anonymous namespaces will be
+# extracted and appear in the documentation as a namespace called
+# 'anonymous_namespace{file}', where file will be replaced with the base name of
+# the file that contains the anonymous namespace. By default anonymous namespace
+# are hidden.
+# The default value is: NO.
+
+EXTRACT_ANON_NSPACES   = NO
+
+# If the HIDE_UNDOC_MEMBERS tag is set to YES, doxygen will hide all
+# undocumented members inside documented classes or files. If set to NO these
+# members will be included in the various overviews, but no documentation
+# section is generated. This option has no effect if EXTRACT_ALL is enabled.
+# The default value is: NO.
+
+HIDE_UNDOC_MEMBERS     = NO
+
+# If the HIDE_UNDOC_CLASSES tag is set to YES, doxygen will hide all
+# undocumented classes that are normally visible in the class hierarchy. If set
+# to NO, these classes will be included in the various overviews. This option
+# has no effect if EXTRACT_ALL is enabled.
+# The default value is: NO.
+
+HIDE_UNDOC_CLASSES     = NO
+
+# If the HIDE_FRIEND_COMPOUNDS tag is set to YES, doxygen will hide all friend
+# (class|struct|union) declarations. If set to NO, these declarations will be
+# included in the documentation.
+# The default value is: NO.
+
+HIDE_FRIEND_COMPOUNDS  = NO
+
+# If the HIDE_IN_BODY_DOCS tag is set to YES, doxygen will hide any
+# documentation blocks found inside the body of a function. If set to NO, these
+# blocks will be appended to the function's detailed documentation block.
+# The default value is: NO.
+
+HIDE_IN_BODY_DOCS      = NO
+
+# The INTERNAL_DOCS tag determines if documentation that is typed after a
+# \internal command is included. If the tag is set to NO then the documentation
+# will be excluded. Set it to YES to include the internal documentation.
+# The default value is: NO.
+
+INTERNAL_DOCS          = NO
+
+# If the CASE_SENSE_NAMES tag is set to NO then doxygen will only generate file
+# names in lower-case letters. If set to YES, upper-case letters are also
+# allowed. This is useful if you have classes or files whose names only differ
+# in case and if your file system supports case sensitive file names. Windows
+# and Mac users are advised to set this option to NO.
+# The default value is: system dependent.
+
+CASE_SENSE_NAMES       = YES
+
+# If the HIDE_SCOPE_NAMES tag is set to NO then doxygen will show members with
+# their full class and namespace scopes in the documentation. If set to YES, the
+# scope will be hidden.
+# The default value is: NO.
+
+HIDE_SCOPE_NAMES       = NO
+
+# If the SHOW_INCLUDE_FILES tag is set to YES then doxygen will put a list of
+# the files that are included by a file in the documentation of that file.
+# The default value is: YES.
+
+SHOW_INCLUDE_FILES     = YES
+
+# If the SHOW_GROUPED_MEMB_INC tag is set to YES then Doxygen will add for each
+# grouped member an include statement to the documentation, telling the reader
+# which file to include in order to use the member.
+# The default value is: NO.
+
+SHOW_GROUPED_MEMB_INC  = YES
+
+# If the FORCE_LOCAL_INCLUDES tag is set to YES then doxygen will list include
+# files with double quotes in the documentation rather than with sharp brackets.
+# The default value is: NO.
+
+FORCE_LOCAL_INCLUDES   = NO
+
+# If the INLINE_INFO tag is set to YES then a tag [inline] is inserted in the
+# documentation for inline members.
+# The default value is: YES.
+
+INLINE_INFO            = YES
+
+# If the SORT_MEMBER_DOCS tag is set to YES then doxygen will sort the
+# (detailed) documentation of file and class members alphabetically by member
+# name. If set to NO, the members will appear in declaration order.
+# The default value is: YES.
+
+SORT_MEMBER_DOCS       = YES
+
+# If the SORT_BRIEF_DOCS tag is set to YES then doxygen will sort the brief
+# descriptions of file, namespace and class members alphabetically by member
+# name. If set to NO, the members will appear in declaration order. Note that
+# this will also influence the order of the classes in the class list.
+# The default value is: NO.
+
+SORT_BRIEF_DOCS        = NO
+
+# If the SORT_MEMBERS_CTORS_1ST tag is set to YES then doxygen will sort the
+# (brief and detailed) documentation of class members so that constructors and
+# destructors are listed first. If set to NO the constructors will appear in the
+# respective orders defined by SORT_BRIEF_DOCS and SORT_MEMBER_DOCS.
+# Note: If SORT_BRIEF_DOCS is set to NO this option is ignored for sorting brief
+# member documentation.
+# Note: If SORT_MEMBER_DOCS is set to NO this option is ignored for sorting
+# detailed member documentation.
+# The default value is: NO.
+
+SORT_MEMBERS_CTORS_1ST = NO
+
+# If the SORT_GROUP_NAMES tag is set to YES then doxygen will sort the hierarchy
+# of group names into alphabetical order. If set to NO the group names will
+# appear in their defined order.
+# The default value is: NO.
+
+SORT_GROUP_NAMES       = YES
+
+# If the SORT_BY_SCOPE_NAME tag is set to YES, the class list will be sorted by
+# fully-qualified names, including namespaces. If set to NO, the class list will
+# be sorted only by class name, not including the namespace part.
+# Note: This option is not very useful if HIDE_SCOPE_NAMES is set to YES.
+# Note: This option applies only to the class list, not to the alphabetical
+# list.
+# The default value is: NO.
+
+SORT_BY_SCOPE_NAME     = YES
+
+# If the STRICT_PROTO_MATCHING option is enabled and doxygen fails to do proper
+# type resolution of all parameters of a function it will reject a match between
+# the prototype and the implementation of a member function even if there is
+# only one candidate or it is obvious which candidate to choose by doing a
+# simple string match. By disabling STRICT_PROTO_MATCHING doxygen will still
+# accept a match between prototype and implementation in such cases.
+# The default value is: NO.
+
+STRICT_PROTO_MATCHING  = YES
+
+# The GENERATE_TODOLIST tag can be used to enable (YES) or disable (NO) the todo
+# list. This list is created by putting \todo commands in the documentation.
+# The default value is: YES.
+
+GENERATE_TODOLIST      = NO
+
+# The GENERATE_TESTLIST tag can be used to enable (YES) or disable (NO) the test
+# list. This list is created by putting \test commands in the documentation.
+# The default value is: YES.
+
+GENERATE_TESTLIST      = NO
+
+# The GENERATE_BUGLIST tag can be used to enable (YES) or disable (NO) the bug
+# list. This list is created by putting \bug commands in the documentation.
+# The default value is: YES.
+
+GENERATE_BUGLIST       = NO
+
+# The GENERATE_DEPRECATEDLIST tag can be used to enable (YES) or disable (NO)
+# the deprecated list. This list is created by putting \deprecated commands in
+# the documentation.
+# The default value is: YES.
+
+GENERATE_DEPRECATEDLIST= YES
+
+# The ENABLED_SECTIONS tag can be used to enable conditional documentation
+# sections, marked by \if <section_label> ... \endif and \cond <section_label>
+# ... \endcond blocks.
+
+ENABLED_SECTIONS       = YES
+
+# The MAX_INITIALIZER_LINES tag determines the maximum number of lines that the
+# initial value of a variable or macro / define can have for it to appear in the
+# documentation. If the initializer consists of more lines than specified here
+# it will be hidden. Use a value of 0 to hide initializers completely. The
+# appearance of the value of individual variables and macros / defines can be
+# controlled using \showinitializer or \hideinitializer command in the
+# documentation regardless of this setting.
+# Minimum value: 0, maximum value: 10000, default value: 30.
+
+MAX_INITIALIZER_LINES  = 300
+
+# Set the SHOW_USED_FILES tag to NO to disable the list of files generated at
+# the bottom of the documentation of classes and structs. If set to YES, the
+# list will mention the files that were used to generate the documentation.
+# The default value is: YES.
+
+SHOW_USED_FILES        = YES
+
+# Set the SHOW_FILES tag to NO to disable the generation of the Files page. This
+# will remove the Files entry from the Quick Index and from the Folder Tree View
+# (if specified).
+# The default value is: YES.
+
+SHOW_FILES             = YES
+
+# Set the SHOW_NAMESPACES tag to NO to disable the generation of the Namespaces
+# page. This will remove the Namespaces entry from the Quick Index and from the
+# Folder Tree View (if specified).
+# The default value is: YES.
+
+SHOW_NAMESPACES        = YES
+
+# The FILE_VERSION_FILTER tag can be used to specify a program or script that
+# doxygen should invoke to get the current version for each file (typically from
+# the version control system). Doxygen will invoke the program by executing (via
+# popen()) the command command input-file, where command is the value of the
+# FILE_VERSION_FILTER tag, and input-file is the name of an input file provided
+# by doxygen. Whatever the program writes to standard output is used as the file
+# version. For an example see the documentation.
+
+FILE_VERSION_FILTER    =
+
+# The LAYOUT_FILE tag can be used to specify a layout file which will be parsed
+# by doxygen. The layout file controls the global structure of the generated
+# output files in an output format independent way. To create the layout file
+# that represents doxygen's defaults, run doxygen with the -l option. You can
+# optionally specify a file name after the option, if omitted DoxygenLayout.xml
+# will be used as the name of the layout file.
+#
+# Note that if you run doxygen from a directory containing a file called
+# DoxygenLayout.xml, doxygen will parse it automatically even if the LAYOUT_FILE
+# tag is left empty.
+
+LAYOUT_FILE            =
+
+# The CITE_BIB_FILES tag can be used to specify one or more bib files containing
+# the reference definitions. This must be a list of .bib files. The .bib
+# extension is automatically appended if omitted. This requires the bibtex tool
+# to be installed. See also https://en.wikipedia.org/wiki/BibTeX for more info.
+# For LaTeX the style of the bibliography can be controlled using
+# LATEX_BIB_STYLE. To use this feature you need bibtex and perl available in the
+# search path. See also \cite for info how to create references.
+
+CITE_BIB_FILES         =
+
+#---------------------------------------------------------------------------
+# Configuration options related to warning and progress messages
+#---------------------------------------------------------------------------
+
+# The QUIET tag can be used to turn on/off the messages that are generated to
+# standard output by doxygen. If QUIET is set to YES this implies that the
+# messages are off.
+# The default value is: NO.
+
+QUIET                  = YES
+
+# The WARNINGS tag can be used to turn on/off the warning messages that are
+# generated to standard error (stderr) by doxygen. If WARNINGS is set to YES
+# this implies that the warnings are on.
+#
+# Tip: Turn warnings on while writing the documentation.
+# The default value is: YES.
+
+WARNINGS               = YES
+
+# If the WARN_IF_UNDOCUMENTED tag is set to YES then doxygen will generate
+# warnings for undocumented members. If EXTRACT_ALL is set to YES then this flag
+# will automatically be disabled.
+# The default value is: YES.
+
+WARN_IF_UNDOCUMENTED   = YES
+
+# If the WARN_IF_DOC_ERROR tag is set to YES, doxygen will generate warnings for
+# potential errors in the documentation, such as not documenting some parameters
+# in a documented function, or documenting parameters that don't exist or using
+# markup commands wrongly.
+# The default value is: YES.
+
+WARN_IF_DOC_ERROR      = YES
+
+# This WARN_NO_PARAMDOC option can be enabled to get warnings for functions that
+# are documented, but have no documentation for their parameters or return
+# value. If set to NO, doxygen will only warn about wrong or incomplete
+# parameter documentation, but not about the absence of documentation.
+# The default value is: NO.
+
+WARN_NO_PARAMDOC       = NO
+
+# The WARN_FORMAT tag determines the format of the warning messages that doxygen
+# can produce. The string should contain the $file, $line, and $text tags, which
+# will be replaced by the file and line number from which the warning originated
+# and the warning text. Optionally the format may contain $version, which will
+# be replaced by the version of the file (if it could be obtained via
+# FILE_VERSION_FILTER)
+# The default value is: $file:$line: $text.
+
+WARN_FORMAT            = "$file:$line: $text"
+
+# The WARN_LOGFILE tag can be used to specify a file to which warning and error
+# messages should be written. If left blank the output is written to standard
+# error (stderr).
+
+WARN_LOGFILE           =
+
+#---------------------------------------------------------------------------
+# Configuration options related to the input files
+#---------------------------------------------------------------------------
+
+# The INPUT tag is used to specify the files and/or directories that contain
+# documented source files. You may enter file names like myfile.cpp or
+# directories like /usr/src/myproject. Separate the files or directories with
+# spaces. See also FILE_PATTERNS and EXTENSION_MAPPING
+# Note: If this tag is empty the current directory is searched.
+
+INPUT                  = "@XEN_BASE@/docs/xen-doxygen/mainpage.md"
+
+# This tag can be used to specify the character encoding of the source files
+# that doxygen parses. Internally doxygen uses the UTF-8 encoding. Doxygen uses
+# libiconv (or the iconv built into libc) for the transcoding. See the libiconv
+# documentation (see: https://www.gnu.org/software/libiconv/) for the list of
+# possible encodings.
+# The default value is: UTF-8.
+
+INPUT_ENCODING         = UTF-8
+
+# If the value of the INPUT tag contains directories, you can use the
+# FILE_PATTERNS tag to specify one or more wildcard patterns (like *.cpp and
+# *.h) to filter out the source-files in the directories.
+#
+# Note that for custom extensions or not directly supported extensions you also
+# need to set EXTENSION_MAPPING for the extension otherwise the files are not
+# read by doxygen.
+#
+# If left blank the following patterns are tested:*.c, *.cc, *.cxx, *.cpp,
+# *.c++, *.java, *.ii, *.ixx, *.ipp, *.i++, *.inl, *.idl, *.ddl, *.odl, *.h,
+# *.hh, *.hxx, *.hpp, *.h++, *.cs, *.d, *.php, *.php4, *.php5, *.phtml, *.inc,
+# *.m, *.markdown, *.md, *.mm, *.dox, *.py, *.pyw, *.f90, *.f95, *.f03, *.f08,
+# *.f, *.for, *.tcl, *.vhd, *.vhdl, *.ucf and *.qsf.
+
+# This MUST be kept in sync with DOXY_SOURCES in doc/CMakeLists.txt
+# for incremental (and faster) builds to work correctly.
+FILE_PATTERNS          = "*.c" \
+                         "*.h" \
+                         "*.S" \
+                         "*.md"
+
+# The RECURSIVE tag can be used to specify whether or not subdirectories should
+# be searched for input files as well.
+# The default value is: NO.
+
+RECURSIVE              = YES
+
+# The EXCLUDE tag can be used to specify files and/or directories that should be
+# excluded from the INPUT source files. This way you can easily exclude a
+# subdirectory from a directory tree whose root is specified with the INPUT tag.
+#
+# Note that relative paths are relative to the directory from which doxygen is
+# run.
+
+EXCLUDE                = @XEN_BASE@/include/nothing.h
+
+# The EXCLUDE_SYMLINKS tag can be used to select whether or not files or
+# directories that are symbolic links (a Unix file system feature) are excluded
+# from the input.
+# The default value is: NO.
+
+EXCLUDE_SYMLINKS       = NO
+
+# If the value of the INPUT tag contains directories, you can use the
+# EXCLUDE_PATTERNS tag to specify one or more wildcard patterns to exclude
+# certain files from those directories.
+#
+# Note that the wildcards are matched against the file with absolute path, so to
+# exclude all test directories for example use the pattern */test/*
+
+EXCLUDE_PATTERNS       =
+
+# The EXCLUDE_SYMBOLS tag can be used to specify one or more symbol names
+# (namespaces, classes, functions, etc.) that should be excluded from the
+# output. The symbol name can be a fully qualified name, a word, or if the
+# wildcard * is used, a substring. Examples: ANamespace, AClass,
+# AClass::ANamespace, ANamespace::*Test
+#
+# Note that the wildcards are matched against the file with absolute path, so to
+# exclude all test directories use the pattern */test/*
+
+# Hide internal names (starting with an underscore, and doxygen-generated names
+# for nested unnamed unions that don't generate meaningful sphinx output anyway.
+EXCLUDE_SYMBOLS        =
+# _*  *.__unnamed__ z_* Z_*
+
+# The EXAMPLE_PATH tag can be used to specify one or more files or directories
+# that contain example code fragments that are included (see the \include
+# command).
+
+EXAMPLE_PATH           =
+
+# If the value of the EXAMPLE_PATH tag contains directories, you can use the
+# EXAMPLE_PATTERNS tag to specify one or more wildcard pattern (like *.cpp and
+# *.h) to filter out the source-files in the directories. If left blank all
+# files are included.
+
+EXAMPLE_PATTERNS       =
+
+# If the EXAMPLE_RECURSIVE tag is set to YES then subdirectories will be
+# searched for input files to be used with the \include or \dontinclude commands
+# irrespective of the value of the RECURSIVE tag.
+# The default value is: NO.
+
+EXAMPLE_RECURSIVE      = YES
+
+# The IMAGE_PATH tag can be used to specify one or more files or directories
+# that contain images that are to be included in the documentation (see the
+# \image command).
+
+IMAGE_PATH             =
+
+# The INPUT_FILTER tag can be used to specify a program that doxygen should
+# invoke to filter for each input file. Doxygen will invoke the filter program
+# by executing (via popen()) the command:
+#
+# <filter> <input-file>
+#
+# where <filter> is the value of the INPUT_FILTER tag, and <input-file> is the
+# name of an input file. Doxygen will then use the output that the filter
+# program writes to standard output. If FILTER_PATTERNS is specified, this tag
+# will be ignored.
+#
+# Note that the filter must not add or remove lines; it is applied before the
+# code is scanned, but not when the output code is generated. If lines are added
+# or removed, the anchors will not be placed correctly.
+#
+# Note that for custom extensions or not directly supported extensions you also
+# need to set EXTENSION_MAPPING for the extension otherwise the files are not
+# properly processed by doxygen.
+
+INPUT_FILTER           =
+
+# The FILTER_PATTERNS tag can be used to specify filters on a per file pattern
+# basis. Doxygen will compare the file name with each pattern and apply the
+# filter if there is a match. The filters are a list of the form: pattern=filter
+# (like *.cpp=my_cpp_filter). See INPUT_FILTER for further information on how
+# filters are used. If the FILTER_PATTERNS tag is empty or if none of the
+# patterns match the file name, INPUT_FILTER is applied.
+#
+# Note that for custom extensions or not directly supported extensions you also
+# need to set EXTENSION_MAPPING for the extension otherwise the files are not
+# properly processed by doxygen.
+
+FILTER_PATTERNS     = *.h="\"@XEN_BASE@/docs/xen-doxygen/doxy-preprocessor.py\""
+
+# If the FILTER_SOURCE_FILES tag is set to YES, the input filter (if set using
+# INPUT_FILTER) will also be used to filter the input files that are used for
+# producing the source files to browse (i.e. when SOURCE_BROWSER is set to YES).
+# The default value is: NO.
+
+FILTER_SOURCE_FILES    = NO
+
+# The FILTER_SOURCE_PATTERNS tag can be used to specify source filters per file
+# pattern. A pattern will override the setting for FILTER_PATTERN (if any) and
+# it is also possible to disable source filtering for a specific pattern using
+# *.ext= (so without naming a filter).
+# This tag requires that the tag FILTER_SOURCE_FILES is set to YES.
+
+FILTER_SOURCE_PATTERNS =
+
+# If the USE_MDFILE_AS_MAINPAGE tag refers to the name of a markdown file that
+# is part of the input, its contents will be placed on the main page
+# (index.html). This can be useful if you have a project on for instance GitHub
+# and want to reuse the introduction page also for the doxygen output.
+
+USE_MDFILE_AS_MAINPAGE = "mainpage.md"
+
+#---------------------------------------------------------------------------
+# Configuration options related to source browsing
+#---------------------------------------------------------------------------
+
+# If the SOURCE_BROWSER tag is set to YES then a list of source files will be
+# generated. Documented entities will be cross-referenced with these sources.
+#
+# Note: To get rid of all source code in the generated output, make sure that
+# also VERBATIM_HEADERS is set to NO.
+# The default value is: NO.
+
+SOURCE_BROWSER         = NO
+
+# Setting the INLINE_SOURCES tag to YES will include the body of functions,
+# classes and enums directly into the documentation.
+# The default value is: NO.
+
+INLINE_SOURCES         = NO
+
+# Setting the STRIP_CODE_COMMENTS tag to YES will instruct doxygen to hide any
+# special comment blocks from generated source code fragments. Normal C, C++ and
+# Fortran comments will always remain visible.
+# The default value is: YES.
+
+STRIP_CODE_COMMENTS    = YES
+
+# If the REFERENCED_BY_RELATION tag is set to YES then for each documented
+# function all documented functions referencing it will be listed.
+# The default value is: NO.
+
+REFERENCED_BY_RELATION = NO
+
+# If the REFERENCES_RELATION tag is set to YES then for each documented function
+# all documented entities called/used by that function will be listed.
+# The default value is: NO.
+
+REFERENCES_RELATION    = NO
+
+# If the REFERENCES_LINK_SOURCE tag is set to YES and SOURCE_BROWSER tag is set
+# to YES then the hyperlinks from functions in REFERENCES_RELATION and
+# REFERENCED_BY_RELATION lists will link to the source code. Otherwise they will
+# link to the documentation.
+# The default value is: YES.
+
+REFERENCES_LINK_SOURCE = YES
+
+# If SOURCE_TOOLTIPS is enabled (the default) then hovering a hyperlink in the
+# source code will show a tooltip with additional information such as prototype,
+# brief description and links to the definition and documentation. Since this
+# will make the HTML file larger and loading of large files a bit slower, you
+# can opt to disable this feature.
+# The default value is: YES.
+# This tag requires that the tag SOURCE_BROWSER is set to YES.
+
+SOURCE_TOOLTIPS        = YES
+
+# If the USE_HTAGS tag is set to YES then the references to source code will
+# point to the HTML generated by the htags(1) tool instead of doxygen built-in
+# source browser. The htags tool is part of GNU's global source tagging system
+# (see https://www.gnu.org/software/global/global.html). You will need version
+# 4.8.6 or higher.
+#
+# To use it do the following:
+# - Install the latest version of global
+# - Enable SOURCE_BROWSER and USE_HTAGS in the config file
+# - Make sure the INPUT points to the root of the source tree
+# - Run doxygen as normal
+#
+# Doxygen will invoke htags (and that will in turn invoke gtags), so these
+# tools must be available from the command line (i.e. in the search path).
+#
+# The result: instead of the source browser generated by doxygen, the links to
+# source code will now point to the output of htags.
+# The default value is: NO.
+# This tag requires that the tag SOURCE_BROWSER is set to YES.
+
+USE_HTAGS              = NO
+
+# If the VERBATIM_HEADERS tag is set the YES then doxygen will generate a
+# verbatim copy of the header file for each class for which an include is
+# specified. Set to NO to disable this.
+# See also: Section \class.
+# The default value is: YES.
+
+VERBATIM_HEADERS       = YES
+
+#---------------------------------------------------------------------------
+# Configuration options related to the alphabetical class index
+#---------------------------------------------------------------------------
+
+# If the ALPHABETICAL_INDEX tag is set to YES, an alphabetical index of all
+# compounds will be generated. Enable this if the project contains a lot of
+# classes, structs, unions or interfaces.
+# The default value is: YES.
+
+ALPHABETICAL_INDEX     = YES
+
+# The COLS_IN_ALPHA_INDEX tag can be used to specify the number of columns in
+# which the alphabetical index list will be split.
+# Minimum value: 1, maximum value: 20, default value: 5.
+# This tag requires that the tag ALPHABETICAL_INDEX is set to YES.
+
+COLS_IN_ALPHA_INDEX    = 2
+
+# In case all classes in a project start with a common prefix, all classes will
+# be put under the same header in the alphabetical index. The IGNORE_PREFIX tag
+# can be used to specify a prefix (or a list of prefixes) that should be ignored
+# while generating the index headers.
+# This tag requires that the tag ALPHABETICAL_INDEX is set to YES.
+
+IGNORE_PREFIX          =
+
+#---------------------------------------------------------------------------
+# Configuration options related to the HTML output
+#---------------------------------------------------------------------------
+
+# If the GENERATE_HTML tag is set to YES, doxygen will generate HTML output
+# The default value is: YES.
+
+GENERATE_HTML          = YES
+
+# The HTML_OUTPUT tag is used to specify where the HTML docs will be put. If a
+# relative path is entered the value of OUTPUT_DIRECTORY will be put in front of
+# it.
+# The default directory is: html.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+HTML_OUTPUT            = html
+
+# The HTML_FILE_EXTENSION tag can be used to specify the file extension for each
+# generated HTML page (for example: .htm, .php, .asp).
+# The default value is: .html.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+HTML_FILE_EXTENSION    = .html
+
+# The HTML_HEADER tag can be used to specify a user-defined HTML header file for
+# each generated HTML page. If the tag is left blank doxygen will generate a
+# standard header.
+#
+# To get valid HTML the header file that includes any scripts and style sheets
+# that doxygen needs, which is dependent on the configuration options used (e.g.
+# the setting GENERATE_TREEVIEW). It is highly recommended to start with a
+# default header using
+# doxygen -w html new_header.html new_footer.html new_stylesheet.css
+# YourConfigFile
+# and then modify the file new_header.html. See also section "Doxygen usage"
+# for information on how to generate the default header that doxygen normally
+# uses.
+# Note: The header is subject to change so you typically have to regenerate the
+# default header when upgrading to a newer version of doxygen. For a description
+# of the possible markers and block names see the documentation.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+HTML_HEADER            = xen-doxygen/header.html
+
+# The HTML_FOOTER tag can be used to specify a user-defined HTML footer for each
+# generated HTML page. If the tag is left blank doxygen will generate a standard
+# footer. See HTML_HEADER for more information on how to generate a default
+# footer and what special commands can be used inside the footer. See also
+# section "Doxygen usage" for information on how to generate the default footer
+# that doxygen normally uses.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+HTML_FOOTER            =
+
+# The HTML_STYLESHEET tag can be used to specify a user-defined cascading style
+# sheet that is used by each HTML page. It can be used to fine-tune the look of
+# the HTML output. If left blank doxygen will generate a default style sheet.
+# See also section "Doxygen usage" for information on how to generate the style
+# sheet that doxygen normally uses.
+# Note: It is recommended to use HTML_EXTRA_STYLESHEET instead of this tag, as
+# it is more robust and this tag (HTML_STYLESHEET) will in the future become
+# obsolete.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+HTML_STYLESHEET        =
+
+# The HTML_EXTRA_STYLESHEET tag can be used to specify additional user-defined
+# cascading style sheets that are included after the standard style sheets
+# created by doxygen. Using this option one can overrule certain style aspects.
+# This is preferred over using HTML_STYLESHEET since it does not replace the
+# standard style sheet and is therefore more robust against future updates.
+# Doxygen will copy the style sheet files to the output directory.
+# Note: The order of the extra style sheet files is of importance (e.g. the last
+# style sheet in the list overrules the setting of the previous ones in the
+# list). For an example see the documentation.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+HTML_EXTRA_STYLESHEET  = xen-doxygen/customdoxygen.css
+
+# The HTML_EXTRA_FILES tag can be used to specify one or more extra images or
+# other source files which should be copied to the HTML output directory. Note
+# that these files will be copied to the base HTML output directory. Use the
+# $relpath^ marker in the HTML_HEADER and/or HTML_FOOTER files to load these
+# files. In the HTML_STYLESHEET file, use the file name only. Also note that the
+# files will be copied as-is; there are no commands or markers available.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+HTML_EXTRA_FILES       =
+
+# The HTML_COLORSTYLE_HUE tag controls the color of the HTML output. Doxygen
+# will adjust the colors in the style sheet and background images according to
+# this color. Hue is specified as an angle on a colorwheel, see
+# https://en.wikipedia.org/wiki/Hue for more information. For instance the value
+# 0 represents red, 60 is yellow, 120 is green, 180 is cyan, 240 is blue, 300
+# purple, and 360 is red again.
+# Minimum value: 0, maximum value: 359, default value: 220.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+HTML_COLORSTYLE_HUE    =
+
+# The HTML_COLORSTYLE_SAT tag controls the purity (or saturation) of the colors
+# in the HTML output. For a value of 0 the output will use grayscales only. A
+# value of 255 will produce the most vivid colors.
+# Minimum value: 0, maximum value: 255, default value: 100.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+HTML_COLORSTYLE_SAT    =
+
+# The HTML_COLORSTYLE_GAMMA tag controls the gamma correction applied to the
+# luminance component of the colors in the HTML output. Values below 100
+# gradually make the output lighter, whereas values above 100 make the output
+# darker. The value divided by 100 is the actual gamma applied, so 80 represents
+# a gamma of 0.8, The value 220 represents a gamma of 2.2, and 100 does not
+# change the gamma.
+# Minimum value: 40, maximum value: 240, default value: 80.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+HTML_COLORSTYLE_GAMMA  =
+
+# If the HTML_TIMESTAMP tag is set to YES then the footer of each generated HTML
+# page will contain the date and time when the page was generated. Setting this
+# to YES can help to show when doxygen was last run and thus if the
+# documentation is up to date.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+HTML_TIMESTAMP         = YES
+
+# If the HTML_DYNAMIC_SECTIONS tag is set to YES then the generated HTML
+# documentation will contain sections that can be hidden and shown after the
+# page has loaded.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+HTML_DYNAMIC_SECTIONS  = YES
+
+# With HTML_INDEX_NUM_ENTRIES one can control the preferred number of entries
+# shown in the various tree structured indices initially; the user can expand
+# and collapse entries dynamically later on. Doxygen will expand the tree to
+# such a level that at most the specified number of entries are visible (unless
+# a fully collapsed tree already exceeds this amount). So setting the number of
+# entries 1 will produce a full collapsed tree by default. 0 is a special value
+# representing an infinite number of entries and will result in a full expanded
+# tree by default.
+# Minimum value: 0, maximum value: 9999, default value: 100.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+HTML_INDEX_NUM_ENTRIES = 100
+
+# If the GENERATE_DOCSET tag is set to YES, additional index files will be
+# generated that can be used as input for Apple's Xcode 3 integrated development
+# environment (see: https://developer.apple.com/tools/xcode/), introduced with
+# OSX 10.5 (Leopard). To create a documentation set, doxygen will generate a
+# Makefile in the HTML output directory. Running make will produce the docset in
+# that directory and running make install will install the docset in
+# ~/Library/Developer/Shared/Documentation/DocSets so that Xcode will find it at
+# startup. See https://developer.apple.com/tools/creatingdocsetswithdoxygen.html
+# for more information.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+GENERATE_DOCSET        = YES
+
+# This tag determines the name of the docset feed. A documentation feed provides
+# an umbrella under which multiple documentation sets from a single provider
+# (such as a company or product suite) can be grouped.
+# The default value is: Doxygen generated docs.
+# This tag requires that the tag GENERATE_DOCSET is set to YES.
+
+DOCSET_FEEDNAME        = "Doxygen generated docs"
+
+# This tag specifies a string that should uniquely identify the documentation
+# set bundle. This should be a reverse domain-name style string, e.g.
+# com.mycompany.MyDocSet. Doxygen will append .docset to the name.
+# The default value is: org.doxygen.Project.
+# This tag requires that the tag GENERATE_DOCSET is set to YES.
+
+DOCSET_BUNDLE_ID       = org.doxygen.Project
+
+# The DOCSET_PUBLISHER_ID tag specifies a string that should uniquely identify
+# the documentation publisher. This should be a reverse domain-name style
+# string, e.g. com.mycompany.MyDocSet.documentation.
+# The default value is: org.doxygen.Publisher.
+# This tag requires that the tag GENERATE_DOCSET is set to YES.
+
+DOCSET_PUBLISHER_ID    = org.doxygen.Publisher
+
+# The DOCSET_PUBLISHER_NAME tag identifies the documentation publisher.
+# The default value is: Publisher.
+# This tag requires that the tag GENERATE_DOCSET is set to YES.
+
+DOCSET_PUBLISHER_NAME  = Publisher
+
+# If the GENERATE_HTMLHELP tag is set to YES then doxygen generates three
+# additional HTML index files: index.hhp, index.hhc, and index.hhk. The
+# index.hhp is a project file that can be read by Microsoft's HTML Help Workshop
+# (see: http://www.microsoft.com/en-us/download/details.aspx?id=21138) on
+# Windows.
+#
+# The HTML Help Workshop contains a compiler that can convert all HTML output
+# generated by doxygen into a single compiled HTML file (.chm). Compiled HTML
+# files are now used as the Windows 98 help format, and will replace the old
+# Windows help format (.hlp) on all Windows platforms in the future. Compressed
+# HTML files also contain an index, a table of contents, and you can search for
+# words in the documentation. The HTML workshop also contains a viewer for
+# compressed HTML files.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+GENERATE_HTMLHELP      = NO
+
+# The CHM_FILE tag can be used to specify the file name of the resulting .chm
+# file. You can add a path in front of the file if the result should not be
+# written to the html output directory.
+# This tag requires that the tag GENERATE_HTMLHELP is set to YES.
+
+CHM_FILE               = NO
+
+# The HHC_LOCATION tag can be used to specify the location (absolute path
+# including file name) of the HTML help compiler (hhc.exe). If non-empty,
+# doxygen will try to run the HTML help compiler on the generated index.hhp.
+# The file has to be specified with full path.
+# This tag requires that the tag GENERATE_HTMLHELP is set to YES.
+
+HHC_LOCATION           =
+
+# The GENERATE_CHI flag controls if a separate .chi index file is generated
+# (YES) or that it should be included in the master .chm file (NO).
+# The default value is: NO.
+# This tag requires that the tag GENERATE_HTMLHELP is set to YES.
+
+GENERATE_CHI           = NO
+
+# The CHM_INDEX_ENCODING is used to encode HtmlHelp index (hhk), content (hhc)
+# and project file content.
+# This tag requires that the tag GENERATE_HTMLHELP is set to YES.
+
+CHM_INDEX_ENCODING     =
+
+# The BINARY_TOC flag controls whether a binary table of contents is generated
+# (YES) or a normal table of contents (NO) in the .chm file. Furthermore it
+# enables the Previous and Next buttons.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_HTMLHELP is set to YES.
+
+BINARY_TOC             = YES
+
+# The TOC_EXPAND flag can be set to YES to add extra items for group members to
+# the table of contents of the HTML help documentation and to the tree view.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_HTMLHELP is set to YES.
+
+TOC_EXPAND             = NO
+
+# If the GENERATE_QHP tag is set to YES and both QHP_NAMESPACE and
+# QHP_VIRTUAL_FOLDER are set, an additional index file will be generated that
+# can be used as input for Qt's qhelpgenerator to generate a Qt Compressed Help
+# (.qch) of the generated HTML documentation.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+GENERATE_QHP           = NO
+
+# If the QHG_LOCATION tag is specified, the QCH_FILE tag can be used to specify
+# the file name of the resulting .qch file. The path specified is relative to
+# the HTML output folder.
+# This tag requires that the tag GENERATE_QHP is set to YES.
+
+QCH_FILE               =
+
+# The QHP_NAMESPACE tag specifies the namespace to use when generating Qt Help
+# Project output. For more information please see Qt Help Project / Namespace
+# (see: http://doc.qt.io/qt-4.8/qthelpproject.html#namespace).
+# The default value is: org.doxygen.Project.
+# This tag requires that the tag GENERATE_QHP is set to YES.
+
+QHP_NAMESPACE          = org.doxygen.Project
+
+# The QHP_VIRTUAL_FOLDER tag specifies the namespace to use when generating Qt
+# Help Project output. For more information please see Qt Help Project / Virtual
+# Folders (see: http://doc.qt.io/qt-4.8/qthelpproject.html#virtual-folders).
+# The default value is: doc.
+# This tag requires that the tag GENERATE_QHP is set to YES.
+
+QHP_VIRTUAL_FOLDER     = doc
+
+# If the QHP_CUST_FILTER_NAME tag is set, it specifies the name of a custom
+# filter to add. For more information please see Qt Help Project / Custom
+# Filters (see: http://doc.qt.io/qt-4.8/qthelpproject.html#custom-filters).
+# This tag requires that the tag GENERATE_QHP is set to YES.
+
+QHP_CUST_FILTER_NAME   =
+
+# The QHP_CUST_FILTER_ATTRS tag specifies the list of the attributes of the
+# custom filter to add. For more information please see Qt Help Project / Custom
+# Filters (see: http://doc.qt.io/qt-4.8/qthelpproject.html#custom-filters).
+# This tag requires that the tag GENERATE_QHP is set to YES.
+
+QHP_CUST_FILTER_ATTRS  =
+
+# The QHP_SECT_FILTER_ATTRS tag specifies the list of the attributes this
+# project's filter section matches. Qt Help Project / Filter Attributes (see:
+# http://doc.qt.io/qt-4.8/qthelpproject.html#filter-attributes).
+# This tag requires that the tag GENERATE_QHP is set to YES.
+
+QHP_SECT_FILTER_ATTRS  =
+
+# The QHG_LOCATION tag can be used to specify the location of Qt's
+# qhelpgenerator. If non-empty doxygen will try to run qhelpgenerator on the
+# generated .qhp file.
+# This tag requires that the tag GENERATE_QHP is set to YES.
+
+QHG_LOCATION           =
+
+# If the GENERATE_ECLIPSEHELP tag is set to YES, additional index files will be
+# generated, together with the HTML files, they form an Eclipse help plugin. To
+# install this plugin and make it available under the help contents menu in
+# Eclipse, the contents of the directory containing the HTML and XML files needs
+# to be copied into the plugins directory of eclipse. The name of the directory
+# within the plugins directory should be the same as the ECLIPSE_DOC_ID value.
+# After copying Eclipse needs to be restarted before the help appears.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+GENERATE_ECLIPSEHELP   = NO
+
+# A unique identifier for the Eclipse help plugin. When installing the plugin
+# the directory name containing the HTML and XML files should also have this
+# name. Each documentation set should have its own identifier.
+# The default value is: org.doxygen.Project.
+# This tag requires that the tag GENERATE_ECLIPSEHELP is set to YES.
+
+ECLIPSE_DOC_ID         = org.doxygen.Project
+
+# If you want full control over the layout of the generated HTML pages it might
+# be necessary to disable the index and replace it with your own. The
+# DISABLE_INDEX tag can be used to turn on/off the condensed index (tabs) at top
+# of each HTML page. A value of NO enables the index and the value YES disables
+# it. Since the tabs in the index contain the same information as the navigation
+# tree, you can set this option to YES if you also set GENERATE_TREEVIEW to YES.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+DISABLE_INDEX          = NO
+
+# The GENERATE_TREEVIEW tag is used to specify whether a tree-like index
+# structure should be generated to display hierarchical information. If the tag
+# value is set to YES, a side panel will be generated containing a tree-like
+# index structure (just like the one that is generated for HTML Help). For this
+# to work a browser that supports JavaScript, DHTML, CSS and frames is required
+# (i.e. any modern browser). Windows users are probably better off using the
+# HTML help feature. Via custom style sheets (see HTML_EXTRA_STYLESHEET) one can
+# further fine-tune the look of the index. As an example, the default style
+# sheet generated by doxygen has an example that shows how to put an image at
+# the root of the tree instead of the PROJECT_NAME. Since the tree basically has
+# the same information as the tab index, you could consider setting
+# DISABLE_INDEX to YES when enabling this option.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+GENERATE_TREEVIEW      = YES
+
+# The ENUM_VALUES_PER_LINE tag can be used to set the number of enum values that
+# doxygen will group on one line in the generated HTML documentation.
+#
+# Note that a value of 0 will completely suppress the enum values from appearing
+# in the overview section.
+# Minimum value: 0, maximum value: 20, default value: 4.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+ENUM_VALUES_PER_LINE   = 4
+
+# If the treeview is enabled (see GENERATE_TREEVIEW) then this tag can be used
+# to set the initial width (in pixels) of the frame in which the tree is shown.
+# Minimum value: 0, maximum value: 1500, default value: 250.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+TREEVIEW_WIDTH         = 250
+
+# If the EXT_LINKS_IN_WINDOW option is set to YES, doxygen will open links to
+# external symbols imported via tag files in a separate window.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+EXT_LINKS_IN_WINDOW    = NO
+
+# Use this tag to change the font size of LaTeX formulas included as images in
+# the HTML documentation. When you change the font size after a successful
+# doxygen run you need to manually remove any form_*.png images from the HTML
+# output directory to force them to be regenerated.
+# Minimum value: 8, maximum value: 50, default value: 10.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+FORMULA_FONTSIZE       = 10
+
+# Use the FORMULA_TRANPARENT tag to determine whether or not the images
+# generated for formulas are transparent PNGs. Transparent PNGs are not
+# supported properly for IE 6.0, but are supported on all modern browsers.
+#
+# Note that when changing this option you need to delete any form_*.png files in
+# the HTML output directory before the changes have effect.
+# The default value is: YES.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+FORMULA_TRANSPARENT    = YES
+
+# Enable the USE_MATHJAX option to render LaTeX formulas using MathJax (see
+# https://www.mathjax.org) which uses client side Javascript for the rendering
+# instead of using pre-rendered bitmaps. Use this if you do not have LaTeX
+# installed or if you want to formulas look prettier in the HTML output. When
+# enabled you may also need to install MathJax separately and configure the path
+# to it using the MATHJAX_RELPATH option.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+USE_MATHJAX            = NO
+
+# When MathJax is enabled you can set the default output format to be used for
+# the MathJax output. See the MathJax site (see:
+# http://docs.mathjax.org/en/latest/output.html) for more details.
+# Possible values are: HTML-CSS (which is slower, but has the best
+# compatibility), NativeMML (i.e. MathML) and SVG.
+# The default value is: HTML-CSS.
+# This tag requires that the tag USE_MATHJAX is set to YES.
+
+MATHJAX_FORMAT         = HTML-CSS
+
+# When MathJax is enabled you need to specify the location relative to the HTML
+# output directory using the MATHJAX_RELPATH option. The destination directory
+# should contain the MathJax.js script. For instance, if the mathjax directory
+# is located at the same level as the HTML output directory, then
+# MATHJAX_RELPATH should be ../mathjax. The default value points to the MathJax
+# Content Delivery Network so you can quickly see the result without installing
+# MathJax. However, it is strongly recommended to install a local copy of
+# MathJax from https://www.mathjax.org before deployment.
+# The default value is: http://cdn.mathjax.org/mathjax/latest.
+# This tag requires that the tag USE_MATHJAX is set to YES.
+
+MATHJAX_RELPATH        = http://cdn.mathjax.org/mathjax/latest
+
+# The MATHJAX_EXTENSIONS tag can be used to specify one or more MathJax
+# extension names that should be enabled during MathJax rendering. For example
+# MATHJAX_EXTENSIONS = TeX/AMSmath TeX/AMSsymbols
+# This tag requires that the tag USE_MATHJAX is set to YES.
+
+MATHJAX_EXTENSIONS     =
+
+# The MATHJAX_CODEFILE tag can be used to specify a file with javascript pieces
+# of code that will be used on startup of the MathJax code. See the MathJax site
+# (see: http://docs.mathjax.org/en/latest/output.html) for more details. For an
+# example see the documentation.
+# This tag requires that the tag USE_MATHJAX is set to YES.
+
+MATHJAX_CODEFILE       =
+
+# When the SEARCHENGINE tag is enabled doxygen will generate a search box for
+# the HTML output. The underlying search engine uses javascript and DHTML and
+# should work on any modern browser. Note that when using HTML help
+# (GENERATE_HTMLHELP), Qt help (GENERATE_QHP), or docsets (GENERATE_DOCSET)
+# there is already a search function so this one should typically be disabled.
+# For large projects the javascript based search engine can be slow, then
+# enabling SERVER_BASED_SEARCH may provide a better solution. It is possible to
+# search using the keyboard; to jump to the search box use <access key> + S
+# (what the <access key> is depends on the OS and browser, but it is typically
+# <CTRL>, <ALT>/<option>, or both). Inside the search box use the <cursor down
+# key> to jump into the search results window, the results can be navigated
+# using the <cursor keys>. Press <Enter> to select an item or <escape> to cancel
+# the search. The filter options can be selected when the cursor is inside the
+# search box by pressing <Shift>+<cursor down>. Also here use the <cursor keys>
+# to select a filter and <Enter> or <escape> to activate or cancel the filter
+# option.
+# The default value is: YES.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+SEARCHENGINE           = YES
+
+# When the SERVER_BASED_SEARCH tag is enabled the search engine will be
+# implemented using a web server instead of a web client using Javascript. There
+# are two flavors of web server based searching depending on the EXTERNAL_SEARCH
+# setting. When disabled, doxygen will generate a PHP script for searching and
+# an index file used by the script. When EXTERNAL_SEARCH is enabled the indexing
+# and searching needs to be provided by external tools. See the section
+# "External Indexing and Searching" for details.
+# The default value is: NO.
+# This tag requires that the tag SEARCHENGINE is set to YES.
+
+SERVER_BASED_SEARCH    = NO
+
+# When EXTERNAL_SEARCH tag is enabled doxygen will no longer generate the PHP
+# script for searching. Instead the search results are written to an XML file
+# which needs to be processed by an external indexer. Doxygen will invoke an
+# external search engine pointed to by the SEARCHENGINE_URL option to obtain the
+# search results.
+#
+# Doxygen ships with an example indexer (doxyindexer) and search engine
+# (doxysearch.cgi) which are based on the open source search engine library
+# Xapian (see: https://xapian.org/).
+#
+# See the section "External Indexing and Searching" for details.
+# The default value is: NO.
+# This tag requires that the tag SEARCHENGINE is set to YES.
+
+EXTERNAL_SEARCH        = NO
+
+# The SEARCHENGINE_URL should point to a search engine hosted by a web server
+# which will return the search results when EXTERNAL_SEARCH is enabled.
+#
+# Doxygen ships with an example indexer (doxyindexer) and search engine
+# (doxysearch.cgi) which are based on the open source search engine library
+# Xapian (see: https://xapian.org/). See the section "External Indexing and
+# Searching" for details.
+# This tag requires that the tag SEARCHENGINE is set to YES.
+
+SEARCHENGINE_URL       =
+
+# When SERVER_BASED_SEARCH and EXTERNAL_SEARCH are both enabled the unindexed
+# search data is written to a file for indexing by an external tool. With the
+# SEARCHDATA_FILE tag the name of this file can be specified.
+# The default file is: searchdata.xml.
+# This tag requires that the tag SEARCHENGINE is set to YES.
+
+SEARCHDATA_FILE        = searchdata.xml
+
+# When SERVER_BASED_SEARCH and EXTERNAL_SEARCH are both enabled the
+# EXTERNAL_SEARCH_ID tag can be used as an identifier for the project. This is
+# useful in combination with EXTRA_SEARCH_MAPPINGS to search through multiple
+# projects and redirect the results back to the right project.
+# This tag requires that the tag SEARCHENGINE is set to YES.
+
+EXTERNAL_SEARCH_ID     =
+
+# The EXTRA_SEARCH_MAPPINGS tag can be used to enable searching through doxygen
+# projects other than the one defined by this configuration file, but that are
+# all added to the same external search index. Each project needs to have a
+# unique id set via EXTERNAL_SEARCH_ID. The search mapping then maps the id of
+# to a relative location where the documentation can be found. The format is:
+# EXTRA_SEARCH_MAPPINGS = tagname1=loc1 tagname2=loc2 ...
+# This tag requires that the tag SEARCHENGINE is set to YES.
+
+EXTRA_SEARCH_MAPPINGS  =
+
+#---------------------------------------------------------------------------
+# Configuration options related to the LaTeX output
+#---------------------------------------------------------------------------
+
+# If the GENERATE_LATEX tag is set to YES, doxygen will generate LaTeX output.
+# The default value is: YES.
+
+GENERATE_LATEX         = NO
+
+# The LATEX_OUTPUT tag is used to specify where the LaTeX docs will be put. If a
+# relative path is entered the value of OUTPUT_DIRECTORY will be put in front of
+# it.
+# The default directory is: latex.
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+LATEX_OUTPUT           = latex
+
+# The LATEX_CMD_NAME tag can be used to specify the LaTeX command name to be
+# invoked.
+#
+# Note that when enabling USE_PDFLATEX this option is only used for generating
+# bitmaps for formulas in the HTML output, but not in the Makefile that is
+# written to the output directory.
+# The default file is: latex.
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+LATEX_CMD_NAME         = latex
+
+# The MAKEINDEX_CMD_NAME tag can be used to specify the command name to generate
+# index for LaTeX.
+# The default file is: makeindex.
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+MAKEINDEX_CMD_NAME     = makeindex
+
+# If the COMPACT_LATEX tag is set to YES, doxygen generates more compact LaTeX
+# documents. This may be useful for small projects and may help to save some
+# trees in general.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+COMPACT_LATEX          = NO
+
+# The PAPER_TYPE tag can be used to set the paper type that is used by the
+# printer.
+# Possible values are: a4 (210 x 297 mm), letter (8.5 x 11 inches), legal (8.5 x
+# 14 inches) and executive (7.25 x 10.5 inches).
+# The default value is: a4.
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+PAPER_TYPE             = a4
+
+# The EXTRA_PACKAGES tag can be used to specify one or more LaTeX package names
+# that should be included in the LaTeX output. The package can be specified just
+# by its name or with the correct syntax as to be used with the LaTeX
+# \usepackage command. To get the times font for instance you can specify :
+# EXTRA_PACKAGES=times or EXTRA_PACKAGES={times}
+# To use the option intlimits with the amsmath package you can specify:
+# EXTRA_PACKAGES=[intlimits]{amsmath}
+# If left blank no extra packages will be included.
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+EXTRA_PACKAGES         =
+
+# The LATEX_HEADER tag can be used to specify a personal LaTeX header for the
+# generated LaTeX document. The header should contain everything until the first
+# chapter. If it is left blank doxygen will generate a standard header. See
+# section "Doxygen usage" for information on how to let doxygen write the
+# default header to a separate file.
+#
+# Note: Only use a user-defined header if you know what you are doing! The
+# following commands have a special meaning inside the header: $title,
+# $datetime, $date, $doxygenversion, $projectname, $projectnumber,
+# $projectbrief, $projectlogo. Doxygen will replace $title with the empty
+# string, for the replacement values of the other commands the user is referred
+# to HTML_HEADER.
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+LATEX_HEADER           =
+
+# The LATEX_FOOTER tag can be used to specify a personal LaTeX footer for the
+# generated LaTeX document. The footer should contain everything after the last
+# chapter. If it is left blank doxygen will generate a standard footer. See
+# LATEX_HEADER for more information on how to generate a default footer and what
+# special commands can be used inside the footer.
+#
+# Note: Only use a user-defined footer if you know what you are doing!
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+LATEX_FOOTER           =
+
+# The LATEX_EXTRA_FILES tag can be used to specify one or more extra images or
+# other source files which should be copied to the LATEX_OUTPUT output
+# directory. Note that the files will be copied as-is; there are no commands or
+# markers available.
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+LATEX_EXTRA_FILES      =
+
+# If the PDF_HYPERLINKS tag is set to YES, the LaTeX that is generated is
+# prepared for conversion to PDF (using ps2pdf or pdflatex). The PDF file will
+# contain links (just like the HTML output) instead of page references. This
+# makes the output suitable for online browsing using a PDF viewer.
+# The default value is: YES.
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+PDF_HYPERLINKS         = YES
+
+# If the USE_PDFLATEX tag is set to YES, doxygen will use pdflatex to generate
+# the PDF file directly from the LaTeX files. Set this option to YES, to get a
+# higher quality PDF documentation.
+# The default value is: YES.
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+USE_PDFLATEX           = YES
+
+# If the LATEX_BATCHMODE tag is set to YES, doxygen will add the \batchmode
+# command to the generated LaTeX files. This will instruct LaTeX to keep running
+# if errors occur, instead of asking the user for help. This option is also used
+# when generating formulas in HTML.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+LATEX_BATCHMODE        = NO
+
+# If the LATEX_HIDE_INDICES tag is set to YES then doxygen will not include the
+# index chapters (such as File Index, Compound Index, etc.) in the output.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+LATEX_HIDE_INDICES     = NO
+
+# If the LATEX_SOURCE_CODE tag is set to YES then doxygen will include source
+# code with syntax highlighting in the LaTeX output.
+#
+# Note that which sources are shown also depends on other settings such as
+# SOURCE_BROWSER.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+LATEX_SOURCE_CODE      = NO
+
+# The LATEX_BIB_STYLE tag can be used to specify the style to use for the
+# bibliography, e.g. plainnat, or ieeetr. See
+# https://en.wikipedia.org/wiki/BibTeX and \cite for more info.
+# The default value is: plain.
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+LATEX_BIB_STYLE        = plain
+
+#---------------------------------------------------------------------------
+# Configuration options related to the RTF output
+#---------------------------------------------------------------------------
+
+# If the GENERATE_RTF tag is set to YES, doxygen will generate RTF output. The
+# RTF output is optimized for Word 97 and may not look too pretty with other RTF
+# readers/editors.
+# The default value is: NO.
+
+GENERATE_RTF           = NO
+
+# The RTF_OUTPUT tag is used to specify where the RTF docs will be put. If a
+# relative path is entered the value of OUTPUT_DIRECTORY will be put in front of
+# it.
+# The default directory is: rtf.
+# This tag requires that the tag GENERATE_RTF is set to YES.
+
+RTF_OUTPUT             = rtf
+
+# If the COMPACT_RTF tag is set to YES, doxygen generates more compact RTF
+# documents. This may be useful for small projects and may help to save some
+# trees in general.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_RTF is set to YES.
+
+COMPACT_RTF            = NO
+
+# If the RTF_HYPERLINKS tag is set to YES, the RTF that is generated will
+# contain hyperlink fields. The RTF file will contain links (just like the HTML
+# output) instead of page references. This makes the output suitable for online
+# browsing using Word or some other Word compatible readers that support those
+# fields.
+#
+# Note: WordPad (write) and others do not support links.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_RTF is set to YES.
+
+RTF_HYPERLINKS         = YES
+
+# Load stylesheet definitions from file. Syntax is similar to doxygen's config
+# file, i.e. a series of assignments. You only have to provide replacements,
+# missing definitions are set to their default value.
+#
+# See also section "Doxygen usage" for information on how to generate the
+# default style sheet that doxygen normally uses.
+# This tag requires that the tag GENERATE_RTF is set to YES.
+
+RTF_STYLESHEET_FILE    =
+
+# Set optional variables used in the generation of an RTF document. Syntax is
+# similar to doxygen's config file. A template extensions file can be generated
+# using doxygen -e rtf extensionFile.
+# This tag requires that the tag GENERATE_RTF is set to YES.
+
+RTF_EXTENSIONS_FILE    =
+
+#---------------------------------------------------------------------------
+# Configuration options related to the man page output
+#---------------------------------------------------------------------------
+
+# If the GENERATE_MAN tag is set to YES, doxygen will generate man pages for
+# classes and files.
+# The default value is: NO.
+
+GENERATE_MAN           = NO
+
+# The MAN_OUTPUT tag is used to specify where the man pages will be put. If a
+# relative path is entered the value of OUTPUT_DIRECTORY will be put in front of
+# it. A directory man3 will be created inside the directory specified by
+# MAN_OUTPUT.
+# The default directory is: man.
+# This tag requires that the tag GENERATE_MAN is set to YES.
+
+MAN_OUTPUT             = man
+
+# The MAN_EXTENSION tag determines the extension that is added to the generated
+# man pages. In case the manual section does not start with a number, the number
+# 3 is prepended. The dot (.) at the beginning of the MAN_EXTENSION tag is
+# optional.
+# The default value is: .3.
+# This tag requires that the tag GENERATE_MAN is set to YES.
+
+MAN_EXTENSION          = .3
+
+# If the MAN_LINKS tag is set to YES and doxygen generates man output, then it
+# will generate one additional man file for each entity documented in the real
+# man page(s). These additional files only source the real man page, but without
+# them the man command would be unable to find the correct page.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_MAN is set to YES.
+
+MAN_LINKS              = NO
+
+#---------------------------------------------------------------------------
+# Configuration options related to the XML output
+#---------------------------------------------------------------------------
+
+# If the GENERATE_XML tag is set to YES, doxygen will generate an XML file that
+# captures the structure of the code including all documentation.
+# The default value is: NO.
+
+GENERATE_XML           = YES
+
+# The XML_OUTPUT tag is used to specify where the XML pages will be put. If a
+# relative path is entered the value of OUTPUT_DIRECTORY will be put in front of
+# it.
+# The default directory is: xml.
+# This tag requires that the tag GENERATE_XML is set to YES.
+
+XML_OUTPUT             = xml
+
+# If the XML_PROGRAMLISTING tag is set to YES, doxygen will dump the program
+# listings (including syntax highlighting and cross-referencing information) to
+# the XML output. Note that enabling this will significantly increase the size
+# of the XML output.
+# The default value is: YES.
+# This tag requires that the tag GENERATE_XML is set to YES.
+
+XML_PROGRAMLISTING     = YES
+
+#---------------------------------------------------------------------------
+# Configuration options related to the DOCBOOK output
+#---------------------------------------------------------------------------
+
+# If the GENERATE_DOCBOOK tag is set to YES, doxygen will generate Docbook files
+# that can be used to generate PDF.
+# The default value is: NO.
+
+GENERATE_DOCBOOK       = NO
+
+# The DOCBOOK_OUTPUT tag is used to specify where the Docbook pages will be put.
+# If a relative path is entered the value of OUTPUT_DIRECTORY will be put in
+# front of it.
+# The default directory is: docbook.
+# This tag requires that the tag GENERATE_DOCBOOK is set to YES.
+
+DOCBOOK_OUTPUT         = docbook
+
+#---------------------------------------------------------------------------
+# Configuration options for the AutoGen Definitions output
+#---------------------------------------------------------------------------
+
+# If the GENERATE_AUTOGEN_DEF tag is set to YES, doxygen will generate an
+# AutoGen Definitions (see http://autogen.sourceforge.net/) file that captures
+# the structure of the code including all documentation. Note that this feature
+# is still experimental and incomplete at the moment.
+# The default value is: NO.
+
+GENERATE_AUTOGEN_DEF   = NO
+
+#---------------------------------------------------------------------------
+# Configuration options related to the Perl module output
+#---------------------------------------------------------------------------
+
+# If the GENERATE_PERLMOD tag is set to YES, doxygen will generate a Perl module
+# file that captures the structure of the code including all documentation.
+#
+# Note that this feature is still experimental and incomplete at the moment.
+# The default value is: NO.
+
+GENERATE_PERLMOD       = NO
+
+# If the PERLMOD_LATEX tag is set to YES, doxygen will generate the necessary
+# Makefile rules, Perl scripts and LaTeX code to be able to generate PDF and DVI
+# output from the Perl module output.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_PERLMOD is set to YES.
+
+PERLMOD_LATEX          = NO
+
+# If the PERLMOD_PRETTY tag is set to YES, the Perl module output will be nicely
+# formatted so it can be parsed by a human reader. This is useful if you want to
+# understand what is going on. On the other hand, if this tag is set to NO, the
+# size of the Perl module output will be much smaller and Perl will parse it
+# just the same.
+# The default value is: YES.
+# This tag requires that the tag GENERATE_PERLMOD is set to YES.
+
+PERLMOD_PRETTY         = YES
+
+# The names of the make variables in the generated doxyrules.make file are
+# prefixed with the string contained in PERLMOD_MAKEVAR_PREFIX. This is useful
+# so different doxyrules.make files included by the same Makefile don't
+# overwrite each other's variables.
+# This tag requires that the tag GENERATE_PERLMOD is set to YES.
+
+PERLMOD_MAKEVAR_PREFIX =
+
+#---------------------------------------------------------------------------
+# Configuration options related to the preprocessor
+#---------------------------------------------------------------------------
+
+# If the ENABLE_PREPROCESSING tag is set to YES, doxygen will evaluate all
+# C-preprocessor directives found in the sources and include files.
+# The default value is: YES.
+
+ENABLE_PREPROCESSING   = YES
+
+# If the MACRO_EXPANSION tag is set to YES, doxygen will expand all macro names
+# in the source code. If set to NO, only conditional compilation will be
+# performed. Macro expansion can be done in a controlled way by setting
+# EXPAND_ONLY_PREDEF to YES.
+# The default value is: NO.
+# This tag requires that the tag ENABLE_PREPROCESSING is set to YES.
+
+MACRO_EXPANSION        = YES
+
+# If the EXPAND_ONLY_PREDEF and MACRO_EXPANSION tags are both set to YES then
+# the macro expansion is limited to the macros specified with the PREDEFINED and
+# EXPAND_AS_DEFINED tags.
+# The default value is: NO.
+# This tag requires that the tag ENABLE_PREPROCESSING is set to YES.
+
+EXPAND_ONLY_PREDEF     = NO
+
+# If the SEARCH_INCLUDES tag is set to YES, the include files in the
+# INCLUDE_PATH will be searched if a #include is found.
+# The default value is: YES.
+# This tag requires that the tag ENABLE_PREPROCESSING is set to YES.
+
+SEARCH_INCLUDES        = YES
+
+# The INCLUDE_PATH tag can be used to specify one or more directories that
+# contain include files that are not input files but should be processed by the
+# preprocessor.
+# This tag requires that the tag SEARCH_INCLUDES is set to YES.
+
+INCLUDE_PATH           = "@XEN_BASE@/xen/include/generated" \
+                         "@XEN_BASE@/xen/include/"
+
+# You can use the INCLUDE_FILE_PATTERNS tag to specify one or more wildcard
+# patterns (like *.h and *.hpp) to filter out the header-files in the
+# directories. If left blank, the patterns specified with FILE_PATTERNS will be
+# used.
+# This tag requires that the tag ENABLE_PREPROCESSING is set to YES.
+
+INCLUDE_FILE_PATTERNS  =
+
+# The PREDEFINED tag can be used to specify one or more macro names that are
+# defined before the preprocessor is started (similar to the -D option of e.g.
+# gcc). The argument of the tag is a list of macros of the form: name or
+# name=definition (no spaces). If the definition and the "=" are omitted, "=1"
+# is assumed. To prevent a macro definition from being undefined via #undef or
+# recursively expanded use the := operator instead of the = operator.
+# This tag requires that the tag ENABLE_PREPROCESSING is set to YES.
+
+PREDEFINED             = __attribute__(x)= \
+                         DOXYGEN \
+                         __XEN__
+
+# If the MACRO_EXPANSION and EXPAND_ONLY_PREDEF tags are set to YES then this
+# tag can be used to specify a list of macro names that should be expanded. The
+# macro definition that is found in the sources will be used. Use the PREDEFINED
+# tag if you want to use a different macro definition that overrules the
+# definition found in the source code.
+# This tag requires that the tag ENABLE_PREPROCESSING is set to YES.
+
+EXPAND_AS_DEFINED      =
+
+# If the SKIP_FUNCTION_MACROS tag is set to YES then doxygen's preprocessor will
+# remove all references to function-like macros that are alone on a line, have
+# an all uppercase name, and do not end with a semicolon. Such function macros
+# are typically used for boiler-plate code, and will confuse the parser if not
+# removed.
+# The default value is: YES.
+# This tag requires that the tag ENABLE_PREPROCESSING is set to YES.
+
+SKIP_FUNCTION_MACROS   = NO
+
+#---------------------------------------------------------------------------
+# Configuration options related to external references
+#---------------------------------------------------------------------------
+
+# The TAGFILES tag can be used to specify one or more tag files. For each tag
+# file the location of the external documentation should be added. The format of
+# a tag file without this location is as follows:
+# TAGFILES = file1 file2 ...
+# Adding location for the tag files is done as follows:
+# TAGFILES = file1=loc1 "file2 = loc2" ...
+# where loc1 and loc2 can be relative or absolute paths or URLs. See the
+# section "Linking to external documentation" for more information about the use
+# of tag files.
+# Note: Each tag file must have a unique name (where the name does NOT include
+# the path). If a tag file is not located in the directory in which doxygen is
+# run, you must also specify the path to the tagfile here.
+
+TAGFILES               =
+
+# When a file name is specified after GENERATE_TAGFILE, doxygen will create a
+# tag file that is based on the input files it reads. See section "Linking to
+# external documentation" for more information about the usage of tag files.
+
+GENERATE_TAGFILE       =
+
+# If the ALLEXTERNALS tag is set to YES, all external class will be listed in
+# the class index. If set to NO, only the inherited external classes will be
+# listed.
+# The default value is: NO.
+
+ALLEXTERNALS           = NO
+
+# If the EXTERNAL_GROUPS tag is set to YES, all external groups will be listed
+# in the modules index. If set to NO, only the current project's groups will be
+# listed.
+# The default value is: YES.
+
+EXTERNAL_GROUPS        = YES
+
+# If the EXTERNAL_PAGES tag is set to YES, all external pages will be listed in
+# the related pages index. If set to NO, only the current project's pages will
+# be listed.
+# The default value is: YES.
+
+EXTERNAL_PAGES         = YES
+
+#---------------------------------------------------------------------------
+# Configuration options related to the dot tool
+#---------------------------------------------------------------------------
+
+# If the CLASS_DIAGRAMS tag is set to YES, doxygen will generate a class diagram
+# (in HTML and LaTeX) for classes with base or super classes. Setting the tag to
+# NO turns the diagrams off. Note that this option also works with HAVE_DOT
+# disabled, but it is recommended to install and use dot, since it yields more
+# powerful graphs.
+# The default value is: YES.
+
+CLASS_DIAGRAMS         = NO
+
+# You can include diagrams made with dia in doxygen documentation. Doxygen will
+# then run dia to produce the diagram and insert it in the documentation. The
+# DIA_PATH tag allows you to specify the directory where the dia binary resides.
+# If left empty dia is assumed to be found in the default search path.
+
+DIA_PATH               =
+
+# If set to YES the inheritance and collaboration graphs will hide inheritance
+# and usage relations if the target is undocumented or is not a class.
+# The default value is: YES.
+
+HIDE_UNDOC_RELATIONS   = YES
+
+# If you set the HAVE_DOT tag to YES then doxygen will assume the dot tool is
+# available from the path. This tool is part of Graphviz (see:
+# http://www.graphviz.org/), a graph visualization toolkit from AT&T and Lucent
+# Bell Labs. The other options in this section have no effect if this option is
+# set to NO
+# The default value is: NO.
+
+HAVE_DOT               = NO
+
+# The DOT_NUM_THREADS specifies the number of dot invocations doxygen is allowed
+# to run in parallel. When set to 0 doxygen will base this on the number of
+# processors available in the system. You can set it explicitly to a value
+# larger than 0 to get control over the balance between CPU load and processing
+# speed.
+# Minimum value: 0, maximum value: 32, default value: 0.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+DOT_NUM_THREADS        = 0
+
+# When you want a differently looking font in the dot files that doxygen
+# generates you can specify the font name using DOT_FONTNAME. You need to make
+# sure dot is able to find the font, which can be done by putting it in a
+# standard location or by setting the DOTFONTPATH environment variable or by
+# setting DOT_FONTPATH to the directory containing the font.
+# The default value is: Helvetica.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+DOT_FONTNAME           = Helvetica
+
+# The DOT_FONTSIZE tag can be used to set the size (in points) of the font of
+# dot graphs.
+# Minimum value: 4, maximum value: 24, default value: 10.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+DOT_FONTSIZE           = 10
+
+# By default doxygen will tell dot to use the default font as specified with
+# DOT_FONTNAME. If you specify a different font using DOT_FONTNAME you can set
+# the path where dot can find it using this tag.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+DOT_FONTPATH           =
+
+# If the CLASS_GRAPH tag is set to YES then doxygen will generate a graph for
+# each documented class showing the direct and indirect inheritance relations.
+# Setting this tag to YES will force the CLASS_DIAGRAMS tag to NO.
+# The default value is: YES.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+CLASS_GRAPH            = YES
+
+# If the COLLABORATION_GRAPH tag is set to YES then doxygen will generate a
+# graph for each documented class showing the direct and indirect implementation
+# dependencies (inheritance, containment, and class references variables) of the
+# class with other documented classes.
+# The default value is: YES.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+COLLABORATION_GRAPH    = YES
+
+# If the GROUP_GRAPHS tag is set to YES then doxygen will generate a graph for
+# groups, showing the direct groups dependencies.
+# The default value is: YES.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+GROUP_GRAPHS           = YES
+
+# If the UML_LOOK tag is set to YES, doxygen will generate inheritance and
+# collaboration diagrams in a style similar to the OMG's Unified Modeling
+# Language.
+# The default value is: NO.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+UML_LOOK               = NO
+
+# If the UML_LOOK tag is enabled, the fields and methods are shown inside the
+# class node. If there are many fields or methods and many nodes the graph may
+# become too big to be useful. The UML_LIMIT_NUM_FIELDS threshold limits the
+# number of items for each type to make the size more manageable. Set this to 0
+# for no limit. Note that the threshold may be exceeded by 50% before the limit
+# is enforced. So when you set the threshold to 10, up to 15 fields may appear,
+# but if the number exceeds 15, the total amount of fields shown is limited to
+# 10.
+# Minimum value: 0, maximum value: 100, default value: 10.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+UML_LIMIT_NUM_FIELDS   = 10
+
+# If the TEMPLATE_RELATIONS tag is set to YES then the inheritance and
+# collaboration graphs will show the relations between templates and their
+# instances.
+# The default value is: NO.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+TEMPLATE_RELATIONS     = NO
+
+# If the INCLUDE_GRAPH, ENABLE_PREPROCESSING and SEARCH_INCLUDES tags are set to
+# YES then doxygen will generate a graph for each documented file showing the
+# direct and indirect include dependencies of the file with other documented
+# files.
+# The default value is: YES.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+INCLUDE_GRAPH          = YES
+
+# If the INCLUDED_BY_GRAPH, ENABLE_PREPROCESSING and SEARCH_INCLUDES tags are
+# set to YES then doxygen will generate a graph for each documented file showing
+# the direct and indirect include dependencies of the file with other documented
+# files.
+# The default value is: YES.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+INCLUDED_BY_GRAPH      = YES
+
+# If the CALL_GRAPH tag is set to YES then doxygen will generate a call
+# dependency graph for every global function or class method.
+#
+# Note that enabling this option will significantly increase the time of a run.
+# So in most cases it will be better to enable call graphs for selected
+# functions only using the \callgraph command. Disabling a call graph can be
+# accomplished by means of the command \hidecallgraph.
+# The default value is: NO.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+CALL_GRAPH             = NO
+
+# If the CALLER_GRAPH tag is set to YES then doxygen will generate a caller
+# dependency graph for every global function or class method.
+#
+# Note that enabling this option will significantly increase the time of a run.
+# So in most cases it will be better to enable caller graphs for selected
+# functions only using the \callergraph command. Disabling a caller graph can be
+# accomplished by means of the command \hidecallergraph.
+# The default value is: NO.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+CALLER_GRAPH           = NO
+
+# If the GRAPHICAL_HIERARCHY tag is set to YES then doxygen will graphical
+# hierarchy of all classes instead of a textual one.
+# The default value is: YES.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+GRAPHICAL_HIERARCHY    = YES
+
+# If the DIRECTORY_GRAPH tag is set to YES then doxygen will show the
+# dependencies a directory has on other directories in a graphical way. The
+# dependency relations are determined by the #include relations between the
+# files in the directories.
+# The default value is: YES.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+DIRECTORY_GRAPH        = YES
+
+# The DOT_IMAGE_FORMAT tag can be used to set the image format of the images
+# generated by dot. For an explanation of the image formats see the section
+# output formats in the documentation of the dot tool (Graphviz (see:
+# http://www.graphviz.org/)).
+# Note: If you choose svg you need to set HTML_FILE_EXTENSION to xhtml in order
+# to make the SVG files visible in IE 9+ (other browsers do not have this
+# requirement).
+# Possible values are: png, jpg, gif, svg, png:gd, png:gd:gd, png:cairo,
+# png:cairo:gd, png:cairo:cairo, png:cairo:gdiplus, png:gdiplus and
+# png:gdiplus:gdiplus.
+# The default value is: png.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+DOT_IMAGE_FORMAT       = png
+
+# If DOT_IMAGE_FORMAT is set to svg, then this option can be set to YES to
+# enable generation of interactive SVG images that allow zooming and panning.
+#
+# Note that this requires a modern browser other than Internet Explorer. Tested
+# and working are Firefox, Chrome, Safari, and Opera.
+# Note: For IE 9+ you need to set HTML_FILE_EXTENSION to xhtml in order to make
+# the SVG files visible. Older versions of IE do not have SVG support.
+# The default value is: NO.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+INTERACTIVE_SVG        = NO
+
+# The DOT_PATH tag can be used to specify the path where the dot tool can be
+# found. If left blank, it is assumed the dot tool can be found in the path.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+DOT_PATH               =
+
+# The DOTFILE_DIRS tag can be used to specify one or more directories that
+# contain dot files that are included in the documentation (see the \dotfile
+# command).
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+DOTFILE_DIRS           =
+
+# The MSCFILE_DIRS tag can be used to specify one or more directories that
+# contain msc files that are included in the documentation (see the \mscfile
+# command).
+
+MSCFILE_DIRS           =
+
+# The DIAFILE_DIRS tag can be used to specify one or more directories that
+# contain dia files that are included in the documentation (see the \diafile
+# command).
+
+DIAFILE_DIRS           =
+
+# The DOT_GRAPH_MAX_NODES tag can be used to set the maximum number of nodes
+# that will be shown in the graph. If the number of nodes in a graph becomes
+# larger than this value, doxygen will truncate the graph, which is visualized
+# by representing a node as a red box. Note that doxygen if the number of direct
+# children of the root node in a graph is already larger than
+# DOT_GRAPH_MAX_NODES then the graph will not be shown at all. Also note that
+# the size of a graph can be further restricted by MAX_DOT_GRAPH_DEPTH.
+# Minimum value: 0, maximum value: 10000, default value: 50.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+DOT_GRAPH_MAX_NODES    = 50
+
+# The MAX_DOT_GRAPH_DEPTH tag can be used to set the maximum depth of the graphs
+# generated by dot. A depth value of 3 means that only nodes reachable from the
+# root by following a path via at most 3 edges will be shown. Nodes that lay
+# further from the root node will be omitted. Note that setting this option to 1
+# or 2 may greatly reduce the computation time needed for large code bases. Also
+# note that the size of a graph can be further restricted by
+# DOT_GRAPH_MAX_NODES. Using a depth of 0 means no depth restriction.
+# Minimum value: 0, maximum value: 1000, default value: 0.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+MAX_DOT_GRAPH_DEPTH    = 0
+
+# Set the DOT_TRANSPARENT tag to YES to generate images with a transparent
+# background. This is disabled by default, because dot on Windows does not seem
+# to support this out of the box.
+#
+# Warning: Depending on the platform used, enabling this option may lead to
+# badly anti-aliased labels on the edges of a graph (i.e. they become hard to
+# read).
+# The default value is: NO.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+DOT_TRANSPARENT        = NO
+
+# Set the DOT_MULTI_TARGETS tag to YES to allow dot to generate multiple output
+# files in one run (i.e. multiple -o and -T options on the command line). This
+# makes dot run faster, but since only newer versions of dot (>1.8.10) support
+# this, this feature is disabled by default.
+# The default value is: NO.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+DOT_MULTI_TARGETS      = NO
+
+# If the GENERATE_LEGEND tag is set to YES doxygen will generate a legend page
+# explaining the meaning of the various boxes and arrows in the dot generated
+# graphs.
+# The default value is: YES.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+GENERATE_LEGEND        = YES
+
+# If the DOT_CLEANUP tag is set to YES, doxygen will remove the intermediate dot
+# files that are used to generate the various graphs.
+# The default value is: YES.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+DOT_CLEANUP            = YES
diff --git a/m4/ax_python_module.m4 b/m4/ax_python_module.m4
new file mode 100644
index 0000000000..107d88264a
--- /dev/null
+++ b/m4/ax_python_module.m4
@@ -0,0 +1,56 @@
+# ===========================================================================
+#     https://www.gnu.org/software/autoconf-archive/ax_python_module.html
+# ===========================================================================
+#
+# SYNOPSIS
+#
+#   AX_PYTHON_MODULE(modname[, fatal, python])
+#
+# DESCRIPTION
+#
+#   Checks for Python module.
+#
+#   If fatal is non-empty then absence of a module will trigger an error.
+#   The third parameter can either be "python" for Python 2 or "python3" for
+#   Python 3; defaults to Python 3.
+#
+# LICENSE
+#
+#   Copyright (c) 2008 Andrew Collier
+#
+#   Copying and distribution of this file, with or without modification, are
+#   permitted in any medium without royalty provided the copyright notice
+#   and this notice are preserved. This file is offered as-is, without any
+#   warranty.
+
+#serial 9
+
+AU_ALIAS([AC_PYTHON_MODULE], [AX_PYTHON_MODULE])
+AC_DEFUN([AX_PYTHON_MODULE],[
+    if test -z $PYTHON;
+    then
+        if test -z "$3";
+        then
+            PYTHON="python3"
+        else
+            PYTHON="$3"
+        fi
+    fi
+    PYTHON_NAME=`basename $PYTHON`
+    AC_MSG_CHECKING($PYTHON_NAME module: $1)
+    $PYTHON -c "import $1" 2>/dev/null
+    if test $? -eq 0;
+    then
+        AC_MSG_RESULT(yes)
+        eval AS_TR_CPP(HAVE_PYMOD_$1)=yes
+    else
+        AC_MSG_RESULT(no)
+        eval AS_TR_CPP(HAVE_PYMOD_$1)=no
+        #
+        if test -n "$2"
+        then
+            AC_MSG_ERROR(failed to find required module $1)
+            exit 1
+        fi
+    fi
+])
\ No newline at end of file
diff --git a/m4/docs_tool.m4 b/m4/docs_tool.m4
index 3e8814ac8d..39aa348026 100644
--- a/m4/docs_tool.m4
+++ b/m4/docs_tool.m4
@@ -15,3 +15,12 @@ dnl
         AC_MSG_WARN([$2 is not available so some documentation won't be built])
     ])
 ])
+
+AC_DEFUN([AX_DOCS_TOOL_REQ_PROG], [
+dnl
+    AC_ARG_VAR([$1], [Path to $2 tool])
+    AC_PATH_PROG([$1], [$2])
+    AS_IF([! test -x "$ac_cv_path_$1"], [
+        AC_MSG_ERROR([$2 is needed])
+    ])
+])
\ No newline at end of file
-- 
2.17.1


