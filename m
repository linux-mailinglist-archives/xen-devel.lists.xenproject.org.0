Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9ECAAEECC
	for <lists+xen-devel@lfdr.de>; Thu,  8 May 2025 00:47:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978859.1365685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCnXm-0002Ai-0N; Wed, 07 May 2025 22:47:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978859.1365685; Wed, 07 May 2025 22:47:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCnXl-00027w-U3; Wed, 07 May 2025 22:47:13 +0000
Received: by outflank-mailman (input) for mailman id 978859;
 Wed, 07 May 2025 22:47:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sPgg=XX=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1uCnXk-00027q-HD
 for xen-devel@lists.xenproject.org; Wed, 07 May 2025 22:47:12 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2414::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3396a786-2b95-11f0-9ffb-bf95429c2676;
 Thu, 08 May 2025 00:47:07 +0200 (CEST)
Received: from MW4PR04CA0300.namprd04.prod.outlook.com (2603:10b6:303:89::35)
 by MN0PR12MB5906.namprd12.prod.outlook.com (2603:10b6:208:37a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Wed, 7 May
 2025 22:47:01 +0000
Received: from MWH0EPF000971E4.namprd02.prod.outlook.com
 (2603:10b6:303:89:cafe::f0) by MW4PR04CA0300.outlook.office365.com
 (2603:10b6:303:89::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.31 via Frontend Transport; Wed,
 7 May 2025 22:47:01 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E4.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Wed, 7 May 2025 22:47:00 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 7 May
 2025 17:47:00 -0500
Received: from xsjstefanos51.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Wed, 7 May 2025 17:46:59 -0500
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
X-Inumbo-ID: 3396a786-2b95-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jcbApUvtbgwqD43yVdf+Dd5YV8ztzgpvefJW4/eOQ05uieWdwst4oAvc1V8mJH5uFeDm9tkFprst+7Q30f0P5e6LSDs6fzMB71+o1VW1AQjPPEIg6NNTg7ivp4a10HhtVZDPOodbRGtiCJ6tIqWvY1qqzKD6psa+tw67URFCZ9sX4/ziwwojxGJtO7+9nOzakvMosD3qzIvSdvEjabDQGz+WAWheV8+OU26PTPiLTeMEIDcFRb0onqFiSoLQQhP4a1stRHyBgBU3yfP9ldl+/5BybBsmdcG8RK7B6kOn/JNqxjdWRw9RjCmmeFByAuBZFxt18nFJIvWk9JGCiup7Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9h1zJoppazSV/QiQJBgP0elD4xcBB4mfIivoo79ocI0=;
 b=IQEUVCUYNA3kRRY89cnn6x0YvicrwIG/6KLNHNixafe13A1Y2Yyc8ypsKptb3f/jn2m5N8VOAly3iy0tOQtSF2Fvm4X3BLZGzhqK60rA12hPZmrCb2wMLOr3qqzufYWCR25GWY5Pf6OvwvpHEQ+Qe9z9SRyGWf8Uadi66IfhlfQQYZ8vpNfnltaDDuITd2/wzSdaBfEJ9cuMFuAbiwm+bdZUBwBsE24YlxAVjrPi8LMWG6AXvST/M7yrszGbGkBE26P6T03TIhkE0rZ4JpNw8l3TPsD1UMarbff2uwfAWzjDs068De3TB2G3ltDEsuGcrQe2n37e5Imc1iX05FwxjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9h1zJoppazSV/QiQJBgP0elD4xcBB4mfIivoo79ocI0=;
 b=hFC1MAPbVv/5K7kNaJLfGuDaXWuoVW85dGmP9o+DguVigMYVwKq5FaViYkmxHMKyVIXPjYFCbbrxgjVi6L7T6GVMUVyJff65lg4Bd31vEh/TUyD1KcB2rRF0ZYYdy9QcF1CMwJZkxi0uRGUpVPhoZHuFYUDOjlZSx1RpxpTXi0M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Federico Serafini <federico.serafini@bugseng.com>, Victor Lira
	<victorm.lira@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	"Jan Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH v1 2/2] automation/eclair: tag Rule 13.2 as clean
Date: Wed, 7 May 2025 15:46:40 -0700
Message-ID: <aaba25c80b365fe0177ab976579f9a4e2cc3d2c0.1746657135.git.victorm.lira@amd.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <77f9c4cabe607ce4024013c604bc790fb629d322.1746657135.git.victorm.lira@amd.com>
References: <77f9c4cabe607ce4024013c604bc790fb629d322.1746657135.git.victorm.lira@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: victorm.lira@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E4:EE_|MN0PR12MB5906:EE_
X-MS-Office365-Filtering-Correlation-Id: 80bf0b4a-fd3d-4aa7-9547-08dd8db9148f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bUpDNDc3L2lFSDRiczFPZXBXMEhQUXp4SkhVVVpXZTdZZmRZMlJkNWxiMThx?=
 =?utf-8?B?MzBGSWk0ejA1OG5KZCtIVkZVV0pMY0ErWFJCVHZEcCs4MWhnS2hBRUNJMkx0?=
 =?utf-8?B?UlJPNmg4Y1doVlZKcWcxRThiSEtwcDlYTytlUE5XbExLbDJGNXJDcG1DcCtY?=
 =?utf-8?B?VVlGcytsZzY1UFFtcklwK2xueXdUREFRMWV5VzJvd09vNlQrNml1QTk1TS9w?=
 =?utf-8?B?ek0xTHFiNTNmNlQ2MmMwam1zaVFyT3pjQ3FJNGp6Q2J3OWJkZExWZlVycmd1?=
 =?utf-8?B?WGF6REJHRHZnNkZveTZwL0lRSkh0ajU3RWYrMExQbGU1Wm56b2RYeXdXdHdw?=
 =?utf-8?B?YWZDMmhySHlQRW5KMGI3cUhPVCszNFJUQzlmRVdDWVlqNGJhdm5PaU1GSStS?=
 =?utf-8?B?bWlNUml2aUNQWjhzL2pjaUpuL0RENFZ3UEhqbFo3VlY5NVFtWHpIdkxKSXNz?=
 =?utf-8?B?bmtWZjNGSnZSMGhKRG1ycDg1T1hLaVA3WGl2T3hDdjNWNmF5cFNLSlE2WXZC?=
 =?utf-8?B?RDF2bTFJd1gwbzRzYU9KZkhJSWp4QXdicWJXaXlZaDdVU0w3anBZUnp4eXVo?=
 =?utf-8?B?RUw0cG40aDNlYmRsb1JLd0pHQnEwNE5kSElDSzJEKzNIeU1hN2NPdm1BcGU3?=
 =?utf-8?B?amFKTmVQWHFWNG1XTGpvNjZUODJLQ2x1NWtmaUNSYVpBK04vSnpwTmxRMGhW?=
 =?utf-8?B?R3JERkZGMnVGbFJCVVYyL3grQWRnaEdzNmlzQ3EvVURZUmlWeC91aWY0WTNB?=
 =?utf-8?B?K2JXcnZtQzd5ZmFFa0cyNEF2L254KzVlSGxQQm15clZ4aXl6N1lId2NPTStC?=
 =?utf-8?B?OFhYZWdEektqcEpMbS83ckRlaVNrdFRyR2lLcUtUaVVVNjA3QWoreW0rVzZH?=
 =?utf-8?B?RWowN3RJeVRYdlZlcUpNV3RJWmNNSXFVRkw5clpUYzRzZjUyMTRDR1RvYWZT?=
 =?utf-8?B?VS9CazJGMmhKWFRjdnpUWjZDeERkakU4alBHM25GQk53My9KaTVYd1F2SWhi?=
 =?utf-8?B?N1RXb3plWm9qeFA5NE9RbldxQytXMlpMWjU4MDJJRitoak5STGV5TVBKRzhY?=
 =?utf-8?B?eDdIVGFJcmxkQkp2VDhFbCtNcjVjU2M2YzE4OEY1QndqL0tnT1FnZlpEMk4x?=
 =?utf-8?B?UlY2Z1J0Z1VSSkE0KzZkU0FtN0RIQ3lsdnA2VjkyWFNsMmJKaE1EblJUallr?=
 =?utf-8?B?YjZ6RFdMWUFoUW1KMFkydFdUbllBYUhNbkVwY1JJSlJhck9OZkJhNVBEU0Vz?=
 =?utf-8?B?dzVocXlqdllGOC9td2liUGQ3RUtmZnlQS2Eva1kwV0ZIYld3T2ljbHpXbUc3?=
 =?utf-8?B?SmdrbTRXdnNwRWpDeHg4RWNISllxNWNtbTZFRE9pNTgvYVhKaU94MGVxZW50?=
 =?utf-8?B?cHlNbmo2VVJEdGxxbWhnQ21tQ1RqTDlhWkMwTnkrU0hJSEJIQjVOWFNlYi94?=
 =?utf-8?B?K2xZSDNPOHc1Yk9kRmhhdXVSZmJ4OHRtRklEdFpsMGRySTF6eTB6S05XMSt4?=
 =?utf-8?B?NDZOMlRsTlFyNTJkaDY0K0dRMjZIZTAzbFl1TmVCT3g5eU9JS2RTZTJBS2dE?=
 =?utf-8?B?MkN6K0swSytlU3NjVGJDbjQxYzBqZGY4eWkzbkMvRDRPVmVWbXZQZGlMSzBH?=
 =?utf-8?B?dEl5bnB2ZGVDZ3pieGl6TWQzM0c5RVRYRzVKQlVtWXdOUmg4WDJLZ2g1R2Zm?=
 =?utf-8?B?M205WDVpcDZweFdPbGtVK0JVQlJsdmREbldJdzAweDNzRTBucmVsVHg5eVdU?=
 =?utf-8?B?Zk5ub3Fpd0gwYmtWOWhEcHE3cWFrMXdCbkVUQjl2eWMzUWoxY0c3NmkyTjkv?=
 =?utf-8?B?ZmZTQ3NsVkRzT3Y5K04vdEE0VUhtbGFvRllLY3I3NThqMEZHNDNmMUNYM3BH?=
 =?utf-8?B?TXlaUHJaN2dVSi9xWUV5cGFrOGpqQ1NiYk5TTDROcmcwSCtSejVmOHJDbGFw?=
 =?utf-8?B?dThGdDVCeDFhcDhLREhNQ21KczBHOWpwcmxmMkd6Q2JQa3VFUjlxd0IxUzR5?=
 =?utf-8?B?TXlPVC9PbkxjSE9XUUJzMXNPRlliVVBEVEZCYmV1OE1MQ1J5OHVrRXR6LzVw?=
 =?utf-8?Q?/w63sd?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 22:47:00.8442
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80bf0b4a-fd3d-4aa7-9547-08dd8db9148f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5906

From: Federico Serafini <federico.serafini@bugseng.com>

Update ECLAIR configuration to consider Rule 13.2 as clean so as to
avoid regressions.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
Signed-off-by: Victor Lira <victorm.lira@amd.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>
Cc: Michal Orzel <michal.orzel@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Roger Pau Monné <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Federico Serafini <federico.serafini@bugseng.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>
---
 automation/eclair_analysis/ECLAIR/tagging.ecl | 1 +
 1 file changed, 1 insertion(+)

diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
index 1d078d8905..c958d3ed59 100644
--- a/automation/eclair_analysis/ECLAIR/tagging.ecl
+++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
@@ -63,6 +63,7 @@ MC3A2.R11.6||
 MC3A2.R11.7||
 MC3A2.R11.9||
 MC3A2.R12.5||
+MC3A2.R13.2||
 MC3A2.R13.6||
 MC3A2.R14.1||
 MC3A2.R14.3||
--
2.47.0

