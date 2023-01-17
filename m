Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A286666E51E
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 18:44:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479655.743635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHq0T-0000KO-9q; Tue, 17 Jan 2023 17:44:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479655.743635; Tue, 17 Jan 2023 17:44:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHq0T-0000H0-6u; Tue, 17 Jan 2023 17:44:21 +0000
Received: by outflank-mailman (input) for mailman id 479655;
 Tue, 17 Jan 2023 17:44:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D8eG=5O=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pHq0R-0000Gu-00
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 17:44:19 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2079.outbound.protection.outlook.com [40.107.101.79])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f60bf75-968e-11ed-91b6-6bf2151ebd3b;
 Tue, 17 Jan 2023 18:44:17 +0100 (CET)
Received: from BN8PR12CA0010.namprd12.prod.outlook.com (2603:10b6:408:60::23)
 by SA1PR12MB6896.namprd12.prod.outlook.com (2603:10b6:806:24f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 17:44:12 +0000
Received: from BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:60:cafe::3f) by BN8PR12CA0010.outlook.office365.com
 (2603:10b6:408:60::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Tue, 17 Jan 2023 17:44:12 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT053.mail.protection.outlook.com (10.13.177.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.13 via Frontend Transport; Tue, 17 Jan 2023 17:44:12 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 17 Jan
 2023 11:44:12 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 17 Jan
 2023 11:44:11 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 17 Jan 2023 11:44:11 -0600
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
X-Inumbo-ID: 8f60bf75-968e-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OtOa4AJUcsFlfYj72GZcTikQyBUSwtC4Ls+3xNcz+VMwkVg1h0Ykxl+TfW85QZexGSZUGmhhImzpNehKtFjaVCk8mPlZDvcrk3k73ipKbYpg+h/XnyrxQNG9pmUsMlyPfdrTBvl72w/eCqQONMHrpEfZ6DdnrAgRdjEvZi6Kx3txQUlJ1hT/xXWI9BAmsHAkDpqr0KUrkZPH6IDoqCT2rDNula0QYvsT9pfISfhzAFTdXEVPGXi/Wjlsm0u4i0iMfiQIP+hgpx+TLq+aGXly6uUjbChgDN1mFbhLTBfcHREFJ4x2aGT48cIZdePUN4Fh3ldFI7SGRc7+aBLSgU/uRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q2RD9ZRtSDHuGZSZbGgqtX8rHC0gssD0MojCsiUdImY=;
 b=dBO08lTk3DavtN19mab5QfiXuNUOv/rby2X//qAyaHF5lXByYJ7RgUOyUl6yx0eXOkM96k4Y8uzEakM/loLBz+Ecm22Y60Z8LsdkOx8f3xB5XIu3YqS0OnpMvHgBEecH53JBiPLojlU031Qmpa1ygzbZO6Oc237rsLnLPD8Mi19/0smfH1uMMFoc9FyM+JZfyBPyozH/SbDy1f7xPDMZaYYZEJ30tYOEyaloa9LGjA/uwODHrgP77vG6YKH7mCOL6f+GtxR1i6uOB2xlLOfCbFwD+A50KXfo0I6jNKpc0Cj2oRF9sn1kM47mkMMvftPXceSJxS/KoBH69bLtcR9clQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q2RD9ZRtSDHuGZSZbGgqtX8rHC0gssD0MojCsiUdImY=;
 b=bElTYGfm1iC/2rt7qyiGfK83TYpFpfOlc7sGLWCMyGfPaYlvz0GG/0TUZj9f1AxT/edxS/BAGnFyia9iOyLfm55VzJ0/E9BY8wREElzI0c2rNDcHUF26zQ1TuUVRzsb7lpIW7OzeMJjI8kpsLswYBkXNNXIDLDlED34k9lZ9apY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v2 00/11] Add support for 32 bit physical address
Date: Tue, 17 Jan 2023 17:43:47 +0000
Message-ID: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT053:EE_|SA1PR12MB6896:EE_
X-MS-Office365-Filtering-Correlation-Id: b05008b4-914d-498f-bc69-08daf8b271f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	csNQt348hr56Rs58/2gBkQDEjimrLd/KMyAi0i4gMVauJU9O2P/TH+xFegnz+kcoI9Fe4IC5RgSr0dEfAp9lNSUrB209AFzWpOZWpMflhOOpSf9LInUEajYMJn9pklQlsCU1AB4BICvTWe0dGS+yehmyt0Z01xjnFDwMEUcbbAEArUswmmOSYs5UFHPK9Fg+PWFahTW5my3eemjt3q1T4v6ZS9yLO9yn6sQXU6wEj+21wkrckWjlT0A1y+mj852WGbxX8qhcxcsA9aFQ0DH0xgs0iXpHnkdPECBHGcq/qIO3kQKRQ+Zc10iStzLVZwGI089zYNTsR7lTV5y3OOqUyVLAeA/87iQHfJGavjsoyJjuI7ww1pTSfL1SDCUmJy173lphCFTXNUBKz+PZCeZ4nwmOmFL0lsw1oTZ+NpcD4i759QNGtL9iTOC3QmvSAqbkgrfjxrCKYekIZwUHBpUW0zy6zXFVIGsCMoKOVcEK3DpmYs4IBoLQQnEBNjy9y/uFA61pfbFkPiKwlqkdzmZmjs0vvAKurWxfpGzdpfaHNy+kzc2f9i88Qd1H3WmEAMeW1WO04cqpEefNJNSH6p+dsycpaSOIyVj1TvBfOG61H9QK5fYejWwY0Z4XVFu2eDdTx1KMxO7u1qry62lOOUY1ARAPZPIJdbikhIh9ZF/C+XdsuUfrYy8RhYPOwQwwE2hdJoqEt+UlNGnmSDyRA9gZz8GHNlNwpWP9O+ZJAaIqQ5ZDT9ZztSQkZ43J3r0CAzUhFh+CCai4+wadDOlouFF8vReLKaYyjcOAhBhFK/ipOpUmmW/r/m7lOiiUC2wLIJ0D
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(39860400002)(346002)(451199015)(36840700001)(40470700004)(46966006)(86362001)(82310400005)(36756003)(103116003)(186003)(26005)(6916009)(8676002)(4326008)(2616005)(70206006)(70586007)(41300700001)(426003)(47076005)(40480700001)(1076003)(336012)(54906003)(316002)(478600001)(966005)(40460700003)(2906002)(356005)(81166007)(83380400001)(36860700001)(5660300002)(8936002)(82740400003)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 17:44:12.5347
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b05008b4-914d-498f-bc69-08daf8b271f0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6896

Hi All,

Please have a look at https://lists.xenproject.org/archives/html/xen-devel/2022-11/msg01465.html
for the context.

The benefits of using 32 bit physical addresses are as follows :-

1. It helps to use Xen on platforms (for eg R52) which supports 32 bit
physical addresses and has no support for large page address extension.
On 32 bit MPU systems which supports flat-mapping (for eg R52), it helps
to translate 32 bit VA into 32 bit PA.

2. It also helps in code optimization when the underlying platform does not
use large page address extension.


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

Ayan Kumar Halder (11):
  xen/ns16550: Remove unneeded truncation check in the DT init code
  xen/arm: Use the correct format specifier
  xen/arm: domain_build: Replace use of paddr_t in find_domU_holes()
  xen/arm: Typecast the DT values into paddr_t
  xen/arm: Use paddr_t instead of u64 for address/size
  xen/arm: Introduce a wrapper for dt_device_get_address() to handle
    paddr_t
  xen/arm: smmu: Use writeq_relaxed_non_atomic() for writing to
    SMMU_CBn_TTBR0
  xen/arm: guest_walk: LPAE specific bits should be enclosed within
    "ifndef CONFIG_ARM_PA_32"
  xen/arm: Introduce ARM_PA_32 to support 32 bit physical address
  xen/arm: Restrict zeroeth_table_offset for ARM_64
  xen/arm: p2m: Enable support for 32bit IPA

 xen/arch/arm/Kconfig                   |  9 ++++
 xen/arch/arm/bootfdt.c                 | 23 ++++++----
 xen/arch/arm/domain_build.c            | 32 +++++++-------
 xen/arch/arm/gic-v2.c                  | 17 ++++----
 xen/arch/arm/gic-v3.c                  | 11 ++---
 xen/arch/arm/guest_walk.c              |  2 +
 xen/arch/arm/include/asm/device_tree.h | 59 ++++++++++++++++++++++++++
 xen/arch/arm/include/asm/lpae.h        |  4 ++
 xen/arch/arm/include/asm/page-bits.h   |  2 +
 xen/arch/arm/include/asm/setup.h       |  2 +-
 xen/arch/arm/include/asm/types.h       |  7 +++
 xen/arch/arm/mm.c                      |  9 +---
 xen/arch/arm/p2m.c                     | 10 +++--
 xen/arch/arm/platforms/exynos5.c       | 33 +++++++-------
 xen/arch/arm/platforms/sunxi.c         |  3 +-
 xen/arch/arm/setup.c                   | 14 +++---
 xen/arch/arm/smpboot.c                 |  2 +-
 xen/drivers/char/exynos4210-uart.c     |  5 ++-
 xen/drivers/char/ns16550.c             | 16 +++----
 xen/drivers/char/omap-uart.c           |  5 ++-
 xen/drivers/char/pl011.c               |  7 +--
 xen/drivers/char/scif-uart.c           |  5 ++-
 xen/drivers/passthrough/arm/smmu.c     | 24 ++++++-----
 23 files changed, 199 insertions(+), 102 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/device_tree.h

-- 
2.17.1


