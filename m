Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B436F668B83
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 06:36:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476608.739005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCjc-0004BC-Eu; Fri, 13 Jan 2023 05:36:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476608.739005; Fri, 13 Jan 2023 05:36:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCjc-00047Q-Ai; Fri, 13 Jan 2023 05:36:12 +0000
Received: by outflank-mailman (input) for mailman id 476608;
 Fri, 13 Jan 2023 05:36:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f25I=5K=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pGCeC-0005sP-4U
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 05:30:36 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 66628c11-9303-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 06:30:33 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F12CCFEC;
 Thu, 12 Jan 2023 21:31:14 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3E9B43F587;
 Thu, 12 Jan 2023 21:30:29 -0800 (PST)
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
X-Inumbo-ID: 66628c11-9303-11ed-b8d0-410ff93cb8f0
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v2 18/40] xen/mpu: introduce helper access_protection_region
Date: Fri, 13 Jan 2023 13:28:51 +0800
Message-Id: <20230113052914.3845596-19-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113052914.3845596-1-Penny.Zheng@arm.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Each EL2 MPU protection region could be configured using PRBAR<n>_EL2 and
PRLAR<n>_EL2.

This commit introduces a new helper access_protection_region() to access
EL2 MPU protection region, including both read/write operations.

As explained in section G1.3.18 of the reference manual for AArch64v8R,
a set of system register PRBAR<n>_EL2 and PRLAR<n>_EL2 provide access to
the EL2 MPU region which is determined by the value of 'n' and
PRSELR_EL2.REGION as PRSELR_EL2.REGION<7:4>:n.(n = 0, 1, 2, ... , 15)
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
 xen/arch/arm/mm_mpu.c | 151 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 151 insertions(+)

diff --git a/xen/arch/arm/mm_mpu.c b/xen/arch/arm/mm_mpu.c
index c9e17ab6da..f2b494449c 100644
--- a/xen/arch/arm/mm_mpu.c
+++ b/xen/arch/arm/mm_mpu.c
@@ -46,6 +46,157 @@ uint64_t __ro_after_init next_transient_region_idx;
 /* Maximum number of supported MPU memory regions by the EL2 MPU. */
 uint64_t __ro_after_init max_xen_mpumap;
 
+/* Write a MPU protection region */
+#define WRITE_PROTECTION_REGION(sel, pr, prbar_el2, prlar_el2) ({       \
+    uint64_t _sel = sel;                                                \
+    const pr_t *_pr = pr;                                               \
+    asm volatile(                                                       \
+        "msr "__stringify(PRSELR_EL2)", %0;" /* Selects the region */   \
+        "dsb sy;"                                                       \
+        "msr "__stringify(prbar_el2)", %1;" /* Write PRBAR<n>_EL2 */    \
+        "msr "__stringify(prlar_el2)", %2;" /* Write PRLAR<n>_EL2 */    \
+        "dsb sy;"                                                       \
+        : : "r" (_sel), "r" (_pr->prbar.bits), "r" (_pr->prlar.bits));  \
+})
+
+/* Read a MPU protection region */
+#define READ_PROTECTION_REGION(sel, prbar_el2, prlar_el2) ({            \
+    uint64_t _sel = sel;                                                \
+    pr_t _pr;                                                           \
+    asm volatile(                                                       \
+        "msr "__stringify(PRSELR_EL2)", %2;" /* Selects the region */   \
+        "dsb sy;"                                                       \
+        "mrs %0, "__stringify(prbar_el2)";" /* Read PRBAR<n>_EL2 */     \
+        "mrs %1, "__stringify(prlar_el2)";" /* Read PRLAR<n>_EL2 */     \
+        "dsb sy;"                                                       \
+        : "=r" (_pr.prbar.bits), "=r" (_pr.prlar.bits) : "r" (_sel));   \
+    _pr;                                                                \
+})
+
+/*
+ * Access MPU protection region, including both read/write operations.
+ * Armv8-R AArch64 at most supports 255 MPU protection regions.
+ * See section G1.3.18 of the reference manual for Armv8-R AArch64,
+ * PRBAR<n>_EL2 and PRLAR<n>_EL2 provide access to the EL2 MPU region
+ * determined by the value of 'n' and PRSELR_EL2.REGION as
+ * PRSELR_EL2.REGION<7:4>:n(n = 0, 1, 2, ... , 15)
+ * For example to access regions from 16 to 31 (0b10000 to 0b11111):
+ * - Set PRSELR_EL2 to 0b1xxxx
+ * - Region 16 configuration is accessible through PRBAR0_ELx and PRLAR0_ELx
+ * - Region 17 configuration is accessible through PRBAR1_ELx and PRLAR1_ELx
+ * - Region 18 configuration is accessible through PRBAR2_ELx and PRLAR2_ELx
+ * - ...
+ * - Region 31 configuration is accessible through PRBAR15_ELx and PRLAR15_ELx
+ *
+ * @read: if it is read operation.
+ * @pr_read: mpu protection region returned by read op.
+ * @pr_write: const mpu protection region passed through write op.
+ * @sel: mpu protection region selector
+ */
+static void access_protection_region(bool read, pr_t *pr_read,
+                                     const pr_t *pr_write, uint64_t sel)
+{
+    switch ( sel & 0xf )
+    {
+    case 0:
+        if ( read )
+            *pr_read = READ_PROTECTION_REGION(sel, PRBAR0_EL2, PRLAR0_EL2);
+        else
+            WRITE_PROTECTION_REGION(sel, pr_write, PRBAR0_EL2, PRLAR0_EL2);
+        break;
+    case 1:
+        if ( read )
+            *pr_read = READ_PROTECTION_REGION(sel, PRBAR1_EL2, PRLAR1_EL2);
+        else
+            WRITE_PROTECTION_REGION(sel, pr_write, PRBAR1_EL2, PRLAR1_EL2);
+        break;
+    case 2:
+        if ( read )
+            *pr_read = READ_PROTECTION_REGION(sel, PRBAR2_EL2, PRLAR2_EL2);
+        else
+            WRITE_PROTECTION_REGION(sel, pr_write, PRBAR2_EL2, PRLAR2_EL2);
+        break;
+    case 3:
+        if ( read )
+            *pr_read = READ_PROTECTION_REGION(sel, PRBAR3_EL2, PRLAR3_EL2);
+        else
+            WRITE_PROTECTION_REGION(sel, pr_write, PRBAR3_EL2, PRLAR3_EL2);
+        break;
+    case 4:
+        if ( read )
+            *pr_read = READ_PROTECTION_REGION(sel, PRBAR4_EL2, PRLAR4_EL2);
+        else
+            WRITE_PROTECTION_REGION(sel, pr_write, PRBAR4_EL2, PRLAR4_EL2);
+        break;
+    case 5:
+        if ( read )
+            *pr_read = READ_PROTECTION_REGION(sel, PRBAR5_EL2, PRLAR5_EL2);
+        else
+            WRITE_PROTECTION_REGION(sel, pr_write, PRBAR5_EL2, PRLAR5_EL2);
+        break;
+    case 6:
+        if ( read )
+            *pr_read = READ_PROTECTION_REGION(sel, PRBAR6_EL2, PRLAR6_EL2);
+        else
+            WRITE_PROTECTION_REGION(sel, pr_write, PRBAR6_EL2, PRLAR6_EL2);
+        break;
+    case 7:
+        if ( read )
+            *pr_read = READ_PROTECTION_REGION(sel, PRBAR7_EL2, PRLAR7_EL2);
+        else
+            WRITE_PROTECTION_REGION(sel, pr_write, PRBAR7_EL2, PRLAR7_EL2);
+        break;
+    case 8:
+        if ( read )
+            *pr_read = READ_PROTECTION_REGION(sel, PRBAR8_EL2, PRLAR8_EL2);
+        else
+            WRITE_PROTECTION_REGION(sel, pr_write, PRBAR8_EL2, PRLAR8_EL2);
+        break;
+    case 9:
+        if ( read )
+            *pr_read = READ_PROTECTION_REGION(sel, PRBAR9_EL2, PRLAR9_EL2);
+        else
+            WRITE_PROTECTION_REGION(sel, pr_write, PRBAR9_EL2, PRLAR9_EL2);
+        break;
+    case 10:
+        if ( read )
+            *pr_read = READ_PROTECTION_REGION(sel, PRBAR10_EL2, PRLAR10_EL2);
+        else
+            WRITE_PROTECTION_REGION(sel, pr_write, PRBAR10_EL2, PRLAR10_EL2);
+        break;
+    case 11:
+        if ( read )
+            *pr_read = READ_PROTECTION_REGION(sel, PRBAR11_EL2, PRLAR11_EL2);
+        else
+            WRITE_PROTECTION_REGION(sel, pr_write, PRBAR11_EL2, PRLAR11_EL2);
+        break;
+    case 12:
+        if ( read )
+            *pr_read = READ_PROTECTION_REGION(sel, PRBAR12_EL2, PRLAR12_EL2);
+        else
+            WRITE_PROTECTION_REGION(sel, pr_write, PRBAR12_EL2, PRLAR12_EL2);
+        break;
+    case 13:
+        if ( read )
+            *pr_read = READ_PROTECTION_REGION(sel, PRBAR13_EL2, PRLAR13_EL2);
+        else
+            WRITE_PROTECTION_REGION(sel, pr_write, PRBAR13_EL2, PRLAR13_EL2);
+        break;
+    case 14:
+        if ( read )
+            *pr_read = READ_PROTECTION_REGION(sel, PRBAR14_EL2, PRLAR14_EL2);
+        else
+            WRITE_PROTECTION_REGION(sel, pr_write, PRBAR14_EL2, PRLAR14_EL2);
+        break;
+    case 15:
+        if ( read )
+            *pr_read = READ_PROTECTION_REGION(sel, PRBAR15_EL2, PRLAR15_EL2);
+        else
+            WRITE_PROTECTION_REGION(sel, pr_write, PRBAR15_EL2, PRLAR15_EL2);
+        break;
+    }
+}
+
 /* TODO: Implementation on the first usage */
 void dump_hyp_walk(vaddr_t addr)
 {
-- 
2.25.1


