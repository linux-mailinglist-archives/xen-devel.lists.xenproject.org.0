Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A76F5678067
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 16:48:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483030.748981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJz3c-0002Md-31; Mon, 23 Jan 2023 15:48:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483030.748981; Mon, 23 Jan 2023 15:48:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJz3b-0002Ih-Uc; Mon, 23 Jan 2023 15:48:27 +0000
Received: by outflank-mailman (input) for mailman id 483030;
 Mon, 23 Jan 2023 15:48:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kihy=5U=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1pJz3Z-0000MU-Ob
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 15:48:25 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 587185a9-9b35-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 16:48:13 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id u19so31603883ejm.8
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jan 2023 07:48:22 -0800 (PST)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 r2-20020a17090609c200b007bd28b50305sm22170978eje.200.2023.01.23.07.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 07:48:21 -0800 (PST)
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
X-Inumbo-ID: 587185a9-9b35-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=unwT7Y7OWtE54v3kQMluasF3dALE7ek/pArNr4zV0vs=;
        b=x+Qbc6lFifFuxZQCKmzfNTnCyqgSkVVZQGP9bUpYY0PCMpA4ZcSMPDXyehIT2yz/Lc
         UPVQQuD3j+nnvWHIxgiwVCGHJCx3vPzedA2q8QDn+KR22P9m3oBoot529sg2TnYd6LIT
         C5VuP4XbJX4bgzXliwU3hsT0G8VKMC+261Xd79faml3WZn+ZbBp71XdKrHo9qeHPNLlN
         fAaXTQHyy52cohduEcBK7uCAGgQcz5IhwQulmLD2LAGnRrUcc66XnTtdBTQ0Y5jhKSGU
         9yXmsPCQDE6oTfiTbND/6fIgvHRCs7ImIJNURLNhXSKqzxnylGXJowGnImE7jOSoRgCL
         pcMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=unwT7Y7OWtE54v3kQMluasF3dALE7ek/pArNr4zV0vs=;
        b=naHuQhY7GPYR2eJQjMflwmVdypqDVRRg7wMMfD3mrjwCwt4XiOqiCcIbbQ66r71o4M
         riUnI/efqqNE2pfObg3DMI8H53q8MBqqi/DP5OmgJHdLd6LdLkbw3PpjSFi8NzAbFYTd
         VD7C6rX/BPhgETZ/6Py5aOnBsdeAe0d4QthsK6QiyOmpNGaPFJDeOvGQwuBtPUTiJrWc
         apc7ClwtNA3TKA/jziu8vMIiWZmNjUgiNg1BkkMBV55FWFEOYZNr1CxxhEK2M2Eg4j0J
         tpQL6D7HpshABevelMc/GFTOG1s9koaHoTDmkomkB3jplBA/t6deDwVoL+Gk5OMCxMWD
         lbJQ==
X-Gm-Message-State: AFqh2krmWcYAQ2sC/05Srrp5edc7X9C8JnXtUsjLHVWmxfsdB7BplWuE
	vTUMJ0TBkzkdRTIltkTi5L8MH3hzaawsBYl1
X-Google-Smtp-Source: AMrXdXsxI82Ko73dhXL16y/EF4Cb/Hoz/sbENqdlcq7QbgIMixTIFXzhJsKfrD6J6EVzC9GK6WZXzw==
X-Received: by 2002:a17:907:7da0:b0:86d:67b0:6292 with SMTP id oz32-20020a1709077da000b0086d67b06292mr38167762ejc.73.1674488901726;
        Mon, 23 Jan 2023 07:48:21 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: Luca Miccio <lucmiccio@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Marco Solieri <marco.solieri@minervasys.tech>,
	Carlo Nonato <carlo.nonato@minervasys.tech>
Subject: [PATCH v4 07/11] xen: add cache coloring allocator for domains
Date: Mon, 23 Jan 2023 16:47:31 +0100
Message-Id: <20230123154735.74832-8-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
References: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

This commit adds a new memory page allocator that implements the cache
coloring mechanism. The allocation algorithm follows the given domain color
configuration and maximizes contiguity in the page selection of multiple
subsequent requests.

Pages are stored in a color-indexed array of lists, each one sorted by
machine address, that is referred to as "colored heap". Those lists are
filled by a simple init function which computes the color of each page.
When a domain requests a page, the allocator takes one from those lists
whose colors equals the domain configuration. It chooses the page with the
lowest machine address such that contiguous pages are sequentially
allocated if this is made possible by a color assignment which includes
adjacent colors.

The allocator can handle only requests with order equal to 0 since the
single color granularity is represented in memory by one page.

The buddy allocator must coexist with the colored one because the Xen heap
isn't colored. For this reason a new Kconfig option and a command line
parameter are added to let the user set the amount of memory reserved for
the buddy allocator. Even when cache coloring is enabled, this memory
isn't managed by the colored allocator.

Colored heap information is dumped in the dump_heap() debug-key function.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
---
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
 docs/misc/arm/cache-coloring.rst  |  49 ++++++
 docs/misc/xen-command-line.pandoc |  14 ++
 xen/arch/Kconfig                  |  12 ++
 xen/arch/arm/include/asm/mm.h     |   3 +
 xen/arch/arm/llc_coloring.c       |  12 ++
 xen/common/page_alloc.c           | 247 +++++++++++++++++++++++++++---
 xen/include/xen/llc_coloring.h    |   5 +
 xen/include/xen/mm.h              |  33 ++++
 8 files changed, 355 insertions(+), 20 deletions(-)

diff --git a/docs/misc/arm/cache-coloring.rst b/docs/misc/arm/cache-coloring.rst
index a28f75dc26..d56dafe815 100644
--- a/docs/misc/arm/cache-coloring.rst
+++ b/docs/misc/arm/cache-coloring.rst
@@ -15,10 +15,16 @@ In Kconfig:
   value meaning and when it should be changed).
 
         CONFIG_NR_LLC_COLORS=<n>
+- If needed, change the amount of memory reserved for the buddy allocator
+  (see `Colored allocator and buddy allocator`_).
+
+        CONFIG_BUDDY_ALLOCATOR_SIZE=<n>
 
 Compile Xen and the toolstack and then:
 
 - Set the `llc-coloring=on` command line option.
+- If needed, set the amount of memory reserved for the buddy allocator
+  via the appropriate command line option.
 - Set `Coloring parameters and domain configurations`_.
 
 Background
@@ -162,6 +168,18 @@ Dom0less configurations (relative documentation in
 **Note:** If no color configuration is provided for a domain, the default one,
 which corresponds to all available colors, is used instead.
 
+Colored allocator and buddy allocator
+*************************************
+
+The colored allocator distributes pages based on color configurations of
+domains so that each domains only gets pages of its own colors.
+The colored allocator is meant as an alternative to the buddy allocator because
+its allocation policy is by definition incompatible with the generic one. Since
+the Xen heap is not colored yet, we need to support the coexistence of the two
+allocators and some memory must be left for the buddy one.
+The buddy allocator memory can be reserved from the Xen Kconfig or with the
+help of a command-line option.
+
 Known issues and limitations
 ****************************
 
@@ -172,3 +190,34 @@ In the domain configuration, "xen,static-mem" allows memory to be statically
 allocated to the domain. This isn't possibile when LLC coloring is enabled,
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
index eb105c03af..a89c0cef61 100644
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
+active. This options is available only when `CONFIG_LLC_COLORING` is enabled.
+The colored allocator is meant as an alternative to the buddy allocator,
+because its allocation policy is by definition incompatible with the
+generic one. Since the Xen heap systems is not colored yet, we need to
+support the coexistence of the two allocators for now. This parameter, which is
+optional and for expert only, it's used to set the amount of memory reserved to
+the buddy allocator.
+
 ### clocksource (x86)
 > `= pit | hpet | acpi | tsc`
 
diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
index 39c23f2528..4378b5f338 100644
--- a/xen/arch/Kconfig
+++ b/xen/arch/Kconfig
@@ -45,3 +45,15 @@ config NR_LLC_COLORS
 	  more than what needed in the general case.
 	  Note that if, at any time, a color configuration with more colors than
 	  the maximum is employed, an error is produced.
+
+config BUDDY_ALLOCATOR_SIZE
+	int "Buddy allocator reserved memory size (MiB)"
+	default "64"
+	depends on LLC_COLORING
+	help
+	  Amount of memory reserved for the buddy allocator to work alongside
+	  the colored one. The colored allocator is meant as an alternative to the
+	  buddy allocator because its allocation policy is by definition
+	  incompatible with the generic one. Since the Xen heap is not colored yet,
+	  we need to support the coexistence of the two allocators and some memory
+	  must be left for the buddy one.
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index bff6923f3e..596293f792 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -128,6 +128,9 @@ struct page_info
 #else
 #define PGC_static     0
 #endif
+/* Page is cache colored */
+#define _PGC_colored      PG_shift(4)
+#define PGC_colored       PG_mask(1, 4)
 /* ... */
 /* Page is broken? */
 #define _PGC_broken       PG_shift(7)
diff --git a/xen/arch/arm/llc_coloring.c b/xen/arch/arm/llc_coloring.c
index ba5279a022..22612d455b 100644
--- a/xen/arch/arm/llc_coloring.c
+++ b/xen/arch/arm/llc_coloring.c
@@ -33,6 +33,8 @@ static paddr_t __ro_after_init addr_col_mask;
 static unsigned int __ro_after_init dom0_colors[CONFIG_NR_LLC_COLORS];
 static unsigned int __ro_after_init dom0_num_colors;
 
+#define addr_to_color(addr) (((addr) & addr_col_mask) >> PAGE_SHIFT)
+
 /*
  * Parse the coloring configuration given in the buf string, following the
  * syntax below.
@@ -299,6 +301,16 @@ unsigned int *llc_colors_from_str(const char *str, unsigned int *num_colors)
     return colors;
 }
 
+unsigned int page_to_llc_color(const struct page_info *pg)
+{
+    return addr_to_color(page_to_maddr(pg));
+}
+
+unsigned int get_nr_llc_colors(void)
+{
+    return nr_colors;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index e40473f71e..59bd6bcdac 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -126,6 +126,7 @@
 #include <xen/irq.h>
 #include <xen/keyhandler.h>
 #include <xen/lib.h>
+#include <xen/llc_coloring.h>
 #include <xen/mm.h>
 #include <xen/nodemask.h>
 #include <xen/numa.h>
@@ -158,6 +159,10 @@
 #define PGC_static 0
 #endif
 
+#ifndef PGC_colored
+#define PGC_colored 0
+#endif
+
 #ifndef PGT_TYPE_INFO_INITIALIZER
 #define PGT_TYPE_INFO_INITIALIZER 0
 #endif
@@ -924,6 +929,13 @@ static struct page_info *get_free_buddy(unsigned int zone_lo,
     }
 }
 
+/* Initialise fields which have other uses for free pages. */
+static void init_free_page_fields(struct page_info *pg)
+{
+    pg->u.inuse.type_info = PGT_TYPE_INFO_INITIALIZER;
+    page_set_owner(pg, NULL);
+}
+
 /* Allocate 2^@order contiguous pages. */
 static struct page_info *alloc_heap_pages(
     unsigned int zone_lo, unsigned int zone_hi,
@@ -1032,10 +1044,7 @@ static struct page_info *alloc_heap_pages(
             accumulate_tlbflush(&need_tlbflush, &pg[i],
                                 &tlbflush_timestamp);
 
-        /* Initialise fields which have other uses for free pages. */
-        pg[i].u.inuse.type_info = PGT_TYPE_INFO_INITIALIZER;
-        page_set_owner(&pg[i], NULL);
-
+        init_free_page_fields(&pg[i]);
     }
 
     spin_unlock(&heap_lock);
@@ -1488,7 +1497,7 @@ static void free_heap_pages(
             /* Merge with predecessor block? */
             if ( !mfn_valid(page_to_mfn(predecessor)) ||
                  !page_state_is(predecessor, free) ||
-                 (predecessor->count_info & PGC_static) ||
+                 (predecessor->count_info & (PGC_static | PGC_colored)) ||
                  (PFN_ORDER(predecessor) != order) ||
                  (page_to_nid(predecessor) != node) )
                 break;
@@ -1512,7 +1521,7 @@ static void free_heap_pages(
             /* Merge with successor block? */
             if ( !mfn_valid(page_to_mfn(successor)) ||
                  !page_state_is(successor, free) ||
-                 (successor->count_info & PGC_static) ||
+                 (successor->count_info & (PGC_static | PGC_colored)) ||
                  (PFN_ORDER(successor) != order) ||
                  (page_to_nid(successor) != node) )
                 break;
@@ -1928,6 +1937,182 @@ static unsigned long avail_heap_pages(
     return free_pages;
 }
 
+#ifdef CONFIG_LLC_COLORING
+/*************************
+ * COLORED SIDE-ALLOCATOR
+ *
+ * Pages are grouped by LLC color in lists which are globally referred to as the
+ * color heap. Lists are populated in end_boot_allocator().
+ * After initialization there will be N lists where N is the number of
+ * available colors on the platform.
+ */
+typedef struct page_list_head colored_pages_t;
+static colored_pages_t *__ro_after_init _color_heap;
+static unsigned long *__ro_after_init free_colored_pages;
+
+/* Memory required for buddy allocator to work with colored one */
+static unsigned long __initdata buddy_alloc_size =
+    CONFIG_BUDDY_ALLOCATOR_SIZE << 20;
+
+#define color_heap(color) (&_color_heap[color])
+
+static bool is_free_colored_page(struct page_info *page)
+{
+    return page && (page->count_info & PGC_state_free) &&
+                   (page->count_info & PGC_colored);
+}
+
+/*
+ * The {free|alloc}_color_heap_page overwrite pg->count_info, but they do it in
+ * the same way as the buddy allocator corresponding functions do:
+ * protecting the access with a critical section using heap_lock.
+ */
+static void free_color_heap_page(struct page_info *pg)
+{
+    unsigned int color = page_to_llc_color(pg), nr_colors = get_nr_llc_colors();
+    unsigned long pdx = page_to_pdx(pg);
+    colored_pages_t *head = color_heap(color);
+    struct page_info *prev = pdx >= nr_colors ? pg - nr_colors : NULL;
+    struct page_info *next = pdx + nr_colors < FRAMETABLE_NR ? pg + nr_colors
+                                                             : NULL;
+
+    spin_lock(&heap_lock);
+
+    if ( is_free_colored_page(prev) )
+        next = page_list_next(prev, head);
+    else if ( !is_free_colored_page(next) )
+    {
+        /*
+         * FIXME: linear search is slow, but also note that the frametable is
+         * used to find free pages in the immediate neighborhood of pg in
+         * constant time. When freeing contiguous pages, the insert position of
+         * most of them is found without the linear search.
+         */
+        page_list_for_each( next, head )
+        {
+            if ( page_to_maddr(next) > page_to_maddr(pg) )
+                break;
+        }
+    }
+
+    mark_page_free(pg, page_to_mfn(pg));
+    pg->count_info |= PGC_colored;
+    free_colored_pages[color]++;
+    page_list_add_prev(pg, next, head);
+
+    spin_unlock(&heap_lock);
+}
+
+static struct page_info *alloc_color_heap_page(unsigned int memflags,
+                                               struct domain *d)
+{
+    struct page_info *pg = NULL;
+    unsigned int i, color;
+    bool need_tlbflush = false;
+    uint32_t tlbflush_timestamp = 0;
+
+    spin_lock(&heap_lock);
+
+    for ( i = 0; i < d->num_llc_colors; i++ )
+    {
+        struct page_info *tmp;
+
+        if ( page_list_empty(color_heap(d->llc_colors[i])) )
+            continue;
+
+        tmp = page_list_first(color_heap(d->llc_colors[i]));
+        if ( !pg || page_to_maddr(tmp) < page_to_maddr(pg) )
+        {
+            pg = tmp;
+            color = d->llc_colors[i];
+        }
+    }
+
+    if ( !pg )
+    {
+        spin_unlock(&heap_lock);
+        return NULL;
+    }
+
+    pg->count_info = PGC_state_inuse | PGC_colored;
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
+        unsigned int nr_colors = get_nr_llc_colors();
+
+        _color_heap = xmalloc_array(colored_pages_t, nr_colors);
+        BUG_ON(!_color_heap);
+        free_colored_pages = xzalloc_array(unsigned long, nr_colors);
+        BUG_ON(!free_colored_pages);
+
+        for ( i = 0; i < nr_colors; i++ )
+            INIT_PAGE_LIST_HEAD(color_heap(i));
+    }
+
+    printk(XENLOG_DEBUG
+           "Init color heap with %lu pages starting from: %#"PRIx64"\n",
+           nr_pages, page_to_maddr(pg));
+
+    for ( i = 0; i < nr_pages; i++ )
+        free_color_heap_page(&pg[i]);
+}
+
+static void dump_color_heap(void)
+{
+    unsigned int color;
+
+    printk("Dumping color heap info\n");
+    for ( color = 0; color < get_nr_llc_colors(); color++ )
+        printk("Color heap[%u]: %lu pages\n", color, free_colored_pages[color]);
+}
+
+#else /* !CONFIG_LLC_COLORING */
+
+static void free_color_heap_page(struct page_info *pg) {}
+static void __init init_color_heap_pages(struct page_info *pg,
+                                         unsigned long nr_pages) {}
+static struct page_info *alloc_color_heap_page(unsigned int memflags,
+                                               struct domain *d)
+{
+    return NULL;
+}
+static void dump_color_heap(void) {}
+
+#endif /* CONFIG_LLC_COLORING */
+
 void __init end_boot_allocator(void)
 {
     unsigned int i;
@@ -1936,12 +2121,19 @@ void __init end_boot_allocator(void)
     for ( i = 0; i < nr_bootmem_regions; i++ )
     {
         struct bootmem_region *r = &bootmem_region_list[i];
-        if ( (r->s < r->e) &&
-             (mfn_to_nid(_mfn(r->s)) == cpu_to_node(0)) )
+        if ( r->s < r->e )
         {
-            init_heap_pages(mfn_to_page(_mfn(r->s)), r->e - r->s);
-            r->e = r->s;
-            break;
+            if ( llc_coloring_enabled )
+            {
+                init_color_heap_pages(mfn_to_page(_mfn(r->s)), r->e - r->s);
+                r->e = r->s;
+            }
+            else if ( mfn_to_nid(_mfn(r->s)) == cpu_to_node(0) )
+            {
+                init_heap_pages(mfn_to_page(_mfn(r->s)), r->e - r->s);
+                r->e = r->s;
+                break;
+            }
         }
     }
     for ( i = nr_bootmem_regions; i-- > 0; )
@@ -2332,6 +2524,7 @@ int assign_pages(
 {
     int rc = 0;
     unsigned int i;
+    unsigned long allowed_flags = (PGC_extra | PGC_static | PGC_colored);
 
     spin_lock(&d->page_alloc_lock);
 
@@ -2349,7 +2542,7 @@ int assign_pages(
 
         for ( i = 0; i < nr; i++ )
         {
-            ASSERT(!(pg[i].count_info & ~(PGC_extra | PGC_static)));
+            ASSERT(!(pg[i].count_info & ~allowed_flags));
             if ( pg[i].count_info & PGC_extra )
                 extra_pages++;
         }
@@ -2408,8 +2601,8 @@ int assign_pages(
         ASSERT(page_get_owner(&pg[i]) == NULL);
         page_set_owner(&pg[i], d);
         smp_wmb(); /* Domain pointer must be visible before updating refcnt. */
-        pg[i].count_info =
-            (pg[i].count_info & (PGC_extra | PGC_static)) | PGC_allocated | 1;
+        pg[i].count_info = (pg[i].count_info & allowed_flags) |
+                           PGC_allocated | 1;
 
         page_list_add_tail(&pg[i], page_to_list(d, &pg[i]));
     }
@@ -2443,7 +2636,14 @@ struct page_info *alloc_domheap_pages(
     if ( memflags & MEMF_no_owner )
         memflags |= MEMF_no_refcount;
 
-    if ( !dma_bitsize )
+    /* Only domains are supported for coloring */
+    if ( d && is_domain_llc_colored(d) )
+    {
+        /* Colored allocation must be done on 0 order */
+        if ( order || (pg = alloc_color_heap_page(memflags, d)) == NULL )
+            return NULL;
+    }
+    else if ( !dma_bitsize )
         memflags &= ~MEMF_no_dma;
     else if ( (dma_zone = bits_to_zone(dma_bitsize)) < zone_hi )
         pg = alloc_heap_pages(dma_zone + 1, zone_hi, order, memflags, d);
@@ -2468,7 +2668,10 @@ struct page_info *alloc_domheap_pages(
         }
         if ( assign_page(pg, order, d, memflags) )
         {
-            free_heap_pages(pg, order, memflags & MEMF_no_scrub);
+            if ( pg->count_info & PGC_colored )
+                free_color_heap_page(pg);
+            else
+                free_heap_pages(pg, order, memflags & MEMF_no_scrub);
             return NULL;
         }
     }
@@ -2551,7 +2754,10 @@ void free_domheap_pages(struct page_info *pg, unsigned int order)
             scrub = 1;
         }
 
-        free_heap_pages(pg, order, scrub);
+        if ( pg->count_info & PGC_colored )
+            free_color_heap_page(pg);
+        else
+            free_heap_pages(pg, order, scrub);
     }
 
     if ( drop_dom_ref )
@@ -2658,6 +2864,9 @@ static void cf_check dump_heap(unsigned char key)
             continue;
         printk("Node %d has %lu unscrubbed pages\n", i, node_need_scrub[i]);
     }
+
+    if ( llc_coloring_enabled )
+        dump_color_heap();
 }
 
 static __init int cf_check register_heap_trigger(void)
@@ -2790,9 +2999,7 @@ static bool prepare_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
          * to PGC_state_inuse.
          */
         pg[i].count_info = PGC_static | PGC_state_inuse;
-        /* Initialise fields which have other uses for free pages. */
-        pg[i].u.inuse.type_info = PGT_TYPE_INFO_INITIALIZER;
-        page_set_owner(&pg[i], NULL);
+        init_free_page_fields(&pg[i]);
     }
 
     spin_unlock(&heap_lock);
diff --git a/xen/include/xen/llc_coloring.h b/xen/include/xen/llc_coloring.h
index 2855f38296..2e9abf3b3a 100644
--- a/xen/include/xen/llc_coloring.h
+++ b/xen/include/xen/llc_coloring.h
@@ -17,6 +17,8 @@
 
 #include <asm/llc_coloring.h>
 
+struct page_info;
+
 extern bool llc_coloring_enabled;
 
 int domain_llc_coloring_init(struct domain *d, unsigned int *colors,
@@ -26,6 +28,9 @@ void domain_dump_llc_colors(struct domain *d);
 
 unsigned int *llc_colors_from_guest(struct xen_domctl_createdomain *config);
 
+unsigned int page_to_llc_color(const struct page_info *pg);
+unsigned int get_nr_llc_colors(void);
+
 #else
 
 #define llc_coloring_enabled (false)
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 9d14aed74b..8ea72c744e 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -299,6 +299,33 @@ page_list_add_tail(struct page_info *page, struct page_list_head *head)
     }
     head->tail = page;
 }
+static inline void
+_page_list_add(struct page_info *page, struct page_info *prev,
+               struct page_info *next)
+{
+    page->list.prev = page_to_pdx(prev);
+    page->list.next = page_to_pdx(next);
+    prev->list.next = page_to_pdx(page);
+    next->list.prev = page_to_pdx(page);
+}
+static inline void
+page_list_add_prev(struct page_info *page, struct page_info *next,
+                   struct page_list_head *head)
+{
+    struct page_info *prev;
+
+    if ( !next )
+    {
+        page_list_add_tail(page, head);
+        return;
+    }
+
+    prev = page_list_prev(next, head);
+    if ( !prev )
+        page_list_add(page, head);
+    else
+        _page_list_add(page, prev, next);
+}
 static inline bool_t
 __page_list_del_head(struct page_info *page, struct page_list_head *head,
                      struct page_info *next, struct page_info *prev)
@@ -451,6 +478,12 @@ page_list_add_tail(struct page_info *page, struct page_list_head *head)
     list_add_tail(&page->list, head);
 }
 static inline void
+page_list_add_prev(struct page_info *page, struct page_info *next,
+                   struct page_list_head *head)
+{
+    list_add_tail(&page->list, &next->list);
+}
+static inline void
 page_list_del(struct page_info *page, struct page_list_head *head)
 {
     list_del(&page->list);
-- 
2.34.1


