Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E258A7D931
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 11:14:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.939430.1339547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1iZ5-0004n8-O8; Mon, 07 Apr 2025 09:14:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 939430.1339547; Mon, 07 Apr 2025 09:14:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1iZ5-0004iX-Ha; Mon, 07 Apr 2025 09:14:47 +0000
Received: by outflank-mailman (input) for mailman id 939430;
 Mon, 07 Apr 2025 09:14:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U9Ey=WZ=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1u1iZ3-0003xy-Cu
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 09:14:45 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id beb9279c-1390-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 11:14:44 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 74C001424;
 Mon,  7 Apr 2025 02:14:45 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 420293F59E;
 Mon,  7 Apr 2025 02:14:43 -0700 (PDT)
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
X-Inumbo-ID: beb9279c-1390-11f0-9eaa-5ba50f476ded
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 4/7] arm/mpu: Provide a constructor for pr_t type
Date: Mon,  7 Apr 2025 10:14:27 +0100
Message-Id: <20250407091430.2342709-5-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407091430.2342709-1-luca.fancellu@arm.com>
References: <20250407091430.2342709-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide a function that creates a pr_t object from a memory
range and some attributes.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/include/asm/arm64/mpu.h | 11 +++++
 xen/arch/arm/include/asm/mpu.h       |  4 ++
 xen/arch/arm/include/asm/mpu/mm.h    |  3 ++
 xen/arch/arm/mpu/mm.c                | 73 ++++++++++++++++++++++++++++
 4 files changed, 91 insertions(+)

diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
index 4d2bd7d7877f..7cf8d355a1af 100644
--- a/xen/arch/arm/include/asm/arm64/mpu.h
+++ b/xen/arch/arm/include/asm/arm64/mpu.h
@@ -6,6 +6,17 @@
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
+#define XN_EL2_ENABLED  0x2
+
 #ifndef __ASSEMBLY__
 
 /* Protection Region Base Address Register */
diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
index 6971507457fb..eba5086cde97 100644
--- a/xen/arch/arm/include/asm/mpu.h
+++ b/xen/arch/arm/include/asm/mpu.h
@@ -20,6 +20,10 @@
 #define NUM_MPU_REGIONS_MASK    (NUM_MPU_REGIONS - 1)
 #define MAX_MPU_REGIONS         NUM_MPU_REGIONS_MASK
 
+/* Access permission attributes. */
+/* Read/Write at EL2, No Access at EL1/EL0. */
+#define AP_RW_EL2 0x0
+
 #ifndef __ASSEMBLY__
 
 /* Set base address of MPU protection region(pr_t). */
diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
index 5cabe9d111ce..9c7a01d6bd58 100644
--- a/xen/arch/arm/include/asm/mpu/mm.h
+++ b/xen/arch/arm/include/asm/mpu/mm.h
@@ -53,6 +53,9 @@ extern void read_protection_region(pr_t *pr_read, uint8_t sel);
 /* Writes the MPU region with index 'sel' to the HW */
 extern void write_protection_region(const pr_t *pr_write, uint8_t sel);
 
+/* Creates a pr_t entry for the MPU data structure */
+extern pr_t pr_of_xenaddr(paddr_t base, paddr_t limit, unsigned attr);
+
 #endif /* __ARM_MPU_MM_H__ */
 
 /*
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index bf281f67fb6b..2c5820a44f13 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -9,6 +9,7 @@
 #include <xen/types.h>
 #include <asm/mpu.h>
 #include <asm/mpu/mm.h>
+#include <asm/page.h>
 #include <asm/sysregs.h>
 
 struct page_info *frame_table;
@@ -151,6 +152,78 @@ void write_protection_region(const pr_t *pr_write, uint8_t sel)
     }
 }
 
+/*
+ * Standard entry for building up the structure of MPU memory region(pr_t).
+ * It is equivalent to mfn_to_xen_entry in MMU system.
+ * Base and limit refer to exclusive range [start, limit].
+ */
+pr_t pr_of_xenaddr(paddr_t base, paddr_t limit, unsigned attr)
+{
+    prbar_t prbar;
+    prlar_t prlar;
+    pr_t region;
+
+    /* Build up value for PRBAR_EL2. */
+    prbar = (prbar_t) {
+        .reg = {
+            .ap = AP_RW_EL2,      /* Read/Write at EL2, no access at EL1/EL0. */
+            .xn = XN_EL2_ENABLED, /* No need to execute outside .text */
+        }};
+
+    switch ( attr )
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
+            .ai = attr,
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
+
 void __init setup_mm(void)
 {
     BUG_ON("unimplemented");
-- 
2.34.1


