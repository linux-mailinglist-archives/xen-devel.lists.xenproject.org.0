Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3516CA8611F
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 16:57:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947476.1345118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3Foc-000715-T7; Fri, 11 Apr 2025 14:57:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947476.1345118; Fri, 11 Apr 2025 14:57:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3Foc-0006vk-Oq; Fri, 11 Apr 2025 14:57:10 +0000
Received: by outflank-mailman (input) for mailman id 947476;
 Fri, 11 Apr 2025 14:57:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TlgU=W5=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1u3Foc-0006ed-3s
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 14:57:10 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 3e2581e2-16e5-11f0-9ead-5ba50f476ded;
 Fri, 11 Apr 2025 16:57:09 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4935106F;
 Fri, 11 Apr 2025 07:57:08 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3DF393F59E;
 Fri, 11 Apr 2025 07:57:08 -0700 (PDT)
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
X-Inumbo-ID: 3e2581e2-16e5-11f0-9ead-5ba50f476ded
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 3/7] arm/mpu: Introduce utility functions for the pr_t type
Date: Fri, 11 Apr 2025 15:56:51 +0100
Message-Id: <20250411145655.140667-4-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250411145655.140667-1-luca.fancellu@arm.com>
References: <20250411145655.140667-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce few utility function to manipulate and handle the
pr_t type.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/include/asm/mpu.h | 40 ++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
index 59ff22c804c1..6971507457fb 100644
--- a/xen/arch/arm/include/asm/mpu.h
+++ b/xen/arch/arm/include/asm/mpu.h
@@ -20,6 +20,46 @@
 #define NUM_MPU_REGIONS_MASK    (NUM_MPU_REGIONS - 1)
 #define MAX_MPU_REGIONS         NUM_MPU_REGIONS_MASK
 
+#ifndef __ASSEMBLY__
+
+/* Set base address of MPU protection region(pr_t). */
+static inline void pr_set_base(pr_t *pr, paddr_t base)
+{
+    pr->prbar.reg.base = (base >> MPU_REGION_SHIFT);
+}
+
+/* Set limit address of MPU protection region(pr_t). */
+static inline void pr_set_limit(pr_t *pr, paddr_t limit)
+{
+    pr->prlar.reg.limit = ((limit - 1) >> MPU_REGION_SHIFT);
+}
+
+/*
+ * Access to get base address of MPU protection region(pr_t).
+ * The base address shall be zero extended.
+ */
+static inline paddr_t pr_get_base(pr_t *pr)
+{
+    return (paddr_t)(pr->prbar.reg.base << MPU_REGION_SHIFT);
+}
+
+/*
+ * Access to get limit address of MPU protection region(pr_t).
+ * The limit address shall be concatenated with 0x3f.
+ */
+static inline paddr_t pr_get_limit(pr_t *pr)
+{
+    return (paddr_t)((pr->prlar.reg.limit << MPU_REGION_SHIFT)
+                     | ~MPU_REGION_MASK);
+}
+
+static inline bool region_is_valid(pr_t *pr)
+{
+    return pr->prlar.reg.en;
+}
+
+#endif /* __ASSEMBLY__ */
+
 #endif /* __ARM_MPU_H__ */
 
 /*
-- 
2.34.1


