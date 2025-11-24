Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77799C802C2
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 12:20:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170354.1495413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNUbr-0005bD-Hz; Mon, 24 Nov 2025 11:19:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170354.1495413; Mon, 24 Nov 2025 11:19:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNUbr-0005Y6-Ev; Mon, 24 Nov 2025 11:19:55 +0000
Received: by outflank-mailman (input) for mailman id 1170354;
 Mon, 24 Nov 2025 11:19:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a6+n=6A=citrix.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1vNUbq-0005Xx-7D
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 11:19:54 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c78492f-c927-11f0-980a-7dc792cee155;
 Mon, 24 Nov 2025 12:19:48 +0100 (CET)
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by CO1PR03MB5796.namprd03.prod.outlook.com (2603:10b6:303:9a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 11:19:42 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::c0cd:bcd1:5235:66f0]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::c0cd:bcd1:5235:66f0%7]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 11:19:42 +0000
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
X-Inumbo-ID: 7c78492f-c927-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tuBZjC99o7wpY7aXBm3XHFPrw3oLQjixaAz4KC9WrTy0RJPvklSG2sE9jYyYZoGulUZqFbxOZ/9te660B/XDjpMmE8kK6phBb9/QVYDFFqJggdRklqxX0/f2x0bofNiBhkpJ8mMmWIMxOJZkJmvYoHM0PCRYV+IKNpfZplvz6MfpKNFIAeK9ZXtmbEUJXJ4IzULm4HzleB+ySTUCEI98uBEiFf8GLwt1KVa7PksGpQ6IAyH3C5bVQ7tmfylhdt6CrhEr4kq4mJmhLc3uBqAkNT7/Lkpdzim2AnXYwfjVBfMjEgQyLhZ9nfma8E8kZBbf7Bw0KRYeazNgqolc76htfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NwXR2WKnL+rwbsV0oXBjVmpeaZdpbQuKst7J7dDfZBA=;
 b=xSJloUuXykt8t/vl9mSJJWeAFIRiJo+6FJir1F0q+Ou8HacTM9MIcxmzOk3OV81yRViuZ/1H8JTHNbkYJSbDVK4qtjwtLqsQHkAMiXG29znFbwbNP9/O9SZ+aJzaOsXqI4wtFTj+Ce8f4QsJVKZJyrZm/OsQ/TsBtOqhQFr5kB3gaCP9zigO+esZfLuFfOVABXdMJe1RT91MzVfIl9GmnxcdHnpQv+DFWtZ/n9aQ9pCCvXddFsaN0sO5cZRLu84gUXhwSw0RprQuEZYVcIGe9HzVcLVKGMCN1fRD5ErWp/3iDb67KMbDvNeCZvAW/BfDTX11tl0rpX2i41rbiT7DGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NwXR2WKnL+rwbsV0oXBjVmpeaZdpbQuKst7J7dDfZBA=;
 b=v8Tfm9SM/dWcdqvWEI1JfbrrrxNR/A10+xYrXRl83IY0lc06q96erAWOft2hTIhVgIIKsEeouqBiiXFKQwFvUBxzF3DiEkJxB5T7UYKq4h3f/34bEHa5u8aMs4z7PCAMoj5kz5EwqiY2Vxgvk5yQ2ZlBzbBNTIng/A4k339vRug=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH] x86: Remove x86 prefixed names from cpuinfo for intel.c
Date: Mon, 24 Nov 2025 11:19:42 +0000
Message-ID: <20251124111942.1325635-1-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.51.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0135.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::10) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|CO1PR03MB5796:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ca722de-036d-443b-04c9-08de2b4b5d7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XrJoD1fE6/rooomdcsu7A+XXBS7GeRKAxb9TbOg6/JGx9e68MMxZ5vIxp4X1?=
 =?us-ascii?Q?TqOcMvA3D/DRCYnPD/aavo97+kuvXozrHO27zK3UI+Pzl1GYhXPXUg0Ugwat?=
 =?us-ascii?Q?ivq0mEd0SsQLGRT+ghqAJzO9S9bYGttT8KfdKZ/ku8A4ROQAQ5orluSGfDHu?=
 =?us-ascii?Q?zsiE3ZH721kY2MWNM3Mjrb/pUI/lQnm214zkI1X8A524eHFIImPMCreUZ7tn?=
 =?us-ascii?Q?jEEs+AjKrkx8TZYtr9OsjCIaPuRMkgjnk2biU7LcgCHLfrdtbExmjvMQOox1?=
 =?us-ascii?Q?oNgIV9+iAioDbCzYtEj2Hjj3b+NPl2H+9rP1UsinYE0XbrQduksiM4sPGSq5?=
 =?us-ascii?Q?7ygM5BnOU3CW1ptbmVzwZu3HxIB9uwG9PfwbxSRBAA2GaX2xVD586cAykKTK?=
 =?us-ascii?Q?IW2Bqy02klicSCBNpvNsgP2NyuQjPixqGZHvy9F2fsxXF08ni0Lo51lugM9t?=
 =?us-ascii?Q?HadAveqNQ1TJAoLOCCjP2u4aXDBh/xeUIuEJ643My4J/G4STNnGfU0FotSaj?=
 =?us-ascii?Q?FTJRXjZcbIX/Q3gO35lFSkYW+/VqEMGiRDoGZURdjom09ce5kvrBBNggfrg/?=
 =?us-ascii?Q?ecrCBnFEJuAHVPboP+1Mfd0r5UqxpEmYyrh0CXTmiWcJoLin+raynTnjP5+L?=
 =?us-ascii?Q?mlvxetUmzLuvZePp399/+MixDPb/i34xv6xt+1mdGCjrMNHr5w5/292ysVvc?=
 =?us-ascii?Q?CZ4SXMWuSjLbrsD/k7GrNg3AVMzRTmiwTquH+Z8pbQb7nunaADy+t2bGe0z8?=
 =?us-ascii?Q?9/m1upHEiYJWHuIk+Xm+8BfBzvE7LchavRNib2MjxulxVfALCz2EPhFrfaFW?=
 =?us-ascii?Q?Maf3/GLGLlVrCFgTQ/M2VWQ/sIDpGpGwrGP9Tvkr9rGBCgHVddn1mgP+R5tD?=
 =?us-ascii?Q?zuoXnCxy5zLu9lKRs+GUhGS+t/7eEWa1C0C/pQWEVR6Ftj8B+48NEoOyCnQi?=
 =?us-ascii?Q?DD1xoAPl0resdxMqpu2K0A+0xLUqhbxVInwqq1YNbsIL/xKBxWci3msVFNHx?=
 =?us-ascii?Q?gscrbqQDnSylC6co7SJtyLXTqbebB6Q5Df4rYREOdOL3EE+8kn6lc7Y9IViR?=
 =?us-ascii?Q?Wu5o+F+EwHH5Bwk/uVIkio7rNVJAEeHjMhP3LF0i0q9frGwq5OmNK0IoONqe?=
 =?us-ascii?Q?m6hCg6ftsZofnkex2bG14Ab3jR6vrBTmpxSIRye+s9TLqdocQkalQKfV7k0l?=
 =?us-ascii?Q?582OpSOekCy4YFNDPB2loLMrnYL8W1oRptCMdfYE8UhB0JAGS8pmX2o3teIl?=
 =?us-ascii?Q?bbM9AMSzT+TzxwToASwlUWFHcdPvbeXxkuS1O81cwzMUhnxVDI1x9+VLfvDi?=
 =?us-ascii?Q?blfLrtmzNrsLnMMDyQGqxG+bFHQzGbwDHraT63Quo46x+g8Zj2sudRfLr48Y?=
 =?us-ascii?Q?iR8mxk7fAlbaGwtxgp1jPw93UvVvTvh0+J8WapXQ/cPFVIgJgIYk9qcyN8AD?=
 =?us-ascii?Q?veSBuBq4vqPUWZDF3JtNwzj9uhvd+eZz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8ujhQh/A78XKFftenr3vkrsqxnPxKyvN5RfQEGtt1PE+1142drwrOxUhXxee?=
 =?us-ascii?Q?ct0I4ttk8Q8Fd6M2riu6LmQNQSfZO86JaK3FhZzDpjjSh9BcehKGi03JJnXs?=
 =?us-ascii?Q?eq/Q/vUHTQohC1vjc4KuYJJK/KR1q2vj/+6qnfa5Vy522BZy36Y62f53NzQ8?=
 =?us-ascii?Q?y6EAOF4yWjzDJ7+3oCMofq6M705EbTSt3yQl/wZ/VY/CvNXNydF/hqEZ/ldr?=
 =?us-ascii?Q?NrHvXUJNm7LhH09vVP4B79tCZBiA2ESY0iE3TbYMs9R/QrP2KdQ4+7RPk7z5?=
 =?us-ascii?Q?jog9hkF/HbIaPF/xI/Td/mr4fSLo/8mKxoMT87VE+hHJCMAZVE0jsK4xI5p1?=
 =?us-ascii?Q?F4yQ0RgGkipt/cShd3nwL/WYK+wGHqrHVHdoPGbJPviuHKOsZGAOAoWtubhL?=
 =?us-ascii?Q?38F6/XluyKfXDkBLZSTTWHtFkBRGAZLlSlM5ihz+L+WRnOrnAwVWZXSdIgSi?=
 =?us-ascii?Q?XwXFoQjBPn47Gexenh+ZB5IAlEpxohVqhf5vd0MhAlm8y7S1hWCJL7AVak4J?=
 =?us-ascii?Q?SRD+J6yJjqCiyJEgaYA+ZhohYlotVT2J0EOZ6UQsg1/KYlJlmV/JWxQYLaty?=
 =?us-ascii?Q?QoHhnEqrfoF7FeJNdow2zBSS1lIX5CtKyx1ksITzYDPGS59P4CycO4mJ9Niw?=
 =?us-ascii?Q?VsIeGNahWRCI+cJ/C/ddE5eerHPkI9dR+HI8yf5dEz11zNypp2UngIvhVC1R?=
 =?us-ascii?Q?oR6zDKt6iXQX9hpR4MAoRF86C3aisL+qoz/awk0rH8Akch17tJmccqBhc2Av?=
 =?us-ascii?Q?Xbtt+wvhA96wq1xPpRX7VsqAd+RgO479HVT0dCpRLdUcCcZ0ogqpKmOyvE2i?=
 =?us-ascii?Q?Z4sRMsvfXGr9vx0ifcHAj6hrmxw7WTVWsV/sHqQFRVmQZ3Czr5bsIMC6vuoL?=
 =?us-ascii?Q?dCKhwSRIIsnUxs3StN33Vpcb8LkyLx/x8iAt17r3USevhcZnHVQ7ZxNgYA3u?=
 =?us-ascii?Q?hxfw92GY9gL/HNgopbYyZiClf2V/E5Znrwz+z1+hqqL/h5MSm6PkO3vgRRjr?=
 =?us-ascii?Q?3PJ+h4QelRhcrZwgZYPiZHhX6hSuGZLaZlxFrwlGWLsdg8lFDvhWxxoSZNIF?=
 =?us-ascii?Q?bns1ipFtWjqkM1n0zKeAHtwQbDCkAE8oajSVYRZ4lmU4DfZeBOYPPKkwVFGx?=
 =?us-ascii?Q?Hr4mmx7/5rjTMiMTdyLEz0UWFERo34jWFokWBviOtaw3yJIaBeWAw2qOOlpc?=
 =?us-ascii?Q?4F5WdymEpNnz0Pcqh+WK5GEF6bx19Pv9Lpybtrfsrz+UC+E6xQG3o0dXgXOL?=
 =?us-ascii?Q?u0cV8F9XccFnF+DHQz2LM8ndTLI/D/pzAesHaOccm/oTFEDzFTAS2veGGyJy?=
 =?us-ascii?Q?hFtEjqBqMyI2Bdmq43ilDWk76r+PQoGB3k3KCIOG0lIicRibqdecJ/hxjda2?=
 =?us-ascii?Q?74E/csN/KPMZZRMwwFRmWzC1yzMik3KIdZx1j1PBJAcXDXWP6nLZcETOQZP6?=
 =?us-ascii?Q?Y9qtBsIBysSe5rmoLjWUPk3lrsYIdOAKnYC+ziffIz/kmmbK8wfLDu9+438y?=
 =?us-ascii?Q?haiK5siK+fG3h+Aax0Gf5bDlOW+OefA01ouhBXI1nHE+QzB1M4i3ALPp22DE?=
 =?us-ascii?Q?fM+KVRFvbQAZp/6jOohd88iu5FGcAqTn17HSbDbb?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ca722de-036d-443b-04c9-08de2b4b5d7c
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 11:19:42.6274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RGnOMKjLaTU9axgPrVSJenEazy/WsMfCUV94Lt31DcA7qVTw9S6sCXjphrE1hTnTkikWwiz3e7XOTvwD1Mkpmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5796

struct cpuinfo_x86
  .x86        => .family
  .x86_vendor => .vendor
  .x86_model  => .model
  .x86_mask   => .stepping

No functional change.

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
 xen/arch/x86/cpu/intel.c                | 34 ++++++++++++++-----------
 xen/arch/x86/include/asm/intel-family.h |  4 +++
 2 files changed, 23 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index 6f71365b7e..5f780fe1aa 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -86,7 +86,7 @@ static void __init check_memory_type_self_snoop_errata(void)
 	if (!boot_cpu_has(X86_FEATURE_SS))
 		return;
 
-	switch (boot_cpu_data.x86_model) {
+	switch (boot_cpu_data.model) {
 	case 0x0f: /* Merom */
 	case 0x16: /* Merom L */
 	case 0x17: /* Penryn */
@@ -137,10 +137,10 @@ static void __init probe_masking_msrs(void)
 	unsigned int exp_msr_basic, exp_msr_ext, exp_msr_xsave;
 
 	/* Only family 6 supports this feature. */
-	if (c->x86 != 6)
+	if (c->family != 6)
 		return;
 
-	switch (c->x86_model) {
+	switch (c->model) {
 	case 0x17: /* Yorkfield, Wolfdale, Penryn, Harpertown(DP) */
 	case 0x1d: /* Dunnington(MP) */
 		msr_basic = MSR_INTEL_MASK_V1_CPUID1;
@@ -191,7 +191,7 @@ static void __init probe_masking_msrs(void)
 	       expected_levelling_cap, levelling_caps,
 	       (expected_levelling_cap ^ levelling_caps) & levelling_caps);
 	printk(XENLOG_WARNING "Fam %#x, model %#x expected (%#x/%#x/%#x), "
-	       "got (%#x/%#x/%#x)\n", c->x86, c->x86_model,
+	       "got (%#x/%#x/%#x)\n", c->family, c->model,
 	       exp_msr_basic, exp_msr_ext, exp_msr_xsave,
 	       msr_basic, msr_ext, msr_xsave);
 	printk(XENLOG_WARNING
@@ -265,7 +265,7 @@ static void __init noinline intel_init_levelling(void)
 	 * so skip it altogether. In the case where Xen is virtualized these
 	 * MSRs may be emulated though, so we allow it in that case.
 	 */
-	if ((boot_cpu_data.x86 != 0xf || cpu_has_hypervisor) &&
+	if ((boot_cpu_data.family != 0xf || cpu_has_hypervisor) &&
 	    probe_cpuid_faulting()) {
 		expected_levelling_cap |= LCAP_faulting;
 		levelling_caps |= LCAP_faulting;
@@ -348,7 +348,7 @@ void intel_unlock_cpuid_leaves(struct cpuinfo_x86 *c)
 static void cf_check early_init_intel(struct cpuinfo_x86 *c)
 {
 	/* Netburst reports 64 bytes clflush size, but does IO in 128 bytes */
-	if (c->x86 == 15 && c->x86_cache_alignment == 64)
+	if (c->family == 15 && c->x86_cache_alignment == 64)
 		c->x86_cache_alignment = 128;
 
 	if (c == &boot_cpu_data &&
@@ -358,8 +358,8 @@ static void cf_check early_init_intel(struct cpuinfo_x86 *c)
 	intel_unlock_cpuid_leaves(c);
 
 	/* CPUID workaround for Intel 0F33/0F34 CPU */
-	if (boot_cpu_data.x86 == 0xF && boot_cpu_data.x86_model == 3 &&
-	    (boot_cpu_data.x86_mask == 3 || boot_cpu_data.x86_mask == 4))
+	if (boot_cpu_data.vfm == INTEL_P4_PRESCOTT &&
+	    (boot_cpu_data.stepping == 3 || boot_cpu_data.stepping == 4))
 		paddr_bits = 36;
 
 	if (c == &boot_cpu_data) {
@@ -458,7 +458,7 @@ static void Intel_errata_workarounds(struct cpuinfo_x86 *c)
 {
 	uint64_t val;
 
-	if ((c->x86 == 15) && (c->x86_model == 1) && (c->x86_mask == 1)) {
+	if ( c->vfm == INTEL_P4_WILLAMETTE && c->stepping == 1 ) {
 		val = rdmsr(MSR_IA32_MISC_ENABLE);
 		if ((val & (1 << 9)) == 0) {
 			printk (KERN_INFO "CPU: C0 stepping P4 Xeon detected.\n");
@@ -468,8 +468,10 @@ static void Intel_errata_workarounds(struct cpuinfo_x86 *c)
 		}
 	}
 
-	if (c->x86 == 6 && cpu_has_clflush &&
-	    (c->x86_model == 29 || c->x86_model == 46 || c->x86_model == 47))
+	if ( cpu_has_clflush &&
+	    ( c->vfm == INTEL_CORE2_DUNNINGTON ||
+	      c->vfm == INTEL_NEHALEM_EX ||
+	      c->vfm == INTEL_WESTMERE_EX ))
 		setup_force_cpu_cap(X86_BUG_CLFLUSH_MONITOR);
 
 	probe_c3_errata(c);
@@ -540,7 +542,7 @@ static void intel_log_freq(const struct cpuinfo_x86 *c)
         }
     }
 
-    switch ( c->x86 )
+    switch ( c->family )
     {
         static const unsigned short core_factors[] =
             { 26667, 13333, 20000, 16667, 33333, 10000, 40000 };
@@ -553,7 +555,7 @@ static void intel_log_freq(const struct cpuinfo_x86 *c)
         if ( !max_ratio )
             return;
 
-        switch ( c->x86_model )
+        switch ( c->model )
         {
         case 0x0e: /* Core */
         case 0x0f: case 0x16: case 0x17: case 0x1d: /* Core2 */
@@ -657,9 +659,11 @@ static void cf_check init_intel(struct cpuinfo_x86 *c)
 	/* Work around errata */
 	Intel_errata_workarounds(c);
 
-	if ((c->x86 == 0xf && c->x86_model >= 0x03) ||
-		(c->x86 == 0x6 && c->x86_model >= 0x0e))
+	if ((c->family == 0xf && c->model >= 0x03) ||
+		(c->family == 0x6 && c->model >= 0x0e))
+	{
 		__set_bit(X86_FEATURE_CONSTANT_TSC, c->x86_capability);
+	}
 	if (cpu_has(c, X86_FEATURE_ITSC)) {
 		__set_bit(X86_FEATURE_CONSTANT_TSC, c->x86_capability);
 		__set_bit(X86_FEATURE_NONSTOP_TSC, c->x86_capability);
diff --git a/xen/arch/x86/include/asm/intel-family.h b/xen/arch/x86/include/asm/intel-family.h
index d8c0bcc406..c71e744731 100644
--- a/xen/arch/x86/include/asm/intel-family.h
+++ b/xen/arch/x86/include/asm/intel-family.h
@@ -179,6 +179,10 @@
 #define INTEL_XEON_PHI_KNL		IFM(6, 0x57) /* Knights Landing */
 #define INTEL_XEON_PHI_KNM		IFM(6, 0x85) /* Knights Mill */
 
+/* Family 15 - NetBurst */
+#define INTEL_P4_WILLAMETTE		IFM(15, 0x01) /* Also Xeon Foster */
+#define INTEL_P4_PRESCOTT		IFM(15, 0x03)
+
 /* Family 5 */
 #define INTEL_FAM5_QUARK_X1000		0x09 /* Quark X1000 SoC */
 #define INTEL_QUARK_X1000		IFM(5, 0x09) /* Quark X1000 SoC */
-- 
2.51.1


