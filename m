Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A4E5A2825
	for <lists+xen-devel@lfdr.de>; Fri, 26 Aug 2022 14:59:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393805.633017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRYvo-0000Nq-AT; Fri, 26 Aug 2022 12:59:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393805.633017; Fri, 26 Aug 2022 12:59:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRYvo-0000LG-6S; Fri, 26 Aug 2022 12:59:28 +0000
Received: by outflank-mailman (input) for mailman id 393805;
 Fri, 26 Aug 2022 12:59:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z28m=Y6=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1oRYoO-00013M-Qu
 for xen-devel@lists.xenproject.org; Fri, 26 Aug 2022 12:51:49 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d897abc7-253d-11ed-9250-1f966e50362f;
 Fri, 26 Aug 2022 14:51:47 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id w20so1966146edd.10
 for <xen-devel@lists.xenproject.org>; Fri, 26 Aug 2022 05:51:47 -0700 (PDT)
Received: from carlo-ubuntu.. (hipert-gw1.mat.unimo.it. [155.185.5.1])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a1709063cb200b006ff0b457cdasm888812ejh.53.2022.08.26.05.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 05:51:46 -0700 (PDT)
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
X-Inumbo-ID: d897abc7-253d-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=MAcCYgLuW2JN1CdLnlsHkZM9+Svr9dDqHhzmUix4b28=;
        b=aQvtU6aY3GOOMBSLSs3py6Mtgu1qvnSKmxihgWB4BhPWlA2Mc9lOtyFFXBVlKUgHdx
         25/+zuVeVsB1w6YpBKcF14YFoVBX2URFz5L7KzJoHEQt+hEhh+0qTBr7E0J4L1RanJOo
         lbhmEvQPHGFh/+P4jTjggXFn1ctwJJGUmUHBpu4ndUvGLJzU011J+tJdbwwX7LFcxO5C
         10QcecvM/M9cavXSLSokG33KsWIHyJ3jX6i0zO26k+198Of79a4SEE+7gReOmYS1F8/T
         5p7nqBo3A4Fp29TIq7FW1tnX1vqp8wS1s/66PHsou2f2C7+7Qkq9y+jiLhqYLHN0zv3a
         hPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=MAcCYgLuW2JN1CdLnlsHkZM9+Svr9dDqHhzmUix4b28=;
        b=NASuXMoa+YbVxGgk05iNhMg+A0C1TnJtbNrjwkn0rt7xdjKF5jSsS+DvE8KeW5VmAh
         3Fo8O3duh7kZ0Nt85TE0IUhFNaNl+rZbZdV6kT/wFD0wp6ih27NxzFGe++JSAmrBDasR
         GHLXmjYCilb0cEsGGJG5K8+k3gTslOr3SQ93WgsYV09HYqsYW4ni8EXiHRiKCnofn7jz
         mAGtwKNXbf27j1bC24Sb36N+iPO0XzKMKnf3OekSmIIkWvfIsT1c/GVJ1KAnF2+twcwl
         QZ6I5u+aDhM2dyD2ZezFLD1tQ1AVQqUeZNWgONVLAOpesNlr1g3vBFT9TW7hzu7fTC6s
         wssg==
X-Gm-Message-State: ACgBeo1x1JN4jvXwjoL1aYdLZIyP7fD0mcl6mqODsS97gfJ003QDXv3D
	Xx+dd/Q3o/y4GwN4EfkAzTHhfFbfD8CIog==
X-Google-Smtp-Source: AA6agR6D6V0v6j+wVNZ1pvQb0K+SKpKrJSiV8IaWDMo5bmX4t6jn3eMM9/AeOAPNQO/NvW26sf1qgQ==
X-Received: by 2002:aa7:cdcc:0:b0:447:bac0:4c20 with SMTP id h12-20020aa7cdcc000000b00447bac04c20mr5659135edw.183.1661518306779;
        Fri, 26 Aug 2022 05:51:46 -0700 (PDT)
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
Subject: [PATCH 12/12] xen/arm: add cache coloring support for Xen
Date: Fri, 26 Aug 2022 14:51:11 +0200
Message-Id: <20220826125111.152261-13-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit adds the cache coloring support for Xen own physical space.

It extends the implementation of setup_pagetables to make use of Xen cache
coloring configuration. Page tables construction is essentially the same
except for the fact that the physical addresses, in case of cache coloring,
are taken from the translation of a new, temporary, virtual space that is
physically colored.

The temporary mapping is also used to relocate Xen to the new physical space
starting at the address taken from the old get_xen_paddr() function which
is brought back for the occasion.
The temporary mapping is finally converted to a mapping of the "old" (meaning
the original physical space) Xen code, so that the boot CPU can actually
address the variables and functions used by secondary CPUs.
This happens when the boot CPU needs to bring up other CPUs (psci.c and
smpboot.c) and when the TTBR value is passed to them
(init_secondary_pagetables).

Finally, since the alternative framework needs to remap the Xen text and
inittext sections, this operation must be done in a coloring-aware way.
The function __vmap_colored is introduced for that. It actually is really
similar to the original __vmap, with the exception that it doesn't take for
granted that the physical memory is contiguous.

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
 xen/arch/arm/alternative.c          |   5 ++
 xen/arch/arm/coloring.c             |  16 ++++
 xen/arch/arm/include/asm/coloring.h |  12 +++
 xen/arch/arm/include/asm/mm.h       |  19 ++++-
 xen/arch/arm/mm.c                   | 118 +++++++++++++++++++++++++---
 xen/arch/arm/psci.c                 |   4 +-
 xen/arch/arm/setup.c                |  74 +++++++++++++++--
 xen/arch/arm/smpboot.c              |   3 +-
 xen/arch/arm/xen.lds.S              |   2 +-
 xen/common/vmap.c                   |  25 ++++++
 xen/include/xen/vmap.h              |   4 +
 11 files changed, 258 insertions(+), 24 deletions(-)

diff --git a/xen/arch/arm/alternative.c b/xen/arch/arm/alternative.c
index f03cd943c6..fcecd3fec8 100644
--- a/xen/arch/arm/alternative.c
+++ b/xen/arch/arm/alternative.c
@@ -220,8 +220,13 @@ void __init apply_alternatives_all(void)
      * The text and inittext section are read-only. So re-map Xen to
      * be able to patch the code.
      */
+#ifdef CONFIG_CACHE_COLORING
+    xenmap = __vmap_colored(&xen_mfn, 1U << xen_order, 1, PAGE_HYPERVISOR,
+                            VMAP_DEFAULT);
+#else
     xenmap = __vmap(&xen_mfn, 1U << xen_order, 1, 1, PAGE_HYPERVISOR,
                     VMAP_DEFAULT);
+#endif
     /* Re-mapping Xen is not expected to fail during boot. */
     BUG_ON(!xenmap);
 
diff --git a/xen/arch/arm/coloring.c b/xen/arch/arm/coloring.c
index 7ae4095dba..946b21b826 100644
--- a/xen/arch/arm/coloring.c
+++ b/xen/arch/arm/coloring.c
@@ -340,6 +340,22 @@ unsigned int get_max_colors(void)
     return max_colors;
 }
 
+paddr_t next_xen_colored(paddr_t phys)
+{
+    unsigned int i, color = addr_to_color(phys);
+
+    for( i = 0; i < xen_num_colors; i++ )
+    {
+        if ( color == xen_colors[i] )
+            return phys;
+        else if ( color < xen_colors[i] )
+            return addr_set_color(phys, xen_colors[i]);
+    }
+
+    /* Jump to next color space (llc_way_size bytes) and use the first color */
+    return addr_set_color(phys + llc_way_size, xen_colors[0]);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/coloring.h b/xen/arch/arm/include/asm/coloring.h
index 0982bc9853..374fef9278 100644
--- a/xen/arch/arm/include/asm/coloring.h
+++ b/xen/arch/arm/include/asm/coloring.h
@@ -25,10 +25,20 @@
 #define __ASM_ARM_COLORING_H__
 
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
 struct page_info;
 
 bool __init coloring_init(void);
@@ -45,4 +55,6 @@ unsigned int page_to_color(struct page_info *pg);
 
 unsigned int get_max_colors(void);
 
+paddr_t next_xen_colored(paddr_t phys);
+
 #endif /* !__ASM_ARM_COLORING_H__ */
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index a59fc3791a..00351ee014 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -192,11 +192,15 @@ extern unsigned long total_pages;
 #define PDX_GROUP_SHIFT SECOND_SHIFT
 
 /* Boot-time pagetable setup */
-extern void setup_pagetables(unsigned long boot_phys_offset);
+extern void setup_pagetables(unsigned long boot_phys_offset, paddr_t xen_paddr);
 /* Map FDT in boot pagetable */
 extern void *early_fdt_map(paddr_t fdt_paddr);
 /* Remove early mappings */
 extern void remove_early_mappings(void);
+#ifdef CONFIG_CACHE_COLORING
+/* Remove early coloring mappings */
+extern void remove_coloring_mappings(void);
+#endif
 /* Allocate and initialise pagetables for a secondary CPU. Sets init_ttbr to the
  * new page table */
 extern int init_secondary_pagetables(int cpu);
@@ -398,6 +402,19 @@ static inline void page_set_xenheap_gfn(struct page_info *p, gfn_t gfn)
     } while ( (y = cmpxchg(&p->u.inuse.type_info, x, nx)) != x );
 }
 
+#ifdef CONFIG_CACHE_COLORING
+#define virt_boot_xen(virt)\
+    (vaddr_t)(virt - XEN_VIRT_START + BOOT_RELOC_VIRT_START)
+#define set_value_for_secondary(var, val) \
+    *(typeof(var) *)(virt_boot_xen((vaddr_t)&var)) = val; \
+    clean_dcache(var);
+#else
+#define virt_boot_xen(virt) virt
+#define set_value_for_secondary(var, val) \
+    var = val;
+    clean_dcache(var);
+#endif
+
 #endif /*  __ARCH_ARM_MM__ */
 /*
  * Local variables:
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index efc0dd75d1..951e1796af 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -33,6 +33,9 @@
 
 #include <xsm/xsm.h>
 
+#ifdef CONFIG_CACHE_COLORING
+#include <asm/coloring.h>
+#endif
 #include <asm/fixmap.h>
 #include <asm/setup.h>
 
@@ -105,6 +108,9 @@ DEFINE_BOOT_PAGE_TABLE(boot_third);
 static DEFINE_PAGE_TABLE(xen_pgtable);
 static DEFINE_PAGE_TABLE(xen_first);
 #define THIS_CPU_PGTABLE xen_pgtable
+#ifdef CONFIG_CACHE_COLORING
+static DEFINE_PAGE_TABLE(xen_colored_temp);
+#endif
 #else
 #define HYP_PT_ROOT_LEVEL 1
 /* Per-CPU pagetable pages */
@@ -362,13 +368,6 @@ void flush_page_to_ram(unsigned long mfn, bool sync_icache)
         invalidate_icache();
 }
 
-static inline lpae_t pte_of_xenaddr(vaddr_t va)
-{
-    paddr_t ma = va + phys_offset;
-
-    return mfn_to_xen_entry(maddr_to_mfn(ma), MT_NORMAL);
-}
-
 static void __init create_boot_mappings(unsigned long virt_offset,
                                         mfn_t base_mfn)
 {
@@ -460,9 +459,79 @@ static void clear_table(void *table)
     clean_and_invalidate_dcache_va_range(table, PAGE_SIZE);
 }
 
-/* Boot-time pagetable setup.
- * Changes here may need matching changes in head.S */
-void __init setup_pagetables(unsigned long boot_phys_offset)
+#ifdef CONFIG_CACHE_COLORING
+/*
+ * Translate a Xen (.text) virtual address to the colored physical one
+ * depending on the hypervisor configuration.
+ * N.B: this function must be used only when migrating from non colored to
+ * colored pagetables since it assumes to have the temporary mappings created
+ * during setup_pagetables that starts from BOOT_RELOC_VIRT_START.
+ * After the migration we have to use virt_to_maddr.
+ */
+static paddr_t virt_to_maddr_colored(vaddr_t virt)
+{
+    unsigned int va_offset;
+
+    va_offset = virt - XEN_VIRT_START;
+    return __pa(BOOT_RELOC_VIRT_START + va_offset);
+}
+
+static void __init create_coloring_temp_mappings(paddr_t xen_paddr)
+{
+    lpae_t pte;
+    unsigned int i;
+
+    for ( i = 0; i < (_end - _start) / PAGE_SIZE; i++ )
+    {
+        xen_paddr = next_xen_colored(xen_paddr);
+        pte = mfn_to_xen_entry(maddr_to_mfn(xen_paddr), MT_NORMAL);
+        pte.pt.table = 1; /* level 3 mappings always have this bit set */
+        xen_colored_temp[i] = pte;
+        xen_paddr += PAGE_SIZE;
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
+#endif /* !CONFIG_CACHE_COLORING */
+
+static inline lpae_t pte_of_xenaddr(vaddr_t va)
+{
+#ifdef CONFIG_CACHE_COLORING
+    paddr_t ma = virt_to_maddr_colored(va);
+#else
+    paddr_t ma = va + phys_offset;
+#endif
+
+    return mfn_to_xen_entry(maddr_to_mfn(ma), MT_NORMAL);
+}
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
@@ -470,6 +539,10 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
 
     phys_offset = boot_phys_offset;
 
+#ifdef CONFIG_CACHE_COLORING
+    create_coloring_temp_mappings(xen_paddr);
+#endif
+
 #ifdef CONFIG_ARM_64
     p = (void *) xen_pgtable;
     p[0] = pte_of_xenaddr((uintptr_t)xen_first);
@@ -522,7 +595,14 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
     pte = boot_second[second_table_offset(BOOT_FDT_VIRT_START + SZ_2M)];
     xen_second[second_table_offset(BOOT_FDT_VIRT_START + SZ_2M)] = pte;
 
-#ifdef CONFIG_ARM_64
+#ifdef CONFIG_CACHE_COLORING
+    /* Copy Xen to the new location */
+    memcpy((void *)BOOT_RELOC_VIRT_START, (const void *)XEN_VIRT_START,
+           (_end - _start));
+    clean_dcache_va_range((void *)BOOT_RELOC_VIRT_START, (_end - _start));
+
+    ttbr = virt_to_maddr_colored((vaddr_t)xen_pgtable);
+#elif CONFIG_ARM_64
     ttbr = (uintptr_t) xen_pgtable + phys_offset;
 #else
     ttbr = (uintptr_t) cpu0_pgtable + phys_offset;
@@ -530,6 +610,18 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
 
     switch_ttbr(ttbr);
 
+#ifdef CONFIG_CACHE_COLORING
+    /*
+     * Keep original Xen memory mapped because secondary CPUs still point to it
+     * and a few variables needs to be accessed by the master CPU in order to
+     * let them boot. This mapping will also replace the one created at the
+     * beginning of setup_pagetables.
+     */
+    map_pages_to_xen(BOOT_RELOC_VIRT_START,
+                     maddr_to_mfn(XEN_VIRT_START + phys_offset),
+                     SZ_2M >> PAGE_SHIFT, PAGE_HYPERVISOR_RW | _PAGE_BLOCK);
+#endif
+
     xen_pt_enforce_wnx();
 
 #ifdef CONFIG_ARM_32
@@ -559,8 +651,8 @@ int init_secondary_pagetables(int cpu)
 
     /* Set init_ttbr for this CPU coming up. All CPus share a single setof
      * pagetables, but rewrite it each time for consistency with 32 bit. */
-    init_ttbr = (uintptr_t) xen_pgtable + phys_offset;
-    clean_dcache(init_ttbr);
+    set_value_for_secondary(init_ttbr, virt_to_maddr(xen_pgtable));
+
     return 0;
 }
 #else
diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
index 0c90c2305c..d25325d28f 100644
--- a/xen/arch/arm/psci.c
+++ b/xen/arch/arm/psci.c
@@ -49,8 +49,8 @@ int call_psci_cpu_on(int cpu)
 {
     struct arm_smccc_res res;
 
-    arm_smccc_smc(psci_cpu_on_nr, cpu_logical_map(cpu), __pa(init_secondary),
-                  &res);
+    arm_smccc_smc(psci_cpu_on_nr, cpu_logical_map(cpu),
+                  __pa(virt_boot_xen((vaddr_t)init_secondary)), &res);
 
     return PSCI_RET(res);
 }
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index bdfc05bf61..4917ac84ab 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -453,7 +453,7 @@ static void * __init relocate_fdt(paddr_t dtb_paddr, size_t dtb_size)
     return fdt;
 }
 
-#ifdef CONFIG_ARM_32
+#if defined (CONFIG_ARM_32) || (CONFIG_CACHE_COLORING)
 /*
  * Returns the end address of the highest region in the range s..e
  * with required size and alignment that does not conflict with the
@@ -581,6 +581,60 @@ static paddr_t __init next_module(paddr_t s, paddr_t *end)
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
+#endif
+
 static void __init init_pdx(void)
 {
     paddr_t bank_start, bank_size, bank_end;
@@ -900,6 +954,8 @@ void __init start_xen(unsigned long boot_phys_offset,
     struct bootmodule *xen_bootmodule;
     struct domain *d;
     int rc, i;
+    paddr_t xen_paddr = (paddr_t)(uintptr_t)(_start + boot_phys_offset);
+    paddr_t xen_size = (paddr_t)(uintptr_t)(_end - _start + 1);
 
     dcache_line_bytes = read_dcache_line_bytes();
 
@@ -928,15 +984,15 @@ void __init start_xen(unsigned long boot_phys_offset,
 #ifdef CONFIG_CACHE_COLORING
     if ( !coloring_init() )
         panic("Xen Coloring support: setup failed\n");
+    xen_size = XEN_COLOR_MAP_SIZE;
+    xen_paddr = get_xen_paddr((uint32_t)xen_size);
 #endif
 
     /* Register Xen's load address as a boot module. */
-    xen_bootmodule = add_boot_module(BOOTMOD_XEN,
-                             (paddr_t)(uintptr_t)(_start + boot_phys_offset),
-                             (paddr_t)(uintptr_t)(_end - _start + 1), false);
+    xen_bootmodule = add_boot_module(BOOTMOD_XEN, xen_paddr, xen_size, false);
     BUG_ON(!xen_bootmodule);
 
-    setup_pagetables(boot_phys_offset);
+    setup_pagetables(boot_phys_offset, xen_paddr);
 
     setup_mm();
 
@@ -1052,6 +1108,14 @@ void __init start_xen(unsigned long boot_phys_offset,
 
     setup_virt_paging();
 
+#ifdef CONFIG_CACHE_COLORING
+    /*
+     * The removal is done earlier than discard_initial_modules beacuse the
+     * livepatch init uses a virtual address equal to BOOT_RELOC_VIRT_START.
+     * Remove coloring mappings to expose a clear state to the livepatch module.
+     */
+    remove_coloring_mappings();
+#endif
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
index 1e986e211f..4cdead1c4f 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -203,7 +203,7 @@ SECTIONS
        . = ALIGN(POINTER_ALIGN);
        __bss_end = .;
   } :text
-  _end = . ;
+  _end = ALIGN(PAGE_SIZE);
 
   /* Section for the device tree blob (if any). */
   .dtb : { *(.dtb) } :text
diff --git a/xen/common/vmap.c b/xen/common/vmap.c
index 4fd6b3067e..58818ddfe1 100644
--- a/xen/common/vmap.c
+++ b/xen/common/vmap.c
@@ -8,6 +8,9 @@
 #include <xen/types.h>
 #include <xen/vmap.h>
 #include <asm/page.h>
+#ifdef CONFIG_CACHE_COLORING
+#include <asm/coloring.h>
+#endif
 
 static DEFINE_SPINLOCK(vm_lock);
 static void *__read_mostly vm_base[VMAP_REGION_NR];
@@ -218,6 +221,28 @@ void *__vmap(const mfn_t *mfn, unsigned int granularity,
     return va;
 }
 
+#ifdef CONFIG_CACHE_COLORING
+void * __vmap_colored(const mfn_t *mfn, unsigned int nr, unsigned int align,
+                      unsigned int flags, enum vmap_region type)
+{
+    void *va = vm_alloc(nr, align, type);
+    unsigned long cur = (unsigned long)va;
+    paddr_t pa = mfn_to_maddr(*mfn);
+
+    for ( ; va && nr-- ; cur += PAGE_SIZE )
+    {
+        pa = next_xen_colored(pa);
+        if ( map_pages_to_xen(cur, maddr_to_mfn(pa), 1, flags) )
+        {
+            vunmap(va);
+            return NULL;
+        }
+        pa += PAGE_SIZE;
+    }
+    return va;
+}
+#endif
+
 void *vmap(const mfn_t *mfn, unsigned int nr)
 {
     return __vmap(mfn, 1, nr, 1, PAGE_HYPERVISOR, VMAP_DEFAULT);
diff --git a/xen/include/xen/vmap.h b/xen/include/xen/vmap.h
index b0f7632e89..9bdc9db70b 100644
--- a/xen/include/xen/vmap.h
+++ b/xen/include/xen/vmap.h
@@ -14,6 +14,10 @@ void vm_init_type(enum vmap_region type, void *start, void *end);
 
 void *__vmap(const mfn_t *mfn, unsigned int granularity, unsigned int nr,
              unsigned int align, unsigned int flags, enum vmap_region);
+#ifdef CONFIG_CACHE_COLORING
+void *__vmap_colored(const mfn_t *mfn, unsigned int nr, unsigned int align,
+                     unsigned int flags, enum vmap_region);
+#endif
 void *vmap(const mfn_t *mfn, unsigned int nr);
 void vunmap(const void *);
 
-- 
2.34.1


