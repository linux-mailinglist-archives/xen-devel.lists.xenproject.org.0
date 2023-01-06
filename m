Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 853CB65FF16
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 11:41:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472447.732684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDkAA-0007v4-Rz; Fri, 06 Jan 2023 10:41:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472447.732684; Fri, 06 Jan 2023 10:41:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDkAA-0007sc-OR; Fri, 06 Jan 2023 10:41:26 +0000
Received: by outflank-mailman (input) for mailman id 472447;
 Fri, 06 Jan 2023 10:41:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7O5U=5D=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1pDkA9-0007m5-9K
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 10:41:25 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id a9884c2e-8dae-11ed-b8d0-410ff93cb8f0;
 Fri, 06 Jan 2023 11:41:22 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0964B15A1;
 Fri,  6 Jan 2023 02:42:04 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1EC053F23F;
 Fri,  6 Jan 2023 02:41:21 -0800 (PST)
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
X-Inumbo-ID: a9884c2e-8dae-11ed-b8d0-410ff93cb8f0
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/2] xen/cppcheck: add parameter to skip given MISRA rules
Date: Fri,  6 Jan 2023 10:41:08 +0000
Message-Id: <20230106104108.14740-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230106104108.14740-1-luca.fancellu@arm.com>
References: <20230106104108.14740-1-luca.fancellu@arm.com>

Add parameter to skip the passed MISRA rules during the cppcheck
analysis, the rules are specified as a list of comma separated
rules with the MISRA number notation (e.g. 1.1,1.3,...).

Modify convert_misra_doc.py script to take an extra parameter
giving a list of MISRA rule to be skipped, comma separated.
While there, fix some typos in the help and print functions.

Modify settings.py and cppcheck_analysis.py to have a new
parameter (--cppcheck-skip-rules) used to specify a list of
MISRA rule to be skipped during the cppcheck analysis.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/scripts/xen_analysis/cppcheck_analysis.py |  8 +++--
 xen/scripts/xen_analysis/settings.py          | 35 +++++++++++--------
 xen/tools/convert_misra_doc.py                | 28 ++++++++++-----
 3 files changed, 46 insertions(+), 25 deletions(-)

diff --git a/xen/scripts/xen_analysis/cppcheck_analysis.py b/xen/scripts/xen_analysis/cppcheck_analysis.py
index 0e952a169641..cc1f403d315e 100644
--- a/xen/scripts/xen_analysis/cppcheck_analysis.py
+++ b/xen/scripts/xen_analysis/cppcheck_analysis.py
@@ -153,11 +153,15 @@ def generate_cppcheck_deps():
     if settings.cppcheck_misra:
         cppcheck_flags = cppcheck_flags + " --addon=cppcheck-misra.json"
 
+        skip_rules_arg = ""
+        if settings.cppcheck_skip_rules != "":
+            skip_rules_arg = "-s {}".format(settings.cppcheck_skip_rules)
+
         utils.invoke_command(
             "{}/convert_misra_doc.py -i {}/docs/misra/rules.rst"
-            " -o {}/cppcheck-misra.txt -j {}/cppcheck-misra.json"
+            " -o {}/cppcheck-misra.txt -j {}/cppcheck-misra.json {}"
                 .format(settings.tools_dir, settings.repo_dir,
-                        settings.outdir, settings.outdir),
+                        settings.outdir, settings.outdir, skip_rules_arg),
             False, CppcheckDepsPhaseError,
             "An error occured when running:\n{}"
         )
diff --git a/xen/scripts/xen_analysis/settings.py b/xen/scripts/xen_analysis/settings.py
index a8502e554e95..8c0d357fe0dc 100644
--- a/xen/scripts/xen_analysis/settings.py
+++ b/xen/scripts/xen_analysis/settings.py
@@ -24,6 +24,7 @@ cppcheck_binpath = "cppcheck"
 cppcheck_html = False
 cppcheck_htmlreport_binpath = "cppcheck-htmlreport"
 cppcheck_misra = False
+cppcheck_skip_rules = ""
 make_forward_args = ""
 outdir = xen_dir
 
@@ -53,20 +54,22 @@ Cppcheck report creation phase runs only when --run-cppcheck is passed to the
 script.
 
 Options:
-  --build-only          Run only the commands to build Xen with the optional
-                        make arguments passed to the script
-  --clean-only          Run only the commands to clean the analysis artifacts
-  --cppcheck-bin=       Path to the cppcheck binary (Default: {})
-  --cppcheck-html       Produce an additional HTML output report for Cppcheck
-  --cppcheck-html-bin=  Path to the cppcheck-html binary (Default: {})
-  --cppcheck-misra      Activate the Cppcheck MISRA analysis
-  --distclean           Clean analysis artifacts and reports
-  -h, --help            Print this help
-  --no-build            Skip the build Xen phase
-  --no-clean            Don\'t clean the analysis artifacts on exit
-  --run-coverity        Run the analysis for the Coverity tool
-  --run-cppcheck        Run the Cppcheck analysis tool on Xen
-  --run-eclair          Run the analysis for the Eclair tool
+  --build-only            Run only the commands to build Xen with the optional
+                          make arguments passed to the script
+  --clean-only            Run only the commands to clean the analysis artifacts
+  --cppcheck-bin=         Path to the cppcheck binary (Default: {})
+  --cppcheck-html         Produce an additional HTML output report for Cppcheck
+  --cppcheck-html-bin=    Path to the cppcheck-html binary (Default: {})
+  --cppcheck-misra        Activate the Cppcheck MISRA analysis
+  --cppcheck-skip-rules=  List of MISRA rules to be skipped, comma separated.
+                          (e.g. --cppcheck-skip-rules=1.1,20.7,8.4)
+  --distclean             Clean analysis artifacts and reports
+  -h, --help              Print this help
+  --no-build              Skip the build Xen phase
+  --no-clean              Don\'t clean the analysis artifacts on exit
+  --run-coverity          Run the analysis for the Coverity tool
+  --run-cppcheck          Run the Cppcheck analysis tool on Xen
+  --run-eclair            Run the analysis for the Eclair tool
 """
     print(msg.format(sys.argv[0], cppcheck_binpath,
                      cppcheck_htmlreport_binpath))
@@ -78,6 +81,7 @@ def parse_commandline(argv):
     global cppcheck_html
     global cppcheck_htmlreport_binpath
     global cppcheck_misra
+    global cppcheck_skip_rules
     global make_forward_args
     global outdir
     global step_get_make_vars
@@ -115,6 +119,9 @@ def parse_commandline(argv):
             cppcheck_htmlreport_binpath = args_with_content_regex.group(2)
         elif option == "--cppcheck-misra":
             cppcheck_misra = True
+        elif args_with_content_regex and \
+             args_with_content_regex.group(1) == "--cppcheck-skip-rules":
+            cppcheck_skip_rules = args_with_content_regex.group(2)
         elif option == "--distclean":
             target_distclean = True
         elif (option == "--help") or (option == "-h"):
diff --git a/xen/tools/convert_misra_doc.py b/xen/tools/convert_misra_doc.py
index 13074d8a2e91..8984ec625fa7 100755
--- a/xen/tools/convert_misra_doc.py
+++ b/xen/tools/convert_misra_doc.py
@@ -4,12 +4,14 @@
 This script is converting the misra documentation RST file into a text file
 that can be used as text-rules for cppcheck.
 Usage:
-    convert_misr_doc.py -i INPUT [-o OUTPUT] [-j JSON]
+    convert_misra_doc.py -i INPUT [-o OUTPUT] [-j JSON] [-s RULES,[...,RULES]]
 
     INPUT  - RST file containing the list of misra rules.
     OUTPUT - file to store the text output to be used by cppcheck.
              If not specified, the result will be printed to stdout.
     JSON   - cppcheck json file to be created (optional).
+    RULES  - list of rules to skip during the analysis, comma separated
+             (e.g. 1.1,1.2,1.3,...)
 """
 
 import sys, getopt, re
@@ -47,21 +49,25 @@ def main(argv):
     outfile = ''
     outstr = sys.stdout
     jsonfile = ''
+    force_skip = ''
 
     try:
-        opts, args = getopt.getopt(argv,"hi:o:j:",["input=","output=","json="])
+        opts, args = getopt.getopt(argv,"hi:o:j:s:",
+                                   ["input=","output=","json=","skip="])
     except getopt.GetoptError:
-        print('convert-misra.py -i <input> [-o <output>] [-j <json>')
+        print('convert-misra.py -i <input> [-o <output>] [-j <json>] [-s <rules>]')
         sys.exit(2)
     for opt, arg in opts:
         if opt == '-h':
-            print('convert-misra.py -i <input> [-o <output>] [-j <json>')
+            print('convert-misra.py -i <input> [-o <output>] [-j <json>] [-s <rules>]')
             print('  If output is not specified, print to stdout')
             sys.exit(1)
         elif opt in ("-i", "--input"):
             infile = arg
         elif opt in ("-o", "--output"):
             outfile = arg
+        elif opt in ("-s", "--skip"):
+            force_skip = arg
         elif opt in ("-j", "--json"):
             jsonfile = arg
 
@@ -169,14 +175,18 @@ def main(argv):
 
     skip_list = []
 
+    # Add rules to be skipped anyway
+    for r in force_skip.split(','):
+        skip_list.append(r)
+
     # Search for missing rules and add a dummy text with the rule number
     for i in misra_c2012_rules:
         for j in list(range(1,misra_c2012_rules[i]+1)):
-            if str(i) + '.' + str(j) not in rule_list:
-                outstr.write('Rule ' + str(i) + '.' + str(j) + '\n')
-                outstr.write('No description for rule ' + str(i) + '.' + str(j)
-                             + '\n')
-                skip_list.append(str(i) + '.' + str(j))
+            rule_str = str(i) + '.' + str(j)
+            if (rule_str not in rule_list) and (rule_str not in skip_list):
+                outstr.write('Rule ' + rule_str + '\n')
+                outstr.write('No description for rule ' + rule_str + '\n')
+                skip_list.append(rule_str)
 
     # Make cppcheck happy by starting the appendix
     outstr.write('Appendix B\n')
-- 
2.17.1


