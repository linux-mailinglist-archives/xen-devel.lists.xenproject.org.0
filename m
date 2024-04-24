Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A1F8AFFC2
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 05:35:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711016.1110648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzTPb-0002pK-PA; Wed, 24 Apr 2024 03:35:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711016.1110648; Wed, 24 Apr 2024 03:35:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzTPb-0002nN-Lb; Wed, 24 Apr 2024 03:35:11 +0000
Received: by outflank-mailman (input) for mailman id 711016;
 Wed, 24 Apr 2024 03:35:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Z4K=L5=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rzTPa-0002In-EE
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 03:35:10 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:200a::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a525c537-01eb-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 05:35:08 +0200 (CEST)
Received: from MN2PR20CA0021.namprd20.prod.outlook.com (2603:10b6:208:e8::34)
 by DS0PR12MB7680.namprd12.prod.outlook.com (2603:10b6:8:11c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Wed, 24 Apr
 2024 03:35:04 +0000
Received: from MN1PEPF0000ECDB.namprd02.prod.outlook.com
 (2603:10b6:208:e8:cafe::87) by MN2PR20CA0021.outlook.office365.com
 (2603:10b6:208:e8::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.33 via Frontend
 Transport; Wed, 24 Apr 2024 03:35:04 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECDB.mail.protection.outlook.com (10.167.242.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Wed, 24 Apr 2024 03:35:04 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 22:35:04 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 23 Apr 2024 22:35:02 -0500
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
X-Inumbo-ID: a525c537-01eb-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JoPK4Jtfc5aTxJoZP3cA2KnDZXMZ16X2SN3dByJU4IAZJ3gu1npJCvlcgX9LFBfK335WhG/nSdR/xdSdcm5tESkD4i0Wqx7nqmmQBiIwA5dkoJzr6Ro5OmGoWNWcfNAHYK7AtuW6eGzg/XBWSDkdh6CRgK719ff1LbW9TXBzthSKHS5UXT3k56WEF7xnbDnOaMqmo8JEmCrYvm4LZ6oxQpqhekh24uHXsfnxgmG47cjQxttBu+yG7lRjoh6oFPJPGYoopKVzboHY24RBE3oYd7KQELiPqYWddga2Yr2o38iDSVS6Ce8rF8P+cw61PLehWjO7nqw1DrmC1wiJiPUzOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mRz8rsYNOg7W8p6WCOVFtK/rtd0GqejAmZ7U+c2Atjk=;
 b=VwBwgNovkKBfqeElHufhdZxuS3xablGa4lsGyQHKMOh3n9T6rjlChgX23rXQqOu1GOzyHakJ2uJZYmxCYr6tGe+jo/Yfw6exJjQI7x0kXOsJqnUF3xPFnjFV4u3SGwBdu0svzFqpc5sHG3qllg1mkjorbdrA5VS4hHP5AwTBiupS1nBJf1Mjqe35MNf9+hDkdg9J9Efc3Ue4ECU4CbUuXUUHuXI9Li8Wf5uw5B2XlJJ4EdQEV3QDvbmSZSX5TLC7t/51vbxWeex1QG70WSUY9f4hOGFArmtWlvQnMLobrqt109OLpbF2yFinFWaNRl6z9coGfpr9DyFgaG1TUvfjcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mRz8rsYNOg7W8p6WCOVFtK/rtd0GqejAmZ7U+c2Atjk=;
 b=dEWKSDVl/TkuQjzuchM1mDVKmCH/b7/qtN8Qg1hUvOEP9DjxAeTe7cKDVCJgS1SNHASRIv/mbEHB4wmW2+E5ET1uZBmzIncY+fojKFprU0ipxp9xvgtbwTzTPmUuKiDn1wKGLHDrG/xyC9d47F/nmkere+Tqe5OKDxSi+0To7hk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Vikram Garhwal <fnu.vikram@xilinx.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, Henry Wang <xin.wang2@amd.com>
Subject: [PATCH 02/15] xen/arm/gic: Enable interrupt assignment to running VM
Date: Wed, 24 Apr 2024 11:34:36 +0800
Message-ID: <20240424033449.168398-3-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240424033449.168398-1-xin.wang2@amd.com>
References: <20240424033449.168398-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDB:EE_|DS0PR12MB7680:EE_
X-MS-Office365-Filtering-Correlation-Id: 59ed944a-8879-47d4-4eb9-08dc640f8801
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gy/DhkHsf1PBtujLtrnvaDMkm/tllfcv5PM+8bT1T3vXe7n9QB5UvmIY7Ajl?=
 =?us-ascii?Q?i2MdspljOIRjh/IJasxK9TVuuvkK+d7uV9f99ZgxPEcGI/qcmAX7Az+jGASm?=
 =?us-ascii?Q?+//7T50QL/arMV8d0PZ7vqqIeMrcul2gRtXxoQGJFM3LNha8FzfwlPri/bKK?=
 =?us-ascii?Q?fmd85Tv8P9VhtAZhZrgudvMv+BGa0gG+ZWsbVsbiXTVcFbx+3xQzjo6Tajpj?=
 =?us-ascii?Q?hi17PuVMWdJEcszp6e9gs5Ky66XkhATqDXOilJs0658vO/dhQu1QFMtScuMC?=
 =?us-ascii?Q?fYptWyquaBPytBjxH/lpNYFmNkM6jBX0SkZjQRctqgowz0XfhCW52bnQ3kV3?=
 =?us-ascii?Q?SEJV8AGD+j3qfjZQ97G432oR95jyvYB+Dl14Qc2qakEeVTguNXK0zDmVloxP?=
 =?us-ascii?Q?AJ+dSa0Ag97ABYG6Pu6Wm0CIw29hqNn2A0Y8ZoWdq679bYHLPnPiPbh0uiIL?=
 =?us-ascii?Q?ckLiM9KKNzkWdPGaU7NTyojXSdquGELKuOwlVfmTLNEDQHpZF7f5VpI9DK4y?=
 =?us-ascii?Q?pUYXKpQiCSCUZtuQOa4qydsuVZDQG/0jGlIxaEfXorwPSvSyOuX2ecNgNiQC?=
 =?us-ascii?Q?GgTdu9w0jPg5cN9MS4rLi3ivKuTa1zxZvWT/P0O/TkkaDxw3Kkksx34akkvp?=
 =?us-ascii?Q?A4rc7Mu5+aUQ9j4rXNdibGEAJBktEVMuZ4rb9/3+/ibLS00aT/uGQoW594vV?=
 =?us-ascii?Q?gvQeRPIFjK5XGZst5nVgWzIut83FCzJ2J+0S1uR4wKVepHuTEopMaAV44bmB?=
 =?us-ascii?Q?juyXktoIVide9U14JRk//LUPfIwcRBHp1lc4mfMxLRoC110F7ZsV6V7dmBdk?=
 =?us-ascii?Q?DjWtzMNd6UQHZucKeBvxGlseALc7p89ggPVHjFfGUJ5TJz0T4myCFl3sc3ei?=
 =?us-ascii?Q?fh/z6yOrU5ND8xYRlxXoQKMKm1W22qa4M54iqjWanx8jL+M5FFBfFPLl+tmV?=
 =?us-ascii?Q?yYJN8idjsvZJBAYJ7H6UUfzDXfWchFrvRgKqIaC32USk9HrVxrszhxz8aTog?=
 =?us-ascii?Q?X7rpgGvYDoJ1KMWmI4J1I46uY7txSN7oBf5tvZI5eJEWvYPwVIHTi4zb29iW?=
 =?us-ascii?Q?PnRlqssz7TgCteO5LGMDCOAi1kIphE8C7gmpbFPP3JZBm231DfFpc2LETFmX?=
 =?us-ascii?Q?ATBWnRWNiOM4o3ZJ/GWQfKDil5HqG4eKveesW4dmSe4eLmT0iDBoc6y4sVrl?=
 =?us-ascii?Q?HKcC67helCPZZXpm82BUdYDbv8MwClTxUxPdqpcnv47P9gOFu3QsQgt7WOLU?=
 =?us-ascii?Q?iGYTi8k++qILUnSC1c6y3cavAu6bN8BJucxluO5Q1BrGNoUF9fTd4DA24GjG?=
 =?us-ascii?Q?imqN7Zd4fCSGq7bHTY2X8ArU4yIlrAQ1o0ZV0J3losRT+CgOQSILmj28n2hd?=
 =?us-ascii?Q?0E8EGKC2ByGOhQnSUJu1opJSfwjj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(1800799015)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 03:35:04.8373
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59ed944a-8879-47d4-4eb9-08dc640f8801
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECDB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7680

From: Vikram Garhwal <fnu.vikram@xilinx.com>

Enable interrupt assign/remove for running VMs in CONFIG_OVERLAY_DTB.

Currently, irq_route and mapping is only allowed at the domain creation. Adding
exception for CONFIG_OVERLAY_DTB.

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
 xen/arch/arm/gic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index 44c40e86de..a775f886ed 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -140,8 +140,10 @@ int gic_route_irq_to_guest(struct domain *d, unsigned int virq,
      * back to the physical IRQ. To prevent get unsync, restrict the
      * routing to when the Domain is been created.
      */
+#ifndef CONFIG_OVERLAY_DTB
     if ( d->creation_finished )
         return -EBUSY;
+#endif
 
     ret = vgic_connect_hw_irq(d, NULL, virq, desc, true);
     if ( ret )
@@ -171,8 +173,10 @@ int gic_remove_irq_from_guest(struct domain *d, unsigned int virq,
      * Removing an interrupt while the domain is running may have
      * undesirable effect on the vGIC emulation.
      */
+#ifndef CONFIG_OVERLAY_DTB
     if ( !d->is_dying )
         return -EBUSY;
+#endif
 
     desc->handler->shutdown(desc);
 
-- 
2.34.1


