Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C67E9B91C6
	for <lists+xen-devel@lfdr.de>; Fri,  1 Nov 2024 14:17:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829110.1244186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6rWJ-0000Yt-Qe; Fri, 01 Nov 2024 13:16:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829110.1244186; Fri, 01 Nov 2024 13:16:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6rWJ-0000WL-NT; Fri, 01 Nov 2024 13:16:55 +0000
Received: by outflank-mailman (input) for mailman id 829110;
 Fri, 01 Nov 2024 13:16:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1ZeD=R4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1t6rWI-0000Hs-5g
 for xen-devel@lists.xenproject.org; Fri, 01 Nov 2024 13:16:54 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e78aacc-9853-11ef-a0c5-8be0dac302b0;
 Fri, 01 Nov 2024 14:16:51 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-539f84907caso2150218e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 01 Nov 2024 06:16:51 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53c7bdcbcf6sm549745e87.194.2024.11.01.06.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 06:16:46 -0700 (PDT)
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
X-Inumbo-ID: 8e78aacc-9853-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzUiLCJoZWxvIjoibWFpbC1sZjEteDEzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjhlNzhhYWNjLTk4NTMtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNDY3MDExLjI1ODUzNywic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730467007; x=1731071807; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwCWlUmP+fvklPMi2ZGyZefz6lAo2zH73CUd2mOyJ44=;
        b=AaAWq+v4mK4jGQNhntAHVrAKdJ2oqyv0rY+mys4fAYis0Mf645uUTSdBcM+uU8RCxW
         Fwg5oWS1tVo9JUCUUbS3W7bW6tLsSxW2Rjtjtwk2YIf1ZLIfNuPOp0iKXvCHvNHaMtbX
         46YbZO4dZsr9R00JTkXzQHKxdoFELyEO6ADT3qOKnyG8Xgv+Q5fUa43vjHtoMinW6xcu
         W/is0BwFUGAbJ1cJSbqElBw4OFND5PGf94WLht8LkUGrVUCKnKo7tl2evzNF9p8mVtjw
         5i7QOc8+a9d/6EteE8utPHiGHorPL9wOOeI7AZFjRggwrbi4SRdH3Vfs+ODETQx6UmSd
         UTJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730467007; x=1731071807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kwCWlUmP+fvklPMi2ZGyZefz6lAo2zH73CUd2mOyJ44=;
        b=PHxqyE76xmalYxrU/sPntT/gygyBVzcFa/mgkNLpcwIdiZC3VXv/ymtWfeO8WkDGUR
         C7hWD8hoPNCdrkBD8C4eLYpKV9I4nThjqZvSYeTMtkozWl4fQRU0jUE43V1OZqvkLy/Q
         +vH/fURnT9A93IZZOstjqB6v8ogVwpkbGppHaRBvlbyqH4WhZLnVfwlaatQlOlW/Xev3
         vI3QCQNWxLwofgD/oFnAs45txCCYrkViQ+WQVHRyH2CD2emME82YZ5EB4XPD5aKn2XgW
         SxJUsCKLgMhPh+HMKk4Az2PoBnGI9sdcCrx0e6eEvjfQEu/wZwm31tBNUPd0DKqa4Fta
         RAPA==
X-Gm-Message-State: AOJu0YzHs3gwiGl5ZAoJDVpXf53eKDn0/b+1IIzHqKioxjPbsxPEpldi
	T/OChX0apcyIRhsi2VlYRjIhe7zUUWkufnGM4rRTaQii7+jqtS/wK5p3IA==
X-Google-Smtp-Source: AGHT+IHWXVkoZyh7cvRuQrZFRaZv0JzQGmEWN64XuSSS1UhuoII2B+cGLmcEqop3h20WA7SJHNoCrA==
X-Received: by 2002:a05:6512:104d:b0:539:d10b:e389 with SMTP id 2adb3069b0e04-53b348f9681mr12117599e87.13.1730467006577;
        Fri, 01 Nov 2024 06:16:46 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 1/3] xen/riscv: introduce setup_mm()
Date: Fri,  1 Nov 2024 14:16:40 +0100
Message-ID: <0f7cd809e848607408ff4615e55b847f5a524559.1730465154.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1730465154.git.oleksii.kurochko@gmail.com>
References: <cover.1730465154.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the implementation of setup_mm(), which includes:
1. Adding all free regions to the boot allocator, as memory is needed
   to allocate page tables used for frame table mapping.
2. Calculating RAM size and the RAM end address.
3. Setting up direct map mappings from each RAM bank and initialize
   directmap_virt_start to keep simple VA <-> PA translation and map
   DIRECTMAP_VIRT_START with some offset ( if RAM start isn't properly
   aligned ) to RAM start to be properly aligned with RAM
   start to use more superpages to reduce pressure on the TLB
4. Setting up frame table mappings from physical address 0 to ram_end
   to simplify mfn_to_page() and page_to_mfn() conversions.
5. Setting up total_pages and max_page.

Update virt_to_maddr() to use introduced directmap_virt_start.

Implement maddr_to_virt() function to convert a machine address
to a virtual address. This function is specifically designed to be used
only for the DIRECTMAP region, so a check has been added to ensure that
the address does not exceed DIRECTMAP_SIZE.

After the introduction of maddr_to_virt() the following linkage error starts
to occur and to avoid it share_xen_page_with_guest() stub is added:
  riscv64-linux-gnu-ld: prelink.o: in function `tasklet_kill':
  /build/xen/common/tasklet.c:176: undefined reference to
     `share_xen_page_with_guest'
  riscv64-linux-gnu-ld: ./.xen-syms.0: hidden symbol `share_xen_page_with_guest'
    isn't defined riscv64-linux-gnu-ld: final link failed: bad value

Despite the linkger fingering tasklet.c, it's trace.o which has the undefined
refenrece:
  $ find . -name \*.o | while read F; do nm $F | grep share_xen_page_with_guest &&
    echo $F; done
                     U share_xen_page_with_guest
    ./xen/common/built_in.o
                     U share_xen_page_with_guest
    ./xen/common/trace.o
                     U share_xen_page_with_guest
    ./xen/prelink.o

Looking at trace.i, there is call of share_xen_page_with_guest() but in case of
when maddr_to_virt() is defined as stub ("BUG_ON(); return NULL;") DCE happens and
the code is just eliminated.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
  - Update the comment the part where DCE should be mentioned and directmap-related
    things are touched.
  - Move ROUNDDOWN to <xen/macros.h>.
  - s/sizeof(struct page_info)/sizeof(*frame_table) in setup_frametable_mapping().
  - Updates in setup_frametable_mapping():
    - align phys_start (ps) up to a page boundary and align phys_end (pe) down
      to a page boundary.
    - Update panic message.
    - Add the comment about alignment of frametable_size and base_mfn.
    - invalidate all frame_table entries and then just init with 0 only valid ones.
  - Double blank lines removing.
  - Initialize directmap_virt_start with DIRECTMAP_VIRT_START.
  - Updates in setup_directmap_mapping():
    - Drop local variable rc as it is used only once.
    - Move directmap_mfn_start definition to setup_directmap_mapping() and
      change __ro_after_init to __initdata.
    - Update the commit message about alignment of directmap_virt_start.
    - Move down directmap_virt_start for (base_addr & ~XEN_PT_LEVEL_SIZE(HYP_PT_ROOT_LEVEL))
      to not waste a lot of directmap space.
    - Map DIRECTMAP_VIRT_START + (base_addr & XEN_PT_LEVEL_SIZE(HYP_PT_ROOT_LEVEL))
      to _mfn(base_mfn).
    - Add log of the range in case directmap mapping failure.
  - Drop XENHEAP_VIRT_START and use directmap_virt_start instead.
  - Update the comment above setup_mm().
  - Update the calculation of bank_start and bank_end in setup_mm() to cover
    the case when a bank doesn't cover full pages.
  - Move share_xen_page_with_guest() to riscv/mm.c instead of riscv/stub.c.
  - Drop inclusion of <xen/pdx.h> in riscv/mm.c as thery is nothing used
    anymore in riscv/mm.c.
  - Move variable directmap_virt_start and setup_mm() outside
    #ifndef CONFIG_RISCV_32 ... #endif as they are likely to be common.
---
 Changes in V2:
  - merge patch 2 ( xen/riscv: implement maddr_to_virt() ) to the current one
    as maddr_to_virt() started to use the thing which are introduced in the
    current patch.
  - merge with patch 1 ( xen/riscv: add stub for share_xen_page_with_guest() )
    as this linkage issue happens during introduction of maddr_to_virt().
  - use mathematical range expressions for log messages.
  - calculate properly amount of mfns in setup_frametable_mapping() taking into
    account that ps and pe can be not properly aligned.
  - drop full stop at the end of debug message.
  - use PFN_DOWN(framsetable_size) instead of frametable_size >> PAGE_SHIFT.
  - round down ram_size when it is being accumulated in setup_mm() to guarantee
    that banks can never have partial pages at their start/end.
  - call setup_directmap_mappings() only for ram bank regions instead of
    mapping [0, ram_end] region.
  - drop directmap_virt_end for now as it isn't used at the moment.
  - update the commit message.
---
 xen/arch/riscv/include/asm/mm.h    |  13 ++-
 xen/arch/riscv/include/asm/setup.h |   2 +
 xen/arch/riscv/mm.c                | 141 +++++++++++++++++++++++++++++
 xen/arch/riscv/setup.c             |   3 +
 xen/include/xen/macros.h           |   1 +
 5 files changed, 156 insertions(+), 4 deletions(-)

diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index ebb142502e..50d2ac3830 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -12,6 +12,8 @@
 
 #include <asm/page-bits.h>
 
+extern vaddr_t directmap_virt_start;
+
 #define pfn_to_paddr(pfn) ((paddr_t)(pfn) << PAGE_SHIFT)
 #define paddr_to_pfn(pa)  ((unsigned long)((pa) >> PAGE_SHIFT))
 
@@ -25,8 +27,11 @@
 
 static inline void *maddr_to_virt(paddr_t ma)
 {
-    BUG_ON("unimplemented");
-    return NULL;
+    unsigned long va_offset = maddr_to_directmapoff(ma);
+
+    ASSERT(va_offset < DIRECTMAP_SIZE);
+
+    return (void *)(directmap_virt_start + va_offset);
 }
 
 /*
@@ -37,9 +42,9 @@ static inline void *maddr_to_virt(paddr_t ma)
  */
 static inline unsigned long virt_to_maddr(unsigned long va)
 {
-    if ((va >= DIRECTMAP_VIRT_START) &&
+    if ((va >= directmap_virt_start) &&
         (va < (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE)))
-        return directmapoff_to_maddr(va - DIRECTMAP_VIRT_START);
+        return directmapoff_to_maddr(va - directmap_virt_start);
 
     BUILD_BUG_ON(XEN_VIRT_SIZE != MB(2));
     ASSERT((va >> (PAGETABLE_ORDER + PAGE_SHIFT)) ==
diff --git a/xen/arch/riscv/include/asm/setup.h b/xen/arch/riscv/include/asm/setup.h
index c0214a9bf2..844a2f0ef1 100644
--- a/xen/arch/riscv/include/asm/setup.h
+++ b/xen/arch/riscv/include/asm/setup.h
@@ -5,6 +5,8 @@
 
 #define max_init_domid (0)
 
+void setup_mm(void);
+
 #endif /* ASM__RISCV__SETUP_H */
 
 /*
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 27026d803b..185008f4c6 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -372,6 +372,12 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
     return -1;
 }
 
+void share_xen_page_with_guest(struct page_info *page, struct domain *d,
+                               enum XENSHARE_flags flags)
+{
+    BUG_ON("unimplemented");
+}
+
 void * __init early_fdt_map(paddr_t fdt_paddr)
 {
     /* We are using 2MB superpage for mapping the FDT */
@@ -423,3 +429,138 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
 
     return fdt_virt;
 }
+
+vaddr_t __ro_after_init directmap_virt_start = DIRECTMAP_VIRT_START;
+
+#ifndef CONFIG_RISCV_32
+
+/* Map a frame table to cover physical addresses ps through pe */
+static void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
+{
+    paddr_t aligned_ps = ROUNDUP(ps, PAGE_SIZE);
+    paddr_t aligned_pe = ROUNDDOWN(pe, PAGE_SIZE);
+    unsigned long nr_mfns = PFN_DOWN(aligned_pe - aligned_ps);
+    unsigned long frametable_size = nr_mfns * sizeof(*frame_table);
+    mfn_t base_mfn;
+
+    if ( frametable_size > FRAMETABLE_SIZE )
+        panic("The frametable cannot cover [%#"PRIpaddr", %#"PRIpaddr")\n",
+              ps, pe);
+
+    /*
+     * align base_mfn and frametable_size to MB(2) to have superpage mapping
+     * in map_pages_to_xen()
+     */
+    frametable_size = ROUNDUP(frametable_size, MB(2));
+    base_mfn = alloc_boot_pages(frametable_size >> PAGE_SHIFT, PFN_DOWN(MB(2)));
+
+    if ( map_pages_to_xen(FRAMETABLE_VIRT_START, base_mfn,
+                          PFN_DOWN(frametable_size),
+                          PAGE_HYPERVISOR_RW) )
+        panic("frametable mappings failed: %#lx -> %#lx\n",
+              FRAMETABLE_VIRT_START, mfn_x(base_mfn));
+
+    memset(&frame_table[0], -1, frametable_size);
+    memset(&frame_table[PFN_DOWN(aligned_ps)],
+           0, nr_mfns * sizeof(*frame_table));
+}
+
+/* Map the region in the directmap area. */
+static void __init setup_directmap_mappings(unsigned long base_mfn,
+                                            unsigned long nr_mfns)
+{
+    static mfn_t __initdata directmap_mfn_start = INVALID_MFN_INITIALIZER;
+
+    unsigned long base_addr = mfn_to_maddr(_mfn(base_mfn));
+    unsigned long high_bits_mask = XEN_PT_LEVEL_MAP_MASK(HYP_PT_ROOT_LEVEL);
+
+    /* First call sets the directmap physical and virtual offset. */
+    if ( mfn_eq(directmap_mfn_start, INVALID_MFN) )
+    {
+        directmap_mfn_start = _mfn(base_mfn);
+
+        directmap_virt_start -= (base_addr & high_bits_mask);
+    }
+
+    if ( base_mfn < mfn_x(directmap_mfn_start) )
+        panic("cannot add directmap mapping at %#lx below heap start %#lx\n",
+              base_mfn, mfn_x(directmap_mfn_start));
+
+    /*
+     * The base address may not be aligned to the second level
+     * size in case of Sv39 (e.g. 1GB when using 4KB pages).
+     * This would prevent superpage mappings for all the regions
+     * because the virtual address and machine address should
+     * both be suitably aligned.
+     *
+     * Prevent that by offsetting the start of the directmap virtual
+     * address.
+     */
+    if ( map_pages_to_xen(DIRECTMAP_VIRT_START + (base_addr & ~high_bits_mask),
+                          _mfn(base_mfn), nr_mfns,
+                          PAGE_HYPERVISOR_RW) )
+        panic("Directmap mappings for [%#"PRIpaddr", %#"PRIpaddr") failed\n",
+              mfn_to_maddr(_mfn(base_mfn)),
+              mfn_to_maddr(_mfn(base_mfn + nr_mfns)));
+}
+
+#else /* CONFIG_RISCV_32 */
+#error setup_{directmap,frametable}_mapping() should be implemented for RV_32
+#endif
+
+/*
+ * Setup memory management
+ *
+ * RISC-V 64 has a large virtual address space (the minimum supported
+ * MMU mode is Sv39, which provides GBs of VA space).
+ *
+ * The directmap_virt_start is shifted lower in the VA space to
+ * (DIRECTMAP_VIRT_START - masked_low_bits_of_ram_start_address) to avoid
+ * wasting a large portion of the directmap space, this also allows for simple
+ * VA <-> PA translations. Also aligns DIRECTMAP_VIRT_START to a GB boundary
+ * (for Sv39; for other MMU mode boundaries will be bigger ) by masking the
+ * higher bits of the RAM start address to enable the use of superpages in
+ * map_pages_to_xen().
+ *
+ * The frametable is mapped starting from physical address 0, minimizing
+ * wasted VA space and simplifying page_to_mfn() and mfn_to_page()
+ * translations.
+ */
+void __init setup_mm(void)
+{
+    const struct membanks *banks = bootinfo_get_mem();
+    paddr_t ram_start = INVALID_PADDR;
+    paddr_t ram_end = 0;
+    paddr_t ram_size = 0;
+    unsigned int i;
+
+    /*
+     * We need some memory to allocate the page-tables used for the directmap
+     * mappings. But some regions may contain memory already allocated
+     * for other uses (e.g. modules, reserved-memory...).
+     *
+     * For simplicity, add all the free regions in the boot allocator.
+     */
+    populate_boot_allocator();
+
+    total_pages = 0;
+
+    for ( i = 0; i < banks->nr_banks; i++ )
+    {
+        const struct membank *bank = &banks->bank[i];
+        paddr_t bank_start = ROUNDUP(bank->start, PAGE_SIZE);
+        paddr_t bank_end = ROUNDDOWN(bank->start + bank->size, PAGE_SIZE);
+        unsigned long bank_size = bank_end - bank_start;
+
+        ram_size += bank_size;
+        ram_start = min(ram_start, bank_start);
+        ram_end = max(ram_end, bank_end);
+
+        setup_directmap_mappings(PFN_DOWN(bank_start), PFN_DOWN(bank_size));
+    }
+
+    total_pages = PFN_DOWN(ram_size);
+
+    setup_frametable_mappings(0, ram_end);
+    max_page = PFN_DOWN(ram_end);
+}
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index e29bd75d7c..2887a18c0c 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -12,6 +12,7 @@
 
 #include <asm/early_printk.h>
 #include <asm/sbi.h>
+#include <asm/setup.h>
 #include <asm/smp.h>
 #include <asm/traps.h>
 
@@ -59,6 +60,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
     printk("Command line: %s\n", cmdline);
     cmdline_parse(cmdline);
 
+    setup_mm();
+
     printk("All set up\n");
 
     machine_halt();
diff --git a/xen/include/xen/macros.h b/xen/include/xen/macros.h
index 19caaa8026..cd528fbdb1 100644
--- a/xen/include/xen/macros.h
+++ b/xen/include/xen/macros.h
@@ -2,6 +2,7 @@
 #define __MACROS_H__
 
 #define ROUNDUP(x, a) (((x) + (a) - 1) & ~((a) - 1))
+#define ROUNDDOWN(x, a) ((x) & ~((a) - 1))
 
 #define IS_ALIGNED(val, align) (!((val) & ((align) - 1)))
 
-- 
2.47.0


