Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 061136F6CAB
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 15:13:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529727.824443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puYlZ-0004SU-0P; Thu, 04 May 2023 13:13:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529727.824443; Thu, 04 May 2023 13:13:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puYlY-0004Pu-SP; Thu, 04 May 2023 13:13:00 +0000
Received: by outflank-mailman (input) for mailman id 529727;
 Thu, 04 May 2023 13:12:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UZDr=AZ=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1puYlX-00049n-Kx
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 13:12:59 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 626d8b4b-ea7d-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 15:12:56 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F0003C14;
 Thu,  4 May 2023 06:13:39 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F9C63F67D;
 Thu,  4 May 2023 06:12:54 -0700 (PDT)
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
X-Inumbo-ID: 626d8b4b-ea7d-11ed-8611-37d641c3527e
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 1/3] xen/misra: xen-analysis.py: fix parallel analysis Cppcheck errors
Date: Thu,  4 May 2023 14:12:43 +0100
Message-Id: <20230504131245.2985400-2-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230504131245.2985400-1-luca.fancellu@arm.com>
References: <20230504131245.2985400-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently Cppcheck has a limitation that prevents to use make with
parallel build and have a parallel Cppcheck invocation on each
translation unit (the .c files), because of spurious internal errors.

The issue comes from the fact that when using the build directory,
Cppcheck saves temporary files as <filename>.c.<many-extensions>, but
this doesn't work well when files with the same name are being
analysed at the same time, leading to race conditions.

Fix the issue creating, under the build directory, the same directory
structure of the file being analysed to avoid any clash.

Fixes: 02b26c02c7c4 ("xen/scripts: add cppcheck tool to the xen-analysis.py script")
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/scripts/xen_analysis/cppcheck_analysis.py |  8 +++-----
 xen/tools/cppcheck-cc.sh                      | 19 ++++++++++++++++++-
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/xen/scripts/xen_analysis/cppcheck_analysis.py b/xen/scripts/xen_analysis/cppcheck_analysis.py
index ab52ce38d502..658795bb9f5b 100644
--- a/xen/scripts/xen_analysis/cppcheck_analysis.py
+++ b/xen/scripts/xen_analysis/cppcheck_analysis.py
@@ -139,7 +139,6 @@ def generate_cppcheck_deps():
     # Compiler defines are in compiler-def.h which is included in config.h
     #
     cppcheck_flags="""
---cppcheck-build-dir={}/{}
  --max-ctu-depth=10
  --enable=style,information,missingInclude
  --template=\'{{file}}({{line}},{{column}}):{{id}}:{{severity}}:{{message}}\'
@@ -150,8 +149,7 @@ def generate_cppcheck_deps():
  --suppress='unusedStructMember:*'
  --include={}/include/xen/config.h
  -DCPPCHECK
-""".format(settings.outdir, CPPCHECK_BUILD_DIR, settings.xen_dir,
-           settings.outdir, settings.xen_dir)
+""".format(settings.xen_dir, settings.outdir, settings.xen_dir)
 
     invoke_cppcheck = utils.invoke_command(
             "{} --version".format(settings.cppcheck_binpath),
@@ -204,9 +202,9 @@ def generate_cppcheck_deps():
 
     cppcheck_cc_flags = """--compiler={} --cppcheck-cmd={} {}
  --cppcheck-plat={}/cppcheck-plat --ignore-path=tools/
- --ignore-path=arch/x86/efi/check.c
+ --ignore-path=arch/x86/efi/check.c --build-dir={}/{}
 """.format(xen_cc, settings.cppcheck_binpath, cppcheck_flags,
-           settings.tools_dir)
+           settings.tools_dir, settings.outdir, CPPCHECK_BUILD_DIR)
 
     if settings.cppcheck_html:
         cppcheck_cc_flags = cppcheck_cc_flags + " --cppcheck-html"
diff --git a/xen/tools/cppcheck-cc.sh b/xen/tools/cppcheck-cc.sh
index f6728e4c1084..16a965edb7ec 100755
--- a/xen/tools/cppcheck-cc.sh
+++ b/xen/tools/cppcheck-cc.sh
@@ -24,6 +24,7 @@ Options:
 EOF
 }
 
+BUILD_DIR=""
 CC_FILE=""
 COMPILER=""
 CPPCHECK_HTML="n"
@@ -66,6 +67,10 @@ do
             help
             exit 0
             ;;
+        --build-dir=*)
+            BUILD_DIR="${OPTION#*=}"
+            sm_tool_args="n"
+            ;;
         --compiler=*)
             COMPILER="${OPTION#*=}"
             sm_tool_args="n"
@@ -107,6 +112,12 @@ then
     exit 1
 fi
 
+if [ "${BUILD_DIR}" = "" ]
+then
+    echo "--build-dir arg is mandatory."
+    exit 1
+fi
+
 function create_jcd() {
     local line="${1}"
     local arg_num=0
@@ -199,13 +210,18 @@ then
             exit 1
         fi
 
+        # Generate build directory for the analysed file
+        cppcheck_build_dir="${BUILD_DIR}/${OBJTREE_PATH}"
+        mkdir -p "${cppcheck_build_dir}"
+
         # Shellcheck complains about missing quotes on CPPCHECK_TOOL_ARGS, but
         # they can't be used here
         # shellcheck disable=SC2086
         ${CPPCHECK_TOOL} ${CPPCHECK_TOOL_ARGS} \
             --project="${JDB_FILE}" \
             --output-file="${out_file}" \
-            --platform="${platform}"
+            --platform="${platform}" \
+            --cppcheck-build-dir=${cppcheck_build_dir}
 
         if [ "${CPPCHECK_HTML}" = "y" ]
         then
@@ -216,6 +232,7 @@ then
                 --project="${JDB_FILE}" \
                 --output-file="${out_file%.txt}.xml" \
                 --platform="${platform}" \
+                --cppcheck-build-dir=${cppcheck_build_dir} \
                 -q \
                 --xml
         fi
-- 
2.34.1


