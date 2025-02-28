Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FA0A49E8D
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 17:18:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898961.1307466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to34P-00052N-Hz; Fri, 28 Feb 2025 16:18:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898961.1307466; Fri, 28 Feb 2025 16:18:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to34P-0004zu-9x; Fri, 28 Feb 2025 16:18:37 +0000
Received: by outflank-mailman (input) for mailman id 898961;
 Fri, 28 Feb 2025 16:18:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5/q7=VT=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1to34N-0003Ub-4o
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 16:18:35 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id a8493c80-f5ef-11ef-9aaf-95dc52dad729;
 Fri, 28 Feb 2025 17:18:34 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED1F9150C;
 Fri, 28 Feb 2025 08:18:48 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CAF073F5A1;
 Fri, 28 Feb 2025 08:18:32 -0800 (PST)
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
X-Inumbo-ID: a8493c80-f5ef-11ef-9aaf-95dc52dad729
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 6/9] arm/mpu: Provide a constructor for pr_t type
Date: Fri, 28 Feb 2025 16:18:14 +0000
Message-Id: <20250228161817.3342443-7-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250228161817.3342443-1-luca.fancellu@arm.com>
References: <20250228161817.3342443-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide a function that creates a pr_t object from a memory
range and some attributes.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/include/asm/arm64/mpu.h | 15 ++++++
 xen/arch/arm/include/asm/mpu/mm.h    |  3 ++
 xen/arch/arm/mpu/mm.c                | 73 ++++++++++++++++++++++++++++
 3 files changed, 91 insertions(+)

diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
index 3a09339818a0..dce77da60110 100644
--- a/xen/arch/arm/include/asm/arm64/mpu.h
+++ b/xen/arch/arm/include/asm/arm64/mpu.h
@@ -17,6 +17,21 @@
 
 #define MAX_MPU_REGIONS         NUM_MPU_REGIONS_MASK
 
+/* Access permission attributes. */
+/* Read/Write at EL2, No Access at EL1/EL0. */
+#define AP_RW_EL2 0x0
+
+/*
+ * Excute never.
+ * Stage 1 EL2 translation regime.
+ * XN[1] determines whether execution of the instruction fetched from the MPU
+ * memory region is permitted.
+ * Stage 2 EL1/EL0 translation regime.
+ * XN[0] determines whether execution of the instruction fetched from the MPU
+ * memory region is permitted.
+ */
+#define XN_ENABLED     0x2
+
 #ifndef __ASSEMBLY__
 
 /* Protection Region Base Address Register */
diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
index 1287a0f625b5..e234f6c26193 100644
--- a/xen/arch/arm/include/asm/mpu/mm.h
+++ b/xen/arch/arm/include/asm/mpu/mm.h
@@ -44,6 +44,9 @@ extern void read_protection_region(pr_t *pr_read, uint8_t sel);
 /* Writes the MPU region with index 'sel' to the HW */
 extern void write_protection_region(const pr_t *pr_write, uint8_t sel);
 
+/* Creates a pr_t entry for the MPU data structure */
+extern pr_t pr_of_xenaddr(paddr_t base, paddr_t limit, unsigned attr);
+
 #endif /* __ARM_MPU_MM__ */
 
 /*
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index bb8e0c546e7b..fb94f5d1d93d 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -9,6 +9,7 @@
  */
 
 #include <asm/mpu/mm.h>
+#include <asm/page.h>
 #include <asm/sysregs.h>
 
 /* EL2 Xen MPU memory region mapping table. */
@@ -141,6 +142,78 @@ void write_protection_region(const pr_t *pr_write, uint8_t sel)
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
+            .ap = AP_RW_EL2,  /* Read/Write at EL2, no access at EL1/EL0. */
+            .xn = XN_ENABLED, /* No need to execute outside .text */
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
 /*
  * Local variables:
  * mode: C
-- 
2.34.1


