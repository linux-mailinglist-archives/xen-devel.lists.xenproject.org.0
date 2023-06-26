Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B3B73D67D
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 05:40:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555050.866721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5I-0004T0-Pq; Mon, 26 Jun 2023 03:40:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555050.866721; Mon, 26 Jun 2023 03:40:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5H-00044K-Nf; Mon, 26 Jun 2023 03:40:11 +0000
Received: by outflank-mailman (input) for mailman id 555050;
 Mon, 26 Jun 2023 03:40:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd1g-0007ej-37
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:36:28 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id a18573a0-13d2-11ee-b237-6b7b168915f2;
 Mon, 26 Jun 2023 05:36:27 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF7C01FB;
 Sun, 25 Jun 2023 20:37:10 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 13BC73F64C;
 Sun, 25 Jun 2023 20:36:23 -0700 (PDT)
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
X-Inumbo-ID: a18573a0-13d2-11ee-b237-6b7b168915f2
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v3 25/52] xen/mpu: introduce helpers for MPU enablement
Date: Mon, 26 Jun 2023 11:34:16 +0800
Message-Id: <20230626033443.2943270-26-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We introduce new helpers for Xen to enable MPU in boot-time.
enable_boot_mm() is implemented to be semantically consistent
with the MMU version.

If the Background region is enabled, then the MPU uses the
default memory map as the Background region for generating
the memory attributes when MPU is disabled.
Since the default memory map of the Armv8-R AArch64
architecture is IMPLEMENTATION DEFINED, we always turn off
the Background region.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v3:
- introduce code clearing SCTLR_EL2.BR
- document the reason of isb
---
 xen/arch/arm/arm64/mpu/head.S        | 46 ++++++++++++++++++++++++++++
 xen/arch/arm/include/asm/processor.h |  1 +
 2 files changed, 47 insertions(+)

diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/head.S
index 93a7a75029..3cfce126d5 100644
--- a/xen/arch/arm/arm64/mpu/head.S
+++ b/xen/arch/arm/arm64/mpu/head.S
@@ -170,6 +170,52 @@ ENTRY(prepare_early_mappings)
     ret
 ENDPROC(prepare_early_mappings)
 
+/*
+ * Enable EL2 MPU and data cache
+ * If the Background region is enabled, then the MPU uses the default memory
+ * map as the Background region for generating the memory
+ * attributes when MPU is disabled.
+ * Since the default memory map of the Armv8-R AArch64 architecture is
+ * IMPLEMENTATION DEFINED, we intend to turn off the Background region here.
+ *
+ * Clobbers x0
+ *
+ */
+ENTRY(enable_mpu)
+    mrs   x0, SCTLR_EL2
+    orr   x0, x0, #SCTLR_Axx_ELx_M    /* Enable MPU */
+    orr   x0, x0, #SCTLR_Axx_ELx_C    /* Enable D-cache */
+    orr   x0, x0, #SCTLR_Axx_ELx_WXN  /* Enable WXN */
+    and   x0, x0, #SCTLR_Axx_ELx_BR   /* Disable Background region */
+    msr   SCTLR_EL2, x0               /* now mpu memory mapping is enabled */
+    isb                               /* Now, flush the icache */
+    ret
+ENDPROC(enable_mpu)
+
+/*
+ * Turn on the Data Cache and the MPU. The function will return
+ * to the virtual address provided in LR (e.g. the runtime mapping).
+ *
+ * Inputs:
+ *   lr : Virtual address to return to.
+ *
+ * Clobbers x0 - x7
+ */
+ENTRY(enable_boot_mm)
+        /* save return address */
+        mov   x7, lr
+
+        bl    prepare_early_mappings
+        bl    enable_mpu
+
+        mov   lr, x7
+        /*
+         * The "ret" here will use the return address in LR to
+         * return to primary_switched
+         */
+        ret
+ENDPROC(enable_boot_mm)
+
 /*
  * Local variables:
  * mode: ASM
diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index 7e42ff8811..685f9b18fd 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -167,6 +167,7 @@
 /* Common bits for SCTLR_ELx on all architectures */
 #define SCTLR_Axx_ELx_EE    BIT(25, UL)
 #define SCTLR_Axx_ELx_WXN   BIT(19, UL)
+#define SCTLR_Axx_ELx_BR    (~BIT(17, UL))
 #define SCTLR_Axx_ELx_I     BIT(12, UL)
 #define SCTLR_Axx_ELx_C     BIT(2, UL)
 #define SCTLR_Axx_ELx_A     BIT(1, UL)
-- 
2.25.1


