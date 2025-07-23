Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC98B0FD26
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 00:55:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054876.1423512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueiM6-0007PS-RT; Wed, 23 Jul 2025 22:54:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054876.1423512; Wed, 23 Jul 2025 22:54:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueiM6-0007Mz-Ol; Wed, 23 Jul 2025 22:54:34 +0000
Received: by outflank-mailman (input) for mailman id 1054876;
 Wed, 23 Jul 2025 22:54:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3I4v=2E=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1ueiM5-0007Mt-Lu
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 22:54:33 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20625.outbound.protection.outlook.com
 [2a01:111:f403:2416::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd92b020-6817-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 00:54:31 +0200 (CEST)
Received: from SJ0PR03CA0338.namprd03.prod.outlook.com (2603:10b6:a03:39c::13)
 by BY5PR12MB4321.namprd12.prod.outlook.com (2603:10b6:a03:204::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 22:54:25 +0000
Received: from SJ1PEPF00001CE8.namprd03.prod.outlook.com
 (2603:10b6:a03:39c:cafe::a4) by SJ0PR03CA0338.outlook.office365.com
 (2603:10b6:a03:39c::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Wed,
 23 Jul 2025 22:54:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE8.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Wed, 23 Jul 2025 22:54:25 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 17:54:24 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 17:54:24 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 23 Jul 2025 17:54:23 -0500
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
X-Inumbo-ID: fd92b020-6817-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y5y+5cfUtD1WOn3iXid4o3PUwcYrsFkuVShxU27ZilMDdL7Cir/pcEBoQdQSgNSZpi6mM3GfG869ZE9FUOBYIkTsSFdpMBW5Qu6U1CK7CbtkR7ZvPGZZuogUd/SRcsgK8rsbYhBKb6zdl4uxXjxcJuqlC3y/Fo8DY9nyHgiYAgmFXQxTSJQN/TYUIflXP5LRGEuULrD2b/ayZwmKz7VYWhTQcpTAwHWa0qOOvDBr4b+AWZHeNVR4zM03G8z3knE6ttiFFW99gPTOOPuEqBVqQZ68BO/CD/8UptJgaw2epG60NlSubOvEyvFNjBM1XvHuDyrYJPlLfhavAETubz5/sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=45a4lKuTQNa8xwPgdGxyysbeTJzn7m+wR6tKw5T42gU=;
 b=qOW1JmcDEsYjc/55spoUZZ+ajheJv0RsFGsm52Iixg4CN/vi/RbjArOsk63iQfWz8x8ddz/q6W910vw+duWFirfjcLxVwErbX4++XTrKRGIbjoIAurnubcksaDSttGduSp5ijOupqjP8x8qCIziqrCJc+juTsjX1os+RmsgV4+mD3Fd44dCqxKqqml3YFP2v+N2u5saNCATrESxm0RW0K5YqYZT0GhBhthc1VWKkatjsV/6AtnurF4k4EJKXnE7l2x84bEX+hyar2ANRPg39HasdVnJAXKbl3mSf7S3N+u0ysKg9p9k14ouHCyocnHVkiaQboT+JJ3iiIKig6hV6Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=45a4lKuTQNa8xwPgdGxyysbeTJzn7m+wR6tKw5T42gU=;
 b=Qs6RciEYvUey+Y5E6RoNEz1ygB2BOa+GhEfzu4qfL+1OU8HlPDuayalBEDnKn8KoOp0NDzoM8eJ6M3NYv7+ymGeZONdLfQ51cl5hl8zGC4lpxloCq0qjAC/zPd0aohewFGndqZBdwMPA15+7XOYC47e8aY5ixE868bN2dASc62o=
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
Subject: [PATCH 1/2] xen/arm: smmuv3: fix UB during deassign
Date: Wed, 23 Jul 2025 18:54:19 -0400
Message-ID: <20250723225422.116387-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE8:EE_|BY5PR12MB4321:EE_
X-MS-Office365-Filtering-Correlation-Id: a405bf2c-d634-417a-acc5-08ddca3bdf37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EtIK7IanL9UpbU4sJKDqIa0HLzveZjWC6lIcXRto9q/cEsi3vGBL7Bi2dU+g?=
 =?us-ascii?Q?OabuRmuW6hKXonZQ+zaD7/Q+IjImhkCrL1u4Rp5pjfiwgVOcrXNkEG/fevhv?=
 =?us-ascii?Q?S/AvO1Nz5K3HPhA4/zo0BxKju6UVLGjujFQFn2xw/xdqzNnjIRk2bFO+nQOo?=
 =?us-ascii?Q?ZajQDC8NtZB0EYxoVSTt82CdVNnArpylQ7QuWXCsah5oCcISRFyDrQqCcFM4?=
 =?us-ascii?Q?Yxg3KYJsPtZVG9M680KloBWQ3mFxPH3Ph7wOmEYBiZeUChceOM+u17x7AKd5?=
 =?us-ascii?Q?a5uoMK1OiKETxAtWw25vCCvS0LRE7QQMozkWe/ZxvEP2pV1ExmAy4YbqxvLz?=
 =?us-ascii?Q?MIS/H1mY7MQRKgPbR98WCV1f0HBDQAlcIUM6P7ZpbyUBbw1to/tgc0TULQAR?=
 =?us-ascii?Q?woOpjkAVdKysasnh2x5kI6MWtGIc6Mz9hV3QP7KkvoXLIIXeHgnMCj/jrCbI?=
 =?us-ascii?Q?dFbKF2KajvHOhdFitQyCYqemB4u7rt/Me7owoYSqH4XrwO0955iu59ptMT5n?=
 =?us-ascii?Q?HjOYT5eswZzDHMonqKB20KTeRqapVk4A8N+tKqf67oLEt5T7wd8vX7V5cVYS?=
 =?us-ascii?Q?QvHMByRD7btQB6wVlL7tPc/rB29O1jQLBDyhkKxEDSEsCdlsS1Xg/lDA+cgh?=
 =?us-ascii?Q?jB2Gf/Cq8oZXFiLlk91LHwQ2Obr9H/YS+vPTBt68K4cGd52S3bGd94IEUE3+?=
 =?us-ascii?Q?07ICJsa9EQVjRyj7RMLap91Io7Ebbydd7v9Fbl0ENvuif111tBBRlPFYpKtS?=
 =?us-ascii?Q?tb3TAxzhO8ES+tSK4nknKlZbgXXRf+mdCrAha7Va1mowOJyGeWEYTkE6RMyp?=
 =?us-ascii?Q?Rw4AGnQwKgeq82HqWqs9034qO2i75U5CvKNGkJMmUe1Sc+VbzZtoSVJnniIN?=
 =?us-ascii?Q?V4uH0ZY/4DpU2v3OtPmGXgLj99spq040Su9xBFxdTYLqv/o4ra+M9kjdBT8/?=
 =?us-ascii?Q?6+soMvCs9n1BlwmX+/2UI7gTCaoA+bmv0hOI/Ff0WB0AjOwP6/KEVi4zREv2?=
 =?us-ascii?Q?OXZmg8byjj1VlYHHeyK2GrSpqXtrjWH5J/M68e1bW3GK0xs6V+uZtiVvjX3h?=
 =?us-ascii?Q?QXyZpcBbF3Ct73tt1rOxR8VPeSv4FDt1vcNzikX6Ftr3yuyZAI/083SdnF4M?=
 =?us-ascii?Q?tM98y4PJsn2Bs9u/vcZtMCsYzIYkbjo/RDjALqFyc9I2tnDiY9e4UyErzjCB?=
 =?us-ascii?Q?hPAHXp8F/QBvdJIlH6KPC0y1CgJjY5piN60yuZVFtlSTtuDeNiBOwkgd0qH0?=
 =?us-ascii?Q?D3PDYKL7Db9WogCFvSO/+j5nLX3p7WmXEzD27WcpaYTKaJtvugt8gZpqNS6J?=
 =?us-ascii?Q?jckgF2+cBRMszjZ2m5yss6W+0j7xPAk41Nuz4IAS5KpXjBFBqh4ma8Kp9IEU?=
 =?us-ascii?Q?C5zDOv0Ie4SWH3NbBW3/Bx37VkqWbfSYb2eEGFx7XxSQutd7EJ5l0VhDwzAM?=
 =?us-ascii?Q?pQp4Nw04zARPyQ32QeVMC811nVJzJ8oONZfmPr0Icg9+lkFsBklZ2vazVUSd?=
 =?us-ascii?Q?plUna/OmQKC/EP4s9u39TcOoFREIMEZDmJTQ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 22:54:25.1982
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a405bf2c-d634-417a-acc5-08ddca3bdf37
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4321

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
---
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
 

base-commit: 5c798ac8854af3528a78ca5a622c9ea68399809b
-- 
2.50.1


