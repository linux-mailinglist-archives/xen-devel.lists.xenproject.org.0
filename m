Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D41CB94DB2B
	for <lists+xen-devel@lfdr.de>; Sat, 10 Aug 2024 09:00:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775037.1185410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scg4f-0007c6-IM; Sat, 10 Aug 2024 06:59:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775037.1185410; Sat, 10 Aug 2024 06:59:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scg4f-0007Zv-CX; Sat, 10 Aug 2024 06:59:37 +0000
Received: by outflank-mailman (input) for mailman id 775037;
 Sat, 10 Aug 2024 06:59:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jkHu=PJ=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1scg4d-0007L7-VI
 for xen-devel@lists.xenproject.org; Sat, 10 Aug 2024 06:59:35 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19f40a5b-56e6-11ef-bc04-fd08da9f4363;
 Sat, 10 Aug 2024 08:59:35 +0200 (CEST)
Received: from CH5PR05CA0024.namprd05.prod.outlook.com (2603:10b6:610:1f0::29)
 by PH0PR12MB7791.namprd12.prod.outlook.com (2603:10b6:510:280::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.15; Sat, 10 Aug
 2024 06:59:27 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:610:1f0:cafe::a1) by CH5PR05CA0024.outlook.office365.com
 (2603:10b6:610:1f0::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.12 via Frontend
 Transport; Sat, 10 Aug 2024 06:59:26 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Sat, 10 Aug 2024 06:59:26 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 10 Aug
 2024 01:59:24 -0500
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 10 Aug 2024 01:59:23 -0500
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
X-Inumbo-ID: 19f40a5b-56e6-11ef-bc04-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dEYe21sj6F0Nikl+LDNZA1Pse+qaAwaEoHizTaYFcHgpQwABvXUdn7CL/hpqdUUl3h0uIfFSZvDMb9PGQI9kGZQc1z2+yG6uG4Xjv5rR2NG1IKq/nq39kIjfTwtT04t8HmHYLFF2qDbuydwnr/rOvM6oQLKkgUpnJWk1W12JUDcQBeTUjADOzpKH58gbX226fWVu4FQ8XKVqVA4cyAIfyTz/hM/yDwHnwfWCNuUmSTxpSD16w4VSZlf2rP3dSNIoeAX3G6jF65bjv8ldGkXh97gN2viFmFcYJUFDhX2qMnrDUY02ZEqpNhNWYigWiCj/LRxG/JWB/3Dw8x/DmfFhdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GuMHa6PFELuzKmtNAeqLrGN+Q5ZS4SG6rDQOYJWFiwY=;
 b=EUEx4fBesHomRnTJqUtyLfYH/B3d68BXOuv0ZUWp+0E9P1Mzy7ZMY0WaIUKDDG2SK8Q8OkV7pXnSdI1Z/YuSpA4kL1hHOB8JOqSyhJKVdFdTLNbqbvcef1vv0B48AYZ6/YZEgQ3fo7PC9pGHHipJ/oMCyX7dQNpjfFKbl8CFmjlHvwPaqvQk1Xaudpv59Ny3WjNXmxekZCeXNoiLQdL/a53fxXhLHR4FCd5onZ81zKEJl4fFSskuu1GSFZ/FvcAuhZ13ixV61DBcKLGyLUpBR8sKBOhLTVEgyYkl4kuUdlx0WpmebR0cDHK/l55AR0a29UvTL4e9BDjSu9HizkZzfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GuMHa6PFELuzKmtNAeqLrGN+Q5ZS4SG6rDQOYJWFiwY=;
 b=DlKydzNiBqYkuJ6btA9Ym/ZUkMBOZMxkglhZX+Zf47UXUeyPe9tjh7cpo7XBrDd3uQm49ZZmxE3QNS7l3dqMbLgqc/CHKxUrfkmGEcufPuaViu7SLka4DuRrV6fiTWblVKr5oLT17r6yjKUBRhE1/5NGpgjSfODfIFU5kPxb2p8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <cardoe@cardoe.com>, <michal.orzel@amd.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH 1/3] automation: disable Yocto jobs
Date: Fri, 9 Aug 2024 23:59:18 -0700
Message-ID: <20240810065920.415345-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2408091700560.298534@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2408091700560.298534@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|PH0PR12MB7791:EE_
X-MS-Office365-Filtering-Correlation-Id: 96a2db7e-2bf7-4ef4-b7af-08dcb909f912
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QHda/JR5EkKqaRNyPz/TYuky2iNN9haBAWLeu3AxkckBEhmu+6ggPrpoGK3k?=
 =?us-ascii?Q?fs4gMLHvazohFR20L9UuDfPCIA3H+YZvDsubRh6541ib9n+Dew81rEN4wigz?=
 =?us-ascii?Q?/bY1gxFM+MyZH2Ufb/0FDMgoYus0XZ0oXKMGVIYFaqlmBPxscIegaU8eNyki?=
 =?us-ascii?Q?712Kx5lDWaQIJqcqHlyrpcptgOFwWkIWOuHkYvX1kr6NW644KtXnaBgWZAik?=
 =?us-ascii?Q?DmKFBvz1r7WaBuwQSubEhKO+ok/WPG5hcWrHmH3EvIYLvIxUOW8upVBLZ76X?=
 =?us-ascii?Q?pfzU9gGhlf3vtBoOE8BwsLC731cueTKDJkUZ8ufZQE4CQe6IkrNuXgQZr5rg?=
 =?us-ascii?Q?HAld7GgDBSxTAJyANPQ0eU1hsXQ3EMUpdK6ODkiQ3ksvPjrJT42HruLydWqv?=
 =?us-ascii?Q?7FpR7jCez3XVitURGljbl4A8Vc5AL7NESPRRmaok06Fep9NOQyBYPzx+DEKp?=
 =?us-ascii?Q?rwI/643oWRxJIxiWgt4ir939+02dsNW9XVOOtLuRifAfD3dbJ+3j8z0DzM6x?=
 =?us-ascii?Q?yPzs8Yrk+/nn16wFUsNqJ48nyb52svkg7oHuC8wGPS/5m7WTuCcZs+loGxc8?=
 =?us-ascii?Q?mDKJLdSe1sMW8qTZSoY44wsWqIcTesD7gL86uF8lx3LsEJruJGofNoLMYH2w?=
 =?us-ascii?Q?zSJwa1YneXOCxtRZ4beAeGC9YOlziPyJ3XqRksCG0Tf1o2MVENfCHcmuWzqR?=
 =?us-ascii?Q?rrDwxgH1xSymwKLeTIGPOgQT8PV74MsInG3ZHyQOn9s3lNBQ17JNCJX+YKb7?=
 =?us-ascii?Q?pxQclLCaILhOtrIpFNoKQM937DsSrZCMvmKEvBpemNAlM3HUcPU22Z7dPs/D?=
 =?us-ascii?Q?TYWAsD40npOSodWmfGKFal39UkYmIXcYnNTRGlSpvfKWB9RSwJeshmbo9+RU?=
 =?us-ascii?Q?n5m4mtIpJUXkNVBPysG0zSy1bXOnQUHW/vGHZOg6fR/nTHdCk+Ul9ozcgkLb?=
 =?us-ascii?Q?hmepJhCecwxP00xJcItKX+Tk7CUJ390SvXd+eKaS6yPF96+jxF2N2GYVxc+o?=
 =?us-ascii?Q?hoCRkH1SKcrmMyIqaqFyTCBuR1QfLMNa47Y0ydBZLZ6G4w32OWKmHzx1EtWG?=
 =?us-ascii?Q?vYQ/KgOA7dkTfwTxQm3pr+G3smd9KSOa7fiJh3084bpM1OHBBgm5AeYEloWE?=
 =?us-ascii?Q?bzUU0wk/5IYySrXQeBZ4ByOxOrcC0qDkycjjpv616r91ooWNdx1AAZhzFq7M?=
 =?us-ascii?Q?mLrTIdL/3I+o+f7789m/dWHvnUhbeyaNkDiFNs1/jew1Gn3rE5I17gSLM6JS?=
 =?us-ascii?Q?MY0yjpvo1kRmvS/9hqCiD95QalxhLf6tkcxkACOM8ithF3FVztCxmfFrB5id?=
 =?us-ascii?Q?pwwueNxPtjh7LrZfRmukg1ivXUopNFRtMImxXsliXrjtjCoV61vV6HWNl1go?=
 =?us-ascii?Q?ExAKxROwc5jhtP0x1wEQv40doKSUFeJCuJtZzS2JdyRWCfwT6EihcKQM5FDZ?=
 =?us-ascii?Q?xAFVY+xwxW1gN/hb3+z+NDDoVN3fHSXJ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2024 06:59:26.3115
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96a2db7e-2bf7-4ef4-b7af-08dcb909f912
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7791

The Yocto jobs take a long time to run. We are changing Gitlab ARM64
runners and the new runners might not be able to finish the Yocto jobs
in a reasonable time.

For now, disable the Yocto jobs by turning them into "manual" trigger
(they need to be manually executed.)

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 automation/gitlab-ci/build.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 32045cef0c..c668736bdc 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -470,17 +470,20 @@ yocto-qemuarm64:
   extends: .yocto-test-arm64
   variables:
     YOCTO_BOARD: qemuarm64
+  when: manual
 
 yocto-qemuarm:
   extends: .yocto-test-arm64
   variables:
     YOCTO_BOARD: qemuarm
     YOCTO_OUTPUT: --copy-output
+  when: manual
 
 yocto-qemux86-64:
   extends: .yocto-test-x86-64
   variables:
     YOCTO_BOARD: qemux86-64
+  when: manual
 
 # Cppcheck analysis jobs
 
-- 
2.25.1


