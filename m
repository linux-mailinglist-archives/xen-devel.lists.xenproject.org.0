Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A79365445B9
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 10:31:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.344766.570385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzDZ7-0001WP-By; Thu, 09 Jun 2022 08:30:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 344766.570385; Thu, 09 Jun 2022 08:30:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzDZ7-0001V3-5t; Thu, 09 Jun 2022 08:30:53 +0000
Received: by outflank-mailman (input) for mailman id 344766;
 Thu, 09 Jun 2022 08:30:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nzDZ5-0001Rg-W1
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 08:30:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nzDZ5-0002Mz-L8; Thu, 09 Jun 2022 08:30:51 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nzDZ5-0001qx-CA; Thu, 09 Jun 2022 08:30:51 +0000
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
	bh=ZiWn/AllIOhVkpe3HghVI1xsTWWu2FCQf6ihSSFqwAc=; b=zCKC0A8Q9YSIyv516jc+2x413r
	mwGK88HMmrYWgDpQaYEs/Kmc/pbb2ezvngXhWiZVB1f61Yrjh3yn9jviiEAZ3L9Fz5WJBHdwN90dd
	MMecSlgPaaRfhWVMLfurI/8q1Dwgle9rgBqgSBGkZDkGavW+ZDcZqA2LpMAtU+AD3S7I=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	Hongyan Xia <hongyxia@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH 2/2] xen/heap: pass order to free_heap_pages() in heap init
Date: Thu,  9 Jun 2022 09:30:39 +0100
Message-Id: <20220609083039.76667-3-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220609083039.76667-1-julien@xen.org>
References: <20220609083039.76667-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hongyan Xia <hongyxia@amazon.com>

The idea is to split the range into multiple aligned power-of-2 regions
which only needs to call free_heap_pages() once each. We check the least
significant set bit of the start address and use its bit index as the
order of this increment. This makes sure that each increment is both
power-of-2 and properly aligned, which can be safely passed to
free_heap_pages(). Of course, the order also needs to be sanity checked
against the upper bound and MAX_ORDER.

Testing on a nested environment on c5.metal with various amount
of RAM. Time for end_boot_allocator() to complete:
            Before         After
    - 90GB: 1426 ms        166 ms
    -  8GB:  124 ms         12 ms
    -  4GB:   60 ms          6 ms

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/common/page_alloc.c | 39 +++++++++++++++++++++++++++++++++------
 1 file changed, 33 insertions(+), 6 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index a1938df1406c..bf852cfc11ea 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1779,16 +1779,28 @@ int query_page_offline(mfn_t mfn, uint32_t *status)
 
 /*
  * init_contig_heap_pages() is intended to only take pages from the same
- * NUMA node.
+ * NUMA node and zone.
+ *
+ * For the latter, it is always true for !CONFIG_SEPARATE_XENHEAP since
+ * free_heap_pages() can only take power-of-two ranges which never cross
+ * zone boundaries. But for separate xenheap which is manually defined,
+ * it is possible for a power-of-two range to cross zones, so we need to
+ * check that as well.
  */
-static bool is_contig_page(struct page_info *pg, unsigned int nid)
+static bool is_contig_page(struct page_info *pg, unsigned int nid,
+                           unsigned int zone)
 {
+#ifdef CONFIG_SEPARATE_XENHEAP
+    if ( zone != page_to_zone(pg) )
+        return false;
+#endif
+
     return (nid == (phys_to_nid(page_to_maddr(pg))));
 }
 
 /*
  * This function should only be called with valid pages from the same NUMA
- * node.
+ * node and the same zone.
  *
  * Callers should use is_contig_page() first to check if all the pages
  * in a range are contiguous.
@@ -1817,8 +1829,22 @@ static void init_contig_heap_pages(struct page_info *pg, unsigned long nr_pages,
 
     while ( s < e )
     {
-        free_heap_pages(mfn_to_page(_mfn(s)), 0, need_scrub);
-        s += 1UL;
+        /*
+         * For s == 0, we simply use the largest increment by checking the
+         * index of the MSB set. For s != 0, we also need to ensure that the
+         * chunk is properly sized to end at power-of-two alignment. We do this
+         * by checking the LSB set and use its index as the increment. Both
+         * cases need to be guarded by MAX_ORDER.
+         *
+         * Note that the value of ffsl() and flsl() starts from 1 so we need
+         * to decrement it by 1.
+         */
+        int inc_order = min(MAX_ORDER, flsl(e - s) - 1);
+
+        if ( s )
+            inc_order = min(inc_order, ffsl(s) - 1);
+        free_heap_pages(mfn_to_page(_mfn(s)), inc_order, need_scrub);
+        s += (1UL << inc_order);
     }
 }
 
@@ -1856,12 +1882,13 @@ static void init_heap_pages(
     for ( i = 0; i < nr_pages; )
     {
         unsigned int nid = phys_to_nid(page_to_maddr(pg));
+        unsigned int zone = page_to_zone(pg);
         unsigned long left = nr_pages - i;
         unsigned long contig_pages;
 
         for ( contig_pages = 1; contig_pages < left; contig_pages++ )
         {
-            if ( !is_contig_page(pg + contig_pages, nid) )
+            if ( !is_contig_page(pg + contig_pages, nid, zone) )
                 break;
         }
 
-- 
2.32.0


