Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B086708405
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 16:40:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536391.834661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzen3-00077g-Ro; Thu, 18 May 2023 14:39:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536391.834661; Thu, 18 May 2023 14:39:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzen3-00074Q-Oh; Thu, 18 May 2023 14:39:37 +0000
Received: by outflank-mailman (input) for mailman id 536391;
 Thu, 18 May 2023 14:39:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R7bG=BH=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pzen1-00074K-V0
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 14:39:36 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd15eceb-f589-11ed-8611-37d641c3527e;
 Thu, 18 May 2023 16:39:32 +0200 (CEST)
Received: from DM6PR07CA0119.namprd07.prod.outlook.com (2603:10b6:5:330::11)
 by DS7PR12MB8371.namprd12.prod.outlook.com (2603:10b6:8:e9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Thu, 18 May
 2023 14:39:29 +0000
Received: from DM6NAM11FT070.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:330:cafe::7f) by DM6PR07CA0119.outlook.office365.com
 (2603:10b6:5:330::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19 via Frontend
 Transport; Thu, 18 May 2023 14:39:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT070.mail.protection.outlook.com (10.13.173.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.21 via Frontend Transport; Thu, 18 May 2023 14:39:29 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 May
 2023 09:39:29 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 May
 2023 09:39:28 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 18 May 2023 09:39:27 -0500
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
X-Inumbo-ID: cd15eceb-f589-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PXp8NrG71WdXvHyJiseIZqZlZF++FeRXuH8CJyDz9/JE2UZL/TLN8iiH5XZJiAIu86WKguhO7hEkZkLUtKk1WBqUaP5nNR8BbN2e7tPANHdS40/zeX9RSJiGq5VSkpUpkAhFXMhKLz+dr0rxgKs6jdyxw7BDjROgr8u3HfnTa6zZr22lGAPIKhQ4/lOqfb9Uu9lFCruPDAQDrBqNuqnGgUKg78EUwXnccUMITF0eFbdvX+uB0D9k1G2JHgR7gI9f6p6Y8Sidt8cxunf1EH1heZrU6X+Z2tRwVlJ2921wZYWwa4eIMaI4LmflhCa8Vi3QnHjTXm0AWN0LdDxxITHeLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aJCvJZk+ePYZnsdqF65o/m8Ky/j3D4a3J97pUu8ku9s=;
 b=LdVY9sTMm7WOKIc/SiY74yycRnjVa6NZhCQpwEtc/+9R4eJ3m72PXZVPAy31+gWLidNHNSnoaAnEDAe8lcY0nPB9YN9b1pLcNPDsGfWsmU7muf/jL9F4FHaOOOsROzZG5TmS5jZEvy14OGJySBjH2YCsojsxF9cVMyLLfVK6kW26mJcKTIUJWej0Avcoqe6lMnoGRcSPWUO1U6FFeOwa3w72k6pgNxf7LlsVtYXaGH9xaPgG10IHJTGyqezdjfhV0Pm+twVtf3JT5SXsUN7Ya7uTPwJif93Fw1WAtDUZByUBMM/gAOX3VEAjZ+6pA+l8MN3+mpwXdwMwCSnSBOIJjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aJCvJZk+ePYZnsdqF65o/m8Ky/j3D4a3J97pUu8ku9s=;
 b=chB5Xbp46K0i3Wkh5ga1Ejjl0c/GtmN1PL9wKclPk/74IqdSOG3RwPb9vWPKQiXjIJnmGJPWCOoGws7/fwsIT1A4OEEv2gu9oPI2KwI0zoB+vRKwqjwrfFIS8/GWiMH2qXBV+TyggC1piypASGQGPqF6p/gkx/SKCGvUlcXE4BQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>, <michal.orzel@amd.com>, "Ayan Kumar
 Halder" <ayan.kumar.halder@amd.com>
Subject: [XEN v7 00/11] Add support for 32-bit physical address
Date: Thu, 18 May 2023 15:39:09 +0100
Message-ID: <20230518143920.43186-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT070:EE_|DS7PR12MB8371:EE_
X-MS-Office365-Filtering-Correlation-Id: fc125919-d51c-4c43-819f-08db57adafde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	f5g1fXXQDvEMJWYT2G97Xh6UjGwDEvzCyf71DU70nAocIy8Kb5mihXivxowCVivrQTfrZlf5ScYAlGWzZt/VTuxrLTr8jp/8waeT4No8FchEenKSK81omms21DsUgwzlTKqMqhtscok1qVuiU4XUZZYAS2hF1ez8QbOqRgGUE0NMa1Fn8Qb45xcojzlfa0czou9QgTLm9IR+Y5q/XqJYHe5kmFg5om1FjygAf37TmwdfRoJTCBWlYEBQG9YKPlvFdlvvgee81K1XVnDNIvK4wMGczTB9g3UKlvPx3yHqPU8g52by8Z3Xp9PH+E+xM6JrwbMgUHAW/Pg4eBvqyHYszsRwXHVNDjNIUpDBdIXmp7rTpBMinumIKMuRlUyvqaJpiRE3OH5OnB7QDEY8ACGaHVMKda+ZLwaMPlFyGFoX0NQ/uqhel99LgWTSzn9wx+BzGFuZPhu6WVB+PfHSeZaTAL6XVv8Zl+IPwCyGGdYm+osJXI0w8TTzNwm0LzUAluRRgc43VOmonSy7svIJeAa5rbGuARawBXKLbdA8IH5Przlujxv/dJ47BAAL4fNmWVDfGYJKRJOxRlvGx31oYp0VTlbFHn6O6IUdNLWBTeJihvqHVIvw4osADaiF6yP2wKOtNft+BZACQ4lbgHp73ATx/PhDpHkHzkOgr0lNEpxAFgWvRdK2qsk3zlLpRn5frdkAtk73l1/ILS1kly7gHj08UNixLUOlQYFHM1OAZknqxO7HaTY6wjyv5ovcg5XUE+CPiyAXSXktplHL0ZBwdEQwQrPqYJup34fMCnuK1wBFZsA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(376002)(346002)(451199021)(46966006)(36840700001)(40470700004)(1076003)(26005)(966005)(40460700003)(36860700001)(36756003)(2616005)(40480700001)(47076005)(83380400001)(426003)(336012)(86362001)(82310400005)(81166007)(103116003)(82740400003)(356005)(186003)(54906003)(7416002)(478600001)(316002)(2906002)(6916009)(8936002)(8676002)(4326008)(41300700001)(5660300002)(70586007)(70206006)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 14:39:29.3829
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc125919-d51c-4c43-819f-08db57adafde
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT070.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8371

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
translate between uint64_t and unsigned long (when 32 bit physical addressing is used).
2. Currently, we have enabled this option for Arm_32 as the MMU for Arm_64
uses 48-bit physical addressing.


A note for the Xen committers/reviewers :-

The following patches are ready to be committed (1..5). They have been reviewed
by atleast 2 people (out of which atleast one is mantainer).
  xen/arm: domain_build: Track unallocated pages using the frame number
  xen/arm: Typecast the DT values into paddr_t
  xen/arm: Introduce a wrapper for dt_device_get_address() to handle
    paddr_t
  xen/arm: smmu: Use writeq_relaxed_non_atomic() for writing to
    SMMU_CBn_TTBR0
  xen/arm: domain_build: Check if the address fits the range of physical
    address

Out of the remaining patches, the following is the status :-
  xen: dt: Replace u64 with uint64_t as the callback function parameters
    for dt_for_each_range() (Reviewed)
  xen/arm: p2m: Use the pa_range_info table to support ARM_32 and ARM_64
  xen/arm: Introduce choice to enable 64/32 bit physical addressing
  xen/arm: guest_walk: LPAE specific bits should be enclosed within
    "ifndef CONFIG_PHYS_ADDR_T_32"  (Acked)
  xen/arm: Restrict zeroeth_table_offset for ARM_64 (Reviewed and Ack)
  xen/arm: p2m: Enable support for 32bit IPA for ARM_32

I have reordered the patches such that the initial five patches can be
committed without any rebase.

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

2. Introduced "xen/arm: domain_build: Check if the address fits the range of physical address".

3. "xen/arm: Use the correct format specifier" has been committed in v4.

v5 - 1. Based on the comments on "[XEN v5 08/10] xen/arm: domain_build: Check if the address fits the range of physical address",
the patch has been modified and split into the following :-

a.  xen: dt: Replace u64 with uint64_t as the callback function parameters
    for dt_for_each_range()
b.  xen/arm: pci: Use 'uint64_t' as the datatype for the function
    parameters.
c.  xen/arm: domain_build: Check if the address fits the range of physical
    address

v6 - 1. Reordered the patches such that only the patches which are dependent on
"CONFIG_PHYS_ADDR_T_32" appear after the Kconfig option is introduced.

Ayan Kumar Halder (11):
  xen/arm: domain_build: Track unallocated pages using the frame number
  xen/arm: Typecast the DT values into paddr_t
  xen/arm: Introduce a wrapper for dt_device_get_address() to handle
    paddr_t
  xen/arm: smmu: Use writeq_relaxed_non_atomic() for writing to
    SMMU_CBn_TTBR0
  xen/arm: domain_build: Check if the address fits the range of physical
    address
  xen: dt: Replace u64 with uint64_t as the callback function parameters
    for dt_for_each_range()
  xen/arm: p2m: Use the pa_range_info table to support ARM_32 and ARM_64
  xen/arm: Introduce choice to enable 64/32 bit physical addressing
  xen/arm: guest_walk: LPAE specific bits should be enclosed within
    "ifndef CONFIG_PHYS_ADDR_T_32"
  xen/arm: Restrict zeroeth_table_offset for ARM_64
  xen/arm: p2m: Enable support for 32bit IPA for ARM_32

 xen/arch/Kconfig                           |  3 ++
 xen/arch/arm/Kconfig                       | 32 ++++++++++++
 xen/arch/arm/bootfdt.c                     | 46 +++++++++++++----
 xen/arch/arm/domain_build.c                | 57 +++++++++++++++-------
 xen/arch/arm/gic-v2.c                      | 10 ++--
 xen/arch/arm/gic-v3-its.c                  |  4 +-
 xen/arch/arm/gic-v3.c                      | 10 ++--
 xen/arch/arm/guest_walk.c                  |  2 +
 xen/arch/arm/include/asm/lpae.h            |  4 ++
 xen/arch/arm/include/asm/p2m.h             |  6 ---
 xen/arch/arm/include/asm/page-bits.h       |  6 +--
 xen/arch/arm/include/asm/setup.h           |  6 +--
 xen/arch/arm/include/asm/types.h           | 13 +++++
 xen/arch/arm/mm.c                          | 12 ++---
 xen/arch/arm/p2m.c                         | 38 ++++++++++-----
 xen/arch/arm/pci/pci-host-common.c         |  8 +--
 xen/arch/arm/platforms/brcm-raspberry-pi.c |  2 +-
 xen/arch/arm/platforms/brcm.c              |  6 +--
 xen/arch/arm/platforms/exynos5.c           | 32 ++++++------
 xen/arch/arm/platforms/sunxi.c             |  2 +-
 xen/arch/arm/platforms/xgene-storm.c       |  2 +-
 xen/arch/arm/setup.c                       | 14 +++---
 xen/arch/arm/smpboot.c                     |  2 +-
 xen/common/device_tree.c                   | 40 ++++++++++++++-
 xen/drivers/char/cadence-uart.c            |  4 +-
 xen/drivers/char/exynos4210-uart.c         |  4 +-
 xen/drivers/char/imx-lpuart.c              |  4 +-
 xen/drivers/char/meson-uart.c              |  4 +-
 xen/drivers/char/mvebu-uart.c              |  4 +-
 xen/drivers/char/omap-uart.c               |  4 +-
 xen/drivers/char/pl011.c                   |  6 +--
 xen/drivers/char/scif-uart.c               |  4 +-
 xen/drivers/passthrough/arm/ipmmu-vmsa.c   |  8 +--
 xen/drivers/passthrough/arm/smmu-v3.c      |  2 +-
 xen/drivers/passthrough/arm/smmu.c         | 23 ++++-----
 xen/include/xen/device_tree.h              | 42 +++++++++++++++-
 xen/include/xen/libfdt/libfdt-xen.h        | 55 +++++++++++++++++++++
 37 files changed, 380 insertions(+), 141 deletions(-)
 create mode 100644 xen/include/xen/libfdt/libfdt-xen.h

-- 
2.17.1


