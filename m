Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8146943439
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 18:37:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768987.1179894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZCJZ-0001vd-3L; Wed, 31 Jul 2024 16:36:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768987.1179894; Wed, 31 Jul 2024 16:36:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZCJZ-0001sS-0A; Wed, 31 Jul 2024 16:36:37 +0000
Received: by outflank-mailman (input) for mailman id 768987;
 Wed, 31 Jul 2024 16:36:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HDmI=O7=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sZCJX-0001qR-Ih
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 16:36:35 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20603.outbound.protection.outlook.com
 [2a01:111:f403:2412::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c014a20-4f5b-11ef-bc01-fd08da9f4363;
 Wed, 31 Jul 2024 18:36:35 +0200 (CEST)
Received: from SJ0PR13CA0056.namprd13.prod.outlook.com (2603:10b6:a03:2c2::31)
 by SA3PR12MB7857.namprd12.prod.outlook.com (2603:10b6:806:31e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Wed, 31 Jul
 2024 16:36:30 +0000
Received: from SA2PEPF000015C6.namprd03.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::d) by SJ0PR13CA0056.outlook.office365.com
 (2603:10b6:a03:2c2::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.19 via Frontend
 Transport; Wed, 31 Jul 2024 16:36:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Wed, 31 Jul 2024 16:36:29 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 31 Jul
 2024 11:36:28 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Wed, 31 Jul 2024 11:36:27 -0500
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
X-Inumbo-ID: 0c014a20-4f5b-11ef-bc01-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sCtj+J6IUh7krBJtSCQ4LNE50Bmk3wEAiJw0fyVSYH+bG24beJu4K9Up5qAoe/10IgDfV2wM/H+L9hj0IYH0wPb3nOf/s7N6ktIL0puGwiMnPTL9Vx38872NvzCGb6cm25o+64QgpN2KmSrpWCANqy+ue8OTEcYk1hf2ZGIkiO084mIfV0eclVbmu9JXGnYhxE3z+mZb5QlgxymfPAlCWFPjsHEogOmXYhS0mFiiQrUTTYFbjLTwSDpfROuPuXB41OXIq2v05/BPOsk7j3MKPNGwERPZWxkKe5N3TcBGkJbNi+ms7aUy1wzKNLFS5d7ZowLHnDA6gFwlwvLBZXvGpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+ffrGBbLcJc5IQXajyY7EObPHfcG5RNWDF6/K1mPvA=;
 b=JwbRGLJxTpOIFSZX6VzPd0XFgE33Vv+sQ5q3K0Bcn5VUW45toO/Lm9KG2FgN+dJNrwlHW7E8JhtV+KUFryblovEHJtFVUkL17I1cxzncuE5YFgeGguhlSts1oc5gkzr16ZFoeN4Ah0D/msMmCS8ePmllo8qJdf6xQLli/D4rK4C0VVHcrmGH7rsBX+oCSmM/TeZsAIEgt+Uj6kkjrDjxUDhXvI6/OxAIWRA05/h120o6esLpYwGMR23IYVW8mbCP6vZpSUeOP2mesOZtFzEDoQSbB+ekDXMOmF59HKCRyvZSF//4N5aGmPK8PZTswsEvi+hUQc139h/CMIrxSRRXAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+ffrGBbLcJc5IQXajyY7EObPHfcG5RNWDF6/K1mPvA=;
 b=XpSUUgzjAEaTPl8eqoyRlS2ciVbm8YqnMwuuxC1vL4CG0/7EYnKT9yetnmr5HyqalYrWu1AFcGbmwmx9QnfabSoTLv5Pxq3rNfRT5p8JqsfMPH2gCBjf1hK0BjOudB84GGrPI2BQAIoDgJL1pZQ9TCZYNVzSW9D3L12TEwnYzVk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <sstabellini@kernel.org>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <ayan.kumar.halder@amd.com>,
	<artem_mygaiev@epam.com>, <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>
Subject: [PATCH 0/2] Introduce functional safety related documents
Date: Wed, 31 Jul 2024 17:36:12 +0100
Message-ID: <20240731163614.616162-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C6:EE_|SA3PR12MB7857:EE_
X-MS-Office365-Filtering-Correlation-Id: 85328614-d98a-42bc-5c9f-08dcb17eedf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Rt4TtxBaV5KDT2ZIpYKc1i+LKu7PYRnNN31zjrVzs5FJdd2gE95zHxgHJ7wZ?=
 =?us-ascii?Q?TOMWrS4DDIcTcmkYRYgTlrXbQXprU/JDCbchkQzvSh29OEtsQrvljN2iwHBt?=
 =?us-ascii?Q?huUkL1S6dBpBzrWq0A0QPoMtOct0w1gVOELC54rUyA7PwqWbyQ2pLwOO6PTl?=
 =?us-ascii?Q?GJneM5dHJCFsLaoCjm440Z6eGEjxZqJ47B+KlifkWRs3I7dCI+Z+jMlFqfP9?=
 =?us-ascii?Q?akuR38X97RTAanOqWbZkvObgHRYJgK8YSm8Ryc65cstJPxFrTeuB0HAre3Yy?=
 =?us-ascii?Q?1j3FGy0MpGLnQjdDcub8tl/I9KMhQwbnBmffSTJKalYKRlISRat4E/S4X/Dw?=
 =?us-ascii?Q?2cU18BORl+tXQEXHXZUO/Tip2Ii3hW5rTBh4hm3ubmE8BI/Tfc1NTi2m+5rn?=
 =?us-ascii?Q?9NjFOTG/qFF5LZXfaCb6cj+636coJ3WmqCI4dVvyQweb23bksrekXpSzz75u?=
 =?us-ascii?Q?500jTgGJUROA9HBKC3nIYY9fqNtFd+9/mLRkNE0U3PUXAxAOXvOcdTshUE3q?=
 =?us-ascii?Q?/G2HwKM9U48QfZyVvRT1lj2RMTvdEEOQSti2IH+WQtjUuMn3lnfvpX9p4YxA?=
 =?us-ascii?Q?R63Dg7sPZe+MVpnb7pBFoOjxg68By3oXhrRGIJrwR/iDfFe94zC4T18LM49+?=
 =?us-ascii?Q?B7NAhlGkcJRtrV84u0P62MV0efA19NEYFl3KeuTZCAX3gzL/M+dHhMKtRo5m?=
 =?us-ascii?Q?F3Azgck0MATJG9XOt1O9WDoQhqzVeMcdOpwdJkld4br5igW76rE4jqINhNDg?=
 =?us-ascii?Q?NG2WqEaUuu0HsCpwEE9m9wP35C0mZaCksw8yXLtLHbp7RQoLIKYz4TQ9Zs2q?=
 =?us-ascii?Q?6TSiCfmIzhsfUDnsluVZUXOIdwd6dgYNXP2gPLZxtXaxNYHviFNuv5lfb/rE?=
 =?us-ascii?Q?ml8I2IUdZK6mcYH5TgKYjY0HIxmOjMdjWayDo6Eh3pwtcX+9NEXGLhJjuppo?=
 =?us-ascii?Q?bQDaTnvU417349ndIVYXSlKIbWDy4nKZfLqtCTE21bevyv5Adzu96X+e/yuH?=
 =?us-ascii?Q?+IEq1dr2t6/ZV7RsSliwW7DmSgzsAjUNaXT7pJX4ePvtG+OLN6AI64Na8jpO?=
 =?us-ascii?Q?A7cCXcvFuz6rogMO3LzEi7sJmOSzMIoPqZFspGTMyZa2LjLY1nxFYgIANbkg?=
 =?us-ascii?Q?//yHQGkogAxLV5w+zCJKdHWv1Dt/Jw3RizSj9zzeucJIgM+uppNgPcCdwGed?=
 =?us-ascii?Q?9pbHEld0teLizsOMW/xOGyqV8jf33yjEgsu73Pmma2aNUopZbdljsjEC5MKU?=
 =?us-ascii?Q?HvpcAbXiff1iIabZ8oX+/i6spoXn37lgQdDmtDlnkp2QWVLYU+VHU4XKtCNL?=
 =?us-ascii?Q?FevGXHKuB0STpR3Tf9ogyRXvsoNBTWXnHxmb40GWy5Cf3bcj0cBUDrq7CHUa?=
 =?us-ascii?Q?TiKFZQtP2HXkG/9532FjLnTFbI3i?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 16:36:29.4778
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85328614-d98a-42bc-5c9f-08dcb17eedf0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7857

Hi,

In the Xen summit, we presented an update on Xen Functional Safety. For
details, please refer to 
https://youtu.be/eFRTHSGDMfQ?si=sYOdYfDI7qsgkcjE  ("Xen Functional
Safety - an Update - Ayan Kumar Halder & Michal Orzel, AMD")
 
We wish to start with upstreaming the requirements.

This patches illustrate how we are writing the requirements and provides
some examples.
The support level is experimental and it will be maintained on a best
effort basis.

Ayan Kumar Halder (2):
  docs: Introduce Fusa Requirement and define maintainers
  docs: fusa : reqs: Added a sample of requirements [DO_NOT_MERGE]

 MAINTAINERS                                   |   9 +
 docs/fusa/reqs/README.md                      |  75 ++++++
 .../reqs/design_reqs/arm64/emulated_uart.rst  | 240 ++++++++++++++++++
 .../reqs/design_reqs/arm64/generic_timer.rst  | 146 +++++++++++
 docs/fusa/reqs/design_reqs/xen_version.rst    | 207 +++++++++++++++
 docs/fusa/reqs/market_reqs/reqs.rst           |  77 ++++++
 docs/fusa/reqs/product_reqs/reqs.rst          |  64 +++++
 7 files changed, 818 insertions(+)
 create mode 100644 docs/fusa/reqs/README.md
 create mode 100644 docs/fusa/reqs/design_reqs/arm64/emulated_uart.rst
 create mode 100644 docs/fusa/reqs/design_reqs/arm64/generic_timer.rst
 create mode 100644 docs/fusa/reqs/design_reqs/xen_version.rst
 create mode 100644 docs/fusa/reqs/market_reqs/reqs.rst
 create mode 100644 docs/fusa/reqs/product_reqs/reqs.rst

-- 
2.25.1


