Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E65A2625CC6
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 15:18:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442565.696841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otUqv-0006ku-3B; Fri, 11 Nov 2022 14:17:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442565.696841; Fri, 11 Nov 2022 14:17:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otUqu-0006iU-VP; Fri, 11 Nov 2022 14:17:52 +0000
Received: by outflank-mailman (input) for mailman id 442565;
 Fri, 11 Nov 2022 14:17:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LUri=3L=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1otUqu-0006iO-7A
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 14:17:52 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11hn2243.outbound.protection.outlook.com [52.100.172.243])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f28a3dc-61cb-11ed-8fd2-01056ac49cbb;
 Fri, 11 Nov 2022 15:17:50 +0100 (CET)
Received: from DS7PR03CA0352.namprd03.prod.outlook.com (2603:10b6:8:55::32) by
 DM6PR12MB4060.namprd12.prod.outlook.com (2603:10b6:5:216::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.13; Fri, 11 Nov 2022 14:17:47 +0000
Received: from DM6NAM11FT105.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:55:cafe::dd) by DS7PR03CA0352.outlook.office365.com
 (2603:10b6:8:55::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25 via Frontend
 Transport; Fri, 11 Nov 2022 14:17:47 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT105.mail.protection.outlook.com (10.13.173.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5813.12 via Frontend Transport; Fri, 11 Nov 2022 14:17:46 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 11 Nov
 2022 08:17:46 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 11 Nov
 2022 08:17:46 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Fri, 11 Nov 2022 08:17:44 -0600
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
X-Inumbo-ID: 9f28a3dc-61cb-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gR2ZhK/uVLMuLFTFO/fxtJoeMjqOwRmuhkrFXvSztwysbXjpzvQHT+KHswvti0Kk9UKx/WLWjlmx4aqr4GS5lgpJ2gZY91aGpwzRsojxn1/lgKeM0Qhw6xlM50i1nPJOUx0IUUWp3sXbZrEM8U4SBoOyIlnqbEFO2JwUppG6YpMBx5sDDvqtstbFo3WC09gslPjtv/e7B8QH2XZhGNOq5m8A5TXlj9V86z1wft6Pf4ZI/av1t0RuQ3dAeomBudsfwWQK1G+tiJns1+B7TgAq3zyRR9KlTRfVNqqOIthgYU1sxyzsAOHA9mgKFQ5y/GCAl657v4zTxk3KfRfAd5/1vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aim/bCE7/5lpbsSDqhk+xfMHlx/OJpQ0bTD2473DUf4=;
 b=NGPr1AF6aDROaRdEsiS7YBQ5YzBv6wiOdWVQocUP2ru4A2gKako57DLDIoQ5ewu+0fA9o8dum7Ytij1rngRRLytY299sGmWFevAGiZo7QxvTDdzVyBK5FCnftnwZMMasBtRAyGEQln/mZzNfqxNqAA+M57qvnfAVYDpYpsmeSLQ+HYNzisMoQSQrYwTkh4xmufBAQF5avK0Za/1TDg/wEdKfidvEg/o2A3CFtgZMM+66XPshhhFtQz9OCxdk31o12xvAWTb/ZrhD1stYz0uaVEmzXGeJM0hPGxv3RLQq1PhFXXl12aEAlAhWeacX4v8C9hToDfEANK5U4v5qC1/WLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aim/bCE7/5lpbsSDqhk+xfMHlx/OJpQ0bTD2473DUf4=;
 b=N/cRNXsQZYQPc5joez3vmCH8wk8+VuJviv3WO2bLXiYCDDumyDXzddK8h1wDH0JVLBzaBEtqOWE0q5gXSI38HgMJdbnjDlnE95mKR4X+Pi4Z+RRlfdpRk3oyd5ZcxwCH3ZAxjPFcTxkmrGe2w0XJs//fs+K8VFD8LCwZXrz5/EA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <jgrall@amazon.com>, <burzalodowa@gmail.com>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>
Subject: [XEN v3 00/12] Arm: Enable GICv3 for AArch32
Date: Fri, 11 Nov 2022 14:17:27 +0000
Message-ID: <20221111141739.2872-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT105:EE_|DM6PR12MB4060:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c8fdc8a-f5b3-4605-deeb-08dac3ef81d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BrO9EfVrG4q9RhJU+JHXIn6pUjHtUfaKzn/WMAecKulffcsEb9aQ7nmY+TZ7?=
 =?us-ascii?Q?sIPAKeKTtOzbKmAhoFU2k0VS4fsJX51E0wVifc6sp5QUPpKxUUrnC0jVLSRA?=
 =?us-ascii?Q?0E+9SjZcZO/6io1vEg2cTzo9MQalQ3r5+Llo4zypAPj7uf73qhisMyAT+g2A?=
 =?us-ascii?Q?0gljOJnB0j0ovsDFwoyOGIW4O4ZmqTRQ+ccT93t2ObTWNyHW9FYkIFCetbul?=
 =?us-ascii?Q?u5ZsBDDyP+YzFlKqWwAXo+B3/YPVOJfHuWi3aKnDWRiyAo4IzQMQHXL4ai9U?=
 =?us-ascii?Q?nPCRd6djQINfEAhsQQ/lxjII/aBxVT2xACidQT0KfDkF+wK7nu4qOyBZOKJS?=
 =?us-ascii?Q?z3gGh32ItLr6p+bXUwIU8PjrZOyDa7166j6K6kIXQWE1ZWj5ukbuF/7Jqohb?=
 =?us-ascii?Q?PQPT9hYa9qIWklglmcwdfN38lrCOLDSqUu63QJuy0Wz/BjRYnhb6Y96UTGlE?=
 =?us-ascii?Q?zApvdjujSCAgfVNz1gBhGnmIzKpVKYHCZh5aCJHFjiv/1HwGPjNpaCXUY8XT?=
 =?us-ascii?Q?8+hps9e7/NhWv4xE1+Dji/ydIxj2uzNo7xc+Z79TCe6NiBmvu1GSr7cI/31/?=
 =?us-ascii?Q?PEfLtN7MvfiZyP+ZCmOzFVFirRxpqSRA0BrqQL092YFpAY5IHIGCDf1iDhKK?=
 =?us-ascii?Q?1MfFERH0SxQ3ocNJOBRWenJA0r7Ec9VOKBGLQIVtamlxzJILx2TkWqfny3W/?=
 =?us-ascii?Q?39um9y+tjYBHTsF3YBFoneCAy9vTD4QnIUzXGpeJWEQm5T9O+ZPgXclW+U9z?=
 =?us-ascii?Q?r1aC6Fp1XvEVfBz6npDtWej7wEBf9SLsuAUX+MhGyULXrrssb4xQpFqOUDO5?=
 =?us-ascii?Q?/606iVZ3tMNMz5aIiz4RHsXQurJNjBa5EOAWkSSUj35FX2agUP5Jilotu/Jf?=
 =?us-ascii?Q?tCeHcTwk8FZGiDuRLP8GxYH1hc2mfcyeEfqsnUNiry5D1DuOsBKEnO+ulFUH?=
 =?us-ascii?Q?TVBC5kdCc21mf8Y0XpbW6aBMHwNxlBDaXhVXrjYb+yhEPpXiY87oqdrcEXq6?=
 =?us-ascii?Q?ZKQeSzQT0cI30yLyh34GLYDjjawRIj03qk6OTDMzlU5suxKYm7HpSHGsbm1t?=
 =?us-ascii?Q?coKKqSPs7Rdq6BO8HFYZqJ2/06RRb+RCFAHrIpl2b59X+KQcLwU0bVV3i7hU?=
 =?us-ascii?Q?8EzGP0ohnBa80b6pflC+n199CKUa4py/FWYc9FdxUUd5NwizSUlWTPh8mS8i?=
 =?us-ascii?Q?wZ7A2C1sW4av6jRft+TrqoykSaNmJ2L6sANwZlg6WHhNXAAaOfA1mXQjlUY?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:5;SRV:;IPV:CAL;SFV:SPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:OSPM;SFS:(13230022)(4636009)(39860400002)(396003)(136003)(376002)(346002)(451199015)(36840700001)(46966006)(40470700004)(36756003)(26005)(82310400005)(356005)(82740400003)(81166007)(36860700001)(5660300002)(426003)(47076005)(2906002)(1076003)(186003)(40460700003)(2616005)(83380400001)(86362001)(41300700001)(8936002)(6666004)(8676002)(70206006)(70586007)(4326008)(478600001)(336012)(103116003)(54906003)(6916009)(316002)(40480700001)(36900700001)(11215385002);DIR:OUT;SFP:1501;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 14:17:46.8180
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c8fdc8a-f5b3-4605-deeb-08dac3ef81d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT105.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4060

Hi All,

Please find the following patches to enable GICv3 for AArch32.
This is a pre-requisite to support Xen on Cortex-R52 (AArch32-v8R system)

Let me know your thoughts.

The following patches have been reviewed and acked and contain no changes
from v2 :-
1. [XEN v3 05/12] xen/Arm: GICv3: Fix GICR_{PENDBASER, PROPBASER} emulation on 32-bit host
2. [XEN v3 06/12] xen/Arm: vGICv3: Fix emulation of ICC_SGI1R on AArch32

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


Ayan Kumar Halder (12):
  xen/Arm: vGICv3: Sysreg emulation is applicable for AArch64 only
  xen/Arm: GICv3: Adapt access to VMPIDR register for AArch32
  xen/Arm: vreg: Support vreg_reg64_* helpers on AArch32
  xen/Arm: vGICv3: Adapt emulation of GICR_TYPER for AArch32
  xen/Arm: GICv3: Fix GICR_{PENDBASER, PROPBASER} emulation on 32-bit
    host
  xen/Arm: vGICv3: Fix emulation of ICC_SGI1R on AArch32
  xen/Arm: GICv3: Define ICH_LR<n>_EL2 on AArch32
  xen/Arm: GICv3: Define ICH_AP0R<n> and ICH_AP1R<n> for AArch32
  xen/Arm: GICv3: Define remaining GIC registers for AArch32
  xen/Arm: GICv3: Use ULL instead of UL for 64bits
  xen/Arm: GICv3: Define macros to read/write 64 bit
  xen/Arm: GICv3: Enable GICv3 for AArch32

 SUPPORT.md                               |   7 +
 xen/arch/arm/Kconfig                     |   5 +-
 xen/arch/arm/gic-v3.c                    | 159 +++++++++++++----------
 xen/arch/arm/include/asm/arm32/io.h      |   9 ++
 xen/arch/arm/include/asm/arm32/sysregs.h |  19 +++
 xen/arch/arm/include/asm/arm64/sysregs.h |   4 +
 xen/arch/arm/include/asm/cpregs.h        | 135 +++++++++++++++++++
 xen/arch/arm/include/asm/cpufeature.h    |   1 +
 xen/arch/arm/include/asm/gic_v3_defs.h   |  24 ++--
 xen/arch/arm/include/asm/vreg.h          |  86 +++---------
 xen/arch/arm/vgic-v3.c                   |  18 ++-
 11 files changed, 312 insertions(+), 155 deletions(-)

-- 
2.17.1


