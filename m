Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5807D78FA74
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 11:07:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594514.927876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qc07F-0003Tt-Q8; Fri, 01 Sep 2023 09:06:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594514.927876; Fri, 01 Sep 2023 09:06:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qc07F-0003IZ-GX; Fri, 01 Sep 2023 09:06:57 +0000
Received: by outflank-mailman (input) for mailman id 594514;
 Fri, 01 Sep 2023 09:06:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TF5h=ER=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qc07D-00035i-Qw
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 09:06:55 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e558a515-48a6-11ee-8783-cb3800f73035;
 Fri, 01 Sep 2023 11:06:54 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id DA96A4EE073C;
 Fri,  1 Sep 2023 11:06:53 +0200 (CEST)
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
X-Inumbo-ID: e558a515-48a6-11ee-8783-cb3800f73035
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [XEN PATCH 3/3] automation/eclair: build docs/misra to address MISRA C:2012 Dir 4.1
Date: Fri,  1 Sep 2023 11:06:40 +0200
Message-Id: <ade1b214fc0e3a59c007ae2cdff78dc33b614c64.1693558913.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693558913.git.nicola.vetrini@bugseng.com>
References: <cover.1693558913.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The documentation pertaining Directive 4.1 is contained in docs/misra.
The build script driving the analysis is amended to allow ECLAIR to
analyze such file.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 automation/eclair_analysis/build.sh   | 11 ++++++++---
 automation/eclair_analysis/prepare.sh |  5 +++--
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/automation/eclair_analysis/build.sh b/automation/eclair_analysis/build.sh
index ec087dd822fa..556ed698bf8b 100755
--- a/automation/eclair_analysis/build.sh
+++ b/automation/eclair_analysis/build.sh
@@ -34,11 +34,16 @@ else
 fi
 
 (
-  cd xen
-
   make "-j${PROCESSORS}" "-l${PROCESSORS}.0"    \
        "CROSS_COMPILE=${CROSS_COMPILE}"         \
        "CC=${CROSS_COMPILE}gcc-12"              \
        "CXX=${CROSS_COMPILE}g++-12"             \
-       "XEN_TARGET_ARCH=${XEN_TARGET_ARCH}"
+       "XEN_TARGET_ARCH=${XEN_TARGET_ARCH}"     \
+       -C docs misra
+  make "-j${PROCESSORS}" "-l${PROCESSORS}.0"    \
+       "CROSS_COMPILE=${CROSS_COMPILE}"         \
+       "CC=${CROSS_COMPILE}gcc-12"              \
+       "CXX=${CROSS_COMPILE}g++-12"             \
+       "XEN_TARGET_ARCH=${XEN_TARGET_ARCH}"     \
+			 -C xen
 )
diff --git a/automation/eclair_analysis/prepare.sh b/automation/eclair_analysis/prepare.sh
index 275a1a3f517c..452e309b658b 100755
--- a/automation/eclair_analysis/prepare.sh
+++ b/automation/eclair_analysis/prepare.sh
@@ -35,8 +35,9 @@ else
 fi
 
 (
-    cd xen
-    cp "${CONFIG_FILE}" .config
+    ./configure
+    cp "${CONFIG_FILE}" xen/.config
     make clean
+    cd xen
     make -f ${script_dir}/Makefile.prepare prepare
 )
-- 
2.34.1


