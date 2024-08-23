Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E6E95D388
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 18:32:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782457.1191979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shXCo-00052T-OR; Fri, 23 Aug 2024 16:32:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782457.1191979; Fri, 23 Aug 2024 16:32:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shXCo-0004zY-KO; Fri, 23 Aug 2024 16:32:06 +0000
Received: by outflank-mailman (input) for mailman id 782457;
 Fri, 23 Aug 2024 16:32:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4lC7=PW=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1shXCn-0003wy-CL
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 16:32:05 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2408::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a357554-616d-11ef-8776-851b0ebba9a2;
 Fri, 23 Aug 2024 18:32:03 +0200 (CEST)
Received: from DS7PR06CA0050.namprd06.prod.outlook.com (2603:10b6:8:54::32) by
 IA0PR12MB8896.namprd12.prod.outlook.com (2603:10b6:208:493::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Fri, 23 Aug
 2024 16:31:58 +0000
Received: from DS3PEPF0000C37D.namprd04.prod.outlook.com
 (2603:10b6:8:54:cafe::d6) by DS7PR06CA0050.outlook.office365.com
 (2603:10b6:8:54::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18 via Frontend
 Transport; Fri, 23 Aug 2024 16:31:58 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF0000C37D.mail.protection.outlook.com (10.167.23.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Fri, 23 Aug 2024 16:31:57 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 Aug
 2024 11:31:56 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 Aug
 2024 11:31:56 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Fri, 23 Aug 2024 11:31:54 -0500
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
X-Inumbo-ID: 3a357554-616d-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WShjWix8mPVqDTbOruTRH2UCLY54m6OB3SEmP9idjbVD/VjSNeY4GkZ8kq5kNV8Xghu7K/+WbKopdOWXpTsHS8C+6gxlUnSyRVIMtuS9alpr8njh+wcdo5exFSOIdUTQCtIHPr9ZHW7zX4dbV7DfpL/QPi9qw9wat5qGuLe4y8tyxBr4usjMtBkj9ZoadJemVyL7mKfJOmSVUZJl4tEZf5VrAz3kF5tGwY9Rsvl0x9Nx04GoBnJPLFCsx8rWHVvB6NrsBBNSuzuME+wp5EoSzS2VOJ0y3VUfRmCDfPoecOjDK2Y0SjWSgSmb/r8S4jzy0F0ixut8JCBIQyewG7ye7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wuiEdftCCb5GGJkxnNH4L0uhS/yjDJbyX+vbFvef+Cw=;
 b=ASn2yW3XmcglQmdTikTAT3b1VJl+x9cTtdEootr9ekLwsuX65Se2HmOvTlc2RBGN4rSR8pzM2PCCE/BtwF41X8aAikV/twY+4/hpiBEyOz0cBqN+BxWCpk09/I0Ote0nnARayAK7SHMzDdNXHK+cqV8tmhP0EUPnm+aaFfKQfAC7H5hEcNayZVkhUHGUBT+SW+UFyytIzT63OJbSE0pwPzqDaOlhWaUCMAIZmUFshHbIVc/YaRwTkoU8lF/1ouFyAsxyPNrjtfVlTranevJj2J7fddzpKm4x9OU1IjY0xrerrqI+WhLd/9X7tRTa+ql/yC60hSVC1/bJiFFvgIjUcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wuiEdftCCb5GGJkxnNH4L0uhS/yjDJbyX+vbFvef+Cw=;
 b=WMiFWJiBtZyORFY8u9yaGD8ury1VgxcGoSM0aZ6jPN+gJzs1qsOd/FyWbBwwrnZhnEFttwz75Oz+Aphb2JffT0Nzve0bn5rnSwXrCq1+bQBdHxxX9OgFNUyp2gk0wu/JYeYt8X4khqK2zSMUbuHCK9bF3qMm/Cn3/KUr2O8uLOU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 4/4] xen/arm: mpu: Disable secondary cpu bringup
Date: Fri, 23 Aug 2024 17:31:27 +0100
Message-ID: <20240823163127.3443404-5-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240823163127.3443404-1-ayan.kumar.halder@amd.com>
References: <20240823163127.3443404-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37D:EE_|IA0PR12MB8896:EE_
X-MS-Office365-Filtering-Correlation-Id: 68002031-1f55-4867-dcb0-08dcc3911b96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FZ5/pK0Hc63yveCg6QXKSUl4Owa+dq/mxDh4sXoEGNYv8ZumJpfq9Ho2fCbB?=
 =?us-ascii?Q?ikHgKK9CZf6ymqGRDbxX9WenvAT4W7eGel0oBmdTyuLiNrC+C2Q064knUDmi?=
 =?us-ascii?Q?QGvzb3GqoZ0/LBblXPJI5AsA+30mQTB7Xay5wbkeSMiFsfKEeRcmFyDbSsM1?=
 =?us-ascii?Q?0MtcVgK4UVAWR1p5Y8s+22IWFObUGTXPSr74BOxhdSlglG4cFLEcg/DHI+kU?=
 =?us-ascii?Q?W78QfLDk+BWdz3+vsJn7VpQ7kuDc9/bDbCyflHUKqAOMXYrihwYxsBLJDsCG?=
 =?us-ascii?Q?ckg7nhycA/Rv4Zc1gtaV9kRlzqKF/ARfM5NM4Tx4OcLRLFKf2yperL38X3qY?=
 =?us-ascii?Q?My2rrZRhVfzjzgIv91bErvb2Hyr/CEDCFQIfS/qVGCP2ke8qkKDwYjLAZlhJ?=
 =?us-ascii?Q?Ycgyd5GuwqkgWjorCCMqKfOCEsAg3GcM6apSgCCmRX0mgHFNYyDPiwthjzOo?=
 =?us-ascii?Q?OqMhQlTQT269MlWlp/mRPS/NuvTI6HTRsihEa3HoMZcjIPWIpKM91SVxhwLw?=
 =?us-ascii?Q?fGbrAX0IhowkXCATbsDjUq3/B37LzVx3TpnfL13pFZSXQ6UozefBmevvAVPa?=
 =?us-ascii?Q?gy5aYLcvKJlXIz7LCGAT6zyjwDRjo0bW5UzZzl2elAtagrprDEU1BCtfRcrY?=
 =?us-ascii?Q?sz1eqmTzK5QsipppHFcwLZ5FZSxsgr5MbLI9//cb4ti9Wcr99f4n+rnGv/HB?=
 =?us-ascii?Q?EJvumFLX7JJ1qPGTVSxRQUxQWNU+Pj7Etc69x8m0dqNCIW/UKeK5/PDoZHZs?=
 =?us-ascii?Q?Sbe5lj72cAPV3jYab7nX6L2Gw5u0XxcTmVni8TWcxv1tGfrGMMM7MijphTHf?=
 =?us-ascii?Q?0H+SK3ie7WPnL8zJ5neD/ulZX5Vyv+oqeI59gRkWp/hD2HiVBI384zVnxkMG?=
 =?us-ascii?Q?juHtCWu/Jo0MpFoQcq1AXFeMoVoTjDdRUscj+Q5VbsJ/EiBtwts9F6YNzj4w?=
 =?us-ascii?Q?pqWBBENxT8fwqUY6EdjBKFIebw7+T1yyu/+XwSuTE10jrTAcjn4JXdY45ZJq?=
 =?us-ascii?Q?zHpYWZYpzglrg233Rq0iUdQqVqf6b7mIL4lKsAeL/tPbxVlxSDLW2bq3pRwP?=
 =?us-ascii?Q?0PzMylR8Bs0iCb0O7jqy5Ym5XHokfJLzFbuNHzgacml4ZZzDQyRb7qRO1H0e?=
 =?us-ascii?Q?RuVd9cxfPp6b05Yj+xr8eJVPpzvq5V0JWnvdoTjIHeOHtbfLC8OjDsX33PNx?=
 =?us-ascii?Q?yXyz+HPRFg3sgMkOc3a3wsVAeUIuYR5o1DpgSXbqMurpda22KBw8lU3FYb8L?=
 =?us-ascii?Q?1GFKZNNhJnNO9EeRrYZPsKlUf2OvA/3pffRLzDE6jge1YETTW+LXK+H0qRxR?=
 =?us-ascii?Q?rZxEN7GwBJNfwiOfayLt1TwVy39iXZB9juUIzct/558cSC4+ZgV/jbB2nyTJ?=
 =?us-ascii?Q?laCf9/0r4+jWcq70ZZcFaHUGdi6Eu9/aqx2QhkWmVceCYyRiXmwjgVXrisUM?=
 =?us-ascii?Q?ixScpo7hY6Io969zJY6cGo8b65ioF5zr?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 16:31:57.9220
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68002031-1f55-4867-dcb0-08dcc3911b96
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8896

Secondary cpus are put in WFE state. We do not support SMP at this time.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 xen/arch/arm/arm64/mpu/head.S | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/head.S
index 2b023c346a..1579ac0408 100644
--- a/xen/arch/arm/arm64/mpu/head.S
+++ b/xen/arch/arm/arm64/mpu/head.S
@@ -68,3 +68,12 @@ ENTRY(enable_boot_cpu_mm)
 
     ret
 ENDPROC(enable_boot_cpu_mm)
+
+/*
+ * Secondary cpu has not yet been supported on MPU systems. We will block the
+ * secondary cpu bringup at this stage.
+ */
+ENTRY(enable_secondary_cpu_mm)
+1:  wfe
+    b 1b
+ENDPROC(enable_secondary_cpu_mm)
-- 
2.25.1


