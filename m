Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0A47E7182
	for <lists+xen-devel@lfdr.de>; Thu,  9 Nov 2023 19:29:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629768.982196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r19lM-00009S-3J; Thu, 09 Nov 2023 18:28:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629768.982196; Thu, 09 Nov 2023 18:28:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r19lM-00005t-0T; Thu, 09 Nov 2023 18:28:20 +0000
Received: by outflank-mailman (input) for mailman id 629768;
 Thu, 09 Nov 2023 18:28:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZS/w=GW=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1r19lK-00005n-Ag
 for xen-devel@lists.xenproject.org; Thu, 09 Nov 2023 18:28:18 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20623.outbound.protection.outlook.com
 [2a01:111:f400:7e88::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd4ba0da-7f2d-11ee-9b0e-b553b5be7939;
 Thu, 09 Nov 2023 19:28:13 +0100 (CET)
Received: from CY5P221CA0149.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:6a::9) by
 DS7PR12MB5910.namprd12.prod.outlook.com (2603:10b6:8:7b::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.28; Thu, 9 Nov 2023 18:28:09 +0000
Received: from CY4PEPF0000E9D7.namprd05.prod.outlook.com
 (2603:10b6:930:6a:cafe::ac) by CY5P221CA0149.outlook.office365.com
 (2603:10b6:930:6a::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.19 via Frontend
 Transport; Thu, 9 Nov 2023 18:28:09 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D7.mail.protection.outlook.com (10.167.241.78) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.21 via Frontend Transport; Thu, 9 Nov 2023 18:28:08 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 9 Nov
 2023 12:28:07 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 9 Nov
 2023 12:28:07 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Thu, 9 Nov 2023 12:28:05 -0600
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
X-Inumbo-ID: bd4ba0da-7f2d-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/4lx4RQuEZmcK5t2UUvaidWgRUmdCyjxp3WnPPp99CVX7cXc20Ffql35VOJfwVE5IOCNN1x9PLQ37I26pSPMDDJELvYOwGk/PqaI5bMRD1hU2o4zNZxNnfhLlL2cuJhhTfzP618+E8AJ6DkDTMCrkmC9uEOPCDxIXx+iOOHxnZDSM4X2wCE8U/1Lq+uoT1ODOH9NbsHjBkt3stlC8FhvzKg4z/b4iC+v0mugEUNnaiYq7GZ/F6vgYnQmhJ8X9rozyIzxMB4wa8QcxGjs6IaNfiWqVluau0ZkZvD/6VuENst0QW6P8Y6aHHubj7hC03SRudm6ybJB7xxipXg3SRmmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nlg+63AEQlU5eSdUtJPSdHVld0hhcPCAgo017RH7a6I=;
 b=QrWQ5WMTZVEBVGVDj0pdd4PS1PhYgpqtNAW3a++3Qv9I066KzX+VtgqbfAf/0TIN/2/NZ6PA0/GJy64LUiMK+RKFhKWnaSOubW5abuHBrxTLORt3YhcTem7TxZ0olR/pjDWAZzoZHRXrPcJaDX2kYMGl+S6kCz2jlAbqLc4bft2bFBmYS/YyqBmeyxMQmIFD94UTm6wLjVBiZjWvFwQyaMme5xUSG/Ue457gdu6m05OWkJRdGDTbPq9AQVE39m+WSg1LlcwYt8QmH9n7idriM/nDadQJcMlDlat0baz9TilJHxNRLMDCt9JDvNnl+7kNwp91x7j7ZZzN2vw8+qYtpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nlg+63AEQlU5eSdUtJPSdHVld0hhcPCAgo017RH7a6I=;
 b=vSqctJ5I6XtStlg0P2DoD3y+OFhF/G/KS1e6G2nRDBD2KUO3oQhHXfOSU9QUt3GkxGmdmQpVjS1P6wd/gewWrLgDyHCCM7BnavKPpBh4OFtoteD6FhN9+AC7ObKozdkdUy/eo5i0QcaV4y6cnP7KDBoFf6i4T1O3XsNBjDiZwNY=
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
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, "Paul
 Durrant" <paul@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Rahul Singh <rahul.singh@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Wei
 Liu" <wl@xen.org>
Subject: [PATCH v6 0/9] SMMU handling for PCIe Passthrough on ARM
Date: Thu, 9 Nov 2023 13:27:03 -0500
Message-ID: <20231109182716.367119-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D7:EE_|DS7PR12MB5910:EE_
X-MS-Office365-Filtering-Correlation-Id: 96f1475a-0bec-4491-3b47-08dbe1519fa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bQ1q47rEAaHwyDGIWRbdnQNzD+Fkm5nJG0qsPFhGDdwSir/CA9hedtf/bPRPbxcLGe91mMiH/MFiCcgsNrDyHntOBD8PlrK+VI/dOLw3dl58g4+vHjpO+hZ05XSZ0nwcUtU8GQztIXWyMFNRiNmdDN/74ZrLkVCRKrNuwCSfHuVYwVjbiAF0dLhGeZbf6xpU5eA0FCg1uYikrwmxenCA5xFXogRhRSzFpZySA/7y14GiUoUoyrpiUVTmz+EsNtCRkbRPgpzYXArk/AzNm5kK+UV9KqrHG60g9vJiIHJrSDt8HyFWxSt/w7uceGaAi78sSbyInsVsNw4gXmwJAGGuHQovk/3FDlyCGuUEyZfNAqwC4fEjgr7uWHXYUVDysFwfuIAEq6uvbyKxSC8TeShQy8kAAbXUmSwtuFt0Y1ik2nM+FBWtgiGcXuCxZn2emUfcljUzBs7YIrAlgHLcWbYmyr7GN6bODEw9qDm0TS0qMO0dfG1nw7+uIFKaN6dW+NYx9VJ+ALCOsWhZ9wnO77JiS4vNmz1JfXbR7Tjq4Di/GnKTX3Xxz1wGdgRjhUibw9XLLNbQtNjzlJJljOkFbsKy5vnc8CbuxiHI3zrt0ylqmo4xSbvFRfQHiPPBp676n+mzcY+Hd1lcdsxJJ5+rQwZvjlDyrgxrYvOamFrZJtQlWKPhmTMxD/19l/SnQW857FwTajzQpM5APY1Na13MUBAIaiSmVfrvXGXbQTjZ0N+fuIbZxk6pG7tCyegjT+cTjagk
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(376002)(136003)(39860400002)(230922051799003)(64100799003)(82310400011)(451199024)(1800799009)(186009)(40470700004)(46966006)(36840700001)(40460700003)(40480700001)(36860700001)(83380400001)(47076005)(4326008)(8936002)(44832011)(8676002)(86362001)(41300700001)(36756003)(316002)(966005)(2906002)(54906003)(1076003)(6916009)(81166007)(478600001)(82740400003)(336012)(426003)(70206006)(7416002)(356005)(5660300002)(2616005)(26005)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 18:28:08.9166
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96f1475a-0bec-4491-3b47-08dbe1519fa8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5910

This series introduces SMMU handling for PCIe passthrough on ARM. These patches
should be able to be upstreamed independently from the vPCI series [1]. See [2]
for notes about test cases.

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-10/msg00660.html
[2] https://lists.xenproject.org/archives/html/xen-devel/2023-06/msg01135.html

v5->v6:
* don't revert ("xen/arm: Add cmdline boot option "pci-passthrough = <boolean>"")
* add ("xen/arm: enable dom0 to use PCI devices with pci-passthrough=no")

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

Rahul Singh (3):
  xen/arm: smmuv3: Add PCI devices support for SMMUv3
  xen/arm: Fix mapping for PCI bridge mmio region
  xen/arm: Map ITS doorbell register to IOMMU page tables

Stewart Hildebrand (3):
  xen/arm: don't pass iommu properties to hwdom for iommu-map
  iommu/arm: iommu_add_dt_pci_sideband_ids phantom handling
  xen/arm: enable dom0 to use PCI devices with pci-passthrough=no

 xen/arch/arm/device.c                 |   2 +-
 xen/arch/arm/domain_build.c           |   2 +
 xen/arch/arm/pci/pci.c                |   3 +-
 xen/arch/arm/vgic-v3-its.c            |  15 ++
 xen/common/device_tree.c              |  91 ++++++++++++
 xen/drivers/passthrough/arm/smmu-v3.c | 131 +++++++++++++++--
 xen/drivers/passthrough/arm/smmu.c    | 199 ++++++++++++++++++++++----
 xen/drivers/passthrough/device_tree.c |  97 ++++++++++---
 xen/drivers/pci/physdev.c             |   6 -
 xen/include/xen/device_tree.h         |  23 +++
 xen/include/xen/iommu.h               |  26 +++-
 11 files changed, 528 insertions(+), 67 deletions(-)


base-commit: bede1c7e3b790b63f1ff3ea3ee4e476b012fdf2c
-- 
2.42.0


