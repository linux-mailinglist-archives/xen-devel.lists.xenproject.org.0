Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDAB8CE56D
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 14:41:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729479.1134637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAUET-0008Bx-KK; Fri, 24 May 2024 12:41:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729479.1134637; Fri, 24 May 2024 12:41:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAUET-000867-Dw; Fri, 24 May 2024 12:41:13 +0000
Received: by outflank-mailman (input) for mailman id 729479;
 Fri, 24 May 2024 12:41:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BPhY=M3=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1sAUES-00083d-38
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 12:41:12 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id e52d0a9d-19ca-11ef-b4bb-af5377834399;
 Fri, 24 May 2024 14:41:09 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DFCE71688;
 Fri, 24 May 2024 05:41:32 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B9D423F641;
 Fri, 24 May 2024 05:41:07 -0700 (PDT)
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
X-Inumbo-ID: e52d0a9d-19ca-11ef-b4bb-af5377834399
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v4 3/7] xen/p2m: put reference for level 2 superpage
Date: Fri, 24 May 2024 13:40:51 +0100
Message-Id: <20240524124055.3871399-4-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524124055.3871399-1-luca.fancellu@arm.com>
References: <20240524124055.3871399-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Penny Zheng <Penny.Zheng@arm.com>

We are doing foreign memory mapping for static shared memory, and
there is a great possibility that it could be super mapped.
But today, p2m_put_l3_page could not handle superpages.

This commits implements a new function p2m_put_l2_superpage to handle
2MB superpages, specifically for helping put extra references for
foreign superpages.

Modify relinquish_p2m_mapping as well to take into account preemption
when type is foreign memory and order is above 9 (2MB).

Currently 1GB superpages are not handled because Xen is not preemptible
and therefore some work is needed to handle such superpages, for which
at some point Xen might end up freeing memory and therefore for such a
big mapping it could end up in a very long operation.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
v4 changes:
 - optimised the path to call put_page() on the foreign mapping as
   Julien suggested. Add a comment in p2m_put_l2_superpage to state
   that any changes needs to take into account some change in the
   relinquish code. (Julien)
v3 changes:
 - Add reasoning why we don't support now 1GB superpage, remove level_order
   variable from p2m_put_l2_superpage, update TODO comment inside
   p2m_free_entry, use XEN_PT_LEVEL_ORDER(2) instead of value 9 inside
   relinquish_p2m_mapping. (Michal)
v2:
 - Do not handle 1GB super page as there might be some issue where
   a lot of calls to put_page(...) might be issued which could lead
   to free memory that is a long operation.
v1:
 - patch from https://patchwork.kernel.org/project/xen-devel/patch/20231206090623.1932275-9-Penny.Zheng@arm.com/
---
 xen/arch/arm/mmu/p2m.c | 82 +++++++++++++++++++++++++++++++-----------
 1 file changed, 62 insertions(+), 20 deletions(-)

diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 41fcca011cf4..986c5a03c54b 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -753,34 +753,66 @@ static int p2m_mem_access_radix_set(struct p2m_domain *p2m, gfn_t gfn,
     return rc;
 }
 
-/*
- * Put any references on the single 4K page referenced by pte.
- * TODO: Handle superpages, for now we only take special references for leaf
- * pages (specifically foreign ones, which can't be super mapped today).
- */
-static void p2m_put_l3_page(const lpae_t pte)
+static void p2m_put_foreign_page(struct page_info *pg)
 {
-    mfn_t mfn = lpae_get_mfn(pte);
-
-    ASSERT(p2m_is_valid(pte));
-
     /*
-     * TODO: Handle other p2m types
-     *
      * It's safe to do the put_page here because page_alloc will
      * flush the TLBs if the page is reallocated before the end of
      * this loop.
      */
-    if ( p2m_is_foreign(pte.p2m.type) )
+    put_page(pg);
+}
+
+/* Put any references on the single 4K page referenced by mfn. */
+static void p2m_put_l3_page(mfn_t mfn, p2m_type_t type)
+{
+    /* TODO: Handle other p2m types */
+    if ( p2m_is_foreign(type) )
     {
         ASSERT(mfn_valid(mfn));
-        put_page(mfn_to_page(mfn));
+        p2m_put_foreign_page(mfn_to_page(mfn));
     }
     /* Detect the xenheap page and mark the stored GFN as invalid. */
-    else if ( p2m_is_ram(pte.p2m.type) && is_xen_heap_mfn(mfn) )
+    else if ( p2m_is_ram(type) && is_xen_heap_mfn(mfn) )
         page_set_xenheap_gfn(mfn_to_page(mfn), INVALID_GFN);
 }
 
+/* Put any references on the superpage referenced by mfn. */
+static void p2m_put_l2_superpage(mfn_t mfn, p2m_type_t type)
+{
+    struct page_info *pg;
+    unsigned int i;
+
+    /*
+     * TODO: Handle other p2m types, but be aware that any changes to handle
+     * different types should require an update on the relinquish code to handle
+     * preemption.
+     */
+    if ( !p2m_is_foreign(type) )
+        return;
+
+    ASSERT(mfn_valid(mfn));
+
+    pg = mfn_to_page(mfn);
+
+    for ( i = 0; i < XEN_PT_LPAE_ENTRIES; i++, pg++ )
+        p2m_put_foreign_page(pg);
+}
+
+/* Put any references on the page referenced by pte. */
+static void p2m_put_page(const lpae_t pte, unsigned int level)
+{
+    mfn_t mfn = lpae_get_mfn(pte);
+
+    ASSERT(p2m_is_valid(pte));
+
+    /* We have a second level 2M superpage */
+    if ( p2m_is_superpage(pte, level) && (level == 2) )
+        return p2m_put_l2_superpage(mfn, pte.p2m.type);
+    else if ( level == 3 )
+        return p2m_put_l3_page(mfn, pte.p2m.type);
+}
+
 /* Free lpae sub-tree behind an entry */
 static void p2m_free_entry(struct p2m_domain *p2m,
                            lpae_t entry, unsigned int level)
@@ -809,9 +841,16 @@ static void p2m_free_entry(struct p2m_domain *p2m,
 #endif
 
         p2m->stats.mappings[level]--;
-        /* Nothing to do if the entry is a super-page. */
-        if ( level == 3 )
-            p2m_put_l3_page(entry);
+        /*
+         * TODO: Currently we don't handle 1GB super-page, Xen is not
+         * preemptible and therefore some work is needed to handle such
+         * superpages, for which at some point Xen might end up freeing memory
+         * and therefore for such a big mapping it could end up in a very long
+         * operation.
+         */
+        if ( level >= 2 )
+            p2m_put_page(entry, level);
+
         return;
     }
 
@@ -1558,9 +1597,12 @@ int relinquish_p2m_mapping(struct domain *d)
 
         count++;
         /*
-         * Arbitrarily preempt every 512 iterations.
+         * Arbitrarily preempt every 512 iterations or when type is foreign
+         * mapping and the order is above 9 (2MB).
          */
-        if ( !(count % 512) && hypercall_preempt_check() )
+        if ( (!(count % 512) ||
+              (p2m_is_foreign(t) && (order > XEN_PT_LEVEL_ORDER(2)))) &&
+             hypercall_preempt_check() )
         {
             rc = -ERESTART;
             break;
-- 
2.34.1


