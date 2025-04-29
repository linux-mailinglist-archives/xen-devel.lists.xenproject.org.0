Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E4BAA1048
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 17:21:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972777.1361133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9mlp-0003MC-W1; Tue, 29 Apr 2025 15:21:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972777.1361133; Tue, 29 Apr 2025 15:21:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9mlp-0003H3-Mn; Tue, 29 Apr 2025 15:21:17 +0000
Received: by outflank-mailman (input) for mailman id 972777;
 Tue, 29 Apr 2025 15:21:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mkRs=XP=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1u9mlo-0002Ky-Js
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 15:21:16 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 96dc413d-250d-11f0-9ffb-bf95429c2676;
 Tue, 29 Apr 2025 17:21:14 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 474882308;
 Tue, 29 Apr 2025 08:21:07 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2BCBC3F673;
 Tue, 29 Apr 2025 08:21:13 -0700 (PDT)
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
X-Inumbo-ID: 96dc413d-250d-11f0-9ffb-bf95429c2676
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 6/7] arm/mpu: Provide a constructor for pr_t type
Date: Tue, 29 Apr 2025 16:20:56 +0100
Message-Id: <20250429152057.2380536-7-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250429152057.2380536-1-luca.fancellu@arm.com>
References: <20250429152057.2380536-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide a function that creates a pr_t object from a memory
range and some attributes.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
v4 changes:
 - update helper comments
 - rename XN_EL2_ENABLED to PRBAR_EL2_XN_ENABLED
 - protected pr_of_xenaddr() with #ifdef Arm64 until Arm32
   can build with it
---
 xen/arch/arm/include/asm/arm64/mpu.h | 11 +++++
 xen/arch/arm/include/asm/mpu.h       |  4 ++
 xen/arch/arm/include/asm/mpu/mm.h    | 10 ++++
 xen/arch/arm/mpu/mm.c                | 68 ++++++++++++++++++++++++++++
 4 files changed, 93 insertions(+)

diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
index b27fccd77550..39233b43a5aa 100644
--- a/xen/arch/arm/include/asm/arm64/mpu.h
+++ b/xen/arch/arm/include/asm/arm64/mpu.h
@@ -3,6 +3,17 @@
 #ifndef __ARM_ARM64_MPU_H__
 #define __ARM_ARM64_MPU_H__
 
+/*
+ * Excute never.
+ * Stage 1 EL2 translation regime.
+ * XN[1] determines whether execution of the instruction fetched from the MPU
+ * memory region is permitted.
+ * Stage 2 EL1/EL0 translation regime.
+ * XN[0] determines whether execution of the instruction fetched from the MPU
+ * memory region is permitted.
+ */
+#define PRBAR_EL2_XN_ENABLED  0x2
+
 #ifndef __ASSEMBLY__
 
 /* Protection Region Base Address Register */
diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
index 0e0a7f05ade9..7b82f10d336b 100644
--- a/xen/arch/arm/include/asm/mpu.h
+++ b/xen/arch/arm/include/asm/mpu.h
@@ -24,6 +24,10 @@
 #define NUM_MPU_REGIONS_MASK    (NUM_MPU_REGIONS - 1)
 #define MAX_MPU_REGION_NR       255
 
+/* Access permission attributes. */
+/* Read/Write at EL2, No Access at EL1/EL0. */
+#define AP_RW_EL2 0x0
+
 #ifndef __ASSEMBLY__
 
 #ifdef CONFIG_ARM_64
diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
index e2235e568e81..296fe74c5d61 100644
--- a/xen/arch/arm/include/asm/mpu/mm.h
+++ b/xen/arch/arm/include/asm/mpu/mm.h
@@ -75,6 +75,16 @@ extern void read_protection_region(pr_t *pr_read, uint8_t sel);
  */
 extern void write_protection_region(const pr_t *pr_write, uint8_t sel);
 
+/*
+ * Creates a pr_t structure describing a protection region.
+ *
+ * @base: base address as base of the protection region.
+ * @limit: exclusive address as limit of the protection region.
+ * @attr: attribute index for the memory type.
+ * @return: pr_t structure describing a protection region.
+ */
+extern pr_t pr_of_xenaddr(paddr_t base, paddr_t limit, unsigned int attr_idx);
+
 #endif /* __ARM_MPU_MM_H__ */
 
 /*
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index 40ccf99adc94..2e0aeb486ff8 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -9,6 +9,7 @@
 #include <xen/types.h>
 #include <asm/mpu.h>
 #include <asm/mpu/mm.h>
+#include <asm/page.h>
 #include <asm/sysregs.h>
 
 struct page_info *frame_table;
@@ -151,6 +152,73 @@ void write_protection_region(const pr_t *pr_write, uint8_t sel)
         BUG(); /* Can't happen */
     }
 }
+
+pr_t pr_of_xenaddr(paddr_t base, paddr_t limit, unsigned int attr_idx)
+{
+    prbar_t prbar;
+    prlar_t prlar;
+    pr_t region;
+
+    /* Build up value for PRBAR_EL2. */
+    prbar = (prbar_t) {
+        .reg = {
+            .ap = AP_RW_EL2,      /* Read/Write at EL2, no access at EL1/EL0. */
+            .xn = PRBAR_EL2_XN_ENABLED,   /* No need to execute outside .text */
+        }};
+
+    switch ( attr_idx )
+    {
+    case MT_NORMAL_NC:
+        /*
+         * ARM ARM: Overlaying the shareability attribute (DDI
+         * 0406C.b B3-1376 to 1377)
+         *
+         * A memory region with a resultant memory type attribute of normal,
+         * and a resultant cacheability attribute of Inner non-cacheable,
+         * outer non-cacheable, must have a resultant shareability attribute
+         * of outer shareable, otherwise shareability is UNPREDICTABLE.
+         *
+         * On ARMv8 sharability is ignored and explicitly treated as outer
+         * shareable for normal inner non-cacheable, outer non-cacheable.
+         */
+        prbar.reg.sh = LPAE_SH_OUTER;
+        break;
+    case MT_DEVICE_nGnRnE:
+    case MT_DEVICE_nGnRE:
+        /*
+         * Shareability is ignored for non-normal memory, Outer is as
+         * good as anything.
+         *
+         * On ARMv8 sharability is ignored and explicitly treated as outer
+         * shareable for any device memory type.
+         */
+        prbar.reg.sh = LPAE_SH_OUTER;
+        break;
+    default:
+        /* Xen mappings are SMP coherent */
+        prbar.reg.sh = LPAE_SH_INNER;
+    }
+
+    /* Build up value for PRLAR_EL2. */
+    prlar = (prlar_t) {
+        .reg = {
+            .ns = 0,        /* Hyp mode is in secure world */
+            .ai = attr_idx,
+            .en = 1,        /* Region enabled */
+        }};
+
+    /* Build up MPU memory region. */
+    region = (pr_t) {
+        .prbar = prbar,
+        .prlar = prlar,
+    };
+
+    /* Set base address and limit address. */
+    pr_set_base(&region, base);
+    pr_set_limit(&region, limit);
+
+    return region;
+}
 #endif
 
 void __init setup_mm(void)
-- 
2.34.1


