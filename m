Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOAMHLUls2kPSwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 21:44:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2552B279812
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 21:44:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252993.1549418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0msw-0006iP-7e; Thu, 12 Mar 2026 20:43:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252993.1549418; Thu, 12 Mar 2026 20:43:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0msw-0006fG-3c; Thu, 12 Mar 2026 20:43:58 +0000
Received: by outflank-mailman (input) for mailman id 1252993;
 Thu, 12 Mar 2026 20:43:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QBWs=BM=citrix.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1w0msu-0006Bj-K4
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 20:43:56 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fa2e1f9-1e54-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 21:43:56 +0100 (CET)
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by PH0PR03MB6870.namprd03.prod.outlook.com (2603:10b6:510:167::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 20:43:53 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%5]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 20:43:53 +0000
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
X-Inumbo-ID: 2fa2e1f9-1e54-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YSuvM7DAq43oqqxbqB2rALqSiZg9l3VWvp9XU5dFqGGh+eP+Dynia4l75Dno/tJVcTka43dg21cDzql9Ee6yGwyoEIip43HbsJJOntcZvHRKJdhJJXduWu3K2FrWYN/39eoGSCzjfx51S5Xjxh1dRhGg6dwffcIM4IunnXavwLScpcF/792ZQRR6OcnaRuP1T7RUFIvra8XXk01jEwI2Hs5O5lSFLhZQoPog1RnnQanRvBB4bIc+X0evgPAEo914GsFXBZVWBOcvN4urW1L1RkIyBANieA8dBXqOEzW+eQOZoLAs7KI2fb2BxtwKKXqOvOdrXB+jsXLWmn6FRdAsiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S6RMyHcSBKFmR8hWUKR8tGOBt8z2Q01OO6dOkO90IPg=;
 b=UW7Ve0lKAOFQ2GuXbDLzUMtmUba+to0Un5E/BvF24uvmI2nanCdwCPdE4weKcWPzcea5PVlO9Wrrd1wTFRoEFn4oyXm1uCdJho3jlPBD1sowQDmQCq2W5OVMeyoFI8HA4RreJx8m6iItyI3O9joEcN2RTf4TUfeUlVJinjhtaEfBDjtP/8aQikTwzxg4YSgixc2wA1YOoJmQ6N0zkj++jpXcBI9VcHUPkD8vzn00d7Bp4ck6kwww1/OYQe5jnSmv30N6y/UVQVr+VCremqqv3gbSbJeg/EZ8ntLFnDgdfxica975m6+NlSGxgNMGpy/jvhRVEzwj1yOvIOgINSc+hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S6RMyHcSBKFmR8hWUKR8tGOBt8z2Q01OO6dOkO90IPg=;
 b=O7XNRQQYjscMuStnx2t4qbXwk75Lr6dPrVLg47b8iWa8TR2991E6lornMOvPvWSyOzSgR/QzYKtzx/1Rx56H905xTzavOiLYd6EA4Ih2Av9MqIV7H2mJlZ22K1ROlIoU9B3u0rCXBuPRkm5qe9hEEYKPin82zr6D5/KKSsM7Jjk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v v2 2/7] x86: Remove x86 prefixed names from acpi code
Date: Thu, 12 Mar 2026 20:43:34 +0000
Message-ID: <20260312204339.740403-3-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260312204339.740403-1-kevin.lampis@citrix.com>
References: <20260312204339.740403-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0207.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::14) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|PH0PR03MB6870:EE_
X-MS-Office365-Filtering-Correlation-Id: a3ade90e-379d-40f6-6575-08de8078128a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	MlIyfEXv/KQe9iGC6CuwFeIS3/ijjcofUyXn1rm+4NQusILF1/y0u66vjWxKqSlJPRHU7Yio8mpXiLXYSWmmrzSbOSNO584kN9upG1K8myyoXQlf+oMhYXjGoXekBhLfln/jPr5deTpY1j+6SVCkuANBHc24QWe+Kxq3Upt68RnCT/EfCYtnmq/j7RK6G22CiPqOjNbu9hk+Cuetkvf10o+OphDozUXZeVnuSORo8e2iXKbWWJjymMT91qPHQIIrLxTDnpy0MTSX6YNl2psg/C/KSrJ0rbr1Is95nWGIn6jxqWDhpwIUUBi7eL3o92xWLwvF+/XX/5VrNOGSDg5cq+amgRLmoa7c13zfiNqmEwmJOVWHu/RJwHeVwnEisppC3ycm7Y+hZEDhlO3FOey+P9KV5LH7uljEg8kwOCHzWUYkJhyTTrUdzotQ54NE27+/NFChKVjYhW8z0Tbs1TizG7DOdIbncnOQPi8fpHSfp1rSZGKzyvplSjwZxAXGXXyPcA189gNv3OdjEKscVI7Ui7KgsMzY95robnlzBkFWWizgy8g0lLBkcVVH6lVoMXKSdYh0eOXrD6CGSXqn3lb1z62qPfkDgpbSg8y7kfKb0dx5FS7A+9IdI6Q5W2nCgE4UE3HI14sYND/wtzlVvroeiyq+GwOCG1Ix7qZ/8hOxHiWshd23jeEXivQmjs6ymAOZXpuw2ia6i0FNw1HW/CVwfAixSmSQ+06FW0mCtVZk4A0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y2qci0uMmsvtc0/sEipz+AMrvitCBLIIx9PrEhIeQenAskfFsvdh5IvPVM8L?=
 =?us-ascii?Q?+b8PFBtiGjD5dp61cDZJQFMs/+MaMFS+Zhd2PrERKjFg7bgHlS1MJRMtHv0D?=
 =?us-ascii?Q?1Umbig7ekZmIjH1Qdfa7ErDWxqIWZBxpRGHROIObR99p9a2byJ7uTDAd50wi?=
 =?us-ascii?Q?nIyeetqhl/UCZOR1Re+5kBHkA6BiNLYX69W1tZJcTgVs/oZycbXpD3Hg2+p1?=
 =?us-ascii?Q?aPpO+++aDoqU9uRzpxeSY5On9BXrP5agRglKraom8blU+lRu6nMMv1h85ZFo?=
 =?us-ascii?Q?6f8a7zs1PvomsZOI69kE39K5cczRPLE6QkZPSdZM1BnylB+qIfI4BllmD2X+?=
 =?us-ascii?Q?VaJuwfqUS3k6cqSV4BDwwLBcqxU1GvVSKq4T61/V6Ht+aePqfqgeKvvp7WLM?=
 =?us-ascii?Q?GKDyUAJI9nyRdTsmStRLYdBKe1XdN2QJ02x9ocR131FUI59wvnHsdd3wc530?=
 =?us-ascii?Q?kp9d9p0nKEtOGCij2/JfdgV3M9COuJAWthBaecBcL3SXc2vpSBjM3x/M8Mab?=
 =?us-ascii?Q?zir4LU6EP63YiYQ+iq7nq48wwjQvGBIViqymmE6ojyTDw86Ogk1XgZeUEV24?=
 =?us-ascii?Q?xDuyaw6MEs9KU1KCKA6IuGrwM0Um5j0fh5+Rz/N5SBVcxprqdtXeDe8KVbvh?=
 =?us-ascii?Q?GkvRUXF95jtfe7eEvnsSKmhQiWS3N6BlvXruGGKo/KnrDakRe+04nhCBPL1t?=
 =?us-ascii?Q?vvB00u+pis8wKSsiYfllEv9dhlpIPdiP1IUuPAk2UrHF2kdKMF/mFWyCnqUw?=
 =?us-ascii?Q?uPcDCo3ko87VxBqXMaLV4n7MPjTAi1ssVlBeK8hjDgJHWGcM3pXyZhSEyVtK?=
 =?us-ascii?Q?u5vvgcFrkdBnSeuyZUGtmDaZFzryZ5jclCIrB+a0g8wwgQ2bugwH8O9isPV5?=
 =?us-ascii?Q?rG/HtWuRIL+B/gyTvs2iG85hkFtnMardvl8Vs+zSEhko9O3LYCEWoLstPcvm?=
 =?us-ascii?Q?UW0sHlcl8ykOuVBiag59qKeL13k0sDRUgiH1acfF4yM9OHDFgKf/ZsVWMMX2?=
 =?us-ascii?Q?/MeE+04AyjmW6jiGNRYtSupg+hBKXOFIw4LsA7pbTo9ASXdrFZDWsxDZuZJk?=
 =?us-ascii?Q?K18RTfhxp94bh1qzYmNA0IJSzBxhQP5SCaswzRWcvI3HVykzj4rKzQJC4sF+?=
 =?us-ascii?Q?KzGFIdDxZv8Z7dB1xSukp73vaEnb+6/D88AJeZS1dCwvKmG5BYBcHJqi+vjB?=
 =?us-ascii?Q?dmFMNeWPzGjet90FBsZw47/J8unvxmNVvX+rCAB4VYrt5P6E/rddz3sHXr2B?=
 =?us-ascii?Q?oWI5c60lNSmK2EoxKwc1GH8z30gI2cgtX2/L8uyW+GqkJkVOMDGdHNCa/MT4?=
 =?us-ascii?Q?hgc1Z4T6mdqyBa+AyG695aAI2VnLB3KIjcRl9zpnH54g4Gpb2e5fyhMlulst?=
 =?us-ascii?Q?kcOo7sBGdunhX6LPCzp0YYaZo0P/6V74AQ3LorP/+qKmIn7zO/qH2pMu+pGt?=
 =?us-ascii?Q?JmSx0BGZPVyqFcitYqD1FJ16idAleWDEwP7bJka4RSsZi4mwKkF8MkrQ4d7l?=
 =?us-ascii?Q?iDXBLf9x8QeEOJIgH4rdK5XVQQkrAZ1mqC/Sx++cSH3cjXzc48sP83EwWB08?=
 =?us-ascii?Q?o5qzkxY4kH9rhtuP9t408JNRVn1gkJSIXWMpdmw9CB5D5v10b1pc9ThPQD4e?=
 =?us-ascii?Q?gIkRyqhgiRtXfm6xn8meF9GrAMJIIjCZPItA06xs7dUKAEv2IpsCBa9/l9ho?=
 =?us-ascii?Q?EiXC0IdhPqQBcPmXcVxg33LEKtRZdsprGwZlgCjylLC3xfnj9Ir7DFpBfVyc?=
 =?us-ascii?Q?sBS15HjCaQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3ade90e-379d-40f6-6575-08de8078128a
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 20:43:52.9548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qxxgPiqlAu8BpeApekkYJsF5JCVxXjvU4NScenej9Tb4ICnlubz3snioTs+toUSoJoFEzZBTminbanVGnzGk2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6870
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 2552B279812
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

struct cpuinfo_x86
  .x86        => .family
  .x86_vendor => .vendor
  .x86_model  => .model
  .x86_mask   => .stepping

No functional change.

This work is part of making Xen safe for Intel family 18/19.

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
Changes in v2:
- Remove the XXX comments
---
 xen/arch/x86/acpi/cpu_idle.c         | 19 +++++++++----------
 xen/arch/x86/acpi/cpufreq/acpi.c     |  2 +-
 xen/arch/x86/acpi/cpufreq/cpufreq.c  |  4 ++--
 xen/arch/x86/acpi/cpufreq/powernow.c |  4 ++--
 4 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index 0b3d0631dd..6622965ace 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -178,10 +178,10 @@ static void cf_check do_get_hw_residencies(void *arg)
     struct cpuinfo_x86 *c = &current_cpu_data;
     struct hw_residencies *hw_res = arg;
 
-    if ( c->x86_vendor != X86_VENDOR_INTEL || c->x86 != 6 )
+    if ( c->vendor != X86_VENDOR_INTEL || c->family != 6 )
         return;
 
-    switch ( c->x86_model )
+    switch ( c->model )
     {
     /* 4th generation Intel Core (Haswell) */
     case 0x45:
@@ -915,7 +915,7 @@ void cf_check acpi_dead_idle(void)
             mwait(cx->address, 0);
         }
     }
-    else if ( (current_cpu_data.x86_vendor &
+    else if ( (current_cpu_data.vendor &
                (X86_VENDOR_AMD | X86_VENDOR_HYGON)) &&
               cx->entry_method == ACPI_CSTATE_EM_SYSIO )
     {
@@ -1042,8 +1042,8 @@ static void acpi_processor_power_init_bm_check(struct acpi_processor_flags *flag
     flags->bm_check = 0;
     if ( num_online_cpus() == 1 )
         flags->bm_check = 1;
-    else if ( (c->x86_vendor == X86_VENDOR_INTEL) ||
-              ((c->x86_vendor == X86_VENDOR_AMD) && (c->x86 == 0x15)) )
+    else if ( (c->vendor == X86_VENDOR_INTEL) ||
+              ((c->vendor == X86_VENDOR_AMD) && (c->family == 0x15)) )
     {
         /*
          * Today all MP CPUs that support C3 share cache.
@@ -1059,8 +1059,7 @@ static void acpi_processor_power_init_bm_check(struct acpi_processor_flags *flag
      * is not required while entering C3 type state on
      * P4, Core and beyond CPUs
      */
-    if ( c->x86_vendor == X86_VENDOR_INTEL &&
-        (c->x86 > 0x6 || (c->x86 == 6 && c->x86_model >= 14)) )
+    if ( c->vendor == X86_VENDOR_INTEL && c->vfm >= INTEL_CORE_YONAH )
             flags->bm_control = 0;
 }
 
@@ -1416,12 +1415,12 @@ static void amd_cpuidle_init(struct acpi_processor_power *power)
     if ( vendor_override < 0 )
         return;
 
-    switch ( c->x86 )
+    switch ( c->family )
     {
     case 0x1a:
     case 0x19:
     case 0x18:
-        if ( boot_cpu_data.x86_vendor != X86_VENDOR_HYGON )
+        if ( boot_cpu_data.vendor != X86_VENDOR_HYGON )
         {
     default:
             vendor_override = -1;
@@ -1648,7 +1647,7 @@ static int cf_check cpu_callback(
         break;
 
     case CPU_ONLINE:
-        if ( (boot_cpu_data.x86_vendor &
+        if ( (boot_cpu_data.vendor &
               (X86_VENDOR_AMD | X86_VENDOR_HYGON)) &&
              processor_powers[cpu] )
             amd_cpuidle_init(processor_powers[cpu]);
diff --git a/xen/arch/x86/acpi/cpufreq/acpi.c b/xen/arch/x86/acpi/cpufreq/acpi.c
index d0ca660db1..de67f1aee2 100644
--- a/xen/arch/x86/acpi/cpufreq/acpi.c
+++ b/xen/arch/x86/acpi/cpufreq/acpi.c
@@ -454,7 +454,7 @@ static int cf_check acpi_cpufreq_cpu_init(struct cpufreq_policy *policy)
 
     /* Check for APERF/MPERF support in hardware
      * also check for boost support */
-    if (c->x86_vendor == X86_VENDOR_INTEL && c->cpuid_level >= 6)
+    if (c->vendor == X86_VENDOR_INTEL && c->cpuid_level >= 6)
         on_selected_cpus(cpumask_of(cpu), feature_detect, policy, 1);
 
     /*
diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpufreq/cpufreq.c
index 5740c0d438..9ef62b3538 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -133,7 +133,7 @@ static int __init cf_check cpufreq_driver_init(void)
 
         ret = -ENOENT;
 
-        switch ( boot_cpu_data.x86_vendor )
+        switch ( boot_cpu_data.vendor )
         {
         case X86_VENDOR_INTEL:
             for ( i = 0; i < cpufreq_xen_cnt; i++ )
@@ -252,7 +252,7 @@ __initcall(cpufreq_driver_late_init);
 int cpufreq_cpu_init(unsigned int cpu)
 {
     /* Currently we only handle Intel, AMD and Hygon processor */
-    if ( boot_cpu_data.x86_vendor &
+    if ( boot_cpu_data.vendor &
          (X86_VENDOR_INTEL | X86_VENDOR_AMD | X86_VENDOR_HYGON) )
         return cpufreq_add_cpu(cpu);
 
diff --git a/xen/arch/x86/acpi/cpufreq/powernow.c b/xen/arch/x86/acpi/cpufreq/powernow.c
index beab6cac36..55166eac72 100644
--- a/xen/arch/x86/acpi/cpufreq/powernow.c
+++ b/xen/arch/x86/acpi/cpufreq/powernow.c
@@ -143,7 +143,7 @@ static void amd_fixup_frequency(struct xen_processor_px *px)
     int index = px->control & 0x00000007;
     const struct cpuinfo_x86 *c = &current_cpu_data;
 
-    if ((c->x86 != 0x10 || c->x86_model >= 10) && c->x86 != 0x11)
+    if ((c->family != 0x10 || c->model >= 10) && c->family != 0x11)
         return;
 
     val = rdmsr(MSR_PSTATE_DEF_BASE + index);
@@ -157,7 +157,7 @@ static void amd_fixup_frequency(struct xen_processor_px *px)
 
     fid = val & 0x3f;
     did = (val >> 6) & 7;
-    if (c->x86 == 0x10)
+    if (c->family == 0x10)
         px->core_frequency = (100 * (fid + 16)) >> did;
     else
         px->core_frequency = (100 * (fid + 8)) >> did;
-- 
2.51.1


