Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 026BFB11FB6
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 16:03:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057890.1425588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufJ0r-0002SE-BJ; Fri, 25 Jul 2025 14:03:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057890.1425588; Fri, 25 Jul 2025 14:03:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufJ0r-0002QZ-7w; Fri, 25 Jul 2025 14:03:05 +0000
Received: by outflank-mailman (input) for mailman id 1057890;
 Fri, 25 Jul 2025 14:03:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=22Yz=2G=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1ufJ0p-00028m-HO
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 14:03:03 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20620.outbound.protection.outlook.com
 [2a01:111:f403:2413::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13156c7a-6960-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 16:03:01 +0200 (CEST)
Received: from MN2PR17CA0011.namprd17.prod.outlook.com (2603:10b6:208:15e::24)
 by BN7PPFCE25C719B.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6e1) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Fri, 25 Jul
 2025 14:02:38 +0000
Received: from BL6PEPF00020E65.namprd04.prod.outlook.com
 (2603:10b6:208:15e:cafe::b6) by MN2PR17CA0011.outlook.office365.com
 (2603:10b6:208:15e::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.24 via Frontend Transport; Fri,
 25 Jul 2025 14:02:37 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00020E65.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 14:02:36 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 09:01:33 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 25 Jul 2025 09:01:33 -0500
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
X-Inumbo-ID: 13156c7a-6960-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FFsSzKQ5td7ZTRufoZGhPaWORupehSDHMCzyTAUSw2sy+cBO2ThIFiWCWrhYrUV9Vs1qTQY7DGSqekoQlDzThdyjVHTPAWXaWW+DDfc8mBeKBPfKmGQrjm3bYMUH1O008HwPO+b8ALusSOco3/4Hmf2P8bqE4HbcWe7LMOjIZ+ShWQATCw+Mn7aGV4ZW0dkqKLIIRuXEiqVffERM06ICCXNUUBYMJHQy5xP2/DDMLqnxwKVf1x9DccPs+19KzCzGceFrEf6Nu/xWYIXHgBlzaMM7dgG6ZE1iHeqgnPljMoUOpTB6cF40xmdUiReF8vbAN0NdF7GIN7Rtj8BTRfv9fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3cYNL7XYtM+KZRgO7X/3TODkMNt6tJ2jbCfK9GCuRdw=;
 b=GbF1Exa9Os81zfT6gf+WqHIrkQNADYXmF1migBFcSXHkMHWPLibML3dvM2XZM0zNm0KUJVQMXm+YRg3wCaRH8l8Y8Tv+6guHo1yAhqe8rFo0RZVch0/Imk29vyY2lHEQ0z3hy1ZhBQFBcI4CKJBRDIP6zBmEmGi+T1y7+h/HlFiRr8YfdC1KHk9K9xFERqobbNidGHARDWi9u3ILh8KXi8ycZC2iNwr7yKimXjXDOwieHTQHmF2JzYjsCUyQJBcQIVTNOeurWd/xg5n6XKnDcBh4JEZgilUhkSc+eU4Nkl/nitmvJD1l3MqmldjKrwXNMbUI4mgY/ytPHqKM8JQHvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3cYNL7XYtM+KZRgO7X/3TODkMNt6tJ2jbCfK9GCuRdw=;
 b=Tg+ZZkUt9H6vN5eQO6q5N4Tnq/FdqL4ip/C4t649nvzTKN2U0e8XXmYacH6MMID60VDGqR1Bh5CCmqsRwTB1GZ5tyxJuGzQLzmVUlc5zkysdETnDeheyr2LvmX8M8alivz3nd0zqYgOjvrRhP/E9bUjm6mkscqdvlmYd/PqwuKk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <stefano.stabellini@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>
Subject: [PATCH v5 1/2] xen/arm: fix arm_iommu_map_page after f9f6b22abf1d
Date: Fri, 25 Jul 2025 10:01:25 -0400
Message-ID: <20250725140130.4008-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E65:EE_|BN7PPFCE25C719B:EE_
X-MS-Office365-Filtering-Correlation-Id: e2f9b690-a0fb-4528-caea-08ddcb83e92b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?k+6bRy63bZZM/ouaMvYWxiah59mPM0zElf7yz9Brc8MYHt4kpKutXfsb8scG?=
 =?us-ascii?Q?C4WSwzu2XHPW049G28axaAH+mVXslnZZSFBFzJsgxW1PjuKkFe2J6otzu/SU?=
 =?us-ascii?Q?dHfGRdAu0u78UHf9ERDX4QObfF8QTPqTBEtV/cKq91IyetkewVLhlEFdvFtM?=
 =?us-ascii?Q?P5Tez8KD00mzOSvVpiAJCvaumXR7xjJTdpVRKzv/ZaSjTwxuSWVe8FqyyPbH?=
 =?us-ascii?Q?5svE+CG9QiQQVH2SMjVvzmY9VYlNPTEPkPj1yfK7oR7MFhtWJ0kbAbLvK3Hl?=
 =?us-ascii?Q?sqIRIOoW0VIT+CDv8cwJHoV+AIn65gCjpXeF9ILbp4eykb5c8UULropfAKOj?=
 =?us-ascii?Q?TLBVujgQ1tTgh4leBC/c7bT8uCw1ks3Em5m5APSDgJeMqXff3DMLVj5l8TE/?=
 =?us-ascii?Q?dG13uvhW0wJe9qkwnlrU+DT0OYpCYoLsJJTnxT5azlRW7HGiQclu0/3eeZGr?=
 =?us-ascii?Q?pd0W3CzxDg9OFRoSTFEAxsfGvZWwRi5atC/yOZN4cfx5oLeJpUMT3KK5ebPd?=
 =?us-ascii?Q?PmlWI9dZdaFTpwtF8IAQkAdUAfj1C/8Dt3CW50PWR3oDj8uQQY6t/IrVolty?=
 =?us-ascii?Q?UE7s6cOnlyFCRZvGGlENpgkXm1fWHDxdCDmN4Wga8urH/oraD2pyYJN8pYSy?=
 =?us-ascii?Q?QF7HY/0CdFaFjQnbn0d8F3QvKG5LSaIv3ETooBwgJQNttzjWJ0JfluwQ5ATT?=
 =?us-ascii?Q?24Toj8ah8AsuRODdHzlAn7lrt8LV3YXVnRaADpkiZsKAW4d2xEH7UJWwklR9?=
 =?us-ascii?Q?WYMvJ6c3gp1/BboGWUZYXX2trEGOpAP6hqOnXvMvBlhYNDvwy8aOxhCivJUa?=
 =?us-ascii?Q?9Q371s4mD8b4qdNpvHJUi0wInIWooGsoWce/0gV3KHON8wAQglVBS5VsXTQG?=
 =?us-ascii?Q?e85CwvLyuYtdIm9Pg2wOLsfC2HGqNLuTpa8FsBnxXvmd0636jOHE/JUIf5q+?=
 =?us-ascii?Q?WumCxmfKY2aj2TruG6jWvQjiNSz6gaTsS8TG2dnFsMqIbeIF/BuOoiPyg2Vs?=
 =?us-ascii?Q?jdk42p+QlOx4LEy78k1THrOCakVfy4DS5uEDXqpOePLU+SykxicIarSNylVC?=
 =?us-ascii?Q?ChqffVSnugz4FBeNQ+pC/3vqMor8Mv3TdAiFsqQrHsAc76QtWimBQe7v9nUt?=
 =?us-ascii?Q?YmLRcKQuWJ2lFcecpJsGNN3kEDQFolm+CjFAzhC8PpktDcJE0XpxrXloTT5j?=
 =?us-ascii?Q?8rLYcMf9pttaFO40roHDRl9MDyl4bB6jeiY7dDZ+HrMXEfJujR+I2KfE391c?=
 =?us-ascii?Q?gci+nalE2Gk8BorRrInY0X+KUPSHsJXLogi27p+pgZtG8tka9YnykBlTxE5R?=
 =?us-ascii?Q?BCYGyFsIAm0S1UK9y2mWkC07mNHt+gym6K+xG58nv3lw/0g+V1TLMHyoqlM/?=
 =?us-ascii?Q?8Jzp91JQRc3S6HcibIWvq1F7po/wIefI/cz6i9ExmJJYyIoisSNzVxQo9aF4?=
 =?us-ascii?Q?kpIofTGRQ9QN5t2oUtN5LrDxXCyqrrQDWMjtKEn3j+IF/zN0+ns6qlNm4YYb?=
 =?us-ascii?Q?+wFUG5mCoLhQMmMyz/3GsRSDigZokyblPotC?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 14:02:36.9162
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2f9b690-a0fb-4528-caea-08ddcb83e92b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFCE25C719B

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

Drop stale in-code comment specific to grant table mappings.

Fixes: f9f6b22abf1d ("xen/arm: Map ITS doorbell register to IOMMU page tables")
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v4->v5:
* drop comment

v3->v4:
* adjust comment to be architecture-neutral

v2->v3:
* split change into 2 patches
* 12-character commit IDs
* change both arm_iommu_map_page and arm_iommu_unmap_page
* s/IPA/GFN/ in comment
---
 xen/drivers/passthrough/arm/iommu_helpers.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

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

base-commit: 6cd9b9226c65c962b0f0e040e7d3d5c4053f8e06
-- 
2.50.1


