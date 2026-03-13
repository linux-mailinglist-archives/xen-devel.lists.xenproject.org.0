Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMj9OFw9tGlljgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:37:48 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 479612872B5
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:37:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1254053.1550075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15W8-0000ny-7s; Fri, 13 Mar 2026 16:37:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1254053.1550075; Fri, 13 Mar 2026 16:37:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15W8-0000l9-2s; Fri, 13 Mar 2026 16:37:40 +0000
Received: by outflank-mailman (input) for mailman id 1254053;
 Fri, 13 Mar 2026 16:37:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rc6w=BN=citrix.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1w15Va-00040A-7a
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 16:37:06 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd861051-1efa-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 17:37:04 +0100 (CET)
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by CH2PR03MB5271.namprd03.prod.outlook.com (2603:10b6:610:95::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 16:36:55 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%5]) with mapi id 15.20.9700.015; Fri, 13 Mar 2026
 16:36:58 +0000
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
X-Inumbo-ID: dd861051-1efa-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fjtSxWna1caQMNXSbYGG1e7WzEV0itBxQjTaeOVHTlbc5SK0Vg5q7Z5oVaLFBmZHfpMYeZ5LpLMsEDRFtJyTLFJJRxIAY86oAN8bXFVkK7pdggOlxqIvtpijKuj83CO6edISv3J1tOuckKU3UIzeUpYhbq/Mh3npqrpH0W5s4htvK2ikIQfuo4P8k5pik6QADtE692ue0DR/iiq8itJ8ClqEavvLDckUu14zgARPcDq0lmtoZy2vRs90cNVb3gBWTBdicx94GqvBe2SGISjekRARXIqQ9Au5FqZGhtZOColROcG+UBhEnJCC464Oy9WadGmKuwelBnsUp7Sr/DRewg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8vfe7iZju8xm+2/r7rcAXdCT0DwXxs44MCyRUGYGVnc=;
 b=yYtr8EtYA2PiTQC9w6Ey5TmsjV7WiegYMIFiI36yVDbBi96/BQASfR2PXB3e9ml8+2i+DVRX4QbPUAWBKj0T5e/o/KKcKRuCreOC4yLAhfMvLRcFBscyqFrO5dNnQDgud/CDdnMMi7vmW9cqn8bWMOca4thz6qi8CS5h7TbCJHNjYXcuPdzwPVl0fF9XJZbZVhzKP/7j/ouQiAp2c2S68lHK/G/cu7J7xozokfQLLAmD/T3LP9Z/XyNTr4+nXkjYJ5J2b4CVzOBswY1ldKzdQINRQ2fa1iXY3xOoVzCN75Ea53I6aX4fsjurmtdfnZcWZvBEyqL1Z64fJyTI09EcsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8vfe7iZju8xm+2/r7rcAXdCT0DwXxs44MCyRUGYGVnc=;
 b=Rc/RJX0esPu1nAs7kNBo0ASfuFTwtIPysCkDX45Hn9s0DxuxeWa2HKsSNDVA4UzZRTMWK24QujbfYlrPTm1o+nZ6Yv+Ze5zFCdLTNbe67ONWTk8pGn1KyP7/TTM6gah7R2IY3jmJuYsz2IQYL+8ALBLUqkggfCgL2mEmUG7WFYg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v v3 6/7] x86: Remove x86 prefixed names from x86/cpu/ files
Date: Fri, 13 Mar 2026 16:36:29 +0000
Message-ID: <20260313163630.1073019-7-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260313163630.1073019-1-kevin.lampis@citrix.com>
References: <20260313163630.1073019-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0018.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::11) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|CH2PR03MB5271:EE_
X-MS-Office365-Filtering-Correlation-Id: 941a1d77-25b8-43b1-f484-08de811ebee6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	68/QAPABejauYqz7xkMnylWfWySCfNYUSkmo00WW8XwPHKF7tqGpTjJVDzHNBi7kVA9ty4E2DfHkdHM7M79NeoaIfbpOzLhPfM6Q04j/LG549/L3NMshxeqkTDs0R46h4J5iHydz6k65Fna4KgP8JE9/+TbjprJiijg35+uAWrrraGtFn2NrHcz37Eiy2VT+KqO3V5+QtQ6h2r6I8ZfXm2lZmi+Il84t7G0UXINtKSXG/F57gbjcPLT4UNS+2r0LzhypQZBYd4U+3wr2m75kMMOrMiMNvjuTf5kRN1t9p89yZ10KD3T38uez0i99HlDujegWbto+ziivGa6kjFlizbYq5g5QN6F16hQhO4znYuwBfhcfIKdzDR77R/C/EBLClpAfOur8ExDmqrO+PL3LYvcfNmY3b626dnXhWS8a9da6WewMBNaGDCKOV7jnctwqmlT4ZV/rJWNkOMvWwa+UbA+tscZGTcfyTM8emVzRyPqMSLWrtQ2GQI6O3qSIjAgFnMlPaWRdm78af8jFuNsSNV+QBfYvEH5p9vOOHdWuyMHw/6BYlJ+EkGJELx/6fhXYg0KFvgTrR0XKD16ErM2LcoC98F/LLXOm+FUk/Y3hGriHrfN6zkGWUvb1oxzqvpBQkgDMPnWjyCb4UTS3z5nB5dpCU434RBlpON1Zz9s41W2WhqjWTgmpzlJ3ddUnxnCqSNlflq9RwJexNMAb+vmYL3o/bU8XvD0p4IyiP6bvgoM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DJPu+h+XLVzwgdXLgIDwMmMKgoRNfZg8T+nPrQKUJoqpozkHWT3pJuu+vnzj?=
 =?us-ascii?Q?/XcnuD8JV7um0IfIUbAKiwgMtbx2MOeORwtCC/5uEKs8b4h8GRXjZkJZLtj/?=
 =?us-ascii?Q?wqKvidhWL71dzXoWCgDc37Sr7Ar5HftyDgmy5XN5yK+jKToh79MW4mzwNKMd?=
 =?us-ascii?Q?rAWkk7Qd05pkvdTwnjFQypqf+7Yq6CID+CYRntwGPEHfr6/L/3Hi+DZ2jxeW?=
 =?us-ascii?Q?DqP5eiufWqSGJDCa9bDs0rtPE6woM2r/RwUsuSFwzUZlmaSLv05cpNgeFy4y?=
 =?us-ascii?Q?eeDxGEdBs14xnbXHzGKcXiEDBPpl6LpLz4Pv3dT9HNFOsvHHu3gFSJLFqWKg?=
 =?us-ascii?Q?1EBtDn3lv2VjCJAZ0mtcFu7d4gAEpvNwkjMKSV7y7kPiKSwFP1ye45Xwj1GX?=
 =?us-ascii?Q?+O/31fqg0Hi1VCCinlWGQRswMnGLMao5MOfBOwMCwtxtGOF/+X6NcOFkQNPO?=
 =?us-ascii?Q?bKiWq/Lj6c4z9mrtRiS91kNPozKJwouYkAQ+TxmSX9yzWrVn8k4A5CI07iXn?=
 =?us-ascii?Q?IJOIFbVRzbpwDp/95HtGdxBvJdXcrK0A0is70fxUxqiFhNgfy68gVeh28ZKm?=
 =?us-ascii?Q?szHr4UDTH/vC0tbkMplpRVQSZVBGcTk1cQRiEd6NEJ9jmUZvkx6eS1OUas5I?=
 =?us-ascii?Q?YLmZol7vWQVlLVatOREVnJSDb6jGZSG3jQvN6fVXhGFIxuXNvQhD/p92vMHL?=
 =?us-ascii?Q?ilG3ct8DXYjmWB1V4+Om/BQQ8sQhHiWq+UNKz3qS1eh1VwXizMRIhYTCUHKX?=
 =?us-ascii?Q?yjkbx10J2yWQaJ1VxGDBtS9R8g+wq4uLJyDGyrhJEBQh4U7a+8tGEwgqcSkz?=
 =?us-ascii?Q?Yv+03J6lEKp2R6XHBZR0qerC3ulhO+Yp/0nurRQEUSUhYvonxJntgTG6e1X7?=
 =?us-ascii?Q?q/epbEO3khCtiUishwZm3bySq48scVtmSxwCCBXFoiZOjl4bU1PRz/QCVI1V?=
 =?us-ascii?Q?9cEluOKBiR9BP8rGhT1QcveKv5xNnuXauENkGvRkY35UibI3Mz3x8ry/DOpf?=
 =?us-ascii?Q?JFmiHG0CmWsmGHLoEinGyDLXRiXjl/YL+2u2ZBMqN01IeLftdKg2NnslfL0h?=
 =?us-ascii?Q?Xd0otCT6XH+Krk13E6qecgB0726sO8sopagJwiJs5r2l8YEwpYWMp4Y8vHCf?=
 =?us-ascii?Q?7+0rjXxnA/sCG5ovriTm0hqWwjvw064OBttxSFlFNA6ZG7/Fo70ZtSqbBg+3?=
 =?us-ascii?Q?yN5Ucw0yDw/0G9Gi67T3Dv9NAh/ALNvP6SkoIDwEhDqnJESU4VoekNpZ9bq4?=
 =?us-ascii?Q?uokY/9OHV+TWcbp1F9E7zPFjveXeIl4155jrzyUeiNwWOyYG1TA8dijVBpyY?=
 =?us-ascii?Q?7htuln0yZgDah1HoKV+f0FeEDtNGXU+f7F7EqTdqZRauDsNzHmvRQuCLEYan?=
 =?us-ascii?Q?KUGklO8KABPFEUajcAYjG8WxRfcGpphyKJdAEXVl7x3eyBNxtw1GwWJ5ruqz?=
 =?us-ascii?Q?P1zSnJOt5QiFbLVUu8C1xWyNRDwou0dEFdxZlr4HLInRrBfBmsv+13fNV4+y?=
 =?us-ascii?Q?2+1oDD3v3+7Gcivowh/WpKUnzF1EfKYqsmstscJTLSpivCadbwKvleweD/E1?=
 =?us-ascii?Q?Yah2Ea/GF7g2SSNZxl64taux+AnWHUlTCErD9fSxYNkA3ylt+iXok9ZD3VLV?=
 =?us-ascii?Q?Sm01LkojUYXYv0YA6rjdsaAx7NxMFoMqXsJwwBNZisM+EYfOZ94IJMjJFTn3?=
 =?us-ascii?Q?wsmwTPRWz1J7WYQd7d/2yd9Df0MEOu0MAS5tRvRYvW7bFlZgrLLK2DcAoGG3?=
 =?us-ascii?Q?v2t4ARxBtw=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 941a1d77-25b8-43b1-f484-08de811ebee6
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 16:36:58.6177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0pyVO/wnya28DO590rg2qGyBRHh6OjcxBsL7/O947YGG3yq0NeG7avLss8I2OuOFtrxUByvhqmqTWT1vImueug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5271
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:email,citrix.com:mid];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 479612872B5
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
- Switch uint8_t to unsigned int in vpmu_arch_initialise()
- Switch int to unsigned int in vpmu_init()
- Remove XXX comments

Changes in v3:
- No changes
---
 xen/arch/x86/cpu/centaur.c         | 4 ++--
 xen/arch/x86/cpu/hygon.c           | 4 ++--
 xen/arch/x86/cpu/intel_cacheinfo.c | 6 +++---
 xen/arch/x86/cpu/mtrr/generic.c    | 4 ++--
 xen/arch/x86/cpu/mwait-idle.c      | 4 ++--
 xen/arch/x86/cpu/vpmu.c            | 4 ++--
 xen/arch/x86/cpu/vpmu_amd.c        | 6 +++---
 xen/arch/x86/cpu/vpmu_intel.c      | 4 ++--
 8 files changed, 18 insertions(+), 18 deletions(-)

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
index 0ca6a2083f..23c279eb9a 100644
--- a/xen/arch/x86/cpu/mtrr/generic.c
+++ b/xen/arch/x86/cpu/mtrr/generic.c
@@ -218,8 +218,8 @@ static void __init print_mtrr_state(const char *level)
 			printk("%s  %u disabled\n", level, i);
 	}
 
-	if (boot_cpu_data.x86_vendor == X86_VENDOR_AMD ||
-	     boot_cpu_data.x86_vendor == X86_VENDOR_HYGON) {
+	if (boot_cpu_data.vendor == X86_VENDOR_AMD ||
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
index c28192ea26..470f5ec98d 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -398,7 +398,7 @@ int vpmu_load(struct vcpu *v, bool from_guest)
 static int vpmu_arch_initialise(struct vcpu *v)
 {
     struct vpmu_struct *vpmu = vcpu_vpmu(v);
-    uint8_t vendor = current_cpu_data.x86_vendor;
+    unsigned int vendor = current_cpu_data.vendor;
     int ret;
 
     BUILD_BUG_ON(sizeof(struct xen_pmu_intel_ctxt) > XENPMU_CTXT_PAD_SZ);
@@ -815,7 +815,7 @@ static struct notifier_block cpu_nfb = {
 
 static int __init cf_check vpmu_init(void)
 {
-    int vendor = current_cpu_data.x86_vendor;
+    unsigned int vendor = current_cpu_data.vendor;
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
index 1e3b06ef8e..ed9f62b936 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -917,7 +917,7 @@ const struct arch_vpmu_ops *__init core2_vpmu_init(void)
         return ERR_PTR(-EINVAL);
     }
 
-    if ( current_cpu_data.x86 != 6 )
+    if ( current_cpu_data.family != 6 )
     {
         printk(XENLOG_WARNING "VPMU: only family 6 is supported\n");
         return ERR_PTR(-EINVAL);
@@ -958,7 +958,7 @@ const struct arch_vpmu_ops *__init core2_vpmu_init(void)
               sizeof(struct xen_pmu_cntr_pair) * arch_pmc_cnt;
 
     /* TODO: It's clearly incorrect for this to quirk all Intel Fam6 CPUs. */
-    pmc_quirk = current_cpu_data.x86 == 6;
+    pmc_quirk = current_cpu_data.family == 6;
 
     if ( sizeof(struct xen_pmu_data) + sizeof(uint64_t) * fixed_pmc_cnt +
          sizeof(struct xen_pmu_cntr_pair) * arch_pmc_cnt > PAGE_SIZE )
-- 
2.51.1


