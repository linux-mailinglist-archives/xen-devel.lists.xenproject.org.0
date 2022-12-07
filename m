Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5595D645A69
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 14:07:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456302.714098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2u8x-0004yd-6A; Wed, 07 Dec 2022 13:07:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456302.714098; Wed, 07 Dec 2022 13:07:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2u8w-0004uE-Vn; Wed, 07 Dec 2022 13:07:22 +0000
Received: by outflank-mailman (input) for mailman id 456302;
 Wed, 07 Dec 2022 13:07:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xbZ5=4F=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1p2u8u-0004EJ-EO
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 13:07:20 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 13ca6521-7630-11ed-91b6-6bf2151ebd3b;
 Wed, 07 Dec 2022 14:07:18 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C34823A;
 Wed,  7 Dec 2022 05:07:24 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6ACA63F73D;
 Wed,  7 Dec 2022 05:07:16 -0800 (PST)
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
X-Inumbo-ID: 13ca6521-7630-11ed-91b6-6bf2151ebd3b
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
Subject: [PATCH v3 3/5] xen/Makefile: remove Cppcheck invocation from the Makefile
Date: Wed,  7 Dec 2022 13:07:02 +0000
Message-Id: <20221207130704.20573-4-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221207130704.20573-1-luca.fancellu@arm.com>
References: <20221207130704.20573-1-luca.fancellu@arm.com>

The script xen-analysis.py is going to be used for the analysis with
cppcheck, so remove the rules from the Makefile.

The python script xen/tools/merge_cppcheck_reports.py was used by the
makefile rules, but its functionality is integrated in the
xen-analysis.py script now, so it can be removed.

Remove some entry from the .gitignore related to Cppcheck invocation
from Makefile.

This is a partial revert of commit 43aa3f6e72d34 where the entry
xen/xen-cppcheck.xml from .gitignore is reverted because its path has
changed, *.c.cppcheck entry is not needed anymore either,
merge_cppcheck_reports.py script is reverted for the reason above,
all makefile changes are reverted.
Every other change to processor.h, config.h, kconfig.h is kept because
they are used with the new process.

This is a partial revert of commit 57caa53753212 where Makefile changes
are reverted, convert_misra_doc.py script is kept as it is used with the
new process.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
v3 changes:
 - add information on reverted commits (Jan)
v2 changes:
 - new patch
---
---
 .gitignore                          |   2 -
 xen/Makefile                        | 116 ++--------------------------
 xen/tools/merge_cppcheck_reports.py |  86 ---------------------
 3 files changed, 6 insertions(+), 198 deletions(-)
 delete mode 100755 xen/tools/merge_cppcheck_reports.py

diff --git a/.gitignore b/.gitignore
index 39efe2933a33..68566d0c2587 100644
--- a/.gitignore
+++ b/.gitignore
@@ -7,7 +7,6 @@
 *.o
 *.d
 *.d2
-*.c.cppcheck
 *.cppcheck.txt
 *.cppcheck.xml
 *.opic
@@ -321,7 +320,6 @@ tools/flask/policy/policy.conf
 tools/flask/policy/xenpolicy-*
 xen/xen
 xen/suppression-list.txt
-xen/xen-cppcheck.xml
 xen/xen-syms
 xen/xen-syms.map
 xen/xen.*
diff --git a/xen/Makefile b/xen/Makefile
index e55fb98e11ee..2d55bb9401f4 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -457,7 +457,7 @@ endif # need-config
 
 __all: build
 
-main-targets := build install uninstall clean distclean MAP cppcheck cppcheck-html
+main-targets := build install uninstall clean distclean MAP
 .PHONY: $(main-targets)
 ifneq ($(XEN_TARGET_ARCH),x86_32)
 $(main-targets): %: _% ;
@@ -566,18 +566,16 @@ _clean:
 	$(Q)$(MAKE) $(clean)=tools/kconfig
 	find . \( -name "*.o" -o -name ".*.d" -o -name ".*.d2" \
 		-o -name ".*.o.tmp" -o -name "*~" -o -name "core" \
-		-o -name '*.lex.c' -o -name '*.tab.[ch]' -o -name '*.c.cppcheck' \
-		-o -name "*.gcno" -o -name ".*.cmd" -o -name "lib.a" \) -exec rm -f {} \;
+		-o -name '*.lex.c' -o -name '*.tab.[ch]' -o -name "*.gcno" \
+		-o -name ".*.cmd" -o -name "lib.a" \) -exec rm -f {} \;
 	rm -f include/asm $(TARGET) $(TARGET).gz $(TARGET)-syms $(TARGET)-syms.map
 	rm -f $(TARGET).efi $(TARGET).efi.map $(TARGET).efi.stripped
 	rm -f asm-offsets.s arch/*/include/asm/asm-offsets.h
 	rm -f .banner .allconfig.tmp include/xen/compile.h
-	rm -f cppcheck-misra.* xen-cppcheck.xml
 
 .PHONY: _distclean
 _distclean: clean
 	rm -f tags TAGS cscope.files cscope.in.out cscope.out cscope.po.out GTAGS GPATH GRTAGS GSYMS .config source
-	rm -rf $(CPPCHECK_HTMLREPORT_OUTDIR)
 
 $(TARGET).gz: $(TARGET)
 	gzip -n -f -9 < $< > $@.new
@@ -651,111 +649,9 @@ cloc:
 	    done; \
 	done | cloc --list-file=-
 
-# What cppcheck command to use.
-# To get proper results, it is recommended to build cppcheck manually from the
-# latest source and use CPPCHECK to give the full path to the built version.
-CPPCHECK ?= cppcheck
-
-# What cppcheck-htmlreport to use.
-# If you give the full path to a self compiled cppcheck, this should be set
-# to the full path to cppcheck-html in the htmlreport directory of cppcheck.
-# On recent distribution, this is available in the standard path.
-CPPCHECK_HTMLREPORT ?= cppcheck-htmlreport
-
-# By default we generate the report in cppcheck-htmlreport directory in the
-# build directory. This can be changed by giving a directory in this variable.
-CPPCHECK_HTMLREPORT_OUTDIR ?= cppcheck-htmlreport
-
-# By default we do not check misra rules, to enable pass "CPPCHECK_MISRA=y" to
-# make command line.
-CPPCHECK_MISRA ?= n
-
-# Compile flags to pass to cppcheck:
-# - include directories and defines Xen Makefile is passing (from CFLAGS)
-# - include config.h as this is passed directly to the compiler.
-# - define CPPCHECK as we use to disable or enable some specific part of the
-#   code to solve some cppcheck issues.
-# - explicitely enable some cppcheck checks as we do not want to use "all"
-#   which includes unusedFunction which gives wrong positives as we check file
-#   per file.
-#
-# Compiler defines are in compiler-def.h which is included in config.h
-#
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
-
-ifeq ($(CPPCHECK_MISRA),y)
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
-endif
-	$(call if_changed,merge_cppcheck_reports)
-
-$(objtree)/%.c.cppcheck: $(srctree)/%.c $(CPPCHECKDEPS) | cppcheck-version
-	$(call if_changed,cppcheck_xml)
-
-cppcheck-version:
-	$(Q)if ! which $(CPPCHECK) > /dev/null 2>&1; then \
-		echo "Cannot find cppcheck executable: $(CPPCHECK)"; \
-		exit 1; \
-	fi
-	$(Q)if [ "$$($(CPPCHECK) --version | awk '{print ($$2 < 2.7)}')" -eq 1 ]; then \
-		echo "Please upgrade your cppcheck to version 2.7 or greater"; \
-		exit 1; \
-	fi
-
-# List of Misra rules to respect is written inside a doc.
-# In order to have some helpful text in the cppcheck output, generate a text
-# file containing the rules identifier, classification and text from the Xen
-# documentation file. Also generate a json file with the right arguments for
-# cppcheck in json format including the list of rules to ignore.
-#
-# convert_misra_doc.py, producing both targets at the same time, should be
-# executed only once. Utilize a pattern rule to achieve this effect, with the
-# stem kind of arbitrarily chosen to be "cppcheck".
-.PRECIOUS: %-misra.json
-%-misra.txt %-misra.json: $(XEN_ROOT)/docs/misra/rules.rst $(srctree)/tools/convert_misra_doc.py
-	$(Q)$(PYTHON) $(srctree)/tools/convert_misra_doc.py -i $< -o $*-misra.txt -j $*-misra.json
-
-# Put this in generated headers this way it is cleaned by include/Makefile
-$(objtree)/include/generated/compiler-def.h:
-	$(Q)$(CC) -dM -E -o $@ - < /dev/null
+# Target used by xen-analysis.sh script to retrieve Xen build system variables
+export-variable-%:
+	$(info $*=$($*))
 
 endif #config-build
 endif # need-sub-make
diff --git a/xen/tools/merge_cppcheck_reports.py b/xen/tools/merge_cppcheck_reports.py
deleted file mode 100755
index 1c1b63ba56b8..000000000000
--- a/xen/tools/merge_cppcheck_reports.py
+++ /dev/null
@@ -1,86 +0,0 @@
-#!/usr/bin/env python
-
-"""
-This script acts as a tool to merge XML files created by cppcheck.
-Usage:
-    merge_cppcheck_reports.py [FILES] [OUTPUT]
-
-    FILES  - list of XML files with extension .cppcheck
-    OUTPUT - file to store results (with .xml extension).
-             If not specified, the script will print results to stdout.
-"""
-
-import sys
-from xml.etree import ElementTree
-
-def elements_equal(el1, el2):
-    if type(el1) != type(el2): return False
-
-    if el1.find('location') is None: return False
-    if el2.find('location') is None: return False
-
-    el1_location = str(el1.find('location').attrib)
-    el2_location = str(el2.find('location').attrib)
-
-    if el1_location != el2_location: return False
-
-    return True
-
-def contain_element(new, lst):
-    for elem in lst:
-        if elements_equal(new, elem):
-            return True
-    return False
-
-def merge(files):
-    try:
-        result_xml_root = ElementTree.parse(files[0]).getroot()
-    except:
-        print("Xml parsing error in %s\n" % (files[0]))
-        print("Please upgrade your cppcheck to version 2.7 or greater")
-        sys.exit(1)
-    insert_point = result_xml_root.findall("errors")[0]
-    curr = 1
-    total = len(files)
-    numelem = len(insert_point)
-    for xml_file in files[1:]:
-        try:
-            xml_root = ElementTree.parse(xml_file).getroot()
-        except:
-            print("Xml parsing error in %s\n" % (xml_file))
-            print("Please upgrade your cppcheck to version 2.7 or greater")
-            sys.exit(1)
-        curr_elem_list = list(insert_point)
-        new_elem_list = list(xml_root.findall("errors")[0])
-        for xml_error_elem in new_elem_list:
-            if not contain_element(xml_error_elem, curr_elem_list):
-                insert_point.insert(1,xml_error_elem)
-                numelem = numelem + 1
-        curr = curr + 1
-        sys.stdout.write('\r')
-        sys.stdout.write(" %d / %d" % (curr,total))
-        sys.stdout.flush()
-
-    sys.stdout.write('\r\n')
-    print("Done: %d elements" % (numelem))
-    return result_xml_root
-
-def run():
-    files = []
-    output = None
-    for i in sys.argv[1:]:
-        output = i if '.xml' in i else None
-        files.append(i) if '.cppcheck' in i else None
-
-    result = merge(files)
-
-    if result is None:
-        return
-
-    if output is not None:
-        ElementTree.ElementTree(result).write(output)
-    else:
-        print(ElementTree.tostring(result).decode('utf-8'))
-
-if __name__ == '__main__':
-    run()
-- 
2.17.1


