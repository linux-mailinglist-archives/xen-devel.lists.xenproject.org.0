Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F707FF3E9
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 16:49:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645011.1006737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8jHK-0006dI-OT; Thu, 30 Nov 2023 15:48:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645011.1006737; Thu, 30 Nov 2023 15:48:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8jHK-0006be-KM; Thu, 30 Nov 2023 15:48:38 +0000
Received: by outflank-mailman (input) for mailman id 645011;
 Thu, 30 Nov 2023 15:48:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hcd2=HL=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1r8jHI-0006a5-Sc
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 15:48:36 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebb3c753-8f97-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 16:48:35 +0100 (CET)
Received: from Dell.homenet.telecomitalia.it
 (host-82-59-158-146.retail.telecomitalia.it [82.59.158.146])
 by support.bugseng.com (Postfix) with ESMTPSA id 085594EE073C;
 Thu, 30 Nov 2023 16:48:35 +0100 (CET)
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
X-Inumbo-ID: ebb3c753-8f97-11ee-98e4-6d05b1d4d9a1
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>
Subject: [XEN PATCH 1/2] x86/p2m: preparation work for xenmem_add_to_physmap_one()
Date: Thu, 30 Nov 2023 16:48:21 +0100
Message-Id: <aeafaee0fc4a507f6ba0c10e8fed90ed73a6bd6d.1701344917.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701344917.git.federico.serafini@bugseng.com>
References: <cover.1701344917.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The objective is to use parameter name "gfn" for
xenmem_add_to_physmap_one().
Since the name "gfn" is currently used as identifier for a local
variable, bad things could happen if new uses of such variable are
committed while a renaming patch is waiting for the approval.
To avoid such danger, as first thing rename the local variable from
"gfn" to "gmfn".

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/mm/p2m.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index fe9ccabb87..42508e1e7e 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -2417,7 +2417,7 @@ int xenmem_add_to_physmap_one(
     gfn_t gpfn)
 {
     struct page_info *page = NULL;
-    unsigned long gfn = 0 /* gcc ... */, old_gpfn;
+    unsigned long gmfn = 0 /* gcc ... */, old_gpfn;
     mfn_t prev_mfn;
     int rc = 0;
     mfn_t mfn = INVALID_MFN;
@@ -2440,12 +2440,12 @@ int xenmem_add_to_physmap_one(
 
     case XENMAPSPACE_gmfn:
     {
-        gfn = idx;
-        mfn = get_gfn_unshare(d, gfn, &p2mt);
+        gmfn = idx;
+        mfn = get_gfn_unshare(d, gmfn, &p2mt);
         /* If the page is still shared, exit early */
         if ( p2m_is_shared(p2mt) )
         {
-            put_gfn(d, gfn);
+            put_gfn(d, gmfn);
             return -ENOMEM;
         }
         page = get_page_from_mfn(mfn, d);
@@ -2480,7 +2480,7 @@ int xenmem_add_to_physmap_one(
     /* XENMAPSPACE_gmfn: Check if the MFN is associated with another GFN. */
     old_gpfn = get_gpfn_from_mfn(mfn_x(mfn));
     ASSERT(!SHARED_M2P(old_gpfn));
-    if ( space == XENMAPSPACE_gmfn && old_gpfn != gfn )
+    if ( space == XENMAPSPACE_gmfn && old_gpfn != gmfn )
     {
         rc = -EXDEV;
         goto put_all;
@@ -2518,7 +2518,7 @@ int xenmem_add_to_physmap_one(
      */
     if ( space == XENMAPSPACE_gmfn )
     {
-        put_gfn(d, gfn);
+        put_gfn(d, gmfn);
         if ( !rc && extra.ppage )
         {
             *extra.ppage = page;
-- 
2.34.1


