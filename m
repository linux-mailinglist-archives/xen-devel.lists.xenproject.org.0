Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6655445BB
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 10:31:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.344765.570380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzDZ7-0001Uq-2k; Thu, 09 Jun 2022 08:30:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 344765.570380; Thu, 09 Jun 2022 08:30:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzDZ6-0001Ro-V4; Thu, 09 Jun 2022 08:30:52 +0000
Received: by outflank-mailman (input) for mailman id 344765;
 Thu, 09 Jun 2022 08:30:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nzDZ4-0001Dc-L7
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 08:30:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nzDZ4-0002Ml-5Y; Thu, 09 Jun 2022 08:30:50 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nzDZ3-0001qx-T6; Thu, 09 Jun 2022 08:30:50 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=cD3CnzUA7uhX3bAfaHZoI05qWLImHHGhMASI4zN+Amk=; b=4/o0eJ/GjP6VQ26C8lKXFTH+Pd
	EJp6ON2ZJpKCDqXzyl2YzQUYGA3qiez5bEGgOE6UY1wN/M06ZHsHZo7pxomUPOAygBV4d1lNJ4U7s
	uQSh9XvDVrLHXS2aeT7ufiLK3HhKjLVUQoCrguLIr7+UKc3nGHQjOL7cxBqyjchHSAyQ=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 1/2] xen/heap: Split init_heap_pages() in two
Date: Thu,  9 Jun 2022 09:30:38 +0100
Message-Id: <20220609083039.76667-2-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220609083039.76667-1-julien@xen.org>
References: <20220609083039.76667-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

At the moment, init_heap_pages() will call free_heap_pages() page
by page. To reduce the time to initialize the heap, we will want
to provide multiple pages at the same time.

init_heap_pages() is now split in two parts:
    - init_heap_pages(): will break down the range in multiple set
      of contiguous pages. For now, the criteria is the pages should
      belong to the same NUMA node.
    - init_contig_pages(): will initialize a set of contiguous pages.
      For now the pages are still passed one by one to free_heap_pages().

Note that the comment before init_heap_pages() is heavily outdated and
does not reflect the current code. So update it.

This patch is a merge/rework of patches from David Woodhouse and
Hongyan Xia.

Signed-off-by: Julien Grall <jgrall@amazon.com>

----

Interestingly, I was expecting this patch to perform worse. However,
from testing there is a small increase in perf.

That said, I split the patch because it keeps refactoring and
optimization separated.
---
 xen/common/page_alloc.c | 82 +++++++++++++++++++++++++++--------------
 1 file changed, 55 insertions(+), 27 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 3e6504283f1e..a1938df1406c 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1778,16 +1778,55 @@ int query_page_offline(mfn_t mfn, uint32_t *status)
 }
 
 /*
- * Hand the specified arbitrary page range to the specified heap zone
- * checking the node_id of the previous page.  If they differ and the
- * latter is not on a MAX_ORDER boundary, then we reserve the page by
- * not freeing it to the buddy allocator.
+ * init_contig_heap_pages() is intended to only take pages from the same
+ * NUMA node.
  */
+static bool is_contig_page(struct page_info *pg, unsigned int nid)
+{
+    return (nid == (phys_to_nid(page_to_maddr(pg))));
+}
+
+/*
+ * This function should only be called with valid pages from the same NUMA
+ * node.
+ *
+ * Callers should use is_contig_page() first to check if all the pages
+ * in a range are contiguous.
+ */
+static void init_contig_heap_pages(struct page_info *pg, unsigned long nr_pages,
+                                   bool need_scrub)
+{
+    unsigned long s, e;
+    unsigned int nid = phys_to_nid(page_to_maddr(pg));
+
+    s = mfn_x(page_to_mfn(pg));
+    e = mfn_x(mfn_add(page_to_mfn(pg + nr_pages - 1), 1));
+    if ( unlikely(!avail[nid]) )
+    {
+        bool use_tail = !(s & ((1UL << MAX_ORDER) - 1)) &&
+                        (find_first_set_bit(e) <= find_first_set_bit(s));
+        unsigned long n;
+
+        n = init_node_heap(nid, s, nr_pages, &use_tail);
+        BUG_ON(n > nr_pages);
+        if ( use_tail )
+            e -= n;
+        else
+            s += n;
+    }
+
+    while ( s < e )
+    {
+        free_heap_pages(mfn_to_page(_mfn(s)), 0, need_scrub);
+        s += 1UL;
+    }
+}
+
 static void init_heap_pages(
     struct page_info *pg, unsigned long nr_pages)
 {
     unsigned long i;
-    bool idle_scrub = false;
+    bool need_scrub = scrub_debug;
 
     /*
      * Keep MFN 0 away from the buddy allocator to avoid crossing zone
@@ -1812,35 +1851,24 @@ static void init_heap_pages(
     spin_unlock(&heap_lock);
 
     if ( system_state < SYS_STATE_active && opt_bootscrub == BOOTSCRUB_IDLE )
-        idle_scrub = true;
+        need_scrub = true;
 
-    for ( i = 0; i < nr_pages; i++ )
+    for ( i = 0; i < nr_pages; )
     {
-        unsigned int nid = phys_to_nid(page_to_maddr(pg+i));
+        unsigned int nid = phys_to_nid(page_to_maddr(pg));
+        unsigned long left = nr_pages - i;
+        unsigned long contig_pages;
 
-        if ( unlikely(!avail[nid]) )
+        for ( contig_pages = 1; contig_pages < left; contig_pages++ )
         {
-            unsigned long s = mfn_x(page_to_mfn(pg + i));
-            unsigned long e = mfn_x(mfn_add(page_to_mfn(pg + nr_pages - 1), 1));
-            bool use_tail = (nid == phys_to_nid(pfn_to_paddr(e - 1))) &&
-                            !(s & ((1UL << MAX_ORDER) - 1)) &&
-                            (find_first_set_bit(e) <= find_first_set_bit(s));
-            unsigned long n;
-
-            n = init_node_heap(nid, mfn_x(page_to_mfn(pg + i)), nr_pages - i,
-                               &use_tail);
-            BUG_ON(i + n > nr_pages);
-            if ( n && !use_tail )
-            {
-                i += n - 1;
-                continue;
-            }
-            if ( i + n == nr_pages )
+            if ( !is_contig_page(pg + contig_pages, nid) )
                 break;
-            nr_pages -= n;
         }
 
-        free_heap_pages(pg + i, 0, scrub_debug || idle_scrub);
+        init_contig_heap_pages(pg, contig_pages, need_scrub);
+
+        pg += contig_pages;
+        i += contig_pages;
     }
 }
 
-- 
2.32.0


