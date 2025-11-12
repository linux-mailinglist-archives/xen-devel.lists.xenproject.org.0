Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BA3C552C0
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 02:02:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160463.1488623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJLiK-0005pP-VS; Thu, 13 Nov 2025 01:01:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160463.1488623; Thu, 13 Nov 2025 01:01:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJLiK-0005mB-Ry; Thu, 13 Nov 2025 01:01:28 +0000
Received: by outflank-mailman (input) for mailman id 1160463;
 Wed, 12 Nov 2025 20:18:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3wlB=5U=citrix.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1vJHIS-0002m5-Jf
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 20:18:28 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc4d2106-c004-11f0-980a-7dc792cee155;
 Wed, 12 Nov 2025 21:18:23 +0100 (CET)
Received: from DS2PR03MB8444.namprd03.prod.outlook.com (2603:10b6:8:331::20)
 by SJ0PR03MB6963.namprd03.prod.outlook.com (2603:10b6:a03:431::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 20:18:18 +0000
Received: from DS2PR03MB8444.namprd03.prod.outlook.com
 ([fe80::9e66:7fb0:f412:e3cd]) by DS2PR03MB8444.namprd03.prod.outlook.com
 ([fe80::9e66:7fb0:f412:e3cd%6]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 20:18:18 +0000
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
X-Inumbo-ID: bc4d2106-c004-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=he2Ab6zWD3G1/xTjfVRt7av5MLDQ4rYIQP7UWGxsWzIkvufswVEnwzVoajvl93mZspoDVomXwSgElyhzcHrpyLEBMjRHVrH1hfh3XeFJq1fhmkF/JhMwRQ7u8A7YQemEBvQSghUqOfPgmGzdhwBl9IROOpqs4TQdHXQQAQwPAhdxZyoqR3l0zTMBsSYCb9gbwHYugfPVxi12RERG9WOf5f8FJzlVinSOFDyxozjVKsnwkBS5H1y5qKs9EMjEGKaMNc0qpyFTpDfNO10nNsb/DEzZRqPyVbKrLFyxrgzdiQpmr6xxSK3MbLurf/PL5O+BpzWIbvoT3iTqQXkMog/OJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CCh5AUiAieRdltULojbrVcpXSJCkFme0QwiMZmkzfi8=;
 b=ytyjRLx0LPGRZz6tSqeg2U0sms0HME9LffOrx9uTpk3sXUM9muBtAGm/6Yqa4rfpQYB7+jzksvAyHn7FbBJAze8qHYytSWfUGCIT8qILbCVcr7W4KK6ykZgQib6VbSaI5OmPQ3emIT+tSf+A9C+pNBp+Xqw9SZgYGWCP61C+uebaXobxq6WhmI0dBp5EGVGjR6bjEZeltXTsQSwELlUMOjU0pkPiGJ4R/4AH2kmqdWRbY+5HZX/PhpMUzEpAtuxfXnEKlWKMqLrxEd3TDvmIURDgD65jzZCy4L7YyMDQC00JAxSPdK0l+MY/EfuTzLWdSdcQu1131iMeTetep61v2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CCh5AUiAieRdltULojbrVcpXSJCkFme0QwiMZmkzfi8=;
 b=Px5jQag0FfMbQVRPfpGFsPYpoW0U1aiUs7zJ+/xPi3GR4nL6eFXauuLu5m4XYT9Du5QQI6ohPgTTiQcTKk3lGSQl0P7ILK3+vgikOWxbQMP4CHSqPPoDZiLke2ih8sxfttAxWuz0LiX1ihFbRTrTl4/oYoj24Pn0vJKvbVTnSaw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH] x86: Remove x86 prefixed names from cpuinfo
Date: Wed, 12 Nov 2025 20:18:00 +0000
Message-ID: <20251112201800.3678184-1-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.51.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0532.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::14) To DS2PR03MB8444.namprd03.prod.outlook.com
 (2603:10b6:8:331::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR03MB8444:EE_|SJ0PR03MB6963:EE_
X-MS-Office365-Filtering-Correlation-Id: a0b6f390-6059-4069-5c77-08de22289e7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oXS0DmOCEHQ9lmkBLp9xO4kFFvdLm2k1VBXKOWfZV5Yo9LJg8/jlC0CJnkrJ?=
 =?us-ascii?Q?WOlHB4FUhwPdm/w4mLQFf7UmQU+gdlufWOzlAgufeuT6zJAsgRxw8ho7wZdI?=
 =?us-ascii?Q?Q0iBp2MvtQgZvWvg3HvPbSBRFQeuD/fGfVsdpG8IB/rXW1j77sWh7EWv8pg3?=
 =?us-ascii?Q?zZzVpyH46h1GV08J+/M+wuxgDvrbtGMrzl2iZsuRkxdt0EReHkkB1B7135WB?=
 =?us-ascii?Q?jpFX2moMVk7X2HGuIVpuqfDEbwG3whFUHDyjjSBYurnkXSxzNkIFbIapJmQZ?=
 =?us-ascii?Q?zDkMAX7NnrqAOTNYG+QodYv4bcA1UD/o7lWREY3smzm3GpWNTpuHT+mUHDAT?=
 =?us-ascii?Q?tpzpS3VyomHPMgHa5oO7TdQb0tE7cAtISJ5DYdb311Rtd3ZIV41PTvTtd02g?=
 =?us-ascii?Q?sBbKWvDabnBo0c9HXJALS5plVSZboxVHGfIf7Yp3jszlMKg0RZfCP+cZvpsu?=
 =?us-ascii?Q?JKUCKnaz8pABAzU3WYGzOWdQHCDT4ZVbKHeDqoul9oM2kk3NPLFuy269SYsN?=
 =?us-ascii?Q?8GiQP7mQckOU1ayBgiLcmQ9mcbm/V2QGbC+AyuirZHY9YJ1v7TbVdKPwqM0Z?=
 =?us-ascii?Q?Q5UqA0hxR+CQou5XH5jMKvcKD07YCzDek6nWsmmaYOi2jpF5s/dEpaXh/a+C?=
 =?us-ascii?Q?TlDPN4wxd0USOPhLx2KGt3fyZ+J7oWaOj5KHg/v5FLazEkZ+n6ioUT/KnWS0?=
 =?us-ascii?Q?ZpJp9H8PPoslNPUdzg9WTWdG3yPX8ULEIhuAXGM3NiNfsg05r2pzm3L+CvgW?=
 =?us-ascii?Q?LkSg8S49/DdiojB74Pew0PfGHO5YzRLlqFO/S9yPXBUGpoGjj+hMc9dWC8Ug?=
 =?us-ascii?Q?/OUTjafXD/D2o0hfzFwVg6ddWTSefmQv4xJy22CRt6UUtFFkCBPjQ00mDoPV?=
 =?us-ascii?Q?N6aF9HxoLgJSPu9MUeiYmFl/wlPnZi9WqWxnvo5zW4fexYTt+7OZq0vKzkrO?=
 =?us-ascii?Q?v0ubH33dKqQO+dChsu0PrSmY5PHzZmneq8xKbeYqvgFmN2y0FIcTl/Ky6JiS?=
 =?us-ascii?Q?Pg2CDGC/BkL//Vi+1z/WHHoBUiDASVLegdVgR/vanK9kyrXsaEipU2OsMmH5?=
 =?us-ascii?Q?jI8exY4iG+G4M0Q42V+4M+bl9k9ExFRUZQSsrPpUTauAbzDSrF7t2ASNyy1m?=
 =?us-ascii?Q?MtiYi+Li7P9qbnVLrep6exYktmYKcRRf29PA9gFi+AuFRCCYeYdjq706l9RP?=
 =?us-ascii?Q?9Bvj3HWBwbt/x6+1qFxrnfCnXLlS2iPloRCye3Kwnd9B9EeTYPee42VZhtFP?=
 =?us-ascii?Q?vToEQTfYyF69u2+YsQwDBdc1n1KAiUz7W3ROTAjm4ygG0dqUY/XBebqdJSQK?=
 =?us-ascii?Q?BYAWqo/f58hQokYYIRbCVNASpT+jANFJkh9GWWY3ZooJkOFSVtFmwJ10yWrH?=
 =?us-ascii?Q?R5sB9m7pgYn7rGkLTTCRzv+Jaxh3+4SUfjXn8SqnUYLHxX+/DEkSgVAl9/U3?=
 =?us-ascii?Q?iBvKvJ0EdKongUZwtrCP0vvdAIN1QQZR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR03MB8444.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0LoCECpDyQleWF7/jHLwYlkH3mulBKHxN62CRFIDaE7AtnCRT5yYDAPVren0?=
 =?us-ascii?Q?Za9NlGieEPW+bFNjimYq6zjHdEjaUhZRfTm7lEgzsHsorrN5Uus6xz6OYqsW?=
 =?us-ascii?Q?5W5uWlv6SZGeMLD8/grRRs5699XRuaOWSFxaFOv80RUxksOzhAeJiRQtf4iX?=
 =?us-ascii?Q?sk90xfiLA/cdmjHPuUCRh70SDC8kJ/puiZSQ+KSRLRHfvwnlpYrJuL3p+rKV?=
 =?us-ascii?Q?nPgv9k3hrN/2mRds2xbzCy1XjovTU9EM3lKAp3XwZ+qrD8aRESBOMAF3TCHc?=
 =?us-ascii?Q?vvarG7yVwZtoZ6FLZuOwiY7q02sagX3ZcaEKVVqnOqXr2omllfbFUmBQFEIt?=
 =?us-ascii?Q?oQ/bBv7qOj0ZSiw1LrWoaiNsvhtIW3s+m6LDxTsjGIP10ASo+RJSL+5Bj2ob?=
 =?us-ascii?Q?qdL2jSQE+rdRcuII8gxv9ZdR93GexW9zLfA+emUp2t+mgtmJLzhd+w7DLF4u?=
 =?us-ascii?Q?nLNU7unVVyc+0w46TTvIEkBj94GUG2oOa/TV/7hjWLsf9JHBsfM9kyCo92Yb?=
 =?us-ascii?Q?nlqDQkkAnFH24RIZRDgoPzds+KOfccIItzvHGTTLoZ9G1hNGn1nXHo1aUsBX?=
 =?us-ascii?Q?HWCtSHrkCUXD6kpOvAymDh6mTo4aVHIzEo+BAvRoaKoy7Xx/67olXd288T8C?=
 =?us-ascii?Q?fgAt5kcSCunurnzPR13kzYPkRzkXhKGxVo/ZeVotI4du+sF85cP0r1yTU31b?=
 =?us-ascii?Q?DF4pdZwUPVY5fQX5ajDPnhDjQQME9zZ12fQiMm9qoiV1vuyUzuVjzfx0L2Rk?=
 =?us-ascii?Q?eqm9PtasLoV0stCnT6g68/ua7zswwVLLOldOoERQ4B/lKaoq9rrFSaMrSlD7?=
 =?us-ascii?Q?UUoQxwK3UUTOq0BB7j5vmsazePzGAX0jhE8ezEtU2J/AB076KFCpWHyAmpgo?=
 =?us-ascii?Q?OANl93UxMsONsbqd7EsazhTJZSv4jgu6JBPtWtP3gum0MdOKawzIyHmjD4F8?=
 =?us-ascii?Q?YLxP6bXnE4GTQsJJwYncqFxA54VTlqM4GVxcYxwzfK56mUGI3AloHhDNyNLm?=
 =?us-ascii?Q?jzvrxZIf+4Wk4KW4JZttt9PuXBaiTUnpfQ6y7ia8jQtDxBXk0hZgWwKWeCVR?=
 =?us-ascii?Q?tIBmZIcC1LvBdDIhkszzwktSNLpEzVm7DC63dnfCv4HdkDEtm+NLE+3Iak30?=
 =?us-ascii?Q?VIUuH+o9GPeOCIf+d98zxto1cHkzb96HPV30JGf6E+KA1hvyjts2w5Vu51v9?=
 =?us-ascii?Q?o4koG18m3b7ck4dBr4PW4wVlbEd91rZlEo770OcrybIQhyKpKoCpqIoQWLnr?=
 =?us-ascii?Q?wOtNaeGhM93wZDjsOPhAwwvhMUcoS660//wMoime209qA9QpT5uXaASxRuT/?=
 =?us-ascii?Q?pULxyfp/kKYwTCdSwFllIE7iYytobutXwNaVuZbtcvyGdaGoowns5Y1cdCTT?=
 =?us-ascii?Q?AvMSAlcp/9aQNLbHklaliivYnh0Q8TDV3Xm/vVM6imhKZQf9SY4y0QYcqfXY?=
 =?us-ascii?Q?csXYBJeSWEhlsnUMVEZ1ZBdDBYOkddN0gjSKCBlFxKxCKxXtBc5xHlpEAtKw?=
 =?us-ascii?Q?ndYdm9LX7KXPk6rG9YP96MmJwRlRV2rj54rl5LSaBymf8/zuywO4bW8OMb4/?=
 =?us-ascii?Q?H6oikDQpj0YVK5fKrueTv/vhIUFRG/EVVCv3roMY?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0b6f390-6059-4069-5c77-08de22289e7d
X-MS-Exchange-CrossTenant-AuthSource: DS2PR03MB8444.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 20:18:18.7145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nCqcOlDlhNWdERj5Qfcs7GTxtM40fo4v7ZSyKyac0znKHhK2wlWRHdsuD0DxmYSquR00Xok6KXZXnCrYOwK0iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6963

struct cpuinfo_x86
  .x86        => .family
  .x86_vendor => .vendor
  .x86_model  => .model
  .x86_mask   => .stepping

No functional change.
---
 xen/arch/x86/cpu/intel.c                | 32 +++++++++++++------------
 xen/arch/x86/include/asm/intel-family.h |  4 ++++
 2 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index 6f71365b7e..36e4c71802 100644
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
@@ -657,8 +659,8 @@ static void cf_check init_intel(struct cpuinfo_x86 *c)
 	/* Work around errata */
 	Intel_errata_workarounds(c);
 
-	if ((c->x86 == 0xf && c->x86_model >= 0x03) ||
-		(c->x86 == 0x6 && c->x86_model >= 0x0e))
+	if ((c->family == 0xf && c->model >= 0x03) ||
+		(c->family == 0x6 && c->model >= 0x0e))
 		__set_bit(X86_FEATURE_CONSTANT_TSC, c->x86_capability);
 	if (cpu_has(c, X86_FEATURE_ITSC)) {
 		__set_bit(X86_FEATURE_CONSTANT_TSC, c->x86_capability);
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


