Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A06475EF52
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 11:43:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568526.887926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNs5b-00061S-9F; Mon, 24 Jul 2023 09:42:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568526.887926; Mon, 24 Jul 2023 09:42:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNs5b-0005yI-5Y; Mon, 24 Jul 2023 09:42:51 +0000
Received: by outflank-mailman (input) for mailman id 568526;
 Mon, 24 Jul 2023 09:42:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c6P8=DK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qNs5Z-0005hi-IK
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 09:42:49 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7188aa35-2a06-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 11:42:46 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5217bb5ae05so5541090a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 02:42:47 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 k10-20020aa7c04a000000b0050488d1d376sm6020958edo.0.2023.07.24.02.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 02:42:45 -0700 (PDT)
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
X-Inumbo-ID: 7188aa35-2a06-11ee-8612-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690191766; x=1690796566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3A7jIfn7cd5zSr8lvNclLlaXmI+gimV3tunSWePZzuo=;
        b=FjreHnYj84PURYQMOG0tUHg+XaO1B9OA3QVLQjya6LJldeYPkey2vp9IUaPHOh4NQy
         MT2iIAlfbtOO/34TpgSXH3aCtWK3c2vldGXFpGzPnrnr2ogTMq72dzamNad5ueGMkwAT
         3myLua7hvHOW9CklzECY3YKzu+hBvQ+5TspzuGN//+h68Av93EIrXExoPmJVWyeXqqSb
         NUIm2vaDT/mlWHyRPu2CdgOC/yi6ssthGQ8T9hQKV7QrjMqV4C87/VbMcccXWjuWSACX
         DGBSlMMEORsIbZNE8gK0xdYh8PjH6sHyZ5W9yHxnk5VrD9irW4g2fomW+zZ4nnMiDJyQ
         IeEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690191766; x=1690796566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3A7jIfn7cd5zSr8lvNclLlaXmI+gimV3tunSWePZzuo=;
        b=hUzEegW0N7UZcxX3bKnIqmYyfqeqtxC9eyE5IvrCx11xgtsGHuh5ybgDTQ/iJVmuG1
         li0PBsb3sM1kBbRUuDt3lf7aAgyun2sWIYB+rG1eVpXiAjqeqMVCHgpl/xeEI+YAvtjP
         1GLe6RwH8eFb8b0nOatFSpzfS8fnQSmbR7KeJM0QaOFbwz6rNg6/SwoERL52likxhKw+
         gxTUKYfBKXaoRperjjY+JNynuUtrzwp7MbHZaq01b31+BuaNZJ4XGTGIq+3F3LWXLnKV
         gROCpl2vQG35OUiuuoJmSWOtR29CqZgtp4ZUvkyQ0EdslyJPCb0NTFy9TYcYI90d4s8U
         do/Q==
X-Gm-Message-State: ABy/qLawgpy+0D7afEFdy73yx+kjC7nDtG7Ri81vI9WHd2WQLm9iqpsE
	dInUNtxrSCgkKutIy19CrZ5Q2MZ0vTg=
X-Google-Smtp-Source: APBJJlG3Jq/VevmjGpaGSwcVLTeyfhAWXO+R3+Bc6NhCeh5J20ZztJ0zkfTfmbGo4ZDw8LV/OAY01Q==
X-Received: by 2002:a05:6402:609:b0:51e:c82:6f3b with SMTP id n9-20020a056402060900b0051e0c826f3bmr7925509edv.16.1690191765947;
        Mon, 24 Jul 2023 02:42:45 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v4 2/2] xen/riscv: introduce identity mapping
Date: Mon, 24 Jul 2023 12:42:41 +0300
Message-ID: <a8ab1829ab718dda869db3df3348ded211e81967.1690191480.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1690191480.git.oleksii.kurochko@gmail.com>
References: <cover.1690191480.git.oleksii.kurochko@gmail.com>
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
page-tables in the following way: recursively visit all ptes related
to identity mapping and remove them.

Fixes: e66003e7be ("xen/riscv: introduce setup_initial_pages")
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
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
 xen/arch/riscv/include/asm/mm.h |   3 +-
 xen/arch/riscv/mm.c             | 101 ++++++++++++++++++++------------
 xen/arch/riscv/riscv64/head.S   |  22 +++++++
 xen/arch/riscv/setup.c          |  14 +----
 xen/arch/riscv/xen.lds.S        |   4 ++
 5 files changed, 93 insertions(+), 51 deletions(-)

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
index c84a8a7c3c..aae24f3a54 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -4,6 +4,7 @@
 #include <xen/compiler.h>
 #include <xen/init.h>
 #include <xen/kernel.h>
+#include <xen/macros.h>
 #include <xen/pfn.h>
 
 #include <asm/early_printk.h>
@@ -35,8 +36,10 @@ unsigned long __ro_after_init phys_offset;
  *
  * It might be needed one more page table in case when Xen load address
  * isn't 2 MB aligned.
+ *
+ * CONFIG_PAGING_LEVELS page tables are needed for identity mapping.
  */
-#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) + 1)
+#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) * 2) + 1
 
 pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
 stage1_pgtbl_root[PAGETABLE_ENTRIES];
@@ -75,10 +78,11 @@ static void __init setup_initial_mapping(struct mmu_desc *mmu_desc,
     unsigned int index;
     pte_t *pgtbl;
     unsigned long page_addr;
+    bool is_identity_mapping = map_start == pa_start;
 
-    if ( (unsigned long)_start % XEN_PT_LEVEL_SIZE(0) )
+    if ( !IS_ALIGNED((unsigned long)_start, KB(4)) )
     {
-        early_printk("(XEN) Xen should be loaded at 4k boundary\n");
+        early_printk("(XEN) Xen should be loaded at 4KB boundary\n");
         die();
     }
 
@@ -108,16 +112,18 @@ static void __init setup_initial_mapping(struct mmu_desc *mmu_desc,
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
@@ -211,6 +217,10 @@ void __init setup_initial_pagetables(void)
     unsigned long linker_start  = LOAD_TO_LINK(load_start);
     unsigned long linker_end    = LOAD_TO_LINK(load_end);
 
+    /*
+     * If the overlapping check will be removed then remove_identity_mapping()
+     * logic should be updated.
+     */
     if ( (linker_start != load_start) &&
          (linker_start <= load_end) && (load_start <= linker_end) )
     {
@@ -232,22 +242,18 @@ void __init setup_initial_pagetables(void)
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
 
@@ -255,25 +261,44 @@ void __init noreturn noinline enable_mmu()
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
+    static pte_t *pgtbl = stage1_pgtbl_root;
+    static unsigned long load_start = XEN_VIRT_START;
+    static unsigned int pt_level = CONFIG_PAGING_LEVELS - 1;
+
+    unsigned long load_end = LINK_TO_LOAD(_end);
+    unsigned long xen_size;
+    unsigned long pt_level_size = XEN_PT_LEVEL_SIZE(pt_level);
+    unsigned long pte_nums;
+
+    unsigned long virt_indx = pt_index(pt_level, XEN_VIRT_START);
+    unsigned long indx;
+
+    if ( load_start == XEN_VIRT_START )
+        load_start = LINK_TO_LOAD(_start);
+
+    xen_size = load_end - load_start;
+    pte_nums = ROUNDUP(xen_size, pt_level_size) / pt_level_size;
+
+    while ( pte_nums-- )
+    {
+        indx = pt_index(pt_level, load_start);
 
-    switch_stack_and_jump((unsigned long)cpu0_boot_stack + STACK_SIZE,
-                          cont_after_mmu_is_enabled);
+        if ( virt_indx != indx )
+        {
+            pgtbl[indx].pte = 0;
+            load_start += XEN_PT_LEVEL_SIZE(pt_level);
+        }
+        else
+        {
+            pgtbl =  (pte_t *)LOAD_TO_LINK(pte_to_paddr(pgtbl[indx]));
+            pt_level--;
+            remove_identity_mapping();
+        }
+    }
 }
 
 /*
diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
index a28714e0ef..d74412351e 100644
--- a/xen/arch/riscv/riscv64/head.S
+++ b/xen/arch/riscv/riscv64/head.S
@@ -38,6 +38,28 @@ ENTRY(start)
 
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
         /* restore hart_id ( bootcpu_id ) and dtb address */
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


