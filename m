Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F437FF3E8
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 16:49:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645013.1006756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8jHM-00076e-6E; Thu, 30 Nov 2023 15:48:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645013.1006756; Thu, 30 Nov 2023 15:48:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8jHM-00074u-3N; Thu, 30 Nov 2023 15:48:40 +0000
Received: by outflank-mailman (input) for mailman id 645013;
 Thu, 30 Nov 2023 15:48:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hcd2=HL=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1r8jHJ-0006bT-Ry
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 15:48:37 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ebd2b1a0-8f97-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 16:48:35 +0100 (CET)
Received: from Dell.homenet.telecomitalia.it
 (host-82-59-158-146.retail.telecomitalia.it [82.59.158.146])
 by support.bugseng.com (Postfix) with ESMTPSA id 3AEF04EE073E;
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
X-Inumbo-ID: ebd2b1a0-8f97-11ee-9b0f-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>
Subject: [XEN PATCH 2/2] x86/p2m: address a violation of MISRA C:2012 Rule 8.3
Date: Thu, 30 Nov 2023 16:48:22 +0100
Message-Id: <0faaa66465367a9e4c4da5749bc123b832e02103.1701344917.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701344917.git.federico.serafini@bugseng.com>
References: <cover.1701344917.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make function declaration and definition consistent changing
parameter name from "gpfn" to "gfn".
For consistency, rename also "old_gpfn" to "old_gfn".
No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
This patch depends on patch 1/2 of the same series.
---
 xen/arch/x86/mm/p2m.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index 42508e1e7e..6eb446e437 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -2414,10 +2414,10 @@ int xenmem_add_to_physmap_one(
     unsigned int space,
     union add_to_physmap_extra extra,
     unsigned long idx,
-    gfn_t gpfn)
+    gfn_t gfn)
 {
     struct page_info *page = NULL;
-    unsigned long gmfn = 0 /* gcc ... */, old_gpfn;
+    unsigned long gmfn = 0 /* gcc ... */, old_gfn;
     mfn_t prev_mfn;
     int rc = 0;
     mfn_t mfn = INVALID_MFN;
@@ -2431,7 +2431,7 @@ int xenmem_add_to_physmap_one(
         break;
 
     case XENMAPSPACE_grant_table:
-        rc = gnttab_map_frame(d, idx, gpfn, &mfn);
+        rc = gnttab_map_frame(d, idx, gfn, &mfn);
         if ( rc )
             return rc;
         /* Need to take care of the reference obtained in gnttab_map_frame(). */
@@ -2455,7 +2455,7 @@ int xenmem_add_to_physmap_one(
     }
 
     case XENMAPSPACE_gmfn_foreign:
-        return p2m_add_foreign(d, idx, gfn_x(gpfn), extra.foreign_domid);
+        return p2m_add_foreign(d, idx, gfn_x(gfn), extra.foreign_domid);
     }
 
     if ( mfn_eq(mfn, INVALID_MFN) )
@@ -2475,12 +2475,12 @@ int xenmem_add_to_physmap_one(
      * Upon freeing we wouldn't be able to find other mappings in the P2M
      * (unless we did a brute force search).
      */
-    prev_mfn = get_gfn(d, gfn_x(gpfn), &p2mt);
+    prev_mfn = get_gfn(d, gfn_x(gfn), &p2mt);
 
     /* XENMAPSPACE_gmfn: Check if the MFN is associated with another GFN. */
-    old_gpfn = get_gpfn_from_mfn(mfn_x(mfn));
-    ASSERT(!SHARED_M2P(old_gpfn));
-    if ( space == XENMAPSPACE_gmfn && old_gpfn != gmfn )
+    old_gfn = get_gpfn_from_mfn(mfn_x(mfn));
+    ASSERT(!SHARED_M2P(old_gfn));
+    if ( space == XENMAPSPACE_gmfn && old_gfn != gmfn )
     {
         rc = -EXDEV;
         goto put_all;
@@ -2493,22 +2493,22 @@ int xenmem_add_to_physmap_one(
     {
         if ( is_special_page(mfn_to_page(prev_mfn)) )
             /* Special pages are simply unhooked from this phys slot. */
-            rc = p2m_remove_page(d, gpfn, prev_mfn, PAGE_ORDER_4K);
+            rc = p2m_remove_page(d, gfn, prev_mfn, PAGE_ORDER_4K);
         else if ( !mfn_eq(mfn, prev_mfn) )
             /* Normal domain memory is freed, to avoid leaking memory. */
-            rc = guest_remove_page(d, gfn_x(gpfn));
+            rc = guest_remove_page(d, gfn_x(gfn));
     }
 
     /* Unmap from old location, if any. */
-    if ( !rc && old_gpfn != INVALID_M2P_ENTRY && !gfn_eq(_gfn(old_gpfn), gpfn) )
-        rc = p2m_remove_page(d, _gfn(old_gpfn), mfn, PAGE_ORDER_4K);
+    if ( !rc && old_gfn != INVALID_M2P_ENTRY && !gfn_eq(_gfn(old_gfn), gfn) )
+        rc = p2m_remove_page(d, _gfn(old_gfn), mfn, PAGE_ORDER_4K);
 
     /* Map at new location. */
     if ( !rc )
-        rc = p2m_add_page(d, gpfn, mfn, PAGE_ORDER_4K, p2m_ram_rw);
+        rc = p2m_add_page(d, gfn, mfn, PAGE_ORDER_4K, p2m_ram_rw);
 
  put_all:
-    put_gfn(d, gfn_x(gpfn));
+    put_gfn(d, gfn_x(gfn));
 
  put_both:
     /*
-- 
2.34.1


