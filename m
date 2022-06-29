Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E65BE5605D6
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 18:30:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357967.586879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6aa9-0006bG-9J; Wed, 29 Jun 2022 16:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357967.586879; Wed, 29 Jun 2022 16:30:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6aa9-0006Yt-5A; Wed, 29 Jun 2022 16:30:25 +0000
Received: by outflank-mailman (input) for mailman id 357967;
 Wed, 29 Jun 2022 16:30:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NFaf=XE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o6aa6-0006Yn-V0
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 16:30:22 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2087.outbound.protection.outlook.com [40.107.22.87])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c43f2dc5-f7c8-11ec-b725-ed86ccbb4733;
 Wed, 29 Jun 2022 18:30:20 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7541.eurprd04.prod.outlook.com (2603:10a6:20b:29a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Wed, 29 Jun
 2022 16:30:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.014; Wed, 29 Jun 2022
 16:30:19 +0000
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
X-Inumbo-ID: c43f2dc5-f7c8-11ec-b725-ed86ccbb4733
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I/Ae/15aJJN94OuD4/xAjGlvIliEZmBNy7O+OJPqtUvUMJLYFnmL448MaNtC+dBgIS7d7UNterAQ79xaZN55Y25EReCLGPX2Gwl5uFuvdxbbtrzrdmow6/T6CxbZ56vrDpnSqscPQ5VZy1K9BhBIn14Dm8cA+aA57Cl6JQOMyztTCfHvn7eC0NVBs2j3/L4cHPnc79h7AGVxOnNBQXM5bARgidR8AuDt4/W9ZMFmYaSm9p2ss5m1AaNXjH0suoXHC45dg7IQ7ZcO85yz0Lxkq9EWozPiZTrhCwQXVZ4GYe4AIp7sWSB3KUra8U4AJOCxgxnNBrSnPlm+oBus8HM2Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/T/y0ZAVUA0Wee6D01J2LYmfbojAe28mmuP56LBhq3M=;
 b=MwhL+u69R8CHYcMbpYbCPf1H0MhNksKpESPu/Ylyksd3lGBn/HMfbZtxu3w+ibHE8y9GWLW/PISVgG5VQtOT0FTPs+N+6IINc9O2QBUj9vbKGqFaAiOnziSdMFWbhiuKUOVV0Pno5xrcP/LfNQBWwcdSk/JGKRbgwlNPNyUlQwkQa1/qJGQh6jbnGtHcAr3PH/ueUjs0gievP+4hVruC+5Si20SeZf8/8tPxTIO0hGMcIDisrgZbdO8EKofQc6V37NLJpD16Iboa0vvWBy42tdoCXQGcZ2AQeunpuxse3nqryuVyHHWTCQ+NtUuXmeBModZkytRn8msIpaeaIm0Lww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/T/y0ZAVUA0Wee6D01J2LYmfbojAe28mmuP56LBhq3M=;
 b=0wzXKaiPV1Ab1fD8Kv1Txuxys/mkQrIGBPXH7D+Wr9TvHbdDQD8m1WFjhkFPOXDziF0X8tDqib6aBXNGUkURxCHnYYsrj0TCK+snujUOkJBQ2tkJMov+UtKyCpx9x/MUflpg1kChceimbNVntE02soC21q5N2fL7sDuE1LYoXCeThkX04M8wQ+jfOtrk+q+UqowcAzvMaRCzzJ3RFFqPzd/1yhFGPte3E6zXxb0YzKqve/k3eleybsLvDpxKy1hhIWbA/w2FOeNAfTzi+ajddrIEW8F8do01U77BMByizGshXhyJWqk6mMmtOi5a+N5/qld2dEL3HikG0AWr6LMwmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <59fe1b28-b173-e497-5b8a-5e0bb6d946b6@suse.com>
Date: Wed, 29 Jun 2022 18:30:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/2] console/serial: bump buffer from 16K to 32K
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20220623090852.29622-1-roger.pau@citrix.com>
 <20220623090852.29622-3-roger.pau@citrix.com>
 <e45d8dcf-fd0a-6875-a887-5c0dafcc4543@suse.com>
 <YrxuVPMb990xYKi9@Air-de-Roger>
 <b4740e9b-3586-04c3-454a-5d60bae2cc55@suse.com>
 <Yrx7hDevqMgvtMRR@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yrx7hDevqMgvtMRR@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4adb5191-b865-4475-fd70-08da59eca84d
X-MS-TrafficTypeDiagnostic: AS8PR04MB7541:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UEN9BZei8zMmiau+9U1mthGOUbIatiXI0gLF3JSmuva6287eqobFJV2u3UeiiK35dwz3KABaDGKOm8UM3hHmjPWt7ZLYwMcVa2GN/n/DIq5psFmrWbJxVPju1NPBwBcfuJb1+AXHp9q56tX6wWj1doTqdzD+H6acHaQVPtO5v5UuFvHwZPIQPCxJKDZwAt+xLDAgUOVaRXGNGjfirkr25NCRdxENG0f+qIUCgM4GIwDUopjeE9zcWdQC2rqgYqaAKacUqAW/cmmXyg7HdUqvhyGjMx7E1/IY+c577GXTcYTtRmwAqoG28L7HDHZ+SS+q1tkSkbXmp3Z+YIKIWVa9LOlk6xDyfGaVam2ZwixYFIz/b3rzJOqCgb5sKSQgC+3ZlmtgIJtpMm7941zCN+Y2zKVirKpZ6axuJNpp1+sgroY/ETue2iKbmnkZArLU0ixksH5SIN8wfLNlBGQcm8/f3YIsi7oxvBay77yF99Is7tqjdzenX5+Evzt1Mn64K7rDZ3qCU0hLt8qpR28GZPaW20qS6EfPvk+rbSWlgFcmQuHPleFRKS7p27pL5cVXYeZZVNb7UKkRtZ0DQt3EkzohNvr3yKtSWynGYgC+r811YWCUuqZL4DKhNrQEQQiV/c5NLlVzcQ+SAf7q/hLQKs+bBtrdxA9J2WgDga7cbFyOkPML2JFXD95YDSA2C7o5YAvvVWjrYRnNoyV6932UsSX4MOeg3qpp7Vn3JvuzygMoAgaUprOwuQtpK8r0Lids1UPOZcDOWUEFKTZLDUahUAwaVI5Dm1DgyvdZ6WVRAuwQseG9aKDuEcoq/cWdoUaTyLr/TB5pq5yBKnVOuAoQuROR9A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39860400002)(366004)(346002)(376002)(396003)(66946007)(54906003)(66476007)(6916009)(316002)(6506007)(41300700001)(6486002)(2906002)(36756003)(53546011)(31686004)(2616005)(8676002)(6512007)(26005)(66556008)(186003)(4326008)(86362001)(31696002)(83380400001)(38100700002)(478600001)(5660300002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGg0c3lIWGc5NG1wY3J6WTdjMFJLeDNOT2JsWTBRY3kyUjNVZTZ5NWVXaVBW?=
 =?utf-8?B?TnFVL0hnWXRQQ21OMHp2UmxISGFkRDFmZ1poSHMwZDlSOVJVK0dMNTRObFFS?=
 =?utf-8?B?bmNEd0hrbXJuL1F5VllkTVpjTFVDb0wvOEN2ZWltWWdxcEJJbkNLdlQvYXhq?=
 =?utf-8?B?MUM5TG5oVjl6NllGQ0JjMTUyUml5enRUKzlUZGlic3NtdnpxR0RTcFY0bElE?=
 =?utf-8?B?dTg2MGQ4SDhnMmlYRnZjazZzMEhsNWdTQTNGTjZianlQYjR5Z2VReVl6SjFR?=
 =?utf-8?B?L0JpTVVDd1lZYk9KWi9kSVhFdzlQcmpsVXV2Sk5Qbm5iR1EzVzJab0dTOWZw?=
 =?utf-8?B?dURLNjIxaFY5K05MWG1VVjJMV2hjU01KZm5KdzVzTlZEMFBwcVVjZlkvZTNC?=
 =?utf-8?B?cW54a21rVENIYlI4NFFmUlRZcklVMis1VEtOeDdoaDB3ZGlWdC9kc2N0Q3lo?=
 =?utf-8?B?bGlERlNpb045R1loM25IcC9UR3czT0lISDQyTXZYbnhFQncyL1lQT3NMMCtw?=
 =?utf-8?B?UHR3YXZMb01VaDQ4Rno3OFJDM0Y1eXFQOCtFcWhnalZXN3pEMysxeTVVL0xU?=
 =?utf-8?B?Vlh2R3BXS3NiMmFUMmxFT29VVC9vTmcwS2QzZndJdWNSQkR2UG9xdHJtRTFW?=
 =?utf-8?B?cU5XS3hKNXVZeFR3MkRIcDh3dE9PVzN1OUhHSDFOMnBDc0pGZ2YzM0tFaWFr?=
 =?utf-8?B?dlhNT1JpOTN0TC9XRjRseHY3c1dVZEJVbkdNU2F5b2xtK091SDlUVkRiUzZx?=
 =?utf-8?B?Slk4VzA5RWEwaHg3N2tZNS94ODVQK2tsNzJhKzZQUEhoam0rb0dCSkZXYnEw?=
 =?utf-8?B?NXFZUzJ1Ym4yZkZWL3ZhYk41ZUxVckt5L1hDZ2xMV2RMZStxTTZEUGtUeDdL?=
 =?utf-8?B?cnM2TnYwNVBHeTA5UVUwc2loNFRIMUx0bXF1Unk4TzNIVTVYbk1hV1VEY2ox?=
 =?utf-8?B?OEdRL3NncEh2eUt6SnFGZjE3RWxJdHRTRHBMV2dsN05GcjBVVG9NcVZSb3Ev?=
 =?utf-8?B?UGkxbmlXYTZaNHN1U1BqRndYL1NDM3NVdGFJRmtOYTFmL0h4SmFSci9LWWE3?=
 =?utf-8?B?bFJiR0ZOZTcyRkZlNjgwSFBOYTM4RjkwTC9rNWZDT2tpSTZpMGNwT2RzRXE5?=
 =?utf-8?B?endkTzBYNmVpSWRZN01qUHhsNVI0SVM5UGNRMFc3eXFDUlNtZXptV2pzcXlN?=
 =?utf-8?B?TUFJUmhjcGZEcmlUOGY3aVZ4em1kdVZsZzkzOWt1VWp3MlN0cFl5ZVoxVFdh?=
 =?utf-8?B?azFKcFFKZWsrc2ZFc3Fjb2hyK0N4ZGxqWTBsSTFXWVgrbWVvVnFleEZicTJp?=
 =?utf-8?B?UVRWaDc2RGg3MlZYYlRjYThlQno1RXlDenM1K3NiWWhTYjdmcDNkNnNFT2gx?=
 =?utf-8?B?S01GQ0pWL2hzQ1RRc0xnaC8yVmc3M0Z0cGpEc1J3MlBROXdoMXRXRXc0OUtj?=
 =?utf-8?B?bHZZU2V4MWUrS2xTMGVJR0dneVRBL3RYK25qWmRvTDFqbWdjVEk1UkphR2dp?=
 =?utf-8?B?UHF3UHFvaVlJR3BaOVhLRXFIajQ5UUp2WFJ4d3JGVk5DOFBPd3hNZ2xkRXFz?=
 =?utf-8?B?NVJFN2Z0TGlIMC9XTG43TGpCZDFKSWRONFpoR2hPZ1JITDFMZ01XQ1BOY0dQ?=
 =?utf-8?B?ZUtYdTNKd2duSC94T1RBaXdnRFR5dTEzU2kxZHZacmZnS2FETzhjZ0hIRndL?=
 =?utf-8?B?YVMyMWYzaC9GQ1FNMEV2RVJzS0RieWpOVW1CTi9oYVJVZnVRTFlNUkI2YmQ1?=
 =?utf-8?B?c2QxSG9SVDVHVU91L3JhNzdka0o0cDNtSzBaakdPOGRidm55SDFyL0xGR1Fq?=
 =?utf-8?B?TFVOWGJTcWxLWUVyb2g4SUJ4U1J5Zk9lbm9qdXNJK3RobFQzODNzM0lKeVBx?=
 =?utf-8?B?YzJaclU2aXB5N1NyWjkxY1Z6WkEzTmJuMUc4K3lNMG5vWW1TRXdLaWMxVEF6?=
 =?utf-8?B?c004NkNEYmlqOEduQmdQVVUvb1N2WHBnVlRvRXNBUUp5RGo5emFRaTUvVmdv?=
 =?utf-8?B?TXcwcEhDWFRCZ0w1UTltYUtDa2gvTEkvZkxudTNkdkU1SGNpZktHMUVXN3hr?=
 =?utf-8?B?ZXlmdFZEcmZGcmRBdzVXbXNFV3Jlc0JjMnF6N0JBYVJoeFJNLzcrdjFRQ0Js?=
 =?utf-8?Q?jSlldGIzGJMKr/WYlTTJYr8PJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4adb5191-b865-4475-fd70-08da59eca84d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 16:30:19.8590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7amy+NkL+41gxjkpuHp8TVoePvHLbBt5f0Ok/22rd81TUw2X3AIJOGsYQnhy4g5LprIr+ZtCMfair1EDjdi3fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7541

On 29.06.2022 18:19, Roger Pau Monné wrote:
> On Wed, Jun 29, 2022 at 06:03:34PM +0200, Jan Beulich wrote:
>> On 29.06.2022 17:23, Roger Pau Monné wrote:
>>> On Thu, Jun 23, 2022 at 03:32:30PM +0200, Jan Beulich wrote:
>>>> On 23.06.2022 11:08, Roger Pau Monne wrote:
>>>>> Testing on a Kaby Lake box with 8 CPUs leads to the serial buffer
>>>>> being filled halfway during dom0 boot, and thus a non-trivial chunk of
>>>>> Linux boot messages are dropped.
>>>>>
>>>>> Increasing the buffer to 32K does fix the issue and Linux boot
>>>>> messages are no longer dropped.  There's no justification either on
>>>>> why 16K was chosen, and hence bumping to 32K in order to cope with
>>>>> current systems generating output faster does seem appropriate to have
>>>>> a better user experience with the provided defaults.
>>>>
>>>> Just to record what was part of an earlier discussion: I'm not going
>>>> to nak such a change, but I think the justification is insufficient:
>>>> On this same basis someone else could come a few days later and bump
>>>> to 64k, then 128k, etc.
>>>
>>> Indeed, and that would be fine IMO.  We should aim to provide defaults
>>> that work fine for most situations, and here I don't see what drawback
>>> it has to increase the default buffer size from 16kiB to 32kiB, and
>>> I would be fine with increasing to 128kiB if that's required for some
>>> use case, albeit I have a hard time seeing how we could fill that
>>> buffer.
>>>
>>> If I can ask, what kind of justification you would see fit for
>>> granting an increase to the default buffer size?
>>
>> Making plausible that for a majority of contemporary systems the buffer
>> is not large enough would be one aspect. But then there's imo always
>> going to be an issue: What if non-Linux Dom0 would be far more chatty?
>> What if Linux, down the road, was made less verbose (by default)? What
>> if people expect large enough a buffer to also suffice when Linux runs
>> in e.g. ignore_loglevel mode? We simply can't fit all use cases and at
>> the same time also not go overboard with the default size. That's why
>> there's a way to control this via command line option.
> 
> Maybe I should clarify that the current buffer size is not enough on
> this system with the default Linux log level. I think we can expect
> someone that changes the default Linux log level to also consider
> changing the Xen buffer size.  OTOH when using the default Linux log
> level the default Xen serial buffer should be enough.
> 
> I haven't tested with FreeBSD on that system, other systems I have
> seem to be fine when booting FreeBSD with the default Xen serial
> buffer size.
> 
> I think we should exercise caution if someone proposed to increase to
> 1M for example, but I don't see why so much controversy for going from
> 16K to 32K, it's IMO a reasonable value and has proven to prevent
> serial log loss when using the default Linux log level.

But see - that's exactly my point. Where do you draw the line between
"we should accept" and "exercise caution"? Is it 256k? Or 512k?

Certainly I'm also aware of the common "memory is cheap" attitude,
but that doesn't make me like it. That's both because of having
started with 64k total (or maybe even less; too long ago meanwhile),
and because of my general observation that everything only ever
(fast) growing makes many things slower than they would need to be.

As to controversy - I did make clear before that I don't mean to nak
the change. But given my views, you'll need to find someone else to
ack it despite being aware of my opinion.

Jan

