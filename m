Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B19EB76EECD
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 17:57:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576476.902655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRah7-0004sY-RG; Thu, 03 Aug 2023 15:56:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576476.902655; Thu, 03 Aug 2023 15:56:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRah7-0004qi-NN; Thu, 03 Aug 2023 15:56:57 +0000
Received: by outflank-mailman (input) for mailman id 576476;
 Thu, 03 Aug 2023 15:56:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qRah6-0004qa-AD
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 15:56:56 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0604.outbound.protection.outlook.com
 [2a01:111:f400:fe02::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e426eb4-3216-11ee-b268-6b7b168915f2;
 Thu, 03 Aug 2023 17:56:55 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9140.eurprd04.prod.outlook.com (2603:10a6:102:22f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 15:56:52 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 15:56:45 +0000
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
X-Inumbo-ID: 5e426eb4-3216-11ee-b268-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hFIbRyhlIZeZmlMX0xhIuNY76qzgsPuI+tRHMT2h9mv1E3GxO1dTGI29iDu5HD5xPxuVPOiXE2wvLvi7E5g0Ho59MS8GDZ77sfTAdqsFHJ81gKHVzu1ONVtsa1dpKwXGyOHYlN1cZqv+RaKfAB4GCqIMK/l0kMxKpGAy0MITNljegwEPjDxEdEJCGq0Xm1Tb4e/teP3eCrYdFEZb6xoOOppu8WCFQGiEAcIrHI8KF8ipVGGDEbh0wsbxPy3HIoWIpoh9fAIAYGr5Bj7Yam35iAo6wcQAZJ8rUR5rd7LMzXa2So88Ly5zGWHLGlH23Nshxq8xSCGLIaQ81gy3bClKLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7z++OH64X4v10TV4JneKLO7NZHCTtV+E1pdVc36zSq4=;
 b=XsUGyBMupMxLxuzL7yZKVlFvkVj1EySOOXWwTGZcrFtNhwpImgqQkaJW/E6g8uPgbXQbdAhPU1wWLT6QzOrrfyjvOuSYPS79sZMARwj37YIXGAb3Wlnu9p7F5IQDOuGQXENSEDLBOk3giqkN4KT6G/b7eLKtsWgGkBlisXbSY4rB1+bFGUmfVaVTpiVIa2o9Bv1GSc3e4roVaHLBAJ+MqJKVpXpoy+LBS1dAuPR57URHeUXfE4bdgxr/xVrFoe4ywr4BKJclqHx2rqdaUkXbBGCGYTLejPlEFh2SQyt59ewOKiuH4UBx5V7di08GdK0UznGwlkFCrhGD+mzhjAZhtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7z++OH64X4v10TV4JneKLO7NZHCTtV+E1pdVc36zSq4=;
 b=2tek5Z/BnkSnu/CLQVA4vXnkvP9eVDkE0H+Rfwd+OK1ZhB1fTO0jUxtrTNBvMCWHqTq/TRL32etJvTVwVRrXGaMwz3I1RWysz+EX0EGIbfY0ElNyGUpvesHETvmJdKg/V0pKdoQO8MpOZt5H8WjZEun3wSEcokbvhXYHH8SkBnLjbeq+ZKlj7qF6uLPtItAtXNAImKN6u7FKL18h2NrgM19GHoZ+SZl0lhWdXbSe5EL5dNZUDq1sd8Wqh1beQZsm3+wtE7GgG4H7BcH0MSbMIrVhjvW6unJ7zfalHVHbGDV3InjX4caRVTa1qskcxNh/oI0FNA3eWNyO4EwGQWTVyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <01a80d4c-f19b-98ec-805e-e648e752d6b1@suse.com>
Date: Thu, 3 Aug 2023 17:56:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH] console: generalize the ability for domU access
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Christopher Clark <christopher.w.clark@gmail.com>,
 Luca Fancellu <luca.fancellu@arm.com>, Henry Wang <Henry.Wang@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230801160608.19219-1-dpsmith@apertussolutions.com>
 <3b889079-571a-a83a-0cba-c30cf2ce0b1b@suse.com>
 <d90cc238-87ef-d0d0-b06f-58e89d24eaca@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d90cc238-87ef-d0d0-b06f-58e89d24eaca@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9140:EE_
X-MS-Office365-Filtering-Correlation-Id: 60e618fc-b1c4-4b9e-1c3e-08db943a3d18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lndacWCb6HXCarskpn9KnziVdPBIv1oGHqbx8zdI2K0v2BeGOi8R39LZtc/QoF61UIiSTnQNgQSs2x6aRADjtCYAhiOciUp/Njzj7/vyVFeP6OFS5XtArimPb+T1clBQFkzybH78dmERzLgm9A/AZrbs1JKujM4638pvw7njW4b/ifIgwFpqUGjs2MFuO4CH4KJNWk9wWoIjSePXmBUkjokrvTyMs2BNyvNPRq9B3tgbQsjj/uHWHr9k01cwi6M0fuQgb62WxbMcdkPQTlz4ihN43aLfRaCbky0d0vbfRTFkkmQlX8OSu8ILfZlYqyrfCIX2TxWAAX31LNwJYjGu2JC3evHqNM3qrfYmz3OWTNCDWImYN/HW0DwJ8QjPsG+mpMGJwMH/0M64qYCh/aXuhJm510EPbTqoK5SJ6QENkbyAqlIDvcZzy5OrugDAdBhZ4eiOXce+6MKPXYYZT7z6ObEoZfx3gM1uunrRfQNuIytu8TxCTQ34HGpcybNZmAiiN0jJjNu5gpARmPB51JXEx0DG2gRgsU0KAjXsoJgawsm9H2UhvdyMKBjjmwQBs8zQYTvWPIS4l05V4fkZd+bbIElJzTPteu0WPZlPKJCpKzfVFeZTZTQc/dxnOPqRz4ANaTOs2Uk0Jnx6rL+onDatSw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(136003)(376002)(366004)(39860400002)(451199021)(66556008)(41300700001)(6916009)(316002)(2906002)(66946007)(4326008)(66476007)(8936002)(8676002)(5660300002)(26005)(36756003)(53546011)(186003)(6506007)(86362001)(83380400001)(2616005)(31696002)(38100700002)(478600001)(6512007)(54906003)(6486002)(7416002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVgzdzRVVWE0T0NvQUZibnVxc3VxRmVtazRnSWkyeEwzWUJkTjJyMWpVazA2?=
 =?utf-8?B?bjBMbjd2S0ZnNmpybXg0VitFNU0wUTdNdGdydzF2S3VkTFVyaE5DN2lTU1B0?=
 =?utf-8?B?YXJvT21yYjdPd2wxS2tUbVBmUVI1Rmc0NjVBMWxSL3dmeXRKME50eUVtU2N3?=
 =?utf-8?B?T01yYzNIN1VPOXFFcWM4My95Q2hyZUZNVjg1Y0JXMUJTTGtBNkw0clo1Wm5l?=
 =?utf-8?B?L3dtYnBqVmRKRkpiSmZVdVpnUDAvU2RtWU9GTnJUWjFDVzVxdERza0IwNjlZ?=
 =?utf-8?B?cHZZdURTRGRkanZLd2hOVWZielFPdjZiQW1IOFhVR2UvV0R3aEhNd080N3A0?=
 =?utf-8?B?bmhhVE9PVkpnUFJrVmlETndlak5lakc1MHRBUnhuVGlMN0hHWGZyNm5nMHFT?=
 =?utf-8?B?bUQybGYyQ2ptRGwvQjVlbWtuMkRZQmVGVDQxYUp0ZDJWMXFDMFNZOUNPSDZm?=
 =?utf-8?B?cDh6V0dOTjhnaVRPZFdSajBKT3hmYytTYTlqKzdUMndhUlU2WThlclhwK2Mv?=
 =?utf-8?B?T0ZVRGpvR1ZZRkp1dXF5Wjc0WWpEeVF2K0ZVWnNVWWdpQlJHRHhHdEZIN2Z2?=
 =?utf-8?B?dHZyeHRWZnJLNUFodTJPUGxaNVM5NEtNRkJqemIvZm9LM3RjaW9jYUhNdGZy?=
 =?utf-8?B?aVdCbDFnOHhXT04rSXB5UFRVS3pyaEI1VERwWmNmWVZSK0E3T0NjL05XUFRw?=
 =?utf-8?B?Rk9YZFc5ZFpMZ1ZSLyt2M1I0YW1EdHZYaStBUGZoTFF4aGk1aVYzS0RFMkIr?=
 =?utf-8?B?RGtuUElKTHpCalBhenhnMW9oQ2gzakx1M1VBNk9Nay9PYXA1QTJaOHV3aGZN?=
 =?utf-8?B?OEV0UVhyYmtYWGp6djZCYjhkYng5RTIyMVdEWitpZWhSd0ZzTDVMV0paZ0t1?=
 =?utf-8?B?NDdSVHFMSVZDTzEyelJWZmFJeWM1TVdrV2Y3aG5OdnN1N0srbFhQM082MEVl?=
 =?utf-8?B?WkgyWFNYTC9ZWUVCdkJVdzArNmc4U1lxU3AxK01Ib2REbkZwN0NabkN0MzZr?=
 =?utf-8?B?Y1ZzNzFjL3g2UWNKYWpxQWZzeDBXMG0xVXJTcTZPanFKL3RpZmVBV1JoM0l5?=
 =?utf-8?B?RUs1STRwT05xYzlmaU9ORHdhKzQrTWY4SVFmbXo3NzRNT3Zjbkk1dmZzUHB1?=
 =?utf-8?B?QlpDb1M0VUpnUjlBWFlrbVVFVUE5QUFvd2RsUnk3QXJYSUxFaGsxM2hwSEM5?=
 =?utf-8?B?K200NFVtZWpZaUUvanhiUjZyY0VaZytML1VySlVUUDFzWjdBTmowTE0zM0xS?=
 =?utf-8?B?aXJKTTBpZUxPb1UwaUZKQUhnbVJ3NkQyZkdLQ2IySm5VT0o5NVBzSUs4dGRk?=
 =?utf-8?B?V1VKb2M0NTV6MzBhR3JtQUtqcndEWjAxWnk0Z0RwOURPZnhzZ3JINmVoclBs?=
 =?utf-8?B?bWZweVJ1NzdUd2taZlI1aEJKS0E2WncwV0l6Q1FwcjBoM3N0a1pXdU9zZ0NI?=
 =?utf-8?B?SVIxdW5PUUxhMkxJa3FPYnJ4cXlvdTdJSnRjTlVKQWVLVThaM25md0RCQnZx?=
 =?utf-8?B?cUgzM2JxaWFpZS94RVQ0eWpJZ2QrZEU1NTc3MnQ1NFdWMnU2Yk55VSt3S3lX?=
 =?utf-8?B?cnhSdDh1NU13enNRS3hjdXFtK05MT3NtLzFFN3k5OEtmVndsTEhWV2d1Nm5h?=
 =?utf-8?B?OWR6UDlVcEx6S0IzbmVrQ0hqL3h1Y1V5VTFwL2dkbnNrU0pEWDJzdmRMb2ov?=
 =?utf-8?B?dXc3d0l4SGc4R3NlbGJCanpnYitvbXhseEs1SENjYmRqOWQ1TTVPYUhGRDhE?=
 =?utf-8?B?M3lCVUVGR2lzYTFDbTdMNTNwcXhUYy9xemlkNS81bTd0azFFQ0k3WUtHNEhT?=
 =?utf-8?B?eWZ6ZjllSUpaRzlmVFkvcXJyQ2VjcjlyeUhHdUhUaWtMNm5mMGdnandIRkRy?=
 =?utf-8?B?UWp2UnJ4TitBekJhYWFiY3V2dSsrMzZ5b25wbGl1bktmKzR1WEd6WE0yMjVO?=
 =?utf-8?B?UHV2cG84NlFxaFlPcXBDMGEyb3VreHZzdTlqMm5Ba3NEcFNuSkVscVhtRnY1?=
 =?utf-8?B?bUV4UFBGRlR3VmxDVW53NkdoNHVzSlorMmpFTSs4R0tKSWRQYkMwTENzeEtZ?=
 =?utf-8?B?UHl0Q3lqNkxUYzZKZDF6elQ2cE9ad2NaUEhXdHgrOEFwSHBvWmpLVVpDc3BO?=
 =?utf-8?Q?5z/a/QSSs7rl7wdce62K/lPy2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60e618fc-b1c4-4b9e-1c3e-08db943a3d18
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 15:56:45.8037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z5XYevfJ3S0aw/Y9JU8HVw/ATcAD/qIHbiOkKf9MRwaBdB8oKV67TKTAvsOHPj0Dir/iRhSYuCbZ+xmwbp6t4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9140

On 03.08.2023 14:56, Daniel P. Smith wrote:
> On 8/2/23 07:01, Jan Beulich wrote:
>> On 01.08.2023 18:06, Daniel P. Smith wrote:
>>> +        if ( hardware_domain )
>>> +        {
>>> +            console_rx = hardware_domain->domain_id + 1;
>>> +            printk("*** Serial input to DOM%d", CON_RX_DOMID);
>>
>> Here and elsewhere - why %d when original code properly used %u? I also
>> think there are now quite a few too many of these all identical
>> printk()s.
> 
> Good question, I did not write the line, it was copy/paste from 
> elsewhere in the file and then continued to replicate from there.

There's exactly one such line right now, using DOM%u. If I'm not
mistaken, it's not all that long ago that this was changed, so I
would suspect an incomplete rebase.

>>> +            goto out; //print switch_code statement & newline
>>
>> Leftover development comment? (There's at least one more.)
> 
> Yes and no, the comment came from elsewhere in the file

Did it?

> and early in 
> development it I place it here to later decide if it should stay (and 
> get converted into a compliant comment). I will drop it in the next 
> iteration.

Thanks.

>>> +        }
>>> +        else
>>
>> Please avoid "else" after an if() that ends in "return", "goto", or
>> alike.
> 
> Really? How would you propose handling common finalization when
> completion happens during the execution of two branches of the logical 
> purpose of the function? Do you want to see two separate if statements 
> of `if ( condition A )` and `if ( ! condition A )`?

What would you need the 2nd if() for when the first one ends in "return",
"goto", or alike?

>>> +        {
>>> +            for_each_domain(next)
>>
>> What guarantees that the list won't change behind your back? You don't
>> hold domlist_read_lock here afaict. It might be that you're safe because
>> that lock is an RCU one and this function is only invoked at init time
>> or from some form of interrupt handler. But that's far from obvious and
>> will hence need both properly confirming and stating in a comment. (It
>> is actually this concern, iirc, which so far had us avoid iterating the
>> domain list here.)
> 
> It is better to error on the side of caution instead of assuming this 
> will always be invoked in a safe manner. I will add a read lock for the 
> domain list.

I'm not firm enough in RCU to be certain whether acquiring that lock is
permissible here.

>>> +            {
>>> +                if ( xsm_console_io(XSM_OTHER, next, CONSOLEIO_read) == 0 )
>>> +                {
>>> +                    console_rx = next->domain_id + 1;
>>> +                    printk("*** Serial input to DOM%d", CON_RX_DOMID);
>>> +                    goto out; //print switch_code statement & newline
>>> +                }
>>> +            }
>>>   
>>> -        if ( next_rx++ >= max_console_rx )
>>> +            console_rx = 0;
>>> +            printk("*** Serial input to Xen");
>>> +            goto out;
>>> +        }
>>> +    }
>>> +
>>> +    for ( next = rcu_dereference(d->next_in_list); next != NULL;
>>> +          next = rcu_dereference(next->next_in_list) )
>>
>> This looks like an open-coded continuation of for_each_domain() - I'm
>> afraid I'm wary of introducing anything like this.
> 
> Not exactly, for_each_domain() always starts with beginning of the 
> domain list and walks from that point forward.

Right, hence my use of the word "continuation".

> This open coded version 
> stats at domain d and walks from there to the end of the list. Which is 
> why there is logic below, which uses for_each_domain(), to walk from the 
> beginning of the list until the next domain with console_io or the 
> hardware domain, whichever occurs first.
> 
> What I did not want to do is potentially waste a lot of cycles doing 
> for_each_domain() with a continue until it reached the current domain 
> and then start checking for the privilege.
> 
> I could take this and introduce a new macro, for_each_domain_from (or a 
> better name if there are suggestions) and use it here.

That's effectively what I would like to be done, yes.

>>> +    {
>>> +        if ( hardware_domain && next == hardware_domain )
>>>           {
>>>               console_rx = 0;
>>>               printk("*** Serial input to Xen");
>>> -            break;
>>> +            goto out;
>>
>> Since you use "goto" anyway, this wants introducing a 2nd label (maybe
>> "xen"?) ahead of the identical code you add further down (immediately
>> ahead of the "out" label), to avoid code duplication.
> 
> Ack.
> 
>>>           }
>>>   
>>> -        d = rcu_lock_domain_by_id(next_rx - 1);
>>> -        if ( d )
>>> +        if ( xsm_console_io(XSM_OTHER, next, CONSOLEIO_read) == 0 )
>>>           {
>>> -            rcu_unlock_domain(d);
>>> -            console_rx = next_rx;
>>> -            printk("*** Serial input to DOM%u", next_rx - 1);
>>> -            break;
>>> +            console_rx = next->domain_id + 1;
>>> +            printk("*** Serial input to DOM%d", CON_RX_DOMID);
>>> +            goto out;
>>> +        }
>>> +    }
>>> +
>>> +    /*
>>> +     * Hit the end of the domain list and instead of assuming that the
>>> +     * hardware domain is the first in the list, get the first domain
>>> +     * in the domain list and then if it is not the hardware domain or
>>> +     * does not have console privilege, iterate the list until we find
>>> +     * the hardware domain or a domain with console privilege.
>>> +     */
>>> +    if ( next == NULL )
>>> +    {
>>> +        for_each_domain(next)
>>> +        {
>>> +            if ( hardware_domain && next == hardware_domain )
>>> +            {
>>> +                console_rx = 0;
>>> +                printk("*** Serial input to Xen");
>>> +                goto out;
>>> +            }
>>> +
>>> +            if ( xsm_console_io(XSM_OTHER, next, CONSOLEIO_read) == 0 )
>>> +            {
>>> +                console_rx = next->domain_id + 1;
>>> +                printk("*** Serial input to DOM%d", CON_RX_DOMID);
>>> +                goto out;
>>> +            }
>>>           }
>>>       }
>>>   
>>> +    /*
>>> +     * If we got here, could not find a domain with console io privilege.
>>> +     * Default to Xen.
>>> +     */
>>
>> "Default to" is a little odd when there are no other options.
> 
> Fallback to?

Yes.

>>> @@ -538,31 +594,37 @@ static void __serial_rx(char c, struct cpu_user_regs *regs)
>>>            * getting stuck.
>>>            */
>>>           send_global_virq(VIRQ_CONSOLE);
>>> -        break;
>>> -
>>> -#ifdef CONFIG_SBSA_VUART_CONSOLE
>>> -    default:
>>> +    }
>>> +    else
>>>       {
>>> -        struct domain *d = rcu_lock_domain_by_id(console_rx - 1);
>>> +        struct domain *d = rcu_lock_domain_by_any_id(CON_RX_DOMID);
>>>   
>>> +        if ( d == NULL )
>>> +            goto unlock_out;
>>> +
>>> +#ifdef CONFIG_SBSA_VUART_CONSOLE
>>>           /*
>>>            * If we have a properly initialized vpl011 console for the
>>>            * domain, without a full PV ring to Dom0 (in that case input
>>>            * comes from the PV ring), then send the character to it.
>>>            */
>>> -        if ( d != NULL &&
>>> -             !d->arch.vpl011.backend_in_domain &&
>>> +        if ( !d->arch.vpl011.backend_in_domain &&
>>>                d->arch.vpl011.backend.xen != NULL )
>>> +        {
>>>               vpl011_rx_char_xen(d, c);
>>> -        else
>>> -            printk("Cannot send chars to Dom%d: no UART available\n",
>>> -                   console_rx - 1);
>>> +            goto unlock_out;
>>> +        }
>>> +#endif
>>> +
>>> +        if ( (serial_rx_prod - serial_rx_cons) != SERIAL_RX_SIZE )
>>> +            serial_rx_ring[SERIAL_RX_MASK(serial_rx_prod++)] = c;
>>
>> This is Dom0's buffer; I don't think sharing with DomU-s is correct.
> 
> I would disagree, it is the hypervisor's buffer that it decides to share 
> with domains it trust. It just so happens that it always trusts the 
> hardware domain. This is why I explicitly changed this to the XSM call, 
> to express that when the system manager, by enabling this privilege on 
> the domain, has decided to trust these domains to have access to the 
> hypervisor's buffer.

I don't think such trust can be assumed to allow the domains to see e.g.
each others root passwords.

>>> @@ -717,6 +779,8 @@ long do_console_io(
>>>           rc = -E2BIG;
>>>           if ( count > INT_MAX )
>>>               break;
>>> +        if ( CON_RX_DOMID != current->domain->domain_id )
>>> +            return 0;
>>>   
>>>           rc = 0;
>>>           while ( (serial_rx_cons != serial_rx_prod) && (rc < count) )
>>
>> ... assume that by the time this hypercall is invoked input focus
>> hasn't switched. I think there's no way around a per-domain input
>> buffer, which of course would need setting up only for console-io-
>> capable domains.
> 
> Let's explore the exact concern here, the scenarios as far as I can see 
> it is as follows.
> 
> A person at the serial/console types keys for the current console domain 
> (domA), then enters the console switch sequence, switching to another 
> domain (domB). DomA's CONSOLEIO_read hypercall arrives after the switch 
> and thus is not sent the rx buffer contents. Then domB's CONSOLEIO_read 
> arrives and then because `serial_rx_cons` and `serial_rx_prod` are not 
> the same, domB is sent the bytes that were intended for domA.
> 
> While a per domain console_io buffer would address this issue, I believe 
> there is a simpler solution that can be extended depending on whether it 
> is acceptable for the undelivered bytes to be dropped or not.
> 
> Simply upon switching, if serial_rx_cons and serial_rx_prod are set the 
> same, then no bytes will be leaked to domB from domA above. An extra 
> precaution could be taken to zero the serial_rx buffer. If guaranteed 
> delivery is desired, a list of buffer remnants could be drained on 
> hypercall and console switching.
> 
> IMHO I believe the reality is while there is potential that the scenario 
> could happen, the probability is low. Doing a per domain buffer will 
> always incur the resource overhead even if the event never happens, 
> while the above approach would only incur the resource overhead when the 
> situation occurs.

Which, afaict, would then result in stuff typed in for one domain being
discarded, without there being any indication how much of it was discarded
(and hence would need typing again).

I don't share the resource concern: If an admin wants multiple domains
to take input this way, they can't assume this comes at no price at all.

Jan

