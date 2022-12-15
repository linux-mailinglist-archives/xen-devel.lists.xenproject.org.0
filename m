Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3897664E1D1
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 20:33:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463748.722002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5tyV-0006ND-R5; Thu, 15 Dec 2022 19:32:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463748.722002; Thu, 15 Dec 2022 19:32:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5tyV-0006Ka-Nw; Thu, 15 Dec 2022 19:32:59 +0000
Received: by outflank-mailman (input) for mailman id 463748;
 Thu, 15 Dec 2022 19:32:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BWk7=4N=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p5tyU-0006KU-3F
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 19:32:58 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45cf781d-7caf-11ed-8fd3-01056ac49cbb;
 Thu, 15 Dec 2022 20:32:56 +0100 (CET)
Received: from DS7PR03CA0254.namprd03.prod.outlook.com (2603:10b6:5:3b3::19)
 by BL3PR12MB6523.namprd12.prod.outlook.com (2603:10b6:208:3bf::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Thu, 15 Dec
 2022 19:32:52 +0000
Received: from DM6NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b3:cafe::e7) by DS7PR03CA0254.outlook.office365.com
 (2603:10b6:5:3b3::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12 via Frontend
 Transport; Thu, 15 Dec 2022 19:32:52 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT017.mail.protection.outlook.com (10.13.172.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.12 via Frontend Transport; Thu, 15 Dec 2022 19:32:52 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 15 Dec
 2022 13:32:51 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 15 Dec 2022 13:32:50 -0600
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
X-Inumbo-ID: 45cf781d-7caf-11ed-8fd3-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dq2TwASc3+cW3sfM+peayYzbs0oNA+1u7pvUN33tVE4eMv57a15HkZgF2I/w8XriKORVDMfKH1tzflvQKXUjYaQFwWwc2GXgpvWBwOUz3F+PzgRnNgi2IFU3BOM8jWu4x06lVgbpookPglovtjy1qQ25LeKXtpA+H2An+oZ/UVPGbSTh8P7Cc3kJkCAPO7+/esfNBxAzCTQlzBnXY5rZhBSD58CY4GWg1XUKS6yvhbRW0UV9g7xKhjVyDFUOVh2O6sxk+FNwvA3XySGMxdsHE9Z5ugHYYdAGLF8+qA+UBbV8uh1warvEBoNPlXZ5tvQvGVgUltk/s0JQRBXCAJBrDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L5zcmeRFz8lDxQOJjYxclv81XepsraOXmyBCIc/D3dI=;
 b=gKk4+5wDPSr2BbGc1o8qALpQLBSRSVktlgBCQUxpXWRIdLUvO7C2XoqLZEaXEyZ9kj+xNvxcWZ2fikU4M/C5BTKBVoxR2FL2yuuRX1Zc5CMxB1omFTQ9eOQQgVTOBBm+6L+RdcEQxhTJsFiqQdqx5jbcu1z3mOrW6kmcHWI/BLuf4Fjd1o7Jt46/GpOF/mzUXulMvMAL2MAoLlJDg3B1hqcb6iNQcqPr7XUoCvznmMLGAsGOzxZ5zoM5lZUUnA2INcv87qrdPcT75tBZrWtGNpzOGZxMGJJxvVteJNUbcoi+Q23TZf5D+Oz2daE4DN9X535xPf5uEtPyO26wUi3Bfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L5zcmeRFz8lDxQOJjYxclv81XepsraOXmyBCIc/D3dI=;
 b=Cex+NMHcTDWzOYY49C/UBCvteryuOU0boh3aBb5+w6oJnYF1pH2hiE/AG/gk+Srum1aebD5fMe7E8FKSoIJJ2BtZGa3miz/ccupfQwjeWnFrnJBaFFELjXYu4e7eQV/WuARIc+3adCP/VhnFapGUZO9xGWVbnmtdZHIkK9Tp20k=
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
Subject: [XEN v1 0/9] Add support for 32 bit physical address
Date: Thu, 15 Dec 2022 19:32:36 +0000
Message-ID: <20221215193245.48314-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT017:EE_|BL3PR12MB6523:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a61f454-f967-4f60-fabc-08daded32847
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NqEr8O6oWIH/K8pcayZNrFcAAo2Y0iK8vEqSeqzHb7UIU6DFSXmxI879XiUeI1sUN/MzEBNz07F0hEiQUG0Ok4lzF6PyCdJq6iOS4VpKVCNrEFaKP4iG+4WkDc3GWIFkD7K9izU9tXY9ff6efPNK6blnxiMwMJFUJbVnXrONXP4RHPpKWR0ObwVN0ia5Jc5H2NB0eTo5dhf2dMyRKEPDD34KZkz61GBe+p4LiGhxOjpjHDJyOENl/yFUUlaxudWlCPXkoYfAcv7ManZnhHWU/wYaEot6LV5slYtrkMyIzXu7rm/LFvcBc+ul1QMl3ei4QTOr/7tAT++/NIc7RaJEcSTuwXbIL+1uB/uRVaIDr2b5sBWUG+ia2CAJvW6cfTCgP+6OrFnJxVBeXzkb95ypUx6ib247JWE394pszermiU5HCqZpZsJDJhDCtXZjITGqLAkOu17u2Kf5CEiE42jQhZwYsdASWSrvWcM5P7bGGE4Rrk/LQMi47AvXAw+E/925Um9jlATSy1gHl3bD0uPa5ZFGT9/HUZ01BVAluHDxn+63JYIGYzTLV3V4dRXhl8NlHBWHuJYVpFBUJaSFYgUOpwPe6A/HI9pCF8+c2QhXkQccLKOLNb2UZLk43Opjd0j5oC1jVW3Ns3dVifmR6CdN2DI+R+ltmILpH8XSyaH2HB+06XOi2oB1imS4MgvEw91QAVFMB3t16B+AFRQGIU4jgF9aAW9+SRC1pjbnPvlbY7JJMOB1Qqai5IqQ3jx6JaowzhhLBYqCFpdlZm7f6vGMfySFhyJOpBfgKFEJOrHEfCagCI8lIkG2t1om5v55LLig
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(396003)(376002)(451199015)(36840700001)(40470700004)(46966006)(82740400003)(426003)(2906002)(40480700001)(1076003)(2616005)(336012)(36860700001)(478600001)(6666004)(966005)(6916009)(26005)(70206006)(54906003)(70586007)(8676002)(4326008)(186003)(5660300002)(356005)(8936002)(41300700001)(40460700003)(81166007)(83380400001)(36756003)(82310400005)(316002)(47076005)(103116003)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 19:32:52.0836
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a61f454-f967-4f60-fabc-08daded32847
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6523

Hi,

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

Ayan Kumar Halder (9):
  xen/arm: Remove the extra assignment
  xen/arm: Define translate_dt_address_size() for the translation
    between u64 and paddr_t
  xen/arm: Always use 'u64' instead of 'paddr_t' for address and size in
    DT
  xen/arm: Use translate_dt_address_size() to translate between device
    tree addr/size and paddr_t
  xen/arm: Use 'PRIpaddr' to display 'paddr_t' variable
  xen/arm: Use 'u64' to represent 'unsigned long long'
  xen/arm: Restrict zeroeth_table_offset for ARM_64
  xen/arm: Other adaptations required to support 32bit paddr
  xen/arm: Introduce ARM_PA_32 to support 32 bit physical address

 xen/arch/arm/Kconfig                 |  9 ++++
 xen/arch/arm/bootfdt.c               | 22 +++++----
 xen/arch/arm/domain_build.c          | 69 ++++++++++++++++++++--------
 xen/arch/arm/gic-v2.c                | 39 ++++++++++++----
 xen/arch/arm/gic-v3.c                | 33 +++++++++++--
 xen/arch/arm/guest_walk.c            |  2 +
 xen/arch/arm/include/asm/lpae.h      | 10 ++++
 xen/arch/arm/include/asm/page-bits.h |  2 +
 xen/arch/arm/include/asm/platform.h  | 26 +++++++++++
 xen/arch/arm/include/asm/types.h     |  7 +++
 xen/arch/arm/mm.c                    |  6 ++-
 xen/arch/arm/platforms/brcm.c        |  9 +++-
 xen/arch/arm/platforms/exynos5.c     | 48 +++++++++++++------
 xen/arch/arm/platforms/sunxi.c       | 11 ++++-
 xen/arch/arm/setup.c                 | 18 +++++++-
 xen/drivers/char/exynos4210-uart.c   | 10 +++-
 xen/drivers/char/ns16550.c           | 16 ++++---
 xen/drivers/char/omap-uart.c         | 10 +++-
 xen/drivers/char/pl011.c             | 10 +++-
 xen/drivers/char/scif-uart.c         | 10 +++-
 xen/drivers/passthrough/arm/smmu.c   | 18 ++++++--
 xen/include/xen/serial.h             |  2 +-
 22 files changed, 305 insertions(+), 82 deletions(-)

-- 
2.17.1


