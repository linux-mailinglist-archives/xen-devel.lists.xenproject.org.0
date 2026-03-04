Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFJqCsONqGmzvgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 20:53:39 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 776DE2073AA
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 20:53:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245954.1545310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxsHh-0000Oy-U4; Wed, 04 Mar 2026 19:53:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245954.1545310; Wed, 04 Mar 2026 19:53:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxsHh-0000MF-Ol; Wed, 04 Mar 2026 19:53:29 +0000
Received: by outflank-mailman (input) for mailman id 1245954;
 Wed, 04 Mar 2026 19:53:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nfWr=BE=citrix.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1vxsHf-0007ik-SJ
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 19:53:28 +0000
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c110::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce6cf8b7-1803-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Mar 2026 20:53:26 +0100 (CET)
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by DM4PR03MB6079.namprd03.prod.outlook.com (2603:10b6:5:392::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 19:53:24 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%5]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 19:53:24 +0000
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
X-Inumbo-ID: ce6cf8b7-1803-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z3wKQwBCJfiwGCPHf/5Hp/Hu6/AGsbeo7DlG4YonOGF9x0Me1HIgNGXL24/MoasdWjjCqUVatJrG/YoLFHwTqRMUmKl+0jxz8n8oJ60S0jIhaA+MPUSlc3EH/sI8Ov0yjgO0kD2uYj7+KmPfJPoav/NqsRxRpMHePhiRGMlZNcMqZPdMXgAJt+1Cvk4fRzw/M1SUsw3blWVog62lsdSAYo5iHWV5kmoeYVDqufxU9jjGj5eas3fHihHIPnM7SaBGKqmgmWJ6yO/lM8wDRrCyCyZJ0KCzAFfD3sRW23OAGtbW00rPPBiclLfK+omQoutxlY8rTsqDgskFpMJV6rjE8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C8uSxdZ9apq9RNkJQVruOhBEhgTE/HpOqrFEHfxII2M=;
 b=w/WUJ5i4Ivr5Rizdq7JFTQtSN6prGVITq/dgrM0954Ay9AhzMmB6jovP+wb37QRmJn+vpgURuaFws9PATBQdW3QktFuCAxaRakS/TcVW0QQ+usAJMiwxoGHOcYvIQlR/f+rJVnI6Oa2lVZysNVQeRn9Fa1Trr7tJzZayRgb5AT1PpxIP8wmW7RY2bJoo7BzRBCtUMDoqJsAi0Tlu/HO0TbM2W5BJ9FI5PLTLw1TmbmcuP3iFTdb89WY+falxDqKWqtfP6k7VYhzWFqbkJ7zalHjnq3GzTwE8mCH0I7mFMBzlwIqlzH/Af8sX7yMbto+SQWuRKJdLI9xWy4sptklKKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C8uSxdZ9apq9RNkJQVruOhBEhgTE/HpOqrFEHfxII2M=;
 b=hIn1mYMS0uXI82zAM0lJX4GC9qAr+M1xjTpQWWSQN82jrCFuaaJGsmR0GXlywAuOtuqF9RHLLWj1vgBBBw5UVwjYy+gRWS1itaaC7G7JTywnlWshs3iv7nNCTgWfSmt44f1zriaOINPWDdUz7TGec1OWJQT6P6NkK0JgdQ0qtzM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH 4/6] x86: Remove x86 prefixed names from x86/cpu/ files
Date: Wed,  4 Mar 2026 19:53:48 +0000
Message-ID: <20260304195350.837593-5-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260304195350.837593-1-kevin.lampis@citrix.com>
References: <20260304195350.837593-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0265.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::17) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|DM4PR03MB6079:EE_
X-MS-Office365-Filtering-Correlation-Id: d7fe414e-9bbf-40ea-d2f2-08de7a27b1d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	qYnya3Kj/mCDXnreaAYWP+aY/XZsP0TfaeBEQ8sLrXbCNlCpoflrQj6vYtJM3vbAZY9LMP06qYcTgurgbQ2Jv7fhbPv014v9lG+xZD8FaQ2FYugEukDbxBqjIMvu2L7oYaZ2xllz6ioWrCGbkFbvtDdC1eim16+ae1H/PiO7QB/+BCn7FtEX22ylJnfmFlTHdTy8biZoNQjWdus72Tuz2nUpnoOCOYQy32zmlm8uT8W4hUxu4JlVjx9DxQGv6VcV/66dlLiLn85SU/LmAzZEoDRDOwHj+3lPS+Cbs7FaIXENDwXdN/AGBip74bmHQsD6z8DhZCjzqA40IxN/FG4RgJZFOYmj43H1lTE90Qf118oWmhOQTHMZ4DVGe52fWhCA0olPYqomO8OS73DBVnwYHk1tqwP0Qqp+XFczRS9x768PW8CFU+5KVfVGnQz+WQp3+L600vl3Wk/rnwLD5LgGOMOw6+TVnPVbp/QZeimVoTtmsISU2U0Lnfz947uc8rPHneG9EMK7XYDW2MwP9hAVN2qEq2BeixrCUID2+lbLkBB3n8mA0xoRHZj0Gpjc4A9YBlTKyvprGjxtuKEARDhuEBGE2fQlc57t/IUEV6fHAM2cEDbCfJJg1RZsTD5EJfohNvU3UZkjXh1it8rFGz6JzBaqplikHQ+gGvmNyUOgJgnOOVcpekLqiG//pWbPzLn1JIc1LVod1BEzi1JP9ygqmtR289e//W//0mMjKFC6xZU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GkjGMSVOSNP9wzBJ6W7V2c6wR6b9/xijqVuvxlMcQJuWbTAS2KyJ6cspAwUQ?=
 =?us-ascii?Q?6pdXGaA+7pai1FP3qC2Kz4PHmLzYRev6DEw5nFeIVfc/YBQYotVXhlQM5dNo?=
 =?us-ascii?Q?L32x7mdBQknH2AnHQMEUvs/DvMb3KEhDyKYu2LzZVeuo60RwBpsK0Z4JkZUL?=
 =?us-ascii?Q?/3akBhtMJoFLS7SDRps6SQhSZ+72NUFGHWe0Zsni6wgr7gL13B8gCjOzapMf?=
 =?us-ascii?Q?+LYQjg7gZ4K9b5kTwIgK0TIFdrshNxoTIJ5Eb+OT1Q4EqK/oCgY2RnZlZ72Y?=
 =?us-ascii?Q?2AaB6rR7i2QAn7IO+lhsJDNQ9ruvKcUb1ion8GihF5Ye+MGZUvKgL08hU1zm?=
 =?us-ascii?Q?pDuHEAPX8wbNRTr6ts9Ln/U6+WlTzukddaDwFgFx5XBmnSudgvZYJUqsBT7e?=
 =?us-ascii?Q?cKgFbOgH8kt+36VGMNMJAP+GRD1qkWdIVRhiOP7o2GgD4bMN0pTyGB+A2I3g?=
 =?us-ascii?Q?I1t8Ik1OO90kmyJUxLgwRlrVcWeSDj8Jpj8RSioXBRbIWJW1J1K9Lbnzcngl?=
 =?us-ascii?Q?KuKcaeZPSuP6shGcs+OciFKmRfU2cUdADsIqhQaF5Bm1wN8A4JNT2Eu00/qA?=
 =?us-ascii?Q?4JFmcduI5JwNp1eikE8B9L3dOKpe2BtjDxGf68FWhh5MtC3O+ebP1aCvwZI9?=
 =?us-ascii?Q?DHPm1xcdojuDsB1YxpH54FB3ftE8l0DnzG8wvZZiLQnMfb1bK8bK333KKvRC?=
 =?us-ascii?Q?7EKm/607dZW9pfHVQLcw28x3VXLQIMub5RWr+6NNw79NDK5rOsQZegxWSbj2?=
 =?us-ascii?Q?LWwGNVmqzsg3ToPfcdumIxmuP+U8+Ma3BjN2F7hQ0z1P+NqrCgr8PwL0bOWe?=
 =?us-ascii?Q?FnhxFA806N1du3SOaHg4pg2N0dEf7rFJiigKLPx9/eYfg9UieF1Iiyd983Re?=
 =?us-ascii?Q?ZJQq6t/RH/DisAFw0cw0AUnJZ/zAiQKDBV8E4z3FOHq5JllKjeitmZl1bOWq?=
 =?us-ascii?Q?+xYA8ldrFeLY3rdegixl22wqgjYWKuVImuV2Q4oXnzm2IBD18FsRv/tCjiZ8?=
 =?us-ascii?Q?buwrpI3A41u7G5hsKNmP2KoWN45BMu49Yajmt+GosIUg+CNQBQUDc+x/ZnU0?=
 =?us-ascii?Q?+ApYjqQuQ97HGZa/zNR8C4MktmPcI/PXah1lslAOTlHQ432jvK0+679uK61V?=
 =?us-ascii?Q?0ILXh6cQq7rS0GmoABB72jsWmWxIQ9M/LHYYr8zcdvKKQyEi5EF3uU2XI/8l?=
 =?us-ascii?Q?BR5ovNU0VuQskEzPHGQQgBgdxNVB9OVPjEwJ8IqNH0ubK3M5paHc0MVP8Xmk?=
 =?us-ascii?Q?D44YE9wrn1C1Mbb1Avnsbhb2bEf7WRbwoo71RTdwZc8X1AAX0hcepJ861xp+?=
 =?us-ascii?Q?DVS/QmCUmI1w5FC68ZZw0jM4t59Z9fTwQVoVO6e7p/H8OOu6eJtwFErSSF5W?=
 =?us-ascii?Q?ZWV0X+42OKWYuEjtATdqA6QWU2dOVcsg9M9VrI0J58Dzxhz7dTAna2seIVlc?=
 =?us-ascii?Q?EfIejeg6Wsx/7TjIIS0txF6+IE3wdb/8RQfQIsQaUN1uFVoi1Mm80Ve554Ka?=
 =?us-ascii?Q?p+iyuWTUFEk5gafGecUnfiSZGoo4G1hgD1fDrSQe7VWBuGAbHVUEzHuBmFkN?=
 =?us-ascii?Q?a8I+KM855yquwU2qUjf+HGdI5pjJKFf8DXvf4Iw+FiBiJKpaqGinxS7CHoqT?=
 =?us-ascii?Q?wkC/7S//5Ln2Lfr81+SU7hrHc9r3ifTsWxNapIR6BQiem+z9u2NyetUuDpw2?=
 =?us-ascii?Q?cmQmaG0rjgLU+h3SuL1wYoRHtImoVLK40PpdbDBjdxDjoWGDgzR8J31shp79?=
 =?us-ascii?Q?0aarBUb2pQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7fe414e-9bbf-40ea-d2f2-08de7a27b1d1
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 19:53:23.9622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dTvzmGK2/qOVhSnJF3Y2+3cFLoAqV6HcqC/qHa8hIqdMVbQhGnJNCwHwlV+NCRMNfuy9DKepL1lrIe8y7eX5uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6079
X-Rspamd-Queue-Id: 776DE2073AA
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[boot_cpu_data.family:url];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

struct cpuinfo_x86
  .x86        => .family
  .x86_vendor => .vendor
  .x86_model  => .model
  .x86_mask   => .stepping

No functional change.

This work is part of making Xen safe for Intel family 18/19.

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
Inside core2_vpmu_init() there is a check for family == 6.
Should this be extended to family 18/19?
---
 xen/arch/x86/cpu/centaur.c         | 4 ++--
 xen/arch/x86/cpu/hygon.c           | 4 ++--
 xen/arch/x86/cpu/intel_cacheinfo.c | 6 +++---
 xen/arch/x86/cpu/mtrr/generic.c    | 6 +++---
 xen/arch/x86/cpu/mwait-idle.c      | 4 ++--
 xen/arch/x86/cpu/vpmu.c            | 4 ++--
 xen/arch/x86/cpu/vpmu_amd.c        | 6 +++---
 xen/arch/x86/cpu/vpmu_intel.c      | 6 ++++--
 8 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/cpu/centaur.c b/xen/arch/x86/cpu/centaur.c
index d2e7c8ec99..9123b05dc1 100644
--- a/xen/arch/x86/cpu/centaur.c
+++ b/xen/arch/x86/cpu/centaur.c
@@ -41,7 +41,7 @@ static void init_c3(struct cpuinfo_x86 *c)
 		}
 	}
 
-	if (c->x86 == 0x6 && c->x86_model >= 0xf) {
+	if (c->family == 0x6 && c->model >= 0xf) {
 		c->x86_cache_alignment = c->x86_clflush_size * 2;
 		__set_bit(X86_FEATURE_CONSTANT_TSC, c->x86_capability);
 	}
@@ -52,7 +52,7 @@ static void init_c3(struct cpuinfo_x86 *c)
 
 static void cf_check init_centaur(struct cpuinfo_x86 *c)
 {
-	if (c->x86 == 6)
+	if (c->family == 6)
 		init_c3(c);
 }
 
diff --git a/xen/arch/x86/cpu/hygon.c b/xen/arch/x86/cpu/hygon.c
index b99d83ed4d..7a9fc25d31 100644
--- a/xen/arch/x86/cpu/hygon.c
+++ b/xen/arch/x86/cpu/hygon.c
@@ -41,12 +41,12 @@ static void cf_check init_hygon(struct cpuinfo_x86 *c)
 
 	/* Probe for NSCB on Zen2 CPUs when not virtualised */
 	if (!cpu_has_hypervisor && !cpu_has_nscb && c == &boot_cpu_data &&
-	    c->x86 == 0x18)
+	    c->family == 0x18)
 		detect_zen2_null_seg_behaviour();
 
 	/*
 	 * TODO: Check heuristic safety with Hygon first
-	if (c->x86 == 0x18)
+	if (c->family == 0x18)
 		amd_init_spectral_chicken();
 	 */
 
diff --git a/xen/arch/x86/cpu/intel_cacheinfo.c b/xen/arch/x86/cpu/intel_cacheinfo.c
index e88faa7545..a81d0764fb 100644
--- a/xen/arch/x86/cpu/intel_cacheinfo.c
+++ b/xen/arch/x86/cpu/intel_cacheinfo.c
@@ -168,15 +168,15 @@ void init_intel_cacheinfo(struct cpuinfo_x86 *c)
 	 * Don't use cpuid2 if cpuid4 is supported. For P4, we use cpuid2 for
 	 * trace cache
 	 */
-	if ((num_cache_leaves == 0 || c->x86 == 15) && c->cpuid_level > 1 &&
-	    c->x86_vendor != X86_VENDOR_SHANGHAI)
+	if ((num_cache_leaves == 0 || c->family == 15) && c->cpuid_level > 1 &&
+	    c->vendor != X86_VENDOR_SHANGHAI)
 	{
 		/* supports eax=2  call */
 		unsigned int i, j, n, regs[4];
 		unsigned char *dp = (unsigned char *)regs;
 		int only_trace = 0;
 
-		if (num_cache_leaves != 0 && c->x86 == 15)
+		if (num_cache_leaves != 0 && c->family == 15)
 			only_trace = 1;
 
 		/* Number of times to iterate */
diff --git a/xen/arch/x86/cpu/mtrr/generic.c b/xen/arch/x86/cpu/mtrr/generic.c
index c587e9140e..190be7f1b4 100644
--- a/xen/arch/x86/cpu/mtrr/generic.c
+++ b/xen/arch/x86/cpu/mtrr/generic.c
@@ -218,9 +218,9 @@ static void __init print_mtrr_state(const char *level)
 			printk("%s  %u disabled\n", level, i);
 	}
 
-	if ((boot_cpu_data.x86_vendor == X86_VENDOR_AMD &&
-	     boot_cpu_data.x86 >= 0xf) ||
-	     boot_cpu_data.x86_vendor == X86_VENDOR_HYGON) {
+	if ((boot_cpu_data.vendor == X86_VENDOR_AMD &&
+	     boot_cpu_data.family >= 0xf) ||
+	     boot_cpu_data.vendor == X86_VENDOR_HYGON) {
 		uint64_t syscfg, tom2;
 
 		rdmsrl(MSR_K8_SYSCFG, syscfg);
diff --git a/xen/arch/x86/cpu/mwait-idle.c b/xen/arch/x86/cpu/mwait-idle.c
index 5962ec1db9..6776eeb9ac 100644
--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -1637,7 +1637,7 @@ static int __init mwait_idle_probe(void)
 		lapic_timer_reliable_states = LAPIC_TIMER_ALWAYS_RELIABLE;
 
 	pr_debug(PREFIX "v" MWAIT_IDLE_VERSION " model %#x\n",
-		 boot_cpu_data.x86_model);
+		 boot_cpu_data.model);
 
 	pr_debug(PREFIX "lapic_timer_reliable_states %#x\n",
 		 lapic_timer_reliable_states);
@@ -1816,7 +1816,7 @@ bool __init mwait_pc10_supported(void)
 {
 	unsigned int ecx, edx, dummy;
 
-	if (boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
+	if (boot_cpu_data.vendor != X86_VENDOR_INTEL ||
 	    !cpu_has_monitor ||
 	    boot_cpu_data.cpuid_level < CPUID_MWAIT_LEAF)
 		return false;
diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
index c28192ea26..64328bdf3f 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -398,7 +398,7 @@ int vpmu_load(struct vcpu *v, bool from_guest)
 static int vpmu_arch_initialise(struct vcpu *v)
 {
     struct vpmu_struct *vpmu = vcpu_vpmu(v);
-    uint8_t vendor = current_cpu_data.x86_vendor;
+    uint8_t vendor = current_cpu_data.vendor;
     int ret;
 
     BUILD_BUG_ON(sizeof(struct xen_pmu_intel_ctxt) > XENPMU_CTXT_PAD_SZ);
@@ -815,7 +815,7 @@ static struct notifier_block cpu_nfb = {
 
 static int __init cf_check vpmu_init(void)
 {
-    int vendor = current_cpu_data.x86_vendor;
+    int vendor = current_cpu_data.vendor;
     const struct arch_vpmu_ops *ops = NULL;
 
     if ( !opt_vpmu_enabled )
diff --git a/xen/arch/x86/cpu/vpmu_amd.c b/xen/arch/x86/cpu/vpmu_amd.c
index d1f6bd5495..943a0f4ebe 100644
--- a/xen/arch/x86/cpu/vpmu_amd.c
+++ b/xen/arch/x86/cpu/vpmu_amd.c
@@ -532,7 +532,7 @@ static const struct arch_vpmu_ops *__init common_init(void)
     if ( !num_counters )
     {
         printk(XENLOG_WARNING "VPMU: Unsupported CPU family %#x\n",
-               current_cpu_data.x86);
+               current_cpu_data.family);
         return ERR_PTR(-EINVAL);
     }
 
@@ -557,7 +557,7 @@ static const struct arch_vpmu_ops *__init common_init(void)
 
 const struct arch_vpmu_ops *__init amd_vpmu_init(void)
 {
-    switch ( current_cpu_data.x86 )
+    switch ( current_cpu_data.family )
     {
     case 0x15:
     case 0x17:
@@ -585,7 +585,7 @@ const struct arch_vpmu_ops *__init amd_vpmu_init(void)
 
 const struct arch_vpmu_ops *__init hygon_vpmu_init(void)
 {
-    switch ( current_cpu_data.x86 )
+    switch ( current_cpu_data.family )
     {
     case 0x18:
         num_counters = F15H_NUM_COUNTERS;
diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index 1e3b06ef8e..c623554e37 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -917,7 +917,9 @@ const struct arch_vpmu_ops *__init core2_vpmu_init(void)
         return ERR_PTR(-EINVAL);
     }
 
-    if ( current_cpu_data.x86 != 6 )
+    /* XXX Does this need to be changed to include family 18/19?
+     * Is the core2_ function name misleading? */
+    if ( current_cpu_data.family != 6 )
     {
         printk(XENLOG_WARNING "VPMU: only family 6 is supported\n");
         return ERR_PTR(-EINVAL);
@@ -958,7 +960,7 @@ const struct arch_vpmu_ops *__init core2_vpmu_init(void)
               sizeof(struct xen_pmu_cntr_pair) * arch_pmc_cnt;
 
     /* TODO: It's clearly incorrect for this to quirk all Intel Fam6 CPUs. */
-    pmc_quirk = current_cpu_data.x86 == 6;
+    pmc_quirk = current_cpu_data.family == 6;
 
     if ( sizeof(struct xen_pmu_data) + sizeof(uint64_t) * fixed_pmc_cnt +
          sizeof(struct xen_pmu_cntr_pair) * arch_pmc_cnt > PAGE_SIZE )
-- 
2.51.1


