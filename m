Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A024A5447A6
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 11:35:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.344816.570428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzEYw-00023r-IO; Thu, 09 Jun 2022 09:34:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 344816.570428; Thu, 09 Jun 2022 09:34:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzEYw-00021V-Fi; Thu, 09 Jun 2022 09:34:46 +0000
Received: by outflank-mailman (input) for mailman id 344816;
 Thu, 09 Jun 2022 09:34:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6kiA=WQ=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1nzEYu-00021O-RU
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 09:34:44 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 6427916a-e7d7-11ec-bd2c-47488cf2e6aa;
 Thu, 09 Jun 2022 11:34:43 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 47EE412FC;
 Thu,  9 Jun 2022 02:34:42 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 741C33F766;
 Thu,  9 Jun 2022 02:34:40 -0700 (PDT)
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
X-Inumbo-ID: 6427916a-e7d7-11ec-bd2c-47488cf2e6aa
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2] xen: Add MISRA support to cppcheck make rule
Date: Thu,  9 Jun 2022 10:34:29 +0100
Message-Id: <56d3deee8889d1372752db3105f3a1349ef4562e.1654767188.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cppcheck MISRA addon can be used to check for non compliance to some of
the MISRA standard rules.

Add a CPPCHECK_MISRA variable that can be set to "y" using make command
line to generate a cppcheck report including cppcheck misra checks.

When MISRA checking is enabled, a file with a text description suitable
for cppcheck misra addon is generated out of Xen documentation file
which lists the rules followed by Xen (docs/misra/rules.rst).

By default MISRA checking is turned off.

While adding cppcheck-misra files to gitignore, also fix the missing /
for htmlreport gitignore

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v2:
- fix missing / for htmlreport
- use wildcard for cppcheck-misra remove and gitignore
- fix comment in makefile
- fix dependencies for generation of json and txt file
---
 .gitignore                     |   3 +-
 xen/Makefile                   |  29 ++++++-
 xen/tools/convert_misra_doc.py | 139 +++++++++++++++++++++++++++++++++
 3 files changed, 168 insertions(+), 3 deletions(-)
 create mode 100755 xen/tools/convert_misra_doc.py

diff --git a/.gitignore b/.gitignore
index 18ef56a780..b106caa7a9 100644
--- a/.gitignore
+++ b/.gitignore
@@ -297,6 +297,7 @@ xen/.banner
 xen/.config
 xen/.config.old
 xen/.xen.elf32
+xen/cppcheck-misra.*
 xen/xen-cppcheck.xml
 xen/System.map
 xen/arch/x86/boot/mkelf32
@@ -318,7 +319,7 @@ xen/arch/*/efi/runtime.c
 xen/arch/*/include/asm/asm-offsets.h
 xen/common/config_data.S
 xen/common/config.gz
-xen/cppcheck-htmlreport
+xen/cppcheck-htmlreport/
 xen/include/headers*.chk
 xen/include/compat/*
 xen/include/config/
diff --git a/xen/Makefile b/xen/Makefile
index 82f5310b12..a4dce29efd 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -548,7 +548,7 @@ _clean:
 	rm -f include/asm $(TARGET) $(TARGET).gz $(TARGET).efi $(TARGET).efi.map $(TARGET)-syms $(TARGET)-syms.map
 	rm -f asm-offsets.s arch/*/include/asm/asm-offsets.h
 	rm -f .banner .allconfig.tmp include/xen/compile.h
-	rm -f xen-cppcheck.xml
+	rm -f cppcheck-misra.* xen-cppcheck.xml
 
 .PHONY: _distclean
 _distclean: clean
@@ -642,6 +642,10 @@ CPPCHECK_HTMLREPORT ?= cppcheck-htmlreport
 # build directory. This can be changed by giving a directory in this variable.
 CPPCHECK_HTMLREPORT_OUTDIR ?= cppcheck-htmlreport
 
+# By default we do not check misra rules, to enable pass "CPPCHECK_MISRA=y" to
+# make command line.
+CPPCHECK_MISRA ?= n
+
 # Compile flags to pass to cppcheck:
 # - include directories and defines Xen Makefile is passing (from CFLAGS)
 # - include config.h as this is passed directly to the compiler.
@@ -666,6 +670,15 @@ CPPCHECKFILES := $(wildcard $(patsubst $(objtree)/%.o,$(srctree)/%.c, \
                  $(filter-out $(objtree)/tools/%, \
                  $(shell find $(objtree) -name "*.o"))))
 
+# Headers and files required to run cppcheck on a file
+CPPCHECKDEPS := $(objtree)/include/generated/autoconf.h \
+                $(objtree)/include/generated/compiler-def.h
+
+ifeq ($(CPPCHECK_MISRA),y)
+    CPPCHECKFLAGS += --addon=cppcheck-misra.json
+    CPPCHECKDEPS += cppcheck-misra.json
+endif
+
 quiet_cmd_cppcheck_xml = CPPCHECK $(patsubst $(srctree)/%,%,$<)
 cmd_cppcheck_xml = $(CPPCHECK) -v -q --xml $(CPPCHECKFLAGS) \
                    --output-file=$@ $<
@@ -690,7 +703,7 @@ ifeq ($(CPPCHECKFILES),)
 endif
 	$(call if_changed,merge_cppcheck_reports)
 
-$(objtree)/%.c.cppcheck: $(srctree)/%.c $(objtree)/include/generated/autoconf.h $(objtree)/include/generated/compiler-def.h | cppcheck-version
+$(objtree)/%.c.cppcheck: $(srctree)/%.c $(CPPCHECKDEPS) | cppcheck-version
 	$(call if_changed,cppcheck_xml)
 
 cppcheck-version:
@@ -703,6 +716,18 @@ cppcheck-version:
 		exit 1; \
 	fi
 
+# List of Misra rules to respect is written inside a doc.
+# In order to have some helpful text in the cppcheck output, generate a text
+# file containing the rules identifier, classification and text from the Xen
+# documentation file. Also generate a json file with the right arguments for
+# cppcheck in json format including the list of rules to ignore.
+#
+cppcheck-misra.txt: $(XEN_ROOT)/docs/misra/rules.rst $(srctree)/tools/convert_misra_doc.py
+	$(Q)$(srctree)/tools/convert_misra_doc.py -i $< -o $@ -j $(@:.txt=.json)
+
+# convert_misra_doc is generating both files.
+cppcheck-misra.json: cppcheck-misra.txt
+
 # Put this in generated headers this way it is cleaned by include/Makefile
 $(objtree)/include/generated/compiler-def.h:
 	$(Q)$(CC) -dM -E -o $@ - < /dev/null
diff --git a/xen/tools/convert_misra_doc.py b/xen/tools/convert_misra_doc.py
new file mode 100755
index 0000000000..47133a33a6
--- /dev/null
+++ b/xen/tools/convert_misra_doc.py
@@ -0,0 +1,139 @@
+#!/usr/bin/env python
+
+"""
+This script is converting the misra documentation RST file into a text file
+that can be used as text-rules for cppcheck.
+Usage:
+    convert_misr_doc.py -i INPUT [-o OUTPUT] [-j JSON]
+
+    INPUT  - RST file containing the list of misra rules.
+    OUTPUT - file to store the text output to be used by cppcheck.
+             If not specified, the result will be printed to stdout.
+    JSON   - cppcheck json file to be created (optional).
+"""
+
+import sys, getopt, re
+
+def main(argv):
+    infile = ''
+    outfile = ''
+    outstr = sys.stdout
+    jsonfile = ''
+
+    try:
+        opts, args = getopt.getopt(argv,"hi:o:j:",["input=","output=","json="])
+    except getopt.GetoptError:
+        print('convert-misra.py -i <input> [-o <output>] [-j <json>')
+        sys.exit(2)
+    for opt, arg in opts:
+        if opt == '-h':
+            print('convert-misra.py -i <input> [-o <output>] [-j <json>')
+            print('  If output is not specified, print to stdout')
+            sys.exit(1)
+        elif opt in ("-i", "--input"):
+            infile = arg
+        elif opt in ("-o", "--output"):
+            outfile = arg
+        elif opt in ("-j", "--json"):
+            jsonfile = arg
+
+    try:
+        file_stream = open(infile, 'rt')
+    except:
+        print('Error opening ' + infile)
+        sys.exit(1)
+
+    if outfile:
+        try:
+            outstr = open(outfile, "w")
+        except:
+            print('Error creating ' + outfile)
+            sys.exit(1)
+
+    # Each rule start with '- Rule: Dir'
+    pattern_dir = re.compile(r'^- Rule: Dir ([0-9]+.[0-9]+).*$')
+    pattern_rule = re.compile(r'^- Rule: Rule ([0-9]+.[0-9]+).*$')
+    pattern_severity = re.compile(r'^  - Severity:  (.*)$')
+    pattern_text = re.compile(r'^  - Summary:  (.*)$')
+
+    rule_number = ''
+    rule_state  = 0
+    rule_list = []
+
+    # Start search by cppcheck misra
+    outstr.write('Appendix A Summary of guidelines\n')
+
+    for line in file_stream:
+
+        line = line.replace('\r', '').replace('\n', '')
+
+        if len(line) == 0:
+            continue
+
+        # New rule
+        if rule_state == 0:
+            res = pattern_rule.match(line)
+            if res:
+                rule_state = 1
+                rule_number = res.group(1)
+                rule_list.append(rule_number)
+                continue
+            res = pattern_dir.match(line)
+            if res:
+                rule_state = 1
+                rule_number = res.group(1)
+                rule_list.append(rule_number)
+            continue
+
+        # Severity
+        elif rule_state == 1:
+            res = pattern_severity.match(line)
+            if res:
+                outstr.write('Rule ' + rule_number + ' ' + res.group(1) + '\n')
+                rule_state = 2
+            continue
+
+        # Summary
+        elif rule_state == 2:
+            res = pattern_text.match(line)
+            if res:
+                outstr.write(res.group(1) + ' (Misra rule ' + rule_number
+                             + ')\n')
+                rule_state = 0
+                rule_number = ''
+            continue
+        else:
+            print('Error impossible case !!!')
+
+    skip_list = []
+
+    # Search for missing rules and add a dummy text with the rule number
+    for i in list(range(1,22)):
+        for j in list(range(1,22)):
+            if str(i) + '.' + str(j) not in rule_list:
+                outstr.write('Rule ' + str(i) + '.' + str(j) + '\n')
+                outstr.write('No description for rule ' + str(i) + '.' + str(j)
+                             + '\n')
+                skip_list.append(str(i) + '.' + str(j))
+
+    # Make cppcheck happy by starting the appendix
+    outstr.write('Appendix B\n')
+    outstr.write('\n')
+    if outfile:
+        outstr.close()
+
+    if jsonfile:
+        with open(jsonfile, "w") as f:
+            f.write('{\n')
+            f.write('    "script": "misra.py",\n')
+            f.write('    "args": [\n')
+            if outfile:
+                f.write('      "--rule-texts=' + outfile + '",\n')
+
+            f.write('      "--suppress-rules=' + ",".join(skip_list) + '"\n')
+            f.write('    ]\n')
+            f.write('}\n')
+        f.close()
+
+if __name__ == "__main__":
+   main(sys.argv[1:])
-- 
2.25.1


