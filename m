Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D56B7724D94
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jun 2023 21:55:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544189.849814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6cm8-0003zq-2o; Tue, 06 Jun 2023 19:55:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544189.849814; Tue, 06 Jun 2023 19:55:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6cm7-0003u8-Uu; Tue, 06 Jun 2023 19:55:27 +0000
Received: by outflank-mailman (input) for mailman id 544189;
 Tue, 06 Jun 2023 19:55:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymfh=B2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1q6cm6-0002er-21
 for xen-devel@lists.xenproject.org; Tue, 06 Jun 2023 19:55:26 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13064545-04a4-11ee-8611-37d641c3527e;
 Tue, 06 Jun 2023 21:55:23 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f611ac39c5so6324518e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jun 2023 12:55:23 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 j29-20020ac2551d000000b004f1383d57ecsm1563284lfk.202.2023.06.06.12.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 12:55:22 -0700 (PDT)
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
X-Inumbo-ID: 13064545-04a4-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686081323; x=1688673323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=efjoH6YD/NFQ9wxK29jeXVZ4gBqY6bo96HJMQ+wU7+s=;
        b=IzT6WqJv+D8ugHDKjmTICaR1Sxn3wyRwA3GFTrztineoxv69HfJ+OkIeiDmKwLV+fK
         6I0m5K40P4q4b4jNbvtResiQ10VttI2r77l+iucyWTUv+2RhchZudesKoAREn4YRSvUW
         Y2WqVxdKrSMMCKQNC3NVaBw/QdsTX4/AzXJAewKHSKT38TOgQA3+LMg3OkoRlWqi4wkl
         9P7S6tNcyvc9ThPkTQmj5dgySiXH4baKXK1puCTBQemMQJ8mgoYrP4lEiWfCGLsTMpwv
         nqRgR5mVCzxbC4xALShu791X1yzngMlNO0dNpj6pbgiiUFTsdGgXNcttJlGY9YMvw0pQ
         WPlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686081323; x=1688673323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=efjoH6YD/NFQ9wxK29jeXVZ4gBqY6bo96HJMQ+wU7+s=;
        b=Tb47hrsiwhdjSgkExIlIj7OCgnTmyrzDmoj1sOh5F2+8JzjoeN1Kk/gZKnAGABhSOU
         nEZvzinCJvPaFE1i+3sHSmAW+0K6eLk5Fl9zaz0jcH76hCTzXocfOVjVx7BkzYlHXjIx
         dxxTCCU8TRnGsHpMBFSujJCXaXq8eav6tcXA5qSlFN3yge3Px1hk+mY9pQuBw3j6SGWv
         dNjktVxjKJ85fPJ5Praf+ZwWj+I3NXrLKZeyU+9e4XnNUnCluFn/SgxTwYs0HTf4/5Or
         bedYkdKjhela6JrQBPZ5iSSkGq7CACHeXXEeubtOjOrgIPxEhPdpZ6P6BnFWdoM2Mon5
         w9pw==
X-Gm-Message-State: AC+VfDykR1/JU5UH+23hLzdY4Q8q1XsjNg7vKgtojCZ92p4ucZD4lExH
	46WFgFRhaIdmlLaP2Cfo2wLIf9DC95A=
X-Google-Smtp-Source: ACHHUZ5c9Rv5X/veMwg4l2ZWaYseSRPYtCf8TDawy3b6rVcB/VpclMQuUaY9txvzD8tLgvANkIjmGA==
X-Received: by 2002:ac2:4c18:0:b0:4f2:6651:7c7b with SMTP id t24-20020ac24c18000000b004f266517c7bmr1328798lfq.61.1686081322877;
        Tue, 06 Jun 2023 12:55:22 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 5/8] xen/riscv: introduce identity mapping
Date: Tue,  6 Jun 2023 22:55:13 +0300
Message-Id: <32aef31768cd81ffc8c848af6c29cd8510bbbf6d.1686080337.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1686080337.git.oleksii.kurochko@gmail.com>
References: <cover.1686080337.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The way how switch to virtual address was implemented in the
commit e66003e7be ("xen/riscv: introduce setup_initial_pages")
wasn't safe enough so identity mapping was introduced and
used.

Fixes: e66003e7be ("xen/riscv: introduce setup_initial_pages")
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/mm.h |  3 +-
 xen/arch/riscv/mm.c             | 99 ++++++++++++++++++++++-----------
 xen/arch/riscv/riscv64/head.S   | 30 ++++++++++
 xen/arch/riscv/setup.c          | 14 +----
 4 files changed, 99 insertions(+), 47 deletions(-)

diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 996041ce81..500fdc9c5a 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -9,7 +9,8 @@
 void setup_initial_pagetables(void);
 
 void enable_mmu(void);
-void cont_after_mmu_is_enabled(void);
+
+void remove_identity_mapping(void);
 
 void calc_phys_offset(void);
 
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index c092897f9a..ab790f571d 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -24,6 +24,11 @@ static unsigned long phys_offset;
 #define LOAD_TO_LINK(addr) ((unsigned long)(addr) - phys_offset)
 #define LINK_TO_LOAD(addr) ((unsigned long)(addr) + phys_offset)
 
+/*
+ * Should be removed as soon as enough headers will be merged for inclusion of
+ * <xen/lib.h>.
+ */
+#define ARRAY_SIZE(arr)		(sizeof(arr) / sizeof((arr)[0]))
 
 /*
  * It is expected that Xen won't be more then 2 MB.
@@ -35,8 +40,10 @@ static unsigned long phys_offset;
  *
  * It might be needed one more page table in case when Xen load address
  * isn't 2 MB aligned.
+ *
+ * 3 additional page tables are needed for identity mapping.
  */
-#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) + 1)
+#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) + 1 + 3)
 
 pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
 stage1_pgtbl_root[PAGETABLE_ENTRIES];
@@ -75,6 +82,7 @@ static void __init setup_initial_mapping(struct mmu_desc *mmu_desc,
     unsigned int index;
     pte_t *pgtbl;
     unsigned long page_addr;
+    bool is_identity_mapping = (map_start == pa_start);
 
     if ( (unsigned long)_start % XEN_PT_LEVEL_SIZE(0) )
     {
@@ -108,16 +116,18 @@ static void __init setup_initial_mapping(struct mmu_desc *mmu_desc,
             {
                 unsigned long paddr = (page_addr - map_start) + pa_start;
                 unsigned int permissions = PTE_LEAF_DEFAULT;
+                unsigned long addr = (is_identity_mapping) ?
+                                     page_addr : LINK_TO_LOAD(page_addr);
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
@@ -232,22 +242,27 @@ void __init setup_initial_pagetables(void)
                           linker_start,
                           linker_end,
                           load_start);
+
+    if ( linker_start == load_start )
+        return;
+
+    setup_initial_mapping(&mmu_desc,
+                          load_start,
+                          load_start + PAGE_SIZE,
+                          load_start);
+
+    setup_initial_mapping(&mmu_desc,
+                          (unsigned long)cpu0_boot_stack,
+                          (unsigned long)cpu0_boot_stack + PAGE_SIZE,
+                          (unsigned long)cpu0_boot_stack);
 }
 
-void __init noreturn noinline enable_mmu()
+/*
+ * enable_mmu() can't be __init because __init section isn't part of identity
+ * mapping so it will cause an issue after MMU will be enabled.
+ */
+void enable_mmu(void)
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
 
@@ -255,25 +270,41 @@ void __init noreturn noinline enable_mmu()
     csr_write(CSR_SATP,
               PFN_DOWN((unsigned long)stage1_pgtbl_root) |
               RV_STAGE1_MODE << SATP_MODE_SHIFT);
+}
+
+void __init remove_identity_mapping(void)
+{
+    int i, j;
+    pte_t *pgtbl;
+    unsigned int index, xen_index;
 
-    asm volatile ( ".p2align 2" );
- mmu_is_enabled:
     /*
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
+     * id_addrs should be in sync with id mapping in
+     * setup_initial_pagetables()
      */
+    unsigned long id_addrs[] =  {
+                                 LINK_TO_LOAD(_start),
+                                 LINK_TO_LOAD(cpu0_boot_stack),
+                                };
 
-    switch_stack_and_jump((unsigned long)cpu0_boot_stack + STACK_SIZE,
-                          cont_after_mmu_is_enabled);
+    pgtbl = stage1_pgtbl_root;
+
+    for ( j = 0; j < ARRAY_SIZE(id_addrs); j++ )
+    {
+        for ( pgtbl = stage1_pgtbl_root, i = CONFIG_PAGING_LEVELS - 1; i >= 0; i-- )
+        {
+            index = pt_index(i, id_addrs[j]);
+            xen_index = pt_index(i, XEN_VIRT_START);
+
+            if ( index != xen_index )
+            {
+                pgtbl[index].pte = 0;
+                break;
+            }
+
+            pgtbl = &pgtbl[index];
+        }
+    }
 }
 
 /*
diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
index 69f3a24987..582078798a 100644
--- a/xen/arch/riscv/riscv64/head.S
+++ b/xen/arch/riscv/riscv64/head.S
@@ -31,6 +31,36 @@ ENTRY(start)
 
         jal     calc_phys_offset
 
+        jal     setup_initial_pagetables
+
+        jal     enable_mmu
+
+        /*
+         * Calculate physical offset
+         *
+         * We can't re-use a value in phys_offset variable here as
+         * phys_offset is located in .bss and this section isn't
+         * 1:1 mapped and an access to it will cause MMU fault
+         */
+        li      t0, XEN_VIRT_START
+        la      t1, start
+        sub     t1, t1, t0
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
         tail    start_xen
 
 ENTRY(reset_stack)
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 845d18d86f..c4ef0b3165 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -11,20 +11,10 @@ unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
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
-- 
2.40.1


