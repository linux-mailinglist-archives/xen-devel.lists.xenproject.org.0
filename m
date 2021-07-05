Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D340C3BBBA8
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 12:56:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150108.277679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0MGU-0007lX-VM; Mon, 05 Jul 2021 10:55:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150108.277679; Mon, 05 Jul 2021 10:55:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0MGU-0007gi-PL; Mon, 05 Jul 2021 10:55:50 +0000
Received: by outflank-mailman (input) for mailman id 150108;
 Mon, 05 Jul 2021 10:55:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jU53=L5=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1m0MGT-0003rB-DB
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 10:55:49 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 3c1f91db-b0f4-4e2b-8467-03772ff4fa00;
 Mon, 05 Jul 2021 10:55:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C65C71063;
 Mon,  5 Jul 2021 03:55:28 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.197.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E66E83F5A1;
 Mon,  5 Jul 2021 03:55:26 -0700 (PDT)
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
X-Inumbo-ID: 3c1f91db-b0f4-4e2b-8467-03772ff4fa00
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
Subject: [PATCH v7 7/9] docs: Change Makefile and sphinx configuration for doxygen
Date: Mon,  5 Jul 2021 11:51:01 +0100
Message-Id: <20210705105103.14509-8-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210705105103.14509-1-luca.fancellu@arm.com>
References: <20210705105103.14509-1-luca.fancellu@arm.com>

Modify docs/Makefile to call doxygen and generate sphinx
html documentation given the doxygen XML output.

Modify docs/conf.py sphinx configuration file to setup
the breathe extension that works as bridge between
sphinx and doxygen.

Add some files to the .gitignore to ignore some
generated files for doxygen.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
v7 changes:
- in conf.py, get DOXYGEN_OUTPUT as environmental
variable and add new types into cpp_id_attributes
---
 .gitignore    |  6 ++++++
 docs/Makefile | 43 ++++++++++++++++++++++++++++++++++++++++---
 docs/conf.py  | 43 ++++++++++++++++++++++++++++++++++++++++---
 3 files changed, 86 insertions(+), 6 deletions(-)

diff --git a/.gitignore b/.gitignore
index 38a085e398..ef0b0ed101 100644
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
index 8de1efb6f5..c0699a2f1b 100644
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
@@ -46,8 +58,29 @@ all: build
 build: html txt pdf man-pages figs
 
 .PHONY: sphinx-html
-sphinx-html:
-	sphinx-build -b html . sphinx/html
+sphinx-html: $(DOXY_DEPS) $(DOXY_LIST_SOURCES)
+ifneq ($(SPHINXBUILD),no)
+	$(DOXYGEN) xen.doxyfile
+	XEN_ROOT=$(realpath $(XEN_ROOT)) DOXYGEN_OUTPUT=$(DOXYGEN_OUTPUT) \
+		$(SPHINXBUILD) -b html . sphinx/html
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
@@ -71,7 +104,11 @@ clean: clean-man-pages
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
index 50e41501db..d5cd305f19 100644
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
@@ -44,6 +48,10 @@ finally:
     else:
         version = release = u"unknown version"
 
+if "DOXYGEN_OUTPUT" not in os.environ:
+    sys.exit("$DOXYGEN_OUTPUT environment variable undefined.")
+xen_doxygen_output = os.environ["DOXYGEN_OUTPUT"]
+
 # -- General configuration ---------------------------------------------------
 
 # If your documentation needs a minimal Sphinx version, state it here.
@@ -53,7 +61,8 @@ needs_sphinx = '1.4'
 # Add any Sphinx extension module names here, as strings. They can be
 # extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
 # ones.
-extensions = []
+# breathe -> extension that integrates doxygen xml output with sphinx
+extensions = ['breathe']
 
 # Add any paths that contain templates here, relative to this directory.
 templates_path = ['_templates']
@@ -175,6 +184,34 @@ texinfo_documents = [
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
+    '__subsystem', '__packed', '__init',
+    '__attribute__', '__aligned__'
+]
+c_id_attributes = cpp_id_attributes
+
 
 # -- Options for Epub output -------------------------------------------------
 
-- 
2.17.1


