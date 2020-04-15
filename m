Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 129871A9006
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 03:03:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOWSM-0001Ft-4B; Wed, 15 Apr 2020 01:03:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NGac=57=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jOWSK-0001FQ-FS
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 01:03:08 +0000
X-Inumbo-ID: d93f8b0a-7eb4-11ea-b4f4-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d93f8b0a-7eb4-11ea-b4f4-bc764e2007e4;
 Wed, 15 Apr 2020 01:02:59 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A5AD72083B;
 Wed, 15 Apr 2020 01:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586912579;
 bh=YV7d8M1BR8baRsXNvbLsTI5FkEiel89KL9GK6xJVhRk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xea7/ciO1nz2/OVyRSuWlcKWtX9VHsqi0YcK0pKXrNW3WohMbZp62cZvsAySHk6lC
 lmVpXdQLoNORTEVTgpatQy3ZqT1yG4D0fHlow0JPbSIfdpBzChQhsDQEuzplpYEUMS
 eqaojGPaKVpVoUE8Nmsb9xPuEFXHcMdPUfuDpWWo=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 04/12] xen: split alloc_heap_pages in two halves for
 reusability
Date: Tue, 14 Apr 2020 18:02:47 -0700
Message-Id: <20200415010255.10081-4-sstabellini@kernel.org>
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

This patch splits the implementation of alloc_heap_pages into two halves
so that the second half can be reused by the next patch.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
CC: andrew.cooper3@citrix.com
CC: jbeulich@suse.com
CC: George Dunlap <george.dunlap@citrix.com>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
CC: Wei Liu <wl@xen.org>
---
Comments are welcome. I am not convinced that this is the right way to
split it. Please let me know if you have any suggestions.
---
 xen/common/page_alloc.c | 94 +++++++++++++++++++++++------------------
 1 file changed, 53 insertions(+), 41 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 10b7aeca48..79ae64d4b8 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -911,54 +911,18 @@ static struct page_info *get_free_buddy(unsigned int zone_lo,
     }
 }
 
-/* Allocate 2^@order contiguous pages. */
-static struct page_info *alloc_heap_pages(
-    unsigned int zone_lo, unsigned int zone_hi,
-    unsigned int order, unsigned int memflags,
-    struct domain *d)
+static void __alloc_heap_pages(struct page_info **pgo,
+                               unsigned int order,
+                               unsigned int memflags,
+                               struct domain *d)
 {
     nodeid_t node;
     unsigned int i, buddy_order, zone, first_dirty;
     unsigned long request = 1UL << order;
-    struct page_info *pg;
     bool need_tlbflush = false;
     uint32_t tlbflush_timestamp = 0;
     unsigned int dirty_cnt = 0;
-
-    /* Make sure there are enough bits in memflags for nodeID. */
-    BUILD_BUG_ON((_MEMF_bits - _MEMF_node) < (8 * sizeof(nodeid_t)));
-
-    ASSERT(zone_lo <= zone_hi);
-    ASSERT(zone_hi < NR_ZONES);
-
-    if ( unlikely(order > MAX_ORDER) )
-        return NULL;
-
-    spin_lock(&heap_lock);
-
-    /*
-     * Claimed memory is considered unavailable unless the request
-     * is made by a domain with sufficient unclaimed pages.
-     */
-    if ( (outstanding_claims + request > total_avail_pages) &&
-          ((memflags & MEMF_no_refcount) ||
-           !d || d->outstanding_pages < request) )
-    {
-        spin_unlock(&heap_lock);
-        return NULL;
-    }
-
-    pg = get_free_buddy(zone_lo, zone_hi, order, memflags, d);
-    /* Try getting a dirty buddy if we couldn't get a clean one. */
-    if ( !pg && !(memflags & MEMF_no_scrub) )
-        pg = get_free_buddy(zone_lo, zone_hi, order,
-                            memflags | MEMF_no_scrub, d);
-    if ( !pg )
-    {
-        /* No suitable memory blocks. Fail the request. */
-        spin_unlock(&heap_lock);
-        return NULL;
-    }
+    struct page_info *pg = *pgo;
 
     node = phys_to_nid(page_to_maddr(pg));
     zone = page_to_zone(pg);
@@ -984,6 +948,7 @@ static struct page_info *alloc_heap_pages(
                 first_dirty = 0; /* We've moved past original first_dirty */
         }
     }
+    *pgo = pg;
 
     ASSERT(avail[node][zone] >= request);
     avail[node][zone] -= request;
@@ -1062,6 +1027,53 @@ static struct page_info *alloc_heap_pages(
     if ( need_tlbflush )
         filtered_flush_tlb_mask(tlbflush_timestamp);
 
+}
+
+/* Allocate 2^@order contiguous pages. */
+static struct page_info *alloc_heap_pages(
+    unsigned int zone_lo, unsigned int zone_hi,
+    unsigned int order, unsigned int memflags,
+    struct domain *d)
+{
+    unsigned long request = 1UL << order;
+    struct page_info *pg;
+
+    /* Make sure there are enough bits in memflags for nodeID. */
+    BUILD_BUG_ON((_MEMF_bits - _MEMF_node) < (8 * sizeof(nodeid_t)));
+
+    ASSERT(zone_lo <= zone_hi);
+    ASSERT(zone_hi < NR_ZONES);
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
+    if ( (outstanding_claims + request > total_avail_pages) &&
+          ((memflags & MEMF_no_refcount) ||
+           !d || d->outstanding_pages < request) )
+    {
+        spin_unlock(&heap_lock);
+        return NULL;
+    }
+
+    pg = get_free_buddy(zone_lo, zone_hi, order, memflags, d);
+    /* Try getting a dirty buddy if we couldn't get a clean one. */
+    if ( !pg && !(memflags & MEMF_no_scrub) )
+        pg = get_free_buddy(zone_lo, zone_hi, order,
+                            memflags | MEMF_no_scrub, d);
+    if ( !pg )
+    {
+        /* No suitable memory blocks. Fail the request. */
+        spin_unlock(&heap_lock);
+        return NULL;
+    }
+
+    __alloc_heap_pages(&pg, order, memflags, d);
     return pg;
 }
 
-- 
2.17.1


