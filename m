Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E52E4959BB6
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2024 14:25:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781073.1190658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgkOy-0005EL-Nz; Wed, 21 Aug 2024 12:25:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781073.1190658; Wed, 21 Aug 2024 12:25:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgkOy-0005BY-K8; Wed, 21 Aug 2024 12:25:24 +0000
Received: by outflank-mailman (input) for mailman id 781073;
 Wed, 21 Aug 2024 12:25:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rYNs=PU=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sgkOx-0004fH-Oq
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2024 12:25:23 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20628.outbound.protection.outlook.com
 [2a01:111:f400:7e88::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f4047e3-5fb8-11ef-8776-851b0ebba9a2;
 Wed, 21 Aug 2024 14:25:21 +0200 (CEST)
Received: from PH0PR07CA0056.namprd07.prod.outlook.com (2603:10b6:510:e::31)
 by CY8PR12MB7339.namprd12.prod.outlook.com (2603:10b6:930:51::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Wed, 21 Aug
 2024 12:25:17 +0000
Received: from SN1PEPF000397B2.namprd05.prod.outlook.com
 (2603:10b6:510:e:cafe::d9) by PH0PR07CA0056.outlook.office365.com
 (2603:10b6:510:e::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18 via Frontend
 Transport; Wed, 21 Aug 2024 12:25:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B2.mail.protection.outlook.com (10.167.248.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Wed, 21 Aug 2024 12:25:16 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 Aug
 2024 07:25:15 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Wed, 21 Aug 2024 07:25:14 -0500
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
X-Inumbo-ID: 6f4047e3-5fb8-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IWeuRlLocCcW8HkYdDAT8p5OjKUHL7npZw/0nOlKhGOFFkxzy96OgG3K3LrR281Th9WHzMezlznY/zWCRqPeEI9I6N0GkVsdNcokpuYwxCISWwtZqMvE3bPNo3CU3khv4vXcvJ3O4sCZhmTNtMCANuNuV+EYLAMi2F4FMy9nEyj3S5YLPVQuTzN7GG6Es8xJ9vNFfiASa9c0ThekcW8rvLC6bDaYLCzUeme+MAUC77A/cuSgSQHZ86pRMsj9sxS/RUAQaqlhE+yhhQQvO+hb0RhH0RPJRWweK109TyRT2gX1P2H/1E5I6bm47eCSm9+aIZVpbmAnaimGel/icaT6qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/zqKDpeSyfzXh5+nfpfFWd33RbQQ7fMe7jMFGYbsfNg=;
 b=yCgG2yGluodtw1Ovg8HWPP0KCu76zxdEH2IDtyn+CrtdfX+yiDOGUcDZ34F6WkHwd8kr9iR80c97SwQgHP1uAP1DZxok+Mlxtq9UKI3V2w0woyYv7p0fAB4U4tX6jatWJF7jvP2k8I0v8ZHD42Jjx3clwXsG4EEnUoHwzjxOIk1hBz1F0T+gAoXbRvkNqEfmV8tauUuUSTv9IAv2eiMXoNV88vY/jZ3mI+SOKX+LI5Wr+M4uKXhZsLCjqyLr+m+ctlQD0urEbAxePn0xMlycTyUYtTEm/PPXqJCeLvltTNa3sgJCWPREIqyqMfRVqgKxjjihqWTNENjv5hmBbkM2aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/zqKDpeSyfzXh5+nfpfFWd33RbQQ7fMe7jMFGYbsfNg=;
 b=du/qtf9HNAr+dclAzu1wjrfRF0AARzCkZb9UbOePbBlVXDu32eXq5LBtuvmD3e2HqQcLjQAS8Tt6e73zrHJskMnOqp3z2sZMgQxBAFzwbSXUHD+/898kUhDfx0ws5zeqYI6HYxWrN8G6KppGG55KGHqE2Idw+2qd/mF427QJMe4=
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
Subject: [PATCH v4 3/4] xen: arm: Enclose access to EL2 MMU specific registers under CONFIG_MMU
Date: Wed, 21 Aug 2024 13:25:02 +0100
Message-ID: <20240821122503.2315844-4-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240821122503.2315844-1-ayan.kumar.halder@amd.com>
References: <20240821122503.2315844-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B2:EE_|CY8PR12MB7339:EE_
X-MS-Office365-Filtering-Correlation-Id: b2a1f9c3-3aaf-41d8-4e2c-08dcc1dc5048
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aTNXvxC7Osz3Yj4zJ2jcIhsKL/o72X2oYJCEmhYFDDHxng6YrB5l3ISZbMqI?=
 =?us-ascii?Q?5GcdUxXrp+DA7pUnNnI37pZtCYs7Ef3RBQKwc2MGs6Bmpygv3L3JN+DoJrWX?=
 =?us-ascii?Q?im5xWEgy/JxYj/fgPamKsuvZ+EX4eOIHP5y6JYvvHhG1zQICDgmV4e2+cyZn?=
 =?us-ascii?Q?fZifjrNK0eR2cHXp647dz2BJGaVU268yHfRYXWHLxwjQAuGn2GlJVgDNPwci?=
 =?us-ascii?Q?/OVhvT5EJr+jz1hu3GPWv+19n86QvipCYocKHerRumG9nxomhFFcAdE0zabV?=
 =?us-ascii?Q?CHMVr4lSaobyg87Qqcl6Lr/25FIIBKVLCkZfySLPVPl6Om0+UvGsOxvm32fq?=
 =?us-ascii?Q?mXcsJbumx9/fbcB18KtPNcPiBtO+CN8+R98sAgGGtkfdcPAq/8o0rntSvHQr?=
 =?us-ascii?Q?QO4BL7gaZs7bBWEqoPK9WjRrHEVzuH4qden8+ayp1Qq4nsRT9jsgZ1OKzzRI?=
 =?us-ascii?Q?wV6Du4q0TiQqPC1D4pqiGM6O2acAlbyZLP8uIMfEu70A8nLFYd2EJTAP+9Tq?=
 =?us-ascii?Q?dhtx77M72gsC9HQvx4qblNAXrYTepPoibzFDVNOrfYivZur7EINBFIyHM/ys?=
 =?us-ascii?Q?FZqZ9rep0wZyoWljlPV0rgL7r4Z272Kwy1GG6ljxbhb6n0l35JTCWhFCJfeb?=
 =?us-ascii?Q?OZi/8BVL+zvN3GbP3lF5Z5gFt+kmY0VyJI5Q3Nff+Y6Pkqj3Z93TEaEhX0B1?=
 =?us-ascii?Q?5sc7X4cLxIAI9+k2yYOW9nPhW61ZVuGzsHi0OOe3DSeTkwxwzOmULUT4IMje?=
 =?us-ascii?Q?CU/x/KQffIheagibJRjG2aJpnvGosqa5BrYEywbmY0CROPkl/IWa07gVGzd3?=
 =?us-ascii?Q?1h2z7tQxtZw8E7gaim/PUn6ErGBEEcb15vzYK1rivTwBVn7HXTbFA5KPdpd/?=
 =?us-ascii?Q?DoeqVH85Lbc4Wg4TOEtuv0rVM34AjH0YoRNVeVR5YHBo2HdYhljpfsJ882+0?=
 =?us-ascii?Q?J4FXchm2x7uX2n0iXwAmDnbQiGpcMf/SN/X6DvLPHrDF92HWMwmmmQH8U4AW?=
 =?us-ascii?Q?xv1d9L2ixDXXiUj0x/9w0HE8OpDxyUFpqjDQ92R2okD4Psrgcwg7JQSHnCK3?=
 =?us-ascii?Q?utXfTCU1BvC6XRDdYeBo6dyZgNxvJF49sVQSAUQA14ci0SMYzK5ydMibi4Eu?=
 =?us-ascii?Q?0+oGBNYjzaqKn/yCwtfpUTnYZ+z31d2RGbnfDBMT0eui0IuVKIX/LbBpurpe?=
 =?us-ascii?Q?h0SK7WaVqWE9RICsbijsz5X1GRj+sR9lHLtByooH2DZ4BmAg6xth7Lj/t2yM?=
 =?us-ascii?Q?sFuZvz80LHm1Em4lHL707W0yH9GKgn/sneGLv2Q75c5/kJzRIdV4JpgvSKA2?=
 =?us-ascii?Q?TXPy4JVti+zxDXfyWOXPOq13486MJO2iFiWpuXjn2+KBdbzY02AdGZwhIaKd?=
 =?us-ascii?Q?sTvuwTOfa3LQnGIQXOfpwHamVf1odmjHJzUW16KXpSblMKhdp2ob0VkPSIYf?=
 =?us-ascii?Q?FqzeutLPI9m0qJ7QtYNEqdXO6+VvhkOz?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 12:25:16.2868
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2a1f9c3-3aaf-41d8-4e2c-08dcc1dc5048
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7339

All the EL2 MMU specific registers are enclosed within CONFIG_MMU.
Also, protect vttbr_el2 field of struct reg_ctxt and accesses to it.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes from :

v1 -
1. 'vttbr_el2' field is enclosed with ifdef.
2. No movement of code.

v2 -
1. Enclosed 'vttbr_el2' access in show_registers() and vcpu_show_registers().

v3 -
1. Updated the commit message.
2. Added R-b.

 xen/arch/arm/traps.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index aac6c599f8..737f4d65e3 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -720,8 +720,10 @@ struct reg_ctxt {
     uint32_t ifsr32_el2;
 #endif
 
+#ifdef CONFIG_MMU
     /* Hypervisor-side state */
     uint64_t vttbr_el2;
+#endif
 };
 
 static const char *mode_string(register_t cpsr)
@@ -919,12 +921,16 @@ static void _show_registers(const struct cpu_user_regs *regs,
 #endif
     }
     printk("  VTCR_EL2: %"PRIregister"\n", READ_SYSREG(VTCR_EL2));
+#ifdef CONFIG_MMU
     printk(" VTTBR_EL2: %016"PRIx64"\n", ctxt->vttbr_el2);
+#endif
     printk("\n");
 
     printk(" SCTLR_EL2: %"PRIregister"\n", READ_SYSREG(SCTLR_EL2));
     printk("   HCR_EL2: %"PRIregister"\n", READ_SYSREG(HCR_EL2));
+#ifdef CONFIG_MMU
     printk(" TTBR0_EL2: %016"PRIx64"\n", READ_SYSREG64(TTBR0_EL2));
+#endif
     printk("\n");
     printk("   ESR_EL2: %"PRIregister"\n", regs->hsr);
     printk(" HPFAR_EL2: %"PRIregister"\n", READ_SYSREG(HPFAR_EL2));
@@ -956,7 +962,9 @@ void show_registers(const struct cpu_user_regs *regs)
     if ( guest_mode(regs) && is_32bit_domain(current->domain) )
         ctxt.ifsr32_el2 = READ_SYSREG(IFSR32_EL2);
 #endif
+#ifdef CONFIG_MMU
     ctxt.vttbr_el2 = READ_SYSREG64(VTTBR_EL2);
+#endif
 
     _show_registers(regs, &ctxt, guest_mode(regs), current);
 }
@@ -979,7 +987,9 @@ void vcpu_show_registers(const struct vcpu *v)
     ctxt.ifsr32_el2 = v->arch.ifsr;
 #endif
 
+#ifdef CONFIG_MMU
     ctxt.vttbr_el2 = v->domain->arch.p2m.vttbr;
+#endif
 
     _show_registers(&v->arch.cpu_info->guest_cpu_user_regs, &ctxt, 1, v);
 }
-- 
2.25.1


