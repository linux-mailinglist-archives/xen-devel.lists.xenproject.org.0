Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 964F9840EEC
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jan 2024 18:20:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673075.1047347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUVIF-0000n2-Be; Mon, 29 Jan 2024 17:19:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673075.1047347; Mon, 29 Jan 2024 17:19:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUVIE-0000WX-PS; Mon, 29 Jan 2024 17:19:34 +0000
Received: by outflank-mailman (input) for mailman id 673075;
 Mon, 29 Jan 2024 17:19:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vh+I=JH=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rUVIB-0005vY-O9
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2024 17:19:31 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 900c0e81-beca-11ee-8a43-1f161083a0e0;
 Mon, 29 Jan 2024 18:19:30 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-55a5e7fa471so2925527a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jan 2024 09:19:30 -0800 (PST)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 eo15-20020a056402530f00b005598ec568dbsm3970494edb.59.2024.01.29.09.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 09:19:29 -0800 (PST)
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
X-Inumbo-ID: 900c0e81-beca-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1706548770; x=1707153570; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0I5n9NCJphRrFbEL84vyCPUVcS0YQhAxUDqpEr89QQ8=;
        b=v51o/lv52+2ctSV5+aCTYifHDAsB7S/QxwUfHkH6EVZfAG+oTNAhKB4xPX0pwJHxJB
         wqaywQk8Nosb1xBG8M76CcErI0LQV0qzKRYUAYGsd3q2TtZxGC+mMal29rb9pF+jQIAG
         I6Hkin7pk2XF0sV0DOnZWGRGXtULv1Z9uYd9C/z1DI2MJAlr6aqiYc77Abpm+hRYdaV6
         GZVglGgEEepz37Z7kVpeogs42eerai9X7XEynPpz5Fw9if82oC5JtsGyilLmwWCJ0yuP
         KgrDrF+0SCtnPjzAdGy745bIkRDCzIWDZXr6Y1/ngV2aQMZ/AOyxv/T3ppwy7OXKw4+j
         RlpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706548770; x=1707153570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0I5n9NCJphRrFbEL84vyCPUVcS0YQhAxUDqpEr89QQ8=;
        b=u63owWfXTh14Yk9j36OAjdAqKnVds1TGUgX/9lGpJC+IBiu0VWZRyYd/6mp8KEF0ZU
         QI5yY/kvZGOUJLvfibir8VJrSDRiNwJVhdsQzku8EGeG5q7wjzgEueHAvOmZheQt9DmM
         w9Kh0XaT7IC/dDsJ6DrunmbHfkg/ic7Q00yan4rc8QS5IoTRoLYV0vgiAZZn559Lgmex
         LqAvHNO0pG710/Y24HMeIfpUKjjnfHcUHgsxUHFv9vZzS9GXSRZuE25dX9j50E4fEpRi
         NvNXgK/+uIB21jIebMJYvvvJif3UG9FItPe1CHgZymoEzH8ZEQeXMi1P9Dua2iKO9n7V
         /pHw==
X-Gm-Message-State: AOJu0YxylS5PbW2DI/27KgHouduSqMs9O7Ms+32vBj936hVUacfnGHcs
	ZlNpG68jqWqSqJXahgbFbxHJrrYuBGp1snJJuxeRGqIeVg4Zqn7++MeJVuRcQNhuuRHe5roKWI5
	SFyU=
X-Google-Smtp-Source: AGHT+IHlr451d+Zr7M9dKVnd80bpeZnjzImUXU9tmZOircuhovcZ785ez6CzE5coA4U5vM07nTHhmA==
X-Received: by 2002:a05:6402:2692:b0:55c:7aa7:53a9 with SMTP id w18-20020a056402269200b0055c7aa753a9mr5133927edd.5.1706548769838;
        Mon, 29 Jan 2024 09:19:29 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH v6 14/15] xen/arm: add cache coloring support for Xen
Date: Mon, 29 Jan 2024 18:18:10 +0100
Message-Id: <20240129171811.21382-15-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the cache coloring support for Xen physical space.

Since Xen must be relocated to a new physical space, some relocation
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
---
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
 xen/arch/arm/alternative.c            | 30 ++++++++-
 xen/arch/arm/arm64/mmu/head.S         | 57 +++++++++++++++-
 xen/arch/arm/arm64/mmu/mm.c           | 28 ++++++--
 xen/arch/arm/include/asm/mmu/layout.h |  3 +
 xen/arch/arm/llc-coloring.c           | 61 ++++++++++++++++-
 xen/arch/arm/mmu/setup.c              | 97 ++++++++++++++++++++++++---
 xen/arch/arm/setup.c                  |  5 +-
 xen/common/llc-coloring.c             | 23 +++++++
 xen/include/xen/llc-coloring.h        | 14 ++++
 9 files changed, 299 insertions(+), 19 deletions(-)

diff --git a/xen/arch/arm/alternative.c b/xen/arch/arm/alternative.c
index 016e66978b..a6b0794d80 100644
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
@@ -191,6 +192,27 @@ static int __apply_alternatives_multi_stop(void *xenmap)
     return 0;
 }
 
+static void __init *xen_remap_colored(mfn_t xen_mfn, paddr_t xen_size)
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
  * This function should only be called during boot and before CPU0 jump
  * into the idle_loop.
@@ -209,8 +231,12 @@ void __init apply_alternatives_all(void)
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
index fa40b696dd..7926849ab1 100644
--- a/xen/arch/arm/arm64/mmu/head.S
+++ b/xen/arch/arm/arm64/mmu/head.S
@@ -427,6 +427,60 @@ fail:   PRINT("- Boot failed -\r\n")
         b     1b
 ENDPROC(fail)
 
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
+ENTRY(relocate_xen)
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
@@ -452,7 +506,8 @@ ENTRY(switch_ttbr_id)
 
         /*
          * 5) Flush I-cache
-         * This should not be necessary but it is kept for safety.
+         * This should not be necessary in the general case, but it's needed
+         * for cache coloring because in that case code is relocated.
          */
         ic     iallu
         isb
diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
index d2651c9486..07cf8040a2 100644
--- a/xen/arch/arm/arm64/mmu/mm.c
+++ b/xen/arch/arm/arm64/mmu/mm.c
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 
 #include <xen/init.h>
+#include <xen/llc-coloring.h>
 #include <xen/mm.h>
 #include <xen/pfn.h>
 
@@ -125,27 +126,46 @@ void update_identity_mapping(bool enable)
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
+
+        fn(ttbr, _start, (void *)BOOT_RELOC_VIRT_START, _end - _start);
+    }
+    else
+    {
+        switch_ttbr_fn *fn = (switch_ttbr_fn *)id_addr;
+
+        fn(ttbr);
+    }
 
     /*
      * Disable the identity mapping in the runtime page tables.
diff --git a/xen/arch/arm/include/asm/mmu/layout.h b/xen/arch/arm/include/asm/mmu/layout.h
index a3b546465b..7228c9fb82 100644
--- a/xen/arch/arm/include/asm/mmu/layout.h
+++ b/xen/arch/arm/include/asm/mmu/layout.h
@@ -30,6 +30,7 @@
  *  10M -  12M   Fixmap: special-purpose 4K mapping slots
  *  12M -  16M   Early boot mapping of FDT
  *  16M -  18M   Livepatch vmap (if compiled in)
+ *  16M -  22M   Cache-colored Xen text, data, bss (temporary, if compiled in)
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
diff --git a/xen/arch/arm/llc-coloring.c b/xen/arch/arm/llc-coloring.c
index eee1e80e2d..bbb39214a8 100644
--- a/xen/arch/arm/llc-coloring.c
+++ b/xen/arch/arm/llc-coloring.c
@@ -9,6 +9,7 @@
 
 #include <asm/processor.h>
 #include <asm/sysregs.h>
+#include <asm/setup.h>
 
 /* Return the LLC way size by probing the hardware */
 unsigned int __init get_llc_way_size(void)
@@ -62,7 +63,65 @@ unsigned int __init get_llc_way_size(void)
     return line_size * num_sets;
 }
 
-void __init arch_llc_coloring_init(void) {}
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
+
+void __init arch_llc_coloring_init(void)
+{
+    struct bootmodule *xen_bootmodule = boot_module_find_by_kind(BOOTMOD_XEN);
+
+    xen_bootmodule->size = xen_colored_map_size();
+    xen_bootmodule->start = get_xen_paddr(xen_bootmodule->size);
+}
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
index 72725840b6..f3e4f6c304 100644
--- a/xen/arch/arm/mmu/setup.c
+++ b/xen/arch/arm/mmu/setup.c
@@ -7,6 +7,7 @@
 
 #include <xen/init.h>
 #include <xen/libfdt/libfdt.h>
+#include <xen/llc-coloring.h>
 #include <xen/sizes.h>
 #include <xen/vmap.h>
 
@@ -15,6 +16,11 @@
 /* Override macros from asm/page.h to make them work with mfn_t */
 #undef mfn_to_virt
 #define mfn_to_virt(mfn) __mfn_to_virt(mfn_x(mfn))
+#undef virt_to_mfn
+#define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
+
+#define virt_to_reloc_virt(virt) \
+    (((vaddr_t)virt) - XEN_VIRT_START + BOOT_RELOC_VIRT_START)
 
 /* Main runtime page tables */
 
@@ -69,6 +75,7 @@ static void __init __maybe_unused build_assertions(void)
     /* 2MB aligned regions */
     BUILD_BUG_ON(XEN_VIRT_START & ~SECOND_MASK);
     BUILD_BUG_ON(FIXMAP_ADDR(0) & ~SECOND_MASK);
+    BUILD_BUG_ON(BOOT_RELOC_VIRT_START & ~SECOND_MASK);
     /* 1GB aligned regions */
 #ifdef CONFIG_ARM_32
     BUILD_BUG_ON(XENHEAP_VIRT_START & ~FIRST_MASK);
@@ -132,7 +139,12 @@ static void __init __maybe_unused build_assertions(void)
 
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
@@ -218,9 +230,44 @@ static void xen_pt_enforce_wnx(void)
     flush_xen_tlb_local();
 }
 
+static void __init create_llc_coloring_mappings(void)
+{
+    lpae_t pte;
+    unsigned int i;
+    struct bootmodule *xen_bootmodule = boot_module_find_by_kind(BOOTMOD_XEN);
+    mfn_t mfn = maddr_to_mfn(xen_bootmodule->start);
+
+    for_each_xen_colored_mfn( mfn, i )
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
- * Boot-time pagetable setup.
+ * Boot-time pagetable setup with coloring support
  * Changes here may need matching changes in head.S
+ *
+ * The cache coloring support consists of:
+ * - Create colored mapping that conforms to Xen color selection in xen_xenmap[]
+ * - Link the mapping in boot page tables using BOOT_RELOC_VIRT_START as vaddr
+ * - pte_of_xenaddr() takes care of translating addresses to the new space
+ *   during runtime page tables creation
+ * - Relocate xen and update TTBR with the new address in the colored space
+ *   (see switch_ttbr())
+ * - Protect the new space
  */
 void __init setup_pagetables(unsigned long boot_phys_offset)
 {
@@ -230,6 +277,9 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
 
     phys_offset = boot_phys_offset;
 
+    if ( llc_coloring_enabled )
+        create_llc_coloring_mappings();
+
     arch_setup_page_tables();
 
 #ifdef CONFIG_ARM_64
@@ -257,13 +307,7 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
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
 
@@ -289,8 +333,43 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
     ttbr = (uintptr_t) cpu0_pgtable + phys_offset;
 #endif
 
+    if ( llc_coloring_enabled )
+        ttbr = virt_to_maddr(virt_to_reloc_virt(THIS_CPU_PGTABLE));
+
     switch_ttbr(ttbr);
 
+    /* Protect Xen */
+    for ( i = 0; i < XEN_NR_ENTRIES(3); i++ )
+    {
+        vaddr_t va = XEN_VIRT_START + (i << PAGE_SHIFT);
+        lpae_t *entry = xen_xenmap + i;
+
+        if ( !is_kernel(va) )
+            break;
+
+        pte = read_atomic(entry);
+
+        if ( is_kernel_text(va) || is_kernel_inittext(va) )
+        {
+            pte.pt.xn = 0;
+            pte.pt.ro = 1;
+        } else if ( is_kernel_rodata(va) ) {
+            pte.pt.ro = 1;
+            pte.pt.xn = 1;
+        } else {
+            pte.pt.xn = 1;
+            pte.pt.ro = 0;
+        }
+
+        write_pte(entry, pte);
+    }
+
+    /*
+     * We modified live page-tables. Ensure the TBLs are invalidated
+     * before setting enforcing the WnX permissions.
+     */
+    flush_xen_tlb_local();
+
     xen_pt_enforce_wnx();
 
 #ifdef CONFIG_ARM_32
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 28f4761705..64a449f78d 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -816,8 +816,6 @@ void asmlinkage __init start_xen(unsigned long boot_phys_offset,
     /* Initialize traps early allow us to get backtrace when an error occurred */
     init_traps();
 
-    setup_pagetables(boot_phys_offset);
-
     smp_clear_cpu_maps();
 
     device_tree_flattened = early_fdt_map(fdt_paddr);
@@ -841,6 +839,9 @@ void asmlinkage __init start_xen(unsigned long boot_phys_offset,
 
     llc_coloring_init();
 
+    setup_pagetables(boot_phys_offset);
+    device_tree_flattened = early_fdt_map(fdt_paddr);
+
     setup_mm();
 
     /* Parse the ACPI tables for possible boot-time configuration */
diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
index dace881b55..c0c4ce47bf 100644
--- a/xen/common/llc-coloring.c
+++ b/xen/common/llc-coloring.c
@@ -29,6 +29,8 @@ static unsigned int __ro_after_init xen_num_colors;
 
 #define mfn_color_mask              (max_nr_colors - 1)
 #define mfn_to_color(mfn)           (mfn_x(mfn) & mfn_color_mask)
+#define mfn_set_color(mfn, color)   (_mfn((mfn_x(mfn) & ~mfn_color_mask) | \
+                                     (color)))
 
 /*
  * Parse the coloring configuration given in the buf string, following the
@@ -316,6 +318,27 @@ unsigned int get_max_nr_llc_colors(void)
     return max_nr_colors;
 }
 
+paddr_t __init xen_colored_map_size(void)
+{
+    return ROUNDUP((_end - _start) * max_nr_colors, XEN_PADDR_ALIGN);
+}
+
+mfn_t __init xen_colored_mfn(mfn_t mfn)
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
+    /* Jump to next color space (max_nr_colors mfns) and use the first color */
+    return mfn_set_color(mfn_add(mfn, max_nr_colors), xen_colors[0]);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/xen/llc-coloring.h b/xen/include/xen/llc-coloring.h
index b96a7134ed..5cb560d75d 100644
--- a/xen/include/xen/llc-coloring.h
+++ b/xen/include/xen/llc-coloring.h
@@ -24,6 +24,17 @@ static inline void domain_llc_coloring_free(struct domain *d) {}
 static inline void domain_dump_llc_colors(const struct domain *d) {}
 #endif
 
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
 unsigned int get_llc_way_size(void);
 void arch_llc_coloring_init(void);
 int dom0_set_llc_colors(struct domain *d);
@@ -35,6 +46,9 @@ struct page_info;
 unsigned int page_to_llc_color(const struct page_info *pg);
 unsigned int get_max_nr_llc_colors(void);
 
+paddr_t xen_colored_map_size(void);
+mfn_t xen_colored_mfn(mfn_t mfn);
+
 #endif /* __COLORING_H__ */
 
 /*
-- 
2.34.1


