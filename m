Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3446DE494
	for <lists+xen-devel@lfdr.de>; Tue, 11 Apr 2023 21:17:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519766.806714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJU8-0004Gw-FG; Tue, 11 Apr 2023 19:16:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519766.806714; Tue, 11 Apr 2023 19:16:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJU8-0004DX-9o; Tue, 11 Apr 2023 19:16:56 +0000
Received: by outflank-mailman (input) for mailman id 519766;
 Tue, 11 Apr 2023 19:16:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOX4=AC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pmJU6-0004DR-Ab
 for xen-devel@lists.xenproject.org; Tue, 11 Apr 2023 19:16:54 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20610.outbound.protection.outlook.com
 [2a01:111:f400:7e89::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67dbd682-d89d-11ed-8611-37d641c3527e;
 Tue, 11 Apr 2023 21:16:50 +0200 (CEST)
Received: from BN9PR03CA0143.namprd03.prod.outlook.com (2603:10b6:408:fe::28)
 by MW6PR12MB8997.namprd12.prod.outlook.com (2603:10b6:303:23e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.35; Tue, 11 Apr
 2023 19:16:43 +0000
Received: from BN8NAM11FT090.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fe:cafe::5d) by BN9PR03CA0143.outlook.office365.com
 (2603:10b6:408:fe::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.39 via Frontend
 Transport; Tue, 11 Apr 2023 19:16:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT090.mail.protection.outlook.com (10.13.177.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.28 via Frontend Transport; Tue, 11 Apr 2023 19:16:42 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 14:16:42 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 12:16:42 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 11 Apr 2023 14:16:41 -0500
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
X-Inumbo-ID: 67dbd682-d89d-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ew2aiM153IebdZ51yzNra06Kl9mM25TsDnKfivWygS65BEpXhoawrogqnDdjjIC9vbLaC/wbSt6K7ZMAQ96foHVPQIFMx1z8S8lv/9WNwqxQ/4NqjIgwV+NuwO81GAoRfBFSBSXqUKuOnACRF5ZxiLXm1Ax84gYgRskhpyb3UHE7liJZb+6A6Ij6q0J5WdH7fhx7m6W53pLO8LgDhoY6H01mOpGKtOt8lM1dECSk1P2pddFgjIdc5FTPdCpzuIjErtqaIMFeLQoNvjCabf6aDmWDIW/bPHAG/enaYGCNuMcQsmSUXsRygM5pkOgW657f09s45IDovMPjHcTgP9t7hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hw2g30xtcvBa51vtOCCSs3IGMhpfBDNnN9dvV4fBjSk=;
 b=RukjOJoqD2n/mHx/m2eV6KVZLukNhlyEkcMgEVEopf/ZBxe0TDwNLA4JpHHwtOle952Btdj+s+d0miNJ2Ilyj2MhN5KkpZWJUP7eXkLepG18xDdf7EJCF16LTgGXFtZH3Uq1u/SUGh/mJrDBrpiSFLU485DCfNpJtMZd6Ulob4GGDfCCqGO4LJnFQ54SR4fsOcHfoRfyswEbAvr6KXF6HJHz8M5Tj5rzPvYe2ho7AB+rMP3hbjM0G1EvvA0w3R88VbaTHu8YT2stmysKTQpP93nDn0JWNTvS09tUSFahLAD64cO30lPXeylHQ+1qWH7cHMjD3wWGQPp58TQdiavBnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hw2g30xtcvBa51vtOCCSs3IGMhpfBDNnN9dvV4fBjSk=;
 b=5IJhn74+mcYpGGrffiF8APF/b19yvnApDraSDN9to2eQsvF6VxKlzj9FmOSoRnYmsFUIeOgEs6TmVA+fgSlo5IRYW2VsxOHgP3+5ud/SCSaPfDyAyX+AjSc4jWac2ftO92LRzyvCjuXR1nC5+xDZjz7A+L2BNy9zd1JV3mW5Lbc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Vikram Garhwal <vikram.garhwal@amd.com>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Rahul Singh
	<rahul.singh@arm.com>, Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [XEN][PATCH v5 00/17] dynamic node programming using overlay dtbo
Date: Tue, 11 Apr 2023 12:16:01 -0700
Message-ID: <20230411191636.26926-1-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT090:EE_|MW6PR12MB8997:EE_
X-MS-Office365-Filtering-Correlation-Id: 2584fd03-1918-43d8-5ac6-08db3ac148f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	adKKCHa+6ja/Kc6S4MUnTSDiZZSB5vtvNKcKRS9+jOyBL/QW+npLt193WrP38VLHD+S8nfiznhm7bJl3XTBBbTBSrJ9eVf8fLkMSx1fETIZUabDFVB71fVmpdhJeSvmOFf+G7fNPalwQGS/h1ofAN0zchKJWMPVA+DntuF5PMDdOmEgFLaIHZRDodNG/Qh0hYKVO+gvyt1sk2a68HkmP7tTLCc0QIui1iRHFmMhMR9VdTUT7W+UI16ojJEnlPeyxwMoRCdhfKzIiENIsFm7UzgWX9Bnlyw8JgzccBUnKltmS/buWoBlYsLeq4iyDvCmUQMD5VH7qKZQmUq7fjDxU8F2XQgYjkh1ICLcCFviVsQU2iY9Zbwsdypwy3bKNYgKGg7E09emLI56ct5FK0MIUaW7uLveBB6tJ1K6OMs8KblAd25oB5AJTwBqkVcwQQBUfNbmaPFtJ+d6dxh6NtHsEANI5HdXwGIWX+yArXWLkGOzSEfqFLTuH65kjur5yTBOYpsRNIFSDutx9kdkicRKk7nNIQs9bzWTI6wjBOvo2smU4SzVaVR/FYHvSD2ZU4Eu1mNJc9hYNpKo9Qx9E/oo3hWfQscYMoTEM0MvUypzkWXRcrqaeJ2fxZC55/pIS8z3+uzpwmJlfG/V8GUPDvm05f1Ld5iMTfMsgtARx0Ztxm9UH5thxslbp3QMB1PetkRNh8OSNC3mQGX/PbZjPmKjgkeHU8OnVsautIQqTz230kFE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(396003)(136003)(346002)(451199021)(46966006)(40470700004)(36840700001)(478600001)(83380400001)(86362001)(40460700003)(40480700001)(36756003)(82740400003)(81166007)(356005)(47076005)(36860700001)(336012)(2616005)(426003)(2906002)(1076003)(26005)(316002)(54906003)(186003)(44832011)(5660300002)(82310400005)(8676002)(6666004)(6916009)(7416002)(8936002)(41300700001)(4326008)(70586007)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 19:16:42.9545
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2584fd03-1918-43d8-5ac6-08db3ac148f7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT090.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8997

Hi,
The main purpose of this series to address first part of the dynamic programming
i.e. making Xen aware of new device tree node which means updating the dt_host
with overlay node information. Here we are adding/removing node from dt_host,
and checking/set IOMMU and IRQ permission but never mapping them to any domain.
Right now, mapping/Un-mapping will happen only when a new domU is
created/destroyed using "xl create".

For adding a node using dynamic programming:
    1. flatten device tree overlay node will be added to a fdt
    2. Updated fdt will be unflattened to a new dt_host_new
    3. Extract the newly added node information from dt_host_new
    4. Add the added node under correct parent in original dt_host.

For removing a node:
    1. Find the node with given path.
    2. Check if the node is used by any of domus. Removes the node only when
        it's not used by any domain.
    3. Removes IRQ permissions and MMIO access.
    5. Find the node in dt_host and delete the device node entry from dt_host.
    6. Free the overlay_tracker entry which means free dt_host_new also(created
in adding node step).

To map IOREQ and IOMMU during runtime, there will be another small series after
this one where we will do the actual IOMMU and IRQ mapping to a running domain
and will call unmap_mmio_regions() to remove the mapping.

Change Log:
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



Vikram Garhwal (17):
  xen/arm/device: Remove __init from function type
  common/device_tree: change __unflatten_device_tree()
  xen/arm: Add CONFIG_OVERLAY_DTB
  libfdt: Keep fdt functions after init for CONFIG_OVERLAY_DTB.
  libfdt: overlay: change overlay_get_target()
  xen/device-tree: Add device_tree_find_node_by_path() to find nodes in
    device tree
  xen/smmu: Add remove_device callback for smmu_iommu ops
  xen/iommu: Move spin_lock from iommu_dt_device_is_assigned to caller
  xen/iommu: protect iommu_add_dt_device() with dtdevs_lock
  xen/iommu: Introduce iommu_remove_dt_device()
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
 xen/arch/arm/device.c                   | 145 ++++
 xen/arch/arm/domain_build.c             | 142 ----
 xen/arch/arm/include/asm/domain_build.h |   2 -
 xen/arch/arm/include/asm/setup.h        |   6 +
 xen/arch/arm/include/asm/smp.h          |   3 +-
 xen/arch/arm/smpboot.c                  |   1 +
 xen/arch/arm/sysctl.c                   |  16 +-
 xen/common/Makefile                     |   1 +
 xen/common/device_tree.c                |  30 +-
 xen/common/dt_overlay.c                 | 897 ++++++++++++++++++++++++
 xen/common/libfdt/Makefile              |   4 +
 xen/common/libfdt/fdt_overlay.c         |  29 +-
 xen/common/libfdt/version.lds           |   1 +
 xen/drivers/passthrough/arm/smmu.c      |  56 ++
 xen/drivers/passthrough/device_tree.c   | 109 ++-
 xen/include/public/sysctl.h             |  24 +
 xen/include/xen/device_tree.h           |  28 +-
 xen/include/xen/dt_overlay.h            |  59 ++
 xen/include/xen/iommu.h                 |   2 +
 xen/include/xen/libfdt/libfdt.h         |  18 +
 31 files changed, 1595 insertions(+), 187 deletions(-)
 create mode 100644 tools/libs/ctrl/xc_dt_overlay.c
 create mode 100644 tools/libs/light/libxl_dt_overlay.c
 create mode 100644 xen/common/dt_overlay.c
 create mode 100644 xen/include/xen/dt_overlay.h

-- 
2.17.1


