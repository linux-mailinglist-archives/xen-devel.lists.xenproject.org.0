Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7631B6E13A1
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 19:38:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520852.808909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn0tJ-0000by-2u; Thu, 13 Apr 2023 17:37:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520852.808909; Thu, 13 Apr 2023 17:37:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn0tI-0000aB-V3; Thu, 13 Apr 2023 17:37:48 +0000
Received: by outflank-mailman (input) for mailman id 520852;
 Thu, 13 Apr 2023 17:37:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2GAK=AE=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pn0tH-0000a4-5P
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 17:37:47 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20617.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e56df47a-da21-11ed-b21e-6b7b168915f2;
 Thu, 13 Apr 2023 19:37:44 +0200 (CEST)
Received: from BN1PR12CA0015.namprd12.prod.outlook.com (2603:10b6:408:e1::20)
 by DM4PR12MB5793.namprd12.prod.outlook.com (2603:10b6:8:60::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 17:37:41 +0000
Received: from BN8NAM11FT107.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e1:cafe::40) by BN1PR12CA0015.outlook.office365.com
 (2603:10b6:408:e1::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.32 via Frontend
 Transport; Thu, 13 Apr 2023 17:37:41 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT107.mail.protection.outlook.com (10.13.176.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.32 via Frontend Transport; Thu, 13 Apr 2023 17:37:41 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 13 Apr
 2023 12:37:40 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 13 Apr
 2023 10:37:40 -0700
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 13 Apr 2023 12:37:38 -0500
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
X-Inumbo-ID: e56df47a-da21-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQWmIdc2SKkD4LjHcrpjH3iWug6JZo3LuEg+yHwHO8Dp4K37seXaYYoAmuo3AW+bjrIs43Ocr0g0I96tU/xVBAaazLInjwJYIM4Hdq1lVnJAVBNMbXghR5qzEEZ3ZQNVxMimsEZ1NghNw90hkW+THc6sQWXMyURCSuuK95RhNCZ2eY1+3dw8FZeZeV5JZUIb7IuFsMpcR5VCdGspOe0oAmNiLvZE6CP4nTngtW8/8CWrLL8zCB35oLqhwOVWzTIHYb4qq+PetKEfoM493x7vh71SjE11pmo2ort2YUXGQUzzgYZNNyEVGu34Q3/NIHRR5a8QdhNadXO3NYbsfjGVkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1VKaqIv1xUd9qTOea23vuzeYmLFJZeuxTrWrpWWn/U=;
 b=EP3VsEOyWh5wVLDKMkbwbK/DunA/HG6Rh8LVdojSuxAMqU2B7Nl/BtGA7IKn+kJvYyoCl+gQtHpB3PdE1DdA5RbozB3SppDSAgtukixX/miW+ZletGyN0/j4HpVhJ/Zp+Q/VwUPAZ8el+y8c52Kh+3EaIWTN4Li73hue+HW+W9+XCq53xHFNC8MslPHN4e4zFqPZJChPyZIq1PzXqMfPUEOGt37ets9SjBObg0lkinm+cgZaOpOIgydNAGQMXXI7S5c5X2vWqtVp6Oi8QMTptShoc8wAMl4NymG//Q7pvmIwetF06ekJasTaYYSiDutbnLtBxzUNE7Z47KzZfSuiQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1VKaqIv1xUd9qTOea23vuzeYmLFJZeuxTrWrpWWn/U=;
 b=f4pCpH/PX3J4GDai+2cAEWLUB3lVvyiU/BPUkmJcwv+/rVN0V4zpEX5bFI7K8JCctRpVyQ/JbDiQt9SxCDgQ/d60RZhPyoh/xf5O0Xve9YL1jyskim1p23vcQgyAmiHl8yWQev3EgkVMvz0OrrrqxKqG3cxb/20N5cg7L1PmkrM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v5 00/10] Add support for 32-bit physical address
Date: Thu, 13 Apr 2023 18:37:25 +0100
Message-ID: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT107:EE_|DM4PR12MB5793:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c3edd7f-2df5-48e5-c423-08db3c45c81d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0tmH1vaMOZyUTJXOaX3BB4fCLIfJpCgCq4CHZxGbq6xpmI6th4eCFP4sRqwkDmDY4pSFRkrnuSTofX09LHm3CjcLY/sjsWyvjtjKxjquXa54iwWWWm3382Lq5pjlJWwWk3MOJLOiXZy8UDQdlac7xPJ51f+xHGkI1Pe4FYIf9f4L2fudMqv147iy20IIf7mv+/IThLDdUauof4y6ftRDKVm8i+o1bab/c5N00ondUi74QV/vbVZSEb78jmLKhh5ueQE5TJHnde4RwIBnp/pq0EO+DzdIeH5L1oGGngBtK+yCfENC4PwXeVTZ9rNbftjxt6jtC/Ic7Ggbt8DjfVd9poIegISERIQB7BV9ADQFPble7WbHbGbBCbbiym6S/grYKHTZkGfzsetX6FDn21nV4diVXuK+7nNT42sZosEbDYIP3x8OPHKVFcVRZSleWIGKGV3XYE3gB41KRQd2DM1/WSHTYJXONdcCXDw3FUIeqq7FaCLM9C7zPPssndAdH6gaYyPpFx+k8NVepaf8B7oqbrYVQL7U9l9cQxkbc/AZzBpUqy1ibMD1VajafiSjSVwZZ9VTseul1ykNfn4kNLfx4Loq/PTjv6qVbwlF7YKsewt6LoioMG62pBtunocJPX1iYWJhEDF0QtocI84e+86s93McYR+GLnXt02YACKzB7A5y6IghCHJZQjiWMxjCI1wEcfDfiqIMZ7lqxJxNAgvDLQEDPzNO/Adl6bZkb2jSlB7LU2+ytiATotBBfMglUmsuZay/WdgnupXU0oL4tNP8GQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(346002)(396003)(451199021)(40470700004)(36840700001)(46966006)(40460700003)(316002)(41300700001)(81166007)(1076003)(26005)(966005)(186003)(86362001)(6666004)(47076005)(356005)(36860700001)(2616005)(82310400005)(426003)(336012)(83380400001)(82740400003)(6916009)(4326008)(54906003)(36756003)(40480700001)(70206006)(70586007)(8676002)(8936002)(5660300002)(2906002)(7416002)(103116003)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 17:37:41.0401
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c3edd7f-2df5-48e5-c423-08db3c45c81d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT107.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5793

Hi All,

Please have a look at https://lists.xenproject.org/archives/html/xen-devel/2022-11/msg01465.html
for the context.

The benefits of using 32 bit physical addresses are as follows :-

1. It helps to use Xen on platforms (for eg R52) which supports 32-bit
physical addresses and has no support for large physical address extension.
On 32-bit MPU systems which supports flat-mapping (for eg R52), it helps
to translate 32 bit VA into 32 bit PA.

2. It also helps in code optimization when the underlying platform does not
use large physical address extension.

The following points are to be noted :-
1. Device tree always use uint64_t for address and size. The caller needs to
translate between uint64_t and uint32_t (when 32 bit physical addressing is used).
2. Currently, we have enabled this option for Arm_32 as the MMU for Arm_64
uses 48-bit physical addressing.
3. https://lists.xenproject.org/archives/html/xen-devel/2022-12/msg00117.html
has been added to this series.

Changes from :

v1 - 1. Reordered the patches such that the first three patches fixes issues in
the existing codebase. These can be applied independent of the remaining patches
in this serie.

2. Dropped translate_dt_address_size() for the address/size translation between
paddr_t and u64 (as parsed from the device tree). Also, dropped the check for
truncation (while converting u64 to paddr_t).
Instead now we have modified device_tree_get_reg() and typecasted the return for
dt_read_number(), to obtain paddr_t. Also, introduced wrappers for
fdt_get_mem_rsv() and dt_device_get_address() for the same purpose. These can be
found in patch 4/11 and patch 6/11.

3. Split "Other adaptations required to support 32bit paddr" into the following
individual patches for each adaptation :
  xen/arm: smmu: Use writeq_relaxed_non_atomic() for writing to
    SMMU_CBn_TTBR0
  xen/arm: guest_walk: LPAE specific bits should be enclosed within
    "ifndef CONFIG_ARM_PA_32"

4. Introduced "xen/arm: p2m: Enable support for 32bit IPA".

v2 - 1. Dropped patches 1/11, 2/11 and 3/11 from the v2 as it has already been
committed (except 2/11 - "[XEN v5] xen/arm: Use the correct format specifier"
which is waiting to be committed).

2. Introduced a new patch "xen/drivers: ns16550: Use paddr_t for io_base/io_size".

v3 - 1. Combined the patches from https://lists.xenproject.org/archives/html/xen-devel/2023-02/msg00656.html in this series.

v4 - 1. Dropped "xen/drivers: ns16550: Use paddr_t for io_base/io_size" from the patch series.

As Jan (jbeulich@suse.com) had pointed out in https://lore.kernel.org/xen-devel/20230321140357.24094-5-ayan.kumar.halder@amd.com/,
ns16550 driver requires some prior cleanup. Also, ns16550 can be ignored for now
for the 32-bit paddr support (which is mainly targeted for Arm). I will send out
separate patches to fix this once the current serie is committed (or in ready to
commit state). I hope that is fine with Jan ?

2. Introduced "xen/arm: domain_build: Check if the address fits the range of physical address".

3. "xen/arm: Use the correct format specifier" has been committed in v4.

Ayan Kumar Halder (10):
  xen/arm: domain_build: Track unallocated pages using the frame number
  xen/arm: Typecast the DT values into paddr_t
  xen/arm: Introduce a wrapper for dt_device_get_address() to handle
    paddr_t
  xen/arm: smmu: Use writeq_relaxed_non_atomic() for writing to
    SMMU_CBn_TTBR0
  xen/arm: Introduce choice to enable 64/32 bit physical addressing
  xen/arm: guest_walk: LPAE specific bits should be enclosed within
    "ifndef CONFIG_PHYS_ADDR_T_32"
  xen/arm: Restrict zeroeth_table_offset for ARM_64
  xen/arm: domain_build: Check if the address fits the range of physical
    address
  xen/arm: p2m: Use the pa_range_info table to support ARM_32 and ARM_64
  xen/arm: p2m: Enable support for 32bit IPA for ARM_32

 xen/arch/Kconfig                           |  3 +
 xen/arch/arm/Kconfig                       | 37 +++++++++++-
 xen/arch/arm/bootfdt.c                     | 48 ++++++++++++----
 xen/arch/arm/domain_build.c                | 67 +++++++++++++++-------
 xen/arch/arm/gic-v2.c                      | 10 ++--
 xen/arch/arm/gic-v3-its.c                  |  4 +-
 xen/arch/arm/gic-v3.c                      | 10 ++--
 xen/arch/arm/guest_walk.c                  |  2 +
 xen/arch/arm/include/asm/lpae.h            |  4 ++
 xen/arch/arm/include/asm/p2m.h             |  8 +--
 xen/arch/arm/include/asm/page-bits.h       |  6 +-
 xen/arch/arm/include/asm/setup.h           |  4 +-
 xen/arch/arm/include/asm/types.h           |  6 ++
 xen/arch/arm/mm.c                          | 12 ++--
 xen/arch/arm/p2m.c                         | 35 +++++------
 xen/arch/arm/pci/pci-host-common.c         |  6 +-
 xen/arch/arm/platforms/brcm-raspberry-pi.c |  2 +-
 xen/arch/arm/platforms/brcm.c              |  6 +-
 xen/arch/arm/platforms/exynos5.c           | 32 +++++------
 xen/arch/arm/platforms/sunxi.c             |  2 +-
 xen/arch/arm/platforms/xgene-storm.c       |  2 +-
 xen/arch/arm/setup.c                       | 18 +++---
 xen/arch/arm/smpboot.c                     |  2 +-
 xen/common/device_tree.c                   | 35 +++++++++++
 xen/drivers/char/cadence-uart.c            |  4 +-
 xen/drivers/char/exynos4210-uart.c         |  4 +-
 xen/drivers/char/imx-lpuart.c              |  4 +-
 xen/drivers/char/meson-uart.c              |  4 +-
 xen/drivers/char/mvebu-uart.c              |  4 +-
 xen/drivers/char/omap-uart.c               |  4 +-
 xen/drivers/char/pl011.c                   |  6 +-
 xen/drivers/char/scif-uart.c               |  4 +-
 xen/drivers/passthrough/arm/ipmmu-vmsa.c   |  8 +--
 xen/drivers/passthrough/arm/smmu-v3.c      |  2 +-
 xen/drivers/passthrough/arm/smmu.c         | 23 ++++----
 xen/include/xen/device_tree.h              | 36 ++++++++++++
 xen/include/xen/libfdt/libfdt-xen.h        | 55 ++++++++++++++++++
 37 files changed, 369 insertions(+), 150 deletions(-)
 create mode 100644 xen/include/xen/libfdt/libfdt-xen.h

-- 
2.17.1


