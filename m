Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B187EEDE4
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 09:54:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634903.990507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3ube-0001hu-4q; Fri, 17 Nov 2023 08:53:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634903.990507; Fri, 17 Nov 2023 08:53:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3ube-0001er-0Y; Fri, 17 Nov 2023 08:53:42 +0000
Received: by outflank-mailman (input) for mailman id 634903;
 Fri, 17 Nov 2023 08:53:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2+Qn=G6=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r3ubc-0001Px-5M
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 08:53:40 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc0c82c6-8526-11ee-9b0e-b553b5be7939;
 Fri, 17 Nov 2023 09:53:37 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 5F35F4EE0C81;
 Fri, 17 Nov 2023 09:53:36 +0100 (CET)
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
X-Inumbo-ID: cc0c82c6-8526-11ee-9b0e-b553b5be7939
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [XEN PATCH v5 1/2] automation/eclair: make the docs for MISRA C:2012 Dir 4.1 visible to ECLAIR
Date: Fri, 17 Nov 2023 09:53:25 +0100
Message-Id: <dd207f2aa0a79b784df5d042f8a0169707c21902.1700211131.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700211131.git.nicola.vetrini@bugseng.com>
References: <cover.1700211131.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To be able to check for the existence of the necessary subsections in
the documentation for MISRA C:2012 Dir 4.1, ECLAIR needs to have a source
file that is built.

This file is generated from 'C-runtime-failures.rst' in docs/misra
and the configuration is updated accordingly.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes from RFC:
- Dropped unused/useless code
- Revised the sed command
- Revised the clean target

Changes in v2:
- Added explanative comment to the makefile
- printf instead of echo

Changes in v3:
- Terminate the generated file with a newline
- Build it with -std=c99, so that the documentation
  for D1.1 applies.
Changes in v4:
- Transform and build the file directly in the eclair-specific directory
Changes in v5:
- Small improvements
---
 automation/eclair_analysis/build.sh   | 31 +++++++++++++++++++++++----
 automation/eclair_analysis/prepare.sh |  7 +++---
 2 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/automation/eclair_analysis/build.sh b/automation/eclair_analysis/build.sh
index ec087dd822fa..122b93b80581 100755
--- a/automation/eclair_analysis/build.sh
+++ b/automation/eclair_analysis/build.sh
@@ -33,12 +33,35 @@ else
   PROCESSORS=6
 fi
 
+# Variables driving the build
+CC=${CROSS_COMPILE}gcc-12
+CXX=${CROSS_COMPILE}g++-12
+
+runtime_failures_docs() {
+  doc="C-runtime-failures.rst"
+  builddir="automation/eclair_analysis"
+  
+  cd "${builddir}"
+  printf "/*\n\n" >"${doc}.c"
+  sed -e 's|\*/|*//*|g' "../../docs/misra/${doc}" >>"${doc}.c"
+  
+  # At least a dummy decl is needed to comply with the C standard.
+  printf "\n\n*/\ntypedef int dummy_typedef;\n" >>"${doc}.c"
+  
+  # The C language standard applicable to Xen is C99 (with extensions),
+  # therefore even this dummy file needs to be compiled with -std=c99.
+  # Cannot redirect to /dev/null because it would be excluded from the analysis
+  "${CC}" -std=c99 -c "${doc}.c" -o "${doc}.o"
+  cd -
+}
+
 (
-  cd xen
+  runtime_failures_docs
 
   make "-j${PROCESSORS}" "-l${PROCESSORS}.0"    \
        "CROSS_COMPILE=${CROSS_COMPILE}"         \
-       "CC=${CROSS_COMPILE}gcc-12"              \
-       "CXX=${CROSS_COMPILE}g++-12"             \
-       "XEN_TARGET_ARCH=${XEN_TARGET_ARCH}"
+       "CC=${CC}"                               \
+       "CXX=${CXX}"                             \
+       "XEN_TARGET_ARCH=${XEN_TARGET_ARCH}"     \
+       -C xen
 )
diff --git a/automation/eclair_analysis/prepare.sh b/automation/eclair_analysis/prepare.sh
index 0cac5eba00ae..fe9d16e48ecc 100755
--- a/automation/eclair_analysis/prepare.sh
+++ b/automation/eclair_analysis/prepare.sh
@@ -35,11 +35,12 @@ else
 fi
 
 (
-    cd xen
-    cp "${CONFIG_FILE}" .config
+    ./configure
+    cp "${CONFIG_FILE}" xen/.config
     make clean
     find . -type f -name "*.safparse" -print -delete
-    make -f ${script_dir}/Makefile.prepare prepare
+    cd xen
+    make -f "${script_dir}/Makefile.prepare" prepare
     # Translate the /* SAF-n-safe */ comments into ECLAIR CBTs
     scripts/xen-analysis.py --run-eclair --no-build --no-clean
 )
-- 
2.34.1


