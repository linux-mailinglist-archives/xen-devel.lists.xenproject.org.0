Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D664B75213B
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 14:26:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563130.880150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJvO9-0006pX-JD; Thu, 13 Jul 2023 12:25:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563130.880150; Thu, 13 Jul 2023 12:25:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJvO9-0006nH-G9; Thu, 13 Jul 2023 12:25:41 +0000
Received: by outflank-mailman (input) for mailman id 563130;
 Thu, 13 Jul 2023 12:25:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0tL6=C7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJvO7-0006n8-5Q
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 12:25:39 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0614.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f675573-2178-11ee-b239-6b7b168915f2;
 Thu, 13 Jul 2023 14:25:37 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by PAXPR04MB8302.eurprd04.prod.outlook.com (2603:10a6:102:1ca::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Thu, 13 Jul
 2023 12:25:35 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Thu, 13 Jul 2023
 12:25:35 +0000
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
X-Inumbo-ID: 5f675573-2178-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QldQrssk/g1Ii6ynhl8mPfdBXj0z2T6Xa+DXUgbGpB4y4MzZ1zmAI/pywDC5BdEph5YI4iqpD5fxElw3f4mUKPibSm+lopCprQ56Mzcma3juzbaKq7D6BYmBU9WkL0yYSNc41OewCzDR0YwgpUUe6dOa6EVzhWQKfxuKMr0G81h6IWrLY0l4HgiYIO91bl3c5DiueiGbAuTwr6SjNyv+3JZvLQDpGh0gIA0K5MRqEskXzXvsT/cEC3Ogfa3Y/RknmCL47uoVJ7axjLnFStLHmNaHqUIAWrTIwA0FgwlUZuI4w/MWfaq31gGhLngSfP6hqPcqmidZLuFFoqn5vyf0OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WGInQ63RH9BoVszkg+YVbqNi9E+CNcqXFnDAW7bqnzc=;
 b=YO4TSHUSNy/fJiPbiHSbqjmnQDm/4btOsc4p76StyKQB0La445ke2jduliBYMQx1N5pAHtW0KFNa1Ctya3Ow2Kom7sOKbbAIrYgnqD9Q1TubTKD6w3hCjOvMccBwmaxgGhuuV1mHubX8703x7SBYuulotI2RmHsN9AGcCYnJRROms/3iXiQNshMerHzKiwZnRY/JnPmi5Gk27Z3YoU8vtGsjgOv/Psp/85jcLet5Gogp1HSlA7/fXedElsnJlb0Awc/nxM7hKqNoVb4V1KySxcYACHtdOsLALpkIVrjk6Ax1jn9zoDh6ihf729wiUxctVzB1u/KSrDw2pdMf0ijByg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WGInQ63RH9BoVszkg+YVbqNi9E+CNcqXFnDAW7bqnzc=;
 b=ZCMu+2J6htC/gJaHmS8lmC01709TyPz4YwDNE6qokmiSNxce5HOPq59qMAXFCpoOP5g+YYIHRoNruNvyzGAJZIgG7ZckO/C7rDDfiy7BtfFQl4FPlJaFpm/NWyjHq5Oc8w3MrQL0y32Sv46IQs1R9U8YVIGzGGjiJ/K9sCs0xGbo4/NGRCA5vhczoyt+YWrDLflh+gFtzySLOtpq0tI46Nk6Kf4R+oY5/MR/miN0ReZJfo5XRqB1fLaMFShmi8tLjXw3s+COYKx14wDYoZpCyt+m1pzc8ALRkWqmVUP/+titZkpMcxyDjIFbhYXM45CK9UY6rP31jvNkhQ+Jiu5IkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c7a8cd09-fbeb-2453-3762-1bedb9cbecea@suse.com>
Date: Thu, 13 Jul 2023 14:25:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ns1650: refactor interrupt handling in
 ns16550_uart_dt_init()
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
References: <cc5a08056abacdbb6d6509b56716eb45467307bb.1689240611.git.oleksii.kurochko@gmail.com>
 <a385a17b-a60c-d770-e044-af64273371d6@suse.com>
 <d05c5fb0-63ab-4368-ed3b-bb06b242808a@xen.org>
 <27c323353ffd231f778b48b1cf6bca8560c7734a.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <27c323353ffd231f778b48b1cf6bca8560c7734a.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0140.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::12) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|PAXPR04MB8302:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e9610c7-d845-4212-e61c-08db839c423a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8DStwLC+rrnt+8CzX2jXpjF9tHbNcMHcYbOM+tkWWGUlt8V0sZf+83loFhTGuhnhwmnce+VBjHYAMKaLOVgSTHrIg7ynH5eJaopkhG6kOVRq+JyZnMgbgvwXySw7NHq/Y3czd0SVrRnvE0IctOFabkfqWM58jwVNSQm6rliBvRj6MyIKquct4pHz7iins5JEh7FtjNBKZKHNnEcbTNTkz9i06EOwqQWABhQ+fMKvd/R53TZXGNw2SPXvRVImKApgpuF4/2I4Yy6nXFInlHFAWqhakjDQzsDUbtpmJiaeB1A886BGBF4mbJK33giBwuyj7V9KmTdsthzX5KAAXQb5GX3JEombiPpP2y20pYxFGMkEYkmhDHbXuWhJe1ehcCKyTKlDW+y6im0jWpruommnWJbJZToGu9Pu3Tn/UympD52JO6LE1ryL6LeADa3v+80H5WBLPo+Ar9+7Oama6L2oJdmbRYCDXdEaNu1V8lLSrEzKbPwhoi8OB7jao2A2lq7MJkB3tJU9xyrm4MhdbW0qKjLvX/H/Yd9U3SKyh3qbu/RuuvxrgEJev5kfsKE91hRVR9blHUEzGwPs93MczEKDru3sF6ziDM7/4UXhMMyXeVo1n/ltz860EKcfRQbEb4N5GM4SKH1jjt2RuZ1qipkt7Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(366004)(376002)(136003)(346002)(451199021)(66946007)(6916009)(66556008)(66476007)(4326008)(54906003)(478600001)(86362001)(6506007)(26005)(31696002)(53546011)(186003)(36756003)(6512007)(6486002)(41300700001)(38100700002)(2616005)(8936002)(8676002)(31686004)(316002)(2906002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L05nU0lpRDhKVHdtams4WVZCemFSNC9QZ3JXM1pQS09SL3J4bWFCS2hRdjd6?=
 =?utf-8?B?RlVkWVlsOXFHUTVZSUJObmZQOGhiL3RXenVEVGlNNXNEMGpyamFHZ0FNazBD?=
 =?utf-8?B?UWRvck1KVU8zZnZKVnM0UjJIOTZ2WGEyV3hYRjlka3VyMDRRSGdNc1psN3dZ?=
 =?utf-8?B?MEx6TDNtdkpoUno2bC9NZ2g0R09iek4rUVBUbk9FeUQ0TU41RjJldHpzdWFo?=
 =?utf-8?B?K2RpZGRZTElYMkgyWGU3STBSTzdMNzRYNHRWVDRoN1FtaUc4STZUQm0vVFlr?=
 =?utf-8?B?UXc1SjZaYjVTQjBYU3o0d1NGS2VmQ0FJQjk0aWIxM1lmUmtpZmU5dzhUeGVx?=
 =?utf-8?B?SHNEb2k1RmJIQVc4YnNoaTlCbmxjMitvVGQzdUg1MnRhOGhDU0JQbzJrMW8y?=
 =?utf-8?B?MEVzYzYwTTdod0w0RDFVSTVkYVVEcEhGMk1yTmVLR3RLd0lra0VWKzhmZGhI?=
 =?utf-8?B?UVNWZmM2RG5LM1JMVm5sMkZ5dkdMUWFWdEF2eDE0b0k3VDMxVzlwWXAyVDRK?=
 =?utf-8?B?dVIxU0hOZFQwWGllQkQvY1pjaVQ5QkR6TFh1K2FFVG1YV0UyOS9SVDBwRlJt?=
 =?utf-8?B?M2c4WFBsaUlqWW81VjgrbEh0NlhWS05RVENNMVZZNlBBT0R4Q3YvVHBtRWU0?=
 =?utf-8?B?S1BwSnQrZEJQSjNzWkpLRUVLMnBTV3ZwZUQ5WkxFaXVsS2tUL2xRRHg4MFF4?=
 =?utf-8?B?em5CRFlVQStkT2o3VGI4SU1SQ0Ryam40UFdOZEM2WUtFNnhnNnlpWEgyM3VS?=
 =?utf-8?B?TmZZTStucG9PSVJIVWwrUWFLU2VidCtZRTlmUThKZWlLeHpwMzZ1dGV4V0pm?=
 =?utf-8?B?dlRyZFZMQlFlaHZmbW1qWTJCcjAvWk5vM1pNTDR6QWhCU2VGTlJHTWhPNHNo?=
 =?utf-8?B?Q1NNUk93YkhHcVlKdStqbVZPNjFqbHlSbU9KbTdOUkpvb2t6UnBYRTVDTjF6?=
 =?utf-8?B?MThvQUVmR0hVamNFQzdSUy9URnVSQWNoRUxrS0lYaVdMMFNrdjloZ3l4OTZi?=
 =?utf-8?B?T3VWY0JRWWg1a1hVK1BUR29YV1hCamM4dGN6ckpiRnFWcTRJNFdyMzUzaUF6?=
 =?utf-8?B?SGsxMXZyUHlCZWttMUNvUGE4bThrdllGcUd2eEd1RjVhOUtaaDR2SUw1MmVp?=
 =?utf-8?B?aFU5M240Z0g2S1lhTGJUVGY0M1FnVjZuTGI2UXdockJwclFyVmZaSk1tcTRn?=
 =?utf-8?B?akFzS0orVWtya2FqVkxHaHdoTldicU92YXRrbS9oZzhUc2dKUTArMmYxalV4?=
 =?utf-8?B?OXB5KytiT0dVaEhnTUFmRVBGVUdIOTZTQ0lzMGUxK3ZGb2VNNmdSbFBlazdI?=
 =?utf-8?B?TTFrZHA1QWpLMGZFbHpZcm5FNHpuOTRoT2hURTRlQ1BzVkxXQ0tJQVBidTRk?=
 =?utf-8?B?bmlsZnYvaEJ0Rmw1VTB4NUdaTERKcHBmSW16a2lDRS9jRCtEbE1DdythVkxW?=
 =?utf-8?B?bFJwVjh1N1dXSXcyMkJEQ3ZjRzBTeVFvd2Q0NDA0Y2NncGh1UVVtWjkwclRH?=
 =?utf-8?B?aXEwUEdlK3ZtRSsxNDg1UHpHR2hVSGl5MXdGbXhRNjNQWVNpL0dJQ3ZNZS84?=
 =?utf-8?B?MnltSGppalk0dUJqYVd5QkhGcXNEbGd3WWFRaUw0L1lQUXFEKytrSVZyaFBz?=
 =?utf-8?B?TFBMYkVueWtEQjVWQjhHNGxQblFoeXBNcmFiQzYrZFJmV2lGY3M2aXczSC9r?=
 =?utf-8?B?VzdWb1MwamJyMmhFb1Z3T3pmaWErdDBHMlRXN3BSdnpUbHVGU0E0Z0t2U211?=
 =?utf-8?B?QUxLYzlLeS94K0I5TmNnendLVnlCQnBPWkNhcERXdzgwQVptV0NSMXA1dE91?=
 =?utf-8?B?STRIREhER1VCVC80ZVJkdURINng0VUxJM2hTdldjTmVuUUhydGFQWGVVUGMy?=
 =?utf-8?B?L0FvQnd3VUd1NEpmdjBWaFZadHJzSE5hcjdYYWZtQ3VjMmZramZKYXUzVmtY?=
 =?utf-8?B?S2N0OUczaG4raFBManEvcFZLaDA1VzJkWm8xUmYrdjViRG5vV0tNTEZnS2ty?=
 =?utf-8?B?eCs4MU9WT2QzTHMzY0hYdmZ3cmZjSTFUWlYva25qRldadERJM21paUNCeXRL?=
 =?utf-8?B?REpOSVdoRUgzWEdya0h5NjE4V1BKQjRmRUE3RmZKSllVRjRka0tXRnlDdkRV?=
 =?utf-8?Q?rp80AZCDdAHQQxrHq/ShEj8Tt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e9610c7-d845-4212-e61c-08db839c423a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 12:25:35.3223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ddFD6rHqcqEb7KVOy0Hcptv3fz/8DZhfqn+/wMcXfpAGi51tlWFDIu7/F6QE5BUwej2UaTmY3oS92mrpAoXe+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8302

On 13.07.2023 13:55, Oleksii wrote:
> On Thu, 2023-07-13 at 11:13 +0100, Julien Grall wrote:
>> Hi Jan,
>>
>> On 13/07/2023 11:08, Jan Beulich wrote:
>>> On 13.07.2023 11:30, Oleksii Kurochko wrote:
>>>> --- a/xen/drivers/char/ns16550.c
>>>> +++ b/xen/drivers/char/ns16550.c
>>>> @@ -1791,8 +1791,16 @@ static int __init
>>>> ns16550_uart_dt_init(struct dt_device_node *dev,
>>>>       }
>>>>   
>>>>       res = platform_get_irq(dev, 0);
>>>> -    if ( ! res )
>>>> -        return -EINVAL;
>>>> +    if ( res == -1 )
>>>> +    {
>>>> +        printk("ns1650: polling will be used\n");
>>>
>>> Nit: Please don't omit one of the two 5-s here.
>>>
>>>> +        /*
>>>> +         * There is the check 'if ( uart->irq > 0 )' in
>>>> ns16550_init_postirq().
>>>> +         * If the check is true then interrupt mode will be used
>>>> otherwise
>>>> +         * ( when irq = 0 )polling.
>>>> +         */
>>>
>>> I wonder in how far that's actually correct outside of x86. On x86
>>> IRQ0 is
>>> always the timer interrupt, but I'm not convinced something similar
>>> can be
>>> used as kind of a heuristic on Arm, RISC-V, or basically any other
>>> architecture.
>>
>> I wondered the same. On Arm we are fine because the UART will be an
>> SPI 
>> which starts at 32.
>>
>> That's part why I was suggesting to use a define. Because we don't
>> have 
>> to hardcode the poll value everywhere.
> Probably then it would be better to introduce 'bool is_polling_mode'
> inside struct ns16550?

Perhaps. If I was to make such a change, I'd probably convert intr_works
to a tristate. But a boolean will be okay; if I may ask, name it just
"polling" though.

Jan

