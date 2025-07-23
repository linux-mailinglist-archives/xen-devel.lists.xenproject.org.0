Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79201B0FD25
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 00:55:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054877.1423522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueiMB-0007dC-3h; Wed, 23 Jul 2025 22:54:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054877.1423522; Wed, 23 Jul 2025 22:54:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueiMB-0007bW-0m; Wed, 23 Jul 2025 22:54:39 +0000
Received: by outflank-mailman (input) for mailman id 1054877;
 Wed, 23 Jul 2025 22:54:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3I4v=2E=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1ueiM9-0007Mt-LP
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 22:54:37 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20625.outbound.protection.outlook.com
 [2a01:111:f403:200a::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0094a836-6818-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 00:54:36 +0200 (CEST)
Received: from BL1P223CA0041.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:5b6::12)
 by SN7PR12MB8025.namprd12.prod.outlook.com (2603:10b6:806:340::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Wed, 23 Jul
 2025 22:54:31 +0000
Received: from BL02EPF00021F6F.namprd02.prod.outlook.com
 (2603:10b6:208:5b6:cafe::68) by BL1P223CA0041.outlook.office365.com
 (2603:10b6:208:5b6::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Wed,
 23 Jul 2025 22:54:31 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00021F6F.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Wed, 23 Jul 2025 22:54:31 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 17:54:30 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 23 Jul 2025 17:54:30 -0500
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
X-Inumbo-ID: 0094a836-6818-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bOZ2Smh8zSzVUzps4P8+5Z/6zZmffWqYvextwjsTtul/YVoSmNYZuqtZDq+I9XUy23UTVL8fC1WZBGSX7Yo4h7SHcTWodYOQNTqqOxHj8Xy8KPH4H2LtjAW8fGzoHtIGX5av0PmKwaptAVluupUMcLJfv+GcrMQrPLvOQI4HVi2htsEtKdl4OKueqtVZg3FcaFBVSfirWyi4fkP9tKyUiASCmbq+OuiSHgU0CNW8frZigiutUh2i4uF7A35b5Q8fNAAyaivJKUIpRafsUrtt3owheaswoHtN351ABUqBIn7kOjWJ7mQliKOrOk00t/PixF3Ps9Ok6yim5CsdzJo+6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W9kVo6Nr8Q1c3+SpiVu3s5bLNVXzy+8rSmwpY5RA3Y0=;
 b=MEuz7gkcfGuL+86RRiLXSu5Veff/ZI+rlVWPVFQCATu7lKvmG0Ef0lvT8ty6oje06eWEK/cue5OJmBL7d5N3KJtDVIqL6dlg3AETqzWY76LjDPQTilKVTpVR6iGqrrDPhxzG22f+x+Zt5WXCGxHGrS9IZqrKdN6GMHlkCBRHVykRSsPzUadFt0+3jZuDVT013+ELfroPHRjCwbF79AzNNc3x4I9IIyK1GDFeHzywHgrn4awHw3lQ09L+8Bbk6CaIbFbcH6VDkpzmGlQwHBY7pqmis5e6cGeljBuJxUtHTNZp+mLF4fRvWGjiUYvAFm803AxjwDi6XJ6e6Gopt06uTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W9kVo6Nr8Q1c3+SpiVu3s5bLNVXzy+8rSmwpY5RA3Y0=;
 b=SM3F+X8yoFdlq+ABG+eT54WRY9NrbzZhmIbvaH3XXX3NUEWPDh11QlfVSZ5FMBGTWgn61Wjwqfn4m1S6ggT6YIIRgt0xIivjn4IjhkWRQqNd+i8wtZd3LHYdPKQxNdR/zSBEOklLuNYmkq5TUpXZvcLK/jh2wl/11ZeVztCpUeA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, "Michal
 Orzel" <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 2/2] xen/arm: smmuv3: fix xl pci-assignable-remove
Date: Wed, 23 Jul 2025 18:54:20 -0400
Message-ID: <20250723225422.116387-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250723225422.116387-1-stewart.hildebrand@amd.com>
References: <20250723225422.116387-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6F:EE_|SN7PR12MB8025:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f058ac8-2247-4c55-5e28-08ddca3be2bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vFbprmpNgx0z0/I32AQ7Gw/C+HYGbCiVeMUXa7HFn36/HyfJdzkPHApjQP3y?=
 =?us-ascii?Q?s3ld6EidXwjQ413Q4vrOarKdk7MakLbBQXQsD/Xx3vvsK7Fjqd1V1k25RECz?=
 =?us-ascii?Q?RULVm+yCmXHx1LnEDOg0PniGrmmUU1sVAKa9Bfcn2tIR1XyXhD6k/Lmdz7UG?=
 =?us-ascii?Q?mGINhVNsbUUa25+0t2SwHGfB5e59X/uQ1tBuIWfsfkdef9NySI0jtb2r/GFG?=
 =?us-ascii?Q?Nfks7u7rNuJVW+LAuwi4xiBYzxqFlSEs66Ks/VXbfUAfXHNzCSNXzNpghXUn?=
 =?us-ascii?Q?RnWJUoSgADw8pWzbOU/XZCDfuUV8aI1U/MEOasBcJBvwvkiIu7ARjhodyh2t?=
 =?us-ascii?Q?UUOXWgo1UcwQhBOMm9uAnmNCdxBWD+pzLlwxvSMvKUuVKEFVF6E40RQHo1yX?=
 =?us-ascii?Q?ThKi4daJtgOfRXM9iQkJgzVasC5jdnrlXO67/vuWx9Uh+IuvBVHj3T2JYd8d?=
 =?us-ascii?Q?yxcG3c+KaM48E5HRvdYw2u3VgQ5bUhQaRsRZZkapIrFp2Z9a1kygbuvP3I0X?=
 =?us-ascii?Q?VhP+nJAEMTDd8HAylSioS1Cg0iv4TKAa6ayRLR8gbCjPqPgNTfp4TRCKIMvw?=
 =?us-ascii?Q?xKWkPtgywduKbvjJ7gfgDJk4T2Ua0okFg3tD0jmPZe8ig//8KnpDYQhOD1s2?=
 =?us-ascii?Q?5j1WbpJWcYz37jt+EdNsxt1taJDAOFlQ+Ty8ocx8tACPFDSzzUVdbKXhKiGl?=
 =?us-ascii?Q?T6N+zrT5xBY+VWu97PPnIjkWAzaVqog+o7Pq/Exq/40ysDhy23TF2RO6RDf+?=
 =?us-ascii?Q?PqHIycVf/N+hb9vH6f8ZtsmlNDA9DPSye0AzUL5xrONRfrHBnVqV9SLlE4Xj?=
 =?us-ascii?Q?V8abdgftryz+kGpFepWtkGFnbqlie1p2jyCxOKRsJAk1hHriposhUtTs5H/B?=
 =?us-ascii?Q?YAdf85GsVb8o3YzTbcHGkV+DlAmgx7pPktDCet6xAfw5aiSRbF9fNFm+c360?=
 =?us-ascii?Q?B7OxrrWYNoZKm2sjWgZpwEZnnS9bBL8l8zPa/EvaOYLKLbt2js/k+yig9kn4?=
 =?us-ascii?Q?/so4X1jRNP/a8zwLJu4MCRis2AnESVWWE1uNCO5HfG0mUKRGyx5TjJUHKbO5?=
 =?us-ascii?Q?Akpu0q/TtR/C8bZFKtpHvSmZz2JdXRH0Drmp6s3z6IO2EPk0BUy6vjFnCPqB?=
 =?us-ascii?Q?H5eUpQKeOwdIVzYsbNnsYcQL6Lhkq0kDhrQpEyhnzLdX3thoWd1BgkrgGztC?=
 =?us-ascii?Q?8i+i39d02V/8UWJmfo2R9Hr0i/pglSFv41BhOs4C54YlGXkCLbJGzR1U2X8p?=
 =?us-ascii?Q?wpMCQfKpJyhL7BlHv6gmvNvUoSLaBiTDD+OcR1DiwqJrgYD79xr980i5JSu4?=
 =?us-ascii?Q?O88eOBPkmWtqI34Ue1qRleDCTeN7b6wPtcaVQDv/k9k39LHPL8FEJvqV9H7e?=
 =?us-ascii?Q?MXudGRXWartoPu8q7ZtuTD7wVrWFv8/QA1KrnUHtVRA4UXsNb5+iaBiyv/yU?=
 =?us-ascii?Q?/UG4omCsTuRkWKQB+xF7H2pdOVjvI5xTc8btDdu11Rf1lh2h4nAHDMUtdrhQ?=
 =?us-ascii?Q?NqK9MH2rMaVHmXZeyNb36TK+2xnlKOGYJMMa?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 22:54:31.1919
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f058ac8-2247-4c55-5e28-08ddca3be2bc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8025

When attempting to xl pci-assignable-remove a PCI device, we encounter:

$ xl pci-assignable-remove 00:01.0
(XEN) SMMUv3: <no-node>:  not attached to domain 32753
(XEN) d[IO]: deassign (0000:00:01.0) failed (-3)
libxl: error: libxl_pci.c:910:libxl__device_pci_assignable_remove: failed to de-quarantine 0000:00:01.0

When a PCI device is being deassigned from domIO,
arm_smmu_deassign_dev() should return before checking the smmu domain.

Fixes: 63919fc4d1ca ("xen/arm: smmuv3: Add PCI devices support for SMMUv3")
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
 xen/drivers/passthrough/arm/smmu-v3.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index db08d3c04269..9312bb3c72d8 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -2747,11 +2747,6 @@ static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn, struct device
 	struct arm_smmu_domain *smmu_domain = to_smmu_domain(io_domain);
 	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
 
-	if (!smmu_domain || smmu_domain->d != d) {
-		dev_err(dev, " not attached to domain %d\n", d->domain_id);
-		return -ESRCH;
-	}
-
 #ifdef CONFIG_HAS_PCI
 	if ( dev_is_pci(dev) )
 	{
@@ -2767,6 +2762,11 @@ static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn, struct device
 	}
 #endif
 
+	if (!smmu_domain || smmu_domain->d != d) {
+		dev_err(dev, " not attached to domain %d\n", d->domain_id);
+		return -ESRCH;
+	}
+
 	spin_lock(&xen_domain->lock);
 
 	arm_smmu_detach_dev(master);
-- 
2.50.1


