Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C197255FE
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 09:40:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544409.850177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6nlW-0005yV-G6; Wed, 07 Jun 2023 07:39:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544409.850177; Wed, 07 Jun 2023 07:39:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6nlW-0005wU-DJ; Wed, 07 Jun 2023 07:39:34 +0000
Received: by outflank-mailman (input) for mailman id 544409;
 Wed, 07 Jun 2023 07:39:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdix=B3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q6nlU-0005wO-CD
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 07:39:32 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0615.outbound.protection.outlook.com
 [2a01:111:f400:fe02::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f36c760-0506-11ee-8611-37d641c3527e;
 Wed, 07 Jun 2023 09:39:29 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9107.eurprd04.prod.outlook.com (2603:10a6:102:229::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 07:39:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 07:39:25 +0000
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
X-Inumbo-ID: 6f36c760-0506-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bm6D1cU3NCF/3onzqAyjcm2iQMUNpUraMTjxkWce1y9oVjSMozKFrQ4+aPf+Xb6sZh3ON+ymjUx1kc1H2SiGYGAun2RHnVBXC/sFWJIxaEByg4fY3GH6tw7Kv6j8+F5XbI6WxwHHc1D3vsq3KbtmGHiMlCGGtuNAExgfSWrWxoYNApszKkJGC4/DOpIIPPQjUFuWfVyPn+HWKHfDJriyg0NlNZ7a1TW3szt5S7AHCRkT3n7OeHUKFEzFqx6NEhruqsn21N64l1YX64UQkfob6bSqC2SzkZrqyDqMd3zCowrxZI+9cUaQkwZfX5Z1iaBB+l8moj+bbd7db5JY4kqbSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9dv5y/FiF06T9BPGtgoYurWqlFiMwyAnNPey3ZzlMG8=;
 b=S3iM0Q2VJdcV2+DEqYV26ZiKeCVRtJQJYo3TOwGyqvTcfJ2IGAlct34CajQXDNHIYWcZZSG5vB3eDKsXUBIOK4/3Wcj1c2smb3BYfs5tVzgivwAsFicbqeQdP83SES8Rcg03o2hZk+SvFKJ7A7QCdl6Sna1Rl6N8rCC7jwqH3lWRd06JY54sHoKRMuJfIKH79xxuUc2ZgVpdeyxPc9RatX/KTQSBa/V6l/dpWZgVEJT5a6pH/ZiBKn9TCvOx1aYq25APE9zuhIrq3ew1jn6k+642pPFLEgCUOq1iSLpglngSxtovgMOYct2StSPrdyO1gUgLd1JgkThaEiEi19kSHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9dv5y/FiF06T9BPGtgoYurWqlFiMwyAnNPey3ZzlMG8=;
 b=RJS1LXGc0omjGcOD/8d4yIk6CzkmLklaAVuWe97Q9iLlvs8H25eiCpWb8N1rW9DyHV6TZNHFXfqwQWVbj8xGQLP842RWvYxL0shyaQYXk4SJTjaeWwIcZzu7i1cZFqR53+61E8NMVxNlB37cIpq26CELoNYf4g5kx5c/nwTorHY8uOJZZZNpFNIFlEVEaAuM1hWxyuVVgfC5nDsQsQpXlWlflDrGFXcXea47sS5n8jNSyPAjKtv4NUIwUei+laQwZqFhwpiv4DCbGDsW/K7NmOMWYU4AbAKZFOI5LrUKFXOqQsp/mBbK+etyAReBAxiR0NYhN9Upie89+xw7JiW39A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <968ba799-8fe4-e22f-b678-64e52f789026@suse.com>
Date: Wed, 7 Jun 2023 09:39:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: Xen reliance on non-standard GCC features
Content-Language: en-US
To: Roberto Bagnara <roberto.bagnara@bugseng.com>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1cd359e7-5245-a621-3be2-9323ba5b327b@bugseng.com>
 <8314e0fc-4ead-40fa-ef7b-4da8ce0655b4@suse.com>
 <80a512ac-d90e-930a-7ef7-8ebb5a80e801@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <80a512ac-d90e-930a-7ef7-8ebb5a80e801@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0165.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9107:EE_
X-MS-Office365-Filtering-Correlation-Id: ec59a687-573b-4a7b-b38a-08db672a5116
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R5SyQzeJ1pOak0ttHsxcD11DzrwOMPT9iKP4i8nKbkdcJ0Rqm193bbHMct1RzDdfrVVO3IhlPcUumgZihtxViUu+1tFGBHmyzWokQpSvRP1mGeTW6S5CXIG1CQ9eIQYtKcUk1IVJd1gZRcLtMx50251gRIXpuryK7FGtGOrld9dQIhqdXut7HSH3xXmeWvYSRFiQTXoxCYk+8hG9YbP4/o8ukTqETOxqBtWHZ+4VbaggU4SA8ufMzb6SdlZ5coYfZrKC5wzG2yf5/qdhQ5hqhbzIEsFPAx651uKnbNoXn8wGa2GYGKNRAKra5oh4MjizGp2JVBUnF9fpb2OpXpsQQ87tGLmQm3qeZaUcwC9yaycpb9z05ca8tCHAujbbHDwbIZSerU0c+K0L3WJNLdjsFu/W3xd94iE/JwIkYrXmX5KC2MNyHVKNhSvy2c46UjIfaya/pJsHNRONeTD/oUdtSB2MkoVrATU8Q3vQIOnyD9GPNbCIGuhjxNcCgheJGg0rDnCUCYKbbLd6oxCX6nBeiLYP8WgmcCvn6AhbZoolrkVEQEZc+ZpK79Qpb90cUb9wiiDBlqJwTL481ts7mmRZHYck4htDgQGO8naGsC29TOwfogKyzecWnBcEdORUbSzaavAw+iXlRgCd3qJf2xQczw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(136003)(376002)(39860400002)(396003)(451199021)(8676002)(8936002)(478600001)(54906003)(41300700001)(6506007)(5660300002)(316002)(6486002)(26005)(31686004)(66899021)(4326008)(66476007)(6916009)(66556008)(66946007)(53546011)(6512007)(2616005)(186003)(83380400001)(2906002)(30864003)(38100700002)(31696002)(36756003)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0RtMFhWL05EK2tUT1NxV0FvL01ydFNJZklMeEFpell3TWRQdUVpalhuOG1s?=
 =?utf-8?B?ZUI2d1d1Q1N6VWFia2p1YWV4VldaNXF5ZnBaZmFzL1YrL05oTDNpRVZxNUdw?=
 =?utf-8?B?enRPZFp1WUYzMSt2U01wVXpITThDQ05nb3Y1N2FWODBjUmRVREcrSSswVFpB?=
 =?utf-8?B?UVJIcytWSWJqeHZ5ZnM5N083dUFNK3Y2d3JLeEdSelBJSk5saHF1L0VsSGVJ?=
 =?utf-8?B?cVIzb3dlczRWS0YzSkV0SEdTRU9RYXdNNHpsVjdRQ1JwZFI2YzJXK2xXQzFJ?=
 =?utf-8?B?aW1HZW5KM0NDcXhuOGhPRkEySFJMeHkyNFd2MktGRmJFblU1eXJTVFlCRkhY?=
 =?utf-8?B?VitTaHZpZkxhZ1V5Z3Q1MkFGazRkQkR0T1k0VUduTnVQclVCWW1JamFJSG9u?=
 =?utf-8?B?NDFtakNpVUdJbkl0Vk9teFhaWWNnNlBqNVJWaUdOWFI5SldzczdZQVlhYzFY?=
 =?utf-8?B?WjRuUE1qbUtGOWZIN28xdVRYRVB0WUtFWkhHRzhsVGhRUGxDZW1xczNPVTlZ?=
 =?utf-8?B?K1UwOTFkeUZwR3FSdlZjdVA3NCtObGhmaFhwV3g3Zm9hK2d2SkhPSzFnd2la?=
 =?utf-8?B?QTJaZVVrRm1VNDdQc0pLZHRCdysyZER2NjVHT3E1NDNtUzg1NHNsODlCYng1?=
 =?utf-8?B?SmZzYlpSRzY5QlN5dzZXL0R4QU1OaDdiMnRpeFNnNjRiekduMHNtZjZPS1o3?=
 =?utf-8?B?VEdKSHFJaFJMSE45Smlsb1lMTFEvb3hPV3Zaek1wT0tEdlR4eHYwbEVQcTE2?=
 =?utf-8?B?aGQvamRqamd4YWtrR0lEUHFVc3p6ZFNkdFN3M2szUUZ5bHQrY1JNU2dVaGN5?=
 =?utf-8?B?Uko4azZPaURVNDl5UFB0bXRreUI4eVA3amk3UG01ck54TVJLR0dmZFZSeHdz?=
 =?utf-8?B?OTY4NGhKM1R3bkZlVEZ3bWxXaW9XY2xDVnNrNWVNZk5ROFEwSmNWWTk5eTZ2?=
 =?utf-8?B?M09GMUlCYm5ONGdCVVk3NHBST2wzakVLMWFsS1I0dHFmM28zUndOUUprK0Vh?=
 =?utf-8?B?MXBVUW9SMW8xTTUrd0VTMDJ5cnliYUZSUGFHUkY3S1dGZTFyKzdLaDRnYlZP?=
 =?utf-8?B?c2FPb2JpNVBCWXViZG1Cc3dVOGNMRjRBaG9mMUJkRU5RMDc4L3hTaGFFaHdq?=
 =?utf-8?B?SGZyRHBIU3RFbHhXanZkWERjRForbUFJdkpEeUdyclQ4ZGdLVm16SzFydERV?=
 =?utf-8?B?RFpSSnBvcUx4ZE10alg3ckV6QXBOcm04WDdiK1I0UGhDRGRMTGhiTlRQMUdL?=
 =?utf-8?B?U2h5R0R4dFFWb25nSzl2RVlRSmo0U0t5V0ttMVNGZTd3elhPUW13L2YraFVB?=
 =?utf-8?B?UjJleGlBSGpKVk8xU3hGZjV0a0dYM04yU0dNU1k3RW1ZekZLUlZxT1RXVTdQ?=
 =?utf-8?B?N1FJWVNnSEF2TUhhRHArbTJBRElkdzltNDNUdW5HbUdFRVYzZnRvdzJVd3FQ?=
 =?utf-8?B?RUNaaGlkOVlRK0owU0M3Z0pjdjM3WUxNMndRUXhidXlwU3Jqb3V4UE41UVlv?=
 =?utf-8?B?U0dWcEVCbkl0RjEwWmtwWUN3eUp5OFdlSWVYWjc1Y05ubjFmYVI5OVhEWk50?=
 =?utf-8?B?MVJOQzVUV2VDYnRzVVhQOVNaMkc2RXpCVTBIYmFCOVhiNk5idHZZR3ZOQWdh?=
 =?utf-8?B?c3k3TGlOV1pDVEhpQWxpYy9ZaGFabEJrR3cvb0JjaWU0SHd2Q2JRckJ0Q1ZK?=
 =?utf-8?B?aWRPMENpWjFpelFjaFQ5RjZ2M1NzSTBoU3pSb1lXb3hqajBGK0x6S1QxWWQ2?=
 =?utf-8?B?aGtHMFVpdHFzTm9ONlJhYTRhWlpqak5raWtIcFNTSVFaa0g5aFJhY09YYWJO?=
 =?utf-8?B?dWtGb2lGL1dhaGhycENDOFNXK3hWcnRodlNqZU5JcXVNcEtIbkxUOEp2UkMz?=
 =?utf-8?B?V2dUN3RlcTlTSVFKaFBmTSs0cDFEa1VIbjlHUVNMWm5nWmNSL3V6MG1uc1pM?=
 =?utf-8?B?Y1MzZWVxZ2lERXZ5cFF2TSt6QjRJdkRTYzNJUmsvM1pKUUJ3ZmVialpOMVhS?=
 =?utf-8?B?RzIvUVNLUnpNZzFYN0tuUzZGYW91SDlPYkNqcDYxWkdtMGR5czlpMGJpOEhP?=
 =?utf-8?B?dExsV0Y5MGpBL3BmbHZpa3ZFTDdWYTJjRHptSnBsSExaM2RWYk16Y3ZobytK?=
 =?utf-8?Q?zcZvK+AOSLNli2MaDTVfzaM4E?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec59a687-573b-4a7b-b38a-08db672a5116
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 07:39:25.2041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8EqeHnOfp0q9JuppFwwOBrVJTxJzUJdLKI2fBxbVNgEVR/h5mVw0s8oNAhp5W8epdCUbHUPullirDvwdT5hZjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9107

On 05.06.2023 15:26, Roberto Bagnara wrote:
> On 05/06/23 11:28, Jan Beulich wrote:
>> On 05.06.2023 07:28, Roberto Bagnara wrote:
>>> U1) Use of _Static_assert in C99 mode.
>>>
>>> U2) Empty initialization lists, both in C99 mode (ARM64 and X86_64)
>>>       and C18 mode (only X86_64).
>>>
>>> U3) Returning void expressions.
>>
>> As per above, tiny extensions like these are, I think, unlikely to be
>> mentioned anywhere explicitly (or more than in passing). For the last of
>> the three it may further be that it pre-dates when gcc started to
>> properly document extensions. Oh, actually - U3 is documented along with
>> -Wreturn-type.
> 
> Noted: thanks!
> 
>> Uses are generally intentional afaik, but eliminating cases of U2 and U3
>> would likely be possible with just slight overall impact.
> 
> Ok.  As this has an impact on MISRA compliance at some stage we will need
> an official position on the subject.
> 
>> As to U2, it's not clear why you distinguish C99 and C18 mode.
> 
> I specified that because for MISRA compliance we need to stick
> to one version of the language: while most translation units
> are compiled in C99 mode, some are compiled in C18 mode and some
> in C90 mode.  However, I agree this is OT for the current discussion.
> 
>> Throughout
>> this summary of yours it would likely have been helpful if an example was
>> provided for the behavior your describing, when the wording doesn't make
>> it crystal clear (e.g. no example needed for U1 and U3 above).
> 
> You are right: here are a few examples for U2:
> 
> xen/arch/arm/cpuerrata.c:92.12-92.35:
> empty initializer list (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7.8: "An empty initialization list." [STD.emptinit]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
> xen/include/xen/spinlock.h:31.21-31.23: expanded from macro `_LOCK_DEBUG'
> xen/include/xen/spinlock.h:143.57-143.67: expanded from macro `SPIN_LOCK_UNLOCKED'
> xen/include/xen/spinlock.h:144.43-144.60: expanded from macro `DEFINE_SPINLOCK'

I'm afraid this is a bad example, as it goes hand-in-hand with using
another extension. I don't think using a non-empty initialization list
is going to work with

union lock_debug { };

> xen/arch/arm/cpuerrata.c:678.5-678.6:
> empty initializer list (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7.8: "An empty initialization list." [STD.emptinit]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
> 
> xen/arch/arm/cpufeature.c:33.5-33.6:
> empty initializer list (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7.8: "An empty initialization list." [STD.emptinit]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'

Both of these are a common idiom we use: The "sentinel" of an array
of compound type initializer.

>>> U4) Static functions or variables used in inline functions with external
>>>       linkage.
>>
>> There's not a lot of "extern inline" that we've accumulated so far, I
>> think. The only ones I'm aware of are sort() and bsearch(), and there
>> the use is precisely for allowing the compiler to optimize away function
>> calls.
>>
>> The documentation of this functionality is that of the gnu_inline
>> function attribute, afaict. That would be 6.33.1 "Common Function
>> Attributes" in 13.1.0 doc.
> 
> No, it is not that one:
> 
> xen/common/spinlock.c:316.29-316.40:
> static function `observe_head(spinlock_tickets_t*)' is used in an inline function with external linkage (ill-formed for the C99 standard, ISO/IEC 9899:1999: "An ill-formed source detected by the parser." [STD.diag/ext_internal_in_extern_inline_quiet]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
> xen/common/spinlock.c:301.26-301.37:
> `observe_head(spinlock_tickets_t*)' declared here
> xen/include/xen/spinlock.h:180.1-180.4:
> use 'static' to give inline function `_spin_lock_cb(spinlock_t*, void(*)(void*), void*)' internal linkage

Oh, I see. I guess by introducing another wrapper we could deal with
that in sufficiently unintrusive a way.

>>> U5) Enumerator values outside the range of `int'.
> 
> Examples:
> 
> xen/arch/x86/include/asm/guest/hyperv-tlfs.h:477.9-477.26: Loc #1 [culprit: ISO C restricts enumerator values to range of 'int' (2147483648 is too large) (ill-formed for the C99 standard, ISO/IEC 9899:1999: "An ill-formed source detected by the parser." [STD.diag/ext_enum_value_not_int]). Tool used is `/usr/bin/x86_64-linux-gnu-gcc-12']
> xen/arch/x86/include/asm/guest/hyperv-tlfs.h:477.43-477.52: Loc #2 [evidence: ISO C restricts enumerator values to range of 'int' (2147483648 is too large)]
> 
> xen/arch/x86/include/asm/guest/hyperv-tlfs.h:478.9-478.27: Loc #1 [culprit: ISO C restricts enumerator values to range of 'int' (2147483649 is too large) (ill-formed for the C99 standard, ISO/IEC 9899:1999: "An ill-formed source detected by the parser." [STD.diag/ext_enum_value_not_int]). Tool used is `/usr/bin/x86_64-linux-gnu-gcc-12']
> xen/arch/x86/include/asm/guest/hyperv-tlfs.h:478.43-478.52: Loc #2 [evidence: ISO C restricts enumerator values to range of 'int' (2147483649 is too large)]

It's not entirely clear to me in how far hyperv-tlfs.h is a header
fully of our own. It may be possible to switch to #define instead if
we don't "follow" someone else's header.

> xen/arch/x86/include/asm/hvm/svm/vmcb.h:143.5-143.27: Loc #1 [culprit: ISO C restricts enumerator values to range of 'int' (2147483648 is too large) (ill-formed for the C99 standard, ISO/IEC 9899:1999: "An ill-formed source detected by the parser." [STD.diag/ext_enum_value_not_int]). Tool used is `/usr/bin/x86_64-linux-gnu-gcc-12']
> xen/arch/x86/include/asm/hvm/svm/vmcb.h:143.31-143.38: Loc #2 [evidence: ISO C restricts enumerator values to range of 'int' (2147483648 is too large)]

Here we have more leeway, and imo the offending enumerations are an
abuse of "enum" in the first place.

>>> U6) Empty declarations.
> 
> Examples:
> 
> xen/arch/arm/arm64/lib/find_next_bit.c:57.29:
> empty declaration (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7: "An empty declaration." [STD.emptdecl]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
> 
> xen/arch/arm/arm64/lib/find_next_bit.c:103.34:
> empty declaration (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7: "An empty declaration." [STD.emptdecl]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'

Looks like these could be taken care of by finally purging our
EXPORT_SYMBOL() stub.

> xen/arch/arm/include/asm/vreg.h:143.26:
> empty declaration (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7: "An empty declaration." [STD.emptdecl]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
> 
> xen/arch/arm/include/asm/vreg.h:144.26:
> empty declaration (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7: "An empty declaration." [STD.emptdecl]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'

I'm having trouble spotting anything suspicious there.

> xen/arch/arm/include/asm/arm64/flushtlb.h:70.51:
> empty declaration (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7: "An empty declaration." [STD.emptdecl]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'

Same here. I the tool having an issue with the instantiation of
(inline) functions by way of a macro?

>>> U7) Empty enum definitions.
> 
> Example:
> 
> xen/arch/arm/include/asm/vgic.h:275.6-275.17:
> enum declaration `gic_sgi_mode' is incomplete (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7.2.2: "An incomplete enum declaration." [STD.emptenum]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
> 
>> ... here I wonder whether instead you mean forward declaration of enums
>> (i.e. what the standard allows for structures and unions only).
> 
> It is reported as an enum forward declaration if the enum is later
> properly declared.  My understanding is that this is not the case
> for the example above.

asm/gic.h provides the full definition. There looks to be exactly one case
(smp.c) where asm/vgic.h is included but asm/gic.h isn't. As there may be
peculiarities to this, Arm maintainers would need to take a look to decide
whether also including the other header that is an option.

>>> U8) Conversion between incompatible pointer types.
>>
>> Do we have any uses that aren't, by using casts, documenting that the
>> conversions are deliberate? Otherwise I would expect the compiler to
>> warn, and hence the build to fail due to -Werror. Then again I'm sure
>> we have ample uses of casts left which are actually bogus.
> 
> Examples:
> 
> xen/common/kernel.c:552.18-552.47:
> implicit cast converts from `const __typeof__(*(&params))*' (that is `const struct xen_platform_parameters*') to `void*' (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.5.16.1: "Implicit conversion from a pointer to an incompatible pointer." [STD.pteincmp]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
> xen/include/xen/guest_access.h:65.23-65.24: expanded from macro `copy_to_guest_offset'
> xen/include/xen/guest_access.h:104.5-104.41: expanded from macro `copy_to_guest'
> 
> xen/common/kernel.c:566.14-566.59:
> implicit cast converts from `const __typeof__(*(chgset))*' (that is `const char*') to `void*' (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.5.16.1: "Implicit conversion from a pointer to an incompatible pointer." [STD.pteincmp]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
> xen/include/xen/guest_access.h:65.23-65.24: expanded from macro `copy_to_guest_offset'
> xen/include/xen/guest_access.h:104.5-104.41: expanded from macro `copy_to_guest'
> 
> xen/common/kernel.c:613.14-613.41:
> implicit cast converts from `const __typeof__(*(&fi))*' (that is `const struct xen_feature_info*') to `void*' (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.5.16.1: "Implicit conversion from a pointer to an incompatible pointer." [STD.pteincmp]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
> xen/include/xen/guest_access.h:123.23-123.24: expanded from macro `__copy_to_guest_offset'
> xen/include/xen/guest_access.h:152.5-152.43: expanded from macro `__copy_to_guest'
> 
> xen/common/kernel.c:645.14-645.71:
> implicit cast converts from `const __typeof__(*(deny ? xen_deny() : saved_cmdline))*' (that is `const char*') to `void*' (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.5.16.1: "Implicit conversion from a pointer to an incompatible pointer." [STD.pteincmp]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
> xen/include/xen/guest_access.h:65.23-65.24: expanded from macro `copy_to_guest_offset'
> xen/include/xen/guest_access.h:104.5-104.41: expanded from macro `copy_to_guest'
> 
> xen/common/memory.c:1745.20-1745.53:
> implicit cast converts from `const __typeof__(*(&topology))*' (that is `const struct xen_vnuma_topology_info*') to `void*' (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.5.16.1: "Implicit conversion from a pointer to an incompatible pointer." [STD.pteincmp]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
> xen/include/xen/guest_access.h:123.23-123.24: expanded from macro `__copy_to_guest_offset'
> xen/include/xen/guest_access.h:152.5-152.43: expanded from macro `__copy_to_guest'
> 
> xen/common/memory.c:1808.14-1808.47:
> implicit cast converts from `const __typeof__(*(&topology))*' (that is `const struct xen_vnuma_topology_info*') to `void*' (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.5.16.1: "Implicit conversion from a pointer to an incompatible pointer." [STD.pteincmp]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
> xen/include/xen/guest_access.h:123.23-123.24: expanded from macro `__copy_to_guest_offset'
> xen/include/xen/guest_access.h:152.5-152.43: expanded from macro `__copy_to_guest'
> 
> xen/common/memory.c:1841.14-1841.47:
> implicit cast converts from `const __typeof__(*(&grdm.map))*' (that is `const struct xen_reserved_device_memory_map*') to `void*' (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.5.16.1: "Implicit conversion from a pointer to an incompatible pointer." [STD.pteincmp]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
> xen/include/xen/guest_access.h:123.23-123.24: expanded from macro `__copy_to_guest_offset'
> xen/include/xen/guest_access.h:152.5-152.43: expanded from macro `__copy_to_guest'

These are all a common pattern. Line 65 in xen/guest_access.h is

    (void)((hnd).p == _s);                              \

i.e. not an assignment in the first place. Nearby assignments don't
involve _s, yet that's pretty clearly what is being referred to by
const __typeof__(*(...))*. In pointer comparisons, differring
qualifiers are okay afaik (6.5.9), so I wonder whether the tool is
becoming confused here.

I don't know the acronyms used, but isn't STD.pteincmp referring to
comparisons rather that assignments?

> xen/common/efi/boot.c:335.16-335.56:
> implicit cast converts from `const CHAR16*' (that is `const unsigned short*') to `void*' (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.5.16.1: "Implicit conversion from a pointer to an incompatible pointer." [STD.pteincmp]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'

Same here - comparison of the result of wmemchr() (const CHAR16*)
with an expression derived from "data" (void*).

> xen/common/libfdt/fdt_overlay.c:733.69-733.87:
> implicit cast converts from `const char*' to `void*' (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.5.16.1: "Implicit conversion from a pointer to an incompatible pointer." [STD.pteincmp]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'

Same here again, I think.

>>> U9) Conversion between function pointers and object pointers.
> 
> Example:
> xen/arch/x86/apic.c:1159.16-1159.55: Loc #1 [culprit: c_style cast converts from `const void*' to `unsigned(*)(void)' (ill-formed for the C99 standard, ISO/IEC 9899:1999 Annex J.5.7: "A pointer to a function is converted to a pointer to an object or a pointer to an object is converted to a pointer to a function (6.5.4, 6.3.2.3)." [STD.funojptr]). Tool used is `/usr/bin/x86_64-linux-gnu-gcc-12']
> 
>> Uses I'm readily aware of are deliberate. Plus isn't this shorthand
>> for going through uintptr_t intermediately only anyway?
> 
> I don't understand the last sentence.

6.3.2.3 allows conversions between integer and pointer types. Hence
isn't intermediately going through uintptr_t merely a more verbose
way of casting between function and object pointers directly:

    ptr = (void *)(uintptr_t)func;

vs

    ptr = (void *)func;

?

>>> Here is a list of extensions that are documented in the GCC manual:
>>
>> I suppose that this list wasn't meant to be complete? The most
>> prominent example is probably asm().
> 
> As far as I can tell the list was almost complete (I realize now
> that the use of the keyword __signed__ was omitted because
> investigation was not completed).  But I am probably misunderstanding
> you.

Well, your list didn't include asm(), which is an extension we can't
do without. We also use __attribute__(()) extensively. And while
hunting for extensions which aren't documented in their own dedicated
sections, I think I had come across more. I didn't write these down,
and if at all possible I'd prefer to avoid repeating the exercise.

Jan

