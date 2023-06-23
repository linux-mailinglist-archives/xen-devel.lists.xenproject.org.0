Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EA273BD4A
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jun 2023 19:00:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554402.865563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCk8h-0006BM-EV; Fri, 23 Jun 2023 17:00:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554402.865563; Fri, 23 Jun 2023 17:00:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCk8h-000681-B4; Fri, 23 Jun 2023 17:00:03 +0000
Received: by outflank-mailman (input) for mailman id 554402;
 Fri, 23 Jun 2023 17:00:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O1Yh=CL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qCk8f-0005tW-M4
 for xen-devel@lists.xenproject.org; Fri, 23 Jun 2023 17:00:01 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 630471eb-11e7-11ee-8611-37d641c3527e;
 Fri, 23 Jun 2023 18:59:59 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6934.eurprd04.prod.outlook.com (2603:10a6:20b:10a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 23 Jun
 2023 16:59:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6521.024; Fri, 23 Jun 2023
 16:59:56 +0000
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
X-Inumbo-ID: 630471eb-11e7-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aQk7yeCZiKloexHOAwHrEgZ56jpNrqOYlsLWrFWlaHGG0oZWl46ZFkvKlou9exylxPVoiXW6gzeKGaau4lHKzoct5RR6UCIcn9uBIdd9fXqO5svspGP5WqqqMR8PW1892BP1d+lk8+6pSNwsXgNLr5+tWztC5OmyM83/dDMmLcdLp0LSohLUgWw3kaPuEZRC/0sJVT9s1aujodtT/vJ4jkxZNUNyvJ/xkMdbKtJxPVVLxXK5JEvEO16aTPE+iSRc9gsxZxFGn6M9e7WxWX0rLrBqrLMbcqwEq6pAcQ2r9TAgH84+BJNikIsBEo8iAl9ZiS/lvJL0bbjpyD1hSFcvjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9DCSMUYWLXeZ3uQb0/zEoP7pP7PNmqrUmyP/r7MfzCQ=;
 b=Tgx4+rE4qDBn+evRkaoDZ2NzYd6SBAsT3fm/oF51UbySHfnOY24YA2Ba8rAKKTJbM3DzHFirN1m/tit9yAA5oAQw61CUVAB2Cp2HO0qjUhHNVFbu7YvYJzBaqp1mp83Gz7E6NloMLuCAnPXDRwoBaKMTy+bm3UOiCZ7DUnhwDu2Zv6cf6aJMn9UmyszYV6McIrgwW0gAtMXNBPq6m/FmqIKdeTa5gniZB/H7GH7G9hE4dAlAKsNbYHjOjLCV6JwD5g+J3Q2bzvTHqBlE83V+arQU3sAUEk8abHzOCzcg+Re/3QAwFPT54+uFNUKHiSYbjG70DSAG6vRxf1sm1buFMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9DCSMUYWLXeZ3uQb0/zEoP7pP7PNmqrUmyP/r7MfzCQ=;
 b=mNGV38vClT7uxtzRhXFxgkKXyr9cRnJ0vFKmRxJ6HJGe558CYouuXV2QW4ib70MZzeJhOvwVGPQQ3AU0lfURR3NT5+FzD3lxHLddwTidfhDCGCzaYuV1qOzjcMUNYxHcnF2uHyBULaB2q8I/jEicn4ogwOmXpHAxzDkiUGDTC1Amth816GOb8zmyzEWXRQafRgE4fT2cPVvgZdHQIBc+5qCu0QgABdryYF7OjolTLJy/nYn1aJnQNFAANBp8+Om+mSF6J85IWnZYSHpGD5aCD5E39FG2imWKCGJzdWMt0MFIQ2gtcfrqTWAW6yVljW4+W9gC6hc0CoNJp5hm3QmmWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <debc9d1e-609a-a030-5f64-2eab9e2741f7@suse.com>
Date: Fri, 23 Jun 2023 18:59:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/3] xen/ppc: Set up a basic C environment
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1687466822.git.sanastasio@raptorengineering.com>
 <1afe27097c5e1b55dcffa9464dc0cd0c1038a23e.1687466822.git.sanastasio@raptorengineering.com>
 <bfaba0e5-36e9-b201-30fd-b96add91cb1c@citrix.com>
 <5011cde3-b553-6a17-85aa-a30edf3102fd@raptorengineering.com>
 <d963f7f9-5170-10b3-138b-489cced1b3db@suse.com>
 <097fee60-67d1-b97b-c28d-52ab8b295518@raptorengineering.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <097fee60-67d1-b97b-c28d-52ab8b295518@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P192CA0050.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:658::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6934:EE_
X-MS-Office365-Filtering-Correlation-Id: 01f0741e-b96f-4a42-3234-08db740b4568
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LR/TsZcHaJ26/f34sD8zI5HbL7eZeAvJ/hLEAEmt+PyreOJNPl62gsjqpvePPxYTtCQHOQmrAWFj6ezuM1MsuLYlFFfE8W9JYPE1Pr9iAif5l5mJYV8vslSpvqgtmWyloG3gshpnxpT1N3txoLmPx7h4NhR9CwmJOSb1GPxs2CBR9N33ZAGvPh1v4YWOID19TMwO1AupetEtY6z6Vubl9UEqtm0i6MDw9r6jMSClWKR4zAgdGQyBYk1kRP85yKE70KG4PvGc656NnvHTWNWwKYV+Z1DSP1JDXisrK9VhT0KZPEjIp94/5kGYyrUVNeOz4dhaJ7oEIATUQLBZvr5OdGtdU+/n/ko/iRIuiE5Ha5pj5V5VCnFi2UFBWs5rULzYnE7B0t4iiyMHckYjN4BVMXkLo7CIkL63KmVp2xC30MhayJRV+HxKiuKf3bxkfNzyHAkPemkIRCJk6gJPV27DYZZzXyAXIH82WBmTlvd/qVe9UB1sj1REbAOblQioAVYDHIT2f5c3LJNqdixYOlxif3E/yyHFTfzIKuBCqvMKy9Uu1oyO3KsFzWIh0cnNUxR9hAGAzZmLNLU7KKRvkTHalg4MYtr6B//dVkJz3YNeq8WlIXqepDlqntlyrUfC/KPIOUqQYEthErTGgz9vFd9+Yw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(136003)(396003)(376002)(346002)(451199021)(54906003)(478600001)(6512007)(26005)(6506007)(53546011)(966005)(6486002)(5660300002)(2906002)(36756003)(66476007)(6916009)(66556008)(66946007)(4326008)(31696002)(86362001)(8936002)(41300700001)(8676002)(316002)(83380400001)(31686004)(38100700002)(2616005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3M3TWszUjloUUNvcFpGVis5anBRekFMTlM1cTlSYlFZZG8xVFREY3FHSTh6?=
 =?utf-8?B?UEZodjlMMXg5SUxld3pJTHltem8yZDgvLy9KK0NFZHpqN0d5TVgyZ0V6c1Yv?=
 =?utf-8?B?ZHVBZTJxdWxEem1JWjc4dWF1Zk9TdjhkRUpTVnd3cXBoRmhVVG1ld3VyY0R2?=
 =?utf-8?B?NmZWSzVJbUpERldHcUJpVXYrRVd1VittNUhSUTh0anlmNU94QnM2Mk1jT2lo?=
 =?utf-8?B?LzVTYjZMS3RJZnFNOE9wdTd6d2VGNnJITVNPQWxuWGxPTEhITGxlYnF5OFpy?=
 =?utf-8?B?VENBZ1RsRFcvWE95a29IaXJZWDlyUlhMenF3Tms1d0FRN0N6UnZGT2x0WFE4?=
 =?utf-8?B?bGx2RXBPOEVheEM0TERnS3ZGMDMxZzUvcmR4NFBMUEk4QjZzc2orRWUrM1Zz?=
 =?utf-8?B?ellpNjYzQW0zMHJMK0RmZFpteDl3SFBSWTVjK2hUaS94RDBpZEM3L1BMdEs5?=
 =?utf-8?B?bitoTEtQaWkvaGM5dWp4K1gwbHRoWVJ4aXRKQStpamthVlJDejIrU1FwWlhS?=
 =?utf-8?B?dTFzY0RtandKN1NJVVdHUk5nK0dqNTNQSzJ4OEUwSU1vaHY5NzNoQ090UkR1?=
 =?utf-8?B?Mlpkc3p4c1FmOWlvSmt4cGJlaTh6OWJoZ1JURW9kbW1lQklrQ0h1UFdodEY2?=
 =?utf-8?B?ZGtPR1ZqYmZGVG1VMk5TOGFwakVTaGNqUHVyMVVNRURGdUtsNzgwVUhPaWRM?=
 =?utf-8?B?dVlReE14eWwvRGRCemlCa3Jpcll4Y1o3aU93MEF6R2hYbU5EaG5rOFp3TExx?=
 =?utf-8?B?MURqTEQrZFhGeG1MVzBneW9McE0yVFhkb2djUDF3NGIvdW5sRVhSWFdyTTVk?=
 =?utf-8?B?cHVjOHUrdEtvVTA5WlNyUUM4QlpscG1lellQM2RvR0dOWmFybHBYN21BaGdK?=
 =?utf-8?B?VzQyOEgxSkp3OENiVXpSU0R4d2xiR05RNnZ0czZrL2pHaEpGWHlHQVhSUGhn?=
 =?utf-8?B?SThlYjNNaGpIdlRQdjV0QWpMUzRQVWZaeFM0bDIwb1l3NGJhcXlpcXNET01C?=
 =?utf-8?B?bzBOc1RWTVd5MVYwak5QUE0wQ3Q2TFAxZGQrMnY4S1B1bGNVWW1ETi95ckQr?=
 =?utf-8?B?VlVYbXlwbmk4aXhoa0pBeUIwTFlUVFRpdVBRTnpjSWN0WXZqQjUzZ2I5T1pV?=
 =?utf-8?B?cmV4bU5xakpIK0l1ZkRENGxBcC9Wc0ZhWk5rZHZ3c3dLeFZKYXBvcklyNjho?=
 =?utf-8?B?UlE0Rzh2MlZLU1RjTnpZU3RuaGNMdUJSbGdiQ1EzYzBHcFZGbEZEQWxoUE5a?=
 =?utf-8?B?YU1vdVZwZFFNQUwxSlVrNldVNVRZVHIrRkhnUW9rWi9zUnlKZ20wREJiODE5?=
 =?utf-8?B?Q3RzQnlUdk45RW45ZkZvSjJ4RHV4dTJPdU9zNXVXdWwvcmRGQ1JhOWhaaHF0?=
 =?utf-8?B?YzIxUXBvdWh2emdmUWdFNUJ5d0VHTjI1ME04ZVRNTGphS241d2Vqa1BTdE92?=
 =?utf-8?B?b2dEYldzMjVDMVNuOWMwVnEzQmh3c09tV21DOVU2QzFzZFhvdzM5L1dXOUE3?=
 =?utf-8?B?MDNUekwyU2l3bkc4ZG0wSk1LdHdIWU04Q0xBK2JuN2xsRi9PejBvbGw2bTdK?=
 =?utf-8?B?MXpPNEVqSGtweHNVY2taWCtXSFN2NkxnaEpJUlJ6NFJ5Nzh0dUdGVThKVFk1?=
 =?utf-8?B?cDFnc3VZQW1qcFpYUXpuTDdyb2tTWHJ3eFJ5a0pZZ3BheUdaZ3hLbEFkaUJT?=
 =?utf-8?B?VkdTNHZaelFnS096bzI1SGRDQ2kwdytvMjNRMjEzWWM1a2p4L092ZSt6SEk2?=
 =?utf-8?B?NjJSVzBML0tDbkZlb1NuZ08wNmxLRkF3NnI0NFdZM1A3elBLUkxSU092Wktt?=
 =?utf-8?B?MnVHV2libVlHYm0wVXdNTllPaXlJQUhoeXc0bDJ4VDBQSzZ4MmVOcnN1d2R2?=
 =?utf-8?B?N05ZNG5UV1dMV0JDY2FTYWxsdFZ4ZnZRTExZa3pkaUUvQWp5Y3RVNTdmM25B?=
 =?utf-8?B?M0c3WnpyQVZyeEJBRzVWWlVJcWxGeFlZVmVyZ05zOGNoOWlmb0lKakMvOVJt?=
 =?utf-8?B?Sm9jSFVEcERlQW05YkJPclMwb0k0UTY1NWE5SDd0UzFEMURnWW9IVEZCZnRZ?=
 =?utf-8?B?N2FyYVN1K0MraTlkYm9HYkJxdUhOWWVCWnBrNnZrdWYyQkE4S3dPWXdFVEVS?=
 =?utf-8?Q?GbnduEY4JKXEJzBZstto2yd7n?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01f0741e-b96f-4a42-3234-08db740b4568
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2023 16:59:56.3605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1pUh/heDobrfuVGPP+DXRfCKyzESoi3yvvRQB5fsVmNvwYGGv3OyeSDAskDuhJGptHAsL0RHnVIPTsPca6hopA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6934

On 23.06.2023 16:41, Shawn Anastasio wrote:
> On 6/23/23 1:34 AM, Jan Beulich wrote:
>> On 23.06.2023 03:26, Shawn Anastasio wrote:
>>> On 6/22/23 5:49 PM, Andrew Cooper wrote:
>>>> On 22/06/2023 9:57 pm, Shawn Anastasio wrote:
>>>>> --- /dev/null
>>>>> +++ b/xen/arch/ppc/setup.c
>>>>> @@ -0,0 +1,13 @@
>>>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>>>> +#include <xen/init.h>
>>>>> +
>>>>> +void __init noreturn start_xen(unsigned long r3, unsigned long r4,
>>>>> +                               unsigned long r5, unsigned long r6,
>>>>> +                               unsigned long r7)
>>>>> +{
>>>>> +    for ( ;; )
>>>>> +        /* Set current hardware thread to very low priority */
>>>>> +        asm volatile("or %r31, %r31, %r31");
>>>>
>>>> Is there something magic about the OR instruction, or something magic
>>>> about %r31?
>>>
>>> Using the OR instruction with all three operands equal is of course a
>>> no-op, but when using certain registers it can have a separate magic
>>> side effect.
>>>
>>> `or r31,31,31` is one such form that sets the Program Priority Register
>>> to "very low" priority. Of course here where we don't have SMP going
>>> there's not much point in using this over the standard side effect-less
>>> no-op (`or r0,r0,r0` or just `nop`).
>>>
>>> For a table of these magic OR forms, you can see page 836 of the Power
>>> ISA 3.0B:
>>> https://wiki.raptorcs.com/w/images/c/cb/PowerISA_public.v3.0B.pdf
>>
>> I have 3.1 to hand, and it looks like they were dropped from there?
>> Otherwise I was meaning to say that it's a shame gas doesn't support
>> these.
> 
> No, they're still present in ISA 3.1B. See page 1084, Book II Chapter
> 3 Section 2.

Ah, I see. I was searching for the pseudo mnemonics that I had
found elsewhere at some point (which are what I would hope gas
could support, but then of course they first need to be
mentioned in the doc).

>> Finally, as a nit: Style above is lacking several blanks. One
>> between the two semicolons, and a total of three in the asm().
> 
> Just to be sure, would the following be correct?
> 
>     for ( ; ; )
>         /* Set current hardware thread to very low priority */
>         asm volatile ( "or %r31, %r31, %r31" );
> 
> Not including the refactor of that instruction to a macro, of course.

Yes, this looks correct now. Our style is perhaps a little
unusual; at least I'm not aware of another project using the
same, although I have the vague feeling that someone once
mentioned a possible origin.

Jan

