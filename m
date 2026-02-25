Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMNuAIvFnmkuXQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 10:48:59 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B19419547D
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 10:48:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240463.1541837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvBUa-0001AP-C9; Wed, 25 Feb 2026 09:47:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240463.1541837; Wed, 25 Feb 2026 09:47:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvBUa-00017a-8k; Wed, 25 Feb 2026 09:47:40 +0000
Received: by outflank-mailman (input) for mailman id 1240463;
 Wed, 25 Feb 2026 09:47:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4/VV=A5=citrix.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1vvBUY-00017U-Jx
 for xen-devel@lists.xenproject.org; Wed, 25 Feb 2026 09:47:38 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01c1cb07-122f-11f1-9ccf-f158ae23cfc8;
 Wed, 25 Feb 2026 10:47:32 +0100 (CET)
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by PH8PR03MB7272.namprd03.prod.outlook.com (2603:10b6:510:251::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 09:47:29 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%4]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 09:47:28 +0000
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
X-Inumbo-ID: 01c1cb07-122f-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IdWn2qiv6JWErYUG9PeHJGs0DqbpSuocAnqDeUq3kiwyDC2IGcV5FHculXd/DIG3q+4bExl4w+d/QO2OZldE4niz5QDfZ6LjmKV60AjmyE2QJ6yiFkf7FgEsXjbastlIEiBnnn264tj6dbzct08EI0Q/qZG7XZT0HELeUvRLtwyILs0Av1uhLqsBqxuay/gX4Odt2c40cwzVmNNsS9/Sc+DnyHhy+3jYmE7y9wuyj72wiENmBxhPBL3Z4+QZudwDTUTKNgvbjq013atqV6AgyuAItiBD6NjAUz/EGPoWP1uNWZKDhu1QuTejlCPTZALCrge4tY8hCUnc8RSqeMKoFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ii/p2w6Bl51U5aovKnB8GlPdyIIhVbsFCi93l1oEMCs=;
 b=hTmO+8PZrHW0KpSGv3bLYHnNYpK3nnoRrVtyeh/5yWLR5BAlWOd8hzhVZb4GBJiBhhyrG7X1akv6xze2lWBRyY+rZQcE5yTPYQsN+3oqDjW7IIgTqG1LDYQQRn5A/uWa8Y+M+iEhIbKZqX7GGhvaeIVYgxMl9mMhIHcx58GD3qbfgH7i3nhX0rJt3eoOax27m2iixFYJO/ehmgeXDmuwY4OZ4oe+XEGlF0e1Q46E0snlsKBVvdRonsweWNHGckh1/MJwW/3vBgaZob7amudE8zkwU3GV2Re04m+R6n7/6ERJ2H45FA9C/xd+EOvI0wXrDT5/VRDyDabp+YgeTH8UOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ii/p2w6Bl51U5aovKnB8GlPdyIIhVbsFCi93l1oEMCs=;
 b=VNgB5hhMzmpSoE1UAXb7T2lF3VkbNssuHjUkLJWb2vo6xeVf/6B1phEqnkzN0WVHSq4QWpzI2nJyiIzPgacvE4mGNvTpsFXE2IPGEQqPiIEekGURU8D32FA4pCNJiS6jazkPsFwKwrNBtIHJtcIKC+3DV9z9TQO5nBP1nfDL0/o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH] x86: Remove x86 prefixed names from cpuinfo for amd.c
Date: Wed, 25 Feb 2026 09:47:59 +0000
Message-ID: <20260225094759.623258-1-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.51.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0086.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::19) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|PH8PR03MB7272:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a03607f-6909-480f-738c-08de7452e389
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	Cwu0B2yRtaDS5ocEj9GrdRH1df+fyex/UflZKbOtHJF44bKuPbvVRyG6jkTMH/c30auebNeeHy6SRgvOIqMhbwGPVE9XMYFntClpSjIyA6FRpc7DhocXMXCpSOwtTwDmh0cf03lOxu3LibLWBQZDA3B3rx7MQlZ2/RH3hSUBcRT2U12xSKI5vmpZlPoWw0dud1+tZ59mSHZTzdwZnDUjFThkBuVJbof2wsViNXARvU/kedeGWjU0hCNwCZVpIOs0NijC+k83aHYIokbxgEnwHP6CCQe4NL5Gp9zDBlq3SDN6M+OKuyPbwTzt5dSdmu7NEJhCIRlk4AReKq+sc4wIvVNZQLEO1sekRFMgQkuTBY54BNBN5+qgPIFbDcDu6kLowy7AprraGq47G5zpLZTV2excipuGG01YAeAyewPUIqCaY2W+DqTFZ+ZRuVSN3tUD+W/3ooEvSWgyXv6KKJJHnlYpUOpCk7fHtX+AOJ/KhhZWQGxePQZuLKkJefOpBsXC5XSIqwXJ/Q2BZ946WeMmB9cXzwToq4I8/L9JS/ZAXKXqhUc4FlaqX9Fh8mEeVdGJkBine7IRDrbd5eAbBbFGNmZS4H7Pv9ARdv+IHbYvFaVZmrE6bACjwfTDjTGsFWNlnvMnG+FBWB9sZi2rtTaWxEhF+ny1O/jQxnIAXYcCnB+dxibVA9ydJymEk721TOXKvchQ53BjYQiEtc//stMojChSRoxb/iz++/p4dEPKRfc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fn0CpWjGABTT7d4pf1mmwPDO6qmStZmWX6okJfrY5l86NgEZtQwpvDClyxDN?=
 =?us-ascii?Q?DUG42aGbf64JESlZjjouPOAXvh+bE+00u3r5myU/0agpYB1AJ1NLq7Q5sfQp?=
 =?us-ascii?Q?0eX2UQ9SaI7VsO3BfEPc+v+QQoqxfTVTgsDSyVneQXRUASRrcXkcAZhsu9SW?=
 =?us-ascii?Q?10sWT4xnaPHt6v/8yKi9ifdNx3DB1yahDuLkzaEnq9ije6QJSJ1H197JKtto?=
 =?us-ascii?Q?Jfpuh86Ozp66AFAFp98v1F7bGsAyDWgjuoHQEsmMM2XoAUM5s/5ab4vt1lfF?=
 =?us-ascii?Q?CSEUdjNxnx1uEzLehRorgtgFUq348twplxfQMBcFvQyntb3WrBLuYDXQ4FUy?=
 =?us-ascii?Q?IpY1HcGTNfmW3CTpfMSsaVrKsdERYmyaVKu1Z5ZsoXctTPKQjoSA4hW+zLin?=
 =?us-ascii?Q?Wug/Te5eZpnKT0Lh5c50JvjDAHN+s1iGKjQbPHaoPqePOXOzVYlRzCk03cir?=
 =?us-ascii?Q?ARNxqd2xe6TGk43HZ8HgTS60VuWITPgU2dAbhJixlYyU025Xi2tUQ29eQjiU?=
 =?us-ascii?Q?vYad1fSWftkTr1c45pixLZsnTqOHJslSc0WyNoGB/hsVVfS3vKu1Vvj3ECxz?=
 =?us-ascii?Q?R7tJ0HbOQBR4+9fwlPPSV9XH8uw+FvMER4ozTYmVSzyff7DYScxXNi+TRk7v?=
 =?us-ascii?Q?TJRwU9WEX3ADYGKJkv87PANLZcVFqAJsP+SKtiUYSaMsdiQyhLT0IJpwLiOx?=
 =?us-ascii?Q?IEiGs120T4uJA8zuB44KpmmPcaXGJArNza/3CGV3D3mIYRFGVfIPBfVlnSrd?=
 =?us-ascii?Q?fhbquq8ZQ58/+pJL0w7UlqsTwKH4HhR4v1yKxM+8bMfN2RsgUMtBpqNZiVNn?=
 =?us-ascii?Q?grDOknXUekWnTg2xZnbXZP41rWMNTMxAGHR1jFUSgCEKucVTw0uHxZ9R2ov2?=
 =?us-ascii?Q?ooalqHfiMbfU4zmLf1EP/XnWLbsMMnp3TSdkRiUFqYIrL6cAXkqGVE2zFzDC?=
 =?us-ascii?Q?QlG+n8yR3Y4Q0+lz6fPdVfKLJAywc0Lg582t7dGKN9Ntf78UZre1H5xHcM5k?=
 =?us-ascii?Q?7CYgt4S3cw8gYX44a78EdfBr7Y9uZVMwOOibwhFrEBv0PIHqMWI820nS3Axx?=
 =?us-ascii?Q?K8h/juECD5sQfzb04/4oSynCHcU0jdqEsMDvjK05uqtTvQzugqF9aFTrXa7R?=
 =?us-ascii?Q?4BrhjQWAUWQHIHnZciX8+2YCuw/DxgU0LGMpH/YttZXPE581/8sD2z+ZcABZ?=
 =?us-ascii?Q?7qivYIhdgB5VRq4GdIOO1jfxUqcQah7sMqLhcA6tGmTXuV++jcXWNKz/Rr3C?=
 =?us-ascii?Q?hfXUXir2qnMf/ZTDknQeOyPN6w+IBZUAoBKCVz8t5KGg13BqxYzFq029WEAe?=
 =?us-ascii?Q?zFQ3F8d9z5Ny3CI7bXKZGex1f4hZaPGvPFFMRlVd0O7TDnxqVVt9W+fIsIoo?=
 =?us-ascii?Q?EwOim74TEnl+1WTgaqh1m5FJ29wAroKSigvvS/j1iyAtQ2YaOhBhCAfaQQHh?=
 =?us-ascii?Q?gXrwvd1j5yXA4kfWRaLB0w2Kn/xDgdAuty+u9HsN2UfwMyhNn84eSGrVPeUB?=
 =?us-ascii?Q?VhR3qyZfYvYnbWXYUm6LCbKc79yNinMUpqCTMB3MTfROP5h3JsZY+lQZWRIF?=
 =?us-ascii?Q?yoIkBwhIGYxRZl2AVPGNab8GDVr9p6xDgT1jFsGs4PkVr713gKTl5kSk42sj?=
 =?us-ascii?Q?HE9OM+gkU3LfJu0Go3Ic5BYpAX6YYQJepBprs/iN1sQlrN7Gbguug9njPXlF?=
 =?us-ascii?Q?u7xhsHlC9wHyKzjimzBdlifwzC+ShtjZVG4J8OvZlMOc2Dd/BL3aIXGqDQAa?=
 =?us-ascii?Q?obuPP0hc6g=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a03607f-6909-480f-738c-08de7452e389
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 09:47:28.8927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /O2YE10JoOtpdR9DFzSfDfDkUGAZ4qbPfaMj/zYGCAYEpTlbQz4GmcACYlUEcZrv1iMJF3W7jKM/eO/tc6Tr1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR03MB7272
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:kevin.lampis@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1B19419547D
X-Rspamd-Action: no action

And some AMD related code in emul-priv-op.c.

struct cpuinfo_x86
  .x86        => .family
  .x86_vendor => .vendor
  .x86_model  => .model
  .x86_mask   => .stepping

No functional change.

This work is part of making Xen safe for Intel family 18/19.

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
 xen/arch/x86/cpu/amd.c         | 74 +++++++++++++++++-----------------
 xen/arch/x86/pv/emul-priv-op.c | 30 +++++++-------
 2 files changed, 52 insertions(+), 52 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index fc496dc43e..2b7f60aa30 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -134,7 +134,7 @@ static void __init noinline probe_masking_msrs(void)
 		cpuidmask_defaults._7ab0 =
 			_probe_mask_msr(MSR_AMD_L7S0_FEATURE_MASK, LCAP_7ab0);
 
-	if (c->x86 == 0x15 && c->cpuid_level >= 6 && cpuid_ecx(6))
+	if (c->family == 0x15 && c->cpuid_level >= 6 && cpuid_ecx(6))
 		cpuidmask_defaults._6c =
 			_probe_mask_msr(MSR_AMD_THRM_FEATURE_MASK, LCAP_6c);
 
@@ -151,7 +151,7 @@ static void __init noinline probe_masking_msrs(void)
 	       expected_levelling_cap, levelling_caps,
 	       (expected_levelling_cap ^ levelling_caps) & levelling_caps);
 	printk(XENLOG_WARNING "Fam %#x, model %#x level %#x\n",
-	       c->x86, c->x86_model, c->cpuid_level);
+	       c->family, c->model, c->cpuid_level);
 	printk(XENLOG_WARNING
 	       "If not running virtualised, please report a bug\n");
 }
@@ -327,7 +327,7 @@ int cpu_has_amd_erratum(const struct cpuinfo_x86 *cpu, int osvw_id, ...)
 	u32 range;
 	u32 ms;
 	
-	if (cpu->x86_vendor != X86_VENDOR_AMD)
+	if (cpu->vendor != X86_VENDOR_AMD)
 		return 0;
 
 	if (osvw_id >= 0 && cpu_has(cpu, X86_FEATURE_OSVW)) {
@@ -348,9 +348,9 @@ int cpu_has_amd_erratum(const struct cpuinfo_x86 *cpu, int osvw_id, ...)
 	/* OSVW unavailable or ID unknown, match family-model-stepping range */
 	va_start(ap, osvw_id);
 
-	ms = (cpu->x86_model << 4) | cpu->x86_mask;
+	ms = (cpu->model << 4) | cpu->stepping;
 	while ((range = va_arg(ap, int))) {
-		if ((cpu->x86 == AMD_MODEL_RANGE_FAMILY(range)) &&
+		if ((cpu->family == AMD_MODEL_RANGE_FAMILY(range)) &&
 		    (ms >= AMD_MODEL_RANGE_START(range)) &&
 		    (ms <= AMD_MODEL_RANGE_END(range))) {
 			va_end(ap);
@@ -418,8 +418,8 @@ static void check_syscfg_dram_mod_en(void)
 {
 	uint64_t syscfg;
 
-	if (!((boot_cpu_data.x86_vendor == X86_VENDOR_AMD) &&
-		(boot_cpu_data.x86 >= 0x0f)))
+	if (!((boot_cpu_data.vendor == X86_VENDOR_AMD) &&
+		(boot_cpu_data.family >= 0x0f)))
 		return;
 
 	rdmsrl(MSR_K8_SYSCFG, syscfg);
@@ -462,7 +462,7 @@ static void amd_get_topology(struct cpuinfo_x86 *c)
                 cpuid(0x8000001e, &eax, &ebx, &ecx, &edx);
                 c->x86_num_siblings = ((ebx >> 8) & 0xff) + 1;
 
-                if (c->x86 < 0x17)
+                if (c->family < 0x17)
                         c->compute_unit_id = ebx & 0xFF;
                 else {
                         c->cpu_core_id = ebx & 0xFF;
@@ -520,10 +520,10 @@ void amd_process_freq(const struct cpuinfo_x86 *c,
 	unsigned int idx = 0, h;
 	uint64_t hi, lo, val;
 
-	if (c->x86 < 0x10 || c->x86 > 0x1A)
+	if (c->family < 0x10 || c->family > 0x1A)
 		return;
 
-	if (c->x86 < 0x17) {
+	if (c->family < 0x17) {
 		unsigned int node = 0;
 		uint64_t nbcfg;
 
@@ -573,7 +573,7 @@ void amd_process_freq(const struct cpuinfo_x86 *c,
 				 * accounted for in order to correctly fetch the
 				 * nominal frequency of the processor.
 				 */
-				switch (c->x86) {
+				switch (c->family) {
 				case 0x10: idx = 1; break;
 				case 0x12: idx = 7; break;
 				case 0x14: idx = 7; break;
@@ -593,7 +593,7 @@ void amd_process_freq(const struct cpuinfo_x86 *c,
 	}
 
 	lo = 0; /* gcc may not recognize the loop having at least 5 iterations */
-	for (h = c->x86 == 0x10 ? 5 : 8; h--; )
+	for (h = c->family == 0x10 ? 5 : 8; h--; )
 		if (!rdmsr_safe(0xC0010064 + h, &lo) && (lo >> 63))
 			break;
 	if (!(lo >> 63))
@@ -603,18 +603,18 @@ void amd_process_freq(const struct cpuinfo_x86 *c,
 	    !rdmsr_safe(0xC0010064 + idx, &val) && (val >> 63) &&
 	    !rdmsr_safe(0xC0010064, &hi) && (hi >> 63)) {
 		if (nom_mhz)
-			*nom_mhz = amd_parse_freq(c->x86, val);
+			*nom_mhz = amd_parse_freq(c->family, val);
 		if (low_mhz)
-			*low_mhz = amd_parse_freq(c->x86, lo);
+			*low_mhz = amd_parse_freq(c->family, lo);
 		if (hi_mhz)
-			*hi_mhz = amd_parse_freq(c->x86, hi);
+			*hi_mhz = amd_parse_freq(c->family, hi);
 	} else if (h && !rdmsr_safe(0xC0010064, &hi) && (hi >> 63)) {
 		if (low_mhz)
-			*low_mhz = amd_parse_freq(c->x86, lo);
+			*low_mhz = amd_parse_freq(c->family, lo);
 		if (hi_mhz)
-			*hi_mhz = amd_parse_freq(c->x86, hi);
+			*hi_mhz = amd_parse_freq(c->family, hi);
 	} else if (low_mhz)
-		*low_mhz = amd_parse_freq(c->x86, lo);
+		*low_mhz = amd_parse_freq(c->family, lo);
 }
 
 void cf_check early_init_amd(struct cpuinfo_x86 *c)
@@ -654,7 +654,7 @@ static bool set_legacy_ssbd(const struct cpuinfo_x86 *c, bool enable)
 {
 	int bit = -1;
 
-	switch (c->x86) {
+	switch (c->family) {
 	case 0x15: bit = 54; break;
 	case 0x16: bit = 33; break;
 	case 0x17:
@@ -716,7 +716,7 @@ bool __init amd_setup_legacy_ssbd(void)
 {
 	unsigned int i;
 
-	if ((boot_cpu_data.x86 != 0x17 && boot_cpu_data.x86 != 0x18) ||
+	if ((boot_cpu_data.family != 0x17 && boot_cpu_data.family != 0x18) ||
 	    boot_cpu_data.x86_num_siblings <= 1 || opt_ssbd)
 		return true;
 
@@ -763,7 +763,7 @@ static void core_set_legacy_ssbd(bool enable)
 
 	BUG_ON(this_cpu(legacy_ssbd) == enable);
 
-	if ((c->x86 != 0x17 && c->x86 != 0x18) || c->x86_num_siblings <= 1) {
+	if ((c->family != 0x17 && c->family != 0x18) || c->x86_num_siblings <= 1) {
 		BUG_ON(!set_legacy_ssbd(c, enable));
 		return;
 	}
@@ -982,7 +982,7 @@ static void amd_check_bp_cfg(void)
 	/*
 	 * AMD Erratum #1485.  Set bit 5, as instructed.
 	 */
-	if (!cpu_has_hypervisor && boot_cpu_data.x86 == 0x19 && is_zen4_uarch())
+	if (!cpu_has_hypervisor && boot_cpu_data.family == 0x19 && is_zen4_uarch())
 		new |= (1 << 5);
 
 	/*
@@ -1029,13 +1029,13 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 	 * Errata 63 for SH-B3 steppings
 	 * Errata 122 for all steppings (F+ have it disabled by default)
 	 */
-	if (c->x86 == 15) {
+	if (c->family == 15) {
 		rdmsrl(MSR_K8_HWCR, value);
 		value |= 1 << 6;
 		wrmsrl(MSR_K8_HWCR, value);
 	}
 
-	if (c->x86 == 0xf && c->x86_model < 0x14
+	if (c->family == 0xf && c->model < 0x14
 	    && cpu_has(c, X86_FEATURE_LAHF_LM)) {
 		/*
 		 * Some BIOSes incorrectly force this feature, but only K8
@@ -1056,12 +1056,12 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 
 	amd_init_ssbd(c);
 
-	if (c->x86 == 0x17)
+	if (c->family == 0x17)
 		amd_init_spectral_chicken();
 
 	/* Probe for NSCB on Zen2 CPUs when not virtualised */
 	if (!cpu_has_hypervisor && !cpu_has_nscb && c == &boot_cpu_data &&
-	    c->x86 == 0x17)
+	    c->family == 0x17)
 		detect_zen2_null_seg_behaviour();
 
 	/*
@@ -1083,7 +1083,7 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 	if (c == &boot_cpu_data && !cpu_has_clflushopt)
 		setup_force_cpu_cap(X86_BUG_CLFLUSH_MFENCE);
 
-	switch(c->x86)
+	switch(c->family)
 	{
 	case 0xf ... 0x11:
 		disable_c1e(NULL);
@@ -1133,15 +1133,15 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 		if (cpu_has(c, X86_FEATURE_ITSC)) {
 			__set_bit(X86_FEATURE_CONSTANT_TSC, c->x86_capability);
 			__set_bit(X86_FEATURE_NONSTOP_TSC, c->x86_capability);
-			if (c->x86 != 0x11)
+			if (c->family != 0x11)
 				__set_bit(X86_FEATURE_TSC_RELIABLE,
 					  c->x86_capability);
 		}
 	}
 
 	/* re-enable TopologyExtensions if switched off by BIOS */
-	if ((c->x86 == 0x15) &&
-	    (c->x86_model >= 0x10) && (c->x86_model <= 0x1f) &&
+	if ((c->family == 0x15) &&
+	    (c->model >= 0x10) && (c->model <= 0x1f) &&
 	    !cpu_has(c, X86_FEATURE_TOPOEXT) &&
 	    !rdmsr_safe(MSR_K8_EXT_FEATURE_MASK, &value)) {
 		value |= 1ULL << 54;
@@ -1158,14 +1158,14 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 	 * The way access filter has a performance penalty on some workloads.
 	 * Disable it on the affected CPUs.
 	 */
-	if (c->x86 == 0x15 && c->x86_model >= 0x02 && c->x86_model < 0x20 &&
+	if (c->family == 0x15 && c->model >= 0x02 && c->model < 0x20 &&
 	    !rdmsr_safe(MSR_AMD64_IC_CFG, &value) && (value & 0x1e) != 0x1e)
 		wrmsr_safe(MSR_AMD64_IC_CFG, value | 0x1e);
 
         amd_get_topology(c);
 
 	/* Pointless to use MWAIT on Family10 as it does not deep sleep. */
-	if (c->x86 == 0x10)
+	if (c->family == 0x10)
 		__clear_bit(X86_FEATURE_MONITOR, c->x86_capability);
 
 	if (!cpu_has_amd_erratum(c, AMD_ERRATUM_121))
@@ -1182,7 +1182,7 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 		       "*** Pass \"allow_unsafe\" if you're trusting"
 		       " all your (PV) guest kernels. ***\n");
 
-	if (c->x86 == 0x16 && c->x86_model <= 0xf) {
+	if (c->family == 0x16 && c->model <= 0xf) {
 		if (c == &boot_cpu_data) {
 			l = pci_conf_read32(PCI_SBDF(0, 0, 0x18, 3), 0x58);
 			h = pci_conf_read32(PCI_SBDF(0, 0, 0x18, 3), 0x5c);
@@ -1215,7 +1215,7 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 	/* AMD CPUs do not support SYSENTER outside of legacy mode. */
 	__clear_bit(X86_FEATURE_SEP, c->x86_capability);
 
-	if (c->x86 == 0x10) {
+	if (c->family == 0x10) {
 		/* do this for boot cpu */
 		if (c == &boot_cpu_data)
 			check_enable_amd_mmconf_dmi();
@@ -1238,14 +1238,14 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 	 * Family 0x12 and above processors have APIC timer
 	 * running in deep C states.
 	 */
-	if ( opt_arat && c->x86 > 0x11 )
+	if ( opt_arat && c->family > 0x11 )
 		__set_bit(X86_FEATURE_XEN_ARAT, c->x86_capability);
 
 	/*
 	 * Prior to Family 0x14, perf counters are not reset during warm reboot.
 	 * We have to reset them manually.
 	 */
-	if (nmi_watchdog != NMI_LOCAL_APIC && c->x86 < 0x14) {
+	if (nmi_watchdog != NMI_LOCAL_APIC && c->family < 0x14) {
 		wrmsrl(MSR_K7_PERFCTR0, 0);
 		wrmsrl(MSR_K7_PERFCTR1, 0);
 		wrmsrl(MSR_K7_PERFCTR2, 0);
@@ -1290,7 +1290,7 @@ static int __init cf_check amd_check_erratum_1474(void)
 	s_time_t delta;
 
 	if (cpu_has_hypervisor ||
-	    (boot_cpu_data.x86 != 0x17 && boot_cpu_data.x86 != 0x18))
+	    (boot_cpu_data.family != 0x17 && boot_cpu_data.family != 0x18))
 		return 0;
 
 	/*
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 1d9e57ad27..959962638c 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -244,8 +244,8 @@ static bool pci_cfg_ok(struct domain *currd, unsigned int start,
     start |= CF8_ADDR_LO(currd->arch.pci_cf8);
     /* AMD extended configuration space access? */
     if ( CF8_ADDR_HI(currd->arch.pci_cf8) &&
-         boot_cpu_data.x86_vendor == X86_VENDOR_AMD &&
-         boot_cpu_data.x86 >= 0x10 && boot_cpu_data.x86 < 0x17 )
+         boot_cpu_data.vendor == X86_VENDOR_AMD &&
+         boot_cpu_data.family >= 0x10 && boot_cpu_data.family < 0x17 )
     {
         uint64_t msr_val;
 
@@ -869,7 +869,7 @@ static uint64_t guest_efer(const struct domain *d)
      */
     if ( is_pv_32bit_domain(d) )
         val &= ~(EFER_LME | EFER_LMA |
-                 (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL
+                 (boot_cpu_data.vendor == X86_VENDOR_INTEL
                   ? EFER_SCE : 0));
     return val;
 }
@@ -958,7 +958,7 @@ static int cf_check read_msr(
     case MSR_K8_PSTATE5:
     case MSR_K8_PSTATE6:
     case MSR_K8_PSTATE7:
-        if ( boot_cpu_data.x86_vendor != X86_VENDOR_AMD )
+        if ( boot_cpu_data.vendor != X86_VENDOR_AMD )
             break;
         if ( unlikely(is_cpufreq_controller(currd)) )
             goto normal;
@@ -966,8 +966,8 @@ static int cf_check read_msr(
         return X86EMUL_OKAY;
 
     case MSR_FAM10H_MMIO_CONF_BASE:
-        if ( boot_cpu_data.x86_vendor != X86_VENDOR_AMD ||
-             boot_cpu_data.x86 < 0x10 || boot_cpu_data.x86 >= 0x17 )
+        if ( boot_cpu_data.vendor != X86_VENDOR_AMD ||
+             boot_cpu_data.family < 0x10 || boot_cpu_data.family >= 0x17 )
             break;
         /* fall through */
     case MSR_AMD64_NB_CFG:
@@ -991,13 +991,13 @@ static int cf_check read_msr(
     case MSR_P6_EVNTSEL(0) ... MSR_P6_EVNTSEL(3):
     case MSR_CORE_PERF_FIXED_CTR0 ... MSR_CORE_PERF_FIXED_CTR2:
     case MSR_CORE_PERF_FIXED_CTR_CTRL ... MSR_CORE_PERF_GLOBAL_OVF_CTRL:
-        if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
+        if ( boot_cpu_data.vendor == X86_VENDOR_INTEL )
         {
             vpmu_msr = true;
             /* fall through */
     case MSR_AMD_FAM15H_EVNTSEL0 ... MSR_AMD_FAM15H_PERFCTR5:
     case MSR_K7_EVNTSEL0 ... MSR_K7_PERFCTR3:
-            if ( vpmu_msr || (boot_cpu_data.x86_vendor &
+            if ( vpmu_msr || (boot_cpu_data.vendor &
                               (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
             {
                 if ( vpmu_do_rdmsr(reg, val) )
@@ -1100,7 +1100,7 @@ static int cf_check write_msr(
     case MSR_K8_PSTATE6:
     case MSR_K8_PSTATE7:
     case MSR_K8_HWCR:
-        if ( !(boot_cpu_data.x86_vendor &
+        if ( !(boot_cpu_data.vendor &
                (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
             break;
         if ( likely(!is_cpufreq_controller(currd)) ||
@@ -1119,8 +1119,8 @@ static int cf_check write_msr(
         break;
 
     case MSR_FAM10H_MMIO_CONF_BASE:
-        if ( boot_cpu_data.x86_vendor != X86_VENDOR_AMD ||
-             boot_cpu_data.x86 < 0x10 || boot_cpu_data.x86 >= 0x17 )
+        if ( boot_cpu_data.vendor != X86_VENDOR_AMD ||
+             boot_cpu_data.family < 0x10 || boot_cpu_data.family >= 0x17 )
             break;
         if ( !is_hwdom_pinned_vcpu(curr) )
             return X86EMUL_OKAY;
@@ -1148,7 +1148,7 @@ static int cf_check write_msr(
 
     case MSR_IA32_MPERF:
     case MSR_IA32_APERF:
-        if ( !(boot_cpu_data.x86_vendor &
+        if ( !(boot_cpu_data.vendor &
                (X86_VENDOR_INTEL | X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
             break;
         if ( likely(!is_cpufreq_controller(currd)) ||
@@ -1158,7 +1158,7 @@ static int cf_check write_msr(
 
     case MSR_IA32_THERM_CONTROL:
     case MSR_IA32_ENERGY_PERF_BIAS:
-        if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL )
+        if ( boot_cpu_data.vendor != X86_VENDOR_INTEL )
             break;
         if ( !is_hwdom_pinned_vcpu(curr) || wrmsr_safe(reg, val) == 0 )
             return X86EMUL_OKAY;
@@ -1168,12 +1168,12 @@ static int cf_check write_msr(
     case MSR_P6_EVNTSEL(0) ... MSR_P6_EVNTSEL(3):
     case MSR_CORE_PERF_FIXED_CTR0 ... MSR_CORE_PERF_FIXED_CTR2:
     case MSR_CORE_PERF_FIXED_CTR_CTRL ... MSR_CORE_PERF_GLOBAL_OVF_CTRL:
-        if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
+        if ( boot_cpu_data.vendor == X86_VENDOR_INTEL )
         {
             vpmu_msr = true;
     case MSR_AMD_FAM15H_EVNTSEL0 ... MSR_AMD_FAM15H_PERFCTR5:
     case MSR_K7_EVNTSEL0 ... MSR_K7_PERFCTR3:
-            if ( vpmu_msr || (boot_cpu_data.x86_vendor &
+            if ( vpmu_msr || (boot_cpu_data.vendor &
                               (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
             {
                 if ( (vpmu_mode & XENPMU_MODE_ALL) &&
-- 
2.51.1


