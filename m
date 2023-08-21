Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2E6782ED5
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 18:55:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587726.919116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY8BI-0002zB-BM; Mon, 21 Aug 2023 16:55:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587726.919116; Mon, 21 Aug 2023 16:55:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY8BI-0002ue-78; Mon, 21 Aug 2023 16:55:08 +0000
Received: by outflank-mailman (input) for mailman id 587726;
 Mon, 21 Aug 2023 16:55:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TIpk=EG=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qY8BG-0002jB-SF
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 16:55:06 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a82cf48-4043-11ee-8782-cb3800f73035;
 Mon, 21 Aug 2023 18:55:05 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 1AABD4EE073E;
 Mon, 21 Aug 2023 18:55:05 +0200 (CEST)
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
X-Inumbo-ID: 7a82cf48-4043-11ee-8782-cb3800f73035
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
Subject: [RFC PATCH 3/3] automation/eclair: build docs/misra to address MISRA C:2012 Dir 4.1
Date: Mon, 21 Aug 2023 18:54:39 +0200
Message-Id: <fc8a60f5224f4285f674c83c42cff5b3681c29cd.1692636338.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692636338.git.nicola.vetrini@bugseng.com>
References: <cover.1692636338.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The documentation pertaining Directive 4.1 is contained in docs/misra.
The build script driving the analysis is amended to allow ECLAIR to
find it and thus resolving violations of the directive.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 automation/eclair_analysis/build.sh   | 10 ++++++++--
 automation/eclair_analysis/prepare.sh |  1 +
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/automation/eclair_analysis/build.sh b/automation/eclair_analysis/build.sh
index ec087dd822fa..a0433eedeb4d 100755
--- a/automation/eclair_analysis/build.sh
+++ b/automation/eclair_analysis/build.sh
@@ -34,8 +34,14 @@ else
 fi
 
 (
-  cd xen
-
+  cd docs
+  make "-j${PROCESSORS}" "-l${PROCESSORS}.0"    \
+       "CROSS_COMPILE=${CROSS_COMPILE}"         \
+       "CC=${CROSS_COMPILE}gcc-12"              \
+       "CXX=${CROSS_COMPILE}g++-12"             \
+       "XEN_TARGET_ARCH=${XEN_TARGET_ARCH}"     \
+       misra
+  cd ../xen
   make "-j${PROCESSORS}" "-l${PROCESSORS}.0"    \
        "CROSS_COMPILE=${CROSS_COMPILE}"         \
        "CC=${CROSS_COMPILE}gcc-12"              \
diff --git a/automation/eclair_analysis/prepare.sh b/automation/eclair_analysis/prepare.sh
index 275a1a3f517c..10854741790e 100755
--- a/automation/eclair_analysis/prepare.sh
+++ b/automation/eclair_analysis/prepare.sh
@@ -35,6 +35,7 @@ else
 fi
 
 (
+    ./configure
     cd xen
     cp "${CONFIG_FILE}" .config
     make clean
-- 
2.34.1


