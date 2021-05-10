Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E44377E6F
	for <lists+xen-devel@lfdr.de>; Mon, 10 May 2021 10:43:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.124999.235363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg1Ve-00062c-EW; Mon, 10 May 2021 08:43:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 124999.235363; Mon, 10 May 2021 08:43:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg1Ve-0005x2-8K; Mon, 10 May 2021 08:43:26 +0000
Received: by outflank-mailman (input) for mailman id 124999;
 Mon, 10 May 2021 08:43:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jR2S=KF=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lg1U6-0008L0-OP
 for xen-devel@lists.xenproject.org; Mon, 10 May 2021 08:41:50 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id e9f42ebd-eb64-47a7-a2ce-c4d9b87a9826;
 Mon, 10 May 2021 08:41:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2FB6C1424;
 Mon, 10 May 2021 01:41:25 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.197.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE41A3F719;
 Mon, 10 May 2021 01:41:23 -0700 (PDT)
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
X-Inumbo-ID: e9f42ebd-eb64-47a7-a2ce-c4d9b87a9826
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
Subject: [PATCH v6 7/9] docs: Change Makefile and sphinx configuration for doxygen
Date: Mon, 10 May 2021 09:41:03 +0100
Message-Id: <20210510084105.17108-8-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210510084105.17108-1-luca.fancellu@arm.com>
References: <20210510084105.17108-1-luca.fancellu@arm.com>

Modify docs/Makefile to call doxygen and generate sphinx
html documentation given the doxygen XML output.

Modify docs/conf.py sphinx configuration file to setup
the breathe extension that works as bridge between
sphinx and doxygen.

Add some files to the .gitignore to ignore some
generated files for doxygen.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 .gitignore    |  6 ++++++
 docs/Makefile | 42 +++++++++++++++++++++++++++++++++++++++---
 docs/conf.py  | 48 +++++++++++++++++++++++++++++++++++++++++++++---
 3 files changed, 90 insertions(+), 6 deletions(-)

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
 
-- 
2.17.1


