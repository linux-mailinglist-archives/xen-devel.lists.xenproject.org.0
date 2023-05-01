Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F556F38FE
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 22:04:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528259.821169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZk7-00054T-8s; Mon, 01 May 2023 20:03:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528259.821169; Mon, 01 May 2023 20:03:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZk7-00052B-69; Mon, 01 May 2023 20:03:27 +0000
Received: by outflank-mailman (input) for mailman id 528259;
 Mon, 01 May 2023 20:03:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nwpa=AW=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1ptZk5-000525-M9
 for xen-devel@lists.xenproject.org; Mon, 01 May 2023 20:03:25 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39bd0846-e85b-11ed-b225-6b7b168915f2;
 Mon, 01 May 2023 22:03:23 +0200 (CEST)
Received: from MW3PR05CA0005.namprd05.prod.outlook.com (2603:10b6:303:2b::10)
 by IA1PR12MB8465.namprd12.prod.outlook.com (2603:10b6:208:457::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Mon, 1 May
 2023 20:03:20 +0000
Received: from CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2b:cafe::6) by MW3PR05CA0005.outlook.office365.com
 (2603:10b6:303:2b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.19 via Frontend
 Transport; Mon, 1 May 2023 20:03:20 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT057.mail.protection.outlook.com (10.13.174.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.19 via Frontend Transport; Mon, 1 May 2023 20:03:19 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 1 May
 2023 15:03:17 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 1 May
 2023 15:03:17 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 1 May 2023 15:03:16 -0500
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
X-Inumbo-ID: 39bd0846-e85b-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QQOsvCMqYd8qQjX0QFmzLrSvL9+DDAv4jeMzHToQMYI8CGlCdFDaOahp3pi0Qs5wTYCw2NB4iic//VMqT7mipmTD3VHhGU+wmazb6G7efiTIKt5kgrbE6muiqwNA2Vj+ePz+S/5TTPuLrnU4VwugTBnejlOelCOIn1h5Qu5Ezt7RGse3C+6JI9X3H0Pt2w3Mx0zewYfuRaC36DWt9tlX9WtAS1/pb3O+xoNSr6kTOPOp5L+ctLabSUV8qSjLy0SO2IlyHVjii381WdXHI7s7CyE2QyG1mfECsdLmhfi4soRafxRMVGvbcSR27rb4diXKAtrlfpxGXJ7TynORa09qwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6GirXXEDtjoXkR1fOhQzNZVltrkp/AltBpvuxHRBipc=;
 b=Vbh3HA4PQFKPVxWgMTHavXQecjpUWeTnKhCpDlZpsqnNdskA1ndcxQ/VCR0gB+SopsxT48iM/HUD+Jh/FXF7vWM118oMs6KSHPd5UoFZYAqJ42sI0qDEjCUiy5dCI2CrxhSjgS0ykjA30sSi6oH8/+lxWNCWIvCyZoQkY2EZe+WHRg21ysWM7stB81LTGf9W6VJ0d1UnIXLGX5DYfv6kKCxtTs4MYUgGpUWazGSWCDATE4Ve9YpCbDvz88G+ppAKo+1r5LlLIPajOaaPcR8vagW95WiLgB0DYAeGn7rXX10l9ERCIOy1er8PGyXmlWQpnHRCV4dUuexSs9OLJutmkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6GirXXEDtjoXkR1fOhQzNZVltrkp/AltBpvuxHRBipc=;
 b=wnzxJZE9oSTKtjJVF02QvcRTFBSLq2xhdq/qhYhwRclNtktYCy0vMPlAf2G1tjJJUKeyKgjqPVf4s2/DmPYgred8oQ0RLGUbb0w5n57nguQUl0zwJInxciQUBYpeGrpbLSgOFiJTKoBrhtcvK0UhAvyRj4T7MUFIgsouV3gfa+E=
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
Subject: [PATCH v1 0/6] SMMU handling for PCIe Passthrough on ARM
Date: Mon, 1 May 2023 16:02:59 -0400
Message-ID: <20230501200305.168058-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT057:EE_|IA1PR12MB8465:EE_
X-MS-Office365-Filtering-Correlation-Id: dcc40ebc-cf7f-4ede-478e-08db4a7f1c4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GffGYe5j4IS26DKLP1tkkPygp9s995dyvMsZ0d96T184J2bCdhBmwtjtggEV8uQmVMMok/8kP3/gScPTB2C+EpLYCdaMTeL12H3myegyHbC3v/p1d7morXWTsnwQSXckL080iHWxeQiq/8k8/5TtPyNr9jklkiJ+YfcunzWKlciszxeKUhQSJ1zbrZ5ew8+FxZG/Kd9kmDw9Vkp8r6mR6zDE1Shfq4mNyz3dc/D2p0WuZWbXA9urQBmcgKLdDH8wjepa5/iCuHH59tpx7Tf02fxk3mwsPpF0T/0f886bbjxL/Twf4lA+K6cok1rsIRrE2FJ8dYUF+VO+gqd/VN/0kMrZL7yhI0QEflnjuyqfkd0FDwilrHIIc58yqOYcOXd2o1Kofef/UbLN06KKr6OU9KauXWlBMc5pZ+cjL6oanTDm7A4iBV+zqFbK+RO8Vn0rwDDqZSVhPSu+KvhxjtQqDX28wBWSSg8sx8aycFHh4CyGyV1NYag4ll5dz47X56uWnB0x+UoEPqRxw16K++vt5cAqdUxVvrryThR3FB//l5/h/E/zuf9Pn69nBuhQj4TVs0in7ywlF6KW4MPBgguroVUayOWFI7qY1uZxyx2qejrVGDfPgUhqhm9UkP7vuwcrz6pPokuNgB2in/KQGnPgvsVXkY4j1IO89Jq4LhErE1GzlQxzx6+tXcoI6G6zM1t7nGxQ8yPMazSWhCXqs/b4+xOECIrGnFxmkVbSz9ybbZk=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(39860400002)(376002)(451199021)(40470700004)(36840700001)(46966006)(2616005)(336012)(426003)(2906002)(36860700001)(26005)(1076003)(8936002)(41300700001)(81166007)(5660300002)(83380400001)(44832011)(8676002)(47076005)(316002)(82740400003)(40460700003)(6916009)(4326008)(70586007)(70206006)(356005)(186003)(36756003)(86362001)(54906003)(40480700001)(6666004)(478600001)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 20:03:19.7557
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcc40ebc-cf7f-4ede-478e-08db4a7f1c4c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8465

This series introduces SMMU handling for PCIe passthrough on ARM. These patches
are independent from (and don't depend on) the vPCI reference counting/locking
work in progress, and should be able to be upstreamed independently. I have
cherry-picked them from various downstream branches, rebased, and made minor
changes since the cherry-pick. Details are in the individual patches. The
changes are designated with "downstream->v1" even though this is the first time
the patches appear on the list.

Oleksandr Andrushchenko (1):
  xen/arm: smmuv2: Add PCI devices support for SMMUv2

Oleksandr Tyshchenko (4):
  xen/arm: Move is_protected flag to struct device
  iommu/arm: Add iommu_dt_xlate()
  iommu/arm: Introduce iommu_add_dt_pci_device API
  pci/arm: Use iommu_add_dt_pci_device() instead of arch hook

Rahul Singh (1):
  xen/arm: smmuv3: Add PCI devices support for SMMUv3

 xen/arch/arm/domain_build.c              |   4 +-
 xen/arch/arm/include/asm/device.h        |  13 ++
 xen/common/device_tree.c                 |   2 +-
 xen/drivers/passthrough/arm/ipmmu-vmsa.c |   8 +-
 xen/drivers/passthrough/arm/smmu-v3.c    |  73 +++++++-
 xen/drivers/passthrough/arm/smmu.c       | 109 +++++++++---
 xen/drivers/passthrough/device_tree.c    | 202 ++++++++++++++++++++---
 xen/drivers/passthrough/pci.c            |  19 ++-
 xen/include/xen/device_tree.h            |  38 +++--
 xen/include/xen/iommu.h                  |   6 +-
 10 files changed, 395 insertions(+), 79 deletions(-)

-- 
2.40.1


