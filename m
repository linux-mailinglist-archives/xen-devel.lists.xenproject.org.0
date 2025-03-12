Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBC7A5DA4E
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 11:16:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910190.1316960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsJ8s-0002KO-8E; Wed, 12 Mar 2025 10:16:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910190.1316960; Wed, 12 Mar 2025 10:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsJ8s-0002IK-4L; Wed, 12 Mar 2025 10:16:50 +0000
Received: by outflank-mailman (input) for mailman id 910190;
 Wed, 12 Mar 2025 10:16:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qnRX=V7=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tsJ8q-0001og-Qe
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 10:16:48 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20606.outbound.protection.outlook.com
 [2a01:111:f403:2416::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19de634c-ff2b-11ef-9898-31a8f345e629;
 Wed, 12 Mar 2025 11:16:47 +0100 (CET)
Received: from BN0PR04CA0055.namprd04.prod.outlook.com (2603:10b6:408:e8::30)
 by IA0PR12MB8327.namprd12.prod.outlook.com (2603:10b6:208:40e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 10:16:39 +0000
Received: from BN2PEPF00004FBC.namprd04.prod.outlook.com (2603:10b6:408:e8::4)
 by BN0PR04CA0055.outlook.office365.com (2603:10b6:408:e8::30) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.24
 via Frontend Transport; Wed, 12 Mar 2025 10:16:39 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF00004FBC.mail.protection.outlook.com (10.167.243.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 12 Mar 2025 10:16:39 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 12 Mar
 2025 05:16:39 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 12 Mar
 2025 05:16:37 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 12 Mar 2025 05:16:37 -0500
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
X-Inumbo-ID: 19de634c-ff2b-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AZVlbqaZRHIe2HX9qmfyOS3Pv2Myw1T1wFLaHU29BZGKchrEzBiqCypoRRaufBgXhdz/VcM4vJLwIud5PgA9uAcC63C5NDV3eTPGIajCYKHIg8t6Ws32de+i753iJovWMJZlOcg3SPBznZebPobLnbj1Vte5J9aZXco/UaKOgy46CtRXLR6C/SgfAiF8hJkwjHyUil/FCoIAkWxioeR+vroU6RYpofPC8ipBLhvCdLKO3D5ALhkP1+a0Uc/80D+3zAa8VpMAYz4LJI+izkecM7ok8wxedkt8e+j9uq+w24ewrIXl+RIBOTxINOdlfQl+aaKtE+uSGnUQbqHVzLicDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUiS3X87wUIiGTOtmKRB+99hMbj0GPrZMJMfpdLxn9M=;
 b=C4yMcSa9VjCvLDdK1yQCY6gePksGMDLjzuosl5lEqEz/LXQd3oPTZ9jlljdX3KrwdCRBep+iCqc8I+5Ye2RmPwDJK0NxkdBeoOJYJEBLknjVoYmvN3MUNP/gTgBSxQIKxzDJ6ixBT1UQy2E7J4ZPoMpbhJ8dFryG3Re2x9N8vsWt0Wqc4AAWiT+nBBcX963rb3bIBfBMrUeFRvThMPiZyHNCQvc06/DWX4hhT+TBUTBINzHlZfDq3TG+JHdPotXz5oBSEtc6QIqJ8gl/zi22JJhEtOSX6FXqo9xXbkfANpn50I3qspqd55HePIQpnwnsZ0CYsLlRzmi2FjjGqyS4gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUiS3X87wUIiGTOtmKRB+99hMbj0GPrZMJMfpdLxn9M=;
 b=NbfUNrjJbpC54ZKk/SZgX9+dCxuJi4EGfNuIiOKw22zt3MftgI8nAVsEWsHYWjuuvFtzIXZHFtQ9CyDzdFn+6CYI84fwwbRuSpxc6svJFiUj1U6EyW88uOZE47J7Ryx1lU/b5wutzleX0+ejpTc0bV5LaHbLXy/fhRpWF1DQVMg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 1/2] xen/arm: Improve handling of nr_spis
Date: Wed, 12 Mar 2025 11:16:18 +0100
Message-ID: <20250312101619.327391-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250312101619.327391-1-michal.orzel@amd.com>
References: <20250312101619.327391-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBC:EE_|IA0PR12MB8327:EE_
X-MS-Office365-Filtering-Correlation-Id: 85778e11-a4f2-48e7-960c-08dd614efa76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IcUiYJIPyS+n/scqOSb9EQKGf428U+QBvksKUJxITB30m6bJXf0NK6gAaQIB?=
 =?us-ascii?Q?413yJB6usWZ4jLjxlyRCmHtAS/dhFwu8HgK75mo9l2XFcemGmvqq9z/nNAGb?=
 =?us-ascii?Q?MTc7u0/XPivKROk0abUm81CAIGzhwWZo1x22o22q47lofaeV1gmKGx1KDQJp?=
 =?us-ascii?Q?bb5CnWuWEi5jIWXBkYNqIS5sICWoUpAvGrS8QX87bDSa9bzqUj1mj2/i0g/A?=
 =?us-ascii?Q?pHdwMX0D/22+TxatE6ZxDxS39OVCgkaakagxj/knr0gt24LQBUf7qQ9iL5nx?=
 =?us-ascii?Q?e34P8oYNn1zL2NlN5mq4nzUh/X+i04VOq1IeTyNCM61Wdr2OQ/1+VVQnZmJg?=
 =?us-ascii?Q?VgL3vvcrupwHhhgZANYskXWXtLx/ntEaxLtn7pYYKfTyrq7gYkU5PtM3x7Hn?=
 =?us-ascii?Q?K41p0wTMrwBZtpV4ZfGMwjbLtyzMsrpDlIAq8y5lBjsFeZBT/jITVEQ9ImNX?=
 =?us-ascii?Q?1jpDpq0AOuzywimeRyImYmnpAhNfj/RwpgzE/0abgYHBjznp8wMV88unyfNs?=
 =?us-ascii?Q?9uc1nlpL3Nc/5lfDLvb9RlbCQKheaLmfZ0366wyrn/JTzBOL01GIDjlorYSM?=
 =?us-ascii?Q?fv64EbyrnRNtM7FWDx2qHSgVvkhDYkOQr73aGg5o/UT9WG/G3QZKRZ1HGEgs?=
 =?us-ascii?Q?HSM5GPYAVMc0Vd2G+ZXMu2tX+gTbtq0wGrBaS3q9+64cfzmHM115dZb1AUQ+?=
 =?us-ascii?Q?VkKnR3Wi1PfPC3WkBwAECwfudPGLYNkXe2ARux6uIWhPseT339CffvTB+GED?=
 =?us-ascii?Q?60BvQIqASrOA/m7uuybK2ykZrlIFKmShFHQ1pj8Lo490f/yGDSPXaCf7mIht?=
 =?us-ascii?Q?GVeG1Mzs+nV77gsrazNunSw945xwzFQKAmhNq/EIbAz/tZG0xce0sCLokkeB?=
 =?us-ascii?Q?QWIqG+LzfvUIXf7YD66wbs8HDk8p1zrufj0D432Wuq7Q9+aOvnDdX6wQwfl7?=
 =?us-ascii?Q?DY7jaFQI4Jfn+NQrAJur09ZpQnyzgNsAPGgA7XZSDE0cA7Q5EYFVZMGRNwed?=
 =?us-ascii?Q?SRSDfAUaqbgOiiRzeIEsULsgWwhU9GwAeDxpOK6lYKGlPlaRxFrG6R2/EXBm?=
 =?us-ascii?Q?Vghd0QMLxgP0z3LaN3cRLhs/goxeOIHxRjlmwBTRFwnemK00GD4jMwco11x9?=
 =?us-ascii?Q?WEW9uQI2bi0ennwzHEIS6K5JxUVmAYc/+oMpLCjclP2CGO7B8+KGYY3dUREI?=
 =?us-ascii?Q?Y62cBy4tuIS1KZvhYisfhqKMR3HJtvpVCuS9Py4Uc5MoSF4zSrx8Bih4L8MD?=
 =?us-ascii?Q?U/aQCZG/6EC+HN4SSREsBD1G8rcknWERBw/cLAhWmQAavvBwZXbShhPc0lpe?=
 =?us-ascii?Q?7SU1dpETHxMGtko9hdYQLQCYUCv66wosMmWqMkrfWhvnQo4w1lvhiWDcypDL?=
 =?us-ascii?Q?PD68Dp1x4tR0p42Bb7qoFqyJSY2glnLLjVVwjEEDaGW33L0Pqe2a3+yW2OkP?=
 =?us-ascii?Q?mu94QwctetMqShUgVwLM7sRl/f1G1+Uy9dMjyQWOiML0ZfDG6rQRPkk67tGN?=
 =?us-ascii?Q?tXK34PgDnaOiwvc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 10:16:39.3272
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85778e11-a4f2-48e7-960c-08dd614efa76
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8327

At the moment, we print a warning about max number of IRQs supported by
GIC bigger than vGIC only for hardware domain. This check is not hwdom
special, and should be made common. Also, in case of user not specifying
nr_spis for dom0less domUs, we should take into account max number of
IRQs supported by vGIC if it's smaller than for GIC.

Introduce VGIC_MAX_IRQS macro and use it instead of hardcoded 992 value.
Introduce VGIC_DEF_NR_SPIS macro to store the default number of vGIC SPIs.
Fix calculation of nr_spis for dom0less domUs and make the GIC/vGIC max
IRQs comparison common.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
 - add macro for: min(gic_number_lines(), VGIC_MAX_IRQS) - 32
---
 xen/arch/arm/dom0less-build.c   | 2 +-
 xen/arch/arm/domain_build.c     | 8 +-------
 xen/arch/arm/gic.c              | 3 +++
 xen/arch/arm/include/asm/vgic.h | 6 ++++++
 4 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 31f31c38da3f..573b0d25ae41 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -1018,7 +1018,7 @@ void __init create_domUs(void)
         {
             int vpl011_virq = GUEST_VPL011_SPI;
 
-            d_cfg.arch.nr_spis = gic_number_lines() - 32;
+            d_cfg.arch.nr_spis = VGIC_DEF_NR_SPIS;
 
             /*
              * The VPL011 virq is GUEST_VPL011_SPI, unless direct-map is
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 7cc141ef75e9..2b5b4331834f 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2371,13 +2371,7 @@ void __init create_dom0(void)
 
     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
     dom0_cfg.arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
-    /*
-     * Xen vGIC supports a maximum of 992 interrupt lines.
-     * 32 are substracted to cover local IRQs.
-     */
-    dom0_cfg.arch.nr_spis = min(gic_number_lines(), (unsigned int) 992) - 32;
-    if ( gic_number_lines() > 992 )
-        printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded.\n");
+    dom0_cfg.arch.nr_spis = VGIC_DEF_NR_SPIS;
     dom0_cfg.arch.tee_type = tee_get_type();
     dom0_cfg.max_vcpus = dom0_max_vcpus();
 
diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index acf61a4de373..e80fe0ca2421 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -251,6 +251,9 @@ void __init gic_init(void)
         panic("Failed to initialize the GIC drivers\n");
     /* Clear LR mask for cpu0 */
     clear_cpu_lr_mask();
+
+    if ( gic_number_lines() > VGIC_MAX_IRQS )
+        printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded\n");
 }
 
 void send_SGI_mask(const cpumask_t *cpumask, enum gic_sgi sgi)
diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgic.h
index e309dca1ad01..35c0c6a8b0b0 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -329,6 +329,12 @@ extern void vgic_check_inflight_irqs_pending(struct vcpu *v,
  */
 #define vgic_num_irqs(d)        ((d)->arch.vgic.nr_spis + 32)
 
+/* Maximum number of IRQs supported by vGIC */
+#define VGIC_MAX_IRQS 992U
+
+/* Default number of vGIC SPIs. 32 are substracted to cover local IRQs. */
+#define VGIC_DEF_NR_SPIS (min(gic_number_lines(), VGIC_MAX_IRQS) - 32)
+
 /*
  * Allocate a guest VIRQ
  *  - spi == 0 => allocate a PPI. It will be the same on every vCPU
-- 
2.25.1


