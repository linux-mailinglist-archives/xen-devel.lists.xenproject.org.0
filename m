Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7780CAFBF18
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 02:07:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035888.1408306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYvs2-0000SF-GM; Tue, 08 Jul 2025 00:07:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035888.1408306; Tue, 08 Jul 2025 00:07:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYvs2-0000Pv-CV; Tue, 08 Jul 2025 00:07:38 +0000
Received: by outflank-mailman (input) for mailman id 1035888;
 Tue, 08 Jul 2025 00:07:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y4zX=ZV=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1uYvs0-0008Ok-Og
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 00:07:36 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2418::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8cd8c27e-5b8f-11f0-a316-13f23c93f187;
 Tue, 08 Jul 2025 02:07:36 +0200 (CEST)
Received: from BN0PR04CA0007.namprd04.prod.outlook.com (2603:10b6:408:ee::12)
 by LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Tue, 8 Jul
 2025 00:07:32 +0000
Received: from BN3PEPF0000B374.namprd21.prod.outlook.com
 (2603:10b6:408:ee:cafe::b1) by BN0PR04CA0007.outlook.office365.com
 (2603:10b6:408:ee::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.27 via Frontend Transport; Tue,
 8 Jul 2025 00:07:32 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B374.mail.protection.outlook.com (10.167.243.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.1 via Frontend Transport; Tue, 8 Jul 2025 00:07:31 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Jul
 2025 19:07:31 -0500
Received: from SATLEXMB04.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Jul 2025 19:07:30 -0500
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
X-Inumbo-ID: 8cd8c27e-5b8f-11f0-a316-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gHiStk4PWORhutOfSpL0C392e9LoSpLYaY3/x1D0ZjvjM+9Id/3KVkuoe3/hodWlIXw9l9vWALi/LAO4+lLJzfHNREzDQ3y85CIAjApVgtJpPBWhN6KX3wcOXWdlcKKxPF6E7hygbBR+jz26q01roD5wuXw5lXPbdOIAyqBsOkAZm2Bv7JOflIad8qeB01q8X9PZAOiZXOstGwPmfHJCHonNUrA6Ec2zpLjJJKO32Td+onMhOzZMog+ZVIAz5jkYvp2E/90bhuXPM9dxVJ8fzOQ0zOZDxwIEOnklCdwx7t4wsnUmjXc74AsNiHM26JxvQKcKKaGPnnGbBWoJ4VD5bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQgClbWGpr0ReiNMGJQkgrRBR0Oeh+B5V1gh+NMd/0c=;
 b=ja0rIqwLda4cQq1mdroEMO/jQv8msZnk2mKQKtkxPvYpWcVyRZdhu6FnjLXvbQW0gnvzQoefWD+Z0BJOfC7z8FxaLff0sbLJIGGwui5X++V0kGjjbVbI0KWuqBCm9+rdAX2phWK2g6OjE1b45atRxYyFE0Bzx0JGJJRl/Ub/J17nlRevEiEh46vXJ4AjLMUOeE5oYG+N2j6n2Lv2dsbL1mLFYXzsYbjfTZu3dsWGzWeHYve3TzI1PlmD5tITR6aBMu3CtRyB3ytA1FEKeEY3Tcqs4vw71B1N61Bs3YLbm8jUO3qCfapbnxUS7GG9pp/Ah/qcdihQQ5pgO2caWaL+gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQgClbWGpr0ReiNMGJQkgrRBR0Oeh+B5V1gh+NMd/0c=;
 b=KJdrVwu9MumK2z+NJEIQFj53VmtDpRxNJHIy8iadm+7IPSKh3te7f116itO3M9pJw6SL4a3xtG3Mkq14su2XLG+C+HomNKc2B1CjbaySXO8RKsZrUQiGZ4yA3Y6ZORb+Bfg1we/y8CpXfCJPQRaK/rJrOpgub50b6elKW1W/upo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, <andrew.cooper3@citrix.com>, <roger.pau@citrix.com>,
	<stefano.stabellini@amd.com>, <Xenia.Ragiadakou@amd.com>,
	<alejandro.garciavallejo@amd.com>, <Jason.Andryuk@amd.com>
Subject: [PATCH 1/2] xen/x86: don't send IPI to sync TSC when it is reliable
Date: Mon, 7 Jul 2025 17:07:11 -0700
Message-ID: <20250708000712.2731666-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2507071657440.605088@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2507071657440.605088@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B374:EE_|LV3PR12MB9265:EE_
X-MS-Office365-Filtering-Correlation-Id: 587f837e-7313-475c-5a4d-08ddbdb36f44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?czYLjlllCruUXCjRFl0vYmPUjCJlr7kYMokO8VOzzubM48TK9PeA2fantpBB?=
 =?us-ascii?Q?bfJgzO4yTDKT3iUIHLdALbX5EO5oWjP1/nzWlk029qnPyD48HE4Z6ZrLBCls?=
 =?us-ascii?Q?hlUSZKBBMJNHm0h6tZOMudBY2jYOLB/0T1Da/9LRNRzkmuDo2R4mpPscJzxd?=
 =?us-ascii?Q?753fZol9pYuJvI3+6Q+DTWuP1l8CbkPrW+NQHh0FOMd8WiaOxUYSE5UlP7G1?=
 =?us-ascii?Q?I8oqNgy6ep19p6d/ySwbQwNV2Ha+N/PM31tLUiuJMkGp0BAVX/9v0ZimI2ZL?=
 =?us-ascii?Q?RUWP4fIaHt1oSzqNQNT/slNVjFZAcTVkVpDEAydSjXEa7oIl/aSWqfWUzxPP?=
 =?us-ascii?Q?gLvfFtRdr0uDJyLrvU0iNEf8p3QkjpNZ20jqhfGD7iOQoHbAti87DvGN2VtJ?=
 =?us-ascii?Q?wJres6zLq3jCOC8u1wCU5ZEX74aE+mdvvjUGjBFETb8e3Pzo6JF0xaI5Oj/R?=
 =?us-ascii?Q?X6FuLZsWrBdPJx4Ft0R6+dVsVatqovGaZJOUHXGndVtbfgVmgoisx0cicrfZ?=
 =?us-ascii?Q?ZD9+YJswunoXHdlU32RZ5Re0GsEqYLeu0/pV6rPcDpUnFgamF9QTwqcrG/dj?=
 =?us-ascii?Q?osacmQYNBBIsnZgaEe96DSQgU/NFwfXUlmX8oKOxf+ND1fmV81v4tm5V8NRq?=
 =?us-ascii?Q?P5J7zoO56+aXfPAvqOONnuiIGPHM2TK23XGz5leDVB6Ituz0vc9EgyDUdv33?=
 =?us-ascii?Q?ORV2E4ijClBoSx+pV664hWO0kOoDIuKkdrGBFXfuWNnc2XAiu/qPHSIiMa1b?=
 =?us-ascii?Q?NjgWc1jAL3YdgbxWavomIkMGKbm0bdaPIwsPxItInpa2geuEUe1REwe9LLfA?=
 =?us-ascii?Q?VBoWUqQjKf68DIIjzkspuKi5zG2dQIrL6ji5nFTa9PqlUXpA+8qPdnQeooDZ?=
 =?us-ascii?Q?wppQeCDrai13qjE/QEc5K2m7QYcKZiQHgX4cwvE/ab8vHxGpq+eAU1VnrnkU?=
 =?us-ascii?Q?4MHGJZFSeLgKNz46AzJEyoNPzt7Wj8fAmuPTd5o5t/clgeJ9fLJCm8x/Ms4G?=
 =?us-ascii?Q?Z0TlzULuCeej2Lq4AunNrdHgqayokFuL5tyXfTQ+yQRAcpTGIZt6ZQZllWyH?=
 =?us-ascii?Q?f1nOH/wCNdlfooVBU6XuAxnNCsLnBpmLKfA561f2iAvnoICFb5auSO5xjfsy?=
 =?us-ascii?Q?eI4CHKXzXjKTxZcp5LZYPusUZeqVlGn+F4yR08cH0Z4R4FFbZGfEhNSPm8Fs?=
 =?us-ascii?Q?Q5s/2GJ9hvOvJSloze83ROIf69W9/LVsaMWobt3R0oNpAxGtsDzdKf1GW5ha?=
 =?us-ascii?Q?7qqw3LogwI5jhITS1xZv3stwIjQeWjS1AoaLSllcdmui/qBcsh6ML3yXM/yR?=
 =?us-ascii?Q?1qA3wxriZPElZJVgYUtDIY2nK6FR10gIUKhi94cMywDgsYmhJwK3QsNn43XG?=
 =?us-ascii?Q?JwxBUZU93UqAP5ys9O2ZGVL+zm37WNcFk2Buud44Z6/fs3CH1UpVHLv3ZYjC?=
 =?us-ascii?Q?ugkXwR/XeJx0ULMw0ZVyEOE6EDkIOgyj9D6D5Bcos1c21q3z2acqmEv/N278?=
 =?us-ascii?Q?gWxSNWA/vQMghD/fUInIDU2yjwyXrd1rt9OC?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 00:07:31.9609
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 587f837e-7313-475c-5a4d-08ddbdb36f44
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B374.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9265

On real time configuration with the null scheduler, we shouldn't
interrupt the guest execution unless strictly necessary: the guest could
be a real time guest (e.g. FreeRTOS) and interrupting its execution
could lead to a missed deadline.

The principal source of interruptions is IPIs. Remove the unnecessary
IPI on all physical CPUs to sync the TSC when the TSC is known to be
reliable.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 xen/arch/x86/time.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index 59129f419d..bfd022174a 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -2303,6 +2303,10 @@ static void cf_check time_calibration(void *unused)
         local_irq_enable();
     }
 
+    if ( boot_cpu_has(X86_FEATURE_CONSTANT_TSC) &&
+         boot_cpu_has(X86_FEATURE_TSC_RELIABLE) )
+        return;
+
     cpumask_copy(&r.cpu_calibration_map, &cpu_online_map);
 
     /* @wait=1 because we must wait for all cpus before freeing @r. */
-- 
2.25.1


