Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA1B64295D
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 14:27:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453611.711181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2BUg-0003wj-Lq; Mon, 05 Dec 2022 13:26:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453611.711181; Mon, 05 Dec 2022 13:26:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2BUg-0003u2-J0; Mon, 05 Dec 2022 13:26:50 +0000
Received: by outflank-mailman (input) for mailman id 453611;
 Mon, 05 Dec 2022 13:26:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NO0Y=4D=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p2BUe-0003tw-Hc
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 13:26:48 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10hn20326.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::326])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7693d5dc-74a0-11ed-91b6-6bf2151ebd3b;
 Mon, 05 Dec 2022 14:26:46 +0100 (CET)
Received: from DS7PR03CA0117.namprd03.prod.outlook.com (2603:10b6:5:3b7::32)
 by PH0PR12MB7906.namprd12.prod.outlook.com (2603:10b6:510:26c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Mon, 5 Dec
 2022 13:26:42 +0000
Received: from DS1PEPF0000E642.namprd02.prod.outlook.com
 (2603:10b6:5:3b7:cafe::f7) by DS7PR03CA0117.outlook.office365.com
 (2603:10b6:5:3b7::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Mon, 5 Dec 2022 13:26:42 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E642.mail.protection.outlook.com (10.167.17.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.8 via Frontend Transport; Mon, 5 Dec 2022 13:26:42 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Dec
 2022 07:26:42 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Dec
 2022 07:26:41 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 5 Dec 2022 07:26:40 -0600
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
X-Inumbo-ID: 7693d5dc-74a0-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y96XMnn7ltM+Z+Akqjf9c4QaxwlQB8tcpAdkZprcRm5Dw/NFiFQS/R7PsoPkh1N6/OsGy/je4g9wxGtptgD782j8ZEQRsy1T7dwl4m4ZEhWmSeHBK9NQbrjvkoLhhN7Lr1nJrRm6lGeoXxa4YVdBjrLEDWV1Q4jdcM0f0jKLEAka05m3ughXMgRSMibkcc0hWbuJT1PnU04RkoVFICfDz1lI8v4JhdLu6GXaGi2g5ApiQOh6iCLSWlw4qKb70DG/we10AZui5Teh8SbMZviUT1q25bp29lLRoi90x5VwTtWWCXO5nKGqowOzKYrUfRDT73dVRpyxCt60EWQ3Bbp42g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PhPSfwq5pijTetFRbm1/3eIFbBgwMsfdHbodKr0RTK8=;
 b=T1IaY0EdM7onD/zwoODdiJJOzsSwgJjoLR5OtmNNQQZmuxqL9QHMFpfqCr6VtGhmB5bgESq9mfyzcg4DTrN8/HT5XP1BnUcOqmstlSCz5QfCe+aWlDelQK/o+0/5RVJSPxOaaKdfIpMTc7Cw+NZtBTxvAyvfpRCTASpSPRHhvMEsF/cjqS2Gz+H+kfNrGoLA+/QVkO1k77/98+n7/srHJUjuFShb/c7gWuKsNOp/DN07c+BTCtxeDrSXS2BTtZ9eOSodCu6FFhx+2j6csECoi/GxmAdw5luprTgAblFLivUI2gPnFqktYHShJKtXbFemjE+KBAQDUuzMWHOAn35d5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PhPSfwq5pijTetFRbm1/3eIFbBgwMsfdHbodKr0RTK8=;
 b=ceuh+Zwchy/qn6Hr4pAiOZHTqwNXOrBbbeJ5wPfE2UQlPKKci48eGNX6fZELeqkuhaiSWGQNrsogLB2+lTu6JE5HjrAeABCiY6hM8gm0CFfi1OlwAk++2X09XLs+Cuulfc6PpZXsGC9C3mrLFS2FzdfXFZI9F3NF/SvwWKluhes=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <jgrall@amazon.com>, <burzalodowa@gmail.com>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>
Subject: [XEN v5 00/11] Arm: Enable GICv3 for AArch32
Date: Mon, 5 Dec 2022 13:26:26 +0000
Message-ID: <20221205132637.26775-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E642:EE_|PH0PR12MB7906:EE_
X-MS-Office365-Filtering-Correlation-Id: de8f28c1-2061-4020-8365-08dad6c45933
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nznLbOAd5mVbYXdx6tvHFg1HWcmLA5Z3EWewTQehZNA+inLLlMHcuAkk7iJC?=
 =?us-ascii?Q?b32nC78ReurADg3CmgdHOlOa0T6PM9Jj8S2Xb8zovDxTGLyWSMNYRsCE+DY+?=
 =?us-ascii?Q?UYb2XGWphU1c65H/WdOdBW0gbxcA2KMD2e+9UTgPDu+3PnoETRPWSbvJnlLS?=
 =?us-ascii?Q?ZMa2vXiYwvoZI2k+YOiTkWc7mgDxqHq/Xx5KEOPlPDkENcRU/55q3bkfP1Rc?=
 =?us-ascii?Q?6NjyewYgxr8SJJg23/D24r36HXxCJW9m6MQQW0e22l6AJ8Zw7xaViDnkishL?=
 =?us-ascii?Q?Ww1ckTSkiG6fNop1uBx1c+Y/+GYXQGGBsxHfCpHb8HYFb6X+HFPXcRzl4m/V?=
 =?us-ascii?Q?T2HV6YotjVS8FC1ynKn+mF2Dr0lBk789EJPxTKsgan8ZVrIlTpZXyWBytRhe?=
 =?us-ascii?Q?ToXY665t3W0xZ+FdKl6nElhRNhEg6QTa9AEt7gAzkGcD4I39Vohl5K41Ph6M?=
 =?us-ascii?Q?yK/LGBobbHdTrgAYs2NeTjhgO/EB8+OGffbDYJciOALQdRMpCx8sz6TVLiw4?=
 =?us-ascii?Q?ZTa0wFJggp+AZLpkHKSAKS51iP1IJE+iaq5UHvbKgnMZl0JmQEViWU79u4wR?=
 =?us-ascii?Q?JCnZoyrTVjOM/Ld92irERpTEk7pxLJv3i7MPF6HRXn4d4g+H0/gj71eL61Nq?=
 =?us-ascii?Q?YLQGhTZKrb7lb0rjmjsKSyHyEiKPB+5pkHBRfl9cuqVQe+2w8ONAzojjrDeD?=
 =?us-ascii?Q?YyZCqVhRGpNw81ylEmaOq+JkkFs3fVXODLy9pg/IunSAHLmv+sSQmF+arouY?=
 =?us-ascii?Q?NovYfuFndyLItb6IENLZI+XfOv3SGiSGy0ovn6bVr3La4M3odkG2lHTKJ341?=
 =?us-ascii?Q?tQamd6zsPd8F2/jFycni1lA8QGm6BjXBqx9Sr1IkCYhXgxkglUpmQjtNYXqi?=
 =?us-ascii?Q?6oD0jeZGLurS7+jVe12YI4MRH6KLOPxy3hQcFL9B4yqMg5ZfOOPZlpq5tkFQ?=
 =?us-ascii?Q?+MCHz8xfTvGH/SATbLWvgN82uvLt0rjjogPrmEj5qA4pItLqJahvmurwSY8j?=
 =?us-ascii?Q?ABxD2NjmMRKR2A6JBggHUST77FSsnedejrhbPvrUFExvD0ytycwbaTP/ArFP?=
 =?us-ascii?Q?36ZWfibQ+XDLLYIibmVCeXlNQ33zvBswbqn73LZUao/iZxv3F1FKl4qV3ofi?=
 =?us-ascii?Q?/I2B/okkbDGWxWfQkbPwaWl+x5Y279lUKg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:5;SRV:;IPV:CAL;SFV:SPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:OSPM;SFS:(13230022)(4636009)(346002)(396003)(136003)(39860400002)(376002)(451199015)(36840700001)(46966006)(40470700004)(83380400001)(36860700001)(103116003)(86362001)(81166007)(356005)(82740400003)(2906002)(70586007)(8936002)(41300700001)(70206006)(4326008)(8676002)(5660300002)(82310400005)(40480700001)(26005)(336012)(186003)(6666004)(426003)(47076005)(1076003)(6916009)(2616005)(54906003)(316002)(40460700003)(478600001)(36756003)(36900700001)(11215385002);DIR:OUT;SFP:1501;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 13:26:42.4203
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de8f28c1-2061-4020-8365-08dad6c45933
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E642.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7906

Hi All,

Please find the following patches to enable GICv3 for AArch32.
This is a pre-requisite to support Xen on Cortex-R52 (AArch32-v8R system)

Let me know your thoughts.


Changes from -

v1 :-
1. Updated in the changelog for each of the patches.

v2 :-
1. Dropped "xen/Arm: GICv3: Move the macros to compute the affnity level to
arm64/arm32". The reason being aff3 does not exist on arm32. And aff0..2 is
the same between arm32, AArch32 and AArch64.

2. Introduce a new patch "xen/Arm: GICv3: Adapt access to VMPIDR register for
AArch32".

3. For the new registers introduced, we have defined the arm32 name and then
an alias.

4. Use 'AArch32' across all the patches.

5. Dropped the 'R-b' and 'Ack' in "[XEN v3 08/12] xen/Arm: GICv3: Define
ICH_AP0R<n> and ICH_AP1R<n> for AArch32".

v3 :-
1. "xen/Arm: GICv3: Use ULL instead of UL for 64bits" has been dropped.
The change has been merged with "xen/Arm: GICv3: Define ICH_LR<n>_EL2 on AArch32".

2. I have marked the patches which have been Rb + Ack vs Rb only.

3. Dropped Rb from "xen/Arm: GICv3: Enable GICv3 for AArch32"

v4 :-
1. The first six patches have been reviewed and acked.
2. Dropped "Rb michal.orzel@amd.com" from patches 7/11, 8/11.
5. Kept "Rb michal.orzel@amd.com" on patch 11/11 as the change seemed trivial.

Ayan Kumar Halder (11):

These patches have been reviewed and acked, so the reviewer may choose to ignore :-
  xen/Arm: vGICv3: Sysreg emulation is applicable for AArch64 only
  xen/Arm: GICv3: Do not calculate affinity level 3 for AArch32
  xen/Arm: vreg: Support vreg_reg64_* helpers on AArch32
  xen/Arm: vGICv3: Adapt emulation of GICR_TYPER for AArch32
  xen/Arm: GICv3: Fix GICR_{PENDBASER, PROPBASER} emulation on 32-bit
    host
  xen/Arm: vGICv3: Fix emulation of ICC_SGI1R on AArch32

These patches are yet to be reviewed and acked :-
  xen/Arm: GICv3: Define ICH_LR<n>_EL2 on AArch32
  xen/Arm: GICv3: Define ICH_AP0R<n> and ICH_AP1R<n> for AArch32
  xen/Arm: GICv3: Define macros to read/write 64 bit

These patches are yet to be acked :-
  xen/Arm: GICv3: Define remaining GIC registers for AArch32
  xen/Arm: GICv3: Enable GICv3 for AArch32

 SUPPORT.md                               |   7 ++
 xen/arch/arm/Kconfig                     |   9 +-
 xen/arch/arm/gic-v3.c                    | 153 ++++++++++++-----------
 xen/arch/arm/include/asm/arm32/io.h      |  20 +++
 xen/arch/arm/include/asm/arm32/sysregs.h |  19 +++
 xen/arch/arm/include/asm/arm64/io.h      |   2 +
 xen/arch/arm/include/asm/arm64/sysregs.h |   5 +
 xen/arch/arm/include/asm/cpregs.h        | 134 ++++++++++++++++++++
 xen/arch/arm/include/asm/cpufeature.h    |   1 +
 xen/arch/arm/include/asm/gic_v3_defs.h   |  24 ++--
 xen/arch/arm/include/asm/vreg.h          |  86 +++----------
 xen/arch/arm/vgic-v3.c                   |  22 +++-
 12 files changed, 322 insertions(+), 160 deletions(-)

-- 
2.17.1


