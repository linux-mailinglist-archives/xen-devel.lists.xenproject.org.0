Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0A9A7ED97
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 21:41:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941062.1340673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1sLC-00014W-6M; Mon, 07 Apr 2025 19:41:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941062.1340673; Mon, 07 Apr 2025 19:41:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1sLC-0000zQ-0J; Mon, 07 Apr 2025 19:41:06 +0000
Received: by outflank-mailman (input) for mailman id 941062;
 Mon, 07 Apr 2025 19:41:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tcrT=WZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u1sLA-0008Ee-CP
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 19:41:04 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2418::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c66693e-13e8-11f0-9ffb-bf95429c2676;
 Mon, 07 Apr 2025 21:41:02 +0200 (CEST)
Received: from SJ0PR03CA0126.namprd03.prod.outlook.com (2603:10b6:a03:33c::11)
 by PH7PR12MB5856.namprd12.prod.outlook.com (2603:10b6:510:1d7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Mon, 7 Apr
 2025 19:40:59 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:a03:33c:cafe::34) by SJ0PR03CA0126.outlook.office365.com
 (2603:10b6:a03:33c::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.33 via Frontend Transport; Mon,
 7 Apr 2025 19:40:58 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Mon, 7 Apr 2025 19:40:58 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 14:40:58 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 14:40:57 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Apr 2025 14:40:57 -0500
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
X-Inumbo-ID: 3c66693e-13e8-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wvAfA0T8yXAuv36Q5ngQ4HPhazAFVPtN/QxivXH21Ch8QVO5SsZjXq80MUxBg9hWmntjtR77LwoRJtwZCHGO2EpJFB1SZwOUlwP38dIxWMysvo87ZqAam3jWdpOzQ901SwYBpNq4Vo8X/Ipnu8YGudyNraEDsKU24HvBgs93OWyxlCvWy1PXDI/gRJT3mBtadgOWDd7tlYk1l7u5+zvqDAOXaDC21lnIvrTBxv0xfJsaQcT5FdIHUQ8EE63GGOR3k91d4fYroRWsgpnmD7r58IgM+/GucPBpmUNEI9e2QBcVXSPAGZWsrCTMcjNcQIsfoitsGocJvErjYqFXpzbRdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZf2RBZvVgDYlcOT0NiNdgzzcNycZmzQZeGr4p0wqq8=;
 b=URPDGPF/g4oFu889g90gi+1ElHL7Dvm2QoKDmqmn3NsORf8deBsFemnyw9VWKqQ3pziay0xDWyTC0w9vwDls8HJXfIR5eMOnbHa+Dww46S7w0JOB1Wui4F1dREWHvC6bPM0A13sqLulfld52kx/PpsV0uHNia3YsaOwxHc27HZ8znOHXucYT36g9qGB8ad9n6NOwNS4/4zkqSjgmOAnB1BFG3JU2yqa61YT+DJ1zEqF/NYlGVOzJEGXfFS7y4scErx13L3+mNrnZR5znwgMInyf1Q2BYnq+s7BaLsSF1CMLXs7SZe5/SpGRVt4uPrQ9smF/YJksU22lwGJdWpzNoJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZf2RBZvVgDYlcOT0NiNdgzzcNycZmzQZeGr4p0wqq8=;
 b=soyO7qY16INzs1o8pDMz8AY/R2BvfCyqsXYEQ8WaUq9mEuEJT4czexKqyqEdd7GNs71RI8mK/xSbQb6yGGk2jrMkCZIab5ml23tyBf8vC5/B8qkH3zpJKUYZRyxCQmPH3sxMVVAg0KiSNJQLAHX0MSnru18MPIzBJLwfQci3Kq4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 6/7] xen/arm: dom0less use has_dtb local variable
Date: Mon, 7 Apr 2025 15:40:37 -0400
Message-ID: <20250407194038.83860-7-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407194038.83860-1-jason.andryuk@amd.com>
References: <20250407194038.83860-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|PH7PR12MB5856:EE_
X-MS-Office365-Filtering-Correlation-Id: 71854cb5-51b6-42be-9ad3-08dd760c1f12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?O9KVJfUck258C1eE9jnSbpuRH4KBDgSGdb+37CmPiT6FWyOEp+ZCZdpfUB3r?=
 =?us-ascii?Q?qT6tErBt4MZ37mPxrZrukLT2T0cpn02B6y7nDGVtccvq9llRE8cK73CvM1t5?=
 =?us-ascii?Q?MtUvIdJUwr0kKCKOAeQCP37B5D6zFtCCglCU2eiLQkWkZYsiniTWs0M44l1T?=
 =?us-ascii?Q?pjRpZh6FRbKOF6XWvNzs7v5O5i5neydC/gpCyIDTlgODMKHtRQzF3fbjguii?=
 =?us-ascii?Q?vaLtRZ9wzoBZeo4FkykGor1DNbK5f45prSIGh9r2YF43dYL8I53f6lIdQfjY?=
 =?us-ascii?Q?a5e4djxG0kigWmT9kt4mD611Qt2KIY8ehrbPqJA/Re5h+NXhcKYf2LFy9u5H?=
 =?us-ascii?Q?Vo7uqsisNyGxOxmSoQRHeO5oUvHjsNuh33G2qDkEC3FEh2A4ZPtuHFH4SdTU?=
 =?us-ascii?Q?GswOyvwy/M+C81XRC2kFaAA1HHHK3jmHejskGIP+YNKLB4dzQTJJN3CRnHGx?=
 =?us-ascii?Q?BLYl08+ck9ZWhTdxXKQVvzqxXEhwTLl4F9AovWDMQV0lgM6Wiw1Y295uhqYi?=
 =?us-ascii?Q?bak7I+cPdv44aBHepAxWAVquprwDkFCwLrDCvIA8Km525SGXJ6eSbIZPWDBL?=
 =?us-ascii?Q?HivEUCbEh1TvoybVzGaLkDOqgJEqMLetzTpwxJ3lXHqkfGt3qJeDvExrMEVh?=
 =?us-ascii?Q?M8vkpVEACin7Exz+vVJPp4yWHQ24HP/uNTOKo0Geu458A/dkcv449O6v5YmX?=
 =?us-ascii?Q?FX6buS1YMf2bm+2WpNnT39QXTADZfHnS0WI1O6cwqMywqD16gm5TXQr4CbFt?=
 =?us-ascii?Q?wcDS8It8IJ39BaoJyQxdWSrU/LhSEqbf7bvNmHPWWMGjYnDyvnyiso7zFyC0?=
 =?us-ascii?Q?Lj3Pzq+zovjZt3lECwYoVnXZKRKKtPaKHkExykF/fESGF7Z8sMeHHgtPj1zm?=
 =?us-ascii?Q?NFDiBW6DnIdWpkI55qCpXgpB1mYuqUD6UtC+9zEpfqjEapXSb5W0dqcMwCmj?=
 =?us-ascii?Q?wIOw3Kj7SWaIkdX/SwMuS0+gg4ACwWzBbn9MO5bpMSvXCv2KNDsaOprglTyY?=
 =?us-ascii?Q?m5tYAlNNSHKfpHFAQS23BlR9kdrIA+LBo+vXXWQfkarEji3CO8BLz7OUtgu+?=
 =?us-ascii?Q?jbh4CG88jhrQCA+NH9He8/0qrBX5DATK6R6loWsmhVvRk1Oi4Fn36weOHDpD?=
 =?us-ascii?Q?Uw4rT9R2cvxuZXyETx1vH1sNO5SLEBrdPtwhwt8nCT3XWTz8FAJWfQxGN0kE?=
 =?us-ascii?Q?yWMcyYhlQ+2O7QRgN1L9EgU6Z9x6NuhR01HEYvqxcDnLi2f0F+cy2k5t5vYK?=
 =?us-ascii?Q?rfz9ynNuUvz+sc2lXqSZUEZUa232Fj5hXPcN9xUkbLzsKKS7iNmioSDDDQIl?=
 =?us-ascii?Q?6/fixQoWXcIpO6OrX52dHI11GE19Wq8vxrIdN+uBAj7hzeNKZNNPlIxNMzt+?=
 =?us-ascii?Q?2R4cqUjExIzRdtIwcXKj4xZoUikv72oM7QGDaCMP1qCDqLHc8t7qnZXRBYlw?=
 =?us-ascii?Q?jBuSd4a2bo8n3bzj+VbQ1tlEhE7eGptDtGCxtQZ/b+rK+asKKrX/oyI41Lkj?=
 =?us-ascii?Q?wjGRoDiX9sR5pmo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 19:40:58.7914
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71854cb5-51b6-42be-9ad3-08dd760c1f12
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5856

Store the result of finding a "multiboot,device-tree" node.  This will
simplity adding hardware domain checks.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v4:
Add Stefano R-b

v3:
New

Could be squashed into the next patch, but this helps make the next one
cleaner.
---
 xen/arch/arm/dom0less-build.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 188ef40b52..50d2d3e4e4 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -1033,6 +1033,7 @@ void __init create_domUs(void)
             .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
         };
         unsigned int flags = 0U;
+        bool has_dtb = false;
         uint32_t val;
         int rc;
 
@@ -1067,9 +1068,10 @@ void __init create_domUs(void)
              !strcmp(dom0less_iommu, "enabled") )
             iommu = true;
 
-        if ( iommu_enabled &&
-             (iommu || dt_find_compatible_node(node, NULL,
-                                               "multiboot,device-tree")) )
+        if ( dt_find_compatible_node(node, NULL, "multiboot,device-tree") )
+            has_dtb = true;
+
+        if ( iommu_enabled && (iommu || has_dtb) )
             d_cfg.flags |= XEN_DOMCTL_CDF_iommu;
 
         if ( !dt_property_read_u32(node, "nr_spis", &d_cfg.arch.nr_spis) )
-- 
2.49.0


