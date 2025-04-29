Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A3BAA104A
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 17:21:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972775.1361107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9mlo-0002kb-3g; Tue, 29 Apr 2025 15:21:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972775.1361107; Tue, 29 Apr 2025 15:21:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9mln-0002b0-Vj; Tue, 29 Apr 2025 15:21:15 +0000
Received: by outflank-mailman (input) for mailman id 972775;
 Tue, 29 Apr 2025 15:21:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mkRs=XP=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1u9mlm-0002Ky-H3
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 15:21:14 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 93b05b5b-250d-11f0-9ffb-bf95429c2676;
 Tue, 29 Apr 2025 17:21:09 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08D1616F3;
 Tue, 29 Apr 2025 08:21:02 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 841FA3F673;
 Tue, 29 Apr 2025 08:21:07 -0700 (PDT)
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
X-Inumbo-ID: 93b05b5b-250d-11f0-9ffb-bf95429c2676
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v4 2/7] arm/mpu: Introduce MPU memory region map structure
Date: Tue, 29 Apr 2025 16:20:52 +0100
Message-Id: <20250429152057.2380536-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250429152057.2380536-1-luca.fancellu@arm.com>
References: <20250429152057.2380536-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Penny Zheng <Penny.Zheng@arm.com>

Introduce pr_t typedef which is a structure having the prbar
and prlar members, each being structured as the registers of
the aarch64 armv8-r architecture.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes in v4:
 - Fixed typos, changed name for reserved bitfields, add emacs bits
   to arm64/mpu.h.
   Now base and limit are 42 bits as we consider FEAT_LPA disabled,
   since we support max 1TB of memory.
   Moved data structure in commit that uses it
---
 xen/arch/arm/include/asm/arm64/mpu.h | 50 ++++++++++++++++++++++++++++
 xen/arch/arm/include/asm/mpu.h       |  4 +++
 2 files changed, 54 insertions(+)
 create mode 100644 xen/arch/arm/include/asm/arm64/mpu.h

diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
new file mode 100644
index 000000000000..b27fccd77550
--- /dev/null
+++ b/xen/arch/arm/include/asm/arm64/mpu.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ARM_ARM64_MPU_H__
+#define __ARM_ARM64_MPU_H__
+
+#ifndef __ASSEMBLY__
+
+/* Protection Region Base Address Register */
+typedef union {
+    struct __packed {
+        unsigned long xn:2;       /* Execute-Never */
+        unsigned long ap:2;       /* Access Permission */
+        unsigned long sh:2;       /* Shareability */
+        unsigned long base:42;    /* Base Address */
+        unsigned long res0:16;    /* RES0 */
+    } reg;
+    uint64_t bits;
+} prbar_t;
+
+/* Protection Region Limit Address Register */
+typedef union {
+    struct __packed {
+        unsigned long en:1;     /* Region enable */
+        unsigned long ai:3;     /* Memory Attribute Index */
+        unsigned long ns:1;     /* Not-Secure */
+        unsigned long res0:1;   /* RES0 */
+        unsigned long limit:42; /* Limit Address */
+        unsigned long res1:16;  /* RES0 */
+    } reg;
+    uint64_t bits;
+} prlar_t;
+
+/* MPU Protection Region */
+typedef struct {
+    prbar_t prbar;
+    prlar_t prlar;
+} pr_t;
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* __ARM_ARM64_MPU_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
index d4ec4248b62b..bb83f5a5f580 100644
--- a/xen/arch/arm/include/asm/mpu.h
+++ b/xen/arch/arm/include/asm/mpu.h
@@ -6,6 +6,10 @@
 #ifndef __ARM_MPU_H__
 #define __ARM_MPU_H__
 
+#if defined(CONFIG_ARM_64)
+# include <asm/arm64/mpu.h>
+#endif
+
 #define MPU_REGION_SHIFT  6
 #define MPU_REGION_ALIGN  (_AC(1, UL) << MPU_REGION_SHIFT)
 #define MPU_REGION_MASK   (~(MPU_REGION_ALIGN - 1))
-- 
2.34.1


