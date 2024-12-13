Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E639F1221
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 17:28:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856868.1269449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM8Wx-0006iJ-Qh; Fri, 13 Dec 2024 16:28:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856868.1269449; Fri, 13 Dec 2024 16:28:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM8Wx-0006cG-L1; Fri, 13 Dec 2024 16:28:43 +0000
Received: by outflank-mailman (input) for mailman id 856868;
 Fri, 13 Dec 2024 16:28:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4bZM=TG=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tM8Wv-0003wJ-L6
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 16:28:41 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f78cc49-b96f-11ef-99a3-01e77a169b0f;
 Fri, 13 Dec 2024 17:28:39 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a9a68480164so316769666b.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Dec 2024 08:28:39 -0800 (PST)
Received: from carlo-ubuntu.minervasys.tech ([193.207.202.156])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa673474d96sm841759266b.96.2024.12.13.08.28.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 08:28:38 -0800 (PST)
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
X-Inumbo-ID: 4f78cc49-b96f-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1734107319; x=1734712119; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IpihGP/rsJKpIJF0EavB+fmzC08YQ4HgsyuMaFmmYQE=;
        b=PtRkVrkpoG5IunSCFR3EBU1K1KcgLRTu2rHCk+OyiiwINYO23VdBxiHG+Z0Y76PdDe
         tJ7THnWawQxhYYw8FI4C7dcOEIO5Mhx+JAYYXsmh2lcvUq46kLyELDZ5IT/N17tApspd
         WeAvyAsskzi5nDKfUdGyDh73RFkpQ7S3p2RcvPE2EkpUPRU/VdxoEaPFLkG9IcAZGRK1
         zkjN4vHDH2glrCQ/LEOlTX/UofsrU0k9xI2Wu5MpR0H7kVS+lwF5r8nedebMbWeAneey
         edr6CA1VXNvgVx1PI9EVlFRn0ktnRSAbGgUllfyntB658/sz0q77KPd6HD6QwZ2zpV18
         M+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734107319; x=1734712119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IpihGP/rsJKpIJF0EavB+fmzC08YQ4HgsyuMaFmmYQE=;
        b=kaAqWRktkJktC3UNSgbSFot6blwkPqoOvnzhpv8K6gJ0A1JdN4r4fB0QVEHoTR40Np
         dJIHpOLrT1fnmqf2jjiPF9NURtLB8CYVD2zZakK/3wf8EtAmV1DfM0vS9XpMI2TszkCy
         D3/N1wMUF6taBsTFQz344hPMBMlE+RQhmTfkDTZIiDZC12ZbzN3f1Q8wb031BlMeRufb
         5wg0ktGvDVfGvuU8j6qHnPd/ZsMldjNiyIoqc1IbhP9w5nCxxbq1QPjeJUuxdOJ8DvEL
         lgjsolWHqTNI7KPvkoO9NuQeTCevgmwWVe78hCMJFIIvyEzCnEAnCpDCc6rxIvRZcKS3
         tynA==
X-Gm-Message-State: AOJu0YwFFQB9JiUMYHUB2jnGtws8ankuRqSbWDC6Y5m23abHRds+GMkA
	90W+rGgsbiXZyFTsbs0VR70dlbAZltnLGI9iPIZXXgRKIrmcZ16f2XtKpBBeqTzH4qL4EBkW+Dl
	V8HY=
X-Gm-Gg: ASbGncuBG5kioaABZF75IpF133ioSF3tMUQfusKrsMCu5xZnGwPrt0fC5I6XZ7ppob2
	pSeMflnyC5wXWAJPpFrw50g5gyR/8Geh7Apx9Zmhhhrf0cjVSBcDmHsfpwArCTFY6LFFuglUvJt
	Y/WBEtIp/1Ml17bZ0403MsnGC0LTslLO+BAfMc3JZiKym1FMIaOMascR5mvdDGW4Apd5n9IdbOo
	JdYzpDEOnsdWEeG15DR4BbQPKqwWlAnaAhhSFlb4E93I8QKNWNmWgokcmpkkBt2uIVkwUZVBaCX
	4HntoBZvgjLLNYIc
X-Google-Smtp-Source: AGHT+IH5GwuYk2PFo+99JYWWqoLHhLwj47JCWpYXawOIBeUmE/SQ/Sn5uz1XXQ66vrpnS8GX2tvoIw==
X-Received: by 2002:a17:906:7953:b0:aa6:a53a:f6c7 with SMTP id a640c23a62f3a-aab779ba4ebmr442697566b.31.1734107318927;
        Fri, 13 Dec 2024 08:28:38 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	marco.solieri@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v12 09/12] xen: add cache coloring allocator for domains
Date: Fri, 13 Dec 2024 17:28:12 +0100
Message-ID: <20241213162815.9196-10-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241213162815.9196-1-carlo.nonato@minervasys.tech>
References: <20241213162815.9196-1-carlo.nonato@minervasys.tech>
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
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v12:
- fixed #ifdef CONFIG_LLC_COLORING in init_color_heap_pages()
v11:
- CONFIG_BUDDY_ALLOCATOR_SIZE depends on CONFIG_LLC_COLORING
- buddy_alloc_size is defined only if CONFIG_LLC_COLORING
- buddy-alloc-size param is parsed only if CONFIG_LLC_COLORING
v10:
- stated explicit dependency on CONFIG_LLC_COLORING for buddy-alloc-size
- fix for MISRA rule 20.7 parenthesis
v9:
- added ASSERT(order == 0) when freeing a colored page
- moved buddy_alloc_size initialization logic in Kconfig
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
 xen/common/llc-coloring.c         |  13 ++
 xen/common/page_alloc.c           | 191 +++++++++++++++++++++++++++++-
 xen/include/xen/llc-coloring.h    |   3 +
 7 files changed, 267 insertions(+), 4 deletions(-)

diff --git a/docs/misc/cache-coloring.rst b/docs/misc/cache-coloring.rst
index e097e74032..5224b27afe 100644
--- a/docs/misc/cache-coloring.rst
+++ b/docs/misc/cache-coloring.rst
@@ -13,6 +13,9 @@ To compile LLC coloring support set ``CONFIG_LLC_COLORING=y``.
 If needed, change the maximum number of colors with
 ``CONFIG_LLC_COLORS_ORDER=<n>``.
 
+If needed, change the buddy allocator reserved size with
+``CONFIG_BUDDY_ALLOCATOR_SIZE=<n>``.
+
 Runtime configuration is done via `Command line parameters`_.
 For DomUs follow `DomUs configuration`_.
 
@@ -110,6 +113,8 @@ Specific documentation is available at `docs/misc/xen-command-line.pandoc`.
 +----------------------+-------------------------------+
 | ``dom0-llc-colors``  | Dom0 color configuration      |
 +----------------------+-------------------------------+
+| ``buddy-alloc-size`` | Buddy allocator reserved size |
++----------------------+-------------------------------+
 
 Colors selection format
 ***********************
@@ -197,6 +202,17 @@ For example:
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
 
@@ -207,3 +223,24 @@ In the domain configuration, "xen,static-mem" allows memory to be statically
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
index bfdc8b0002..3a70c49c05 100644
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
+active. This option is available only when `CONFIG_LLC_COLORING` is enabled.
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
index 59b774b7b8..f91ff088f6 100644
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
index b4ec6893be..6166327f4d 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -537,4 +537,12 @@ config LLC_COLORS_ORDER
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
index 1a0e02ddb0..ec6b0d3bff 100644
--- a/xen/common/llc-coloring.c
+++ b/xen/common/llc-coloring.c
@@ -36,6 +36,9 @@ static unsigned int __ro_after_init default_colors[NR_LLC_COLORS];
 static unsigned int __initdata dom0_colors[NR_LLC_COLORS];
 static unsigned int __initdata dom0_num_colors;
 
+#define mfn_color_mask              (max_nr_colors - 1)
+#define mfn_to_color(mfn)           (mfn_x(mfn) & mfn_color_mask)
+
 /*
  * Parse the coloring configuration given in the buf string, following the
  * syntax below.
@@ -322,6 +325,16 @@ int __init domain_set_llc_colors_from_str(struct domain *d, const char *str)
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
index 7735c8b436..e8cfb427d9 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -139,6 +139,7 @@
 #include <xen/softirq.h>
 #include <xen/spinlock.h>
 #include <xen/vm_event.h>
+#include <xen/xvmalloc.h>
 
 #include <asm/flushtlb.h>
 #include <asm/page.h>
@@ -160,11 +161,15 @@
 #define PGC_static 0
 #endif
 
-#define PGC_no_buddy_merge PGC_static
+#ifndef PGC_colored
+#define PGC_colored 0
+#endif
+
+#define PGC_no_buddy_merge (PGC_static | PGC_colored)
 /*
  * Flags that are preserved in assign_pages() (and only there)
  */
-#define PGC_preserved (PGC_extra | PGC_static)
+#define PGC_preserved (PGC_extra | PGC_static | PGC_colored)
 
 #ifndef PGT_TYPE_INFO_INITIALIZER
 #define PGT_TYPE_INFO_INITIALIZER 0
@@ -1477,6 +1482,8 @@ static bool mark_page_free(struct page_info *pg, mfn_t mfn)
     return pg_offlined;
 }
 
+static void free_color_heap_page(struct page_info *pg, bool need_scrub);
+
 /* Free 2^@order set of pages. */
 static void free_heap_pages(
     struct page_info *pg, unsigned int order, bool need_scrub)
@@ -1501,6 +1508,15 @@ static void free_heap_pages(
             pg[i].count_info |= PGC_need_scrub;
             poison_one_page(&pg[i]);
         }
+
+        if ( pg->count_info & PGC_colored )
+        {
+            ASSERT(order == 0);
+
+            free_color_heap_page(pg, need_scrub);
+            spin_unlock(&heap_lock);
+            return;
+        }
     }
 
     avail[node][zone] += 1 << order;
@@ -1965,6 +1981,157 @@ static unsigned long avail_heap_pages(
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
+#ifdef CONFIG_LLC_COLORING
+#define domain_num_llc_colors(d) ((d)->num_llc_colors)
+#define domain_llc_color(d, i)   ((d)->llc_colors[i])
+
+/* Memory required for buddy allocator to work with colored one */
+static unsigned long __initdata buddy_alloc_size =
+    MB(CONFIG_BUDDY_ALLOCATOR_SIZE);
+size_param("buddy-alloc-size", buddy_alloc_size);
+#else
+#define domain_num_llc_colors(d) 0
+#define domain_llc_color(d, i)   0
+#endif
+
+static void free_color_heap_page(struct page_info *pg, bool need_scrub)
+{
+    unsigned int color;
+
+    color = page_to_llc_color(pg);
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
+    if ( memflags & ~(MEMF_no_refcount | MEMF_no_owner | MEMF_no_tlbflush |
+                      MEMF_no_icache_flush | MEMF_no_scrub) )
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
+    need_scrub = pg->count_info & PGC_need_scrub;
+    pg->count_info = PGC_state_inuse | (pg->count_info & PGC_colored);
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
+    unsigned long i;
+    bool need_scrub = opt_bootscrub == BOOTSCRUB_IDLE;
+
+#ifdef CONFIG_LLC_COLORING
+    if ( buddy_alloc_size >= PAGE_SIZE )
+    {
+        unsigned long buddy_pages = min(PFN_DOWN(buddy_alloc_size), nr_pages);
+
+        init_heap_pages(pg, buddy_pages);
+        nr_pages -= buddy_pages;
+        buddy_alloc_size -= buddy_pages << PAGE_SHIFT;
+        pg += buddy_pages;
+    }
+#endif
+
+    if ( !_color_heap )
+    {
+        unsigned int max_nr_colors = get_max_nr_llc_colors();
+
+        _color_heap = xvmalloc_array(struct page_list_head, max_nr_colors);
+        free_colored_pages = xvzalloc_array(unsigned long, max_nr_colors);
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
@@ -1984,7 +2151,13 @@ void __init end_boot_allocator(void)
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
@@ -2480,7 +2653,14 @@ struct page_info *alloc_domheap_pages(
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
@@ -2683,6 +2863,9 @@ static void cf_check dump_heap(unsigned char key)
             continue;
         printk("Node %d has %lu unscrubbed pages\n", i, node_need_scrub[i]);
     }
+
+    if ( llc_coloring_enabled )
+        dump_color_heap();
 }
 
 static __init int cf_check register_heap_trigger(void)
diff --git a/xen/include/xen/llc-coloring.h b/xen/include/xen/llc-coloring.h
index 5d1355b3c9..1216d1fbd4 100644
--- a/xen/include/xen/llc-coloring.h
+++ b/xen/include/xen/llc-coloring.h
@@ -11,6 +11,7 @@
 #include <xen/types.h>
 
 struct domain;
+struct page_info;
 struct xen_domctl_set_llc_colors;
 
 #ifdef CONFIG_LLC_COLORING
@@ -35,6 +36,8 @@ int dom0_set_llc_colors(struct domain *d);
 int domain_set_llc_colors(struct domain *d,
                           const struct xen_domctl_set_llc_colors *config);
 int domain_set_llc_colors_from_str(struct domain *d, const char *str);
+unsigned int page_to_llc_color(const struct page_info *pg);
+unsigned int get_max_nr_llc_colors(void);
 
 #endif /* __XEN_LLC_COLORING_H__ */
 
-- 
2.43.0


