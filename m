Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F34858B9F0A
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 18:56:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715955.1118013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Zio-0000FW-9P; Thu, 02 May 2024 16:55:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715955.1118013; Thu, 02 May 2024 16:55:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Zin-0000B7-Ua; Thu, 02 May 2024 16:55:49 +0000
Received: by outflank-mailman (input) for mailman id 715955;
 Thu, 02 May 2024 16:55:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8/Nh=MF=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1s2Zil-0006Lf-Lc
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 16:55:47 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1b26224-08a4-11ef-909b-e314d9c70b13;
 Thu, 02 May 2024 18:55:45 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a5557e3ebcaso367139466b.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 09:55:45 -0700 (PDT)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 mq30-20020a170907831e00b00a5987fbfb83sm29103ejc.152.2024.05.02.09.55.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 09:55:44 -0700 (PDT)
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
X-Inumbo-ID: d1b26224-08a4-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1714668945; x=1715273745; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=70o7z5P/u9lC96jCkfPVLMG5TJG4lGrDIqh9ufbB1CA=;
        b=uckBMfCez2QqZ6UXAyGe67ysoXGSuaU5Ottdn691+jp1N2PLaedanOX7jkuSQILqYp
         ZU3X/fvoifSavT07cOV5R+uzrO4gCnadTvliWCZ0zMy1DwJFxAsEEXuqi9CTluBvY946
         sibvyVjVVq+eToz8ctkHw5l9mOb8IHkVvJNHqQGHlInzqT5SufUThngHlAQrKuLoWRY7
         DFX2j2Rm0Sq/y3HfLbMnJC3crosBVfYnIHRF1tFnfBmA2Rvo2Gp1UXrEwt1AADDh9C8K
         2RUgVos+FbfMvwoQtDDpgg6bPplsBNwsDKPttK6o92Ck8H13KU2KpUSohn/A1CNXgfoW
         hJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714668945; x=1715273745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=70o7z5P/u9lC96jCkfPVLMG5TJG4lGrDIqh9ufbB1CA=;
        b=ofo3pDgmvvVqaHdI6PZSXhqyMb34qCJBWMOquWN3OYG65/3Xvm03Ty0kmT28csxonz
         91aw0usPDmvOLSoLCH6Fh4XtiBHVnngljtiIG6id2pW1IA0QVTlsqeRejWJ6hcNqi3S7
         RenH07mtKV9gOHRlvDw8cRq/cbxEYkffrBNdI6+biUjToVj0cRGohmoiv1TQDOvywqAY
         ODW46Am70YySsV7qiWtVI8JY+zqQqWb6LKUfgBlK9NFVlBcjM25fTlK0CUATVUku/7DA
         37wUI1yc/AEc05ldY9qP2GuNQAd0/SaV4v07O922c6HXKp4+4zGS29/XXrbufE1zcL0s
         BBCQ==
X-Gm-Message-State: AOJu0YxWQk9ppPfsaSyQRmDSpF1eYEP5qzd6ptk8zPSacw9EiOGdKIpR
	JfrZ4qDyVE+IgvQsRcV4DXA5HOidIrfPHmQYV6l66ad+Gu3okSQYVgGl9u4HtZzi5F7TbVjy0m5
	X
X-Google-Smtp-Source: AGHT+IGOA87V2E1Mf+hIXpVnN2hqZ/qwFf4DIW7+mPHoXDUmy4CYWAlF760gNoYDHNj0pS1S1hhl8g==
X-Received: by 2002:a17:906:d293:b0:a51:abd8:8621 with SMTP id ay19-20020a170906d29300b00a51abd88621mr2580847ejb.19.1714668944927;
        Thu, 02 May 2024 09:55:44 -0700 (PDT)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH v8 09/13] xen: add cache coloring allocator for domains
Date: Thu,  2 May 2024 18:55:29 +0200
Message-Id: <20240502165533.319988-10-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502165533.319988-1-carlo.nonato@minervasys.tech>
References: <20240502165533.319988-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new memory page allocator that implements the cache coloring mechanism.
The allocation algorithm enforces equal frequency distribution of cache
partitions, following the coloring configuration of a domain. This allows
for an even utilization of cache sets for every domain.

Pages are stored in a color-indexed array of lists. Those lists are filled
by a simple init function which computes the color of each page.
When a domain requests a page, the allocator extracts the page from the list
with the maximum number of free pages among those that the domain can access,
given its coloring configuration.

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
v8:
- requests that uses MEMF_* flags that can't be served are now going to fail
- free_color_heap_page() is called directly from free_heap_pages()
v7:
- requests to alloc_color_heap_page() now fail if MEMF_bits is used
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
 xen/arch/arm/include/asm/mm.h     |   5 +
 xen/common/Kconfig                |   8 ++
 xen/common/llc-coloring.c         |  13 +++
 xen/common/page_alloc.c           | 188 +++++++++++++++++++++++++++++-
 xen/include/xen/llc-coloring.h    |   4 +
 7 files changed, 265 insertions(+), 4 deletions(-)

diff --git a/docs/misc/cache-coloring.rst b/docs/misc/cache-coloring.rst
index 9527d0511e..f996627d0d 100644
--- a/docs/misc/cache-coloring.rst
+++ b/docs/misc/cache-coloring.rst
@@ -11,6 +11,9 @@ To compile LLC coloring support set ``CONFIG_LLC_COLORING=y``.
 If needed, change the maximum number of colors with
 ``CONFIG_MAX_LLC_COLORS_ORDER=<n>``.
 
+If needed, change the buddy allocator reserved size with
+``CONFIG_BUDDY_ALLOCATOR_SIZE=<n>``.
+
 Runtime configuration is done via `Command line parameters`_.
 For DomUs follow `DomUs configuration`_.
 
@@ -108,6 +111,8 @@ Specific documentation is available at `docs/misc/xen-command-line.pandoc`.
 +----------------------+-------------------------------+
 | ``dom0-llc-colors``  | Dom0 color configuration      |
 +----------------------+-------------------------------+
+| ``buddy-alloc-size`` | Buddy allocator reserved size |
++----------------------+-------------------------------+
 
 Colors selection format
 ***********************
@@ -195,6 +200,17 @@ the ``llc-colors`` option. For example:
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
 
@@ -205,3 +221,24 @@ In the domain configuration, "xen,static-mem" allows memory to be statically
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
+mapping granularity to achieve the maximum number of colors (cache partitions)
+possible. This granularity is what is normally called a page and, in Xen
+terminology, the order-0 page is the smallest one. The fairly simple
+colored allocator currently implemented, makes use only of such pages.
+It must be said that a more complex one could, in theory, adopt higher order
+pages if the colors selection contained adjacent colors. Two subsequent colors,
+for example, can be represented by an order-1 page, four colors correspond to
+an order-2 page, etc.
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 2923e1fad4..d4d1e37272 100644
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
+active. This options is available only when LLC coloring support is enabled.
+The colored allocator is meant as an alternative to the buddy allocator,
+because its allocation policy is by definition incompatible with the generic
+one. Since the Xen heap systems is not colored yet, we need to support the
+coexistence of the two allocators for now. This parameter, which is optional
+and for expert only, it's used to set the amount of memory reserved to the
+buddy allocator.
+
 ### cet
     = List of [ shstk=<bool>, ibt=<bool> ]
 
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 48538b5337..68b7754bec 100644
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
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 276ef4e0f9..16573400ed 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -535,4 +535,12 @@ config MAX_LLC_COLORS_ORDER
 	  The default value corresponds to an 8 MiB 16-ways LLC, which should be
 	  more than what's needed in the general case.
 
+config BUDDY_ALLOCATOR_SIZE
+	int "Buddy allocator reserved memory size (MiB)"
+	default "64"
+	depends on LLC_COLORING
+	help
+	  Amount of memory reserved for the buddy allocator to serve Xen heap,
+	  working alongside the colored one.
+
 endmenu
diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
index 000cafbc74..c598eb4bf7 100644
--- a/xen/common/llc-coloring.c
+++ b/xen/common/llc-coloring.c
@@ -27,6 +27,9 @@ static unsigned int __ro_after_init default_colors[NR_LLC_COLORS];
 static unsigned int __initdata dom0_colors[NR_LLC_COLORS];
 static unsigned int __initdata dom0_num_colors;
 
+#define mfn_color_mask              (max_nr_colors - 1)
+#define mfn_to_color(mfn)           (mfn_x(mfn) & mfn_color_mask)
+
 /*
  * Parse the coloring configuration given in the buf string, following the
  * syntax below.
@@ -308,6 +311,16 @@ int __init domain_set_llc_colors_from_str(struct domain *d, const char *str)
     return 0;
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
index e71b571a3b..6a0f1262af 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -158,8 +158,12 @@
 #define PGC_static 0
 #endif
 
-#define PGC_no_buddy_merge PGC_static
-#define PGC_preserved (PGC_extra | PGC_static)
+#ifndef PGC_colored
+#define PGC_colored 0
+#endif
+
+#define PGC_no_buddy_merge (PGC_static | PGC_colored)
+#define PGC_preserved (PGC_extra | PGC_static | PGC_colored)
 
 #ifndef PGT_TYPE_INFO_INITIALIZER
 #define PGT_TYPE_INFO_INITIALIZER 0
@@ -1457,6 +1461,8 @@ static bool mark_page_free(struct page_info *pg, mfn_t mfn)
     return pg_offlined;
 }
 
+static void free_color_heap_page(struct page_info *pg, bool need_scrub);
+
 /* Free 2^@order set of pages. */
 static void free_heap_pages(
     struct page_info *pg, unsigned int order, bool need_scrub)
@@ -1481,6 +1487,14 @@ static void free_heap_pages(
             pg[i].count_info |= PGC_need_scrub;
             poison_one_page(&pg[i]);
         }
+
+        if ( pg->count_info & PGC_colored )
+        {
+            /* Colored pages can be 0-order only, so ignore it */
+            free_color_heap_page(pg, need_scrub);
+            spin_unlock(&heap_lock);
+            return;
+        }
     }
 
     avail[node][zone] += 1 << order;
@@ -1945,6 +1959,156 @@ static unsigned long avail_heap_pages(
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
+#define color_heap(color) (&_color_heap[color])
+
+static unsigned long *__ro_after_init free_colored_pages;
+
+/* Memory required for buddy allocator to work with colored one */
+#ifdef CONFIG_LLC_COLORING
+static unsigned long __initdata buddy_alloc_size =
+    MB(CONFIG_BUDDY_ALLOCATOR_SIZE);
+size_param("buddy-alloc-size", buddy_alloc_size);
+
+#define domain_num_llc_colors(d) (d)->num_llc_colors
+#define domain_llc_color(d, i)   (d)->llc_colors[i]
+#else
+static unsigned long __initdata buddy_alloc_size;
+
+#define domain_num_llc_colors(d) 0
+#define domain_llc_color(d, i)   0
+#endif
+
+static void free_color_heap_page(struct page_info *pg, bool need_scrub)
+{
+    unsigned int color = page_to_llc_color(pg);
+
+    free_colored_pages[color]++;
+    /*
+     * Head insertion allows re-using cache-hot pages in configurations without
+     * sharing of colors.
+     */
+    page_list_add(pg, color_heap(color));
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
+    bool need_scrub;
+
+    if ( memflags & ~(MEMF_no_owner | MEMF_no_refcount | MEMF_no_scrub |
+                      MEMF_no_tlbflush) )
+        return NULL;
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
+    need_scrub = pg->count_info & (PGC_need_scrub);
+    pg->count_info = PGC_state_inuse | (pg->count_info & PGC_preserved);
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
+    if ( !(memflags & MEMF_no_scrub) )
+    {
+        if ( need_scrub )
+            scrub_one_page(pg);
+        else
+            check_one_page(pg);
+    }
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
+    if ( buddy_alloc_size >= PAGE_SIZE )
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
+    for ( i = 0; i < nr_pages; i++ )
+    {
+        pg[i].count_info = PGC_colored;
+        free_color_heap_page(&pg[i], need_scrub);
+    }
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
@@ -1964,7 +2128,13 @@ void __init end_boot_allocator(void)
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
@@ -2460,7 +2630,14 @@ struct page_info *alloc_domheap_pages(
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
@@ -2683,6 +2860,9 @@ static void cf_check dump_heap(unsigned char key)
             continue;
         printk("Node %d has %lu unscrubbed pages\n", i, node_need_scrub[i]);
     }
+
+    if ( llc_coloring_enabled )
+        dump_color_heap();
 }
 
 static __init int cf_check register_heap_trigger(void)
diff --git a/xen/include/xen/llc-coloring.h b/xen/include/xen/llc-coloring.h
index 49ebd1e712..7f8218bfb2 100644
--- a/xen/include/xen/llc-coloring.h
+++ b/xen/include/xen/llc-coloring.h
@@ -33,6 +33,10 @@ int domain_set_llc_colors(struct domain *d,
                           const struct xen_domctl_set_llc_colors *config);
 int domain_set_llc_colors_from_str(struct domain *d, const char *str);
 
+struct page_info;
+unsigned int page_to_llc_color(const struct page_info *pg);
+unsigned int get_max_nr_llc_colors(void);
+
 #endif /* __COLORING_H__ */
 
 /*
-- 
2.34.1


