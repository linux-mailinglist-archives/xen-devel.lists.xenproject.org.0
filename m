Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D739E4152
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2024 18:23:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848683.1263525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIt5Z-0005Vi-6a; Wed, 04 Dec 2024 17:23:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848683.1263525; Wed, 04 Dec 2024 17:23:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIt5Z-0005U0-2x; Wed, 04 Dec 2024 17:23:01 +0000
Received: by outflank-mailman (input) for mailman id 848683;
 Wed, 04 Dec 2024 17:23:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Nih=S5=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tIt5Y-0005EK-1y
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2024 17:23:00 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20610.outbound.protection.outlook.com
 [2a01:111:f403:2414::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6875bdc4-b264-11ef-a0d4-8be0dac302b0;
 Wed, 04 Dec 2024 18:22:59 +0100 (CET)
Received: from BN9PR03CA0109.namprd03.prod.outlook.com (2603:10b6:408:fd::24)
 by MW6PR12MB8833.namprd12.prod.outlook.com (2603:10b6:303:23f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Wed, 4 Dec
 2024 17:22:54 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:408:fd:cafe::42) by BN9PR03CA0109.outlook.office365.com
 (2603:10b6:408:fd::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.13 via Frontend Transport; Wed,
 4 Dec 2024 17:22:53 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Wed, 4 Dec 2024 17:22:53 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Dec
 2024 11:22:52 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Wed, 4 Dec 2024 11:22:51 -0600
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
X-Inumbo-ID: 6875bdc4-b264-11ef-a0d4-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y90Y2MjkTusisFnjrDjGAwibOdxRwUHDXq44/e8mGqJDsKLGPDm6MeKhl7oqlYbdXT5SBOtB9dXxieaHC2B/+3uv1g4YBUymbQr1c82OgcUKIv/9BDAkxEyG0iVCQW0CVuiWob5dXl2rF+bxUIKVVit9d91zS0w7hwcT6HobAZgKfjn81GJqOXgCPxXomEB3tUbV+/9KWTIeCQXT/j3c721fW797B9tbsF8+RRaU5h8SyyQg600Mk44mzQJNCXB9aJy5cq1VaaVbdtS/GxuntXsrZ/q78vNLgJZdsPUn7XpdGrFFHX6pUAkSj6bf/J8ysIRq6DKOUNfym72e2QYisw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKRJlYZj/vM8lMPFruBRq7uav07apuOnarZh8uy17dk=;
 b=cY19GKTxKqgtNjjc4u2elEr+Z8O6NUFN4/kYPNeJJzP1ekdA6FW3m8KM5DhN5JRUCpbDLwWV/rtg32aeQjvsif/kyVJpEbPCcJ3xEH/pKFI9lnQ1LStOTPQqlIr3K7y3cARPq53m+SJEoN706+DNCfXZdKlCS0xqRCDBmVIX0pCNAx7ZGF+LWTtQ4jYb1BdJgqG9EBSsFSE4h7GgxNj2IfcRK7gHdVzXiliHV2YU2uz/sMHj5ChrYF3/dUwjD3f58UkL4zspqkeowsWJHX3i4wZtXUJ6GD92yzC4jQaLy1khvfmbga3teew179DyMPiw/qVjQgs8BEcSzvqWqzI3Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKRJlYZj/vM8lMPFruBRq7uav07apuOnarZh8uy17dk=;
 b=tK8GDlbkBvj3oBNdNWrsypxtp1Ff61nHvPXrKcVUGyxn7J2o3YaxHnQydBBJjttqqoMwrXUnkXVYJohDNhQRX/w54yIESW5IlDrGK5WjqcBlNsrO38QWFBIg9Vaz3QugqiAPjeNgOLehcCdmDo5E5Ow7QkvSjhyYC+PNRYvDOaw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v3 1/2] xen/mpu: Map early uart when earlyprintk on
Date: Wed, 4 Dec 2024 17:22:42 +0000
Message-ID: <20241204172243.1229942-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241204172243.1229942-1-ayan.kumar.halder@amd.com>
References: <20241204172243.1229942-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|MW6PR12MB8833:EE_
X-MS-Office365-Filtering-Correlation-Id: 31c31c7b-0477-450f-1b12-08dd1488494e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EhqGEt+ISUOHHSEDsCU9D9Lnl+gOPPP3n/WRHKvphuVpFNue3ZI5dFN53zf5?=
 =?us-ascii?Q?X+hquwNZYduPOKCt5i7A65eDZapSwb2pd8LVUaVla25QkYn2wkXUqT+AdX5o?=
 =?us-ascii?Q?oZVS/0M+8g5svuvjZ111TtYy3LJu9iQt5HltJXW78zLzQGidL6NpEx+u8PLa?=
 =?us-ascii?Q?UKjx2BiGt62iOwac0zjfy0HwavPa1GjLW/kp8i3o99Nj/tEJighQMvpQKGvw?=
 =?us-ascii?Q?rZdzwXUfU+MfL5LaXAmgTrTrYOb4HlX5yxCf+0O6JufcBex4/0fyG84Q7r3u?=
 =?us-ascii?Q?V7tyDFFed88rq7kEDAijCmX88lqJU59j82KomLItEOsWFHA/748AQEUgNT5R?=
 =?us-ascii?Q?ZQtelMk756OyqXTZqwqwByc8ftx6tYGVc5oXNv7wEme6MjWE3AxOnSeNL7Qv?=
 =?us-ascii?Q?QxIaOYrj63moT+AmqidsBNStcDtuFqKo5ZTyzOzrvPY+n/AvNpdu92kELbMX?=
 =?us-ascii?Q?k/25Dnmo0k+iW7I72nS+rXQyeyzqimqSlsa9pR2z9FbNPNVo8amIA45I1M1v?=
 =?us-ascii?Q?DXqm76UTHOMVRBlUx/q442WPZHcqSkBQud+vebIDqxlN10oyBbON7ZgNKrRL?=
 =?us-ascii?Q?EOVIQLEU2M9ZiUDU06IW/akOXrE+dn1byEPHs70jmir347r0U6Gy1IQdMgBC?=
 =?us-ascii?Q?tmEofjiKyXiZtcx6tWd8MNeUSAdrKETPjl9xzYYaS5uR4lr9esMdb00UZiMv?=
 =?us-ascii?Q?rHkzWZLnvAkQjAfn4J33qTGHVcT6fr942B2vEoE3Ir56ilhR7x1uBnY9CGQm?=
 =?us-ascii?Q?5R26lFbJfSVZtXwPn/7eIV+iQTNgDW74SWX5mhQk03iGk5oj5Qh9zfyk9diH?=
 =?us-ascii?Q?YrlTrzs2qTOWacjLDdF2lA/bXr0K48Bm40O9mFu4A5O4nyo0/Pu6eiwClB13?=
 =?us-ascii?Q?3A7Ea9/K6qXZtkqIvfNVp304J89dtOsjEA6nGQX80Zhi/wT/uiWUhFcMDbLP?=
 =?us-ascii?Q?bO6eR+2SrvnNDDelSlTxXLWyBv/tmYIt/WJ1XQDOaq6oXUZZNCJeb9q6ktdS?=
 =?us-ascii?Q?yi6O2Y+6lrkKuvwgES1Ljsx7OvyYP2mggpU/9TOCb+uqhDzg2FvC8td4AgwJ?=
 =?us-ascii?Q?2XvoEAmI7s5qWsZtWb7r3km+fKrZJ4hy6UplHTcIBoO+I4EakmexhG8QyaEN?=
 =?us-ascii?Q?FzRmE7kLkIotrplBN87kOw3zfmckrxoUbR/vT4wkt2RCVntFajGlm4ptWZiE?=
 =?us-ascii?Q?5pj8NSy/3oHR6SEu+JqiOZzbqmCmHTjl/agNriSSeA3Hc7fh4XsE7O+JD+Zl?=
 =?us-ascii?Q?r27dpTcma3vXaPnuETMt6iYI3OUTDxp2MY57vo/0mfG8AGOC1/waXTBrJIab?=
 =?us-ascii?Q?XUVD4Z2wlMo8O0Kg+x2bTdrkFxfBvoz0Dx+LXE6tdXzw8/lUFeh4Ge6UlsFa?=
 =?us-ascii?Q?t033wj/f6bCqrCSpeI33uLrv6UntZhlxepHIhC2+UgHzPQtiJjXlaN4YlZgs?=
 =?us-ascii?Q?XD4OzF54kQnBM5gefQPC6Yu37VfStCb9?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 17:22:53.3816
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31c31c7b-0477-450f-1b12-08dd1488494e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8833

CONFIG_EARLY_UART_SIZE is introduced to let user provide physical size of
early UART. Unlike MMU where we map a page in the virtual address space,
here we need to know the exact physical size to be mapped.
As VA == PA in case of MPU, the memory layout follows exactly the hardware
configuration. As a consequence, we set  EARLY_UART_VIRTUAL_ADDRESS as physical
address.

EARLY_UART_BASE_ADDRESS and EARLY_UART_SIZE should be aligned to the minimum
size of MPU region (ie 64 bits) as per the hardware restrictions. Refer ARM
DDI 0600A.d ID120821 A1.3 "A minimum protection region size of 64 bytes.".

UART is mapped as nGnRE region (as specified by ATTR=100 , refer G1.3.13,
MAIR_EL2, "---0100 Device memory nGnRE"). Also, it is mapped as outer shareable,
RW at EL2 only and execution of instructions from the region is not permitted.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes from :-

v1 - 1. UART base address and size should be aligned to the minimum size of MPU
region (and not PAGE_SIZE).

v2 - 1. In early_printk.h, included <asm/arm64/mpu.h> and fixed the macro names.
2. Included <asm/early_printk.h> in head.S.
3. Updated the commit message (to remove reference to R82 TRM) and added Luca's
R-b.

 xen/arch/arm/Kconfig.debug              |  7 +++++++
 xen/arch/arm/arm64/mpu/head.S           | 10 +++++++++
 xen/arch/arm/include/asm/early_printk.h | 28 ++++++++++++++++++++++++-
 3 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/Kconfig.debug b/xen/arch/arm/Kconfig.debug
index 7660e599c0..84a0616102 100644
--- a/xen/arch/arm/Kconfig.debug
+++ b/xen/arch/arm/Kconfig.debug
@@ -121,6 +121,13 @@ config EARLY_UART_BASE_ADDRESS
 	hex "Early printk, physical base address of debug UART"
 	range 0x0 0xffffffff if ARM_32
 
+config EARLY_UART_SIZE
+       depends on EARLY_PRINTK
+       depends on MPU
+       hex "Early printk, physical size of debug UART"
+       range 0x0 0xffffffff if ARM_32
+       default 0x1000
+
 config EARLY_UART_PL011_BAUD_RATE
 	depends on EARLY_UART_PL011
 	int "Early printk UART baud rate for pl011"
diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/head.S
index d3db5e53af..e4f2021f45 100644
--- a/xen/arch/arm/arm64/mpu/head.S
+++ b/xen/arch/arm/arm64/mpu/head.S
@@ -4,6 +4,7 @@
  */
 
 #include <asm/arm64/mpu.h>
+#include <asm/early_printk.h>
 
 /* Backgroud region enable/disable */
 #define SCTLR_ELx_BR    BIT(17, UL)
@@ -11,8 +12,10 @@
 #define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
 #define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
 #define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */
+#define REGION_DEVICE_PRBAR     0x22    /* SH=10 AP=00 XN=10 */
 
 #define REGION_NORMAL_PRLAR     0x0f    /* NS=0 ATTR=111 EN=1 */
+#define REGION_DEVICE_PRLAR     0x09    /* NS=0 ATTR=100 EN=1 */
 
 /*
  * Macro to prepare and set a EL2 MPU memory region.
@@ -140,6 +143,13 @@ FUNC(enable_boot_cpu_mm)
     ldr   x2, =__bss_end
     prepare_xen_region x0, x1, x2, x3, x4, x5
 
+#ifdef CONFIG_EARLY_PRINTK
+    /* Xen early UART section. */
+    ldr   x1, =CONFIG_EARLY_UART_BASE_ADDRESS
+    ldr   x2, =(CONFIG_EARLY_UART_BASE_ADDRESS + CONFIG_EARLY_UART_SIZE)
+    prepare_xen_region x0, x1, x2, x3, x4, x5, attr_prbar=REGION_DEVICE_PRBAR, attr_prlar=REGION_DEVICE_PRLAR
+#endif
+
     b    enable_mpu
     ret
 END(enable_boot_cpu_mm)
diff --git a/xen/arch/arm/include/asm/early_printk.h b/xen/arch/arm/include/asm/early_printk.h
index 46a5e562dd..219705a8b6 100644
--- a/xen/arch/arm/include/asm/early_printk.h
+++ b/xen/arch/arm/include/asm/early_printk.h
@@ -11,10 +11,33 @@
 #define __ARM_EARLY_PRINTK_H__
 
 #include <xen/page-size.h>
+#include <asm/arm64/mpu.h>
 #include <asm/fixmap.h>
 
 #ifdef CONFIG_EARLY_PRINTK
 
+#if defined(CONFIG_MPU)
+
+/*
+ * For MPU systems, there is no VMSA support in EL2, so we use VA == PA
+ * for EARLY_UART_VIRTUAL_ADDRESS.
+ */
+#define EARLY_UART_VIRTUAL_ADDRESS CONFIG_EARLY_UART_BASE_ADDRESS
+
+/*
+ * User-defined EARLY_UART_BASE_ADDRESS and EARLY_UART_SIZE must be aligned to
+ * minimum size of MPU region.
+ */
+#if (CONFIG_EARLY_UART_BASE_ADDRESS % MPU_REGION_ALIGN) != 0
+#error "EARLY_UART_BASE_ADDRESS must be aligned to minimum MPU region size"
+#endif
+
+#if (CONFIG_EARLY_UART_SIZE % MPU_REGION_ALIGN) != 0
+#error "EARLY_UART_SIZE must be aligned to minimum MPU region size"
+#endif
+
+#elif defined(CONFIG_MMU)
+
 /* need to add the uart address offset in page to the fixmap address */
 #define EARLY_UART_VIRTUAL_ADDRESS \
     (FIXMAP_ADDR(FIX_CONSOLE) + (CONFIG_EARLY_UART_BASE_ADDRESS & ~PAGE_MASK))
@@ -22,6 +45,9 @@
 #define TEMPORARY_EARLY_UART_VIRTUAL_ADDRESS \
     (TEMPORARY_FIXMAP_ADDR(FIX_CONSOLE) + (CONFIG_EARLY_UART_BASE_ADDRESS & ~PAGE_MASK))
 
-#endif /* !CONFIG_EARLY_PRINTK */
+#else
+#error "Unknown Memory management system"
+#endif
 
+#endif /* !CONFIG_EARLY_PRINTK */
 #endif
-- 
2.25.1


