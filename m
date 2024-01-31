Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 909D1843F33
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 13:11:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673989.1048619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV9Qq-0006X3-Mw; Wed, 31 Jan 2024 12:11:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673989.1048619; Wed, 31 Jan 2024 12:11:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV9Qq-0006Uz-K3; Wed, 31 Jan 2024 12:11:08 +0000
Received: by outflank-mailman (input) for mailman id 673989;
 Wed, 31 Jan 2024 12:11:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HwTD=JJ=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1rV9Qo-0006Ur-Td
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 12:11:06 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:200a::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cca31343-c031-11ee-98f5-efadbce2ee36;
 Wed, 31 Jan 2024 13:11:02 +0100 (CET)
Received: from PA7P264CA0466.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:398::13)
 by IA0PR12MB7749.namprd12.prod.outlook.com (2603:10b6:208:432::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Wed, 31 Jan
 2024 12:10:58 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10a6:102:398:cafe::96) by PA7P264CA0466.outlook.office365.com
 (2603:10a6:102:398::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23 via Frontend
 Transport; Wed, 31 Jan 2024 12:10:57 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Wed, 31 Jan 2024 12:10:56 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 31 Jan
 2024 06:10:55 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 31 Jan
 2024 06:10:55 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via
 Frontend Transport; Wed, 31 Jan 2024 06:10:53 -0600
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
X-Inumbo-ID: cca31343-c031-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fI7tUB19kHaHENmh7TRH9P/sf+ZPQ6rUkg0JHNryAb/gJV2R7eGGitkCtySV+3ZF6XbeVzbMr9L/S1OxZkMDXfsa4WWbk+e719q4Cn66xSQxnf2Po4I+91L2sWX2ZZp/EYaJNteaJInohL8Vr9rTlIfq3H5cQyiS7eCWnoKixIGQ8Fkp1u6oDL5SE0xB09b0Pta3UXXovMrzApLxP6p+OSp80SybsTCgWksYS1P0IY7ARTrJ+Ddu9VwtY+8jYEoHE5hEGCfJzLTuLu60Zyg7awsdC+sxDuYHrdDpaPXurMaWp/6dzI3s7dvlLvAIYylDBIacPB02pOejhaRZGk4fbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h4IU52043n4hrCs2lfQJAorch0baE4ObCW9937YyEiI=;
 b=DugiQ1+wUDt2+ZyVvPiENDEJmML2Pmh7FgIy5ErxMzrkAF5tZ+m5MBy8DREWsX56qmdJFSdQDdjDJ6dlSTe+Ykf4MQ8ZqqrWyjoPNbuUjFHDqpo3X47gsUuJprwnsCygheRqR4mio5BZwrgQBH5OANTxEpLE/646b1qbZXuqljxoX9v1agJPnLuL+oX27pgOMR3B9Mga00BRpNi0wexaGWc3hqiIDBFAv7ZMWvNMcirTi2pmwj1ZjwYRq04q0jJgJ8wYdbxm5I0NB9FDe1dgbx4TT1vOaQp943KqopDl1G08MjhW1wFgQfOP1+1acKzo5rvcshS8ZO+6C6VZA8xyug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h4IU52043n4hrCs2lfQJAorch0baE4ObCW9937YyEiI=;
 b=ropRc4cXCk/M0nZ3XyhQ/PUqXU6xs7+FA2icr7ldV9nVMF8bgZuTwbJQxF4/KRAq6P6adRDe/giNkPR73rJa5zkhftaQSyU/IdAuF/dGVEUcX/Ld8pHSSqkNOvKU1rhZL9J0RVm/n5hge5Tl73nQb5VmCAdujfXuTdtbh+JOTjM=
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
	<michal.orzel@amd.com>, <luca.fancellu@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v4 0/3] xen/arm: Add emulation of Debug Data Transfer Registers
Date: Wed, 31 Jan 2024 12:10:46 +0000
Message-ID: <20240131121049.225044-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|IA0PR12MB7749:EE_
X-MS-Office365-Filtering-Correlation-Id: 97cf3d9e-7f5f-406c-0461-08dc2255ae15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Elb4cqEU/EmmkEylBPEQ6N0j/HjRpjolBybsTTgxZBjKnFJ72eO8BOl+FOdDHZxlmxaZ7hMMZPKdn86dJfeY40JyL2xLvyxuvEoYFbuodFHDTvT72nHrVmI3/Rr7FkJWL4tPzk7DQIUJWHsOUc7MvREVMu+47Km44whr413wWFln287UX7ofoBfvzg37g9NtTrNa/U2tvXtMB4Eyq6BTBsZmGjCqvPR6ItkOXdbfzDhq4ck7kVx7wy3bxxkrr52dDLA2lRwBFGo05SIoVjWLI2TDj9USGLB6ytxzXxMYhwpg270RwFOAHu3ilC5d00bWQUScN/1wXubWePY+aRUe6m6tEeD//TblYPkcR6wckGRoHHd9/QGXeMGi5lvZGqVfhioAB/B5Xc9pGcgKcpjORVWYT5tKYp920iIK1xtIdOQYADocIqObsetxllGUKTRjwM+TVmIeQacvI34xLmSSiYUlbopQ4OoK/Dji5yhCAJHCNyUDdRr2P18g2ko2I8pYN7zsBlpW8nAqSIrP0JA6MXfefgn5KOJkAlfXy4xIm4jXea+Bi2UpRB2OlG6haDpjINtYLgNJV29vKJRlMUSvmxS2YnGw5Tj1nb6EV4gsmMYWpBdvlbyqm1SIS/vI+2WdZ8t3n9ORewMS6ZDRWbg8KOwUNqSvdDX3uIZslT5JVEtmozNm5PV3v+0y5xKP4hYyJ40Pq+jbdDizFyIky1o/pBh1zFuvfqzNNhuo8VFHxO+OEXPIZJ3G+/qmBf/b0JDKSvjBx49JBdH7Vn0VfSN6Y+nbBpjR+2qw237WBGyucT8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(39860400002)(396003)(376002)(230922051799003)(186009)(64100799003)(82310400011)(451199024)(1800799012)(46966006)(40470700004)(36840700001)(336012)(426003)(26005)(1076003)(2616005)(40480700001)(40460700003)(41300700001)(54906003)(36860700001)(966005)(316002)(6916009)(478600001)(36756003)(6666004)(83380400001)(82740400003)(356005)(47076005)(81166007)(5660300002)(8936002)(103116003)(2906002)(70586007)(86362001)(70206006)(8676002)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 12:10:56.7476
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97cf3d9e-7f5f-406c-0461-08dc2255ae15
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7749

Hi,

Refer https://lore.kernel.org/all/alpine.DEB.2.22.394.2312071341540.1265976@ubuntu-linux-20-04-desktop/T/
for the previous discussion on this issue.

Also, the linux earlycon hvc driver has been fixed.
See https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git/commit/?h=tty-next&id=0ec058ece2f933aed66b76bd5cb9b5e6764853c3

Changes from v1:-
1. Split the change across 3 patches as per the design consensus.

v2 :-
1. Reordered the patches.

v3 :- 
1. Change mentioned in individual patches.

Ayan Kumar Halder (2):
  xen/arm: Introduce CONFIG_PARTIAL_EMULATION and "partial-emulation"
    cmd option
  xen/arm: arm32: Add emulation of Debug Data Transfer Registers

Michal Orzel (1):
  xen/arm: arm64: Add emulation of Debug Data Transfer Registers

 docs/misc/xen-command-line.pandoc    | 11 +++++++++
 xen/arch/arm/Kconfig                 |  9 +++++++
 xen/arch/arm/arm64/vsysreg.c         | 28 ++++++++++++++++++----
 xen/arch/arm/include/asm/arm64/hsr.h |  3 +++
 xen/arch/arm/include/asm/cpregs.h    |  2 ++
 xen/arch/arm/include/asm/traps.h     |  6 +++++
 xen/arch/arm/traps.c                 |  9 +++++++
 xen/arch/arm/vcpreg.c                | 35 ++++++++++++++++++++--------
 8 files changed, 89 insertions(+), 14 deletions(-)

-- 
2.25.1


