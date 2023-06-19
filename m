Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C57087358B5
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 15:35:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551093.860453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBF21-000205-Ta; Mon, 19 Jun 2023 13:34:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551093.860453; Mon, 19 Jun 2023 13:34:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBF21-0001wq-QC; Mon, 19 Jun 2023 13:34:57 +0000
Received: by outflank-mailman (input) for mailman id 551093;
 Mon, 19 Jun 2023 13:34:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AnRR=CH=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qBF20-0000wG-2K
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 13:34:56 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12f430c3-0ea6-11ee-b234-6b7b168915f2;
 Mon, 19 Jun 2023 15:34:54 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b477e9d396so16229591fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Jun 2023 06:34:54 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 f26-20020a2e9e9a000000b002adb0164258sm5222236ljk.112.2023.06.19.06.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 06:34:52 -0700 (PDT)
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
X-Inumbo-ID: 12f430c3-0ea6-11ee-b234-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687181693; x=1689773693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oc9XrpqHGKjN07zKvhZfUAZGEobGlBzlNsUquN7G9EQ=;
        b=ZkZAUi+4SMhxBZDcxPlPFvUJlTNYtvBiVxqlIc74NR78N8cmRU6dwx4bOQcPTrD//v
         /lSa61v742q9QyrhK+Coo2pZtVmyjqd/0m7lw0dgS6wa4HluZzy0qY1EhZ9Enew+xY1f
         hn22DngA8bKj7Lk8zWoCycHnI3I9qoc2hK2FKOcUjgvPgpWubzK0oc+ryyiqgklecjOg
         FsqDKb06vJbkzFtQ1b8AqUUZ5h0LNedBSLIiONCNy8d5tsx19bUMIt+PN1VRHMA6zWot
         c0k+B/BZ/qSKuQBB5ab3eg9GLetLmuXfWUuuC2+OdsWXYYK8KjOZFV0GUc38yl68CY0N
         RJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687181693; x=1689773693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oc9XrpqHGKjN07zKvhZfUAZGEobGlBzlNsUquN7G9EQ=;
        b=iKAWh2VxyLULOnF4p8lVkZQ1i43AEKv/vDzgAL4oUwn1RNDNULGjDmi7b1bPxNAMH2
         /rIQ0UR3I1IRISVuQUNYIhLu9C1Y7x1qG13Z4DVLBcjTMEGxPDVRJ9oru2ZveRlN4xKT
         ONrfGSu/AQbH8aLNCuzM+5t5r++ELonU+Htq5l1BQyqDVRPx1YMVFAkZIJQ/bH1e5X56
         63WPGUA9RiAr9hWoIcOdoTjt3jPpmuye5AfBrnIZzCSYkbWDLneS3ppX8Wdfwv+QOviF
         lo6PGiQsmgFaNnTqW3WexLE/rLMKaje1OD/SSPUdtS5n4TlZ6BzftpeGBI1gyDVtpi2Z
         uNZA==
X-Gm-Message-State: AC+VfDzrRzIAfsgNKOCYIKn9OCwaI3fWEAfiDSyt+sA5ZsUufHG4mTkF
	YEFQqQu9zCcea/Gq9fRXiENmsnGGbvY=
X-Google-Smtp-Source: ACHHUZ6ObWB2MlCYIatUomne6yHJ3k7kGHyiExiyOkvCU5MNLQp59z2Af3xvzIxoDbYY5EVusAiLfw==
X-Received: by 2002:a2e:a0ca:0:b0:2b4:6f17:31f7 with SMTP id f10-20020a2ea0ca000000b002b46f1731f7mr2824729ljm.27.1687181693093;
        Mon, 19 Jun 2023 06:34:53 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v2 4/6] xen/riscv: introduce identity mapping
Date: Mon, 19 Jun 2023 16:34:45 +0300
Message-Id: <21d8ce65f718bc10c2213688f79cf5f978bcaf16.1687178053.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1687178053.git.oleksii.kurochko@gmail.com>
References: <cover.1687178053.git.oleksii.kurochko@gmail.com>
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
so we will look for the top-level entry exclusive to the identity
map and remove it.

Fixes: e66003e7be ("xen/riscv: introduce setup_initial_pages")
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
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
 xen/arch/riscv/include/asm/config.h |  2 +
 xen/arch/riscv/include/asm/mm.h     |  3 +-
 xen/arch/riscv/mm.c                 | 84 ++++++++++++++++-------------
 xen/arch/riscv/riscv64/head.S       | 34 ++++++++++++
 xen/arch/riscv/setup.c              | 14 +----
 5 files changed, 88 insertions(+), 49 deletions(-)

diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index 38862df0b8..fa90ae0898 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -1,3 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
 #ifndef __RISCV_CONFIG_H__
 #define __RISCV_CONFIG_H__
 
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
index 570033f17f..2693b817c5 100644
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
+ * (CONFIG_PAGING_LEVELS - 1) page tables are needed for identity mapping.
  */
-#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) + 1)
+#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) * 2 + 1)
 
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
@@ -232,22 +243,18 @@ void __init setup_initial_pagetables(void)
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
 
@@ -255,25 +262,30 @@ void __init noreturn noinline enable_mmu()
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
+    unsigned long load_addr = LINK_TO_LOAD(_start);
 
-    switch_stack_and_jump((unsigned long)cpu0_boot_stack + STACK_SIZE,
-                          cont_after_mmu_is_enabled);
+    for ( pgtbl = stage1_pgtbl_root, i = 0;
+          i <= (CONFIG_PAGING_LEVELS - 1);
+          i++ )
+    {
+        index = pt_index(CONFIG_PAGING_LEVELS - 1 - i, load_addr);
+        xen_index = pt_index(CONFIG_PAGING_LEVELS - 1 - i, XEN_VIRT_START);
+
+        if ( index != xen_index )
+        {
+            pgtbl[index].pte = 0;
+            break;
+        }
+
+        pgtbl = (pte_t *)pte_to_paddr(pgtbl[index]);
+    }
 }
 
 /*
diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
index 850fbb58a7..41983ffe63 100644
--- a/xen/arch/riscv/riscv64/head.S
+++ b/xen/arch/riscv/riscv64/head.S
@@ -29,8 +29,42 @@ ENTRY(start)
 
         jal     reset_stack
 
+        /*
+         * save hart_id and dtb_base as a0 and a1 register can be used
+         * by C code ( f.e. setup_initial_pagetables will update a0 and
+         * a1 )
+         */
+        mv      s0, a0
+        mv      s1, a1
+
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
+        /* restore bootcpu_id and dtb address */
+        mv      a0, s0
+        mv      a1, s1
+
         tail    start_xen
 
         .section .text, "ax", %progbits
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


