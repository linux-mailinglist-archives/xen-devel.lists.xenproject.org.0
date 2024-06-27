Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DF691A1F4
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 10:56:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749842.1158075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMkuz-00057m-1C; Thu, 27 Jun 2024 08:55:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749842.1158075; Thu, 27 Jun 2024 08:55:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMkuy-00055B-Us; Thu, 27 Jun 2024 08:55:48 +0000
Received: by outflank-mailman (input) for mailman id 749842;
 Thu, 27 Jun 2024 08:55:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kCyE=N5=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sMkux-000555-St
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 08:55:47 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b06b43e-3463-11ef-90a3-e314d9c70b13;
 Thu, 27 Jun 2024 10:55:46 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.214])
 by support.bugseng.com (Postfix) with ESMTPSA id F14354EE073D;
 Thu, 27 Jun 2024 10:55:44 +0200 (CEST)
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
X-Inumbo-ID: 0b06b43e-3463-11ef-90a3-e314d9c70b13
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH] x86: p2m-pod: address violation of MISRA C Rule 2.1
Date: Thu, 27 Jun 2024 10:55:42 +0200
Message-Id: <a050ef1b662f64bb58afb2f6118254254dd1d649.1719478448.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The label 'out_unmap' is only reachable after ASSERT_UNREACHABLE,
so the code below is only executed upon erroneously reaching that
program point and calling domain_crash, thus resulting in the
for loop after 'out_unmap' to become unreachable in some configurations.

This is a defensive coding measure to have a safe fallback that is
reachable in non-debug builds, and can thus be deviated with a
comment-based deviation.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 docs/misra/safe.json      | 8 ++++++++
 xen/arch/x86/mm/p2m-pod.c | 1 +
 2 files changed, 9 insertions(+)

diff --git a/docs/misra/safe.json b/docs/misra/safe.json
index c213e0a0be3b..b114c9485c86 100644
--- a/docs/misra/safe.json
+++ b/docs/misra/safe.json
@@ -60,6 +60,14 @@
         },
         {
             "id": "SAF-7-safe",
+            "analyser": {
+                "eclair": "MC3R1.R2.1"
+            },
+            "name": "MC3R1.R2.1: statement unreachable in some configurations",
+            "text": "Every path that can reach this statement is preceded by statements that make it unreachable in certain configurations (e.g. ASSERT_UNREACHABLE). This is understood as a means of defensive programming."
+        },
+        {
+            "id": "SAF-8-safe",
             "analyser": {},
             "name": "Sentinel",
             "text": "Next ID to be used"
diff --git a/xen/arch/x86/mm/p2m-pod.c b/xen/arch/x86/mm/p2m-pod.c
index bd84fe9e27ee..5a96c46a2286 100644
--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -1040,6 +1040,7 @@ out_unmap:
      * Something went wrong, probably crashing the domain.  Unmap
      * everything and return.
      */
+    /* SAF-7-safe Rule 2.1: defensive programming */
     for ( i = 0; i < count; i++ )
         if ( map[i] )
             unmap_domain_page(map[i]);
-- 
2.34.1


