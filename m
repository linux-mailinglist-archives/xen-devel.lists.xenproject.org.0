Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E534F668B89
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 06:36:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476632.739082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCjq-0007GT-72; Fri, 13 Jan 2023 05:36:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476632.739082; Fri, 13 Jan 2023 05:36:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCjp-00076b-Tz; Fri, 13 Jan 2023 05:36:25 +0000
Received: by outflank-mailman (input) for mailman id 476632;
 Fri, 13 Jan 2023 05:36:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f25I=5K=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pGCds-0005sP-RV
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 05:30:16 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 5b2e49e9-9303-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 06:30:14 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 149F913D5;
 Thu, 12 Jan 2023 21:30:56 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5679A3F587;
 Thu, 12 Jan 2023 21:30:11 -0800 (PST)
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
X-Inumbo-ID: 5b2e49e9-9303-11ed-b8d0-410ff93cb8f0
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v2 12/40] xen/mpu: introduce helpers for MPU enablement
Date: Fri, 13 Jan 2023 13:28:45 +0800
Message-Id: <20230113052914.3845596-13-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113052914.3845596-1-Penny.Zheng@arm.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We need a new helper for Xen to enable MPU in boot-time.
The new helper is semantically consistent with the original enable_mmu.

If the Background region is enabled, then the MPU uses the default memory
map as the Background region for generating the memory
attributes when MPU is disabled.
Since the default memory map of the Armv8-R AArch64 architecture is
IMPLEMENTATION DEFINED, we always turn off the Background region.

In this patch, we also introduce a neutral name enable_mm for
Xen to enable MMU/MPU. This can help us to keep one code flow
in head.S

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/arm64/head.S     |  5 +++--
 xen/arch/arm/arm64/head_mmu.S |  4 ++--
 xen/arch/arm/arm64/head_mpu.S | 19 +++++++++++++++++++
 3 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 145e3d53dc..7f3f973468 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -258,7 +258,8 @@ real_start_efi:
          * and memory regions for MPU systems.
          */
         bl    prepare_early_mappings
-        bl    enable_mmu
+        /* Turn on MMU or MPU */
+        bl    enable_mm
 
         /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
         ldr   x0, =primary_switched
@@ -316,7 +317,7 @@ GLOBAL(init_secondary)
         bl    check_cpu_mode
         bl    cpu_init
         bl    prepare_early_mappings
-        bl    enable_mmu
+        bl    enable_mm
 
         /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
         ldr   x0, =secondary_switched
diff --git a/xen/arch/arm/arm64/head_mmu.S b/xen/arch/arm/arm64/head_mmu.S
index 2346f755df..b59c40495f 100644
--- a/xen/arch/arm/arm64/head_mmu.S
+++ b/xen/arch/arm/arm64/head_mmu.S
@@ -217,7 +217,7 @@ ENDPROC(prepare_early_mappings)
  *
  * Clobbers x0 - x3
  */
-ENTRY(enable_mmu)
+ENTRY(enable_mm)
         PRINT("- Turning on paging -\r\n")
 
         /*
@@ -239,7 +239,7 @@ ENTRY(enable_mmu)
         msr   SCTLR_EL2, x0          /* now paging is enabled */
         isb                          /* Now, flush the icache */
         ret
-ENDPROC(enable_mmu)
+ENDPROC(enable_mm)
 
 /*
  * Remove the 1:1 map from the page-tables. It is not easy to keep track
diff --git a/xen/arch/arm/arm64/head_mpu.S b/xen/arch/arm/arm64/head_mpu.S
index 0b97ce4646..e2ac69b0cc 100644
--- a/xen/arch/arm/arm64/head_mpu.S
+++ b/xen/arch/arm/arm64/head_mpu.S
@@ -315,6 +315,25 @@ ENDPROC(prepare_early_mappings)
 
 GLOBAL(_end_boot)
 
+/*
+ * Enable EL2 MPU and data cache
+ * If the Background region is enabled, then the MPU uses the default memory
+ * map as the Background region for generating the memory
+ * attributes when MPU is disabled.
+ * Since the default memory map of the Armv8-R AArch64 architecture is
+ * IMPLEMENTATION DEFINED, we intend to turn off the Background region here.
+ */
+ENTRY(enable_mm)
+    mrs   x0, SCTLR_EL2
+    orr   x0, x0, #SCTLR_Axx_ELx_M    /* Enable MPU */
+    orr   x0, x0, #SCTLR_Axx_ELx_C    /* Enable D-cache */
+    orr   x0, x0, #SCTLR_Axx_ELx_WXN  /* Enable WXN */
+    dsb   sy
+    msr   SCTLR_EL2, x0
+    isb
+    ret
+ENDPROC(enable_mm)
+
 /*
  * Local variables:
  * mode: ASM
-- 
2.25.1


