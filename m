Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD8094BD00
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 14:10:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773965.1184482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc1xt-0001SJ-Mn; Thu, 08 Aug 2024 12:09:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773965.1184482; Thu, 08 Aug 2024 12:09:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc1xt-0001Qh-IN; Thu, 08 Aug 2024 12:09:57 +0000
Received: by outflank-mailman (input) for mailman id 773965;
 Thu, 08 Aug 2024 12:09:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eqo7=PH=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sc1xs-0001Bl-30
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 12:09:56 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20620.outbound.protection.outlook.com
 [2a01:111:f403:2414::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1eb32eab-557f-11ef-8776-851b0ebba9a2;
 Thu, 08 Aug 2024 14:09:54 +0200 (CEST)
Received: from MW4PR04CA0130.namprd04.prod.outlook.com (2603:10b6:303:84::15)
 by MN2PR12MB4469.namprd12.prod.outlook.com (2603:10b6:208:268::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.15; Thu, 8 Aug
 2024 12:09:48 +0000
Received: from CO1PEPF000042AA.namprd03.prod.outlook.com
 (2603:10b6:303:84:cafe::1b) by MW4PR04CA0130.outlook.office365.com
 (2603:10b6:303:84::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.15 via Frontend
 Transport; Thu, 8 Aug 2024 12:09:48 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042AA.mail.protection.outlook.com (10.167.243.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 8 Aug 2024 12:09:47 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 Aug
 2024 07:09:45 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Thu, 8 Aug 2024 07:09:44 -0500
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
X-Inumbo-ID: 1eb32eab-557f-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r45nxc5ioOZfh+axUX0eSv5kIqMvcqbSZMOJtkKbx5eH/lehbCQQaMeXTMuhSGZyOIDrXT6fE4DvcYAuPJHpmgt3bPWC99XAocT9cjUJrTuSaDQl6hetXXDKDTJ32rhRBg34nWvLrDcUjBwQXcFWZMJq6WOGG0io9M+cYJt8B+tjV4IIXM1N4xJXRecdQmUr4pF0CWfDBb+fUcxY0fnPoK9zn5dLZTCYPquA+wERigOWm3A59n2AncoaQ352FenJL31nlfs9M5gakS/Z+2SUMDJUfw64XsEet7bt9gmVzhj5uSBts0/Ew5egpbPd94nH2gd/5kEGOgnFSd/IaCv/bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BwnutoGseyOzPvX5xpU7euJ358TBpCesIKsrFcbDnqU=;
 b=ugiShT6dDzYiTlOynD3opqKpHmCuXow995k/4PbLHW+QbhWYGHQxMwcRKSvq80ylVEQnnzkfAxcOCYnKlkSMD9QaY4DxjT7FSKp02OeS6d0ZDt+XSTKLGXJfqVYBU8bWLaqTmobVeJvepdYY+xwcK/Hfzl5JdG47sMekWIzQ+nO7jehGPH2fwk/3puRbqzN4a3mXOeEM6WoDZsW8KZOwxWPCS651nGLp+2hib1b7OIrDwaBXmOix4LJ+RbgWSWJtlYCoZPpq7neNaH6LUY56WXKlwawGLBqMboGBvNod0H7nWqEc1sGfty548UmfJaLP8aHp1Hi+NkJQkGVRitDxDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BwnutoGseyOzPvX5xpU7euJ358TBpCesIKsrFcbDnqU=;
 b=syPB84+sX6kqZLMHisPRl9eo+E3JxK2hol2sw2rqvjn5XAA2Ng6Fcde+5lWl4YQxNtG055Zu+UrJK2An1ik33CH4rv34th9smBfB1pmdW1RS1UkN0vH3dgAAkKbx9D8Td4dSUV82BWT9mqTfHMrw68gPo/qNTDqNcdvnihpzw38=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <sstabellini@kernel.org>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <ayan.kumar.halder@amd.com>,
	<Volodymyr_Babchuk@epam.com>, <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, Penny Zheng <penny.zheng@arm.com>, "Wei
 Chen" <wei.chen@arm.com>
Subject: [PATCH v2 2/4] xen: arm: make VMAP only support in MMU system
Date: Thu, 8 Aug 2024 13:09:34 +0100
Message-ID: <20240808120936.3299937-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240808120936.3299937-1-ayan.kumar.halder@amd.com>
References: <20240808120936.3299937-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AA:EE_|MN2PR12MB4469:EE_
X-MS-Office365-Filtering-Correlation-Id: bbe88be2-003a-4d26-2cc1-08dcb7a2ffb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Lc7ottl+1M2zg0f2LDpRfZmm711mqvS07oMMJjEjb9ygofS9Fpsm9knnJW83?=
 =?us-ascii?Q?huobFhSyaTujCPWzs4J5Gm/gg2zL6d+eqEZqHX2EH+rvwtcT1m3YngM301fw?=
 =?us-ascii?Q?a637cHm4egl+MR9g5eOjvRneXWSWMATLM9vJnBNrZeYEER27iyUvhhIXbFiM?=
 =?us-ascii?Q?hFq8JDP688CCDfow4GlSjJoYjCWbWShbv5m+4Lr1Iojyb5W3vSOHWdBtaaTO?=
 =?us-ascii?Q?A445dYyUzQtgWCGoDbmlDBlmOohCLaKUfBOvTj2uLQe1Ikzk5eDgqjbYCyKJ?=
 =?us-ascii?Q?AjT63sSifoANOyBb0fxn/2xZnMxP2y+fTjsYPUNlwxPyVW0YHL5WOZNHSKzS?=
 =?us-ascii?Q?CkVefcZFjuof6HKjio60ftcxL0fnbv/9Vs7XbIlAvS+JMQcOOXYHGxIek13s?=
 =?us-ascii?Q?enRadHUj9SnSRipk39ujUIwVp4lQc4HDgzvHozNrbOSUx+7acQa50CnTXo5b?=
 =?us-ascii?Q?ZtuvMKfZ7YtxjS9tgjKdjHS+SB0jmUDQ8OGPxvA4TiJBuK/78mtKAuSm4qrz?=
 =?us-ascii?Q?LZcdXaWbbRvUDH56MMeW0XEI3W8x2v9ORy3wnZfFGrYbU1KB7WJ9WfLIMxbJ?=
 =?us-ascii?Q?0MA0TOOMNkr9CysdGjSnjekPd9lDqWS81Rk37DfvQRTgogV+p4HWP/DmkmBE?=
 =?us-ascii?Q?XH9WnmSbPEsR8LzBboS5IL07L6uIhcuvrMKKIFhs5zpTA5PyOzmmNKMGzLQc?=
 =?us-ascii?Q?dggUjROLD5BcT+mEIBxV0+HldhYzXfo9fl+KOFalDYx1+VfpcHCovk6hwwsj?=
 =?us-ascii?Q?7qDrxRAYZajtwzONHavs2gEXFOCbU/bS1te+b4/RedYm1Nfrf7IApOJPg/9n?=
 =?us-ascii?Q?SzARhGjBNYxJ+Tq3nWWk/F8SknpFWzK9mLamuRH6pAL22b87Xtt9kNiOzSds?=
 =?us-ascii?Q?mmWiUDhokIUGcpZPiVqtzfyAWZcNd3oZiXv9RXuWfVnrD046qZSHat33Ry25?=
 =?us-ascii?Q?rzazvgDTeOHS3tas7l3VOfiRIHZAUcODNoh47Gpn4SwZIMbC9D2jJ/gdwXej?=
 =?us-ascii?Q?e1P8VgmB9tKvaCAS2duXCWw5qlFZlDNY/Pg0zwfBlgTffR8xLdLFTfGe/ICu?=
 =?us-ascii?Q?pJcVpZMVI7NNSyyFaH1SwiRZ8oOdMWKogkuMQN+ONghW9J5SCMWBWGjI8eYd?=
 =?us-ascii?Q?gbQ2SYB2gw/m2yYDxlVbkDPmj6rgCRpdLNgoQ151x9AYzQIoshoyUWnhrHKp?=
 =?us-ascii?Q?BXNRRGF0Jb08e4wCkI/dVCRpoVHw0LVhv4lXdzRRA3brYO4I0ZnO3vnRDqq5?=
 =?us-ascii?Q?84fgZAJJnHOw67O+xrzMulZt6yx09qDON0Aw6umV8kfSB8mO619QQhh0v78F?=
 =?us-ascii?Q?brH3vGqYaIKrooAQncsfnF6wtW++2SfQnMftdrzoupx1s7Xxppuci++p/+d5?=
 =?us-ascii?Q?EFZXqDYBJ/IBrMAjUHlCF+61rUoa?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 12:09:47.3953
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbe88be2-003a-4d26-2cc1-08dcb7a2ffb7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4469

From: Penny Zheng <penny.zheng@arm.com>

VMAP is widely used in ALTERNATIVE feature to remap a range of memory
with new memory attributes. Since this is highly dependent on virtual
address translation, we choose to fold VMAP in MMU system.

In this patch, we introduce a new Kconfig CONFIG_HAS_VMAP, and make it
only support in MMU system on ARM architecture. And ALTERNATIVE now
depend on VMAP.

HARDEN_BRANCH_PREDICTOR is now gated on HAS_VMAP as speculative
attacks are not possible on non MMU based systems (ie Cortex-R52, R82).
See https://developer.arm.com/Arm%20Security%20Center/Speculative%20Processor%20Vulnerability.

Split "https://patchwork.kernel.org/project/xen-devel/patch/20230626033443.2943270-16-Penny.Zheng@arm.com/"
into Arm specific

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from :-

v1 - 1. HARDEN_BRANCH_PREDICTOR is now gated on HAS_VMAP.
2. cpuerrata.c is not gated on HAS_VMAP.

 xen/arch/arm/Kconfig   | 7 ++++++-
 xen/arch/arm/setup.c   | 2 ++
 xen/include/xen/vmap.h | 2 ++
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 21d03d9f44..7d1dde89d7 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -12,7 +12,7 @@ config ARM_64
 config ARM
 	def_bool y
 	select FUNCTION_ALIGNMENT_4B
-	select HAS_ALTERNATIVE
+	select HAS_ALTERNATIVE if HAS_VMAP
 	select HAS_DEVICE_TREE
 	select HAS_PASSTHROUGH
 	select HAS_UBSAN
@@ -58,9 +58,13 @@ config PADDR_BITS
 	default 40 if ARM_PA_BITS_40
 	default 48 if ARM_64
 
+config HAS_VMAP
+	def_bool y
+
 config MMU
 	def_bool y
 	select HAS_PMAP
+	select HAS_VMAP
 
 source "arch/Kconfig"
 
@@ -171,6 +175,7 @@ config ARM_SSBD
 
 config HARDEN_BRANCH_PREDICTOR
 	bool "Harden the branch predictor against aliasing attacks" if EXPERT
+	depends on HAS_VMAP
 	default y
 	help
 	  Speculation attacks against some high-performance processors rely on
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index cb2c0a16b8..7f686d2cca 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -447,7 +447,9 @@ void asmlinkage __init start_xen(unsigned long boot_phys_offset,
      * It needs to be called after do_initcalls to be able to use
      * stop_machine (tasklets initialized via an initcall).
      */
+#ifdef CONFIG_HAS_ALTERNATIVE
     apply_alternatives_all();
+#endif
     enable_errata_workarounds();
     enable_cpu_features();
 
diff --git a/xen/include/xen/vmap.h b/xen/include/xen/vmap.h
index fdae37e950..4c7dfe58ba 100644
--- a/xen/include/xen/vmap.h
+++ b/xen/include/xen/vmap.h
@@ -141,7 +141,9 @@ void *arch_vmap_virt_end(void);
 /* Initialises the VMAP_DEFAULT virtual range */
 static inline void vm_init(void)
 {
+#ifdef CONFIG_MMU
     vm_init_type(VMAP_DEFAULT, (void *)VMAP_VIRT_START, arch_vmap_virt_end());
+#endif
 }
 
 #endif /* __XEN_VMAP_H__ */
-- 
2.25.1


