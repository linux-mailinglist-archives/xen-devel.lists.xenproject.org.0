Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E83E578221B
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 06:01:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587218.918604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qXw6o-0006AA-Sl; Mon, 21 Aug 2023 04:01:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587218.918604; Mon, 21 Aug 2023 04:01:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qXw6o-00066s-MZ; Mon, 21 Aug 2023 04:01:42 +0000
Received: by outflank-mailman (input) for mailman id 587218;
 Mon, 21 Aug 2023 04:01:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Scea=EG=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qXw6n-0003VX-16
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 04:01:41 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 6dae723c-3fd7-11ee-9b0c-b553b5be7939;
 Mon, 21 Aug 2023 06:01:38 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC86E2F4;
 Sun, 20 Aug 2023 21:02:18 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 74B913F740;
 Sun, 20 Aug 2023 21:01:30 -0700 (PDT)
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
X-Inumbo-ID: 6dae723c-3fd7-11ee-9b0c-b553b5be7939
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v3 7/8] xen/p2m: put reference for superpage
Date: Mon, 21 Aug 2023 12:00:45 +0800
Message-Id: <20230821040046.2965665-8-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230821040046.2965665-1-Penny.Zheng@arm.com>
References: <20230821040046.2965665-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We are doing foreign memory mapping for static shared memory, and
there is a great possibility that it could be super mapped.
But today, p2m_put_l3_page could not handle superpages.

This commits implements a new function p2m_put_superpage to handle superpages,
specifically for helping put extra references for foreign superpages.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v1 -> v2:
- new commit
---
v2 -> v3:
- rebase and no change
---
 xen/arch/arm/p2m.c | 58 ++++++++++++++++++++++++++++++++++------------
 1 file changed, 43 insertions(+), 15 deletions(-)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index de32a2d638..b7b3db005e 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -851,17 +851,9 @@ static int p2m_mem_access_radix_set(struct p2m_domain *p2m, gfn_t gfn,
     return rc;
 }
 
-/*
- * Put any references on the single 4K page referenced by pte.
- * TODO: Handle superpages, for now we only take special references for leaf
- * pages (specifically foreign ones, which can't be super mapped today).
- */
-static void p2m_put_l3_page(const lpae_t pte)
+/* Put any references on the single 4K page referenced by mfn. */
+static void p2m_put_l3_page(mfn_t mfn, unsigned type)
 {
-    mfn_t mfn = lpae_get_mfn(pte);
-
-    ASSERT(p2m_is_valid(pte));
-
     /*
      * TODO: Handle other p2m types
      *
@@ -869,16 +861,53 @@ static void p2m_put_l3_page(const lpae_t pte)
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
+static void p2m_put_superpage(mfn_t mfn, unsigned int next_level, unsigned type)
+{
+    unsigned int i;
+    unsigned int level_order = XEN_PT_LEVEL_ORDER(next_level);
+
+    for ( i = 0; i < XEN_PT_LPAE_ENTRIES; i++ )
+    {
+        if ( next_level == 3 )
+            p2m_put_l3_page(mfn, type);
+        else
+            p2m_put_superpage(mfn, next_level + 1, type);
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
+    /*
+     * We are either having a first level 1G superpage or a
+     * second level 2M superpage.
+     */
+    if ( p2m_is_superpage(pte, level) )
+        return p2m_put_superpage(mfn, level + 1, pte.p2m.type);
+    else
+    {
+        ASSERT(level == 3);
+        return p2m_put_l3_page(mfn, pte.p2m.type);
+    }
+}
+
 /* Free lpae sub-tree behind an entry */
 static void p2m_free_entry(struct p2m_domain *p2m,
                            lpae_t entry, unsigned int level)
@@ -907,9 +936,8 @@ static void p2m_free_entry(struct p2m_domain *p2m,
 #endif
 
         p2m->stats.mappings[level]--;
-        /* Nothing to do if the entry is a super-page. */
-        if ( level == 3 )
-            p2m_put_l3_page(entry);
+        p2m_put_page(entry, level);
+
         return;
     }
 
-- 
2.25.1


