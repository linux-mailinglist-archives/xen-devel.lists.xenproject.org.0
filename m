Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 691344CDC1D
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 19:17:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284469.483928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCUo-0003sJ-Tr; Fri, 04 Mar 2022 18:17:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284469.483928; Fri, 04 Mar 2022 18:17:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCUm-0002yP-SB; Fri, 04 Mar 2022 18:17:40 +0000
Received: by outflank-mailman (input) for mailman id 284469;
 Fri, 04 Mar 2022 17:56:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WvCO=TP=xt3.it=ms@srs-se1.protection.inumbo.net>)
 id 1nQC2D-0005R5-Lm
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 17:48:09 +0000
Received: from radon.xt3.it (radon.xt3.it [2a01:4f8:190:4055::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40586353-9be3-11ec-8539-5f4723681683;
 Fri, 04 Mar 2022 18:48:08 +0100 (CET)
Received: from nb2assolieri.mat.unimo.it ([155.185.4.56] helo=localhost)
 by radon.xt3.it with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <ms@xt3.it>)
 id 1nQC2B-00005k-CV; Fri, 04 Mar 2022 18:48:07 +0100
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
X-Inumbo-ID: 40586353-9be3-11ec-8539-5f4723681683
From: Marco Solieri <marco.solieri@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: Marco Solieri <marco.solieri@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Marco Solieri <marco.solieri@unimore.it>,
	Andrea Bastoni <andrea.bastoni@minervasys.tech>,
	Luca Miccio <lucmiccio@gmail.com>
Subject: [PATCH 19/36] xen/arch: introduce cache-coloring allocator
Date: Fri,  4 Mar 2022 18:46:44 +0100
Message-Id: <20220304174701.1453977-20-marco.solieri@minervasys.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

Introduce a new memory page allocator that implement the cache coloring
mechanism. The allocation algorithm follows the given coloring scheme
specified for each guest, and maximizes contiguity in the page
selection.

Pages are stored by color in separated and address-ordered lists that
are collectively called the colored heap.  These lists will be populated
by a simple initialisation function, which, for any available page,
compute its color and insert it in the corresponding list.  When a
domain requests a page, the allocator take one from the subset of lists
whose colors equal the domain configuration.  It chooses the highest
page element among the lasts elements of such lists.  This ordering
guarantees that contiguous pages are sequentially allocated, if this is
made possible by a color assignment which includes adjacent ids.

The allocator can handle only requests with order equals to 0 since the
single color granularity is represented in memory by one page.

A dump function is added to allow inspection of colored heap
information.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
 xen/common/page_alloc.c | 264 +++++++++++++++++++++++++++++++++++++++-
 xen/include/xen/mm.h    |   5 +
 2 files changed, 268 insertions(+), 1 deletion(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 4635718237..82f6e8330a 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -150,6 +150,9 @@
 #define p2m_pod_offline_or_broken_hit(pg) 0
 #define p2m_pod_offline_or_broken_replace(pg) BUG_ON(pg != NULL)
 #endif
+#ifdef CONFIG_COLORING
+#include <asm/coloring.h>
+#endif
 
 #ifndef PGC_reserved
 #define PGC_reserved 0
@@ -438,6 +441,263 @@ mfn_t __init alloc_boot_pages(unsigned long nr_pfns, unsigned long pfn_align)
 
 
 
+static DEFINE_SPINLOCK(heap_lock);
+
+#ifdef CONFIG_COLORING
+/*************************
+ * COLORED SIDE-ALLOCATOR
+ *
+ * Pages are stored by their color in separated lists. Each list defines a color
+ * and it is initialized during end_boot_allocator, where each page's color
+ * is calculated and the page itself is put in the correct list.
+ * After initialization we have N list where N is the number of maximum
+ * available colors on the platform.
+ * All the lists' heads are stored as element in an array with size N-1 using
+ * the following schema:
+ * array[X] = head of color X, where X goes from 0 to N-1
+ */
+typedef struct page_list_head color_list;
+static color_list *color_heap;
+static long total_avail_col_pages;
+static u64 col_num_max;
+static bool color_init_state = true;
+
+#define page_to_head(pg) (&color_heap[color_from_page(pg)])
+#define color_to_head(col) (&color_heap[col])
+
+/* Add page in list in order depending on its physical address. */
+static void page_list_add_order(struct page_info *pg, struct list_head *head)
+{
+    struct page_info *pos;
+
+    /* Add first page after head */
+    if ( page_list_empty(head) )
+    {
+        page_list_add(pg, head);
+        return;
+    }
+
+    /* Add non-first page in list in ascending order */
+    page_list_for_each_reverse(pos, head)
+    {
+        /* Get pg position */
+        if ( page_to_maddr(pos) <= page_to_maddr(pg) )
+        {
+            /* Insert pg between pos and pos->list.next */
+            page_list_add(pg, &pos->list);
+            break;
+        }
+
+        /*
+         * If pos is the first element it means that pg <= pos so we have
+         * to insert pg after head.
+         */
+        if ( page_list_first(head) == pos )
+        {
+            page_list_add(pg, head);
+            break;
+        }
+    }
+}
+
+/* Alloc one page based on domain color configuration */
+static struct page_info *alloc_col_heap_page(
+    unsigned int memflags, struct domain *d)
+{
+    struct page_info *pg, *tmp;
+    bool need_tlbflush = false;
+    uint32_t cur_color;
+    uint32_t tlbflush_timestamp = 0;
+    uint32_t *colors = 0;
+    int max_colors;
+    int i;
+
+    colors = d->colors;
+    max_colors = d->max_colors;
+
+    spin_lock(&heap_lock);
+
+    tmp = pg = NULL;
+
+    /* Check for the first pg on non-empty list */
+    for ( i = 0; i < max_colors; i++ )
+    {
+        if ( !page_list_empty(color_to_head(colors[i])) )
+        {
+            tmp = pg = page_list_last(color_to_head(colors[i]));
+            cur_color = d->colors[i];
+            break;
+        }
+    }
+
+    /* If all lists are empty, no requests can be satisfied */
+    if ( !pg )
+    {
+        spin_unlock(&heap_lock);
+        return NULL;
+    }
+
+    /* Get the highest page from the lists compliant to the domain color(s) */
+    for ( i += 1; i < max_colors; i++ )
+    {
+        if ( page_list_empty(color_to_head(colors[i])) )
+        {
+            printk(XENLOG_INFO "List empty\n");
+            continue;
+        }
+        tmp = page_list_last(color_to_head(colors[i]));
+        if ( page_to_maddr(tmp) > page_to_maddr(pg) )
+        {
+            pg = tmp;
+            cur_color = colors[i];
+        }
+    }
+
+    if ( !pg )
+    {
+        spin_unlock(&heap_lock);
+        return NULL;
+    }
+
+    pg->count_info = PGC_state_inuse;
+
+    if ( !(memflags & MEMF_no_tlbflush) )
+        accumulate_tlbflush(&need_tlbflush, pg,
+                            &tlbflush_timestamp);
+
+    /* Initialise fields which have other uses for free pages. */
+    pg->u.inuse.type_info = 0;
+    page_set_owner(pg, NULL);
+
+    flush_page_to_ram(mfn_x(page_to_mfn(pg)),
+                      !(memflags & MEMF_no_icache_flush));
+
+    page_list_del(pg, page_to_head(pg));
+    total_avail_col_pages--;
+
+    spin_unlock(&heap_lock);
+
+    if ( need_tlbflush )
+        filtered_flush_tlb_mask(tlbflush_timestamp);
+
+    return pg;
+}
+
+struct page_info *alloc_col_domheap_page(
+    struct domain *d, unsigned int memflags)
+{
+    struct page_info *pg;
+
+    ASSERT(!in_irq());
+
+    /* Get page based on color selection */
+    pg = alloc_col_heap_page(memflags, d);
+
+    if ( !pg )
+    {
+        printk(XENLOG_INFO "ERROR: Colored Page is null\n");
+        return NULL;
+    }
+
+    /* Assign page to domain */
+    if ( d && !(memflags & MEMF_no_owner) &&
+        assign_page(pg, 0, d, memflags) )
+    {
+        free_col_heap_page(pg);
+        return NULL;
+    }
+
+    return pg;
+}
+
+void free_col_heap_page(struct page_info *pg)
+{
+    /* This page is not a guest frame any more. */
+    pg->count_info = PGC_state_free;
+
+    page_set_owner(pg, NULL);
+    total_avail_col_pages++;
+    page_list_add_order( pg, page_to_head(pg) );
+}
+
+static inline void init_col_heap_pages(struct page_info *pg, unsigned long nr_pages)
+{
+    int i;
+
+    if ( color_init_state )
+    {
+        col_num_max = get_max_colors();
+        color_heap = xmalloc_array(color_list, col_num_max);
+        BUG_ON(!color_heap);
+
+        for ( i = 0; i < col_num_max; i++ )
+        {
+            printk(XENLOG_INFO "Init list for color: %u\n", i);
+            INIT_PAGE_LIST_HEAD(&color_heap[i]);
+        }
+
+        color_init_state = false;
+    }
+
+    printk(XENLOG_INFO "Init color heap pages with %lu pages for a given size of 0x%"PRIx64"\n",
+            nr_pages, nr_pages * PAGE_SIZE);
+    printk(XENLOG_INFO "Paging starting from: 0x%"PRIx64"\n", page_to_maddr(pg));
+    total_avail_col_pages += nr_pages;
+
+    for ( i = 0; i < nr_pages; i++ )
+    {
+        pg->colored = true;
+        page_list_add_order(pg, page_to_head(pg));
+        pg++;
+    }
+}
+
+static inline bool is_page_colored(struct page_info *pg)
+{
+        return pg->colored;
+}
+
+static void dump_col_heap(unsigned char key)
+{
+    struct page_info *pg;
+    unsigned long size;
+    unsigned int i;
+
+    printk("Colored heap info\n");
+    for ( i = 0; i < col_num_max; i++ )
+    {
+        printk("Heap[%u]: ", i);
+        size = 0;
+        page_list_for_each( pg, color_to_head(i) )
+        {
+            BUG_ON(!(color_from_page(pg) == i));
+            size++;
+        }
+        printk("%lu pages -> %lukB free\n", size, size << (PAGE_SHIFT - 10));
+    }
+
+    printk("Total number of pages: %lu\n", total_avail_col_pages);
+}
+#else /* !CONFIG_COLORING */
+#define init_col_heap_pages(x, y) init_heap_pages(x, y)
+
+inline struct page_info *alloc_col_domheap_page(
+	struct domain *d, unsigned int memflags)
+{
+	return NULL;
+}
+
+inline void free_col_heap_page(struct page_info *pg)
+{
+	return;
+}
+
+static inline bool is_page_colored(struct page_info *pg)
+{
+        return false;
+}
+#endif /* CONFIG_COLORING */
+
 /*************************
  * BINARY BUDDY ALLOCATOR
  */
@@ -458,7 +718,6 @@ static unsigned long node_need_scrub[MAX_NUMNODES];
 static unsigned long *avail[MAX_NUMNODES];
 static long total_avail_pages;
 
-static DEFINE_SPINLOCK(heap_lock);
 static long outstanding_claims; /* total outstanding claims by all domains */
 
 unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
@@ -2600,6 +2859,9 @@ static void cf_check dump_heap(unsigned char key)
 static __init int cf_check register_heap_trigger(void)
 {
     register_keyhandler('H', dump_heap, "dump heap info", 1);
+#ifdef CONFIG_COLORING
+    register_keyhandler('c', dump_col_heap, "dump coloring heap info", 1);
+#endif
     return 0;
 }
 __initcall(register_heap_trigger);
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index f0861ed5bb..63288e537c 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -131,6 +131,11 @@ unsigned int online_page(mfn_t mfn, uint32_t *status);
 int offline_page(mfn_t mfn, int broken, uint32_t *status);
 int query_page_offline(mfn_t mfn, uint32_t *status);
 
+/* Colored suballocator. */
+struct page_info *alloc_col_domheap_page(
+    struct domain *d, unsigned int memflags);
+void free_col_heap_page(struct page_info *pg);
+
 void heap_init_late(void);
 
 int assign_pages(
-- 
2.30.2


