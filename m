Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECEB8C6898
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 16:26:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722425.1126377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Fad-0002hF-Hz; Wed, 15 May 2024 14:26:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722425.1126377; Wed, 15 May 2024 14:26:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Fad-0002cl-E0; Wed, 15 May 2024 14:26:43 +0000
Received: by outflank-mailman (input) for mailman id 722425;
 Wed, 15 May 2024 14:26:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kRjG=MS=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1s7Fac-0002KG-3E
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 14:26:42 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 2504f786-12c7-11ef-b4bb-af5377834399;
 Wed, 15 May 2024 16:26:40 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5782715A1;
 Wed, 15 May 2024 07:27:04 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB4BE3F7A6;
 Wed, 15 May 2024 07:26:38 -0700 (PDT)
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
X-Inumbo-ID: 2504f786-12c7-11ef-b4bb-af5377834399
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v2 3/7] xen/p2m: put reference for level 2 superpage
Date: Wed, 15 May 2024 15:26:21 +0100
Message-Id: <20240515142626.3480640-4-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240515142626.3480640-1-luca.fancellu@arm.com>
References: <20240515142626.3480640-1-luca.fancellu@arm.com>
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

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
v2:
 - Do not handle 1GB super page as there might be some issue where
   a lot of calls to put_page(...) might be issued which could lead
   to free memory that is a long operation.
v1:
 - patch from https://patchwork.kernel.org/project/xen-devel/patch/20231206090623.1932275-9-Penny.Zheng@arm.com/
---
 xen/arch/arm/mmu/p2m.c | 57 +++++++++++++++++++++++++++++-------------
 1 file changed, 40 insertions(+), 17 deletions(-)

diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 41fcca011cf4..29fdb3b87dd0 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -753,17 +753,9 @@ static int p2m_mem_access_radix_set(struct p2m_domain *p2m, gfn_t gfn,
     return rc;
 }
 
-/*
- * Put any references on the single 4K page referenced by pte.
- * TODO: Handle superpages, for now we only take special references for leaf
- * pages (specifically foreign ones, which can't be super mapped today).
- */
-static void p2m_put_l3_page(const lpae_t pte)
+/* Put any references on the single 4K page referenced by mfn. */
+static void p2m_put_l3_page(mfn_t mfn, p2m_type_t type)
 {
-    mfn_t mfn = lpae_get_mfn(pte);
-
-    ASSERT(p2m_is_valid(pte));
-
     /*
      * TODO: Handle other p2m types
      *
@@ -771,16 +763,44 @@ static void p2m_put_l3_page(const lpae_t pte)
      * flush the TLBs if the page is reallocated before the end of
      * this loop.
      */
-    if ( p2m_is_foreign(pte.p2m.type) )
+    if ( p2m_is_foreign(type) )
     {
         ASSERT(mfn_valid(mfn));
         put_page(mfn_to_page(mfn));
     }
     /* Detect the xenheap page and mark the stored GFN as invalid. */
-    else if ( p2m_is_ram(pte.p2m.type) && is_xen_heap_mfn(mfn) )
+    else if ( p2m_is_ram(type) && is_xen_heap_mfn(mfn) )
         page_set_xenheap_gfn(mfn_to_page(mfn), INVALID_GFN);
 }
 
+/* Put any references on the superpage referenced by mfn. */
+static void p2m_put_l2_superpage(mfn_t mfn, p2m_type_t type)
+{
+    unsigned int i;
+    unsigned int level_order = XEN_PT_LEVEL_ORDER(3);
+
+    for ( i = 0; i < XEN_PT_LPAE_ENTRIES; i++ )
+    {
+        p2m_put_l3_page(mfn, type);
+
+        mfn = mfn_add(mfn, 1 << level_order);
+    }
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
@@ -809,9 +829,10 @@ static void p2m_free_entry(struct p2m_domain *p2m,
 #endif
 
         p2m->stats.mappings[level]--;
-        /* Nothing to do if the entry is a super-page. */
-        if ( level == 3 )
-            p2m_put_l3_page(entry);
+        /* TODO: Currently we don't handle 1GB super-page. */
+        if ( level >= 2 )
+            p2m_put_page(entry, level);
+
         return;
     }
 
@@ -1558,9 +1579,11 @@ int relinquish_p2m_mapping(struct domain *d)
 
         count++;
         /*
-         * Arbitrarily preempt every 512 iterations.
+         * Arbitrarily preempt every 512 iterations or when type is foreign
+         * mapping and the order is above 9 (2MB).
          */
-        if ( !(count % 512) && hypercall_preempt_check() )
+        if ( (!(count % 512) || (p2m_is_foreign(t) && (order > 9))) &&
+             hypercall_preempt_check() )
         {
             rc = -ERESTART;
             break;
-- 
2.34.1


