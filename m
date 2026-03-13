Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MA0Fi09tGlljgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:37:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0653228724D
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:37:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253995.1550003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15VN-000509-9G; Fri, 13 Mar 2026 16:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253995.1550003; Fri, 13 Mar 2026 16:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15VN-0004xS-4e; Fri, 13 Mar 2026 16:36:53 +0000
Received: by outflank-mailman (input) for mailman id 1253995;
 Fri, 13 Mar 2026 16:36:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rc6w=BN=citrix.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1w15VL-00040A-AM
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 16:36:51 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5391a2b-1efa-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 17:36:49 +0100 (CET)
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by CH2PR03MB5271.namprd03.prod.outlook.com (2603:10b6:610:95::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 16:36:41 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%5]) with mapi id 15.20.9700.015; Fri, 13 Mar 2026
 16:36:44 +0000
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
X-Inumbo-ID: d5391a2b-1efa-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=epJbFbv7QRKMbIhnkEEcYHcJYNUFjDe/98/S0eOi5e/MzYxP6ooPcWdRjLb44LqReNstp2twlTkHm0Pt+JD3Jh/8v2sxNzntbUDtQ3pmseHlaNmTA8nY2Z2Gwn0yknx4o1cg5A9CXKUVnfpYEkaWJdh3nkAy9zSPqPBzrjhXrdR7VE/OhNWd8RXZaBPYF78SLsMk8DAK/VV7SNGuKIYa0A+6oikbabvak+1LJG+PU9ZSk+FabTQS+0fGuTaWTduyWMkq+wrkPGiV1WakgmaZfcSe86C6RI8LHxdU7N0Ru6Yx/2APQZ0kC7eq1sHD1Jk7t0deExOqHQN572wHSvBFlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4DCI1IPGGhbSXpfhfNCCCnchGXNmQEqfWuu8VgQvnxI=;
 b=lIOTwRnanDe95C5EkrLq8b15h5+qV6+17kkHlPBJxTsRVD1ifnL8te3FAbq/Ae1YeSFdkrhuqx/kSnlK2g8m4hZnZygH7U2uDOc6qFA9CEIVL7/M0erUVVOlOAXj0LafmzbAZ0D90Jpoof3ShffFX46oIBf6AUwudzVZZiXOoip4+6AwH9Zl+sZw2V6mitKOjxF+i4G2x0FtzCSPp2hfHq9aTSDmeG+Fpg0pqfE/cNRFzbl7QzdcYqBVyfbMqc2F/KJejimq0JRJGwLdukxnt/gxB+Z0AmNvAMFCrT1VZlCd1kofz7FfLNlbuYrDAE6he2fk2/X0KP3uDIVQEy9FtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4DCI1IPGGhbSXpfhfNCCCnchGXNmQEqfWuu8VgQvnxI=;
 b=YEr0zdRienXEqrjYx1/VfjifkIf8S/gU1vzbR07Ca4YILsqMrXsF6+aCJweeBNVLaIggmXMRFo1Q+jSGLiFeXHEuA9korcDJx/vItMiC2ATWQ7RRKoqtlADpmHti+kOOWj4BeHU8tXPHtjpLPOT9Wvu/Yihli/K7gl6FomR65Pk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v v3 3/7] x86: Remove x86 prefixed names from acpi code
Date: Fri, 13 Mar 2026 16:36:26 +0000
Message-ID: <20260313163630.1073019-4-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260313163630.1073019-1-kevin.lampis@citrix.com>
References: <20260313163630.1073019-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0037.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::25)
 To BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|CH2PR03MB5271:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aaf5cc7-04c8-40dd-fb75-08de811eb6a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	geLG66UgyZ8omc0ZS8VUpgiwHtbhPDv3XKMBuR5nWrHEcwNkrWBL9PvtyNkLvcabrToSwHQEzoFwvuih6OrJq2KGohcRGT/ZSLa6eIY0ygO2EXJ9rxY/f/XFPoSellWTj4VIxvyIA3RXdgDgWLmOq/8B8PvbUcl/n5tuk3usVlw56b2FNKZ2LtONXyQyNSZeZMikDy9UTcbnc5K5RcAYSTSZc7KtP84GgBL4mayoJJ/bnCNQaP4t0xu9PVyiMQX2n/V24Uy9X2xeTUQVEjcOUlcw/zZWdCC2R5rGPP+nUIVWGBN0Dx+DNRRBLT8OKFfORN3t44a7QmmBV6hzHtP9h1z2xEthTn2HgwEhGb1Rab0wWnlLIjN0uVwKSdO9bxtM7rrxCgXX0nTeqOVWEw0mwk39QLvtv/GETf8Edq29VXnOUTl8Jsk7DB0tRFIDrbEKj3+sHEShqXjFBQNiZIJ79V6axqmE8H++LySz0qSby32bq88IvCvpuJbVsU5etVhYw1T9/d/Iia9GEl7r7i4VVWx1tpIFfrOuBIOXjd7MQSVNfP77T6liAl/amnS6EiwQPx63uY5kx11I4A6IOeZdC2Df2GRIMIdIe5cBW5H5SAL9FoiVrb5tSlZt3+dSnr6GQJk8U9FAF6Fn23z8mTN/6HBFLCcAJ4VioIEM3jtvDoBZUzHTqx7sAiaqD6HgoLQKNqrbLBkb2c9zo073P4pzBySlxX5aGPYvXZ8578W6ET4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JWnvTIHPBkKgg6bXtdaYry6cXs+j/fuaSTE2Odh5vTm8TgjTSBCg2WttpPV1?=
 =?us-ascii?Q?rahebqEzc8r9IwnV8Co78eWgrtl6432iL5kd/NeJli7LwvqfjasmiZ7cuASI?=
 =?us-ascii?Q?Z7rctSsaT77nlOotrMFowqT24/AyDOT9OXaQovNyOwqzn+Zcgg5HflaTpb5a?=
 =?us-ascii?Q?n8L1UAIThQr9m8NBjJCgaacd2rRZPxS/cxQilJbsDjl47YnoCQ1lMkXiS1V5?=
 =?us-ascii?Q?WJy30QFsCJdH2lzTUtRkdMd+tYdB2Dfi1txSlRZ31mZpsAz8GiS5wjthjznT?=
 =?us-ascii?Q?DmY24dWg61rhFwe+PD5Psz5vQlOouyv50QFw9fT4RDDD92gHJShkcTj0Quz3?=
 =?us-ascii?Q?ox/yQImwjx2qxGIJow1tH5vcW7cUxgUYkHnk91hGd5BjlUCrQd7Jd9OaDz/x?=
 =?us-ascii?Q?/xQB73JluyMNgJKi3+VIgHHWwiF6dLxvVdPi6k3hj5+Z1IN+NZCasT9vvSr+?=
 =?us-ascii?Q?ZFTYF3obHfX+A1I1nTboq7cYWy1XyD2h8yuC2AXED2e6QI3xGyyEq9vrNYh/?=
 =?us-ascii?Q?bfoUg4ndcPM98lAW87X25zeToYQ9QmqG4us9bZsMj7AjU/fC487nNL3NsPe2?=
 =?us-ascii?Q?R1aYM4I5+HxlZbHZAgKNlqqRJfLtvRlzQ9G2AiDICDJSR+W3rK2raz0QAEvq?=
 =?us-ascii?Q?WyjOHUvzd/VGoUi1CL1iWCKkUDmirvo4GvniyM78KicAjzXGDZvMKeOW7fIr?=
 =?us-ascii?Q?yteOtiy3zbRuPFTtRf2PNdXreEvF6OnxZFqk7iqEirFBkBZU90dZ/mVAG6pU?=
 =?us-ascii?Q?lY5IXvnk0cWdoDXc5SQ2HW8F59uTstZCho7MgnuJ2lJbRIAcc40AfWyFNxuX?=
 =?us-ascii?Q?yefEqXMP7oHBae/7kgRh/hDQGbl+39Ds318VoVf/5UaqY8fP/sughGBRSfCI?=
 =?us-ascii?Q?sqVJ3dSTWUPT3lPFBQhpGKuPxYvlzY2jPpR+p8rzQLoO/LkWeUwRQTpXGer7?=
 =?us-ascii?Q?F+lwwJKyGV6LGQjm4oN4FuatmcN8V1wwGfJPzIilTuYSbhOOChsoxGRZTxGQ?=
 =?us-ascii?Q?G/EUF2v8MOsd3cd7Bzpk8XXiply+yZ7NAkdNH8fNWBFHebphfxJmXlBAbwpw?=
 =?us-ascii?Q?gd1PKMnLTyPFiKEyyIy3iJKAcQaZ0W8X4PGgR9Lq+RsL0rJuNzqDMjKHy+T8?=
 =?us-ascii?Q?bM2HzQdcWb9DXYTjTuUoPZGDjys0OcA9pitfH86ztbctqCWeeXtphZqwDQyc?=
 =?us-ascii?Q?m6FCvhgVWwupwOEVuzJoSLWqMKqmGW6hp5Zcc8Z3rNh5schUcOf6LAqNMui9?=
 =?us-ascii?Q?2Aj6M8LcuccW++YNq8ymerXsjWyeTaAXImq0shY5A5xcp1xvrUaPYJJboq8K?=
 =?us-ascii?Q?66wNHALbbCdEQ/whgF3wJ6I7bf4BLl3T5RJoGMd29yEYFvpaeVwPFaNsXQ0X?=
 =?us-ascii?Q?HzYQf/llUZs3hhHYQYtvqNoKyzhHPgehJEE8P66RAYiBTOIb58AaOw2jfkUc?=
 =?us-ascii?Q?UPU+wCt16mNRd91sMfMSzftdRCqETTcFIA9vMK43iHsCk+dTuC4/em6uqnOy?=
 =?us-ascii?Q?DbzUFE9jNaUOghNaltp/iFU3fFs+fBVOPX9C6xP4jQEFWUNS50WDHWhF8/r4?=
 =?us-ascii?Q?qwtGR3ky/RqdzYnLyYQ7UEkH7qZacn+F9X49Hdz+4xIkU2d0HuehVSI2YcXH?=
 =?us-ascii?Q?984G0wtgGdZjp2mNf4k1011lF4nU99MZzTdoty9I/dyXHY4OVRsW/W/7i7rT?=
 =?us-ascii?Q?t4lnC6wFCOG8hSb3OxcQlrMERdek6Zab6ZETeytYPxEgbEZdXZd00MgPrbsV?=
 =?us-ascii?Q?0GVmjlVg3Q=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aaf5cc7-04c8-40dd-fb75-08de811eb6a8
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 16:36:44.7923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I1PKbhf8t7T9imsZibNkEza97C4BS6jDyadfyXI85yjVXk7EEF4IQWl2ue7kr9ZinZTpwpraJ82E0mB7cnWfcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5271
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:kevin.lampis@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0653228724D
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

Changes in v3:
- No changes
---
 xen/arch/x86/acpi/cpu_idle.c         | 18 +++++++++---------
 xen/arch/x86/acpi/cpufreq/acpi.c     |  2 +-
 xen/arch/x86/acpi/cpufreq/cpufreq.c  |  4 ++--
 xen/arch/x86/acpi/cpufreq/powernow.c |  4 ++--
 4 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index 46749ca337..3001e98a6e 100644
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
@@ -1059,7 +1059,7 @@ static void acpi_processor_power_init_bm_check(struct acpi_processor_flags *flag
      * is not required while entering C3 type state on
      * P4, Core and beyond CPUs
      */
-    if ( c->x86_vendor == X86_VENDOR_INTEL )
+    if ( c->vendor == X86_VENDOR_INTEL )
         flags->bm_control = 0;
 }
 
@@ -1415,12 +1415,12 @@ static void amd_cpuidle_init(struct acpi_processor_power *power)
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
@@ -1647,7 +1647,7 @@ static int cf_check cpu_callback(
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


