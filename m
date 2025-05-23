Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD0DAC1D58
	for <lists+xen-devel@lfdr.de>; Fri, 23 May 2025 08:54:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.995199.1377771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIMIV-0003le-Rm; Fri, 23 May 2025 06:54:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 995199.1377771; Fri, 23 May 2025 06:54:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIMIV-0003j2-Me; Fri, 23 May 2025 06:54:27 +0000
Received: by outflank-mailman (input) for mailman id 995199;
 Fri, 23 May 2025 06:54:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ff/g=YH=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1uIMIU-0002CD-5P
 for xen-devel@lists.xenproject.org; Fri, 23 May 2025 06:54:26 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id c2ae0e57-37a2-11f0-b892-0df219b8e170;
 Fri, 23 May 2025 08:54:24 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 24FF11764;
 Thu, 22 May 2025 23:54:09 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 917D33F673;
 Thu, 22 May 2025 23:54:22 -0700 (PDT)
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
X-Inumbo-ID: c2ae0e57-37a2-11f0-b892-0df219b8e170
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v6 6/6] arm/mpu: Provide a constructor for pr_t type
Date: Fri, 23 May 2025 07:54:06 +0100
Message-Id: <20250523065406.3795420-7-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250523065406.3795420-1-luca.fancellu@arm.com>
References: <20250523065406.3795420-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide a function that creates a pr_t object from a memory
range and some attributes.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
v6 changes:
 - explicitly initialise also xn_0 and ap_0.
v5 changes:
 - removed AP_RW_EL2 used only by pr_of_xenaddr(), fixed
   comments and typos
 - Given some comments to the page.h flags and modifications
   to the prbar_t fields ap, xn, the constructor now takes
   flags instead of attr_idx, which I believe it's better,
   deleted PRBAR_EL2_XN_ENABLED since now the PAGE_XN_MASK()
   is used instead.
 - renamed to pr_of_addr since it will be used also in p2m
v4 changes:
 - update helper comments
 - rename XN_EL2_ENABLED to PRBAR_EL2_XN_ENABLED
 - protected pr_of_xenaddr() with #ifdef Arm64 until Arm32
   can build with it
---
 xen/arch/arm/include/asm/mpu/mm.h | 10 +++++
 xen/arch/arm/mpu/mm.c             | 68 +++++++++++++++++++++++++++++++
 2 files changed, 78 insertions(+)

diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
index d7950d9b4fbb..a7f970b465fe 100644
--- a/xen/arch/arm/include/asm/mpu/mm.h
+++ b/xen/arch/arm/include/asm/mpu/mm.h
@@ -65,6 +65,16 @@ void read_protection_region(pr_t *pr_read, uint8_t sel);
 /* Writes the MPU region (from @pr_write) with index @sel to the HW */
 void write_protection_region(const pr_t *pr_write, uint8_t sel);
 
+/*
+ * Creates a pr_t structure describing a protection region.
+ *
+ * @base: base address as base of the protection region.
+ * @limit: exclusive address as limit of the protection region.
+ * @flags: memory flags for the mapping.
+ * @return: pr_t structure describing a protection region.
+ */
+pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags);
+
 #endif /* __ARM_MPU_MM_H__ */
 
 /*
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index 9c5789cdf1f9..86fbe105af45 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -9,6 +9,7 @@
 #include <xen/types.h>
 #include <asm/mpu.h>
 #include <asm/mpu/mm.h>
+#include <asm/page.h>
 #include <asm/sysregs.h>
 
 struct page_info *frame_table;
@@ -155,6 +156,73 @@ void write_protection_region(const pr_t *pr_write, uint8_t sel)
         break;
     }
 }
+
+pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags)
+{
+    unsigned int attr_idx = PAGE_AI_MASK(flags);
+    prbar_t prbar;
+    prlar_t prlar;
+    pr_t region;
+
+    /* Build up value for PRBAR_EL2. */
+    prbar = (prbar_t) {
+        .reg = {
+            .xn_0 = 0,
+            .xn = PAGE_XN_MASK(flags),
+            .ap_0 = 0,
+            .ro = PAGE_RO_MASK(flags)
+        }};
+
+    switch ( attr_idx )
+    {
+    /*
+     * ARM ARM: Shareable, Inner Shareable, and Outer Shareable Normal memory
+     * (DDI 0487L.a B2.10.1.1.1 Note section):
+     *
+     * Because all data accesses to Non-cacheable locations are data coherent
+     * to all observers, Non-cacheable locations are always treated as Outer
+     * Shareable
+     *
+     * ARM ARM: Device memory (DDI 0487L.a B2.10.2)
+     *
+     * All of these memory types have the following properties:
+     * [...]
+     *  - Data accesses to memory locations are coherent for all observers in
+     *    the system, and correspondingly are treated as being Outer Shareable
+     */
+    case MT_NORMAL_NC:
+        /* Fall through */
+    case MT_DEVICE_nGnRnE:
+        /* Fall through */
+    case MT_DEVICE_nGnRE:
+        prbar.reg.sh = LPAE_SH_OUTER;
+        break;
+    default:
+        /* Xen mappings are SMP coherent */
+        prbar.reg.sh = LPAE_SH_INNER;
+        break;
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
 #endif /* CONFIG_ARM_64 */
 
 void __init setup_mm(void)
-- 
2.34.1


