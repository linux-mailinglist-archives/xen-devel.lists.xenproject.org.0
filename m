Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4E686C8EF
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 13:14:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686997.1069669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rffIc-0001jF-5f; Thu, 29 Feb 2024 12:14:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686997.1069669; Thu, 29 Feb 2024 12:14:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rffIc-0001gT-2j; Thu, 29 Feb 2024 12:14:06 +0000
Received: by outflank-mailman (input) for mailman id 686997;
 Thu, 29 Feb 2024 12:14:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aH8z=KG=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rffIb-0001gN-1r
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 12:14:05 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:200a::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 065b7ef6-d6fc-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 13:14:03 +0100 (CET)
Received: from SN7PR04CA0220.namprd04.prod.outlook.com (2603:10b6:806:127::15)
 by SA3PR12MB7950.namprd12.prod.outlook.com (2603:10b6:806:31c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Thu, 29 Feb
 2024 12:13:59 +0000
Received: from SN1PEPF0002636E.namprd02.prod.outlook.com
 (2603:10b6:806:127:cafe::e2) by SN7PR04CA0220.outlook.office365.com
 (2603:10b6:806:127::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.30 via Frontend
 Transport; Thu, 29 Feb 2024 12:13:59 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002636E.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Thu, 29 Feb 2024 12:13:59 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 29 Feb
 2024 06:13:58 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35
 via Frontend Transport; Thu, 29 Feb 2024 06:13:56 -0600
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
X-Inumbo-ID: 065b7ef6-d6fc-11ee-afd8-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fgwZGtiCcMMge7xnJQO0JWYuDE0pnjXoI99iBYkXlOy/zjT7exzHx6TiKkOMCoC3b8ulJt0FtBVqrrRdRC8bSv+B4C3kOFqa96wuBnh4o5VC3NeML8Y1EUxB5Kife+9hgqWpjgV/pBgYLOE+ZQVOI12XpEu9RwOrSvaujpckkCTUS8YlOWahCtqJ6HdkiJi2NmzxbmhNTGBeD2gfENpriJb8ZkEF445geIaSWbLLp3/uaHaHaG7Q9r0OiMlj0tO2HeIyyzj21T/mTbx4uBcDX2f1BRmGoXKjmaqACEtXODyZ3agMNWs+BLjpI7ttiuhijJsPM/2FfaLT1PnHBTBVcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hVr6b9i3p7tYsLB7Do102HaoN7SytS39uVfDOSQGWQw=;
 b=QF7zADPpF6Z9gGT7Jhi0sczmqHZGTIF/iybq9mK8Vtb1KinV25TxY7RO5vfVkQjmblrnlRuH/R3vfUN3xpdg3SD1ubZvPcrFlFNlRclnNUy4NOWjeVeKLxYmJ32Lc6WCpSqR3INMo72l7Sx/tk7m1G4bOpyFfu26eFkrkTt3F6hfuTWJTV3cAM4AnzsgLb1mg91QzzBB2Y9bZsP4XbS0fpuYwIVljHalmA6SWYFGy4Oo86H2gPqpUP5vXoeuHs7JY1w1OEtN4+FqFJuunzx4yLPufjbtixFo5L5Iv85n1McAw8tlFoxaJrbq8hs1+w6i2F5hXh9aJs0ay7yI5VRcAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hVr6b9i3p7tYsLB7Do102HaoN7SytS39uVfDOSQGWQw=;
 b=q+KT7md55yI9DSjzJK8VuCh0S0vcDUhpfVtSQRItbmi9+28tv7r5VMHS0J3hOJdwz1ZqeHZrRu0e5kIHWKrB0p08rxbe/ycBmwN2D9kP3EZsMaBllKWIQCX/cQf7Mm4sOawhSp3mX8eMSaiN4MMafeCKT3UvSmq+eAsPfJrCK7A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH] SUPPORT.md: clarify support of booting 32-bit Xen on ARMv8
Date: Thu, 29 Feb 2024 13:13:52 +0100
Message-ID: <20240229121352.11264-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636E:EE_|SA3PR12MB7950:EE_
X-MS-Office365-Filtering-Correlation-Id: 2915a05b-b973-4cee-05e5-08dc391fe8e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	15x22nPmqGnGVLv2hFZ9761BTe3iGCjzUF/OyawdJnP/7OAoC8k0Xi09erYYUlC6Y1ISUE1KEcSYh42KbXsBCYcEV0ZbwW7c99L0O9xwspuJ8RRYZRgiNeA1VgfXgVWikYCvdzzVJgvrKwIY5K4pAuyonmluSPMxmsuYVKgPohsYRGnIt+0yCPd5BJkPHMW680D0ItLUKD7tSzF4sFgRDYlRUFJeVJwPXj0YbA81eGOZpbOYaKmTMZiCUvHGmwAVw1+t8coIoX1F0SUa2BBB0EZ3nMqjJamT9jc4LIXhwHfiBRS9GpeDkzOO4Sc5VHBBNh3V3+I+EvhKK6U5A8Whe9Y9u++RB5+QRuqhDjK/Dv4I5pdhI7l+oPQZW+7P2+1aqrnDT9bXuazYVI3swTGkUq40XxeX5A6FU09r6fVmwZl3mKCNpkYaFQrfTeNRMYBj+6x2TnonNmYP1XvoLlzEVON+fo/UsVZjpZsltm3Rwqg76+UrdMwjVP6tstzFBWtgMSI/Ay8UjNr7NVJc0w3o17hVnp1QLPftqQhtyQx7prceaFHi1Mpz6KTJOjQUREvOPxYTzNLLbxeJJAvzkPJ0EzMLkL/j35r4q++JbYxDUOjIlFqA3t4qpChezSPEvK7hMZW1nW5CxrKVxjDGwPVmDc/Z14FDC6Y2iIWmpbwVZMBPnAH0m2HYg25qFwXXDzsFpnTAn3knzQvaP0AXW/2qdpGqUoy/+vyn0tegEWx2FEqI0nJcaLVmC2pI7v2iwbyL
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 12:13:59.3432
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2915a05b-b973-4cee-05e5-08dc391fe8e8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7950

Since commit bd1001db0af1 ("xen/arm: arm32: Allow Xen to boot on
unidentified CPUs"), it's been possible to boot 32-bit Xen on ARMv8A CPUs
in AArch32 state (assuming HW supports EL2 execution in AArch32). Clarify
the support statement and mark it as Tech Preview, as this use case is
uncommon and hasn't really been tested/hardened.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 SUPPORT.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/SUPPORT.md b/SUPPORT.md
index a90d1108c9d9..acc61230bb5e 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -40,6 +40,7 @@ supported in this document.
     Status: Supported
     Status, Cortex A57 r0p0-r1p1: Supported, not security supported
     Status, Cortex A77 r0p0-r1p0: Supported, not security supported
+    Status, Xen in AArch32 mode: Tech Preview
 
 For the Cortex A57 r0p0 - r1p1, see Errata 832075.
 For the Cortex A77 r0p0 - r1p0, see Errata 1508412.
-- 
2.25.1


