Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A512C594EC6
	for <lists+xen-devel@lfdr.de>; Tue, 16 Aug 2022 04:39:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387872.624368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNmUL-0003Ub-Fy; Tue, 16 Aug 2022 02:39:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387872.624368; Tue, 16 Aug 2022 02:39:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNmUL-0003SA-BX; Tue, 16 Aug 2022 02:39:29 +0000
Received: by outflank-mailman (input) for mailman id 387872;
 Tue, 16 Aug 2022 02:39:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YdlV=YU=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oNmSe-0007FY-NQ
 for xen-devel@lists.xenproject.org; Tue, 16 Aug 2022 02:37:44 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 67a0112f-1d0c-11ed-924f-1f966e50362f;
 Tue, 16 Aug 2022 04:37:43 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D42D8106F;
 Mon, 15 Aug 2022 19:37:43 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A9D753F70D;
 Mon, 15 Aug 2022 19:37:39 -0700 (PDT)
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
X-Inumbo-ID: 67a0112f-1d0c-11ed-924f-1f966e50362f
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Penny Zheng <penny.zheng@arm.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v10 7/9] xen: introduce prepare_staticmem_pages
Date: Tue, 16 Aug 2022 10:36:56 +0800
Message-Id: <20220816023658.3551936-8-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220816023658.3551936-1-Penny.Zheng@arm.com>
References: <20220816023658.3551936-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Later, we want to use acquire_domstatic_pages() for populating memory
for static domain on runtime, however, there are a lot of pointless work
(checking mfn_valid(), scrubbing the free part, cleaning the cache...)
considering we know the page is valid and belong to the guest.

This commit splits acquire_staticmem_pages() in two parts, and
introduces prepare_staticmem_pages to bypass all "pointless work".

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
v10 changes:
- no change
---
v9 changes:
- no change
---
v8 changes:
- no change
---
v7 changes:
- no change
---
v6 changes:
- adapt to PGC_static
---
v5 changes:
- new commit
---
 xen/common/page_alloc.c | 61 ++++++++++++++++++++++++-----------------
 1 file changed, 36 insertions(+), 25 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 25521af600..0ee697705c 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2751,26 +2751,13 @@ void free_domstatic_page(struct page_info *page)
         put_domain(d);
 }
 
-/*
- * Acquire nr_mfns contiguous reserved pages, starting at #smfn, of
- * static memory.
- * This function needs to be reworked if used outside of boot.
- */
-static struct page_info * __init acquire_staticmem_pages(mfn_t smfn,
-                                                         unsigned long nr_mfns,
-                                                         unsigned int memflags)
+static bool __init prepare_staticmem_pages(struct page_info *pg,
+                                           unsigned long nr_mfns,
+                                           unsigned int memflags)
 {
     bool need_tlbflush = false;
     uint32_t tlbflush_timestamp = 0;
     unsigned long i;
-    struct page_info *pg;
-
-    ASSERT(nr_mfns);
-    for ( i = 0; i < nr_mfns; i++ )
-        if ( !mfn_valid(mfn_add(smfn, i)) )
-            return NULL;
-
-    pg = mfn_to_page(smfn);
 
     spin_lock(&heap_lock);
 
@@ -2781,7 +2768,7 @@ static struct page_info * __init acquire_staticmem_pages(mfn_t smfn,
         {
             printk(XENLOG_ERR
                    "pg[%lu] Static MFN %"PRI_mfn" c=%#lx t=%#x\n",
-                   i, mfn_x(smfn) + i,
+                   i, mfn_x(page_to_mfn(pg)) + i,
                    pg[i].count_info, pg[i].tlbflush_timestamp);
             goto out_err;
         }
@@ -2805,6 +2792,38 @@ static struct page_info * __init acquire_staticmem_pages(mfn_t smfn,
     if ( need_tlbflush )
         filtered_flush_tlb_mask(tlbflush_timestamp);
 
+    return true;
+
+ out_err:
+    while ( i-- )
+        pg[i].count_info = PGC_static | PGC_state_free;
+
+    spin_unlock(&heap_lock);
+
+    return false;
+}
+
+/*
+ * Acquire nr_mfns contiguous reserved pages, starting at #smfn, of
+ * static memory.
+ * This function needs to be reworked if used outside of boot.
+ */
+static struct page_info * __init acquire_staticmem_pages(mfn_t smfn,
+                                                         unsigned long nr_mfns,
+                                                         unsigned int memflags)
+{
+    unsigned long i;
+    struct page_info *pg;
+
+    ASSERT(nr_mfns);
+    for ( i = 0; i < nr_mfns; i++ )
+        if ( !mfn_valid(mfn_add(smfn, i)) )
+            return NULL;
+
+    pg = mfn_to_page(smfn);
+    if ( !prepare_staticmem_pages(pg, nr_mfns, memflags) )
+        return NULL;
+
     /*
      * Ensure cache and RAM are consistent for platforms where the guest
      * can control its own visibility of/through the cache.
@@ -2813,14 +2832,6 @@ static struct page_info * __init acquire_staticmem_pages(mfn_t smfn,
         flush_page_to_ram(mfn_x(smfn) + i, !(memflags & MEMF_no_icache_flush));
 
     return pg;
-
- out_err:
-    while ( i-- )
-        pg[i].count_info = PGC_static | PGC_state_free;
-
-    spin_unlock(&heap_lock);
-
-    return NULL;
 }
 
 /*
-- 
2.25.1


