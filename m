Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F1F79333B
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 03:17:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595990.929712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdh9w-0007B8-F2; Wed, 06 Sep 2023 01:16:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595990.929712; Wed, 06 Sep 2023 01:16:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdh9w-00078t-Bm; Wed, 06 Sep 2023 01:16:44 +0000
Received: by outflank-mailman (input) for mailman id 595990;
 Wed, 06 Sep 2023 01:16:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kbfT=EW=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qdh9u-0006tr-Tc
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 01:16:43 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 088e5575-4c53-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 03:16:41 +0200 (CEST)
Received: from BL1PR13CA0230.namprd13.prod.outlook.com (2603:10b6:208:2bf::25)
 by DM4PR12MB7551.namprd12.prod.outlook.com (2603:10b6:8:10d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 01:16:35 +0000
Received: from BL02EPF0001A107.namprd05.prod.outlook.com
 (2603:10b6:208:2bf:cafe::3e) by BL1PR13CA0230.outlook.office365.com
 (2603:10b6:208:2bf::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.27 via Frontend
 Transport; Wed, 6 Sep 2023 01:16:35 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A107.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Wed, 6 Sep 2023 01:16:34 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 5 Sep
 2023 20:16:34 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 5 Sep
 2023 20:16:33 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 5 Sep 2023 20:16:32 -0500
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
X-Inumbo-ID: 088e5575-4c53-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F9YfDexylpOWTQ7H6hKw3QtpJGel5iqgstjT7Zx1Hl2CVWoUPl5pZbY9DjCrdmgNqhEqywvao94gHz2I7ifyzlZ3HK3lu2OvScklDkgD0KQMNMOJ7Of7SlQ6YNcksFhzPxtCc7lPAd49ieoyKWHT7YATJVSfqTXOukFQ+uWYL5Ur4Xx8kaeZ5UW40lcYGkUHv5BMvOtYdKIjhxN+R6r/7twimhb+lN2PbmJj465VceQX4zEYyp3NXYhOFjaaj2yhBizyceebRrNM8zssFhqtElcwk/8bh/qxD76xreFCSJNtGxlhhwCyUGg6Uuj3SAelgpJVbOZiOMsS4OxjuBdcHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YRaSndzPuZOlWjgIrTo2bo6mQsmVRypiGZ7LfEF3wVc=;
 b=TxRTqL7z+9tfhPV0vhrBgPcGEB5xn9ly8r3vAcJ7DR5fHeaHQX/30eZGvgc36Vt6Kr+nZoRLgHLg830mRr2i82vBCjkFGVzy0uL/hYhIUGFnauCGQ97WRcb5c6bz5OYCmOTKv2N1LoR98FmJHwAAJZrhEn3iBOTlzlm6qugqplq9Y+orfy3oNJmC4aXVyaoKrnBakifnIqw4r7Gh4Ii+lbc5MmuXysCWWtsoOexWxn3BhOLG6p89JB//xxRvQTy3KH6m3MIe377b/+6L//EHRJEXPbIUWbkPHqeHDsWdLSsT55YKWgURUooO60RJpcmeQ39kTxyQIubOjRxEf+XjCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YRaSndzPuZOlWjgIrTo2bo6mQsmVRypiGZ7LfEF3wVc=;
 b=ONglr0V10uUwHBDcxzP1l81U2iiRn3ICwwfUmUM9YBiHPBHV59Fp9D9g92tp9RIdn1TiFhccTu2qDl75Nz6egvNBIJeuOH5VjqCShbRqySmG0HFiwOug7Nz6gaLNQBM6YRXDvpzoLGDrdmXVriIAB4P2jgWGetw68ur+huak3Ew=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <vikram.garhwal@amd.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Henry Wang
	<Henry.Wang@arm.com>, Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Rahul Singh
	<rahul.singh@arm.com>, Anthony PERARD <anthony.perard@citrix.com>, "Juergen
 Gross" <jgross@suse.com>
Subject: [XEN][PATCH v12 00/20] dynamic node programming using overlay dtbo
Date: Tue, 5 Sep 2023 18:16:10 -0700
Message-ID: <20230906011631.30310-1-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A107:EE_|DM4PR12MB7551:EE_
X-MS-Office365-Filtering-Correlation-Id: 143d2a1f-f7ae-4c0b-572d-08dbae76e949
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	97FfOS0Fn/T/9N/T+36K21bd03n+6KM4OWS3q+s4OCeswHmkoz96hvdUP1rFziYUi6jS5YcgpxOj/XigxoxfOy1cTTVEs3UOQlozG8YtnWkuy+IXXdsXGCCcFtb2aWU0XlxCEDcP4qaXF8hcC1fKgPHTnZwc8o7yc6tBkB6lanXVFDxfWpVVeArse2TADqFTHejI3Ush4q4hlIYMAlS7IRkPrlkKwBNNc0V5KRuxsa/nTwT7eDyUtJN6T3XMpk68PLDqh7qyAlQoqhutQfZjC7E/aHE4/53+ePOsH2eqfewcfA4Fpq8PZ5AvtlG6UmIdv0y67rjjCA/e0uDmDIUGKhvUZtJsvDRhhAAvtxkA6V6Rfutjd5q3xo4XJ/NqxurQROeo1gUkLjHVV+jw4OSZs48jE9gfSfkff+pGehG42mQnTsX7iIaWzTuGO6iagHJbdfs8phzIKkgO7g8mWXxxjAhhMTvfzff18imXuuRpua6pBCp7Eq7YFk8eIKZoJRn9e0g/rTxYKYqQibSAhNRkD3R/Jx25OokQA+W4JN4nZD0PLUPGf9is8cJ3KzrIK12iZ6fsSa6WtJHKgi3Kz8twZioWUZ/N4KxtIUefJ6HJDEpO24imlm2b4kLoEJtHoOM58T8cK3WWBQ5Y+YRzMGfTNqoQQ3ax6DZfi5P0FVIVzc+CD/v+Tjkv9RqULN4Wzm4073CbtBS/i5BECKbiGw//NSb+WQZmRM5y3lpGZQsG9SYUd5qyKUkBlM91e0mRcQ4m+LlM0sQuLn7H7Fuya4pB2g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(376002)(396003)(346002)(451199024)(186009)(1800799009)(82310400011)(36840700001)(40470700004)(46966006)(81166007)(356005)(6666004)(82740400003)(36756003)(40460700003)(36860700001)(86362001)(40480700001)(47076005)(2906002)(336012)(2616005)(426003)(26005)(478600001)(83380400001)(1076003)(70586007)(4326008)(8676002)(44832011)(70206006)(8936002)(5660300002)(7416002)(6916009)(54906003)(41300700001)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 01:16:34.5860
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 143d2a1f-f7ae-4c0b-572d-08dbae76e949
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A107.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7551

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

Example of overlay node:
/dts-v1/;

/ {

        fragment@0 {
                target-path = "/axi";

                __overlay__ {

                        ethernet@ff0e0000 {
                                compatible = "cdns,zynqmp-gem", "cdns,gem";
                                status = "okay";
                                interrupt-parent = <0x4>;
                                interrupts = <0x0 0x3f 0x4>;
                                reg = <0x0 0xff0e0000 0x0 0x1000>;
                                clock-names = "pclk", "hclk", "tx_clk", "rx_clk", "tsu_clk";
                                #address-cells = <0x1>;
                                #size-cells = <0x0>;
                                #stream-id-cells = <0x1>;
                                iommus = <0xe 0x877>;
                                power-domains = <0xc 0x20>;
                                clocks = <0x3 0x1f 0x3 0x6b 0x3 0x30 0x3 0x34 0x3 0x2c>;
                                phy-handle = <0xf>;
                                pinctrl-names = "default";
                                pinctrl-0 = <0x10>;
                                phy-mode = "rgmii-id";
                                xlnx,ptp-enet-clock = <0x0>;
                                local-mac-address = [00 0a 35 00 22 01];
                                xen,passthrough = <1>;
                                ethernet-phy@c {
                                        reg = <0xc>;
                                        ti,rx-internal-delay = <0x8>;
                                        ti,tx-internal-delay = <0xa>;
                                        ti,fifo-depth = <0x1>;
                                        ti,dp83867-rxctrl-strap-quirk;
                                interrupt-parent = <0x4>;
                                interrupts = <0x0 0x4f 0x4>;
                                xen,passthrough = <1>;
                                phandle = <0x2>;
                                };
                        };
    };
};

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

Vikram Garhwal (20):
  common/device_tree: handle memory allocation failure in
    __unflatten_device_tree()
  common/device_tree.c: unflatten_device_tree() propagate errors
  xen/arm/device: Remove __init from function type
  common/device_tree: Export __unflatten_device_tree()
  xen/arm: Add CONFIG_OVERLAY_DTB
  libfdt: Keep fdt functions after init for CONFIG_OVERLAY_DTB.
  libfdt: overlay: change overlay_get_target()
  xen/device-tree: Add dt_find_node_by_path_from() to find nodes in
    device tree
  xen/iommu: Move spin_lock from iommu_dt_device_is_assigned to caller
  xen/iommu: protect iommu_add_dt_device() with dtdevs_lock
  xen/iommu: Introduce iommu_remove_dt_device()
  xen/smmu: Add remove_device callback for smmu_iommu ops
  asm/smp.h: Fix circular dependency for device_tree.h and rwlock.h
  common/device_tree: Add rwlock for dt_host
  arm/asm/setup.h: Update struct map_range_data to add rangeset.
  xen/arm: Implement device tree node removal functionalities
  xen/arm: Implement device tree node addition functionalities
  tools/libs/ctrl: Implement new xc interfaces for dt overlay
  tools/libs/light: Implement new libxl functions for device tree
    overlay ops
  tools/xl: Add new xl command overlay for device tree overlay support

 CHANGELOG.md                            |   2 +
 MAINTAINERS                             |   1 +
 SUPPORT.md                              |   6 +
 tools/include/libxl.h                   |  11 +
 tools/include/xenctrl.h                 |   5 +
 tools/libs/ctrl/Makefile.common         |   1 +
 tools/libs/ctrl/xc_dt_overlay.c         |  50 ++
 tools/libs/light/Makefile               |   3 +
 tools/libs/light/libxl_dt_overlay.c     |  71 ++
 tools/xl/xl.h                           |   1 +
 tools/xl/xl_cmdtable.c                  |   6 +
 tools/xl/xl_vmcontrol.c                 |  52 ++
 xen/arch/arm/Kconfig                    |   5 +
 xen/arch/arm/device.c                   | 319 +++++++++
 xen/arch/arm/domain_build.c             | 297 +-------
 xen/arch/arm/include/asm/domain_build.h |   2 -
 xen/arch/arm/include/asm/setup.h        |  12 +
 xen/arch/arm/include/asm/smp.h          |   4 +-
 xen/arch/arm/smpboot.c                  |   1 +
 xen/arch/arm/sysctl.c                   |  16 +-
 xen/common/Makefile                     |   1 +
 xen/common/device_tree.c                |  58 +-
 xen/common/dt-overlay.c                 | 901 ++++++++++++++++++++++++
 xen/common/libfdt/Makefile              |   4 +
 xen/common/libfdt/fdt_overlay.c         |  29 +-
 xen/common/libfdt/version.lds           |   1 +
 xen/drivers/passthrough/arm/smmu.c      |  60 ++
 xen/drivers/passthrough/device_tree.c   |  92 ++-
 xen/include/public/sysctl.h             |  24 +
 xen/include/xen/device_tree.h           |  38 +-
 xen/include/xen/dt-overlay.h            |  63 ++
 xen/include/xen/iommu.h                 |  10 +
 xen/include/xen/libfdt/libfdt.h         |  18 +
 33 files changed, 1811 insertions(+), 353 deletions(-)
 create mode 100644 tools/libs/ctrl/xc_dt_overlay.c
 create mode 100644 tools/libs/light/libxl_dt_overlay.c
 create mode 100644 xen/common/dt-overlay.c
 create mode 100644 xen/include/xen/dt-overlay.h

-- 
2.17.1


