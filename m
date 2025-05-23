Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AB1AC1D55
	for <lists+xen-devel@lfdr.de>; Fri, 23 May 2025 08:54:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.995196.1377751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIMIT-0003D8-1K; Fri, 23 May 2025 06:54:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 995196.1377751; Fri, 23 May 2025 06:54:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIMIS-0003Aa-Sx; Fri, 23 May 2025 06:54:24 +0000
Received: by outflank-mailman (input) for mailman id 995196;
 Fri, 23 May 2025 06:54:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ff/g=YH=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1uIMIQ-0002FX-G8
 for xen-devel@lists.xenproject.org; Fri, 23 May 2025 06:54:22 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id c12a4fa4-37a2-11f0-a2fb-13f23c93f187;
 Fri, 23 May 2025 08:54:21 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8FAC91758;
 Thu, 22 May 2025 23:54:06 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 07E183F673;
 Thu, 22 May 2025 23:54:19 -0700 (PDT)
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
X-Inumbo-ID: c12a4fa4-37a2-11f0-a2fb-13f23c93f187
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v6 4/6] arm/mpu: Provide access to the MPU region from the C code
Date: Fri, 23 May 2025 07:54:04 +0100
Message-Id: <20250523065406.3795420-5-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250523065406.3795420-1-luca.fancellu@arm.com>
References: <20250523065406.3795420-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement some utility functions in order to access the MPU regions
from the C world.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
v6 changes:
 - add break to default in the switch
 - modify comment and style fixes
 - Add R-by Michal
v5 changes:
 - move MPU_REGION_RES0 to arm64, fixed typos and code style.
v4 changes:
 - moved back PRBAR0_EL2/PRLAR0_EL2 to mm.c and protect
   them with CONFIG_ARM_64, changed comments, fixed typos and code
   style
 - Add PRBAR_EL2_(n) definition, to be overriden by Arm32
 - protect prepare_selector, read_protection_region,
   write_protection_region by Arm64 to ensure compilation on both
   arm32 and arm64, Arm32 will modify that later while introducing
   the arm32 bits.
v3 changes:
 - Moved PRBAR0_EL2/PRLAR0_EL2 to arm64 specific
 - Modified prepare_selector() to be easily made a NOP
   for Arm32, which can address up to 32 region without
   changing selector and it is also its maximum amount
   of MPU regions.
---
---
 xen/arch/arm/include/asm/arm64/mpu.h |   2 +
 xen/arch/arm/include/asm/mpu/mm.h    |  24 ++++++
 xen/arch/arm/mpu/mm.c                | 121 +++++++++++++++++++++++++++
 3 files changed, 147 insertions(+)

diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
index 4737868507d9..f0ce344e789b 100644
--- a/xen/arch/arm/include/asm/arm64/mpu.h
+++ b/xen/arch/arm/include/asm/arm64/mpu.h
@@ -5,6 +5,8 @@
 
 #ifndef __ASSEMBLY__
 
+#define MPU_REGION_RES0        (0xFFFFULL << 48)
+
 /* Protection Region Base Address Register */
 typedef union {
     struct __packed {
diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
index 409b4dd53dc6..d7950d9b4fbb 100644
--- a/xen/arch/arm/include/asm/mpu/mm.h
+++ b/xen/arch/arm/include/asm/mpu/mm.h
@@ -41,6 +41,30 @@ static inline struct page_info *virt_to_page(const void *v)
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
+ * The following API requires context_sync_mpu() after being used to modify MPU
+ * regions:
+ *  - write_protection_region
+ */
+
+/* Reads the MPU region (into @pr_read) with index @sel from the HW */
+void read_protection_region(pr_t *pr_read, uint8_t sel);
+
+/* Writes the MPU region (from @pr_write) with index @sel to the HW */
+void write_protection_region(const pr_t *pr_write, uint8_t sel);
+
 #endif /* __ARM_MPU_MM_H__ */
 
 /*
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index 2f31b7b78763..9c5789cdf1f9 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -8,6 +8,8 @@
 #include <xen/sizes.h>
 #include <xen/types.h>
 #include <asm/mpu.h>
+#include <asm/mpu/mm.h>
+#include <asm/sysregs.h>
 
 struct page_info *frame_table;
 
@@ -26,6 +28,35 @@ DECLARE_BITMAP(xen_mpumap_mask, MAX_MPU_REGION_NR) \
 /* EL2 Xen MPU memory region mapping table. */
 pr_t __cacheline_aligned __section(".data") xen_mpumap[MAX_MPU_REGION_NR];
 
+#ifdef CONFIG_ARM_64
+/*
+ * The following are needed for the cases: GENERATE_WRITE_PR_REG_CASE
+ * and GENERATE_READ_PR_REG_CASE with num==0
+ */
+#define PRBAR0_EL2 PRBAR_EL2
+#define PRLAR0_EL2 PRLAR_EL2
+
+#define PRBAR_EL2_(n)   PRBAR##n##_EL2
+#define PRLAR_EL2_(n)   PRLAR##n##_EL2
+
+#endif /* CONFIG_ARM_64 */
+
+#define GENERATE_WRITE_PR_REG_CASE(num, pr)                                 \
+    case num:                                                               \
+    {                                                                       \
+        WRITE_SYSREG(pr->prbar.bits & ~MPU_REGION_RES0, PRBAR_EL2_(num));   \
+        WRITE_SYSREG(pr->prlar.bits & ~MPU_REGION_RES0, PRLAR_EL2_(num));   \
+        break;                                                              \
+    }
+
+#define GENERATE_READ_PR_REG_CASE(num, pr)                      \
+    case num:                                                   \
+    {                                                           \
+        pr->prbar.bits = READ_SYSREG(PRBAR_EL2_(num));          \
+        pr->prlar.bits = READ_SYSREG(PRLAR_EL2_(num));          \
+        break;                                                  \
+    }
+
 static void __init __maybe_unused build_assertions(void)
 {
     /*
@@ -36,6 +67,96 @@ static void __init __maybe_unused build_assertions(void)
     BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
 }
 
+#ifdef CONFIG_ARM_64
+/*
+ * Armv8-R supports direct access and indirect access to the MPU regions through
+ * registers:
+ *  - indirect access involves changing the MPU region selector, issuing an isb
+ *    barrier and accessing the selected region through specific registers
+ *  - direct access involves accessing specific registers that point to
+ *    specific MPU regions, without changing the selector, avoiding the use of
+ *    a barrier.
+ * For Arm64 the PR{B,L}AR_ELx (for n=0) and PR{B,L}AR<n>_ELx (for n=1..15) are
+ * used for the direct access to the regions selected by
+ * PRSELR_EL2.REGION<7:4>:n, so 16 regions can be directly accessed when the
+ * selector is a multiple of 16, giving access to all the supported memory
+ * regions.
+ */
+static void prepare_selector(uint8_t *sel)
+{
+    uint8_t cur_sel = *sel;
+
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
+    *sel &= 0xFU;
+}
+
+void read_protection_region(pr_t *pr_read, uint8_t sel)
+{
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
+        break;
+    }
+}
+
+void write_protection_region(const pr_t *pr_write, uint8_t sel)
+{
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
+        break;
+    }
+}
+#endif /* CONFIG_ARM_64 */
+
 void __init setup_mm(void)
 {
     BUG_ON("unimplemented");
-- 
2.34.1


