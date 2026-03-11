Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kH7lKYWAsWmjCwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 15:47:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 049B6265AB4
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 15:47:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1251172.1548426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0KXC-00008x-56; Wed, 11 Mar 2026 14:27:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1251172.1548426; Wed, 11 Mar 2026 14:27:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0KXC-00006w-1m; Wed, 11 Mar 2026 14:27:38 +0000
Received: by outflank-mailman (input) for mailman id 1251172;
 Wed, 11 Mar 2026 14:27:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tK7a=BL=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1w0KXA-00087A-Vd
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2026 14:27:36 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7163c7cc-1d56-11f1-b164-2bf370ae4941;
 Wed, 11 Mar 2026 15:27:36 +0100 (CET)
Received: from SN7PR18CA0001.namprd18.prod.outlook.com (2603:10b6:806:f3::15)
 by MN2PR12MB4109.namprd12.prod.outlook.com (2603:10b6:208:1d9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Wed, 11 Mar
 2026 14:27:27 +0000
Received: from SA2PEPF0000150B.namprd04.prod.outlook.com
 (2603:10b6:806:f3:cafe::a4) by SN7PR18CA0001.outlook.office365.com
 (2603:10b6:806:f3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.26 via Frontend Transport; Wed,
 11 Mar 2026 14:26:54 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF0000150B.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 14:27:26 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 11 Mar
 2026 09:27:24 -0500
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
X-Inumbo-ID: 7163c7cc-1d56-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DDgl4UencWUze2cMf+q9tdLeEE284uV5j0+TBDbOCRbbOIZTrKCotMTdGkAD/Ys7Yo5Z8ZHBHvJ0vcZiodNUzQ8fd0wgK1Zu0P8z4hgrmGVUxJZluQF6RGsjWbY6/HvaY+1/Nm54tsejcM66EXn9QH75zDdulMOLjZnrI6a0wATSPWILHk7XogjD7cdM+0d77ENvii1CGoqCLBjfwH7yUYz9XTIQBqLlZPzHr0eDyil5AOZ0XQjzK4isjF6/Hvgo9Lml070rLhO9fN9DEJZTkkPj9x1a5BI3iiex3BQj7v/HpHbOxXfdUA+jBEMfgpVAzlJlUP1ZUjgsbumCTU+u5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+p7cae+ArZ+PDM9loA7Pfn9Yv4gwr3gdHU7guinMic=;
 b=AxoXF82wcKEQVLP9sB/SambvAJz8oL9Ji9UVAmPzG+gQV3FiAnf6pw6JGxNiEOOwlqpD0+AtD/3jT8bEJ4oqMhCKCY1/KT41Cwsy5HOuru/yRZO+44reBEG34MJo0s0cxQRW7QJkyH+Dtd76MbX3zoYX1PLVL36MuUYOMD0+BANd9MBIctiBBbiTHW9CG/qe42HIAGhvZC723fvxO8L4hQFfQ3bceGs+ftyQeEsPyqmtrVzowQIMpqvg+3jac2OnLNx8MEpos6ggddo1CwsRDYoqLbv4lu5wadvadPTDV0DtGKD3zjLw+LYvwS/BLrjob8S58NWEnaQNW549XLjZpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+p7cae+ArZ+PDM9loA7Pfn9Yv4gwr3gdHU7guinMic=;
 b=I+U0KKTpjTNbKaCpXwA3wlWmpIthhA0EUXt93d+eU5lHiJtOfAJT/hmC9gGbIEyJk5d8FZ1sZXNDKN/l1tviNCuEnKxT/Irr6fyrpSgDIHA4Pgvra1MzfwxPub7XaGRkmj1NL4ccerbUVWJGG+2TU6fga8zVepbISOX++iJ8kW8=
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
Subject: [PATCH v4 1/4] x86: Reject CPU policies with vendors other than the host's
Date: Wed, 11 Mar 2026 15:27:04 +0100
Message-ID: <20260311142711.16754-2-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311142711.16754-1-alejandro.garciavallejo@amd.com>
References: <20260311142711.16754-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150B:EE_|MN2PR12MB4109:EE_
X-MS-Office365-Filtering-Correlation-Id: f880a7ec-97e3-4ee1-41e0-08de7f7a5163
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|13003099007|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	wJApQdifNk8zsKCNq/h+1aA2HVsUrjjM2V+L2Eh6tQD9LKqkKf70Y1Pjb/e8aZpWqQOqQlS5Jn+wmtr+poilXQO+l/Ob5/M22pdilaeF2oNAyzFeHUGrxtI3qTzbBza1F8afANsz5CERmxfBEXVucb2Z2ihllyHF41a4RZA4GKJXQePC3PxwnMVv21tjjYIvleIOxDAFCjKZAUuKco2jKO/SCGhDydZ2xkOWBLBupJvYZD9tM7qEwR0O6djUuu5t+L17wWpbIliKc9HzMtFPjSV6pgXjMJitNYd9+Ka6G23ba5nYPMSJuA1J0XBr2xZ546Xn8K5gtGF8aULWIi4D3dqEHKcUBMFrvjVG9PxXg33XPsudAj7ZneVYnZLKND5kvPRhQ4fAETSjnZk25icUm3dj6X5CXZ1fiDLDGpbOX4YkNwlkXUwXB65sC7pHYAgJ9bVuP7bW9HVIdY0KB7au6EwwhxODSh1NFt6y6+NNOM+dH4DzuvNr059g2NzgkEMYYncPH7i1+TySSGe36vl5laja3pkqWjOsfo5wpR7ldKeVFBRwRbuu4qYTpiZYYB3QffSRDfYuINrf/sFJgDxPl5yklVNw5Xc6u26MM4DNf2UNm8wevlE1qqliW85/s0dgc/3MsFWFc0khGArCg16Nr+TePM99jzpgv1PY5XNgKcv4vpY7KYBzC+SZDv4sWPwKcwLLuB53ZC3YhGJjHctZrR8RI1pmnQWYYG8dz2anty8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(13003099007)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ch4FZZGHTnrcFCr55X6O2I02GZSmIBAXqn3DyA8zmDO67p5uFRpxW4KYwu0LP3OsZuVESekYmq1jxqsTA1QDM7VDOZLjsHKc+gaLrfiWR1CyxxVkiyW7kgywFhFyyF2Y/GAg/Rc2MbykVkGZAr8S/LyqUKLvfZH8FRFJrLryHUvyLAkOFrH+hA5kfFBZJZG5PR+F+wXIRN0pNCL88hSN+7nsF30KJCxp7vikZbxWaeA5sBbp++N3E/buc09Hqz4kfG++9kgV98mZNwMTuVfvmN7C+9+IiIahrHwktXEAXOYxtrcn62s09jq2U+IodrbTY9Y74oU3C7xFXN/rH+Cc4fsXV4SkwRR7WKQHZqbQ3/Difkukp/9U0QALJxUMLbAsbaRQrNKqYQ9mUqcjssfcS2IRwZKlTl4PpAWV1ix7bTmFBQ4KBGgoSu/o8LAdXIPO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 14:27:26.0768
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f880a7ec-97e3-4ee1-41e0-08de7f7a5163
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF0000150B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4109
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[changelog.md:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 049B6265AB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

While in principle it's possible to have a vendor virtualising another,
this is fairly tricky in practice and comes with the world's supply of
security issues.

Reject any CPU policy with vendors not matching the host's.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
v4:
  * Adjusted CHANGELOG
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


