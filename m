Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 914F97567CC
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 17:24:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564688.882295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLQ5X-0001Oz-J6; Mon, 17 Jul 2023 15:24:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564688.882295; Mon, 17 Jul 2023 15:24:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLQ5X-0001NA-GF; Mon, 17 Jul 2023 15:24:39 +0000
Received: by outflank-mailman (input) for mailman id 564688;
 Mon, 17 Jul 2023 15:24:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hD51=DD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLQ5W-0001N4-Co
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 15:24:38 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061a.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09602ff2-24b6-11ee-8611-37d641c3527e;
 Mon, 17 Jul 2023 17:24:36 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8458.eurprd04.prod.outlook.com (2603:10a6:102:1d9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 15:24:33 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 15:24:33 +0000
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
X-Inumbo-ID: 09602ff2-24b6-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jZM/uUKVdguBYJ7ZqbFHJhK6bYjmm1aaXuLtt6wVAMVILnVa7SsMZ0FhxYafeLPKeV69JsGknLvUg3hFSb3Qx4l7CScwF5QNwqtZPV1sYJ42vYvr3+oXbLwtkFjXVhfqEzfp/EusQq/lfg9Fyvr3Xe0fN+hkqwks42S8uqvB8BpOcuAFPDQoIixx6bVIW3zERyvyCdFUIhm81vNP1opYBHXfWDu4hNmmh7ozkTeGnPLhOwh2ykFn5HqLfbpRz1z6XcW8FHstXG5wo7wKuJoDapYrELwuuGwcp5PUoC3+HfDRrzBY0mrTlJFCL/GJx/4diT6q6cKBVRiIy+RxPbAABw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rETN4uDzWMvRWpBX8XEP1iUCSlsZMqna6EL42TzTo+M=;
 b=n7usenqI0EkbeZ1H3v5+NQ9KjlBEDlaUsQGRy82tGPUBT0enEbLZlGLFmOXg91vHgYkROij0/WATZtopEbNE3B8/fwgBWkxgKeBSwYIp8DL484C5xLlufrkCc7v1Ure3260rI5jR2UnCJXgE/1VKWmn8gcbMLfK3/ZbXa/q6OVgKvnCjH7fJM0MjWCB+/ndr4/EJ1jD6T/uNxhb1xtrybt5H7lH0H3p6PqqeSYDSQWN1JWS7tH+CBrL1Mf3oxf+lp0PvWywCmNkyvMPpIT4GIoIZKYLrxBPqKcOeqJN+N9Mp8zH7LncPHnFdJxmNLBFyQwZfmyWFM4o/f0fl0zJb7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rETN4uDzWMvRWpBX8XEP1iUCSlsZMqna6EL42TzTo+M=;
 b=NPJri493GCPjR9/Aji/J00lOh5jStsC/5Qhkf3WmR3XZMszXJdB5MdhKcFji6at4RnnbY8ai+CXUB5gLbwq6sx8pAN6RsbV6pylYKXkt59t2lPzvslXywY3hukKuOatBl1fZ2jaHhGQSdceVqpcB7RkQ2iCBDWF+NV/dDKgnW0J+FqGIsRlUhgglgNg2BoUl/Yn9JY2m8n6CQPL3mLfmPBLRbOL5MIkqUyIK5PeCGRH9yafcn6A8dXdD62fh7NFURZ1nkxCRB5vBFQ1gIGm8Z3YroPCEmObCz7EeIJqJ9x0rdABcvDki9iJWzQrXNEJ28tGxG5Ueo/IzZKWw78b3Gw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ceb81450-90ff-ffbe-431c-37bc60c7946a@suse.com>
Date: Mon, 17 Jul 2023 17:24:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/2] restrict concept of pIRQ to x86
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <85e59fd5-9a06-48b4-ba7e-81865d44e332@suse.com>
 <98f51b96-8a1c-7f33-b4d3-1744174df465@suse.com>
 <0cd9d94b-0a8d-a3e1-d683-04fac1572750@xen.org>
 <8cdf9179-7b3f-5a52-ff02-8ededbe03e0c@suse.com>
 <4a6bd691-95e1-ad15-1054-b43460c85b32@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4a6bd691-95e1-ad15-1054-b43460c85b32@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0177.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8458:EE_
X-MS-Office365-Filtering-Correlation-Id: b0cfe4f7-b8cf-4f87-ef6b-08db86d9ec49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+HbqkUZInYNIf/mf2QxMTmf/IZgPR+8Kcf6W/PPYpXRxgrM648HQA3WcVaSqcF9zJ4CngbpfzCbg4HlA3C8Q0/Crx5d21GY9Hj8QXFELgfnnfcecZoRvkXMYX3j2aUtyeAHHwedA2cGIR3UnORTOvFVL48PT08czX+GIS2WFAwQwsck8w6zbPMfo4pdwgS1j2KMAQQRp1a17+QJS7gYgUWZH3zJKuHH0IqGM5cP1mtfJkYg1M8cXxg7hoKQg4IkBZ1bl9kFRwXg1Tar+YGI1ibIUaA84iDzNZKW5pBY/DIXr+QqHfGfN1DQPNWUgYnKRiDmMjGrUdXDa2J4XYgzWvTWyxGigA3Tz8iuzD1NkVe3AdD6YY+9iiWjdUQXMIi9tXJFGpzAro8p3GcGpTfTaEYDHvFtJTklox9QcIXOFaN0o7EbGUw0ujfa8qAxzGG0TW0wen/Xh7mFi2Uy/RyHE4yThxFzm3RrSRpq/VgMMjXWfJaT+M5V83QLmIfG190I2Hp1yNzc9APxAzxyUE93A8qmZBS51aFYGypdjIJvOwkBqxvXkcC5S5XbeBSY8GoM8bgUEs4Y1tLFJwznRR9Gt/iHyQSEUzFC7JZUpNkSDNrRxQ8BojgtW+Y8QiqXJz1fYkd2Go8cCHrV1FlqhZWcRsg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(376002)(366004)(39860400002)(136003)(451199021)(54906003)(38100700002)(6486002)(41300700001)(478600001)(8676002)(8936002)(5660300002)(66476007)(6916009)(66556008)(66946007)(316002)(4326008)(2616005)(186003)(83380400001)(6512007)(53546011)(26005)(6506007)(31696002)(86362001)(36756003)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cU02Tkw5dDlqN2FGcXY0WnhoemlFVVBUam1GUFVST0FuRk5CZzEraWdwbU42?=
 =?utf-8?B?aTlrdkptUW05VzM5OFBQcTFTUVI5SXEvdUdVZzNiNlNvUWVtWVZvdVNCTVdn?=
 =?utf-8?B?aVpXLzRGb0JmWndZeHF6L3hDMDZPTGJaaXhlekZHS2c0ZUxCczNINnVTREFt?=
 =?utf-8?B?Z0RWQnhHWGFaT1EyOC91WmJLZmZmT0pNb21RZ0JoaVlkMGNZRkVadWVyZm8x?=
 =?utf-8?B?ZnBEWVF5eHpxTkN3T25BZWlEUkRwZTRJRThCRDI5NVJRUkFOSys0ZzJlQUNK?=
 =?utf-8?B?L0Ric3ZzZjUrdkZHRG5idDc2SVNTNmxjZGJvQkM3ZlJYbC9ETGdyN2o2TEc3?=
 =?utf-8?B?VFlLbElLdVFJMlJQaEFtQmRNOFd4OVpWOXJqbU15bi9UZkZPRTJ2RWYrY3dO?=
 =?utf-8?B?Z0p2cHQ5OFVFV3IrSFJHV2dtOWEvZEc0enVndzJ5VW1FNUN5bmJJQ1pJL0RN?=
 =?utf-8?B?eE8rdCtFOE16VmMvbmZKYmpNUXBKVlk3VlRvRjFnSWhCcGMrOXhpejlrb2cx?=
 =?utf-8?B?ck5uaW9FS0tQVklyY3RTOER0Wks5TFYrTVRqaW55NkdtdWErbFdpQ1BycUt4?=
 =?utf-8?B?Y1AzU3hVeFRIUnZNSDlZR2RQVWR0ZlhqMHNwK1lXTVRjU3Y3YWlhYnp0TUNZ?=
 =?utf-8?B?SEtBT0tGVEwvOXdNVWNmbWl5Y3hIM3lHaEhsaGRKeUszOXZ2cmtFdjNxelFu?=
 =?utf-8?B?ZW11VkpEYXlUVFhneUtTNWdNcjdteVdsQUgyV2VXUnFFSGxBRGYyYmh5WkVy?=
 =?utf-8?B?Wlh0U3B1VS9saFVDMDNiejcyUS9aTm5aV1l5VHpXQWo4VU5OTTV6K2t5YVdC?=
 =?utf-8?B?MllZSTQ3eDgraHdIZWtBSlVtYWlGSmV5dkVhcjRCVXA1ekNJOFlQN29kdEcw?=
 =?utf-8?B?ZkhHSnVLR2VHbDA2OVE1L0NYK0IxbC9ReFZjeWxoNllmY0F3Q2JyQ05aNWZK?=
 =?utf-8?B?NFUyaVI3SkZxeTJma3ZNL3daenBIbXNCVjY4Vi9oNGtyWjZpUEczK2Jqb1Z4?=
 =?utf-8?B?aDNSb2RwZXdpcUJ6ZjJMNkQ0cEl5TkdDVjVDOU1aS1Nvc0VQLzAvRVlidzBO?=
 =?utf-8?B?UERrS0NabytsRGNaMWJvcjJrMXBHb05ndEo3c3ZudThBbFB2R0ZwM0EreDNI?=
 =?utf-8?B?OG9nN1NpWDBqVkZhMkkzczh1a1FXbXJYemxsMW5KWEtOTTV1ZlNrcUtTNjIw?=
 =?utf-8?B?dGl6eUs3VXZLTGg5ajhYSVpPSHBYSVVyS2dIR29XRndSUlZWN3plbnhmTGdG?=
 =?utf-8?B?RHBlT2toUHFiUHVINDkrcDRNTXhaUldVYzBSYUl3Q3FTbkhGRXppY1lpSjFC?=
 =?utf-8?B?cXp2L0ZobWhleU8rci9mR0ZKMHJuQ0hGbVJLUHc5Y1h0Z1hLWVZzekJQcGht?=
 =?utf-8?B?dlJhckZpTEhkWTJIcFhZSElQcTZiZDE5Q2xzb2taVVY5S0hEdFoxL012eW9y?=
 =?utf-8?B?dlZORHI2ZndNby8wNjNKY2dFbVZHOHpXSi9MQzFqS3dRY3MrQWF3d3M0VU5L?=
 =?utf-8?B?RmpLYTlicEVJQnhLY0I2SWptclVHSE9qOWp4ZitETjdZODhTdlJrOFJzQlZR?=
 =?utf-8?B?YXVoK2l4WjRKYVlOSGtaK0R4L3FWVDlMOWdEc2pNMWd2NE9QZDBob1djL0Nj?=
 =?utf-8?B?ZVV6d1p5NzlyQXFzMjQxdldDK2xPS0RJakt3YzlWT2QySHNSVTcrU0xBVVJU?=
 =?utf-8?B?cWZHN2JENWlHRm85QUw0WjJxckNkSDh1YXNWemw0WUpDSFdQRW94VzNNWWN5?=
 =?utf-8?B?Zjg5dmI5UkxHMkI5ek5kTzc0MjB5L3RYY2UxdVRUcEhibnJNNk5KK0YxcXBL?=
 =?utf-8?B?MjNnM1dFajB3c3RQaTFnQjRtNk1uR3ZSYjBJUnpSUFgwRlEyR1NYQ0tRamJC?=
 =?utf-8?B?R0x0QlUvaW5vc21sMTdjZGV5QjFYSFZORFRxaitzdzJxaGY0NzVja0pyOFpV?=
 =?utf-8?B?cjRFMlhTQUZMOXh4clIzelBDcWdzQzBuSmpuMGNsbUZ1ZTBEZ0p1NEdldnBq?=
 =?utf-8?B?eXBmN1F4eElIQ3p2MzJQR00wWmRLWXl5UlV6eGd4bFRaemNITldYancraHph?=
 =?utf-8?B?Mm56REx2SnI0Zi92aWlGYWZWTnU4dnpkNGpKTW9IY2RlQ3A4YkE3WU5EaytQ?=
 =?utf-8?Q?upzshYF1GVZADIz3KmBLT3Sy2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0cfe4f7-b8cf-4f87-ef6b-08db86d9ec49
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 15:24:33.4426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mmVIM65u1be/uhwi6pRVilru4x0s3IQKt2lomAvfpVj3+jby5+oGU0zAEX8AOhRJIxX7827lFOedVu/bR4G72Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8458

On 14.07.2023 11:28, Julien Grall wrote:
> On 11/07/2023 13:29, Jan Beulich wrote:
>> On 10.07.2023 22:59, Julien Grall wrote:
>>>> ---
>>>> I'm not really certain about XEN_DOMCTL_irq_permission: With pIRQ-s not
>>>> used, the prior pIRQ -> IRQ translation cannot have succeeded on Arm, so
>>>> quite possibly the entire domctl is unused there? Yet then how is access
>>>> to particular device IRQs being granted/revoked?
>>
>> (Leaving this in context, as it'll be relevant for the last comment you
>> gave.)
> 
> Sorry I missed this comment.
> 
>  > so quite possibly the entire domctl is unused there?
> 
> You are right, the domctl permission is not used on Arm.
> 
>  >  Yet then how is access to particular device IRQs being granted/revoked?
> 
> At the moment, a device can only be attached at domain creation and 
> detached when the domain is destroyed. Also, only the toolstack can map 
> IRQs. So we don't need to worry for granting/revoking IRQs.

Thanks for clarifying.

>>>> --- a/xen/common/domctl.c
>>>> +++ b/xen/common/domctl.c
>>>> @@ -683,11 +683,13 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
>>>>            unsigned int pirq = op->u.irq_permission.pirq, irq;
>>>>            int allow = op->u.irq_permission.allow_access;
>>>>    
>>>> +#ifdef CONFIG_HAS_PIRQ
>>>>            if ( pirq >= current->domain->nr_pirqs )
>>>>            {
>>>>                ret = -EINVAL;
>>>>                break;
>>>>            }
>>>> +#endif
>>>
>>> This #ifdef reads a little bit strange. If we can get away with the
>>> check for Arm, then why can't when CONFIG_HAS_PIRQ=y? Overall, a comment
>>> would be helpful.
>>
>> As per the post-commit-message remark first of all I need to understand
>> why things were the way they were, and why (whether) that was correct
>> (or at least entirely benign) for Arm in the first place. Only then I'll
>> (hopefully) be in the position of putting a sensible comment here.
>>
>> One thing is clear, I suppose: Without the #ifdef the code wouldn't
>> build. Yet imo if things all matched up, it should have been buildable
>> either way already in the past. Hence the questions.
> 
> Right, it would not build. But does this check really matter even in the 
> case where CONFIG_HAS_PIRQ=y? Looking at the code, it sounds like more 
> an optimization/a way to return a different error code if there value is 
> too high. For the domctl, it doesn't seem to be worth it, the more if we 
> need to add #ifdef.

I wouldn't call it an optimization. The check has always been there, with
b72cea07db32 transforming it (largely) into what we have today. In fact
in an initial attempt I had gone further and also #ifdef-ed out the
pirq_access_permitted() (and iirc the pirq variable altogether), seeing
that without HAS_PIRQ the incoming field can only sensibly hold an IRQ.
But then I thought that this would be going too far, leading to me
undoing part of the change.

If we dropped the check, we'd start relying on domain_pirq_to_irq()
(invoked by pirq_access_permitted()) to always fail cleanly for an out-
of-range input. While I think that holds, it would still feel a little
like making the code (slightly) less robust. But yes, I think doing so
would be an option. (Still I also think that returning EINVAL for
obviously out-of-range values is somewhat better than EPERM.) Yet then
...

> With that, the rest of the domctl should mostly work for Arm.

..., taking into account also your clarification at the top, I wonder
whether we shouldn't #ifdef out the entire subop.

Jan

