Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA85C8B8E1
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 20:20:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173350.1498405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOL3I-0005ma-IB; Wed, 26 Nov 2025 19:19:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173350.1498405; Wed, 26 Nov 2025 19:19:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOL3I-0005l5-F5; Wed, 26 Nov 2025 19:19:44 +0000
Received: by outflank-mailman (input) for mailman id 1173350;
 Wed, 26 Nov 2025 19:19:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cuhx=6C=citrix.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1vOL3H-0005kz-E8
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 19:19:43 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db6593d0-cafc-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 20:19:42 +0100 (CET)
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by SJ0PR03MB6950.namprd03.prod.outlook.com (2603:10b6:a03:418::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 19:19:38 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::c0cd:bcd1:5235:66f0]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::c0cd:bcd1:5235:66f0%7]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 19:19:38 +0000
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
X-Inumbo-ID: db6593d0-cafc-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jD4GBj3NWDrh9x/rvotRUCQN1v5TR8xiI2ENykNmgh+z+6Vj/xw9gK1dJrCjWGHZqSnDa7XX7NGF/dyho613r+ZbBfEEUnvKOIW+y9DGb3Vj42sCAeag1DfOPEs7LZdtOZWnKQxOD8NSzu0UZxneRl2NX3dq793F7MBErjZi1moI758HRlxg+J1coNt/784L/hETZ2c5NPdjKauqXPtBbj/nCCzUd4Xnf0OHhAaJ+VJYrYmp/joDfjfdylfT/Drz/d+o/37Xem9rQkxGI01Z1uctl4R+LEbuhHeVT/5YOg60PrLQgqRFNkg1rqpt56eXK0KqqXp45wZFPCJUXBXyOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BE+ibRSG8wXu9ibV6TMSwMpVps6UBzohxyyyaAcoQAo=;
 b=Fmuselvd3RrQWxnjVgmZVNqnCJqEQMYr2YtpaaF2Ns+s1ml01462R7G4068IMYpC/h642sziGEhkzc1gj+e7cyum8WaymvNYVL/YJkm0xPwGpmoI6lUsOQUWPXD3uCXFLOl6aWLYEg/xIJ8N1PLDlcpbHx6QEO8zKrKfrSD22H9NcBU/X36OEgLqG7RhKUZauleQWqn8nShFcvLNl2yR8V8RJYnfIlNYJWpuub85WgLjpCcIxPOfruqvX6iJOjJ1K3oQTUFT8HQ0xmv7DWowelPKA2eIdgDX+U7844kwd/TmxRm9eft2x7qvS0F/rYbeoqyD4fAuJYUVrrWZHzA8MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BE+ibRSG8wXu9ibV6TMSwMpVps6UBzohxyyyaAcoQAo=;
 b=tz3vjEinGD1BIJg5oBD/TPjWQ7Y0U4VKB1qhTuGoEaCHHWE9lc+sIhu7+XaQtZaLtuLa3fYCXyw6vAshtcbYV66dLvfd9FXWW9mqjoLmQ1mxmSGTFjqc2x5tfsV+0HunCpD5vxDYyW8XSNaDzfXQezwOtjS/8wFVECP0kA673Mc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v3] x86: Remove x86 prefixed names from cpuinfo for intel.c
Date: Wed, 26 Nov 2025 19:19:45 +0000
Message-ID: <20251126191945.3386781-1-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.51.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0035.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::8) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|SJ0PR03MB6950:EE_
X-MS-Office365-Filtering-Correlation-Id: f44a8af4-cd0b-4141-f2c1-08de2d20be1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BZOOV0M+3gLFX5AphnkJViuZPGrhnEUzPXEKd0DMegvShBaPud5cWhuqx5lw?=
 =?us-ascii?Q?L1BYh+t7xuGZQkTDMe4Ex3THjMURlPAEpw/Z5LtPQp8fieD0dlSgR9ZiIsFR?=
 =?us-ascii?Q?z9+aEPtnVpXwvoTINA42E23oO/FovOAbmlQp0aqd9EjdwX6VYhMWYUR5HeIG?=
 =?us-ascii?Q?mu0PyFBOc4MG5+XgeD0Acc4oOrcsXaoXeUoCL7i+a/dX+ljyu0pT4iV1fK8H?=
 =?us-ascii?Q?IUNsMC/UQtAhw87Lp2sudW5w61Nu8aWAWumnEIhWktwrjlNkkGRqz4+a96P9?=
 =?us-ascii?Q?l36Y8a/MCKlX1Pj0aMYxwgUsSLFg1Mz1uwKyABo1td6gffQ6hj3iHuli9Yov?=
 =?us-ascii?Q?MlemIbJHsu+9daKal4WULJZmzd8tYAcA+gFzoW418scJftxwcL0U/ZgzRpoU?=
 =?us-ascii?Q?mtlDYOZDhV8WavLYSwU1Fs4BI7Tn+CWparTH5jfY7dIWL38hOv+ufpne9mX5?=
 =?us-ascii?Q?wK5XtYbcmwWoh2EgKmz8+SRY9Ih8d5V49TzsCxdFz8O5+snFDWwWpsRQZOqJ?=
 =?us-ascii?Q?autsboFAdRDJ2M3uoYTjElLD3Ykw6Wyhj4U0HE/W+czI/5T9lUw5FW5nO237?=
 =?us-ascii?Q?Y6NUPgsFAJ9ykgh5sJHzRyfTkuOejIzfTfDoD+Blz6a6/oR59Jv9G4P+ZNve?=
 =?us-ascii?Q?niohEbCakrMb/9nSvcn08GAU+inHYq4UzYyPvtGve5FLBcVDQ51M6bGyp6z8?=
 =?us-ascii?Q?PRiHSpw3/PcyZ6pzSQcUcZtpZwWnTXmrV0maiI2SreNU2cbYtJcEr6ijZxRR?=
 =?us-ascii?Q?UxYzdpz3JYNQtLnQSobWeZWAYEXRNbQW+WKhL7V5s+1qYVkXTeKG3iD298Lx?=
 =?us-ascii?Q?juGEmZnYJdFq8yL9W3nAjLL2RKiOhxtnmTLuWQjIcj2B4R1HDpuBTK7dAPey?=
 =?us-ascii?Q?EvAfYJ9RAsfUem0li78rKrt4OEQ+9uPaTbboIicaM1GE5NM4rZOGK0zSMPuA?=
 =?us-ascii?Q?OLu8reVvktmiedK65Bh395RVpKMiYoJjFmpN3xQKrOortXSxX1tvoX3XLfy1?=
 =?us-ascii?Q?1Am4R8YMGa76pmKNNOzFydw9WGVoqa8B9+YJwhUgxcY7i9iQ6ToAH0Hpd+zF?=
 =?us-ascii?Q?sxisOdI34Dt4XUiwh4S3Z6PPY3OVJ6d3NB2oVAC/XTcQUx1dqIp40fVRjscQ?=
 =?us-ascii?Q?ex+NqFfsCDZVvPZSKRS5KQgiPM0X1tLv13TlIWhfeHIkp2siDQQuDPp+WyyX?=
 =?us-ascii?Q?CSBcTay1TO9Rvu6SfeL2VaP3B70j+bGIFEGT1RgJoue8yleGnAqb+1MYD0sU?=
 =?us-ascii?Q?CWb5KxD+HQfwW/h3yUn34rjnp+KTPp3tzKgtvkLjOoY3St3InCAQlzk8+1LN?=
 =?us-ascii?Q?u0oWFecwvZLCDR8Hz1zGMUsdLoakrFuiPdgTqiym211lH5bjkUeDz09fZKFC?=
 =?us-ascii?Q?Gi3nFbktQjL2gtw5F0hY0uLlPg+v5fD/Zf9tRe38XcVl50hEyB5Pa6bnqf1A?=
 =?us-ascii?Q?0eOTLbi5JWJJIfU677xO90Fav+AYX4mv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VcJ/M9JSUbsYjn+3C8/Q7SwgxuTLgMBmoiUXJjItf/GhffHjUeZZZdKu19nW?=
 =?us-ascii?Q?F0STHVCkaO+wdnBvRQ7NwBtiRQAK1QBpgQF0ZtvGNB+YGpo6fr8cOlKDN6k6?=
 =?us-ascii?Q?m6c0BHWKDD5g2UJcLSX0M4RT+e5efnCAA4ZyeTLL/5t730AhBODNEjWdMdqD?=
 =?us-ascii?Q?tEzCFo1ika9ACDLohSEuxlzkLTGV1scke75PeZKWM8MGeBuJqjA8MAA6QOVu?=
 =?us-ascii?Q?BpSjrCOHVlNCEnZDsmCERX634IbVvWBJ/FKh7svniWBPoJNOja2AhsnpUwQX?=
 =?us-ascii?Q?PB7sRoWvB+fPbb3pCCmEvBMXGhgQxCcSR71zjPDwSX1D3j7Ffd2D0Pooo3VM?=
 =?us-ascii?Q?8Ng3TmKMoqt5yjAfZF1owYJNw1fIbf8ZiqR1figCzZzpgqwwlROScdd4xiIk?=
 =?us-ascii?Q?vfHvDeQcZjFGcuYhP3wmF0X4mqn3VoG5ncI6IzQKOIMoEaKmLyfd0iVzEfWo?=
 =?us-ascii?Q?lPpE9dbR33peY7vmB2yFdjxOcmPstqaCSggAmcyQ1GanpwumAKum8HIhO5g6?=
 =?us-ascii?Q?DuCTwBy6vVQd/EUlTjpLBv1nIRvLr/N5QsFofnFwwaHagg4Gr1CIFIWmjqp7?=
 =?us-ascii?Q?dJsbg3bVwXOO8fgsnQ8KDTl9Tfjn9ZGpGuqlB9cIZajEtT9IlNyaEOOClTAS?=
 =?us-ascii?Q?9t3BlvO9XGPF540MEXDYwNoWea0D4rKj8flKrbvkpauIz/chm8eNhGA3Xs1Q?=
 =?us-ascii?Q?lTC1gV2BLJ/f9qHmRM2Z8kDwys1AcGAHYtGK907UJfkWtovRvWgsyh9maUwB?=
 =?us-ascii?Q?vur5O7uz/WhurHy6KF+QCURywjV4UfbNR3Xgd8htoBlQ4CvC74nZoB7HiBZb?=
 =?us-ascii?Q?ZBazxigtkYhX+OO7v404co0i2KQJDS5v/LIzvRCAAstMkReszWT/6g5lhyk/?=
 =?us-ascii?Q?QUlWCdSrhGJfWqICHWac+KHdig2Oniqh7biM/4nk59PwHiY/uY81Vqv5e7Wq?=
 =?us-ascii?Q?/p9g5A7cfXBzoJIWObvciVq8uZbdGswfydcdGQc5iWYhSj6xTbbKzY4pfmQL?=
 =?us-ascii?Q?V1ajyFyT230+z/eR7ekU+CFb62p9gaqUJiOgPN/VGTyoGAv0j/qgzp2+Vv96?=
 =?us-ascii?Q?RJnWwSQQQAbWzkkvPvm3pLBJLO0D0ZFj9/Rx74uiDn+veib13L1YXMX2u/rt?=
 =?us-ascii?Q?UzceWBdKQ8EFFjz5hjJTNxwCWIwjEmt8RQNNno/+OiiS32b7P8BJTABJHRLi?=
 =?us-ascii?Q?Wsu2dEUGWhzcyyqCiwImiVA5hxYnCiAALuYj8C9daJ+o025A0YWvIiLEuCJ4?=
 =?us-ascii?Q?iRHQUVRZUF9PaUMJK3HYEWngAkGGKbRE+3f4/4u8gUu/yXgC10/Y/VQvWBnO?=
 =?us-ascii?Q?9tKzOCe+KitPuYtgy/G8BqtQVrOeUtx4GpzR4J70GiZX7twg5KY3V0bYqXSq?=
 =?us-ascii?Q?JYfuHTOpHGuDZ1jt/YdqlcoXN3Ln5FGeYlB5Ar6KflGW9d83fvJlU3j8ATBb?=
 =?us-ascii?Q?Oz0StSQbFrAZeTJ0FmWOf6B9SKHfhmZCFOPaiywAjALYtbhk6+xk3B8lbCj5?=
 =?us-ascii?Q?huJCBW2so8WJPtUhvj2fzhD6NId7KzHsWybUopeM+FgAvv9JJigyW/ZsKdtE?=
 =?us-ascii?Q?Oxdw2xvJJScVDXIxVsM/GeOHdU+RzvPL/6Fg1CcH?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f44a8af4-cd0b-4141-f2c1-08de2d20be1e
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 19:19:38.5962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aSx7TY1M4DxCqqxG5DEitIibQo95vWBMLT2nKE972HPL9Ha6qIzdSkkYR3twhyg/7GJ6gqBkpKtC0UrdI1VVfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6950

struct cpuinfo_x86
  .x86        => .family
  .x86_vendor => .vendor
  .x86_model  => .model
  .x86_mask   => .stepping

No functional change.

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
Changes in v2:
- Convert the two switch statements in probe_masking_msrs(),
  intel_log_freq() and check_memory_type_self_snoop_errata()
- Requested style changes

Changes in v3:
- Re-order the CPU model names in the switch statements
- Better style changes

 xen/arch/x86/cpu/intel.c                | 99 ++++++++++++++-----------
 xen/arch/x86/include/asm/intel-family.h |  4 +
 2 files changed, 61 insertions(+), 42 deletions(-)

diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index 6f71365b7e..ff20f5667f 100644
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
+	case INTEL_NEHALEM:
+	case INTEL_NEHALEM_EP:
+	case INTEL_NEHALEM_EX:
+	case INTEL_NEHALEM_G:
+	case INTEL_WESTMERE:
+	case INTEL_WESTMERE_EP:
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
+        case INTEL_NEHALEM:
+        case INTEL_NEHALEM_EP:
+        case INTEL_NEHALEM_EX:
+        case INTEL_NEHALEM_G:
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
@@ -657,14 +670,16 @@ static void cf_check init_intel(struct cpuinfo_x86 *c)
 	/* Work around errata */
 	Intel_errata_workarounds(c);
 
-	if ((c->x86 == 0xf && c->x86_model >= 0x03) ||
-		(c->x86 == 0x6 && c->x86_model >= 0x0e))
+	if ( ( c->family == 15 && c->model >= 0x03 ) ||
+	     ( c->family == 6 && c->model >= 0x0e ) )
 		__set_bit(X86_FEATURE_CONSTANT_TSC, c->x86_capability);
+
 	if (cpu_has(c, X86_FEATURE_ITSC)) {
 		__set_bit(X86_FEATURE_CONSTANT_TSC, c->x86_capability);
 		__set_bit(X86_FEATURE_NONSTOP_TSC, c->x86_capability);
 		__set_bit(X86_FEATURE_TSC_RELIABLE, c->x86_capability);
 	}
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


