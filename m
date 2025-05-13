Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 646BFAB4E69
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 10:46:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982635.1369031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uElGt-0002wt-HV; Tue, 13 May 2025 08:45:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982635.1369031; Tue, 13 May 2025 08:45:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uElGt-0002uf-Dx; Tue, 13 May 2025 08:45:55 +0000
Received: by outflank-mailman (input) for mailman id 982635;
 Tue, 13 May 2025 08:45:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G6vE=X5=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1uElGs-0001kc-8g
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 08:45:54 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id acaa5753-2fd6-11f0-9ffb-bf95429c2676;
 Tue, 13 May 2025 10:45:51 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A1B822EE;
 Tue, 13 May 2025 01:45:41 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A0BB3F5A1;
 Tue, 13 May 2025 01:45:51 -0700 (PDT)
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
X-Inumbo-ID: acaa5753-2fd6-11f0-9ffb-bf95429c2676
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 5/6] arm/mpu: Introduce utility functions for the pr_t type
Date: Tue, 13 May 2025 09:45:31 +0100
Message-Id: <20250513084532.4059388-6-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250513084532.4059388-1-luca.fancellu@arm.com>
References: <20250513084532.4059388-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a few utility functions to manipulate and handle the
pr_t type.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
v5 changes:
 - Don't rely on bitfield and use the mask MPU_REGION_RES0 for
   pr_set_base and pr_set_limit to make it explicit. Fixed typos
   in commit message.
v4 changes:
 - Modify comment on top of the helpers. Clarify pr_set_limit
   takes exclusive address.
   Protected common code with #ifdef Arm64 until Arm32 is ready
   with pr_t
---
 xen/arch/arm/include/asm/mpu.h | 65 ++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
index fb93b8b19d24..b90ae8eab662 100644
--- a/xen/arch/arm/include/asm/mpu.h
+++ b/xen/arch/arm/include/asm/mpu.h
@@ -23,6 +23,71 @@
 #define NUM_MPU_REGIONS_MASK    (NUM_MPU_REGIONS - 1)
 #define MAX_MPU_REGION_NR       NUM_MPU_REGIONS_MASK
 
+#ifndef __ASSEMBLY__
+
+#ifdef CONFIG_ARM_64
+/*
+ * Set base address of MPU protection region.
+ *
+ * @pr: pointer to the protection region structure.
+ * @base: base address as base of the protection region.
+ */
+static inline void pr_set_base(pr_t *pr, paddr_t base)
+{
+    pr->prbar.reg.base = ((base & ~MPU_REGION_RES0) >> MPU_REGION_SHIFT);
+}
+
+/*
+ * Set limit address of MPU protection region.
+ *
+ * @pr: pointer to the protection region structure.
+ * @limit: exclusive address as limit of the protection region.
+ */
+static inline void pr_set_limit(pr_t *pr, paddr_t limit)
+{
+    pr->prlar.reg.limit = (((limit - 1) & ~MPU_REGION_RES0)
+                           >> MPU_REGION_SHIFT);
+}
+
+/*
+ * Access to get base address of MPU protection region.
+ * The base address shall be zero extended.
+ *
+ * @pr: pointer to the protection region structure.
+ * @return: Base address configured for the passed protection region.
+ */
+static inline paddr_t pr_get_base(pr_t *pr)
+{
+    return (paddr_t)(pr->prbar.reg.base << MPU_REGION_SHIFT);
+}
+
+/*
+ * Access to get limit address of MPU protection region.
+ * The limit address shall be concatenated with 0x3f.
+ *
+ * @pr: pointer to the protection region structure.
+ * @return: Inclusive limit address configured for the passed protection region.
+ */
+static inline paddr_t pr_get_limit(pr_t *pr)
+{
+    return (paddr_t)((pr->prlar.reg.limit << MPU_REGION_SHIFT)
+                     | ~MPU_REGION_MASK);
+}
+
+/*
+ * Checks if the protection region is valid (enabled).
+ *
+ * @pr: pointer to the protection region structure.
+ * @return: True if the region is valid (enabled), false otherwise.
+ */
+static inline bool region_is_valid(pr_t *pr)
+{
+    return pr->prlar.reg.en;
+}
+#endif
+
+#endif /* __ASSEMBLY__ */
+
 #endif /* __ARM_MPU_H__ */
 
 /*
-- 
2.34.1


