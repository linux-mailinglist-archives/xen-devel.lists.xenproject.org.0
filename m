Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 473DA57659F
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 19:03:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368357.599609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCOio-000326-KM; Fri, 15 Jul 2022 17:03:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368357.599609; Fri, 15 Jul 2022 17:03:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCOio-00030F-Gb; Fri, 15 Jul 2022 17:03:22 +0000
Received: by outflank-mailman (input) for mailman id 368357;
 Fri, 15 Jul 2022 17:03:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oCOim-0002eD-CJ
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 17:03:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oCOim-0001F6-6Z; Fri, 15 Jul 2022 17:03:20 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oCOil-0007gg-VD; Fri, 15 Jul 2022 17:03:20 +0000
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
	bh=Bsjke5ID8DQGCSuhgcRoj1MKXOjC6ERn1kNwJSr/oAY=; b=2lD/AJZDGttXngLR3/Ei8/hPKh
	vQblHlz9cPwU18EDIXMCP+gM4miqO130gb79XxyaSwpQXu32mKjVSyUQnHM906ffE7Rc78pUdeg48
	ddsIJVlVcJM+N1BORfYS3bACL/EJJR4SKqbMJAIGwLyItVT+jDAP/xRNy4DjGtmpk/CE=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/3] xen/heap: Split init_heap_pages() in two
Date: Fri, 15 Jul 2022 18:03:11 +0100
Message-Id: <20220715170312.13931-3-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220715170312.13931-1-julien@xen.org>
References: <20220715170312.13931-1-julien@xen.org>
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
    - _init_heap_pages(): will initialize a set of pages belonging to
      the same NUMA node. In a follow-up patch, new requirements will
      be added (e.g. pages should belong to the same zone). For now the
      pages are still passed one by one to free_heap_pages().

Note that the comment before init_heap_pages() is heavily outdated and
does not reflect the current code. So update it.

This patch is a merge/rework of patches from David Woodhouse and
Hongyan Xia.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

Interestingly, I was expecting this patch to perform worse. However,
from testing there is a small increase in perf.

That said, I mainly plit the patch because it keeps refactoring and
optimization separated.

Changes in v2:
    - Rename init_contig_pages() to _init_heap_pages()
    - Fold is_contig_page()
---
 xen/common/page_alloc.c | 77 ++++++++++++++++++++++++++---------------
 1 file changed, 50 insertions(+), 27 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 078c2990041d..eedb2fed77c3 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1778,16 +1778,44 @@ int query_page_offline(mfn_t mfn, uint32_t *status)
 }
 
 /*
- * Hand the specified arbitrary page range to the specified heap zone
- * checking the node_id of the previous page.  If they differ and the
- * latter is not on a MAX_ORDER boundary, then we reserve the page by
- * not freeing it to the buddy allocator.
+ * This function should only be called with valid pages from the same NUMA
+ * node.
  */
+static void _init_heap_pages(const struct page_info *pg,
+                             unsigned long nr_pages,
+                             bool need_scrub)
+{
+    unsigned long s, e;
+    unsigned int nid = phys_to_nid(page_to_maddr(pg));
+
+    s = mfn_x(page_to_mfn(pg));
+    e = mfn_x(mfn_add(page_to_mfn(pg + nr_pages - 1), 1));
+    if ( unlikely(!avail[nid]) )
+    {
+        bool use_tail = IS_ALIGNED(s, 1UL << MAX_ORDER) &&
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
@@ -1812,35 +1840,30 @@ static void init_heap_pages(
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
+        /*
+         * _init_heap_pages() is only able to accept range following
+         * specific property (see comment on top of _init_heap_pages()).
+         *
+         * So break down the range in smaller set.
+         */
+        for ( contig_pages = 1; contig_pages < left; contig_pages++ )
         {
-            unsigned long s = mfn_x(page_to_mfn(pg + i));
-            unsigned long e = mfn_x(mfn_add(page_to_mfn(pg + nr_pages - 1), 1));
-            bool use_tail = (nid == phys_to_nid(pfn_to_paddr(e - 1))) &&
-                            IS_ALIGNED(s, 1UL << MAX_ORDER) &&
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
+            if ( nid != (phys_to_nid(page_to_maddr(pg))) )
                 break;
-            nr_pages -= n;
         }
 
-        free_heap_pages(pg + i, 0, scrub_debug || idle_scrub);
+        _init_heap_pages(pg, contig_pages, need_scrub);
+
+        pg += contig_pages;
+        i += contig_pages;
     }
 }
 
-- 
2.32.0


