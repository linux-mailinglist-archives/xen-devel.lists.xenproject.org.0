Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDB473D67B
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 05:40:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555053.866726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5J-0004lU-Nz; Mon, 26 Jun 2023 03:40:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555053.866726; Mon, 26 Jun 2023 03:40:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5I-0004R4-S9; Mon, 26 Jun 2023 03:40:12 +0000
Received: by outflank-mailman (input) for mailman id 555053;
 Mon, 26 Jun 2023 03:40:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd1Z-0007ej-T6
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:36:21 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 9dd5d6f8-13d2-11ee-b237-6b7b168915f2;
 Mon, 26 Jun 2023 05:36:20 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E8EB1FB;
 Sun, 25 Jun 2023 20:37:04 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 218053F64C;
 Sun, 25 Jun 2023 20:36:17 -0700 (PDT)
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
X-Inumbo-ID: 9dd5d6f8-13d2-11ee-b237-6b7b168915f2
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v3 23/52] xen/arm: create mpu/layout.h for MPU related address definitions
Date: Mon, 26 Jun 2023 11:34:14 +0800
Message-Id: <20230626033443.2943270-24-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Chen <wei.chen@arm.com>

As we have done for MMU systems, we instroduce mpu/layout.h for
MPU systems to store their address layout definitions.

To avoid spreading #ifdef everywhere, we keep the same definition
names for MPU systems, like XEN_VIRT_START and HYPERVISOR_VIRT_START,
but the definition contents are MPU specific.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v3:
- new commit
---
 xen/arch/arm/include/asm/config.h     |  2 ++
 xen/arch/arm/include/asm/mpu/layout.h | 32 +++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 xen/arch/arm/include/asm/mpu/layout.h

diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
index 204b3dec13..bd71cc1373 100644
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -73,6 +73,8 @@
 
 #ifndef CONFIG_HAS_MPU
 #include <asm/mmu/layout.h>
+#else
+#include <asm/mpu/layout.h>
 #endif
 
 #define NR_hypercalls 64
diff --git a/xen/arch/arm/include/asm/mpu/layout.h b/xen/arch/arm/include/asm/mpu/layout.h
new file mode 100644
index 0000000000..84c55cb2bd
--- /dev/null
+++ b/xen/arch/arm/include/asm/mpu/layout.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __ARM_MPU_LAYOUT_H__
+#define __ARM_MPU_LAYOUT_H__
+
+#define FRAMETABLE_SIZE        GB(32)
+#define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
+
+#define XEN_START_ADDRESS CONFIG_XEN_START_ADDRESS
+
+/*
+ * All MPU platforms need to provide a XEN_START_ADDRESS for linker. This
+ * address indicates where Xen image will be loaded and run from. This
+ * address must be aligned to a PAGE_SIZE.
+ */
+#if (XEN_START_ADDRESS % PAGE_SIZE) != 0
+#error "XEN_START_ADDRESS must be aligned to PAGE_SIZE"
+#endif
+
+#define XEN_VIRT_START         _AT(paddr_t, XEN_START_ADDRESS)
+
+#define HYPERVISOR_VIRT_START  XEN_VIRT_START
+
+#endif /* __ARM_MPU_LAYOUT_H__ */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.25.1


