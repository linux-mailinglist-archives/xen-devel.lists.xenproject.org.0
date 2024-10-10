Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6EA9988C1
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 16:05:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816167.1230377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sytn6-0006eE-Si; Thu, 10 Oct 2024 14:05:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816167.1230377; Thu, 10 Oct 2024 14:05:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sytn6-0006bc-P4; Thu, 10 Oct 2024 14:05:20 +0000
Received: by outflank-mailman (input) for mailman id 816167;
 Thu, 10 Oct 2024 14:05:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rwpE=RG=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sytn4-0006aO-M2
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 14:05:18 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2413::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id acd79f05-8710-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 16:05:17 +0200 (CEST)
Received: from CH2PR07CA0056.namprd07.prod.outlook.com (2603:10b6:610:5b::30)
 by DS0PR12MB9322.namprd12.prod.outlook.com (2603:10b6:8:1bd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 14:05:09 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:5b:cafe::e6) by CH2PR07CA0056.outlook.office365.com
 (2603:10b6:610:5b::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18 via Frontend
 Transport; Thu, 10 Oct 2024 14:05:09 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Thu, 10 Oct 2024 14:05:09 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Oct
 2024 09:05:09 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Oct
 2024 09:05:08 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Thu, 10 Oct 2024 09:05:07 -0500
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
X-Inumbo-ID: acd79f05-8710-11ef-a0bd-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KP0ZAyPjK30CsYcfKQ8MWQM0BWEXVqCTonJ/wmiqrQzgZYOsTks4OYqOTkjNmce6I5Lxi9qIZnJFwV6B90kdB5xKl+zwg7lqnk8NysTz7zAcHX5ZrAp1NM7lnYJpiHo65OdSfFNqFv1YT/yH9j9y9UNTo3qfu+MSUYvSm6Q15QLIwTdDwofKSdgkqWiJv0LtNEBfxUEoHjZEkanNLBb2/XUbWkJAQd7w+2dk8GWZBY84Z8lJJJGfs1tAJMETuaDTyWbAQZkU836zPZfLZiACJfqLc2ssl76slRrVp/8D4GB64UWPHJSAgTVzfdspWxO7/Pvjvpa5wjr6uRw0BltWEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BiyPkJoRNCr7QGFAWNRQgLMHKqeHTUsw6izjDfpPULs=;
 b=X9I8sbun8udAzH9Ax4Pfgr7UVi1umUjAwYFL4tE7TO64Be0iHrMR0Q/4f8IY5rdzSZXY7SRAPn18Gp1YKdJzQ6Rr35x+yABTiZkhOHUGfsoUPdS5JbygN2OGPmofxWxfgIEC7E5DGZ6h2UX9F6s24MjBZFL8o2xYxjTYBti/I44OgF6Xb4Sfp/xxp35o1cOROINexx9rWd5ilnh6hDmgZRt+Qf7NkLSDS7n24Ryv7fDygAgUi6LaYy5r1UJJ3cGAzsD+lx7YLylcsJ7EcraedOnjIwkS2L0HlCL4PTfTERneczfD+Nm/9Jyu7ZIEpjFMO7uQ2idZVraxUXpnAuPvWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BiyPkJoRNCr7QGFAWNRQgLMHKqeHTUsw6izjDfpPULs=;
 b=etPpxudhPU/U8Xs+5jJ2dFT/g03htjOtB4zWSBf9gqF32VGnyWWvzem7KTEN1jMNx0ZrqDBMgfOAMSdyIYiwX41HuVqHclCDZv4IWTVSqjy892pfd9/wuNQ1/9AJAi6zxymp4Geyf5BKdhGhFmj2uQeJC7o+vvJqza1MIw4Vfwc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "Jiamei . Xie" <jiamei.xie@arm.com>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>
Subject: [PATCH v3 3/6] xen/arm: mpu: Define Xen start address for MPU systems
Date: Thu, 10 Oct 2024 15:03:48 +0100
Message-ID: <20241010140351.309922-4-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|DS0PR12MB9322:EE_
X-MS-Office365-Filtering-Correlation-Id: 3da93431-0be4-45c9-48b8-08dce9348d58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+cHP+ZeU31cyEeSKd+IpiDx5e5P8r1ReZ5DfDWANa/Gu1Tp/wCtgkkytu+31?=
 =?us-ascii?Q?56281hvJT3/s2LFRVl5RGbl8+wxVEy2LpkezGVNYSroiC9Nad+MPyukbvTcl?=
 =?us-ascii?Q?kHhn1Ry3B4XnesdUrzFntGiC3aIX3HM0QnOjcx+wIgBsc3FvMqsWhy0mwpYQ?=
 =?us-ascii?Q?ljOv/fMlNYvxKusg17+Z8HPnD7rDSR3zDY3KdMLED7AR4AEPsd080K5vkeUM?=
 =?us-ascii?Q?AOOCjQX3RGVD0nDXmEH12QuzG3DA7YpaSewxDVzxrSTSpgs/l5G1AJAVpClU?=
 =?us-ascii?Q?RbuVNLnNg2MIAopJ46eNthb+HIgPyju7sDanD8uKiUDyYH7pWzdGpLSl6LwU?=
 =?us-ascii?Q?s410qqdViWJvGAXP9O0TjvdOcaxTBknDeHyMtHBsqkHEJCgXy06PgzBtNcJp?=
 =?us-ascii?Q?WETbsj+F7p2bIQW44J2bISbyjOhdSAKMP0/JiBRE2FicGd45uTt415kWTRxm?=
 =?us-ascii?Q?LoOrRZ/ot4LRaQKctp9fO0gYSOQK2thf79y30AJwYre7DDTPmMlzq4yXnYbx?=
 =?us-ascii?Q?l0ztONYyPj+nHOFeb7KrGRmQzhLq7k5aF3QTyjgHMGJ5jHNuvOiwRU+WKTSX?=
 =?us-ascii?Q?osVTtJP7qw3rvEQOCwfKgftWN8y1jOpLMgUPUuepPRXA2JLuj6Q/0hZpE2xo?=
 =?us-ascii?Q?pcBOirwEaVnoJMPwmPrHsNnCcusJgYhW5Ehzp3GsJ5PGoG5r0uE7KrOB5680?=
 =?us-ascii?Q?toUF0BE+LGiArMFiMUd+coefOnQ5z83RQR5+HRxN68Jv/jWwx1QR46ckUQ6T?=
 =?us-ascii?Q?0RQ0KybkpUrPJ7R3moxx+3fhdb4W9gHGJDTGpA/iX7bDXeWYTFPpaxx2m73B?=
 =?us-ascii?Q?2ZdqmISjbiMwAFT3dNzWUsB5jT9KDKmgSRHwM8zpZ2/Ks6SMGDOXT3I1GAMi?=
 =?us-ascii?Q?XCFxR9Deym23Q7mNAwKjrcOiWOtNTtAOZQ2RAVB8S5KE/e3AaRa03VZRqHjm?=
 =?us-ascii?Q?Y1Whmm6QDt2uYy0XGTwfDW6lAapk9MXyjr2gesP8jHpuTkttpMGOCs/Zppmh?=
 =?us-ascii?Q?SK09O80CpW4hpfD1OBsKfN44QIQSIJL7CqVjObgkyXwnnqJHmLn5mx1WcwrZ?=
 =?us-ascii?Q?JkiiaDlTC1IFCtijkCH0qVLyilRHVTjCWGfjAbuF7yI7fNh9S4EFKqMYd63K?=
 =?us-ascii?Q?pKhuwifIvLzawkVcgm2yPmUhpSNXYLD9Neh7DQYXKzZfypZVH9Khc0wJ281O?=
 =?us-ascii?Q?MBonc64hLK/F6uU840UVIxh7zOmz5Cw0tj5PRsfrEs37cjBSVFcIw/msbs58?=
 =?us-ascii?Q?iwPPbBNZVrGYWfRYgWSiDtpnkrr6M+LBxxDEdcEd3XJNvGGXVW2co7G/bEwh?=
 =?us-ascii?Q?o8gfpL37PVJQlF0zEX9JgjQ9+7eQ/p+8bdjGZX3DwTNiyfQVnQd9PlOMG4oX?=
 =?us-ascii?Q?Y6jMEjsoHliBnVOQE+HCDgHBrTjt?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 14:05:09.7774
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3da93431-0be4-45c9-48b8-08dce9348d58
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9322

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
has been for MMU. Unlike MMU where the starting virtual address is 2MB, Xen on
MPU needs the start address to be 4KB (ie page size) aligned.

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

v1 - 1. Fixed some of the coding style issues.
2. Reworded the help message.
3. Updated the commit message.

v2 - Added clarification for the use of page and page size.

 xen/arch/arm/Kconfig                  | 10 ++++++++
 xen/arch/arm/include/asm/config.h     |  4 +++-
 xen/arch/arm/include/asm/mpu/layout.h | 33 +++++++++++++++++++++++++++
 xen/arch/arm/setup.c                  |  8 +++++++
 xen/arch/arm/xen.lds.S                |  6 +++++
 5 files changed, 60 insertions(+), 1 deletion(-)
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
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 71ebaa77ca..0203771164 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -295,6 +295,14 @@ void asmlinkage __init start_xen(unsigned long fdt_paddr)
     struct domain *d;
     int rc, i;
 
+#ifdef CONFIG_MPU
+    /*
+     * Unlike MMU, MPU does not use pages for translation. However, we continue
+     * to use PAGE_SIZE to denote 4KB. This is so that the existing memory
+     * management based on pages, continue to work for now.
+     */
+    BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
+#endif
     dcache_line_bytes = read_dcache_line_bytes();
 
     percpu_init_areas();
diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index bd884664ad..fe4b468cca 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -231,6 +231,12 @@ SECTIONS
  */
 ASSERT(_start == XEN_VIRT_START, "_start != XEN_VIRT_START")
 
+/*
+ * On MPU based platforms, the starting address is to be provided by user.
+ * One need to check that it is 4KB aligned.
+ */
+ASSERT(IS_ALIGNED(_start,       4096), "starting address is misaligned")
+
 /*
  * We require that Xen is loaded at a page boundary, so this ensures that any
  * code running on the identity map cannot cross a section boundary.
-- 
2.25.1


