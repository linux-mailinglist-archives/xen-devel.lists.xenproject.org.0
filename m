Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPyGHgLPhGk45QMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 18:10:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 118E5F5B0C
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 18:10:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222285.1530307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo2rm-0004eC-71; Thu, 05 Feb 2026 17:10:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222285.1530307; Thu, 05 Feb 2026 17:10:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo2rl-0004aD-U6; Thu, 05 Feb 2026 17:10:05 +0000
Received: by outflank-mailman (input) for mailman id 1222285;
 Thu, 05 Feb 2026 17:10:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eiMP=AJ=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vo2rk-0003nM-2S
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 17:10:04 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81d1ea6e-02b5-11f1-b161-2bf370ae4941;
 Thu, 05 Feb 2026 18:10:02 +0100 (CET)
Received: from BN9PR03CA0153.namprd03.prod.outlook.com (2603:10b6:408:f4::8)
 by CH1PR12MB9671.namprd12.prod.outlook.com (2603:10b6:610:2b0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Thu, 5 Feb
 2026 17:09:51 +0000
Received: from BN3PEPF0000B36E.namprd21.prod.outlook.com
 (2603:10b6:408:f4:cafe::e2) by BN9PR03CA0153.outlook.office365.com
 (2603:10b6:408:f4::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Thu,
 5 Feb 2026 17:09:51 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B36E.mail.protection.outlook.com (10.167.243.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.0 via Frontend Transport; Thu, 5 Feb 2026 17:09:50 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 5 Feb
 2026 11:09:49 -0600
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
X-Inumbo-ID: 81d1ea6e-02b5-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iOjw3ddZ57njugMK2f9y1tn4zVqtQoaRIEsfBEnOj7r5ztDnqOkO6MRAQ6+MFLUWg5qyYOqz9qomPZEHcwSWQYY+r1/WLyoZQPBIABjGjQEPqGJ7RL1kJpGXgji6Vhbr6E8IWQ3bfP4Hd9Y0pp1ELQybUX3zIaWEzQcxOd2sC8F085VW/o08iP9Wvho+wNvcLpScyuYCgfvu0yuE+polczTWn5HAdIofxvjmOb/wZxX3fj1kOGg6mJ25QrJSYrhCt7ZQLU5I+cSHcpneusIQmQ281c/wpVCl0BrVlJMgi2Ej0HAKWm16lfvrw/tAi4WahgiuRbiBiAH8Sg+GvRU1rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mflu5yg/x6sFMgT8nkXWde/8IdOHVsgphCYV4lo/bCM=;
 b=R8ZvBlsLB3J9mZqqVtatqGfpe2b+0f+aihjJhTOrsAVtfkiMTj5/6ei5diEgYI25jmWrrhqc6aMTkIgdSaoA4dJMXU08a0a/X5seG3PUw7GkdSGTew7Ukr0PA1dkfHMa72sFuuRComKCE2C0EF35mfljdsHZ9ddnMjFGTonII8H7Tym1uamInTSD8SBUgXtFbb8AXTvtTR/raDKS8YbVJDAnw4nVL2sqFiG2yDliONsyYTTH4h9gLZcZdZf4djD0vvZ9Lr7EYW6VXrmoeiKm6EX59h7MDuTDYnbpAfylw7cDcsEK7Neps3H+VlZTAPTSBf2vyGZMAk8xSOZrGfCx8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mflu5yg/x6sFMgT8nkXWde/8IdOHVsgphCYV4lo/bCM=;
 b=tNRbKtTZobvdc4M//bb8VfkKrxPDNABXrykVs3PoRVMkuTHFt0cTfjlU2NO5gh3mI9nr0TdInu+p86Y/h5iN417RSJaeemZEGym+MqrqrKaQ4DeLaQAsG0zDOfFRJbLIksllhNoNiSfq18ouee6ytcUYLOBDgDdTdSEI2W1xQPM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v2 1/4] x86: Reject CPU policies with vendors other than the host's
Date: Thu, 5 Feb 2026 18:09:19 +0100
Message-ID: <20260205170923.38425-2-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260205170923.38425-1-alejandro.garciavallejo@amd.com>
References: <20260205170923.38425-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36E:EE_|CH1PR12MB9671:EE_
X-MS-Office365-Filtering-Correlation-Id: 695867bc-d7fb-4fe7-566a-08de64d95fad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TUCGFBGjf9qY8mvleQz3Xm5ndTNUTAKywaFNivGqXq6ruro8TeqqKB9qQOur?=
 =?us-ascii?Q?uohtBlqiNg6MTFODSmUSrFMuYYCuKBEdE09vUXNssUUDNfBp6SLF/jSgY3ZI?=
 =?us-ascii?Q?OVg8JYk7W3PnTK/mpPamOjM0XT/xWDNiaXPunDrPsohZElnxQ/sSJS0Q9Dbl?=
 =?us-ascii?Q?keC1u6M+lftuTCpMxHN/Q2NyBMYvSFxz5Dhcq2oS3zPHfsc0/LOcb3ulCAUt?=
 =?us-ascii?Q?pZzhRkLwmSke1AStnejLyY3Qh7DexqsiofXc867WwoL38m2G9vqcNt3KUrWq?=
 =?us-ascii?Q?uWfdywuGFwQee4c4P0NmfWkVLrarSH13KHft+EBPI6EJ8b6iQewLTIs+KWOG?=
 =?us-ascii?Q?TxjheFSCNuwP3HrXEj37zLU0BfixNDCU3WYTp2lE1KFXE9DqnjPjr2fiftvP?=
 =?us-ascii?Q?+yggpztznwIhPmdqmvYvDC3Cr4mCUFEDnCdae8WbCWjgpqVLVoHCozgvNbQi?=
 =?us-ascii?Q?BKwknjM/N2OUymCT1zuglz2F0tgn6LRm8fLh9NPHM8ENu5hpSdnMwQxs2Lef?=
 =?us-ascii?Q?inWB8GyAlN7yhBUt6TPhgKt1AUK9XhkDRmwn8seOhxC4D8K2pF6tdMo0WkUM?=
 =?us-ascii?Q?bNNfs3FRH7kXkmkr8WUEVbjaF7V3SuwXyaYKJmZdMcYzUB8TAWSoY1dzYDVv?=
 =?us-ascii?Q?zyEBlDCt+BREb2FnIhEG00k25CyUZ4LFyjfnTvJSH3l0aW1tDF3sIz4WZukw?=
 =?us-ascii?Q?/pVm1sVgh2SprJ5CQ/QCtebq+KbyojseS42oMYwg+LV2IS2UoExbsdqLjuvJ?=
 =?us-ascii?Q?qk9o53wELic8aDstsG/xJiOnUsc/49JHutjsuTwy6oHQng7TVt8CXZREWAfn?=
 =?us-ascii?Q?aJdZpqrcmkkGdWYw0kHcRxhda2cUhen04DGtp/XQRFIwTLAdUBF3+lV3HLgA?=
 =?us-ascii?Q?fkiJFzOVTBrDhjVZITv0IX3sL1TSrK2eSZ4OfmL4mrOs8rM7j0M/FoZn1JEG?=
 =?us-ascii?Q?4e51JyFVUpnMeMh0SOsDvlO9O4xdFYVsUtJ4FHfQGRFP1UIVuJgLtRiSdpS0?=
 =?us-ascii?Q?h8Ui9+5w3Hc6xgdK5Sme71GlIYEDoDBv6rjk8gHqJINmNQ93izM1gCAa3yCg?=
 =?us-ascii?Q?zIcgeDboCFkcH9cX8ON99dWR/cEn86tS+HMh8GlIbxV5k7oyFBPqBWUZcjlp?=
 =?us-ascii?Q?eAKFVlHA+1gWkNCJgyId7WZppKzZqQcnh8ZH/xe0nD1hkMpVwroLlbcTeJ9T?=
 =?us-ascii?Q?Kp984RiyYEfk3tT7F1DBoc4dzSds1ttFX5myQR2uB3AeoPx1j9/1ri0MD5cQ?=
 =?us-ascii?Q?dBNGe4P+STuQXL7h7b24uUWUR9OGB8blvVlsQyMYo46XIWNGpkLxtp2i23mi?=
 =?us-ascii?Q?bpax2VNF6QF21q6i1qRtKkDWtsBlWs64ObPdCKXYvwknnyLoZQv6GvVnQsj8?=
 =?us-ascii?Q?TS/1QEEXckYX/SGxlzn8wezDaEaVvoBrmmsdU2aKrJcZtDpN1PQym/76Spqb?=
 =?us-ascii?Q?9osnagI7WClFo7sgFFrLoD1zoz4O6upFmKRGd2ix3305FXk1zBrq+ouZ4AvF?=
 =?us-ascii?Q?UTC27dIW0nGW9ks1VHzOnk+vTgESMzbPmZOBSnC+gQuspBnOtgFJPiN9pytZ?=
 =?us-ascii?Q?yVUJgnaCJ+ASmcT0jj9CnS3d2AD3HQVZNB6xxDXj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jrWRRhDnAbH7gDpcdAVpRWAwVMhyQaGXVApI7Z8fkmt5SMveW/tDG0RVCSX9lgIUt9zRjwLihwwC5kIiSpwZjaF+u96xxj6BwFpW6/gksv3Hehk6JlPjzU8z7MlNFY4xQw5zKFLojK5W/oDTsAjBNkbs8lxnK5C/G6MaY3J2FjOQKZvlkZK2DCEhXNtUQAfOHTus143CQCOTxiJ1SUQq64KaHObUBHmos6I0iBHiwsyjdbLz3W2nya+iy2IGcRvHmsGvd7orM+apoQnN4PejHHGuuz0eBdZwaJII6liOj8qcSGL6T6oPiPBvJctmj53sX3cBf5WETwNwIY5uKmogtdD+xrVTxFM9mx4nxrw+WDUilbkSRqCR0sc5x7DuAkTq9/53X03NjNl1RQ6QXR6JiRAgHGLvroGMxdaNyIb+oyNqiqHGPJEFDzVuprAIEuu2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 17:09:50.8644
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 695867bc-d7fb-4fe7-566a-08de64d95fad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9671
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,xenproject.org,suse.com,citrix.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,changelog.md:url];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 118E5F5B0C
X-Rspamd-Action: no action

While in principle it's possible to have a vendor virtualising another,
this is fairly tricky in practice and comes with the world's supply of
security issues.

Reject any CPU policy with vendors not matching the host's.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
v2:
  * Reversed polarity of leaf0 check in policy compatibility helper.
  * Reworded changelog entry in terms of LM + save/restore.
---
 CHANGELOG.md         | 5 +++++
 xen/lib/x86/policy.c | 3 ++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 18f3d10f20..426c0bce67 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -22,6 +22,11 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    - Xenoprofile support.  Oprofile themselves removed support for Xen in 2014
      prior to the version 1.0 release, and there has been no development since
      before then in Xen.
+   - Domains can no longer run on a CPU vendor if they were initially launched
+     on a different CPU vendor. This affects live migrations and save/restore
+     workflows accross mixed-vendor hosts. Cross-vendor emulation has always
+     been unreliable, but since 2017 with the advent of speculation security it
+     became unsustainably so.
 
  - Removed xenpm tool on non-x86 platforms as it doesn't actually provide
    anything useful outside of x86.
diff --git a/xen/lib/x86/policy.c b/xen/lib/x86/policy.c
index f033d22785..079c42a29b 100644
--- a/xen/lib/x86/policy.c
+++ b/xen/lib/x86/policy.c
@@ -15,7 +15,8 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
 #define FAIL_MSR(m) \
     do { e.msr = (m); goto out; } while ( 0 )
 
-    if ( guest->basic.max_leaf > host->basic.max_leaf )
+    if ( (guest->x86_vendor     != host->x86_vendor) ||
+         (guest->basic.max_leaf >  host->basic.max_leaf) )
         FAIL_CPUID(0, NA);
 
     if ( guest->feat.max_subleaf > host->feat.max_subleaf )
-- 
2.43.0


