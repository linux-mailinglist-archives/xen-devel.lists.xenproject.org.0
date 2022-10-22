Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E612608E4B
	for <lists+xen-devel@lfdr.de>; Sat, 22 Oct 2022 17:52:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428415.678574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omGmx-0004lj-F3; Sat, 22 Oct 2022 15:51:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428415.678574; Sat, 22 Oct 2022 15:51:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omGmx-0004en-5N; Sat, 22 Oct 2022 15:51:55 +0000
Received: by outflank-mailman (input) for mailman id 428415;
 Sat, 22 Oct 2022 15:51:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U686=2X=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1omGmv-0002Ir-HI
 for xen-devel@lists.xenproject.org; Sat, 22 Oct 2022 15:51:53 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 721860be-5221-11ed-91b5-6bf2151ebd3b;
 Sat, 22 Oct 2022 17:51:52 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id m16so16266780edc.4
 for <xen-devel@lists.xenproject.org>; Sat, 22 Oct 2022 08:51:52 -0700 (PDT)
Received: from carlo-ubuntu.home (62-11-205-162.dialup.tiscali.it.
 [62.11.205.162]) by smtp.gmail.com with ESMTPSA id
 z61-20020a509e43000000b00461816beef9sm894623ede.14.2022.10.22.08.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:51:50 -0700 (PDT)
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
X-Inumbo-ID: 721860be-5221-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZFHU6JLoOi1I0YfuDm34fjeeyfPVBZKSuGjuzgCHudY=;
        b=V4QBmMQvl4H72FfQBamm+SgPnsEFHKKbQ9hb1KjqZ75bMEG5AA2dkLikxDHouFocM0
         lH0UxPXCCDyJBvhDN2UbCQsrxbjUHTM3WwcVgvTS/gQCtQ1inVVVckkYiGKEEZTNqyY9
         RCdQwDV70Vx24HPQusiR0pPv5EVDUULAmX+VyVAE3anhkQ3nlPnC9A6t+B4+txHkesvg
         j+F72ItnBlZIcRE0nNdboGDLGhZXdMXT/aEgLZ2KFpFjofwZMjeDJ7/Zoj1jUEskvwmw
         4X9qbSpXI1Brs+9fUM84NU6+VsdDhhnSXBpakC+dLvHRrX6SfxvqYSIPTZQWhlUaa4fW
         LPew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZFHU6JLoOi1I0YfuDm34fjeeyfPVBZKSuGjuzgCHudY=;
        b=mlCgoOSCypLp+uqV/8laP6xG1hLgTAhXfB3Oj/bTXYH+J8uezfkUVhpX17MfXsVDlM
         m+8xzPRGVPBByqnXhAGHwo1Zo+eRch0oBGhu/XCcktb69PQIzYF3SPq9uunfjeFsDtdF
         2u/p6ty8XVfLLBkPdshuTDSwlpDxmwceqp0so110RgcA3usf93X+mmmpchpeqyBiBs2f
         uq4qyV7leiVFxgQAEsl4PSiEtIHpiILksWmIbRufB0Mt0Gj5pHI5Vo4lNO5hYuiM4I1E
         2LR7nSOhx5WNVYEOj4Wv7qYRuAnmGaqqTBnbVIRc+3xlBpwRocKjP28ah+AjFWCRRkKZ
         zEow==
X-Gm-Message-State: ACrzQf3dXZm5DdnPP+Bx7xEWjPrmIPtSuyrZanVC8kaEoE9s2QRrHLiX
	KyM0A0qysHRzbS9VdwEJIcWmV6wpurBEYQ==
X-Google-Smtp-Source: AMsMyM7MXEiV5in+yFRYTeR2PvQuRsyLJ2/ximIm+nzAuVzWY1nblZJrbtht2OvIaG2j8sizGnZD4A==
X-Received: by 2002:a17:906:5dce:b0:78d:e71a:6e0 with SMTP id p14-20020a1709065dce00b0078de71a06e0mr20198391ejv.360.1666453911187;
        Sat, 22 Oct 2022 08:51:51 -0700 (PDT)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: marco.solieri@unimore.it,
	andrea.bastoni@minervasys.tech,
	lucmiccio@gmail.com,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH v3 9/9] xen/arm: add cache coloring support for Xen
Date: Sat, 22 Oct 2022 17:51:20 +0200
Message-Id: <20221022155120.7000-10-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221022155120.7000-1-carlo.nonato@minervasys.tech>
References: <20221022155120.7000-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit adds the cache coloring support for Xen own physical space.

It extends the implementation of setup_pagetables to make use of Xen cache
coloring configuration. Page tables construction is essentially the same
except for the fact that the physical addresses, in case of cache coloring,
are taken from the translation of a new, temporary, virtual space that is
physically colored.

The temporary mapping is also used to relocate Xen to the new physical
space starting at the address taken from the old get_xen_paddr() function
which is brought back for the occasion.
The temporary mapping is finally converted to a mapping of the "old"
(meaning the original physical space) Xen code, so that the boot CPU can
actually address the variables and functions used by secondary CPUs.
This happens when the boot CPU needs to bring up other CPUs (psci.c and
smpboot.c) and when the TTBR value is passed to them
(init_secondary_pagetables).

Finally, since the alternative framework needs to remap the Xen text and
inittext sections, this operation must be done in a coloring-aware way.
The function xen_remap_colored() is introduced for that.

Based on original work from: Luca Miccio <lucmiccio@gmail.com>

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
v3:
- changed next_xen_colored() to xen_colored_mfn() to work with MFNs instead
  of addresses
- new macro for_each_xen_colored_mfn to iterate over Xen colored MFNs
- new function xen_remap_colored() to remap colored Xen instead of
  __vmap_colored()
- use map_pages_to_xen() instead of custom mapping function during
  setup_pagetables() (thanks to Julien)
- reintroduce relocate_xen() to switch to colored space
- removed useless virt_to_maddr_colored()
---
 xen/arch/arm/alternative.c          |  9 ++-
 xen/arch/arm/arm64/head.S           | 48 +++++++++++++++
 xen/arch/arm/coloring.c             | 38 ++++++++++++
 xen/arch/arm/include/asm/coloring.h | 30 +++++++++
 xen/arch/arm/include/asm/mm.h       | 16 ++++-
 xen/arch/arm/mm.c                   | 94 ++++++++++++++++++++++++++---
 xen/arch/arm/psci.c                 |  4 +-
 xen/arch/arm/setup.c                | 74 ++++++++++++++++++++++-
 xen/arch/arm/smpboot.c              |  3 +-
 xen/arch/arm/xen.lds.S              |  2 +-
 10 files changed, 297 insertions(+), 21 deletions(-)

diff --git a/xen/arch/arm/alternative.c b/xen/arch/arm/alternative.c
index f03cd943c6..a795aeec98 100644
--- a/xen/arch/arm/alternative.c
+++ b/xen/arch/arm/alternative.c
@@ -28,6 +28,7 @@
 #include <asm/alternative.h>
 #include <asm/atomic.h>
 #include <asm/byteorder.h>
+#include <asm/coloring.h>
 #include <asm/cpufeature.h>
 #include <asm/insn.h>
 #include <asm/page.h>
@@ -220,8 +221,12 @@ void __init apply_alternatives_all(void)
      * The text and inittext section are read-only. So re-map Xen to
      * be able to patch the code.
      */
-    xenmap = __vmap(&xen_mfn, 1U << xen_order, 1, 1, PAGE_HYPERVISOR,
-                    VMAP_DEFAULT);
+    if ( IS_ENABLED(CONFIG_CACHE_COLORING) )
+        xenmap = xen_remap_colored(xen_mfn, xen_size);
+    else
+        xenmap = __vmap(&xen_mfn, 1U << xen_order, 1, 1, PAGE_HYPERVISOR,
+                        VMAP_DEFAULT);
+
     /* Re-mapping Xen is not expected to fail during boot. */
     BUG_ON(!xenmap);
 
diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index ad014716db..71cffb54fe 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -813,6 +813,54 @@ ENDPROC(fail)
 
 GLOBAL(_end_boot)
 
+/* Copy Xen to new location and switch TTBR
+ * x0    ttbr
+ * x1    source address
+ * x2    destination address
+ * x3    length
+ *
+ * Source and destination must be word aligned, length is rounded up
+ * to a 16 byte boundary.
+ *
+ * MUST BE VERY CAREFUL when saving things to RAM over the copy */
+ENTRY(relocate_xen)
+        /* Copy 16 bytes at a time using:
+         *   x9: counter
+         *   x10: data
+         *   x11: data
+         *   x12: source
+         *   x13: destination
+         */
+        mov     x9, x3
+        mov     x12, x1
+        mov     x13, x2
+
+1:      ldp     x10, x11, [x12], #16
+        stp     x10, x11, [x13], #16
+
+        subs    x9, x9, #16
+        bgt     1b
+
+        /* Flush destination from dcache using:
+         * x9: counter
+         * x10: step
+         * x11: vaddr
+         */
+        dsb   sy        /* So the CPU issues all writes to the range */
+
+        mov   x9, x3
+        ldr   x10, =dcache_line_bytes /* x10 := step */
+        ldr   x10, [x10]
+        mov   x11, x2
+
+1:      dc    cvac, x11
+
+        add   x11, x11, x10
+        subs  x9, x9, x10
+        bgt   1b
+
+        b switch_ttbr
+
 /*
  * Switch TTBR
  *
diff --git a/xen/arch/arm/coloring.c b/xen/arch/arm/coloring.c
index 80c76c057f..857a798d8a 100644
--- a/xen/arch/arm/coloring.c
+++ b/xen/arch/arm/coloring.c
@@ -27,6 +27,7 @@
 #include <xen/keyhandler.h>
 #include <xen/param.h>
 #include <xen/types.h>
+#include <xen/vmap.h>
 
 #include <asm/coloring.h>
 #include <asm/processor.h>
@@ -362,6 +363,43 @@ unsigned int get_max_colors(void)
     return max_colors;
 }
 
+mfn_t xen_colored_mfn(mfn_t mfn)
+{
+    paddr_t maddr = mfn_to_maddr(mfn);
+    unsigned int i, color = addr_to_color(maddr);
+
+    for( i = 0; i < xen_num_colors; i++ )
+    {
+        if ( color == xen_colors[i] )
+            return mfn;
+        else if ( color < xen_colors[i] )
+            return maddr_to_mfn(addr_set_color(maddr, xen_colors[i]));
+    }
+
+    /* Jump to next color space (llc_way_size bytes) and use the first color */
+    return maddr_to_mfn(addr_set_color(maddr + llc_way_size, xen_colors[0]));
+}
+
+void *xen_remap_colored(mfn_t xen_mfn, paddr_t xen_size)
+{
+    unsigned int i;
+    void *xenmap;
+    mfn_t *xen_colored_mfns = xmalloc_array(mfn_t, xen_size >> PAGE_SHIFT);
+
+    if ( !xen_colored_mfns )
+        panic("Can't allocate colored MFNs\n");
+
+    for_each_xen_colored_mfn( xen_mfn, i )
+    {
+        xen_colored_mfns[i] = xen_mfn;
+    }
+
+    xenmap = vmap(xen_colored_mfns, xen_size >> PAGE_SHIFT);
+    xfree(xen_colored_mfns);
+
+    return xenmap;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/coloring.h b/xen/arch/arm/include/asm/coloring.h
index 0147f95968..6e9c1212f5 100644
--- a/xen/arch/arm/include/asm/coloring.h
+++ b/xen/arch/arm/include/asm/coloring.h
@@ -27,10 +27,31 @@
 #ifdef CONFIG_CACHE_COLORING
 
 #include <xen/init.h>
+#include <xen/lib.h>
 #include <xen/sched.h>
 
 #include <public/arch-arm.h>
 
+/*
+ * Amount of memory that we need to map in order to color Xen. The value
+ * depends on the maximum number of available colors of the hardware. The
+ * memory size is pessimistically calculated assuming only one color is used,
+ * which means that any pages belonging to any other color has to be skipped.
+ */
+#define XEN_COLOR_MAP_SIZE \
+    ROUNDUP((_end - _start) * get_max_colors(), XEN_PADDR_ALIGN)
+
+/**
+ * Iterate over each Xen mfn in the colored space.
+ * @mfn:    the current mfn. The first non colored mfn must be provided as the
+ *          starting point.
+ * @i:      loop index.
+ */
+#define for_each_xen_colored_mfn(mfn, i)        \
+    for ( i = 0, mfn = xen_colored_mfn(mfn);    \
+          i < (_end - _start) >> PAGE_SHIFT;    \
+          i++, mfn = xen_colored_mfn(mfn_add(mfn, 1)) )
+
 struct page_info;
 
 bool __init coloring_init(void);
@@ -47,8 +68,13 @@ unsigned int page_to_color(const struct page_info *pg);
 
 unsigned int get_max_colors(void);
 
+mfn_t xen_colored_mfn(mfn_t mfn);
+void *xen_remap_colored(mfn_t xen_fn, paddr_t xen_size);
+
 #else /* !CONFIG_CACHE_COLORING */
 
+#define XEN_COLOR_MAP_SIZE (_end - _start)
+
 static inline bool __init coloring_init(void) { return true; }
 static inline int domain_coloring_init(
     struct domain *d, const struct xen_arch_domainconfig *config) { return 0; }
@@ -56,6 +82,10 @@ static inline void domain_coloring_free(struct domain *d) {}
 static inline void domain_dump_coloring_info(struct domain *d) {}
 static inline void prepare_color_domain_config(
     struct xen_arch_domainconfig *config, const char *colors_str) {}
+static inline void *xen_remap_colored(mfn_t xen_fn, paddr_t xen_size)
+{
+    return NULL;
+}
 
 #endif /* CONFIG_CACHE_COLORING */
 #endif /* __ASM_ARM_COLORING_H__ */
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index e848fa4adf..f3f76a20b3 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -195,12 +195,26 @@ extern unsigned long total_pages;
 
 #define PDX_GROUP_SHIFT SECOND_SHIFT
 
+#ifdef CONFIG_CACHE_COLORING
+#define virt_to_boot_virt(virt) (virt - XEN_VIRT_START + BOOT_RELOC_VIRT_START)
+#define set_value_for_secondary(var, val)                       \
+    *(typeof(var) *)(virt_to_boot_virt((vaddr_t)&var)) = val;   \
+    clean_dcache(var);
+#else
+#define virt_to_boot_virt(virt) (virt)
+#define set_value_for_secondary(var, val)   \
+    var = val;                              \
+    clean_dcache(var);
+#endif
+
 /* Boot-time pagetable setup */
-extern void setup_pagetables(unsigned long boot_phys_offset);
+extern void setup_pagetables(unsigned long boot_phys_offset, paddr_t xen_paddr);
 /* Map FDT in boot pagetable */
 extern void *early_fdt_map(paddr_t fdt_paddr);
 /* Remove early mappings */
 extern void remove_early_mappings(void);
+/* Remove early coloring mappings */
+extern void remove_coloring_mappings(void);
 /* Allocate and initialise pagetables for a secondary CPU. Sets init_ttbr to the
  * new page table */
 extern int init_secondary_pagetables(int cpu);
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index a81b8f9286..4721fd4a04 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -33,6 +33,7 @@
 
 #include <xsm/xsm.h>
 
+#include <asm/coloring.h>
 #include <asm/fixmap.h>
 #include <asm/setup.h>
 
@@ -105,6 +106,9 @@ DEFINE_BOOT_PAGE_TABLE(boot_third);
 static DEFINE_PAGE_TABLE(xen_pgtable);
 static DEFINE_PAGE_TABLE(xen_first);
 #define THIS_CPU_PGTABLE xen_pgtable
+#ifdef CONFIG_CACHE_COLORING
+static DEFINE_PAGE_TABLE(xen_colored_temp);
+#endif
 #else
 #define HYP_PT_ROOT_LEVEL 1
 /* Per-CPU pagetable pages */
@@ -364,7 +368,11 @@ void flush_page_to_ram(unsigned long mfn, bool sync_icache)
 
 static inline lpae_t pte_of_xenaddr(vaddr_t va)
 {
+#ifdef CONFIG_CACHE_COLORING
+    paddr_t ma = virt_to_maddr(virt_to_boot_virt(va));
+#else
     paddr_t ma = va + phys_offset;
+#endif
 
     return mfn_to_xen_entry(maddr_to_mfn(ma), MT_NORMAL);
 }
@@ -450,6 +458,7 @@ static void xen_pt_enforce_wnx(void)
     flush_xen_tlb_local();
 }
 
+extern void relocate_xen(uint64_t ttbr, void *src, void *dst, size_t len);
 extern void switch_ttbr(uint64_t ttbr);
 
 /* Clear a translation table and clean & invalidate the cache */
@@ -459,9 +468,54 @@ static void clear_table(void *table)
     clean_and_invalidate_dcache_va_range(table, PAGE_SIZE);
 }
 
-/* Boot-time pagetable setup.
- * Changes here may need matching changes in head.S */
-void __init setup_pagetables(unsigned long boot_phys_offset)
+#ifdef CONFIG_CACHE_COLORING
+static void __init create_coloring_temp_mappings(paddr_t xen_paddr)
+{
+    lpae_t pte;
+    unsigned int i;
+    mfn_t mfn = maddr_to_mfn(xen_paddr);
+
+    for_each_xen_colored_mfn( mfn, i )
+    {
+        pte = mfn_to_xen_entry(mfn, MT_NORMAL);
+        pte.pt.table = 1; /* level 3 mappings always have this bit set */
+        xen_colored_temp[i] = pte;
+    }
+
+    pte = mfn_to_xen_entry(virt_to_mfn(xen_colored_temp), MT_NORMAL);
+    pte.pt.table = 1;
+    write_pte(&boot_second[second_table_offset(BOOT_RELOC_VIRT_START)], pte);
+}
+
+void __init remove_coloring_mappings(void)
+{
+    int rc;
+
+    /* destroy the _PAGE_BLOCK mapping */
+    rc = modify_xen_mappings(BOOT_RELOC_VIRT_START,
+                             BOOT_RELOC_VIRT_START + SZ_2M,
+                             _PAGE_BLOCK);
+    BUG_ON(rc);
+}
+#else
+static void __init create_coloring_temp_mappings(paddr_t xen_paddr) {}
+void __init remove_coloring_mappings(void) {}
+#endif /* CONFIG_CACHE_COLORING */
+
+/*
+ * Boot-time pagetable setup with coloring support
+ * Changes here may need matching changes in head.S
+ *
+ * The coloring support consists of:
+ * - Create a temporary colored mapping that conforms to Xen color selection.
+ * - pte_of_xenaddr takes care of translating the virtual addresses to the
+ *   new colored physical space and the returns the pte, so that the page table
+ *   initialization can remain the same.
+ * - Copy Xen to the new colored physical space by exploiting the temporary
+ *   mapping.
+ * - Update TTBR0_EL2 with the new root page table address.
+ */
+void __init setup_pagetables(unsigned long boot_phys_offset, paddr_t xen_paddr)
 {
     uint64_t ttbr;
     lpae_t pte, *p;
@@ -469,6 +523,9 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
 
     phys_offset = boot_phys_offset;
 
+    if ( IS_ENABLED(CONFIG_CACHE_COLORING) )
+        create_coloring_temp_mappings(xen_paddr);
+
 #ifdef CONFIG_ARM_64
     p = (void *) xen_pgtable;
     p[0] = pte_of_xenaddr((uintptr_t)xen_first);
@@ -515,13 +572,30 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
     pte.pt.table = 1;
     xen_second[second_table_offset(FIXMAP_ADDR(0))] = pte;
 
+    if ( IS_ENABLED(CONFIG_CACHE_COLORING) )
+    {
+        ttbr = virt_to_maddr(virt_to_boot_virt((vaddr_t)xen_pgtable));
+        relocate_xen(ttbr, _start, (void *)BOOT_RELOC_VIRT_START,
+                     _end - _start);
+        /*
+        * Keep original Xen memory mapped because secondary CPUs still point to it
+        * and a few variables needs to be accessed by the master CPU in order to
+        * let them boot. This mapping will also replace the one created at the
+        * beginning of setup_pagetables.
+        */
+        map_pages_to_xen(BOOT_RELOC_VIRT_START,
+                         maddr_to_mfn(XEN_VIRT_START + phys_offset),
+                         SZ_2M >> PAGE_SHIFT, PAGE_HYPERVISOR_RW | _PAGE_BLOCK);
+    }
+    else
+    {
 #ifdef CONFIG_ARM_64
-    ttbr = (uintptr_t) xen_pgtable + phys_offset;
+        ttbr = (uintptr_t) xen_pgtable + phys_offset;
 #else
-    ttbr = (uintptr_t) cpu0_pgtable + phys_offset;
+        ttbr = (uintptr_t) cpu0_pgtable + phys_offset;
 #endif
-
-    switch_ttbr(ttbr);
+        switch_ttbr(ttbr);
+    }
 
     xen_pt_enforce_wnx();
 
@@ -552,8 +626,8 @@ int init_secondary_pagetables(int cpu)
 
     /* Set init_ttbr for this CPU coming up. All CPus share a single setof
      * pagetables, but rewrite it each time for consistency with 32 bit. */
-    init_ttbr = (uintptr_t) xen_pgtable + phys_offset;
-    clean_dcache(init_ttbr);
+    set_value_for_secondary(init_ttbr, virt_to_maddr(xen_pgtable));
+
     return 0;
 }
 #else
@@ -1109,7 +1183,7 @@ static int xen_pt_update(unsigned long virt,
      *
      * XXX: Add a check.
      */
-    const mfn_t root = virt_to_mfn(THIS_CPU_PGTABLE);
+    const mfn_t root = maddr_to_mfn(READ_SYSREG64(TTBR0_EL2));
 
     /*
      * The hardware was configured to forbid mapping both writeable and
diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
index 0c90c2305c..4782f64c17 100644
--- a/xen/arch/arm/psci.c
+++ b/xen/arch/arm/psci.c
@@ -49,8 +49,8 @@ int call_psci_cpu_on(int cpu)
 {
     struct arm_smccc_res res;
 
-    arm_smccc_smc(psci_cpu_on_nr, cpu_logical_map(cpu), __pa(init_secondary),
-                  &res);
+    arm_smccc_smc(psci_cpu_on_nr, cpu_logical_map(cpu),
+                  __pa(virt_to_boot_virt((vaddr_t)init_secondary)), &res);
 
     return PSCI_RET(res);
 }
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index acc3e4ad72..6ad68b7f7e 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -465,7 +465,7 @@ static void * __init relocate_fdt(paddr_t dtb_paddr, size_t dtb_size)
     return fdt;
 }
 
-#ifdef CONFIG_ARM_32
+#if defined (CONFIG_ARM_32) || (CONFIG_CACHE_COLORING)
 /*
  * Returns the end address of the highest region in the range s..e
  * with required size and alignment that does not conflict with the
@@ -557,7 +557,9 @@ static paddr_t __init consider_modules(paddr_t s, paddr_t e,
     }
     return e;
 }
+#endif
 
+#ifdef CONFIG_ARM_32
 /*
  * Find a contiguous region that fits in the static heap region with
  * required size and alignment, and return the end address of the region
@@ -631,6 +633,62 @@ static paddr_t __init next_module(paddr_t s, paddr_t *end)
     return lowest;
 }
 
+#ifdef CONFIG_CACHE_COLORING
+/**
+ * get_xen_paddr - get physical address to relocate Xen to
+ *
+ * Xen is relocated to as near to the top of RAM as possible and
+ * aligned to a XEN_PADDR_ALIGN boundary.
+ */
+static paddr_t __init get_xen_paddr(uint32_t xen_size)
+{
+    struct meminfo *mi = &bootinfo.mem;
+    paddr_t min_size;
+    paddr_t paddr = 0;
+    int i;
+
+    min_size = (xen_size + (XEN_PADDR_ALIGN-1)) & ~(XEN_PADDR_ALIGN-1);
+
+    /* Find the highest bank with enough space. */
+    for ( i = 0; i < mi->nr_banks; i++ )
+    {
+        const struct membank *bank = &mi->bank[i];
+        paddr_t s, e;
+
+        if ( bank->size >= min_size )
+        {
+            e = consider_modules(bank->start, bank->start + bank->size,
+                                 min_size, XEN_PADDR_ALIGN, 0);
+            if ( !e )
+                continue;
+
+#ifdef CONFIG_ARM_32
+            /* Xen must be under 4GB */
+            if ( e > 0x100000000ULL )
+                e = 0x100000000ULL;
+            if ( e < bank->start )
+                continue;
+#endif
+
+            s = e - min_size;
+
+            if ( s > paddr )
+                paddr = s;
+        }
+    }
+
+    if ( !paddr )
+        panic("Not enough memory to relocate Xen\n");
+
+    printk("Placing Xen at 0x%"PRIpaddr"-0x%"PRIpaddr"\n",
+           paddr, paddr + min_size);
+
+    return paddr;
+}
+#else
+static paddr_t __init get_xen_paddr(uint32_t xen_size) { return 0; }
+#endif
+
 static void __init init_pdx(void)
 {
     paddr_t bank_start, bank_size, bank_end;
@@ -1013,8 +1071,6 @@ void __init start_xen(unsigned long boot_phys_offset,
     /* Initialize traps early allow us to get backtrace when an error occurred */
     init_traps();
 
-    setup_pagetables(boot_phys_offset);
-
     smp_clear_cpu_maps();
 
     device_tree_flattened = early_fdt_map(fdt_paddr);
@@ -1040,8 +1096,13 @@ void __init start_xen(unsigned long boot_phys_offset,
     {
         if ( !coloring_init() )
             panic("Xen cache coloring support: setup failed\n");
+        xen_bootmodule->size = XEN_COLOR_MAP_SIZE;
+        xen_bootmodule->start = get_xen_paddr(xen_bootmodule->size);
     }
 
+    setup_pagetables(boot_phys_offset, xen_bootmodule->start);
+    device_tree_flattened = early_fdt_map(fdt_paddr);
+
     setup_mm();
 
     /* Parse the ACPI tables for possible boot-time configuration */
@@ -1156,6 +1217,13 @@ void __init start_xen(unsigned long boot_phys_offset,
 
     setup_virt_paging();
 
+    /*
+     * The removal is done earlier than discard_initial_modules beacuse the
+     * livepatch init uses a virtual address equal to BOOT_RELOC_VIRT_START.
+     * Remove coloring mappings to expose a clear state to the livepatch module.
+     */
+    if ( IS_ENABLED(CONFIG_CACHE_COLORING) )
+        remove_coloring_mappings();
     do_initcalls();
 
     /*
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index f7bda3a18b..e7166ad79b 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -470,8 +470,7 @@ int __cpu_up(unsigned int cpu)
     init_data.cpuid = cpu;
 
     /* Open the gate for this CPU */
-    smp_up_cpu = cpu_logical_map(cpu);
-    clean_dcache(smp_up_cpu);
+    set_value_for_secondary(smp_up_cpu, cpu_logical_map(cpu));
 
     rc = arch_cpu_up(cpu);
 
diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 92c2984052..333589c344 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -210,7 +210,7 @@ SECTIONS
        . = ALIGN(POINTER_ALIGN);
        __bss_end = .;
   } :text
-  _end = . ;
+  _end = ALIGN(PAGE_SIZE);
 
   /* Section for the device tree blob (if any). */
   .dtb : { *(.dtb) } :text
-- 
2.34.1


