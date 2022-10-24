Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F77460B54B
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 20:20:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429314.680257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1on22s-0000v6-91; Mon, 24 Oct 2022 18:19:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429314.680257; Mon, 24 Oct 2022 18:19:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1on22s-0000rc-5B; Mon, 24 Oct 2022 18:19:30 +0000
Received: by outflank-mailman (input) for mailman id 429314;
 Mon, 24 Oct 2022 18:19:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZViS=2Z=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1on22q-0000rW-IH
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 18:19:28 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12hn2213.outbound.protection.outlook.com [52.100.166.213])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63d1ecbd-53c8-11ed-8fd0-01056ac49cbb;
 Mon, 24 Oct 2022 20:19:26 +0200 (CEST)
Received: from MW4PR04CA0352.namprd04.prod.outlook.com (2603:10b6:303:8a::27)
 by PH7PR12MB6905.namprd12.prod.outlook.com (2603:10b6:510:1b7::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Mon, 24 Oct
 2022 18:19:23 +0000
Received: from CO1NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8a:cafe::3a) by MW4PR04CA0352.outlook.office365.com
 (2603:10b6:303:8a::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.27 via Frontend
 Transport; Mon, 24 Oct 2022 18:19:22 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT039.mail.protection.outlook.com (10.13.174.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Mon, 24 Oct 2022 18:19:21 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 24 Oct
 2022 13:19:20 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Mon, 24 Oct 2022 13:19:19 -0500
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
X-Inumbo-ID: 63d1ecbd-53c8-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vxbd7WIoiMXFOwnr8n4jepXsw1Q5DS5Ud+z8WlAqDYs1TK9gMm/uAV41KLMEVi+z1IelGDzSvcyj6vDr7oD6+PF18WfyaBhAEJuZlz76ibeyZMnS7MKlc9FTEbnpzXzPfURkstExO7glCe67RqYkG097gfhM5eFtv17Ta5RUinMSotByU1JMfn86Erpkxxqf/WX9PP6/DoXSS0DopH1NBbT0IF11QX72yMhDVW57MOaMNHmgqs1hsOgd/CITx4nOTkQsmmg0q4p8Jre+IaVmcrarEq45ZESr8WuyO59A938mIck31VN160zPnrA+kRoVDWryqX4zDqlCaLLDDPlWUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J5B3TqJ58VJAkItxAN9gqSaQ9XwjpKLxd/rGzStRCyQ=;
 b=T/EKsq+B3cL8DN3thiImCJF8cZNK9RKzRCP+wHGj8SeQlvhjOXFOD1mrs+cqkbjaCau5GDAFMxTbqA7bwOl/J3bK6Hl9AxFVutmDMpN5+mLN2fL/Iozgfh4BLKJAWIYrmk1NHzA+IwJhv5uziiMYpUImodpUrVR/6kJp4Et3TfJ0siRHVWAnxdHh56i6W94M5CDVY+Vyh0zhLAkd1mHZkpCuFwtGEz1Ecb6zTOy+Rk5kG96d0XEjyk7+6UZTrhbVErdCckvJcFdcf5qQOvh5sZqqgDrgZsTOnWi+aJPjb1bdU4NO5+c/llvtIjjKxJXiGb4erAuFtKj+cRrKNIIogw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5B3TqJ58VJAkItxAN9gqSaQ9XwjpKLxd/rGzStRCyQ=;
 b=YQ/0D5Fmfd0//KxExben+BO5qEVK6lpTQQZii4eIMbhUHtgtfFV1s/rRlQZoyfoZjg04ZXLr6l73wNgjv9ueBy7tWljLjyCeLeLNxO3rQmABJ78V58KwEAqni8a8UZQ0OFwP+oG+ajQCF4MfGEWe4osccBzuXp/EoMj8gDlf+3k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayankuma@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, <michalo@amd.com>,
	Ayan Kumar Halder <ayankuma@amd.com>
Subject: [RFC PATCH v1 00/12] Arm: Enable GICv3 for AArch32
Date: Mon, 24 Oct 2022 19:19:04 +0100
Message-ID: <20221024181917.60416-1-ayankuma@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT039:EE_|PH7PR12MB6905:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c2983bd-22eb-49b4-c535-08dab5ec462c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?f3Qm2FUr1u+BdkV3joZ2mNxbEEikTviXoEVU61AH93uCQKT9nS5jf+Ng0EHh?=
 =?us-ascii?Q?5LF8JXOVI47uuG5+YgBC1uEhOtGwXXdO7CUjOb/GUKY6AL1v9asYSjzrN5DI?=
 =?us-ascii?Q?Sz2QmQ8NHDnwz9cKPPR49gUe3u+w/hdW/fECDM3EL8nVCOJnZhzow2zMT612?=
 =?us-ascii?Q?xHYczkuZF/jJSauFF8JR0WhfXd1FoCMXrKCCDqjAYiQqhcN+pfXNfFhC48qb?=
 =?us-ascii?Q?Ors18mZbqmetX8ovT+cwfrVHVb8GFEvNBgIrjq0I6vXGH4l0FLSprdZbZ1/L?=
 =?us-ascii?Q?KhSLUZDyL5+BfspE8h3LcZ5fbLFs5A4a+CK3gDLd9lgAjj+Ite00jA0gZvzd?=
 =?us-ascii?Q?oCqxjg/EHlUgnRKMQZpI47D5RKyewfOljMElbAtFTCGrRsgkQoMv5sh+aDtA?=
 =?us-ascii?Q?Otu1DwBUVNY5WAbyM3p7r+OTUpKJKXVR7wErOxAdmRkQrKYrS2XfR4Aj7s75?=
 =?us-ascii?Q?+ZNU9NQKlyh59ltfAScWUalgMSyzZ4yIfnpRls3NKJo1dE3ZbJmVh1u5J+4I?=
 =?us-ascii?Q?7KRX++a9FJzBz4N9zNkvYaMD2Rh4Booszy54kzyp4crg+JbvxCGYNFHqmQFL?=
 =?us-ascii?Q?dNbgOEU1k53FFLMWPfTGcEU2sGswVuf5ZT5UXZ10rJUCBzk0BH2GXrxwSr5B?=
 =?us-ascii?Q?TVLshR2E2MuQ6jXTEN5L0nvSAZ3cH7El5MtxLRKfikD276B4IJXjuSY5zKkG?=
 =?us-ascii?Q?9kzrvxS8QF7RSB29n9MDajvwt5fPiV5zAIRdSo3BePE8FzSCI8+Wj+0ZmoQ2?=
 =?us-ascii?Q?9v9+5Whfax0QPQUThcX4jsQIF/z2CAlSPqZRDxxZsdUVlqaP6cq9qHUGr+Qc?=
 =?us-ascii?Q?y6MMSGHJ582Y14hyXPwAX5TBktSxeMnuDVE3hylpO20YhmRa1E0kpfU274X6?=
 =?us-ascii?Q?B14vOAmrvelWWB4KoBSTbIVS59Wdjf0rwft7DcPrpayO+spK7kcDNzUvNfaQ?=
 =?us-ascii?Q?XohRDzkZwvvBjfPm8Rzy4LZ/mjfP39v+Qfp/5kJdqiFEhBqLFoKUNsM6Bid4?=
 =?us-ascii?Q?54Drn2hQOFOATL+cYlDrns4QBiY1GNBUDar50f665ueaSneEGEccauhA5Gk4?=
 =?us-ascii?Q?gFN+a9LtY6P69CNOABKN5iqmOwMTH9wHh08y5/8868yudVL/Ustl/euIeh5O?=
 =?us-ascii?Q?ThCPfzn3ptTyw9G8N3GiTF5lUhRokLCA0zn5FacX+qN6BRbLrRZOYXd8/xlk?=
 =?us-ascii?Q?mJnJW682sfVmYBa0quV8DjhpCxQKN1iE97NyjbW8IY8kk23AONfS4FG9XO8?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:5;SRV:;IPV:CAL;SFV:SPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:OSPM;SFS:(13230022)(4636009)(346002)(376002)(396003)(136003)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(426003)(83380400001)(47076005)(81166007)(356005)(36860700001)(82740400003)(8936002)(70586007)(70206006)(5660300002)(8676002)(4326008)(41300700001)(82310400005)(2906002)(6666004)(26005)(2616005)(40460700003)(1076003)(336012)(54906003)(6916009)(478600001)(36756003)(316002)(40480700001)(186003)(36900700001)(11215385002);DIR:OUT;SFP:1501;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 18:19:21.8876
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c2983bd-22eb-49b4-c535-08dab5ec462c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6905

Hi All,

Please find the following patches to enable GICv3 for AArch32.
This is a pre-requisite to support Xen on Cortex-R52 (AArch32-v8R system)

Let me know your thoughts.

Ayan Kumar Halder (12):
  Arm: GICv3: Sysreg emulation is applicable for Aarch64 only
  Arm: GICv3: Move the macros to compute the affnity level to
    arm64/arm32
  Arm: GICv3: Enable vreg_reg64_* macros for AArch32
  Arm: GICv3: Emulate GICR_TYPER on AArch32
  Arm: GICv3: Emulate GICR_PENDBASER and GICR_PROPBASER on AArch32
  Arm: GICv3: Emulate of ICC_SGI1R on AArch32
  Arm: GICv3: Emulate ICH_LR<n>_EL2 on AArch32
  Arm: GICv3: Define ICH_AP0R<n> and ICH_AP1R<n> for AArch32
  Arm: GICv3: Define GIC registers for AArch32
  Arm: GICv3: Use ULL instead of UL for 64bits
  Arm: GICv3: Define macros to read/write 64 bit
  Arm: GICv3: Enable GICv3 for AArch32

 xen/arch/arm/Kconfig                       |   2 +-
 xen/arch/arm/gic-v3-its.c                  |  20 ++--
 xen/arch/arm/gic-v3-lpi.c                  |   8 +-
 xen/arch/arm/gic-v3.c                      | 132 ++++++++++-----------
 xen/arch/arm/include/asm/arm32/io.h        |   4 +
 xen/arch/arm/include/asm/arm32/processor.h |  10 ++
 xen/arch/arm/include/asm/arm32/sysregs.h   |  80 +++++++++++++
 xen/arch/arm/include/asm/arm64/processor.h |  13 ++
 xen/arch/arm/include/asm/arm64/sysregs.h   |   7 +-
 xen/arch/arm/include/asm/cpufeature.h      |   1 +
 xen/arch/arm/include/asm/gic_v3_defs.h     |  24 ++--
 xen/arch/arm/include/asm/gic_v3_its.h      |   2 +-
 xen/arch/arm/include/asm/processor.h       |  14 ---
 xen/arch/arm/include/asm/vreg.h            |  23 ++--
 xen/arch/arm/vgic-v3-its.c                 |  17 +--
 xen/arch/arm/vgic-v3.c                     |  26 ++--
 16 files changed, 242 insertions(+), 141 deletions(-)

-- 
2.17.1


