Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3282B9B30CB
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 13:46:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826454.1240748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5P8q-0006ZH-8m; Mon, 28 Oct 2024 12:46:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826454.1240748; Mon, 28 Oct 2024 12:46:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5P8q-0006Wi-4w; Mon, 28 Oct 2024 12:46:40 +0000
Received: by outflank-mailman (input) for mailman id 826454;
 Mon, 28 Oct 2024 12:46:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TXyF=RY=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1t5P8o-00050g-Mk
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 12:46:38 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20606.outbound.protection.outlook.com
 [2a01:111:f403:200a::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab555208-952a-11ef-a0c2-8be0dac302b0;
 Mon, 28 Oct 2024 13:46:38 +0100 (CET)
Received: from PH7P220CA0098.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32d::9)
 by DS7PR12MB8417.namprd12.prod.outlook.com (2603:10b6:8:eb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Mon, 28 Oct
 2024 12:46:29 +0000
Received: from CY4PEPF0000E9CD.namprd03.prod.outlook.com
 (2603:10b6:510:32d:cafe::2e) by PH7P220CA0098.outlook.office365.com
 (2603:10b6:510:32d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.26 via Frontend
 Transport; Mon, 28 Oct 2024 12:46:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9CD.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Mon, 28 Oct 2024 12:46:28 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Oct
 2024 07:46:27 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Oct
 2024 07:46:27 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Mon, 28 Oct 2024 07:46:26 -0500
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
X-Inumbo-ID: ab555208-952a-11ef-a0c2-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m3I883Oyut7aFQMbsqhpzpFIoI2GvBA+PT0q955pOKZN9OZEYV+IRo/dvPQ/0TpYDdsWDDWnMGOU/xQBWTTyDL7CT96pjHNF5YHZIb2d3IxO9QtaGcKySR3F9M199Cmn9Xrp+LqHHyu5a/z4OrhCdGzNxI8Zji8+HtqFwXwHwUVEmP/Ji1Tu4aX94s62OjaArZg9Kh+T+bAh/4wtHf0g+70gdkW/ub+opegXv5hoJ3qegPsuicfS5H+8fn8n2zjAvrsL84Bj63tEZVBkaHbS7TuhBfz9aWvgtpxYUBbO/cV8ZEfWU3NaJvztCmeOw97H13QP3gEofXrNYyUXQ4UVpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gbtn/b9PyyI/M8LkjdkVTqNsj2orDE7jZ4wJ89CVFig=;
 b=eqIt/y/DM58FmHhTLH/shJ3YcB7rbOR/kEzmUCaltaSIxAvW38GypwLP+EMjc8dQr4DW6CzSOC2ah09GsWe2w/CsI75JAbJf5GY9p7jlHEXhyLijWW2n1SJM1VjTvnNIguvNJuj0jy1nyXyGPPIPrSx4McjOau4np43pmDJI4svlaqJITfPlMuMgo990EmzQduCxAY4KbwGvc/oqNY2zVD1cvAyDxjg4iMLtxTT2nacx7oDD+TmNrD9X/1ktBUBXHdK02qzaj5L7N7HSinI4xYVhMxNmHdUCSRBeE/afpAGGltBxvKnZzDcNl6D+c4a0Txh3WRzIkEXdYo3tP2tSiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gbtn/b9PyyI/M8LkjdkVTqNsj2orDE7jZ4wJ89CVFig=;
 b=nR+NzA3XLeMIo8kSSZIWwIYs/MksP4PtL9jK1Da+TKc3dEakVkaJrsQwxBsgdBCWzAEt+EMFIM0rD535iOgLSjt+5dd+SPRCOcsmIJC8zmkVSyPYBgB5gkxmG5ff2U9IkJq2rhcWWj4xGwcbSoSWQnWOM8TRU2DxQ8bQZHU6sIo=
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
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 5/6] xen/arm: mpu: Enable MPU
Date: Mon, 28 Oct 2024 12:45:46 +0000
Message-ID: <20241028124547.1371867-6-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241028124547.1371867-1-ayan.kumar.halder@amd.com>
References: <20241028124547.1371867-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CD:EE_|DS7PR12MB8417:EE_
X-MS-Office365-Filtering-Correlation-Id: a973a085-f70c-45d5-4065-08dcf74e8ae4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7bKTzqvEBYthZpBLNCfgPh0lcQ2qoMSh+ev3T8WNJXv3OZjfyTbadUSQ0B9l?=
 =?us-ascii?Q?U2jLqbLtCnt9jsKJ/X8FXmMkdyu+zF6ywpnVZdsJQ5HmWiKXGMUpbgOlnMJj?=
 =?us-ascii?Q?tJolUWxpHSx5fxSn+XuvDGGgjTPw/COh0FJDOlcLcWRM/CQVXb5mtVEqG66D?=
 =?us-ascii?Q?ptcXl4fyHClCWzrme6sgX3RNU6gVf/uFaf/R1cHjONCqJvDFXkdWvvuTTqMu?=
 =?us-ascii?Q?O1cxeg0ZZYP0LUFeLzImSHQRCy4NTTqC0VqHRWfUXON/5RbcnqWnEBMduMYb?=
 =?us-ascii?Q?mIcLFXCjR/PCN1k8KLM5LfcBNem5LNnL6BaUNFehqO5w+z/uxUB+s1kSJhyD?=
 =?us-ascii?Q?yCD+RpGrvns3Zb7gYL/fNdGPJCJuNfO4B95QlwpwF+Dt9yOPtJ0hmER7xJ9g?=
 =?us-ascii?Q?Uaf4+aLdiBfSOZpP0G8NmZawdLe7X0MtH1r5DmKB0gjJuxsepvqc2F86Yb5R?=
 =?us-ascii?Q?5JqWumzC7hKTJRMdrU/+zkl4MNJHI2ACY4XCVaGdO3lBI043+0QzMrihEaAv?=
 =?us-ascii?Q?PdTSs3KGZ64cNz7js92QLQIjHKPd79/H3Je6KWZV3706/tsZroSWpLcKdeDK?=
 =?us-ascii?Q?Bd2csldFePaF4ihwXj87Cm/WhfxobUE/5WcuA2gJgng8Wgdv43p4Sr9+bNjI?=
 =?us-ascii?Q?GjJS2irzHAiwe418UKN/wVxDMPO4+ibJOvhOXwgX6wUdtllcd0yLZBfeclIb?=
 =?us-ascii?Q?gBgBTYphTbFwwXqnFoJvDkSAt4bWbcxFO1/W6bxnChjVExSH0a3M3iLbdoNX?=
 =?us-ascii?Q?rvZps1xxIc72D4Hv3iMdk8q1wcgZDvgqiTb7+MQq4yvtCY9lNCLapRXzxU0P?=
 =?us-ascii?Q?qkM8ECPsVz4nxHmPDVKcWNRZVoHAe9nczsKaW2WYkeBEfJV6OxPkcA50sNCq?=
 =?us-ascii?Q?CORFnJNgZdsNuIldeGWNXTijvaX+C8AuXp/eG+0DqGwfCxVtkC2FbtpLtTag?=
 =?us-ascii?Q?8f6Cc9V4sym4Nrnvg9inuHnFEdN/fqLQo3isEpUkFYMoSqIP37FGAR5U3S+4?=
 =?us-ascii?Q?iu0pXnXRX7cM5BZVDUXQzeYx36Hne9ETbgqGKylF2ui3HEj8pIFgXUzjzFmq?=
 =?us-ascii?Q?k5Jmt1Rlr2LDYzuRIFXc0xD72bd9Lai/C2LpgXgunNWuaQaxcMqh5QV1/sj4?=
 =?us-ascii?Q?Tu39Y3U150KquOeihxTq2w/v+iAaimJw2YYAsRBDZtd1RmtZ1KQh5ZIpmks2?=
 =?us-ascii?Q?N4k2uOtkZyo7XmRPajXM5lXbmybFkYaEunPElMBM+qifrke2Uc3zdqQUlf1/?=
 =?us-ascii?Q?kBBUrnilt9XnuHfhOKW504cAAmSursMP9rnFO2xI8q57ohjFLzzwSMFgtm6o?=
 =?us-ascii?Q?tiuK/0e+N1uU7EDLiHszoVOOsIKpOAxMUIbXnTRjM59m2x2GMAEAcUaA9+9t?=
 =?us-ascii?Q?9qOs/kVprb1n5hkKPzaUvfLUzae52pIyiQ+RXWd1AWuE2QXY7Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 12:46:28.7929
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a973a085-f70c-45d5-4065-08dcf74e8ae4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8417

After the regions have been created, now we enable the MPU. For this we disable
the background region so that the new memory map created for the regions take
effect. Also, we treat all RW regions as non executable and the data cache is
enabled.

As enable_mpu() is invoked from enable_boot_cpu_mm(), one needs to save and
restore the lr.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from :-

v2 - 1. Extracted from the previous patch into a new one.

2. Disabled background region.

v3 - 1. Removed dsb before setting SCTLR_EL2. The reason being
From ARM DDI 0487K.a D23-7349:
"Direct writes to these registers (includes SCTLR_EL2) are not allowed to affect
any instructions appearing in program order before the direct write."
So, we don't need a synchronization barrier before writing to SCTLR_EL2.
Further, we do have synchronization barriers after writing the MPU region
registers (which happens before we read SCTLR_EL2). So, SCTLR_EL2 is written
after the MPU registers are synchronized. And, thus adding a 'isb' to flush the
instruction pipeline ensures that the subsequent instructions are fetched after
the MPU has been enabled.

2. Saved and restored lr in enable_boot_cpu_mm().

 xen/arch/arm/arm64/mpu/head.S                | 30 ++++++++++++++++++--
 xen/arch/arm/include/asm/arm64/mpu/sysregs.h |  3 ++
 2 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/head.S
index 9377ae778c..0edadb009c 100644
--- a/xen/arch/arm/arm64/mpu/head.S
+++ b/xen/arch/arm/arm64/mpu/head.S
@@ -68,6 +68,29 @@ FUNC_LOCAL(fail_insufficient_regions)
     b   1b
 END(fail_insufficient_regions)
 
+/*
+ * Enable EL2 MPU and data cache
+ * If the Background region is enabled, then the MPU uses the default memory
+ * map as the Background region for generating the memory
+ * attributes when MPU is disabled.
+ * Since the default memory map of the Armv8-R AArch64 architecture is
+ * IMPLEMENTATION DEFINED, we intend to turn off the Background region here.
+ *
+ * Clobbers x0
+ *
+ */
+FUNC_LOCAL(enable_mpu)
+    mrs   x0, SCTLR_EL2
+    bic   x0, x0, #SCTLR_ELx_BR       /* Disable Background region */
+    orr   x0, x0, #SCTLR_Axx_ELx_M    /* Enable MPU */
+    orr   x0, x0, #SCTLR_Axx_ELx_C    /* Enable D-cache */
+    orr   x0, x0, #SCTLR_Axx_ELx_WXN  /* Enable WXN */
+    msr   SCTLR_EL2, x0
+    isb
+
+    ret
+END(enable_mpu)
+
 /*
  * Maps the various sections of Xen (described in xen.lds.S) as different MPU
  * regions.
@@ -75,10 +98,11 @@ END(fail_insufficient_regions)
  * Inputs:
  *   lr : Address to return to.
  *
- * Clobbers x0 - x5
+ * Clobbers x0 - x6
  *
  */
 FUNC(enable_boot_cpu_mm)
+    mov   x6, lr
 
     /* Get the number of regions specified in MPUIR_EL2 */
     mrs   x5, MPUIR_EL2
@@ -110,8 +134,10 @@ FUNC(enable_boot_cpu_mm)
     ldr   x2, =__bss_end
     prepare_xen_region x0, x1, x2, x3, x4, x5
 
-    ret
+    bl    enable_mpu
 
+    mov   lr, x6
+    ret
 END(enable_boot_cpu_mm)
 
 /*
diff --git a/xen/arch/arm/include/asm/arm64/mpu/sysregs.h b/xen/arch/arm/include/asm/arm64/mpu/sysregs.h
index b0c31a58ec..3769d23c80 100644
--- a/xen/arch/arm/include/asm/arm64/mpu/sysregs.h
+++ b/xen/arch/arm/include/asm/arm64/mpu/sysregs.h
@@ -15,6 +15,9 @@
 /* MPU Protection Region Selection Register encode */
 #define PRSELR_EL2  S3_4_C6_C2_1
 
+/* Backgroud region enable/disable */
+#define SCTLR_ELx_BR    BIT(17, UL)
+
 #endif /* __ASM_ARM_ARM64_MPU_SYSREGS_H */
 
 /*
-- 
2.25.1


