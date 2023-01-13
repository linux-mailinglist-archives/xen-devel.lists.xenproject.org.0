Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AC6668B7B
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 06:36:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476586.738950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCjK-0001PX-Fb; Fri, 13 Jan 2023 05:35:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476586.738950; Fri, 13 Jan 2023 05:35:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCjK-0001L5-AX; Fri, 13 Jan 2023 05:35:54 +0000
Received: by outflank-mailman (input) for mailman id 476586;
 Fri, 13 Jan 2023 05:35:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f25I=5K=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pGCdw-0005sP-Sc
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 05:30:21 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 5d0f1015-9303-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 06:30:17 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E44AFEC;
 Thu, 12 Jan 2023 21:30:59 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 705B83F587;
 Thu, 12 Jan 2023 21:30:14 -0800 (PST)
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
X-Inumbo-ID: 5d0f1015-9303-11ed-b8d0-410ff93cb8f0
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v2 13/40] xen/mpu: introduce unified function setup_early_uart to map early UART
Date: Fri, 13 Jan 2023 13:28:46 +0800
Message-Id: <20230113052914.3845596-14-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113052914.3845596-1-Penny.Zheng@arm.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In MMU system, we map the UART in the fixmap (when earlyprintk is used).
However in MPU system, we map the UART with a transient MPU memory
region.

So we introduce a new unified function setup_early_uart to replace
the previous setup_fixmap.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/arm64/head.S               |  2 +-
 xen/arch/arm/arm64/head_mmu.S           |  4 +-
 xen/arch/arm/arm64/head_mpu.S           | 52 +++++++++++++++++++++++++
 xen/arch/arm/include/asm/early_printk.h |  1 +
 4 files changed, 56 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 7f3f973468..a92883319d 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -272,7 +272,7 @@ primary_switched:
          * afterwards.
          */
         bl    remove_identity_mapping
-        bl    setup_fixmap
+        bl    setup_early_uart
 #ifdef CONFIG_EARLY_PRINTK
         /* Use a virtual address to access the UART. */
         ldr   x23, =EARLY_UART_VIRTUAL_ADDRESS
diff --git a/xen/arch/arm/arm64/head_mmu.S b/xen/arch/arm/arm64/head_mmu.S
index b59c40495f..a19b7c873d 100644
--- a/xen/arch/arm/arm64/head_mmu.S
+++ b/xen/arch/arm/arm64/head_mmu.S
@@ -312,7 +312,7 @@ ENDPROC(remove_identity_mapping)
  *
  * Clobbers x0 - x3
  */
-ENTRY(setup_fixmap)
+ENTRY(setup_early_uart)
 #ifdef CONFIG_EARLY_PRINTK
         /* Add UART to the fixmap table */
         ldr   x0, =EARLY_UART_VIRTUAL_ADDRESS
@@ -325,7 +325,7 @@ ENTRY(setup_fixmap)
         dsb   nshst
 
         ret
-ENDPROC(setup_fixmap)
+ENDPROC(setup_early_uart)
 
 /* Fail-stop */
 fail:   PRINT("- Boot failed -\r\n")
diff --git a/xen/arch/arm/arm64/head_mpu.S b/xen/arch/arm/arm64/head_mpu.S
index e2ac69b0cc..72d1e0863d 100644
--- a/xen/arch/arm/arm64/head_mpu.S
+++ b/xen/arch/arm/arm64/head_mpu.S
@@ -18,8 +18,10 @@
 #define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
 #define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
 #define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */
+#define REGION_DEVICE_PRBAR     0x22    /* SH=10 AP=00 XN=10 */
 
 #define REGION_NORMAL_PRLAR     0x0f    /* NS=0 ATTR=111 EN=1 */
+#define REGION_DEVICE_PRLAR     0x09    /* NS=0 ATTR=100 EN=1 */
 
 /*
  * Macro to round up the section address to be PAGE_SIZE aligned
@@ -334,6 +336,56 @@ ENTRY(enable_mm)
     ret
 ENDPROC(enable_mm)
 
+/*
+ * Map the early UART with a new transient MPU memory region.
+ *
+ * x27: region selector
+ * x28: prbar
+ * x29: prlar
+ *
+ * Clobbers x0 - x4
+ *
+ */
+ENTRY(setup_early_uart)
+#ifdef CONFIG_EARLY_PRINTK
+    /* stack LR as write_pr will be called later like nested function */
+    mov   x3, lr
+
+    /*
+     * MPU region for early UART is a transient region, since it will be
+     * replaced by specific device memory layout when FDT gets parsed.
+     */
+    load_paddr x0, next_transient_region_idx
+    ldr   x4, [x0]
+
+    ldr   x28, =CONFIG_EARLY_UART_BASE_ADDRESS
+    and   x28, x28, #MPU_REGION_MASK
+    mov   x1, #REGION_DEVICE_PRBAR
+    orr   x28, x28, x1
+
+    ldr x29, =(CONFIG_EARLY_UART_BASE_ADDRESS + EARLY_UART_SIZE)
+    roundup_section x29
+    /* Limit address is inclusive */
+    sub   x29, x29, #1
+    and   x29, x29, #MPU_REGION_MASK
+    mov   x2, #REGION_DEVICE_PRLAR
+    orr   x29, x29, x2
+
+    mov   x27, x4
+    bl    write_pr
+
+    /* Create a new entry in xen_mpumap for early UART */
+    create_mpu_entry xen_mpumap, x4, x28, x29, x1, x2
+
+    /* Update next_transient_region_idx */
+    sub   x4, x4, #1
+    str   x4, [x0]
+
+    mov   lr, x3
+    ret
+#endif
+ENDPROC(setup_early_uart)
+
 /*
  * Local variables:
  * mode: ASM
diff --git a/xen/arch/arm/include/asm/early_printk.h b/xen/arch/arm/include/asm/early_printk.h
index 44a230853f..d87623e6d5 100644
--- a/xen/arch/arm/include/asm/early_printk.h
+++ b/xen/arch/arm/include/asm/early_printk.h
@@ -22,6 +22,7 @@
  * for EARLY_UART_VIRTUAL_ADDRESS.
  */
 #define EARLY_UART_VIRTUAL_ADDRESS CONFIG_EARLY_UART_BASE_ADDRESS
+#define EARLY_UART_SIZE            0x1000
 
 #else
 
-- 
2.25.1


