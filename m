Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5155CADA8B3
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 08:57:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016685.1393640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3mB-0005l6-1C; Mon, 16 Jun 2025 06:57:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016685.1393640; Mon, 16 Jun 2025 06:57:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3mA-0005jW-UG; Mon, 16 Jun 2025 06:57:02 +0000
Received: by outflank-mailman (input) for mailman id 1016685;
 Mon, 16 Jun 2025 06:57:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iJcO=Y7=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uR3m8-0005jQ-UH
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 06:57:00 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20614.outbound.protection.outlook.com
 [2a01:111:f403:2408::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18b7a1a6-4a7f-11f0-b894-0df219b8e170;
 Mon, 16 Jun 2025 08:56:58 +0200 (CEST)
Received: from CH2PR17CA0022.namprd17.prod.outlook.com (2603:10b6:610:53::32)
 by LV2PR12MB5800.namprd12.prod.outlook.com (2603:10b6:408:178::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Mon, 16 Jun
 2025 06:56:53 +0000
Received: from CH1PEPF0000AD75.namprd04.prod.outlook.com
 (2603:10b6:610:53:cafe::4a) by CH2PR17CA0022.outlook.office365.com
 (2603:10b6:610:53::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Mon,
 16 Jun 2025 06:56:53 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD75.mail.protection.outlook.com (10.167.244.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 16 Jun 2025 06:56:52 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 01:56:52 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 01:56:51 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Mon, 16 Jun 2025 01:56:50 -0500
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
X-Inumbo-ID: 18b7a1a6-4a7f-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p0JC+bNiinUAcQmdIDSXfPAj6XkiOi2ZweNEqWvRy7vk01jOtT0CilCDix3fGQb1JHO88Tk6frhpHSHyrHTgk3Q0cvSZTdxaV7dZ9w9qizx67O2IzBaF74aAZq6LFKMdqVgmT1AsnwJDw5FLEED7p22gOIpLbSPgfmwtzAfFZBKJt22pKYvVmWrswuTLzoJPwcW6iBFvCV2Z1psNfCoGAs52u9wDhDGNxLvLAgd/9leh4FUnWu7sRoMsvzTMcetPCMPrnbLOF+AVstiOCtKxDPilQGPy2nWBN3HMBh+leGmdkOsjS2mXUEofgTpz0eZhDhgZ6DD331YjnYcSHtZ/AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/u9vc2Yh18LQ/kV2+OYDJu5UeOkfnKzyLdi8UYEUIdc=;
 b=CY3WLzHNW8P6o0tnfNSQpQvRKaAk/ncQUCYCKJjBzaNd7aiOomZj6+qVXzrmCphvBHRWbyz7/WrjqRjIk6x4Rnzxfeza+hZqp2kTaF9YwKVG3Xzj3D3arBjlBE9kADZB1R0rfGUN3QYM+0zLA0jsNZCuatxD3nBtu4hkr0OjdY9nBRLt/Iu2WbwDnB2nc2yQMX4T67o4AVk/J7GgtdY2o6o83BL6+c8zrTp0iQwRhgsIOAUH+gqzILH37Wtf8HRIDzQ7KwlemRPvZIYoPSKujNVXvw9FIM4g3pYU48V408kSUlXCktUh3BdRywMLhGNC2/ik1fDOivFVK39HkjlabQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/u9vc2Yh18LQ/kV2+OYDJu5UeOkfnKzyLdi8UYEUIdc=;
 b=XTOZrXkRSpmeRsMJ+u0oqVWqHbW6XflEX/Y1nlIfTjWB9gpjUHEdjBciVjMYbYVHJwqEEbecoQL6Wn2qzVHvd9eNLnXMGKlbX49CdAy1dEjUrsmNlrV824oevX+xReBt0p5E6fv9wfp+xZXddWMGbSqNCTndk3FaRPzPY57itCw=
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
Subject: [PATCH] xen/arm: Fix P2M root page tables invalidation
Date: Mon, 16 Jun 2025 08:56:48 +0200
Message-ID: <20250616065648.17517-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD75:EE_|LV2PR12MB5800:EE_
X-MS-Office365-Filtering-Correlation-Id: ec51225b-92a1-48c4-1e47-08ddaca2f99d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?T3MhFuNMLiNTn4L9okjquPqixSVp6or0q01RvjO6VTXxiNamTSD0kwHCJT+p?=
 =?us-ascii?Q?FM1EyEuyknFxdam0LthZutiugNUoFXAaDcChb0ee2VuvGmcp1YmtKfQpRuc+?=
 =?us-ascii?Q?8QgYhe9MlCWzl2e9hqNSaqQuM+k3oQcqG5AoRhDxuJ12fZ71Ui16+j+ybrJo?=
 =?us-ascii?Q?LDKqwr9QlcGeMnADRAjrYSvCtVVy5pSMGCJS+ouMAsCXOrlN83Vm10Tu0BYO?=
 =?us-ascii?Q?SsQj7f6zlrIVZ33tI5Ipb7oXrtHxmGvx2Uv1o+zhIEvtEatWRMZR6e6fABtJ?=
 =?us-ascii?Q?mY5NZJhWRUeXR5Ds8uFUFv/aJymKRslZSmdfRW1OJNSEZ0qC4tToE2rK0y+W?=
 =?us-ascii?Q?oNU42zY+cKCi4ZRflCbWQgZPIjyyfQae8Uv1QlO5jFWktbKgkgPeENrNx1sm?=
 =?us-ascii?Q?gwIxjrHxvuhJKDwz5KzN27kQDMMGwQHYsY0B1CsAWFKbWIFX02jOtLBEuYEw?=
 =?us-ascii?Q?a80EOT1o/DydCodS4iOb4lPCfABAx0aKzyM1pD9T3tVd9GSeKZUxA+wofFKz?=
 =?us-ascii?Q?zkyfazAqDNImKOgmySvJgu+zY9DxVL1gj9V+lGc7BYvdAfpA4eBy5TqjBooE?=
 =?us-ascii?Q?TAgm1uL+RA+TBgA1nAd/BvCY3AzdJCf11bKyr4ArF2bQfitdYqqOKmR564vA?=
 =?us-ascii?Q?XB3mqxHiuFcQdZKL38PL4lddyZdLdHDFCNqpsfCMQjnLAaPMZzE2Pyyh7dPs?=
 =?us-ascii?Q?mzOO1VBXN6W/twG1bG7zt/MExy/Iu+JZ6h3UnDS7LWatcZ3vV0zNt9wz13W3?=
 =?us-ascii?Q?95ck+7qcvCLTBkH1vrC2/SLKQG5dcJbn22i+lxFbwlMCNbg2m/TNk3aLiIfX?=
 =?us-ascii?Q?BPgkhgKuqVzvk+/RUKWA0FdMUUrftA8NvFVOK1BH1jsVnpZvXhvqfYFWQXDz?=
 =?us-ascii?Q?KUW4Q9DTmeUl6lPpZqqJ+sqWbomS71JOzsj6Icc9Fs1/6Jbyzb5TFA0J0kvA?=
 =?us-ascii?Q?046lOHfqxZ0KOQHVRVUenBx7kM1S26lAYRQmJZf29dsWn54waejZyTNjWwHj?=
 =?us-ascii?Q?0e/4AFhFnq/4rgLeRSUOVS32tjptKSQqKHDK8t/GsG/t7zSgSeUOvt+OB85d?=
 =?us-ascii?Q?5LQeyWkIJVdTTMdwp3r8zbCWSDPBey8aTp43V9klR64iVjvZT59peIW74m2s?=
 =?us-ascii?Q?CyNZMZ7Job25RSisd6b2ZzKkOBiKXgxqZ4LYx3Ppn81j2Zxh5u+ldnAH3Unh?=
 =?us-ascii?Q?KnQXQV1c6FGbCplperpaK8QuCbP/M1SP9/+957YNLH/30/HT1OdKds/F220a?=
 =?us-ascii?Q?tRraS2yJjr0ykrLzQ5NWIrCAQWbC4krV4zRXx7uNQAai8XeZUlkoy/Sr/+Mk?=
 =?us-ascii?Q?ngj4QigOyTjlp7ca8ZmMblywZ487mclK+ZutoQQ7F4zE9XDYNeWRUcAYxfoK?=
 =?us-ascii?Q?Y8+w0NLJPhPWKOduZjsrUNI0htziRN5rj0LWSIVrvGvimBFlBeF5hphNeIpu?=
 =?us-ascii?Q?7ruhhSsdrtmwIqFG1Ody7O8AQDsTwFdE/EudGnV8cucN/S8s7ofDyxghSjZ0?=
 =?us-ascii?Q?EYz35D6eB56TqM412NtrZqa4SezB+iDJZ7Dk?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 06:56:52.8442
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec51225b-92a1-48c4-1e47-08ddaca2f99d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD75.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5800

Fix the condition part of the for loop in p2m_invalidate_root() that
uses P2M_ROOT_LEVEL instead of P2M_ROOT_PAGES. The goal here is to
invalidate all root page tables (that can be concatenated), so the loop
must iterate through all these pages. Root level can be 0 or 1, whereas
there can be 1,2,8,16 root pages. The issue may lead to some pages
not being invalidated and therefore the guest access won't be trapped.
We use it to track pages accessed by guest for set/way emulation provided
no IOMMU, IOMMU not enabled for the domain or P2M not shared with IOMMU.

Fixes: 2148a125b73b ("xen/arm: Track page accessed between batch of Set/Way operations")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/mmu/p2m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index d96078f547d5..67296dabb587 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -1291,7 +1291,7 @@ static void p2m_invalidate_root(struct p2m_domain *p2m)
 
     p2m_write_lock(p2m);
 
-    for ( i = 0; i < P2M_ROOT_LEVEL; i++ )
+    for ( i = 0; i < P2M_ROOT_PAGES; i++ )
         p2m_invalidate_table(p2m, page_to_mfn(p2m->root + i));
 
     p2m_write_unlock(p2m);
-- 
2.25.1


