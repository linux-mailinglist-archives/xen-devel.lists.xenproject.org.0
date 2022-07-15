Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 998B15765A1
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 19:03:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368358.599615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCOio-000377-TJ; Fri, 15 Jul 2022 17:03:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368358.599615; Fri, 15 Jul 2022 17:03:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCOio-000325-O5; Fri, 15 Jul 2022 17:03:22 +0000
Received: by outflank-mailman (input) for mailman id 368358;
 Fri, 15 Jul 2022 17:03:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oCOin-0002vl-Om
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 17:03:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oCOin-0001FL-HX; Fri, 15 Jul 2022 17:03:21 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oCOin-0007gg-93; Fri, 15 Jul 2022 17:03:21 +0000
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
	bh=pum9q+DodIOJh9CL2EYHuaYglNoP6XP3Sj591zoPRio=; b=2fBkNdi6/m3/X6Wou0bgX6JPce
	qLAUC8Sr8RnnatsnR64C2ES95wTF2jFTxUlGPMeFxZcxBNcm0sT2R59e5MjOfsPr8sxtua8nXdTis
	ltNNkjpuu9pJiVbe0hiKfeMd1C69u1+gJwhvi52nwpi1bNBquslFm07rlbLPsz73lPeo=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Hongyan Xia <hongyxia@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v2 3/3] xen/heap: pass order to free_heap_pages() in heap init
Date: Fri, 15 Jul 2022 18:03:12 +0100
Message-Id: <20220715170312.13931-4-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220715170312.13931-1-julien@xen.org>
References: <20220715170312.13931-1-julien@xen.org>
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

Tested on a nested environment on c5.metal with various amount
of RAM and CONFIG_DEBUG=n. Time for end_boot_allocator() to complete:
            Before         After
    - 90GB: 1445 ms         96 ms
    -  8GB:  126 ms          8 ms
    -  4GB:   62 ms          4 ms

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>

---

Changes in v2:
    - Update comment
    - Update the numbers. They are slightly better as is_contig_page()
      has been folded in init_heap_pages().
---
 xen/common/page_alloc.c | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index eedb2fed77c3..2b99801d2ea3 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1779,7 +1779,7 @@ int query_page_offline(mfn_t mfn, uint32_t *status)
 
 /*
  * This function should only be called with valid pages from the same NUMA
- * node.
+ * node and zone.
  */
 static void _init_heap_pages(const struct page_info *pg,
                              unsigned long nr_pages,
@@ -1806,8 +1806,22 @@ static void _init_heap_pages(const struct page_info *pg,
 
     while ( s < e )
     {
-        free_heap_pages(mfn_to_page(_mfn(s)), 0, need_scrub);
-        s += 1UL;
+        /*
+         * For s == 0, we simply use the largest increment by checking the
+         * MSB of the region size. For s != 0, we also need to ensure that the
+         * chunk is properly sized to end at power-of-two alignment. We do this
+         * by checking the LSB of the start address and use its index as
+         * the increment. Both cases need to be guarded by MAX_ORDER.
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
 
@@ -1844,6 +1858,9 @@ static void init_heap_pages(
 
     for ( i = 0; i < nr_pages; )
     {
+#ifdef CONFIG_SEPARATE_XENHEAP
+        unsigned int zone = page_to_zone(pg);
+#endif
         unsigned int nid = phys_to_nid(page_to_maddr(pg));
         unsigned long left = nr_pages - i;
         unsigned long contig_pages;
@@ -1856,6 +1873,18 @@ static void init_heap_pages(
          */
         for ( contig_pages = 1; contig_pages < left; contig_pages++ )
         {
+            /*
+             * No need to check for the zone when !CONFIG_SEPARATE_XENHEAP
+             * because free_heap_pages() can only take power-of-two ranges
+             * which never cross zone boundaries. But for separate xenheap
+             * which is manually defined, it is possible for power-of-two
+             * range to cross zones.
+             */
+#ifdef CONFIG_SEPARATE_XENHEAP
+            if ( zone != page_to_zone(pg) )
+                break;
+#endif
+
             if ( nid != (phys_to_nid(page_to_maddr(pg))) )
                 break;
         }
-- 
2.32.0


