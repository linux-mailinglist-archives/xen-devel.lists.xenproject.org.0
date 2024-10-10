Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9042B9988C0
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 16:05:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816170.1230407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sytnE-0007Ut-S5; Thu, 10 Oct 2024 14:05:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816170.1230407; Thu, 10 Oct 2024 14:05:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sytnE-0007Rs-Nm; Thu, 10 Oct 2024 14:05:28 +0000
Received: by outflank-mailman (input) for mailman id 816170;
 Thu, 10 Oct 2024 14:05:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rwpE=RG=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sytnC-0006aO-Nm
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 14:05:26 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20605.outbound.protection.outlook.com
 [2a01:111:f403:2405::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b22cfc86-8710-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 16:05:26 +0200 (CEST)
Received: from CH2PR07CA0052.namprd07.prod.outlook.com (2603:10b6:610:5b::26)
 by CH3PR12MB9028.namprd12.prod.outlook.com (2603:10b6:610:123::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Thu, 10 Oct
 2024 14:05:21 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:5b:cafe::88) by CH2PR07CA0052.outlook.office365.com
 (2603:10b6:610:5b::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18 via Frontend
 Transport; Thu, 10 Oct 2024 14:05:21 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Thu, 10 Oct 2024 14:05:21 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Oct
 2024 09:05:14 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Oct
 2024 09:05:14 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Thu, 10 Oct 2024 09:05:13 -0500
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
X-Inumbo-ID: b22cfc86-8710-11ef-a0bd-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=laulD8mgEE8bgVKkDpa0ChGi3H3Xo/WWeBqUNcixR3f7sd1jCWAMGFftyi4Qvfe1RoJa6SRo2XVgdSZMJDcouahm0LZ6FjWmNp3FzNR01dLkWebLxS0NByZFJ4yeqA0qkteaFmhIs+Df+1rxBSS8V/DR2z/ejoH+fhk0LAF0OdgS6dgK5v/+6q8U/QY+goXk5mr72YQZEvL54+olTqphJpN1Sp8fwN+3Pfj1NOR39pYg4Qjv3MRsVWSp+Ro75AqFc7PTWMWEBqwL360N1RU+R395rGQ3nR82FGtB0dfXCBxf7myj9ZzF70Qj0W4LtiMvQ/wib3VbJ82ldxK6Sqbl9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mc+2UIogysTLypyoewHZ0RzOpVjSYSg0ff0a3ZkO2SY=;
 b=LM5xEu/oAXdCkM9AC4GlfE+OlaEwZuX4RVy42rY8ihDdN2eenw1ps4yTD7XoQL4Wneof5193kINso1Gwn+U69vlDgUvS+ZStHSuqDNvZGEOIidSZ77iDVTzFm9l3B77YTmdwKPRvU1rL9ec9IF8iSApOTgmAa/KSSBg4x87Jtrwp+7dVyQelBJCH6Y79w8V34vvIF4GekSbBzJ4Wbsz7KWQFQKDR1/7u0W2H8mgPzvMR3ueri+4q8hW+QUcasbWPsvu8hpxYHg7kjuVmiVjwRecNxA+5H4cVmNcnUcW62+f/ZQXJ1bAkeJj5UxkPuSb8R3Qkals6drTPCjbUYJi7mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mc+2UIogysTLypyoewHZ0RzOpVjSYSg0ff0a3ZkO2SY=;
 b=Ymv1y0jMWsYOUBheyRj8exsQi9J9FnSnmYNZcox8seXKHC/GXjxTF1bmRKNFRz4OWgH12hLC8YgK8x2LOLB+nK/USbdlepmT3TFHQWVhpuouVzmsliLNUZNuGTZLs/5BSl9p2Y6ZOvSwg5IXlxYQrmA6hFUPagloy1RsO6MlfOI=
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
Subject: [PATCH v3 5/6] xen/arm: mpu: Enable MPU
Date: Thu, 10 Oct 2024 15:03:50 +0100
Message-ID: <20241010140351.309922-6-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|CH3PR12MB9028:EE_
X-MS-Office365-Filtering-Correlation-Id: cac452d3-b6cf-4be0-234f-08dce9349408
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cYUyyQqg9on/VleGmm0+q6Q9WTg5yozdWASHwjQU86Yd/iRHLp8oYDV+posV?=
 =?us-ascii?Q?8Af7Q6EjeVlQDK5Asv64QmM9GGlRj5FhoDZmRNT37ECTGw5+Iw9b/j5meZAZ?=
 =?us-ascii?Q?H2JMTIhD8Kfq6xZ+qJ2kn/ov3KzIKWI1KXnbeXU0kEWGYRbvNCWGVzs+bBNv?=
 =?us-ascii?Q?NktYD0xWiO/g9zmNjMNjEJXobr+1f3WCO2IRwE190YlnAnEPXGRMGatektKA?=
 =?us-ascii?Q?7ojnfuLBjKaCcBXJba+rVUGFNcrhBoQTRF3+qOfGoRTNZgQb1Bn/EiengQOS?=
 =?us-ascii?Q?1vvHs6uGk1yBlPXuK047a218RaKA0eESZ4dReucFzfBFPA/QKCQwhAEQHYWn?=
 =?us-ascii?Q?edkqjQeUd5LWG1o5GjMBjzrTtOZWZXEoTayuJOGlMybd4aFraNBFO7RvAai2?=
 =?us-ascii?Q?oWGV2oqVUJT9lgkfcy87JJgWYsbLjADC879r/mq+xHvDmLQM7FzmmXdDhejH?=
 =?us-ascii?Q?RihM99fYrLE+bgfefsE5Riu2ghVJVuy8kD0qby90GRsBlsMc8nx2uCv+hyUh?=
 =?us-ascii?Q?7AdwEsBhqIr4BN6/sXxl1k3KwgKQKrYM51OLC9CGCl8UgKLeTN1uxKhkOItS?=
 =?us-ascii?Q?W747IY5u+ANsR39C6ZT8OoaU288fU1WqOzKJ/ucb+2Veen1bgdLueAxE3q9e?=
 =?us-ascii?Q?NTnIoCc8HIDlnZMpXpl+ThCeXYs0NB9ALYNutjbm4suFLC6ukg8ho8po2Qz6?=
 =?us-ascii?Q?qrcOoj192/VsUfCaNgS9k8ZOBxEWTspcEYgOWaI5PbLKKXvH0nMCxc8ZeCox?=
 =?us-ascii?Q?3Zls2jLg3RTWh1y6Fp8myb+rbl+o4+tS6Ex9DBwk5yjAAmHePf7AqMWY7qNy?=
 =?us-ascii?Q?fFg5k3WFMRZyOM7uajFCx4qv9qi+ZjReWDxPXc5eaLz2z3p1Cmw1uIQ+4goU?=
 =?us-ascii?Q?UelsJDbIisAJYNe9smMMG5qq6DpgSDa3ZC5yGeSlcX/7UfS7cCCSXuVAJT7y?=
 =?us-ascii?Q?uUPs3B9Wx3USLz9QJar2bPjSnH0aBjokQ8+nQOSyjtd8JQy/7tzUz3oK/PVD?=
 =?us-ascii?Q?JAmE+XXBlhFzNBT+BsJSI8lANw37o+VaUMOV7NxuzNc6aPOfqHpOsw+W6yh6?=
 =?us-ascii?Q?ZbsDNTmwNIQdKxdVffWBN/BtpFOZfzlYD6dwa5G2BdUAQuUImosjPIW56UIX?=
 =?us-ascii?Q?xC5IY8sdk6ncdyFy/dDOCuXXsn7i7xNQP5cETJyXrfri8MwxxqGPqi8GKRdT?=
 =?us-ascii?Q?1FWuBUw4Mm2S6PmFrDvgu2uvN70CTsx/hlJAmSJaCsmY6aFFm4xP2INb9rgR?=
 =?us-ascii?Q?A/NJfdduM0gifKV1S5XU/pqttYg5vd5QBBgUvkX7ckN8e5YvBGvJ33ZAr5Q6?=
 =?us-ascii?Q?i+G9wEXieTMhGz1rv7UFefNppNquz1/YF3OmEa7Qcmc+azf+5N8L455TyYLI?=
 =?us-ascii?Q?lWuY/hs=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 14:05:21.0119
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cac452d3-b6cf-4be0-234f-08dce9349408
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9028

After the regions have been created, now we enable the MPU. For this we disable
the background region so that the new memory map created for the regions take
effect. Also, we treat all RW regions as non executable and the data cache is
enabled.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from :-

v2 - 1. Extracted from the previous patch into a new one.

2. Disabled background region.

 xen/arch/arm/arm64/mpu/head.S                | 29 ++++++++++++++++++--
 xen/arch/arm/include/asm/arm64/mpu/sysregs.h |  3 ++
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/head.S
index 4a21bc815c..e354f4552b 100644
--- a/xen/arch/arm/arm64/mpu/head.S
+++ b/xen/arch/arm/arm64/mpu/head.S
@@ -61,6 +61,30 @@
     add \xb, \xb, x20       /* x20 - Phys offset */
 .endm
 
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
+    dsb   sy
+    msr   SCTLR_EL2, x0
+    isb
+
+    ret
+END(enable_mpu)
+
 /*
  * Maps the various sections of Xen (described in xen.lds.S) as different MPU
  * regions.
@@ -68,10 +92,11 @@
  * Inputs:
  *   lr : Address to return to.
  *
- * Clobbers x0 - x5
+ * Clobbers x0 - x6
  *
  */
 FUNC(enable_boot_cpu_mm)
+    mov   x6, lr
 
     /* Check if the number of regions exceeded the count specified in MPUIR_EL2 */
     mrs   x5, MPUIR_EL2
@@ -113,7 +138,7 @@ FUNC(enable_boot_cpu_mm)
     beq 5f
     prepare_xen_region x0, x1, x2, x3, x4, x5
 
-5:
+5:  mov   lr, x6
     ret
 
 fail:
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


