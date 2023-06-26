Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E15073D68A
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 05:40:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555078.866817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5b-0000xZ-WB; Mon, 26 Jun 2023 03:40:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555078.866817; Mon, 26 Jun 2023 03:40:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5a-0000ad-Vc; Mon, 26 Jun 2023 03:40:30 +0000
Received: by outflank-mailman (input) for mailman id 555078;
 Mon, 26 Jun 2023 03:40:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd1t-0007ej-6U
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:36:41 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id a8f28c11-13d2-11ee-b237-6b7b168915f2;
 Mon, 26 Jun 2023 05:36:39 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B2AE1FB;
 Sun, 25 Jun 2023 20:37:23 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 840103F64C;
 Sun, 25 Jun 2023 20:36:36 -0700 (PDT)
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
X-Inumbo-ID: a8f28c11-13d2-11ee-b237-6b7b168915f2
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v3 29/52] xen/mpu: introduce a pair helper read_protection_region()/write_protection_region()
Date: Mon, 26 Jun 2023 11:34:20 +0800
Message-Id: <20230626033443.2943270-30-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Each EL2 MPU protection region could be configured using PRBAR<n>_EL2 and
PRLAR<n>_EL2.

This commit introduces a pair helper read_protection_region()/
write_protection_region() to read/write EL2 MPU protection region.

As explained in section G1.3.18 of the reference manual for AArch64v8R,
a set of system register PRBAR<n>_EL2 and PRLAR<n>_EL2 provide access to
the EL2 MPU region which is determined by the value of 'n' and
PRSELR_EL2.REGION as PRSELR_EL2.REGION<7:4>:n(n = 0, 1, 2, ... , 15).
For example to access regions from 16 to 31:
- Set PRSELR_EL2 to 0b1xxxx
- Region 16 configuration is accessible through PRBAR0_EL2 and PRLAR0_EL2
- Region 17 configuration is accessible through PRBAR1_EL2 and PRLAR1_EL2
- Region 18 configuration is accessible through PRBAR2_EL2 and PRLAR2_EL2
- ...
- Region 31 configuration is accessible through PRBAR15_EL2 and PRLAR15_EL2

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v3:
- use WRITE_SYSREG()/READ_SYSREG() to avoid open-coding
- move the selection part outside of the macro, So it could be outside of the
switch and reduce the code generation.
- introduce two helpers (one for the read operation, the other for the write
operation). This would make the code a bit easier to read.
- error out when the caller pass a number higher than 15
---
 xen/arch/arm/include/asm/arm64/sysregs.h |  32 +++++
 xen/arch/arm/mpu/mm.c                    | 173 +++++++++++++++++++++++
 2 files changed, 205 insertions(+)

diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
index a249a660a8..c8a679afdd 100644
--- a/xen/arch/arm/include/asm/arm64/sysregs.h
+++ b/xen/arch/arm/include/asm/arm64/sysregs.h
@@ -467,9 +467,41 @@
 
 /* EL2 MPU Protection Region Base Address Register encode */
 #define PRBAR_EL2   S3_4_C6_C8_0
+#define PRBAR0_EL2  S3_4_C6_C8_0
+#define PRBAR1_EL2  S3_4_C6_C8_4
+#define PRBAR2_EL2  S3_4_C6_C9_0
+#define PRBAR3_EL2  S3_4_C6_C9_4
+#define PRBAR4_EL2  S3_4_C6_C10_0
+#define PRBAR5_EL2  S3_4_C6_C10_4
+#define PRBAR6_EL2  S3_4_C6_C11_0
+#define PRBAR7_EL2  S3_4_C6_C11_4
+#define PRBAR8_EL2  S3_4_C6_C12_0
+#define PRBAR9_EL2  S3_4_C6_C12_4
+#define PRBAR10_EL2 S3_4_C6_C13_0
+#define PRBAR11_EL2 S3_4_C6_C13_4
+#define PRBAR12_EL2 S3_4_C6_C14_0
+#define PRBAR13_EL2 S3_4_C6_C14_4
+#define PRBAR14_EL2 S3_4_C6_C15_0
+#define PRBAR15_EL2 S3_4_C6_C15_4
 
 /* EL2 MPU Protection Region Limit Address Register encode */
 #define PRLAR_EL2   S3_4_C6_C8_1
+#define PRLAR0_EL2  S3_4_C6_C8_1
+#define PRLAR1_EL2  S3_4_C6_C8_5
+#define PRLAR2_EL2  S3_4_C6_C9_1
+#define PRLAR3_EL2  S3_4_C6_C9_5
+#define PRLAR4_EL2  S3_4_C6_C10_1
+#define PRLAR5_EL2  S3_4_C6_C10_5
+#define PRLAR6_EL2  S3_4_C6_C11_1
+#define PRLAR7_EL2  S3_4_C6_C11_5
+#define PRLAR8_EL2  S3_4_C6_C12_1
+#define PRLAR9_EL2  S3_4_C6_C12_5
+#define PRLAR10_EL2 S3_4_C6_C13_1
+#define PRLAR11_EL2 S3_4_C6_C13_5
+#define PRLAR12_EL2 S3_4_C6_C14_1
+#define PRLAR13_EL2 S3_4_C6_C14_5
+#define PRLAR14_EL2 S3_4_C6_C15_1
+#define PRLAR15_EL2 S3_4_C6_C15_5
 
 /* MPU Protection Region Selection Register encode */
 #define PRSELR_EL2  S3_4_C6_C2_1
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index e06a6e5810..7b1b5d6e27 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -39,6 +39,23 @@ uint8_t __ro_after_init max_xen_mpumap;
  */
 static DECLARE_BITMAP(xen_mpumap_mask, ARM_MAX_MPU_MEMORY_REGIONS);
 
+/* Write a MPU protection region */
+#define WRITE_PROTECTION_REGION(pr, prbar_el2, prlar_el2) ({    \
+    const pr_t *_pr = pr;                                       \
+                                                                \
+    WRITE_SYSREG(_pr->prbar.bits, prbar_el2);                   \
+    WRITE_SYSREG(_pr->prlar.bits, prlar_el2);                   \
+})
+
+/* Read a MPU protection region */
+#define READ_PROTECTION_REGION(prbar_el2, prlar_el2) ({         \
+    pr_t _pr;                                                   \
+                                                                \
+    _pr.prbar.bits = READ_SYSREG(prbar_el2);                    \
+    _pr.prlar.bits = READ_SYSREG(prlar_el2);                    \
+    _pr;                                                        \
+})
+
 void __init setup_mm_mappings(unsigned long boot_phys_offset)
 {
     unsigned int nr_regions = REGION_UART_SEL, i = 0;
@@ -57,6 +74,162 @@ void __init setup_mm_mappings(unsigned long boot_phys_offset)
         set_bit(i, xen_mpumap_mask);
 }
 
+/*
+ * Armv8-R AArch64 at most supports 255 MPU protection regions.
+ * See section G1.3.18 of the reference manual for Armv8-R AArch64,
+ * PRBAR<n>_EL2 and PRLAR<n>_EL2 provide access to the EL2 MPU region
+ * determined by the value of 'n' and PRSELR_EL2.REGION as
+ * PRSELR_EL2.REGION<7:4>:n(n = 0, 1, 2, ... , 15)
+ * For example to access regions from 16 to 31 (0b10000 to 0b11111):
+ * - Set PRSELR_EL2 to 0b1xxxx
+ * - Region 16 configuration is accessible through PRBAR0_EL2 and PRLAR0_EL2
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
+static void read_protection_region(pr_t *pr_read, uint8_t sel)
+{
+    /*
+     * Before accessing EL2 MPU region register PRBAR_EL2/PRLAR_EL2,
+     * make sure PRSELR_EL2 is set, as it determines which MPU region
+     * is selected.
+     */
+    WRITE_SYSREG(sel, PRSELR_EL2);
+    isb();
+
+    switch ( sel & 0x0f )
+    {
+    case 0:
+        *pr_read = READ_PROTECTION_REGION(PRBAR0_EL2, PRLAR0_EL2);
+        break;
+    case 1:
+        *pr_read = READ_PROTECTION_REGION(PRBAR1_EL2, PRLAR1_EL2);
+        break;
+    case 2:
+        *pr_read = READ_PROTECTION_REGION(PRBAR2_EL2, PRLAR2_EL2);
+        break;
+    case 3:
+        *pr_read = READ_PROTECTION_REGION(PRBAR3_EL2, PRLAR3_EL2);
+        break;
+    case 4:
+        *pr_read = READ_PROTECTION_REGION(PRBAR4_EL2, PRLAR4_EL2);
+        break;
+    case 5:
+        *pr_read = READ_PROTECTION_REGION(PRBAR5_EL2, PRLAR5_EL2);
+        break;
+    case 6:
+        *pr_read = READ_PROTECTION_REGION(PRBAR6_EL2, PRLAR6_EL2);
+        break;
+    case 7:
+        *pr_read = READ_PROTECTION_REGION(PRBAR7_EL2, PRLAR7_EL2);
+        break;
+    case 8:
+        *pr_read = READ_PROTECTION_REGION(PRBAR8_EL2, PRLAR8_EL2);
+        break;
+    case 9:
+        *pr_read = READ_PROTECTION_REGION(PRBAR9_EL2, PRLAR9_EL2);
+        break;
+    case 10:
+        *pr_read = READ_PROTECTION_REGION(PRBAR10_EL2, PRLAR10_EL2);
+        break;
+    case 11:
+        *pr_read = READ_PROTECTION_REGION(PRBAR11_EL2, PRLAR11_EL2);
+        break;
+    case 12:
+        *pr_read = READ_PROTECTION_REGION(PRBAR12_EL2, PRLAR12_EL2);
+        break;
+    case 13:
+        *pr_read = READ_PROTECTION_REGION(PRBAR13_EL2, PRLAR13_EL2);
+        break;
+    case 14:
+        *pr_read = READ_PROTECTION_REGION(PRBAR14_EL2, PRLAR14_EL2);
+        break;
+    case 15:
+        *pr_read = READ_PROTECTION_REGION(PRBAR15_EL2, PRLAR15_EL2);
+        break;
+    default:
+        panic("Unsupported selector %u\n", sel);
+    }
+}
+
+/*
+ * Write EL2 MPU Protection Region.
+ *
+ * @pr_write: const mpu protection region passed through write op.
+ * @sel: mpu protection region selector
+ */
+static void write_protection_region(const pr_t *pr_write, uint8_t sel)
+{
+    /*
+     * Before accessing EL2 MPU region register PRBAR_EL2/PRLAR_EL2,
+     * make sure PRSELR_EL2 is set, as it determines which MPU region
+     * is selected.
+     */
+    WRITE_SYSREG(sel, PRSELR_EL2);
+    isb();
+
+    switch ( sel & 0x0f )
+    {
+    case 0:
+        WRITE_PROTECTION_REGION(pr_write, PRBAR0_EL2, PRLAR0_EL2);
+        break;
+    case 1:
+        WRITE_PROTECTION_REGION(pr_write, PRBAR1_EL2, PRLAR1_EL2);
+        break;
+    case 2:
+        WRITE_PROTECTION_REGION(pr_write, PRBAR2_EL2, PRLAR2_EL2);
+        break;
+    case 3:
+        WRITE_PROTECTION_REGION(pr_write, PRBAR3_EL2, PRLAR3_EL2);
+        break;
+    case 4:
+        WRITE_PROTECTION_REGION(pr_write, PRBAR4_EL2, PRLAR4_EL2);
+        break;
+    case 5:
+        WRITE_PROTECTION_REGION(pr_write, PRBAR5_EL2, PRLAR5_EL2);
+        break;
+    case 6:
+        WRITE_PROTECTION_REGION(pr_write, PRBAR6_EL2, PRLAR6_EL2);
+        break;
+    case 7:
+        WRITE_PROTECTION_REGION(pr_write, PRBAR7_EL2, PRLAR7_EL2);
+        break;
+    case 8:
+        WRITE_PROTECTION_REGION(pr_write, PRBAR8_EL2, PRLAR8_EL2);
+        break;
+    case 9:
+        WRITE_PROTECTION_REGION(pr_write, PRBAR9_EL2, PRLAR9_EL2);
+        break;
+    case 10:
+        WRITE_PROTECTION_REGION(pr_write, PRBAR10_EL2, PRLAR10_EL2);
+        break;
+    case 11:
+        WRITE_PROTECTION_REGION(pr_write, PRBAR11_EL2, PRLAR11_EL2);
+        break;
+    case 12:
+        WRITE_PROTECTION_REGION(pr_write, PRBAR12_EL2, PRLAR12_EL2);
+        break;
+    case 13:
+        WRITE_PROTECTION_REGION(pr_write, PRBAR13_EL2, PRLAR13_EL2);
+        break;
+    case 14:
+        WRITE_PROTECTION_REGION(pr_write, PRBAR14_EL2, PRLAR14_EL2);
+        break;
+    case 15:
+        WRITE_PROTECTION_REGION(pr_write, PRBAR15_EL2, PRLAR15_EL2);
+        break;
+    default:
+        panic("Unsupported selector %u\n", sel);
+    }
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.25.1


