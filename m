Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A608CC8708D
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 21:28:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172201.1497297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNzdM-0001Ft-Na; Tue, 25 Nov 2025 20:27:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172201.1497297; Tue, 25 Nov 2025 20:27:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNzdM-0001Dq-Kg; Tue, 25 Nov 2025 20:27:32 +0000
Received: by outflank-mailman (input) for mailman id 1172201;
 Tue, 25 Nov 2025 20:27:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cr80=6B=citrix.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1vNzdL-0001Di-Cm
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 20:27:31 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27808815-ca3d-11f0-980a-7dc792cee155;
 Tue, 25 Nov 2025 21:27:25 +0100 (CET)
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by MW4PR03MB6666.namprd03.prod.outlook.com (2603:10b6:303:121::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Tue, 25 Nov
 2025 20:27:20 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::c0cd:bcd1:5235:66f0]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::c0cd:bcd1:5235:66f0%7]) with mapi id 15.20.9366.009; Tue, 25 Nov 2025
 20:27:20 +0000
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
X-Inumbo-ID: 27808815-ca3d-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FJUuGiI5b0qTrP7pLVqtot3SLcHVfnegC5c7fHUk48E9XtzRbOkuXvGaL6BQPwj5oMT+p+UFWaxnunvXTH/GcljOjdBzN7dCvJFwczCpkf0uEC+rhO/oI0HUBB+H07KW4E5xXJPPb9bt7m9nkpC2xUPfBicVJfw2VSbfHrdMQzmgSj+KztXr/lycE6SUSfBAzIdBCU/C49J0EJgKJShC0mVEHmVNvtYTM7SpwjofC9SmlXF4eqUvslgk0FuBcmNYXbb1m3KHHvktie35cswm2cjDZG5/XKIVqOUL9rrFaov6sSqW/x9srzDZBlUxe0mrGKU4W3sfr6rHXBpCEBm7/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8s3WFgrifwPUaRSx/Hqib24IMP8kMT/dr9tOWlFgbSA=;
 b=oXo/bKMXjPCdHqfITWfHr6EucD6W5XCvy17mXD/t3gEqBmCY8cAXWsC8ZAMTkZHPEfrSAmX9tM5b+ObufSSuNR+MNQ1zvig3cQdBH3RNEh+o3/UodOQ7D9686+Avjo0JZhYEvfv5I+lsgy5vi0r4lFBYXJmKlWQgZPpKA4FHTGTCT9xCMFKM9HKtY+7jNsVBfVQ4rW2s9y6E7wOuB5yLoYIgA98oohQ0ylqEnROeerDboYiLdHO4C7nNUBAyRsMvS03Uw5Ewc0tLirT9r4JRb0ksV9C3jfYSAslU6CIrd32Sw0G7anU4OH9oFQ8TFnzDQXu9auu50vj2RSWZV1uuxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8s3WFgrifwPUaRSx/Hqib24IMP8kMT/dr9tOWlFgbSA=;
 b=dcVyi+76aXhzkcWUNqD8LLIqzD6NZRRxu14WOatNt8Wr+lHzVfVoMTkNuplsLVvZ0/721A/kwv3Mck9utZEdoao4SvAemS/0e4S6ieE7r7JeBh0IdFrOWYCxwsOpYtGHris8y2g2pt6NPs0iE6xvb9Z8y1ziPnYtfJJkWfAJHH0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v2] x86: Remove x86 prefixed names from cpuinfo for intel.c
Date: Tue, 25 Nov 2025 20:27:24 +0000
Message-ID: <20251125202724.1384622-1-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.51.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0024.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::16) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|MW4PR03MB6666:EE_
X-MS-Office365-Filtering-Correlation-Id: 61791472-56e7-49b5-8e4e-08de2c6108f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6TeGlnJAreA70ZeAhWefPfU/itlwbeyZLwlO03cfjaljEyyRHi4AGsXJD7Z0?=
 =?us-ascii?Q?f5sNK9R7Hn3g4Ex5/BtgE07PDKHYHKYOz/qoAofL4rL6zNLPMMh9hSGcAZSx?=
 =?us-ascii?Q?3pQVtwrAhcgBdI2rn29ITgm64Lf44KdEGmYFnAugYfQOnzjz/ALgam5jvev4?=
 =?us-ascii?Q?fiBqgzSuikiUKF6vaRiLgtZlg2z+jr0VttE7/E7zhXKm33lSTuEkHrIFpPhY?=
 =?us-ascii?Q?2HcVn5JyS4Lio8/ASx8np+kl0rD5FjreRWu+wjqqU4Arkee6/7tCz7nixEOL?=
 =?us-ascii?Q?kvtP9VpTxkzQdVIszRpjSNiD32oHbDoL6GxZROedz5Mz0ISGGY9YZEHnkYFO?=
 =?us-ascii?Q?1nTRGEErAdsKpmTqlLY62CpzQYxoft2G5xipR47TEoX0D/U1m7pFlIMT029s?=
 =?us-ascii?Q?dw46OGPhLg8/D9mHwNtwSpzXhVRgX6oSmSH35eT1rco0e4IcnFVTtjO970W+?=
 =?us-ascii?Q?kL9g/YtlZPKC3Aye+WB4oKbyF9QOG9c8PZcAwFh200bgszScQDOyFQD+T/gM?=
 =?us-ascii?Q?85Tihvuy7NL9H4sHc1D8jCK49JAmbv7+5rIorg6LolQY0LJ9JxdnpTH416nZ?=
 =?us-ascii?Q?IPXBia8T1BCUXC/G2itqTcbhAkt02D47ijs8LCfx7KunaicdETwi4/dFeg7U?=
 =?us-ascii?Q?QEqOczZyWBHbitaizv8OWNrP9p0qkRu4dkDm8y2t9QmuN9jaN5wY0XmprAAe?=
 =?us-ascii?Q?c/yHjCJOfckWJkSggq1s0DNgtrRGbTBUVB7Dj9fbMcDiKFsRF4AdybkFdPYC?=
 =?us-ascii?Q?0x38av+RQAtCwCJ87JYD23U829CCos+hxQezjXxv+6V970cxEPyV6hNTGuF7?=
 =?us-ascii?Q?XfGBPZYv5ILvAvkGqW2wGKBHYDvpHCzN9VTojb1zhlNysryuRMzgkXXivKrA?=
 =?us-ascii?Q?xCt3LTvgQCrGJ4mkE0DRIp5B0omSFMmTkU+lxQ8nZEOy/POPq/FXeixoF3no?=
 =?us-ascii?Q?xgfawtlfdxqx9uUxYFiJ8hcuffGyYTcE/SsIJlpzI/PAT7qoOU72YYqVoflE?=
 =?us-ascii?Q?xWG4PFmjRC8+zj7yHAyQcNPVwO1i3pWeoQlzXCifrzWDTUelQvB0gbNWt5ds?=
 =?us-ascii?Q?VlMulZsfsBRTo983pCnBSBRDOX1o9Ej2vwJIf26olgSl2rwG/fkkg3oi+q+1?=
 =?us-ascii?Q?s0utzJ14rIQ4Q+49PcsyfcfgxB/AdBdY1fhICu9iTifRaRdg9JBd6xg136js?=
 =?us-ascii?Q?teM+92OLjoVL7luLv/WBNfAl97OQgkk8PAWdUcMhIFrELPkX6vzkmVBHxVrv?=
 =?us-ascii?Q?fsN+aH84xWJwTkS7p9XkDThttp3CNVTfvD0Cas9QTS+xFSboxmPJVzSs7+US?=
 =?us-ascii?Q?Jxevi0Kol1GYSsaX5srrEnYnHp/8BLmCYw1h7+YIS/A9BG2bb8gXeyC40m3d?=
 =?us-ascii?Q?V+/UEU4ecdDu3AsA1tIQbQsxYcXa6Hv6PD1A6/V2Ud9u5V9CqRBePFJbUxPu?=
 =?us-ascii?Q?TggBp7FS2AyWfdoTDHOR+C310jfEFXNP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?adcxfMuMOu9ACYI1vHUZks6p2exeaN9SCKFUjXCUmbZHq7l/s/mqHk2hyKEe?=
 =?us-ascii?Q?xMovgRTwYjYN7xvcPdy0UAUIxFOguAgOLrfJJNfRMiutwHbJGhYeTFvQi2yB?=
 =?us-ascii?Q?p8E3AQYLUMfd5sOKr2DMhPhOj7FKMHCQw/TsOfjx1CxKtyBE6HnVAv64V6i7?=
 =?us-ascii?Q?RrSPU5bWc8Vh7eyCs4o3/T8CwxQVdhhDhsxWOmVhiqWBNneL2V5Bu/ECel7T?=
 =?us-ascii?Q?+Op2vsVv/H+sxRiwLo7WzVnoGe1p3jjLl7hqxm9YFjCKmkeoH1/VyL8pjHmJ?=
 =?us-ascii?Q?RkKOqK94iQ3R1o69DWMm1xx6QRB543JhCVc/+KcMvo5V+zRVNGD8Z7TYCMs3?=
 =?us-ascii?Q?ytiqsu99zpP6wPqwhkgJi3fUegePoUWkCLltNH7tXec+/5XZB3nBwONssVev?=
 =?us-ascii?Q?esQp55Z2rJBE0A6ijqrPh1CYbRDRvXjLfj62452LK6WRZI2eQaxq4dU/om/T?=
 =?us-ascii?Q?N8ts4uhLrXKwpozDZ/B5De8E8IIW8wpNxTo+YI/VRltNb+1W4IbQQLaIQsK4?=
 =?us-ascii?Q?V8oziXgh2eAwNXhnsFmp7tIgJwWIlvY9ynl8ZMLkB6sij86Q/9lt159FqoPf?=
 =?us-ascii?Q?xoqeffOKjnb8+0+TQu/BNpVpZ7L+0MYg+IWKYcI7H5ZpOEtTK3frxU17lSBe?=
 =?us-ascii?Q?ijpeWlMyk36mMCigeSzx5aYpzfYhayZAeKXQtA4KxBmFbPR81JVTz/NRq16E?=
 =?us-ascii?Q?kvPcCRA7FcdWv49AOIjHIFwaTh6+NXPo1Bed7PozHKLCwcd/qOzTxwBPY03z?=
 =?us-ascii?Q?N/8EHHo0JHSbHeOf6F0mtmlvK6OKxU2belShsCgJyLWQEU6sFWE7hOfpCo2Q?=
 =?us-ascii?Q?PRqcS2GQ2jnx6xheB+ySapNhACk7MafpCTwz3eBu5Yc9GYweLHoriia4SscU?=
 =?us-ascii?Q?e+0qkDviXcm9mt7bq/o3usTR/lZHoq9t2OXUHCfNsWg/rm9BbCYGH6u7/Tae?=
 =?us-ascii?Q?iIUaOdxLpRbz8ZtT5ocYWuV7ddg92cbP5J6ThExy7+XXgLp1uH5CQJ1s9+kc?=
 =?us-ascii?Q?7HHHTd7qA21yPpLoGAu4hFNjDKtL19UrNJA2EUcSMO35RX5z7K/S74xomscQ?=
 =?us-ascii?Q?pCpxA5vgMtSfSf091HQbPo+dbyQNkLnBuJ5Q6QLaatoB4ZExosZ0+EM8bG+K?=
 =?us-ascii?Q?LRVgiagt8ZA7RjjBUygYVPgwR/dId6hqPLlYAb9D1Y6hk5I+Et43igiAhA8i?=
 =?us-ascii?Q?CX7CzMPIIetYApayUZ4TFoRzQbUO61439KWy4QR3B13ww2MVTGDOfiPMpqMS?=
 =?us-ascii?Q?N25TA9+lyQF94bfWu7wgk9DN8DCchhoD8ch1T3GPkS0F7dWuE/3QKGCQgC4j?=
 =?us-ascii?Q?H10UlE/8vBoHIqNeI8PmSg4id7qLL9sXZbdpIHJWhgYdxrb/D8A6mV7aQb9B?=
 =?us-ascii?Q?ibWqGapRR9p9KeWf1fH6NefXXWFEXx6d3bCkwpNBsg6Zy3SW56BKowUY8l65?=
 =?us-ascii?Q?e5NCU1o86kCtLvrTjGJCMYdGVXLC3HBewPqD0eb4BJybxERM7cKFcDc55Bms?=
 =?us-ascii?Q?FbYtNbnkS7EOxN3WePd5J5G/BPclVTv2fosWioVFN+kJo9cRK/R7MUtDQ+ag?=
 =?us-ascii?Q?EJrERvbXX5XmMpSG/s28GyaX380nW1eiHq0Bh2oa?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61791472-56e7-49b5-8e4e-08de2c6108f9
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 20:27:20.8062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C+s2ccWbvUpiICb4T6X31nN+CFPv9vbDri4nfKnVmH8VOxgfTVWLH/oNyd+q/MPMPxY+UFwXBDH3ZcV5BQ+khw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6666

struct cpuinfo_x86
  .x86        => .family
  .x86_vendor => .vendor
  .x86_model  => .model
  .x86_mask   => .stepping

No functional change.

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
Changes in v2:
- Convert the two switch statements in probe_masking_msrs()
  and check_memory_type_self_snoop_errata()
- Requested style changes

 xen/arch/x86/cpu/intel.c                | 112 ++++++++++++++----------
 xen/arch/x86/include/asm/intel-family.h |   4 +
 2 files changed, 68 insertions(+), 48 deletions(-)

diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index 6f71365b7e..1edc95b046 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -86,18 +86,19 @@ static void __init check_memory_type_self_snoop_errata(void)
 	if (!boot_cpu_has(X86_FEATURE_SS))
 		return;
 
-	switch (boot_cpu_data.x86_model) {
-	case 0x0f: /* Merom */
-	case 0x16: /* Merom L */
-	case 0x17: /* Penryn */
-	case 0x1d: /* Dunnington */
-	case 0x1e: /* Nehalem */
-	case 0x1f: /* Auburndale / Havendale */
-	case 0x1a: /* Nehalem EP */
-	case 0x2e: /* Nehalem EX */
-	case 0x25: /* Westmere */
-	case 0x2c: /* Westmere EP */
-	case 0x2a: /* SandyBridge */
+	switch ( boot_cpu_data.vfm )
+	{
+	case INTEL_CORE2_MEROM:
+	case INTEL_CORE2_MEROM_L:
+	case INTEL_CORE2_PENRYN:
+	case INTEL_CORE2_DUNNINGTON:
+	case INTEL_NEHALEM:
+	case INTEL_NEHALEM_G:
+	case INTEL_NEHALEM_EP:
+	case INTEL_NEHALEM_EX:
+	case INTEL_WESTMERE:
+	case INTEL_WESTMERE_EP:
+	case INTEL_SANDYBRIDGE:
 		return;
 	}
 
@@ -137,28 +138,29 @@ static void __init probe_masking_msrs(void)
 	unsigned int exp_msr_basic, exp_msr_ext, exp_msr_xsave;
 
 	/* Only family 6 supports this feature. */
-	if (c->x86 != 6)
+	if (c->family != 6)
 		return;
 
-	switch (c->x86_model) {
-	case 0x17: /* Yorkfield, Wolfdale, Penryn, Harpertown(DP) */
-	case 0x1d: /* Dunnington(MP) */
+	switch ( c->vfm )
+	{
+	case INTEL_CORE2_PENRYN:
+	case INTEL_CORE2_DUNNINGTON:
 		msr_basic = MSR_INTEL_MASK_V1_CPUID1;
 		break;
 
-	case 0x1a: /* Bloomfield, Nehalem-EP(Gainestown) */
-	case 0x1e: /* Clarksfield, Lynnfield, Jasper Forest */
-	case 0x1f: /* Something Nehalem-based - perhaps Auburndale/Havendale? */
-	case 0x25: /* Arrandale, Clarksdale */
-	case 0x2c: /* Gulftown, Westmere-EP */
-	case 0x2e: /* Nehalem-EX(Beckton) */
-	case 0x2f: /* Westmere-EX */
+	case INTEL_NEHALEM_EP:
+	case INTEL_NEHALEM:
+	case INTEL_NEHALEM_G:
+	case INTEL_WESTMERE:
+	case INTEL_WESTMERE_EP:
+	case INTEL_NEHALEM_EX:
+	case INTEL_WESTMERE_EX:
 		msr_basic = MSR_INTEL_MASK_V2_CPUID1;
 		msr_ext   = MSR_INTEL_MASK_V2_CPUID80000001;
 		break;
 
-	case 0x2a: /* SandyBridge */
-	case 0x2d: /* SandyBridge-E, SandyBridge-EN, SandyBridge-EP */
+	case INTEL_SANDYBRIDGE:
+	case INTEL_SANDYBRIDGE_X:
 		msr_basic = MSR_INTEL_MASK_V3_CPUID1;
 		msr_ext   = MSR_INTEL_MASK_V3_CPUID80000001;
 		msr_xsave = MSR_INTEL_MASK_V3_CPUIDD_01;
@@ -191,7 +193,7 @@ static void __init probe_masking_msrs(void)
 	       expected_levelling_cap, levelling_caps,
 	       (expected_levelling_cap ^ levelling_caps) & levelling_caps);
 	printk(XENLOG_WARNING "Fam %#x, model %#x expected (%#x/%#x/%#x), "
-	       "got (%#x/%#x/%#x)\n", c->x86, c->x86_model,
+	       "got (%#x/%#x/%#x)\n", c->family, c->model,
 	       exp_msr_basic, exp_msr_ext, exp_msr_xsave,
 	       msr_basic, msr_ext, msr_xsave);
 	printk(XENLOG_WARNING
@@ -265,7 +267,7 @@ static void __init noinline intel_init_levelling(void)
 	 * so skip it altogether. In the case where Xen is virtualized these
 	 * MSRs may be emulated though, so we allow it in that case.
 	 */
-	if ((boot_cpu_data.x86 != 0xf || cpu_has_hypervisor) &&
+	if ((boot_cpu_data.family != 0xf || cpu_has_hypervisor) &&
 	    probe_cpuid_faulting()) {
 		expected_levelling_cap |= LCAP_faulting;
 		levelling_caps |= LCAP_faulting;
@@ -348,7 +350,7 @@ void intel_unlock_cpuid_leaves(struct cpuinfo_x86 *c)
 static void cf_check early_init_intel(struct cpuinfo_x86 *c)
 {
 	/* Netburst reports 64 bytes clflush size, but does IO in 128 bytes */
-	if (c->x86 == 15 && c->x86_cache_alignment == 64)
+	if (c->family == 15 && c->x86_cache_alignment == 64)
 		c->x86_cache_alignment = 128;
 
 	if (c == &boot_cpu_data &&
@@ -358,8 +360,8 @@ static void cf_check early_init_intel(struct cpuinfo_x86 *c)
 	intel_unlock_cpuid_leaves(c);
 
 	/* CPUID workaround for Intel 0F33/0F34 CPU */
-	if (boot_cpu_data.x86 == 0xF && boot_cpu_data.x86_model == 3 &&
-	    (boot_cpu_data.x86_mask == 3 || boot_cpu_data.x86_mask == 4))
+	if (boot_cpu_data.vfm == INTEL_P4_PRESCOTT &&
+	    (boot_cpu_data.stepping == 3 || boot_cpu_data.stepping == 4))
 		paddr_bits = 36;
 
 	if (c == &boot_cpu_data) {
@@ -458,7 +460,8 @@ static void Intel_errata_workarounds(struct cpuinfo_x86 *c)
 {
 	uint64_t val;
 
-	if ((c->x86 == 15) && (c->x86_model == 1) && (c->x86_mask == 1)) {
+	if ( c->vfm == INTEL_P4_WILLAMETTE && c->stepping == 1 )
+	{
 		val = rdmsr(MSR_IA32_MISC_ENABLE);
 		if ((val & (1 << 9)) == 0) {
 			printk (KERN_INFO "CPU: C0 stepping P4 Xeon detected.\n");
@@ -468,8 +471,10 @@ static void Intel_errata_workarounds(struct cpuinfo_x86 *c)
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
@@ -540,7 +545,7 @@ static void intel_log_freq(const struct cpuinfo_x86 *c)
         }
     }
 
-    switch ( c->x86 )
+    switch ( c->family )
     {
         static const unsigned short core_factors[] =
             { 26667, 13333, 20000, 16667, 33333, 10000, 40000 };
@@ -553,10 +558,13 @@ static void intel_log_freq(const struct cpuinfo_x86 *c)
         if ( !max_ratio )
             return;
 
-        switch ( c->x86_model )
+        switch ( c->vfm )
         {
-        case 0x0e: /* Core */
-        case 0x0f: case 0x16: case 0x17: case 0x1d: /* Core2 */
+        case INTEL_CORE_YONAH:
+        case INTEL_CORE2_MEROM:
+        case INTEL_CORE2_MEROM_L:
+        case INTEL_CORE2_PENRYN:
+        case INTEL_CORE2_DUNNINGTON:
             /*
              * PLATFORM_INFO, while not documented for these, appears to exist
              * in at least some cases, but what it holds doesn't match the
@@ -572,8 +580,13 @@ static void intel_log_freq(const struct cpuinfo_x86 *c)
             factor = core_factors[msrval];
             break;
 
-        case 0x1a: case 0x1e: case 0x1f: case 0x2e: /* Nehalem */
-        case 0x25: case 0x2c: case 0x2f: /* Westmere */
+        case INTEL_NEHALEM_EP:
+        case INTEL_NEHALEM:
+        case INTEL_NEHALEM_G:
+        case INTEL_NEHALEM_EX:
+        case INTEL_WESTMERE:
+        case INTEL_WESTMERE_EP:
+        case INTEL_WESTMERE_EX:
             factor = 13333;
             break;
 
@@ -583,7 +596,7 @@ static void intel_log_freq(const struct cpuinfo_x86 *c)
         }
         break;
 
-    case 0xf:
+    case 15:
         if ( rdmsr_safe(MSR_IA32_EBC_FREQUENCY_ID, &msrval) )
             return;
         max_ratio = msrval >> 24;
@@ -657,14 +670,17 @@ static void cf_check init_intel(struct cpuinfo_x86 *c)
 	/* Work around errata */
 	Intel_errata_workarounds(c);
 
-	if ((c->x86 == 0xf && c->x86_model >= 0x03) ||
-		(c->x86 == 0x6 && c->x86_model >= 0x0e))
-		__set_bit(X86_FEATURE_CONSTANT_TSC, c->x86_capability);
-	if (cpu_has(c, X86_FEATURE_ITSC)) {
-		__set_bit(X86_FEATURE_CONSTANT_TSC, c->x86_capability);
-		__set_bit(X86_FEATURE_NONSTOP_TSC, c->x86_capability);
-		__set_bit(X86_FEATURE_TSC_RELIABLE, c->x86_capability);
-	}
+    if ( ( c->family == 15 && c->model >= 0x03 ) ||
+         ( c->family == 6 && c->model >= 0x0e ) )
+        __set_bit(X86_FEATURE_CONSTANT_TSC, c->x86_capability);
+
+    if ( cpu_has(c, X86_FEATURE_ITSC) )
+    {
+        __set_bit(X86_FEATURE_CONSTANT_TSC, c->x86_capability);
+        __set_bit(X86_FEATURE_NONSTOP_TSC, c->x86_capability);
+        __set_bit(X86_FEATURE_TSC_RELIABLE, c->x86_capability);
+    }
+
 	if ( opt_arat &&
 	     ( c->cpuid_level >= 0x00000006 ) &&
 	     ( cpuid_eax(0x00000006) & (1u<<2) ) )
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


