Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9136453DE
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 07:16:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455823.713406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2nin-0006gE-N4; Wed, 07 Dec 2022 06:15:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455823.713406; Wed, 07 Dec 2022 06:15:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2nin-0006e2-JL; Wed, 07 Dec 2022 06:15:57 +0000
Received: by outflank-mailman (input) for mailman id 455823;
 Wed, 07 Dec 2022 06:15:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FP08=4F=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1p2nim-0006dw-Ig
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 06:15:56 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99fad750-75f6-11ed-91b6-6bf2151ebd3b;
 Wed, 07 Dec 2022 07:15:54 +0100 (CET)
Received: from BN9PR03CA0171.namprd03.prod.outlook.com (2603:10b6:408:f4::26)
 by SA1PR12MB7295.namprd12.prod.outlook.com (2603:10b6:806:2b6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 06:15:50 +0000
Received: from BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f4:cafe::69) by BN9PR03CA0171.outlook.office365.com
 (2603:10b6:408:f4::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Wed, 7 Dec 2022 06:15:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT053.mail.protection.outlook.com (10.13.177.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.15 via Frontend Transport; Wed, 7 Dec 2022 06:15:49 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Dec
 2022 00:15:49 -0600
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 7 Dec 2022 00:15:48 -0600
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
X-Inumbo-ID: 99fad750-75f6-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FWTrLGzyqe7tLU26crQmCWs7WOwvCrlzHhz8oAdtfMCnt0//ZsPBaUlZouW+FkkHJrRTgn+GpC2/vcD+2GbtyhvdhyE6+b/6nkO107mAH+dG9LRcbqzA0dLdEcuvGaIPnEpVuUb7MErIXIcgVtLWq2UL9ZYU9/e6kXRgCQJ6mMfTf/DaFyRKWQlJTH6B52j5Gf6I9xRjhpJOYgUDNBveSZ1X0V1LnGVkwu6opY57F2g12m3gHfkXHAt0/0bi64JtRYirxR1/1aQkcFI/tTyoxqwLgKzt/r4lXjEfgc8V7kKjdAJ/mMoONYM2wjdAilIUiknhOogXKEg4XHpvTC3kQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xLfenOq4zf3HWvCp9YLWQ6ypMmC4nPEz7OkOviRTSnM=;
 b=mkEx0vJVs1REjxkistvPHbXyJvcYkR1VZCWnsWP8a/l1O9f8D/f2hoveGfRW4Uqgq69WGtpd2fYB9JD2brcarVDq7WeBoYCLfiIR1Dev92E/PdrvrlkUjiT5x1SOgJqwk61PKtQsxklOGavOno9BhI+slp8CzywGhoYaeQR+A3mQhnk4kErFxUuKY/+zBKgOaaVTff+2wFy2Zl9CPD8K+BwIu7Tzaqhabpspqoa4IDLtSJIePMHX9zRAgplE2aiQjFt9AYhidkq/REC49uHpF9/MXiSEagI33gGIqFO0y+jMJS6HKr2gII1pgl3DOvO8HO355NabCkgXLPPVAVzZLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xLfenOq4zf3HWvCp9YLWQ6ypMmC4nPEz7OkOviRTSnM=;
 b=z97hIy9jHakU+4vw/aXb8qAaMfqkGEwNUtwf/aclRWVyJeFpFyH1j5kZGwrB4EbIt25wKUuq8+fZXbCTzTG+Sq3UsPzAJ7monmUszdu9siY8GSNeWTXww0tfmtdCS2C+7/8BtxluolqxZEGQVmhCWp3ScTWKh0ZSkQWnPxQL6/Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <vikram.garhwal@amd.com>
Subject: [XEN][RFC PATCH v4 00/16] dynamic node programming using overlay dtbo
Date: Tue, 6 Dec 2022 22:15:21 -0800
Message-ID: <20221207061537.7266-1-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT053:EE_|SA1PR12MB7295:EE_
X-MS-Office365-Filtering-Correlation-Id: e247bc39-5d98-4368-55a3-08dad81a7c7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ADM7piHr1D8EHshvPRw5mSs72r36G8CgjH6VrizdsgQL8uzz+A1TE1hOwxPti0i6qg6MD4FxCLF0Ha0VSCH+xycfFeIaQIHUozQ580+NEJqPOm+bY75sFJCAXaJiq1zajeM2z8+wCq2bIqwHjQMfVk2gl5UEqmk3PN4xt3oasS0rcoLFsYFaE9Bu8OLsHKsXFWTf5r/IN5znMRoGxoM4xYtfxJjGRm0ryKCTpTQ8z3mfg3Y3HM9Ir5GUrraZbeyfHfSy6Sb7p4lS0CXz7GV/9IFeFcLtYVKXjXINSpyeZFUXSN94mL9IJd+AzUSTgO9DMjbfdjrq6gWETACjbk3V009lunTmS5UuZjViX+8aFTOky0Gtao2nM3ZSIHeHhF7wAsvLyhPPdSvgal43btUgVz36sy7C7r8R+SdTaA9yMvoj8rAFKsISBizpOHWRYu1MyxjvOl7n2c0Gp5MqPJoi6YBHtVr3c8JwQkHaAxwAF1CfTvXoIUd/UV73ryA3+C2ihe2nCJEH149RZsjVzPr3aDcp/YyXvNXRwHH+pWvwasgqXcUcyzWzTVCzkixMHUhEy6iunKPPRRT2HVzJ76VTZxvuYgasQ4poGi+FAomhSPkyl909WeVX5b09oGTsv2PcZlfc2UW87Vo1wTjIWcQugIL+ICuvyFCDYv9hObRsG+pNhGp/bWFCmwO2e9Ge7Z2Rhz/hiHv51O6TshHHwKIi90kvvvzjNX9aLPYaQHf0KJiEnk7f9rEWe/elIe0Pm45PEOt5N+o19KhT2Enmz4ItP78WBKLHlOH/6eaa069lGeQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(346002)(136003)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(36860700001)(83380400001)(356005)(81166007)(82740400003)(86362001)(44832011)(2906002)(8936002)(5660300002)(4326008)(40460700003)(41300700001)(82310400005)(8676002)(40480700001)(6666004)(26005)(336012)(186003)(47076005)(426003)(1076003)(2616005)(316002)(70586007)(6916009)(54906003)(70206006)(478600001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 06:15:49.5150
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e247bc39-5d98-4368-55a3-08dad81a7c7c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7295

Hi,
This RFC patch series is for introducing dynamic programming i.e. add/remove the
devices during run time. Using "xl dt_overlay" a device can be added/removed
with dtbo.

For adding a node using dynamic programming:
    1. flatten device tree overlay node will be added to a fdt
    2. Updated fdt will be unflattened to a new dt_host_new
    3. Extract the newly added node information from dt_host_new
    4. Add the added node under correct parent in original dt_host.
    3. Map/Permit interrupt and iomem region as required.

For removing a node:
    1. Find the node with given path.
    2. Check if the node is used by any of domus. Removes the node only when
        it's not used by any domain.
    3. Removes IRQ permissions and MMIO access.
    5. Find the node in dt_host and delete the device node entry from dt_host.
    6. Free the overlay_tracker entry which means free dt_host_new also(created
in adding node step).

Change Log:
 v3 -> v4:
    Add support for adding node's children.
    Add rwlock to dt_host functions.
    Corrected fdt size issue when applying overlay into it.
    Add memory allocation fail handling for unflatten_device_tree().
    Changed xl overlay to xl dt_overlay.
    Correct commit messages.
    Addressed code issue from v3 review.

 v2 -> v3:
    Moved overlay functionalities to dt_overlay.c file.
    Renamed XEN_SYSCTL_overlay to XEN_SYSCTL_dt_overlay.
    Add dt_* prefix to overlay_add/remove_nodes.
    Added dtdevs_lock to protect iommu_add_dt_device().
    For iommu, moved spin_lock to caller.
    Address code issue from v2 review.

 v1 -> v2:
    Add support for multiple node addition/removal using dtbo.
    Replaced fpga-add and fpga-remove with one hypercall overlay_op.
    Moved common domain_build.c function to device.c
    Add OVERLAY_DTB configuration.
    Renamed overlay_get_target() to fdt_overlay_get_target().
    Split remove_device patch into two patches.
    Moved overlay_add/remove code to sysctl and changed it from domctl to sysctl.
    Added all overlay code under CONFIG_OVERLAY_DTB
    Renamed all tool domains fpga function to overlay
    Addressed code issues from v1 review.

Regards,
Vikram

Vikram Garhwal (16):
  xen/arm/device: Remove __init from function type
  xen/arm: Add CONFIG_OVERLAY_DTB
  libfdt: Keep fdt functions after init for CONFIG_OVERLAY_DTB.
  libfdt: overlay: change overlay_get_target()
  xen/device-tree: Add _dt_find_node_by_path() to find nodes in device
    tree
  xen/smmu: Add remove_device callback for smmu_iommu ops
  xen/iommu: Move spin_lock from iommu_dt_device_is_assigned to caller
  xen/iommu: protect iommu_add_dt_device() with dtdevs_lock
  xen/iommu: Introduce iommu_remove_dt_device()
  asm/smp.h: move cpu related function to asm/cpu.h
  common/device_tree: Add rwlock for dt_host
  xen/arm: Implement device tree node removal functionalities
  xen/arm: Implement device tree node addition functionalities
  tools/libs/ctrl: Implement new xc interfaces for dt overlay
  tools/libs/light: Implement new libxl functions for device tree
    overlay ops
  tools/xl: Add new xl command overlay for device tree overlay support

 tools/include/libxl.h                 |   8 +
 tools/include/xenctrl.h               |   3 +
 tools/libs/ctrl/Makefile.common       |   1 +
 tools/libs/ctrl/xc_dt_overlay.c       |  51 ++
 tools/libs/light/Makefile             |   3 +
 tools/libs/light/libxl_dt_overlay.c   |  72 +++
 tools/xl/xl.h                         |   1 +
 tools/xl/xl_cmdtable.c                |   6 +
 tools/xl/xl_vmcontrol.c               |  48 ++
 xen/arch/arm/Kconfig                  |   5 +
 xen/arch/arm/device.c                 | 145 +++++
 xen/arch/arm/domain_build.c           | 142 -----
 xen/arch/arm/efi/efi-boot.h           |   1 +
 xen/arch/arm/include/asm/cpu.h        |  35 +
 xen/arch/arm/include/asm/domain.h     |   1 +
 xen/arch/arm/include/asm/psci.h       |   1 +
 xen/arch/arm/include/asm/setup.h      |   3 +
 xen/arch/arm/include/asm/smp.h        |  24 -
 xen/common/Makefile                   |   1 +
 xen/common/device_tree.c              |  59 +-
 xen/common/dt_overlay.c               | 876 ++++++++++++++++++++++++++
 xen/common/libfdt/Makefile            |   4 +
 xen/common/libfdt/fdt_overlay.c       |  29 +-
 xen/common/libfdt/version.lds         |   1 +
 xen/common/sysctl.c                   |   5 +
 xen/drivers/passthrough/arm/smmu.c    |  56 ++
 xen/drivers/passthrough/device_tree.c |  70 +-
 xen/include/public/sysctl.h           |  19 +
 xen/include/xen/cpu.h                 |   4 +
 xen/include/xen/device_tree.h         |  27 +-
 xen/include/xen/dt_overlay.h          |  55 ++
 xen/include/xen/iommu.h               |   2 +
 xen/include/xen/libfdt/libfdt.h       |  18 +
 xen/include/xen/softirq.h             |   4 +
 34 files changed, 1573 insertions(+), 207 deletions(-)
 create mode 100644 tools/libs/ctrl/xc_dt_overlay.c
 create mode 100644 tools/libs/light/libxl_dt_overlay.c
 create mode 100644 xen/arch/arm/include/asm/cpu.h
 create mode 100644 xen/common/dt_overlay.c
 create mode 100644 xen/include/xen/dt_overlay.h

-- 
2.17.1


