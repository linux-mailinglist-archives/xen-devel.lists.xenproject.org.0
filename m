Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D3171F74C
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 02:49:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542787.847066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4syF-0000m8-Oi; Fri, 02 Jun 2023 00:48:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542787.847066; Fri, 02 Jun 2023 00:48:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4syF-0000in-LG; Fri, 02 Jun 2023 00:48:47 +0000
Received: by outflank-mailman (input) for mailman id 542787;
 Fri, 02 Jun 2023 00:48:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CQ40=BW=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1q4syE-0000if-G1
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 00:48:46 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3963e6b6-00df-11ee-b231-6b7b168915f2;
 Fri, 02 Jun 2023 02:48:44 +0200 (CEST)
Received: from MW4PR04CA0052.namprd04.prod.outlook.com (2603:10b6:303:6a::27)
 by PH7PR12MB7017.namprd12.prod.outlook.com (2603:10b6:510:1b7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.26; Fri, 2 Jun
 2023 00:48:40 +0000
Received: from CO1NAM11FT103.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6a:cafe::e4) by MW4PR04CA0052.outlook.office365.com
 (2603:10b6:303:6a::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23 via Frontend
 Transport; Fri, 2 Jun 2023 00:48:40 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT103.mail.protection.outlook.com (10.13.174.252) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.24 via Frontend Transport; Fri, 2 Jun 2023 00:48:38 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 19:48:37 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 19:48:37 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 1 Jun 2023 19:48:36 -0500
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
X-Inumbo-ID: 3963e6b6-00df-11ee-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=acgTgwVw4jEcVK2nvqKPly9XHp06o1H0Lp1YLKlyGTyw4HQ0/2wRb/LQRKIgpgN7MvLVFNeH7GxCBkF27tpui0w85SvlJXcBpBVfkrlubMj6LD3yRzcVCyTrpqHiowv1SUktoKjkTf7KdKTziJrQEg2WXy7QwEN1D6j/BnWau0lTv4Q+ww9OG6G3du2AnPActS+NG7sGrBTG8N6oI5DY2uagKnWDp17tyHN7HiljChIDiAodONMU5LritkeX6O4lp4WJMMHhoU1shhmsmi9iqVSlAuurA3Jj1haIOqmJeuU5/0vyFsD1ufXAPNNQ0yYYNmH/5F2HZbMj+SIu7t+uFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sIeTXt9ePU8RwR3s7ErGAQbHzXr24xG75zzGHq385rY=;
 b=JayHxTPgMLODqKOqKUuXDeu41ju9hwgEoLIQVWzCnbJWkhXr1a44Nr0E4ZHfulufRoN1gCR6ditxRy4/dZmaH/rt3Q75WofATEngVEugsl2mFTMmA0J1rJzK8ehRLeGBmhVkKrIAI07IlJOgHPyON2/4fSecQ8zrfP7gVr+GD/UNQNbaMSac5FdQP0dezuy38V3GwuaSfzQU1qYkzatrap9NCn3J62n49IwKC2tmstX6AN8XbkILfcwGsjUyPXfL8Btv2XumTrUqnBEiNabWArhK24+sHoNM3fkoygpth6shIIMXikUEcBos9/nb0iCEjeAfYndhCcPuqlPRsZsDJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sIeTXt9ePU8RwR3s7ErGAQbHzXr24xG75zzGHq385rY=;
 b=3+Z638EBJoGevThHb4+hWSjcIbc0tDe2zpMYUQbMKOpmxLEv1LkMGMDfT9RuNXVrMl3/hGF0HLghK+2T3w0EDwiGTp8yKpyWeSR5LYtusj9DPI/iFXzNpBbBp3loljiELVf7zugXioEctITTXWA3592X4wVmWjrTsPDGuF9Xetw=
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
Subject: [XEN][PATCH v7 00/19] dynamic node programming using overlay dtbo
Date: Thu, 1 Jun 2023 17:48:05 -0700
Message-ID: <20230602004824.20731-1-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT103:EE_|PH7PR12MB7017:EE_
X-MS-Office365-Filtering-Correlation-Id: ad380a77-a78e-4da3-de68-08db63031af2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KymmPPaDjqycovfErW5bJw4nbqB7Q1o03wjtpkKro73URbZHNE1DHZNZNknnnHxxPzEomUmSOzirV8x3v5qesj+APYcwtXyWItx7cv2+zfS+6iArdKVoO9f+j0ti6NFGGGWXp6qj3PULb1WZL+jE1v/A2jAgYukf07EkkckAmWMx9Q3Hz0MB/HjgBi1zzkBk6S5J4hXPEm1DI+lKFJa3HIEvRjDcvwJYngVc/m4fflQDkB2+N6LC8UeToRXMLK+PXKCb3LUUeDJzAX84TsR5I6rqJRPr1M/ljOvWu3986vUEgpUcDsMzG43ew22FCuqk86TMN+dqcsoOuhK9RtxgiUectqAQpMqW7KWXki9upJi9nEP/h7B6wzluWuSnzEFds30c0/8mzdYVORHzqUccWkrHdTCzoLo/QsSyoac571Nsh+eM4xmwT1tiC6TmLBsj2J7+o0EwIHJzsDRtmwg8TbswKSC0X7ov6Lx9b1swlCvziqOXnayQsVj1IbpnGlk9EHeQRn30Yz65Bek7JH4oUuA8QSDUrodd7pLKoplh4z+LSWDm/qXCgHEVupKJCKwB/b4rX2GAhNVtj54IasGosUdFKu09wsKq1qpRZvwe6xECs3iF8/2UQD6BS9qaMBybsTu4bSiNSya4ynXH1WroNo41ni2kI5Z/sDuWBhukNOFLg7/Bd+DYbpDTXEx+DOmT49is2ETrJxc9Nk0N3p7nU8eheHl+jMRSjwJlmunLlc7DjBEbSeEBlLHNoR41/Wo6ysu1DokLWmmo6mMxNyn7tg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(346002)(39860400002)(451199021)(46966006)(36840700001)(40470700004)(44832011)(82740400003)(356005)(82310400005)(81166007)(40460700003)(86362001)(54906003)(478600001)(6916009)(70586007)(70206006)(4326008)(36756003)(40480700001)(6666004)(186003)(26005)(1076003)(8676002)(8936002)(5660300002)(7416002)(2906002)(316002)(2616005)(47076005)(36860700001)(41300700001)(336012)(83380400001)(426003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 00:48:38.9670
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad380a77-a78e-4da3-de68-08db63031af2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT103.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7017

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
  common/device_tree: change __unflatten_device_tree() type
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

 CHANGELOG.md                            |   2 +
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
 xen/arch/arm/include/asm/smp.h          |   3 +-
 xen/arch/arm/smpboot.c                  |   1 +
 xen/arch/arm/sysctl.c                   |  16 +-
 xen/common/Makefile                     |   1 +
 xen/common/device_tree.c                |  52 +-
 xen/common/dt-overlay.c                 | 953 ++++++++++++++++++++++++
 xen/common/libfdt/Makefile              |   4 +
 xen/common/libfdt/fdt_overlay.c         |  29 +-
 xen/common/libfdt/version.lds           |   1 +
 xen/drivers/passthrough/arm/smmu.c      |  59 ++
 xen/drivers/passthrough/device_tree.c   |  85 ++-
 xen/include/public/sysctl.h             |  24 +
 xen/include/xen/device_tree.h           |  29 +-
 xen/include/xen/dt-overlay.h            |  59 ++
 xen/include/xen/iommu-private.h         |  27 +
 xen/include/xen/iommu.h                 |   2 +
 xen/include/xen/libfdt/libfdt.h         |  18 +
 33 files changed, 1687 insertions(+), 194 deletions(-)
 create mode 100644 tools/libs/ctrl/xc_dt_overlay.c
 create mode 100644 tools/libs/light/libxl_dt_overlay.c
 create mode 100644 xen/common/dt-overlay.c
 create mode 100644 xen/include/xen/dt-overlay.h
 create mode 100644 xen/include/xen/iommu-private.h

-- 
2.17.1


