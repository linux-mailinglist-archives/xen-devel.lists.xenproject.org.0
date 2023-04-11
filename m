Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0086DE4AC
	for <lists+xen-devel@lfdr.de>; Tue, 11 Apr 2023 21:20:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519859.806992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJX4-00018B-2D; Tue, 11 Apr 2023 19:19:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519859.806992; Tue, 11 Apr 2023 19:19:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJX3-00011E-M7; Tue, 11 Apr 2023 19:19:57 +0000
Received: by outflank-mailman (input) for mailman id 519859;
 Tue, 11 Apr 2023 19:19:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOX4=AC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pmJUV-0004Ta-0W
 for xen-devel@lists.xenproject.org; Tue, 11 Apr 2023 19:17:19 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77e9e886-d89d-11ed-b21e-6b7b168915f2;
 Tue, 11 Apr 2023 21:17:16 +0200 (CEST)
Received: from MW4PR04CA0265.namprd04.prod.outlook.com (2603:10b6:303:88::30)
 by MW4PR12MB6826.namprd12.prod.outlook.com (2603:10b6:303:20c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 11 Apr
 2023 19:17:11 +0000
Received: from CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:88:cafe::78) by MW4PR04CA0265.outlook.office365.com
 (2603:10b6:303:88::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38 via Frontend
 Transport; Tue, 11 Apr 2023 19:17:11 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT019.mail.protection.outlook.com (10.13.175.57) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.28 via Frontend Transport; Tue, 11 Apr 2023 19:17:10 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 14:17:09 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 11 Apr 2023 14:17:08 -0500
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
X-Inumbo-ID: 77e9e886-d89d-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FHBwRl823hZHqaHvlJEDD9c0hgJYEYyzHw7+HTSe3zci0HAjvN2K8OG2rhN3gDvOIqw484GPO48nWzNRr6OEQuK9Ri49wrw2/uM0uPdUX+IhkHRgjy/sT1qn5ZgK0cuX7Q3w0MI0vEz/vk804UEtknUZ5UBrPxbDjalphVoPLCHCioRfVnN5oIwTgQEfcIB4Ut7Sl4EOsvPtxd3HLWA2TCcsrn6Sle4uxtbkSUfPvYTpPDaRAbM9Jaz95bgDEd6569wHV0sop2tU2CrQqk2LXQpCW6Mu+PG+7cRc3laoMxcJdn/b8XPF7ilUQp2z0N9N/XRW49A/6ySSJUDr2aCfaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hw2g30xtcvBa51vtOCCSs3IGMhpfBDNnN9dvV4fBjSk=;
 b=WF5a2E5cX1Cldnw4kycbLzrRT96Y2n9DabXE21Qn4h/ak9llBaQBfwceaY0HRCSLMiz6j8wDiPQ1f+Yq5ho+cTCuHrzbOb/rqT6Qy6gXdDePXr6GbPhL7hwsQZN8ZvDGO6usrEaCF2kZMwV03NNxzP49lR1GPpWhxKGM26bDuYITrcd3TRCIydSIH7QPt6sDnQYD+SPwGZAFwHfMyzQ3uTsO0l63+ohTWOlJTus0+7nVFCDj4VpgNYWzfjRLBjQY1bBLdQsJy+3J/IEX/B22ZdHHs0oQqlOgj+9ZH2pqzQMzXJgoJv9C1G7TeaOQvoyD3tCluDmp9nTfiS2+UQaKAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hw2g30xtcvBa51vtOCCSs3IGMhpfBDNnN9dvV4fBjSk=;
 b=S9efHmq59byr7CoVacRkxGSKidI32MJIGuyDa9VEV8CDAInJatmvdxGjc3Rpe4q6es2psc/FEi8tTa4WvVs2hZWWTNOyw87pUZeckigavYUq50NwEtYTVsEqNPJgJxj0wCTpvydY2yn7aQPfPOo3bC8twb9QrEfnSFCiR20KN+I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
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
Date: Tue, 11 Apr 2023 12:16:19 -0700
Message-ID: <20230411191636.26926-19-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230411191636.26926-1-vikram.garhwal@amd.com>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT019:EE_|MW4PR12MB6826:EE_
X-MS-Office365-Filtering-Correlation-Id: b9d2ea11-1fd7-4bdc-b624-08db3ac1598d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mZ9k7sGiGuqKUJ2aHqC1WS7N6XihTTKyLAp3o5cybz4tyD18X3rr24xohcciAIwFxrlYRAlxC39CesC/zJfb4qVm9BifAsx13LsP7Sl0M5pf6Cr6j1LkbAX4MxIli/+6Lyt0wd006TTbvejBeOIUv4oBZW2Hma6eVB57z/E6P/xEWgu2g2oEVvqgOPvyNsUwI16tdQcnDAHa2RcAL1Ib0A240Lp66ZKKwfi4Je4s5HxsHRzlgzLE3aJWK6LppTWQ5MuVZQiWCzbi65py7+C4pIZKApOC49drEG6FS5YFGO0C0dv7FXPnV7zaWCWxfJ3+U8jI++igbm3uoBafyO5e2Sr7pa+7FzFAK/X/1ORpeQt+P0ReIC2Zynjd5Lm/btt7dRZg6HAra9sl1broasHovOeDEtj7JpB0fTNoX1zXcPmUZcOfdn75bL5d5hm8c41Tl7gI2QiDZqavzAzg00G4O71GqTtbh6y6WQEn3S6tMSLXiHdZo1SijsM1nZ3GRT6YPw3BMauYjgA1RSS6xFPsx+SFRl2ZFZJ9jwIcdLPFnbnIpCXJlBlU+DiJ/6sPx+8HDsKEj1dJjqDxBolg54cwBPBPKtWmZ5HOPSbNlY419djNaB9Jbuz6BFarfhXX88aUixCAVMl4UHtiZ9tOVt+9EWBIRf9+Kh6w9X6ckMVyJqOxeA/8X1e0ztKBUJFaBBb3rdLgLIjnJvYEiHOnaKRPbGGgW/YtcOnCZhn1HzKVH7o=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(396003)(136003)(376002)(451199021)(46966006)(36840700001)(40470700004)(6666004)(47076005)(2616005)(426003)(336012)(83380400001)(4326008)(40460700003)(186003)(86362001)(26005)(478600001)(2906002)(6916009)(70586007)(8676002)(82740400003)(41300700001)(70206006)(356005)(44832011)(81166007)(54906003)(36756003)(1076003)(82310400005)(316002)(8936002)(7416002)(5660300002)(36860700001)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 19:17:10.7209
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9d2ea11-1fd7-4bdc-b624-08db3ac1598d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6826

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


