Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E96977EE62
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 02:40:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584984.915917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWR3W-0002GR-Jl; Thu, 17 Aug 2023 00:40:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584984.915917; Thu, 17 Aug 2023 00:40:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWR3W-0002EC-GL; Thu, 17 Aug 2023 00:40:06 +0000
Received: by outflank-mailman (input) for mailman id 584984;
 Thu, 17 Aug 2023 00:40:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IvtK=EC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qWR3V-000280-Is
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 00:40:05 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20612.outbound.protection.outlook.com
 [2a01:111:f400:7e89::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 997f9d77-3c96-11ee-9b0c-b553b5be7939;
 Thu, 17 Aug 2023 02:40:02 +0200 (CEST)
Received: from SN4PR0501CA0056.namprd05.prod.outlook.com
 (2603:10b6:803:41::33) by PH8PR12MB6817.namprd12.prod.outlook.com
 (2603:10b6:510:1c8::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Thu, 17 Aug
 2023 00:39:58 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:803:41:cafe::b7) by SN4PR0501CA0056.outlook.office365.com
 (2603:10b6:803:41::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.14 via Frontend
 Transport; Thu, 17 Aug 2023 00:39:58 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Thu, 17 Aug 2023 00:39:57 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 16 Aug
 2023 19:39:57 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 16 Aug
 2023 19:39:57 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 16 Aug 2023 19:39:56 -0500
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
X-Inumbo-ID: 997f9d77-3c96-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jFVKyrFb4cUfE1i4kNpj5SFeW52Gr0MIwBomL3Hf8UfEzVq7o2JZtXxn/BFiyEOE75Gjjk6XMg0/ffi6cYwTMNyfr+ALH7vTPGBVnpzEAp85alVd9yxaeDLMMTHQ4QbMbw1/sNCXAJw/4+t5fL9PMcXO0ktC3g2dFhhRVG0Cx7pvFAaCTVs+cv9PE+dEJHSYwbWSV6tITRSzikUnKHL+7FAW6YwYfndapymC2Q3A6YDn62a67x1UknvSckk6vFMANPSkoBCBummbb3N42b7/QNH3E3qGTNEYWqGEi0GCvnZM4uOVTuggR+lZaq+1+k2fKh4tAFzy9sFDq3MGYywcwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/7/Vbb3hfH7PO9gjFu8Xd4s/jtaGWor6VcqdbuuVKU=;
 b=VaM2Dt0KHR0PPs3yjngQWnzztrd8PsLMKa/nzHhRIrSFRpuD5R/jzTSwik9wr0ZMBoBIsvsdTwyDCwmOI0jxJky9Z3GCsk7vIjGJC8eyCSWNMUI/vgigQkY2QgSqLzWTiw17E3UH8Bq3xW+lbw9yx5nBMLM6sxX7TVWf464zWFoOFCyL2jvw89yjDaW6JtXIl40Cwdo4CbMQF3khb3Men2/mZQdPpOCkZZ1VpvPNGO2Yox/G1eS/J6u7vMU3a30PSbYCDYYD4IX9yxu8p2PqZICWBKT+Z8rWwG7WaScsVvQWXQy+ps7yvaDYDnwoTUC7mU/8EXZUzfDs7x/ZtAXc8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9/7/Vbb3hfH7PO9gjFu8Xd4s/jtaGWor6VcqdbuuVKU=;
 b=MFTYKefu37bBIl9GbmJCxAthL4lTeEwJeZbBe0Hvl9vpPgelshi8wve9FF0fDBaL3v8BaNLvOSrmzvNB1iSoqGHF7R5xbSaqeYB51b2ahbcZ6cTThXOYTfrPQjlf72kFpHpOZGddRSoDPiV2Y5H3JGN/BXYclqB/1r5rXCCutbA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Henry Wang <Henry.Wang@arm.com>, Community Manager
	<community.manager@xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Rahul Singh <rahul.singh@arm.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [XEN][PATCH v8 00/19] dynamic node programming using overlay dtbo
Date: Wed, 16 Aug 2023 17:39:28 -0700
Message-ID: <20230817003947.3849-1-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|PH8PR12MB6817:EE_
X-MS-Office365-Filtering-Correlation-Id: e69cb36c-ee0c-4e04-c2e4-08db9eba7bb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	szh7IyJ6SD0SzmK1eDXLv0VsE2W9j3E7mWXW1/TdC1HA4KG+REpStKoly8oaP/ij87pT/nS1RAsWyOaPzArIMu0if3SkQraV9luBBZk1TEflATxnVQgiqLcJWOZXxzRO6txAO7JxAyn1kKqb01714dpDouRfeQED/K0WQteQwzsKWkTl+qthMxC+PxcKOMlOATkXegfbsgN0nf8J6dA2n7/4gDVs0+9KNAhNTkqtjir3HIP0u3B9yIs3aUVumLmno7MrMw3fLoyfcVZKpi+tpAaIpQy+Q4t1zI5C5hdqMIDMlbdCc9HfMlLeYZCdQF1gum97pHKphX0p6Ix39gdiD8rtUpmoePOD5VetaWVdy3thCzE40n1RFmuc5TcVwnJJ484q5eNgUyQrWYgojyfdGSAsH3RlbA+6bHQb4PVcJZSY9StHs+C9PLpTd6eJWEhp7GuQnHH1Ifcsm4LRvBGmwLxNucxVr2MyJY8DLOTWGitQ7+rSTQZG4RCfctJwkBww/Wwon/7wTysQ5hLMMtf9yL0wPn991A8AAdqeu0tLKLY1xWECOiCkXhMutnfV1mOP0n2arYrIHTmb96Eem/noBC1DSSXms90jxjl/GeOuDNH8xt5Cb2IjPP5xT16z0EL1THRxXNOmc3zoaKIuvVOTKcahT3AopNtuPrkQUQlPW3AR8BLPCz58OE7arW7t2yN5Co4E9F/KfCYsPTYJfE9AwyzxpmbRC8RpYyntmeImMZhutyNU6MwfnZZQJ/EWNT1sQtluO1+nl1d/kl++0Pq9ug==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199024)(1800799009)(186009)(82310400011)(36840700001)(46966006)(40470700004)(316002)(54906003)(356005)(82740400003)(6916009)(81166007)(70586007)(70206006)(5660300002)(41300700001)(36860700001)(44832011)(47076005)(4326008)(8936002)(8676002)(26005)(2906002)(40460700003)(83380400001)(40480700001)(426003)(336012)(478600001)(7416002)(86362001)(36756003)(6666004)(1076003)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 00:39:57.8785
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e69cb36c-ee0c-4e04-c2e4-08db9eba7bb1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6817

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

 CHANGELOG.md                            |   3 +-
 MAINTAINERS                             |   1 +
 SUPPORT.md                              |   6 +
 tools/include/libxl.h                   |  11 +
 tools/include/xenctrl.h                 |   5 +
 tools/libs/ctrl/Makefile.common         |   1 +
 tools/libs/ctrl/xc_dt_overlay.c         |  51 ++
 tools/libs/light/Makefile               |   3 +
 tools/libs/light/libxl_dt_overlay.c     |  71 ++
 tools/xl/xl.h                           |   1 +
 tools/xl/xl_cmdtable.c                  |   6 +
 tools/xl/xl_vmcontrol.c                 |  52 ++
 xen/arch/arm/Kconfig                    |   5 +
 xen/arch/arm/device.c                   | 149 ++++
 xen/arch/arm/domain_build.c             | 147 ----
 xen/arch/arm/include/asm/domain_build.h |   2 -
 xen/arch/arm/include/asm/setup.h        |   6 +
 xen/arch/arm/include/asm/smp.h          |   4 +-
 xen/arch/arm/smpboot.c                  |   1 +
 xen/arch/arm/sysctl.c                   |  16 +-
 xen/common/Makefile                     |   1 +
 xen/common/device_tree.c                |  62 +-
 xen/common/dt-overlay.c                 | 954 ++++++++++++++++++++++++
 xen/common/libfdt/Makefile              |   4 +
 xen/common/libfdt/fdt_overlay.c         |  29 +-
 xen/common/libfdt/version.lds           |   1 +
 xen/drivers/passthrough/arm/smmu.c      |  63 ++
 xen/drivers/passthrough/device_tree.c   |  94 ++-
 xen/include/public/sysctl.h             |  24 +
 xen/include/xen/device_tree.h           |  36 +-
 xen/include/xen/dt-overlay.h            |  58 ++
 xen/include/xen/iommu-private.h         |  28 +
 xen/include/xen/iommu.h                 |   1 +
 xen/include/xen/libfdt/libfdt.h         |  18 +
 34 files changed, 1710 insertions(+), 204 deletions(-)
 create mode 100644 tools/libs/ctrl/xc_dt_overlay.c
 create mode 100644 tools/libs/light/libxl_dt_overlay.c
 create mode 100644 xen/common/dt-overlay.c
 create mode 100644 xen/include/xen/dt-overlay.h
 create mode 100644 xen/include/xen/iommu-private.h

-- 
2.17.1


