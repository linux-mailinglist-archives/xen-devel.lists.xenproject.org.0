Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA961A9009
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 03:03:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOWSI-0001EO-P0; Wed, 15 Apr 2020 01:03:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NGac=57=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jOWSH-0001Dc-4a
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 01:03:05 +0000
X-Inumbo-ID: d991c32a-7eb4-11ea-89ec-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d991c32a-7eb4-11ea-89ec-12813bfff9fa;
 Wed, 15 Apr 2020 01:03:00 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3258D20857;
 Wed, 15 Apr 2020 01:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586912579;
 bh=7207g/eifnxKqKtgIrYV/hVTptHqGaliYQujFgsQjjk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=p7wsTRFGJteqpd8bB4jmalT0FlD99CipBIjKuN9ha085Mqo28nY3jZw6t/7AzH4lw
 Cu05jMJBobNGGrKl3p2GfTcCRu9RtOgGIl30NrGalMa/VYl3xIdn412RaP/Arfr/4S
 lqRElwR96hQiL3GjuN4fG0uTnCo2agjibJsM74hg=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 05/12] xen: introduce reserve_heap_pages
Date: Tue, 14 Apr 2020 18:02:48 -0700
Message-Id: <20200415010255.10081-5-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: sstabellini@kernel.org, julien@xen.org, Wei Liu <wl@xen.org>,
 andrew.cooper3@citrix.com, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, jbeulich@suse.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Volodymyr_Babchuk@epam.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Introduce a function named reserve_heap_pages (similar to
alloc_heap_pages) that allocates a requested memory range. Call
__alloc_heap_pages for the implementation.

Change __alloc_heap_pages so that the original page doesn't get
modified, giving back unneeded memory top to bottom rather than bottom
to top.

Also introduce a function named reserve_domheap_pages, similar to
alloc_domheap_pages, that checks memflags before calling
reserve_heap_pages. It also assign_pages to the domain on success.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
CC: andrew.cooper3@citrix.com
CC: jbeulich@suse.com
CC: George Dunlap <george.dunlap@citrix.com>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/common/page_alloc.c | 72 ++++++++++++++++++++++++++++++++++++++---
 xen/include/xen/mm.h    |  2 ++
 2 files changed, 69 insertions(+), 5 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 79ae64d4b8..3a9c1a291b 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -911,7 +911,7 @@ static struct page_info *get_free_buddy(unsigned int zone_lo,
     }
 }
 
-static void __alloc_heap_pages(struct page_info **pgo,
+static void __alloc_heap_pages(struct page_info *pg,
                                unsigned int order,
                                unsigned int memflags,
                                struct domain *d)
@@ -922,7 +922,7 @@ static void __alloc_heap_pages(struct page_info **pgo,
     bool need_tlbflush = false;
     uint32_t tlbflush_timestamp = 0;
     unsigned int dirty_cnt = 0;
-    struct page_info *pg = *pgo;
+    struct page_info *pg_start = pg;
 
     node = phys_to_nid(page_to_maddr(pg));
     zone = page_to_zone(pg);
@@ -934,10 +934,10 @@ static void __alloc_heap_pages(struct page_info **pgo,
     while ( buddy_order != order )
     {
         buddy_order--;
+        pg = pg_start + (1U << buddy_order);
         page_list_add_scrub(pg, node, zone, buddy_order,
                             (1U << buddy_order) > first_dirty ?
                             first_dirty : INVALID_DIRTY_IDX);
-        pg += 1U << buddy_order;
 
         if ( first_dirty != INVALID_DIRTY_IDX )
         {
@@ -948,7 +948,7 @@ static void __alloc_heap_pages(struct page_info **pgo,
                 first_dirty = 0; /* We've moved past original first_dirty */
         }
     }
-    *pgo = pg;
+    pg = pg_start;
 
     ASSERT(avail[node][zone] >= request);
     avail[node][zone] -= request;
@@ -1073,7 +1073,42 @@ static struct page_info *alloc_heap_pages(
         return NULL;
     }
 
-    __alloc_heap_pages(&pg, order, memflags, d);
+    __alloc_heap_pages(pg, order, memflags, d);
+    return pg;
+}
+
+static struct page_info *reserve_heap_pages(struct domain *d,
+                                            paddr_t start,
+                                            unsigned int order,
+                                            unsigned int memflags)
+{
+    nodeid_t node;
+    unsigned int zone;
+    struct page_info *pg;
+
+    if ( unlikely(order > MAX_ORDER) )
+        return NULL;
+
+    spin_lock(&heap_lock);
+
+    /*
+     * Claimed memory is considered unavailable unless the request
+     * is made by a domain with sufficient unclaimed pages.
+     */
+    if ( (outstanding_claims + (1UL << order) > total_avail_pages) &&
+          ((memflags & MEMF_no_refcount) ||
+           !d || d->outstanding_pages < (1UL << order)) )
+    {
+        spin_unlock(&heap_lock);
+        return NULL;
+    }
+
+    pg = maddr_to_page(start);
+    node = phys_to_nid(start);
+    zone = page_to_zone(pg);
+    page_list_del(pg, &heap(node, zone, order));
+
+    __alloc_heap_pages(pg, order, memflags, d);
     return pg;
 }
 
@@ -2385,6 +2420,33 @@ struct page_info *alloc_domheap_pages(
     return pg;
 }
 
+struct page_info *reserve_domheap_pages(
+    struct domain *d, paddr_t start, unsigned int order, unsigned int memflags)
+{
+    struct page_info *pg = NULL;
+
+    ASSERT(!in_irq());
+
+    if ( memflags & MEMF_no_owner )
+        memflags |= MEMF_no_refcount;
+    else if ( (memflags & MEMF_no_refcount) && d )
+    {
+        ASSERT(!(memflags & MEMF_no_refcount));
+        return NULL;
+    }
+
+    pg = reserve_heap_pages(d, start, order, memflags);
+
+    if ( d && !(memflags & MEMF_no_owner) &&
+         assign_pages(d, pg, order, memflags) )
+    {
+        free_heap_pages(pg, order, memflags & MEMF_no_scrub);
+        return NULL;
+    }
+
+    return pg;
+}
+
 void free_domheap_pages(struct page_info *pg, unsigned int order)
 {
     struct domain *d = page_get_owner(pg);
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 9b62087be1..35407e1b68 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -199,6 +199,8 @@ void get_outstanding_claims(uint64_t *free_pages, uint64_t *outstanding_pages);
 void init_domheap_pages(paddr_t ps, paddr_t pe);
 struct page_info *alloc_domheap_pages(
     struct domain *d, unsigned int order, unsigned int memflags);
+struct page_info *reserve_domheap_pages(
+    struct domain *d, paddr_t start, unsigned int order, unsigned int memflags);
 void free_domheap_pages(struct page_info *pg, unsigned int order);
 unsigned long avail_domheap_pages_region(
     unsigned int node, unsigned int min_width, unsigned int max_width);
-- 
2.17.1


