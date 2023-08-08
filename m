Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADDA773AE7
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 17:14:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580031.908302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTOPx-0004ph-St; Tue, 08 Aug 2023 15:14:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580031.908302; Tue, 08 Aug 2023 15:14:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTOPx-0004lv-PH; Tue, 08 Aug 2023 15:14:41 +0000
Received: by outflank-mailman (input) for mailman id 580031;
 Tue, 08 Aug 2023 15:14:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IVOA=DZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qTOPw-0004UR-KW
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 15:14:40 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ae78a6b-35fe-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 17:14:39 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b974031aeaso89851441fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Aug 2023 08:14:39 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 i19-20020a2e8093000000b002ba053e1f9bsm2319794ljg.35.2023.08.08.08.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Aug 2023 08:14:38 -0700 (PDT)
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
X-Inumbo-ID: 4ae78a6b-35fe-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691507678; x=1692112478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zBo4a0LOmDp0vEKiKru6TZXuvShqIRQBxpU/AyLezzQ=;
        b=W3sPxy5JVA9DZUH6+fZtB1MMqE9D1LYuuritC/SsrYZSIN9CAtWdnURRVd0oOmitmH
         qJUJPATaxTtZGG4cFzq27S0w4vYxbZBCUurObCxz7xFWCZinQx80cQh4djxTC+fKYK78
         WHXM2lPKbweGA0gm7YlGLl0Nf97ZaU+wdUtwcJ8qfX93Gkc3TNS8DyT3vodbpaveN/fR
         gxFEo4H/BF4um5bflbihsECUdDK05w5qr0vU3lWwZrn02BNS8BtJZA+pCW4kxYg4Zp/o
         N84/EuKlhgH3AXeiC/b53dymF+wHHxeg5xHzD5oJK4XJ8XcT1F6RMYJYNJOCKtvkzqkv
         GYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691507678; x=1692112478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zBo4a0LOmDp0vEKiKru6TZXuvShqIRQBxpU/AyLezzQ=;
        b=CWV/rj3sxJVF/qp5G5oY9gr6TvJlSxtAtJXPxhimBtJ2zbbjcHY1OG1iM7BaAUTK2r
         jR9hWya7TE/eG4wFlZUJoDtwgnuDG66XeaH4BsshGaepR2iW3vXCqK30fEzKGwEUTrRK
         OgLTarixsifO+CeBwDEXHLk7VL46/xJ+oMkEIuz5n4Tl0zma+OJNTQKlpaT/4NrExc/A
         R4LdvbeEBhDhP5d8SOnhXTL8My9GWsIynT4LMt1FsjsTuotOucvkcYwfiw6v/UrnR6IT
         xnTSnXH5jQrLsVKcSLTeGq41WirWkugtvjdJmtNMfiUojQtOJQEsNy6Ihhm/htamqTd6
         ei9w==
X-Gm-Message-State: AOJu0YwBW9qez9Ydvez/V5+0i3/cNjP4oVrvamlBMn/KfR6Oew/ns0ga
	18jVaWqKrKuSiBVA5m/rNjnlFD6olgM=
X-Google-Smtp-Source: AGHT+IEFvXB/+IbxQgNVpghbUdJMZXkb/OylUu793A5PEzUAfDWm0qCdCXMMhDENg8zS/aq6K/3cgQ==
X-Received: by 2002:a2e:3c05:0:b0:2b6:d6e1:a191 with SMTP id j5-20020a2e3c05000000b002b6d6e1a191mr9172586lja.23.1691507678228;
        Tue, 08 Aug 2023 08:14:38 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v7 2/2] xen/riscv: introduce identity mapping
Date: Tue,  8 Aug 2023 18:14:34 +0300
Message-ID: <177ad805a6508cf4adc9f54c20333ebcf12c333b.1691507564.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1691507564.git.oleksii.kurochko@gmail.com>
References: <cover.1691507564.git.oleksii.kurochko@gmail.com>
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
decided to use identity mapping for area which constains needed code
to switch from identity mapping and after switching to virtual addresses,
identity mapping is removed from page-tables in the following way:
search for top-most page table entry and remove it.

Fixes: e66003e7be ("xen/riscv: introduce setup_initial_pages")
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Changes in V7:
 - use srli instruction to be consistent with slli instruction in turn_on_mmu()
---
Changes in V6:
 - t2 register was renamed to t1 as t1 isn't used anymore in
   turn_on_mmu().
 - fold li, sll instructions to slli.
 - use a0 directly to calculate an argument of turn_on_mmu() instead of t0.
---
Changes in V5:
 - update the algo of identity mapping removing.
 - introduce IDENT_AREA_SIZE.
 - introduce turn_on_mmu() function to enable and switch from 1:1 mapping.
 - fix typo in PGTBL_INITIAL_COUNT define.
 - update the comment above PGTBL_INITIAL_COUNT.
 - update the commit message.
---
Changes in V4:
 - remove definition of ARRAY_SIZE and ROUNDUP as <xen/macors.h> was introduced where these macros are located now.
 - update definition of PGTBL_INITIAL_COUNT
 - update the commit message
 - update the algo of identity mapping removing
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
 xen/arch/riscv/include/asm/acpi.h   |  6 ++
 xen/arch/riscv/include/asm/config.h |  2 +
 xen/arch/riscv/include/asm/mm.h     |  5 +-
 xen/arch/riscv/mm.c                 | 90 +++++++++++++++--------------
 xen/arch/riscv/riscv64/head.S       | 30 ++++++++++
 xen/arch/riscv/setup.c              | 14 +----
 xen/arch/riscv/xen.lds.S            | 11 ++++
 7 files changed, 103 insertions(+), 55 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/acpi.h

diff --git a/xen/arch/riscv/include/asm/acpi.h b/xen/arch/riscv/include/asm/acpi.h
new file mode 100644
index 0000000000..3aef993d81
--- /dev/null
+++ b/xen/arch/riscv/include/asm/acpi.h
@@ -0,0 +1,6 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __ASM_RISCV_ACPI_H
+#define __ASM_RISCV_ACPI_H
+
+#endif /* __ASM_RISCV_ACPI_H */
diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index fa90ae0898..f0544c6a20 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -95,6 +95,8 @@
 #define RV_STAGE1_MODE SATP_MODE_SV32
 #endif
 
+#define IDENT_AREA_SIZE 64
+
 #endif /* __RISCV_CONFIG_H__ */
 /*
  * Local variables:
diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 7b94cbadd7..07c7a0abba 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -13,8 +13,11 @@ extern unsigned char cpu0_boot_stack[];
 void setup_initial_pagetables(void);
 
 void enable_mmu(void);
-void cont_after_mmu_is_enabled(void);
+
+void remove_identity_mapping(void);
 
 unsigned long calc_phys_offset(void);
 
+void turn_on_mmu(unsigned long ra);
+
 #endif /* _ASM_RISCV_MM_H */
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index a73f135a3c..053f043a3d 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -4,6 +4,7 @@
 #include <xen/compiler.h>
 #include <xen/init.h>
 #include <xen/kernel.h>
+#include <xen/macros.h>
 #include <xen/pfn.h>
 
 #include <asm/early_printk.h>
@@ -35,8 +36,11 @@ static unsigned long __ro_after_init phys_offset;
  *
  * It might be needed one more page table in case when Xen load address
  * isn't 2 MB aligned.
+ *
+ * CONFIG_PAGING_LEVELS page tables are needed for the identity mapping,
+ * except that the root page table is shared with the initial mapping
  */
-#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) + 1)
+#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) * 2 + 1)
 
 pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
 stage1_pgtbl_root[PAGETABLE_ENTRIES];
@@ -75,6 +79,7 @@ static void __init setup_initial_mapping(struct mmu_desc *mmu_desc,
     unsigned int index;
     pte_t *pgtbl;
     unsigned long page_addr;
+    bool is_identity_mapping = map_start == pa_start;
 
     if ( (unsigned long)_start % XEN_PT_LEVEL_SIZE(0) )
     {
@@ -108,16 +113,18 @@ static void __init setup_initial_mapping(struct mmu_desc *mmu_desc,
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
@@ -211,6 +218,13 @@ void __init setup_initial_pagetables(void)
     unsigned long linker_start  = LOAD_TO_LINK(load_start);
     unsigned long linker_end    = LOAD_TO_LINK(load_end);
 
+    unsigned long ident_start;
+    unsigned long ident_end;
+
+    /*
+     * If the overlapping check will be removed then remove_identity_mapping()
+     * logic should be updated.
+     */
     if ( (linker_start != load_start) &&
          (linker_start <= load_end) && (load_start <= linker_end) )
     {
@@ -232,48 +246,40 @@ void __init setup_initial_pagetables(void)
                           linker_start,
                           linker_end,
                           load_start);
+
+    if ( linker_start == load_start )
+        return;
+
+    ident_start = (unsigned long)turn_on_mmu & XEN_PT_LEVEL_MAP_MASK(0);
+    ident_end = ident_start + PAGE_SIZE;
+
+    setup_initial_mapping(&mmu_desc,
+                          ident_start,
+                          ident_end,
+                          ident_start);
 }
 
-void __init noreturn noinline enable_mmu()
+void __init remove_identity_mapping(void)
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
-    /* Ensure page table writes precede loading the SATP */
-    sfence_vma();
+    unsigned int i;
+    pte_t *pgtbl;
+    unsigned int index, xen_index;
+    unsigned long ident_start =
+        LINK_TO_LOAD(turn_on_mmu) & XEN_PT_LEVEL_MAP_MASK(0);
 
-    /* Enable the MMU and load the new pagetable for Xen */
-    csr_write(CSR_SATP,
-              PFN_DOWN((unsigned long)stage1_pgtbl_root) |
-              RV_STAGE1_MODE << SATP_MODE_SHIFT);
+    for ( pgtbl = stage1_pgtbl_root, i = CONFIG_PAGING_LEVELS; i; i-- )
+    {
+        index = pt_index(i - 1, ident_start);
+        xen_index = pt_index(i - 1, XEN_VIRT_START);
 
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
+        if ( index != xen_index )
+        {
+            pgtbl[index].pte = 0;
+            break;
+        }
 
-    switch_stack_and_jump((unsigned long)cpu0_boot_stack + STACK_SIZE,
-                          cont_after_mmu_is_enabled);
+        pgtbl = (pte_t *)LOAD_TO_LINK(pte_to_paddr(pgtbl[index]));
+    }
 }
 
 /*
diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
index ae194bb099..b6ce2894ab 100644
--- a/xen/arch/riscv/riscv64/head.S
+++ b/xen/arch/riscv/riscv64/head.S
@@ -39,6 +39,22 @@ ENTRY(start)
         jal     calc_phys_offset
         mv      s2, a0
 
+        jal     setup_initial_pagetables
+
+        /* Calculate proper VA after jump from 1:1 mapping */
+        la      a0, .L_primary_switched
+        sub     a0, a0, s2
+
+        jal     turn_on_mmu
+
+.L_primary_switched:
+        /*
+         * cpu0_boot_stack address is 1:1 mapping related so it should be
+         * recalculated after jump from 1:1 mapping world as 1:1 mapping
+         * will be removed soon in start_xen().
+         */
+        jal     reset_stack
+
         /* restore hart_id ( bootcpu_id ) and dtb address */
         mv      a0, s0
         mv      a1, s1
@@ -54,3 +70,17 @@ ENTRY(reset_stack)
 
         ret
 
+        .section .text.ident, "ax", %progbits
+
+ENTRY(turn_on_mmu)
+        sfence.vma
+
+        li      t0, RV_STAGE1_MODE
+        slli    t0, t0, SATP_MODE_SHIFT
+
+        la      t1, stage1_pgtbl_root
+        srli    t1, t1, PAGE_SHIFT
+        or      t1, t1, t0
+        csrw    CSR_SATP, t1
+
+        jr      a0
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
index 9064852173..3fa7db3bf9 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -31,6 +31,11 @@ SECTIONS
         *(.text.*)
 #endif
 
+        . = ALIGN(IDENT_AREA_SIZE);
+        _ident_start = .;
+        *(.text.ident)
+        _ident_end = .;
+
         *(.fixup)
         *(.gnu.warning)
         . = ALIGN(POINTER_ALIGN);
@@ -173,4 +178,10 @@ ASSERT(IS_ALIGNED(__bss_end,        POINTER_ALIGN), "__bss_end is misaligned")
 ASSERT(!SIZEOF(.got),      ".got non-empty")
 ASSERT(!SIZEOF(.got.plt),  ".got.plt non-empty")
 
+/*
+ * Changing the size of Xen binary can require an update of
+ * PGTBL_INITIAL_COUNT.
+ */
 ASSERT(_end - _start <= MB(2), "Xen too large for early-boot assumptions")
+
+ASSERT(_ident_end - _ident_start <= IDENT_AREA_SIZE, "identity region is too big");
-- 
2.41.0


