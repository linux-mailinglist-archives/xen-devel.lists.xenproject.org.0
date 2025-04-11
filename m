Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A366A86125
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 16:57:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947477.1345132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3Foe-0007Nn-3m; Fri, 11 Apr 2025 14:57:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947477.1345132; Fri, 11 Apr 2025 14:57:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3Fod-0007Kq-W3; Fri, 11 Apr 2025 14:57:11 +0000
Received: by outflank-mailman (input) for mailman id 947477;
 Fri, 11 Apr 2025 14:57:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TlgU=W5=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1u3Foc-0006eX-AX
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 14:57:10 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 3d7978b6-16e5-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 16:57:08 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9DC3B1596;
 Fri, 11 Apr 2025 07:57:07 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ED07F3F59E;
 Fri, 11 Apr 2025 07:57:06 -0700 (PDT)
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
X-Inumbo-ID: 3d7978b6-16e5-11f0-9ffb-bf95429c2676
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 2/7] arm/mpu: Provide access to the MPU region from the C code
Date: Fri, 11 Apr 2025 15:56:50 +0100
Message-Id: <20250411145655.140667-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250411145655.140667-1-luca.fancellu@arm.com>
References: <20250411145655.140667-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement some utility function in order to access the MPU regions
from the C world.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
v3 changes:
 - Moved PRBAR0_EL2/PRLAR0_EL2 to arm64 specific
 - Modified prepare_selector() to be easily made a NOP
   for Arm32, which can address up to 32 region without
   changing selector and it is also its maximum amount
   of MPU regions.
---
---
 xen/arch/arm/include/asm/arm64/mpu.h |   7 ++
 xen/arch/arm/include/asm/mpu.h       |   1 +
 xen/arch/arm/include/asm/mpu/mm.h    |  24 +++++
 xen/arch/arm/mpu/mm.c                | 125 +++++++++++++++++++++++++++
 4 files changed, 157 insertions(+)

diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
index 4d2bd7d7877f..b4e1ecdf741d 100644
--- a/xen/arch/arm/include/asm/arm64/mpu.h
+++ b/xen/arch/arm/include/asm/arm64/mpu.h
@@ -8,6 +8,13 @@
 
 #ifndef __ASSEMBLY__
 
+/*
+ * The following are needed for the case generators GENERATE_WRITE_PR_REG_CASE
+ * and GENERATE_READ_PR_REG_CASE with num==0
+ */
+#define PRBAR0_EL2 PRBAR_EL2
+#define PRLAR0_EL2 PRLAR_EL2
+
 /* Protection Region Base Address Register */
 typedef union {
     struct __packed {
diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
index e148c705b82c..59ff22c804c1 100644
--- a/xen/arch/arm/include/asm/mpu.h
+++ b/xen/arch/arm/include/asm/mpu.h
@@ -13,6 +13,7 @@
 #define MPU_REGION_SHIFT  6
 #define MPU_REGION_ALIGN  (_AC(1, UL) << MPU_REGION_SHIFT)
 #define MPU_REGION_MASK   (~(MPU_REGION_ALIGN - 1))
+#define MPU_REGION_RES0   (0xFFFULL << 52)
 
 #define NUM_MPU_REGIONS_SHIFT   8
 #define NUM_MPU_REGIONS         (_AC(1, UL) << NUM_MPU_REGIONS_SHIFT)
diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
index 86f33d9836b7..5cabe9d111ce 100644
--- a/xen/arch/arm/include/asm/mpu/mm.h
+++ b/xen/arch/arm/include/asm/mpu/mm.h
@@ -8,6 +8,7 @@
 #include <xen/page-size.h>
 #include <xen/types.h>
 #include <asm/mm.h>
+#include <asm/mpu.h>
 
 extern struct page_info *frame_table;
 
@@ -29,6 +30,29 @@ static inline struct page_info *virt_to_page(const void *v)
     return mfn_to_page(mfn);
 }
 
+/* Utility function to be used whenever MPU regions are modified */
+static inline void context_sync_mpu(void)
+{
+    /*
+     * ARM DDI 0600B.a, C1.7.1
+     * Writes to MPU registers are only guaranteed to be visible following a
+     * Context synchronization event and DSB operation.
+     */
+    dsb(sy);
+    isb();
+}
+
+/*
+ * The following API require context_sync_mpu() after being used to modifiy MPU
+ * regions:
+ *  - write_protection_region
+ */
+
+/* Reads the MPU region with index 'sel' from the HW */
+extern void read_protection_region(pr_t *pr_read, uint8_t sel);
+/* Writes the MPU region with index 'sel' to the HW */
+extern void write_protection_region(const pr_t *pr_write, uint8_t sel);
+
 #endif /* __ARM_MPU_MM_H__ */
 
 /*
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index f83ce04fef8a..e522ce53c357 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -8,12 +8,30 @@
 #include <xen/sizes.h>
 #include <xen/types.h>
 #include <asm/mpu.h>
+#include <asm/mpu/mm.h>
+#include <asm/sysregs.h>
 
 struct page_info *frame_table;
 
 /* EL2 Xen MPU memory region mapping table. */
 pr_t xen_mpumap[MAX_MPU_REGIONS];
 
+#define GENERATE_WRITE_PR_REG_CASE(num, pr)                                 \
+    case num:                                                               \
+    {                                                                       \
+        WRITE_SYSREG(pr->prbar.bits & ~MPU_REGION_RES0, PRBAR##num##_EL2);  \
+        WRITE_SYSREG(pr->prlar.bits & ~MPU_REGION_RES0, PRLAR##num##_EL2);  \
+        break;                                                              \
+    }
+
+#define GENERATE_READ_PR_REG_CASE(num, pr)                      \
+    case num:                                                   \
+    {                                                           \
+        pr->prbar.bits = READ_SYSREG(PRBAR##num##_EL2);         \
+        pr->prlar.bits = READ_SYSREG(PRLAR##num##_EL2);         \
+        break;                                                  \
+    }
+
 static void __init __maybe_unused build_assertions(void)
 {
     /*
@@ -24,6 +42,113 @@ static void __init __maybe_unused build_assertions(void)
     BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
 }
 
+static void prepare_selector(uint8_t *sel)
+{
+    uint8_t cur_sel = *sel;
+    /*
+     * {read,write}_protection_region works using the direct access to the 0..15
+     * regions, so in order to save the isb() overhead, change the PRSELR_EL2
+     * only when needed, so when the upper 4 bits of the selector will change.
+     */
+    cur_sel &= 0xF0U;
+    if ( READ_SYSREG(PRSELR_EL2) != cur_sel )
+    {
+        WRITE_SYSREG(cur_sel, PRSELR_EL2);
+        isb();
+    }
+    *sel = *sel & 0xFU;
+}
+
+/*
+ * Armv8-R AArch64 at most supports 255 MPU protection regions.
+ * See section G1.3.18 of the reference manual for Armv8-R AArch64,
+ * PRBAR<n>_EL2 and PRLAR<n>_EL2 provide access to the EL2 MPU region
+ * determined by the value of 'n' and PRSELR_EL2.REGION as
+ * PRSELR_EL2.REGION<7:4>:n(n = 0, 1, 2, ... , 15)
+ * For example to access regions from 16 to 31 (0b10000 to 0b11111):
+ * - Set PRSELR_EL2 to 0b1xxxx
+ * - Region 16 configuration is accessible through PRBAR_EL2 and PRLAR_EL2
+ * - Region 17 configuration is accessible through PRBAR1_EL2 and PRLAR1_EL2
+ * - Region 18 configuration is accessible through PRBAR2_EL2 and PRLAR2_EL2
+ * - ...
+ * - Region 31 configuration is accessible through PRBAR15_EL2 and PRLAR15_EL2
+ */
+/*
+ * Read EL2 MPU Protection Region.
+ *
+ * @pr_read: mpu protection region returned by read op.
+ * @sel: mpu protection region selector
+ */
+void read_protection_region(pr_t *pr_read, uint8_t sel)
+{
+    /*
+     * Before accessing EL2 MPU region register PRBAR_EL2/PRLAR_EL2,
+     * make sure PRSELR_EL2 is set, as it determines which MPU region
+     * is selected.
+     */
+    prepare_selector(&sel);
+
+    switch ( sel )
+    {
+        GENERATE_READ_PR_REG_CASE(0, pr_read);
+        GENERATE_READ_PR_REG_CASE(1, pr_read);
+        GENERATE_READ_PR_REG_CASE(2, pr_read);
+        GENERATE_READ_PR_REG_CASE(3, pr_read);
+        GENERATE_READ_PR_REG_CASE(4, pr_read);
+        GENERATE_READ_PR_REG_CASE(5, pr_read);
+        GENERATE_READ_PR_REG_CASE(6, pr_read);
+        GENERATE_READ_PR_REG_CASE(7, pr_read);
+        GENERATE_READ_PR_REG_CASE(8, pr_read);
+        GENERATE_READ_PR_REG_CASE(9, pr_read);
+        GENERATE_READ_PR_REG_CASE(10, pr_read);
+        GENERATE_READ_PR_REG_CASE(11, pr_read);
+        GENERATE_READ_PR_REG_CASE(12, pr_read);
+        GENERATE_READ_PR_REG_CASE(13, pr_read);
+        GENERATE_READ_PR_REG_CASE(14, pr_read);
+        GENERATE_READ_PR_REG_CASE(15, pr_read);
+    default:
+        BUG(); /* Can't happen */
+    }
+}
+
+/*
+ * Write EL2 MPU Protection Region.
+ *
+ * @pr_write: const mpu protection region passed through write op.
+ * @sel: mpu protection region selector
+ */
+void write_protection_region(const pr_t *pr_write, uint8_t sel)
+{
+    /*
+     * Before accessing EL2 MPU region register PRBAR_EL2/PRLAR_EL2,
+     * make sure PRSELR_EL2 is set, as it determines which MPU region
+     * is selected.
+     */
+    prepare_selector(&sel);
+
+    switch ( sel )
+    {
+        GENERATE_WRITE_PR_REG_CASE(0, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(1, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(2, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(3, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(4, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(5, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(6, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(7, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(8, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(9, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(10, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(11, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(12, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(13, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(14, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(15, pr_write);
+    default:
+        BUG(); /* Can't happen */
+    }
+}
+
 void __init setup_mm(void)
 {
     BUG_ON("unimplemented");
-- 
2.34.1


