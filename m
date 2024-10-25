Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9159AFEEF
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2024 11:51:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825726.1240123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4GyM-0001Z5-V7; Fri, 25 Oct 2024 09:51:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825726.1240123; Fri, 25 Oct 2024 09:51:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4GyM-0001TO-Lm; Fri, 25 Oct 2024 09:51:10 +0000
Received: by outflank-mailman (input) for mailman id 825726;
 Fri, 25 Oct 2024 09:51:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r3YV=RV=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1t4GyK-0006YL-Kg
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2024 09:51:08 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a77a2ccf-92b6-11ef-99a3-01e77a169b0f;
 Fri, 25 Oct 2024 11:51:06 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5cb72918bddso2421644a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Oct 2024 02:51:06 -0700 (PDT)
Received: from carlo-ubuntu.home
 (dynamic-adsl-94-34-131-227.clienti.tiscali.it. [94.34.131.227])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cbb629e17dsm446938a12.34.2024.10.25.02.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 02:51:05 -0700 (PDT)
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
X-Inumbo-ID: a77a2ccf-92b6-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1729849866; x=1730454666; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WiSL170JfR6Y/eDgJSxNioGpc+dkFG7rOoI+XnYxhkM=;
        b=MMy25DZHUFhcwPVc2+jwJucn7fQKbPyIAuFbGxbhYWVaqTDCXiGvWxTvNpxBFdvnTU
         zvAAQVI0fonZT0/AdQNhwxhzfRWgJHkrMOXB5+vHj59pWSWZqcH48/o7eN6Lop/OzmrA
         KRF6jPNOT8CMBXYnaqWsOP0jY2I1MwNRpD8syEKFb/i6Jlp6v0ct1YaND0GzJk41z/X6
         x6peRN7fgTxgJwnhj8aKufJLW7wkLOMvjou8KB3XB2MWib2wG6DRnOW+2tm+JDBjqEJY
         R5z3spQ3SVLVqTRwqIkjZ/2pmjotz5Fn8SQ4e7GSBfCzTkqz99VoCoFY6wARTX+SFgv6
         eqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729849866; x=1730454666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WiSL170JfR6Y/eDgJSxNioGpc+dkFG7rOoI+XnYxhkM=;
        b=N+NiM/2PDa2uJsYTAs8Ul/CVi5h18KjFXW2fu4Cle2+bubl293nXWQmFyjbwY9jj2u
         qFv5kVw2nrE7zboxhj9xIV+sIDtQ7Ipguws0XQh2TcPtbmoLKbfoEocdK2KyQIUefUHi
         mCHhDs9jm+y0TH3vnBUMbwCiKN2WqkUFxn/WwpUBs1FbDjW/+2ZDK0eYMLikKdFJOrg5
         rq6adIL/t3y7hu3OeQE3+tLwPteqFQ+D7TJrBuP5/0S8MoHYAgOCszXh5rXE1NrVyJMi
         l2FnZ6c4aIK2lxuTSt1Btmiwf2CGgwR+6iSjyPvXBD5r5ZZIGHMsRvvqTnwu8VWHQek/
         he6w==
X-Gm-Message-State: AOJu0YzQog44uvDp63ka6oCuGuve/2C7fU8/53JOsgCWoeAAZctLxuOa
	9SgRPhl32UOKWxJV1Elszh6YIV1eX72aQDiAA7ekhgKGpKAN+MgGFZ8Pjvx9nr6TQLIMbOizUoF
	FlHw=
X-Google-Smtp-Source: AGHT+IGcul3nfXDRg8HYBhZ4gdG1shgentisa4n1ytBAya43PDjvcv0ZF6ZI3bZ1ttxYfiCWCOW17Q==
X-Received: by 2002:a05:6402:254d:b0:5c9:4281:4515 with SMTP id 4fb4d7f45d1cf-5cb8acb7b0amr8362175a12.17.1729849865561;
        Fri, 25 Oct 2024 02:51:05 -0700 (PDT)
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
	Jan Beulich <jbeulich@suse.com>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH v9 13/13] xen/arm: add cache coloring support for Xen
Date: Fri, 25 Oct 2024 11:50:14 +0200
Message-ID: <20241025095014.42376-14-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241025095014.42376-1-carlo.nonato@minervasys.tech>
References: <20241025095014.42376-1-carlo.nonato@minervasys.tech>
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
 xen/arch/arm/alternative.c            | 30 +++++++-
 xen/arch/arm/arm64/mmu/head.S         | 58 +++++++++++++++-
 xen/arch/arm/arm64/mmu/mm.c           | 28 ++++++--
 xen/arch/arm/include/asm/mmu/layout.h |  3 +
 xen/arch/arm/llc-coloring.c           | 63 +++++++++++++++++
 xen/arch/arm/mmu/setup.c              | 98 +++++++++++++++++++++++----
 xen/arch/arm/setup.c                  | 10 ++-
 xen/common/llc-coloring.c             | 18 +++++
 xen/include/xen/llc-coloring.h        | 13 ++++
 9 files changed, 300 insertions(+), 21 deletions(-)

diff --git a/xen/arch/arm/alternative.c b/xen/arch/arm/alternative.c
index d99b507093..0fcf4e451d 100644
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
+    mfn_t *xen_colored_mfns, mfn;
+
+    xen_colored_mfns = xmalloc_array(mfn_t, xen_size >> PAGE_SHIFT);
+    if ( !xen_colored_mfns )
+        panic("Can't allocate LLC colored MFNs\n");
+
+    for_each_xen_colored_mfn ( xen_mfn, mfn, i )
+    {
+        xen_colored_mfns[i] = mfn;
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
index 665a51a337..a1fc9a82f1 100644
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
index 671eaadbc1..3732d5897e 100644
--- a/xen/arch/arm/arm64/mmu/mm.c
+++ b/xen/arch/arm/arm64/mmu/mm.c
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
 #include <xen/init.h>
+#include <xen/llc-coloring.h>
 #include <xen/mm.h>
 #include <xen/pfn.h>
 
@@ -138,27 +139,46 @@ void update_boot_mapping(bool enable)
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
diff --git a/xen/arch/arm/llc-coloring.c b/xen/arch/arm/llc-coloring.c
index 66c8db2baf..c8b183da84 100644
--- a/xen/arch/arm/llc-coloring.c
+++ b/xen/arch/arm/llc-coloring.c
@@ -9,6 +9,7 @@
 
 #include <asm/processor.h>
 #include <asm/sysregs.h>
+#include <asm/setup.h>
 
 /* Return the LLC way size by probing the hardware */
 unsigned int __init get_llc_way_size(void)
@@ -62,8 +63,70 @@ unsigned int __init get_llc_way_size(void)
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
+    min_size = (xen_size + (XEN_PADDR_ALIGN-1)) & ~(XEN_PADDR_ALIGN-1);
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
index 1cf62390e3..bf6334dbd4 100644
--- a/xen/arch/arm/mmu/setup.c
+++ b/xen/arch/arm/mmu/setup.c
@@ -23,6 +23,9 @@
 #undef virt_to_mfn
 #define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
 
+#define virt_to_reloc_virt(virt) \
+    (((vaddr_t)virt) - XEN_VIRT_START + BOOT_RELOC_VIRT_START)
+
 /* Main runtime page tables */
 
 /*
@@ -72,6 +75,7 @@ static void __init __maybe_unused build_assertions(void)
     /* 2MB aligned regions */
     BUILD_BUG_ON(XEN_VIRT_START & ~SECOND_MASK);
     BUILD_BUG_ON(FIXMAP_ADDR(0) & ~SECOND_MASK);
+    BUILD_BUG_ON(BOOT_RELOC_VIRT_START & ~SECOND_MASK);
     /* 1GB aligned regions */
 #ifdef CONFIG_ARM_32
     BUILD_BUG_ON(XENHEAP_VIRT_START & ~FIRST_MASK);
@@ -141,6 +145,9 @@ static void __init __maybe_unused build_assertions(void)
 
 lpae_t __init pte_of_xenaddr(vaddr_t va)
 {
+    if ( llc_coloring_enabled )
+        va = virt_to_reloc_virt(va);
+
     return mfn_to_xen_entry(virt_to_mfn(va), MT_NORMAL);
 }
 
@@ -319,9 +326,44 @@ paddr_t __init consider_modules(paddr_t s, paddr_t e,
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
 void __init setup_pagetables(void)
 {
@@ -329,6 +371,9 @@ void __init setup_pagetables(void)
     lpae_t pte, *p;
     int i;
 
+    if ( llc_coloring_enabled )
+        create_llc_coloring_mappings();
+
     arch_setup_page_tables();
 
 #ifdef CONFIG_ARM_64
@@ -356,13 +401,7 @@ void __init setup_pagetables(void)
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
 
@@ -388,13 +427,48 @@ void __init setup_pagetables(void)
     ttbr = virt_to_maddr(cpu0_pgtable);
 #endif
 
-    switch_ttbr(ttbr);
-
-    xen_pt_enforce_wnx();
-
 #ifdef CONFIG_ARM_32
     per_cpu(xen_pgtable, 0) = cpu0_pgtable;
 #endif
+
+    if ( llc_coloring_enabled )
+        ttbr = virt_to_maddr(virt_to_reloc_virt(THIS_CPU_PGTABLE));
+
+    switch_ttbr(ttbr);
+
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
+     * We modified live page-tables. Ensure the TLBs are invalidated
+     * before setting enforcing the WnX permissions.
+     */
+    flush_xen_tlb_local();
+
+    xen_pt_enforce_wnx();
 }
 
 void *__init arch_vmap_virt_end(void)
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 84fecaabea..3b3fb49fbd 100644
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
index 3b4b1a8a4f..65c40af351 100644
--- a/xen/common/llc-coloring.c
+++ b/xen/common/llc-coloring.c
@@ -33,6 +33,8 @@ static unsigned int __ro_after_init xen_num_colors;
 
 #define mfn_color_mask              (max_nr_colors - 1)
 #define mfn_to_color(mfn)           (mfn_x(mfn) & mfn_color_mask)
+#define get_mfn_with_color(mfn, color) \
+    (_mfn((mfn_x(mfn) & ~mfn_color_mask) | (color)))
 
 /*
  * Parse the coloring configuration given in the buf string, following the
@@ -349,6 +351,22 @@ unsigned int get_max_nr_llc_colors(void)
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
+        else if ( color < xen_colors[i] )
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
index 7f8218bfb2..859ed2da4e 100644
--- a/xen/include/xen/llc-coloring.h
+++ b/xen/include/xen/llc-coloring.h
@@ -26,6 +26,17 @@ static inline void domain_dump_llc_colors(const struct domain *d) {}
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
@@ -37,6 +48,8 @@ struct page_info;
 unsigned int page_to_llc_color(const struct page_info *pg);
 unsigned int get_max_nr_llc_colors(void);
 
+mfn_t xen_colored_mfn(mfn_t mfn);
+
 #endif /* __COLORING_H__ */
 
 /*
-- 
2.43.0


