Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF686F1DB4
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 19:57:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527433.820005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psSKD-0005Zt-5p; Fri, 28 Apr 2023 17:56:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527433.820005; Fri, 28 Apr 2023 17:56:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psSKD-0005Wh-2D; Fri, 28 Apr 2023 17:56:05 +0000
Received: by outflank-mailman (input) for mailman id 527433;
 Fri, 28 Apr 2023 17:56:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SG5/=AT=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1psSKB-0005Wb-EK
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 17:56:03 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061e.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eda7fe4b-e5ed-11ed-8611-37d641c3527e;
 Fri, 28 Apr 2023 19:55:59 +0200 (CEST)
Received: from MW4PR04CA0200.namprd04.prod.outlook.com (2603:10b6:303:86::25)
 by BL1PR12MB5804.namprd12.prod.outlook.com (2603:10b6:208:394::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Fri, 28 Apr
 2023 17:55:52 +0000
Received: from CO1NAM11FT061.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:86:cafe::51) by MW4PR04CA0200.outlook.office365.com
 (2603:10b6:303:86::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.24 via Frontend
 Transport; Fri, 28 Apr 2023 17:55:52 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT061.mail.protection.outlook.com (10.13.175.200) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.23 via Frontend Transport; Fri, 28 Apr 2023 17:55:51 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 28 Apr
 2023 12:55:50 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Fri, 28 Apr 2023 12:55:49 -0500
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
X-Inumbo-ID: eda7fe4b-e5ed-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V0mg1DeMCcYHqDm55/RmWCoqZ4fbvyrWB99KpbjQ3WhdYO6xfBTlCAlnrd+HLhTHRgZAs1gkGmqKnwsxpc9hnvG+dBboJer4NEbjP/gcUdvSDr7GeifSqp214dcKR6KnFd0bFVT8TKZtA6EM8gRbEHA4HBRet5kOy2Bl9ljvTwvXb39Pkf3RfhHQ+5+dSy9SLoH19RMLfZQr8USt/uTRWnDHTwdy/9m4B5/IUNUgE6EG2FxbOBnoHaqZTiEXGO5F+Q3gSw9DP+xN737lcD9bFWAZo3pfKG8m4q+kj8EMTC1GC3lvqoS2/Koh17KdBqEUvM9m+KwRwA+gWqeJUYx68g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gDZVjVx8ORl4uOYkRL2blaaUXr4kPF8yScK/mrAYFOk=;
 b=Lu5TZIWWACl2jyYO3zgrV1IjnsEcuKXLivstDLtdtBiaXXgF/UE5abyKiYgzzy+SDJFad4P+0uAD/Gg1SmBrTWh0yGRTUBmFbT4/vMHdDTdJxEPz0himQoh6fzbij0T2iil+NjbGSwl1oQe9FO7H4J+ZDFeMnvD/+NkQiWH4i8t5lSGvhxd/bB2dgOaKOpTRWwcx0CBKPqhH/YyY2VzQewklTnppBzbE2Uk8qrzSSzj3fojVAC13M5bkIkgdDG7tcWNgb+qZoVSrBVV5eiExIZ0EVe6HkTXFbXSoJHiBmMhLtXAB0HaQ+5ds1qMDes+Pg6NA1BQrBsBF+3d1C8RVJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDZVjVx8ORl4uOYkRL2blaaUXr4kPF8yScK/mrAYFOk=;
 b=pUyoTQc/KjRcmLh86un7uU+yS/QQwFnAjA4FuxJN+D/FTM3NqzC6KGW+nIoOPlzf7u1iw0FcQI3wMoSyd0HGeV7xKIUVPhc3HbGvCIu9d94wGKnkH09D15MIRk7cjGf/MXkUTHdxCp/ehmJPX5oFyFOFz8ZRJEKl3XTZtk05PdA=
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
Subject: [XEN v6 00/12] Add support for 32-bit physical address
Date: Fri, 28 Apr 2023 18:55:31 +0100
Message-ID: <20230428175543.11902-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT061:EE_|BL1PR12MB5804:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eeca503-858c-4be7-31d9-08db4811ce78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uD9q40pRhG27/lfJ1Sto0RoVaHJaLTrcvZ6gqUBm0fMkwCtNS+/kLq8rT4LYWiCo6nhmqnEKaUJGtZAwXJSADj8HuXFjZgmQTJ0V5e1mTW56EC/l48/+8jcxJaXQYwhITtI3CglhLYt/7vNOvzJRUB6cTDyCpk2NgW1+bhE+prSH1zPg7f6igz9RBNrBpi6eQKBGab0NlGNupZvbmDofnI7jBYeuau8TxNlcjdij7uMqzVOcZ15P3U7+JgG/Z/8c4XtwBiJq0ii8eRvZFE1SwiF2eQhU1QJYl4qUWgnS6qi1ZnGzAnus0TEYoLgoI7SM/0cZXNzlFZ8WH3lhmPAFB7lvTcZ1HvqI+o5pEveJMW1195jmyAAG+rogczS3wGLvvtAYP4nxE8WtYJ5A97qKkzBSAMA2WnpqJLgrXrSlXUBzFKXVczbgCG35TBfKg4B9aI0YaExqt8mW+N1utcqQ440k/56HrWtoqdw/9e7yrZT2iqrGHhz0vffb3l4L/M7THuCHqmzWKUUHA1o3rxhubGag+sq8VmJRDzy537libW/4lWYjjqEbDHcW4/JghOTEqHb//oxHCJExBncdTo/sbQrNXzmwUEAHF4n18bqgnEuZJT/CiS5TjMJEgcqiMPMYR+EaFFzq60Aol0Voaiiq0IDLvoImk7nrH8PLaNQiQcKc1sH8E1s90bRil3M41C6dD0XFNFFLhSwMKsD3VVy+yMB75nQa8+LhueiUh90oJPkEtoGrcsevYvm1MubCZWLnW51SN04mKum5VDOmxIqjhw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(376002)(136003)(451199021)(36840700001)(46966006)(40470700004)(86362001)(7416002)(41300700001)(26005)(1076003)(47076005)(2906002)(5660300002)(966005)(40480700001)(8936002)(336012)(36756003)(8676002)(426003)(81166007)(40460700003)(103116003)(83380400001)(356005)(54906003)(186003)(478600001)(82740400003)(6666004)(70206006)(36860700001)(82310400005)(6916009)(4326008)(316002)(2616005)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2023 17:55:51.6966
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eeca503-858c-4be7-31d9-08db4811ce78
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT061.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5804

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


Ayan Kumar Halder (12):
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
  xen: dt: Replace u64 with uint64_t as the callback function parameters
    for dt_for_each_range()
  xen/arm: pci: Use 'uint64_t' as the datatype for the function
    parameters.
  xen/arm: domain_build: Check if the address fits the range of physical
    address
  xen/arm: p2m: Use the pa_range_info table to support ARM_32 and ARM_64
  xen/arm: p2m: Enable support for 32bit IPA for ARM_32

 xen/arch/Kconfig                           |  3 ++
 xen/arch/arm/Kconfig                       | 32 +++++++++++-
 xen/arch/arm/bootfdt.c                     | 46 +++++++++++++----
 xen/arch/arm/domain_build.c                | 57 +++++++++++++++-------
 xen/arch/arm/gic-v2.c                      | 10 ++--
 xen/arch/arm/gic-v3-its.c                  |  4 +-
 xen/arch/arm/gic-v3.c                      | 10 ++--
 xen/arch/arm/guest_walk.c                  |  2 +
 xen/arch/arm/include/asm/lpae.h            |  4 ++
 xen/arch/arm/include/asm/p2m.h             |  8 +--
 xen/arch/arm/include/asm/page-bits.h       |  6 +--
 xen/arch/arm/include/asm/setup.h           |  6 +--
 xen/arch/arm/include/asm/types.h           |  6 +++
 xen/arch/arm/mm.c                          | 12 ++---
 xen/arch/arm/p2m.c                         | 32 ++++++------
 xen/arch/arm/pci/pci-host-common.c         |  8 +--
 xen/arch/arm/platforms/brcm-raspberry-pi.c |  2 +-
 xen/arch/arm/platforms/brcm.c              |  6 +--
 xen/arch/arm/platforms/exynos5.c           | 32 ++++++------
 xen/arch/arm/platforms/sunxi.c             |  2 +-
 xen/arch/arm/platforms/xgene-storm.c       |  2 +-
 xen/arch/arm/setup.c                       | 14 +++---
 xen/arch/arm/smpboot.c                     |  2 +-
 xen/common/device_tree.c                   | 43 +++++++++++++++-
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
 37 files changed, 367 insertions(+), 146 deletions(-)
 create mode 100644 xen/include/xen/libfdt/libfdt-xen.h

-- 
2.17.1


