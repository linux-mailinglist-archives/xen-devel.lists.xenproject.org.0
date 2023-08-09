Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F71775274
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 08:02:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580662.909032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTcGT-0000KF-Pm; Wed, 09 Aug 2023 06:01:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580662.909032; Wed, 09 Aug 2023 06:01:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTcGT-0000GH-MZ; Wed, 09 Aug 2023 06:01:49 +0000
Received: by outflank-mailman (input) for mailman id 580662;
 Wed, 09 Aug 2023 06:01:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhcc=D2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTcGS-0000GB-Jb
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 06:01:48 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2061c.outbound.protection.outlook.com
 [2a01:111:f400:fe12::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39370935-367a-11ee-b280-6b7b168915f2;
 Wed, 09 Aug 2023 08:01:47 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB8044.eurprd04.prod.outlook.com (2603:10a6:10:1e5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Wed, 9 Aug
 2023 06:01:44 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Wed, 9 Aug 2023
 06:01:44 +0000
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
X-Inumbo-ID: 39370935-367a-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gh9As4dI3RDB6TeFF7fv0i5NlFD1VOUUwhixcy59Ie7EOFqVwbD6eWR5zUEn9V3cOG9HOOc2Vu3Or+0HnKDvx0s6CxjmoBE7d8r70wxUhwmAkoQGDLu4k1ouQ7tHwefSdbypi6QDAJocdck+BHu7vahd/Jc4YEz50OcOZPnGoDDt1+jTAmgNePZm0NA5ROpUQxUbXnIu63CV2FUCPlFOgm51K2RJHveI6lcnbfXlWxfaCPArojpMwulnBvV86aKOlApU3D0c++HtiIxUBtbmvcRmDOcFEhIK3AzawIkeFn6fcAwzogFW+HfNi4gJ2E5HSf0QEpTn9D+eXxeZScU7Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HptNpV9Xu5w/FMHSsalOGCr10g0/JLWelsXEpWUVTU4=;
 b=H7kMThJhWZfWGqllFuPluFB1fwYN13GKZi/E/U+8PdyzOYE6KzkowAQR9Cvq3RFsCjiwlmTmSLUPjxOTB6RtGldw6HtpZHkFdl5iwNTVm2EzpDkRIZHRGG1t71zlqTOeQJmzrq3Iml5KRbIvmrHkjocbMOWKftoHKTUse91x/+wuET14XRmg4OMRY8qLDPZockaspcSrkdkUTi4EGEdgTBtB+zxGSoU+eU/LMW2auV7cu751U7ymoHQCabdU7T96c8NO0vG55584Fbel9nFeH55yxK5pN6IDjy2uldHmJMpp3P+AQGzLuc08j83gKBdeRvcQXALI+aIwHBuNXk4TIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HptNpV9Xu5w/FMHSsalOGCr10g0/JLWelsXEpWUVTU4=;
 b=uwG4RFRE+7jGu9IyB84s2XKI31gtS1YA6Z/GaTmzEGCsgbbsjWV9pjW7rp8xL+mJ5FflWanmV9udHausz36sMgqMmuFPpAbLJjxUKUJDltlLeFpm0RdUg3/8YiK47qGe6SAB5gWw7WnRF3aqB7joQh/6czRp+oki6ISJU1ss+QNZBcxBqSWRrVXzkbDrfeQe8nQXVzFNmCcX4B8ODYQRXuFteIk8vbagJS/wB3lGOGvm+Bt1FCGEsJ6InGygmCQmxIgdp5YHMnEgnmcDlhiSlImxYJyV8HOBv8nDOPYhE5PhWaXGpOa6RdhDPN9xOW+A6//yiy8jl0MGh3MDBdcFRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <109c8ea3-a260-9d7f-8408-e3ee217e1696@suse.com>
Date: Wed, 9 Aug 2023 08:01:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 10/11] xen/sched: add ASSERT_UNREACHABLE() to address
 MISRA C:2012 Rule 2.1
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, xen-devel@lists.xenproject.org,
 Julien Grall <julien@xen.org>
References: <cover.1690985045.git.nicola.vetrini@bugseng.com>
 <3f1385f2ddb151a53ca092ea1caeac5d12fd80f5.1690985045.git.nicola.vetrini@bugseng.com>
 <db2ac35e-b371-4537-9d56-8703e3648abe@xen.org>
 <5135e7ac-1025-3a45-7cf6-d049a15b8df5@suse.com>
 <be588477-cafd-4875-aeef-9b17206a5cc5@xen.org>
 <cde2ae86db8ba9a86ce5afdb9f47a4e4@bugseng.com>
 <6aac7add-544b-4c8a-b397-2a6b6c6b766c@xen.org>
 <alpine.DEB.2.22.394.2308081401400.2127516@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2308081401400.2127516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0169.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB8044:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ca2c3f4-f0c9-4f15-2642-08db989e1bac
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fNSopjrva+5jhqFX8ITYlU/rI3fem5JcfZXSljlIdvfhDUemTs79DL/I+cwm/Xlv9LBOnE9jJKrrkbw6nW8oWoYEiuSGylD3Ya0/346bTjYRRUfe+8HQHchkOzZLVwdX83XdszJ57Gjtnshnh6+OfuuKt3noW3cR13F55cYg8aOaxrMfTxfAViXUKuM9vvpc6Gguw2wt5h6T52FfmruCZ7qi+gKBtXEWAccIJJZ0HpdUzxUzMKmzFILBUR+6R35yrU4rmm5yFyL6wo8AY+xnUoWdQSzhJKXqnK+zYnOetZClu+TfOgIXI9pVQObDFUtLpJDe7jBF8c9OgKwROq63Na7Dg0moSwdAOONj28rxZySMz873T9+lcMXzvcQ+/wRnOc9CcbHXm5ezsK7DViyuzIAJccGDBDLinZD80T9Ea7zzC6aqHQ+/QmiqwmqLaeidGCGiH8LS226gxDyKs00gKGz5wKdefzdjPHssxYr5TkwxJZHNrr2SkGfr3PeDNPNmGT4QgQR6cD40u7lY4/YyA8CCe8Yq388cuGg3n3w9fQJjpvzcHoysfi25ck1YkjLwjnqB7me3wkCeYcpo8U1p2iNhTLCrtKzt2ziDcPEHoV+tn+bDejnzBwxCEoga0tRPnoY8ocqsL8X3zrG+loiiFw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(39860400002)(346002)(366004)(396003)(186006)(1800799006)(451199021)(31686004)(478600001)(2616005)(6512007)(26005)(53546011)(6506007)(66946007)(66556008)(66476007)(41300700001)(8676002)(8936002)(316002)(31696002)(2906002)(6916009)(4326008)(6486002)(6666004)(36756003)(54906003)(38100700002)(86362001)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2tYTU82QldMS1FreEZiYmVzT1hsalNUTTFCTGMxbmZodldKY1F5WFFTVUd0?=
 =?utf-8?B?M2MyN21LTVNEVzNSTG9NazFqOFFoaG1EWHZ1bm9SVE1GNDZrekhjUjRYSlFj?=
 =?utf-8?B?bnVqbXZEWVVyUE5LVWdVZUsyY1VUWlBZaGxPZXV3THhOM0FKYzY2ZFlzSzRY?=
 =?utf-8?B?YzBSZkdTclR4L1pNdVNOczBhWUMwTW9jWXJtUlBCeU13cXU5bDFxNmVFSE5L?=
 =?utf-8?B?UWVlV1hHWVkzemErcnZXWEVaZit3Y3ZENzBJOUt5bEtMZXJlUEFoYm1vZ0ZM?=
 =?utf-8?B?U0dZTUNuQytSb3BlUTVqdm5xLzZ3RXVGeFMxTjVaTkxER3ZyMUtDUkF5VTM2?=
 =?utf-8?B?RWRFSVJ1bm1VSmxJQ0kyR3Q3NnNqMzVHWmlsVW5ScUNmbFJXYnhqSEx0dm5X?=
 =?utf-8?B?MG9LN3EyaXMreExTVEplbVR4bVhnT2RpVThSaWtmNFhCampYcXRTbE9pMVVu?=
 =?utf-8?B?amNoWHN5MU1IQ1FVbDBsUGZTeCtTTnNBeEdndTZPSFRwYUZTWW1FTzFGcm9L?=
 =?utf-8?B?bUFLaCttNTdVbG56aGZ1a0gzNlE2WStOelR6dSt1Ylo5NWFmQUFHcnI3L1Vn?=
 =?utf-8?B?WVVXa0prYnJqME5XWWZ6bFkyYzVEM21POXZJaGdrZGc4TXRMckdFYk9QZmFS?=
 =?utf-8?B?eERtK3lBc2FVTGFQKzY1VEtoNzhFVVNjNlpkMjNBWUZkSkxpVDQ2QlEyRlVh?=
 =?utf-8?B?TzA2QVgyenVPWk9KY1lIY3ROelZhd09wam1IbTZVUWR5ZDhtdngxZkEvckJD?=
 =?utf-8?B?K2w0N3p3L3E0L08zb25rZHR4eE5lc0dPUGVCT2Zzc1RCc2xydDFRaWJ6cXZU?=
 =?utf-8?B?aHV5S2FqTHZ2ckd4NnR1Njc5OE9xM2VVRXpJRzRvakRud3d5dzJ4Y0RVWFhK?=
 =?utf-8?B?ZFZiUzdnbUJTbTh6SU9NN20yaGVmQjRQckowTi80RUVRSFI2NVd0Rm1NZEN4?=
 =?utf-8?B?eG4zTFZaVktQZFpPSnlGSktYdEhQZld3WkxmeGhDcFUwbVNwZDNQSHQ4NkJN?=
 =?utf-8?B?ampEeEtFc041NDVFK0M0SzF3bnFPeVhsc2xNMnlMR3ZNL0I0eU1MWENpdi9w?=
 =?utf-8?B?T2wwTmN6UEhBV25uODd1cm42Q2xtZzR4V2tBRjFkTGk5TUpjak9hWG9jOGFy?=
 =?utf-8?B?L1Z4YWdGcUxIR0hBQ1BRM3lReWVrSVZKaE0xaDdJTm9rclFxenFkRlNQT0l1?=
 =?utf-8?B?TTFqZ1hFQzNQbkF0UnI4bVJDTkR5VXNzaTBKa09qY3RHOHYybkJ5UnduY0Vn?=
 =?utf-8?B?QlNTZ2dtZDZZTXpVZGtGOENaV2htY0N1Y3RjbFozSUQ2QWxaU2pmL1lYR0hQ?=
 =?utf-8?B?emJuR2xOVFZhczFzaUNlNFo1aGtiM1VXcDRGQlBuN3FoVXhMNEdkTkxGSk1G?=
 =?utf-8?B?QUFvRUI3NnE4MC9xQ24yVkxyZTd0ZVZvRHgwRDFNTTlmNHZ3UUV2UHFRcE1y?=
 =?utf-8?B?MTJJeVRjaHE1S1lRNUpHbG8ydHdMTGVBYjd6S3hDZ2s3dWY5WVQxR1J3c29h?=
 =?utf-8?B?Y1FNSTBvbi9yR2h1Qm9pTHRXZExxazAxSXE0d2dTZjFmSzJITU1KNEJtYW1M?=
 =?utf-8?B?aklwenVES3VjOVZLUXBJRWFWQnFsZlNCV2taU3RMc0M1VVpMR1l2T1B2MUNK?=
 =?utf-8?B?aUdNcThPVk9vaTVxV3l2V0Fob2RPOWloS09RK3RRemU3ZEhVSHo5QVJLVFVX?=
 =?utf-8?B?VVVJODhNRTMvbW1iL2ZBK2g4d0pZUmtqR3dWczJRVUdyU0Eva0tkU0NPNFBU?=
 =?utf-8?B?aUJRMnp5ZzljK0VtdExHWWRSWno5ak15RWxVZTMxSzY2SUhuRHp4dEdDeTBN?=
 =?utf-8?B?eDZNd0g1dFNXci9zOVo2SFFaTGErSThCM1NoeHIrVnJZNVBXak8yakh1MnBr?=
 =?utf-8?B?Y2loWWJ4VGxjTjVlYmQ5T3VJc0hWdmRla1ovM0VBcW92QUJjczR5MzUyaGRa?=
 =?utf-8?B?Qm9QZU9YT0JJaEw5TExLUDB6R0dKeldUWnAxYml1NzExMWNYUTZ0WkdlUkUr?=
 =?utf-8?B?SURLVk1GRXpXbWFOdDQvTlQ2N3U0QUN4NHNoVVdYcHpCbzFJdjFqZDBVdjI3?=
 =?utf-8?B?MitWbW1GY1FxVEZpTStUZXNpdGpyNHdVdzRHRW1pL0d5L1NQMkhFYmdLRmlu?=
 =?utf-8?Q?pC/z+BaDjlK7wmBUTF6V2ubU1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ca2c3f4-f0c9-4f15-2642-08db989e1bac
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 06:01:44.4524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jgRIcEGD9xxa8vUzTjr1rBGj5yF0A+sShZnBlkVu94ALknAm8T9uJlYE2KKC7lS4PtUzBU9z+mSoOxZe/E6GPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8044

On 08.08.2023 23:14, Stefano Stabellini wrote:
> On Tue, 8 Aug 2023, Julien Grall wrote:
>> On 08/08/2023 16:53, Nicola Vetrini wrote:
>>>>> ... "return" alone already tells the compiler that "break" is
>>>>> unreachable. You don't need unreachable() for that. As said before,
>>>>> "break" like this simply want purging (and Misra is wrong to demand
>>>>> "break" everywhere - it should instead demand no [unannotated]
>>>>> fall-through, which can also be achieved by return, continue, and
>>>>> goto).
>>>>
>>>> My suggestion was in the context of this series where we add
>>>> ASSERT_UNREACHABLE() before break. From my understanding, we don't
>>>> have a lot of leeway here because, from what Nicola wrote, rule 16.3
>>>> is mandatory.
>>>>
>>>> So I think using unreachable is better if we every decide to use break
>>>> after return.
>>>>
>>>> Cheers,
>>>
>>> 16.3 is not Mandatory, just Required.
>>
>> Ah I misread what you wrote. In that case...
>>
>>> I was just reluctant to knowingly add one more violation
>>> while fixing another before submitting the patch. If indeed 16.3 won't
>>> likely be adopted by Xen,
>>> then that break should indeed go away.
>>>
>>> However, the main thing that's holding me back from doing a slimmed-down v2
>>> here is that
>>> evidently there's no consensus even on the ASSERT_UNREACHABLE() patches.
>>
>> ... I agree with the following statement from Jan:
>>
>> "it should instead demand no [unannotated] fall-through, which can also be
>> achieved by return, continue, and goto"
> 
> I also think it is a better idea to have no unannotated fall-through in
> switch statements (unless we have a "case" with nothing underneath, so
> two cases next to each other). In other words the following are all OK
> in my view:
> 
>   case A:
>     do();
>     break;
>   case B:
>     do();
>     return true;
>   case Ca:
>   case Cb:
>     goto fail;
>   case D:
>     i++;
>     continue;
>   case E:
>     do();
>     /* fall-through */
>   case F:
>     do();
>     break;
> 
> While the following is not OK:
> 
>   case A:
>     do();
>   case B:
>     do();
> 
> This should be what we already do in Xen, although it is not documented
> properly. Jan, Julien do you agree?

Yes.

> If so, could Eclair be configured to check for this pattern (or
> similar)?
> 
> We must have one of the following:
> - break, continue, return, goto
> - /* fall-through */

- fallthrough;

(the pseudo keyword that we have; see compiler.h for actually having the
documentation you're looking for, albeit missing "continue", and of
course not really expected to live [just] there)

Jan

> - empty case body (case Ca/Cb)


