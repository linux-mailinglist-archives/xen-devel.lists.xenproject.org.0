Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAB0550EA3
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jun 2022 04:45:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352205.578991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o37Pb-0007SM-72; Mon, 20 Jun 2022 02:45:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352205.578991; Mon, 20 Jun 2022 02:45:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o37Pb-0007Ok-2a; Mon, 20 Jun 2022 02:45:11 +0000
Received: by outflank-mailman (input) for mailman id 352205;
 Mon, 20 Jun 2022 02:45:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dqE0=W3=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1o37PZ-0005AM-02
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 02:45:09 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id feeef90b-f042-11ec-b725-ed86ccbb4733;
 Mon, 20 Jun 2022 04:45:08 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 880601042;
 Sun, 19 Jun 2022 19:45:07 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 385883F7D7;
 Sun, 19 Jun 2022 19:45:03 -0700 (PDT)
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
X-Inumbo-ID: feeef90b-f042-11ec-b725-ed86ccbb4733
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
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v7 8/9] xen: introduce prepare_staticmem_pages
Date: Mon, 20 Jun 2022 10:44:07 +0800
Message-Id: <20220620024408.203797-9-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620024408.203797-1-Penny.Zheng@arm.com>
References: <20220620024408.203797-1-Penny.Zheng@arm.com>
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
index 7d223087c0..fee396a92d 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2673,26 +2673,13 @@ void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
     spin_unlock(&heap_lock);
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
 
@@ -2703,7 +2690,7 @@ static struct page_info * __init acquire_staticmem_pages(mfn_t smfn,
         {
             printk(XENLOG_ERR
                    "pg[%lu] Static MFN %"PRI_mfn" c=%#lx t=%#x\n",
-                   i, mfn_x(smfn) + i,
+                   i, mfn_x(page_to_mfn(pg)) + i,
                    pg[i].count_info, pg[i].tlbflush_timestamp);
             goto out_err;
         }
@@ -2727,6 +2714,38 @@ static struct page_info * __init acquire_staticmem_pages(mfn_t smfn,
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
@@ -2735,14 +2754,6 @@ static struct page_info * __init acquire_staticmem_pages(mfn_t smfn,
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


