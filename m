Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F0DA99ABA
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 23:28:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965476.1356028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7hdy-0006Dz-4n; Wed, 23 Apr 2025 21:28:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965476.1356028; Wed, 23 Apr 2025 21:28:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7hdy-0006AJ-1L; Wed, 23 Apr 2025 21:28:34 +0000
Received: by outflank-mailman (input) for mailman id 965476;
 Wed, 23 Apr 2025 21:28:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hbtc=XJ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u7hdw-00068J-Cw
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 21:28:32 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20611.outbound.protection.outlook.com
 [2a01:111:f403:240a::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6a95fc4-2089-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 23:28:31 +0200 (CEST)
Received: from DSZP220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:5:280::12) by
 PH0PR12MB5608.namprd12.prod.outlook.com (2603:10b6:510:143::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 21:28:26 +0000
Received: from DS1PEPF00017095.namprd03.prod.outlook.com
 (2603:10b6:5:280:cafe::3a) by DSZP220CA0005.outlook.office365.com
 (2603:10b6:5:280::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.38 via Frontend Transport; Wed,
 23 Apr 2025 21:28:26 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF00017095.mail.protection.outlook.com (10.167.17.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Wed, 23 Apr 2025 21:28:25 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Apr
 2025 16:28:25 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Apr
 2025 16:28:24 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 23 Apr 2025 16:28:24 -0500
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
X-Inumbo-ID: e6a95fc4-2089-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RnRM+VxYt3teDBd+qWAPTCh4psRvYD+av9aqH/OWK2B1ViOMzKuaxKewSFVR6qB+RBgMM9xcmmjeP54AxHkv8nviLhAKXe6W/65qp7gmAT9M84/rBLN6bxAqCsmXTCjLFbn8a4yWVDRmwo+914N5D+migYYsdEiUpRNNnDzNKdZrgJoT3sqBIp2lMoDk4ABedTdQ7sR37M+RLeJGzVeO2y8gGvma4ZvANOnStu6cJ+QDh1yd64QDcU6VJBIa/K6YPpySn3YjhJeFUymKi1VV1smlAPAmxoLRuZnuIkuu2uLxc1COwFli8o++6cNjn3CY3DV+eVnGoaces2LjKdTo8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IhlLGEqvJTWZVsgLrt5Rcuhaxr+XmbrjR2vmegLLT1M=;
 b=WSDktLZsofBDiGSd3xCMHNc3XF0kpizNuMSUrICgCqActJZZtdxjutyHTzdnsb+evs7j4lluU/4jNY1ECDL1lOJE/R1FNJ5jDW5YfJJcpwGDvq70n+a+t6Mj/QuwwKUqcAXq5CJ4stT2O/etu4Baly4AmMZBP0SICEzyottyZ4mFmhyKX/g6J50siA3QhcV0HmmLC3eIkiLOcM6SqmOqrSwrh5aQtYdH4y5HE0gipiKSYJnpIFAhtMKBE+YX4ZbeFBjV9MgEzD4KtjjaoeCa/ebTADUQ3+Gec7UWP/U/uvfn0LMY5LLGk2XFlJmqD4Yo5ciNVc4PEr+BzJq7ukX9nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IhlLGEqvJTWZVsgLrt5Rcuhaxr+XmbrjR2vmegLLT1M=;
 b=ELj24t0fN7C85lEIR7pD8B8aU7HYi6KW/B6rhnBJ574kDjAWmvRHrhnTm4pzCN5xQWH1I1uXpwMsYQpNChD8k/ddh/1vUglehxQ6PXS1HYmGDbJWJcSFy3Hajc+CCF5c29kI0Ii1hkMcGNh44EHBJwaa6+j+H3+rrBZnE5243j4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>
Subject: [PATCH 1/2] tools/xen-hptool: Add missing newlines
Date: Wed, 23 Apr 2025 17:28:20 -0400
Message-ID: <20250423212821.42776-2-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250423212821.42776-1-jason.andryuk@amd.com>
References: <20250423212821.42776-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017095:EE_|PH0PR12MB5608:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eceecee-7dcc-43a6-406d-08dd82adc852
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Y1qusOB4NsBHJDEqbI7a/azYM47S/jjA8VZDpAXiHSa8msQdZZP0xAmRH+qE?=
 =?us-ascii?Q?LPfiEtftRkf4w4o+Z+V8RsH8B0MWo3XMHSGDdVC0fDK+ft3Tzrr7oOIYV3U/?=
 =?us-ascii?Q?Bg9OnrDV7cuk3LSx/3HTWishxjIaHkyJwaGPDoc4OUInfqo4UZ7sKJupuWyx?=
 =?us-ascii?Q?7JaJfnV2o1nc5G5isK+oQ7XFRF6sZWOcBjLcocaPJM7ZS7FQwL4a84ojcg0a?=
 =?us-ascii?Q?mNkNc8ujrFhhRpCWh+l+VugLzJF5rpL1r9zip8w8Nmr2EKC+/nfInwkfym9w?=
 =?us-ascii?Q?uT1bSoOQt0aUukUhqVfXVBeIirwe7tiBbXiw/2eAI4lxS/BN4jXvyBH6hp1k?=
 =?us-ascii?Q?kAsPfMO84fMobEiAUrQ/tb0uSoPVW+FyAU6tfTaZqTK/FwOz+A/99wLULFaC?=
 =?us-ascii?Q?hjcMTtw3jLlkWaN3F+XXNYaRag8Lj1hP2asHz6Dv5zttz1UsGamF7z11QBeL?=
 =?us-ascii?Q?b9Sic1AWdiQ6Sz5thX5A0zZqV4bvIv35JcZRlOzV08AF/kDSplEHKpFCIpea?=
 =?us-ascii?Q?BnSO2Q7zXGi9kXDX0QXTePzCLt2Ga6gXO3LChZOtBRcX2EbV68oHlKyuIrdO?=
 =?us-ascii?Q?sW/8dOS+VD7pArmkr9ezcY364j9tIOJLaAJXLwx4tnFhP7ickhneRMWaouy5?=
 =?us-ascii?Q?ZA5xF6TtdLfwbDW8baAgPMRNZU7E8eotepRNtmSkEeVp71CEHpVey9HW3kK0?=
 =?us-ascii?Q?6OYr3bZi+B2qJyQoQf9/4xcwZinQzM2/pht651XJUe/CEdUtLiiXuRTNYNvg?=
 =?us-ascii?Q?H7EMoIc/0h25CumbBtrr3kBQdjWpc1pgfITLF1TiMa6OYK+Ae5I2LEvontKg?=
 =?us-ascii?Q?3VIVxKgDyUj9JDiUtL+6Tm2DrIBx14PFQ7hw4GSBfdSi7uuzD/AFQh75Ilj1?=
 =?us-ascii?Q?vGbS96l9Ay1DTnge5TDT7knrGzye48MYfA8XiJoIo+xAiQVnER9XP8F9bJEc?=
 =?us-ascii?Q?JlYVGIHfpzc94dm2+1fOATEp+nwtis1ry7qptbu5RvqvHgkp5uuVgHugVu2O?=
 =?us-ascii?Q?H/n3Y8Ds5GBOKb7p17PGKOof1Zi8Ohcva27KbRRBH6iUfknPASuCn7jdZXsi?=
 =?us-ascii?Q?2Mf3WTCUqi5zLQ3voSdOw9FuLhgn46bUC/Tg8nUKIr8wBcqRbtu+m3iN9dfJ?=
 =?us-ascii?Q?hvbEr9CBfUt18Tj8J6JVabkkjlxRKSY8mqKb82uGxWGhZs9aeSCL1R/E6eq7?=
 =?us-ascii?Q?/opdGdIXg/U7ooppX1ya8+EKvIcZF7YWulstwvjg5+CK+wkMwHRWlQF9CAMN?=
 =?us-ascii?Q?0f05wne8j8fcGj9TzE4KXMI5qbG/GSK8AN/T6CxFyal/7jdNp9jG0Dz0TVrZ?=
 =?us-ascii?Q?06WoV0a9HzZihITTA9iRRMW3z0qOpdwdpS+F5pk43b6n+W/GHc70hJcJ5pKW?=
 =?us-ascii?Q?HXm5RdbfeFGL/N78NhB09Tk0vblLKw3b8z+HErsINJH8ue/ipJKeUL7VgStu?=
 =?us-ascii?Q?VMIU0pc+BTQqDHhN01u/6WYkiQqCTkPIXN01/N1zZ7jfC/9jfMN/2X/uJwir?=
 =?us-ascii?Q?OLJ0UvKAjGCcBGYY73loDSltYKpnW+P0x4u3?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 21:28:25.6546
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eceecee-7dcc-43a6-406d-08dd82adc852
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5608

Add some missing newlines to error messages.

Fixes: 284d5633be37 ("Tools: add online/offline hotplug user interfaces")
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 tools/misc/xen-hptool.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/misc/xen-hptool.c b/tools/misc/xen-hptool.c
index 6d6aec8bad..d850404e31 100644
--- a/tools/misc/xen-hptool.c
+++ b/tools/misc/xen-hptool.c
@@ -51,7 +51,7 @@ static int hp_mem_online_func(int argc, char *argv[])
     ret = xc_mark_page_online(xch, mfn, mfn, &status);
 
     if (ret < 0)
-        fprintf(stderr, "Onlining page mfn %lx failed, error %x", mfn, errno);
+        fprintf(stderr, "Onlining page mfn %lx failed, error %x\n", mfn, errno);
     else if (status & (PG_ONLINE_FAILED |PG_ONLINE_BROKEN)) {
         fprintf(stderr, "Onlining page mfn %lx is broken, "
                         "Memory online failed\n", mfn);
@@ -82,7 +82,7 @@ static int hp_mem_query_func(int argc, char *argv[])
     ret = xc_query_page_offline_status(xch, mfn, mfn, &status);
 
     if (ret < 0)
-        fprintf(stderr, "Querying page mfn %lx failed, error %x", mfn, errno);
+        fprintf(stderr, "Querying page mfn %lx failed, error %x\n", mfn, errno);
     else
     {
 		printf("Memory Status %x: [", status);
-- 
2.49.0


