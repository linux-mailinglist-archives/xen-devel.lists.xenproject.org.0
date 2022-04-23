Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED97D50CD36
	for <lists+xen-devel@lfdr.de>; Sat, 23 Apr 2022 21:36:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.311778.529026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niLXD-0004xp-GW; Sat, 23 Apr 2022 19:35:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 311778.529026; Sat, 23 Apr 2022 19:35:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niLXD-0004v0-DW; Sat, 23 Apr 2022 19:35:11 +0000
Received: by outflank-mailman (input) for mailman id 311778;
 Sat, 23 Apr 2022 19:35:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HFCZ=VB=gmail.com=p4ranlee@srs-se1.protection.inumbo.net>)
 id 1niLXB-0004uu-Ek
 for xen-devel@lists.xenproject.org; Sat, 23 Apr 2022 19:35:09 +0000
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [2607:f8b0:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a98b2bd-c33c-11ec-a405-831a346695d4;
 Sat, 23 Apr 2022 21:35:07 +0200 (CEST)
Received: by mail-pf1-x429.google.com with SMTP id y14so10352870pfe.10
 for <xen-devel@lists.xenproject.org>; Sat, 23 Apr 2022 12:35:07 -0700 (PDT)
Received: from localhost ([118.33.58.98]) by smtp.gmail.com with ESMTPSA id
 j9-20020aa78009000000b004fde2dd78b0sm6182154pfi.109.2022.04.23.12.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 12:35:05 -0700 (PDT)
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
X-Inumbo-ID: 7a98b2bd-c33c-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=4tavhL6msLPCorzynuJXgSiaV6UCD46MhySnJI+bSiQ=;
        b=JelAi7F7QJ49IeyAJRnO2kSRA9utw+F4WEa0i3BeAghEIrPa6SjKV2Swjj3YmZJJ5Q
         g4v2FTsnCrjMb4o/rCpmsdSWPqXom+rYbt92b454r8fi10TfEAgLEoim0FPc3vq3enJA
         NHpttCcnI0cAZqTbsV/5QJ7u2mtD+7TeFKuJTnLoX9iOAzbDpu6rIDzdAyFadWBqD6jG
         8UGECs/dLgQ/h2OSDdQveYEbPWsTk0VpxwBXpPFWjGKx3ZHr1RJ1UMDz7iktCdhEf6W5
         1ShUAwkux3FY2Aqcrjwv9XZkJ0dasLEXkklB8giEN/N5XOSamYyrlKPU5F24OA+T4tlH
         CgPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=4tavhL6msLPCorzynuJXgSiaV6UCD46MhySnJI+bSiQ=;
        b=7q1Wgdwq+2WHnjsHD3KSSXrRKYik6PPtbtJn/HndCIIq+eXXMDT7fDU9GSE7/Lx9Dx
         GjcICGBMzz5w6AS6S6C7m9I8Uq6JwvV9d4lg17+3e/MyTRA96Tgj0MPAzWlXQjhychK0
         EuVQgbUE3gbfFZyS5PtVeQGTbPMNkeRz+NdkKa2A1piet88fUa+eV+BzQCYix2AyQzRL
         +dq7AUvcASLT9wBoCGlVyf/mfmorHeeZinIBU0bPDXhIzHGOzLFldvhpk3gDsu+BtqW/
         xFho9Xr2gjWFEKlZEfhaWtbQpYO3GqF2DN69DwWNFyymEr9Yvqg/JQ99bWprP+H1OATm
         Qhsw==
X-Gm-Message-State: AOAM5337MUbyZsaL4Lg0VtT7m8tJ155qvgQfsxJ5VRS+ZMgWCBD2JWwk
	vCCVamtltvB5keVnmnR7gAs=
X-Google-Smtp-Source: ABdhPJybvX+zPdayg19N6R8s+Di+UkzQJTh8X3RzJZetxAmyu65neNTb3E+e5UArpdKwgzbcT3I2iQ==
X-Received: by 2002:a63:8941:0:b0:3aa:b55c:729b with SMTP id v62-20020a638941000000b003aab55c729bmr8618019pgd.285.1650742505694;
        Sat, 23 Apr 2022 12:35:05 -0700 (PDT)
Date: Sun, 24 Apr 2022 04:35:01 +0900
From: Paran Lee <p4ranlee@gmail.com>
To: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Cc: Austin Kim <austindh.kim@gmail.com>, xen-devel@lists.xenproject.org
Subject: [PATCH] xen/mm: page_alloc fix duplicated order shift operation in
 the loop
Message-ID: <20220423193501.GA10077@DESKTOP-NK4TH6S.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

It doesn't seem necessary to do that
duplicate calculation of order shift 2^@order in the loop.

In addition, I fixed type of total_avail_pages from long
to unsigned long. because when total_avail_pages static variable
substitute in functions of page alloc local variable,
type of local variables is unsigned long.

Signed-off-by: Paran Lee <p4ranlee@gmail.com>
---
 xen/common/page_alloc.c | 51 ++++++++++++++++++++++-------------------
 1 file changed, 27 insertions(+), 24 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 319029140f..9a955ce84e 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -456,7 +456,7 @@ static heap_by_zone_and_order_t *_heap[MAX_NUMNODES];
 static unsigned long node_need_scrub[MAX_NUMNODES];
 
 static unsigned long *avail[MAX_NUMNODES];
-static long total_avail_pages;
+static unsigned long total_avail_pages;
 
 static DEFINE_SPINLOCK(heap_lock);
 static long outstanding_claims; /* total outstanding claims by all domains */
@@ -922,8 +922,9 @@ static struct page_info *alloc_heap_pages(
     struct domain *d)
 {
     nodeid_t node;
-    unsigned int i, buddy_order, zone, first_dirty;
-    unsigned long request = 1UL << order;
+    unsigned int buddy_order, zone, first_dirty;
+    unsigned int buddy_request;
+    unsigned long i, request = 1UL << order;
     struct page_info *pg;
     bool need_tlbflush = false;
     uint32_t tlbflush_timestamp = 0;
@@ -975,16 +976,17 @@ static struct page_info *alloc_heap_pages(
     while ( buddy_order != order )
     {
         buddy_order--;
+        buddy_request = 1U << buddy_order;
         page_list_add_scrub(pg, node, zone, buddy_order,
-                            (1U << buddy_order) > first_dirty ?
+                            buddy_request > first_dirty ?
                             first_dirty : INVALID_DIRTY_IDX);
-        pg += 1U << buddy_order;
+        pg += buddy_request;
 
         if ( first_dirty != INVALID_DIRTY_IDX )
         {
             /* Adjust first_dirty */
-            if ( first_dirty >= 1U << buddy_order )
-                first_dirty -= 1U << buddy_order;
+            if ( first_dirty >= buddy_request )
+                first_dirty -= buddy_request;
             else
                 first_dirty = 0; /* We've moved past original first_dirty */
         }
@@ -1000,13 +1002,13 @@ static struct page_info *alloc_heap_pages(
     if ( d != NULL )
         d->last_alloc_node = node;
 
-    for ( i = 0; i < (1 << order); i++ )
+    for ( i = 0; i < request; i++ )
     {
         /* Reference count must continuously be zero for free pages. */
         if ( (pg[i].count_info & ~PGC_need_scrub) != PGC_state_free )
         {
             printk(XENLOG_ERR
-                   "pg[%u] MFN %"PRI_mfn" c=%#lx o=%u v=%#lx t=%#x\n",
+                   "pg[%lu] MFN %"PRI_mfn" c=%#lx o=%u v=%#lx t=%#x\n",
                    i, mfn_x(page_to_mfn(pg + i)),
                    pg[i].count_info, pg[i].v.free.order,
                    pg[i].u.free.val, pg[i].tlbflush_timestamp);
@@ -1034,7 +1036,7 @@ static struct page_info *alloc_heap_pages(
     if ( first_dirty != INVALID_DIRTY_IDX ||
          (scrub_debug && !(memflags & MEMF_no_scrub)) )
     {
-        for ( i = 0; i < (1U << order); i++ )
+        for ( i = 0; i < request; i++ )
         {
             if ( test_and_clear_bit(_PGC_need_scrub, &pg[i].count_info) )
             {
@@ -1063,7 +1065,7 @@ static struct page_info *alloc_heap_pages(
      * can control its own visibility of/through the cache.
      */
     mfn = page_to_mfn(pg);
-    for ( i = 0; i < (1U << order); i++ )
+    for ( i = 0; i < request; i++ )
         flush_page_to_ram(mfn_x(mfn) + i, !(memflags & MEMF_no_icache_flush));
 
     return pg;
@@ -1437,15 +1439,16 @@ static void free_heap_pages(
 {
     unsigned long mask;
     mfn_t mfn = page_to_mfn(pg);
-    unsigned int i, node = phys_to_nid(mfn_to_maddr(mfn));
+    unsigned int node = phys_to_nid(mfn_to_maddr(mfn));
     unsigned int zone = page_to_zone(pg);
+    unsigned long i, request = 1UL << order;
     bool pg_offlined = false;
 
     ASSERT(order <= MAX_ORDER);
 
     spin_lock(&heap_lock);
 
-    for ( i = 0; i < (1 << order); i++ )
+    for ( i = 0; i < request; i++ )
     {
         if ( mark_page_free(&pg[i], mfn_add(mfn, i)) )
             pg_offlined = true;
@@ -1457,11 +1460,11 @@ static void free_heap_pages(
         }
     }
 
-    avail[node][zone] += 1 << order;
-    total_avail_pages += 1 << order;
+    avail[node][zone] += request;
+    total_avail_pages += request;
     if ( need_scrub )
     {
-        node_need_scrub[node] += 1 << order;
+        node_need_scrub[node] += request;
         pg->u.free.first_dirty = 0;
     }
     else
@@ -1490,7 +1493,7 @@ static void free_heap_pages(
             /* Update predecessor's first_dirty if necessary. */
             if ( predecessor->u.free.first_dirty == INVALID_DIRTY_IDX &&
                  pg->u.free.first_dirty != INVALID_DIRTY_IDX )
-                predecessor->u.free.first_dirty = (1U << order) +
+                predecessor->u.free.first_dirty = mask +
                                                   pg->u.free.first_dirty;
 
             pg = predecessor;
@@ -1511,7 +1514,7 @@ static void free_heap_pages(
             /* Update pg's first_dirty if necessary. */
             if ( pg->u.free.first_dirty == INVALID_DIRTY_IDX &&
                  successor->u.free.first_dirty != INVALID_DIRTY_IDX )
-                pg->u.free.first_dirty = (1U << order) +
+                pg->u.free.first_dirty = mask +
                                          successor->u.free.first_dirty;
 
             page_list_del(successor, &heap(node, zone, order));
@@ -2416,7 +2419,7 @@ struct page_info *alloc_domheap_pages(
 void free_domheap_pages(struct page_info *pg, unsigned int order)
 {
     struct domain *d = page_get_owner(pg);
-    unsigned int i;
+    unsigned long i, request = 1UL << order;
     bool drop_dom_ref;
 
     ASSERT(!in_irq());
@@ -2426,10 +2429,10 @@ void free_domheap_pages(struct page_info *pg, unsigned int order)
         /* NB. May recursively lock from relinquish_memory(). */
         spin_lock_recursive(&d->page_alloc_lock);
 
-        for ( i = 0; i < (1 << order); i++ )
+        for ( i = 0; i < request; i++ )
             arch_free_heap_page(d, &pg[i]);
 
-        d->xenheap_pages -= 1 << order;
+        d->xenheap_pages -= request;
         drop_dom_ref = (d->xenheap_pages == 0);
 
         spin_unlock_recursive(&d->page_alloc_lock);
@@ -2443,12 +2446,12 @@ void free_domheap_pages(struct page_info *pg, unsigned int order)
             /* NB. May recursively lock from relinquish_memory(). */
             spin_lock_recursive(&d->page_alloc_lock);
 
-            for ( i = 0; i < (1 << order); i++ )
+            for ( i = 0; i < request; i++ )
             {
                 if ( pg[i].u.inuse.type_info & PGT_count_mask )
                 {
                     printk(XENLOG_ERR
-                           "pg[%u] MFN %"PRI_mfn" c=%#lx o=%u v=%#lx t=%#x\n",
+                           "pg[%lu] MFN %"PRI_mfn" c=%#lx o=%u v=%#lx t=%#x\n",
                            i, mfn_x(page_to_mfn(pg + i)),
                            pg[i].count_info, pg[i].v.free.order,
                            pg[i].u.free.val, pg[i].tlbflush_timestamp);
@@ -2462,7 +2465,7 @@ void free_domheap_pages(struct page_info *pg, unsigned int order)
                 }
             }
 
-            drop_dom_ref = !domain_adjust_tot_pages(d, -(1 << order));
+            drop_dom_ref = !domain_adjust_tot_pages(d, -request);
 
             spin_unlock_recursive(&d->page_alloc_lock);
 
-- 
2.25.1


