Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 644C6A5BB99
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 10:04:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907438.1314694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trvXM-0001JA-Md; Tue, 11 Mar 2025 09:04:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907438.1314694; Tue, 11 Mar 2025 09:04:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trvXM-0001Gu-J3; Tue, 11 Mar 2025 09:04:32 +0000
Received: by outflank-mailman (input) for mailman id 907438;
 Tue, 11 Mar 2025 09:04:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5FZT=V6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1trvXK-0000nU-HI
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 09:04:30 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20604.outbound.protection.outlook.com
 [2a01:111:f403:240a::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d59ffdf0-fe57-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 10:04:28 +0100 (CET)
Received: from BY3PR03CA0018.namprd03.prod.outlook.com (2603:10b6:a03:39a::23)
 by BL1PR12MB5851.namprd12.prod.outlook.com (2603:10b6:208:396::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 09:04:24 +0000
Received: from SJ1PEPF0000231E.namprd03.prod.outlook.com
 (2603:10b6:a03:39a:cafe::9a) by BY3PR03CA0018.outlook.office365.com
 (2603:10b6:a03:39a::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.27 via Frontend Transport; Tue,
 11 Mar 2025 09:04:24 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231E.mail.protection.outlook.com (10.167.242.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Tue, 11 Mar 2025 09:04:23 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 11 Mar
 2025 04:04:18 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 11 Mar 2025 04:04:17 -0500
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
X-Inumbo-ID: d59ffdf0-fe57-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ApwisKWEWA/kDPsohgQvyPNJvq3+aF8oML3GPR7pj5Tsh3mp/kquWGwdP+qteNqqJUIdpS0M1KO+CAK8AK0czhJdiPzPh5s47ar44zIa1hCRVYjPL2rDWyo4pY5n2HRlHYuEhBOqTKzAWusM8LQyz3hGWD8ImaLMkKkPbeAEMDfEogVXG09iXAUby2O5wPY3Lopr6Cx+CInzgcHERtCTeLrjYAR9T9Yya98Asrx45wQqLWBH40hYQ6sdl7uTE1lA2z4Vurbma9i+7u8BN+t4XZ5G/18LXnjYT219dIFGUVbwpTMzCKd4QRxTeByjGoKFNXpa2iSitgp6hEw7a+gIuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=09ybYecYRoOEzAvj3BYdvry8lchrGyNnjUK7uSVH+5I=;
 b=MgCYOhDP2Hsa5IZKEzRMMLdnIqLKZgU0z1ULRE3ynoKOA82KglymesijSBwE/YpzxejBWA3sJGdWOP6ha0cAf1wD6D6StuIWSaeRT8HMw4AvzTKhg5t1U3i2k9KkL+Cp4n2fH9Wv75thIezNv1BGbGALvZq6AqQK2lGNaevz4CoM28JSwz06D7M8qu1tA1YFqYEv51Xcwkr2Qwi0p6H3DY5vnNZ0oy3WRETu2jzoF9TLFXIYU4LK6n0NvaS9CJCWhc6WjzLnQGRlmHmM3UtStm3a4b4rDldgmBO5AkUQ+GUagghV3VsONxsfWpuMymRzkQfOhVVC/SKsTm1c91zhyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=09ybYecYRoOEzAvj3BYdvry8lchrGyNnjUK7uSVH+5I=;
 b=dfqjPDKbGsyiu4DQGFXtcNbqwLcCju1XEWkCK2wSURgPwgAAwDqAwdOufv1rbmqpVGIKwBjHWm1yTVmcZQO4MigPpVBllrRV+iqeo621C/p1mh+Nb4jH3VTLOKarsUtqQypHsdk6kk/s7+yav/KQxUiA5IH+bdpMHmieoSPMJiU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/2] xen/arm: Improve handling of nr_spis
Date: Tue, 11 Mar 2025 10:04:08 +0100
Message-ID: <20250311090409.122577-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250311090409.122577-1-michal.orzel@amd.com>
References: <20250311090409.122577-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231E:EE_|BL1PR12MB5851:EE_
X-MS-Office365-Filtering-Correlation-Id: 54dcec8f-d655-465e-8c0c-08dd607bb7cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GDXvmGubcQy3cxVIm1WFwouJwJ3lFV74KGPtYVhF1Wsol7vvD5XOoCt5qdmg?=
 =?us-ascii?Q?8e88jN3NDj9vSpIOdfRvLVGgbnMz0Hg4aQOFYQoflPe+t73ux0n7qWUDiKkn?=
 =?us-ascii?Q?ydr8q0Kks0DG2/+nvkjXgx7NZC/2GlmXUkLvZ8mD8wRmvZr7nOE9UNmBINkp?=
 =?us-ascii?Q?fgJrtYrzfeK8h8YJfI+zPxt8XXEK9SNGXy9UfcdB/yIdENgGBKq92JjHHkle?=
 =?us-ascii?Q?iiCMEAf8wLkVP8NzVA+pTdFDKnmKU8RAadqgCRy0aZyZesyFZjZrInJ2wiFx?=
 =?us-ascii?Q?B4qOuYL8YSjgRx/Avvh5Vp0toRxiFSQsDfGCwApRAOjALBPZLwbttf7unRur?=
 =?us-ascii?Q?vPc96vmAuCpTzRqaCBmghYz4tdStruvXfKByZ76dm/vqVQ9bJ3o8JHOsRucH?=
 =?us-ascii?Q?ocJyUNcVa+NAuoScOrPaNPR0BqiUvdxc31W+i6NM4h6Zbwo8ZO+6/SDLuRnR?=
 =?us-ascii?Q?9Fuwro2VvLEp7rBnFhlD0KhpP6H86WOHQDqgnSL4o7r+td6xoXcbwJleD0A6?=
 =?us-ascii?Q?zZxi4aBC9eQbRHMarNzYo3qFDOiy2+9S6teHEMfMlxAsjpTVQgYSxmST6Kgf?=
 =?us-ascii?Q?VphaBfCcuYTkgvANMofM1AgWtUboWzUR6r+xIWGVugZmjEm9PoobtEGB+JSE?=
 =?us-ascii?Q?UTrJHrfaCdR4th8a8O51JnclVlRsvgdOIBDg95PY43uCUq0DUM9fpJ+8JMgN?=
 =?us-ascii?Q?zmcHJUVtEQ09f4Uv7yo0pxtA9PbKjpUuwL1gP41fcpRAIDswRrLDlmiWNMj1?=
 =?us-ascii?Q?2J2++4Ufic4KdRHhXMGBBcAVcU8Yl7L66OKvQrhQFQhKzbyatoHO2AmTr7Ai?=
 =?us-ascii?Q?D/QG3pFjCUhQwn0Aljn3dliMHRyucBiRuqUm1KJ6vI+RXn/+hB8aI9sWIpul?=
 =?us-ascii?Q?3Cdt7MN//3vEzbZzAxtAwj3lSli5mUCo3rhGUkOJxCfFVmk1se0k2FWbo2n0?=
 =?us-ascii?Q?4ADaTRB4rqQrqNqiqSJxFEr82LHzHmIVd2ahJ07TGIbiE0NI3cZx94R40pHI?=
 =?us-ascii?Q?HPxpLoP70yvQcEdFy4eYn2G3eD1FptJ5r2uINvHlAxFwxYFIGG54OQyLxEPg?=
 =?us-ascii?Q?gW7t1c+n23ZEPEfC1nOCwmjwad9bVEV/27vc1BWX0IawZ9EKhtPhG5xiMWWz?=
 =?us-ascii?Q?uRQIM3E1uhaLUQtMHdoQJSdRjKWm6g4PJwX/yRnjmBSfciWoByHa2N92IwMS?=
 =?us-ascii?Q?xlJjR1NJwj0qxrXM0AW9YjUcrDsK1cJKagp7KjwhpRKJu4vLHStUj9g1oVQ+?=
 =?us-ascii?Q?f/V0JyRTOjITLwj9CbEYnRiGmhhi+GL3bIoY3291pE5mpCjFbHw4SZx4CMyM?=
 =?us-ascii?Q?O6gBerJR5pygyxm5mjg7heNpCDR66n5MaPcvEbXXYkn/WS5l1ECNwX2NZIl/?=
 =?us-ascii?Q?KNHIA2T7JLNLn5+hHPM77sTB1N1ZWpXTM2y8eCdWdQr9rwa62DlaDScZdR76?=
 =?us-ascii?Q?jNjOnr2Jik/BJBizoVDNmIjhiJGQzhUkRkG4xLVbtgYVvSD7YsehrjgCGZRU?=
 =?us-ascii?Q?KInpIQaFslTCXrY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 09:04:23.5730
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54dcec8f-d655-465e-8c0c-08dd607bb7cb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5851

At the moment, we print a warning about max number of IRQs supported by
GIC bigger than vGIC only for hardware domain. This check is not hwdom
special, and should be made common. Also, in case of user not specifying
nr_spis for dom0less domUs, we should take into account max number of
IRQs supported by vGIC if it's smaller than for GIC.

Introduce VGIC_MAX_IRQS macro and use it instead of hardcoded 992 value.
Fix calculation of nr_spis for dom0less domUs and make the GIC/vGIC max
IRQs comparison common.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/dom0less-build.c   | 2 +-
 xen/arch/arm/domain_build.c     | 9 ++-------
 xen/arch/arm/gic.c              | 3 +++
 xen/arch/arm/include/asm/vgic.h | 3 +++
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 31f31c38da3f..9a84fee94119 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -1018,7 +1018,7 @@ void __init create_domUs(void)
         {
             int vpl011_virq = GUEST_VPL011_SPI;
 
-            d_cfg.arch.nr_spis = gic_number_lines() - 32;
+            d_cfg.arch.nr_spis = min(gic_number_lines(), VGIC_MAX_IRQS) - 32;
 
             /*
              * The VPL011 virq is GUEST_VPL011_SPI, unless direct-map is
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 7cc141ef75e9..b99c4e3a69bf 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2371,13 +2371,8 @@ void __init create_dom0(void)
 
     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
     dom0_cfg.arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
-    /*
-     * Xen vGIC supports a maximum of 992 interrupt lines.
-     * 32 are substracted to cover local IRQs.
-     */
-    dom0_cfg.arch.nr_spis = min(gic_number_lines(), (unsigned int) 992) - 32;
-    if ( gic_number_lines() > 992 )
-        printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded.\n");
+    /* 32 are substracted to cover local IRQs */
+    dom0_cfg.arch.nr_spis = min(gic_number_lines(), VGIC_MAX_IRQS) - 32;
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
index e309dca1ad01..c549e5840bfa 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -329,6 +329,9 @@ extern void vgic_check_inflight_irqs_pending(struct vcpu *v,
  */
 #define vgic_num_irqs(d)        ((d)->arch.vgic.nr_spis + 32)
 
+/* Maximum number of IRQs supported by vGIC */
+#define VGIC_MAX_IRQS 992U
+
 /*
  * Allocate a guest VIRQ
  *  - spi == 0 => allocate a PPI. It will be the same on every vCPU
-- 
2.25.1


