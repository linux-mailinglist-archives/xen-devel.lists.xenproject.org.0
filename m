Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1CF708A19
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 23:07:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536542.834960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzkqS-0003kI-M0; Thu, 18 May 2023 21:07:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536542.834960; Thu, 18 May 2023 21:07:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzkqS-0003gp-J9; Thu, 18 May 2023 21:07:32 +0000
Received: by outflank-mailman (input) for mailman id 536542;
 Thu, 18 May 2023 21:07:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yK0N=BH=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1pzkqQ-0003gZ-Vc
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 21:07:30 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20624.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe819945-f5bf-11ed-8611-37d641c3527e;
 Thu, 18 May 2023 23:07:28 +0200 (CEST)
Received: from DS7PR06CA0006.namprd06.prod.outlook.com (2603:10b6:8:2a::7) by
 IA1PR12MB8221.namprd12.prod.outlook.com (2603:10b6:208:3f0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Thu, 18 May
 2023 21:07:24 +0000
Received: from DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2a:cafe::21) by DS7PR06CA0006.outlook.office365.com
 (2603:10b6:8:2a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19 via Frontend
 Transport; Thu, 18 May 2023 21:07:24 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT039.mail.protection.outlook.com (10.13.172.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.19 via Frontend Transport; Thu, 18 May 2023 21:07:23 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 May
 2023 16:07:23 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 May
 2023 14:07:23 -0700
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 18 May 2023 16:07:21 -0500
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
X-Inumbo-ID: fe819945-f5bf-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AygZTvivD4kBDMqXwhwowCOuc+DuiFrWhElD6Zd1rQflCjDcaaqWNICL+6u65GpYM/Fes5ZebPTInJpsQvMT6ymQ5Zek397yHDyAV99JsjqO5R0Z4wNO+B5Q1gp9gX6uvdgFUvc9dAvjeKA/kf2jmcfb3gLFXxHwGrG9Zd8VdjW5VVQc+d4xdKoMkEDOy62F9cW0XHAeYwHcfZdCdTAc9T8Tm4TApvHrXOQEH+5PIphGpiR3W0tsud8Uuur+40a9LQSoN9zo//HePN7O4wIOikoMyFKbQ1CiR+jgmbazDTYVfKk9beHBzjO2uPhDJyxy9G9EVxb6v17ZLcvr9TsYfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xi4VMXaQkQek2qLIH1FDhP/UsKtsSqzDAK67s9incms=;
 b=LJN/fgcLz32HGsYyuAca3H8zQsLJfxyi0UXdvyocejpxj+1F5seaZSvj9lP8fKsxYVFhrCUp22hV4Ah8OoczFRj/Dziz5tNc9OhaAYAyzYvyzBT67+v2HUqQd55FxeyOY1h0vditxPUTnjLL0xVY/IKJ2gTSpM+51m2t3PLqRMiAbCQQ7yrKoLFBordCSoo5gaz5p82soTCJHDfjSpHgMl+76flxERncB9/qDAB78+WMCLbmTs8FC0Cvf24/4vHOUOzwh57u8Gd5lj6WMIJd6DUU1TqiGwP54hR2lXLC8qtkLogjJCvlsDnnHCq+wyHacxN+4BPximxLrNLZjKrqeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xi4VMXaQkQek2qLIH1FDhP/UsKtsSqzDAK67s9incms=;
 b=lbcx8EH1RENj9z7ClZhkmtgWeq/MYJRF+sA/zg2ZfJfVRFZT9NbQ5F0Z8ZBRfCvn7L//tmJ83pipvo/ty65JIQkYYaNW7u0fIR9h8ChWzffGzF+WDQSOwqoC7W3UrtL/4mlEYKRd4+1NTry3AofwApiFiUcYH9afj8TDSejUTLw=
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
Subject: [PATCH v3 0/6] SMMU handling for PCIe Passthrough on ARM
Date: Thu, 18 May 2023 17:06:52 -0400
Message-ID: <20230518210658.66156-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT039:EE_|IA1PR12MB8221:EE_
X-MS-Office365-Filtering-Correlation-Id: c8196a3e-f7bc-4cd8-42cc-08db57e3e08a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xi63QywFG/SJtsR7mDG7yxKkf5xuw4IHrmUoV9Fjp4kZnVdhTICtlziJ9oUwGkCsbaDQnW9S6L0kwzv5Sew8U4jSlKFOMddqhbHqkjr7v6yJ2MHd8gHr7nB/X4r8l6DinhP5cz0/ciMANLhKaAS+zHG1ThwZHzqi118vFg6/qH2EFyLHuxZmRvMlm01lN24T7Um2+DpeEwsNJdjIBaUYP8WImXesFYEz+nLGyuJU75tARvPuS9GxziHDMXprHi85NPgJTq53ZHZ8PxXK93RptEkKaGbfmvJbqc5oeH1pCGnsUtFa4Pl9AZbNSFrxVINfMI7Cfwqmi4WlIoAFII4XmE3QiCa239g/XpFgi1Aws/iurOD5scYtVUqhbe5Qhg04aqkdn0U354omp40D5Vm+JvT7dB5P8X9o6OyAZFJ7luROtNT3n5uSIxinEc5a5BbFDndQXm2s1qGDC6D14mS3ruzKGFiBEJspgFyNFghYDCsrFDfa+6XXIhL4NMIa0Df8fdXFfI8WAI65+c1LqpjTvnX8Q/ckYVJ4X+lAEr2r2k9myuBXtg8Ns0/Uua5DyQT0nJbQU2U4S7R/lBrvKQUZX8x1UX031wm4z5b3xXDli4qNJoV+2JzdBsi59gH5lURM8bxBNW3QWtcIvjbOCtvnBNPrkGMbr9m9pfNDwGePK3+FqgsILl5XGnGYai3ZwQ5QgNNOs1NEbyC7jv57Gt48rD/mRhh6KBdgDfahJMEF5OR8L18YU7bvBNBoX/M85t1YPezfGcUM0FgGnpGO3zFZwA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(39860400002)(346002)(451199021)(46966006)(36840700001)(40470700004)(40460700003)(70206006)(316002)(70586007)(478600001)(4326008)(54906003)(6916009)(36756003)(83380400001)(47076005)(1076003)(36860700001)(186003)(426003)(26005)(2616005)(86362001)(5660300002)(2906002)(8676002)(44832011)(8936002)(336012)(82310400005)(6666004)(40480700001)(356005)(81166007)(41300700001)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 21:07:23.8626
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8196a3e-f7bc-4cd8-42cc-08db57e3e08a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8221

This series introduces SMMU handling for PCIe passthrough on ARM. These patches
are independent from (and don't depend on) the vPCI reference counting/locking
work in progress, and should be able to be upstreamed independently.

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

Oleksandr Tyshchenko (3):
  xen/arm: Move is_protected flag to struct device
  iommu/arm: Add iommu_dt_xlate()
  iommu/arm: Introduce iommu_add_dt_pci_sideband_ids API

Rahul Singh (1):
  xen/arm: smmuv3: Add PCI devices support for SMMUv3

Stewart Hildebrand (1):
  iommu/arm: iommu_add_dt_pci_sideband_ids phantom handling

 xen/arch/arm/domain_build.c              |   4 +-
 xen/arch/arm/include/asm/device.h        |  13 ++
 xen/common/device_tree.c                 |   2 +-
 xen/drivers/passthrough/arm/ipmmu-vmsa.c |   8 +-
 xen/drivers/passthrough/arm/smmu-v3.c    |  83 +++++++--
 xen/drivers/passthrough/arm/smmu.c       | 116 ++++++++++---
 xen/drivers/passthrough/device_tree.c    | 204 ++++++++++++++++++++---
 xen/include/xen/device_tree.h            |  38 +++--
 xen/include/xen/iommu.h                  |  17 +-
 9 files changed, 408 insertions(+), 77 deletions(-)

-- 
2.40.1


