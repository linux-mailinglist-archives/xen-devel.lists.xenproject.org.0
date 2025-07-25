Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F09B12326
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 19:46:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058317.1425951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufMUg-00013C-Ei; Fri, 25 Jul 2025 17:46:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058317.1425951; Fri, 25 Jul 2025 17:46:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufMUg-00010g-Ah; Fri, 25 Jul 2025 17:46:06 +0000
Received: by outflank-mailman (input) for mailman id 1058317;
 Fri, 25 Jul 2025 17:46:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=22Yz=2G=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1ufMUf-00010W-3R
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 17:46:05 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20628.outbound.protection.outlook.com
 [2a01:111:f403:2415::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a1b8065-697f-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 19:46:01 +0200 (CEST)
Received: from BN8PR03CA0026.namprd03.prod.outlook.com (2603:10b6:408:94::39)
 by BY5PR12MB4210.namprd12.prod.outlook.com (2603:10b6:a03:203::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Fri, 25 Jul
 2025 17:45:57 +0000
Received: from MN1PEPF0000F0DF.namprd04.prod.outlook.com
 (2603:10b6:408:94:cafe::db) by BN8PR03CA0026.outlook.office365.com
 (2603:10b6:408:94::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Fri,
 25 Jul 2025 17:45:57 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0DF.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 17:45:56 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 12:45:56 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 12:45:56 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 25 Jul 2025 12:45:55 -0500
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
X-Inumbo-ID: 3a1b8065-697f-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uIO03VE8nKZzlWIv65DZp2hjMeeG/jZCBILwRS7RqqeItlR7iJKbQ95WrPvwZjSwefdoQyvYg1/3xqiE5Ug9fACWWdAdlgCOwgaD6R1wfRVbgj7/8m8AlHmLEsUAbv2xdA9zSCbPmRNP2tiMkgei9cp3VrKbJAEJutM5U06MWfS4lBddRNaPUePNmWKHMM699lpLyeyFlR4DMmUpHsUmUDvf9G6P4oLj36w2cjg7kswOoHcaeCvOV7l2H8cJ0kxcgjL+vdLZ4EGNUsQoi0BAC/3R/cxo2jTBVLP2eIV+8/JEHGVrvqvXBkINDIl2gutqkV48nvAI9DZ2oGkltrpopg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VLTKQ9EqC0gesyZb4luBKMQHCoaaos+HDVJAG2gAw6U=;
 b=Pc3b0JjrjPwu3OxRUX7S1RdWF5IzvML29HbGiCu/TGM3s3nyladXQ+6G7HzHVzoe1XtL3L58UR4axZBEHHA8hpg2br+kYZBvKo+iKOFSgIAvu+pt6yTXNKZIH37gX2YAyFsw/FNuwEuuN1m3r/k0yz0YClQ3s86jbLG1vbPQ47R5h5YG5+4bgcebVj/9BJVd1M2vl1mb9hTBjNkuygVlzxdIXZjYeqbdepdkfCuJnGYMQ5lzoril4Ogy/Q636debGTRTK4Tj3rULBjqWAHRWkk01/pKEmJ/vpCcxRoJk4hAqpRgPZF+xMHV2zb0qcrrWi6naHstn+zvzVRraTQUNWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLTKQ9EqC0gesyZb4luBKMQHCoaaos+HDVJAG2gAw6U=;
 b=3QCeS+289Ld54OVnx9sosL6jYWkVGsmh8ra6+g+3JX/Ro49fMXZ/Captdljg3A0N9CVSi1uSrvoZQh3EKW9qFWVKn1BRbBbOKLYYOvhiwVsgsD5H4rBazJ6svagM9wQu06Wo5LNmTu/0+tCT9RuwFIobpPtDLO4t8PqNaixS76k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, "Michal
 Orzel" <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 1/2] xen/arm: smmuv3: fix UB during deassign
Date: Fri, 25 Jul 2025 13:45:50 -0400
Message-ID: <20250725174553.15322-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DF:EE_|BY5PR12MB4210:EE_
X-MS-Office365-Filtering-Correlation-Id: 043db20f-0efe-43c8-bb74-08ddcba31c27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WOAjRoEh/hRin8tNxr35BszrAd8GWtfFJCBef190amogL44yQMRAhkiSXuQ4?=
 =?us-ascii?Q?NGscKSDwpoyspv80kOOE1OpiyRgv2vmGmmprZQDxQGIs1VNG8sGymSgNQ1al?=
 =?us-ascii?Q?oHsEdEplU74o5Rfw2l/lrs4LEu9IKr/rYThXSUEac847YIZZg1CEyZBTqjwv?=
 =?us-ascii?Q?qFFQfVjU8xBpkRONPI3XpZeJZbHVWewnoNtK4zkfBZ/hyk1r4QwOBfG6YoRZ?=
 =?us-ascii?Q?Wng7NFsBjBBbDokVoThAKWdZ+ApYOEEgej8YHhhY012glntyGb+IJlOA46Go?=
 =?us-ascii?Q?i47MOTgrBd1RD3pWixn+bnPk12VR0xiRy4LoOldL3qRgUu6qEz88xhQ9jWGb?=
 =?us-ascii?Q?2LDuKB7Kv7dWK/tOvd5rfXE/5bJVIdpFvjPsjW638Ivi1T/DOYYGiw94tEOX?=
 =?us-ascii?Q?Q7j3d9TInQ96GWvGiOyRfbosUgP5CfVt0QBbefFe4iwBf52zTLjnPSK26N38?=
 =?us-ascii?Q?ZdkypsqMwKFu3DXSAEgxFZfDRuDbphXJVzH4ifeu010jHvfYeiKdmHROvxs9?=
 =?us-ascii?Q?fofmvXRrcwJYopRUsxe7zwrVJ5ZGH9PVd19TEYZVMg5NX/lMxIoX6Vs2BRuL?=
 =?us-ascii?Q?TNixwa+/eoOxstF567x96cSglo42UdSVC508jy/gp7xD0Shvn522SxixBeeX?=
 =?us-ascii?Q?XB0g/7w8n8PA2UYyuN/JRC80n/nUVOx9b7YFa/R0/rLdHPRtP2HMai3eXJTf?=
 =?us-ascii?Q?1yXEwsRy5Y+uuUyye8lip4bok3jBiEcfmt9qFNsPh6zZLNhm9GdKVEpKKacq?=
 =?us-ascii?Q?mRIWLylODgHEScDSLm7TZkh9hacKl800VrzPuIUvVWWKrULsm35s2v7JLSO0?=
 =?us-ascii?Q?0eONf8L/SqkLjdj6Z6YrqNxC5GduhOpKtuXuF3VmIDlx2rnZdduY2gG+AunG?=
 =?us-ascii?Q?Io+KoSCoslUraQMrvyBbDlS/xOpYe4hZPcyGR6psM3+KLC43OnkMyqnEZlMu?=
 =?us-ascii?Q?lX5AbyAdKytjmEPAwF2zpycdXgmEIuNIWM/tx6nLqkNeD3EvwNU4I9we1GPo?=
 =?us-ascii?Q?JbGd/CyMRfevBTV7/1LkzYvgEj75kfgYEs6ZtZ6pXLPErKWK23hd73mBZB7p?=
 =?us-ascii?Q?bE89AJSDT5x4EnAqYBEnZhZacrqbiFapWO4PUYrqoalpLDW1iIdp4jvOq5J6?=
 =?us-ascii?Q?qdoqb0O4CZ9zHvbxy0toQXN7POMbOj8I9Bn9ElnD6FMPa9O/6VE1tWQCIZX6?=
 =?us-ascii?Q?217U+Eth/MuEeLwYcF1EScAspYmdnoqJ/6n8Gb+BpnzIbPTG3NdutzJOOsqU?=
 =?us-ascii?Q?cwKg/NgcDhY+qesYZb3pTPQtpAz1qBz8yDdz8J6KnG2fuwL3N92iWzNC8f4A?=
 =?us-ascii?Q?E5cvQeXRAqkVw0LQaeqJTdMD9k/hmMBkFWivPUPeqEpNdfI1zOUHLfYgO8g0?=
 =?us-ascii?Q?lRr3KjFEBccnnF4Gz50wLfWsQipTJuac4gp/WS4sxkV9zbPfJW8AD1Vq7pSo?=
 =?us-ascii?Q?v4JePyZpbtqPPWr74yw4Fc/uUY5JmMEmGyQ0SyYN7x41pwG/SqJDnrEFdX7O?=
 =?us-ascii?Q?T77rfE+CcYbPMdepd0J90Zsf87Dx/fyT6XbI?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 17:45:56.8437
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 043db20f-0efe-43c8-bb74-08ddcba31c27
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4210

In arm_smmu_deassign_dev(), the return value from to_smmu_domain() is
NULL-checked. However, the implementation of to_smmu_domain() is a
container_of lookup, so the return value is unlikely to ever be NULL. In
case of a NULL argument to to_smmu_domain(), we will attempt to
dereference the non-NULL return value and encounter undefined behavior
and a crash:

$ xl pci-assignable-remove 00:01.0
(XEN) ================================================================================
(XEN) UBSAN: Undefined behaviour in drivers/passthrough/arm/smmu-v3.c:221:9
(XEN) applying non-zero offset ffffffffffffffc0 to null pointer
(XEN) Xen WARN at common/ubsan/ubsan.c:174
(XEN) ----[ Xen-4.21-unstable  arm64  debug=y ubsan=y  Tainted:   C    ]----
...
(XEN) Xen call trace:
(XEN)    [<00000a0000350b2c>] ubsan.c#ubsan_epilogue+0x14/0xf0 (PC)
(XEN)    [<00000a00003523e0>] __ubsan_handle_pointer_overflow+0x94/0x13c (LR)
(XEN)    [<00000a00003523e0>] __ubsan_handle_pointer_overflow+0x94/0x13c
(XEN)    [<00000a0000392f9c>] smmu-v3.c#to_smmu_domain+0x3c/0x40
(XEN)    [<00000a000039e428>] smmu-v3.c#arm_smmu_deassign_dev+0x54/0x43c
(XEN)    [<00000a00003a0300>] smmu-v3.c#arm_smmu_reassign_dev+0x74/0xc8
(XEN)    [<00000a00003a7040>] pci.c#deassign_device+0x5fc/0xe0c
(XEN)    [<00000a00003ade7c>] iommu_do_pci_domctl+0x7b4/0x90c
(XEN)    [<00000a00003a34c0>] iommu_do_domctl+0x58/0xf4
(XEN)    [<00000a00002ca66c>] do_domctl+0x2690/0x2a04
(XEN)    [<00000a0000454d88>] traps.c#do_trap_hypercall+0xcf4/0x15b0
(XEN)    [<00000a0000458588>] do_trap_guest_sync+0xa88/0xdd8
(XEN)    [<00000a00003f8480>] entry.o#guest_sync_slowpath+0xa8/0xd8
(XEN)
(XEN) ================================================================================
(XEN) Data Abort Trap. Syndrome=0x4
(XEN) Walking Hypervisor VA 0xfffffffffffffff8 on CPU1 via TTBR 0x00000000406d0000
(XEN) 0TH[0x1ff] = 0x0
(XEN) CPU1: Unexpected Trap: Data Abort
(XEN) ----[ Xen-4.21-unstable  arm64  debug=y ubsan=y  Tainted:   C    ]----
...
(XEN) Xen call trace:
(XEN)    [<00000a000039e494>] smmu-v3.c#arm_smmu_deassign_dev+0xc0/0x43c (PC)
(XEN)    [<00000a000039e428>] smmu-v3.c#arm_smmu_deassign_dev+0x54/0x43c (LR)
(XEN)    [<00000a00003a0300>] smmu-v3.c#arm_smmu_reassign_dev+0x74/0xc8
(XEN)    [<00000a00003a7040>] pci.c#deassign_device+0x5fc/0xe0c
(XEN)    [<00000a00003ade7c>] iommu_do_pci_domctl+0x7b4/0x90c
(XEN)    [<00000a00003a34c0>] iommu_do_domctl+0x58/0xf4
(XEN)    [<00000a00002ca66c>] do_domctl+0x2690/0x2a04
(XEN)    [<00000a0000454d88>] traps.c#do_trap_hypercall+0xcf4/0x15b0
(XEN)    [<00000a0000458588>] do_trap_guest_sync+0xa88/0xdd8
(XEN)    [<00000a00003f8480>] entry.o#guest_sync_slowpath+0xa8/0xd8

Fix by changing to_smmu_domain() to return NULL in case of a NULL
argument.

Fixes: 452ddbe3592b ("xen/arm: smmuv3: Add support for SMMUv3 driver")
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
v1->v2:
* add Bertrand's A-b

I'm unsure if that's the right Fixes: tag since I'm not sure if it can
be triggered prior to 63919fc4d1ca ("xen/arm: smmuv3: Add PCI devices
support for SMMUv3").
---
 xen/drivers/passthrough/arm/smmu-v3.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index 58f3331520df..db08d3c04269 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -218,6 +218,9 @@ static struct arm_smmu_option_prop arm_smmu_options[] = {
 
 static struct arm_smmu_domain *to_smmu_domain(struct iommu_domain *dom)
 {
+	if ( !dom )
+		return NULL;
+
 	return container_of(dom, struct arm_smmu_domain, domain);
 }
 

base-commit: 6cd9b9226c65c962b0f0e040e7d3d5c4053f8e06
-- 
2.50.1


