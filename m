Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DE15A2808
	for <lists+xen-devel@lfdr.de>; Fri, 26 Aug 2022 14:52:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393759.632947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRYoH-00030P-UM; Fri, 26 Aug 2022 12:51:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393759.632947; Fri, 26 Aug 2022 12:51:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRYoH-0002v8-Mt; Fri, 26 Aug 2022 12:51:41 +0000
Received: by outflank-mailman (input) for mailman id 393759;
 Fri, 26 Aug 2022 12:51:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z28m=Y6=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1oRYoF-0001dl-O1
 for xen-devel@lists.xenproject.org; Fri, 26 Aug 2022 12:51:39 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2ca2647-253d-11ed-bd2e-47488cf2e6aa;
 Fri, 26 Aug 2022 14:51:38 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id gb36so2951283ejc.10
 for <xen-devel@lists.xenproject.org>; Fri, 26 Aug 2022 05:51:37 -0700 (PDT)
Received: from carlo-ubuntu.. (hipert-gw1.mat.unimo.it. [155.185.5.1])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a1709063cb200b006ff0b457cdasm888812ejh.53.2022.08.26.05.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 05:51:36 -0700 (PDT)
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
X-Inumbo-ID: d2ca2647-253d-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=U19EH6QAwxhEkTeWIxszhQ+InALJqVaMoD+q8dGRBDI=;
        b=OEhuXHKa4EUgvKnKCL3I/lh2E1gm1vyFuhpuNyjQ4SQW8XEvAJiTpZcR3rL+fYvWF4
         piNtjknBvC7gIarGTq3b8Nqjq8v2o2jaxC/k8RHqzLkVA1swbQbmFVSWZAomIB4ZbOrX
         HytBtYHb+A2jVS89INTytidDiDvaGYmDZJXZwSy5ka+s+BJBxdwqAXn4SEc4D1jlTxn/
         1tYSaWiW53syvxttlnp2KGjhV9mq088djluFtJ1YhClWsdEVkoRDFcbGDGhh4L/Y1SSM
         laxqDbkNUCwYywEd1TfzT1rHVVgr1JOfuLawIdPZjDWdvNJ0hOaZ6l4mBVA/S5cljkST
         7eWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=U19EH6QAwxhEkTeWIxszhQ+InALJqVaMoD+q8dGRBDI=;
        b=S2i09H0tjZfAQchdiEtCJDpS2GqsH54gd22H3wPFVPalYPG7G2BjzRz8ZcaTVy3jku
         O3coM5UyLCkHXmqxBaKCxyoIMtRBEIfjB5jTZjHAqxepydMZ2SZoi7wcdkA7RnL0zEe0
         J9j2H9Wwi6xMBU5gVEggp491zCBOHMKRAD+sDZsRZ08jwjweSMUa2BtQAyS+2qjMjN4P
         qpHhl0tJ8x2eTAwjZ3sr8kQ6ueS1LATmcyLPPf5j0vz2g2x4CDG9OoegDtkrxqGY3SPn
         AjsvcLMi76k9FN6sz0ctupsccvyJU6kfsXy0Ddlpr2pWP4vDmgj7MYzcdBz6q0mak1hF
         olKA==
X-Gm-Message-State: ACgBeo2au8rF59MP5vO5Yx/ovXGp78RbpvgofmqxPFqJ9a3osGsZgrSI
	5cqcbISptZJu3Wny2JOyU+eS0a2d1LiEEA==
X-Google-Smtp-Source: AA6agR6zOQOOy13zYcedLOKfh3IPynjNphh93x6YWFOqV7oY0e9XjPwMdznT5ZczJ9Glh7H8uM4zRg==
X-Received: by 2002:a17:906:8cb0:b0:730:d6f3:279e with SMTP id qr48-20020a1709068cb000b00730d6f3279emr5705871ejc.25.1661518296990;
        Fri, 26 Aug 2022 05:51:36 -0700 (PDT)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	jbeulich@suse.com,
	julien@xen.org,
	stefano.stabellini@amd.com,
	wl@xen.org,
	marco.solieri@unimore.it,
	andrea.bastoni@minervasys.tech,
	lucmiccio@gmail.com,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH 06/12] xen/common: add cache coloring allocator for domains
Date: Fri, 26 Aug 2022 14:51:05 +0200
Message-Id: <20220826125111.152261-7-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit adds a new memory page allocator that implements the cache
coloring mechanism. The allocation algorithm follows the given color
configuration of the domain and maximizes contiguity in the page selection.

Pages are stored in a color-indexed data structure of lists, sorted by their
machine addresses, that are collectively called the colored heap. A simple
initialization function computes the color of any available page and inserts
it in the corresponding list. When a domain requests a page, the allocator
takes one from the subset of lists whose colors equals the domain
configuration. It chooses the page with the highest machine address such that
contiguous pages are sequentially allocated, if this is made possible by a
color assignment which includes adjacent colors.

The allocator can handle only requests with order equals to 0 since the
single color granularity is represented in memory by one page.

The buddy allocator must coexist with the colored one because the Xen heap
isn't colored. For this reason a new Kconfig option and a command line
parameter are added to let the user set the amount of memory reserved for
the buddy allocator. Even when cache coloring is enabled, this memory isn't
managed by the colored allocator.

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
 docs/misc/arm/cache-coloring.rst    |  43 +++++-
 docs/misc/xen-command-line.pandoc   |  14 ++
 xen/arch/arm/Kconfig                |  12 ++
 xen/arch/arm/coloring.c             |  10 ++
 xen/arch/arm/include/asm/coloring.h |   6 +
 xen/arch/arm/include/asm/mm.h       |   3 +
 xen/common/page_alloc.c             | 213 ++++++++++++++++++++++++++--
 7 files changed, 290 insertions(+), 11 deletions(-)

diff --git a/docs/misc/arm/cache-coloring.rst b/docs/misc/arm/cache-coloring.rst
index 763acd2d3f..5f9132e525 100644
--- a/docs/misc/arm/cache-coloring.rst
+++ b/docs/misc/arm/cache-coloring.rst
@@ -13,6 +13,9 @@ In order to enable and use it, few steps are needed.
   (refer to menuconfig help for value meaning and when it should be changed).
 
         CONFIG_MAX_CACHE_COLORS=<n>
+- If needed, change the amount of memory reserved for the buddy allocator either
+  from the Xen configuration file, via the CONFIG_BUDDY_ALLOCATOR_SIZE value,
+  or with the command line option. See `Colored allocator and buddy allocator`.
 - Assign colors to domains using the `Color selection format`_ (see
   `Coloring parameters`_ for more documentation pointers).
 
@@ -157,4 +160,42 @@ Please refer to the relative documentation in
 "docs/misc/arm/device-tree/booting.txt".
 
 Note that if no color configuration is provided for domains, they fallback to
-the default one, which corresponds simply to all available colors.
\ No newline at end of file
+the default one, which corresponds simply to all available colors.
+
+Colored allocator and buddy allocator
+*************************************
+
+The colored allocator distributes pages based on color configurations of
+domains so that each domains only gets pages of its own colors.
+The colored allocator is meant as an alternative to the buddy allocator because
+its allocation policy is by definition incompatible with the generic one. Since
+the Xen heap systems is not colored yet, we need to support the coexistence of
+the two allocators and some memory must be left for the buddy one.
+The buddy allocator memory can be reserved from the Xen configuration file or
+with the help of a command-line option.
+
+Known issues and limitations
+****************************
+
+Colored allocator can only make use of order-0 pages
+####################################################
+
+The cache coloring technique relies on memory mappings and on the smallest
+amount of memory that can be mapped to achieve the maximum number of colors
+(cache partitions) possible. This amount is what is normally called a page and,
+in Xen terminology, the order-0 page is the smallest one. The fairly simple
+colored allocator currently implemented, makes use only of such pages.
+It must be said that a more complex one could, in theory, adopt higher order
+pages if the colors selection contained adjacent colors. Two subsequent colors,
+for example, can be represented by a order-1 page, four colors correspond to
+a order-2 pages, etc.
+
+Fail to boot colored DomUs with large memory size
+#################################################
+
+If the Linux kernel used for Dom0 does not contain the upstream commit
+3941552aec1e04d63999988a057ae09a1c56ebeb and uses the hypercall buffer device,
+colored DomUs with memory size larger then 127 MB cannot be created. This is
+caused by the default limit of this buffer of 64 pages. The solution is to
+manually apply the above patch, or to check if there is an updated version of
+the kernel in use for Dom0 that contains this change.
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 910ebeb2eb..4e85c4dfe4 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -299,6 +299,20 @@ can be maintained with the pv-shim mechanism.
     cause Xen not to use Indirect Branch Tracking even when support is
     available in hardware.
 
+### buddy-alloc-size (arm64)
+> `= <size>`
+
+> Default: `64M`
+
+Amount of memory reserved for the buddy allocator when colored allocator is
+active. This options is parsed only when cache coloring support is enabled.
+The colored allocator is meant as an alternative to the buddy allocator,
+because its allocation policy is by definition incompatible with the
+generic one. Since the Xen heap systems is not colored yet, we need to
+support the coexistence of the two allocators for now. This parameter, which is
+optional and for expert only, it's used to set the amount of memory reserved to
+the buddy allocator.
+
 ### clocksource (x86)
 > `= pit | hpet | acpi | tsc`
 
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 8acff9682c..abce4bfc25 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -147,6 +147,18 @@ config MAX_CACHE_COLORS
 	  colors at boot. Note that if, at any time, a color configuration with more
 	  colors than the maximum will be employed an error will be produced.
 
+config BUDDY_ALLOCATOR_SIZE
+	string "Buddy allocator reserved memory size" if CACHE_COLORING
+	default "64M" if CACHE_COLORING
+	default "0M" if !CACHE_COLORING
+	help
+	  Amount of memory reserved for the buddy allocator to work alongside
+	  the colored one. The colored allocator is meant as an alternative to the
+	  buddy allocator because its allocation policy is by definition
+	  incompatible with the generic one. Since the Xen heap systems is not
+	  colored yet, we need to support the coexistence of the two allocators and
+	  some memory must be left for the buddy one.
+
 config TEE
 	bool "Enable TEE mediators support (UNSUPPORTED)" if UNSUPPORTED
 	default n
diff --git a/xen/arch/arm/coloring.c b/xen/arch/arm/coloring.c
index 87e20b952e..3fb86043d1 100644
--- a/xen/arch/arm/coloring.c
+++ b/xen/arch/arm/coloring.c
@@ -300,6 +300,16 @@ void prepare_color_domain_config(struct xen_arch_domainconfig *config,
     config->num_colors = (uint16_t)num;
 }
 
+unsigned int page_to_color(struct page_info *pg)
+{
+    return addr_to_color(page_to_maddr(pg));
+}
+
+unsigned int get_max_colors(void)
+{
+    return max_colors;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/coloring.h b/xen/arch/arm/include/asm/coloring.h
index b7fa323870..0982bc9853 100644
--- a/xen/arch/arm/include/asm/coloring.h
+++ b/xen/arch/arm/include/asm/coloring.h
@@ -29,6 +29,8 @@
 
 #include <public/arch-arm.h>
 
+struct page_info;
+
 bool __init coloring_init(void);
 
 int domain_coloring_init(struct domain *d,
@@ -39,4 +41,8 @@ void domain_dump_coloring_info(struct domain *d);
 void prepare_color_domain_config(struct xen_arch_domainconfig *config,
                                  const char *colors_str);
 
+unsigned int page_to_color(struct page_info *pg);
+
+unsigned int get_max_colors(void);
+
 #endif /* !__ASM_ARM_COLORING_H__ */
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index da25251cda..a59fc3791a 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -143,6 +143,9 @@ struct page_info
 #define PGC_count_width   PG_shift(10)
 #define PGC_count_mask    ((1UL<<PGC_count_width)-1)
 
+#define _PGC_colored      PG_shift(11)
+#define PGC_colored       PG_mask(1, 11)
+
 /*
  * Page needs to be scrubbed. Since this bit can only be set on a page that is
  * free (i.e. in PGC_state_free) we can reuse PGC_allocated bit.
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index bfd4150be7..4ae3cfe9a7 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -150,6 +150,9 @@
 #define p2m_pod_offline_or_broken_hit(pg) 0
 #define p2m_pod_offline_or_broken_replace(pg) BUG_ON(pg != NULL)
 #endif
+#ifdef CONFIG_CACHE_COLORING
+#include <asm/coloring.h>
+#endif
 
 #ifndef PGC_static
 #define PGC_static 0
@@ -231,6 +234,9 @@ static bool __read_mostly scrub_debug;
 #define scrub_debug    false
 #endif
 
+/* Memory required for buddy allocator to work with colored one */
+static unsigned long __initdata buddy_alloc_size;
+
 /*
  * Bit width of the DMA heap -- used to override NUMA-node-first.
  * allocation strategy, which can otherwise exhaust low memory.
@@ -440,7 +446,172 @@ mfn_t __init alloc_boot_pages(unsigned long nr_pfns, unsigned long pfn_align)
     BUG();
 }
 
+static DEFINE_SPINLOCK(heap_lock);
 
+/* Initialise fields which have other uses for free pages. */
+static void init_free_page_fields(struct page_info *pg)
+{
+    pg->u.inuse.type_info = PGT_TYPE_INFO_INITIALIZER;
+    page_set_owner(pg, NULL);
+}
+
+static bool is_page_colored(struct page_info *pg)
+{
+    return pg->count_info & PGC_colored;
+}
+
+#ifdef CONFIG_CACHE_COLORING
+/*************************
+ * COLORED SIDE-ALLOCATOR
+ *
+ * Pages are stored by their color in separate lists. Each list defines a color
+ * and it is initialized during end_boot_allocator, where each page's color
+ * is calculated and the page itself is put in the correct list.
+ * After initialization there will be N lists where N is the number of maximum
+ * available colors on the platform.
+ */
+typedef struct page_list_head colored_pages_t;
+static colored_pages_t __ro_after_init *color_heap;
+
+#define colored_pages(color) &color_heap[(color)]
+
+static void color_heap_insert_page(struct page_info *pg)
+{
+    struct page_info *pos;
+    struct page_list_head *head = colored_pages(page_to_color(pg));
+
+    pg->count_info |= PGC_colored;
+
+    /* Insert page in list in ascending machine address order */
+    page_list_for_each( pos, head )
+    {
+        if ( page_to_maddr(pos) < page_to_maddr(pg) )
+        {
+            head = &pos->list;
+            break;
+        }
+    }
+
+    page_list_add_tail(pg, head);
+}
+
+static void color_heap_remove_page(struct page_info *pg)
+{
+    page_list_del(pg, colored_pages(page_to_color(pg)));
+}
+
+static void __init init_col_heap_pages(struct page_info *pg,
+                                       unsigned long nr_pages)
+{
+    unsigned int i;
+
+    if ( !color_heap )
+    {
+        unsigned int max_colors = get_max_colors();
+        color_heap = xmalloc_array(colored_pages_t, max_colors);
+        BUG_ON(!color_heap);
+
+        for ( i = 0; i < max_colors; i++ )
+            INIT_PAGE_LIST_HEAD(colored_pages(i));
+
+        if ( !buddy_alloc_size )
+            buddy_alloc_size = parse_size_and_unit(CONFIG_BUDDY_ALLOCATOR_SIZE,
+                                                   NULL);
+    }
+
+    printk(XENLOG_INFO "Init color heap with %lu pages\n", nr_pages);
+    printk(XENLOG_INFO "Paging starting from: 0x%"PRIx64"\n",
+           page_to_maddr(pg));
+
+    for ( i = 0; i < nr_pages; i++ )
+        color_heap_insert_page(pg++);
+}
+
+/* Alloc one page based on domain color configuration */
+static struct page_info *alloc_col_heap_page(unsigned int memflags,
+                                             const unsigned int *colors,
+                                             unsigned int num_colors)
+{
+    struct page_info *pg = NULL;
+    unsigned int i;
+    bool need_tlbflush = false;
+    uint32_t tlbflush_timestamp = 0;
+
+    spin_lock(&heap_lock);
+
+    for ( i = 0; i < num_colors; i++ )
+    {
+        struct page_info *tmp;
+
+        if ( page_list_empty(colored_pages(colors[i])) )
+            continue;
+
+        tmp = page_list_first(colored_pages(colors[i]));
+        if ( !pg || page_to_maddr(tmp) > page_to_maddr(pg) )
+            pg = tmp;
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
+        accumulate_tlbflush(&need_tlbflush, pg, &tlbflush_timestamp);
+
+    init_free_page_fields(pg);
+    flush_page_to_ram(mfn_x(page_to_mfn(pg)),
+                      !(memflags & MEMF_no_icache_flush));
+    color_heap_remove_page(pg);
+
+    spin_unlock(&heap_lock);
+
+    if ( need_tlbflush )
+        filtered_flush_tlb_mask(tlbflush_timestamp);
+
+    return pg;
+}
+
+static void free_col_domheap_page(struct page_info *pg)
+{
+    pg->count_info = PGC_state_free;
+    page_set_owner(pg, NULL);
+    color_heap_insert_page(pg);
+}
+
+static struct page_info *alloc_col_domheap_page(struct domain *d,
+                                                unsigned int memflags)
+{
+    struct page_info *pg;
+
+    ASSERT(!in_irq());
+
+    pg = alloc_col_heap_page(memflags, d->arch.colors, d->arch.num_colors);
+    if ( !pg )
+    {
+        printk(XENLOG_ERR "Colored page is null for domain %pd\n", d);
+        return NULL;
+    }
+
+    if ( d && !(memflags & MEMF_no_owner) && assign_page(pg, 0, d, memflags) )
+    {
+        free_col_domheap_page(pg);
+        return NULL;
+    }
+
+    return pg;
+}
+
+size_param("buddy-alloc-size", buddy_alloc_size);
+#else
+static void free_col_domheap_page(struct page_info *pg)
+{
+    return;
+}
+#endif /* CONFIG_CACHE_COLORING */
 
 /*************************
  * BINARY BUDDY ALLOCATOR
@@ -462,7 +633,6 @@ static unsigned long node_need_scrub[MAX_NUMNODES];
 static unsigned long *avail[MAX_NUMNODES];
 static long total_avail_pages;
 
-static DEFINE_SPINLOCK(heap_lock);
 static long outstanding_claims; /* total outstanding claims by all domains */
 
 unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
@@ -1027,10 +1197,7 @@ static struct page_info *alloc_heap_pages(
             accumulate_tlbflush(&need_tlbflush, &pg[i],
                                 &tlbflush_timestamp);
 
-        /* Initialise fields which have other uses for free pages. */
-        pg[i].u.inuse.type_info = PGT_TYPE_INFO_INITIALIZER;
-        page_set_owner(&pg[i], NULL);
-
+        init_free_page_fields(&pg[i]);
     }
 
     spin_unlock(&heap_lock);
@@ -1926,6 +2093,7 @@ static unsigned long avail_heap_pages(
 void __init end_boot_allocator(void)
 {
     unsigned int i;
+    unsigned long buddy_pages = PFN_DOWN(buddy_alloc_size);
 
     /* Pages that are free now go to the domain sub-allocator. */
     for ( i = 0; i < nr_bootmem_regions; i++ )
@@ -1939,11 +2107,24 @@ void __init end_boot_allocator(void)
             break;
         }
     }
-    for ( i = nr_bootmem_regions; i-- > 0; )
+
+    for ( i = 0; i < nr_bootmem_regions; i++ )
     {
         struct bootmem_region *r = &bootmem_region_list[i];
+
+        if ( buddy_pages && (r->s < r->e) )
+        {
+            unsigned long pages = MIN(r->e - r->s, buddy_pages);
+            init_heap_pages(mfn_to_page(_mfn(r->s)), pages);
+            r->s += pages;
+            buddy_pages -= pages;
+        }
         if ( r->s < r->e )
+#ifdef CONFIG_CACHE_COLORING
+            init_col_heap_pages(mfn_to_page(_mfn(r->s)), r->e - r->s);
+#else
             init_heap_pages(mfn_to_page(_mfn(r->s)), r->e - r->s);
+#endif
     }
     nr_bootmem_regions = 0;
 
@@ -2429,6 +2610,17 @@ struct page_info *alloc_domheap_pages(
 
     ASSERT_ALLOC_CONTEXT();
 
+#ifdef CONFIG_CACHE_COLORING
+    /* Only domains are supported for coloring */
+    if ( d )
+    {
+        /* Colored allocation must be done on 0 order */
+        if ( order )
+            return NULL;
+        return alloc_col_domheap_page(d, memflags);
+    }
+#endif
+
     bits = domain_clamp_alloc_bitsize(memflags & MEMF_no_owner ? NULL : d,
                                       bits ? : (BITS_PER_LONG+PAGE_SHIFT));
 
@@ -2546,7 +2738,10 @@ void free_domheap_pages(struct page_info *pg, unsigned int order)
             scrub = 1;
         }
 
-        free_heap_pages(pg, order, scrub);
+        if ( is_page_colored(pg) )
+            free_col_domheap_page(pg);
+        else
+            free_heap_pages(pg, order, scrub);
     }
 
     if ( drop_dom_ref )
@@ -2759,9 +2954,7 @@ static struct page_info * __init acquire_staticmem_pages(mfn_t smfn,
          * to PGC_state_inuse.
          */
         pg[i].count_info = PGC_static | PGC_state_inuse;
-        /* Initialise fields which have other uses for free pages. */
-        pg[i].u.inuse.type_info = PGT_TYPE_INFO_INITIALIZER;
-        page_set_owner(&pg[i], NULL);
+        init_free_page_fields(&pg[i]);
     }
 
     spin_unlock(&heap_lock);
-- 
2.34.1


