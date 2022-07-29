Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AE8584B8B
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 08:17:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377311.610460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHJJ3-0002QT-HR; Fri, 29 Jul 2022 06:17:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377311.610460; Fri, 29 Jul 2022 06:17:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHJJ3-0002N0-Dz; Fri, 29 Jul 2022 06:17:05 +0000
Received: by outflank-mailman (input) for mailman id 377311;
 Fri, 29 Jul 2022 06:17:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GB/u=YC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oHJJ2-0002Mu-Lp
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 06:17:04 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00040.outbound.protection.outlook.com [40.107.0.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1003aef0-0f06-11ed-bd2d-47488cf2e6aa;
 Fri, 29 Jul 2022 08:17:03 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR0401MB2299.eurprd04.prod.outlook.com (2603:10a6:3:24::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Fri, 29 Jul
 2022 06:17:00 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::9da9:fa60:f04a:2a0e]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::9da9:fa60:f04a:2a0e%7]) with mapi id 15.20.5482.011; Fri, 29 Jul 2022
 06:17:00 +0000
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
X-Inumbo-ID: 1003aef0-0f06-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aFbCFql72oSanqjDoA7G59yAs9FJPvGLfrn87PEmIKEeXvj/dJaOUDvcCRcoPgWP9GS18ldU8WGaHqzHOF27dy49xPqthOC/q6vUbAtqHwo/WFhhAqPjdUW7xs1JPQ7D1XruH720ieEbLhnD7l1Li6Cs2biFyatH0PV/XvjK8HgDBuxekckf2Iall3HIa1NEcU9PpQe63Mc1AogFE8DmTwBhjEDySkAGy638DK1OTeJDBq7UWbFsbfK0u6NDluHe7YmmQtz+Bmuii0rQxdgWf3THezy4iw6Drbm9RZBVera1I7urSygCNxin1Q08jq5KVa492uGXHJm9Qvj1xJD2iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AVKM3Rod3d5UqMux+/1t4vz2tPeoFxxUo/Xham+fuP0=;
 b=Edo+LmOwbBsnAI1UelfWoky9qT+kq2ftwkI7q9XrZHssYco+VdXi0BK+NiyRZAwwLc78oJiR4j46yuqbZimQprcMz/UcAkZmDvLyOpwpt2iwElpxjfs96dnS3KkYAH2NFdJckSa0pY2M6y7lE4X1XR4sbB9EzU/3Igeyni27Tr+iCNZMGJ791wMzahj8G6/rkS2793b6crkuelu8aKsnm7/9Ww5ypzGfm+b1pMlxpqoiSZQ4L+ODLVkf5NvAPGw91LGintDNoU54Dc7BERl3pipEoqw+4BnsO5LQF/FzsGjMC90ndo8+xVpwDjxrHIthP0zYY1r+DbZF8jlZDUFODw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AVKM3Rod3d5UqMux+/1t4vz2tPeoFxxUo/Xham+fuP0=;
 b=HViJ/yu7MmXJvrnbNwIQvW4UAyAcNZ2uHePbXX4ed81gVn/yfxT6H2u773w94ru8yVerNaf1VMTNbfYOA547Aql0gp68qoMak6QVbtaGsx5u0yNAvmx5wIb5LuKwDO5/S2+RDs7pg5W0VAhwvXxEMkBTwzueZZdS9WSYkh6dnx6k6wF2LLcuurZKAWky3Lw4plDMZB31jFd4y8TJ4ZkN1NRQnpuZbTpgDRbVu61IJLkh4CYM9XCZPi4RxQOS3D/rGpI8k7NufhTz7Xbg4kUk5k6a/H2i9Q8W4H8vPhq8ApFojK85BXo5LEH1bE3l6m3NXECR96mSWkOpI/phWHklIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c55b9ad0-bfa8-f0b1-6c4e-a794afd75e7c@suse.com>
Date: Fri, 29 Jul 2022 08:16:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] xen/arm64: sysreg.h: Fix MISRA C 2012 Rule 20.7 violation
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>
References: <20220728134943.1185621-1-burzalodowa@gmail.com>
 <0a8ff178-280d-717f-dacb-4eb9f57a24eb@xen.org>
 <83c17bf6-b9b2-a297-6f7f-dd08231d0f90@suse.com>
 <c71c9522-2df5-35a3-d39c-706d5c9d5263@xen.org>
 <alpine.DEB.2.22.394.2207281551140.4648@ubuntu-linux-20-04-desktop>
 <ec89b2e1-a18a-9ef7-1ca8-edd19e737d4f@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ec89b2e1-a18a-9ef7-1ca8-edd19e737d4f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0259b68c-a7d9-422b-e54d-08da7129f299
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2299:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Jo3H+YlGifwRVs6PiwHnKvseknKgfLiKer2URi67xzzs3k4NhQJZYj6gB/4PdKDeoEha9yveH80YOcSyK0B6w7ReoLGqNkD/4m7YEzYfLJJO3tPpLicg0qmmDR+9d25SYAdQjBr00Yu9c6l6Di9bJ5YzhC4akVo21hs1U9xeG+rR6+2lvyuVF5Nt9u0v369JyXfl+MZCYMi+UyDzQ5z4VvAAfoprKFYFzBC/ydnY9aHP3TAMdJ43lybNklyasHoiXM0ZE54xHsmb5zgBBMI+RgOgq7hq7mVvv9E3PxutE+LHhC7zmnXxunYeGzZY38M/cFuSSJ7ewo6oIcLmLcGSywXuYxJLQqcnA02ggRp5ZfgcTu+MkVfcBiAoxZFkOU6N8gdlpFdsaaZzSYdzp/pEU+Z5OlDA0x+PAWFJAVDpNWcqv7z8vgFL5FI+Umf+lawyNY2r+gZ7kticEC2nnKA22hR8FnfAH8/Wkiq5IkmEWGnWvvW1vBC0NAb+rNGanJL33EMt3bq0yHJcT44gCJAdBmu7+grXdoJ+csk3JIXe44emaD+967C1Mi9e4ePEX2cuhw/vj7zY7LZqeAigPpJtbGLwfFjLPfdrZG0KutABi7U6z0o5nr/BF+CjfoXcQNtOKlO2Mz81iYHzh6SaL4bNjP4OTVEUculFWo7U/vtGjNCK8C7FNJcXk2gt454D3iIRJ7Vfwvn8ZGDQJGmA5R/epCQyAokjlAurEORRbMSc6z8NLe5nx/JoqxDwmt6qsq1VUL+KD7r1wubADgSjTpnkIHJ5b/5MC2Avz19fgBJQ238HzyzkCBb2PJpwYT4HyD5+jl1t26kBktaGVFewIoXB4A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(346002)(366004)(396003)(136003)(376002)(186003)(6512007)(41300700001)(2616005)(316002)(8676002)(66946007)(31686004)(478600001)(4326008)(26005)(6506007)(66556008)(66476007)(53546011)(36756003)(31696002)(8936002)(83380400001)(38100700002)(6916009)(86362001)(54906003)(2906002)(5660300002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmlqeVY2ZlIrMEg0NDhVZDVWYjlBVnJOVFltbU5QNC91aEYzTitWODhFYzZX?=
 =?utf-8?B?S2Vydm9VOFJ2UXFaSklEU2hVNkEwRFRYZVhRZXVsVVZTVHN6TURteGlnK2NY?=
 =?utf-8?B?NjNmV0gyYnNVd25nTlhLUzFCR1Qwc3FrUlRxY0hMOS9JVjdweFZLNXdaUE9l?=
 =?utf-8?B?ekZEaWc3LzBaTFBJbll4SlFyV3E0ZEgwaEhwUU1COTYwenNnTklReFBmV2hR?=
 =?utf-8?B?ZFRXcFJDNmxLNllIMGNFZU1qQW9Xc2Jxc290dzdrd0MzdUllUlRBQnJtcHF5?=
 =?utf-8?B?RjZkUDd6NnFGRG5OdUgzZ2Y0Q3FFM3Q1NzA2UlNYMXQ5eVRDcmM1b0dkT3Zu?=
 =?utf-8?B?T2VuaXdEKzhNRlgzQ05lNjlPaHp4dkRhd21JK3ZkMEFvZ1Z6TkJlSjVnRnc0?=
 =?utf-8?B?VGlvc3Rha3hvbkJaNmRYdlErZGpkVFNLMEZhVEVhcCtKdnMxWnJ6UWRySEZa?=
 =?utf-8?B?SWZkajNPZDlTQTI1Z3VQVk1PZ2phOWNCaGlmVTFidUZRV0lWc1JmYzJCVEpO?=
 =?utf-8?B?K1BOdkk0YTRJV0w2M2Vid2NlQk9nRms0ZFZHRSt0WVJneHA3QmdiMkg2TXRS?=
 =?utf-8?B?MFhOcW84dFlMQlJ2dE00T3FPL0crdXJpR0FHcFRCbVpGSmRZZzlBd1VibVdE?=
 =?utf-8?B?YXI0QTRrVTlZd2o4bTNUWjJNUStZc0JqV3l1b1VuZCtxUWtnWEtrb1FDenNF?=
 =?utf-8?B?UzVuUmtjcjFxZjdLaFR4UXZTMDZvcjZrWTduSUxPZUp6Z2dqanhpaStvaHph?=
 =?utf-8?B?aDJuaXY1d1NRTjJ3UEtnQWlvdm9FekhRTXkxYkJjeXMvVDA4WGVMMTJkVmU3?=
 =?utf-8?B?S0RyN3FvSStPRHVxMDNtQWVkODFhRERMS2lUTTJ0cDl3WEdNcXVIWDllcFhS?=
 =?utf-8?B?bk5RMTd5R3lCR0lJYUJKV0pvQ201QXlHTXJzaWZJQnl2a2xrK0h6cllPTi8z?=
 =?utf-8?B?YW9lb3VqMlhxSVlpZUphQ3M3eUNPR282bEszdWhvdXU1YWVPYjZjS2tySTM2?=
 =?utf-8?B?Mm9GWGR2TzAwSmhyWk5BYWlmRkppSlYxMzhzVTV6aThIb2hzVWFnNExhYTI3?=
 =?utf-8?B?UnJONDV3RDNzZlo0R3kwUGJtWjVXbjdlRzQzTEVOTlE1OXVORlhiazFYT3Ew?=
 =?utf-8?B?bEJvd09WcE5PeFhmOUtSZDFwVDlWY1MySzdGcWs1UGd5Z3NnT2ZOaGJjZXo3?=
 =?utf-8?B?L1piME1HMHJXNHlRM3l3cUpuMFhucUpTTFJ0RmhWY2pkZ3ZIVWxaeEkzSmlD?=
 =?utf-8?B?WUx0ZzlWR0pHLzhGZVJxdElvZzEzTU1WbURGaWdUL2lvNG1hY0txdnZNc2ty?=
 =?utf-8?B?THNPUzNHUTk0NThrYlNaN2JPRndiREhWTGZ4V2pHMTFscVljdExBNEtzN1pi?=
 =?utf-8?B?OXl6WDMrSGlMUzhzZ1RqYW9QcGtyTjBZdWN2NnJWeUd1ZnRONDJCYWJhT3JZ?=
 =?utf-8?B?TGF4aEp0OHpVWkFVYlBqZDZDS3BsYXVEOGI4WnhhcnMybzM0cjJoSVZxQXM3?=
 =?utf-8?B?Q3NncjdLTW9SOGgzS29EQnFtdFlqOStML1JGTHpEd3FNLyt1UVFCREl6RzEx?=
 =?utf-8?B?am9wT09sTkpMc0pEdEtkNEtDU2pjOEFxYXg0T0prOFM3ZzF1TlBET05FdXov?=
 =?utf-8?B?L0svYlFqNTVEUzFtTTlwZVJjZTUwcGlUSnEycHFEREhyRHRKMlhwSUhsZ01X?=
 =?utf-8?B?RXZRRFA1MGxsNkNONTVhK09TY2JOY2ZGMGJSQjRTeG1hek9XRkdFZ1ptZHJZ?=
 =?utf-8?B?TUdhQXVXSFVzQXEzaC9WUEo3YVVSaEhvSmp3b3k4cmpNMkd0bWtWRlNlSFJG?=
 =?utf-8?B?NEZiNjZzUU5xVitQcGZSMzkrdjBuSWh2emZiL0U4UHp1MDg0Z1BuNkZtcEY4?=
 =?utf-8?B?dkhFTjNCK1c3a1dxMFY3bjVSQWJjbkllMFFEK0hrK3VScjF4ZDV5MnpZLzVW?=
 =?utf-8?B?SGt1bjVvMEIyc1BvdXlZWVJwTENFZStwUEhkRXBaTHduNngwaFdhYTlBNmdq?=
 =?utf-8?B?bnI2N0VqK0xBT1VCNEY2QlMrb2lIUXppcFhaV2UySkY5QkM4Z1MwOG9XYnMz?=
 =?utf-8?B?V2czc1l1SVVUMHRhc0dnRW1NbTIyTXIrbVVZZmVvNDZKZjFtVTU2NjBacTgz?=
 =?utf-8?Q?xhDjL8RM7gNhF1pj10gbRxSk9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0259b68c-a7d9-422b-e54d-08da7129f299
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2022 06:17:00.5210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tuSoWeyhTw44u5TcRwWHUEXKiRtJgV67hJv1FG3+nNaVzz/xaL0j87RjUiuGFXnwL2lY/xDhpymxmWPEU/oEuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2299

On 29.07.2022 07:23, Xenia Ragiadakou wrote:
> Hi Stefano,
> 
> On 7/29/22 01:56, Stefano Stabellini wrote:
>> On Thu, 28 Jul 2022, Julien Grall wrote:
>>> On 28/07/2022 15:20, Jan Beulich wrote:
>>>> On 28.07.2022 15:56, Julien Grall wrote:
>>>>> On 28/07/2022 14:49, Xenia Ragiadakou wrote:
>>>>>> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
>>>>>> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
>>>>>> @@ -461,7 +461,7 @@
>>>>>>     /* Access to system registers */
>>>>>>        #define WRITE_SYSREG64(v, name) do {                    \
>>>>>> -    uint64_t _r = v;                                    \
>>>>>> +    uint64_t _r = (v);                                              \
>>>>>
>>>>> I am failing to see why the parentheses are necessary here. Could you
>>>>> give an example where the lack of them would end up to different code?
>>>>
>>>> I think it is merely good practice to parenthesize the right sides of =.
>>>> Indeed with assignment operators having second to lowest precedence, and
>>>> with comma (the lowest precedence one) requiring parenthesization at the
>>>> macro invocation site, there should be no real need for parentheses here.
>>>
>>> I am not really happy with adding those parentheses because they are
>>> pointless. But if there are a consensus to use it, then the commit message
>>> should be updated to clarify this is just here to please MISRA (to me "need"
>>> implies it would be bug).
>>
>> Let me premise that I don't know if this counts as a MISRA violation or
>> not. (Also I haven't checked if cppcheck/eclair report it as violation.)
>>
>> But I think the reason for making the change would be to follow our
>> coding style / coding practices. It makes the code simpler to figure out
>> that it is correct, to review and maintain if we always add the
>> parenthesis even in cases like this one where they are not strictly
>> necessary. We are going to save our future selves some mental cycles.
>>
>> So the explanation on the commit message could be along those lines.
> 
> First, the rule 20.7 states "Expressions resulting from the expansion of 
> macro parameters shall
>   be enclosed in parentheses". So, here it is a clear violation of the 
> rule because the right side of the assignment operator is an expression.
> 
> Second, as I stated in a previous email, if v is not enclosed in 
> parentheses, I could write the story of my life in there and compile it 
> :) So, it would be a bug.
> 
> So, I recommend the title and the explanation i.e
> "xen/arm64: sysreg.h: Fix MISRA C 2012 Rule 20.7 violation
> 
> The macro parameter 'v' is used as an expression and needs to be enclosed in
>   parentheses."
> to remain as is because they are accurate.

I'm afraid you're following the MISRA wording too much to the latter.
Earlier on you agreed that when macro parameters are used as function
arguments, the parentheses can be omitted. Yet by what you say above
those are also expressions. As indicated before - I think parentheses
are wanted here, but it's strictly "wanted", and hence the title
better wouldn't say "fix" (but e.g. "improve") and the description
also should be "softened".

Jan

