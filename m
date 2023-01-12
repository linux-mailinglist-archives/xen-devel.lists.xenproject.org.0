Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28707666BC8
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 08:46:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475861.737729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFsIB-0000i6-1W; Thu, 12 Jan 2023 07:46:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475861.737729; Thu, 12 Jan 2023 07:46:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFsIA-0000gE-Ux; Thu, 12 Jan 2023 07:46:30 +0000
Received: by outflank-mailman (input) for mailman id 475861;
 Thu, 12 Jan 2023 07:46:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmgi=5J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFsI9-0000g8-Ps
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 07:46:29 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2058.outbound.protection.outlook.com [40.107.13.58])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38c74036-924d-11ed-91b6-6bf2151ebd3b;
 Thu, 12 Jan 2023 08:46:28 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9656.eurprd04.prod.outlook.com (2603:10a6:20b:478::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 07:46:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 07:46:25 +0000
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
X-Inumbo-ID: 38c74036-924d-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j4H4N8WRQ2tEzPALPcFJFmT1prtTp02cRF0chXsVul01B4sOMBPy8KD6DfdiCp+UrbQw/Viw2JZ/cVZqYwGoRwu4Sxequ/uA4P4Xh/qhZy09v+sqWkFb6GFlHJWG9hfUwgRakVmZvJLCzfFglsGntvlagjUXrrbb6FIsjYgNcRfbs3EBgcoasb8xK6ihA3IL0ATscI1QKAMcINv0+ylQhWlKKk6tryD4ts56qDIgx0VSRN74atPcVcWJk2DExddH8asC1KFqkNTRrXZkX9JRv6/s5vvF/HLQlHHONWaiGbTFWmlz0X08mQ85r7ysrbjN58Zu4DxkVzAnZukI2mLwTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OxTiy6rSNDxEOG8bK3nQOB5HR719EEuYnrmIBeGlZNE=;
 b=OWlC+wemmu7ahqBg8/h/gF96wOk4vPuGoDfZ9zJVsBkiMfOp/dOsyrfdRxrNxZoVLipWlcCkwB31dDeHI5GIbb9MpI3wnV6zk50zZzsLD/gq/JaT4T7sX6pZ1Jo1MU2MvBPJNfDeVYsSXh3Wdy+Ib6qM2BeHK0BPjKs3l+IaUy/LdSEbHphgX2RD34Wx+elbFeBDD5c75JxiN2irlApahvwiCQ507mK3Xk8Q8lpqT/qfoUJMnAY/91kbX2Jn+g40w0a3bOHaT6oilIAIcRx+LcrNDbUhxyD4k+evjHB5vN3j3xDBNSZShse/vmOMtWABu+wU7OfueK+SSELaZQDgHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OxTiy6rSNDxEOG8bK3nQOB5HR719EEuYnrmIBeGlZNE=;
 b=I77rv1tIN+ezpf77q95QdkAvqTOIGsAVKspx6CB0Sljon0hDMxxwniyrQ2eNsBZlHbI7+0OVn+bHi4rwbejvQqMlfzyX+NPnP2LRDHH8FtbL/RIU7/NNgVUChQzPAxhgD6V9oTJarSgG6uF5j5VRQAT3mq0iD7gpSv9F28w+Hd/LZ24sIi+kwFjgHCDQb6/Rh/UGzaixh5VCasAlpSraeV6qQb1F5TaD0o88UFxxRDZYStB2ud3E1K2dTSLOnD2d4HF9SBVjMCtsRcy018OhN1PlId3eTUl5JHpRWgCQk7sb22cAcweEUvAqhSEtRRvLjGICebO4pbDyV0M6FlhMlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <750ad2e8-a5be-d9c0-846e-41bb64c195fe@suse.com>
Date: Thu, 12 Jan 2023 08:46:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [Multiple reverts] [RFC PATCH] build: include/compat: figure out
 which other compat headers are needed
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230111181703.30991-1-anthony.perard@citrix.com>
 <5c7ffbe4-3c19-d748-9489-9a256faebb7a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5c7ffbe4-3c19-d748-9489-9a256faebb7a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9656:EE_
X-MS-Office365-Filtering-Correlation-Id: 449dff49-5e5f-430c-a992-08daf4711b80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TwUTnoQqAyFssOw5Az04d/uLf2+NTs/CqTOaxXIb2Y99R2mgVo14xpmHgLCld2C9N1TU+cwVWYlfpIGs7i+b47FQXy4e4soh0Ox83uj7JEkpzVsUAw/0iKWRVED19fQU75EBAjUT0uFG6kXPWE03H7QxkAhX9HJgHHOeJx83FP+UFH6G+QtiVAqQGayRR2m89p+zUEs2w5PdvEeLXrtIZDpJbvc8/sDYeAmJU56p2ie3wdSmVGUNnu59K5Cjx4pNUnlqbkFsnjUmldAThFieVsnPEqvnjKqD9IT/aTddcQX9Bl6orrXYGn81mE859+9uhQhfdohhShTn6Inu47ojo4q1EBSOepEn/cVEBSwcfF6OaykxHHoy5FnoMvbwaDk7bkGc4xYa/jdR/UH+0tvKmamEr70ZCF9pg9MzbiqUhVTr+2oFjkdCMB/ngpegi4b+SqdBhNUAMa0HjcjK/VBjVbd+bpE8Q6Z1ZbUUyRINr973Pvi5AMrOGjWSbKxwaR73vWTBtWV8pz6+BctqCo95/0HwXfaImCAgHrWJi6aQ0UZMLed76FyKXOQBJAGQ3NkT93+H7K+xuVDb8WDvZOuRJp9AeyTJJINeN1Zj/ZZDAuxXiGWyIvVwvMBLGerGrn/r3wvBe30GLoxpOEb696XXH+1N9UfGd3aikeR4A5GfzuSYMX2YLCoADaTD10o2WqbdqVg5g/sfaXEgBdPpUHAek8GSLUrM9GoQ/WFg2nGIbaUhOUTYP6zWxEpw3DUrHboSgsztKctgDt66KahwXYT24A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(376002)(346002)(136003)(366004)(396003)(451199015)(26005)(6506007)(6486002)(478600001)(6916009)(6512007)(186003)(966005)(66476007)(2616005)(66946007)(41300700001)(8676002)(53546011)(316002)(54906003)(4326008)(83380400001)(86362001)(38100700002)(31696002)(66556008)(31686004)(36756003)(8936002)(5660300002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cExhWThZSkh5d0tBOGoyTWhCdVRZayt4aldGa29XWVBFbEh5REJaN1BZYmRp?=
 =?utf-8?B?TmZOY0d1RWJOajZxU1ZteGhhc3QzZVR1dzE2L0dRR3VncUhmTGFkamlFTVpj?=
 =?utf-8?B?dVk4bEllNlplQ29sRHFrU24wT2JxNi9KK0c3SnVKYVZaR1pqZ2hTM0c5NFVD?=
 =?utf-8?B?SDV5Y1Q0N3pSODNnU2prRnFqRlRnWG93akNSd1FTNUNoZjI0dFNZWjFpYkJU?=
 =?utf-8?B?RVNEd285T0c5dHFiTWQ2UTRsMEd5L0hXbE9KcHVkRXRYVUM3KzJ5MHQvWUZs?=
 =?utf-8?B?TUJTYmFtbG9iQXREL21MbURUTERLcDdLTWtlWXBZSG15aldZeGdCUlhZU29n?=
 =?utf-8?B?WG9jdCs5emhSU0Qwd1RNckdyOU82aFBaNlJlOVJtd3B4VHJNRStZZnJkbitv?=
 =?utf-8?B?YTV4cnFkSWZpK1dXSnFpQ1pTLzJGUldxSVFxY24vaDFrTXc4ZTgrQXlSYmhD?=
 =?utf-8?B?d2hPdGtiWEFNbzNYNEN4RWFQMG5VZ2VpTXAzaXFCQ2xkRGdSdjFsRFVFcFRY?=
 =?utf-8?B?NzhXZnVqTFFPVnRHeWZ4aEVqSGNGdGVFZVFQOHVKTTYvQTZ6a3pUemZVSitp?=
 =?utf-8?B?b1Nub1RmWTNqR2RPdi9NUUtHN1F4Z3RscjRIK1hNalJCbjA5anl4RW9vbzRy?=
 =?utf-8?B?UG8xVmRLY2tEeVBIakMvZFZTY0tHdXM3QXNsU0JnMVlzaUQrUVQzMDg1ZXZm?=
 =?utf-8?B?S2RTaHlkYmxQUUQvdnU1V09vd2gzSHBjcHBhd2VkNzZEemwydlA2NU1YRWdI?=
 =?utf-8?B?KzBhRmVhMW9ETWZmbDVJRk8vaXVGaHp1MnVuaG1seGxybFc5VmV6dy9qYTFz?=
 =?utf-8?B?dWliaDdJUjB4cFRXeTRYL0JJVG0xc1dXanBaWEd2czFVZldUVlM1enVPY3ll?=
 =?utf-8?B?c1NwWGdyVjFRcHQvMFhwWjRYaVFiSGRMV0ZlVUdxK0R5SkhZL21BaEVKWG5n?=
 =?utf-8?B?VzN6WndHd2ZGb0RPYm9LNUh0ZWNsS1hSS1laNWt1MFAzRjdJM29KYUZIamdi?=
 =?utf-8?B?SWhyVWdLaGxCdUVMVTU5TE0rOEtwUGNsYVdVR3RZUllseGM4V3M4M2tXOC82?=
 =?utf-8?B?ZWNCVnZIVFN5d1hGK08wdFpQTVVYc1UzcVArY3V1d1R5aUF4anY3RGNMYmNx?=
 =?utf-8?B?VDNqWmppdlhWUTVwZzZ6cXhhTlBLSmt2VHBneDZDejRWazAxLzBxYm96RG53?=
 =?utf-8?B?dUtjdVdpdXM0L0MxbjNjcnQrZ2JJRHFYMCtsTDg2Y0pEZlphTHEyZStQTTlC?=
 =?utf-8?B?ajVnSnY0RVViRjBtbzN4QVkvUDEyN2dRYXdjQXRRUXo1WVFPVFhiU085Y0hj?=
 =?utf-8?B?YkFLMDBTS3Zsc0JCSGNMK3F0SXlEZFptN0thUy8wQ2UwV21jZk1vMzZmdGFh?=
 =?utf-8?B?bjEwVFN6THA1R1c1T3JzemYvWDVVV3FlZDBPZ0Q1SDhzaHRlOThqN0VCbnQw?=
 =?utf-8?B?NDhES2owNG9yN0pSS09lbGp4UEZ4WE1mVTZ3eFhSQ0QyVmsramY5L1hyZFlN?=
 =?utf-8?B?N1VGbGJ5b0xxY3ZxcGc0R0NoQ0VGMVNHQTBIbmtCemtKeG1YVjRnQVQ3Mytt?=
 =?utf-8?B?Szh4aDc0ZUVxK2pvN1JWM1NxZVluZ2xpbmFFdW90L1pDK3B5NGIyTmszd1M2?=
 =?utf-8?B?cW1ESy9qMnh0YUFDbmU4SGF0OG1EMEFlWm11Tm1hTU8zVDY1Nks2WVdoby9G?=
 =?utf-8?B?ZnhaMThmSmwxdWZlQnNJc2szcFpsVDh2UnI0aUIrdVRmTVI1NU5aYStuSC9m?=
 =?utf-8?B?ZXZidFZtSWlNTHpKNXdhWkNmUS9mLzZYM2JraWw5ZlFQMGt2YlBod3RoWjRT?=
 =?utf-8?B?MEVhdDZIWjcvVGJaM0RLOXg5ajNmaFV5cnRYYndIdTRrdE5qWDhSQlB6aEln?=
 =?utf-8?B?REliR1ZOaW01Q1FGK3BEeWUybWRKc2x1aUJJT1d3dVprVnF4YlI3YmcydjhK?=
 =?utf-8?B?Z1RFYVltaUVMb1pFRjlqU1dxLys1SUdHMnRyZGo1R3VPdnl0WGh3TExCMm1J?=
 =?utf-8?B?elh3WnBtYnR3ZWZxaXVnRnlGaVhkeUlxdnFjOTRFSjV0MTBZamdYMEFhOWFp?=
 =?utf-8?B?WWk2SVRiQncrR0c0UGtlYjZXeHhpYVYvK1Q4RGNDRXBUcjREMjNickd6V3Vr?=
 =?utf-8?Q?yAGtM+gpsl3Tq9Z+zQUT2VysN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 449dff49-5e5f-430c-a992-08daf4711b80
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 07:46:25.7963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ISy/a1CtDoLoTgQTBmO8jwhoYpSqT6Cz3w5wqKBGNGmHeZ0cyJT1Gtm3/t5XDNykeLCKqs8PjRKa/4D1sbgbxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9656

On 11.01.2023 23:29, Andrew Cooper wrote:
> For posterity,
> https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/3585379553 is
> the issue in question.
> 
> In file included from arch/x86/hvm/hvm.c:82:
> ./include/compat/hvm/hvm_op.h:6:10: fatal error: ../trace.h: No such
> file or directory
>     6 | #include "../trace.h"
>       |          ^~~~~~~~~~~~
> compilation terminated.
> make[4]: *** [Rules.mk:246: arch/x86/hvm/hvm.o] Error 1
> make[3]: *** [Rules.mk:320: arch/x86/hvm] Error 2
> make[3]: *** Waiting for unfinished jobs....
> 
> 
> All public headers use "../" relative includes for traversing the
> public/ hierarchy.  This cannot feasibly change given our "copy this
> into your project" stance, but it means the compat headers have the same
> structure under compat/.
> 
> This include is supposed to be including compat/trace.h but it was
> actually picking up x86's asm/trace.h, hence the build failure now that
> I've deleted the file.
> 
> This demonstrates that trying to be clever with -iquote is a mistake. 
> Nothing good can possibly come of having the <> and "" include paths
> being different.  Therefore we must revert all uses of -iquote.

I'm afraid I can't see the connection between use of -iquote and the bug
here.

> But, that isn't the only bug.
> 
> The real hvm_op.h legitimately includes the real trace.h, therefore the
> compat hvm_op.h legitimately includes the compat trace.h too.  But
> generation of compat trace.h was made asymmetric because of 2c8fabb223.
> 
> In hindsight, that's a public ABI breakage.  The current configuration
> of this build of the hypervisor has no legitimate bearing on the headers
> needing to be installed to /usr/include/xen.
> 
> Or put another way, it is a breakage to require Xen to have
> CONFIG_COMPAT+CONFIG_TRACEBUFFER enabled in the build simply to get the
> public API headers generated properly.

There are no public API headers which are generated. The compat headers
are generate solely for Xen's internal purposes (and hence there's also
no public ABI breakage). Since generation is slow, avoiding to generate
ones not needed during the build is helpful.

Jan

