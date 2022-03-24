Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0C84E620F
	for <lists+xen-devel@lfdr.de>; Thu, 24 Mar 2022 12:04:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294242.500214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXLGV-0005wS-Pc; Thu, 24 Mar 2022 11:04:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294242.500214; Thu, 24 Mar 2022 11:04:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXLGV-0005tp-Mk; Thu, 24 Mar 2022 11:04:27 +0000
Received: by outflank-mailman (input) for mailman id 294242;
 Thu, 24 Mar 2022 11:04:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eW/x=UD=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1nXLGU-0005tj-2Z
 for xen-devel@lists.xenproject.org; Thu, 24 Mar 2022 11:04:26 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 2a1bef4c-ab62-11ec-8fbc-03012f2f19d4;
 Thu, 24 Mar 2022 12:04:24 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D07FF1515;
 Thu, 24 Mar 2022 04:04:23 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 859B23F73D;
 Thu, 24 Mar 2022 04:04:22 -0700 (PDT)
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
X-Inumbo-ID: 2a1bef4c-ab62-11ec-8fbc-03012f2f19d4
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Michal Orzel <michal.orzel@arm.com>
Subject: [RFC PATCH] xen/build: Add cppcheck and cppcheck-html make rules
Date: Thu, 24 Mar 2022 11:04:08 +0000
Message-Id: <77c79e86050eef2b706ee11e64183d57a0f5bcee.1648119732.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cppcheck can be used to check Xen code quality.

To create a report do "make cppcheck" on a built tree adding any options
you added during the process you used to build xen (like CROSS_COMPILE
or XEN_TARGET_ARCH). This will generate an xml report xen-cppcheck.xml.

To create a html report do "make cppcheck-html" in the same way and a
full report to be seen in a browser will be generated in
cppcheck-htmlreport/index.html.

For better results it is recommended to build your own cppcheck from the
latest sources that you can find at [1].
Development and result analysis has been done with cppcheck 2.7.

The Makefile rule is searching for all C files which have been compiled
(ie which have a generated .o file) and is running cppcheck on all of
them using the current configuration of xen so only the code actually
compiled is checked.

A new tool is introduced to merge all cppcheck reports into one global
report including all findings and removing duplicates.

Some extra variables can be used to customize the report:
- CPPCHECK can be used to give the full path to the cppcheck binary to
use (default is to use the one from the standard path).
- CPPCHECK_HTMLREPORT can be used to give the full path to
cppcheck-htmlreport (default is to use the one from the standard path).

This has been tested on several arm configurations (x86 should work but
has not been tested).

[1] https://cppcheck.sourceforge.io/

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 .gitignore                           |  3 ++
 xen/Makefile                         | 75 +++++++++++++++++++++++++++-
 xen/arch/arm/include/asm/processor.h |  4 +-
 xen/include/xen/config.h             |  4 ++
 xen/include/xen/kconfig.h            |  5 ++
 xen/tools/merge_cppcheck_reports.py  | 73 +++++++++++++++++++++++++++
 6 files changed, 161 insertions(+), 3 deletions(-)
 create mode 100755 xen/tools/merge_cppcheck_reports.py

diff --git a/.gitignore b/.gitignore
index d425be4bd9..0d2d60b8f1 100644
--- a/.gitignore
+++ b/.gitignore
@@ -7,6 +7,7 @@
 *.o
 *.d
 *.d2
+*.c.cppcheck
 *.opic
 *.a
 *.so
@@ -296,6 +297,7 @@ xen/.banner
 xen/.config
 xen/.config.old
 xen/.xen.elf32
+xen/xen-cppcheck.xml
 xen/System.map
 xen/arch/x86/boot/mkelf32
 xen/arch/x86/boot/cmdline.S
@@ -316,6 +318,7 @@ xen/arch/*/efi/runtime.c
 xen/arch/*/include/asm/asm-offsets.h
 xen/common/config_data.S
 xen/common/config.gz
+xen/cppcheck-htmlreport
 xen/include/headers*.chk
 xen/include/compat/*
 xen/include/config/
diff --git a/xen/Makefile b/xen/Makefile
index 18a4f7e101..0280d65051 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -336,7 +336,7 @@ export CFLAGS_UBSAN
 
 endif # need-config
 
-main-targets := build install uninstall clean distclean MAP
+main-targets := build install uninstall clean distclean MAP cppcheck cppcheck-html
 .PHONY: $(main-targets)
 ifneq ($(XEN_TARGET_ARCH),x86_32)
 $(main-targets): %: _% ;
@@ -424,15 +424,17 @@ _clean:
 	$(Q)$(MAKE) $(clean)=tools/kconfig
 	find . \( -name "*.o" -o -name ".*.d" -o -name ".*.d2" \
 		-o -name ".*.o.tmp" -o -name "*~" -o -name "core" \
-		-o -name '*.lex.c' -o -name '*.tab.[ch]' \
+		-o -name '*.lex.c' -o -name '*.tab.[ch]' -o -name '*.c.cppcheck' \
 		-o -name "*.gcno" -o -name ".*.cmd" -o -name "lib.a" \) -exec rm -f {} \;
 	rm -f include/asm $(TARGET) $(TARGET).gz $(TARGET).efi $(TARGET).efi.map $(TARGET)-syms $(TARGET)-syms.map
 	rm -f asm-offsets.s arch/*/include/asm/asm-offsets.h
 	rm -f .banner .allconfig.tmp include/xen/compile.h
+	rm -f xen-cppcheck.xml
 
 .PHONY: _distclean
 _distclean: clean
 	rm -f tags TAGS cscope.files cscope.in.out cscope.out cscope.po.out GTAGS GPATH GRTAGS GSYMS .config
+	rm -rf $(CPPCHECK_HTMLREPORT_OUTDIR)
 
 $(TARGET).gz: $(TARGET)
 	gzip -n -f -9 < $< > $@.new
@@ -511,6 +513,75 @@ cloc:
 	    done; \
 	done | cloc --list-file=-
 
+# What cppcheck command to use.
+# To get proper results, it is recommended to build cppcheck manually from the
+# latest source and use CPPCHECK to give the full path to the built version.
+CPPCHECK ?= cppcheck
+
+# What cppcheck-htmlreport to use.
+# If you give the full path to a self compiled cppcheck, this should be set
+# to the full path to cppcheck-html in the htmlreport directory of cppcheck.
+# On recent distribution, this is available in the standard path.
+CPPCHECK_HTMLREPORT ?= cppcheck-htmlreport
+
+# By default we generate the report in cppcheck-htmlreport directory in the
+# build directory. This can be changed by giving a directory in this variable.
+CPPCHECK_HTMLREPORT_OUTDIR ?= cppcheck-htmlreport
+
+# Compile flags to pass to cppcheck:
+# - include directories and defines Xen Makefile is passing (from CFLAGS)
+# - include config.h as this is passed directly to the compiler.
+# - define CPPCHECK as we use to disable or enable some specific part of the
+#   code to solve some cppcheck issues.
+# - explicitely enable some cppcheck checks as we do not want to use "all"
+#   which includes unusedFunction which gives wrong positives as we check file
+#   per file.
+#
+# Compiler defines are in compiler-def.h which is included in config.h
+#
+CPPCHECKFLAGS := -DCPPCHECK --max-ctu-depth=10 \
+				 --enable=style,information,missingInclude \
+				 --include=$(BASEDIR)/include/xen/config.h \
+				 -I $(BASEDIR)/xsm/flask/include \
+				 -I $(BASEDIR)/include/xen/libfdt \
+				 $(filter -D% -I%,$(CFLAGS))
+
+# We need to find all C files (as we are not checking assembly files) so
+# we find all generated .o files which have a .c corresponding file.
+CPPCHECKFILES := $(wildcard $(patsubst %.o,%.c, $(filter-out $(BASEDIR)/tools/%,$(shell find $(BASEDIR) -name "*.o"))))
+
+quiet_cmd_cppcheck_xml = CPPCHECK $(patsubst $(BASEDIR)/%,%,$<)
+cmd_cppcheck_xml = $(CPPCHECK) -v -q --xml $(CPPCHECKFLAGS) \
+				               --output-file=$@ $<
+
+quiet_cmd_merge_cppcheck_reports = CPPCHECK-MERGE $@
+cmd_merge_cppcheck_reports = $(BASEDIR)/tools/merge_cppcheck_reports.py $^ $@
+
+quiet_cmd_cppcheck_html = CPPCHECK-HTML $<
+cmd_cppcheck_html = $(CPPCHECK_HTMLREPORT) --file=$< --source-dir=$(BASEDIR) \
+										   --report-dir=$(CPPCHECK_HTMLREPORT_OUTDIR) \
+										   --title=Xen
+
+PHONY += _cppcheck _cppcheck-html
+
+_cppcheck-html: xen-cppcheck.xml
+	$(call if_changed,cppcheck_html)
+
+_cppcheck: xen-cppcheck.xml
+
+xen-cppcheck.xml: $(patsubst %.c,%.c.cppcheck,$(CPPCHECKFILES))
+ifeq ($(CPPCHECKFILES),)
+	$(error Please build Xen before running cppcheck)
+endif
+	$(call if_changed,merge_cppcheck_reports)
+
+%.c.cppcheck: %.c $(BASEDIR)/include/generated/autoconf.h $(BASEDIR)/include/generated/compiler-def.h
+	$(call if_changed,cppcheck_xml)
+
+# Put this in generated headers this way it is cleaned by include/Makefile
+$(BASEDIR)/include/generated/compiler-def.h:
+	$(Q)$(CC) -dM -E -o $@ - < /dev/null
+
 endif #config-build
 
 PHONY += FORCE
diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index 852b5f3c24..0b4ba73760 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -219,9 +219,11 @@
                          SCTLR_Axx_ELx_A    | SCTLR_Axx_ELx_C   |\
                          SCTLR_Axx_ELx_WXN  | SCTLR_Axx_ELx_EE)
 
-#if (SCTLR_EL2_SET ^ SCTLR_EL2_CLEAR) != 0xffffffffffffffffUL
+#ifndef CPPCHECK
+#if (SCTLR_EL2_SET ^ SCTLR_EL2_CLEAR) != 0xffffffffffffffffULL
 #error "Inconsistent SCTLR_EL2 set/clear bits"
 #endif
+#endif
 
 #endif
 
diff --git a/xen/include/xen/config.h b/xen/include/xen/config.h
index b76222ecf6..36e11e7133 100644
--- a/xen/include/xen/config.h
+++ b/xen/include/xen/config.h
@@ -7,6 +7,10 @@
 #ifndef __XEN_CONFIG_H__
 #define __XEN_CONFIG_H__
 
+#ifdef CPPCHECK
+#include <generated/compiler-def.h>
+#endif
+
 #include <xen/kconfig.h>
 
 #ifndef __ASSEMBLY__
diff --git a/xen/include/xen/kconfig.h b/xen/include/xen/kconfig.h
index 4d58c5bb3c..a717b0819c 100644
--- a/xen/include/xen/kconfig.h
+++ b/xen/include/xen/kconfig.h
@@ -8,6 +8,10 @@
  * these only work with boolean option.
  */
 
+/* cppcheck is failing to parse the macro so use a dummy one */
+#ifdef CPPCHECK
+#define IS_ENABLED(option) option
+#else
 /*
  * Getting something that works in C and CPP for an arg that may or may
  * not be defined is tricky.  Here, if we have "#define CONFIG_BOOGER 1"
@@ -27,5 +31,6 @@
  * otherwise.
  */
 #define IS_ENABLED(option) config_enabled(option)
+#endif
 
 #endif /* __XEN_KCONFIG_H */
diff --git a/xen/tools/merge_cppcheck_reports.py b/xen/tools/merge_cppcheck_reports.py
new file mode 100755
index 0000000000..ef055f6925
--- /dev/null
+++ b/xen/tools/merge_cppcheck_reports.py
@@ -0,0 +1,73 @@
+#!/usr/bin/env python
+
+"""
+This script acts as a tool to merge XML files created by cppcheck.
+Usage:
+    merge_cppcheck_reports.py [FILES] [OUTPUT]
+
+    FILES  - list of XML files with extension .cppcheck
+    OUTPUT - file to store results (with .xml extension).
+             If not specified, the script will print results to stdout.
+"""
+
+import sys
+from xml.etree import ElementTree
+
+def elements_equal(el1, el2):
+    if type(el1) != type(el2): return False
+
+    el1_location = str(el1.find('location').attrib)
+    el2_location = str(el2.find('location').attrib)
+
+    if el1_location != el2_location: return False
+
+    return True
+
+def remove_duplicates(xml_root_element):
+    elems_to_remove = []
+    index = 0
+    elems_list = list(xml_root_element.findall("errors")[0])
+    for elem1 in elems_list:
+        index += 1
+        for elem2 in elems_list[index:]:
+            if elements_equal(elem1, elem2) and elem2 not in elems_to_remove:
+                elems_to_remove.append(elem2)
+                continue
+
+    for elem in elems_to_remove:
+        xml_root_element.findall("errors")[0].remove(elem)
+
+def merge(files):
+    result_xml_root = None
+    for xml_file in files:
+        xml_root = ElementTree.parse(xml_file).getroot()
+        for xml_error_elem in xml_root.iter('errors'):
+            if result_xml_root is None:
+                result_xml_root = xml_root
+                insert_point = result_xml_root.findall("errors")[0]
+            else:
+                insert_point.extend(xml_error_elem)
+
+    return result_xml_root
+
+def run():
+    files = []
+    output = None
+    for i in sys.argv[1:]:
+        output = i if '.xml' in i else None
+        files.append(i) if '.cppcheck' in i else None
+
+    result = merge(files)
+
+    if result is None:
+        return
+
+    remove_duplicates(result)
+
+    if output is not None:
+        ElementTree.ElementTree(result).write(output)
+    else:
+        print(ElementTree.tostring(result).decode('utf-8'))
+
+if __name__ == '__main__':
+    run()
-- 
2.25.1


