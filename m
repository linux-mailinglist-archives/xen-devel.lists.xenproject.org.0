Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A7373D672
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 05:40:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555024.866630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd4z-0007m4-4t; Mon, 26 Jun 2023 03:39:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555024.866630; Mon, 26 Jun 2023 03:39:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd4x-0007Qy-NW; Mon, 26 Jun 2023 03:39:51 +0000
Received: by outflank-mailman (input) for mailman id 555024;
 Mon, 26 Jun 2023 03:39:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd1k-0000HH-NE
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:36:32 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id a36624b4-13d2-11ee-8611-37d641c3527e;
 Mon, 26 Jun 2023 05:36:30 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C80F51FB;
 Sun, 25 Jun 2023 20:37:13 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2C3F73F64C;
 Sun, 25 Jun 2023 20:36:26 -0700 (PDT)
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
X-Inumbo-ID: a36624b4-13d2-11ee-8611-37d641c3527e
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v3 26/52] xen/mpu: map early uart when earlyprintk on
Date: Mon, 26 Jun 2023 11:34:17 +0800
Message-Id: <20230626033443.2943270-27-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We map the early UART with a hardcoded MPU memory region at
slot(#REGION_DEVICE_SEL), right after Xen image binary.

CONFIG_EARLY_UART_SIZE is introduced, to let user provide physical size of
early UART. It is necessary in MPU system.
We also check whether user-defined EARLY_UART_SIZE is aligned to PAGE_SIZE,
or we may map more than necessary in MPU system.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v3:
- map the early UART with a hardcoded MPU memory region
- error when uart size doesn't align with PAGE_SIZE
---
 xen/arch/arm/Kconfig.debug              |  7 +++++++
 xen/arch/arm/arm64/mpu/head.S           | 25 +++++++++++++++++++++++++
 xen/arch/arm/include/asm/arm64/mpu.h    |  8 ++++++++
 xen/arch/arm/include/asm/early_printk.h |  8 ++++++++
 4 files changed, 48 insertions(+)

diff --git a/xen/arch/arm/Kconfig.debug b/xen/arch/arm/Kconfig.debug
index eec860e88e..a3b0cb9daa 100644
--- a/xen/arch/arm/Kconfig.debug
+++ b/xen/arch/arm/Kconfig.debug
@@ -239,6 +239,13 @@ config EARLY_UART_BASE_ADDRESS
 	default 0x1c020000 if EARLY_PRINTK_XGENE_STORM
 	default 0xff000000 if EARLY_PRINTK_ZYNQMP
 
+config EARLY_UART_SIZE
+       depends on EARLY_PRINTK
+       depends on HAS_MPU
+       hex "Early printk, physical size of debug UART"
+       range 0x0 0xffffffff if ARM_32
+       default 0x10000 if EARLY_PRINTK_FASTMODEL
+
 config EARLY_UART_PL011_BAUD_RATE
 	depends on EARLY_UART_PL011
 	int "Early printk UART baud rate for pl011"
diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/head.S
index 3cfce126d5..147a01e977 100644
--- a/xen/arch/arm/arm64/mpu/head.S
+++ b/xen/arch/arm/arm64/mpu/head.S
@@ -18,6 +18,7 @@
  */
 
 #include <asm/arm64/mpu.h>
+#include <asm/early_printk.h>
 #include <asm/page.h>
 
 /*
@@ -29,8 +30,10 @@
 #define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
 #define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
 #define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */
+#define REGION_DEVICE_PRBAR     0x22    /* SH=10 AP=00 XN=10 */
 
 #define REGION_NORMAL_PRLAR     0x0f    /* NS=0 ATTR=111 EN=1 */
+#define REGION_DEVICE_PRLAR     0x09    /* NS=0 ATTR=100 EN=1 */
 
 /*
  * Macro to round up the section address to be PAGE_SIZE aligned
@@ -216,6 +219,28 @@ ENTRY(enable_boot_mm)
         ret
 ENDPROC(enable_boot_mm)
 
+/*
+ * Map the early UART with a dedicated MPU memory region at
+ * slot(#REGION_DEVICE_SEL), right after Xen image binary.
+ *
+ * Clobbers x0 - x6
+ *
+ */
+ENTRY(setup_early_uart)
+#ifdef CONFIG_EARLY_PRINTK
+    mov   x0, #REGION_UART_SEL
+
+    /* Xen early UART section. */
+    ldr   x1, =CONFIG_EARLY_UART_BASE_ADDRESS
+    ldr   x2, =(CONFIG_EARLY_UART_BASE_ADDRESS + CONFIG_EARLY_UART_SIZE)
+    prepare_xen_region x0, x1, x2, x3, x4, x5, x6, attr_prbar=REGION_DEVICE_PRBAR, attr_prlar=REGION_DEVICE_PRLAR
+
+    /* Ensure any MPU memory mapping table updates made above have occurred. */
+    dsb   nshst
+    ret
+#endif
+ENDPROC(setup_early_uart)
+
 /*
  * Local variables:
  * mode: ASM
diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
index 0c479086f4..6ec2c10b14 100644
--- a/xen/arch/arm/include/asm/arm64/mpu.h
+++ b/xen/arch/arm/include/asm/arm64/mpu.h
@@ -12,6 +12,14 @@
  */
 #define ARM_MAX_MPU_MEMORY_REGIONS 255
 
+/*
+ * REGION_UART_SEL defines MPU region selector value for early UART, when
+ * earlyuart printk is enabled.
+ * #REGION_DEVICE_SEL shall be compliant with what describes in xen.lds.S,
+ * or it needs adjustment.
+ */
+#define REGION_UART_SEL            0x07
+
 #ifndef __ASSEMBLY__
 
 /* Protection Region Base Address Register */
diff --git a/xen/arch/arm/include/asm/early_printk.h b/xen/arch/arm/include/asm/early_printk.h
index ec5bcc343c..445a3fb7de 100644
--- a/xen/arch/arm/include/asm/early_printk.h
+++ b/xen/arch/arm/include/asm/early_printk.h
@@ -23,6 +23,14 @@
  */
 #define EARLY_UART_VIRTUAL_ADDRESS CONFIG_EARLY_UART_BASE_ADDRESS
 
+/*
+ * User-defined EARLY_UART_SIZE must be aligned to a PAGE_SIZE, or
+ * we may map more than necessary in MPU system.
+ */
+#if (EARLY_UART_SIZE % PAGE_SIZE) != 0
+#error "EARLY_UART_SIZE must be aligned to PAGE_SIZE"
+#endif
+
 #else
 
 /* need to add the uart address offset in page to the fixmap address */
-- 
2.25.1


