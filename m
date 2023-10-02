Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9367B4C92
	for <lists+xen-devel@lfdr.de>; Mon,  2 Oct 2023 09:35:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611118.950546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnDST-0001hC-Vk; Mon, 02 Oct 2023 07:35:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611118.950546; Mon, 02 Oct 2023 07:35:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnDST-0001fi-Qq; Mon, 02 Oct 2023 07:35:13 +0000
Received: by outflank-mailman (input) for mailman id 611118;
 Mon, 02 Oct 2023 07:35:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uL8T=FQ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qnDSR-0000vL-U6
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 07:35:11 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 367b23e2-60f6-11ee-9b0d-b553b5be7939;
 Mon, 02 Oct 2023 09:35:08 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 9261B4EE074E;
 Mon,  2 Oct 2023 09:35:08 +0200 (CEST)
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
X-Inumbo-ID: 367b23e2-60f6-11ee-9b0d-b553b5be7939
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [XEN PATCH v3 3/3] automation/eclair: build docs/misra to address MISRA C:2012 Dir 4.1
Date: Mon,  2 Oct 2023 09:34:50 +0200
Message-Id: <ac00d0259530ac895e7260ff7f64833c58053983.1696231870.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696231870.git.nicola.vetrini@bugseng.com>
References: <cover.1696231870.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The documentation pertaining Directive 4.1 is contained in docs/misra.
The build script driving the analysis is amended to allow ECLAIR to
analyze such file.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v3:
- amended prepare script.
---
 automation/eclair_analysis/build.sh   | 6 +++---
 automation/eclair_analysis/prepare.sh | 7 ++++---
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/automation/eclair_analysis/build.sh b/automation/eclair_analysis/build.sh
index ec087dd822fa..ea7a1e5a59b0 100755
--- a/automation/eclair_analysis/build.sh
+++ b/automation/eclair_analysis/build.sh
@@ -34,11 +34,11 @@ else
 fi
 
 (
-  cd xen
-
+  make -C docs misra
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


