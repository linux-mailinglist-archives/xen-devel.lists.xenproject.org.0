Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A3A972632
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 02:32:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794934.1203971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snond-0006ks-EG; Tue, 10 Sep 2024 00:32:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794934.1203971; Tue, 10 Sep 2024 00:32:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snond-0006id-B0; Tue, 10 Sep 2024 00:32:05 +0000
Received: by outflank-mailman (input) for mailman id 794934;
 Tue, 10 Sep 2024 00:32:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3uiN=QI=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1snonc-0006iR-Rx
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 00:32:04 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20611.outbound.protection.outlook.com
 [2a01:111:f403:2405::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1888f32c-6f0c-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 02:32:02 +0200 (CEST)
Received: from SA9PR13CA0075.namprd13.prod.outlook.com (2603:10b6:806:23::20)
 by DS7PR12MB9042.namprd12.prod.outlook.com (2603:10b6:8:ed::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Tue, 10 Sep
 2024 00:31:55 +0000
Received: from SA2PEPF00003F66.namprd04.prod.outlook.com
 (2603:10b6:806:23:cafe::eb) by SA9PR13CA0075.outlook.office365.com
 (2603:10b6:806:23::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23 via Frontend
 Transport; Tue, 10 Sep 2024 00:31:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003F66.mail.protection.outlook.com (10.167.248.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 10 Sep 2024 00:31:54 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Sep
 2024 19:31:53 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Sep
 2024 19:31:53 -0500
Received: from xsjwoods50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Mon, 9 Sep 2024 19:31:53 -0500
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
X-Inumbo-ID: 1888f32c-6f0c-11ef-a0b5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b2pIEr1SJ/h4DXrOCpuaCHlSmwDLzWs5je00fbncXbxGx5EUuhCqbTUtipz2s/Kw2irYFnjUDyjKHu7qHAXUtW6YEijS66JBfWP7BrkYOSvHF8XCAUm5actPgKWrjz5RoXSO0n1KR9ka4NVmoUeR0jMjrZhayEO9wM+33PtR3roi1utJf4bvUc42MuyLjV5wzpwkG9Eco8kFXFwOx8YgkzZdWzRWQmaBIBBYLRAPzZj9SSmctuokku7oX4o7tfulxyI8eTGRlkmMTbRk+wrd1WaknotNrqSzRom8KtM7V2xsyqsz6VaAT2YXMPoT1kQoncJt54g4c5yCWijJCpC39w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gtgLl0LrF/9VsrKbUZb1SnZLcM5mak5Sanc8PGH6xiU=;
 b=qXRrghMW1F3RFQ5o885xtD+DfIB3rfSzMcRde9uu58Ww5jDYpJrdJIMQLulHikFsl/7smgtE09HLcb3UU5b5hUAcaWQR7hb9QMbw9P2kkRY5XOeN9GK+PctbdomLLcGqCxi1s+ajxACSW82cURjIOD1PZvql4Vk4BqKRCSlA31+WahALqRbx5TymQEBUR4hD97LYBjRqv9seoqZ8KFmTPoh/m3D4yZRfjU06Ps8XKbL7zePdjBdorccJ+/PA8CmyfI6wIA/94heLjXJgySafNV8TEGrBe2PW2XZX9V+wzpvhjrTgP2fwmDJqoOjQLEVs6r8lN7DxxTPagvOUvxjvfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gtgLl0LrF/9VsrKbUZb1SnZLcM5mak5Sanc8PGH6xiU=;
 b=fh4XHOp0JDtn5jS8xGdT0WakwRz8BHq7Rk1zUt29BuuGwZHuSFUvH1ZQTCQ1iMDShTJaKxiJBLaD6bI3H3cl5wUxCxtCZUGStRo3Uzmjvoy5T33qK/wuFy4L0y5xxP4Zf4mcGohsbUykDuwFp7Krt3SM1BzKDGae9HTeJd9o51Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Victor Lira <victorm.lira@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2] automation: fix xilinx test console settings
Date: Mon, 9 Sep 2024 17:31:46 -0700
Message-ID: <31253c0d35b2d238b31b197379decef013a1e63a.1725925821.git.victorm.lira@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: victorm.lira@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F66:EE_|DS7PR12MB9042:EE_
X-MS-Office365-Filtering-Correlation-Id: efe24cde-de07-41f0-3f58-08dcd12ff8f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?m+dkaDxR9bY62tCjcJVS91Hkntr4qCNmbVkFkYoB8Byi9YN41lmFKx9tTnlt?=
 =?us-ascii?Q?KPnd8AxVJ2Hln/wMVqpe3dj594TKY5LrqJQEKJxm7KLG/GHUmcQM3DgXpnfh?=
 =?us-ascii?Q?TgS8OJ2OWZD6f4HeNXvGEnofjnZrEu23BC3py6PKjt/yjv4ycAX5u4kqqu95?=
 =?us-ascii?Q?0Q8hqibIP7snWgmagPbZKCvrGuhgliNwRSI0L8bgn6p1RaXQdpcwb0BI9haG?=
 =?us-ascii?Q?4ViclOPta4Je2PTtGoctBb0IxeEUnoWAD047PlCrkgPx/b37zEPvQ6lLDrmW?=
 =?us-ascii?Q?GAGWmvr6nZE/mD9oWcf+pctQ9Xg8NKDQHSUg9iJr1XF2CixPM3E3LFgdC6Pl?=
 =?us-ascii?Q?g4xCbvxbPtgNOYrzKp8KI/FmLkCM8vakTSXJsgIPS/wi/0MPcQO0yUN7g/1E?=
 =?us-ascii?Q?Wdy4FAZxAST/d92RsJE1qWxn/VkZS5+nGilJLTlM2hhsK/GbRtFSzeYTiymS?=
 =?us-ascii?Q?MJEFXM/JyUkGSjBAq8goZYe21WIMJs08L2sf1ZnwvK8ZVOVlwBUYvdWGFvbk?=
 =?us-ascii?Q?uELq4e2V+T/1EQ3rF25xIqf9u26MCQoigmlfBGog9XPYgCqLOZ9dQeuAvTyH?=
 =?us-ascii?Q?m1gisYtd16L0S8PLTm8R/at0PWVJuzluHPRwJCvQ48t7C1GtpCC9uGJzr8f/?=
 =?us-ascii?Q?6edmEVmhmthe7AU03cQ0KcNZ7VusnMafBIecZbkFhQLRz3glGqY62fmMVyJb?=
 =?us-ascii?Q?eXtX45F+7CccbJk6KsHk6qzjs8EuIaUGgEfuYjoKpk+e9plJvU+kUMYUkU+3?=
 =?us-ascii?Q?MjR6xHu/eWGgj4w5gXz92izYR0ZGCz4tvKEryufovAFjbM2G0ZnWF9Wm5xpB?=
 =?us-ascii?Q?BW5jlwTNgzXCT4Hq8Q7/S/KrFzNZStVeUmeJkZ2D8U14A6dIibg81LQ0aesK?=
 =?us-ascii?Q?dx67eHrX+3m1b2JA2OWQtvAc/v+nb3Rdq6Kc8CxKGqinSWL0xveDsyy4CYTI?=
 =?us-ascii?Q?JSL1OMWpVvS12u45Qd5blV6GUq2ghq2fPpeAZFyklPPkC/U9BaYuPgcXgict?=
 =?us-ascii?Q?sViue7+Ty0KCsmglfd811+i0ZrAsVTsXlRIxR5Op7xmaKqV1xk0OY1NOo9JV?=
 =?us-ascii?Q?uQqjU9GIUwj1mhzLWDzLurswFN8ZAFrOpXB++60cGrAvOEfCtfxPG1wr5Vgi?=
 =?us-ascii?Q?9APTC8hK2PRD4oG+NsqxPfz6UKSQHxxgITviMA7udT/uQBkgzB3iD0dvpZqP?=
 =?us-ascii?Q?uCf3WMnl25n6Rpx6g0bHhf3Ht/7sRxscOiw35BIr9LuraNKCpnD7cAXhTgyW?=
 =?us-ascii?Q?nGC9M6IMCNB5ldTTO8Ts6w2LKC9SnD+/4WEy3H2pQX/LI7XVkpsc0ED0VNVC?=
 =?us-ascii?Q?H8QHE/bm1P4V5bAE0gZFwI54X2rK/GoCP1VyOjItC5RJ8ceNJk6NR/8N0EkF?=
 =?us-ascii?Q?Rkn/iRu5htADmIN59hrncpwS+12EGaaXrh3EuWJiLAj7vXMYLv4qD3fCp7x6?=
 =?us-ascii?Q?Sw4eQTbrpLacdgwR9rrh6hlaSfaT3Kmx?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 00:31:54.8448
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efe24cde-de07-41f0-3f58-08dcd12ff8f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9042

From: Victor Lira <victorm.lira@amd.com>

The test showed unreliable behavior due to unsupported console settings.
Update the baud rate used to connect to the UART.

Signed-off-by: Victor Lira <victorm.lira@amd.com>
---
Changes v2:
- restore I/O port address
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
---
 automation/gitlab-ci/test.yaml                 | 2 +-
 automation/scripts/xilinx-smoke-dom0-x86_64.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 8857bc56049b..09706894cf3f 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -103,7 +103,7 @@
   variables:
     CONTAINER: ubuntu:xenial-xilinx
     LOGFILE: xilinx-smoke-x86_64.log
-    XEN_CMD_CONSOLE: "console=com2 com2=115200,8n1,0x2F8,4"
+    XEN_CMD_CONSOLE: "console=com2 com2=57600,8n1,0x2F8,4"
     TEST_BOARD: "crater"
     TEST_TIMEOUT: 1000
   artifacts:
diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
index ef6e1361a95c..7027f083bafe 100755
--- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
+++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
@@ -129,7 +129,7 @@ sleep 5
 sh /scratch/gitlab-runner/${TEST_BOARD}.sh 1
 sleep 5
 set +e
-stty -F ${SERIAL_DEV} 115200
+stty -F ${SERIAL_DEV} 57600

 # Capture test result and power off board before exiting.
 export PASSED="${PASS_MSG}"
--
2.25.1


