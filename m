Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4878A668B6F
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 06:35:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476539.738831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCif-0004ml-3x; Fri, 13 Jan 2023 05:35:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476539.738831; Fri, 13 Jan 2023 05:35:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCie-0004hh-VH; Fri, 13 Jan 2023 05:35:12 +0000
Received: by outflank-mailman (input) for mailman id 476539;
 Fri, 13 Jan 2023 05:35:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f25I=5K=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pGCe7-0005sP-2P
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 05:30:31 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 62be1f31-9303-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 06:30:27 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCB2013D5;
 Thu, 12 Jan 2023 21:31:08 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0A5563F587;
 Thu, 12 Jan 2023 21:30:23 -0800 (PST)
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
X-Inumbo-ID: 62be1f31-9303-11ed-b8d0-410ff93cb8f0
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v2 16/40] xen/arm: introduce setup_mm_mappings
Date: Fri, 13 Jan 2023 13:28:49 +0800
Message-Id: <20230113052914.3845596-17-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113052914.3845596-1-Penny.Zheng@arm.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function setup_pagetables is responsible for boot-time pagetable setup
in MMU system.
But in MPU system, we have already built up start-of-day Xen MPU memory region
mapping at the very beginning in assembly.

So in order to keep only one codeflow in arm/setup.c, setup_mm_mappings
, with a more generic name, is introduced and act as an empty stub in
MPU system.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/include/asm/mm.h     |  2 ++
 xen/arch/arm/include/asm/mm_mpu.h | 16 ++++++++++++++++
 xen/arch/arm/setup.c              |  2 +-
 3 files changed, 19 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/include/asm/mm_mpu.h

diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 1b9fdb6ff5..9b4c07d965 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -243,6 +243,8 @@ static inline void __iomem *ioremap_wc(paddr_t start, size_t len)
 
 #ifndef CONFIG_HAS_MPU
 #include <asm/mm_mmu.h>
+#else
+#include <asm/mm_mpu.h>
 #endif
 
 /* Page-align address and convert to frame number format */
diff --git a/xen/arch/arm/include/asm/mm_mpu.h b/xen/arch/arm/include/asm/mm_mpu.h
new file mode 100644
index 0000000000..1f3cff7743
--- /dev/null
+++ b/xen/arch/arm/include/asm/mm_mpu.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef __ARCH_ARM_MM_MPU__
+#define __ARCH_ARM_MM_MPU__
+
+#define setup_mm_mappings(boot_phys_offset) ((void)(boot_phys_offset))
+
+#endif /* __ARCH_ARM_MM_MPU__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 1f26f67b90..d7d200179c 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -1003,7 +1003,7 @@ void __init start_xen(unsigned long boot_phys_offset,
     /* Initialize traps early allow us to get backtrace when an error occurred */
     init_traps();
 
-    setup_pagetables(boot_phys_offset);
+    setup_mm_mappings(boot_phys_offset);
 
     smp_clear_cpu_maps();
 
-- 
2.25.1


