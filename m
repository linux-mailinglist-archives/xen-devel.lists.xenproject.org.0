Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DAD72524B
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 05:06:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544290.849963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6jUH-0002CG-QQ; Wed, 07 Jun 2023 03:05:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544290.849963; Wed, 07 Jun 2023 03:05:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6jUH-00029S-N7; Wed, 07 Jun 2023 03:05:29 +0000
Received: by outflank-mailman (input) for mailman id 544290;
 Wed, 07 Jun 2023 03:05:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rfoE=B3=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1q6jUG-00029M-5L
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 03:05:28 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20619.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25c38285-04e0-11ee-b232-6b7b168915f2;
 Wed, 07 Jun 2023 05:05:25 +0200 (CEST)
Received: from BN9P221CA0021.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::15)
 by DM4PR12MB5168.namprd12.prod.outlook.com (2603:10b6:5:397::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 03:05:19 +0000
Received: from BN8NAM11FT095.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10a:cafe::38) by BN9P221CA0021.outlook.office365.com
 (2603:10b6:408:10a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19 via Frontend
 Transport; Wed, 7 Jun 2023 03:05:18 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT095.mail.protection.outlook.com (10.13.176.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.33 via Frontend Transport; Wed, 7 Jun 2023 03:05:18 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Jun
 2023 22:05:11 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Jun
 2023 22:05:11 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 6 Jun 2023 22:05:09 -0500
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
X-Inumbo-ID: 25c38285-04e0-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C159BidfSM95iW8YhYTuuM9ZG+FP0owcja2LEzuBdULc24YBIQQLwvkKaS/bmKERvtf8RBm1ThE/VykQzRfoOXcExmO0IZmJ14LpYxRRDTa0VvA4/eT62Xg3WHphBziPXpOOrzvDZ6mGgrgQb06/TS6GSyFqBY7inILjSfokzO33RFua54ayHhuF/3wNsBBg4luP8+c9x7brNgPgHWxUiVhqphnTfP/83SKiUILjkkbyj8ByO3MyJsFDDdRTws7HKm1266FoztezxcPu37Qng7WqhWTIrD9YyZSdujNNZ7QgpnsmfJ7XtZvlK4hJMtMU3B+6N4InbqRvx3NVu1z5Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e3XCxlbEKAvvYqyg8avJlBxcbRn0rYcgZKbcRhcCpFY=;
 b=VPUnelGF+WskcrH2q0gsU34o1nHD3Np7OfsUPWl4K0Zmvx3ca1i5Yh8fXYR0QQuvobqd3+HPAMsfHSc4TwBPUCRL/o9OElfUzNdZ04fC4HnULRJMPGWO1BRst6yUGLb5+eK04hU8Gr3gUokhyVR6sV7IKt6BVTqQydP5dfUlY/JPS1fcgY+v1pXHJgaJRzpN/HSiSRV/yrFH7DFKmyotOoA6ZZRGxmE9LGlutN8B9U4JzRnT/BMzO2Fd+Nm8f8zSDDUZqOEZSUIl4gvz0nEUzQvuWETRTtzbjSCKbmc/6pKaiUFFK6VFFV3v0pCX3py/5M+CQL5AYikEXbAlLGLBdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3XCxlbEKAvvYqyg8avJlBxcbRn0rYcgZKbcRhcCpFY=;
 b=yLTyV4jx5IbNzR6qXhSOzXcf8QDFuxzo3hnuH9Nr5mxLXWbiyPrlbZMupIRWfAFvKLBS4JWU1m+QXxE8+Z3k6dXRuPV3av2omk/Vb/K94yA8ywAYVLa96/SjGUKNIe7wnd9r9LGP4fVIn2fA/04Cssxjkz4npN2sKenv3pCM5aw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Rahul Singh <rahul.singh@arm.com>, Jan Beulich <jbeulich@suse.com>, "Paul
 Durrant" <paul@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v4 0/7] SMMU handling for PCIe Passthrough on ARM
Date: Tue, 6 Jun 2023 23:02:13 -0400
Message-ID: <20230607030220.22698-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT095:EE_|DM4PR12MB5168:EE_
X-MS-Office365-Filtering-Correlation-Id: a0c45bee-e727-48d9-4c75-08db67040636
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1xVOALicp9ngykG7ZQSBoMmGGhzAGMWyPNkbelhgVbxi4bB7Qarl73uNWGFw8rsppxdsJyRIsDPAaoIhu0voOb+oB2RR7Hco8Mq5g1qAlo0OM7oo6I8XNxOO3YQo5nGEOswR1d52n6xjd2P7X60CmuhwRhROrxHIl+Q5jtBVFKiAWm8bi7ihBH72BSY/JjUAu7hFEUofxX6hH0/LPx0+8l9FX7k8TeKRmo4ptiEolFziw0QnCuqWZzw60+pWM/k60tp5+sOXdck1oF8S1ZKjZFQhC3e7jY5vSo/smadnj42XS8toNA466eX3xoSn7PmABmoMuK3L4+8dzfGTnpHMkknGerA9EZX3IrDOmpdWN/Xg00hIILJmZBsByPEfc9GOvIDKCD2ayk2KoXiC0xB0hkY2oIK1iH1Bf1Wtp1nXJ6OKvW7ain8SY7VvRYF02WREu6hJ7WzySispjFEExnPnBpcWbwoCqMfN+sc/8Xcw6AIymfM0rXZ7eqmVlITYJ9EZXgR+l0diScO2vpOn2yPTGrHegWpmITcSYZE5xNziaWqXej+t2GxrfR2WPWAiR1ixksXT25X73U1fUvP9/3pTFFeRlY5FOFLkKIjkKdlRKOtVg9gvquPbnl3jhl5x+yhHO1/Xmb+KKaTNri4ST8RDhl4qLgfkXH+kvcRpT4WyYs3XCF8lpEjFyChZthS7o4XT0f12c0HlomVDk+TnXvO+Yi8j1qIeA6Utvdpl99td9kztp1Q6cvKUY+Ep29CemXWOebPp71bHD7zaMTnaUZULgQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(136003)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(478600001)(40460700003)(2906002)(83380400001)(2616005)(426003)(36860700001)(336012)(47076005)(82310400005)(186003)(1076003)(26005)(86362001)(82740400003)(356005)(81166007)(36756003)(40480700001)(6666004)(5660300002)(8676002)(8936002)(41300700001)(4326008)(70586007)(6916009)(70206006)(316002)(54906003)(44832011)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 03:05:18.4184
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0c45bee-e727-48d9-4c75-08db67040636
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT095.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5168

This series introduces SMMU handling for PCIe passthrough on ARM. These patches
are independent from (and don't depend on) the vPCI reference counting/locking
work in progress, and should be able to be upstreamed independently.

v3->v4:
* split a change from ("xen/arm: Move is_protected flag to struct device") into
  a new separate patch
* see individual patches for further details

v2->v3:
* drop "pci/arm: Use iommu_add_dt_pci_device()"
* drop "RFC: pci/arm: don't do iommu call for phantom functions"
* move invocation of sideband ID mapping function to add_device()
  platform_ops/iommu_ops hook

v1->v2:
* phantom device handling
* shuffle around iommu_add_dt_pci_device()

Oleksandr Andrushchenko (1):
  xen/arm: smmuv2: Add PCI devices support for SMMUv2

Oleksandr Tyshchenko (4):
  xen/arm: Improve readability of check for registered devices
  xen/arm: Move is_protected flag to struct device
  iommu/arm: Add iommu_dt_xlate()
  iommu/arm: Introduce iommu_add_dt_pci_sideband_ids API

Rahul Singh (1):
  xen/arm: smmuv3: Add PCI devices support for SMMUv3

Stewart Hildebrand (1):
  iommu/arm: iommu_add_dt_pci_sideband_ids phantom handling

 xen/arch/arm/domain_build.c              |   4 +-
 xen/arch/arm/include/asm/device.h        |  14 ++
 xen/common/device_tree.c                 |   2 +-
 xen/drivers/passthrough/arm/ipmmu-vmsa.c |   4 +-
 xen/drivers/passthrough/arm/smmu-v3.c    |  81 ++++++++-
 xen/drivers/passthrough/arm/smmu.c       | 122 +++++++++++---
 xen/drivers/passthrough/device_tree.c    | 205 ++++++++++++++++++++---
 xen/include/xen/device_tree.h            |  38 +++--
 xen/include/xen/iommu.h                  |  22 ++-
 9 files changed, 423 insertions(+), 69 deletions(-)

-- 
2.40.1


