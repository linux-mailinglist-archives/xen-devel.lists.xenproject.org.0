Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 742109ACF6E
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 17:51:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824767.1238959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3de5-0005sb-VE; Wed, 23 Oct 2024 15:51:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824767.1238959; Wed, 23 Oct 2024 15:51:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3de5-0005q0-Rr; Wed, 23 Oct 2024 15:51:37 +0000
Received: by outflank-mailman (input) for mailman id 824767;
 Wed, 23 Oct 2024 15:51:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9cWG=RT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1t3de3-0005bd-Tc
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2024 15:51:36 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae0d050f-9156-11ef-a0be-8be0dac302b0;
 Wed, 23 Oct 2024 17:51:34 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a99cc265e0aso1038682766b.3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Oct 2024 08:51:34 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a912ee592sm493214466b.79.2024.10.23.08.51.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 08:51:33 -0700 (PDT)
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
X-Inumbo-ID: ae0d050f-9156-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729698694; x=1730303494; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFnxFGxSNN5WN9xtFLzWvxwvab562wxEhkwPA1vRgPc=;
        b=Cddca0OlssmTmC1u+9u4GGUO/Ws8ZWKSkROiacz9FaNLccoZq01B9i+2Hhbf7XcApN
         jGILn8bcsyB9JbB9ZGXB3DkrKt1jrX7dt/taSHpsL6MNN5KKVFOMYdxV45bAq90zpRsg
         z1Te7k/hz2plPIkuqoJhDMEVdYgUA02kX2M1kLaCgaa2cOIHpYOJATW56zAnYcijnYrh
         tkwz9vplPDo9mr3HIweM+5aRAh4OCFleVTbDFMsNQSuKd02MEZmgmXrzVZTFTgZz1YOn
         zNh5f50GbFS1BiWF2LSfArfFSujFJD3lmVVKg94W/ofluiuvJTEMzsGHEGoDQA0beGqv
         HUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729698694; x=1730303494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UFnxFGxSNN5WN9xtFLzWvxwvab562wxEhkwPA1vRgPc=;
        b=vU/yzqgt+XOCkmbQIJYf3qoNgMO4npVDwKJJQpkCwpk2Jm/XjwGjQeNsDgmNBOig22
         iEsCN8Jd2HEM0W/7CzEhDMypfBtEz7h06ZYeqWFYVo7vYs2KHesOtYRDOUDZvkE51P4g
         1YAsuz+BcW840JiWbmhCXsvHoiLcLtDF+my+CMmDv6DW6F3aEHRH1sb3MtusITghthcT
         xffSo3BnOLyUnrcN4JZmWMPn25+xbAqUDL/FaCJ+kXuoEDR1Vu8hjIdbmOPQz/ntVNja
         8gNcSqf8SnasMQm8NKdJd3e8aPD2PHFWIOLTZ8knLyXIGhS52eLIgs1IoWsV6oP0G0Fc
         jxeQ==
X-Gm-Message-State: AOJu0YyFexe1DNrS9pwNmqrCqdZSli3LNr7h9vEHrQS4vc09Dh9n3A9N
	T9tTZcqfCBoosGfnxZZ9JTWqCQqzBdVtunLn5TFDDli+SQrnVwALXQCSQA==
X-Google-Smtp-Source: AGHT+IHSvfzoyBILXwJNKpkGHqKgOB/lVo1I5P++rI4ZHP/+EkNJoMHlL/iXqbmRyez5Exw7whzKpQ==
X-Received: by 2002:a17:907:7b97:b0:a9a:26a1:1963 with SMTP id a640c23a62f3a-a9abf8491aemr318394466b.7.1729698693458;
        Wed, 23 Oct 2024 08:51:33 -0700 (PDT)
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
Subject: [PATCH v2 1/3] xen/riscv: introduce setup_mm()
Date: Wed, 23 Oct 2024 17:50:22 +0200
Message-ID: <28240dcfc04a11237db553c4e0ecb372aa0fe9ac.1729697111.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1729697111.git.oleksii.kurochko@gmail.com>
References: <cover.1729697111.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the implementation of setup_mm(), which includes:
1. Adding all free regions to the boot allocator, as memory is needed
   to allocate page tables used for frame table mapping.
2. Calculating RAM size and the RAM end address.
3. Setting up direct map mappings from each RAM bank and initialize
   directmap_virt_start (also introduce XENHEAP_VIRT_START which is
   defined as directmap_virt_start) to be properly aligned with RAM
   start to use more superpages to reduce pressure on the TLB.
4. Setting up frame table mappings from physical address 0 to ram_end
   to simplify mfn_to_page() and page_to_mfn() conversions.
5. Setting up total_pages and max_page.

Update virt_to_maddr() to use introduced XENHEAP_VIRT_START.

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
when maddr_to_virt() is defined as "return NULL" compiler optimizes the part of
common/trace.c code where share_xen_page_with_priviliged_guest() is called
( there is no any code in dissambled common/trace.o ) so there is no real call
of share_xen_page_with_priviliged_guest().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/include/asm/config.h |   1 +
 xen/arch/riscv/include/asm/mm.h     |  13 ++-
 xen/arch/riscv/include/asm/setup.h  |   2 +
 xen/arch/riscv/mm.c                 | 121 ++++++++++++++++++++++++++++
 xen/arch/riscv/setup.c              |   3 +
 xen/arch/riscv/stubs.c              |  10 +++
 6 files changed, 146 insertions(+), 4 deletions(-)

diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index ad75871283..3aa9afa5ad 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -90,6 +90,7 @@
 #define DIRECTMAP_SLOT_START    200
 #define DIRECTMAP_VIRT_START    SLOTN(DIRECTMAP_SLOT_START)
 #define DIRECTMAP_SIZE          (SLOTN(DIRECTMAP_SLOT_END) - SLOTN(DIRECTMAP_SLOT_START))
+#define XENHEAP_VIRT_START      directmap_virt_start
 
 #define FRAMETABLE_SCALE_FACTOR  (PAGE_SIZE/sizeof(struct page_info))
 #define FRAMETABLE_SIZE_IN_SLOTS (((DIRECTMAP_SIZE / SLOTN(1)) / FRAMETABLE_SCALE_FACTOR) + 1)
diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index ebb142502e..bff4e763d9 100644
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
+    return (void *)(XENHEAP_VIRT_START + va_offset);
 }
 
 /*
@@ -37,9 +42,9 @@ static inline void *maddr_to_virt(paddr_t ma)
  */
 static inline unsigned long virt_to_maddr(unsigned long va)
 {
-    if ((va >= DIRECTMAP_VIRT_START) &&
+    if ((va >= XENHEAP_VIRT_START) &&
         (va < (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE)))
-        return directmapoff_to_maddr(va - DIRECTMAP_VIRT_START);
+        return directmapoff_to_maddr(va - XENHEAP_VIRT_START);
 
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
index 27026d803b..5be5a7b52a 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -8,6 +8,7 @@
 #include <xen/libfdt/libfdt.h>
 #include <xen/macros.h>
 #include <xen/mm.h>
+#include <xen/pdx.h>
 #include <xen/pfn.h>
 #include <xen/sections.h>
 #include <xen/sizes.h>
@@ -423,3 +424,123 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
 
     return fdt_virt;
 }
+
+#ifndef CONFIG_RISCV_32
+
+#define ROUNDDOWN(addr, size)  ((addr) & ~((size) - 1))
+
+/* Map a frame table to cover physical addresses ps through pe */
+static void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
+{
+    paddr_t aligned_ps = ROUNDDOWN(ps, PAGE_SIZE);
+    paddr_t aligned_pe = ROUNDUP(pe, PAGE_SIZE);
+    unsigned long nr_mfns = PFN_DOWN(aligned_pe - aligned_ps);
+    unsigned long frametable_size = nr_mfns * sizeof(struct page_info);
+    mfn_t base_mfn;
+
+    if ( frametable_size > FRAMETABLE_SIZE )
+        panic("The frametable cannot cover the physical region [%#"PRIpaddr" - %#"PRIpaddr")\n",
+              ps, pe);
+
+    frametable_size = ROUNDUP(frametable_size, MB(2));
+    base_mfn = alloc_boot_pages(frametable_size >> PAGE_SHIFT, PFN_DOWN(MB(2)));
+
+    if ( map_pages_to_xen(FRAMETABLE_VIRT_START, base_mfn,
+                          PFN_DOWN(frametable_size),
+                          PAGE_HYPERVISOR_RW) )
+        panic("Unable to setup the frametable mappings\n");
+
+    memset(&frame_table[0], 0, nr_mfns * sizeof(struct page_info));
+    memset(&frame_table[nr_mfns], -1,
+           frametable_size - (nr_mfns * sizeof(struct page_info)));
+}
+
+
+static mfn_t __ro_after_init directmap_mfn_start = INVALID_MFN_INITIALIZER;
+vaddr_t __ro_after_init directmap_virt_start;
+
+/* Map the region in the directmap area. */
+static void __init setup_directmap_mappings(unsigned long base_mfn,
+                                            unsigned long nr_mfns)
+{
+    int rc;
+
+    /* First call sets the directmap physical and virtual offset. */
+    if ( mfn_eq(directmap_mfn_start, INVALID_MFN) )
+    {
+        directmap_mfn_start = _mfn(base_mfn);
+
+        /*
+         * The base address may not be aligned to the second level
+         * size (e.g. 1GB when using 4KB pages). This would prevent
+         * superpage mappings for all the regions because the virtual
+         * address and machine address should both be suitably aligned.
+         *
+         * Prevent that by offsetting the start of the directmap virtual
+         * address.
+         */
+        directmap_virt_start = DIRECTMAP_VIRT_START + pfn_to_paddr(base_mfn);
+    }
+
+    if ( base_mfn < mfn_x(directmap_mfn_start) )
+        panic("cannot add directmap mapping at %#lx below heap start %#lx\n",
+              base_mfn, mfn_x(directmap_mfn_start));
+
+    rc = map_pages_to_xen((vaddr_t)mfn_to_virt(base_mfn),
+                          _mfn(base_mfn), nr_mfns,
+                          PAGE_HYPERVISOR_RW);
+    if ( rc )
+        panic("Unable to setup the directmap mappings.\n");
+}
+
+/*
+ * Setup memory management
+ *
+ * RISC-V 64 has a large virtual address space (the minimum supported
+ * MMU mode is Sv39, which provides TBs of VA space).
+ * In the case of RISC-V 64, the directmap and frametable are mapped
+ * starting from physical address 0 to simplify the page_to_mfn(),
+ * mfn_to_page(), and maddr_to_virt() calculations, as there is no need
+ * to account for {directmap, frametable}_base_pdx in this setup.
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
+        paddr_t bank_end = bank->start + bank->size;
+
+        ram_size += ROUNDDOWN(bank->size, PAGE_SIZE);
+        ram_start = min(ram_start, bank->start);
+        ram_end = max(ram_end, bank_end);
+
+        setup_directmap_mappings(PFN_DOWN(bank->start),
+                                 PFN_DOWN(bank->size));
+    }
+
+    total_pages = PFN_DOWN(ram_size);
+
+    setup_frametable_mappings(0, ram_end);
+    max_page = PFN_DOWN(ram_end);
+}
+
+#else /* CONFIG_RISCV_32 */
+#error setup_mm(), setup_{directmap,frametable}_mapping() should be implemented for RV_32
+#endif
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
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index 5951b0ce91..c9a590b225 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -2,7 +2,9 @@
 #include <xen/cpumask.h>
 #include <xen/domain.h>
 #include <xen/irq.h>
+#include <xen/mm.h>
 #include <xen/nodemask.h>
+#include <xen/sched.h>
 #include <xen/sections.h>
 #include <xen/time.h>
 #include <public/domctl.h>
@@ -409,3 +411,11 @@ unsigned long get_upper_mfn_bound(void)
 {
     BUG_ON("unimplemented");
 }
+
+/* mm.c */
+
+void share_xen_page_with_guest(struct page_info *page, struct domain *d,
+                               enum XENSHARE_flags flags)
+{
+    BUG_ON("unimplemented");
+}
-- 
2.47.0


