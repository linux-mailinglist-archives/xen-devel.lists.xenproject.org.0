Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAD24D2DDC
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 12:21:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287734.487923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRuNs-0008Pt-KN; Wed, 09 Mar 2022 11:21:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287734.487923; Wed, 09 Mar 2022 11:21:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRuNs-0008IY-A6; Wed, 09 Mar 2022 11:21:36 +0000
Received: by outflank-mailman (input) for mailman id 287734;
 Wed, 09 Mar 2022 11:21:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nRuNr-0008Bi-8i
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 11:21:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nRuNr-0002lS-4Y; Wed, 09 Mar 2022 11:21:35 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nRuNq-0004wn-TC; Wed, 09 Mar 2022 11:21:35 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=tjGVNBl+p1ZPAg1oGbm6UDq0DOV0mnkoPMAmBc++mKs=; b=Tk8L3eXtygKmHrlWShbwQR/9CN
	ZyDrKFjTNTZ1zyfZtb9WFiVFlbnGERbyaKr8D2PcVieZ3IM1d+8j6sRHreaXdmrC1AuQ0pMeF4DAr
	YvRfOBwqudW/lJTnvnf+C7vTQO689XUu1GgHIkCALBSk6U9yqJJaFB52XkiADamDmIs8=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: marco.solieri@minervasys.tech,
	lucmiccio@gmail.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH early-RFC 5/5] xen/arm: smpboot: Directly switch to the runtime page-tables
Date: Wed,  9 Mar 2022 11:20:48 +0000
Message-Id: <20220309112048.17377-6-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220309112048.17377-1-julien@xen.org>
References: <20220309112048.17377-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Switching TTBR while the MMU is on is not safe. Now that the identity
mapping will not clash with the rest of the memory layout, we can avoid
creating temporary page-tables every time a CPU is brought up.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/arm64/head.S | 29 +++++++++--------------------
 xen/arch/arm/mm.c         | 19 -------------------
 xen/arch/arm/smpboot.c    |  3 +++
 3 files changed, 12 insertions(+), 39 deletions(-)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index c5cc72b8fe6f..f0ac5a3295cc 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -309,6 +309,7 @@ real_start_efi:
         bl    check_cpu_mode
         bl    cpu_init
         bl    create_page_tables
+        load_paddr x0, boot_pgtable
         bl    enable_mmu
 
         /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
@@ -368,29 +369,14 @@ GLOBAL(init_secondary)
 #endif
         bl    check_cpu_mode
         bl    cpu_init
-        bl    create_page_tables
+        load_paddr x0, init_ttbr
+        ldr   x0, [x0]
         bl    enable_mmu
 
         /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
         ldr   x0, =secondary_switched
         br    x0
 secondary_switched:
-        /*
-         * Non-boot CPUs need to move on to the proper pagetables, which were
-         * setup in init_secondary_pagetables.
-         *
-         * XXX: This is not compliant with the Arm Arm.
-         */
-        ldr   x4, =init_ttbr         /* VA of TTBR0_EL2 stashed by CPU 0 */
-        ldr   x4, [x4]               /* Actual value */
-        dsb   sy
-        msr   TTBR0_EL2, x4
-        dsb   sy
-        isb
-        tlbi  alle2
-        dsb   sy                     /* Ensure completion of TLB flush */
-        isb
-
 #ifdef CONFIG_EARLY_PRINTK
         /* Use a virtual address to access the UART. */
         ldr   x23, =EARLY_UART_VIRTUAL_ADDRESS
@@ -661,9 +647,13 @@ ENDPROC(create_page_tables)
  * mapping. In other word, the caller is responsible to switch to the runtime
  * mapping.
  *
- * Clobbers x0 - x3
+ * Inputs:
+ *   x0 : Physical address of the page tables.
+ *
+ * Clobbers x0 - x4
  */
 enable_mmu:
+        mov   x4, x0
         PRINT("- Turning on paging -\r\n")
 
         /*
@@ -674,8 +664,7 @@ enable_mmu:
         dsb   nsh
 
         /* Write Xen's PT's paddr into TTBR0_EL2 */
-        load_paddr x0, boot_pgtable
-        msr   TTBR0_EL2, x0
+        msr   TTBR0_EL2, x4
         isb
 
         mrs   x0, SCTLR_EL2
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index a53760af7af0..be808073844a 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -771,26 +771,9 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
 #endif
 }
 
-static void clear_boot_pagetables(void)
-{
-    /*
-     * Clear the copy of the boot pagetables. Each secondary CPU
-     * rebuilds these itself (see head.S).
-     */
-    clear_table(boot_pgtable);
-#ifdef CONFIG_ARM_64
-    clear_table(boot_first);
-    clear_table(boot_first_id);
-#endif
-    clear_table(boot_second);
-    clear_table(boot_third);
-}
-
 #ifdef CONFIG_ARM_64
 int init_secondary_pagetables(int cpu)
 {
-    clear_boot_pagetables();
-
     /* Set init_ttbr for this CPU coming up. All CPus share a single setof
      * pagetables, but rewrite it each time for consistency with 32 bit. */
     init_ttbr = (uintptr_t) xen_pgtable + phys_offset;
@@ -833,8 +816,6 @@ int init_secondary_pagetables(int cpu)
     per_cpu(xen_pgtable, cpu) = first;
     per_cpu(xen_dommap, cpu) = domheap;
 
-    clear_boot_pagetables();
-
     /* Set init_ttbr for this CPU coming up */
     init_ttbr = __pa(first);
     clean_dcache(init_ttbr);
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 7bfd0a73a7d2..72931d0cef93 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -457,12 +457,14 @@ int __cpu_up(unsigned int cpu)
     smp_up_cpu = cpu_logical_map(cpu);
     clean_dcache(smp_up_cpu);
 
+    update_identity_mapping(true);
     rc = arch_cpu_up(cpu);
 
     console_end_sync();
 
     if ( rc < 0 )
     {
+        update_identity_mapping(false);
         printk("Failed to bring up CPU%d\n", cpu);
         return rc;
     }
@@ -493,6 +495,7 @@ int __cpu_up(unsigned int cpu)
     init_data.cpuid = ~0;
     smp_up_cpu = MPIDR_INVALID;
     clean_dcache(smp_up_cpu);
+    update_identity_mapping(false);
 
     if ( !cpu_online(cpu) )
     {
-- 
2.32.0


