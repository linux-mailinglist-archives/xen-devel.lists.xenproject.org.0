Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E197633DE
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 12:34:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570287.892012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qObqZ-0000NQ-HG; Wed, 26 Jul 2023 10:34:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570287.892012; Wed, 26 Jul 2023 10:34:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qObqZ-0000Lh-Dy; Wed, 26 Jul 2023 10:34:23 +0000
Received: by outflank-mailman (input) for mailman id 570287;
 Wed, 26 Jul 2023 10:34:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aSls=DM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qObqX-0000JJ-O9
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 10:34:21 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2060c.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa43eba7-2b9f-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 12:34:19 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB9175.eurprd04.prod.outlook.com (2603:10a6:20b:44a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 10:34:18 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 10:34:18 +0000
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
X-Inumbo-ID: fa43eba7-2b9f-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Amg9aCqrhZjQQYcofkVt0WyW9aFCqhUsc/1LoL4KJ9WpuvvvLLmNH7zyKn3gZBxYuhF6Eau3X6EkRbxwnUI1lkCL2nWSPsgr2//Gnq4tOcOJLdxF8aiujtvtngdvc0KMQ7zDfkwwa6AbyZH1x5zHy1tr6X6P5sm5EI4CjW29YLROgAbOiiuZXXaFHTfoim/RoRmp8GHbYtLVSpHQNLmXahzeLWjh4x8EvBWrfN+fpaY4my0KEMkHlF2uCE8P8Y6qVOO5F/Ek6IYFy99c7O8DurRPsFOY1GogIMxtcFPMInlCQQwafWq3wnxwq2aB57ffiBVdV8jNCGwL70e1tFEjOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TPlKNfVxQjdacpVGXLYkRGRaFkfGEJC8kPssuPwlEoU=;
 b=CHZLd8BxrxOILk+9VcZIhf4Bv1no3OUexskYRKHRhGHG4FYx4ByndqJoLUWE/lrp/evaQIVQLZR4/gI0xncI8jO5wtLOaAxDfIpCbvoXn7tvjyuewSWu6eTAGmXzAVEU+KBKNB56B4DLTTYpVtYSuu5hQQpGREffbpxbOyIeduODFicj6hC1//4Iig8r/Yfobl2Ll5iQom0GIswTtOHuI5TH3asr6AohLOAbJkC1g5pq7hDwA4OIIoM4zr1JeK47pqI9srakrz/xR/nKxTjpanhpZG7pcv/qYwOg6HMAtEEyiTptkDqf42oNajAA5c9xDUg4L2nkPEPC2hrYDg1ciQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TPlKNfVxQjdacpVGXLYkRGRaFkfGEJC8kPssuPwlEoU=;
 b=ipwkk5+OLkiHvxKV23r/UDXB31ecXzYGJK6xgDUSnDMsDuBy03+Xvcr+2HBTe9VxchV+RXp6KdYahEgqVZ9r2DsPQdfOEoBZxBceUKXOFVae7ujBRLdsTcrngzIgSeZLnOlG8/vtSfTSXAhKJL+fqqgo0Cf7vPy8t9WAM0GGlmqOgjzncSd+bfiy2/QeATLpEORdhrUfndVFyK36pMNC4k5YRzo4HYvpcajeI94gFP/jEiM1G6zRUG46siG4tcTNnlfT3KtkTbsAtMIKbBYgE0a0wFIZ2emSSIx+J24N4a8ToEaj5fVMbd4YHH/9N93Z8PjvQPPrrPFalNj88D86mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3c819879-d113-facd-b025-b062e68bb6a1@suse.com>
Date: Wed, 26 Jul 2023 12:34:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: [PATCH v3 3/5] x86: allow Kconfig control over psABI level
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <10ce72fb-4fb7-67de-41ec-7291dbac0038@suse.com>
In-Reply-To: <10ce72fb-4fb7-67de-41ec-7291dbac0038@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0097.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB9175:EE_
X-MS-Office365-Filtering-Correlation-Id: d97ce499-2a6a-4e29-17c9-08db8dc3dd7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CL2WyjQ9i5UA4x8FButp0SkHhuwwDJNq1PUiC7wLmjHttd56NiSvNidxdkj3sEKw1nGBzD+8Uo2tBzz+yjZGR4Qbp9SRh5wo4gAtSmzq/7zjnhTXJBxAB+oEzi7N/f9OZnhn0Ah9ZhdNhpc/3FGN2i7P17gChO9rgoc8qevlZtAHPoodop1ufLNt2Y1MiJzXw1DkfIAISHGoThrFdBlIZ/qhyIJzm78Jpt2wQb9iC46UcMbXDlnxaf5dzIl3u0IVdJoa02z1Mnto6wqm11ePB8iE1qj9LQPsRTNPKuTCXOfQosq0WAVpsuUyBgvJNgYhzseH1kigVmKYrhhE8GUG5+IbTJCrVSdCnjZGmrGgqcpOMupasw90PvEQBOilYikpm3bOaV2VfRH7XXlfDVBm68UD8o+BLjeq+8Ne7YOFziZWTalKk+LJ///JtjVFGj2zfuObYzqn2GuuUoDxsEnGl3GL3UXLJmRtXANSFXVZ9y7o8E3iUOn5Ydq5hLkwhAwALcDSdIuETGErLcfFxPWSlTGmsr1Y+rWl1qkJLv0HLG/ojF9FhmQmtqQPkmO1fN/QMc1HvZQNQmyqwiOwGJZ8J1R5fYxbWPwsLUt5G+4Bsp1/DBU3MlZmhZNtZD2a9dTap4q4O9h0rFkyz5p5bxPhig==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(376002)(366004)(396003)(136003)(451199021)(54906003)(6512007)(6486002)(6666004)(478600001)(66476007)(2616005)(26005)(186003)(6506007)(2906002)(66556008)(6916009)(66946007)(316002)(4326008)(5660300002)(8936002)(8676002)(41300700001)(38100700002)(86362001)(31696002)(83380400001)(36756003)(31686004)(66899021)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjBKOE1LM1lrbmpPVzBsVmlDNldRUmwxUnBxYjJFTjduYXJNcnk0cXdJU0xJ?=
 =?utf-8?B?OWFaTWhiZFROT0ZvUTlDTlZoOUoxc0dkUDc5a1NmbXZXaThFb0xIMWFuL2ha?=
 =?utf-8?B?QlBET3V5MjA1Qkl1ZzdtdDNEeXh2MGlzN2JhS0owZFNQbm1kUHZrQUN0Z2Vs?=
 =?utf-8?B?aEZGZzYxUmZJZTdLcENpK0Jja2JKNUlsYjE0RDJNNEZyRkR2anozTzlHRmtL?=
 =?utf-8?B?TW5YQ3JBcXU5cVEzY0xobUw5Z1h4Vy9taGdtaWNmd01vb3o2bXpya1dIclhz?=
 =?utf-8?B?c1o4WXBPOVFiTDRMRzcycUdRM1JNY0dBRU9pVzBCSEtnN1MzTEg5TGs1QVRQ?=
 =?utf-8?B?V3BkVk1YUDRjT1R5ZGZ1cDFkNUVFc3pGNnJmak80YjJTdWE5OXRkM3VLN2w4?=
 =?utf-8?B?ek1YczlCOHJtUHE3UUFXODNRUDg0T1Z6RnArQ0RZVGFzNVJiZWQySTZ2YjBv?=
 =?utf-8?B?REhlc3lTR3ZYNjRjemxMNnZTa1NBUXhsbW5xVUo5WjRZTlNFRUF0MEpqMTNY?=
 =?utf-8?B?VlZCQ0JLQURiV0M0VXplS2w2Q0ZsYU5yMXpHekRiM3FPaG8vRlpNdDdqWVhF?=
 =?utf-8?B?eEllT1RYd3RjQXJLRVQyUTVKUUdLWGp3dlMyMnIzc2NFSXNOdk53UFpqeldB?=
 =?utf-8?B?WGVHTUNPOGFZR3l4NGt2ZE1wOHcrR29NYUtOYmwraWZMbU93RkROdG9CVm82?=
 =?utf-8?B?cjE0c0NudXk1bWZUbXpTSWNoMHFNdC9OTXpRbUxWUi9CWHJWdFVYdm10SVFW?=
 =?utf-8?B?bHB0MnVBVU9VMFpiSlhyU1NTeXpRSWZvYkRvZzZRL3dxSnhtaVBNUVVZQ1hE?=
 =?utf-8?B?eXNvblFQM1ZSNWU4UzVxOXhLM05qRXBIZzVSdXJjTjdhcnFaR3JtK1Z6RW5J?=
 =?utf-8?B?Z0VMaG43Zzd0TWZOUzlmdXgvck1FaWFnSHBpYy81NnV3Vjk4NmtoTUJMYXF5?=
 =?utf-8?B?eWlvbmJUTWM0akdQclpPWkV2cG5zNjlxaE9MOVJzMkdLQ0F4a0svQjZUZDM5?=
 =?utf-8?B?ZjBwWFVnVWNKeTEzWnBxcGx3VGxoeXZMRFY2Z0tKQ2tIdkowVENIbEsxVGpJ?=
 =?utf-8?B?VDNuc2EydVNnbFN3NTd5Tml6anN6RkJpamJKNTBIRzJCMFF3dDJNL09DQzU1?=
 =?utf-8?B?enJBTmpFSnRobDVjcm9IQ2tpYmJYK0xIdmRQS2d3UWQ4cDY5N05oaFdWL1Rj?=
 =?utf-8?B?bDg2Z0dvR2lCV1R2T05tRVlyb0k5ODJZNW9Kd2lVVHczQUpRb0dFWVZLSThY?=
 =?utf-8?B?N3d1ZUcwTlhTdWpNMGsxZlBmd05LdlozTmNqTGlBRG5lQ0VaUzZMdThVODVm?=
 =?utf-8?B?Nkx1cFdPMHkyS0w0SThyRWo4cVF0cEVLWS8xNitaWkNMcXRucHZVNlNLc0c4?=
 =?utf-8?B?V1pGQTZ2T3lLZnUvUk5XNDM1SUdjU0VtYndDdmZla0dzaDFKckh2aDJ6TWlv?=
 =?utf-8?B?dFo2WkM1L0d6RkpzK0t1WGJFdUhrVC94RTliU2xLMkprSWV0VDgweDBMbzRE?=
 =?utf-8?B?RmlmOHV6aVkwK0xzeURNaEtuQUVjMzNuUzh5SGM1My9naEdzVkY2L1ZMaURW?=
 =?utf-8?B?VkxKSGF6OXhaVkY0OEZHMG1wejUwbDBxTXJCQ0F2UHZlbnBncTVIeFVHOUdU?=
 =?utf-8?B?dWd3Mkk5SnpvUFZlYmxMZkpuakJZcGt3VVFxaGJMekxMdUFscm9BeWdaVmtG?=
 =?utf-8?B?a0J4K1FVR3pRMVYzRHdlZy9nL2huQXY0emQxOVVodHNlUS9FREtyajVob0t6?=
 =?utf-8?B?Nm5xd0hIT3oyRUEwUEZTdllrMVhyNk9zQzdwMGZvQktjMnpTKzVhVHZMM1dK?=
 =?utf-8?B?a2VyRTJhS09pZDNaaytNdllob002aEpiVUxHU1NGT0JWeTFQaFlWTjJqZzlo?=
 =?utf-8?B?YTdqN21ZWnU3US9IZ2VmTmxJaVdMYnF0QUp5MVJyQ1RpMS9ybUFmMytZY2ll?=
 =?utf-8?B?dmMrTldSTE8xbDlSS0tPYzBFazVsVDdhR21ZOGNDWFp5K2swNDB2a0hDdmVr?=
 =?utf-8?B?STRNK0VocFMzZTBGblIzWmh1bFBnWW1qVlVmNGlieVRBMUlnZzhDWEpGMUUr?=
 =?utf-8?B?dmNZMFRzdS81anZ3bm9mckdOT0ZEeUw1QXdRUllmbGd6bE9vdmtZME1kZnZl?=
 =?utf-8?Q?nU4dNM/6PNrvPcsyuSC7RtFxM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d97ce499-2a6a-4e29-17c9-08db8dc3dd7b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 10:34:18.3412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZHPiCP0ljD7tcCAq5uDNGbK1XYXpTj1lvlyVMlIjVYpxku22BduGB8mKdc65pmNv0+TsAHciJwmHUROzQSHrrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9175

Newer hardware offers more efficient and/or flexible and/or capable
instructions, some of which we can make good use of in the hypervisor
as well. Allow a basic way (no alternatives patching) of enabling their
use. Of course this means that hypervisors thus built won't work
anymore on older, less capable hardware.

Since older compilers (apparently gcc10 / clang11 and older) won't
recognize -march=x86-64-v2 etc, also addd fallback logic passing
-mpopcnt and alike explicitly.

Note that in efi_arch_cpu() the filling of 7c0 and 7d0 are forward-
looking; we only require 7b0, but we need to use cpuid_count() anyway.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
TBD: While the added assembly code goes strictly from the CONFIG_*
     settings, EFI code uses the compiler provided manifest constants
     where available (just like the subsequent "x86: short-circuit
     certain cpu_has_* when x86-64-v{2,3} are in effect"). While I
     generally prefer it that way, this comes with a downside: If we
     ever started to use one of the ISA extensions in assembly code
     (and then keyed to the CONFIG_* settings), things could break. I
     don't view us doing this as very likely though, as then we'd need
     to have two (or more) variants of such assembly code, which we
     would likely want to avoid. (What I'd like to avoid is using the
     compiler manifest constants in assembly code: In principle we ought
     to filter out any -march= when constructing AFLAGS, and perhaps
     at least all -m... and -f... options. Compilers might rightfully
     complain about their use as inapplicable, much like we've seen for
     -Wl,... when no linking is done.)

TBD: While we don't document most "cpuid=no-*" options (and hence imply
     their use to be unsupported), using e.g. "cpuid=no-popcnt" with a
     V2=y hypervisor clearly can't have the intended effect, and hence
     might perhaps better be flagged in some way.

TBD: v2 also includes LAHF/SAHF. Since we don't use floating point and
     hence FPU insns, we ought to be okay not explicitly checking for
     it. But there is a certain amount of risk of the compiler finding
     some "smart" use for one or both of the insns. However, if we were
     to check the feature, we'd need to account for the quirk that
     init_amd() also works around.

Whereas the baseline -> v2 step isn't much of a difference (we'll gain
more there by a subsequent patch), v2 -> v3, while presumably (or shall
I say hopefully) faster, yields an overall growth of .text size by (in
my build) about 2k. The primary reason for this appear to be conversions
of SHL-by-immediate to SHLX.

The VGA output attempt in early (MB/MB2) boot code does not appear to
work (anymore?). The serial output may work, but only if - without any
setup in Xen - both sides agree on the serial settings (baud rate etc).
Hence the feature checks added on the legacy paths are of limited use.
---
v3: Add fallback logic and use logic from new prereq change.
v2: Also cover XSAVE. Add early boot feature checking.

--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -118,6 +118,36 @@ config HVM
 
 	  If unsure, say Y.
 
+choice
+	prompt "base psABI level"
+	default X86_64_BASELINE
+	help
+	  The psABI defines 4 levels of ISA extension sets as a coarse granular
+	  way of identifying advanced functionality that would be uniformly
+	  available in respectively newer hardware.  While v4 is not really of
+	  interest for Xen, the others can be selected here, making the
+	  resulting Xen no longer work on older hardware.  This option won't
+	  have any effect if the toolchain doesn't support the distinction.
+
+	  If unsure, stick to the default.
+
+config X86_64_BASELINE
+	bool "baseline"
+
+config X86_64_V2
+	bool "v2"
+	help
+	  This enables POPCNT and CX16, besides other extensions which are of
+	  no interest here.
+
+config X86_64_V3
+	bool "v3"
+	help
+	  This enables BMI, BMI2, LZCNT, MOVBE, and XSAVE, besides other
+	  extensions which are of no interest here.
+
+endchoice
+
 config XEN_SHSTK
 	bool "Supervisor Shadow Stacks"
 	depends on HAS_AS_CET_SS
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -36,6 +36,29 @@ CFLAGS += -mno-red-zone -fpic
 # the SSE setup for variadic function calls.
 CFLAGS += -mno-mmx -mno-sse $(call cc-option,$(CC),-mskip-rax-setup)
 
+# Enable the selected baseline ABI, if supported by the compiler.
+x86-64-$(CONFIG_X86_64_BASELINE) :=
+x86-64-$(CONFIG_X86_64_V2) := x86-64-v2
+x86-64-$(CONFIG_X86_64_V3) := x86-64-v3
+
+ifneq ($(x86-64-y),)
+CFLAGS-psabi := $(call cc-option,$(CC),-march=$(x86-64-y))
+
+ifeq ($(CFLAGS-psabi),)
+# Fall back to using the subset of -m... options that are of interest.
+x86-64-v2 := -mpopcnt -mcx16
+x86-64-v3 := $(x86-64-v2) -mbmi -mbmi2 -mlzcnt -mmovbe -mxsave
+$(call cc-options-add,CFLAGS-psabi,CC,$($(x86-64-y)))
+
+ifneq ($(strip $(CFLAGS-psabi)),$($(x86-64-y)))
+$(warning Options not recognized by $(CC): $(filter-out $(CFLAGS-psabi),$($(x86-64-y))))
+XEN_CONFIG_UNSATISFIED += X86_64_Vn
+endif
+endif # CFLAGS-psabi
+
+CFLAGS += $(CFLAGS-psabi)
+endif # x86-64-y
+
 ifeq ($(CONFIG_INDIRECT_THUNK),y)
 # Compile with gcc thunk-extern, indirect-branch-register if available.
 CFLAGS-$(CONFIG_CC_IS_GCC) += -mindirect-branch=thunk-extern
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -124,6 +124,12 @@ multiboot2_header:
 .Lbad_efi_msg: .asciz "ERR: EFI IA-32 platforms are not supported!"
 .Lbag_alg_msg: .asciz "ERR: Xen must be loaded at a 2Mb boundary!"
 .Lno_nx_msg:   .asciz "ERR: Not an NX-capable CPU!"
+#if defined(CONFIG_X86_64_V2) || defined(CONFIG_X86_64_V3)
+.Lno_x86_64_v2_msg: .asciz "ERR: Not an x86-64-v2 capable CPU!"
+#endif
+#ifdef CONFIG_X86_64_V3
+.Lno_x86_64_v3_msg: .asciz "ERR: Not an x86-64-v3 capable CPU!"
+#endif
 
         .section .init.data, "aw", @progbits
         .align 4
@@ -156,9 +162,20 @@ early_error: /* Here to improve the disa
         jmp     .Lget_vtb
 #ifdef CONFIG_REQUIRE_NX
 .Lno_nx:
+        pop     %ecx
         mov     $sym_offs(.Lno_nx_msg), %ecx
         jmp     .Lget_vtb
 #endif
+#if defined(CONFIG_X86_64_V2) || defined(CONFIG_X86_64_V3)
+.Lno_x86_64_v2:
+        mov     $sym_offs(.Lno_x86_64_v2_msg), %ecx
+        jmp     .Lget_vtb
+#endif
+#ifdef CONFIG_X86_64_V3
+.Lno_x86_64_v3:
+        mov     $sym_offs(.Lno_x86_64_v3_msg), %ecx
+        jmp     .Lget_vtb
+#endif
 .Lmb2_no_st:
         /*
          * Here we are on EFI platform. vga_text_buffer was zapped earlier
@@ -657,6 +674,7 @@ trampoline_setup:
         mov     $1, %eax
         cpuid
         mov     %ecx, CPUINFO_FEATURE_OFFSET(X86_FEATURE_HYPERVISOR) + sym_esi(boot_cpu_data)
+        mov     %ecx, %edi
 
         mov     $0x80000000,%eax
         cpuid
@@ -674,6 +692,9 @@ trampoline_setup:
         bt      $cpufeat_bit(X86_FEATURE_LM),%edx
         jnc     .Lbad_cpu
 
+        /* Preserve %ecx for later use. */
+        push    %ecx
+
         /*
          * Check for NX
          *   - If Xen was compiled requiring it simply assert it's
@@ -724,6 +745,36 @@ trampoline_setup:
 .Lno_nx:
 #endif
 
+        /* Restore CPUID[80000001].ecx output. */
+        pop     %ecx
+
+#if defined(CONFIG_X86_64_V2) || defined(CONFIG_X86_64_V3)
+        mov     $cpufeat_mask(X86_FEATURE_POPCNT) | cpufeat_mask(X86_FEATURE_CX16), %eax
+        and     %edi, %eax
+        cmp     $cpufeat_mask(X86_FEATURE_POPCNT) | cpufeat_mask(X86_FEATURE_CX16), %eax
+        jne     .Lno_x86_64_v2
+#endif
+
+#ifdef CONFIG_X86_64_V3
+        mov     $cpufeat_mask(X86_FEATURE_MOVBE) | cpufeat_mask(X86_FEATURE_XSAVE), %eax
+        and     %edi, %eax
+        cmp     $cpufeat_mask(X86_FEATURE_MOVBE) | cpufeat_mask(X86_FEATURE_XSAVE), %eax
+        jne     .Lno_x86_64_v3
+        bt      $cpufeat_bit(X86_FEATURE_ABM), %ecx
+        jnc     .Lno_x86_64_v3
+        xor     %eax, %eax
+        cpuid
+        cmp     $7, %eax
+        jb      .Lno_x86_64_v3
+        mov     $7, %eax
+        xor     %ecx, %ecx
+        cpuid
+        mov     $cpufeat_mask(X86_FEATURE_BMI1) | cpufeat_mask(X86_FEATURE_BMI2), %eax
+        and     %ebx, %eax
+        cmp     $cpufeat_mask(X86_FEATURE_BMI1) | cpufeat_mask(X86_FEATURE_BMI2), %eax
+        jne     .Lno_x86_64_v3
+#endif
+
         /* Stash TSC to calculate a good approximation of time-since-boot */
         rdtsc
         mov     %eax,     sym_esi(boot_tsc_stamp)
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -740,29 +740,53 @@ static void __init efi_arch_handle_modul
 
 static void __init efi_arch_cpu(void)
 {
-    uint32_t eax = cpuid_eax(0x80000000);
+    uint32_t eax = cpuid_eax(0), dummy;
     uint32_t *caps = boot_cpu_data.x86_capability;
 
     boot_tsc_stamp = rdtsc();
 
-    caps[FEATURESET_1c] = cpuid_ecx(1);
+    if ( eax )
+        caps[FEATURESET_1c] = cpuid_ecx(1);
 
-    if ( (eax >> 16) == 0x8000 && eax > 0x80000000 )
-    {
-        caps[FEATURESET_e1d] = cpuid_edx(0x80000001);
-
-        /*
-         * This check purposefully doesn't use cpu_has_nx because
-         * cpu_has_nx bypasses the boot_cpu_data read if Xen was compiled
-         * with CONFIG_REQUIRE_NX
-         */
-        if ( IS_ENABLED(CONFIG_REQUIRE_NX) &&
-             !boot_cpu_has(X86_FEATURE_NX) )
-            blexit(L"This build of Xen requires NX support");
-
-        if ( cpu_has_nx )
-            trampoline_efer |= EFER_NXE;
-    }
+    if ( eax >= 7 )
+        cpuid_count(7, 0, &dummy,
+                    &caps[FEATURESET_7b0],
+                    &caps[FEATURESET_7c0],
+                    &caps[FEATURESET_7d0]);
+
+    eax = cpuid_eax(0x80000000U);
+    if ( (eax >> 16) == 0x8000 && eax > 0x80000000U )
+        cpuid(0x80000001U, &dummy, &dummy,
+              &caps[FEATURESET_e1c], &caps[FEATURESET_e1d]);
+
+    /*
+     * Checks here purposefully don't use cpu_has_* because they bypass
+     * boot_cpu_data reads if Xen was compiled with respective CONFIG_*.
+     */
+#define CHK(ppsym, feat) do {                                        \
+        if ( IS_ENABLED(ppsym) &&                                    \
+             !boot_cpu_has(X86_FEATURE_ ## feat) )                   \
+            blexit(L"This build of Xen requires " #feat " support"); \
+    } while ( false )
+
+    CHK(CONFIG_REQUIRE_NX, NX);
+
+    /* x86-64-v2 */
+    CHK(__POPCNT__, POPCNT);
+    CHK(CONFIG_X86_64_V2, CX16);
+    CHK(CONFIG_X86_64_V3, CX16);
+
+    /* x86-64-v3 */
+    CHK(__ABM__, ABM); /* LZCNT */
+    CHK(__BMI__, BMI1);
+    CHK(__BMI2__, BMI2);
+    CHK(__MOVBE__, MOVBE);
+    CHK(__XSAVE__, XSAVE);
+
+#undef CHK
+
+    if ( cpu_has_nx )
+        trampoline_efer |= EFER_NXE;
 }
 
 static void __init efi_arch_blexit(void)


