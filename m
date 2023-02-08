Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FC468EE72
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 13:06:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491718.760975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPjCq-0005bq-NE; Wed, 08 Feb 2023 12:05:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491718.760975; Wed, 08 Feb 2023 12:05:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPjCq-0005Z0-K1; Wed, 08 Feb 2023 12:05:44 +0000
Received: by outflank-mailman (input) for mailman id 491718;
 Wed, 08 Feb 2023 12:05:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/3BG=6E=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pPjCp-0005Yt-1p
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 12:05:43 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20613.outbound.protection.outlook.com
 [2a01:111:f400:7e88::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e611272c-a7a8-11ed-93b5-47a8fe42b414;
 Wed, 08 Feb 2023 13:05:38 +0100 (CET)
Received: from BN9P223CA0005.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::10)
 by DS0PR12MB8502.namprd12.prod.outlook.com (2603:10b6:8:15b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36; Wed, 8 Feb
 2023 12:05:35 +0000
Received: from BN8NAM11FT096.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10b:cafe::dd) by BN9P223CA0005.outlook.office365.com
 (2603:10b6:408:10b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17 via Frontend
 Transport; Wed, 8 Feb 2023 12:05:34 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT096.mail.protection.outlook.com (10.13.177.195) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.17 via Frontend Transport; Wed, 8 Feb 2023 12:05:34 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 8 Feb
 2023 06:05:33 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 8 Feb
 2023 04:05:33 -0800
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Wed, 8 Feb 2023 06:05:32 -0600
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
X-Inumbo-ID: e611272c-a7a8-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RovyDJI5mN7W1CJhW8UGjDhdNTpoyi7AzYWXL94q2osTfD1JnXVVJPFmUZ0G3ea3d+PmxLnVb9d4Ba65OO7fjAoq5Kh1VsSuz2bnHdKRuvCDU14FEXPfIJPGveW7D6wDOcvs22GJJQhBR+L48t04hyx78SrdbDJDVP1ef5Ncqmy0ckk+yDsynDD3/h6YoWCKy/OuF8cedaVQMdbV+HytbAPh5MIWhPKaQPf8bwQggp04kxWhvKpwbm9uHM2GtCPWPtQgqAyKNEULeboZcDi81OWMJmA4cOAfHRrML+76753NlDDE1k+sb6CFATbwJSmy0llF0v5zqBnz2f2QXZPh5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a3dVG3f7t3j71oFqAAKQ6yDvr9I2Ln5TtlO/vvACjZU=;
 b=TxxbvsD/LqqdlxIIJMf84rx5YHl2GpwqERilFjOyg2JSk9V8GngS7MUvHCqpwaugwCffSeEthv/vThWlSxGFUlOVQrhG7PQpi1B+OetYizFxZhPMqXhtFL+2dj7w20euU9dKm4/dht0O10co//wFOZbog+ItUSp/9fwstqCgol3zOfQV7stqoaBrCaLySLZ4EVqcoASGLT80r4WIPY68sTOc6YjAIEyP1mBWIBznOHJkksP8hext+JayN0Oeh0uqJM+DdOAMU8HlYCfqg2rg4xzyPj4YAztjqniHnCG5qJA5jrYA8pR0PRqhPcRgieo+fOZre6SZtduU1Lizuv23kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a3dVG3f7t3j71oFqAAKQ6yDvr9I2Ln5TtlO/vvACjZU=;
 b=U7ldx1QJ/qkUWNJ2K+8uMiyGyTzV2CCRG1UF1tWaagGFSqT2zuoeCOg472z2/stFigPK78DwLYs9dpwpppWYbzx0loDz4c0vfLuCSGXXWiE6NI+dzzn0pJLZJtNZMvXlwGWsSan4eCKfDfx54Qnxe8aB5ZSJujoygXStWSGKdDE=
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
Subject: [XEN v3 0/9] Add support for 32 bit physical address
Date: Wed, 8 Feb 2023 12:05:20 +0000
Message-ID: <20230208120529.22313-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT096:EE_|DS0PR12MB8502:EE_
X-MS-Office365-Filtering-Correlation-Id: bd7bff0f-a7bb-4c37-b1a0-08db09ccc85a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c5IBmDM45OJxXWXeS9VGe2A3gaWZyb1R1pvsYn0wALiDxDjrfVDPYAxzswJbSXrk/lB1isJGdBcMuQ8P1NLeGmxqENhPyjVLanouJhR/pwxRM/37+75JehyrU3LzC5iAHfoIqo1UsBEOnYk3HFDUia4nIIxO+ZKL2xFx+Tf9n8jyg7GzzC1zudxjQRzB5DH9nQIF6TCmzTolRUvBIbZAo5sgXl+EpzbeaQXO3NpA21yz1SC72NNOhAgvad0cceaA9KD/LlwgpOWAeRJX99sCyLN3Mvz9cv+HI4udWk5mPVm0ID1Kolrj/LN0qSNOj5iv2IXg98fbNm7pFQzO+Um9FayB0I+PC8W7Pfi1QA0CVwKSxIWwbLHvYwmiKK3uKuQFkQ3G8oRR2mIbIBkt3zahAYI2mVt3bhtHRx5GTFI7RA9dvb+jQZ249FLds17x9lbwggVyDbShb/Da87dm0LP5YjIv2awbyaQwT85yWAFNpLJiXPQhc7RQeU9sRhbyTiuvaTqnU6YwLzOrRg5PtATpVR/fdPScHb709mdrOuXSpCMzmvFaB4uAmoazwPZFtwFEEst2OUtW2B2++sYDBgiXWRXWZ5P6czU8R9NpCBGvH8M8RlOW4jBHZLdfnInjg4LkPWuwxBgk7SaMR/tXSe4x7LzPCq4Mo3G15X/RSywqdJwstyWt3k2YFar7Fi3z1nmNAP1O0Ok8GtWQiHmgPyTlXj+gPwHH4vk2pA1Gxt5QPoLT42HQSuX3Ao8e2WpZlM2OEcK1pk08pmoD0j27g+rtXhytwuojIog+Eu98RQmhPandWLNAHP+9pQW6WI1cOY/g
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(376002)(136003)(346002)(451199018)(36840700001)(40470700004)(46966006)(5660300002)(47076005)(36756003)(7416002)(2906002)(426003)(81166007)(83380400001)(1076003)(40480700001)(2616005)(336012)(356005)(82740400003)(8676002)(36860700001)(4326008)(70206006)(70586007)(54906003)(6916009)(316002)(8936002)(103116003)(41300700001)(6666004)(186003)(82310400005)(26005)(40460700003)(478600001)(86362001)(966005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 12:05:34.1953
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd7bff0f-a7bb-4c37-b1a0-08db09ccc85a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT096.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8502

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

Ayan Kumar Halder (9):
  xen/ns16550: Remove unneeded truncation check in the DT init code
  xen/arm: Typecast the DT values into paddr_t
  xen/drivers: ns16550: Use paddr_t for io_base/io_size
  xen/arm: Introduce a wrapper for dt_device_get_address() to handle
    paddr_t
  xen/arm: smmu: Use writeq_relaxed_non_atomic() for writing to
    SMMU_CBn_TTBR0
  xen/arm: Introduce choice to enable 64/32 bit physical addressing
  xen/arm: guest_walk: LPAE specific bits should be enclosed within
    "ifndef CONFIG_ARM_PA_32"
  xen/arm: Restrict zeroeth_table_offset for ARM_64
  xen/arm: p2m: Enable support for 32bit IPA

 xen/arch/Kconfig                           | 12 +++++
 xen/arch/arm/Kconfig                       | 31 +++++++++++++
 xen/arch/arm/bootfdt.c                     | 38 ++++++++++++----
 xen/arch/arm/domain_build.c                | 12 ++---
 xen/arch/arm/gic-v2.c                      | 10 ++---
 xen/arch/arm/gic-v3-its.c                  |  4 +-
 xen/arch/arm/gic-v3.c                      | 10 ++---
 xen/arch/arm/guest_walk.c                  |  2 +
 xen/arch/arm/include/asm/lpae.h            |  4 ++
 xen/arch/arm/include/asm/page-bits.h       |  2 +
 xen/arch/arm/include/asm/setup.h           |  2 +-
 xen/arch/arm/include/asm/types.h           |  6 +++
 xen/arch/arm/mm.c                          |  7 +--
 xen/arch/arm/p2m.c                         | 10 +++--
 xen/arch/arm/pci/pci-host-common.c         |  6 +--
 xen/arch/arm/platforms/brcm-raspberry-pi.c |  2 +-
 xen/arch/arm/platforms/brcm.c              |  4 +-
 xen/arch/arm/platforms/exynos5.c           | 32 ++++++-------
 xen/arch/arm/platforms/sunxi.c             |  2 +-
 xen/arch/arm/platforms/xgene-storm.c       |  2 +-
 xen/arch/arm/setup.c                       | 14 +++---
 xen/arch/arm/smpboot.c                     |  2 +-
 xen/common/device_tree.c                   | 36 ++++++++++++++-
 xen/drivers/char/cadence-uart.c            |  4 +-
 xen/drivers/char/exynos4210-uart.c         |  4 +-
 xen/drivers/char/imx-lpuart.c              |  4 +-
 xen/drivers/char/meson-uart.c              |  4 +-
 xen/drivers/char/mvebu-uart.c              |  4 +-
 xen/drivers/char/ns16550.c                 | 31 ++++++++-----
 xen/drivers/char/omap-uart.c               |  4 +-
 xen/drivers/char/pl011.c                   |  6 +--
 xen/drivers/char/scif-uart.c               |  4 +-
 xen/drivers/passthrough/arm/ipmmu-vmsa.c   |  8 ++--
 xen/drivers/passthrough/arm/smmu-v3.c      |  2 +-
 xen/drivers/passthrough/arm/smmu.c         | 23 +++++-----
 xen/include/xen/device_tree.h              | 27 +++++++++--
 xen/include/xen/libfdt/libfdt_xen.h        | 52 ++++++++++++++++++++++
 xen/include/xen/types.h                    |  2 +
 38 files changed, 311 insertions(+), 118 deletions(-)
 create mode 100644 xen/include/xen/libfdt/libfdt_xen.h

-- 
2.17.1


