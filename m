Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3520D7B82E4
	for <lists+xen-devel@lfdr.de>; Wed,  4 Oct 2023 16:57:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612634.952637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo3Im-0003Cl-VK; Wed, 04 Oct 2023 14:56:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612634.952637; Wed, 04 Oct 2023 14:56:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo3Im-0003AL-Rf; Wed, 04 Oct 2023 14:56:40 +0000
Received: by outflank-mailman (input) for mailman id 612634;
 Wed, 04 Oct 2023 14:56:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HSqs=FS=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qo3Il-0003AF-G7
 for xen-devel@lists.xenproject.org; Wed, 04 Oct 2023 14:56:39 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20630.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3544d93f-62c6-11ee-9b0d-b553b5be7939;
 Wed, 04 Oct 2023 16:56:34 +0200 (CEST)
Received: from MN2PR04CA0024.namprd04.prod.outlook.com (2603:10b6:208:d4::37)
 by LV8PR12MB9229.namprd12.prod.outlook.com (2603:10b6:408:191::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Wed, 4 Oct
 2023 14:56:29 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:208:d4:cafe::94) by MN2PR04CA0024.outlook.office365.com
 (2603:10b6:208:d4::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.25 via Frontend
 Transport; Wed, 4 Oct 2023 14:56:29 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Wed, 4 Oct 2023 14:56:29 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 4 Oct
 2023 09:56:28 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 4 Oct
 2023 09:56:28 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 4 Oct 2023 09:56:26 -0500
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
X-Inumbo-ID: 3544d93f-62c6-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D4KmqHseMDiIxsG1qxvzROZfJTBZxAGyRKfZnn/eyC4DSbu6pJUV+/nAVwPvXJmyHqm+hXlMvxjJAfhdOWfYBshwC0XPUIGyERbwjHfCkp8PElwYe2A73/i1LtEuIthyMdWzPQOI0JPU+taNpDGbmov5HjyfhT06ooJ57n2300jNx4H7uAtwEAIFHDkp1BAiuqCwfw5jgSEXCTjMdo41M4gW0R2+qO6zd8Z+uWbqxmhBbP33dr2z0/NIGMx/QCOsw/0s14E0VTOjHPhqCfWLUIdb1l/81t8IFTR3kS4u3Vso6yN/3tgOT/D+GQuYcWtWjrTf7DTEJFF+s1yd0Txw8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wEUt5fOpn0QSdkaoxvId8LR2Py41khPzJUpC7Sxq+wo=;
 b=CB4QsHx8EWc36REaC14Ucn60hJZQz1eT0SJejUFJbg/8du6F+ETbgtjmYi1EPbuCOTyx1zmHgeXOruBqtIHaHn6el7fw31rxJgir3fBoS7z39D30XwyeyBHZjaPxlLmeUFWQvs8Sf+QjvqGJfyxCAjOnuJcUJr9s3nUVVmViZ1ppr/TxKu/e8ut/h/eQ+pA6UVBrBtsy9K+tW7+vJv7V4C4eoAosH/XBFQfRaUqclKaxhnl9eBnel8505K0fdPPwhAsBnMEWI1GKU94fZ8/N0O7wI4QBAtyLmh9j1NpNHU/QulwEGE52wCpmAkLDHO9j486pEGe8qmY+nBy+Ve/Tiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wEUt5fOpn0QSdkaoxvId8LR2Py41khPzJUpC7Sxq+wo=;
 b=b8RO9PirdOKePf9D79pnsTA2F0+stG2Dw9+6ogjd0WEAmiHfae2/TVteOXQVTVHwdathWjvr7QT/jbGNFP/GoF1C12iEQIaJAGBGjmzhPU89CBLX2zUrHx6dHpPKzepZrGWydmDUIKSBuo8IxLwoYtDlwZAafa+cSAFtfkf5nvg=
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
	Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Rahul Singh
	<rahul.singh@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v5 0/9] SMMU handling for PCIe Passthrough on ARM
Date: Wed, 4 Oct 2023 10:55:44 -0400
Message-ID: <20231004145604.1085358-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|LV8PR12MB9229:EE_
X-MS-Office365-Filtering-Correlation-Id: 1abb790f-40a6-45cc-1b92-08dbc4ea172a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Yby3dhV31KRu64czKPR2kEm95pdAo9MCqTGLPl6SLEvIO0dRlYQ/ceIb7oSQjp4fA/Spw4KPVO2nBpmMNCR67wOCemszMsVRmNaTasCsa94I2aOTMiStwPj+GNQqAFXh1XxGBf+xP0jjUoFeT/sIJaMsKbs8Z9enz0R28VmksGUPu7iK+jYKQR5Y8p1B8WYTjECbHvkH9R/OFtSChwmVlx3vVrLeX2Bh2NrWCRLsS5Lgtqt/7pauysdl1uXFVwFSoy+Nny6sf3Chju9TXis4w+/gE/CM+YhmtekUoBBaYJzypvHQkCkEVimq6P3U0oG+9Z11q8N4hy8bBAlRguHZgxIiTrxZLl3id47vgDqESNSTSOYi6SY2biNX9B6vuPzkvN2f4y+EqdXbVOKJ2375PjcqkIq++MZBGc+A9oZGmB/LwIIKVzLogGfQeXWXZIblFYfr8flTGwxgS3n35QMuXCH3YHvVfHtGbJ/wgBHl8zr/5jvsz1a0YQWTrB0gtDTyyW/c29F1CSd+KN2VnfXEKfUiRhDdJikwLN9hJPGQBH/PTcdOKV0Hw2hbVDURkY+E244qUSVVnTq9Uqtr/q6xJF0dl7pjCfSxJldcIF1PRqhJwP7KVoaPhvhgbigWaECwJz4uK+s1SrlPG1kT1ms4q3iDuU+1LxX+2XNGKWiBDNwJRiVVbQw2qaEvN+kq2C4/g1oO60B9Xr+bpvhN7TrHbapN0h85Sux4x1xqa6bkt2egiVSDefT8DloFzQpo7Xts
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(396003)(346002)(39860400002)(230922051799003)(1800799009)(451199024)(186009)(82310400011)(64100799003)(46966006)(40470700004)(36840700001)(40460700003)(478600001)(966005)(1076003)(2616005)(36756003)(336012)(26005)(356005)(426003)(86362001)(82740400003)(83380400001)(36860700001)(40480700001)(47076005)(81166007)(6666004)(6916009)(70586007)(316002)(54906003)(41300700001)(70206006)(7416002)(5660300002)(8936002)(44832011)(8676002)(4326008)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 14:56:29.2615
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1abb790f-40a6-45cc-1b92-08dbc4ea172a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9229

This series introduces SMMU handling for PCIe passthrough on ARM. These patches
and should be able to be upstreamed independently from the vPCI series [1]. See
[2] for notes about test cases.

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-08/msg02361.html
[2] https://lists.xenproject.org/archives/html/xen-devel/2023-06/msg01135.html

v4->v5:
* drop ("xen/arm: Improve readability of check for registered devices")
* drop ("xen/arm: Move is_protected flag to struct device")
* add ("xen/arm: don't pass iommu properties to hwdom for iommu-map")
* add ("xen/arm: Fix mapping for PCI bridge mmio region")
* revert ("xen/arm: Add cmdline boot option "pci-passthrough = <boolean>"")
* add ("xen/arm: Map ITS doorbell register to IOMMU page tables.")
* fix test case #1 with PCI device in dom0

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

Oleksandr Tyshchenko (2):
  iommu/arm: Add iommu_dt_xlate()
  iommu/arm: Introduce iommu_add_dt_pci_sideband_ids API

Rahul Singh (4):
  xen/arm: smmuv3: Add PCI devices support for SMMUv3
  xen/arm: Fix mapping for PCI bridge mmio region
  Revert "xen/arm: Add cmdline boot option "pci-passthrough =
    <boolean>""
  xen/arm: Map ITS doorbell register to IOMMU page tables.

Stewart Hildebrand (2):
  xen/arm: don't pass iommu properties to hwdom for iommu-map
  iommu/arm: iommu_add_dt_pci_sideband_ids phantom handling

 docs/misc/xen-command-line.pandoc     |   7 -
 xen/arch/arm/device.c                 |   2 +-
 xen/arch/arm/domain_build.c           |   6 +-
 xen/arch/arm/include/asm/pci.h        |  12 --
 xen/arch/arm/pci/pci.c                |  12 --
 xen/arch/arm/vgic-v3-its.c            |  12 ++
 xen/arch/x86/include/asm/pci.h        |   6 -
 xen/common/device_tree.c              |  91 ++++++++++++
 xen/drivers/passthrough/arm/smmu-v3.c | 126 +++++++++++++++--
 xen/drivers/passthrough/arm/smmu.c    | 194 ++++++++++++++++++++++----
 xen/drivers/passthrough/device_tree.c |  97 ++++++++++---
 xen/drivers/pci/physdev.c             |   6 -
 xen/include/xen/device_tree.h         |  23 +++
 xen/include/xen/iommu.h               |  26 +++-
 14 files changed, 515 insertions(+), 105 deletions(-)


base-commit: 3d2d9e90224c4f430a7ee1190fd3b871b99b0ba0
-- 
2.42.0


