Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39ED1781612
	for <lists+xen-devel@lfdr.de>; Sat, 19 Aug 2023 02:29:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586689.917926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX9py-0001Vc-UA; Sat, 19 Aug 2023 00:29:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586689.917926; Sat, 19 Aug 2023 00:29:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX9py-0001Sn-RK; Sat, 19 Aug 2023 00:29:06 +0000
Received: by outflank-mailman (input) for mailman id 586689;
 Sat, 19 Aug 2023 00:29:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eu5+=EE=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qX9pw-0001Sg-LQ
 for xen-devel@lists.xenproject.org; Sat, 19 Aug 2023 00:29:04 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20606.outbound.protection.outlook.com
 [2a01:111:f400:fe59::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 647e9635-3e27-11ee-877e-cb3800f73035;
 Sat, 19 Aug 2023 02:29:02 +0200 (CEST)
Received: from MW4PR04CA0086.namprd04.prod.outlook.com (2603:10b6:303:6b::31)
 by MN0PR12MB5714.namprd12.prod.outlook.com (2603:10b6:208:371::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Sat, 19 Aug
 2023 00:28:57 +0000
Received: from CO1PEPF000042AE.namprd03.prod.outlook.com
 (2603:10b6:303:6b:cafe::b6) by MW4PR04CA0086.outlook.office365.com
 (2603:10b6:303:6b::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Sat, 19 Aug 2023 00:28:57 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042AE.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.15 via Frontend Transport; Sat, 19 Aug 2023 00:28:56 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 18 Aug
 2023 19:28:55 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 18 Aug
 2023 19:28:55 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 18 Aug 2023 19:28:54 -0500
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
X-Inumbo-ID: 647e9635-3e27-11ee-877e-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FiLKi7AGrAuIMa8b6OIcONyRS7pPa8Rm8A7TcN8HcmnNTmrDgP79e1Wv6W/nk6AwNOvGS8a9toC7inJsosmKkH/L9bsToY8/A9JTFffGJu4dcqRto4wK86mbaKS4kMPqPco50kGL82CJ+dJtd5mBFQ9556jAmpmGekg+rHgKq3M5MKXDbm57tlXG9S6p5wSHUhfnEHJDgJHX3SsuHysVPll29ZWgm0upvLanhAreEx9fmomzgnIw/EGVuxxew5yDjjnRJkcr+LJdrGa563SYLNuOFqHSVN15ofEoyLKiCquqwTSiYDOE6nCrSlPKdqgrMLf6+rAPQVNZXm1Q1ue4KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xg1tNGwcTKVe3KCopZqUmFR6lHi/qmqyg95nnfNE/cY=;
 b=n43KSrOtEXtb/MYAtsMcklbOsuWM/Mn4pffmfAWB04X1MbIVlakM8QCVx8x0sB0LSzZD8f221vW96yctQHwv9AqlY1zeOmRGF+04esfkV1/FhYh0nRE6mxSIt9IgRYDIxLhXW6zBvZX5Qph1aF1+UqUoEG2bojw7R6m2slCtcK6HWyLvxPielPevqhHn1z+czLKXU0nI1+GeGqqGI9LdALZ0/1wS6dtPTRPISR0g0KXxF000CjjPi8kHtFBvlEJzOpjEmVVQBvSk6AKw0q02cZMBnH+RElZ1j3iRrsydfwzA6aQSHMay5HM2PHshuLatn6NKZo64+1/lgEGVJwBAhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xg1tNGwcTKVe3KCopZqUmFR6lHi/qmqyg95nnfNE/cY=;
 b=OS2/2WfLBvQeHRbo6ikM8tlkhn2yhu8kJ/zn4BayrFNGwgWK8ozhSZcQ6HY7tpSjNwbaM6Kej1SlHTu8fLIbUwJjI0Va56Oo4oF2efKIC6uZbNCEQisUhphKoz/t3XWncs7vAW7c0srfP4sQNGmHWkevuZ/AEDd83OhyFuQArWE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Henry Wang <Henry.Wang@arm.com>, "Community
 Manager" <community.manager@xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Wei
 Liu" <wl@xen.org>, Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Rahul Singh
	<rahul.singh@arm.com>, Anthony PERARD <anthony.perard@citrix.com>, "Juergen
 Gross" <jgross@suse.com>
Subject: [XEN][PATCH v9 00/19] dynamic node programming using overlay dtbo
Date: Fri, 18 Aug 2023 17:28:31 -0700
Message-ID: <20230819002850.32349-1-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|MN0PR12MB5714:EE_
X-MS-Office365-Filtering-Correlation-Id: 4edc11a8-a9f2-4334-244b-08dba04b466d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L6rGe04LiemrNyJw2jqq80Y5dO/UIfw/72p0nSJIoiw/z9wd5IP/on0lrjvnBT1cU8GcgVvAJ/d6JWoxg3T+Br6HzheBfsDj7rSLaC8ZB45ZDKbJ+LquE9f0O54I0mUF/i7BqbpTzW8+89AlxAEGr8Db7KxCui1Iwywd729ri10yHQPWdeOBupMZxmO/p58MtkLHxj2AR8GA0CfIns5UVSFYPjQ5FbU6f+Ut5QiHf1Y9tm9NY5txlZzHdS4YpyrDmnfEa/pnNHcNPLYMdjssAFfMP6rjeQfMMI/7xO0j99jlzESmQWRTwwXK6DzR9pcvT48xwnJ9EGxbFcYasJ+0Y/BrEJ7HX6ZKQRSQXYc27yTAa1JCODqTwzk2HvnNJUPiXY5cVYFG3V+0mQVCLAhsDS6GcpYH7y7FwCYN958vDkkdazxF4uFNVbc1+0LdGNNmR3+cli9M8DWwh4gQYnytEcK3PTCAZwtLpqzNgdeLXdu3TtXGMrJ3dML9UnFtmwHbv6acJEsSqaTZ//n03Ymhq0y5a5gVLDwANKSn1VVlkkxzn/HvR9uEt8Fq6Vg4FvRkg6YtEdb2L06d5I5ud6XG5sBkEvteIeeSbSWR6pPUgqjXtQkIBcRow39Kd6lfRZIC9v5Q59vWHR/VV6IdM+MnymTlIeUNhT5CjpMqzIJNe2h0mKUE24afzWHFK5uAuvObn1Dzw7vrhvqSs9KQoiWrnIvr1uZTXAWuiLm25Obd79JZmpyC5Fo/KoKrMUX75AtszxEQpRSQubOiVBncpBVkBg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(396003)(376002)(39860400002)(451199024)(82310400011)(1800799009)(186009)(46966006)(40470700004)(36840700001)(86362001)(36756003)(82740400003)(356005)(81166007)(40480700001)(44832011)(2616005)(5660300002)(70586007)(478600001)(316002)(70206006)(6666004)(6916009)(26005)(1076003)(41300700001)(8936002)(8676002)(4326008)(54906003)(47076005)(40460700003)(83380400001)(336012)(36860700001)(7416002)(426003)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2023 00:28:56.5887
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4edc11a8-a9f2-4334-244b-08dba04b466d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5714

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
  common/device_tree: handle memory allocation failure in
    __unflatten_device_tree()
  common/device_tree.c: unflatten_device_tree() propagate errors
  xen/arm/device: Remove __init from function type
  common/device_tree: Export __unflatten_device_tree()
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

 CHANGELOG.md                            |    3 +-
 MAINTAINERS                             |    1 +
 SUPPORT.md                              |    6 +
 tools/include/libxl.h                   |   11 +
 tools/include/xenctrl.h                 |    5 +
 tools/libs/ctrl/Makefile.common         |    1 +
 tools/libs/ctrl/xc_dt_overlay.c         |   51 ++
 tools/libs/light/Makefile               |    3 +
 tools/libs/light/libxl_dt_overlay.c     |   71 ++
 tools/xl/xl.h                           |    1 +
 tools/xl/xl_cmdtable.c                  |    6 +
 tools/xl/xl_vmcontrol.c                 |   52 ++
 xen/arch/arm/Kconfig                    |    5 +
 xen/arch/arm/device.c                   |  149 ++++
 xen/arch/arm/domain_build.c             |  147 ----
 xen/arch/arm/include/asm/domain_build.h |    2 -
 xen/arch/arm/include/asm/setup.h        |    6 +
 xen/arch/arm/include/asm/smp.h          |    4 +-
 xen/arch/arm/smpboot.c                  |    1 +
 xen/arch/arm/sysctl.c                   |   16 +-
 xen/common/Makefile                     |    1 +
 xen/common/device_tree.c                |   62 +-
 xen/common/dt-overlay.c                 | 1001 +++++++++++++++++++++++
 xen/common/libfdt/Makefile              |    4 +
 xen/common/libfdt/fdt_overlay.c         |   29 +-
 xen/common/libfdt/version.lds           |    1 +
 xen/drivers/passthrough/arm/smmu.c      |   63 ++
 xen/drivers/passthrough/device_tree.c   |   94 ++-
 xen/include/public/sysctl.h             |   24 +
 xen/include/xen/device_tree.h           |   36 +-
 xen/include/xen/dt-overlay.h            |   63 ++
 xen/include/xen/iommu-private.h         |   28 +
 xen/include/xen/iommu.h                 |    1 +
 xen/include/xen/libfdt/libfdt.h         |   18 +
 34 files changed, 1762 insertions(+), 204 deletions(-)
 create mode 100644 tools/libs/ctrl/xc_dt_overlay.c
 create mode 100644 tools/libs/light/libxl_dt_overlay.c
 create mode 100644 xen/common/dt-overlay.c
 create mode 100644 xen/include/xen/dt-overlay.h
 create mode 100644 xen/include/xen/iommu-private.h

-- 
2.17.1


