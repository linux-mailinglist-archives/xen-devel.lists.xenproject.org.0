Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB095569E96
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 11:32:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362864.593127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9NrU-0001Xm-V6; Thu, 07 Jul 2022 09:31:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362864.593127; Thu, 07 Jul 2022 09:31:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9NrU-0001V9-S4; Thu, 07 Jul 2022 09:31:52 +0000
Received: by outflank-mailman (input) for mailman id 362864;
 Thu, 07 Jul 2022 09:31:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DTeC=XM=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1o9NjX-00032J-2a
 for xen-devel@lists.xenproject.org; Thu, 07 Jul 2022 09:23:39 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 79d1636a-fdd6-11ec-924f-1f966e50362f;
 Thu, 07 Jul 2022 11:23:35 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75F361063;
 Thu,  7 Jul 2022 02:23:35 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 89C893F792;
 Thu,  7 Jul 2022 02:23:31 -0700 (PDT)
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
X-Inumbo-ID: 79d1636a-fdd6-11ec-924f-1f966e50362f
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
Subject: [PATCH v8 8/9] xen: introduce prepare_staticmem_pages
Date: Thu,  7 Jul 2022 17:22:43 +0800
Message-Id: <20220707092244.485936-9-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707092244.485936-1-Penny.Zheng@arm.com>
References: <20220707092244.485936-1-Penny.Zheng@arm.com>
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
index b01272a59a..6112f6a3ed 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2702,26 +2702,13 @@ void free_domstatic_page(struct page_info *page)
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
 
@@ -2732,7 +2719,7 @@ static struct page_info * __init acquire_staticmem_pages(mfn_t smfn,
         {
             printk(XENLOG_ERR
                    "pg[%lu] Static MFN %"PRI_mfn" c=%#lx t=%#x\n",
-                   i, mfn_x(smfn) + i,
+                   i, mfn_x(page_to_mfn(pg)) + i,
                    pg[i].count_info, pg[i].tlbflush_timestamp);
             goto out_err;
         }
@@ -2756,6 +2743,38 @@ static struct page_info * __init acquire_staticmem_pages(mfn_t smfn,
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
@@ -2764,14 +2783,6 @@ static struct page_info * __init acquire_staticmem_pages(mfn_t smfn,
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


