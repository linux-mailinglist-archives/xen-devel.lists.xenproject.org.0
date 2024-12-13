Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F4B9F122E
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 17:31:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856927.1269478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM8ZC-0002gl-Ly; Fri, 13 Dec 2024 16:31:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856927.1269478; Fri, 13 Dec 2024 16:31:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM8ZC-0002eK-J3; Fri, 13 Dec 2024 16:31:02 +0000
Received: by outflank-mailman (input) for mailman id 856927;
 Fri, 13 Dec 2024 16:31:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4bZM=TG=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tM8X2-0003wJ-0U
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 16:28:48 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52d6ee14-b96f-11ef-99a3-01e77a169b0f;
 Fri, 13 Dec 2024 17:28:45 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5d3e9f60bf4so3102557a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Dec 2024 08:28:45 -0800 (PST)
Received: from carlo-ubuntu.minervasys.tech ([193.207.202.156])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa673474d96sm841759266b.96.2024.12.13.08.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 08:28:44 -0800 (PST)
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
X-Inumbo-ID: 52d6ee14-b96f-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1734107325; x=1734712125; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Q+kUbuWvfsq5GAUn2XdzEBq7xjusccOT8RsDI7ZLrc=;
        b=ydHb4eKtl5GTBw66vJP/5ijH84fD7Irkevy2C4ufhU7EeNYhEd7UBzzVEW+JS31gKP
         /fw527CrQhV2PSBdF7xYFe5R5+nXHhq1it2Ze6q+qwzkMsG5m28UjTAps6ScDuJkvh2r
         nyfa/6Jduxt3wNdSexCpzoMQKIOH354eWH1e6EJNalXdFRcsCGEbFnLwOYLgNi0frGju
         1UzPqU96/7N655HW4PK17qFXbjtNU//cCr7fYERmk3IRqNX8VVAP2+HaRv+yRb0HTzOj
         ux+ZTjkKd7pAaLbNuztuKscAhJ3OfI/Nj52oy27hpbQs+9tTCVAlmBQOTD+Zg7F1JWjh
         ZB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734107325; x=1734712125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Q+kUbuWvfsq5GAUn2XdzEBq7xjusccOT8RsDI7ZLrc=;
        b=n45YOJ/w9qc8IYkcr5WWUcQ6nnlHNEyFeSYsydFnjOyTXuA2E+m+9+/ahCA/iD8pyz
         EgYF5sCCl8EWxEycVOYLTBvEHt7NMZbXHFDMb75JaPtgWb19yLYucUu31gC0oOWoK0FF
         Oxou+8sbfioqTbeOgAWEjKADH55+Y7rwBD+k/zh14VpGPARwTXZfBJ3D9O/nId81iAjy
         oebYda5YBMnVwA+V5gzift6DVqt2WQtpDZ318+FXOuQK96FkMjBIL072f2y4d0dYcfv2
         FvYOWUYBS5+MOD4FLTljknpiQ3AXUXrcF35H1GTQdVu21Q7R812SFAHOOm9YSVIbAITQ
         ilKQ==
X-Gm-Message-State: AOJu0Yx623k8lNXEZWuoDBpr9oAtu4ntnuoh++8xMvC8srKlBxUmYytz
	kcYLtRGfqIfDG4MJmPHdV6toOLVG9Wv8iEZAGIaV8qevp1Ef1Zytt9PIQZU4Wbih6U0hECJRyv7
	BxV8=
X-Gm-Gg: ASbGncvAE2Mx9v30LlQ2X0GwP6inDctAmpd4x/0UBwTK0XOe3GeFtUbgpzrB6bttHm4
	k7P88D3u4NP6y2fXGQpO2FwiytLL1HCmnWn8ppQdknyu57uu2e0d2rme5M8yt4QburssdAQVjD0
	Bi/2waVBf02nB8D2ZhdaCNZ2VIdSfaSSvPTBIuJoB2t9O037fWaSD5f+7Q1zzfOKBmrrLIJpGK2
	JBC1dYbuzelyqvnX9OWPMd8gdTs5nAjYaWhA66afvia6oc3tV5Egm5QpuRipGFM0Sea5iWM0xpA
	lI9We7p6rPO9XrcH
X-Google-Smtp-Source: AGHT+IFM0tJWCl6LcCDR4DhR2PBYBdW1jgcaoSKtUxaX17DXIlCa2d0TLtlhZff3UoUbU3NCbBPfJw==
X-Received: by 2002:a17:907:1c0b:b0:aa6:7c36:3423 with SMTP id a640c23a62f3a-aab778bf059mr297768166b.1.1734107324628;
        Fri, 13 Dec 2024 08:28:44 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	marco.solieri@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v12 12/12] xen/arm: add cache coloring support for Xen image
Date: Fri, 13 Dec 2024 17:28:15 +0100
Message-ID: <20241213162815.9196-13-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241213162815.9196-1-carlo.nonato@minervasys.tech>
References: <20241213162815.9196-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xen image is relocated to a new colored physical space. Some relocation
functionalities must be brought back:
- the virtual address of the new space is taken from 0c18fb76323b
  ("xen/arm: Remove unused BOOT_RELOC_VIRT_START").
- relocate_xen() and get_xen_paddr() are taken from f60658c6ae47
  ("xen/arm: Stop relocating Xen").

setup_pagetables() must be adapted for coloring and for relocation. Runtime
page tables are used to map the colored space, but they are also linked in
boot tables so that the new space is temporarily available for relocation.
This implies that Xen protection must happen after the copy.

Finally, since the alternative framework needs to remap the Xen text and
inittext sections, this operation must be done in a coloring-aware way.
The function xen_remap_colored() is introduced for that.

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
Reviewed-by: Jan Beulich <jbeulich@suse.com> # common
---
v12:
- FUNC instead of ENTRY in head.S for relocate_xen
- dc cvau instead of dc cvav in relocate_xen()
- added relocate_and_switch_ttbr() to make setup_pagetables() code more clear
v11:
- else if -> if in xen_colored_mfn()
v10:
- no changes
v9:
- patch adapted to changes to setup_pagetables()
v8:
- moved xen_colored_map_size() to arm/llc-coloring.c
v7:
- added BUG_ON() checks to arch_llc_coloring_init() and
  create_llc_coloring_mappings()
v6:
- squashed with BOOT_RELOC_VIRT_START patch
- consider_modules() moved in another patch
- removed psci and smpboot code because of new idmap work already handles that
- moved xen_remap_colored() in alternative.c since it's only used there
- removed xen_colored_temp[] in favor of xen_xenmap[] usage for mapping
- use of boot_module_find_by_kind() to remove the need of extra parameter in
  setup_pagetables()
- moved get_xen_paddr() in arm/llc-coloring.c since it's only used there
v5:
- FIXME: consider_modules copy pasted since it got moved
v4:
- removed set_value_for_secondary() because it was wrongly cleaning cache
- relocate_xen() now calls switch_ttbr_id()
---
 xen/arch/arm/alternative.c            |  26 ++++++-
 xen/arch/arm/arm64/mmu/head.S         |  58 ++++++++++++++-
 xen/arch/arm/arm64/mmu/mm.c           |  29 ++++++++
 xen/arch/arm/include/asm/mmu/layout.h |   3 +
 xen/arch/arm/include/asm/mmu/mm.h     |   1 +
 xen/arch/arm/llc-coloring.c           |  63 ++++++++++++++++
 xen/arch/arm/mmu/setup.c              | 103 ++++++++++++++++++++++----
 xen/arch/arm/setup.c                  |  10 ++-
 xen/common/llc-coloring.c             |  18 +++++
 xen/include/xen/llc-coloring.h        |  13 ++++
 10 files changed, 304 insertions(+), 20 deletions(-)

diff --git a/xen/arch/arm/alternative.c b/xen/arch/arm/alternative.c
index fec7dbd2cd..2c1af6e7e4 100644
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
@@ -191,6 +192,25 @@ static int __apply_alternatives_multi_stop(void *xenmap)
     return 0;
 }
 
+static void __init *xen_remap_colored(mfn_t xen_mfn, paddr_t xen_size)
+{
+    unsigned int i;
+    void *xenmap;
+    mfn_t *xen_colored_mfns, mfn;
+
+    xen_colored_mfns = xmalloc_array(mfn_t, xen_size >> PAGE_SHIFT);
+    if ( !xen_colored_mfns )
+        panic("Can't allocate LLC colored MFNs\n");
+
+    for_each_xen_colored_mfn ( xen_mfn, mfn, i )
+        xen_colored_mfns[i] = mfn;
+
+    xenmap = vmap(xen_colored_mfns, xen_size >> PAGE_SHIFT);
+    xfree(xen_colored_mfns);
+
+    return xenmap;
+}
+
 /*
  * This function should only be called during boot and before CPU0 jump
  * into the idle_loop.
@@ -209,7 +229,11 @@ void __init apply_alternatives_all(void)
      * The text and inittext section are read-only. So re-map Xen to
      * be able to patch the code.
      */
-    xenmap = vmap_contig(xen_mfn, 1U << xen_order);
+    if ( llc_coloring_enabled )
+        xenmap = xen_remap_colored(xen_mfn, xen_size);
+    else
+        xenmap = vmap_contig(xen_mfn, 1U << xen_order);
+
     /* Re-mapping Xen is not expected to fail during boot. */
     BUG_ON(!xenmap);
 
diff --git a/xen/arch/arm/arm64/mmu/head.S b/xen/arch/arm/arm64/mmu/head.S
index 665a51a337..634156f83d 100644
--- a/xen/arch/arm/arm64/mmu/head.S
+++ b/xen/arch/arm/arm64/mmu/head.S
@@ -428,6 +428,61 @@ FUNC_LOCAL(fail)
         b     1b
 END(fail)
 
+/*
+ * Copy Xen to new location and switch TTBR
+ * x0    ttbr
+ * x1    source address
+ * x2    destination address
+ * x3    length
+ *
+ * Source and destination must be word aligned, length is rounded up
+ * to a 16 byte boundary.
+ *
+ * MUST BE VERY CAREFUL when saving things to RAM over the copy
+ */
+FUNC(relocate_xen)
+        /*
+         * Copy 16 bytes at a time using:
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
+        /*
+         * Flush destination from dcache using:
+         *   x9: counter
+         *   x10: step
+         *   x11: vaddr
+         *
+         * This is to ensure data is visible to the instruction cache
+         */
+        dsb   sy
+
+        mov   x9, x3
+        ldr   x10, =dcache_line_bytes /* x10 := step */
+        ldr   x10, [x10]
+        mov   x11, x2
+
+1:      dc    cvau, x11
+
+        add   x11, x11, x10
+        subs  x9, x9, x10
+        bgt   1b
+
+        /* No need for dsb/isb because they are alredy done in switch_ttbr_id */
+        b switch_ttbr_id
+
 /*
  * Switch TTBR
  *
@@ -453,7 +508,8 @@ FUNC(switch_ttbr_id)
 
         /*
          * 5) Flush I-cache
-         * This should not be necessary but it is kept for safety.
+         * This should not be necessary in the general case, but it's needed
+         * for cache coloring because code is relocated in that case.
          */
         ic     iallu
         isb
diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
index 671eaadbc1..f1f2543902 100644
--- a/xen/arch/arm/arm64/mmu/mm.c
+++ b/xen/arch/arm/arm64/mmu/mm.c
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
 #include <xen/init.h>
+#include <xen/llc-coloring.h>
 #include <xen/mm.h>
 #include <xen/pfn.h>
 
@@ -138,8 +139,36 @@ void update_boot_mapping(bool enable)
 }
 
 extern void switch_ttbr_id(uint64_t ttbr);
+extern void relocate_xen(uint64_t ttbr, void *src, void *dst, size_t len);
 
 typedef void (switch_ttbr_fn)(uint64_t ttbr);
+typedef void (relocate_xen_fn)(uint64_t ttbr, void *src, void *dst, size_t len);
+
+void __init relocate_and_switch_ttbr(uint64_t ttbr) {
+    vaddr_t id_addr = virt_to_maddr(relocate_xen);
+    relocate_xen_fn *fn = (relocate_xen_fn *)id_addr;
+    lpae_t pte;
+
+    /* Enable the identity mapping in the boot page tables */
+    update_identity_mapping(true);
+
+    /* Enable the identity mapping in the runtime page tables */
+    pte = pte_of_xenaddr((vaddr_t)relocate_xen);
+    pte.pt.table = 1;
+    pte.pt.xn = 0;
+    pte.pt.ro = 1;
+    write_pte(&xen_third_id[third_table_offset(id_addr)], pte);
+
+    /* Relocate Xen and switch TTBR */
+    fn(ttbr, _start, (void *)BOOT_RELOC_VIRT_START, _end - _start);
+
+    /*
+     * Disable the identity mapping in the runtime page tables.
+     * Note it is not necessary to disable it in the boot page tables
+     * because they are not going to be used by this CPU anymore.
+     */
+    update_identity_mapping(false);
+}
 
 void __init switch_ttbr(uint64_t ttbr)
 {
diff --git a/xen/arch/arm/include/asm/mmu/layout.h b/xen/arch/arm/include/asm/mmu/layout.h
index a3b546465b..19c0ec63a5 100644
--- a/xen/arch/arm/include/asm/mmu/layout.h
+++ b/xen/arch/arm/include/asm/mmu/layout.h
@@ -30,6 +30,7 @@
  *  10M -  12M   Fixmap: special-purpose 4K mapping slots
  *  12M -  16M   Early boot mapping of FDT
  *  16M -  18M   Livepatch vmap (if compiled in)
+ *  16M -  24M   Cache-colored Xen text, data, bss (temporary, if compiled in)
  *
  *   1G -   2G   VMAP: ioremap and early_ioremap
  *
@@ -74,6 +75,8 @@
 #define BOOT_FDT_VIRT_START     (FIXMAP_VIRT_START + FIXMAP_VIRT_SIZE)
 #define BOOT_FDT_VIRT_SIZE      _AT(vaddr_t, MB(4))
 
+#define BOOT_RELOC_VIRT_START   (BOOT_FDT_VIRT_START + BOOT_FDT_VIRT_SIZE)
+
 #ifdef CONFIG_LIVEPATCH
 #define LIVEPATCH_VMAP_START    (BOOT_FDT_VIRT_START + BOOT_FDT_VIRT_SIZE)
 #define LIVEPATCH_VMAP_SIZE    _AT(vaddr_t, MB(2))
diff --git a/xen/arch/arm/include/asm/mmu/mm.h b/xen/arch/arm/include/asm/mmu/mm.h
index c5e03a66bf..f5a00558c4 100644
--- a/xen/arch/arm/include/asm/mmu/mm.h
+++ b/xen/arch/arm/include/asm/mmu/mm.h
@@ -31,6 +31,7 @@ void dump_pt_walk(paddr_t ttbr, paddr_t addr,
 
 /* Switch to a new root page-tables */
 extern void switch_ttbr(uint64_t ttbr);
+extern void relocate_and_switch_ttbr(uint64_t ttbr);
 
 #endif /* __ARM_MMU_MM_H__ */
 
diff --git a/xen/arch/arm/llc-coloring.c b/xen/arch/arm/llc-coloring.c
index 1c7b92bc45..7cb4ecb50e 100644
--- a/xen/arch/arm/llc-coloring.c
+++ b/xen/arch/arm/llc-coloring.c
@@ -9,6 +9,7 @@
 #include <xen/llc-coloring.h>
 
 #include <asm/processor.h>
+#include <asm/setup.h>
 #include <asm/sysregs.h>
 #include <asm/system.h>
 
@@ -64,8 +65,70 @@ unsigned int __init get_llc_way_size(void)
     return line_size * num_sets;
 }
 
+/**
+ * get_xen_paddr - get physical address to relocate Xen to
+ *
+ * Xen is relocated to as near to the top of RAM as possible and
+ * aligned to a XEN_PADDR_ALIGN boundary.
+ */
+static paddr_t __init get_xen_paddr(paddr_t xen_size)
+{
+    const struct membanks *mem = bootinfo_get_mem();
+    paddr_t min_size, paddr = 0;
+    unsigned int i;
+
+    min_size = ROUNDUP(xen_size, XEN_PADDR_ALIGN);
+
+    /* Find the highest bank with enough space. */
+    for ( i = 0; i < mem->nr_banks; i++ )
+    {
+        const struct membank *bank = &mem->bank[i];
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
+            if ( e > GB(4) )
+                e = GB(4);
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
+
+static paddr_t __init xen_colored_map_size(void)
+{
+    return ROUNDUP((_end - _start) * get_max_nr_llc_colors(), XEN_PADDR_ALIGN);
+}
+
 void __init arch_llc_coloring_init(void)
 {
+    struct bootmodule *xen_bootmodule = boot_module_find_by_kind(BOOTMOD_XEN);
+
+    BUG_ON(!xen_bootmodule);
+
+    xen_bootmodule->size = xen_colored_map_size();
+    xen_bootmodule->start = get_xen_paddr(xen_bootmodule->size);
 }
 
 /*
diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
index 196974f3e2..073f762a32 100644
--- a/xen/arch/arm/mmu/setup.c
+++ b/xen/arch/arm/mmu/setup.c
@@ -7,6 +7,7 @@
 
 #include <xen/init.h>
 #include <xen/libfdt/libfdt.h>
+#include <xen/llc-coloring.h>
 #include <xen/sections.h>
 #include <xen/sizes.h>
 #include <xen/vmap.h>
@@ -20,6 +21,9 @@
 #undef virt_to_mfn
 #define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
 
+#define virt_to_reloc_virt(virt) \
+    (((vaddr_t)virt) - XEN_VIRT_START + BOOT_RELOC_VIRT_START)
+
 /* Main runtime page tables */
 
 /*
@@ -69,6 +73,7 @@ static void __init __maybe_unused build_assertions(void)
     /* 2MB aligned regions */
     BUILD_BUG_ON(XEN_VIRT_START & ~SECOND_MASK);
     BUILD_BUG_ON(FIXMAP_ADDR(0) & ~SECOND_MASK);
+    BUILD_BUG_ON(BOOT_RELOC_VIRT_START & ~SECOND_MASK);
     /* 1GB aligned regions */
 #ifdef CONFIG_ARM_32
     BUILD_BUG_ON(XENHEAP_VIRT_START & ~FIRST_MASK);
@@ -138,6 +143,9 @@ static void __init __maybe_unused build_assertions(void)
 
 lpae_t __init pte_of_xenaddr(vaddr_t va)
 {
+    if ( llc_coloring_enabled )
+        va = virt_to_reloc_virt(va);
+
     return mfn_to_xen_entry(virt_to_mfn(va), MT_NORMAL);
 }
 
@@ -316,6 +324,32 @@ paddr_t __init consider_modules(paddr_t s, paddr_t e,
     return e;
 }
 
+static void __init create_llc_coloring_mappings(void)
+{
+    lpae_t pte;
+    unsigned int i;
+    struct bootmodule *xen_bootmodule = boot_module_find_by_kind(BOOTMOD_XEN);
+    mfn_t start_mfn = maddr_to_mfn(xen_bootmodule->start), mfn;
+
+    for_each_xen_colored_mfn ( start_mfn, mfn, i )
+    {
+        pte = mfn_to_xen_entry(mfn, MT_NORMAL);
+        pte.pt.table = 1; /* level 3 mappings always have this bit set */
+        xen_xenmap[i] = pte;
+    }
+
+    for ( i = 0; i < XEN_NR_ENTRIES(2); i++ )
+    {
+        vaddr_t va = BOOT_RELOC_VIRT_START + (i << XEN_PT_LEVEL_SHIFT(2));
+
+        pte = mfn_to_xen_entry(virt_to_mfn(xen_xenmap +
+                                           i * XEN_PT_LPAE_ENTRIES),
+                               MT_NORMAL);
+        pte.pt.table = 1;
+        write_pte(&boot_second[second_table_offset(va)], pte);
+    }
+}
+
 /*
  * Boot-time pagetable setup.
  * Changes here may need matching changes in head.S
@@ -326,6 +360,14 @@ void __init setup_pagetables(void)
     lpae_t pte, *p;
     int i;
 
+    /*
+     * In case of cache coloring, map the new physical space in the boot page
+     * tables. From now on, pte_of_xenaddr() will translate addresses to this
+     * new space.
+     */
+    if ( llc_coloring_enabled )
+        create_llc_coloring_mappings();
+
     arch_setup_page_tables();
 
 #ifdef CONFIG_ARM_64
@@ -353,13 +395,7 @@ void __init setup_pagetables(void)
             break;
         pte = pte_of_xenaddr(va);
         pte.pt.table = 1; /* third level mappings always have this bit set */
-        if ( is_kernel_text(va) || is_kernel_inittext(va) )
-        {
-            pte.pt.xn = 0;
-            pte.pt.ro = 1;
-        }
-        if ( is_kernel_rodata(va) )
-            pte.pt.ro = 1;
+        pte.pt.xn = 0; /* Permissions will be enforced later. Allow execution */
         xen_xenmap[i] = pte;
     }
 
@@ -379,19 +415,54 @@ void __init setup_pagetables(void)
     pte.pt.table = 1;
     xen_second[second_table_offset(FIXMAP_ADDR(0))] = pte;
 
-#ifdef CONFIG_ARM_64
-    ttbr = virt_to_maddr(xen_pgtable);
-#else
-    ttbr = virt_to_maddr(cpu0_pgtable);
+#ifdef CONFIG_ARM_32
+    per_cpu(xen_pgtable, 0) = cpu0_pgtable;
 #endif
 
-    switch_ttbr(ttbr);
+    if ( llc_coloring_enabled ) {
+        ttbr = virt_to_maddr(virt_to_reloc_virt(THIS_CPU_PGTABLE));
+        relocate_and_switch_ttbr(ttbr);
+    }
+    else {
+        ttbr = virt_to_maddr(THIS_CPU_PGTABLE);
+        switch_ttbr(ttbr);
+    }
 
-    xen_pt_enforce_wnx();
+    /* Protect Xen */
+    for ( i = 0; i < XEN_NR_ENTRIES(3); i++ )
+    {
+        vaddr_t va = XEN_VIRT_START + (i << PAGE_SHIFT);
+        lpae_t *entry = xen_xenmap + i;
 
-#ifdef CONFIG_ARM_32
-    per_cpu(xen_pgtable, 0) = cpu0_pgtable;
-#endif
+        if ( !is_kernel(va) )
+            break;
+
+        pte = read_atomic(entry);
+
+        if ( is_kernel_text(va) || is_kernel_inittext(va) )
+        {
+            pte.pt.xn = 0;
+            pte.pt.ro = 1;
+        }
+        else if ( is_kernel_rodata(va) ) {
+            pte.pt.ro = 1;
+            pte.pt.xn = 1;
+        }
+        else {
+            pte.pt.xn = 1;
+            pte.pt.ro = 0;
+        }
+
+        write_pte(entry, pte);
+    }
+
+    /*
+     * We modified live page-tables. Ensure the TLBs are invalidated
+     * before setting enforcing the WnX permissions.
+     */
+    flush_xen_tlb_local();
+
+    xen_pt_enforce_wnx();
 }
 
 void *__init arch_vmap_virt_end(void)
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 568a49b274..5e2c519ce8 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -304,8 +304,6 @@ void asmlinkage __init start_xen(unsigned long fdt_paddr)
     /* Initialize traps early allow us to get backtrace when an error occurred */
     init_traps();
 
-    setup_pagetables();
-
     smp_clear_cpu_maps();
 
     device_tree_flattened = early_fdt_map(fdt_paddr);
@@ -329,6 +327,14 @@ void asmlinkage __init start_xen(unsigned long fdt_paddr)
 
     llc_coloring_init();
 
+    /*
+     * Page tables must be setup after LLC coloring initialization because
+     * coloring info are required in order to create colored mappings
+     */
+    setup_pagetables();
+    /* Device-tree was mapped in boot page tables, remap it in the new tables */
+    device_tree_flattened = early_fdt_map(fdt_paddr);
+
     setup_mm();
 
     vm_init();
diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
index ff4837fcc6..545d8b49e8 100644
--- a/xen/common/llc-coloring.c
+++ b/xen/common/llc-coloring.c
@@ -42,6 +42,8 @@ static unsigned int __ro_after_init xen_num_colors;
 
 #define mfn_color_mask              (max_nr_colors - 1)
 #define mfn_to_color(mfn)           (mfn_x(mfn) & mfn_color_mask)
+#define get_mfn_with_color(mfn, color) \
+    (_mfn((mfn_x(mfn) & ~mfn_color_mask) | (color)))
 
 /*
  * Parse the coloring configuration given in the buf string, following the
@@ -364,6 +366,22 @@ unsigned int get_max_nr_llc_colors(void)
     return max_nr_colors;
 }
 
+mfn_t __init xen_colored_mfn(mfn_t mfn)
+{
+    unsigned int i, color = mfn_to_color(mfn);
+
+    for ( i = 0; i < xen_num_colors; i++ )
+    {
+        if ( color == xen_colors[i] )
+            return mfn;
+        if ( color < xen_colors[i] )
+            return get_mfn_with_color(mfn, xen_colors[i]);
+    }
+
+    /* Jump to next color space (max_nr_colors mfns) and use the first color */
+    return get_mfn_with_color(mfn_add(mfn, max_nr_colors), xen_colors[0]);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/xen/llc-coloring.h b/xen/include/xen/llc-coloring.h
index 1216d1fbd4..30c8a1d9a6 100644
--- a/xen/include/xen/llc-coloring.h
+++ b/xen/include/xen/llc-coloring.h
@@ -8,6 +8,7 @@
 #ifndef __XEN_LLC_COLORING_H__
 #define __XEN_LLC_COLORING_H__
 
+#include <xen/mm-frame.h>
 #include <xen/types.h>
 
 struct domain;
@@ -30,6 +31,17 @@ static inline void domain_dump_llc_colors(const struct domain *d) {}
 static inline void domain_llc_coloring_free(struct domain *d) {}
 #endif
 
+/**
+ * Iterate over each Xen mfn in the colored space.
+ * @start_mfn:  the first mfn that needs to be colored.
+ * @mfn:        the current mfn.
+ * @i:          loop index.
+ */
+#define for_each_xen_colored_mfn(start_mfn, mfn, i) \
+    for ( i = 0, mfn = xen_colored_mfn(start_mfn);  \
+          i < (_end - _start) >> PAGE_SHIFT;        \
+          i++, mfn = xen_colored_mfn(mfn_add(mfn, 1)) )
+
 unsigned int get_llc_way_size(void);
 void arch_llc_coloring_init(void);
 int dom0_set_llc_colors(struct domain *d);
@@ -38,6 +50,7 @@ int domain_set_llc_colors(struct domain *d,
 int domain_set_llc_colors_from_str(struct domain *d, const char *str);
 unsigned int page_to_llc_color(const struct page_info *pg);
 unsigned int get_max_nr_llc_colors(void);
+mfn_t xen_colored_mfn(mfn_t mfn);
 
 #endif /* __XEN_LLC_COLORING_H__ */
 
-- 
2.43.0


