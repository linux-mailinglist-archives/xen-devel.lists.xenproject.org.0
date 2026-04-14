Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGPgHkwi3mkIoAkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 13:17:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB05F3F93B8
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 13:17:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1281620.1564471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCblc-0003nS-C6; Tue, 14 Apr 2026 11:17:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281620.1564471; Tue, 14 Apr 2026 11:17:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCblc-0003li-84; Tue, 14 Apr 2026 11:17:16 +0000
Received: by outflank-mailman (input) for mailman id 1281620;
 Tue, 14 Apr 2026 11:17:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wCbla-0003kX-Md
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 11:17:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCblW-006NYf-KA
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 13:17:12 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69de2233-bab6-0a2a0a5309dd-0a2a450a9b02-12
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 13:17:11 +0200
Received: from [52.101.53.28]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69de2236-ee98-0a2a450a0019-3465351cdfb0-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 13:17:11 +0200
Received: from PH7PR02CA0015.namprd02.prod.outlook.com (2603:10b6:510:33d::23)
 by DM4PR12MB6229.namprd12.prod.outlook.com (2603:10b6:8:a8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 11:17:05 +0000
Received: from MW1PEPF0001615E.namprd21.prod.outlook.com
 (2603:10b6:510:33d:cafe::20) by PH7PR02CA0015.outlook.office365.com
 (2603:10b6:510:33d::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Tue,
 14 Apr 2026 11:17:05 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MW1PEPF0001615E.mail.protection.outlook.com (10.167.249.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.0 via Frontend Transport; Tue, 14 Apr 2026 11:17:04 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 14 Apr
 2026 06:17:03 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 14 Apr
 2026 04:17:03 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Tue, 14 Apr 2026 06:17:02 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U/3gVNPelSFCvbA+7uPBXVJItZgJRePU5583/z/uRET7LyKOxNi3pAPelqHPYUlDRaKnWSB5baQWaUiixcxIopFDbYfyyAiaoug2UU4E7SN6ygqszh6M0+a1E/Imb3JjX3AfdXhHQK8Q8e5vpO88a6K0X0buvxUTUTT2Q9HV5+S9AFLSqVNGe1Gm8qLfKjgbQGlaekOki6e7mRCt2755MlJptP4ZLdY7pBxW2eUYAruPI8S0nWF611OxE3+g/BMKXqNN0f7gKGAV095M/onE1oYG7bBGfzknkKEMN4ctUY89x2/AUIidxUPGGZKS2szjOMsc0Lpag8rDhfBD89a7ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O9IPtRn5b3drkQIDroJacJeGO+V1t6gl2/Oa8o8Yyyw=;
 b=HEm5Elma5b2c7Y3KriL6gsckKHwr27B14wQtrokW4gS1MkPjINdkYiWPXSLbq7QdZCH27kYMsS5cGyieUcowFTU8KZ65UTHFgeWJ22RWBkRGJ48gwS3LGP60ZlHPHi68qzOHai9j5uRWG03bFwo4+84VZ2eEgdk/ri4VDw5Xhs07V3dUH10kFv1uerjjnutKxvhDrr8Vv8l1rvauimMTdgvyaIm6olgXT8/P+eam7Lsd9IDIDfwqBDX0mc4a1A+JSc6LV8K9SUSCDe1Lfmj1dgcXaWe+U3t7mtRht5jdlrKHd57Yw1YgKkU6u94j/kTgZ8dxnVNHmrVdP+T79n6I7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O9IPtRn5b3drkQIDroJacJeGO+V1t6gl2/Oa8o8Yyyw=;
 b=tCcukVFlmAsPA9ab4C7p3Bnk2VT9zv/STdV/CStmUx59UwMnEjANfP0DNZenoSX0LT75xEVJzv8ogmuPU2Je+DLOXrMJ1QZhuL32KmdY07KyYrOCiwt0IaHNS5B71YO5OzsEaVpx9/fYidc0qnS1kllMbhv56cqnPWIvzbRMnDw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>
Subject: [PATCH] automation: Extend eclair-ARM64-allcode and mark as gating
Date: Tue, 14 Apr 2026 13:16:56 +0200
Message-ID: <20260414111656.72939-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615E:EE_|DM4PR12MB6229:EE_
X-MS-Office365-Filtering-Correlation-Id: b530cab0-d318-4f3a-2a35-08de9a175bdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|18002099003|13003099007|56012099003;
X-Microsoft-Antispam-Message-Info:
	65jzoNZna+gj+YuDFw/BGp/hO9BjGs5i69RavK5VE1NRTgZMr5g62QeQovNSiypPV4eMZ9+ez2EV181M8jfkm3npc6ynu6L5gjDp2dVMq/BfSFENMl5LPDzpahBfAHrs+Hr4kSSLWSyo4C1ZAhZy1ghCydW454SVlqkiTZSYgODK8WojSosBMVL5mLKcwbBtIMORTRuW+w1SbjwKRTjXHJk42Xtir1SK97hNjN+M1xPDAeJqqGBGkKaptob7ntng5N5cEXL8/xhYU92YRRYkDDqVeCeRKReUM4HQJ3Hf5Qx2h878tPHmIZ9GjpSx5/5sj99GOnoi2u1/eJvIunwSFFBacWJ1RbY7rc9V7oKITw+tQOrsOhxpUojuxCX77kb6liEPinYZtHhblAYYzDYFVdtJPKcgo0hO3URfycqhh/uH/UYaEtXSMxMVjN1hWrb4TNIK/spFSAtR/2blNGPy5nq8rBSBFe1ckCfZeH3qOhDJb16tK6wAnAgp367z0SnRqG9zDMkV00AeIFIXCGybzxKqXyGwNI3PQXG988JUZQjg/E1XxkfWMpjJVuE3c2Qcv4T9aUbodg1K7cOArO9bqeN65mvY7P2snYc63BaBzFP98MrjMOz2fsQ+5ZmwGG132D/T2EzEBvvprRm3FWROoOFecJ5P36sg06K6kf8NP4U/P1sy8NInLIcK0oz7o6eUvZwb/J1lJiu4TY11xJn4EQqqBLjXQh/EgV8F1UbJRTE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(18002099003)(13003099007)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SOx7PI+OQKZvNTkohRXCL+Y9YYewckS64OqDFo0Yr382C9xdW0cJGCvfOTD3YXDrqxE/rD1GCGzzCEZ4i3ki0zBdN9k54kMfwAsvRtq4Kkswnnx2tFldRRE74iAovyjpFHc8UTblhqSBd+xQWbPLbttgzKog8yz9qtI4bf8pIfgXSL4bmISHzqg/HdMaKZx0kMxCSOvhyNswF93Pqbd1yGEVdOOBTz1nYcuzoTRMbRG/9z2wHBAmCUieSWj0BnGglsudiXKIbVUO66L3HmliAoeIHG36Jfx67mSUuKibRKxziRq8RtdjVT4upQty3/PkOwwkg8JfbqmjsOftVWp+28kqD7km2tQsm4hi3f7d4WTGk+rTUZfcNnsT0H/uUJ9SlZOVb/SmusfMcaI+vldq5Aro7gWNyzXGRtVJgjddwdwRevxCzds27HXTOCrJs3Cb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 11:17:04.7900
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b530cab0-d318-4f3a-2a35-08de9a175bdd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF0001615E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6229
X-purgate-ID: tlsNG-4011c0/1776165431-BDD520B1-5C39818C/0/0
X-purgate-type: clean
X-purgate-size: 994
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:michal.orzel@amd.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url]
X-Rspamd-Queue-Id: DB05F3F93B8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Extend the job by enabling static memory, static shared memory and early
printk features. Given no more regressions for clean rules, mark as
gating.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
https://gitlab.com/xen-project/people/morzel/xen/-/pipelines/2451527401
---
 automation/gitlab-ci/analyze.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
index 4e9af9d60224..b3f99f472d9e 100644
--- a/automation/gitlab-ci/analyze.yaml
+++ b/automation/gitlab-ci/analyze.yaml
@@ -149,7 +149,11 @@ eclair-ARM64-allcode:
       CONFIG_STACK_PROTECTOR=y
       CONFIG_UNSUPPORTED=y
       CONFIG_VM_EVENT=y
-  allow_failure: true
+      CONFIG_STATIC_MEMORY=y
+      CONFIG_STATIC_SHM=y
+      CONFIG_EARLY_UART_CHOICE_PL011=y
+      CONFIG_EARLY_UART_BASE_ADDRESS=0x0
+  allow_failure: false
 
 eclair-ARM64-testing:
   extends: eclair-ARM64-allcode
-- 
2.43.0


