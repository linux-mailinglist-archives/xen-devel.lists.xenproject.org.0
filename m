Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3C0A7D934
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 11:14:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.939434.1339575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1iZA-0005da-02; Mon, 07 Apr 2025 09:14:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 939434.1339575; Mon, 07 Apr 2025 09:14:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1iZ9-0005Xg-ON; Mon, 07 Apr 2025 09:14:51 +0000
Received: by outflank-mailman (input) for mailman id 939434;
 Mon, 07 Apr 2025 09:14:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U9Ey=WZ=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1u1iZ7-0003xy-Fd
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 09:14:49 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id c11750d6-1390-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 11:14:48 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A8181424;
 Mon,  7 Apr 2025 02:14:49 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 184E03F59E;
 Mon,  7 Apr 2025 02:14:46 -0700 (PDT)
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
X-Inumbo-ID: c11750d6-1390-11f0-9eaa-5ba50f476ded
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 7/7] arm/mpu: Implement setup_mpu for MPU system
Date: Mon,  7 Apr 2025 10:14:30 +0100
Message-Id: <20250407091430.2342709-8-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407091430.2342709-1-luca.fancellu@arm.com>
References: <20250407091430.2342709-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement the function setup_mpu that will logically track the MPU
regions defined by hardware registers, start introducing data
structures and functions to track the status from the C world.

The xen_mpumap_mask bitmap is used to track which MPU region are
enabled at runtime.

This function is called from setup_mm() which full implementation
will be provided in a later stage.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/include/asm/arm64/mpu.h |  2 ++
 xen/arch/arm/mpu/mm.c                | 49 +++++++++++++++++++++++++++-
 2 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
index 7cf8d355a1af..ff5a957bf085 100644
--- a/xen/arch/arm/include/asm/arm64/mpu.h
+++ b/xen/arch/arm/include/asm/arm64/mpu.h
@@ -6,6 +6,8 @@
 #ifndef __ARM_ARM64_MPU_H__
 #define __ARM_ARM64_MPU_H__
 
+#define PRENR_MASK  GENMASK(31, 0)
+
 /*
  * Excute never.
  * Stage 1 EL2 translation regime.
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index 2c5820a44f13..fe05c8097155 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -14,6 +14,17 @@
 
 struct page_info *frame_table;
 
+/* Maximum number of supported MPU memory regions by the EL2 MPU. */
+uint8_t __ro_after_init max_xen_mpumap;
+
+/*
+ * Bitmap xen_mpumap_mask is to record the usage of EL2 MPU memory regions.
+ * Bit 0 represents MPU memory region 0, bit 1 represents MPU memory
+ * region 1, ..., and so on.
+ * If a MPU memory region gets enabled, set the according bit to 1.
+ */
+DECLARE_BITMAP(xen_mpumap_mask, MAX_MPU_REGIONS);
+
 /* EL2 Xen MPU memory region mapping table. */
 pr_t xen_mpumap[MAX_MPU_REGIONS];
 
@@ -224,9 +235,45 @@ pr_t pr_of_xenaddr(paddr_t base, paddr_t limit, unsigned attr)
     return region;
 }
 
+/*
+ * The code in this function needs to track the regions programmed in
+ * arm64/mpu/head.S
+ */
+static void __init setup_mpu(void)
+{
+    register_t prenr;
+    unsigned int i = 0;
+
+    /*
+     * MPUIR_EL2.Region[0:7] identifies the number of regions supported by
+     * the EL2 MPU.
+     */
+    max_xen_mpumap = (uint8_t)(READ_SYSREG(MPUIR_EL2) & NUM_MPU_REGIONS_MASK);
+
+    /* PRENR_EL2 has the N bit set if the N region is enabled, N < 32 */
+    prenr = (READ_SYSREG(PRENR_EL2) & PRENR_MASK);
+
+    /*
+     * Set the bitfield for regions enabled in assembly boot-time.
+     * This code works under the assumption that the code in head.S has
+     * allocated and enabled regions below 32 (N < 32).
+     */
+    while ( prenr > 0 )
+    {
+        if (prenr & 0x1)
+        {
+            set_bit(i, xen_mpumap_mask);
+            read_protection_region(&xen_mpumap[i], i);
+        }
+
+        prenr >>= 1;
+        i++;
+    }
+}
+
 void __init setup_mm(void)
 {
-    BUG_ON("unimplemented");
+    setup_mpu();
 }
 
 int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
-- 
2.34.1


