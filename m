Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 682FF775EF7
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 14:30:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581039.909551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTiJx-0000Yt-Ju; Wed, 09 Aug 2023 12:29:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581039.909551; Wed, 09 Aug 2023 12:29:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTiJx-0000Wd-Fl; Wed, 09 Aug 2023 12:29:49 +0000
Received: by outflank-mailman (input) for mailman id 581039;
 Wed, 09 Aug 2023 12:29:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhcc=D2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTiJv-0000WR-PM
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 12:29:47 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6cc5f5b0-36b0-11ee-b280-6b7b168915f2;
 Wed, 09 Aug 2023 14:29:46 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8792.eurprd04.prod.outlook.com (2603:10a6:10:2e3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.25; Wed, 9 Aug
 2023 12:29:44 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Wed, 9 Aug 2023
 12:29:44 +0000
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
X-Inumbo-ID: 6cc5f5b0-36b0-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U7sGYmwSz5Wa0LUVrmfr0xxJ7Ngy/9ayMytBl/nykxdwou5fWxq52x8g+y94tMN+vvXvXG9v+aVQ3FwNrDhXb4YnzFS/LsDs3CaTv7Jj3I56a5iw/wSUKoiTVBt29KA7fRlIQ01gWGoZN/nIgG/TRuhtB/YjgQaWeVxJcWcpS2IaqN2iLMfXmow/XMXMt7e2TT+4C31sANGTlMkdwTd8wljSHSQZ9SAgIe0ZMv8oLRNa3Q2kZqPowCGZR1ORIDxA/mZGVYwN6wo34pG0vNBiveioj38j2H0+RYr6bBV52QHTko/wZXdRvJTXsNR3jgFTmaMR6RCp3eO5GQR3qM3MRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LELKa6p2/OKxQTGmguNp2vkQIbLmcSv+nDELPfyHX3Y=;
 b=gGJ82yNCR2LEMpVVcCFkfrGA6drxkegawsZ6Wg6HtZZpujN111RzldSRXQUTwZL5ZxXC9bAf9Nbrie79xEcRGgmf7eDWBTIUMvXnSgWY9qPVLX5xxtBG1m1U4QQmjVhZ4hpIzpmZ/m2/YefIhwEoj6d1d8wx+/M1fBmz8OG6fAEO1FmwYeV7HT3B/csq1nXTqiNMjbAJki7i2BPQd4qLiW2P2DW/UCxBALAZyJSzDfyUYd6HuSbp/sG/6Qkpch51gAMum23fjp7nqjgBq8Z/WlmbyvHCWQWjDmnE/8ZpwHKW76F+NHk9vkew9pXfBuN5USJHH9C+cjUCdcZuBHZZ7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LELKa6p2/OKxQTGmguNp2vkQIbLmcSv+nDELPfyHX3Y=;
 b=bleYAoSlVQPUrrr/NnBT18l+lb1dnHOxHPSScWhx+9Izw912Kv7o48p1+vWWsPtS1CwUcp8kCNChNXCeah42/tgB876+LTbu/NkoGSlxqaVWDLfQTl/vO82WpBzwbV0yNpq+DqUK84AMdFr8znD8R5TkVD88cO5KLADlcUUKrHsgJ6R3IYOgvBBTdxaaEqGbu4tu2Uak/wOAXJVLYmMyTeAFLPmVyFmiZtNVEf57WENpMqKfe1CP9iWYKldCMweUbszgMeXNV6UpuNWqcLSu8YVEnF1Wpu7FKaDqPcyn1VAO83A2Y51Gloiv/nIKpWkYiAxp2O/TywYCu1+rekc2yQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9c310f74-e6c3-f86e-8044-0e078ad00254@suse.com>
Date: Wed, 9 Aug 2023 14:29:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: implement cpuid() in terms of cpuid_count()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8792:EE_
X-MS-Office365-Filtering-Correlation-Id: ae78f145-0cc8-475b-8e72-08db98d44f97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6lkCR7uR07mgRP4dtBnkED1EVZQ9/jTzt8NvNexrIrAeu4xLnmzhtCtSEvW2XNAh9FjDc+uB8jCkiza8lJZwuXBOhbv1S8psu/SSR0ejJHv/vyYzj9woCmNisMa+wWivxOoUHJuzyLyHEwHmTfLhqrF/iMO5G/J5vUR+8n74Rq2lNtF1QbMFzpiJXZaRM+hd6gGYutGv/KSYtVqzmk1YQA4q1pI/Qy1yllktP3/1AhZJvGLk8q0VlEgH49yF5V0D8tX4nZiNFXqhKb86iU8ZaxpS3WQ3wdbT1S1V0BSeCdrMQdNoFqqfcb0iAc4dswfKzFx3NZfcAETVSkgtV6GdIWoS7veXvlta9Va2C4X4aWcei8F1ADv2uCCZkVqXVnVqhamokf9NGEU/IwmBUmrCsRvll+qzj//Cr9BnCmLvTZbnfL66QGDcTvCRhLwRZatiULgWjG6OW2FugxxZ0vwgGE7v6SItpiJ/IocMYVsJHqRZ0/+W1HQcs0pKbjym6bhFxkNzmYnLTYaakF+jZgL/PkduyZl5vh7lTK2lzx2k0mpSxde6Jva1MWde0P2s31SWDPZoo21INX0brjxHI6ib+tFXlHrI1ckz6OpVm31zbRn7nvuXUBh9rTYmhWJCYF4nqHnYsdEYVGtowKc32nGbjw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(396003)(39860400002)(376002)(346002)(1800799006)(186006)(451199021)(8936002)(8676002)(54906003)(478600001)(5660300002)(31686004)(41300700001)(6916009)(316002)(4326008)(38100700002)(66476007)(66946007)(66556008)(86362001)(6506007)(31696002)(26005)(2906002)(6486002)(36756003)(6512007)(83380400001)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWt2cGN0bU9nMGZBUFlHOVg3d2FtNzkrU3ZVUXFyMW0xeEg0RnRQZDJtY09a?=
 =?utf-8?B?UXBXS1VaZTQ5VmpLTWx2eituYTU4RFNrVXFJM3hRdjErMHl6NkUySjZaVjF2?=
 =?utf-8?B?bStvYS8xWjBtYkhCQ29LRG5VY3hzQUY4VzFHdjEwU3h5c1NLSWNCcmVGeTJ3?=
 =?utf-8?B?UHVHeUt2azdnWVNDWXZML2w1azVGY3NHZzRUV1hOWlhQY2U3L1lhMHZwSGtY?=
 =?utf-8?B?K0w4UGtsQWhXc3Y4c2RPQ0JhczlWNDE5Yk5BVzc4WlpFWGlTSDRkNDBwbkN4?=
 =?utf-8?B?eGorUmxKUHlhU2MwZWtLYU16dUxhY0JBSG15RzFpZ1dPRXkybitEM2pXWlVU?=
 =?utf-8?B?TUFNd0M1SEZ5WjA0NngvV3ljKzJEOW42cEdRVFBKRXdrYTl0L09EeHVySVpB?=
 =?utf-8?B?Z1VwdFJhWHZVMDNYOVVDYktTVXpyUnBBWW5ZNnB4UjdkRDdiUkh5UVBYeE5i?=
 =?utf-8?B?Y1hKdWpCYXlNZUtnODVkK0htUXM1R2dwREczSE1RU2pKcm8rT2RBSzkxSXN2?=
 =?utf-8?B?S0F6OGFVQzVnRGx3ckVsQlZtcVB5WnVuVDJZdFEzUURZMUpOb1FiYTNMcHFn?=
 =?utf-8?B?eFFqM21Ka0M4TDd0ZWZxcFNZdHQzYi9FSkdrQlVVSGROWVI1SWdEOCtkNDJj?=
 =?utf-8?B?NXFhK2lFbU5KNDFkTDZxV29IUTQ0QkVYS3k1dGl1VnNUYnA3ampvUnV3MTRV?=
 =?utf-8?B?bjFsVUdROE9FOGNzSHZpVjRxeGVGcTVaRmVZTDRFZXlQeGc0YUhXSjlleEVn?=
 =?utf-8?B?b2VYT2I0V3NVUEF3b0lsRGY1RGhGbVNmUTVMM214T3hBOHJsbnJmdWMwMGN2?=
 =?utf-8?B?RVJYem1uOG5ROURsd0ZManRLSXl2alBVc0pvNU9hZWxURW1EL1FCWXVGeHRW?=
 =?utf-8?B?VkRROTVEWkZ5R2d0cjZ3RmFBNGV2d01RQStuM0JDY2ZiYW1oUVpIV1Q4M3dk?=
 =?utf-8?B?T25KUG1tdExSdUdCMDlsUHNZd2h1bGN1eCt0WFpBbEdveTZwNnVhUmVlN2Y1?=
 =?utf-8?B?QlBLM25Da1N2TUUwMnFoTjIrMHp0RUdBZ0JmM1JxR2QrR1NtcmIwL0RKc2Rv?=
 =?utf-8?B?emt1U3dXdjY5SFZtdFAwOUhTRzNVUmNtdXQvbkZBMDFMTWZCb2pRSXYxK0lr?=
 =?utf-8?B?bERIWEhYQWszOFM4SG5XazRhMFY5OXRTZGtsSmUwV0FzZ3VkbGdxYUxRTjFz?=
 =?utf-8?B?aDA4SVpyajVBNk5kSFpmZzZRekpieVFoR0RmSXRGSWNla2VLa3ZzQmo4SFh6?=
 =?utf-8?B?aGFhWVAxaFFXS1hLRkVpK1M1eFJ2MDZ5RExwd2hXTm5Xa0R4cGxkSkN0VzND?=
 =?utf-8?B?RTEra0tVVmhhUmhYMjFiaFFvNUQ3UWIzVE5ndVIreDZpQkF4WlJtL0FWaGZo?=
 =?utf-8?B?LzRnT1MxMEpyUE9lL09lSnFYZ2MzVlNFSUk2TEUvSVRkckxsYTBSMHdWeFp2?=
 =?utf-8?B?cEUyUGd4czlsSGZ2NnBPMlhOMGRMV1c4amtQSUFlMVZOQncxQ1lwLzUyVWV3?=
 =?utf-8?B?dkhQTTNhSXUxWEh3MENVbk5STll0THd4djA4QkVBNUlESDBBVGtITnJvZE1z?=
 =?utf-8?B?MHNQRmFSUDdlcEIrZGNKNzBiR0dGRjMrQkhZeCt0SGRRRmJBZktWVXQxbWUz?=
 =?utf-8?B?MWFKaXptVVZNeXNSYnpZL3c4SitleHFHWHdjR21zSGdodVFxc2ljVE9UM211?=
 =?utf-8?B?UXpzSk56VFYwdDNFNFBsMkdnanhrbUllWTVudjliZ0orL1pINGVsVGlSd21v?=
 =?utf-8?B?RWJsdnJGWkFTdGdqRUNFbkN5Vm5PbWhKYU5YVjd2SmN6L1JOV1RIZGxyNzRH?=
 =?utf-8?B?R1hsTWpPT3kwQy8wb0xPU21NUTY5ZmJJa1ZwZmFOd0pnbSt0V3lEZzgyMlBG?=
 =?utf-8?B?WFhGZTFKa093U2RVMGZaSUplRi93V0lTNTZ3eWNxNnhCOGJxODlOcXpGVFV2?=
 =?utf-8?B?Y2VxeHZkOS9lNURJTzRteVl3eVBnQWtsSFdrbmZ3WXc0NUV4M3pHV1VlN0J0?=
 =?utf-8?B?N2dQY3VNdlVMTWlsRmg3bzJ3SnhSb1BrTlEvY2E4OVpLYjNsNE9JYWk2K0NB?=
 =?utf-8?B?TmpJbFN6V0VlZXVkSFkrcEFJVUU5ditkOGtzajVvQzAvbDZ1SU8wZjBwQzJO?=
 =?utf-8?Q?gg9uGywJpYvK7WO1YLz+7zeOU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae78f145-0cc8-475b-8e72-08db98d44f97
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 12:29:43.9984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lhKpWYnX0TH78yS0snOnl5XE8xC02Qny6um8pJ51NbRAsaQCRtNxHOid/KlSXtJhRSPfugiAM63iAnLzoz+Jnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8792

Since as a bug workaround (likely inapplicable to any 64-bit CPUs, but
it probably doesn't hurt to keep this) we clear %ecx on input anyway,
we can as well fall back to cpuid_count(). This allows getting rid of
four risky casts and makes things type-safe. The latter aspect requires
two type adjustments elsewhere. While adjusting init_intel_cacheinfo(),
convert three other local variables there as well. For the struct
cpuinfo_x86 change it is relevant to note that no 64-bit CPU comes
without CPUID support, and hence cpuid_level is never set to -1; the
comment there was simply stale.

No functional change intended, yet of course generated code isn't
identical.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
It may also be interesting to see whether this addresses issues Coverity
recently spotted (in error), in spec-ctrl.c:print_details(). Andrew
considers cpuid() being (just) a macro as a possible reason.

I'm willing to switch to an inline function, but I chose the macro route
because this way it's less code (and hence less redundancy) overall,
without any loss of functionality.

--- a/xen/arch/x86/cpu/intel_cacheinfo.c
+++ b/xen/arch/x86/cpu/intel_cacheinfo.c
@@ -172,8 +172,7 @@ void init_intel_cacheinfo(struct cpuinfo
 	    c->x86_vendor != X86_VENDOR_SHANGHAI)
 	{
 		/* supports eax=2  call */
-		int i, j, n;
-		int regs[4];
+		unsigned int i, j, n, regs[4];
 		unsigned char *dp = (unsigned char *)regs;
 		int only_trace = 0;
 
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -23,7 +23,7 @@ struct cpuinfo_x86 {
     unsigned char x86_vendor;          /* CPU vendor */
     unsigned char x86_model;
     unsigned char x86_mask;
-    int cpuid_level;                   /* Maximum supported CPUID level, -1=no CPUID */
+    unsigned int cpuid_level;          /* Maximum supported CPUID level */
     unsigned int extended_cpuid_level; /* Maximum supported CPUID extended level */
     unsigned int x86_capability[NCAPINTS];
     char x86_vendor_id[16];
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -131,13 +131,8 @@ static inline int cpu_nr_siblings(unsign
  * clear %ecx since some cpus (Cyrix MII) do not set or clear %ecx
  * resulting in stale register contents being returned.
  */
-#define cpuid(_op,_eax,_ebx,_ecx,_edx)          \
-    asm volatile ( "cpuid"                      \
-          : "=a" (*(int *)(_eax)),              \
-            "=b" (*(int *)(_ebx)),              \
-            "=c" (*(int *)(_ecx)),              \
-            "=d" (*(int *)(_edx))               \
-          : "0" (_op), "2" (0) )
+#define cpuid(op, eax, ebx, ecx, edx)          \
+        cpuid_count(op, 0, eax, ebx, ecx, edx)
 
 /* Some CPUID calls want 'count' to be placed in ecx */
 static inline void cpuid_count(

