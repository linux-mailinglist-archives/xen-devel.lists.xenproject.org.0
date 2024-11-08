Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A19EB9C2602
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 21:01:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832829.1248169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9VA0-0006wX-Ow; Fri, 08 Nov 2024 20:00:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832829.1248169; Fri, 08 Nov 2024 20:00:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9VA0-0006uJ-L8; Fri, 08 Nov 2024 20:00:48 +0000
Received: by outflank-mailman (input) for mailman id 832829;
 Fri, 08 Nov 2024 20:00:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hbhu=SD=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1t9V9z-0006u1-1f
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 20:00:47 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2409::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21f67270-9e0c-11ef-99a3-01e77a169b0f;
 Fri, 08 Nov 2024 21:00:43 +0100 (CET)
Received: from MN2PR02CA0032.namprd02.prod.outlook.com (2603:10b6:208:fc::45)
 by PH7PR12MB5854.namprd12.prod.outlook.com (2603:10b6:510:1d5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Fri, 8 Nov
 2024 20:00:34 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:208:fc:cafe::28) by MN2PR02CA0032.outlook.office365.com
 (2603:10b6:208:fc::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.29 via Frontend
 Transport; Fri, 8 Nov 2024 20:00:34 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Fri, 8 Nov 2024 20:00:33 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Nov
 2024 14:00:33 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Fri, 8 Nov 2024 14:00:32 -0600
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
X-Inumbo-ID: 21f67270-9e0c-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQwOTo6NjBlIiwiaGVsbyI6Ik5BTTA0LURNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjIxZjY3MjcwLTllMGMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMDk2MDQzLjI2MDEwOSwic2VuZGVyIjoiYXlhbi5rdW1hci5oYWxkZXJAYW1kLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GuCrvQdfqgT85Jzl0TwHCVG3mFzEmtBFnU9OsrrvRpvDD/QN5nJyo6T4WcMDwYwCVhsRpYZruDIDBjDs2lPnKcRZ+r2mn7fMgjRC83AD0PJWYt0lpM74KtY38DXB/qPFrKZC/nRibDDsChUD9rlMMPUuHwu/Q/8LPwjb4VjfWmYYaxF12CEhFGgRIFKW0s7JTF9tH3CaINuuYPFJBLsG2YRbPTwFvPpVUgCRWAjOBTMs1d6rKebJ93qxsLvbKOQ8w0G3NZqKoXmCXjxZ0Qf6i9JxM7KS0MewIPKC1k1YEGDTEk1B/NkGy9vfknNaIpkUTUlx7LVV2dV1mPDVm6TUcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W7MTVHvsmqy7eo+n+r9GFgMFK/5bG+cP0QVZBcwS2z0=;
 b=elc9XBJO9//E9uqMkZN+oCUmyzcpaEQmSgGhoVUBjX8+A2BnD3K+yZLcFOUjvZOdgb3uo0MiskmHM0o8gFXw+hIZZ/6JKpYbDhEG60COSNuYHGjRs23p6V2sk9ay6Htoa7BHTVruKWmC7OPjuJ9/plPqJk+GKKvZ3uP1H5VC1gBREKK6wlaZK8f0jG7XSZlAhw87C+6tsMOv82MD3tRvQ1W3Tul7LZ880/SD51/imdK/PGOmM1wRGBxn85SRUk3cq98mnBNm3xgfQeCqdp88L+oNp7fI6Dx9zYSeJ80c17cWIGN8rz/6C/Qm5v0lOhyqDamv57apQBGFl/nvrGs4Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W7MTVHvsmqy7eo+n+r9GFgMFK/5bG+cP0QVZBcwS2z0=;
 b=yWtbksmbzat7PO9Id+Nb+UPfaUaa/4n0h0rso93TV+ce2ncGByV77sbVCsqMcjxE2PuXO/r0PDUMLMWO9Sp5HtXQzgyjsfzOkXlpAOtVPq6jwO8FCLUBuIN6jvgO1+R7v0yut4/Fl6/OBgCaohjKqIuFP0tAkRRLPjZeTgrWznA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 1/2] xen/mpu: Map early uart when earlyprintk on
Date: Fri, 8 Nov 2024 20:00:24 +0000
Message-ID: <20241108200024.857766-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|PH7PR12MB5854:EE_
X-MS-Office365-Filtering-Correlation-Id: c9d9f930-15cb-41cb-cfd8-08dd00300164
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UNRvq5qEqoJlAKyJNbd+Oio+MRlRZpwJ3HLmjUiC1iEX0cHbZld8uDNQAhsI?=
 =?us-ascii?Q?1VqHJSdJmBeRHl3Wye1jFvdS6phWRJQjEXsOCaXmi6xAr/qUxTKiVgItO1wY?=
 =?us-ascii?Q?ae2gMmkdxSi59514EMmwkOTV7ze5IDFVY18qki39UqeU3fabf0wbhQfEZIFm?=
 =?us-ascii?Q?DRtfnT9szppxoliqtl0gZ5TImo3MSu9vfnD48vlzT9cylrNYv/KresHAw8f+?=
 =?us-ascii?Q?NvuRMRNwLJaugCsU9woQjbbwSpfJwKeahCK7w9lswWzoj2mYp5RpncP4ZYPk?=
 =?us-ascii?Q?cWuYkiY20Mzbdf9dVDHSCb0gHT+QSB/J3mD8Gb+qtgvAVboN4cs3nttdCyao?=
 =?us-ascii?Q?wvdHrdaokC4wb1iDiFej8UzGkWDuuwEtHDYCqk4zHDRVvu7ncJrwbEOxHn5P?=
 =?us-ascii?Q?ks74U1luYJGhpSKc6UIdtEJlsMqaqXNtAQ49F51XaPvvClOK62qPiqbgZeGD?=
 =?us-ascii?Q?Sx4p/htd/O3ThY+mFVJqoUkzJsKJoGHO4FxbIam05m+OlgDioOMBErWkIqGM?=
 =?us-ascii?Q?r6ETMvHCpJSj0kwAsrcHULekbWywSNPPdiArCyrVdyRUKf3dFJtX1EHDdL/7?=
 =?us-ascii?Q?iphJDvstFNsci3oEc6IR+BNJB024tLzuyiERNWl79BoAvOzetI/1egtyvT5L?=
 =?us-ascii?Q?jjeqFHqOzV7Y6DTZYk3mHe6TFXe5mDGsubzzOfsuGz151IXWCCme7NP4feQt?=
 =?us-ascii?Q?os9FG2WvBAc5LWPsVw3oSi2HbxPO2cMHwByuZMG/G2x2GMl7pg9TEKvc8ylf?=
 =?us-ascii?Q?qOv9v4FG+yAKX5jF8wZEbiqtYPu0Qahsmsm10XV9pjv+DEq/5WGRUTy8q4r5?=
 =?us-ascii?Q?eYodOAFp6MQCIOrXc2QWDBZEQIFew9wXdgOcRzmAwxo784yHofiKjvuvFD6/?=
 =?us-ascii?Q?gh1XHIyP6rlQ5NMZuUxDMFGjETd+CKYtPXASBUwGC/jEq7KquOytCWmSsKl6?=
 =?us-ascii?Q?KNwUfCtJsqjBHDgSqaW5eVAqBkpxVPROCJWAsJaqBBTIF5wqI15vEHNYSVZ1?=
 =?us-ascii?Q?jqoW5q8FNtnxlSReihybAxP4/v4+qqypLKUFa3VJVta+1tjpe+N5nMqV/iOX?=
 =?us-ascii?Q?1T3Ydr0HFsLVkKY93mwMJR3Lgt6kcj7mtYUlYhdhzXx6jW0aEo4tWhnsyEBg?=
 =?us-ascii?Q?sWAtuJj1+ff5HQZjr1nL59cA0M5ebQZJKUQ6z6RCqb8EJN1ObxOEtNzyv3w+?=
 =?us-ascii?Q?7BBs7xr/rc8AUQ1I+X3NUAp9BHWsQgkRr6zx6YMOBqrrd2Vwx8YuFMWCAHTj?=
 =?us-ascii?Q?ozzmYjDZnkMBGDNTzeO944r3sZ5p47fH0gSQc9mrmrWM8c81dcWyvBTQF+bI?=
 =?us-ascii?Q?UTMIxE3uJrGAbYw+CROblK2Abplnywl11od9lqJuO/Kjfmd8EXE4U/89ENys?=
 =?us-ascii?Q?Cs1w6rbG0LRT+ODLxfiONVXZ0LCzBo35fxTrVQHzFMn53nOp2w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 20:00:33.7823
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9d9f930-15cb-41cb-cfd8-08dd00300164
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5854

CONFIG_EARLY_UART_SIZE is introduced to let user provide physical size of
early UART. Unlike MMU where we map a page in the virtual address space,
here we need to know the exact physical size to be mapped.
As VA == PA in case of MPU, the memory layout follows exactly the hardware
configuration. As a consequence, we set  EARLY_UART_VIRTUAL_ADDRESS as physical
address.

Further, we check whether user-defined EARLY_UART_SIZE is aligned to PAGE_SIZE
(4KB). This is partly because we intend to map a minimum of 1 page(ie 4KB) and
the limit address is set as "EARLY_UART_SIZE-1". The limit address needs to end
with 0x3f (as required by PRLAR register).

UART is mapped as nGnRE region (as specified by ATTR=100 , refer G1.3.13,
MAIR_EL2, "---0100 Device memory nGnRE") and Doc ID - 102670_0101_02_en
Table 4-3, Armv8 architecture memory types (nGnRE - Corresponds to Device in
Armv7 architecture). Also, it is mapped as outer shareable, RW at EL2 only
and execution of instructions from the region is not permitted.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 xen/arch/arm/Kconfig.debug              |  7 +++++++
 xen/arch/arm/arm64/mpu/head.S           |  9 +++++++++
 xen/arch/arm/include/asm/early_printk.h | 19 +++++++++++++++++++
 3 files changed, 35 insertions(+)

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
index 731698aa3b..98422d7ed3 100644
--- a/xen/arch/arm/arm64/mpu/head.S
+++ b/xen/arch/arm/arm64/mpu/head.S
@@ -11,8 +11,10 @@
 #define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
 #define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
 #define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */
+#define REGION_DEVICE_PRBAR     0x22    /* SH=10 AP=00 XN=10 */
 
 #define REGION_NORMAL_PRLAR     0x0f    /* NS=0 ATTR=111 EN=1 */
+#define REGION_DEVICE_PRLAR     0x09    /* NS=0 ATTR=100 EN=1 */
 
 /*
  * Macro to prepare and set a EL2 MPU memory region.
@@ -137,6 +139,13 @@ FUNC(enable_boot_cpu_mm)
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
index 46a5e562dd..98fd52c4db 100644
--- a/xen/arch/arm/include/asm/early_printk.h
+++ b/xen/arch/arm/include/asm/early_printk.h
@@ -15,6 +15,24 @@
 
 #ifdef CONFIG_EARLY_PRINTK
 
+#ifndef CONFIG_MMU
+
+/*
+ * For MPU systems, there is no VMSA support in EL2, so we use VA == PA
+ * for EARLY_UART_VIRTUAL_ADDRESS.
+ */
+#define EARLY_UART_VIRTUAL_ADDRESS CONFIG_EARLY_UART_BASE_ADDRESS
+
+/*
+ * User-defined EARLY_UART_SIZE must be aligned to a PAGE_SIZE, or
+ * we may map more than necessary in MPU system.
+ */
+#if (EARLY_UART_SIZE % PAGE_SIZE) != 0
+#error "EARLY_UART_SIZE must be aligned to PAGE_SIZE"
+#endif
+
+#else
+
 /* need to add the uart address offset in page to the fixmap address */
 #define EARLY_UART_VIRTUAL_ADDRESS \
     (FIXMAP_ADDR(FIX_CONSOLE) + (CONFIG_EARLY_UART_BASE_ADDRESS & ~PAGE_MASK))
@@ -22,6 +40,7 @@
 #define TEMPORARY_EARLY_UART_VIRTUAL_ADDRESS \
     (TEMPORARY_FIXMAP_ADDR(FIX_CONSOLE) + (CONFIG_EARLY_UART_BASE_ADDRESS & ~PAGE_MASK))
 
+#endif /* CONFIG_MMU */
 #endif /* !CONFIG_EARLY_PRINTK */
 
 #endif
-- 
2.25.1


