Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0495AA1046
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 17:21:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972773.1361094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9mln-0002VY-CP; Tue, 29 Apr 2025 15:21:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972773.1361094; Tue, 29 Apr 2025 15:21:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9mln-0002Om-8T; Tue, 29 Apr 2025 15:21:15 +0000
Received: by outflank-mailman (input) for mailman id 972773;
 Tue, 29 Apr 2025 15:21:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mkRs=XP=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1u9mll-00026m-PA
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 15:21:13 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 960a2133-250d-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 17:21:13 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0424B22FC;
 Tue, 29 Apr 2025 08:21:06 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB0EB3F673;
 Tue, 29 Apr 2025 08:21:11 -0700 (PDT)
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
X-Inumbo-ID: 960a2133-250d-11f0-9eb4-5ba50f476ded
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 5/7] arm/mpu: Introduce utility functions for the pr_t type
Date: Tue, 29 Apr 2025 16:20:55 +0100
Message-Id: <20250429152057.2380536-6-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250429152057.2380536-1-luca.fancellu@arm.com>
References: <20250429152057.2380536-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce few utility function to manipulate and handle the
pr_t type.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
v4 changes:
 - Modify comment on top of the helpers. Clarify pr_set_limit
   takes exclusive address.
   Protected common code with #ifdef Arm64 until Arm32 is ready
   with pr_t
---
 xen/arch/arm/include/asm/mpu.h | 64 ++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
index 40a86140b6cc..0e0a7f05ade9 100644
--- a/xen/arch/arm/include/asm/mpu.h
+++ b/xen/arch/arm/include/asm/mpu.h
@@ -24,6 +24,70 @@
 #define NUM_MPU_REGIONS_MASK    (NUM_MPU_REGIONS - 1)
 #define MAX_MPU_REGION_NR       255
 
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
+    pr->prbar.reg.base = (base >> MPU_REGION_SHIFT);
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
+    pr->prlar.reg.limit = ((limit - 1) >> MPU_REGION_SHIFT);
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


