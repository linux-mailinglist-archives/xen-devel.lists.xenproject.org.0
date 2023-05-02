Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E79F6F4D9B
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 01:37:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528853.822508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptzYZ-0004v4-Ft; Tue, 02 May 2023 23:37:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528853.822508; Tue, 02 May 2023 23:37:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptzYZ-0004sI-CR; Tue, 02 May 2023 23:37:15 +0000
Received: by outflank-mailman (input) for mailman id 528853;
 Tue, 02 May 2023 23:37:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/cxx=AX=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1ptzYX-0004sC-LX
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 23:37:13 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20611.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 429877f1-e942-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 01:37:11 +0200 (CEST)
Received: from DM6PR06CA0068.namprd06.prod.outlook.com (2603:10b6:5:54::45) by
 IA1PR12MB7589.namprd12.prod.outlook.com (2603:10b6:208:42b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Tue, 2 May
 2023 23:37:05 +0000
Received: from DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:54:cafe::e) by DM6PR06CA0068.outlook.office365.com
 (2603:10b6:5:54::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.20 via Frontend
 Transport; Tue, 2 May 2023 23:37:05 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT068.mail.protection.outlook.com (10.13.173.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.21 via Frontend Transport; Tue, 2 May 2023 23:37:05 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 2 May
 2023 18:37:03 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 2 May
 2023 16:37:03 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 2 May 2023 18:37:02 -0500
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
X-Inumbo-ID: 429877f1-e942-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZLZXj1JXvDZcDJ1ousp2Un42WflSH8aECl8ooOxRxSCk5vIeOZTNtfvq8MxYeBDv0O0iXM1HrEYo+0bn/wS7cGo3qHwwEMr8B+YHwmlwqflXUiQmaTgefbu6JQRBFa9BlKwp0slS9isLs5fmt/w7UHAaF+foWr/HgEDyTRGI9GohdK+k+mpjYGKPifAAP9OYgEbFbujKTUX8XM061MgSXCqG/o490d6V623TRQ3Y2uxC+Yj8bUZG5SN6/zKT6xYUajWaEF/B1M2WKraR3X4PDN/SCnPLExp2xdJdgQTiJy12K0lG8XUChMRFoo1njpFMi2wISQpRc0HSTXdcihwsCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZscFKHtEwxmwCfbCbt4eRL4EXCZVnMpebuuBX3YRsyA=;
 b=RtitxiBzJxgpb1v9xEcCSbM1XNJE5GQ+V0NOrB9gCjzXVX2zWDQ8REjq1Vk3lgMTnRfFSx/UgRd7tJPbhYEIggZZqq/kK1XhmnVLHKkuVgp6Rw4zDnVv2XPN3i4jjRyC9Wjn6Wv0WO5H5C1rIr8Tkw1tapSBtu+HYhOeD4Xx0T1PgnkTfPIfjktl7Dy87uf3ogBIWBM7CeCq+u1z+iVG+wyLHfHz8Wmn1cjaZJZAlpY4AyXm8xjUMhIuQCPNHn/+3DvrYYGtP6IMy7YZ+D7UOCMd/xAD+/tZAirItowkhLJE7q4/4c/uUB0Tnira0CKE8jHqOBMc3bfpM1o0NNLw8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZscFKHtEwxmwCfbCbt4eRL4EXCZVnMpebuuBX3YRsyA=;
 b=jxDFiVkCYn9xatcHc0c0NhBlsAod0TNNt2oWeWhDKdVZgjCoNuvI0Z5G7JSTL1YCjg6sXRpaFQxZEyWY7oREBIeOpI8P2p047kFi9BLCmt8+ppfNVo6uaJv6DdaHkxVwLWGF5+cVqCycB/BxD6zDqjeM8GzsNc6jO/ymrhNFCvk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <vikram.garhwal@amd.com>,
	<michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Rahul Singh
	<rahul.singh@arm.com>, Anthony PERARD <anthony.perard@citrix.com>, "Juergen
 Gross" <jgross@suse.com>
Subject: [XEN][PATCH v6 00/19] dynamic node programming using overlay dtbo
Date: Tue, 2 May 2023 16:36:31 -0700
Message-ID: <20230502233650.20121-1-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT068:EE_|IA1PR12MB7589:EE_
X-MS-Office365-Filtering-Correlation-Id: a7809011-32f1-4b14-44bb-08db4b66232d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N8w8ph0vVidtsKiePulqsXxpmZwZ8SgtS8c4gubAvBLUNGZawYNuRjEiTJjmO5epKkscOWSnikZgDhLr8mHAiUAIucSOk/wYehReqKrYbJr7bNaiybll00p6UYP+mGSRFETssuDKEbT3SWTgf5mgXf/SaWXG1SdWjnJ3h2baaQOwnCk/DNx0GMupPWvdhBydJUmLxjLZvYE7P4TRNVWkoxMD+8F+MBRiUVJGfo+AeRitK7w1i0PEgPRw+A6zHDCRh9H4CFaJUsruUexFm3qI4Jo0NLdBFidE9tWRgfE4LKCFZhLe2OdvH7hWlqcyr/TpH32hYriDelAVB5a1nMxrL8y/CJ3hPlEVqy0EgcX1RjzgUtokLiRPksuFWFdmAK227LlBa+zeATvbBuyUj3ycxv/ZPBxAr67iqyaI+jCAKD6JYkT1CJHFUcFyTlFR3tQ8Crp98IFX2yKqvFYvUh0sztpYVJJViyzbBLNhpP8tw2No+fK1oUUZeHHlmmdpHzXtStsVrBOxoOsXtLNqPjf6s03y99v8X4ry9XsBj6ar14uGcW65iJ0ujSzsfZgxve9sUb0rJxYkGsx7h+wHOkHDbvQ0Bv9GktgYaJrJHUq/ra0ol9XDCDn5ulISwjoPF/bM8UV+5Ivqp/jKFSMzQrQQonKW1Fy8VMP/pjzrppE51Qx4CXliwPtJzT4wGExdwGlUnODs7eUbitNx9tJrZF7j+cV1uWqOM1QXPqT8QniULr4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(346002)(39860400002)(451199021)(46966006)(36840700001)(40470700004)(316002)(426003)(336012)(40480700001)(5660300002)(82740400003)(44832011)(81166007)(41300700001)(47076005)(356005)(6916009)(4326008)(70206006)(70586007)(83380400001)(54906003)(36860700001)(2616005)(40460700003)(8676002)(8936002)(82310400005)(26005)(1076003)(86362001)(186003)(36756003)(7416002)(2906002)(6666004)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 23:37:05.1348
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7809011-32f1-4b14-44bb-08db4b66232d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7589

Hi,
This patch series is for introducing dynamic programming i.e. add/remove the
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

The main purpose of this series to address first part of the dynamic programming
i.e. making Xen aware of new device tree node which means updating the dt_host
with overlay node information. Here we are adding/removing node from dt_host,
and checking/set IOMMU and IRQ permission but never mapping them to any domain.
Right now, mapping/Un-mapping will happen only when a new domU is
created/destroyed using "xl create".

To map IOREQ and IOMMU during runtime, there will be another small series after
this one where we will do the actual IOMMU and IRQ mapping to a running domain
and will call unmap_mmio_regions() to remove the mapping.

Change Log:
 v5 -> v6:
    Add separate patch for memory allocation failure in __unflatten_device_tree().
    Move __unflatten_device_tree() function type changes to single patch.
    Add error propagation for failures in unflatten_dt_node.
    Change CONFIG_OVERLAY_DTB status to "ARM: Tech Preview".
    xen/smmu: Add remove_device callback for smmu_iommu ops:
        Added check to see if device is currently used.
    common/device_tree: Add rwlock for dt_host:
        Addressed feedback from Henry to rearrange code.
    xen/arm: Implement device tree node removal functionalities:
        Changed file name to dash format.
        Addressed Michal's comments.
    Rectified formatting related errors pointed by Michal.

 v4 -> v5:
    Split patch 01/16 to two patches. One with function type changes and another
        with changes inside unflatten_device_tree().
    Change dt_overlay xl command to dt-overlay.
    Protect overlay functionality with CONFIG(arm).
    Fix rwlock issues.
    Move include "device_tree.h" to c file where arch_cpu_init() is called and
        forward declare dt_device_node. This was done to avoid circular deps b/w
        device_tree.h and rwlock.h
    Address Michal's comment on coding style.

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

Vikram Garhwal (19):
  xen/arm/device: Remove __init from function type
  common/device_tree: handle memory allocation failure in
    __unflatten_device_tree()
  common/device_tree: change __unflatten_device_tree() type
  common/device_tree.c: unflatten_device_tree() propagate errors
  xen/arm: Add CONFIG_OVERLAY_DTB
  libfdt: Keep fdt functions after init for CONFIG_OVERLAY_DTB.
  libfdt: overlay: change overlay_get_target()
  xen/device-tree: Add device_tree_find_node_by_path() to find nodes in
    device tree
  xen/iommu: Move spin_lock from iommu_dt_device_is_assigned to caller
  xen/iommu: protect iommu_add_dt_device() with dtdevs_lock
  xen/iommu: Introduce iommu_remove_dt_device()
  xen/smmu: Add remove_device callback for smmu_iommu ops
  asm/smp.h: Fix circular dependency for device_tree.h and rwlock.h
  common/device_tree: Add rwlock for dt_host
  xen/arm: Implement device tree node removal functionalities
  xen/arm: Implement device tree node addition functionalities
  tools/libs/ctrl: Implement new xc interfaces for dt overlay
  tools/libs/light: Implement new libxl functions for device tree
    overlay ops
  tools/xl: Add new xl command overlay for device tree overlay support

 SUPPORT.md                              |   6 +
 tools/include/libxl.h                   |  11 +
 tools/include/xenctrl.h                 |   5 +
 tools/libs/ctrl/Makefile.common         |   1 +
 tools/libs/ctrl/xc_dt_overlay.c         |  48 ++
 tools/libs/light/Makefile               |   3 +
 tools/libs/light/libxl_dt_overlay.c     |  71 ++
 tools/xl/xl.h                           |   1 +
 tools/xl/xl_cmdtable.c                  |   6 +
 tools/xl/xl_vmcontrol.c                 |  52 ++
 xen/arch/arm/Kconfig                    |   5 +
 xen/arch/arm/device.c                   | 144 ++++
 xen/arch/arm/domain_build.c             | 142 ----
 xen/arch/arm/include/asm/domain_build.h |   2 -
 xen/arch/arm/include/asm/setup.h        |   6 +
 xen/arch/arm/include/asm/smp.h          |   3 +-
 xen/arch/arm/smpboot.c                  |   1 +
 xen/arch/arm/sysctl.c                   |  16 +-
 xen/common/Makefile                     |   1 +
 xen/common/device_tree.c                |  50 +-
 xen/common/dt-overlay.c                 | 929 ++++++++++++++++++++++++
 xen/common/libfdt/Makefile              |   4 +
 xen/common/libfdt/fdt_overlay.c         |  29 +-
 xen/common/libfdt/version.lds           |   1 +
 xen/drivers/passthrough/arm/smmu.c      |  58 ++
 xen/drivers/passthrough/device_tree.c   |  87 ++-
 xen/include/public/sysctl.h             |  23 +
 xen/include/xen/device_tree.h           |  28 +-
 xen/include/xen/dt-overlay.h            |  58 ++
 xen/include/xen/iommu.h                 |   3 +
 xen/include/xen/libfdt/libfdt.h         |  18 +
 31 files changed, 1623 insertions(+), 189 deletions(-)
 create mode 100644 tools/libs/ctrl/xc_dt_overlay.c
 create mode 100644 tools/libs/light/libxl_dt_overlay.c
 create mode 100644 xen/common/dt-overlay.c
 create mode 100644 xen/include/xen/dt-overlay.h

-- 
2.17.1


