Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDC97EB3E1
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 16:37:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632829.987299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2vTG-0004MZ-AP; Tue, 14 Nov 2023 15:36:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632829.987299; Tue, 14 Nov 2023 15:36:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2vTG-0004Jw-6e; Tue, 14 Nov 2023 15:36:58 +0000
Received: by outflank-mailman (input) for mailman id 632829;
 Tue, 14 Nov 2023 15:36:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZdVB=G3=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r2vTE-00043K-JZ
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 15:36:56 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a44558c8-8303-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 16:36:56 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 398D44EE0744;
 Tue, 14 Nov 2023 16:36:54 +0100 (CET)
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
X-Inumbo-ID: a44558c8-8303-11ee-98db-6d05b1d4d9a1
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
Subject: [XEN PATCH v4 1/2] automation/eclair: make the docs for MISRA C:2012 Dir 4.1 visible to ECLAIR
Date: Tue, 14 Nov 2023 16:36:47 +0100
Message-Id: <f14b266f18089f5951a3e390a5ebfe713beb8dbb.1699975581.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699975581.git.nicola.vetrini@bugseng.com>
References: <cover.1699975581.git.nicola.vetrini@bugseng.com>
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
Changes in v5:
- Transform and build the file directly in the eclair-specific directory
---
 automation/eclair_analysis/build.sh   | 21 +++++++++++++++++++--
 automation/eclair_analysis/prepare.sh |  7 ++++---
 2 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/automation/eclair_analysis/build.sh b/automation/eclair_analysis/build.sh
index ec087dd822fa..f24292ed0643 100755
--- a/automation/eclair_analysis/build.sh
+++ b/automation/eclair_analysis/build.sh
@@ -33,12 +33,29 @@ else
   PROCESSORS=6
 fi
 
+runtime_failures_docs() {
+  doc="C-runtime-failures.rst"
+  builddir="automation/eclair_analysis"
+  
+  cp "docs/misra/${doc}" "${builddir}"
+  cd "${builddir}"
+  printf "/*\n\n" >"${doc}.tmp"
+  sed -e 's|\*/|*//*|g' "${doc}" >>"${doc}.tmp"
+  printf "\n\n*/\n" >>"${doc}.tmp"
+  mv "${doc}.tmp" "${doc}.c"
+  
+  # Cannot redirect to /dev/null because it would be excluded from the analysis
+  "${CROSS_COMPILE}gcc-12" -std=c99 -c "${doc}.c" -o "${doc}.o"
+  cd -
+}
+
 (
-  cd xen
+  runtime_failures_docs
 
   make "-j${PROCESSORS}" "-l${PROCESSORS}.0"    \
        "CROSS_COMPILE=${CROSS_COMPILE}"         \
        "CC=${CROSS_COMPILE}gcc-12"              \
        "CXX=${CROSS_COMPILE}g++-12"             \
-       "XEN_TARGET_ARCH=${XEN_TARGET_ARCH}"
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


