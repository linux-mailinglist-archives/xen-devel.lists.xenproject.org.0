Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF2C669421
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 11:30:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477124.739710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGHKH-0004Gs-Ie; Fri, 13 Jan 2023 10:30:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477124.739710; Fri, 13 Jan 2023 10:30:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGHKH-00049i-7o; Fri, 13 Jan 2023 10:30:21 +0000
Received: by outflank-mailman (input) for mailman id 477124;
 Fri, 13 Jan 2023 10:30:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pGHKF-0003yp-0f
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 10:30:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pGHKE-0007E0-Qu; Fri, 13 Jan 2023 10:30:18 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pGH2S-0005Ty-Cg; Fri, 13 Jan 2023 10:11:56 +0000
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
	bh=8i3ZQPALAa1NIhy5GgDUeuudwiDWrPE6WnHwf0+BofU=; b=iOSV4qKmc7M0vSiiTlP6CwY44V
	bI/hTKMjBVsiXNF/jcVfZryUW88GAPRPJf8rBbfz9XsfWRsCKa2uk70gOXFbzSSh81rVh6L058Tux
	E5HLb0huVqe5D1qnV90rwx7BYuqHi/vHgT/CN+5h8q2NJXoPdm0kJonT5hUMagnX/3V0=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 14/14] xen/arm64: smpboot: Directly switch to the runtime page-tables
Date: Fri, 13 Jan 2023 10:11:36 +0000
Message-Id: <20230113101136.479-15-julien@xen.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113101136.479-1-julien@xen.org>
References: <20230113101136.479-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Switching TTBR while the MMU is on is not safe. Now that the identity
mapping will not clash with the rest of the memory layout, we can avoid
creating temporary page-tables every time a CPU is brought up.

The arm32 code will use a different approach. So this issue is for now
only resolved on arm64.

Signed-off-by: Julien Grall <jgrall@amazon.com>
----
    Changes in v4:
        - Somehow I forgot to send it in v3. So re-include it.

    Changes in v2:
        - Remove arm32 code
---
 xen/arch/arm/arm32/smpboot.c   |  4 ++++
 xen/arch/arm/arm64/head.S      | 29 +++++++++--------------------
 xen/arch/arm/arm64/smpboot.c   | 15 ++++++++++++++-
 xen/arch/arm/include/asm/smp.h |  1 +
 xen/arch/arm/smpboot.c         |  1 +
 5 files changed, 29 insertions(+), 21 deletions(-)

diff --git a/xen/arch/arm/arm32/smpboot.c b/xen/arch/arm/arm32/smpboot.c
index e7368665d50d..518e9f9c7e70 100644
--- a/xen/arch/arm/arm32/smpboot.c
+++ b/xen/arch/arm/arm32/smpboot.c
@@ -21,6 +21,10 @@ int arch_cpu_up(int cpu)
     return platform_cpu_up(cpu);
 }
 
+void arch_cpu_up_finish(void)
+{
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 5efd442b24af..a61b4d3c2738 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -308,6 +308,7 @@ real_start_efi:
         bl    check_cpu_mode
         bl    cpu_init
         bl    create_page_tables
+        load_paddr x0, boot_pgtable
         bl    enable_mmu
 
         /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
@@ -365,29 +366,14 @@ GLOBAL(init_secondary)
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
@@ -672,9 +658,13 @@ ENDPROC(create_page_tables)
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
@@ -685,8 +675,7 @@ enable_mmu:
         dsb   nsh
 
         /* Write Xen's PT's paddr into TTBR0_EL2 */
-        load_paddr x0, boot_pgtable
-        msr   TTBR0_EL2, x0
+        msr   TTBR0_EL2, x4
         isb
 
         mrs   x0, SCTLR_EL2
diff --git a/xen/arch/arm/arm64/smpboot.c b/xen/arch/arm/arm64/smpboot.c
index 694fbf67e62a..9637f424699e 100644
--- a/xen/arch/arm/arm64/smpboot.c
+++ b/xen/arch/arm/arm64/smpboot.c
@@ -106,10 +106,23 @@ int __init arch_cpu_init(int cpu, struct dt_device_node *dn)
 
 int arch_cpu_up(int cpu)
 {
+    int rc;
+
     if ( !smp_enable_ops[cpu].prepare_cpu )
         return -ENODEV;
 
-    return smp_enable_ops[cpu].prepare_cpu(cpu);
+    update_identity_mapping(true);
+
+    rc = smp_enable_ops[cpu].prepare_cpu(cpu);
+    if ( rc )
+        update_identity_mapping(false);
+
+    return rc;
+}
+
+void arch_cpu_up_finish(void)
+{
+    update_identity_mapping(false);
 }
 
 /*
diff --git a/xen/arch/arm/include/asm/smp.h b/xen/arch/arm/include/asm/smp.h
index 8133d5c29572..a37ca55bff2c 100644
--- a/xen/arch/arm/include/asm/smp.h
+++ b/xen/arch/arm/include/asm/smp.h
@@ -25,6 +25,7 @@ extern void noreturn stop_cpu(void);
 extern int arch_smp_init(void);
 extern int arch_cpu_init(int cpu, struct dt_device_node *dn);
 extern int arch_cpu_up(int cpu);
+extern void arch_cpu_up_finish(void);
 
 int cpu_up_send_sgi(int cpu);
 
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 412ae2286906..4a89b3a8345b 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -500,6 +500,7 @@ int __cpu_up(unsigned int cpu)
     init_data.cpuid = ~0;
     smp_up_cpu = MPIDR_INVALID;
     clean_dcache(smp_up_cpu);
+    arch_cpu_up_finish();
 
     if ( !cpu_online(cpu) )
     {
-- 
2.38.1


