Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1628FB0FA15
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 20:14:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054600.1423338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uedyI-0007KJ-6w; Wed, 23 Jul 2025 18:13:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054600.1423338; Wed, 23 Jul 2025 18:13:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uedyI-0007IK-3M; Wed, 23 Jul 2025 18:13:42 +0000
Received: by outflank-mailman (input) for mailman id 1054600;
 Wed, 23 Jul 2025 18:13:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3I4v=2E=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uedyG-0007IE-7E
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 18:13:40 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20611.outbound.protection.outlook.com
 [2a01:111:f403:2405::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c07fc06f-67f0-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 20:13:38 +0200 (CEST)
Received: from BYAPR01CA0048.prod.exchangelabs.com (2603:10b6:a03:94::25) by
 LV8PR12MB9618.namprd12.prod.outlook.com (2603:10b6:408:2a0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 18:13:34 +0000
Received: from SJ1PEPF00001CE6.namprd03.prod.outlook.com
 (2603:10b6:a03:94:cafe::bc) by BYAPR01CA0048.outlook.office365.com
 (2603:10b6:a03:94::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Wed,
 23 Jul 2025 18:13:08 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE6.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Wed, 23 Jul 2025 18:13:32 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 13:13:32 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 23 Jul 2025 13:13:31 -0500
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
X-Inumbo-ID: c07fc06f-67f0-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IfyagBXkeO6T+nNfiTHjupMAHpNR9oKM+CpIA+PiFPokrCnR2sqRuZxFzdy1c75WL2iPl0hc3y/zHPcqP+kVzInzMMoTUz/fxHcwjXAOysjKIR2j4XpZFzcSKQOGaRbMSWMvdpCcVGogBtbhg68Evx+lTgbp/sLdj2u7QVLwLEMBqFagKwZncsC8WrZa9o1RhizbNSYkP/FMdQzygg/ZzXTj2juxTzfyaeLtp5YFNhT5/VsWNfw6iyNFSdS/Bv5sP3Dlv5Cqv3TNuc5CGH69KlpGSMDoLzTyTH1y1LVfMQZvYFCCPfYJGwkiepgaQD5xYI/lJePvj58rXmxHPCbG5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i2P/GPA9yVyoll9LNMSxP19sd95UPOLj6PtIs+8xl1Y=;
 b=Hw1LoDMdce6opOlm/9JAVJk96m+tTKlbOOzMyHfVO5HbMIbGaNc5oEr6WYSzXJhukFNscvJL1EmLhJhXujSN7RINzx4q0B+1w/xxqsex889L96P060a+Tg+T8C4aBadEWc72tUiNHr0oWfDw+4x5fkUt465x1QZTFqTYKRlSPCrwJKY8v/OayXnkbKNL5wn4ogXt82ybf/dc4q5yf8dIi2m8iNkL6Wq6p1VkFJ/dpL3Lr+WYcm34a05DwAJ6OQwDpItxyAqbY583AdOPn3qgPZtVAgxNwklUeWisym+s+KCVHuU688TPnImHTBDfPd993qfIVIai8ZekCQp6yClBDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i2P/GPA9yVyoll9LNMSxP19sd95UPOLj6PtIs+8xl1Y=;
 b=KMwA5KLMPrUr68xTTk+abbPhbTLOIhT/fO2fvUx3ulq3OX3tD7My2XKnvW79/R2F7dzQSGRYPmHi24OHLR8zh2isyu7d96F+hJlSGudKoCtIKAs1d5GcYceiJY+pu4MYtGq2B6Pk3ptx2wguKOTvD8Atop9UCyfYId4Tm247gfE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <stefano.stabellini@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: [PATCH v4 1/2] xen/arm: fix arm_iommu_map_page after f9f6b22abf1d
Date: Wed, 23 Jul 2025 14:13:27 -0400
Message-ID: <20250723181330.14305-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE6:EE_|LV8PR12MB9618:EE_
X-MS-Office365-Filtering-Correlation-Id: 335eb61b-c127-4156-404d-08ddca14a273
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2pDRxMrrKzCpBSHriNIbd0P2r/srMbTjhPOK1i074vRifMvFi5GxXx0S3j+6?=
 =?us-ascii?Q?uLufKpwrlGfFEe/yP4I3fLoTzvw4Up/+s7c4LKnwfTixxBp81ADu5iNCuEIZ?=
 =?us-ascii?Q?s75nNTfX+tYb+XuyqgSgDNCWW8YjPdVS/f1aNBvIXslMG/1d6i8HXOPvwhOh?=
 =?us-ascii?Q?2UrHmnuvrduNMruNjWGU7F6B/C0hjDnZ7fjrLbYXr6S4iX4MRTDno3tgzJVz?=
 =?us-ascii?Q?lfnULAa4pTvY0NUyMSMBHjJeQLqJWexc/YRhAEt/6BSPnMt+X8JnJ7Yq+Hjk?=
 =?us-ascii?Q?fckzRZPdkVw2P7UHu+KmO3QRc6A5Xf0MVAoVxFGZ3OwXtUmZ0LgNQi0dyknS?=
 =?us-ascii?Q?ukP4blzRhhB1OMSi54T2oOF8PuL+ku9rgvkU/zkAnU7AFWwr6ngdD2Ja9NS2?=
 =?us-ascii?Q?DO46dm0PteYo17gYSCIh/6gD1Ujcg630D5dUCpKInHb29GhMGF/Y0u5TN5Mi?=
 =?us-ascii?Q?tlZ27O1pLopteg1q4lLqfk/V6kaxiJsY9U5o8ibC2BUxLaHLMxYsfGhvxPmb?=
 =?us-ascii?Q?14VqzLfcrwjFtpRxZHcy9k+Ozdkiin/tynxeFMBR3WstN/8BrZNLAuNhgM/5?=
 =?us-ascii?Q?nkdAUnlisH3Q+luKsZ+7RVQccPZ9bg9Ze1K19gO0Qb/BQ4S9oUho4mDjy4H9?=
 =?us-ascii?Q?x/84K8m5+rcGF1iL92yH27StHCnt8q4t79d52nGosrYM2vPdGflcqE/pnpYL?=
 =?us-ascii?Q?tSjQ6FKoz87XyeGQpCJTAxSGmjf5AfkzvtwET+xEwTwu4gcR0jwmO7hC6EyC?=
 =?us-ascii?Q?H6yxWjTHRaXpmThXZshwBQgGO3d6dadjOsaweScn1xW2k6QQnUM6HvPvFSgC?=
 =?us-ascii?Q?3fTfdnQBHeLayvVlFqnR8p6jFtuaw4C7+tiozxB2rGE7FVHvtGVSoZiYyAUM?=
 =?us-ascii?Q?XE2+SOa6vR/xpyg+qdbl/OsgXrWAfP0ObO4XJFONKtkKzRlzuhJQ6yJzgGL4?=
 =?us-ascii?Q?XUMDEk+CvPJIas2Dm6DEOYRhT02r3uWnHio1pEcpGqyfCYUq7cWoixSeF1jo?=
 =?us-ascii?Q?pprXIGjTdAXDI9PwGOiFfK9ZdDGIu5FfGSDiiiUEs8KHS2fmUpj5GnB6hMGi?=
 =?us-ascii?Q?oLtOt+K1Pu0iUvP8/Ym5XncVIkZDxu32Ay8S/VW11bShxJZ0uUTUz31row3f?=
 =?us-ascii?Q?X7UNxx6jvsTuJGIJNlzf8MzZuXdbz8hKA2+NU7bE7IJhi1XdSSZCBTls24Qb?=
 =?us-ascii?Q?AnbP2LtugkKJtKQcPjrROvqPlLveNeSNw9N3lDabUwVAKpVb7f1RTUjDhdWL?=
 =?us-ascii?Q?rDvIZdS4pFj1weph/ylJDY16bwjnSy3afzOasF3JPQVkD2LnPwp04NxeAkEe?=
 =?us-ascii?Q?yypivQNHUKdNN8ZhSlIzoFvRX3NV31vugrEWK7IFqzdpbOf6BvC93mjfb5a2?=
 =?us-ascii?Q?M/DaeNF8VFGOD0GBZwZcepE+MBhachPkifQlWsQJFUsESE0sk/AuQL9n6Fht?=
 =?us-ascii?Q?aF1Cw2vvegnRyfte7EXXxGHkbVTZOAg2tdb/Dgp8/LQdKoek8oZG0032U3xR?=
 =?us-ascii?Q?gw1CD7gtx9uOkBA6V70gtxjjxEHvkkPYe0yF?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 18:13:32.8736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 335eb61b-c127-4156-404d-08ddca14a273
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9618

From: Stefano Stabellini <stefano.stabellini@amd.com>

Up until f9f6b22abf1d "xen/arm: Map ITS doorbell register to IOMMU page
tables" the only caller of iommu_map on ARM was grant_table.c which has
a specific usage model and restrictions as described by the in-code
comment in arm_iommu_map_page.

f9f6b22abf1d introduced a second caller to iommu_map on ARM:
vgic_v3_its_init_virtual. This specific statement in the
f9f6b22abf1d commit message is partially wrong:

"Note that the 1:1 check in arm_iommu_map_page remains for now, as
virtual ITSes are currently only created for hwdom where the doorbell
mapping is always 1:1."

Leading to crashes any time the hardware domain is not direct-mapped
(e.g. cache coloring and non-Dom0 hardware domain):

(XEN) Xen BUG at drivers/passthrough/arm/iommu_helpers.c:47
[...]
(XEN) Xen call trace:
(XEN)    [<00000a000024c758>] arm_iommu_map_page+0x80/0x90 (PC)
(XEN)    [<00000a000024c750>] arm_iommu_map_page+0x78/0x90 (LR)
(XEN)    [<00000a0000250884>] iommu_map+0xcc/0x29c
(XEN)    [<00000a0000288024>] vgic_v3_its_init_domain+0x18c/0x1e8
(XEN)    [<00000a0000285228>] vgic-v3.c#vgic_v3_domain_init+0x168/0x21c
(XEN)    [<00000a0000281dcc>] domain_vgic_init+0x14c/0x210
(XEN)    [<00000a00002705a4>] arch_domain_create+0x150/0x1f0
(XEN)    [<00000a00002055e8>] domain_create+0x47c/0x6c0
(XEN)    [<00000a00002cf090>] create_domUs+0x7f8/0x8cc
(XEN)    [<00000a00002eb588>] start_xen+0x8f4/0x998
(XEN)    [<00000a000020018c>] head.o#primary_switched+0x4/0x10

Specifically, non-1:1 hardware domain exists with cache coloring
enabled. For that, is_domain_direct_mapped(d) is false but
domain_use_host_layout(d) is true.

Change the is_domain_direct_mapped(d) checks in arm_iommu_map_page and
arm_iommu_unmap_page into domain_use_host_layout(d) checks.

Move the in-code comment specific to the grant table to grant-table.c
and adjust to be architecture-neutral.

Fixes: f9f6b22abf1d ("xen/arm: Map ITS doorbell register to IOMMU page tables")
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v3->v4:
* adjust comment to be architecture-neutral

v2->v3:
* split change into 2 patches
* 12-character commit IDs
* change both arm_iommu_map_page and arm_iommu_unmap_page
* s/IPA/GFN/ in comment
---
 xen/common/grant_table.c                    |  5 +++++
 xen/drivers/passthrough/arm/iommu_helpers.c | 16 ++--------------
 2 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index cf131c43a1f1..1b7f63a448a7 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -1274,6 +1274,11 @@ map_grant_ref(
         }
 
         /*
+         * Grant mappings can be used for DMA requests. The dev_bus_addr
+         * returned by the hypercall is the MFN (not the GFN). For device
+         * protected by an IOMMU, Xen needs to add a 1:1 mapping in the domain
+         * p2m to allow DMA request to work.
+         *
          * We're not translated, so we know that dfns and mfns are
          * the same things, so the IOMMU entry is always 1-to-1.
          */
diff --git a/xen/drivers/passthrough/arm/iommu_helpers.c b/xen/drivers/passthrough/arm/iommu_helpers.c
index 5cb198748193..bdb271584b0d 100644
--- a/xen/drivers/passthrough/arm/iommu_helpers.c
+++ b/xen/drivers/passthrough/arm/iommu_helpers.c
@@ -36,15 +36,7 @@ int __must_check arm_iommu_map_page(struct domain *d, dfn_t dfn, mfn_t mfn,
 {
     p2m_type_t t;
 
-    /*
-     * Grant mappings can be used for DMA requests. The dev_bus_addr
-     * returned by the hypercall is the MFN (not the IPA). For device
-     * protected by an IOMMU, Xen needs to add a 1:1 mapping in the domain
-     * p2m to allow DMA request to work.
-     * This is only valid when the domain is directed mapped. Hence this
-     * function should only be used by gnttab code with gfn == mfn == dfn.
-     */
-    BUG_ON(!is_domain_direct_mapped(d));
+    BUG_ON(!domain_use_host_layout(d));
     BUG_ON(mfn_x(mfn) != dfn_x(dfn));
 
     /* We only support readable and writable flags */
@@ -66,11 +58,7 @@ int __must_check arm_iommu_unmap_page(struct domain *d, dfn_t dfn,
                                       unsigned int order,
                                       unsigned int *flush_flags)
 {
-    /*
-     * This function should only be used by gnttab code when the domain
-     * is direct mapped (i.e. gfn == mfn == dfn).
-     */
-    if ( !is_domain_direct_mapped(d) )
+    if ( !domain_use_host_layout(d) )
         return -EINVAL;
 
     return guest_physmap_remove_page(d, _gfn(dfn_x(dfn)), _mfn(dfn_x(dfn)),

base-commit: 5c798ac8854af3528a78ca5a622c9ea68399809b
-- 
2.50.1


