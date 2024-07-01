Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6313391DD99
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 13:11:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751472.1159450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOEwB-0002a7-Dn; Mon, 01 Jul 2024 11:11:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751472.1159450; Mon, 01 Jul 2024 11:11:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOEwB-0002YW-Az; Mon, 01 Jul 2024 11:11:11 +0000
Received: by outflank-mailman (input) for mailman id 751472;
 Mon, 01 Jul 2024 11:11:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FOPt=OB=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sOEwA-0002K1-E4
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 11:11:10 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e1091ed-379a-11ef-b4bb-af5377834399;
 Mon, 01 Jul 2024 13:11:08 +0200 (CEST)
Received: from delta.bugseng.com.homenet.telecomitalia.it
 (host-79-60-221-62.business.telecomitalia.it [79.60.221.62])
 by support.bugseng.com (Postfix) with ESMTPSA id D8DF14EE0749;
 Mon,  1 Jul 2024 13:11:05 +0200 (CEST)
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
X-Inumbo-ID: 9e1091ed-379a-11ef-b4bb-af5377834399
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Subject: [PATCH 01/17] misra: add deviation for headers that explicitly avoid guards
Date: Mon,  1 Jul 2024 13:10:19 +0200
Message-Id: <e7e61b4486c025a1014ad09aa774dfd392f858b8.1719829101.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719829101.git.alessandro.zucchelli@bugseng.com>
References: <cover.1719829101.git.alessandro.zucchelli@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Simone Ballarin <simone.ballarin@bugseng.com>

Some headers, under specific circumstances (documented in a comment at
the beginning of the file), explicitly avoid inclusion guards: the caller
is responsible for including them correctly.

These files are not supposed to comply with Directive 4.10:
"Precautions shall be taken in order to prevent the contents of a header
file being included more than once"

This patch adds deviation cooments for headers that avoid guards.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>

---
Changes in v4:
- rebased against current staging tree
Changes in v3:
- fix inconsistent deviation ID
- change comment-based deviation text
Changes in v2:
- use the format introduced with doc/misra/safe.json instead of
  a generic text-based deviation
---
 docs/misra/safe.json                        | 8 ++++++++
 xen/include/public/arch-x86/cpufeatureset.h | 1 +
 xen/include/public/errno.h                  | 1 +
 3 files changed, 10 insertions(+)

diff --git a/docs/misra/safe.json b/docs/misra/safe.json
index 3f18ef401c..b865caac73 100644
--- a/docs/misra/safe.json
+++ b/docs/misra/safe.json
@@ -68,6 +68,14 @@
         },
         {
             "id": "SAF-8-safe",
+            "analyser": {
+                "eclair": "MC3R1.D4.10"
+            },
+            "name": "Dir 4.10: headers that leave it up to the caller to include them correctly",
+            "text": "Headers that deliberatively avoid inclusion guards explicitly leaving responsibility to the caller are allowed."
+        },
+        {
+            "id": "SAF-9-safe",
             "analyser": {},
             "name": "Sentinel",
             "text": "Next ID to be used"
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index d9eba5e9a7..0d2adfdc3a 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -23,6 +23,7 @@
  * their XEN_CPUFEATURE() being appropriate in the included context.
  */
 
+/* SAF-8-safe omitted inclusion guard */
 #ifndef XEN_CPUFEATURE
 
 /*
diff --git a/xen/include/public/errno.h b/xen/include/public/errno.h
index 5a78a7607c..ccd5023c3a 100644
--- a/xen/include/public/errno.h
+++ b/xen/include/public/errno.h
@@ -17,6 +17,7 @@
  * will unilaterally #undef XEN_ERRNO().
  */
 
+/* SAF-8-safe omitted inclusion guard */
 #ifndef XEN_ERRNO
 
 /*
-- 
2.34.1


