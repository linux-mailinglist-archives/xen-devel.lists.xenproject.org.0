Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE68678061
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 16:48:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483036.749012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJz3l-0003yJ-R1; Mon, 23 Jan 2023 15:48:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483036.749012; Mon, 23 Jan 2023 15:48:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJz3l-0003vV-Gr; Mon, 23 Jan 2023 15:48:37 +0000
Received: by outflank-mailman (input) for mailman id 483036;
 Mon, 23 Jan 2023 15:48:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kihy=5U=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1pJz3k-00006V-87
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 15:48:36 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64f195a5-9b35-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 16:48:34 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id kt14so31674250ejc.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jan 2023 07:48:34 -0800 (PST)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 r2-20020a17090609c200b007bd28b50305sm22170978eje.200.2023.01.23.07.48.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 07:48:33 -0800 (PST)
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
X-Inumbo-ID: 64f195a5-9b35-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csEQnyAGj75A2oDuFHesK9E3htjoPKUhnq2Q9BYRkA0=;
        b=sgILsUw1EMkAtx7wBGa1Tl9hBegYY+LO9VzkIUBr+UB7yaEkl3haTW5TSbUJSf1jun
         iRKf8Due67bJ6kh6yxTABd0rsLAFEATnrC1CMbM2i2JmCOCJ7qjXSQtH2P4fyrm1vRCO
         QGIeWtecAeekCocjFMj59pwwH+fP6IJtAQhNRzm1rTZlDcOV/17sQSP/SFB+E6TzHOCO
         U41D01LwXE9Kn3OU47lVYDJKyyFamS+gqaYfhOw5TKWY2GV3NqCGF7gUuRVOFWRuxvF4
         bqdJQ5NTG8Mj1VBpXwxjt6ajeRI/GJjrFMCyKh/LnvGJZQ7eu4yoiG1jFKWkDFHmRqGu
         YMYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=csEQnyAGj75A2oDuFHesK9E3htjoPKUhnq2Q9BYRkA0=;
        b=iaWO7jOISFDVTPcRDTfBYxLxbyVLifrSj2mQd4Hll4y6CVBwpsKfWt2Oyvq2jTT5xV
         Mk3f1SjY+KH+Cp4vjDb5hjdQCFo4kEXwGqfdPo21m7YVRsBXXRvHVCSprQ/Y9VY4RgSi
         rpuGZ3NwK4XkBCQENKmBgbn98FaWQ74XRMuf7/n2kBlRUd+S4523T/QjBxFhmsUQdlFR
         ifjsSSMNSK1XU41P4mVMh7MiI8OJR/D6ud3XH+FRAv1eQ4dKwX7MQZqU85zNRMmhRaKK
         bph85sYJ9fWoaJbhqyFi1EDWEQHUwnhyJj6hECbv2gq9pLR+n53iNmwYUbQJ/enknTDL
         Mmgw==
X-Gm-Message-State: AFqh2kpzC6AiArMnOS52YvvEjgcC/cdxi4tWdFC1Gk+lmfoxW3XKCrzH
	Fb++KTJMOOTfSwrv5xaqQP0rXcmWywNPW56F
X-Google-Smtp-Source: AMrXdXujSAA0u5pxrtehEsoIhORfGahWR5LG/sCKGkAm+svGBrRkdtgXEcP7Dqb8VWdJ8caE/HHmEw==
X-Received: by 2002:a17:907:d68c:b0:812:d53e:1222 with SMTP id wf12-20020a170907d68c00b00812d53e1222mr27709223ejc.31.1674488913975;
        Mon, 23 Jan 2023 07:48:33 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: Carlo Nonato <carlo.nonato@minervasys.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH v4 11/11] xen/arm: add cache coloring support for Xen
Date: Mon, 23 Jan 2023 16:47:35 +0100
Message-Id: <20230123154735.74832-12-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
References: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit adds the cache coloring support for Xen own physical space.

It extends the implementation of setup_pagetables() to make use of Xen
cache coloring configuration. Page tables construction is essentially the
same except for the fact that PTEs point to a new temporary mapped,
physically colored space.

The temporary mapping is also used to relocate Xen to the new physical
space starting at the address taken from the old get_xen_paddr() function
which is brought back for the occasion.
The temporary mapping is finally converted to a mapping of the "old"
(meaning the original physical space) Xen code, so that the boot CPU can
actually address the variables and functions used by secondary CPUs until
they enable the MMU. This happens when the boot CPU needs to bring up other
CPUs (psci.c and smpboot.c) and when the TTBR value is passed to them
(init_secondary_pagetables()).

Finally, since the alternative framework needs to remap the Xen text and
inittext sections, this operation must be done in a coloring-aware way.
The function xen_remap_colored() is introduced for that.

Based on original work from: Luca Miccio <lucmiccio@gmail.com>

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
v4:
- removed set_value_for_secondary() because it was wrongly cleaning cache
- relocate_xen() now calls switch_ttbr_id()
---
 xen/arch/arm/alternative.c              |  9 ++-
 xen/arch/arm/arm64/head.S               | 50 +++++++++++++
 xen/arch/arm/arm64/mm.c                 | 26 +++++--
 xen/arch/arm/include/asm/llc_coloring.h | 22 ++++++
 xen/arch/arm/include/asm/mm.h           |  7 +-
 xen/arch/arm/llc_coloring.c             | 45 ++++++++++++
 xen/arch/arm/mm.c                       | 94 ++++++++++++++++++++++---
 xen/arch/arm/psci.c                     |  9 ++-
 xen/arch/arm/setup.c                    | 75 +++++++++++++++++++-
 xen/arch/arm/smpboot.c                  |  9 ++-
 xen/arch/arm/xen.lds.S                  |  2 +-
 11 files changed, 325 insertions(+), 23 deletions(-)

diff --git a/xen/arch/arm/alternative.c b/xen/arch/arm/alternative.c
index f00e3b9b3c..29f1ff34d4 100644
--- a/xen/arch/arm/alternative.c
+++ b/xen/arch/arm/alternative.c
@@ -9,6 +9,7 @@
 #include <xen/init.h>
 #include <xen/types.h>
 #include <xen/kernel.h>
+#include <xen/llc_coloring.h>
 #include <xen/mm.h>
 #include <xen/vmap.h>
 #include <xen/smp.h>
@@ -209,8 +210,12 @@ void __init apply_alternatives_all(void)
      * The text and inittext section are read-only. So re-map Xen to
      * be able to patch the code.
      */
-    xenmap = __vmap(&xen_mfn, 1U << xen_order, 1, 1, PAGE_HYPERVISOR,
-                    VMAP_DEFAULT);
+    if ( llc_coloring_enabled )
+        xenmap = xen_remap_colored(xen_mfn, xen_size);
+    else
+        xenmap = __vmap(&xen_mfn, 1U << xen_order, 1, 1, PAGE_HYPERVISOR,
+                        VMAP_DEFAULT);
+
     /* Re-mapping Xen is not expected to fail during boot. */
     BUG_ON(!xenmap);
 
diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index a61b4d3c27..9ed7610afa 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -801,6 +801,56 @@ fail:   PRINT("- Boot failed -\r\n")
         b     1b
 ENDPROC(fail)
 
+GLOBAL(_end_boot)
+
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
+        b switch_ttbr_id
+
 /*
  * Switch TTBR
  *
diff --git a/xen/arch/arm/arm64/mm.c b/xen/arch/arm/arm64/mm.c
index 2ede4e75ae..4419381fdd 100644
--- a/xen/arch/arm/arm64/mm.c
+++ b/xen/arch/arm/arm64/mm.c
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 
 #include <xen/init.h>
+#include <xen/llc_coloring.h>
 #include <xen/mm.h>
 
 #include <asm/setup.h>
@@ -121,26 +122,43 @@ void update_identity_mapping(bool enable)
 }
 
 extern void switch_ttbr_id(uint64_t ttbr);
+extern void relocate_xen(uint64_t ttbr, void *src, void *dst, size_t len);
 
 typedef void (switch_ttbr_fn)(uint64_t ttbr);
+typedef void (relocate_xen_fn)(uint64_t ttbr, void *src, void *dst, size_t len);
 
 void __init switch_ttbr(uint64_t ttbr)
 {
-    vaddr_t id_addr = virt_to_maddr(switch_ttbr_id);
-    switch_ttbr_fn *fn = (switch_ttbr_fn *)id_addr;
+    vaddr_t vaddr, id_addr;
     lpae_t pte;
 
+    if ( llc_coloring_enabled )
+        vaddr = (vaddr_t)relocate_xen;
+    else
+        vaddr = (vaddr_t)switch_ttbr_id;
+
+    id_addr = virt_to_maddr(vaddr);
+
     /* Enable the identity mapping in the boot page tables */
     update_identity_mapping(true);
     /* Enable the identity mapping in the runtime page tables */
-    pte = pte_of_xenaddr((vaddr_t)switch_ttbr_id);
+    pte = pte_of_xenaddr(vaddr);
     pte.pt.table = 1;
     pte.pt.xn = 0;
     pte.pt.ro = 1;
     write_pte(&xen_third_id[third_table_offset(id_addr)], pte);
 
     /* Switch TTBR */
-    fn(ttbr);
+    if ( llc_coloring_enabled )
+    {
+        relocate_xen_fn *fn = (relocate_xen_fn *)id_addr;
+        fn(ttbr, _start, (void *)BOOT_RELOC_VIRT_START, _end - _start);
+    }
+    else
+    {
+        switch_ttbr_fn *fn = (switch_ttbr_fn *)id_addr;
+        fn(ttbr);
+    }
 
     /*
      * Disable the identity mapping in the runtime page tables.
diff --git a/xen/arch/arm/include/asm/llc_coloring.h b/xen/arch/arm/include/asm/llc_coloring.h
index 7a01b8841c..ae5c4ff606 100644
--- a/xen/arch/arm/include/asm/llc_coloring.h
+++ b/xen/arch/arm/include/asm/llc_coloring.h
@@ -15,11 +15,28 @@
 
 #ifdef CONFIG_LLC_COLORING
 
+#include <xen/mm-frame.h>
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
 bool __init llc_coloring_init(void);
 
 unsigned int *dom0_llc_colors(unsigned int *num_colors);
 unsigned int *llc_colors_from_str(const char *str, unsigned int *num_colors);
 
+paddr_t xen_colored_map_size(paddr_t size);
+mfn_t xen_colored_mfn(mfn_t mfn);
+void *xen_remap_colored(mfn_t xen_fn, paddr_t xen_size);
+
 #else /* !CONFIG_LLC_COLORING */
 
 static inline bool __init llc_coloring_init(void) { return true; }
@@ -27,6 +44,11 @@ static inline unsigned int *dom0_llc_colors(
     unsigned int *num_colors) { return NULL; }
 static inline unsigned int *llc_colors_from_str(
     const char *str, unsigned int *num_colors) { return NULL; }
+paddr_t xen_colored_map_size(paddr_t size) { return 0; }
+static inline void *xen_remap_colored(mfn_t xen_fn, paddr_t xen_size)
+{
+    return NULL;
+}
 
 #endif /* CONFIG_LLC_COLORING */
 
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 596293f792..1b3be348b7 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -195,14 +195,19 @@ extern unsigned long total_pages;
 
 #define PDX_GROUP_SHIFT SECOND_SHIFT
 
+#define virt_to_reloc_virt(virt) \
+    (((vaddr_t)virt) - XEN_VIRT_START + BOOT_RELOC_VIRT_START)
+
 /* Boot-time pagetable setup */
-extern void setup_pagetables(unsigned long boot_phys_offset);
+extern void setup_pagetables(unsigned long boot_phys_offset, paddr_t xen_paddr);
 /* Map FDT in boot pagetable */
 extern void *early_fdt_map(paddr_t fdt_paddr);
 /* Switch to a new root page-tables */
 extern void switch_ttbr(uint64_t ttbr);
 /* Remove early mappings */
 extern void remove_early_mappings(void);
+/* Remove early LLC coloring mappings */
+extern void remove_llc_coloring_mappings(void);
 /* Allocate and initialise pagetables for a secondary CPU. Sets init_ttbr to the
  * new page table */
 extern int init_secondary_pagetables(int cpu);
diff --git a/xen/arch/arm/llc_coloring.c b/xen/arch/arm/llc_coloring.c
index 745e93a61a..ded1f33ad5 100644
--- a/xen/arch/arm/llc_coloring.c
+++ b/xen/arch/arm/llc_coloring.c
@@ -15,6 +15,7 @@
 #include <xen/llc_coloring.h>
 #include <xen/param.h>
 #include <xen/types.h>
+#include <xen/vmap.h>
 
 #include <asm/processor.h>
 #include <asm/sysregs.h>
@@ -41,6 +42,8 @@ static unsigned int __ro_after_init xen_colors[CONFIG_NR_LLC_COLORS];
 static unsigned int __ro_after_init xen_num_colors;
 
 #define addr_to_color(addr) (((addr) & addr_col_mask) >> PAGE_SHIFT)
+#define addr_set_color(addr, color) (((addr) & ~addr_col_mask) \
+                                     | ((color) << PAGE_SHIFT))
 
 /*
  * Parse the coloring configuration given in the buf string, following the
@@ -341,6 +344,48 @@ unsigned int get_nr_llc_colors(void)
     return nr_colors;
 }
 
+paddr_t xen_colored_map_size(paddr_t size)
+{
+    return ROUNDUP(size * nr_colors, XEN_PADDR_ALIGN);
+}
+
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
+        panic("Can't allocate LLC colored MFNs\n");
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
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 7015a0f841..f14fb98088 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -14,6 +14,7 @@
 #include <xen/guest_access.h>
 #include <xen/init.h>
 #include <xen/libfdt/libfdt.h>
+#include <xen/llc_coloring.h>
 #include <xen/mm.h>
 #include <xen/pfn.h>
 #include <xen/pmap.h>
@@ -96,6 +97,9 @@ DEFINE_BOOT_PAGE_TABLE(boot_third);
 DEFINE_PAGE_TABLE(xen_pgtable);
 static DEFINE_PAGE_TABLE(xen_first);
 #define THIS_CPU_PGTABLE xen_pgtable
+#ifdef CONFIG_LLC_COLORING
+static DEFINE_PAGE_TABLE(xen_colored_temp);
+#endif
 #else
 #define HYP_PT_ROOT_LEVEL 1
 /* Per-CPU pagetable pages */
@@ -391,7 +395,12 @@ void flush_page_to_ram(unsigned long mfn, bool sync_icache)
 
 lpae_t pte_of_xenaddr(vaddr_t va)
 {
-    paddr_t ma = va + phys_offset;
+    paddr_t ma;
+
+    if ( llc_coloring_enabled )
+        ma = virt_to_maddr(virt_to_reloc_virt(va));
+    else
+        ma = va + phys_offset;
 
     return mfn_to_xen_entry(maddr_to_mfn(ma), MT_NORMAL);
 }
@@ -484,9 +493,54 @@ static void clear_table(void *table)
     clean_and_invalidate_dcache_va_range(table, PAGE_SIZE);
 }
 
-/* Boot-time pagetable setup.
- * Changes here may need matching changes in head.S */
-void __init setup_pagetables(unsigned long boot_phys_offset)
+#ifdef CONFIG_LLC_COLORING
+static void __init create_llc_coloring_mappings(paddr_t xen_paddr)
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
+void __init remove_llc_coloring_mappings(void)
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
+static void __init create_llc_coloring_mappings(paddr_t xen_paddr) {}
+void __init remove_llc_coloring_mappings(void) {}
+#endif /* CONFIG_LLC_COLORING */
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
@@ -494,6 +548,9 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
 
     phys_offset = boot_phys_offset;
 
+    if ( llc_coloring_enabled )
+        create_llc_coloring_mappings(xen_paddr);
+
     arch_setup_page_tables();
 
 #ifdef CONFIG_ARM_64
@@ -543,10 +600,13 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
     pte.pt.table = 1;
     xen_second[second_table_offset(FIXMAP_ADDR(0))] = pte;
 
+    if ( llc_coloring_enabled )
+        ttbr = virt_to_maddr(virt_to_reloc_virt(xen_pgtable));
+    else
 #ifdef CONFIG_ARM_64
-    ttbr = (uintptr_t) xen_pgtable + phys_offset;
+        ttbr = (uintptr_t) xen_pgtable + phys_offset;
 #else
-    ttbr = (uintptr_t) cpu0_pgtable + phys_offset;
+        ttbr = (uintptr_t) cpu0_pgtable + phys_offset;
 #endif
 
     switch_ttbr(ttbr);
@@ -556,6 +616,18 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
 #ifdef CONFIG_ARM_32
     per_cpu(xen_pgtable, 0) = cpu0_pgtable;
 #endif
+
+    /*
+    * Keep original Xen memory mapped because secondary CPUs still point to it
+    * and a few variables needs to be accessed by the master CPU in order to
+    * let them boot. This mapping will also replace the one created at the
+    * beginning of setup_pagetables.
+    */
+    if ( llc_coloring_enabled )
+        map_pages_to_xen(BOOT_RELOC_VIRT_START,
+                         maddr_to_mfn(XEN_VIRT_START + phys_offset),
+                         SZ_2M >> PAGE_SHIFT, PAGE_HYPERVISOR_RW | _PAGE_BLOCK);
+
 }
 
 static void clear_boot_pagetables(void)
@@ -576,12 +648,18 @@ static void clear_boot_pagetables(void)
 #ifdef CONFIG_ARM_64
 int init_secondary_pagetables(int cpu)
 {
+    uint64_t *init_ttbr_addr = &init_ttbr;
+
     clear_boot_pagetables();
 
+    if ( llc_coloring_enabled )
+        init_ttbr_addr = (uint64_t *)virt_to_reloc_virt(&init_ttbr);
+
     /* Set init_ttbr for this CPU coming up. All CPus share a single setof
      * pagetables, but rewrite it each time for consistency with 32 bit. */
-    init_ttbr = (uintptr_t) xen_pgtable + phys_offset;
-    clean_dcache(init_ttbr);
+    *init_ttbr_addr = virt_to_maddr(xen_pgtable);
+    clean_dcache(*init_ttbr_addr);
+
     return 0;
 }
 #else
diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
index 695d2fa1f1..fdc798dd14 100644
--- a/xen/arch/arm/psci.c
+++ b/xen/arch/arm/psci.c
@@ -11,6 +11,7 @@
 
 #include <xen/types.h>
 #include <xen/init.h>
+#include <xen/llc_coloring.h>
 #include <xen/mm.h>
 #include <xen/smp.h>
 #include <asm/cpufeature.h>
@@ -39,9 +40,13 @@ static uint32_t psci_cpu_on_nr;
 int call_psci_cpu_on(int cpu)
 {
     struct arm_smccc_res res;
+    vaddr_t init_secondary_addr = (vaddr_t)init_secondary;
 
-    arm_smccc_smc(psci_cpu_on_nr, cpu_logical_map(cpu), __pa(init_secondary),
-                  &res);
+    if ( llc_coloring_enabled )
+        init_secondary_addr = virt_to_reloc_virt(init_secondary);
+
+    arm_smccc_smc(psci_cpu_on_nr, cpu_logical_map(cpu),
+                  __pa(init_secondary_addr), &res);
 
     return PSCI_RET(res);
 }
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index c04e5012f0..72da5a8e5e 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -456,7 +456,7 @@ static void * __init relocate_fdt(paddr_t dtb_paddr, size_t dtb_size)
     return fdt;
 }
 
-#ifdef CONFIG_ARM_32
+#if defined (CONFIG_ARM_32) || defined(CONFIG_LLC_COLORING)
 /*
  * Returns the end address of the highest region in the range s..e
  * with required size and alignment that does not conflict with the
@@ -548,7 +548,9 @@ static paddr_t __init consider_modules(paddr_t s, paddr_t e,
     }
     return e;
 }
+#endif
 
+#ifdef CONFIG_ARM_32
 /*
  * Find a contiguous region that fits in the static heap region with
  * required size and alignment, and return the end address of the region
@@ -622,6 +624,62 @@ static paddr_t __init next_module(paddr_t s, paddr_t *end)
     return lowest;
 }
 
+#ifdef CONFIG_LLC_COLORING
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
@@ -1004,8 +1062,6 @@ void __init start_xen(unsigned long boot_phys_offset,
     /* Initialize traps early allow us to get backtrace when an error occurred */
     init_traps();
 
-    setup_pagetables(boot_phys_offset);
-
     smp_clear_cpu_maps();
 
     device_tree_flattened = early_fdt_map(fdt_paddr);
@@ -1031,8 +1087,13 @@ void __init start_xen(unsigned long boot_phys_offset,
     {
         if ( !llc_coloring_init() )
             panic("Xen LLC coloring support: setup failed\n");
+        xen_bootmodule->size = xen_colored_map_size(_end - _start);
+        xen_bootmodule->start = get_xen_paddr(xen_bootmodule->size);
     }
 
+    setup_pagetables(boot_phys_offset, xen_bootmodule->start);
+    device_tree_flattened = early_fdt_map(fdt_paddr);
+
     setup_mm();
 
     /* Parse the ACPI tables for possible boot-time configuration */
@@ -1147,6 +1208,14 @@ void __init start_xen(unsigned long boot_phys_offset,
 
     setup_virt_paging();
 
+    /*
+     * The removal is done earlier than discard_initial_modules beacuse the
+     * livepatch init uses a virtual address equal to BOOT_RELOC_VIRT_START.
+     * Remove LLC coloring mappings to expose a clear state to the livepatch
+     * module.
+     */
+    if ( llc_coloring_enabled )
+        remove_llc_coloring_mappings();
     do_initcalls();
 
     /*
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 4a89b3a834..7e437724b4 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -13,6 +13,7 @@
 #include <xen/domain_page.h>
 #include <xen/errno.h>
 #include <xen/init.h>
+#include <xen/llc_coloring.h>
 #include <xen/mm.h>
 #include <xen/param.h>
 #include <xen/sched.h>
@@ -445,6 +446,7 @@ int __cpu_up(unsigned int cpu)
 {
     int rc;
     s_time_t deadline;
+    unsigned long *smp_up_cpu_addr = &smp_up_cpu;
 
     printk("Bringing up CPU%d\n", cpu);
 
@@ -460,9 +462,12 @@ int __cpu_up(unsigned int cpu)
     /* Tell the remote CPU what its logical CPU ID is. */
     init_data.cpuid = cpu;
 
+    if ( llc_coloring_enabled )
+        smp_up_cpu_addr = (unsigned long *)virt_to_reloc_virt(&smp_up_cpu);
+
     /* Open the gate for this CPU */
-    smp_up_cpu = cpu_logical_map(cpu);
-    clean_dcache(smp_up_cpu);
+    *smp_up_cpu_addr = cpu_logical_map(cpu);
+    clean_dcache(*smp_up_cpu_addr);
 
     rc = arch_cpu_up(cpu);
 
diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 3f7ebd19f3..a69c43e961 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -212,7 +212,7 @@ SECTIONS
        . = ALIGN(POINTER_ALIGN);
        __bss_end = .;
   } :text
-  _end = . ;
+  _end = ALIGN(PAGE_SIZE);
 
   /* Section for the device tree blob (if any). */
   .dtb : { *(.dtb) } :text
-- 
2.34.1


