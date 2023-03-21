Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFA96C3398
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 15:04:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512662.792731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pecb1-0004RF-IU; Tue, 21 Mar 2023 14:04:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512662.792731; Tue, 21 Mar 2023 14:04:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pecb1-0004P6-EN; Tue, 21 Mar 2023 14:04:15 +0000
Received: by outflank-mailman (input) for mailman id 512662;
 Tue, 21 Mar 2023 14:04:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CsWt=7N=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pecb0-0004P0-Gz
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 14:04:14 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062a.outbound.protection.outlook.com
 [2a01:111:f400:fe59::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3faba1ad-c7f1-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 15:04:10 +0100 (CET)
Received: from DM6PR03CA0086.namprd03.prod.outlook.com (2603:10b6:5:333::19)
 by PH0PR12MB7469.namprd12.prod.outlook.com (2603:10b6:510:1e9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 14:04:06 +0000
Received: from DS1PEPF0000B079.namprd05.prod.outlook.com
 (2603:10b6:5:333:cafe::fd) by DM6PR03CA0086.outlook.office365.com
 (2603:10b6:5:333::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Tue, 21 Mar 2023 14:04:06 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0000B079.mail.protection.outlook.com (10.167.17.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Tue, 21 Mar 2023 14:04:05 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 21 Mar
 2023 09:04:05 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 21 Mar 2023 09:04:04 -0500
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
X-Inumbo-ID: 3faba1ad-c7f1-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M8GdumUuqMLaF4IcpoM0qCgDaMtk7tzyMZ9dtcyhgdp7hGy2aisyKT2+qo2c9pE9g8gAehP5+JZtpuZ/Vj2mykOC27tf3gbY+daXAroRKFB/+Z+PSZrE2n0JqnG4vr9sCO8htEUV13BtxpfGojJbfvwDk1Fl3jT3hMCOuQ+zPkieIK+KgICCyUyVgMI/7xL6wso2RrUga4/XidEpgzqI+pFETzGhA/+i8SaBJjfQ7SOAK0O+bIwtir3rDTQpvpcPgf6wxfrhHQf2GHyH/dZXWmUZk9jfeQv29nTyma740pmBzgGqMRZGKc6ykJwbL7FfufW0yhmfPNgnwCHaJm+tLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6VMK1rMIsJo/CaQpJQaobl6RRkT3j8z9G+KL4/Hqqb0=;
 b=EAeVwmhi9+MhiGGHQhrZYEVNGA1OBA3CGSZWESh1hUsv/v/xopngyftjAuNUAZVcdyX2kF0VnY/HJu1rB3O8HNnP55xXi8JMWlTbmX3ZOLG4I5BuBuA8drc4eS8Eb9PgWI77FTh9Tk0pqNQsp2ila+GYAkxoUoxFaVdNPxypwgTfgk9Z0+XWlc0+DrdaXfI4jOc2C6ENCRzZry0+eKOBpscrIV0kHHgLEVsULe02hT7QEV/SrOloyS3XwIwV3QaV9JFEydyI+oXHZXUs3fkNKGb+lyny7RZchXH4pGrZjQA7lYPcUeM/LS5yMtm8VtJkBUMKpbcfJ5qAkiIqlguylg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6VMK1rMIsJo/CaQpJQaobl6RRkT3j8z9G+KL4/Hqqb0=;
 b=IjmiFz/U4kYS9pAlcW4xOa4EKoKSH0gO5FyWleaR89O05p7ayByMyMwxFZ6wrOMGok50fgpsvvSdUtV2NOOIZ0K0/3YYaejPgflJe2C9ITs0BolLQeLKLkFEkiWSg7KH4Dwt79Wrc416T1rO9ve1ZSV5BQ7vlxeyIujId8hKQRw=
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
Subject: [XEN v4 00/11] Add support for 32 bit physical address
Date: Tue, 21 Mar 2023 14:03:46 +0000
Message-ID: <20230321140357.24094-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000B079:EE_|PH0PR12MB7469:EE_
X-MS-Office365-Filtering-Correlation-Id: 330283ae-2484-4c66-3728-08db2a152244
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y2Affj73BM01k34cz7xKysgPALLU3HrJYo5EL4an2B5S05DL7dwndnU84GGrSskbG6JY8wQ3oOrJ9MIk57BL6iTeQopcaKBZcQT6Mm45koNKQx3Du3lG4mIqE2fcr2AEKmAcEWEThMOLXAXYquGZ925r7you5kLusVjWI++fWf6gqA0Z7d7KUE7v2Gko6bwr2Ge4x5bCoY1zirHqsfen8Brc7G5c7UZkqxPXzfSbmZuUfXKLemc8QORvvi0/JM8Hi4BLBy22kXFTwiG6vq/zXEaFNSQYD+FFDT8tFJtLThxQPUNqhNpe2mEWRNYKcnueR3WV3mtVK4L0fIyp19DPJhJpcYeUArZB48v2BPs1t5GwJZTQkggDHavNBMQpkTD5sl2E+QKUaa6V4CK6/PsnMjYLZt/eZMcO1wZ6eF9Bh8o2Sq/2bfBmOWjBVXfv18QG2ybiHixUlVSSSqj6P/0kBw7NKuRPCxDrF1rRYqQGG1NhL2W5ReikPfC+MAoM+D29qdGaGDhg7hZHzwSEadDj7uNO6uqVRFNr/l9mSNNxWT0jU9udVG1kLlStYJMb9XlTCyG9Ro7WqRrssIu4c9EfjgWRuBrp062oMJde93SCTCG1h2h92UorRq0er/2btbGf9Uf+vYvr7dbBcrLDI3cPyk6YUKvsHA+8oDP21CHOlrM/LKakdJxZEYb0Y8LLB03DYvs9pC8zxO2ROPsbVvQoQ3tn7le4GTPHaptqRmJ4KHdZv0Oi53LIYSNPqZG/AZ/F/YSYsKSFfTVhVr7p8xRQFA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(39860400002)(396003)(346002)(451199018)(40470700004)(46966006)(36840700001)(356005)(8936002)(2616005)(7416002)(5660300002)(36860700001)(82740400003)(81166007)(2906002)(186003)(41300700001)(26005)(1076003)(4326008)(6916009)(336012)(8676002)(40460700003)(40480700001)(47076005)(70206006)(70586007)(6666004)(478600001)(316002)(54906003)(36756003)(426003)(82310400005)(83380400001)(86362001)(966005)(103116003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 14:04:05.9851
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 330283ae-2484-4c66-3728-08db2a152244
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000B079.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7469

Hi All,

Please have a look at https://lists.xenproject.org/archives/html/xen-devel/2022-11/msg01465.html
for the context.

The benefits of using 32 bit physical addresses are as follows :-

1. It helps to use Xen on platforms (for eg R52) which supports 32 bit
physical addresses and has no support for large physical address extension.
On 32 bit MPU systems which supports flat-mapping (for eg R52), it helps
to translate 32 bit VA into 32 bit PA.

2. It also helps in code optimization when the underlying platform does not
use large physical address extension.

The current patch serie depends on :-
"[XEN v5] xen/arm: Use the correct format specifier"
https://lists.xenproject.org/archives/html/xen-devel/2023-01/msg01896.html
I did not send out the patch again as it has already been reviewed and acked and
is waiting to be committed to staging.

The following points are to be noted :-
1. Device tree always use u64 for address and size. The caller needs to
translate between u64 and u32 (when 32 bit physical addressing is used).
2. Currently, we have enabled this option for Arm_32 as the MMU for Arm_64
uses 48 bit physical addressing.
3. https://lists.xenproject.org/archives/html/xen-devel/2022-12/msg00117.html
has been added to this series.

Changes from :

v1 - 1. Reordered the patches such that the first three patches fixes issues in
the existing codebase. These can be applied independent of the remaining patches
in this serie,

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

Ayan Kumar Halder (11):
  xen/arm: Use the correct format specifier
  xen/arm: domain_build: Track unallocated pages using the frame number
  xen/arm: Typecast the DT values into paddr_t
  xen/drivers: ns16550: Use paddr_t for io_base/io_size
  xen/arm: Introduce a wrapper for dt_device_get_address() to handle
    paddr_t
  xen/arm: smmu: Use writeq_relaxed_non_atomic() for writing to
    SMMU_CBn_TTBR0
  xen/arm: Introduce choice to enable 64/32 bit physical addressing
  xen/arm: guest_walk: LPAE specific bits should be enclosed within
    "ifndef CONFIG_PHYS_ADDR_T_32"
  xen/arm: Restrict zeroeth_table_offset for ARM_64
  xen/arm: p2m: Use the pa_range_info table to support Arm_32 and Arm_64
  xen/arm: p2m: Enable support for 32bit IPA for ARM_32

 xen/arch/Kconfig                           |   6 ++
 xen/arch/arm/Kconfig                       |  40 +++++++-
 xen/arch/arm/bootfdt.c                     |  41 ++++++--
 xen/arch/arm/domain_build.c                | 103 +++++++++++++--------
 xen/arch/arm/gic-v2.c                      |  16 ++--
 xen/arch/arm/gic-v3-its.c                  |   4 +-
 xen/arch/arm/gic-v3.c                      |  10 +-
 xen/arch/arm/guest_walk.c                  |   2 +
 xen/arch/arm/include/asm/lpae.h            |   4 +
 xen/arch/arm/include/asm/page-bits.h       |   6 +-
 xen/arch/arm/include/asm/setup.h           |   4 +-
 xen/arch/arm/include/asm/types.h           |   6 ++
 xen/arch/arm/mm.c                          |  10 +-
 xen/arch/arm/p2m.c                         |  29 +++---
 xen/arch/arm/pci/pci-host-common.c         |   6 +-
 xen/arch/arm/platforms/brcm-raspberry-pi.c |   2 +-
 xen/arch/arm/platforms/brcm.c              |   4 +-
 xen/arch/arm/platforms/exynos5.c           |  32 +++----
 xen/arch/arm/platforms/sunxi.c             |   2 +-
 xen/arch/arm/platforms/xgene-storm.c       |   2 +-
 xen/arch/arm/setup.c                       |  14 +--
 xen/arch/arm/smpboot.c                     |   2 +-
 xen/common/device_tree.c                   |  40 +++++++-
 xen/drivers/char/cadence-uart.c            |   4 +-
 xen/drivers/char/exynos4210-uart.c         |   4 +-
 xen/drivers/char/imx-lpuart.c              |   4 +-
 xen/drivers/char/meson-uart.c              |   4 +-
 xen/drivers/char/mvebu-uart.c              |   4 +-
 xen/drivers/char/ns16550.c                 |  43 ++++++---
 xen/drivers/char/omap-uart.c               |   4 +-
 xen/drivers/char/pl011.c                   |   6 +-
 xen/drivers/char/scif-uart.c               |   4 +-
 xen/drivers/passthrough/arm/ipmmu-vmsa.c   |   8 +-
 xen/drivers/passthrough/arm/smmu-v3.c      |   2 +-
 xen/drivers/passthrough/arm/smmu.c         |  23 ++---
 xen/include/xen/device_tree.h              |  27 +++++-
 xen/include/xen/libfdt/libfdt-xen.h        |  52 +++++++++++
 37 files changed, 397 insertions(+), 177 deletions(-)
 create mode 100644 xen/include/xen/libfdt/libfdt-xen.h

-- 
2.17.1


