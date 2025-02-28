Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBEAA49E87
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 17:18:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898958.1307436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to34L-0004E1-9U; Fri, 28 Feb 2025 16:18:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898958.1307436; Fri, 28 Feb 2025 16:18:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to34L-0004Bm-4y; Fri, 28 Feb 2025 16:18:33 +0000
Received: by outflank-mailman (input) for mailman id 898958;
 Fri, 28 Feb 2025 16:18:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5/q7=VT=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1to34J-0003Ub-Di
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 16:18:31 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id a60b23e9-f5ef-11ef-9aaf-95dc52dad729;
 Fri, 28 Feb 2025 17:18:30 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23A311515;
 Fri, 28 Feb 2025 08:18:45 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 98E063F5A1;
 Fri, 28 Feb 2025 08:18:28 -0800 (PST)
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
X-Inumbo-ID: a60b23e9-f5ef-11ef-9aaf-95dc52dad729
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
Subject: [PATCH 3/9] arm/mpu: Introduce MPU memory region map structure
Date: Fri, 28 Feb 2025 16:18:11 +0000
Message-Id: <20250228161817.3342443-4-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250228161817.3342443-1-luca.fancellu@arm.com>
References: <20250228161817.3342443-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Penny Zheng <Penny.Zheng@arm.com>

Introduce pr_t typedef which is a structure having the prbar
and prlar members, each being structured as the registers of
the aarch64 armv8-r architecture.

Introduce the array 'xen_mpumap' that will store a view of
the content of the MPU regions.

Introduce MAX_MPU_REGIONS macro that uses the value of
NUM_MPU_REGIONS_MASK just for clarity, because using the
latter as number of elements of the xen_mpumap array might
be misleading.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/Makefile                |  1 +
 xen/arch/arm/include/asm/arm64/mpu.h | 38 ++++++++++++++++++++++++++++
 xen/arch/arm/mpu/Makefile            |  1 +
 xen/arch/arm/mpu/mm.c                | 23 +++++++++++++++++
 4 files changed, 63 insertions(+)
 create mode 100644 xen/arch/arm/mpu/Makefile
 create mode 100644 xen/arch/arm/mpu/mm.c

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 43ab5e8f2550..fb0948f067bd 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -1,6 +1,7 @@
 obj-$(CONFIG_ARM_32) += arm32/
 obj-$(CONFIG_ARM_64) += arm64/
 obj-$(CONFIG_MMU) += mmu/
+obj-$(CONFIG_MPU) += mpu/
 obj-$(CONFIG_ACPI) += acpi/
 obj-$(CONFIG_HAS_PCI) += pci/
 ifneq ($(CONFIG_NO_PLAT),y)
diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
index f8a029f1a135..38dbf5b2255a 100644
--- a/xen/arch/arm/include/asm/arm64/mpu.h
+++ b/xen/arch/arm/include/asm/arm64/mpu.h
@@ -13,6 +13,44 @@
 #define NUM_MPU_REGIONS_SHIFT   8
 #define NUM_MPU_REGIONS         (_AC(1, UL) << NUM_MPU_REGIONS_SHIFT)
 #define NUM_MPU_REGIONS_MASK    (NUM_MPU_REGIONS - 1)
+
+#define MAX_MPU_REGIONS         NUM_MPU_REGIONS_MASK
+
+#ifndef __ASSEMBLY__
+
+/* Protection Region Base Address Register */
+typedef union {
+    struct __packed {
+        unsigned long xn:2;       /* Execute-Never */
+        unsigned long ap:2;       /* Acess Permission */
+        unsigned long sh:2;       /* Sharebility */
+        unsigned long base:46;    /* Base Address */
+        unsigned long pad:12;
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
+        unsigned long res:1;    /* Reserved 0 by hardware */
+        unsigned long limit:46; /* Limit Address */
+        unsigned long pad:12;
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
 #endif /* __ARM64_MPU_H__ */
 
 /*
diff --git a/xen/arch/arm/mpu/Makefile b/xen/arch/arm/mpu/Makefile
new file mode 100644
index 000000000000..b18cec483671
--- /dev/null
+++ b/xen/arch/arm/mpu/Makefile
@@ -0,0 +1 @@
+obj-y += mm.o
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
new file mode 100644
index 000000000000..3ca609ff80cc
--- /dev/null
+++ b/xen/arch/arm/mpu/mm.c
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * xen/arch/arm/mpu/mm.c
+ *
+ * MPU-based memory managment code for Armv8-R AArch64.
+ *
+ * Copyright (C) 2023 Arm Ltd.
+ *
+ */
+
+#include <asm/arm64/mpu.h>
+
+/* EL2 Xen MPU memory region mapping table. */
+pr_t xen_mpumap[MAX_MPU_REGIONS];
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.34.1


