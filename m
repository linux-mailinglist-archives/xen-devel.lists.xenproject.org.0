Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C565D7D8208
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 13:52:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623747.971893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvyu7-0006ah-Kv; Thu, 26 Oct 2023 11:51:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623747.971893; Thu, 26 Oct 2023 11:51:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvyu7-0006Xl-I2; Thu, 26 Oct 2023 11:51:59 +0000
Received: by outflank-mailman (input) for mailman id 623747;
 Thu, 26 Oct 2023 11:51:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvyu6-0006Xf-Gj
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 11:51:58 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0605.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10179cc8-73f6-11ee-98d5-6d05b1d4d9a1;
 Thu, 26 Oct 2023 13:51:57 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7891.eurprd04.prod.outlook.com (2603:10a6:20b:237::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Thu, 26 Oct
 2023 11:51:53 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.008; Thu, 26 Oct 2023
 11:51:53 +0000
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
X-Inumbo-ID: 10179cc8-73f6-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FPAl8pORgYKSm2nqC8pLfkA2flEd9BTCdbJcFVxLdLZKWqosIp3BkaoM9vvkCr7/OP6ZEcTPYIdS1BjUfio19LliKunysEKNvvFiSTrxOPe0ixnK/w8xFRlDLClMttCRlnb/RzwJv8FB+qj5yDlroJuLmdvkaBr0V2rb/48aT3shp5qHm1NAUAsFSfuk9g86yeg8gEBU6/Y1/7qSnV/1fyusqMFNsyInsF41s37724Cg3ifaj5m2rJiPJCJY+OWW6FoNGnRrLnnaSYP0j5ZrmYqVFt+YYZ0OmB1MEbhIxzqUBCZUltp50xVC59o1ur1MwZMKBs6qySV7/exabjw3/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JfcuZRtPsYSUnyW/22vNJGRa0kD7hx/z6RqcxLhjiOE=;
 b=i1YVgKNvFljK4zTEQdC8OmQvuOiDe2Egpt1QWyFDacfEvOuDtz1wFCjetc3nS6KjWrXL/IzIX7ouTlheCgtL2d+G5w4Famxd6CIlLuIOvaU6SjGgOa6h67N2dCHsZXIbSqJaQshhrTfsBU6Hb9ckYSLCb0vMXoe9Sjt7F8FR6L7AWtQewnSGSAcZqQDe+axB7FXnyXAiRCO/Gv4cuzkjHcmZY/r+pqNpT9C+pE5t73hJW4L1I2xQnImpImHGoEC5qoF8OFnK0WkfwhXMhl0KTaEEe05/U/Kax5wwoxtGEmBow+AShsCGvGFoBOONg4LkUI3hnledqD1mzwuJDyGERg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfcuZRtPsYSUnyW/22vNJGRa0kD7hx/z6RqcxLhjiOE=;
 b=uZoLAoRhYs7Yi4hlPy0PcG7ZGAHAhcqN4x6wQ50l6TJCmquX6FKnZNkbOPjba4ARfe82JcP6ch+hmkWEgFGLEIJ35VmcitQazPzaclzo20VzPURbEy+VnyJaqh5mLh2f3bwLf0F9OxW8mcvrtuCgi3Qj5FCy6/IAPdN+uALPP8EEuImbg7hdeF/2+nLfIuRb6avghoF7lVl9AuZD6nOFxb8c7BKFBiYtsSkXaJcRVg7yaGpBjTeqvM/QMIAVsYhJ2tNin2I+0Fnenmt8L/IitQ0ntaB5kx8zr+/8koXF70SWZZiLCXdPlZUlogAUaU6Ozf78gEzMXchdVDlM7xg80g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c81a8275-ecfd-7598-c119-ed83b156c0e5@suse.com>
Date: Thu, 26 Oct 2023 13:51:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] x86/hvm/dom0: fix PVH initrd and metadata placement
Content-Language: en-US
To: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20231026064543.43369-1-xenia.ragiadakou@amd.com>
 <ac7e9bac-6d74-a5bf-d703-3c5455e581ea@suse.com>
 <7712c60b-4f89-483e-89e4-7ac8f4d0311e@amd.com>
 <809115b1-2a47-583f-2d04-72a5a21ee7da@suse.com>
 <c107d63c-25a3-4f17-a5e8-7ec3ccd94ce3@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c107d63c-25a3-4f17-a5e8-7ec3ccd94ce3@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7891:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fa71924-57e9-4a9b-0a34-08dbd619f298
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xXkcg/V/3vXAXaZGOrw4WIFnliUcWEUJh7L99wlt5q/7rpPKmpRrdMDYyUOx9C7iNdsgeK5UqPPKZ8sTxAuwrIOVW84ANZNJmmKtGcDuqc3RKtYagtc5x0DmrJ6n+DyycALH/F0VcOvcLVFUEC6T1AzTIKQ7tp08RvbYybMo+aEk58u1Agkwez4ybk1egQXHMbruSnojfvzpntSU1R7MS+2XT3lPPSo4129KsskrL79wI/vKJxvjZudWhTKxOR0hs6G88gMr+GD6A0Eq1nsNYB9xsAB6I/WwItgJxqh405pTUdCIwoa+oA0HydyhgoA1K7MSyp+7W8TpOO3/wRq1EfWdeizXMGwha0Q8ae3NH/Ma6KUsBlZs2ERksTEyylMrMcECahlLzHZm52x6+Iw6TeyNmJZwLvH0ots+q7MI1DGivjMuxqzUdGz97cX9bJUChUOHZNQ3GY4iem9WT3QF0uKLhzfrhXY7m+rvS4UtIeAqTkMzUwGtL+YkIW5HVG+chfl09zOdKmhxJJTuFkab9XjAwKD0u47oop/a7xAggrEXaR+i5EUb3dWMyEo9FVK6k3IDLa+dgx3C+ZQNjq9FuBz6ZmEueLyZhy+w2+6gGGTBcGlFD4Ek0nSH/fX94/lpc5KkaRpPhRCNUFtOZxFoDQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(366004)(346002)(39860400002)(396003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(8936002)(8676002)(4326008)(83380400001)(316002)(54906003)(6916009)(66476007)(66946007)(66556008)(6486002)(2906002)(31686004)(41300700001)(5660300002)(478600001)(31696002)(6506007)(66899024)(86362001)(6512007)(36756003)(2616005)(38100700002)(26005)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2VRNnVDTDNYNzR6NWlYWjNhNnJ6T3FncXRIRm93TlFLc0tjSmQrcUQrL2tX?=
 =?utf-8?B?ZmU3TjdrV0E3NWd5MFNZUW0rOXQ3MTE5dUNNcDRRZUNDY2ZDM0lmcHpxZjJG?=
 =?utf-8?B?Umx0YXkxdE1lK3ZEeHBxTFNxb0VpNU9Nc1RtNzhodVpITWRhbGxYSXdHcFFx?=
 =?utf-8?B?M1BZZ3VVNU51a3E3NGdCeFQxd3gvV1hlbzdISGZhUURsaEhCdytxYURrdmFs?=
 =?utf-8?B?S2ZCYUV0bUZod0YvRzZnMWxZdmlNaGp3VEl3Ukt3R3VpZVNkNTJhVERkKzNW?=
 =?utf-8?B?QVpSQTQ5RDNQazhnZTFkZ1BYWWlWemo2OGg4eHVKT1d0WVJ3VDJlUS9qL2gr?=
 =?utf-8?B?SkFYanEvNmV5MzVMOUhneVA3dFlhYTIycUkzczhUb2tMNUtsSWdhT1hDSHZy?=
 =?utf-8?B?bWErdUVLTUNnNW1aeGpkbmZyRjFZQTBXL3d4bEZIbW1qY2prU0d6U2ZqUWJB?=
 =?utf-8?B?cTNMd2ZsQzd3dllKS0JpQlN1c3JhUTlZVmUxR3BBT25BWUFZUEhDeHExd003?=
 =?utf-8?B?ZDlBRTFiVGFmM1h4MzZZRmZaZXdZMnBqR0VTVjA2VFdKZ1NWOExHTndJdHhB?=
 =?utf-8?B?WEJvZHpRZENUU2RqNW5Hd1lGcmdLY1c2d09BSW4rRUJ1RVZOOGpzalJaSERI?=
 =?utf-8?B?emhEeGhoajI5Q1JpbHhlR210aVFvSk9iNkVxRE10S2ZPSGlOeUxQZ0ZEakxv?=
 =?utf-8?B?dndGZmdqU1ZKOWdYeTZvQ1NpdGdMZHFVWTlpZjhRVUJyUGZIN1RpbjMxR3NN?=
 =?utf-8?B?WGJzZEJLSldBQWQyNVRYcklqdUVDRGhvb0haT0JEWnRVMmhWWW1oL3Y5ZDdh?=
 =?utf-8?B?TmpEay8yQzgzWFU5Ky95SnUwOUFZK3hvbVBQQSsrU3JFanNFUUxFSEU0RU1y?=
 =?utf-8?B?b01DQTR6STZRTnptS252aENWNjVxa0J0WmV4Y1B5YjgxczhtQU9uOUdKZHov?=
 =?utf-8?B?RGtWRXBhMS9sWk01OHVJRzdxbDQyc2lkZmpPUnpxbmNDUzBlZCtiT0tDc0t3?=
 =?utf-8?B?cnlMckFLZGdwbHdzMU5jQ1dqa280M00zbkU3M1U2Zmloa0ZMZnVZWTRWbVdj?=
 =?utf-8?B?LzNnRmJmeXRwbC9aQUZ0MTJNcmxLUmhUV0ZaZlBXT0lKdExYN1JsUFN5VjQr?=
 =?utf-8?B?emhxOWl6czFtN2Z5MnlPZnBMN1AvWTVMSkN3M0NtTHZvV0pkbjJyQW1GOXRy?=
 =?utf-8?B?WlptYWpMZjcwVDFoYm5KNFNiQkp5MHQ4Zy9xWjZMUzdvU3JJb2o4YXV6bUl6?=
 =?utf-8?B?d2FFb0JGcUgzem54amExcGRDSlQvQjdOWkdVNitQemloeGJsZTkrUC9NU1ly?=
 =?utf-8?B?bUw4V2FmQUQyNkFFVDVDbUk0K0dGZnZ2NndDRjVXTUdMc2c0NysvYkRPV1lu?=
 =?utf-8?B?NlJnQ1FCNjkxS0pJQ1BkVEt3RkJlL0l2S3NYYTZ0cUd5akJvVFhoYzYzTWZN?=
 =?utf-8?B?ZEdMeWV3OWtOTHdiS0s5K1dRd0pPL2hSSEVFbE1JOE5SNEwvelZySzV0dnNu?=
 =?utf-8?B?QWlDUFBXTHNBRXpCWlREcUI2UmVyWU9wTTQvQ1lLME5NVytIMkJSK0tNMkg0?=
 =?utf-8?B?K3VlT1FzbGR5UnJkTm1JNHZnY2ZmRjMrNXZqR0pwQzA3Yi91ZTB5OGw2WG4v?=
 =?utf-8?B?ajlNTmhvcnB3RzNUdzRlaGNzMHJaMDU2cmQ5VEtHZjFQOWxiS3I3U0VHTDZV?=
 =?utf-8?B?N2U5VUFNaGQzMkV0QWoyc2pGS2hLL2gva2ptZXBMNVNnQ0RhR29OazNERHpy?=
 =?utf-8?B?NUZvMjhwWTh5UW0xWmcwVDZVZmlEeXhLTUZJM05UWWZ4V1QrSDBNV29vYlRO?=
 =?utf-8?B?VHh5RDZqMkYxT2RESWpKRUxyczZBZnNqN3NwOWExa2VwQkszdEU2ZmprbkJm?=
 =?utf-8?B?SnNXOEZPUE9LQVB3R1JBZzJRa3Y2MVRZaXBSUDFzK0t5cTFzOFNVQ3ZocmlF?=
 =?utf-8?B?eGd3UnRZNktyQmY5Nkd4bWZhOHNqSWxsMXBPWFF3Rmw3MVNUUGJicG81NFJF?=
 =?utf-8?B?R2ZNTUpHWE15WUFROFRJSTBxcUxZenBtL2FkbGROeTNPQU90YWR6dzJtRkQ3?=
 =?utf-8?B?U0VoY1VIWEN0bldsV3lrdGpURFdJV1hGS1Rod0swTm5vZ21wcE1uYTJWNHQ5?=
 =?utf-8?Q?elg53zUYN5YPXy+/ysZzqdxCk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fa71924-57e9-4a9b-0a34-08dbd619f298
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 11:51:53.6685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6WfnHaVpeiy32RQ61lW/JR9s+uduXVwfRRV0g14r+4h39y3Jz2fZI0oInCZWzLIaEp2KHUVyEektS03FUZF8pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7891

On 26.10.2023 11:46, Xenia Ragiadakou wrote:
> On 26/10/23 11:45, Jan Beulich wrote:
>> On 26.10.2023 10:34, Xenia Ragiadakou wrote:
>>> On 26/10/23 10:35, Jan Beulich wrote:
>>>> On 26.10.2023 08:45, Xenia Ragiadakou wrote:
>>>>> --- a/xen/arch/x86/hvm/dom0_build.c
>>>>> +++ b/xen/arch/x86/hvm/dom0_build.c
>>>>> @@ -518,7 +518,7 @@ static paddr_t __init find_memory(
>>>>>            if ( end <= kernel_start || start >= kernel_end )
>>>>>                ; /* No overlap, nothing to do. */
>>>>>            /* Deal with the kernel already being loaded in the region. */
>>>>> -        else if ( kernel_start - start > end - kernel_end )
>>>>> +        else if ( kernel_start + kernel_end > start + end )
>>>> What meaning has the sum of the start and end of either range? I can't
>>>> figure how comparing those two values will be generally correct / useful.
>>>> If the partial-overlap case needs handling in the first place, I think
>>>> new conditionals need adding (and the existing one needs constraining to
>>>> "kernel range fully contained") to use
>>>> - as before, the larger of the non-overlapping ranges at start and end
>>>>     if the kernel range is fully contained,
>>>> - the tail of the range when the overlap is at the start,
>>>> - the head of the range when the overlap is at the end.
>>> Yes it is not quite straight forward to understand and is based on the
>>> assumption that end > kernel_start and start < kernel_end, due to
>>> the first condition failing.
>>>
>>> Both cases:
>>> (start < kernel_start && end < kernel_end) and
>>> (kernel_start - start > end - kernel_end)
>>> fall into the condition ( kernel_start + kernel_end > start + end )
>>>
>>> And both the cases:
>>> (start > kernel_start && end > kernel_end) and
>>> (end - kernel_end > kernel_start - start)
>>> fall into the condition ( kernel_start + kernel_end < start + end )
>>>
>>> ... unless of course I miss a case
>> Well, mathematically (i.e. ignoring the potential for overflow) the
>> original expression and your replacement are identical anyway. But
>> overflow needs to be taken into consideration, and hence there is a
>> (theoretical only at this point) risk with the replacement expression
>> as well. As a result I still think that ...
>>
>>>> That said, in the "kernel range fully contained" case it may want
>>>> considering to use the tail range if it is large enough, rather than
>>>> the larger of the two ranges. In fact when switching to that model, we
>>>> ought to be able to get away with one less conditional, as then the
>>>> "kernel range fully contained" case doesn't need treating specially.
>> ... this alternative approach may want considering (provided we need
>> to make a change in the first place, which I continue to be
>> unconvinced of).
> Hmm, I see your point regarding the overflow.
> Given that start < kernel_end and end > kernel_start, this could
> be resolved by changing the above condition into:
> if ( kernel_end - start > end - kernel_start )
> 
> Would that work for you?

That would look quite a bit more natural, yes. But I don't think it covers
all cases: What if the E820 range is a proper sub-range of the kernel one?
If we consider kernel range crossing E820 region boundaries, we also need
to take that possibility into account, I think.

Jan

