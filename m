Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 819C9A7D92B
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 11:14:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.939427.1339517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1iZ1-00045P-UI; Mon, 07 Apr 2025 09:14:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 939427.1339517; Mon, 07 Apr 2025 09:14:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1iZ1-0003zu-QE; Mon, 07 Apr 2025 09:14:43 +0000
Received: by outflank-mailman (input) for mailman id 939427;
 Mon, 07 Apr 2025 09:14:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U9Ey=WZ=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1u1iZ0-0003xy-5r
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 09:14:42 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id bc8a70e4-1390-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 11:14:41 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9EF1C1424;
 Mon,  7 Apr 2025 02:14:41 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F64C3F59E;
 Mon,  7 Apr 2025 02:14:38 -0700 (PDT)
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
X-Inumbo-ID: bc8a70e4-1390-11f0-9eaa-5ba50f476ded
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
Subject: [PATCH v2 1/7] arm/mpu: Introduce MPU memory region map structure
Date: Mon,  7 Apr 2025 10:14:24 +0100
Message-Id: <20250407091430.2342709-2-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407091430.2342709-1-luca.fancellu@arm.com>
References: <20250407091430.2342709-1-luca.fancellu@arm.com>
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
 xen/arch/arm/include/asm/arm64/mpu.h | 44 ++++++++++++++++++++++++++++
 xen/arch/arm/include/asm/mpu.h       |  5 ++++
 xen/arch/arm/mpu/mm.c                |  4 +++
 3 files changed, 53 insertions(+)
 create mode 100644 xen/arch/arm/include/asm/arm64/mpu.h

diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
new file mode 100644
index 000000000000..4d2bd7d7877f
--- /dev/null
+++ b/xen/arch/arm/include/asm/arm64/mpu.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * mpu.h: Arm Memory Protection Unit definitions for aarch64.
+ */
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
+#endif /* __ARM_ARM64_MPU_H__ */
\ No newline at end of file
diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
index d4ec4248b62b..e148c705b82c 100644
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
@@ -13,6 +17,7 @@
 #define NUM_MPU_REGIONS_SHIFT   8
 #define NUM_MPU_REGIONS         (_AC(1, UL) << NUM_MPU_REGIONS_SHIFT)
 #define NUM_MPU_REGIONS_MASK    (NUM_MPU_REGIONS - 1)
+#define MAX_MPU_REGIONS         NUM_MPU_REGIONS_MASK
 
 #endif /* __ARM_MPU_H__ */
 
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index 07c8959f4ee9..f83ce04fef8a 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -7,9 +7,13 @@
 #include <xen/mm.h>
 #include <xen/sizes.h>
 #include <xen/types.h>
+#include <asm/mpu.h>
 
 struct page_info *frame_table;
 
+/* EL2 Xen MPU memory region mapping table. */
+pr_t xen_mpumap[MAX_MPU_REGIONS];
+
 static void __init __maybe_unused build_assertions(void)
 {
     /*
-- 
2.34.1


