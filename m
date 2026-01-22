Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCfCG1lVcmkJiwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 17:50:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3846A518
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 17:50:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211435.1523039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vixt1-0007gM-Im; Thu, 22 Jan 2026 16:50:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211435.1523039; Thu, 22 Jan 2026 16:50:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vixt1-0007eV-FH; Thu, 22 Jan 2026 16:50:23 +0000
Received: by outflank-mailman (input) for mailman id 1211435;
 Thu, 22 Jan 2026 16:50:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I1tn=73=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vixsz-000783-HK
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 16:50:21 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67991b8f-f7b2-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 17:50:07 +0100 (CET)
Received: from PH8PR22CA0013.namprd22.prod.outlook.com (2603:10b6:510:2d1::11)
 by DS0PR12MB6607.namprd12.prod.outlook.com (2603:10b6:8:d1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Thu, 22 Jan
 2026 16:50:00 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2603:10b6:510:2d1:cafe::b7) by PH8PR22CA0013.outlook.office365.com
 (2603:10b6:510:2d1::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Thu,
 22 Jan 2026 16:49:59 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 16:50:00 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 22 Jan
 2026 10:49:58 -0600
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
X-Inumbo-ID: 67991b8f-f7b2-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G2IRoyudhXNiNfHOskV+igGQTAmeb5Jh1b6MEkk8D5taKEyZV7CH1NW0yPRKvgC80QKCtWYhqUMMnVJR3q+rT5mQajrCmCIKNQklknPxzjtGP19XqL7zraER0HqTDgBlm3NKOBjX0Ey/6+UwLigkPgyp2No7M+eoTqTAE+UcEzYsGroqTASQyTg1oKWi1Gc/2dcKWdfexnTDvn5riUu6A8Kq6R8FK5g+DaNgtgt5/APbHFu0PuFg0keV8mZZGhOVNGZiqphEl0NR9ZYz+jgXDQIFA4sJQCfcWq5qRtH5nSanrd2gYb4wUgazbhAcfJ1udt26oSDTRIjZ0KCAlynzyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WMxox3x+9Ts/m2y8FFHLB2sq78zjecLlHbq/Xxc18Ig=;
 b=kb5QLyFihtx+GBZbkrU1q8UND0jrIMBKAQaaAe2xHLe9Vmqh/tQbIF9sNQALx0fiv22Ihff9G0O8g7pP5qWzR4GSEG8BSzVXn6EU+5LkaFSdwHek+4BQfCCzW3xqbHBvKnvgodzAOmQyTaajhUWsLolbr1F1PfA8tTTfvc9OC6cmQH/hpVfzW/Q6AWZGHteQzSJxKdeG07RrxQD13XtdmTW9lxKVUXGtoDYgyn7gNbTDAmTXWP1M5PDScrH33FYcqbPAraYHFeyVVT1bcYc1j3cC/MRfn8VHgHkM5gALjER/b5cBIGaZx6Cs9yoVtZAyHAmGZ1v4qT5gA/Xu8gFp2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WMxox3x+9Ts/m2y8FFHLB2sq78zjecLlHbq/Xxc18Ig=;
 b=PxNbsqVqMo+QzEkNo2hc5ol60dkioNwOxU6Vs7qULMmVoFevZ6HdRT8zbyzs3hBRjTWAVJtoz1YORzelHg1q3+NECRSfsFj9QoAilCEKk9LTqrdZRpIsk/UnM1Vzb2BK8lzlyGbEUi+1Kv7Yl6Lr06QLvlKmqj+3VmNSbfRefJM=
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
Subject: [PATCH 1/4] x86: Reject CPU policies with vendors other than the host's
Date: Thu, 22 Jan 2026 17:49:37 +0100
Message-ID: <20260122164943.20691-2-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260122164943.20691-1-alejandro.garciavallejo@amd.com>
References: <20260122164943.20691-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|DS0PR12MB6607:EE_
X-MS-Office365-Filtering-Correlation-Id: 862483f3-570a-4893-b084-08de59d64846
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nxi68i8hxVWvJWRcf1Aworwh3O3W6uCjcD+CgVXGP9H0y/6OXRX717YgDZO2?=
 =?us-ascii?Q?5+SWFWrZuaMb2fDKPkb0Gx7LqmU9BVDQbueXBuylj+huMdYJxxR16/VcqDTF?=
 =?us-ascii?Q?tn1pCPBhl8HPLi/D6Hof70UJqiF8HnGj2obpw6NkVNYHOK8lL9U/Ry23N569?=
 =?us-ascii?Q?P5VuCkb5G7Pz10t805K9rQo1PadHXseGrRRSms4KATAtdKmfSZC7esBiRUL7?=
 =?us-ascii?Q?KZb5OWb79GMc2bI+XQjP/gPj5QOSqaPF7kSrFxP4PvBxKVDG2yovPjHKnaYu?=
 =?us-ascii?Q?dHCYZeD5l7ImTs5nHG/KIleZGu9C3qx/VkrF/yNTKc1m8DmeHfJP0etjzR+4?=
 =?us-ascii?Q?jJwyWA8az8AcAFPWtd3MDWLHky9m2WhpVl2+B3hxCTZWThlSosYyzRD6wrDR?=
 =?us-ascii?Q?yIazp5cAUthWBSqiPc1PkuVuLJ2SAQ/7wic8WJ0E80eZOIqED/RTcwCW+AyE?=
 =?us-ascii?Q?Z3mK9LW/IaQiRsR0xdSdJAIGDu5epmgWsvLscAgWwVZgKcShKkNFCLM/bbIE?=
 =?us-ascii?Q?D8YBUUS2FD8FHkTgzXY4ANdaotvT81qk+l2KUYSrFWV10oeCazh1ZVVI64o1?=
 =?us-ascii?Q?t+SnMT9a+/sjZPeSmS2x/zK8MVXW+I7oBp3PKKUVgEJzM9Nv7AjKILfdPnTh?=
 =?us-ascii?Q?6H68yIr0zpq0QifpzFpJwqQ0C67oVR3adCBm++r2K8ck0prqEzC6LE+E34Kb?=
 =?us-ascii?Q?6gfwOJlgG+YirDVpoknbBzm2+8ANqD302DuSNGkLWl2H8iJcY088b9Hrawa5?=
 =?us-ascii?Q?ZLksGyK5MVro0BOxDVeWcJsoPb0h0camsref9XemnvGiV+NgbmSC1r6xAcKN?=
 =?us-ascii?Q?dGxR2JsjP06L/oqTKEkJ910YQTe05JRlruYqXZgEfm4yFpTgwp4A25Gy/DF5?=
 =?us-ascii?Q?CXjaiGmOrDvfJkdZ+JcBU5TlPpMJ18pF3tCQOVTvHla3IJjbjdD3fn1cA6XO?=
 =?us-ascii?Q?Fk/oUHZZKbkkzTQiHV7ZkTncufuRFEowsemrGKu+3kzfOlhp6GR2TF2eyU3i?=
 =?us-ascii?Q?jN/YgM8xmPxsoieAiUu1lVw3FIaeMxqoOiB4a5tq0ATk18B6ddI8SPyzFAgb?=
 =?us-ascii?Q?X0Ph/EEfPqsJS6MT3iUCnNUoxXaTJJAYuoGvUMpfoKYPa0Yfdfi1XywzaxvG?=
 =?us-ascii?Q?eb3yqSblK8DO89ORyGmvLBatG7bQe7TGKaVHz5FX8evs4DgNsUYboJAHCNih?=
 =?us-ascii?Q?MsfxcqNFGt+ail7xhw/awNyJDD7lVhUeAr21sDxrbNUsHUzzO8pvmd/bO0zH?=
 =?us-ascii?Q?n6qx9TQCIInm3pPzxXbDna28H23o/66+tdL/ebNsHGD8ZMHtbG1G47IUeGlJ?=
 =?us-ascii?Q?cLzncx9ix8I4PztPZTCW08dH2pxJabLTRAKGCUDrGyfH2e++jnwZHZP4jT2G?=
 =?us-ascii?Q?cu2tKBf9idvRnDDE/9mxIkU7d9OzZ3B74dtRqDVLjj/8mX4R20DUYVxkPMyX?=
 =?us-ascii?Q?rcSYMSRGgWAt51IhQcxN6LhUHdL6CbpcUYPVhItD/ilerbEqlt+gagB1h1Zs?=
 =?us-ascii?Q?wSYauwxW+YNC7okFdDt1Wa9yfgHpVE7PRFBTrXiF9Y05htl9KsXIeozAMt+t?=
 =?us-ascii?Q?gX6MF1HaexIvzJTamL98vOfxpZAPv9iyuaJP6JuIeKlU6VjIfGlANTlszQjt?=
 =?us-ascii?Q?Pw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 16:50:00.2776
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 862483f3-570a-4893-b084-08de59d64846
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6607
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,xenproject.org,suse.com,citrix.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: EF3846A518
X-Rspamd-Action: no action

While in principle it's possible to have a vendor virtualising another,
this is fairly tricky in practice and comes with the world's supply of
security issues.

Reject any CPU policy with vendors not matching the host's.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 CHANGELOG.md         | 4 ++++
 xen/lib/x86/policy.c | 3 ++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 18f3d10f20..eae2f961c7 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -22,6 +22,10 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    - Xenoprofile support.  Oprofile themselves removed support for Xen in 2014
      prior to the version 1.0 release, and there has been no development since
      before then in Xen.
+   - Cross-vendor support.  Refuse to start domains whose CPU vendor differs
+     from the host so that security mitigations stay consistent. Cross-vendor
+     setups have been unreliable and not practical since 2017 with the advent of
+     speculation security.
 
  - Removed xenpm tool on non-x86 platforms as it doesn't actually provide
    anything useful outside of x86.
diff --git a/xen/lib/x86/policy.c b/xen/lib/x86/policy.c
index f033d22785..4c0c5386ea 100644
--- a/xen/lib/x86/policy.c
+++ b/xen/lib/x86/policy.c
@@ -15,7 +15,8 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
 #define FAIL_MSR(m) \
     do { e.msr = (m); goto out; } while ( 0 )
 
-    if ( guest->basic.max_leaf > host->basic.max_leaf )
+    if ( (guest->basic.max_leaf >  host->basic.max_leaf) ||
+         (guest->x86_vendor     != host->x86_vendor) )
         FAIL_CPUID(0, NA);
 
     if ( guest->feat.max_subleaf > host->feat.max_subleaf )
-- 
2.43.0


