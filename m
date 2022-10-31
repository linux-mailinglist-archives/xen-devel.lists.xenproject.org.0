Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1D46139BF
	for <lists+xen-devel@lfdr.de>; Mon, 31 Oct 2022 16:14:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.433022.685832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opWU6-0008HJ-Ae; Mon, 31 Oct 2022 15:13:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 433022.685832; Mon, 31 Oct 2022 15:13:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opWU6-0008Dt-6w; Mon, 31 Oct 2022 15:13:54 +0000
Received: by outflank-mailman (input) for mailman id 433022;
 Mon, 31 Oct 2022 15:13:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7CAU=3A=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1opWU4-0008Dn-He
 for xen-devel@lists.xenproject.org; Mon, 31 Oct 2022 15:13:52 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12hn2245.outbound.protection.outlook.com [52.100.166.245])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f72c823-592e-11ed-8fd0-01056ac49cbb;
 Mon, 31 Oct 2022 16:13:50 +0100 (CET)
Received: from MW4PR03CA0342.namprd03.prod.outlook.com (2603:10b6:303:dc::17)
 by DM4PR12MB5964.namprd12.prod.outlook.com (2603:10b6:8:6b::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.16; Mon, 31 Oct 2022 15:13:47 +0000
Received: from CO1NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dc:cafe::3d) by MW4PR03CA0342.outlook.office365.com
 (2603:10b6:303:dc::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19 via Frontend
 Transport; Mon, 31 Oct 2022 15:13:47 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT013.mail.protection.outlook.com (10.13.174.227) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5769.14 via Frontend Transport; Mon, 31 Oct 2022 15:13:47 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 31 Oct
 2022 10:13:46 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 31 Oct
 2022 08:13:46 -0700
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Mon, 31 Oct 2022 10:13:45 -0500
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
X-Inumbo-ID: 9f72c823-592e-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XOOC0zQskzP+Ro12bE7Atp+6UGJka+q8cTC04V1dip8H2oZOXvFclCLSg4emii3h2MqD9Z9P9eLv27HkHHJXMmFE+kxKy9HDwDCuta6efiJyAA8cixZhN5to3FqjgoUHhizYnVvgk7oqTIZvKIbLzYRZSDpI9zCIep8KUMGDZjyOHEBxUk4uH8ebazzrpoq1kA/4bq3RRIv+QK0mANBS7u3ot/G6+YsK+H9gL90dgWxUbb8HcJoPj1pCKRMI116ktkHHB5Zw6jgSHm9kH4eL1aunHbYWjMDpyeEnoLZUdszHxYqI2A7aNlvmoAMelFmsQrykt8xPBHJyJA+PGySvUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nRSHJ6wAhxWVOSKl64SdUWUT5qqgNhl3sYkMCP37X5E=;
 b=iwnzlL2ggTGdcA8LDYqEYE0Sp6JPaFjd3QYHEfts/6O3mIiZslrqYbixRuXicB/G4mN+Un2/95FXZbSdl6xOGYaKWgIrs6chR+KyqEozo0Rjy7VrVy4Ug0vkWc4oZhoU8p4GWSyL8D3EOgZYCxRaQioqI11Gsr0bFjdQtuOfGjaZzqJ0Wd25nTunzRWorL0b5fs/rl2wh/8Ja1cGIPfEHMUdlOnoIKFqBOQjyLekH11+7BvanlL3ArsUHYwCtOekoU7ubOj9XXsAf2V17zF1HNvn5+zLxrP/KE3lB+Okf6ICtQzKnl7c6F9K4OKEZRz6CKH0Hte4nXt3425hHKzGsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nRSHJ6wAhxWVOSKl64SdUWUT5qqgNhl3sYkMCP37X5E=;
 b=pUor9/fdNorDvNHvPsfHX/7SoSSytWq9hyfzx00jRCoUAE6JExQpgNqWdBBUNwFb7SZfS7oYLpdqryiakIUUpnTST22aeZy+uTmZCnwqX7/7GKwwEgXgSaLDdJRY4MqQsL9SqtlM8OedJmIAp3B2ujCIJMiYOWdKqztDHyBOrfw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayankuma@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<burzalodowa@gmail.com>, Ayan Kumar Halder <ayankuma@amd.com>
Subject: [XEN v2 00/12] Arm: Enable GICv3 for AArch32 (v8R)
Date: Mon, 31 Oct 2022 15:13:14 +0000
Message-ID: <20221031151326.22634-1-ayankuma@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT013:EE_|DM4PR12MB5964:EE_
X-MS-Office365-Filtering-Correlation-Id: e78dc95d-ad04-436c-38c5-08dabb52825f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6yz0vOqDq+kKopEOAU7ZV2KULxnX7D3ludZhoq39TMBYG2jTdfE/NbTCw1fQ?=
 =?us-ascii?Q?UAHtf4vSNyVJBOc/4Vi20w/hxE74oBQ/iyukG00PDHKtvgmQCjhTydNaoEMq?=
 =?us-ascii?Q?FGXOl1LRp/vpft30xwbINZ3fnqIdZiZnDx607ru2MQVo0kKWGPOEmTi7NOEN?=
 =?us-ascii?Q?Kt+fxIMMM61nQB4P53FnEQmMbXzVtWqiiGG5WUP1ctK3Wl39TNXZuAL3KDF6?=
 =?us-ascii?Q?MURLFo/QCuwSHNJP1/sBvqpROHk9ybQg7AIA2cR3UEX1yM5qEXYZq/bK6neN?=
 =?us-ascii?Q?CO4eTEVe+7XGjroGIaCjk8o0YpT+CDLJsdXYiw3sgkkzC1UyM/fC/Puf29+S?=
 =?us-ascii?Q?JyUxQLujm5lI8GNEiMxA6DnWvOagi2oRG7zlCFrsm0y/64AGGz2FlXt3JYCH?=
 =?us-ascii?Q?VpLBeE8Pg49DicnrgcxO8/DMVvxm/XQqNOEgJLr26hF6ITb10pu75XlMZ7OI?=
 =?us-ascii?Q?FV76+8Ocumb76taOBzyBjX2pqWzg7t9ktIuHuZdJx0z55LSiM0trDRC8ifXh?=
 =?us-ascii?Q?hg/p69xTuv2nx5It9O0ZzfBR+J9RNxo246/6q2vI7cHLU9vYb+Pjypli7K18?=
 =?us-ascii?Q?lRZshWXlXOxQqotd/rmmtfmV7JG89Qz0bIq167uV9/H5KwNm14LY/QrZkzlc?=
 =?us-ascii?Q?3oPR2ITvOeKrFxaY26g2I+1ad18/aYF9rj3h8WHtq8qxies28mhaAUA/PMi3?=
 =?us-ascii?Q?A2J/6ibaFVrGyW7NvXw/gmT10Mjyxjloxith0Ne46U0OtJQMmraOfELf+fRC?=
 =?us-ascii?Q?uhGL8uuIYX9TPozlRDS/A7c00zzGTnHtT9vjNEnXx4zZL0+p5lw/yXFk8u4j?=
 =?us-ascii?Q?WP9HmGMgYtd2VkpfT6RNXMK2AOgOfIxwPZ0COjWyTQDUefKdnZFY25H8dbK6?=
 =?us-ascii?Q?xUmRKsKpqtrnxcqEQm7iT09wQLn69Wb74i1G/+AKzJPsbrwZ4g8taHFwHa7J?=
 =?us-ascii?Q?RK7kaMyYB9t+Oxi18N701WcCFI8qfrj0ZjEcl9+w51ZGUEGbg8DlNErMpwqD?=
 =?us-ascii?Q?8+M2IGC3bGbzrdiAp4pfABFR7J6BUOaTajesSCdLtGZ++L7joym/VRTDxlpa?=
 =?us-ascii?Q?IVpfceSwwAk+nQ9bhL1NII/j2d+wgaqfHBy6cFOnPyA+ohb9333QDQLO7zhk?=
 =?us-ascii?Q?fXveUUg2tqf2C9kDQ57CWWOpoEV/9ZVJ/bTIt2yqz7xwdTHsLR4eJXmP22Cj?=
 =?us-ascii?Q?BBItK8I5hzdwQ0BMVNezw/e4AtgVKpSWY43BGuzpXlJR+zvq+GZDlZSk6JU?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:5;SRV:;IPV:CAL;SFV:SPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:OSPM;SFS:(13230022)(4636009)(39860400002)(396003)(346002)(136003)(376002)(451199015)(40470700004)(46966006)(36840700001)(2906002)(5660300002)(8936002)(41300700001)(4326008)(8676002)(70586007)(70206006)(478600001)(82740400003)(356005)(81166007)(40460700003)(186003)(6666004)(26005)(336012)(36756003)(1076003)(2616005)(6916009)(82310400005)(36860700001)(40480700001)(54906003)(316002)(83380400001)(426003)(47076005)(36900700001)(11215385002);DIR:OUT;SFP:1501;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 15:13:47.3931
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e78dc95d-ad04-436c-38c5-08dabb52825f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5964

Hi All,

Please find the following patches to enable GICv3 for AArch32.
This is a pre-requisite to support Xen on Cortex-R52 (AArch32-v8R system)

Let me know your thoughts.

Changes from v1 :-
1. Updated in the changelog for each of the patches.

Ayan Kumar Halder (12):
  xen/Arm: vGICv3: Sysreg emulation is applicable for Aarch64 only
  xen/Arm: GICv3: Move the macros to compute the affnity level to
    arm64/arm32
  xen/Arm: vreg: Support vreg_reg64_* helpers on Aarch32
  xen/Arm: vGICv3: Adapt emulation of GICR_TYPER for AArch32
  xen/Arm: GICv3: Fix GICR_{PENDBASER, PROPBASER} emulation on 32-bit
    host
  xen/Arm: vGICv3: Fix emulation of ICC_SGI1R on AArch32
  xen/Arm: GICv3: Define ICH_LR<n>_EL2 on AArch32
  xen/Arm: GICv3: Define ICH_AP0R<n> and ICH_AP1R<n> for AArch32
  xen/Arm: GICv3: Define GIC registers for AArch32
  xen/Arm: GICv3: Use ULL instead of UL for 64bits
  xen/Arm: GICv3: Define macros to read/write 64 bit
  xen/Arm: GICv3: Enable GICv3 for AArch32

 SUPPORT.md                                 |   6 +
 xen/arch/arm/Kconfig                       |   4 +-
 xen/arch/arm/gic-v3-lpi.c                  |   8 +-
 xen/arch/arm/gic-v3.c                      | 132 ++++++++++-----------
 xen/arch/arm/include/asm/arm32/io.h        |  21 ++++
 xen/arch/arm/include/asm/arm32/processor.h |   5 +
 xen/arch/arm/include/asm/arm32/sysregs.h   |  18 ++-
 xen/arch/arm/include/asm/arm64/processor.h |   8 ++
 xen/arch/arm/include/asm/arm64/sysregs.h   |   3 +
 xen/arch/arm/include/asm/cpregs.h          |  69 +++++++++++
 xen/arch/arm/include/asm/cpufeature.h      |   1 +
 xen/arch/arm/include/asm/gic_v3_defs.h     |  24 ++--
 xen/arch/arm/include/asm/gic_v3_its.h      |   2 +-
 xen/arch/arm/include/asm/processor.h       |   6 -
 xen/arch/arm/include/asm/vreg.h            |  88 ++++----------
 xen/arch/arm/vgic-v3-its.c                 |  17 +--
 xen/arch/arm/vgic-v3.c                     |  16 ++-
 17 files changed, 255 insertions(+), 173 deletions(-)

-- 
2.17.1


