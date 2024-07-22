Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 432E393913C
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 17:02:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762119.1172242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVuXx-0000us-Ff; Mon, 22 Jul 2024 15:01:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762119.1172242; Mon, 22 Jul 2024 15:01:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVuXx-0000tG-Bu; Mon, 22 Jul 2024 15:01:53 +0000
Received: by outflank-mailman (input) for mailman id 762119;
 Mon, 22 Jul 2024 15:01:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JAiy=OW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sVuXw-0000sY-Bv
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 15:01:52 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 532cd5e6-483b-11ef-bbfe-fd08da9f4363;
 Mon, 22 Jul 2024 17:01:51 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5373821B50;
 Mon, 22 Jul 2024 15:01:50 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1698E136A9;
 Mon, 22 Jul 2024 15:01:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id XqT0A150nmaSVgAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 22 Jul 2024 15:01:50 +0000
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
X-Inumbo-ID: 532cd5e6-483b-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1721660510; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YnDqWS+vxb+tfdScCZ+zPNB/CgAS3SnGjXk0zuPrX8E=;
	b=NedBZ65pGT+BdBneGVcYkoRtDL35kkNcZjeyPENo05SsJfWY/IeFce7stwaG2+S9j4gB4c
	vZ2lk0/A8o2bsnOCryrwvFfPdP/l47tb4cZJs181rvGGA+TnStb4TmWbthMmPLyFFZYM1k
	5fp3gSx8S2PYzmZaa6Er8mlS+BVx72I=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=NedBZ65p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1721660510; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YnDqWS+vxb+tfdScCZ+zPNB/CgAS3SnGjXk0zuPrX8E=;
	b=NedBZ65pGT+BdBneGVcYkoRtDL35kkNcZjeyPENo05SsJfWY/IeFce7stwaG2+S9j4gB4c
	vZ2lk0/A8o2bsnOCryrwvFfPdP/l47tb4cZJs181rvGGA+TnStb4TmWbthMmPLyFFZYM1k
	5fp3gSx8S2PYzmZaa6Er8mlS+BVx72I=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 1/4] mini-os: make mm.c coding style compliant
Date: Mon, 22 Jul 2024 17:01:38 +0200
Message-ID: <20240722150141.31391-2-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240722150141.31391-1-jgross@suse.com>
References: <20240722150141.31391-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.81
X-Rspamd-Action: no action
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 5373821B50
X-Spamd-Result: default: False [-2.81 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DWL_DNSWL_BLOCKED(0.00)[suse.com:dkim];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email]
X-Spam-Flag: NO

Apply the coding style to mm.c.

No functional change.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 mm.c | 191 ++++++++++++++++++++++++++++++-----------------------------
 1 file changed, 96 insertions(+), 95 deletions(-)

diff --git a/mm.c b/mm.c
index eb0e34de..1dcd954c 100644
--- a/mm.c
+++ b/mm.c
@@ -1,4 +1,4 @@
-/* 
+/*
  ****************************************************************************
  * (C) 2003 - Rolf Neugebauer - Intel Research Cambridge
  * (C) 2005 - Grzegorz Milos - Intel Research Cambridge
@@ -7,9 +7,9 @@
  *        File: mm.c
  *      Author: Rolf Neugebauer (neugebar@dcs.gla.ac.uk)
  *     Changes: Grzegorz Milos
- *              
+ *
  *        Date: Aug 2003, chages Aug 2005
- * 
+ *
  * Environment: Xen Minimal OS
  * Description: memory management related functions
  *              contains buddy page allocator from Xen.
@@ -21,16 +21,16 @@
  * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
  * sell copies of the Software, and to permit persons to whom the Software is
  * furnished to do so, subject to the following conditions:
- * 
+ *
  * The above copyright notice and this permission notice shall be included in
  * all copies or substantial portions of the Software.
- * 
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
- * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING 
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
  * DEALINGS IN THE SOFTWARE.
  */
 
@@ -45,7 +45,7 @@
 #include <mini-os/xmalloc.h>
 #include <mini-os/e820.h>
 
-/*********************
+/*
  * ALLOCATION BITMAP
  *  One bit per page of memory. Bit set => page is allocated.
  */
@@ -55,7 +55,7 @@ unsigned long mm_alloc_bitmap_size;
 
 #define PAGES_PER_MAPWORD (sizeof(unsigned long) * 8)
 
-#define allocated_in_map(_pn) \
+#define allocated_in_map(_pn)                     \
     (mm_alloc_bitmap[(_pn) / PAGES_PER_MAPWORD] & \
      (1UL << ((_pn) & (PAGES_PER_MAPWORD - 1))))
 
@@ -63,8 +63,8 @@ unsigned long nr_free_pages;
 
 /*
  * Hint regarding bitwise arithmetic in map_{alloc,free}:
- *  -(1<<n)  sets all bits >= n. 
- *  (1<<n)-1 sets all bits <  n.
+ *  -(1 << n)  sets all bits >= n.
+ *  (1 << n) - 1 sets all bits <  n.
  * Variable names in map_{alloc,free}:
  *  *_idx == Index into `mm_alloc_bitmap' array.
  *  *_off == Bit offset within an element of the `mm_alloc_bitmap' array.
@@ -75,53 +75,52 @@ static void map_alloc(unsigned long first_page, unsigned long nr_pages)
     unsigned long start_off, end_off, curr_idx, end_idx;
 
     curr_idx  = first_page / PAGES_PER_MAPWORD;
-    start_off = first_page & (PAGES_PER_MAPWORD-1);
+    start_off = first_page & (PAGES_PER_MAPWORD - 1);
     end_idx   = (first_page + nr_pages) / PAGES_PER_MAPWORD;
-    end_off   = (first_page + nr_pages) & (PAGES_PER_MAPWORD-1);
+    end_off   = (first_page + nr_pages) & (PAGES_PER_MAPWORD - 1);
 
     if ( curr_idx == end_idx )
     {
-        mm_alloc_bitmap[curr_idx] |= ((1UL<<end_off)-1) & -(1UL<<start_off);
+        mm_alloc_bitmap[curr_idx] |= ((1UL << end_off) - 1) &
+                                     -(1UL << start_off);
     }
-    else 
+    else
     {
-        mm_alloc_bitmap[curr_idx] |= -(1UL<<start_off);
-        while ( ++curr_idx < end_idx ) mm_alloc_bitmap[curr_idx] = ~0UL;
-        mm_alloc_bitmap[curr_idx] |= (1UL<<end_off)-1;
+        mm_alloc_bitmap[curr_idx] |= -(1UL << start_off);
+        while ( ++curr_idx < end_idx )
+            mm_alloc_bitmap[curr_idx] = ~0UL;
+        mm_alloc_bitmap[curr_idx] |= (1UL << end_off) - 1;
     }
 
     nr_free_pages -= nr_pages;
 }
 
-
 static void map_free(unsigned long first_page, unsigned long nr_pages)
 {
     unsigned long start_off, end_off, curr_idx, end_idx;
 
     curr_idx = first_page / PAGES_PER_MAPWORD;
-    start_off = first_page & (PAGES_PER_MAPWORD-1);
+    start_off = first_page & (PAGES_PER_MAPWORD - 1);
     end_idx   = (first_page + nr_pages) / PAGES_PER_MAPWORD;
-    end_off   = (first_page + nr_pages) & (PAGES_PER_MAPWORD-1);
+    end_off   = (first_page + nr_pages) & (PAGES_PER_MAPWORD - 1);
 
     nr_free_pages += nr_pages;
 
     if ( curr_idx == end_idx )
     {
-        mm_alloc_bitmap[curr_idx] &= -(1UL<<end_off) | ((1UL<<start_off)-1);
+        mm_alloc_bitmap[curr_idx] &= -(1UL << end_off) |
+                                     ((1UL << start_off) - 1);
     }
-    else 
+    else
     {
-        mm_alloc_bitmap[curr_idx] &= (1UL<<start_off)-1;
-        while ( ++curr_idx != end_idx ) mm_alloc_bitmap[curr_idx] = 0;
-        mm_alloc_bitmap[curr_idx] &= -(1UL<<end_off);
+        mm_alloc_bitmap[curr_idx] &= (1UL << start_off) - 1;
+        while ( ++curr_idx != end_idx )
+            mm_alloc_bitmap[curr_idx] = 0;
+        mm_alloc_bitmap[curr_idx] &= -(1UL << end_off);
     }
 }
 
-
-
-/*************************
- * BINARY BUDDY ALLOCATOR
- */
+/* BINARY BUDDY ALLOCATOR */
 
 typedef struct chunk_head_st chunk_head_t;
 typedef struct chunk_tail_st chunk_tail_t;
@@ -137,7 +136,7 @@ struct chunk_tail_st {
 };
 
 /* Linked lists of free chunks of different powers-of-two in size. */
-#define FREELIST_SIZE ((sizeof(void*)<<3)-PAGE_SHIFT)
+#define FREELIST_SIZE ((sizeof(void *) << 3) - PAGE_SHIFT)
 static chunk_head_t *free_head[FREELIST_SIZE];
 static chunk_head_t  free_tail[FREELIST_SIZE];
 #define FREELIST_EMPTY(_l) ((_l)->next == NULL)
@@ -163,14 +162,14 @@ static void init_page_allocator(unsigned long min, unsigned long max)
         free_tail[i].next  = NULL;
     }
 
-    min = round_pgup  (min);
+    min = round_pgup(min);
     max = round_pgdown(max);
 
     /* Allocate space for the allocation bitmap. */
-    mm_alloc_bitmap_size  = (max + 1) >> (PAGE_SHIFT + 3);
-    mm_alloc_bitmap_size  = round_pgup(mm_alloc_bitmap_size);
+    mm_alloc_bitmap_size = (max + 1) >> (PAGE_SHIFT + 3);
+    mm_alloc_bitmap_size = round_pgup(mm_alloc_bitmap_size);
     mm_alloc_bitmap = (unsigned long *)to_virt(min);
-    min         += mm_alloc_bitmap_size;
+    min += mm_alloc_bitmap_size;
 
     /* All allocated by default. */
     memset(mm_alloc_bitmap, ~0, mm_alloc_bitmap_size);
@@ -208,7 +207,10 @@ static void init_page_allocator(unsigned long min, unsigned long max)
              * must not be bigger than remaining range.
              */
             for ( i = PAGE_SHIFT; (1UL << (i + 1)) <= range; i++ )
-                if ( r_min & (1UL << i) ) break;
+            {
+                if ( r_min & (1UL << i) )
+                    break;
+            }
 
             ch = (chunk_head_t *)r_min;
             r_min += 1UL << i;
@@ -227,7 +229,6 @@ static void init_page_allocator(unsigned long min, unsigned long max)
     mm_alloc_bitmap_remap();
 }
 
-
 /* Allocate 2^@order contiguous pages. Returns a VIRTUAL address. */
 unsigned long alloc_pages(int order)
 {
@@ -239,13 +240,15 @@ unsigned long alloc_pages(int order)
         goto no_memory;
 
     /* Find smallest order which can satisfy the request. */
-    for ( i = order; i < FREELIST_SIZE; i++ ) {
-	if ( !FREELIST_EMPTY(free_head[i]) ) 
-	    break;
+    for ( i = order; i < FREELIST_SIZE; i++ )
+    {
+        if ( !FREELIST_EMPTY(free_head[i]) )
+            break;
     }
 
-    if ( i == FREELIST_SIZE ) goto no_memory;
- 
+    if ( i == FREELIST_SIZE )
+        goto no_memory;
+
     /* Unlink a chunk. */
     alloc_ch = free_head[i];
     free_head[i] = alloc_ch->next;
@@ -256,8 +259,10 @@ unsigned long alloc_pages(int order)
     {
         /* Split into two equal parts. */
         i--;
-        spare_ch = (chunk_head_t *)((char *)alloc_ch + (1UL<<(i+PAGE_SHIFT)));
-        spare_ct = (chunk_tail_t *)((char *)spare_ch + (1UL<<(i+PAGE_SHIFT)))-1;
+        spare_ch = (chunk_head_t *)((char *)alloc_ch +
+                                    (1UL << (i + PAGE_SHIFT)));
+        spare_ct = (chunk_tail_t *)((char *)spare_ch +
+                                    (1UL << (i + PAGE_SHIFT))) - 1;
 
         /* Create new header for spare chunk. */
         spare_ch->level = i;
@@ -269,13 +274,12 @@ unsigned long alloc_pages(int order)
         spare_ch->next->pprev = &spare_ch->next;
         free_head[i] = spare_ch;
     }
-    
-    map_alloc(PHYS_PFN(to_phys(alloc_ch)), 1UL<<order);
 
-    return((unsigned long)alloc_ch);
+    map_alloc(PHYS_PFN(to_phys(alloc_ch)), 1UL << order);
 
- no_memory:
+    return (unsigned long)alloc_ch;
 
+ no_memory:
     printk("Cannot handle page request order %d!\n", order);
 
     return 0;
@@ -287,43 +291,44 @@ void free_pages(void *pointer, int order)
     chunk_head_t *freed_ch, *to_merge_ch;
     chunk_tail_t *freed_ct;
     unsigned long mask;
-    
+
     /* First free the chunk */
     map_free(virt_to_pfn(pointer), 1UL << order);
-    
+
     /* Create free chunk */
     freed_ch = (chunk_head_t *)pointer;
-    freed_ct = (chunk_tail_t *)((char *)pointer + (1UL<<(order + PAGE_SHIFT)))-1;
-    
+    freed_ct = (chunk_tail_t *)((char *)pointer +
+                                (1UL << (order + PAGE_SHIFT))) - 1;
+
     /* Now, possibly we can conseal chunks together */
-    while(order < FREELIST_SIZE)
+    while ( order < FREELIST_SIZE )
     {
         mask = 1UL << (order + PAGE_SHIFT);
-        if((unsigned long)freed_ch & mask) 
+        if ( (unsigned long)freed_ch & mask )
         {
             to_merge_ch = (chunk_head_t *)((char *)freed_ch - mask);
-            if(allocated_in_map(virt_to_pfn(to_merge_ch)) ||
-                    to_merge_ch->level != order)
+            if ( allocated_in_map(virt_to_pfn(to_merge_ch)) ||
+                 to_merge_ch->level != order )
                 break;
-            
+
             /* Merge with predecessor */
-            freed_ch = to_merge_ch;   
+            freed_ch = to_merge_ch;
         }
-        else 
+        else
         {
             to_merge_ch = (chunk_head_t *)((char *)freed_ch + mask);
-            if(allocated_in_map(virt_to_pfn(to_merge_ch)) ||
-                    to_merge_ch->level != order)
+            if ( allocated_in_map(virt_to_pfn(to_merge_ch)) ||
+                 to_merge_ch->level != order )
                 break;
-            
+
             /* Merge with successor */
             freed_ct = (chunk_tail_t *)((char *)to_merge_ch + mask) - 1;
         }
-        
-        /* We are commited to merging, unlink the chunk */
+
+        /* We are committed to merging, unlink the chunk */
         *(to_merge_ch->pprev) = to_merge_ch->next;
         to_merge_ch->next->pprev = to_merge_ch->pprev;
-        
+
         order++;
     }
 
@@ -332,10 +337,10 @@ void free_pages(void *pointer, int order)
     freed_ch->next  = free_head[order];
     freed_ch->pprev = &free_head[order];
     freed_ct->level = order;
-    
+
     freed_ch->next->pprev = &freed_ch->next;
-    free_head[order] = freed_ch;   
-   
+    free_head[order] = freed_ch;
+
 }
 EXPORT_SYMBOL(free_pages);
 
@@ -347,6 +352,7 @@ int free_physical_pages(xen_pfn_t *mfns, int n)
     reservation.nr_extents = n;
     reservation.extent_order = 0;
     reservation.domid = DOMID_SELF;
+
     return HYPERVISOR_memory_op(XENMEM_decrease_reservation, &reservation);
 }
 
@@ -362,16 +368,15 @@ void *sbrk(ptrdiff_t increment)
     unsigned long old_brk = brk;
     unsigned long new_brk = old_brk + increment;
 
-    if (new_brk > heap_end) {
-	printk("Heap exhausted: %lx + %lx = %p > %p\n",
-			old_brk,
-			(unsigned long) increment,
-			(void *) new_brk,
-			(void *) heap_end);
-	return NULL;
+    if ( new_brk > heap_end )
+    {
+        printk("Heap exhausted: %lx + %lx = %p > %p\n", old_brk,
+               (unsigned long) increment, (void *)new_brk, (void *)heap_end);
+        return NULL;
     }
-    
-    if (new_brk > heap_mapped) {
+
+    if ( new_brk > heap_mapped )
+    {
         unsigned long n = (new_brk - heap_mapped + PAGE_SIZE - 1) / PAGE_SIZE;
 
         if ( !chk_free_pages(n) )
@@ -386,16 +391,13 @@ void *sbrk(ptrdiff_t increment)
 
     brk = new_brk;
 
-    return (void *) old_brk;
+    return (void *)old_brk;
 }
 EXPORT_SYMBOL(sbrk);
 #endif
 
-
-
 void init_mm(void)
 {
-
     unsigned long start_pfn, max_pfn;
 
     printk("MM: Init\n");
@@ -403,14 +405,12 @@ void init_mm(void)
     arch_init_mm(&start_pfn, &max_pfn);
     get_max_pages();
 
-    /*
-     * now we can initialise the page allocator
-     */
+    /* Now we can initialise the page allocator. */
     init_page_allocator(PFN_PHYS(start_pfn), PFN_PHYS(max_pfn));
     printk("MM: done\n");
 
     arch_init_p2m(max_pfn);
-    
+
     arch_init_demand_mapping_area();
 }
 
@@ -423,14 +423,15 @@ void sanity_check(void)
     int x;
     chunk_head_t *head;
 
-    for (x = 0; x < FREELIST_SIZE; x++) {
-        for (head = free_head[x]; !FREELIST_EMPTY(head); head = head->next) {
+    for ( x = 0; x < FREELIST_SIZE; x++ )
+    {
+        for ( head = free_head[x]; !FREELIST_EMPTY(head); head = head->next )
+        {
             ASSERT(!allocated_in_map(virt_to_pfn(head)));
-            if (head->next)
+            if ( head->next )
                 ASSERT(head->next->pprev == &head->next);
         }
-        if (free_head[x]) {
+        if ( free_head[x] )
             ASSERT(free_head[x]->pprev == &free_head[x]);
-        }
     }
 }
-- 
2.43.0


