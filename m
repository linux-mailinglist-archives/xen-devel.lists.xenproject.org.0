Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AADAC7566AA
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 16:41:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564650.882242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLPPH-000247-3S; Mon, 17 Jul 2023 14:40:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564650.882242; Mon, 17 Jul 2023 14:40:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLPPH-0001wr-06; Mon, 17 Jul 2023 14:40:59 +0000
Received: by outflank-mailman (input) for mailman id 564650;
 Mon, 17 Jul 2023 14:40:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7PMI=DD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qLPPE-0001et-OU
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 14:40:56 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id efff9087-24af-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 16:40:56 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fb761efa7aso7191250e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jul 2023 07:40:56 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 d15-20020ac25ecf000000b004fa52552c7csm2836284lfq.151.2023.07.17.07.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 07:40:54 -0700 (PDT)
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
X-Inumbo-ID: efff9087-24af-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689604855; x=1692196855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ThvgRboCSDvEXREJE4U7nta8TE4rl24QuMRMslv53Fs=;
        b=baas+kJb+izOVZb1HqVPerYDBD5um4bsPdwHvTdQcUoRklgfIMyNP4Jldgk/PYT31P
         qnGD2DECyCR9D7iWXOAnoMnvPWN/46/QNfE5ykbRXb+uHKYcFcvY2iQgDVcfm6S7x+pB
         5Ws7MZtVK3UtUF+Xn4nLvV+DlBjZmF8JT0GT8OFKz4+y5SXnKeSXlSVSY9mXAD+ObXT0
         do+GApBZa+ZKZJRfHnRpgZuqgZS72wVtYwwH659IFnXn7eobyW8/5UoS8g5S4ZiFTgNz
         CwkYw6wOGtWTw1OCV0u8uNpvQAQUSjHaLruxzBx3AGmjdiyPPzu/uJmOTVQEwS9ycG8D
         TwVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689604855; x=1692196855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ThvgRboCSDvEXREJE4U7nta8TE4rl24QuMRMslv53Fs=;
        b=ZQdki3jVDYLWWnhvRrvqVbKQ84i3ieaEhbcyv63nKslp6n9PnCxFSHRWYY2umxtL1L
         g36y+RA151hZfnKRT+47ElUa5zwQyOCpcqVpBkyw9AOjp1y2hqDBXp7jMuJN60S2qzPN
         kWp/FsJ+7sGC+G7eewiBCckXdLUXxS98b3FIIutT+I+xiaBrxeD/D1LK5pZE7QGQQdBx
         7Rysi5w882YReoYfqxQ63+f+aI2sDWXBIZCXGxVbE5MlrvrPdqFGHosu3MheMlNt1te+
         QkIRhG94u+QGj5IVUaCsqwGRziENg7ug6kRNqW33+4bmfqfFLnEhlOZa1D4zdU4oPG1m
         ig1A==
X-Gm-Message-State: ABy/qLYtR4kHovp4O39tgm7OGt2XevJAzAEzIjjzdYvc/tMp/pmtSiaw
	EdxBq1EeVIJHdl5hvp84R4NegvOfWuoBTest
X-Google-Smtp-Source: APBJJlGu1YQLCviMcAIgoznHE/5aMvL6olLbw4P9LoNcE05IS4TGDEjo1zWxrA3877a0svdcuTeyFQ==
X-Received: by 2002:a05:6512:2813:b0:4fd:bdf8:9326 with SMTP id cf19-20020a056512281300b004fdbdf89326mr2509197lfb.67.1689604855144;
        Mon, 17 Jul 2023 07:40:55 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v3 3/3] xen/riscv: introduce identity mapping
Date: Mon, 17 Jul 2023 17:40:50 +0300
Message-ID: <8c69050d7b1f42df5e776ca9494164a4d15f2d52.1689604562.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1689604562.git.oleksii.kurochko@gmail.com>
References: <cover.1689604562.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The way how switch to virtual address was implemented in the
commit e66003e7be ("xen/riscv: introduce setup_initial_pages")
isn't safe enough as:
* enable_mmu() depends on hooking all exceptions
  and pagefault.
* Any exception other than pagefault, or not taking a pagefault
  causes it to malfunction, which means you will fail to boot
  depending on where Xen was loaded into memory.

Instead of the proposed way of switching to virtual addresses was
decided to use identity mapping of the entrire Xen and after
switching to virtual addresses identity mapping is removed from
page-tables.
Since it is not easy to keep track where the identity map was mapped,
so we will look for the top-most entry exclusive to the identity
map and remove it.

Fixes: e66003e7be ("xen/riscv: introduce setup_initial_pages")
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Changes in V3:
 - remove unrelated to the patch changes ( SPDX tags in config.h ).
 - update definition of PGTBL_INITIAL_COUNT taking into account identity mapping.
 - refactor remove_identity_mapping() function.
 - add explanatory comments in xen.lds.S and mm.c.
 - update commit message.
 - move save/restore of a0/a1 registers to [PATCH v2 2/3] xen/riscv: introduce
   function for physical offset calculation.
---
Changes in V2:
  - update definition of PGTBL_INITIAL_COUNT and the comment above.
  - code style fixes.
  - 1:1 mapping for entire Xen.
  - remove id_addrs array becase entire Xen is mapped.
  - reverse condition for cycle inside remove_identity_mapping().
  - fix page table walk in remove_identity_mapping().
  - update the commit message.
  - add Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
  - save hart_id and dtb_addr before call MMU related C functions.
  - use phys_offset variable instead of doing calcultations to get phys offset
    in head.S file. ( it can be easily done as entire Xen is 1:1 mapped )
  - declare enable_muu() as __init.
---
 xen/arch/riscv/include/asm/mm.h |  3 +-
 xen/arch/riscv/mm.c             | 98 +++++++++++++++++++++------------
 xen/arch/riscv/riscv64/head.S   | 22 ++++++++
 xen/arch/riscv/setup.c          | 14 +----
 xen/arch/riscv/xen.lds.S        |  4 ++
 5 files changed, 92 insertions(+), 49 deletions(-)

diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index d9c4205103..085eaab7fb 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -13,7 +13,8 @@ extern unsigned char cpu0_boot_stack[];
 void setup_initial_pagetables(void);
 
 void enable_mmu(void);
-void cont_after_mmu_is_enabled(void);
+
+void remove_identity_mapping(void);
 
 void calc_phys_offset(void);
 
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index c84a8a7c3c..34cd62eefe 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -25,6 +25,12 @@ unsigned long __ro_after_init phys_offset;
 #define LOAD_TO_LINK(addr) ((unsigned long)(addr) - phys_offset)
 #define LINK_TO_LOAD(addr) ((unsigned long)(addr) + phys_offset)
 
+/*
+ * Should be removed as soon as enough headers will be merged for inclusion of
+ * <xen/lib.h>.
+ */
+#define ARRAY_SIZE(arr)		(sizeof(arr) / sizeof((arr)[0]))
+
 /*
  * It is expected that Xen won't be more then 2 MB.
  * The check in xen.lds.S guarantees that.
@@ -35,8 +41,10 @@ unsigned long __ro_after_init phys_offset;
  *
  * It might be needed one more page table in case when Xen load address
  * isn't 2 MB aligned.
+ *
+ * CONFIG_PAGING_LEVELS page tables are needed for identity mapping.
  */
-#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) + 1)
+#define PGTBL_INITIAL_COUNT (CONFIG_PAGING_LEVELS * 2 + 1)
 
 pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
 stage1_pgtbl_root[PAGETABLE_ENTRIES];
@@ -75,6 +83,7 @@ static void __init setup_initial_mapping(struct mmu_desc *mmu_desc,
     unsigned int index;
     pte_t *pgtbl;
     unsigned long page_addr;
+    bool is_identity_mapping = map_start == pa_start;
 
     if ( (unsigned long)_start % XEN_PT_LEVEL_SIZE(0) )
     {
@@ -108,16 +117,18 @@ static void __init setup_initial_mapping(struct mmu_desc *mmu_desc,
             {
                 unsigned long paddr = (page_addr - map_start) + pa_start;
                 unsigned int permissions = PTE_LEAF_DEFAULT;
+                unsigned long addr = is_identity_mapping
+                                     ? page_addr : LINK_TO_LOAD(page_addr);
                 pte_t pte_to_be_written;
 
                 index = pt_index(0, page_addr);
 
-                if ( is_kernel_text(LINK_TO_LOAD(page_addr)) ||
-                     is_kernel_inittext(LINK_TO_LOAD(page_addr)) )
-                    permissions =
-                        PTE_EXECUTABLE | PTE_READABLE | PTE_VALID;
+                if ( is_kernel_text(addr) ||
+                     is_kernel_inittext(addr) )
+                        permissions =
+                            PTE_EXECUTABLE | PTE_READABLE | PTE_VALID;
 
-                if ( is_kernel_rodata(LINK_TO_LOAD(page_addr)) )
+                if ( is_kernel_rodata(addr) )
                     permissions = PTE_READABLE | PTE_VALID;
 
                 pte_to_be_written = paddr_to_pte(paddr, permissions);
@@ -211,6 +222,10 @@ void __init setup_initial_pagetables(void)
     unsigned long linker_start  = LOAD_TO_LINK(load_start);
     unsigned long linker_end    = LOAD_TO_LINK(load_end);
 
+    /*
+     * If the overlapping check will be removed then remove_identity_mapping()
+     * logic should be updated.
+     */
     if ( (linker_start != load_start) &&
          (linker_start <= load_end) && (load_start <= linker_end) )
     {
@@ -232,22 +247,18 @@ void __init setup_initial_pagetables(void)
                           linker_start,
                           linker_end,
                           load_start);
+
+    if ( linker_start == load_start )
+        return;
+
+    setup_initial_mapping(&mmu_desc,
+                          load_start,
+                          load_end,
+                          load_start);
 }
 
-void __init noreturn noinline enable_mmu()
+void __init enable_mmu(void)
 {
-    /*
-     * Calculate a linker time address of the mmu_is_enabled
-     * label and update CSR_STVEC with it.
-     * MMU is configured in a way where linker addresses are mapped
-     * on load addresses so in a case when linker addresses are not equal
-     * to load addresses, after MMU is enabled, it will cause
-     * an exception and jump to linker time addresses.
-     * Otherwise if load addresses are equal to linker addresses the code
-     * after mmu_is_enabled label will be executed without exception.
-     */
-    csr_write(CSR_STVEC, LOAD_TO_LINK((unsigned long)&&mmu_is_enabled));
-
     /* Ensure page table writes precede loading the SATP */
     sfence_vma();
 
@@ -255,25 +266,40 @@ void __init noreturn noinline enable_mmu()
     csr_write(CSR_SATP,
               PFN_DOWN((unsigned long)stage1_pgtbl_root) |
               RV_STAGE1_MODE << SATP_MODE_SHIFT);
+}
 
-    asm volatile ( ".p2align 2" );
- mmu_is_enabled:
-    /*
-     * Stack should be re-inited as:
-     * 1. Right now an address of the stack is relative to load time
-     *    addresses what will cause an issue in case of load start address
-     *    isn't equal to linker start address.
-     * 2. Addresses in stack are all load time relative which can be an
-     *    issue in case when load start address isn't equal to linker
-     *    start address.
-     *
-     * We can't return to the caller because the stack was reseted
-     * and it may have stash some variable on the stack.
-     * Jump to a brand new function as the stack was reseted
-     */
+void __init remove_identity_mapping(void)
+{
+    unsigned int i;
+    pte_t *pgtbl;
+    unsigned int index, xen_index;
+    unsigned long load_start = LINK_TO_LOAD(_start);
+
+    for ( pgtbl = stage1_pgtbl_root, i = CONFIG_PAGING_LEVELS; i; i-- )
+    {
+        index = pt_index(i - 1, load_start);
+        xen_index = pt_index(i - 1, XEN_VIRT_START);
+
+        if ( index != xen_index )
+        {
+            /* remove after it will be possible to include <xen/lib.h> */
+            #define ROUNDUP(x, a) (((x) + (a) - 1) & ~((a) - 1))
+
+            unsigned long load_end = LINK_TO_LOAD(_end);
+            unsigned long pt_level_size = XEN_PT_LEVEL_SIZE(i - 1);
+            unsigned long xen_size = ROUNDUP(load_end - load_start, pt_level_size);
+            unsigned long page_entries_num = xen_size / pt_level_size;
+
+            while ( page_entries_num-- )
+                pgtbl[index++].pte = 0;
+
+            break;
 
-    switch_stack_and_jump((unsigned long)cpu0_boot_stack + STACK_SIZE,
-                          cont_after_mmu_is_enabled);
+            #undef ROUNDUP
+        }
+
+        pgtbl = (pte_t *)pte_to_paddr(pgtbl[index]);
+    }
 }
 
 /*
diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
index 9015d06233..41983ffe63 100644
--- a/xen/arch/riscv/riscv64/head.S
+++ b/xen/arch/riscv/riscv64/head.S
@@ -39,6 +39,28 @@ ENTRY(start)
 
         jal     calc_phys_offset
 
+        jal     setup_initial_pagetables
+
+        jal     enable_mmu
+
+        la      t1, phys_offset
+        REG_L   t1, (t1)
+
+        /* Calculate proper VA after jump from 1:1 mapping */
+        la      t0, .L_primary_switched
+        sub     t0, t0, t1
+
+        /* Jump from 1:1 mapping world */
+        jr      t0
+
+.L_primary_switched:
+        /*
+         * cpu0_boot_stack address is 1:1 mapping related so it should be
+         * recalculated after jump from 1:1 mapping world as 1:1 mapping
+         * will be removed soon in start_xen().
+         */
+        jal     reset_stack
+
         /* restore bootcpu_id and dtb address */
         mv      a0, s0
         mv      a1, s1
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index dde8fb898b..6593f601c1 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -13,20 +13,10 @@ unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
 void __init noreturn start_xen(unsigned long bootcpu_id,
                                paddr_t dtb_addr)
 {
-    early_printk("Hello from C env\n");
-
-    setup_initial_pagetables();
-
-    enable_mmu();
-
-    for ( ;; )
-        asm volatile ("wfi");
+    remove_identity_mapping();
 
-    unreachable();
-}
+    early_printk("Hello from C env\n");
 
-void __init noreturn cont_after_mmu_is_enabled(void)
-{
     early_printk("All set up\n");
 
     for ( ;; )
diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index 9064852173..31ccebadcb 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -173,4 +173,8 @@ ASSERT(IS_ALIGNED(__bss_end,        POINTER_ALIGN), "__bss_end is misaligned")
 ASSERT(!SIZEOF(.got),      ".got non-empty")
 ASSERT(!SIZEOF(.got.plt),  ".got.plt non-empty")
 
+/*
+ * Changing the size of Xen binary can require an update of
+ * PGTBL_INITIAL_COUNT.
+ */
 ASSERT(_end - _start <= MB(2), "Xen too large for early-boot assumptions")
-- 
2.41.0


