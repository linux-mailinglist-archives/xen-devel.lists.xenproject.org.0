Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 479E361F11C
	for <lists+xen-devel@lfdr.de>; Mon,  7 Nov 2022 11:48:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439287.693356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orzfY-00038U-SK; Mon, 07 Nov 2022 10:47:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439287.693356; Mon, 07 Nov 2022 10:47:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orzfY-00034I-OF; Mon, 07 Nov 2022 10:47:56 +0000
Received: by outflank-mailman (input) for mailman id 439287;
 Mon, 07 Nov 2022 10:47:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=or3T=3H=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1orzfW-0002Pj-6U
 for xen-devel@lists.xenproject.org; Mon, 07 Nov 2022 10:47:54 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 9fe5345c-5e89-11ed-8fd1-01056ac49cbb;
 Mon, 07 Nov 2022 11:47:50 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E80AED1;
 Mon,  7 Nov 2022 02:47:57 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6EC13F73D;
 Mon,  7 Nov 2022 02:47:49 -0800 (PST)
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
X-Inumbo-ID: 9fe5345c-5e89-11ed-8fd1-01056ac49cbb
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH 2/4] xen/Makefile: add analysis-cppcheck and analysis-cppcheck-html
Date: Mon,  7 Nov 2022 10:47:37 +0000
Message-Id: <20221107104739.10404-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221107104739.10404-1-luca.fancellu@arm.com>
References: <20221107104739.10404-1-luca.fancellu@arm.com>

Change cppcheck invocation method by substituting the Makefile
targets cppcheck{-html} with analysis-cppcheck{-html}.

Now cppcheck will build Xen while analysing the source files, and it
will produce a text output when called with analysis-cppcheck and
an additional html output when called with analysis-cppcheck-html.
With this patch cppcheck will benefit of platform configuration files
that will help it to understand the target of the compilation and
improve the analysis.

To do so:
 - modify cppcheck calls in Makefile and add files to clean and
   distclean.
 - add platform configuration files for cppcheck.
 - add scripts to generate text and html output.
 - add cppcheck-cc.sh script that is a wrapper for cppcheck and it's
   used as Xen compiler, it will intercept all flags given from the
   make build system and it will execute cppcheck on the compiled
   file together with the file compilation.
 - add a script that generates a suppression list for cppcheck to
   overcome a problem where cppcheck is not suppressing findings
   in the headers using in-code comment. The system uses the headers
   in-code comment to produce the list, so it's transparent to the
   developer and both c files and header can benefit from in-code
   comment suppression.
 - guarded hypercall-defs.c with CPPCHECK define because cppcheck
   gets confused as the file does not contain c code.
 - add false-positive-cppcheck.json file
 - update documentation.
 - update .gitignore

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 .gitignore                                  |   8 +-
 docs/misra/cppcheck.txt                     |  47 +++--
 docs/misra/documenting-violations.rst       |   7 +-
 docs/misra/false-positive-cppcheck.json     |  12 ++
 xen/Makefile                                | 143 ++++++++-----
 xen/include/hypercall-defs.c                |   9 +
 xen/tools/cppcheck-build-suppr-list.sh      |  81 +++++++
 xen/tools/cppcheck-cc.sh                    | 223 ++++++++++++++++++++
 xen/tools/cppcheck-html-prepare.sh          | 110 ++++++++++
 xen/tools/cppcheck-plat/arm32-wchar_t4.xml  |  17 ++
 xen/tools/cppcheck-plat/arm64-wchar_t2.xml  |  17 ++
 xen/tools/cppcheck-plat/arm64-wchar_t4.xml  |  17 ++
 xen/tools/cppcheck-plat/x86_64-wchar_t2.xml |  17 ++
 xen/tools/cppcheck-plat/x86_64-wchar_t4.xml |  17 ++
 xen/tools/cppcheck-txt-prepare.sh           |  74 +++++++
 15 files changed, 717 insertions(+), 82 deletions(-)
 create mode 100644 docs/misra/false-positive-cppcheck.json
 create mode 100755 xen/tools/cppcheck-build-suppr-list.sh
 create mode 100755 xen/tools/cppcheck-cc.sh
 create mode 100755 xen/tools/cppcheck-html-prepare.sh
 create mode 100644 xen/tools/cppcheck-plat/arm32-wchar_t4.xml
 create mode 100644 xen/tools/cppcheck-plat/arm64-wchar_t2.xml
 create mode 100644 xen/tools/cppcheck-plat/arm64-wchar_t4.xml
 create mode 100644 xen/tools/cppcheck-plat/x86_64-wchar_t2.xml
 create mode 100644 xen/tools/cppcheck-plat/x86_64-wchar_t4.xml
 create mode 100755 xen/tools/cppcheck-txt-prepare.sh

diff --git a/.gitignore b/.gitignore
index b48e1e20c4fc..abe47bfda9d2 100644
--- a/.gitignore
+++ b/.gitignore
@@ -7,9 +7,11 @@
 *.o
 *.d
 *.d2
-*.c.cppcheck
+*.cppcheck
+*.cppcheck.txt
 *.opic
 *.a
+*.c.json
 *.safparse
 *.so
 *.so.[0-9]*
@@ -283,9 +285,11 @@ xen/arch/*/efi/efi.h
 xen/arch/*/efi/pe.c
 xen/arch/*/efi/runtime.c
 xen/arch/*/include/asm/asm-offsets.h
+xen/build-dir-cppcheck
 xen/common/config_data.S
 xen/common/config.gz
 xen/cppcheck-htmlreport/
+xen/cppcheck-report/
 xen/cppcheck-misra.*
 xen/include/headers*.chk
 xen/include/compat/*
@@ -317,7 +321,7 @@ tools/flask/policy/policy.conf
 tools/flask/policy/xenpolicy-*
 xen/*.sed
 xen/xen
-xen/xen-cppcheck.xml
+xen/suppression-list.txt
 xen/xen-syms
 xen/xen-syms.map
 xen/xen.*
diff --git a/docs/misra/cppcheck.txt b/docs/misra/cppcheck.txt
index 25d8c3050b72..c59ad03dc7e9 100644
--- a/docs/misra/cppcheck.txt
+++ b/docs/misra/cppcheck.txt
@@ -38,27 +38,32 @@ Dependencies are listed in the readme.md of the project repository.
 Use cppcheck to analyse Xen
 ===========================
 
-Using cppcheck integration is very simple, it requires few steps:
-
- 1) Compile Xen
- 2) call the cppcheck make target to generate a report in xml format:
-    make CPPCHECK_MISRA=y cppcheck
- 3) call the cppcheck-html make target to generate a report in xml and html
-    format:
-    make CPPCHECK_MISRA=y cppcheck-html
-
-    In case the cppcheck binaries are not in the PATH, CPPCHECK and
-    CPPCHECK_HTMLREPORT variables can be overridden with the full path to the
-    binaries:
-
-    make -C xen \
-        CPPCHECK=/path/to/cppcheck \
-        CPPCHECK_HTMLREPORT=/path/to/cppcheck-htmlreport \
-        CPPCHECK_MISRA=y \
-        cppcheck-html
-
-The output is by default in a folder named cppcheck-htmlreport, but the name
-can be changed by passing it in the CPPCHECK_HTMLREPORT_OUTDIR variable.
+Using cppcheck integration is very simple, it requires one of the following
+steps, depending on whether the user wants a text report or also an html report.
+The CPPCHECK_MISRA=y variable in the examples instructs cppcheck to analyse for
+MISRA compliance, but when not specified, the report will contain just the
+static analysis.
+
+ * call the analysis-cppcheck make target to generate a report in text format:
+    make CPPCHECK_MISRA=y analysis-cppcheck
+ * call the analysis-cppcheck-html make target to generate a report in text and
+    html format:
+    make CPPCHECK_MISRA=y analysis-cppcheck-html
+
+In case the cppcheck binaries are not in the PATH, CPPCHECK and
+CPPCHECK_HTMLREPORT variables can be overridden with the full path to the
+binaries:
+
+make -C xen \
+   CPPCHECK=/path/to/cppcheck \
+   CPPCHECK_HTMLREPORT=/path/to/cppcheck-htmlreport \
+   CPPCHECK_MISRA=y \
+   analysis-cppcheck-html
+
+The text report is by default in a folder named cppcheck-report, but the name
+can be changed by passing it in the CPPCHECK_REPORT_OUTDIR variable.
+The html report is by default in a folder named cppcheck-htmlreport, but the
+name can be changed by passing it in the CPPCHECK_HTMLREPORT_OUTDIR variable.
 
 
 [1] https://sourceforge.net/p/cppcheck/discussion/general/thread/bfc3ab6c41/?limit=25
diff --git a/docs/misra/documenting-violations.rst b/docs/misra/documenting-violations.rst
index 3430abfaa177..f4f54a77d2a2 100644
--- a/docs/misra/documenting-violations.rst
+++ b/docs/misra/documenting-violations.rst
@@ -50,6 +50,7 @@ Here is an example to add a new justification in safe.json::
 |        {
 |            "id": "SAF-0-safe",
 |            "analyser": {
+|                "cppcheck": "misra-c2012-20.7",
 |                "coverity": "misra_c_2012_rule_20_7_violation",
 |                "eclair": "MC3R1.R20.7"
 |            },
@@ -100,9 +101,9 @@ Here an explanation of the field inside an object of the "content" array:
    It tells the tool to substitute a Xen in-code comment having this structure:
    /* SAF-0-safe [...] \*/
  - analyser: it is an object containing pair of key-value strings, the key is
-   the analyser, so it can be coverity or eclair, the value is the proprietary
-   id corresponding on the finding, for example when coverity is used as
-   analyser, the tool will translate the Xen in-code coment in this way:
+   the analyser, so it can be cppcheck, coverity or eclair, the value is the
+   proprietary id corresponding on the finding, for example when coverity is
+   used as analyser, the tool will translate the Xen in-code coment in this way:
    /* SAF-0-safe [...] \*/ -> /* coverity[misra_c_2012_rule_20_7_violation] \*/
    if the object doesn't have a key-value, then the corresponding in-code
    comment won't be translated.
diff --git a/docs/misra/false-positive-cppcheck.json b/docs/misra/false-positive-cppcheck.json
new file mode 100644
index 000000000000..0d8a8059d9cd
--- /dev/null
+++ b/docs/misra/false-positive-cppcheck.json
@@ -0,0 +1,12 @@
+{
+    "version": "1.0",
+    "content": [
+        {
+            "id": "SAF-0-false-positive-cppcheck",
+            "analyser": {},
+            "tool-version": "",
+            "name": "Sentinel",
+            "text": "Next ID to be used"
+        }
+    ]
+}
diff --git a/xen/Makefile b/xen/Makefile
index 3b8d1acd1697..e8a275e6d8a9 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -457,8 +457,8 @@ endif # need-config
 
 __all: build
 
-main-targets := build install uninstall clean distclean MAP cppcheck \
-    cppcheck-html analysis-coverity analysis-eclair
+main-targets := build install uninstall clean distclean MAP analysis-cppcheck \
+    analysis-cppcheck-html analysis-coverity analysis-eclair
 .PHONY: $(main-targets)
 ifneq ($(XEN_TARGET_ARCH),x86_32)
 $(main-targets): %: _% ;
@@ -567,18 +567,20 @@ _clean:
 	$(Q)$(MAKE) $(clean)=tools/kconfig
 	find . \( -name "*.o" -o -name ".*.d" -o -name ".*.d2" \
 		-o -name ".*.o.tmp" -o -name "*~" -o -name "core" \
-		-o -name '*.lex.c' -o -name '*.tab.[ch]' -o -name '*.c.cppcheck' \
-		-o -name "*.gcno" -o -name ".*.cmd" -o -name "lib.a" \) -exec rm -f {} \;
+		-o -name '*.lex.c' -o -name '*.tab.[ch]' -o -name '*.cppcheck' \
+		-o -name '*.cppcheck.txt' -o -name "*.gcno" -o -name ".*.cmd" \
+		-o -name "lib.a" -o -name '*.c.json' \) -exec rm -f {} \;
 	rm -f include/asm $(TARGET) $(TARGET).gz $(TARGET)-syms $(TARGET)-syms.map
 	rm -f $(TARGET).efi $(TARGET).efi.map $(TARGET).efi.stripped
 	rm -f asm-offsets.s arch/*/include/asm/asm-offsets.h
 	rm -f .banner .allconfig.tmp include/xen/compile.h
-	rm -f cppcheck-misra.* xen-cppcheck.xml *.sed
+	rm -f cppcheck-misra.* xen-cppcheck.xml suppression-list.txt *.sed
+	rm -rf $(CPPCHECK_BUILD_DIR)
 
 .PHONY: _distclean
 _distclean: clean
 	rm -f tags TAGS cscope.files cscope.in.out cscope.out cscope.po.out GTAGS GPATH GRTAGS GSYMS .config source
-	rm -rf $(CPPCHECK_HTMLREPORT_OUTDIR)
+	rm -rf $(CPPCHECK_HTMLREPORT_OUTDIR) $(CPPCHECK_REPORT_OUTDIR)
 
 $(TARGET).gz: $(TARGET)
 	gzip -n -f -9 < $< > $@.new
@@ -663,73 +665,50 @@ CPPCHECK ?= cppcheck
 # On recent distribution, this is available in the standard path.
 CPPCHECK_HTMLREPORT ?= cppcheck-htmlreport
 
-# By default we generate the report in cppcheck-htmlreport directory in the
+# By default we generate the html report in cppcheck-htmlreport directory in the
 # build directory. This can be changed by giving a directory in this variable.
 CPPCHECK_HTMLREPORT_OUTDIR ?= cppcheck-htmlreport
 
+# By default we generate the text report in cppcheck-report directory in the
+# build directory. This can be changed by giving a directory in this variable.
+CPPCHECK_REPORT_OUTDIR ?= cppcheck-report
+
 # By default we do not check misra rules, to enable pass "CPPCHECK_MISRA=y" to
 # make command line.
 CPPCHECK_MISRA ?= n
 
+CPPCHECK_BUILD_DIR := $(objtree)/build-dir-cppcheck
+
 # Compile flags to pass to cppcheck:
-# - include directories and defines Xen Makefile is passing (from CFLAGS)
 # - include config.h as this is passed directly to the compiler.
-# - define CPPCHECK as we use to disable or enable some specific part of the
+# - define CPPCHECK as we use it to disable or enable some specific part of the
 #   code to solve some cppcheck issues.
 # - explicitely enable some cppcheck checks as we do not want to use "all"
 #   which includes unusedFunction which gives wrong positives as we check file
 #   per file.
+# - Explicitly suppress warnings on compiler-def.h because cppcheck throws an
+#   unmatchedSuppression due to the rule we put in suppression-list.txt to skip
+#   every finding in the file.
 #
 # Compiler defines are in compiler-def.h which is included in config.h
 #
-CPPCHECKFLAGS := -DCPPCHECK --max-ctu-depth=10 \
-                 --enable=style,information,missingInclude \
-                 --include=$(srctree)/include/xen/config.h \
-                 -I $(srctree)/xsm/flask/include \
-                 -I $(srctree)/include/xen/libfdt \
-                 $(filter -D% -I%,$(CFLAGS))
-
-# We need to find all C files (as we are not checking assembly files) so
-# we find all generated .o files which have a .c corresponding file.
-CPPCHECKFILES := $(wildcard $(patsubst $(objtree)/%.o,$(srctree)/%.c, \
-                 $(filter-out $(objtree)/tools/%, \
-                 $(shell find $(objtree) -name "*.o"))))
-
-# Headers and files required to run cppcheck on a file
-CPPCHECKDEPS := $(objtree)/include/generated/autoconf.h \
-                $(objtree)/include/generated/compiler-def.h
+CPPCHECK_FLAGS := --cppcheck-build-dir=$(CPPCHECK_BUILD_DIR) \
+    --max-ctu-depth=10 \
+    --enable=style,information,missingInclude \
+    --template='{file}({line},{column}):{id}:{severity}:{message}' \
+    --relative-paths=$(srctree) \
+    --inline-suppr \
+    --suppressions-list=$(objtree)/suppression-list.txt \
+    --suppress='unmatchedSuppression:*generated/compiler-def.h' \
+    --include=$(srctree)/include/xen/config.h \
+    -DCPPCHECK
 
 ifeq ($(CPPCHECK_MISRA),y)
-    CPPCHECKFLAGS += --addon=cppcheck-misra.json
-    CPPCHECKDEPS += cppcheck-misra.json
-endif
-
-quiet_cmd_cppcheck_xml = CPPCHECK $(patsubst $(srctree)/%,%,$<)
-cmd_cppcheck_xml = $(CPPCHECK) -v -q --xml $(CPPCHECKFLAGS) \
-                   --output-file=$@ $<
-
-quiet_cmd_merge_cppcheck_reports = CPPCHECK-MERGE $@
-cmd_merge_cppcheck_reports = $(PYTHON) $(srctree)/tools/merge_cppcheck_reports.py $^ $@
-
-quiet_cmd_cppcheck_html = CPPCHECK-HTML $<
-cmd_cppcheck_html = $(CPPCHECK_HTMLREPORT) --file=$< --source-dir=$(srctree) \
-                    --report-dir=$(CPPCHECK_HTMLREPORT_OUTDIR) --title=Xen
-
-PHONY += _cppcheck _cppcheck-html cppcheck-version
-
-_cppcheck-html: xen-cppcheck.xml
-	$(call if_changed,cppcheck_html)
-
-_cppcheck: xen-cppcheck.xml
-
-xen-cppcheck.xml: $(patsubst $(srctree)/%.c,$(objtree)/%.c.cppcheck,$(CPPCHECKFILES))
-ifeq ($(CPPCHECKFILES),)
-	$(error Please build Xen before running cppcheck)
+CPPCHECK_FLAGS += --addon=cppcheck-misra.json
+CPPCHECK_BUILD_EXTRA_DEPS += cppcheck-misra.json
 endif
-	$(call if_changed,merge_cppcheck_reports)
 
-$(objtree)/%.c.cppcheck: $(srctree)/%.c $(CPPCHECKDEPS) | cppcheck-version
-	$(call if_changed,cppcheck_xml)
+PHONY += cppcheck-version
 
 cppcheck-version:
 	$(Q)if ! which $(CPPCHECK) > /dev/null 2>&1; then \
@@ -761,6 +740,11 @@ $(objtree)/include/generated/compiler-def.h:
 JUSTIFICATION_FILES := $(XEN_ROOT)/docs/misra/safe.json \
                        $(XEN_ROOT)/docs/misra/false-positive-$$*.json
 
+CPPCHECK_CC_FLAGS := --compiler=$(CC) \
+	--cppcheck-cmd=$(CPPCHECK) $(CPPCHECK_FLAGS) \
+	--cppcheck-plat=$(srctree)/tools/cppcheck-plat \
+	--ignore-path=tools/
+
 # The following command is using grep to find all files that contains a comment
 # containing "SAF-<anything>" on a single line.
 # %.safparse will be the original files saved from the build system, these files
@@ -789,8 +773,49 @@ analysis-parse-tags-%: $(PARSE_FILE_LIST) $(objtree)/%.sed
 		sed -i -f "$(objtree)/$*.sed" "$${file}"; \
 	done
 
-analysis-build-%: analysis-parse-tags-%
-	$(MAKE) O=$(abs_objtree) -f $(srctree)/Makefile build
+.SECONDEXPANSION:
+analysis-build-%: $$(ANALYSIS_BUILD_DEPS)
+	$(MAKE) O=$(abs_objtree) $(ANALYSIS_EXTRA_MAKE) -f $(srctree)/Makefile build
+
+$(CPPCHECK_BUILD_DIR) $(CPPCHECK_REPORT_OUTDIR) $(CPPCHECK_HTMLREPORT_OUTDIR):
+	$(Q)mkdir -p $@
+
+$(objtree)/suppression-list.txt: analysis-parse-tags-cppcheck
+	$(Q)$(srctree)/tools/cppcheck-build-suppr-list.sh --out-list=$@ \
+		--source-dir=$(abs_srctree)
+# Add this rule to skip every finding in the autogenerated header for cppcheck
+	$(Q)echo "*:*generated/compiler-def.h" >> $@
+
+build-cppcheck: ANALYSIS_EXTRA_MAKE += CC="$(srctree)/tools/cppcheck-cc.sh \
+	$(CPPCHECK_CC_FLAGS) $(CPPCHECK_CC_EXTRA_FLAGS) --"
+build-cppcheck: ANALYSIS_BUILD_DEPS = $(objtree)/suppression-list.txt \
+	$(CPPCHECK_BUILD_EXTRA_DEPS) $(CPPCHECK_BUILD_DIR) \
+	$(objtree)/include/generated/compiler-def.h
+
+build-cppcheck: analysis-build-cppcheck | cppcheck-version
+
+run-cppcheck: build-cppcheck $(CPPCHECK_REPORT_OUTDIR)
+	$(Q)$(srctree)/tools/cppcheck-txt-prepare.sh --frag-ext=.cppcheck.txt \
+		--rel-path=$(abs_srctree)/ \
+		--outfile=$(CPPCHECK_REPORT_OUTDIR)/xen-cppcheck.txt
+
+run-cppcheck-html: CPPCHECK_CC_EXTRA_FLAGS += --cppcheck-html
+
+run-cppcheck-html: run-cppcheck $(CPPCHECK_HTMLREPORT_OUTDIR)
+	$(Q)$(srctree)/tools/cppcheck-html-prepare.sh --frag-ext=.cppcheck \
+		--merge-tool=$(abs_srctree)/tools/merge_cppcheck_reports.py \
+		--source-dir=$(srctree) \
+		--outfile=$(CPPCHECK_HTMLREPORT_OUTDIR)/xen-cppcheck.xml
+	$(CPPCHECK_HTMLREPORT) \
+		--file=$(CPPCHECK_HTMLREPORT_OUTDIR)/xen-cppcheck.xml \
+		--source-dir=$(srctree) \
+		--report-dir=$(CPPCHECK_HTMLREPORT_OUTDIR)/html --title=Xen
+# Strip full build path from html report
+	$(Q)find $(CPPCHECK_HTMLREPORT_OUTDIR)/html -type f -name '*.html' \
+		-exec sed -i -re 's|$(abs_objtree)/||g' {} +
+# Strip full source path from html report
+	$(Q)find $(CPPCHECK_HTMLREPORT_OUTDIR)/html -type f -name '*.html' \
+		-exec sed -i -re 's|$(abs_srctree)/||g' {} +
 
 analysis-clean:
 # Reverts the original file (-p preserves also timestamp)
@@ -800,7 +825,13 @@ analysis-clean:
 		rm -f "$${file}"; \
 	done
 
-_analysis-%: analysis-build-%
+_analysis-coverity: ANALYSIS_BUILD_DEPS = analysis-parse-tags-coverity
+_analysis-eclair: ANALYSIS_BUILD_DEPS = analysis-parse-tags-eclair
+
+_analysis-coverity _analysis-eclair: _analysis-%: analysis-build-%
+	$(Q)$(MAKE) O=$(abs_objtree) -f $(srctree)/Makefile analysis-clean
+
+_analysis-cppcheck _analysis-cppcheck-html: _analysis-cppcheck%: run-cppcheck%
 	$(Q)$(MAKE) O=$(abs_objtree) -f $(srctree)/Makefile analysis-clean
 
 endif #config-build
diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
index 60cbeb18e4da..d9fbcffa9567 100644
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -60,6 +60,13 @@
  * are possible.
  */
 
+/*
+ * Cppcheck thinks this file needs to be analysed because it is preprocessed by
+ * the compiler, but it gets confused because this file does not contains C
+ * code. Hence protect the code when CPPCHECK is used.
+ */
+#ifndef CPPCHECK
+
 #ifdef CONFIG_HVM
 #define PREFIX_hvm hvm
 #else
@@ -283,3 +290,5 @@ mca                                do       do       -        -        -
 #ifndef CONFIG_PV_SHIM_EXCLUSIVE
 paging_domctl_cont                 do       do       do       do       -
 #endif
+
+#endif /* !CPPCHECK */
diff --git a/xen/tools/cppcheck-build-suppr-list.sh b/xen/tools/cppcheck-build-suppr-list.sh
new file mode 100755
index 000000000000..637ec3ce8d70
--- /dev/null
+++ b/xen/tools/cppcheck-build-suppr-list.sh
@@ -0,0 +1,81 @@
+#!/usr/bin/env bash
+
+set -e
+
+function help() {
+    cat <<EOF
+Usage: ${0} [OPTION] ...
+
+This script builds a suppression list file for cppcheck, it checks which header
+files has in-code comment like /* cppcheck-suppress ... */ and adds a
+suppression rule to the list like this:
+
+[error id]:[filename]:[line]
+
+This list is created to overcome a problem where in-code suppression comment are
+not used when they are in header files, c files in-code comments works as
+expected.
+
+Options:
+  --out-list=    Use this compiler for the build
+  --source-dir=  The base source dir where to find the headers
+  -h, --help     Print this help
+EOF
+}
+
+OUT_LIST=""
+SOURCE_DIR=""
+
+for OPTION in "$@"
+do
+    case ${OPTION} in
+        -h|--help)
+            help
+            exit 0
+            ;;
+        --out-list=*)
+            OUT_LIST="$(eval echo "${OPTION#*=}")"
+            ;;
+        --source-dir=*)
+            SOURCE_DIR="$(eval echo "${OPTION#*=}")"
+            ;;
+        *)
+            echo "Invalid option ${OPTION}"
+            exit 1
+            ;;
+    esac
+done
+
+rm -f "${OUT_LIST}"
+touch "${OUT_LIST}"
+
+while IFS= read -r entry; do
+    file=$(realpath "$(echo "${entry}" | cut -d':' -f1)")
+    line=$(echo "${entry}" | cut -d':' -f2)
+    cppcheck_id=$(echo "${entry}" | cut -d':' -f3 | \
+        sed -nre 's,\/\* cppcheck-suppress\[(.*)\] \*\/,\1,p')
+    # Expected code line is maximum 19 lines from the in-code comment
+    bound=20
+
+    # Adjust line number to be the next non-empty line that don't contains a
+    # comment
+    while [ ${bound} -gt 0 ]; do
+        line=$(( line + 1 ))
+        line_content=$(sed "${line}q;d" "${file}")
+        if [ ! "${line_content}" = "" ] && [[ ! ${line_content} == *"/*"* ]]
+        then
+            break
+        fi
+        bound=$(( bound - 1 ))
+    done
+
+    if [ ${bound} -eq 0 ]
+    then
+        echo "Please check if finding at '${entry}' is valid."
+        exit 1
+    fi
+
+    echo "${cppcheck_id}:${file}:${line}" >> "${OUT_LIST}"
+
+done < <(grep -ERn '^[[:blank:]]*\/\*[[:space:]]+cppcheck-suppress.*\*\/$' \
+            "${SOURCE_DIR}" | grep -E '.*\.h')
diff --git a/xen/tools/cppcheck-cc.sh b/xen/tools/cppcheck-cc.sh
new file mode 100755
index 000000000000..45a9f749f8c7
--- /dev/null
+++ b/xen/tools/cppcheck-cc.sh
@@ -0,0 +1,223 @@
+#!/usr/bin/env bash
+
+set -e
+
+function help() {
+    cat <<EOF
+Usage: ${0} [OPTION] ... -- <compiler arguments>
+
+This script is a wrapper for cppcheck that enables it to analyse the files that
+are the target for the build, it is used in place of a selected compiler and the
+make process will run it on every file that needs to be built.
+All the arguments passed to the original compiler are forwarded to it without
+modification, furthermore, they are used to improve the cppcheck analysis.
+
+Options:
+  --compiler=       Use this compiler for the build
+  --cppcheck-cmd=   Command line for the cppcheck analysis.
+  --cppcheck-html   Prepare for cppcheck HTML output
+  --cppcheck-plat=  Path to the cppcheck platform folder
+  --ignore-path=    This script won't run cppcheck on the files having this
+                    path, the compiler will run anyway on them. This argument
+                    can be specified multiple times.
+  -h, --help        Print this help
+EOF
+}
+
+CC_FILE=""
+COMPILER=""
+CPPCHECK_HTML="n"
+CPPCHECK_PLAT_PATH=""
+CPPCHECK_TOOL=""
+CPPCHECK_TOOL_ARGS=""
+FORWARD_FLAGS=""
+IGNORE_PATH="n"
+IGNORE_PATH_LIST=""
+JDB_FILE=""
+OBJTREE_PATH=""
+
+# Variable used for arg parsing
+forward_to_cc="n"
+sm_tool_args="n"
+obj_arg_content="n"
+
+for OPTION in "$@"
+do
+    if [ "${forward_to_cc}" = "y" ]; then
+        if [[ ${OPTION} == *.c ]]
+        then
+            CC_FILE="${OPTION}"
+        elif [ "${OPTION}" = "-o" ]
+        then
+            # After -o there is the path to the obj file, flag it
+            obj_arg_content="y"
+        elif [ "${obj_arg_content}" = "y" ]
+        then
+            # This must be the path to the obj file, turn off flag and save path
+            OBJTREE_PATH="$(dirname "${OPTION}")"
+            obj_arg_content="n"
+        fi
+        # Forward any argument to the compiler
+        FORWARD_FLAGS="${FORWARD_FLAGS} ${OPTION}"
+        continue
+    fi
+    case ${OPTION} in
+        -h|--help)
+            help
+            exit 0
+            ;;
+        --compiler=*)
+            COMPILER="$(eval echo "${OPTION#*=}")"
+            sm_tool_args="n"
+            ;;
+        --cppcheck-cmd=*)
+            CPPCHECK_TOOL="$(eval echo "${OPTION#*=}")"
+            sm_tool_args="y"
+            ;;
+        --cppcheck-html)
+            CPPCHECK_HTML="y"
+            sm_tool_args="n"
+            ;;
+        --cppcheck-plat=*)
+            CPPCHECK_PLAT_PATH="$(eval echo "${OPTION#*=}")"
+            sm_tool_args="n"
+            ;;
+        --ignore-path=*)
+            IGNORE_PATH_LIST="${IGNORE_PATH_LIST} $(eval echo "${OPTION#*=}")"
+            sm_tool_args="n"
+            ;;
+        --)
+            forward_to_cc="y"
+            sm_tool_args="n"
+            ;;
+        *)
+            if [ "${sm_tool_args}" = "y" ]; then
+                CPPCHECK_TOOL_ARGS="${CPPCHECK_TOOL_ARGS} ${OPTION}"
+            else
+                echo "Invalid option ${OPTION}"
+                exit 1
+            fi
+            ;;
+    esac
+done
+
+if [ "${COMPILER}" = "" ]
+then
+    echo "--compiler arg is mandatory."
+    exit 1
+fi
+
+function print_file() {
+    local text="${1}"
+    local init_file="${2}"
+
+    if [ "${init_file}" = "y" ]
+    then
+        echo -e -n "${text}" > "${JDB_FILE}"
+    else
+        echo -e -n "${text}" >> "${JDB_FILE}"
+    fi
+}
+
+function create_jcd() {
+    local line="${1}"
+    local arg_num=0
+    local same_line=0
+
+    print_file "[\n" "y"
+    print_file "    {\n"
+    print_file "        \"arguments\": [\n"
+
+    for arg in ${line}; do
+        # This code prevents to put comma in the last element of the list or on
+        # sequential lines that are going to be merged
+        [ "${arg_num}" -ne 0 ] && [ "${same_line}" -eq 0 ] && print_file ",\n"
+        if [ "${same_line}" -ne 0 ]
+        then
+            print_file "${arg}\""
+            same_line=0
+        elif [ "${arg}" = "-iquote" ] || [ "${arg}" = "-I" ]
+        then
+            # cppcheck doesn't understand -iquote, substitute with -I
+            print_file "            \"-I"
+            same_line=1
+        else
+            print_file "            \"${arg}\""
+        fi
+        arg_num=$(( arg_num + 1 ))
+    done
+    print_file "\n"
+    print_file "        ],\n"
+    print_file "        \"directory\": \"$(pwd -P)\",\n"
+    print_file "        \"file\": \"${CC_FILE}\"\n"
+    print_file "    }\n"
+    print_file "]\n"
+}
+
+
+# Execute compiler with forwarded flags
+# Shellcheck complains about missing quotes on FORWARD_FLAGS, but they can't be
+# used here
+# shellcheck disable=SC2086
+${COMPILER} ${FORWARD_FLAGS}
+
+if [ -n "${CC_FILE}" ];
+then
+    for path in ${IGNORE_PATH_LIST}
+    do
+        if [[ ${CC_FILE} == *${path}* ]]
+        then
+            IGNORE_PATH="y"
+            echo "${0}: ${CC_FILE} ignored by --ignore-path matching *${path}*"
+        fi
+    done
+    if [ "${IGNORE_PATH}" = "n" ]
+    then
+        JDB_FILE="${OBJTREE_PATH}/$(basename "${CC_FILE}".json)"
+
+        # Prepare the Json Compilation Database for the file
+        create_jcd "${COMPILER} ${FORWARD_FLAGS}"
+
+        out_file="${OBJTREE_PATH}/$(basename "${CC_FILE%.c}".cppcheck.txt)"
+
+        # Check wchar size
+        wchar_plat_suffix="t4"
+        # sed prints the last occurence of -f(no-)short-wchar which is the one
+        # applied to the file by the compiler
+        wchar_option=$(echo "${FORWARD_FLAGS}" | \
+            sed -nre 's,.*(-f(no-)?short-wchar).*,\1,p')
+        if [ "${wchar_option}" = "-fshort-wchar" ]
+        then
+            wchar_plat_suffix="t2"
+        fi
+
+        # Select the right target platform, ARCH is generated from Xen Makefile
+        platform="${CPPCHECK_PLAT_PATH}/${ARCH}-wchar_${wchar_plat_suffix}.xml"
+        if [ ! -f "${platform}" ]
+        then
+            echo "${platform} not found!"
+            exit 1
+        fi
+
+        # Shellcheck complains about missing quotes on CPPCHECK_TOOL_ARGS, but
+        # they can't be used here
+        # shellcheck disable=SC2086
+        ${CPPCHECK_TOOL} ${CPPCHECK_TOOL_ARGS} \
+            --project="${JDB_FILE}" \
+            --output-file="${out_file}" \
+            --platform=${platform}
+
+        if [ "${CPPCHECK_HTML}" = "y" ]
+        then
+            # Shellcheck complains about missing quotes on CPPCHECK_TOOL_ARGS,
+            # but they can't be used here
+            # shellcheck disable=SC2086
+            ${CPPCHECK_TOOL} ${CPPCHECK_TOOL_ARGS} \
+                --project="${JDB_FILE}" \
+                --output-file="${out_file%.txt}" \
+                --platform=${platform} \
+                -q \
+                --xml
+        fi
+    fi
+fi
diff --git a/xen/tools/cppcheck-html-prepare.sh b/xen/tools/cppcheck-html-prepare.sh
new file mode 100755
index 000000000000..c889dcc3582c
--- /dev/null
+++ b/xen/tools/cppcheck-html-prepare.sh
@@ -0,0 +1,110 @@
+#!/usr/bin/env bash
+
+set -e
+
+function help() {
+    cat <<EOF
+Usage: ${0} [OPTION] ...
+
+This script collects all the cppcheck xml report fragment to create one report.
+
+Options:
+  --frag-ext=    Extension of the report fragment to be collected
+  --merge-tool=  Tool used to merge the xml fragments
+  --outfile=     Path and filename for the text report to be generated
+  -h, --help     Print this help
+EOF
+}
+
+FRAG_EXT=""
+MERGE_TOOL=""
+OUTFILE=""
+SRCTREE=""
+
+for OPTION in "$@"
+do
+    case ${OPTION} in
+        -h|--help)
+            help
+            exit 0
+            ;;
+        --frag-ext=*)
+            FRAG_EXT="$(eval echo "${OPTION#*=}")"
+            ;;
+        --merge-tool=*)
+            MERGE_TOOL="$(eval echo "${OPTION#*=}")"
+            ;;
+        --outfile=*)
+            OUTFILE="$(eval echo "${OPTION#*=}")"
+            ;;
+        --source-dir=*)
+            SRCTREE="$(eval echo "${OPTION#*=}")"
+            ;;
+        *)
+            echo "Invalid option ${OPTION}"
+            exit 1
+            ;;
+    esac
+done
+
+if [ "${FRAG_EXT}" = "" ]
+then
+    echo "Please provide --frag-ext argument"
+    exit 1
+fi
+
+if [ "${MERGE_TOOL}" = "" ]
+then
+    echo "Please provide --merge-tool argument"
+    exit 1
+fi
+
+if [ "${OUTFILE}" = "" ]
+then
+    echo "Please provide --outfile argument"
+    exit 1
+fi
+
+if [ "${SRCTREE}" = "" ]
+then
+    echo "Please provide --source-dir argument"
+    exit 1
+fi
+
+rm -f "${OUTFILE}"
+
+XML_PARAM_LIST=""
+FILE_LIST=$(find . -name "*${FRAG_EXT}" -print)
+
+for file in ${FILE_LIST}
+do
+    XML_PARAM_LIST="${XML_PARAM_LIST} ${file}"
+
+done
+
+if [ -n "${XML_PARAM_LIST}" ]
+then
+    # Shellcheck complains about using quotes on XML_PARAM_LIST, but it can't
+    # work with them, disable this finding
+    # shellcheck disable=SC2086
+    ${MERGE_TOOL} ${XML_PARAM_LIST} "${OUTFILE}"
+fi
+
+# Retrieve all path to .h and .c from the xml file
+PATHLIST_IN_FILE=$(sed -nre 's/^.*"(.*.[ch])".*$/\1/p' "${OUTFILE}")
+
+# Some path are relative to the source tree but some others are generated
+# in the obj tree, for cppcheck when using cppcheck-htmlreport we can pass
+# only one source tree where the files will be fetched if relative path are
+# found. So for every path that does not exists in src tree, we guess it
+# comes from obj tree and we put explicit absolute path to it
+for path in ${PATHLIST_IN_FILE}
+do
+    # If path is not absolute and it doesn't exists in srctree, but it exists in
+    # objtree, then modify the path to use obj tree
+    if [[ ! ${path} == /* ]] && [ ! -f "${SRCTREE}/${path}" ] \
+        && [ -f "$(pwd -P)/${path}" ]
+    then
+        sed -i -re "s|\"(${path})\"|\"$(pwd -P)/\1\"|g" "${OUTFILE}"
+    fi
+done
diff --git a/xen/tools/cppcheck-plat/arm32-wchar_t4.xml b/xen/tools/cppcheck-plat/arm32-wchar_t4.xml
new file mode 100644
index 000000000000..3aefa7ba5c98
--- /dev/null
+++ b/xen/tools/cppcheck-plat/arm32-wchar_t4.xml
@@ -0,0 +1,17 @@
+<?xml version="1.0"?>
+<platform>
+  <char_bit>8</char_bit>
+  <default-sign>unsigned</default-sign>
+  <sizeof>
+    <short>2</short>
+    <int>4</int>
+    <long>4</long>
+    <long-long>8</long-long>
+    <float>4</float>
+    <double>8</double>
+    <long-double>8</long-double>
+    <pointer>4</pointer>
+    <size_t>4</size_t>
+    <wchar_t>4</wchar_t>
+  </sizeof>
+</platform>
diff --git a/xen/tools/cppcheck-plat/arm64-wchar_t2.xml b/xen/tools/cppcheck-plat/arm64-wchar_t2.xml
new file mode 100644
index 000000000000..e345b934a986
--- /dev/null
+++ b/xen/tools/cppcheck-plat/arm64-wchar_t2.xml
@@ -0,0 +1,17 @@
+<?xml version="1.0"?>
+<platform>
+  <char_bit>8</char_bit>
+  <default-sign>unsigned</default-sign>
+  <sizeof>
+    <short>2</short>
+    <int>4</int>
+    <long>8</long>
+    <long-long>8</long-long>
+    <float>4</float>
+    <double>8</double>
+    <long-double>16</long-double>
+    <pointer>8</pointer>
+    <size_t>4</size_t>
+    <wchar_t>2</wchar_t>
+  </sizeof>
+</platform>
diff --git a/xen/tools/cppcheck-plat/arm64-wchar_t4.xml b/xen/tools/cppcheck-plat/arm64-wchar_t4.xml
new file mode 100644
index 000000000000..952b3640c91d
--- /dev/null
+++ b/xen/tools/cppcheck-plat/arm64-wchar_t4.xml
@@ -0,0 +1,17 @@
+<?xml version="1.0"?>
+<platform>
+  <char_bit>8</char_bit>
+  <default-sign>unsigned</default-sign>
+  <sizeof>
+    <short>2</short>
+    <int>4</int>
+    <long>8</long>
+    <long-long>8</long-long>
+    <float>4</float>
+    <double>8</double>
+    <long-double>16</long-double>
+    <pointer>8</pointer>
+    <size_t>4</size_t>
+    <wchar_t>4</wchar_t>
+  </sizeof>
+</platform>
diff --git a/xen/tools/cppcheck-plat/x86_64-wchar_t2.xml b/xen/tools/cppcheck-plat/x86_64-wchar_t2.xml
new file mode 100644
index 000000000000..b2dc2fb2cc50
--- /dev/null
+++ b/xen/tools/cppcheck-plat/x86_64-wchar_t2.xml
@@ -0,0 +1,17 @@
+<?xml version="1.0"?>
+<platform>
+  <char_bit>8</char_bit>
+  <default-sign>unsigned</default-sign>
+  <sizeof>
+    <short>2</short>
+    <int>4</int>
+    <long>8</long>
+    <long-long>8</long-long>
+    <float>4</float>
+    <double>8</double>
+    <long-double>16</long-double>
+    <pointer>8</pointer>
+    <size_t>8</size_t>
+    <wchar_t>2</wchar_t>
+  </sizeof>
+</platform>
diff --git a/xen/tools/cppcheck-plat/x86_64-wchar_t4.xml b/xen/tools/cppcheck-plat/x86_64-wchar_t4.xml
new file mode 100644
index 000000000000..21d97b611505
--- /dev/null
+++ b/xen/tools/cppcheck-plat/x86_64-wchar_t4.xml
@@ -0,0 +1,17 @@
+<?xml version="1.0"?>
+<platform>
+  <char_bit>8</char_bit>
+  <default-sign>unsigned</default-sign>
+  <sizeof>
+    <short>2</short>
+    <int>4</int>
+    <long>8</long>
+    <long-long>8</long-long>
+    <float>4</float>
+    <double>8</double>
+    <long-double>16</long-double>
+    <pointer>8</pointer>
+    <size_t>8</size_t>
+    <wchar_t>4</wchar_t>
+  </sizeof>
+</platform>
diff --git a/xen/tools/cppcheck-txt-prepare.sh b/xen/tools/cppcheck-txt-prepare.sh
new file mode 100755
index 000000000000..a3fbaa150111
--- /dev/null
+++ b/xen/tools/cppcheck-txt-prepare.sh
@@ -0,0 +1,74 @@
+#!/usr/bin/env bash
+
+function help() {
+    cat <<EOF
+Usage: ${0} [OPTION] ...
+
+This script collects all the cppcheck text report fragment to create one report.
+
+Options:
+  --frag-ext=  Extension of the report fragment to be collected
+  --outfile=   Path and filename for the text report to be generated
+  --rel-path=  Path to be removed from the path of the file in the report
+  -h, --help   Print this help
+EOF
+}
+
+FRAG_EXT=""
+OUTFILE=""
+RELPATH=""
+
+for OPTION in "$@"
+do
+    case ${OPTION} in
+        -h|--help)
+            help
+            exit 0
+            ;;
+        --frag-ext=*)
+            FRAG_EXT="$(eval echo "${OPTION#*=}")"
+            ;;
+        --outfile=*)
+            OUTFILE="$(eval echo "${OPTION#*=}")"
+            ;;
+        --rel-path=*)
+            RELPATH="$(eval echo "${OPTION#*=}")"
+            ;;
+        *)
+            echo "Invalid option ${OPTION}"
+            exit 1
+            ;;
+    esac
+done
+
+if [ "${FRAG_EXT}" = "" ]
+then
+    echo "Please provide --frag-ext argument"
+    exit 1
+fi
+
+if [ "${OUTFILE}" = "" ]
+then
+    echo "Please provide --outfile argument"
+    exit 1
+fi
+
+rm -f "${OUTFILE}"
+
+FILE_LIST=$(find . -name "*${FRAG_EXT}" -print)
+
+for file in ${FILE_LIST}
+do
+    cat "${file}" >> "${OUTFILE}"
+done
+
+# Remove duplicates, some awk implementation doesn't have inplace change mode
+mv "${OUTFILE}" "${OUTFILE}_tmp"
+awk '/^\s*?$/||!seen[$0]++' "${OUTFILE}_tmp" > "${OUTFILE}"
+rm "${OUTFILE}_tmp"
+
+if [ -n "${RELPATH}" ]
+then
+    # Strip path
+    sed -i -re "s|${RELPATH}||g" "${OUTFILE}"
+fi
-- 
2.17.1


