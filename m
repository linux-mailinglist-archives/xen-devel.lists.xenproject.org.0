Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 938D4AC1D54
	for <lists+xen-devel@lfdr.de>; Fri, 23 May 2025 08:54:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.995193.1377721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIMIP-0002SE-4r; Fri, 23 May 2025 06:54:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 995193.1377721; Fri, 23 May 2025 06:54:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIMIP-0002Qc-1K; Fri, 23 May 2025 06:54:21 +0000
Received: by outflank-mailman (input) for mailman id 995193;
 Fri, 23 May 2025 06:54:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ff/g=YH=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1uIMIO-0002FX-4s
 for xen-devel@lists.xenproject.org; Fri, 23 May 2025 06:54:20 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id bf88b215-37a2-11f0-a2fb-13f23c93f187;
 Fri, 23 May 2025 08:54:18 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D024E1A2D;
 Thu, 22 May 2025 23:54:03 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BFBC03F673;
 Thu, 22 May 2025 23:54:16 -0700 (PDT)
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
X-Inumbo-ID: bf88b215-37a2-11f0-a2fb-13f23c93f187
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v6 2/6] arm/mpu: Introduce MPU memory region map structure
Date: Fri, 23 May 2025 07:54:02 +0100
Message-Id: <20250523065406.3795420-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250523065406.3795420-1-luca.fancellu@arm.com>
References: <20250523065406.3795420-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Penny Zheng <Penny.Zheng@arm.com>

Introduce pr_t typedef which is a structure having the prbar
and prlar members, each being structured as the registers of
the AArch64 Armv8-R architecture.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Acked-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v6:
 - Add Julien's Ack-by
 - modified header guard by new code style
 - Add R-by Michal
Changes in v5:
 - Given some comments on the page.h flags, I had to rework some
   fields here to better match the flags usage and avoid duplication
Changes in v4:
 - Fixed typos, changed name for reserved bitfields, add emacs bits
   to arm64/mpu.h.
   Now base and limit are 42 bits as we consider FEAT_LPA disabled,
   since we support max 1TB of memory.
   Moved data structure in commit that uses it
---
 xen/arch/arm/include/asm/arm64/mpu.h | 52 ++++++++++++++++++++++++++++
 xen/arch/arm/include/asm/mpu.h       |  4 +++
 2 files changed, 56 insertions(+)
 create mode 100644 xen/arch/arm/include/asm/arm64/mpu.h

diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
new file mode 100644
index 000000000000..4737868507d9
--- /dev/null
+++ b/xen/arch/arm/include/asm/arm64/mpu.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef ARM_ARM64_MPU_H
+#define ARM_ARM64_MPU_H
+
+#ifndef __ASSEMBLY__
+
+/* Protection Region Base Address Register */
+typedef union {
+    struct __packed {
+        unsigned long xn_0:1;     /* Execute-Never XN[0] */
+        unsigned long xn:1;       /* Execute-Never XN[1] */
+        unsigned long ap_0:1;     /* Access Permission AP[0] */
+        unsigned long ro:1;       /* Access Permission AP[1] */
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
+#endif /* ARM_ARM64_MPU_H */
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


