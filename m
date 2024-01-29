Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75299840EEB
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jan 2024 18:20:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673071.1047308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUVIA-00083P-8O; Mon, 29 Jan 2024 17:19:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673071.1047308; Mon, 29 Jan 2024 17:19:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUVI9-0007sW-Sp; Mon, 29 Jan 2024 17:19:29 +0000
Received: by outflank-mailman (input) for mailman id 673071;
 Mon, 29 Jan 2024 17:19:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vh+I=JH=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rUVI8-0005vY-5J
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2024 17:19:28 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8dded0bd-beca-11ee-8a43-1f161083a0e0;
 Mon, 29 Jan 2024 18:19:26 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-55c33773c0aso2932656a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jan 2024 09:19:26 -0800 (PST)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 eo15-20020a056402530f00b005598ec568dbsm3970494edb.59.2024.01.29.09.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 09:19:25 -0800 (PST)
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
X-Inumbo-ID: 8dded0bd-beca-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1706548766; x=1707153566; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xs19vJNLniUVsdKVutvtLwP1VZTZPktS4ivl+2Fef/4=;
        b=IjIGYpjDlCncxLWFRF2+pHvMOZL5A89ZJKpFy5fa2zWwFDPZkdAnsBmVrHn0BgmflY
         piQ7k15dmALMOVpSuCNmWa4adVYVZQR+U1VVMvCw5JZttBaHOvGjuYZFjVdgRTQN2TdG
         Zn1anbmczluv8u/g2jnXWIcUw00h/uKL3TbNHOAX9vGO0CKKEExCv9cE8ZNfCE3h9+ML
         vYss4Rl/u0kKn2M2bXnrbZTLzxEAF8RMK05jQm0IvuBjw8+w0Q806cGLju6HfhGfBk7o
         WVuSoLCWkK48kzzIGZJJ0Gf+Plwlrkkfn6Lrmjq0EGLLMWuPDsVNb286sQX83SizSKqT
         worQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706548766; x=1707153566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xs19vJNLniUVsdKVutvtLwP1VZTZPktS4ivl+2Fef/4=;
        b=bWlqd/d5SlUrd62LujEnaKMD2h0Mvra3XGx3jJewYTgpoNn6jSWDeNKzCLfj0FPKJX
         +ktwk+ezWEYMHntFJfVBrLdOeT0mJQCs/qMUgGjXDbGXLnn6YbOuExmQDFvkRtX3qq0E
         JDdM6aY9VTXnvgQcgeY20Npz3W88xm3aEGia1GuZ+0+eMiwzuH1e4Fog1emm1Oe69dTk
         zSSe48+9qr5yHWethw/0/36AOMjPyandqUt8KF2V5Il+nsn9Vf5bNc5yFCP5T5h9SUqd
         lnV1rUXv4/YEfG5VScM/MxuhUil4zg9I37dAXtUNWGUcb6D4gSlARFHqhiGSxL922qzG
         qacw==
X-Gm-Message-State: AOJu0YzGio4Cot8cwRffRYrvk+mfqCUsifWXdNHcOrw/UEtTkuvePfPh
	MnH6irzWYS78WT0PmP7IttBvEiH5NnyssD6GnY6XS8eY1pvoH8JYpOqxGYpQ836JgVzB9aD4OCm
	zBGs=
X-Google-Smtp-Source: AGHT+IGdGT5cRny9mU8SBbkRLw3pKeULmlYnq2TZaaLSJz9byCvAP1JqTQcUJfCPT6IILFXDNjoRGA==
X-Received: by 2002:a05:6402:40c8:b0:55d:3d64:3ba6 with SMTP id z8-20020a05640240c800b0055d3d643ba6mr5232740edb.29.1706548765751;
        Mon, 29 Jan 2024 09:19:25 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH v6 10/15] xen: add cache coloring allocator for domains
Date: Mon, 29 Jan 2024 18:18:06 +0100
Message-Id: <20240129171811.21382-11-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new memory page allocator that implements the cache coloring mechanism.
The allocation algorithm enforces equal frequency distribution of cache
partitions, following the coloring configuration of a domain. This allows
for an even utilization of cache sets for every domain.

Pages are stored in a color-indexed array of lists. Those lists are filled
by a simple init function which computes the color of each page.
When a domain requests a page, the allocator extract the page from the list
with the maximum number of free pages between those that the domain can
access, given its coloring configuration.

The allocator can only handle requests of order-0 pages. This allows for
easier implementation and since cache coloring targets only embedded systems,
it's assumed not to be a major problem.

The buddy allocator must coexist with the colored one because the Xen heap
isn't colored. For this reason a new Kconfig option and a command line
parameter are added to let the user set the amount of memory reserved for
the buddy allocator. Even when cache coloring is enabled, this memory
isn't managed by the colored allocator.

Colored heap information is dumped in the dump_heap() debug-key function.

Based on original work from: Luca Miccio <lucmiccio@gmail.com>

Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
---
v6:
- colored allocator functions are now static
v5:
- Carlo Nonato as the new author
- the colored allocator balances color usage for each domain and it searches
  linearly only in the number of colors (FIXME removed)
- addedd scrub functionality
- removed stub functions (still requires some macro definition)
- addr_to_color turned to mfn_to_color for easier operations
- removed BUG_ON in init_color_heap_pages() in favor of panic()
- only non empty page lists are logged in dump_color_heap()
v4:
- moved colored allocator code after buddy allocator because it now has
  some dependencies on buddy functions
- buddy_alloc_size is now used only by the colored allocator
- fixed a bug that allowed the buddy to merge pages when they were colored
- free_color_heap_page() now calls mark_page_free()
- free_color_heap_page() uses of the frametable array for faster searches
- added FIXME comment for the linear search in free_color_heap_page()
- removed alloc_color_domheap_page() to let the colored allocator exploit
  some more buddy allocator code
- alloc_color_heap_page() now allocs min address pages first
- reduced the mess in end_boot_allocator(): use the first loop for
  init_color_heap_pages()
- fixed page_list_add_prev() (list.h) since it was doing the opposite of
  what it was supposed to do
- fixed page_list_add_prev() (non list.h) to check also for next existence
- removed unused page_list_add_next()
- moved p2m code in another patch
---
 docs/misc/cache-coloring.rst      |  37 ++++++
 docs/misc/xen-command-line.pandoc |  14 +++
 xen/arch/Kconfig                  |   8 ++
 xen/arch/arm/include/asm/mm.h     |   5 +
 xen/common/llc-coloring.c         |  13 ++
 xen/common/page_alloc.c           | 194 +++++++++++++++++++++++++++++-
 xen/include/xen/llc-coloring.h    |   4 +
 7 files changed, 270 insertions(+), 5 deletions(-)

diff --git a/docs/misc/cache-coloring.rst b/docs/misc/cache-coloring.rst
index bf055d7e7f..db1a719698 100644
--- a/docs/misc/cache-coloring.rst
+++ b/docs/misc/cache-coloring.rst
@@ -9,6 +9,9 @@ To compile LLC coloring support set ``CONFIG_LLC_COLORING=y``.
 If needed, change the maximum number of colors with
 ``CONFIG_NR_LLC_COLORS=<n>``.
 
+If needed, change the buddy allocator reserved size with
+``CONFIG_BUDDY_ALLOCATOR_SIZE=<n>``.
+
 Compile Xen and the toolstack and then configure it via
 `Command line parameters`_. For DomUs follow `DomUs configuration`_.
 
@@ -87,6 +90,8 @@ More specific documentation is available at `docs/misc/xen-command-line.pandoc`.
 +----------------------+-------------------------------+
 | ``dom0-llc-colors``  | Dom0 color configuration      |
 +----------------------+-------------------------------+
+| ``buddy-alloc-size`` | Buddy allocator reserved size |
++----------------------+-------------------------------+
 
 Colors selection format
 ***********************
@@ -161,6 +166,17 @@ DomUs colors can be set via Device Tree, also for Dom0less configurations
 **Note:** If no color configuration is provided for a domain, the default one,
 which corresponds to all available colors is used instead.
 
+Colored allocator and buddy allocator
+*************************************
+
+The colored allocator distributes pages based on color configurations of
+domains so that each domains only gets pages of its own colors.
+The colored allocator is meant as an alternative to the buddy allocator because
+its allocation policy is by definition incompatible with the generic one. Since
+the Xen heap is not colored yet, we need to support the coexistence of the two
+allocators and some memory must be left for the buddy one. Buddy memory
+reservation is configured via Kconfig or via command-line.
+
 Known issues and limitations
 ****************************
 
@@ -171,3 +187,24 @@ In the domain configuration, "xen,static-mem" allows memory to be statically
 allocated to the domain. This isn't possible when LLC coloring is enabled,
 because that memory can't be guaranteed to use only colors assigned to the
 domain.
+
+Cache coloring is intended only for embedded systems
+####################################################
+
+The current implementation aims to satisfy the need of predictability in
+embedded systems with small amount of memory to be managed in a colored way.
+Given that, some shortcuts are taken in the development. Expect worse
+performances on larger systems.
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
+for example, can be represented by an order-1 page, four colors correspond to
+an order-2 page, etc.
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 25da997b5b..d52d38b97a 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -270,6 +270,20 @@ and not running softirqs. Reduce this if softirqs are not being run frequently
 enough. Setting this to a high value may cause boot failure, particularly if
 the NMI watchdog is also enabled.
 
+### buddy-alloc-size (arm64)
+> `= <size>`
+
+> Default: `64M`
+
+Amount of memory reserved for the buddy allocator when colored allocator is
+active. This options is parsed only when LLC coloring support is enabled.
+The colored allocator is meant as an alternative to the buddy allocator,
+because its allocation policy is by definition incompatible with the generic
+one. Since the Xen heap systems is not colored yet, we need to support the
+coexistence of the two allocators for now. This parameter, which is optional
+and for expert only, it's used to set the amount of memory reserved to the
+buddy allocator.
+
 ### cet
     = List of [ shstk=<bool>, ibt=<bool> ]
 
diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
index c1157bcbcb..b50082eb84 100644
--- a/xen/arch/Kconfig
+++ b/xen/arch/Kconfig
@@ -48,3 +48,11 @@ config NR_LLC_COLORS
 	  bound. The runtime value is autocomputed or manually set via cmdline.
 	  The default value corresponds to an 8 MiB 16-ways LLC, which should be
 	  more than what needed in the general case.
+
+config BUDDY_ALLOCATOR_SIZE
+	int "Buddy allocator reserved memory size (MiB)"
+	default "64"
+	depends on LLC_COLORING
+	help
+	  Amount of memory reserved for the buddy allocator to serve Xen heap,
+	  working alongside the colored one.
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index cbcf3bf147..1829c559d6 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -145,6 +145,11 @@ struct page_info
 #else
 #define PGC_static     0
 #endif
+#ifdef CONFIG_LLC_COLORING
+/* Page is cache colored */
+#define _PGC_colored      PG_shift(4)
+#define PGC_colored       PG_mask(1, 4)
+#endif
 /* ... */
 /* Page is broken? */
 #define _PGC_broken       PG_shift(7)
diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
index a932a61e0c..25e0861733 100644
--- a/xen/common/llc-coloring.c
+++ b/xen/common/llc-coloring.c
@@ -21,6 +21,9 @@ static unsigned int __ro_after_init max_nr_colors = CONFIG_NR_LLC_COLORS;
 static unsigned int __initdata dom0_colors[CONFIG_NR_LLC_COLORS];
 static unsigned int __initdata dom0_num_colors;
 
+#define mfn_color_mask              (max_nr_colors - 1)
+#define mfn_to_color(mfn)           (mfn_x(mfn) & mfn_color_mask)
+
 /*
  * Parse the coloring configuration given in the buf string, following the
  * syntax below.
@@ -277,6 +280,16 @@ int domain_set_llc_colors_from_str(struct domain *d, const char *str)
     return domain_check_colors(d);
 }
 
+unsigned int page_to_llc_color(const struct page_info *pg)
+{
+    return mfn_to_color(page_to_mfn(pg));
+}
+
+unsigned int get_max_nr_llc_colors(void)
+{
+    return max_nr_colors;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 7c135e0bb4..469d78869f 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -126,6 +126,7 @@
 #include <xen/irq.h>
 #include <xen/keyhandler.h>
 #include <xen/lib.h>
+#include <xen/llc-coloring.h>
 #include <xen/mm.h>
 #include <xen/nodemask.h>
 #include <xen/numa.h>
@@ -157,7 +158,11 @@
 #define PGC_static 0
 #endif
 
-#define PGC_preserved (PGC_extra | PGC_static)
+#ifndef PGC_colored
+#define PGC_colored 0
+#endif
+
+#define PGC_preserved (PGC_extra | PGC_static | PGC_colored)
 
 #ifndef PGT_TYPE_INFO_INITIALIZER
 #define PGT_TYPE_INFO_INITIALIZER 0
@@ -1504,6 +1509,7 @@ static void free_heap_pages(
             if ( !mfn_valid(page_to_mfn(predecessor)) ||
                  !page_state_is(predecessor, free) ||
                  (predecessor->count_info & PGC_static) ||
+                 (predecessor->count_info & PGC_colored) ||
                  (PFN_ORDER(predecessor) != order) ||
                  (page_to_nid(predecessor) != node) )
                 break;
@@ -1528,6 +1534,7 @@ static void free_heap_pages(
             if ( !mfn_valid(page_to_mfn(successor)) ||
                  !page_state_is(successor, free) ||
                  (successor->count_info & PGC_static) ||
+                 (successor->count_info & PGC_colored) ||
                  (PFN_ORDER(successor) != order) ||
                  (page_to_nid(successor) != node) )
                 break;
@@ -1943,6 +1950,161 @@ static unsigned long avail_heap_pages(
     return free_pages;
 }
 
+/*************************
+ * COLORED SIDE-ALLOCATOR
+ *
+ * Pages are grouped by LLC color in lists which are globally referred to as the
+ * color heap. Lists are populated in end_boot_allocator().
+ * After initialization there will be N lists where N is the number of
+ * available colors on the platform.
+ */
+static struct page_list_head *__ro_after_init _color_heap;
+static unsigned long *__ro_after_init free_colored_pages;
+
+/* Memory required for buddy allocator to work with colored one */
+#ifdef CONFIG_LLC_COLORING
+static unsigned long __initdata buddy_alloc_size =
+    MB(CONFIG_BUDDY_ALLOCATOR_SIZE);
+size_param("buddy-alloc-size", buddy_alloc_size);
+
+#define domain_num_llc_colors(d) (d)->num_llc_colors
+#define domain_llc_color(d, i)   (d)->llc_colors[(i)]
+#else
+static unsigned long __initdata buddy_alloc_size;
+
+#define domain_num_llc_colors(d) 0
+#define domain_llc_color(d, i)   0
+#endif
+
+#define color_heap(color) (&_color_heap[color])
+
+static void free_color_heap_page(struct page_info *pg, bool need_scrub)
+{
+    unsigned int color = page_to_llc_color(pg);
+    struct page_list_head *head = color_heap(color);
+
+    spin_lock(&heap_lock);
+
+    mark_page_free(pg, page_to_mfn(pg));
+
+    if ( need_scrub )
+    {
+        pg->count_info |= PGC_need_scrub;
+        poison_one_page(pg);
+    }
+
+    pg->count_info |= PGC_colored;
+    free_colored_pages[color]++;
+    page_list_add(pg, head);
+
+    spin_unlock(&heap_lock);
+}
+
+static struct page_info *alloc_color_heap_page(unsigned int memflags,
+                                               const struct domain *d)
+{
+    struct page_info *pg = NULL;
+    unsigned int i, color = 0;
+    unsigned long max = 0;
+    bool need_tlbflush = false;
+    uint32_t tlbflush_timestamp = 0;
+    bool scrub = !(memflags & MEMF_no_scrub);
+
+    spin_lock(&heap_lock);
+
+    for ( i = 0; i < domain_num_llc_colors(d); i++ )
+    {
+        unsigned long free = free_colored_pages[domain_llc_color(d, i)];
+
+        if ( free > max )
+        {
+            color = domain_llc_color(d, i);
+            pg = page_list_first(color_heap(color));
+            max = free;
+        }
+    }
+
+    if ( !pg )
+    {
+        spin_unlock(&heap_lock);
+        return NULL;
+    }
+
+    pg->count_info = PGC_state_inuse | PGC_colored |
+                     (pg->count_info & PGC_need_scrub);
+    free_colored_pages[color]--;
+    page_list_del(pg, color_heap(color));
+
+    if ( !(memflags & MEMF_no_tlbflush) )
+        accumulate_tlbflush(&need_tlbflush, pg, &tlbflush_timestamp);
+
+    init_free_page_fields(pg);
+
+    spin_unlock(&heap_lock);
+
+    if ( test_and_clear_bit(_PGC_need_scrub, &pg->count_info) && scrub )
+        scrub_one_page(pg);
+    else if ( scrub )
+        check_one_page(pg);
+
+    if ( need_tlbflush )
+        filtered_flush_tlb_mask(tlbflush_timestamp);
+
+    flush_page_to_ram(mfn_x(page_to_mfn(pg)),
+                      !(memflags & MEMF_no_icache_flush));
+
+    return pg;
+}
+
+static void __init init_color_heap_pages(struct page_info *pg,
+                                         unsigned long nr_pages)
+{
+    unsigned int i;
+    bool need_scrub = opt_bootscrub == BOOTSCRUB_IDLE;
+
+    if ( buddy_alloc_size )
+    {
+        unsigned long buddy_pages = min(PFN_DOWN(buddy_alloc_size), nr_pages);
+
+        init_heap_pages(pg, buddy_pages);
+        nr_pages -= buddy_pages;
+        buddy_alloc_size -= buddy_pages << PAGE_SHIFT;
+        pg += buddy_pages;
+    }
+
+    if ( !_color_heap )
+    {
+        unsigned int max_nr_colors = get_max_nr_llc_colors();
+
+        _color_heap = xmalloc_array(struct page_list_head, max_nr_colors);
+        free_colored_pages = xzalloc_array(unsigned long, max_nr_colors);
+        if ( !_color_heap || !free_colored_pages )
+            panic("Can't allocate colored heap. Buddy reserved size is too low");
+
+        for ( i = 0; i < max_nr_colors; i++ )
+            INIT_PAGE_LIST_HEAD(color_heap(i));
+    }
+
+    if ( nr_pages )
+        printk(XENLOG_DEBUG
+               "Init color heap with %lu pages, start MFN: %"PRI_mfn"\n",
+               nr_pages, mfn_x(page_to_mfn(pg)));
+
+    for ( i = 0; i < nr_pages; i++ )
+        free_color_heap_page(&pg[i], need_scrub);
+}
+
+static void dump_color_heap(void)
+{
+    unsigned int color;
+
+    printk("Dumping color heap info\n");
+    for ( color = 0; color < get_max_nr_llc_colors(); color++ )
+        if ( free_colored_pages[color] > 0 )
+            printk("Color heap[%u]: %lu pages\n",
+                   color, free_colored_pages[color]);
+}
+
 void __init end_boot_allocator(void)
 {
     unsigned int i;
@@ -1962,7 +2124,13 @@ void __init end_boot_allocator(void)
     for ( i = nr_bootmem_regions; i-- > 0; )
     {
         struct bootmem_region *r = &bootmem_region_list[i];
-        if ( r->s < r->e )
+
+        if ( r->s >= r->e )
+            continue;
+
+        if ( llc_coloring_enabled )
+            init_color_heap_pages(mfn_to_page(_mfn(r->s)), r->e - r->s);
+        else
             init_heap_pages(mfn_to_page(_mfn(r->s)), r->e - r->s);
     }
     nr_bootmem_regions = 0;
@@ -2458,7 +2626,14 @@ struct page_info *alloc_domheap_pages(
     if ( memflags & MEMF_no_owner )
         memflags |= MEMF_no_refcount;
 
-    if ( !dma_bitsize )
+    /* Only domains are supported for coloring */
+    if ( d && llc_coloring_enabled )
+    {
+        /* Colored allocation must be done on 0 order */
+        if ( order || (pg = alloc_color_heap_page(memflags, d)) == NULL )
+            return NULL;
+    }
+    else if ( !dma_bitsize )
         memflags &= ~MEMF_no_dma;
     else if ( (dma_zone = bits_to_zone(dma_bitsize)) < zone_hi )
         pg = alloc_heap_pages(dma_zone + 1, zone_hi, order, memflags, d);
@@ -2483,7 +2658,10 @@ struct page_info *alloc_domheap_pages(
         }
         if ( assign_page(pg, order, d, memflags) )
         {
-            free_heap_pages(pg, order, memflags & MEMF_no_scrub);
+            if ( pg->count_info & PGC_colored )
+                free_color_heap_page(pg, memflags & MEMF_no_scrub);
+            else
+                free_heap_pages(pg, order, memflags & MEMF_no_scrub);
             return NULL;
         }
     }
@@ -2566,7 +2744,10 @@ void free_domheap_pages(struct page_info *pg, unsigned int order)
             scrub = 1;
         }
 
-        free_heap_pages(pg, order, scrub);
+        if ( pg->count_info & PGC_colored )
+            free_color_heap_page(pg, scrub);
+        else
+            free_heap_pages(pg, order, scrub);
     }
 
     if ( drop_dom_ref )
@@ -2673,6 +2854,9 @@ static void cf_check dump_heap(unsigned char key)
             continue;
         printk("Node %d has %lu unscrubbed pages\n", i, node_need_scrub[i]);
     }
+
+    if ( llc_coloring_enabled )
+        dump_color_heap();
 }
 
 static __init int cf_check register_heap_trigger(void)
diff --git a/xen/include/xen/llc-coloring.h b/xen/include/xen/llc-coloring.h
index 63785c8319..b96a7134ed 100644
--- a/xen/include/xen/llc-coloring.h
+++ b/xen/include/xen/llc-coloring.h
@@ -31,6 +31,10 @@ int domain_set_llc_colors_from_str(struct domain *d, const char *str);
 int domain_set_llc_colors_domctl(struct domain *d,
                                  const struct xen_domctl_set_llc_colors *config);
 
+struct page_info;
+unsigned int page_to_llc_color(const struct page_info *pg);
+unsigned int get_max_nr_llc_colors(void);
+
 #endif /* __COLORING_H__ */
 
 /*
-- 
2.34.1


