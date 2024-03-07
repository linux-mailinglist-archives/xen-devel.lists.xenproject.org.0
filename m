Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAD4874F48
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 13:40:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689872.1075276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riD2Y-0004ut-CM; Thu, 07 Mar 2024 12:40:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689872.1075276; Thu, 07 Mar 2024 12:40:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riD2Y-0004qe-8s; Thu, 07 Mar 2024 12:40:02 +0000
Received: by outflank-mailman (input) for mailman id 689872;
 Thu, 07 Mar 2024 12:40:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D3qa=KN=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1riD2W-0004ja-7Y
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 12:40:00 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2415::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce788571-dc7f-11ee-afda-a90da7624cb6;
 Thu, 07 Mar 2024 13:39:58 +0100 (CET)
Received: from BY5PR16CA0020.namprd16.prod.outlook.com (2603:10b6:a03:1a0::33)
 by DS0PR12MB7581.namprd12.prod.outlook.com (2603:10b6:8:13d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Thu, 7 Mar
 2024 12:39:56 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:a03:1a0:cafe::bd) by BY5PR16CA0020.outlook.office365.com
 (2603:10b6:a03:1a0::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.27 via Frontend
 Transport; Thu, 7 Mar 2024 12:39:55 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Thu, 7 Mar 2024 12:39:55 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 7 Mar
 2024 06:39:54 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via
 Frontend Transport; Thu, 7 Mar 2024 06:39:53 -0600
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
X-Inumbo-ID: ce788571-dc7f-11ee-afda-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TO+zMB8nhPgtXZVOMKY1ba6zp4Wtw0unFS+Sv6PpKl39y43HW4nYCd6Z+mLCMbNea6zlZcki7iVqbNITHfbTxkaWbH0SzgMN52jAddX6OIDkYI5GppxVOTTUxP6a4QiDdHR8x3Pyrvwi1hZtevySxJvtvCC+3I313oTuEk/KwkTKVr6JlqkGHPdR5PvfQMhmeW7SOvCsZhT74WZKbKktPc/T5LU0orhFdvel/DGZHvx7wkGBkkZmNSKObr2jywNbtaI6dgpcx2PmhK1BiyAddqpNoF6l03YNdDa8dRPIXd/I74SfMKMnEYIylYi1ZOI07O3SR8vCKXw6gGXDyI+gsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sctp/GUPyTcFVFaoDcBFiWSmPf7+5jiwVDm3nmV1ngM=;
 b=kqb3Qk0SxGt2SzZilEuNRCpkeAXcG6yU5PXcaa3U8WevlSwhnItrskizUyQTthdwU4hyTLkFrwEGF+LLYNItBlB8TR71u7sVy5tbpDZVQJf/eynng3tTQgLOQsG39EKX9MruwOXUcrCjCV95kFbzmxE3PjkhUrfW0HiXBh7LBKt3PqgIj0JAvRe+0A7dpM37X6I08267wmJ/qDBQ1oaaBhlPXmIavnM+LGJ1TQHecAbUE7WGfU4Wf7xNE7+p0rqhcvUHr/iK3+kj93KaJ/oFmThmQgNFATdL/IxAPQ8ciPaXiy3e741SaChwrW4dKD49WUaK1s+IDCv5BQeqwdyOWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sctp/GUPyTcFVFaoDcBFiWSmPf7+5jiwVDm3nmV1ngM=;
 b=RLSKSQvQZQLm1agDyMOMyFDdxA0hGgpiLewDCuu9yN/9d5oMuVV941SKf3NFPjopGpUsmjsJZGIHOtUGtF1i6/R5b3X0rUni7LYrovs8ugj0ld3F5or6hIZ70VsOAgq1h2k3YhAhd+K+Au9BsJhN+7610ASEhek65B3rXBobGqc=
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
	<michal.orzel@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [XEN v6 0/3] xen/arm: Add emulation of Debug Data Transfer Registers
Date: Thu, 7 Mar 2024 12:39:40 +0000
Message-ID: <20240307123943.1991755-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|DS0PR12MB7581:EE_
X-MS-Office365-Filtering-Correlation-Id: b0d2d8ab-3e7c-46f9-95b8-08dc3ea3b155
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8heBDVP4mfRUoeCrx/8J4RWCtBmCVguGIBHtxNwdZwNmESXGBBAR2b8NqZW5NavY5kvBF3Ym6/j0mmexXss3XRB6MZxQ0QsitAY6V0ORIcuDllYzxYjAAfi+SI+f9y56Zr9+zHX/TBu1t+oDRfKr8cgpBIadOoefQelDDwORsxXfkNfMlwG7zYy5PWk/nY1x/bhbfMK+nMIvPiXfioJL063VWmMsrVfBlT8Kz1YrMQS5PdYTT9fjCQmNGDLseFC/k11CihMkvq0TMmotm1na1eLhkFbDFG7o4iVQo39ZNSYB1CNwHJFesmgMZxqDVdgPuQBhdIPeoUUli0O8bKDzYPd8nCpIIhjbzt8aM6oQfeeKXD52WdAAw0RahfWbrDrfOvo6phI2zPHpjlvQV/0B6H5Hcxc73fynFcGKAp6U5XiDZc2kF2QT0KnQfGBvkwP3fFy1TP0yMJ1IQYLnQq9FBf+LdqXFn0fKiKn7kDWExv7m1y7/Z8XgA7x8Zq2vPZgyznvl9c6pzV7bZE2WhBu0vFWNwLgplkkSoTYQsbZY45sltqTnrlAFsN7/omZd0JIBpnSetub8Lq3F6oXBBQAc0Tvfzs6Ufy9P425uvAPuMkfk7edihhnOWxAlrLJJximT2Sy2BFNSqvHsaBOF/+I2r+7kcoX2PheStnvE7OrAzS7fJy0HKLTWpUtuDJZXXLs9CkfZ+3Dn/1SFBeFRltyOfA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 12:39:55.4285
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0d2d8ab-3e7c-46f9-95b8-08dc3ea3b155
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7581

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

v4 :-
1. Change mentioned in individual patches.

v5 :-
1. Change mentioned in individual patches.


Ayan Kumar Halder (2):
  xen/arm: Introduce CONFIG_PARTIAL_EMULATION and "partial-emulation"
    cmd option
  xen/arm: arm32: Add emulation of Debug Data Transfer Registers

Michal Orzel (1):
  xen/arm: arm64: Add emulation of Debug Data Transfer Registers

 SUPPORT.md                           | 17 +++++++
 docs/misc/xen-command-line.pandoc    | 11 +++++
 xen/arch/arm/Kconfig                 |  9 ++++
 xen/arch/arm/arm64/vsysreg.c         | 69 +++++++++++++++++++---------
 xen/arch/arm/include/asm/arm64/hsr.h |  3 ++
 xen/arch/arm/include/asm/cpregs.h    |  2 +
 xen/arch/arm/include/asm/traps.h     |  6 +++
 xen/arch/arm/traps.c                 |  9 ++++
 xen/arch/arm/vcpreg.c                | 62 +++++++++++++++++--------
 9 files changed, 149 insertions(+), 39 deletions(-)

-- 
2.25.1


