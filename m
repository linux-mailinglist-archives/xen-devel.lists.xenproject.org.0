Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8310B6FFA00
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 21:18:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533541.830303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxBn4-00044v-Gh; Thu, 11 May 2023 19:17:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533541.830303; Thu, 11 May 2023 19:17:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxBn4-00042g-E2; Thu, 11 May 2023 19:17:26 +0000
Received: by outflank-mailman (input) for mailman id 533541;
 Thu, 11 May 2023 19:17:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qWxp=BA=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1pxBn3-00042a-HL
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 19:17:25 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062f.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73e57476-f030-11ed-8611-37d641c3527e;
 Thu, 11 May 2023 21:17:22 +0200 (CEST)
Received: from DM6PR13CA0020.namprd13.prod.outlook.com (2603:10b6:5:bc::33) by
 BN9PR12MB5322.namprd12.prod.outlook.com (2603:10b6:408:103::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.22; Thu, 11 May
 2023 19:17:18 +0000
Received: from DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:bc:cafe::19) by DM6PR13CA0020.outlook.office365.com
 (2603:10b6:5:bc::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.7 via Frontend
 Transport; Thu, 11 May 2023 19:17:18 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT056.mail.protection.outlook.com (10.13.173.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6387.22 via Frontend Transport; Thu, 11 May 2023 19:17:17 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 11 May
 2023 14:17:16 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 11 May 2023 14:17:14 -0500
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
X-Inumbo-ID: 73e57476-f030-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=APPYOGhKMx3ts6jc9WSoBTvo6LCj+TSeWGxVj9VhIQzrpTzxhQUq7kMwypwdhNgQ3OY8bLXueHQCI8LTuqT+aKoABW+DzN5wxgQgVhinjQOg9FBCJ0lBh9uxjsn3ttwHiKA+lonYRH04ebhGLw+ZQSzKg68vTQdHDXS6qgxbddXjYkMol6mPWrCkM3flFAheK+sHNapJ9IpzLwfpTWt2p3iOgnmF8bwy752DeyItnLx/gnvhh48BD60ks96pagf27l+X3cyJ22qxTq2SmdUS2ewPTfjR1csnLeq1neGWmDQFDaW+jr4L1jSx8ecySpYLo/1dm/Yv1yzJz+uyJqWS8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m0+bgrDfozFwgaJjbhU1yrwEC2X4rAWcvmwSr5MYghU=;
 b=Ztqmtfzyyl3QwkAlP7TbPK/xljwlJpbRN7ncOpGawR54e4/61OwZQ5hUuvvYwg50U3sszsTKc6J7rjfiixsnoNjzDNqGG7rV81bz+UAJ124qsT3hmQ/aODyfcttDfggldWVcn+EmATXxso0j4/lRyFTvtHgWQ5L+m1RfXWZh1Njc118JBIpRVGk+tyibW6kDzTjuLX/23qQIllVDsMseNHbXVuQhURQMRiBZvfP4++mX3G9Y0KYexRRYLJX5YI2eS9GStuuYTcC4DQWt0qsnRunCyDvZDnJt9VEKPf50jz0EDUhUOnmPOyIYYsPt13EQAMq3pPfPtFVNlICDQ7woLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m0+bgrDfozFwgaJjbhU1yrwEC2X4rAWcvmwSr5MYghU=;
 b=qHM58tGhll2ghadVGdCJ2x5b10fD3JroQ/HOZcwt2LEHyWA8Ge88V8XmBlm6RVEZEqByTAB9fqBkMElh+BWgiTbjmfQndVx7cqeCmpTRKzwK1ck3NPCJkVS/M83mPdM3CqaatHtBt+e6VuzDh00LlFpglY+gmbnjCmTgzKiX18I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Rahul Singh <rahul.singh@arm.com>, Jan Beulich <jbeulich@suse.com>, "Paul
 Durrant" <paul@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v2 0/8] SMMU handling for PCIe Passthrough on ARM
Date: Thu, 11 May 2023 15:16:46 -0400
Message-ID: <20230511191654.400720-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT056:EE_|BN9PR12MB5322:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d6b2846-75eb-47c5-bebe-08db525455de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Zu7MhSvkpLg9Tat4Uy3N8cBzyW2XyyWDwM4J2KsVskuV698JvnOXTk8mESWh7FkXpdgt9i8jDSLYcwvPfevNDkAfgtizCAZyUMn28RGjq60CJhqjzkot9jSw1JBIiGtxJIpAz12RR6XdAb3rxK6xDcAslsazkmKGUFc76yrz2IPDApWZmvCcN+3MDJDAec7+fuDznMRAWMBNOqby0a2iInnx6KSr4VVCZlQix5XwHCuSztsYjBAZqY+y1bXlPSeliHaRYGmQMle1fuZ+Wh6MP3JYQxh6Ktt6wK5UNwNE4JYAxs3zIwJPKot2jsd2DPbeBGyBW8e8A02+PLH6Zd29LdGsL52x77fQzKKUAMUqehlq+QH0M/HqNdc6dVUa8IXvZrZAhLcz5NrnR9vmyFHpIi/wAG/RRoK3r6F7O+lDO4o+sW+tY2G1Zh827t5aaM4jroqmr6kBCSM1K3Ne8vlLi7kM9PRu6IzQRLkhgNQKZw5G+U7LVTGzsxQ8WSbrvSd7rMhqDp+du+jqRoxXLYJQ/GAAikBhg8w+hOuRBbZAz/Q+XIbwK5/CqUY6YrOoth0L9NpJewIWqoKZoudAwRx4j+H1hmZ796lY2iHeNc2KhKQa0CkXUSgROcyz6jJsCsMWYO/c0fFnYbtCh8+OI/69z1rgLu4bxghaOVBE1Qn5Iar0IXWKAQEs2p9ASxj88S4G2EoS5o37XZjDc8XWmAv1iqGt6CTjXVK6CtoTEXkAGGfIvI7UJAJUdHPmaWLW8KdZiPgiliWpMDzQ0WFUgY2/Jg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(39860400002)(376002)(451199021)(46966006)(36840700001)(40470700004)(336012)(426003)(2616005)(26005)(36860700001)(1076003)(41300700001)(47076005)(83380400001)(186003)(6666004)(478600001)(40460700003)(54906003)(4326008)(6916009)(82740400003)(70206006)(70586007)(40480700001)(356005)(316002)(81166007)(5660300002)(44832011)(86362001)(2906002)(36756003)(82310400005)(8936002)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 19:17:17.3667
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d6b2846-75eb-47c5-bebe-08db525455de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5322

This series introduces SMMU handling for PCIe passthrough on ARM. These patches
are independent from (and don't depend on) the vPCI reference counting/locking
work in progress, and should be able to be upstreamed independently.

v1-v2:
* phantom device handling
* shuffle around iommu_add_dt_pci_device()

Oleksandr Andrushchenko (1):
  xen/arm: smmuv2: Add PCI devices support for SMMUv2

Oleksandr Tyshchenko (4):
  xen/arm: Move is_protected flag to struct device
  iommu/arm: Add iommu_dt_xlate()
  iommu/arm: Introduce iommu_add_dt_pci_device API
  pci/arm: Use iommu_add_dt_pci_device()

Rahul Singh (1):
  xen/arm: smmuv3: Add PCI devices support for SMMUv3

Stewart Hildebrand (2):
  iommu/arm: iommu_add_dt_pci_device phantom handling
  RFC: pci/arm: don't do iommu call for phantom functions

 xen/arch/arm/domain_build.c              |   4 +-
 xen/arch/arm/include/asm/device.h        |  13 ++
 xen/common/device_tree.c                 |   2 +-
 xen/drivers/passthrough/arm/ipmmu-vmsa.c |   8 +-
 xen/drivers/passthrough/arm/smmu-v3.c    |  74 +++++++-
 xen/drivers/passthrough/arm/smmu.c       | 110 +++++++++---
 xen/drivers/passthrough/device_tree.c    | 218 ++++++++++++++++++++---
 xen/drivers/passthrough/pci.c            |  21 ++-
 xen/include/xen/device_tree.h            |  38 ++--
 xen/include/xen/iommu.h                  |   6 +-
 10 files changed, 417 insertions(+), 77 deletions(-)

-- 
2.40.1


