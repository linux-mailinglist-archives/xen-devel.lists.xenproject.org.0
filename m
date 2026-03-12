Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KqhFtqhsmnbOQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 12:22:02 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1CE270CD4
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 12:22:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252075.1548860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0e6z-0006iw-Fy; Thu, 12 Mar 2026 11:21:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252075.1548860; Thu, 12 Mar 2026 11:21:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0e6z-0006ge-C4; Thu, 12 Mar 2026 11:21:53 +0000
Received: by outflank-mailman (input) for mailman id 1252075;
 Thu, 12 Mar 2026 11:21:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=17Qz=BM=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1w0e6y-0006gG-Bs
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 11:21:52 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6ee6a70-1e05-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Mar 2026 12:21:46 +0100 (CET)
Received: from MN2PR16CA0054.namprd16.prod.outlook.com (2603:10b6:208:234::23)
 by LV2PR12MB6013.namprd12.prod.outlook.com (2603:10b6:408:171::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Thu, 12 Mar
 2026 11:21:40 +0000
Received: from MN1PEPF0000F0E5.namprd04.prod.outlook.com
 (2603:10b6:208:234:cafe::8a) by MN2PR16CA0054.outlook.office365.com
 (2603:10b6:208:234::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.28 via Frontend Transport; Thu,
 12 Mar 2026 11:21:40 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E5.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 12 Mar 2026 11:21:39 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 12 Mar
 2026 06:21:37 -0500
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
X-Inumbo-ID: a6ee6a70-1e05-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N7zp4KZc9j0ywkgTjZmROpWJTadr0WJ5dzYNtCTcPTQwKdsybYZcBksjArJq6cgmX8AP5NJKNKcusdbXUqHIkad5VLL0UXXhpExaj4lfsAW5zKECnn53+y0Wl+VU5AN2xNacujnEkJhu1MpGZO2Z1eg3TJwIIgdd0NdPxyq9xa403bsQDfxPmfB2LYEfQI753smHaj4K8y2BSZEUEChdMMTNnF0nkoXKAp8tMTG8r8k6xbARIFdFsePNBavRN9ZvtXppN75a33FZ5hFAes+yDtpTSHAbRgrIAMgH0btsejgWKZYyLtcSAX5ocgmVT8iWAJKqyKAtDPoKUnxa5f3/jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DUuyrM9nbhvSaUzGq1+p73eNNfOyYjtxNbuorXkrPm4=;
 b=ECoXZJK+OM96DoqUqrZbr/yKEUvis5YqafWh6zAI9xMtpkbb8vy63V1mD/cjxT7rOBkDEO7P27aiE/F4miJoodhA+gmZOOny+o1PZkSiNZZOCE7cxTdFJBOLkNIKJ6PJRHf95NUSR31lETgVum9XQPVlEHTte3yVVEqueJ3y1uFC3230MxEBZ1VcYAx7qLxEIiHtP1la0cXWdSyvLxH7ZimDb8yHGaCEVunOEKVAyT9wAMYUhQqMkXHCN1czUsdQvJOzL4Acg740gSsHEO6I3dmiA1oMExFWp8XOia6xdH849xzJGpjQCg2numbaun5LKcCqYWzhR9qw4u+OVChRPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DUuyrM9nbhvSaUzGq1+p73eNNfOyYjtxNbuorXkrPm4=;
 b=xgI1HopUNHl5UViDqCqrS/jFO403UNI8O8OPerjlxdPR1++XlrPorMWCDAo2r+CLDyL4UrFfxILjvnHZv3cgM9i0fld8k/bgaidhTdJ5kPO7tws8PoxZQeDGRs4Xt1SUK1TT9Q7Iorw2OKZa2vH4k+x/mB63cO/+7bwfI2sD134=
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
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v5 1/5] x86: Reject CPU policies with vendors other than the host's
Date: Thu, 12 Mar 2026 12:21:10 +0100
Message-ID: <20260312112116.22563-2-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312112116.22563-1-alejandro.garciavallejo@amd.com>
References: <20260312112116.22563-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E5:EE_|LV2PR12MB6013:EE_
X-MS-Office365-Filtering-Correlation-Id: 10c4aa1e-0274-4f9b-d5a2-08de80298819
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|13003099007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Yt80KbQovZePI7mp8e6N6PZn76yVQEoG3qtFG0/E67Z7RcCR6CbDOuk/OZiU2K81EdWRq31t6xiCZeoMY+gUL3/VZ+W0uiPQE7xLMu/D6Ror6/slS+fhdg9d60tab6508xjUq9Irhx2qKsWuVLzx2qy0nWQJjsQOA+L13arCQNlklMj742kIGLKeWbIyv8YUnIGeJx7W41v5yKZNnZ1RK8WV8fipSBqManU8Vzl7oUL8CAg2U3iqNQTxP2MoEI24x946T7OSXpJOZqovqfrMukkGQGXQl2hYpCkGANTGsisUoGaMTcotAmdwhYw/mNT4mc4qpagxiC7OGKINdhpxsGemUF4LMLL3TqYhVP/7PeXmgwkmraz4Up8SdfV6S0aREOfLXbDQtX5+0g531h3eEoT6/XdyLRf0VUJOs4KCR9Med6LACZAZB1EPmF+yxHkdALD/bN175UuJk5H7qeyLVi9h7bhsomc6LFU98fRyQqxJ/gIsK+v4CIn0ZVsWm/TS3OJXovw+SSRAuJjPeitoGprx2n1IKs7x+gXVxI/LJEvk6YFFmDtL31JOiEjLTS30oMRknLs1CUzSFwaAFM+DVbqEmNHtowjntmb1SYz7k0h/9Cy7EEhbDhT1i5bJVv6EpZzVDXPtHk+HFYs3vfOpAzoLnZM9a/G5KMXj2n8jLurUrs7ilwDNj7srxsKFT47FZfPqd4LAuw58QxY0PlmGerSuTsyJZO6o+M0P2cx0ios=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(13003099007)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qRAoR9EcpPjhTn4fyCO1kEubQnRbg8O/TxparZHPbEQG5aY3Tv2kZeXYvo1mmcWnj2wax/e7gOdzbq4wISdRA94lqUQ9uLdHpNCJd6rU3QTcbexiMZIEsyS1tuk2WIIVvaCrInXkaY2R51WuQrL9sA2VlP7NIR12hhQgbsSsEb7f+JRsqQdYfjb/yijIuDUTO4kFGPOtOa7AMmAAUGNJJ7c4qrXwbnr4WEGp6JPqqLnThNr6JhyxxCu7lPPBZX3pdy4pWH3CV+pqxGyuvaHGqFgOE3VR4yIj48Ata268Ex87yIgN5XA9nQgtDocKn6cNc7jqDFAVCbFaUDzqzOMXTQld6djbxZY2kJ6Md9pSaabC/Kk69bbjbGtiqnqGtCSRHISXc6sSXKLGfEtlv4YiIOEKCiXRiSeflbiI6QHSfKy4ifp8KyaeaDyRzDlfUlzG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 11:21:39.8149
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10c4aa1e-0274-4f9b-d5a2-08de80298819
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB6013
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,xenproject.org,suse.com,citrix.com,vates.tech];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,amd.com:dkim,amd.com:email,amd.com:mid,keepachangelog.com:url];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: CE1CE270CD4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

While in principle it's possible to have a vendor virtualising another,
this is fairly tricky in practice and comes with the world's supply of
security issues.

Reject any CPU policy with vendors not matching the host's.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 CHANGELOG.md                             |  5 +++++
 tools/tests/cpu-policy/test-cpu-policy.c | 27 ++++++++++++++++++++++++
 xen/arch/x86/lib/cpu-policy/policy.c     |  5 ++++-
 3 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index c191e504aba..90ba5da69e4 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -23,6 +23,11 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    - Xenoprofile support.  Oprofile themselves removed support for Xen in 2014
      prior to the version 1.0 release, and there has been no development since
      before then in Xen.
+   - Domains can no longer run on a system with CPUs of a vendor different from
+     the one they were initially launched on. This affects live migrations and
+     save/restore workflows across mixed-vendor hosts. Cross-vendor emulation
+     has always been unreliable, but since 2017 with the advent of speculation
+     security it became unsustainably so.
 
  - Removed xenpm tool on non-x86 platforms as it doesn't actually provide
    anything useful outside of x86.
diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-policy/test-cpu-policy.c
index 301df2c0028..88a9a26e8f1 100644
--- a/tools/tests/cpu-policy/test-cpu-policy.c
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
@@ -586,6 +586,19 @@ static void test_is_compatible_success(void)
                 .platform_info.cpuid_faulting = true,
             },
         },
+        {
+            .name = "Host CPU vendor == Guest CPU vendor (both unknown)",
+            .host = {
+                .basic.vendor_ebx = X86_VENDOR_AMD_EBX + 1,
+                .basic.vendor_ecx = X86_VENDOR_AMD_ECX,
+                .basic.vendor_edx = X86_VENDOR_AMD_EDX,
+            },
+            .guest = {
+                .basic.vendor_ebx = X86_VENDOR_AMD_EBX + 1,
+                .basic.vendor_ecx = X86_VENDOR_AMD_ECX,
+                .basic.vendor_edx = X86_VENDOR_AMD_EDX,
+            },
+        },
     };
     struct cpu_policy_errors no_errors = INIT_CPU_POLICY_ERRORS;
 
@@ -629,6 +642,20 @@ static void test_is_compatible_failure(void)
             },
             .e = { -1, -1, 0xce },
         },
+        {
+            .name = "Host CPU vendor != Guest CPU vendor (both unknown)",
+            .host = {
+                .basic.vendor_ebx = X86_VENDOR_AMD_EBX + 1,
+                .basic.vendor_ecx = X86_VENDOR_AMD_ECX,
+                .basic.vendor_edx = X86_VENDOR_AMD_EDX,
+            },
+            .guest = {
+                .basic.vendor_ebx = X86_VENDOR_AMD_EBX + 2,
+                .basic.vendor_ecx = X86_VENDOR_AMD_ECX,
+                .basic.vendor_edx = X86_VENDOR_AMD_EDX,
+            },
+            .e = { 0, -1, -1 },
+        },
     };
 
     printf("Testing policy compatibility failure:\n");
diff --git a/xen/arch/x86/lib/cpu-policy/policy.c b/xen/arch/x86/lib/cpu-policy/policy.c
index f033d22785b..f991b1f3a96 100644
--- a/xen/arch/x86/lib/cpu-policy/policy.c
+++ b/xen/arch/x86/lib/cpu-policy/policy.c
@@ -15,7 +15,10 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
 #define FAIL_MSR(m) \
     do { e.msr = (m); goto out; } while ( 0 )
 
-    if ( guest->basic.max_leaf > host->basic.max_leaf )
+    if ( (guest->basic.vendor_ebx != host->basic.vendor_ebx) ||
+         (guest->basic.vendor_ecx != host->basic.vendor_ecx) ||
+         (guest->basic.vendor_edx != host->basic.vendor_edx) ||
+         (guest->basic.max_leaf   >  host->basic.max_leaf) )
         FAIL_CPUID(0, NA);
 
     if ( guest->feat.max_subleaf > host->feat.max_subleaf )
-- 
2.43.0


