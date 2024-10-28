Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4969B30C5
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 13:46:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826446.1240718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5P8j-0005Xr-6D; Mon, 28 Oct 2024 12:46:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826446.1240718; Mon, 28 Oct 2024 12:46:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5P8j-0005WA-0O; Mon, 28 Oct 2024 12:46:33 +0000
Received: by outflank-mailman (input) for mailman id 826446;
 Mon, 28 Oct 2024 12:46:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TXyF=RY=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1t5P8g-0004Qp-Q9
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 12:46:30 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2413::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6a1a87a-952a-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 13:46:29 +0100 (CET)
Received: from DM6PR01CA0029.prod.exchangelabs.com (2603:10b6:5:296::34) by
 CY5PR12MB6300.namprd12.prod.outlook.com (2603:10b6:930:f::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.24; Mon, 28 Oct 2024 12:46:24 +0000
Received: from CY4PEPF0000E9CF.namprd03.prod.outlook.com
 (2603:10b6:5:296:cafe::56) by DM6PR01CA0029.outlook.office365.com
 (2603:10b6:5:296::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21 via Frontend
 Transport; Mon, 28 Oct 2024 12:46:24 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9CF.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Mon, 28 Oct 2024 12:46:24 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Oct
 2024 07:46:23 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Oct
 2024 07:46:22 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Mon, 28 Oct 2024 07:46:21 -0500
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
X-Inumbo-ID: a6a1a87a-952a-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RBycu7yJe0h0S/DW+SO4EmLdwW3ooTKDFBuDuMBTRbWD7Xj5iKZyGYBWozcnI0feFghbCcI1RaAzCk0x23lEr1KWwYY7PazIBmFsFrDgqI2pgWLwJshcsEZLfFwLP9H/bH48OfOk6Nat9GsVsXAQt7ayYZUib3XtoC1YU3kpp8TmEOnpH68s8WFS60XozpEUxyTCl0rT4ZUvWcvLVis/P50Dw08rAElFIe9qI6Pp/fK0Lw1BLbfM/ytt8BBuSxPQo2Y06y1YpsarfIGaELrDIQfg1WrxS/lHHYSb3gtK842gUnuxaw2RbqIcJyDseGdFciN9rrky7xTkQykc90dOmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lNYvm8YWxvjs04dfYHZIpT38yoOVT4AS9ee8RDi6eKk=;
 b=rth3iX0bGY2FRebgm8Wm6uEbuN7R8oemB/YsABGg465pTv8ilUiDqqQulEhwJOCMKa3B33ejOHw/rwYQKxVi53L7mi/p2E/Rt4v17dIV8VxJo12YXssv8gTDDLzH4aHhNVv+/X72we9AxkVlKN9Zi3J9iU70PxrJJfkUipD+lK9+9FLEiEBrCzwZLEcuMx199I83ZfQ/Yx3zX84Hw2hwCY1zo+jRmTS+OlaNempiIMtHg25k6hjywBIVyGXTFK6GLrYa0/5pVvnsi0RNFUZPsFX83RzX0Y7kCQwQp10PnTvpuJ0oXlR4Ws7HHBFdEODjY8RE9oAInwqq2G8YmXvPnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lNYvm8YWxvjs04dfYHZIpT38yoOVT4AS9ee8RDi6eKk=;
 b=Wa+cLSZ4shfylDcJ2xd+hR/QfB5CXC3dRVtEmWeQQy3egpsrQE0QtNPKFJfg+EgsTQIr0LEx9iuPWbyB5IqfOH87JGaBf3UI76Ca/yxODL3PzTmjZO+smQtkV121rsUx7mc6fz+wr2SB0Z1a8/P/2EKZMbOKFphaNvgBRj38WI4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "Jiamei . Xie" <jiamei.xie@arm.com>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>
Subject: [PATCH v4 3/6] xen/arm: mpu: Define Xen start address for MPU systems
Date: Mon, 28 Oct 2024 12:45:44 +0000
Message-ID: <20241028124547.1371867-4-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241028124547.1371867-1-ayan.kumar.halder@amd.com>
References: <20241028124547.1371867-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CF:EE_|CY5PR12MB6300:EE_
X-MS-Office365-Filtering-Correlation-Id: 71c798de-dfc8-4f03-d253-08dcf74e880f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TF14+F83SaNxu4Udbngw5wZLlwGfMVwL5/bI3PYN2TMlK/EUcoijiIUHPZ8o?=
 =?us-ascii?Q?RL7FFA2kSwYL6A871yI1SvoG1kQuosRnowYzBtH77KtB3iMkUFIHOs9GaUS0?=
 =?us-ascii?Q?PvpwoOnzt/ICVEkmSMHK14hDdX+aeRmukaG7wTz0hDBnnTv0KcUdDxhiAwGA?=
 =?us-ascii?Q?/nF42f0KyQNrX3msJZR8ZiWnROI1u6EKQ2vtyU+u2sncFOUGSP53DIAd+QKy?=
 =?us-ascii?Q?QFi2V1xygDWtsk9fWrbDTAMP8mufDS3s2Q2cAlvt1oVVdWAa7uibIydFcvel?=
 =?us-ascii?Q?ANgpuUr2VxBQvraAkSa0517AbNWdzS3lSazjYa/mj7jtbxhdDSSICYU8aj5j?=
 =?us-ascii?Q?dTNCBDFy/1iykJujvtU/wV1KEfA+EFf26SkzAMay4dMkdJnNjEjkK0o4nVF+?=
 =?us-ascii?Q?/IIydazdYtfDFb1PkCI/AIUXoKWfDDe2LKcNeo+z7sgl2XIjZYWYSEho5jTq?=
 =?us-ascii?Q?682xTG33YutWtFRON6aFE2pYMfV9VF6VuRC83BF0R1uySANwfzUWaZ3pdyWw?=
 =?us-ascii?Q?xuCBmXqdMgCm2Y9hEY8l1u3d8VRrclTNQjImLX4oFj5CQPZsCoyCJ/dTFYZ9?=
 =?us-ascii?Q?6sJbV965KlvrqCC1acFngI8QIgZML7UIQZ1+iE91ID8Zk4+JMGAApt9ME0eE?=
 =?us-ascii?Q?/zVohYfXEYlMT/qXLA1Qzv/e5tPactNwZHLQW0Yuh7pg1JB4NsYFN5YeP/4S?=
 =?us-ascii?Q?T+OVs9vk5IYj4SkWXmJ4KB0TL0KhtXrZkpb5UmQlfhq7UvxvtArLAWI3FcBk?=
 =?us-ascii?Q?ErYHDzL+P8ogsTdDiOK9Zwp1UynEKGQDbSfV/gc7TzWDGaLasGrP1gtxvdCC?=
 =?us-ascii?Q?uI0POfNhO/efowKx0dwnYEmCPnCq1tITx6ojdf/1szzIDlpLa3Y2RR6PNvfu?=
 =?us-ascii?Q?n3Y05ssIn8Pdd8x1xLyFukS+mPpBti6jNPU5UVyzqS3XxIGtx+giXoZYD2/p?=
 =?us-ascii?Q?h+F3yRCAM+CKWkLAY6E+HBOVZyTl0TafQuZw1dxdhS5lTlOjvhiLJwIK6T/c?=
 =?us-ascii?Q?WTANtx+B8eXFJBvsud9B14rLaq9tiISDL7GxgqFYYSmOqksKMXjXwI3a12WQ?=
 =?us-ascii?Q?N5KKMEuT9ZSzNdBGghhbWeY1dex9z3HUvi6JPZw5d36dKUs7PMzl6kqx8iIA?=
 =?us-ascii?Q?cC+D897bSlpzp3Xs+B/9kEJdPfgB4Fn4cTvy0z91fKFEBlFEITG9AykdXlNo?=
 =?us-ascii?Q?L9s8DF7lGqYHgbmRP2i+Qas2UzH17OIfkZDm0i4ppPkp0n4E+5kKLtrOjaw9?=
 =?us-ascii?Q?18D/EEIVwM+oGUVXaRYl7Z2guoxs2JEobmK5QUdQ0eiTQCtg+bvGuVaY+6ZL?=
 =?us-ascii?Q?kOe5Nu0ktFCmAtWDmcMwRjitBy2fl9vAU0SVUTvkhbtbZwhlpmeHcDq0pl0d?=
 =?us-ascii?Q?7TAxuerbVxAQ95Hrz9h9CfxQnOWglNdomdbOZd44OvHOaOb2Gg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 12:46:24.0297
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71c798de-dfc8-4f03-d253-08dcf74e880f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9CF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6300

From: Wei Chen <wei.chen@arm.com>

On Armv8-A, Xen has a fixed virtual start address (link address too) for all
Armv8-A platforms. In an MMU based system, Xen can map its loaded address to
this virtual start address. So, on Armv8-A platforms, the Xen start address does
not need to be configurable. But on Armv8-R platforms, there is no MMU to map
loaded address to a fixed virtual address and different platforms will have very
different address space layout. So Xen cannot use a fixed physical address on
MPU based system and need to have it configurable.

So, we introduce a Kconfig option for users to set the start address. The start
address needs to be aligned to 4KB. We have a check for this alignment.

MPU allows us to define regions which are 64 bits aligned. This restriction
comes from the bitfields of PRBAR, PRLAR (the lower 6 bits are 0 extended to
provide the base and limit address of a region). This means that the start
address of Xen needs to be at least 64 bits aligned (as it will correspond to
the start address of memory protection region).

As for now Xen on MPU tries to use the same memory alignment restrictions as it
has been for MMU. We have added a build assertion to ensure that the page size
is 4KB. Unlike MMU where the starting virtual address is 2MB, Xen on MPU needs
the start address to be 4KB (ie page size) aligned.

In case if the user forgets to set the start address, then 0xffffffff is used
as default. This is to trigger the error (on alignment check) and thereby prompt
user to set the start address.

Also updated config.h so that it includes mpu/layout.h when CONFIG_MPU is
defined.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Jiamei.Xie <jiamei.xie@arm.com>
Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from :-

v1 - 1. Fix some of the coding style issues.
2. Reword the help message.
3. Updat the commit message.

v2 - Add clarification for the use of page and page size.

v3 - 1. Add a new file arm64/mpu/mm.c to contain the build assertion for page
size.
2. Enclosed the check for the start address within "#ifdef CONFIG_MPU".

 xen/arch/arm/Kconfig                  | 10 ++++++++
 xen/arch/arm/arm64/Makefile           |  1 +
 xen/arch/arm/arm64/mpu/Makefile       |  1 +
 xen/arch/arm/arm64/mpu/mm.c           | 15 ++++++++++++
 xen/arch/arm/include/asm/config.h     |  4 +++-
 xen/arch/arm/include/asm/mpu/layout.h | 33 +++++++++++++++++++++++++++
 xen/arch/arm/xen.lds.S                |  7 ++++++
 7 files changed, 70 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/arm64/mpu/Makefile
 create mode 100644 xen/arch/arm/arm64/mpu/mm.c
 create mode 100644 xen/arch/arm/include/asm/mpu/layout.h

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index ed92eb67cb..15b2e4a227 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -23,6 +23,16 @@ config ARCH_DEFCONFIG
 	default "arch/arm/configs/arm32_defconfig" if ARM_32
 	default "arch/arm/configs/arm64_defconfig" if ARM_64
 
+config XEN_START_ADDRESS
+	hex "Xen start address: keep default to use platform defined address"
+	default 0xFFFFFFFF
+	depends on MPU
+	help
+	  Used to set customized address at which which Xen will be linked on MPU
+	  systems. Must be aligned to 4KB.
+	  0xFFFFFFFF is used as default value to indicate that user has not
+	  customized this address.
+
 menu "Architecture Features"
 
 choice
diff --git a/xen/arch/arm/arm64/Makefile b/xen/arch/arm/arm64/Makefile
index 72161ff22e..6491c5350b 100644
--- a/xen/arch/arm/arm64/Makefile
+++ b/xen/arch/arm/arm64/Makefile
@@ -1,5 +1,6 @@
 obj-y += lib/
 obj-$(CONFIG_MMU) += mmu/
+obj-$(CONFIG_MPU) += mpu/
 
 obj-y += cache.o
 obj-y += cpufeature.o
diff --git a/xen/arch/arm/arm64/mpu/Makefile b/xen/arch/arm/arm64/mpu/Makefile
new file mode 100644
index 0000000000..b18cec4836
--- /dev/null
+++ b/xen/arch/arm/arm64/mpu/Makefile
@@ -0,0 +1 @@
+obj-y += mm.o
diff --git a/xen/arch/arm/arm64/mpu/mm.c b/xen/arch/arm/arm64/mpu/mm.c
new file mode 100644
index 0000000000..0b8748e575
--- /dev/null
+++ b/xen/arch/arm/arm64/mpu/mm.c
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/lib.h>
+#include <xen/init.h>
+#include <xen/sizes.h>
+
+static void __init __maybe_unused build_assertions(void)
+{
+    /*
+     * Unlike MMU, MPU does not use pages for translation. However, we continue
+     * to use PAGE_SIZE to denote 4KB. This is so that the existing memory
+     * management based on pages, continue to work for now.
+     */
+    BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
+}
diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
index a2e22b659d..0a51142efd 100644
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -69,8 +69,10 @@
 #include <xen/const.h>
 #include <xen/page-size.h>
 
-#ifdef CONFIG_MMU
+#if defined(CONFIG_MMU)
 #include <asm/mmu/layout.h>
+#elif defined(CONFIG_MPU)
+#include <asm/mpu/layout.h>
 #else
 # error "Unknown memory management layout"
 #endif
diff --git a/xen/arch/arm/include/asm/mpu/layout.h b/xen/arch/arm/include/asm/mpu/layout.h
new file mode 100644
index 0000000000..d6d397f4c2
--- /dev/null
+++ b/xen/arch/arm/include/asm/mpu/layout.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ARM_MPU_LAYOUT_H__
+#define __ARM_MPU_LAYOUT_H__
+
+#define XEN_START_ADDRESS CONFIG_XEN_START_ADDRESS
+
+/*
+ * All MPU platforms need to provide a XEN_START_ADDRESS for linker. This
+ * address indicates where Xen image will be loaded and run from. This
+ * address must be aligned to a PAGE_SIZE.
+ */
+#if (XEN_START_ADDRESS % PAGE_SIZE) != 0
+#error "XEN_START_ADDRESS must be aligned to 4KB"
+#endif
+
+/*
+ * For MPU, XEN's virtual start address is same as the physical address.
+ * The reason being MPU treats VA == PA. IOW, it cannot map the physical
+ * address to a different fixed virtual address. So, the virtual start
+ * address is determined by the physical address at which Xen is loaded.
+ */
+#define XEN_VIRT_START         _AT(paddr_t, XEN_START_ADDRESS)
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
diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 5b9abc9a2d..d1e579e8a8 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -213,6 +213,13 @@ SECTIONS
  * match the context.
  */
 ASSERT(_start == XEN_VIRT_START, "_start != XEN_VIRT_START")
+#ifdef CONFIG_MPU
+/*
+ * On MPU based platforms, the starting address is to be provided by user.
+ * One need to check that it is 4KB aligned.
+ */
+ASSERT(IS_ALIGNED(_start,       4096), "starting address should be aligned to 4KB")
+#endif
 
 /*
  * We require that Xen is loaded at a page boundary, so this ensures that any
-- 
2.25.1


