Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9778821926
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jan 2024 10:52:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660572.1030165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKbRK-00010O-8M; Tue, 02 Jan 2024 09:52:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660572.1030165; Tue, 02 Jan 2024 09:52:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKbRK-0000q7-15; Tue, 02 Jan 2024 09:52:02 +0000
Received: by outflank-mailman (input) for mailman id 660572;
 Tue, 02 Jan 2024 09:52:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mpFB=IM=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rKbRI-00060C-1Z
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2024 09:52:00 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9158e1f7-a954-11ee-9b0f-b553b5be7939;
 Tue, 02 Jan 2024 10:51:57 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-556ab26227cso13513a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jan 2024 01:51:57 -0800 (PST)
Received: from carlo-ubuntu.minervasys.tech (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 s4-20020a1709066c8400b00a1f7ab65d3fsm11541845ejr.131.2024.01.02.01.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 01:51:56 -0800 (PST)
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
X-Inumbo-ID: 9158e1f7-a954-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1704189117; x=1704793917; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WMy02P2ugeOoYavgONgNbpFFD/A3TCZgNfOsvu4lMaM=;
        b=luWMUfNaKy5Sw6h65LmChIMl9ZJegIknF5rvXezoy7SHX3/26symp4LE0EUi6l65Ni
         sY8vp3iY2Hy4a6nVsZJor2+1Jk/tUMMQe/S3f2EPGv9MpLILTRPq+PaN5i7MWTVsCE0A
         Ud4VT0nWUipWKym7UdbPFNdyRX0B/dJHk242oCwxExb/kCiabBebLFbOq5Jks2E3zLB0
         Di7crGPu9w9xSsHqO3h88yVfBAzI+ZL701t2JQsS2P0+mYeC/2lCtCwPXe0IJdRYousd
         Oauv4yXjuRNwoxR1bV0zqiIs/BIVQ1d6l+JpDNuN/QPQFFBV+L6mC77Qoowq2P8KI7zy
         dH5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704189117; x=1704793917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WMy02P2ugeOoYavgONgNbpFFD/A3TCZgNfOsvu4lMaM=;
        b=MoX66jSp50n1IOeprvlNcuf3fEd3hcpaKLXEFt4W7wQ4izeHEXiAJ44z024b2pkM46
         dK1Q8y053COD/Dcg+izg3KqS6BuRr9Ppvu3bpC+MB2CQaL7LSTIIGKXBJWh65iOBOW/A
         pGRVPHNXFTTcGU9v6+fpGfo8gGeN3ZeILMxv7giKyjPAMppH7G4j1seOGeQQGx4ZEcoY
         BHe1VLAyFVLch/bVGWYOuky6ZuK1rQ1M2kSCxKtB9uWVNlm8XvnTCOPLAhP1oGtyV9uQ
         hjvmQh7f+sDvqfr2/w4R3MwCVWkGULrjzmBB9U1rJdhCcY1FuVvzGsIRIj409AHJHPl0
         aj5Q==
X-Gm-Message-State: AOJu0YxUVr99bhoxnConZB13w6k25f4kyZFe8a7Cxse7zhL74x4dV/XT
	6y+bY2jJW2nYwg4KBoqqP5lzF/9djPyk83N4Kby2i8D9Cvg=
X-Google-Smtp-Source: AGHT+IGNcjW25nK1HrJzJj+6Mu5WuA3NQdYyTlLCLPzh0swT7iChnL+TA2HS96sL+pj4fLbJPc+VKA==
X-Received: by 2002:a17:906:3612:b0:a26:97dd:2110 with SMTP id q18-20020a170906361200b00a2697dd2110mr4943796ejb.62.1704189116972;
        Tue, 02 Jan 2024 01:51:56 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: Carlo Nonato <carlo.nonato@minervasys.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH v5 13/13] xen/arm: add cache coloring support for Xen
Date: Tue,  2 Jan 2024 10:51:38 +0100
Message-Id: <20240102095138.17933-14-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
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
(prepare_secondary_mm()).

Finally, since the alternative framework needs to remap the Xen text and
inittext sections, this operation must be done in a coloring-aware way.
The function xen_remap_colored() is introduced for that.

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
v5:
- FIXME: consider_modules copy pasted since it got moved
v4:
- removed set_value_for_secondary() because it was wrongly cleaning cache
- relocate_xen() now calls switch_ttbr_id()
---
 xen/arch/arm/alternative.c              |   9 +-
 xen/arch/arm/arm64/mmu/head.S           |  48 +++++++
 xen/arch/arm/arm64/mmu/mm.c             |  26 +++-
 xen/arch/arm/include/asm/llc-coloring.h |  16 +++
 xen/arch/arm/include/asm/mm.h           |   7 +-
 xen/arch/arm/llc-coloring.c             |  44 +++++++
 xen/arch/arm/mmu/setup.c                |  82 +++++++++++-
 xen/arch/arm/mmu/smpboot.c              |  11 +-
 xen/arch/arm/psci.c                     |   9 +-
 xen/arch/arm/setup.c                    | 165 +++++++++++++++++++++++-
 xen/arch/arm/smpboot.c                  |   9 +-
 11 files changed, 406 insertions(+), 20 deletions(-)

diff --git a/xen/arch/arm/alternative.c b/xen/arch/arm/alternative.c
index 016e66978b..54cbc2afad 100644
--- a/xen/arch/arm/alternative.c
+++ b/xen/arch/arm/alternative.c
@@ -9,6 +9,7 @@
 #include <xen/init.h>
 #include <xen/types.h>
 #include <xen/kernel.h>
+#include <xen/llc-coloring.h>
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
 
diff --git a/xen/arch/arm/arm64/mmu/head.S b/xen/arch/arm/arm64/mmu/head.S
index 10774f30e4..6f0cc72897 100644
--- a/xen/arch/arm/arm64/mmu/head.S
+++ b/xen/arch/arm/arm64/mmu/head.S
@@ -419,6 +419,54 @@ fail:   PRINT("- Boot failed -\r\n")
         b     1b
 ENDPROC(fail)
 
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
diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
index d2651c9486..5a26d64ab7 100644
--- a/xen/arch/arm/arm64/mmu/mm.c
+++ b/xen/arch/arm/arm64/mmu/mm.c
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 
 #include <xen/init.h>
+#include <xen/llc-coloring.h>
 #include <xen/mm.h>
 #include <xen/pfn.h>
 
@@ -125,27 +126,44 @@ void update_identity_mapping(bool enable)
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
diff --git a/xen/arch/arm/include/asm/llc-coloring.h b/xen/arch/arm/include/asm/llc-coloring.h
index 5f9b0a8121..4d6071e50b 100644
--- a/xen/arch/arm/include/asm/llc-coloring.h
+++ b/xen/arch/arm/include/asm/llc-coloring.h
@@ -12,11 +12,27 @@
 #define __ASM_ARM_COLORING_H__
 
 #include <xen/init.h>
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
 
 bool __init llc_coloring_init(void);
 int dom0_set_llc_colors(struct domain *d);
 int domain_set_llc_colors_from_str(struct domain *d, const char *str);
 
+paddr_t xen_colored_map_size(paddr_t size);
+mfn_t xen_colored_mfn(mfn_t mfn);
+void *xen_remap_colored(mfn_t xen_fn, paddr_t xen_size);
+
 #endif /* __ASM_ARM_COLORING_H__ */
 
 /*
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 1829c559d6..311f092cf2 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -203,12 +203,17 @@ extern unsigned long frametable_base_pdx;
 
 #define PDX_GROUP_SHIFT SECOND_SHIFT
 
+#define virt_to_reloc_virt(virt) \
+    (((vaddr_t)virt) - XEN_VIRT_START + BOOT_RELOC_VIRT_START)
+
 /* Boot-time pagetable setup */
-extern void setup_pagetables(unsigned long boot_phys_offset);
+extern void setup_pagetables(unsigned long boot_phys_offset, paddr_t xen_paddr);
 /* Map FDT in boot pagetable */
 extern void *early_fdt_map(paddr_t fdt_paddr);
 /* Remove early mappings */
 extern void remove_early_mappings(void);
+/* Remove early LLC coloring mappings */
+extern void remove_llc_coloring_mappings(void);
 /* Prepare the memory subystem to bring-up the given secondary CPU */
 extern int prepare_secondary_mm(int cpu);
 /* Map a frame table to cover physical addresses ps through pe */
diff --git a/xen/arch/arm/llc-coloring.c b/xen/arch/arm/llc-coloring.c
index 99ea69ad39..f434efc45b 100644
--- a/xen/arch/arm/llc-coloring.c
+++ b/xen/arch/arm/llc-coloring.c
@@ -14,6 +14,7 @@
 #include <xen/llc-coloring.h>
 #include <xen/param.h>
 #include <xen/types.h>
+#include <xen/vmap.h>
 
 #include <asm/processor.h>
 #include <asm/sysregs.h>
@@ -38,6 +39,7 @@ static unsigned int __ro_after_init xen_num_colors;
 
 #define mfn_color_mask              (nr_colors - 1)
 #define mfn_to_color(mfn)           (mfn_x(mfn) & mfn_color_mask)
+#define mfn_set_color(mfn, color)   ((mfn_x(mfn) & ~mfn_color_mask) | (color))
 
 /*
  * Parse the coloring configuration given in the buf string, following the
@@ -354,6 +356,48 @@ unsigned int get_nr_llc_colors(void)
     return nr_colors;
 }
 
+paddr_t xen_colored_map_size(paddr_t size)
+{
+    return ROUNDUP(size * nr_colors, XEN_PADDR_ALIGN);
+}
+
+mfn_t xen_colored_mfn(mfn_t mfn)
+{
+    unsigned int i, color = mfn_to_color(mfn);
+
+    for( i = 0; i < xen_num_colors; i++ )
+    {
+        if ( color == xen_colors[i] )
+            return mfn;
+        else if ( color < xen_colors[i] )
+            return mfn_set_color(mfn, xen_colors[i]);
+    }
+
+    /* Jump to next color space (nr_colors mfns) and use the first color */
+    return mfn_set_color(mfn_add(mfn, nr_colors), xen_colors[0]);
+}
+
+void *xen_remap_colored(mfn_t xen_mfn, paddr_t xen_size)
+{
+    unsigned int i;
+    void *xenmap;
+    mfn_t *xen_colored_mfns;
+
+    xen_colored_mfns = xmalloc_array(mfn_t, xen_size >> PAGE_SHIFT);
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
diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
index 37b6d230ad..66b674eeab 100644
--- a/xen/arch/arm/mmu/setup.c
+++ b/xen/arch/arm/mmu/setup.c
@@ -7,6 +7,7 @@
 
 #include <xen/init.h>
 #include <xen/libfdt/libfdt.h>
+#include <xen/llc-coloring.h>
 #include <xen/sizes.h>
 #include <xen/vmap.h>
 
@@ -39,6 +40,10 @@ DEFINE_PER_CPU(lpae_t *, xen_pgtable);
 static DEFINE_PAGE_TABLE(cpu0_pgtable);
 #endif
 
+#ifdef CONFIG_LLC_COLORING
+static DEFINE_PAGE_TABLE(xen_colored_temp);
+#endif
+
 /* Common pagetable leaves */
 /* Second level page table used to cover Xen virtual address space */
 static DEFINE_PAGE_TABLE(xen_second);
@@ -130,7 +135,12 @@ static void __init __maybe_unused build_assertions(void)
 
 lpae_t __init pte_of_xenaddr(vaddr_t va)
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
@@ -216,11 +226,55 @@ static void xen_pt_enforce_wnx(void)
     flush_xen_tlb_local();
 }
 
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
 /*
- * Boot-time pagetable setup.
+ * Boot-time pagetable setup with coloring support
  * Changes here may need matching changes in head.S
+ *
+ * The coloring support consists of:
+ * - Create a temporary colored mapping that conforms to Xen color selection.
+ * - pte_of_xenaddr takes care of translating the virtual addresses to the
+ *   new colored physical space and the returns the pte, so that the page table
+ *   initialization can remain the same.
+ * - Copy Xen to the new colored physical space by exploiting the temporary
+ *   mapping.
+ * - Update TTBR0_EL2 with the new root page table address.
  */
-void __init setup_pagetables(unsigned long boot_phys_offset)
+
+void __init setup_pagetables(unsigned long boot_phys_offset, paddr_t xen_paddr)
 {
     uint64_t ttbr;
     lpae_t pte, *p;
@@ -228,6 +282,9 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
 
     phys_offset = boot_phys_offset;
 
+    if ( llc_coloring_enabled )
+        create_llc_coloring_mappings(xen_paddr);
+
     arch_setup_page_tables();
 
 #ifdef CONFIG_ARM_64
@@ -281,10 +338,13 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
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
@@ -294,6 +354,18 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
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
 
 void *__init arch_vmap_virt_end(void)
diff --git a/xen/arch/arm/mmu/smpboot.c b/xen/arch/arm/mmu/smpboot.c
index b6fc0aae07..a69183ec88 100644
--- a/xen/arch/arm/mmu/smpboot.c
+++ b/xen/arch/arm/mmu/smpboot.c
@@ -6,6 +6,7 @@
  */
 
 #include <xen/domain_page.h>
+#include <xen/llc-coloring.h>
 
 #include <asm/setup.h>
 
@@ -71,14 +72,20 @@ static void clear_boot_pagetables(void)
 #ifdef CONFIG_ARM_64
 int prepare_secondary_mm(int cpu)
 {
+    uint64_t *init_ttbr_addr = &init_ttbr;
+
     clear_boot_pagetables();
 
+    if ( llc_coloring_enabled )
+        init_ttbr_addr = (uint64_t *)virt_to_reloc_virt(&init_ttbr);
+
     /*
      * Set init_ttbr for this CPU coming up. All CPUs share a single setof
      * pagetables, but rewrite it each time for consistency with 32 bit.
      */
-    init_ttbr = virt_to_maddr(xen_pgtable);
-    clean_dcache(init_ttbr);
+    *init_ttbr_addr = virt_to_maddr(xen_pgtable);
+    clean_dcache(*init_ttbr_addr);
+
     return 0;
 }
 #else
diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
index 695d2fa1f1..23e298c477 100644
--- a/xen/arch/arm/psci.c
+++ b/xen/arch/arm/psci.c
@@ -11,6 +11,7 @@
 
 #include <xen/types.h>
 #include <xen/init.h>
+#include <xen/llc-coloring.h>
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
index 4c16b566db..ebbbf39477 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -545,6 +545,100 @@ static void * __init relocate_fdt(paddr_t dtb_paddr, size_t dtb_size)
     return fdt;
 }
 
+#ifdef CONFIG_LLC_COLORING
+/*
+ * Returns the end address of the highest region in the range s..e
+ * with required size and alignment that does not conflict with the
+ * modules from first_mod to nr_modules.
+ *
+ * For non-recursive callers first_mod should normally be 0 (all
+ * modules and Xen itself) or 1 (all modules but not Xen).
+ */
+static paddr_t __init consider_modules(paddr_t s, paddr_t e,
+                                       uint32_t size, paddr_t align,
+                                       int first_mod)
+{
+    const struct bootmodules *mi = &bootinfo.modules;
+    int i;
+    int nr;
+
+    s = (s+align-1) & ~(align-1);
+    e = e & ~(align-1);
+
+    if ( s > e ||  e - s < size )
+        return 0;
+
+    /* First check the boot modules */
+    for ( i = first_mod; i < mi->nr_mods; i++ )
+    {
+        paddr_t mod_s = mi->module[i].start;
+        paddr_t mod_e = mod_s + mi->module[i].size;
+
+        if ( s < mod_e && mod_s < e )
+        {
+            mod_e = consider_modules(mod_e, e, size, align, i+1);
+            if ( mod_e )
+                return mod_e;
+
+            return consider_modules(s, mod_s, size, align, i+1);
+        }
+    }
+
+    /* Now check any fdt reserved areas. */
+
+    nr = fdt_num_mem_rsv(device_tree_flattened);
+
+    for ( ; i < mi->nr_mods + nr; i++ )
+    {
+        paddr_t mod_s, mod_e;
+
+        if ( fdt_get_mem_rsv_paddr(device_tree_flattened,
+                                   i - mi->nr_mods,
+                                   &mod_s, &mod_e ) < 0 )
+            /* If we can't read it, pretend it doesn't exist... */
+            continue;
+
+        /* fdt_get_mem_rsv_paddr returns length */
+        mod_e += mod_s;
+
+        if ( s < mod_e && mod_s < e )
+        {
+            mod_e = consider_modules(mod_e, e, size, align, i+1);
+            if ( mod_e )
+                return mod_e;
+
+            return consider_modules(s, mod_s, size, align, i+1);
+        }
+    }
+
+    /*
+     * i is the current bootmodule we are evaluating, across all
+     * possible kinds of bootmodules.
+     *
+     * When retrieving the corresponding reserved-memory addresses, we
+     * need to index the bootinfo.reserved_mem bank starting from 0, and
+     * only counting the reserved-memory modules. Hence, we need to use
+     * i - nr.
+     */
+    nr += mi->nr_mods;
+    for ( ; i - nr < bootinfo.reserved_mem.nr_banks; i++ )
+    {
+        paddr_t r_s = bootinfo.reserved_mem.bank[i - nr].start;
+        paddr_t r_e = r_s + bootinfo.reserved_mem.bank[i - nr].size;
+
+        if ( s < r_e && r_s < e )
+        {
+            r_e = consider_modules(r_e, e, size, align, i + 1);
+            if ( r_e )
+                return r_e;
+
+            return consider_modules(s, r_s, size, align, i + 1);
+        }
+    }
+    return e;
+}
+#endif
+
 /*
  * Return the end of the non-module region starting at s. In other
  * words return s the start of the next modules after s.
@@ -579,6 +673,62 @@ static paddr_t __init next_module(paddr_t s, paddr_t *end)
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
 void __init init_pdx(void)
 {
     paddr_t bank_start, bank_size, bank_end;
@@ -724,8 +874,6 @@ void asmlinkage __init start_xen(unsigned long boot_phys_offset,
     /* Initialize traps early allow us to get backtrace when an error occurred */
     init_traps();
 
-    setup_pagetables(boot_phys_offset);
-
     smp_clear_cpu_maps();
 
     device_tree_flattened = early_fdt_map(fdt_paddr);
@@ -751,8 +899,13 @@ void asmlinkage __init start_xen(unsigned long boot_phys_offset,
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
@@ -867,6 +1020,14 @@ void asmlinkage __init start_xen(unsigned long boot_phys_offset,
 
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
index 7110bc11fc..7ed7357d58 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -14,6 +14,7 @@
 #include <xen/domain_page.h>
 #include <xen/errno.h>
 #include <xen/init.h>
+#include <xen/llc-coloring.h>
 #include <xen/mm.h>
 #include <xen/param.h>
 #include <xen/sched.h>
@@ -444,6 +445,7 @@ int __cpu_up(unsigned int cpu)
 {
     int rc;
     s_time_t deadline;
+    unsigned long *smp_up_cpu_addr = &smp_up_cpu;
 
     printk("Bringing up CPU%d\n", cpu);
 
@@ -459,9 +461,12 @@ int __cpu_up(unsigned int cpu)
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
 
-- 
2.34.1


