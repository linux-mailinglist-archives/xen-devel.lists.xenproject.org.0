Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cD79HNwThmm9JgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 17:16:28 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CC11001F8
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 17:16:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223511.1530977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voOVB-0005zm-TE; Fri, 06 Feb 2026 16:16:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223511.1530977; Fri, 06 Feb 2026 16:16:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voOVB-0005y2-Mu; Fri, 06 Feb 2026 16:16:13 +0000
Received: by outflank-mailman (input) for mailman id 1223511;
 Fri, 06 Feb 2026 16:16:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lgBG=AK=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1voOV9-0005HU-Pd
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 16:16:11 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 239fb4e2-0377-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Feb 2026 17:16:06 +0100 (CET)
Received: from SA1PR04CA0005.namprd04.prod.outlook.com (2603:10b6:806:2ce::14)
 by LV3PR12MB9093.namprd12.prod.outlook.com (2603:10b6:408:19d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Fri, 6 Feb
 2026 16:16:02 +0000
Received: from SN1PEPF00036F3E.namprd05.prod.outlook.com
 (2603:10b6:806:2ce:cafe::34) by SA1PR04CA0005.outlook.office365.com
 (2603:10b6:806:2ce::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.16 via Frontend Transport; Fri,
 6 Feb 2026 16:16:02 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00036F3E.mail.protection.outlook.com (10.167.248.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 16:16:01 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 6 Feb
 2026 10:16:00 -0600
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
X-Inumbo-ID: 239fb4e2-0377-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aRxQ6yAe1818+J4I+sHXFyvZzfwUyY66oinUDS4T9DpKe2gkHtYXncbbaIuKX6F7kmbuyAtF4IdclZuUkwwJme36D0/KhM5FA6rWX5FQgDw7mpINWuK8NYAFmsI/3/P72gfDbXFgGJgzqoAEELduEyYbzG+XcYqOrbS3LwBylNNTdpvi1pfXFA+B5Vx0xM4R+qdNVuzVWVWqmtoSrromM+geD7oU2xKuoUzt+86SIk2C2kxCWJ+xfLGFMakaUgWD2Evn8DDtpQ4HzdlC19c2L+xmWxTxkxPPRa6a4Ne2zB8c4DkNeRl9ewnj86w8YRuUWsmSqWm3mWtMQm30E2Xaag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3XqRfkRYraueuo3h0D16mjrku9u0GK6eRvjfilF9NFM=;
 b=ELk9Hu02OLTU6CxxZ+0kfq8vUHhPGEJHUd4p4UyI5oZ6k0+L/F8TtgDQy7UuNvZ70KrlE/41OExBqpA3D+bg9FNeeZu1AsjOFpRXBsgGT5fJTHPLlYv9Lodtu32d4LHqaujLpRaCcX6Q6hA/jUv+lZuLIokkupau7z9WjcSSQY66gE3pR+jqI3/I+3NkjYEM+aPlTY4ybvKbz0LzmqkLUAFHrYkPPAh1wYEglh7D1BHg1SG6eMeCIS2zf9mRiv9Q2usWiK59SpYeuUVq60HEJwGYwNCYqTGd4UmCrzRG8c1f7cPXzK8hY4mC5tRMuAEL7LJXfFvlYYUpOMCysbxsPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3XqRfkRYraueuo3h0D16mjrku9u0GK6eRvjfilF9NFM=;
 b=zYJ/eu6LSpsz6bl43V+uQ+9hDGo9pTCiN9cOxquqm8ASrOH68yGVf2hNGEJTSH1ZKhct8ogetR9NpUv6ym5LJFE9QUqlPRpfUN5206qMcBsqhGH4W2FsahzxtGpgv6R84MiUfVlL1iR0ya0ZRp4dCoRegG8N+DuFSHyGHPIjqLM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>
Subject: [PATCH 03/12] x86: Add cpu_vendor() as a wrapper for the host's CPU vendor
Date: Fri, 6 Feb 2026 17:15:25 +0100
Message-ID: <20260206161539.209922-4-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3E:EE_|LV3PR12MB9093:EE_
X-MS-Office365-Filtering-Correlation-Id: 17db9e9f-2f58-4aae-6f9e-08de659b0583
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?18fERMQhuiiD/6WQBkxfyvj+1suLtedGR2BlGQcTn33+IUtevwEBQ501UM6e?=
 =?us-ascii?Q?HoWdlaOJSonptG5yU4fuZizmgvguzhkmFAuZrRMchEY5I5+3eUgF3Xff2uXR?=
 =?us-ascii?Q?+9y31dLoc+XNJrB9DuaUUIzogDT0E7hykk3c4mrqKRtoj6hHsLxhIYnDCE4O?=
 =?us-ascii?Q?pMPPg1Uywx7iPgy5oTYdNXtqiu4SAe3tFVtIwknE31lykvoFjj3S/62vof15?=
 =?us-ascii?Q?ZARhOebDCdCFwifYyCweHejnr8qyBCyUKoK9AHk2XfRQ5+szD1k7N7E+bAOJ?=
 =?us-ascii?Q?Il/S0TQf3CcJPI3lYR4xeQ15fTn3rm1IKkXYxHrLPRksKYHiFJmQYB1PCDh5?=
 =?us-ascii?Q?1SgyfhE2TR7SBdzhvzoJBGDK99Z6kc96LX5BhekWa61Zz+yJu2590+XC9jAb?=
 =?us-ascii?Q?idOYNEVx4U7AUFJUFQYC25agYA/G8ZF+yWg5xwcZzZQw76MbII60XCG4aGMB?=
 =?us-ascii?Q?Xi+mOjFr7ZEfDA+nnCQbCVqaf53MWLAsJXo4YlYVPUwcJB45pOcP//l9tVJ3?=
 =?us-ascii?Q?utJEfLWa0x2wLYdR6Goc2UA+iv3F+R02ZAHcu1Y4S3KFAIqGMCK+OWqpwA98?=
 =?us-ascii?Q?2NdBniD2HQixHtgC8R7NSPbtznDnYu2U507h66CVwHxtc/6ObV5g6oKTYhUD?=
 =?us-ascii?Q?Ib3zZYXJmP8lWLUThqo++Z3+P+ycRWS36aoyqoGqlR3w471gQZJEvPgGrEkr?=
 =?us-ascii?Q?GW/aTtE8NCPa8AJ2Ou2n4vwnJNe5V8dYSwkfnaky4wvQ0e0CIMUvWWhOGzXv?=
 =?us-ascii?Q?ZEaCol4AYIuUOdikEZ3CLVYMZxO7Ljr9P/LXsx5xYMFFKXaLD4KJ8uhPgiC3?=
 =?us-ascii?Q?JIPCJ5Ng7C7zmBzPRpyK7D7HrbKhIibaGjUWXw3lfTjmA7TfcJNjEzfVDXv2?=
 =?us-ascii?Q?a9QL/2yxiMl0mOxBfBf7lpdbJWQEXLa0Dt86qUTyjNpeRx4q6czIJ9Nbw+n/?=
 =?us-ascii?Q?8KFIXW+7JxdIAUY2Om+EMndT4VJPlsgzUHEx3PzWZDFL7TLdUAXv/8tvEJ/H?=
 =?us-ascii?Q?tjm29CF5A0sksSqnEpcOIlgAfnr1iO1t9NZ/X9/0STbmCWqt5F/ppHg4iEVQ?=
 =?us-ascii?Q?OuOC1rXB+mDR7GdJt63nO9xpoDqxvV2zJEKs88PcaxW0aDSmEN1FFnVbaFmL?=
 =?us-ascii?Q?J0AJUppiadoWVKr6BbTfBONQ1+v4lN3/FUwE5Qt24WGBpg5tWsJnM9XEyhmm?=
 =?us-ascii?Q?mWYNO4d4UFgKW1xElqmtwMPciR+HFzV4lCkHu6/uOd8YlCmGjKlbnfGN+8ks?=
 =?us-ascii?Q?kNCMkg0OfpFkzePU3dItokoqzShGBm+SJis9PuHlVtnMX58Q0A4CcSIX6LiY?=
 =?us-ascii?Q?HgV24BNJpj+Ip7dAFlk4E59iGkHpAevG9Bs9xVLfiyHQwRNRDEmfmG2B7XEh?=
 =?us-ascii?Q?QsibPnJILilek5CU1tTTmLwVkVItoSevSzxjhzcRvrgP3GRGEPMjyXX6pxEh?=
 =?us-ascii?Q?fEGlkvXGKdInUi5DhSoKepjIQAprRwxoiPF7su9g8wh2DjoWDUo7hVON9p8t?=
 =?us-ascii?Q?KdOINbJ4TMUyfjEZwVhd+od+c+PMghvr/ZMjg55zhIIN9mf5X81ryJUfpWL6?=
 =?us-ascii?Q?cmufzbg3bZmK9lVjGWbI2aav6zmN08J6KkwtyzYyJxaEj1xn3ktfoLz5flGP?=
 =?us-ascii?Q?fLsRMZFN0lHE2+wQvvYR+Qds4A4cxDIk8Wfa2NgdmagY2HxqV71lSOE4yG5p?=
 =?us-ascii?Q?kYqXOw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mZAyRuj5TFPP0OU1r5Y+bt0SyYxuwGmzx5X7vGzc0qfiXyaDPOdORLRyo87TI5fFviM0j5zxAyApYJUoUXbikSZfeVxpJie1Ykofrpbwk4N49jgEk4YGgpl/zhusZ0XZxXr6N2WWTPWtTrxMLutc2Mihy3Sv6n6yo5ejbj//h/pdNmS7DyOGeLKC19EbTY6/GEAPZHyGrmtBVvRxP3jkDeiTz/D3Ok9792sRi1Lg0HluqMqAU7B+9Oi5+KZaz5kv9Co0gzdVYrcQOHG8C7fL+9cjshIFav2NcVv3RITqk/WhyqzUBPR215uSYoP0lKqDmGEL6rr2iQmF3R19NF8pTzYPi5FwseCvm/6KnjgnfHFQKPfIDxNhC8CSNmsAKbOd65+mtNQ+3zsBLwW4LmYC4mFONzd8l4kDYpKYQvA//XYYgBbE71S6tq+CdOdUw2gt
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 16:16:01.9325
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17db9e9f-2f58-4aae-6f9e-08de659b0583
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9093
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.968];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B6CC11001F8
X-Rspamd-Action: no action

Introduces various optimisations that rely on constant folding, Value
Range Propagation (VRP), and Dead Code Elimination (DCE) to aggressively
eliminate code surrounding the uses of the function.

  * For single-vendor+no-unknown-vendor builds returns a compile-time
    constant.
  * For all other cases it ANDs the result with the mask of compiled
    vendors, with the effect of performing DCE in switch cases, removing
    dead conditionals, etc.

It's difficult to reason about codegen in general in a project this big,
but in this case the ANDed constant combines with the values typically
checked against, folding into a comparison against zero. Thus, it's better
for codegen to AND its result with the desired compared-against vendor,
rather than using (in)equality operators. That way the comparison is
always against zero.

  "cpu_vendor() & (X86_VENDOR_AMD | X86_VENDOR_HYGON)"

turns into (cpu_vendor() & X86_VENDOR_AMD) in AMD-only builds (AND +
cmp with zero). Whereas this...

  "cpu_vendor() == X86_VENDOR_AMD"

forces cpu_vendor() to be ANDed and then compared to a non-zero value.

Later patches take the opportunity and make this refactor as cpu_vendor()
is introduced throughout the tree.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/cpu/common.c             |  6 +++++-
 xen/arch/x86/guest/xen/xen.c          |  4 ++++
 xen/arch/x86/include/asm/cpufeature.h | 27 +++++++++++++++++++++++++++
 3 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index ebe2baf8b9..6f4e723172 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -328,7 +328,11 @@ void __init early_cpu_init(bool verbose)
 	*(u32 *)&c->x86_vendor_id[4] = edx;
 
 	c->x86_vendor = x86_cpuid_lookup_vendor(ebx, ecx, edx);
-	switch (c->x86_vendor) {
+	if ( c->x86_vendor != cpu_vendor() )
+		panic("CPU vendor not compiled-in: %s",
+		      x86_cpuid_vendor_to_str(c->x86_vendor));
+
+	switch (cpu_vendor()) {
 	case X86_VENDOR_INTEL:    intel_unlock_cpuid_leaves(c);
 				  actual_cpu = intel_cpu_dev;    break;
 	case X86_VENDOR_AMD:      actual_cpu = amd_cpu_dev;      break;
diff --git a/xen/arch/x86/guest/xen/xen.c b/xen/arch/x86/guest/xen/xen.c
index 77a3a8742a..ec558bcbdb 100644
--- a/xen/arch/x86/guest/xen/xen.c
+++ b/xen/arch/x86/guest/xen/xen.c
@@ -57,6 +57,10 @@ void asmlinkage __init early_hypercall_setup(void)
         cpuid(0, &eax, &ebx, &ecx, &edx);
 
         boot_cpu_data.x86_vendor = x86_cpuid_lookup_vendor(ebx, ecx, edx);
+
+        if ( cpu_vendor() != boot_cpu_data.x86_vendor )
+            panic("CPU vendor not compiled-in: %s",
+                  x86_cpuid_vendor_to_str(boot_cpu_data.x86_vendor));
     }
 
     switch ( boot_cpu_data.x86_vendor )
diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index dcd223d84f..10309e40b6 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -14,6 +14,7 @@
 #include <asm/cpu-policy.h>
 #include <asm/cpuid.h>
 #include <xen/lib/x86/cpu-policy.h>
+#include <asm/x86-vendors.h>
 #else
 #include <asm/cpufeatureset.h>
 #endif
@@ -116,6 +117,32 @@ static inline bool boot_cpu_has(unsigned int feat)
 
 #define CPUID_PM_LEAF                                6
 
+#define X86_ENABLED_VENDORS \
+    ((IS_ENABLED(CONFIG_INTEL)    ? X86_VENDOR_INTEL    : 0) | \
+     (IS_ENABLED(CONFIG_AMD)      ? X86_VENDOR_AMD      : 0) | \
+     (IS_ENABLED(CONFIG_CENTAUR)  ? X86_VENDOR_CENTAUR  : 0) | \
+     (IS_ENABLED(CONFIG_SHANGHAI) ? X86_VENDOR_SHANGHAI : 0) | \
+     (IS_ENABLED(CONFIG_HYGON)    ? X86_VENDOR_HYGON    : 0))
+
+static always_inline uint8_t cpu_vendor(void)
+{
+    uint8_t vendor = boot_cpu_data.vendor;
+
+    /*
+     * const-ify the CPU vendor if we compiled for a single vendor and there's
+     * no boot path for an unknown vendor.
+     */
+    if ( !IS_ENABLED(CONFIG_UNKNOWN_CPU_VENDOR) &&
+         (ISOLATE_LSB(X86_ENABLED_VENDORS) == X86_ENABLED_VENDORS) )
+        return X86_ENABLED_VENDORS;
+
+    /*
+     * This allows the compiler to know more in its VRP pass about the valid
+     * range of `vendor`. It enhances DCE by eliminating impossible vendors.
+     */
+    return vendor & X86_ENABLED_VENDORS;
+}
+
 /* CPUID level 0x00000001.edx */
 #define cpu_has_fpu             1
 #define cpu_has_de              1
-- 
2.43.0


