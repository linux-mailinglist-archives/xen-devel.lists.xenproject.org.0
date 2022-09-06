Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B39A25AE0D2
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 09:19:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399477.640659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVSrt-0000wT-S5; Tue, 06 Sep 2022 07:19:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399477.640659; Tue, 06 Sep 2022 07:19:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVSrt-0000tI-P7; Tue, 06 Sep 2022 07:19:33 +0000
Received: by outflank-mailman (input) for mailman id 399477;
 Tue, 06 Sep 2022 07:19:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oVSrs-0000tC-Q9
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 07:19:32 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130088.outbound.protection.outlook.com [40.107.13.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f0894e9-2db4-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 09:19:29 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7434.eurprd04.prod.outlook.com (2603:10a6:102:8e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Tue, 6 Sep
 2022 07:19:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5588.017; Tue, 6 Sep 2022
 07:19:30 +0000
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
X-Inumbo-ID: 3f0894e9-2db4-11ed-af93-0125da4c0113
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wj6PIqnpB6jCCis7Ah8ThaddjwlZiHPzA2IZOaRmm+Wu2SgRKavA9LObUbpb1i7GUaLEgpA+scCyvsn3Yj9ldS6wbCdDFKqbXbtRBjESUnmwnsSZ8Z0JA8VPJNq4A25zIwTEN201clzH2pNFnrbCmzykLu0Oig+4Nga+T5aF8U1RIFkGi1SSOuZfvSZxQA/2zDRLLbp8I59BqTfay0hf8xnpOd3F0okykJmTLeXPsDB4bqKDMmwyTbrneQvoffk1SVPavX7OxNgXBQN/syMozR3HaMNXcagIyCft0Lyvf06lG7g3UOX3m2R/jN21Q+a6fPfFZq/dHwjPnjOYQz0Bog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ZNDNsgCfZyTP2r/RW5aBlQ9VqxDpM/1WfEZ/69haIA=;
 b=GNUodehlB7OVnBaWWvu/EB4/N7cOkD+bF20UH+Evm5dDF3QccCwMtxoK8EaO12eZ+Me2fz/bI8iAXiGJ3fFWcBq5/0uMMiUhiWMYI9P0kyFG+iJXN4rcNOGxJ5ycCC6iqqlS6v348YamBufXpddtw10++CouOr7D+GxjcxGGv0fMA8AqVKnycy5dL8YIkHuY06GvRe2eIVsOz4zduc8rq6ewyB9E9xgkcr+78BbHLVwE5asr2/uLjZPWZLBLE3mch+YFwdZ2UCtZ+GYOswYwfxhVRpNsD3ducjk1Gw4YHwenKx+ojlDiXVEl57MyNr4Ft5DAPxzjcWgyKwTIp0290Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ZNDNsgCfZyTP2r/RW5aBlQ9VqxDpM/1WfEZ/69haIA=;
 b=mOHXS4HC1qBp8RwttPC09375yVgqPRr80ZtDV15Y0n9WDwWO7SVk7y0OuZnZM1tOfdMU6VWctDpOapNcPJp5g96sE7YTVx4d+v2a3eDUiZkxPbEHTbfcPJ1yTYssGj9FMrvnm8KFwp38IG99S7cfGkCrGp2KoY/yIfCH+YSnlJuIQPPslMU9tB1poI6TnqzzOsncCRfxuqP6J/lLwK5tm1WFhxbQirkeNBvAAOy1iBMV+RR6bRe1Wid4pz915Eodl8P7Xg+9Bpy1haCHO+8kNohcSiM2My6KGdqapYpKK//cGs9wmaxukUzLTwlFwtgO85L8IAQU8piwWwea6EaGWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9f02915c-ee93-83e5-73b9-a4cc9d2ee70c@suse.com>
Date: Tue, 6 Sep 2022 09:19:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v10 8/9] xen: retrieve reserved pages on populate_physmap
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: Wei Chen <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220816023658.3551936-1-Penny.Zheng@arm.com>
 <20220816023658.3551936-9-Penny.Zheng@arm.com>
 <691b68f0-db68-b400-5473-558583f8dbc1@suse.com>
 <AM0PR08MB4530A910E43B82D9B5226F42F77F9@AM0PR08MB4530.eurprd08.prod.outlook.com>
 <384fbd22-909a-b56c-9cc2-0765f2498b9e@suse.com>
 <AM0PR08MB45306AFFC0B5C10807BA6486F77E9@AM0PR08MB4530.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AM0PR08MB45306AFFC0B5C10807BA6486F77E9@AM0PR08MB4530.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a50789a-e9b3-44fc-e0e2-08da8fd823a8
X-MS-TrafficTypeDiagnostic: PR3PR04MB7434:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6n3dfDuB12p9EI1ZyqF4Q1GUXQse1ZR17zrngTmNT6IAfF1tLRVXRWzWWrxJZN5ehajvzORyXKnmXQQoY4xdLt0pwKNvog23buDcfN+Pcj46aL+0ehlqd4tYoBbr0Mm9hnymn8CaTKVbtxslhF/RXtXiROtNhFlxf3OvZKJldu7oIG5mbBIYGzUVryZDRcIUTGF0xIMwVsGubXDOQtHtWJ4EC67z6tb1GA3B4C0fgto4ulrxaeLzBosJeguqL6QbL44w6BYMakTi8hIpD+KdzkNTDxHPmkH9eViZvHX44fpFeUyGWNszxMJSPTo1cHsJvRlOy67z/Q5sudRALyrg/F7tDGFUl5SsSfRvUugNrdPLCfreQ2islmhhHGGb5dHy5CW/u3mG/7DH7lqUZcKXQTaleWtLTShKclbTLdBXPgx9VbK3L1UuKqeQ+mtg29R9xHcej2mXttGVZ1yrqY2ZGAcC4wAbhZqKvVHdqw3kI8THUBp6EZ43yF+Dyq7a2Zn6algGMai8yhYRy0C/A5vEbcQZndnoS1t+0HFVX5KkcPAy9Ott7TDdvXONA8KsGecuONC8va0hsCZzr6tKNY4hMDXKaFLOkqxiOaZGTN9BmKPH3xU2sSs0ujFH/PHyoOpdlLHQOCKujPN8B0RcV/ui8/IdRnaYs7Tfn+3ObPJmzowm1g7DypZoVVNwfZUgkW9fao2v7YUCHFcYyZz2jvaSstBGoXMs55yv7z7OZ/yYqN+dLT2Q0MY//xt+PJsJ6n73Vsttv7+Fy2HvSomwuuQAkk0vQuYnHBWAAdAVu+6dQ4U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(376002)(366004)(136003)(396003)(346002)(66476007)(83380400001)(4326008)(8676002)(66946007)(8936002)(5660300002)(66556008)(53546011)(478600001)(6506007)(26005)(6486002)(6512007)(41300700001)(186003)(2616005)(316002)(6916009)(54906003)(31696002)(86362001)(31686004)(38100700002)(36756003)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzFZR29reDV2SFV3ekNMSnBhRVkwMkRiTVF6TkIvYmlqZGhnZlJZWTZZNUdy?=
 =?utf-8?B?NWtRSlY4N0o1QnFoVU5ON3p0c0JYNFV0dlRyR2ptQWY5L1RuZ0VCNEZZNExh?=
 =?utf-8?B?T1lNek5KWEEyeG1CRTJHRUdlcFp0UmZ4NUtkK1BnSFBZOE9Ra25DbndQTy90?=
 =?utf-8?B?dnpXVS9HM1h0OFMrYm9HK3QvSnJOSmYyUlBnb2M0cTVSRzZ3TDR0Y0xXSXNE?=
 =?utf-8?B?dU1wNkFIMnhrcUtHSFZvdUd5R1Vpek5uRmtQVG5IcGZCZlBHcStMa0RjT2tF?=
 =?utf-8?B?WEN5VUhvRnltTEErZXNMd2JJN2VsMmJ5dVBFQ0V2eWs3ekpOOHZkWlg3a3kx?=
 =?utf-8?B?RE96TlFMbm1GdkdjemhjaWgzVmtudUNMdk9QYTAvYVYyUENGMDhWdFl2UXFP?=
 =?utf-8?B?aUVFTWg3cmR2T3h1V0JSR3RGN3o2N2lWbDVFSHRtY25yWGo2a09aR2pVdlha?=
 =?utf-8?B?ZTNZSnFhVUVwSzN5TzZtQmZMTE9uZk1MWk1vVTJ4cFlXT1N2MSsxZWdDT2FC?=
 =?utf-8?B?bFU1RUhGeDBTc1J5ZkFidHM5cmxWTGMvY3BQRDVFRStKZ1ROcGFrYVRnUEtj?=
 =?utf-8?B?T1ZtcDJGYWFkVnNXYUtRVDFnN3JzUTFvVFJBbzJwdlMvaVdqZzlXaWJSa1Zn?=
 =?utf-8?B?VzRFelJYR0hTWW5iVlBoc0xsNjBDbTh6ZldXYjNsdXppOUZMQlZiV0FjZ0I3?=
 =?utf-8?B?bllsYXNmcmhkY2Y2aUxuVEVOenI1MW1CTTJCZElYMm1qR2tCRHRjRm1IWGRV?=
 =?utf-8?B?S3dabnF5akNXS2VKdlhiRU9VUFJ1TVZRZEc3VnVwcUdHS0NERHhnR0tWV1NN?=
 =?utf-8?B?cG9Sam1pTzJEV2tRUHNPS2x5aEo2UEsrLyt3bGo3cDZzT3NWZG9yd05PT0Nk?=
 =?utf-8?B?MENDWU5yQlpuTHFGOCtBU29wbVlZejdNc3g0R2lsZHRSY3pya2NpWCttUlpI?=
 =?utf-8?B?Y1MyWnBKazdmWEtYTTZxd3RiVnYxcUErV25JaFVyVVNBalFXSFc4MTAyTW1L?=
 =?utf-8?B?QjY1QnZGS3pGVzR6TnJwSGZPMnc0WHNDYUpiQ0pOMG1MRyt3YTBTY1MyNlRs?=
 =?utf-8?B?bWIrZjlBK2JpQnBNbk5CTFNsSlRFUTVZOEpwVXZEWWhhU29uUldISEZQaHlv?=
 =?utf-8?B?dVNBRGNlRWpUek1sRWdoWGNGL2JRRU1vS3lvS1BSVVppUGZsM2VqaXU3a2M3?=
 =?utf-8?B?bmlpQXRzU3ZNbitoYXF5djFtMFFQODBSblo3Q2k1UkJxbTREVExidTBRZTlG?=
 =?utf-8?B?bWVUVFdQNitFU2VIWkVvNWZzMFE4aTFPRHFzMVNlSW1TVGdaL0tLMzVDQkpx?=
 =?utf-8?B?VGQ5cjJ4M0JWN053bE9ULzVBZjJYejAxM3ZsUnErUDBlQlB4RzVQVzIwVXRy?=
 =?utf-8?B?K3ZuQTA3enlkWjA4dWlhM2diT1d1bXJrMjduTjhQVzJaWHJXaTdncGI0Wnpy?=
 =?utf-8?B?emIxOG9kR3Zka0xteDVYV0FYZDcydmRSdG9UT2FSMGtVUG9HMUdxZ1c0a0Zx?=
 =?utf-8?B?bDQydnQvK2R5Y0FMRWVwcEtVMGdnUXlGc1ZyZ2xMN1BFdksxR1ZtanQwdXlm?=
 =?utf-8?B?cUxKN3kwVXFUeTVRQ2RYa2QveHVhL1VVejE2WHg5RTNobHd3NlJuZ2RwaVBv?=
 =?utf-8?B?U0JIRVFWVE9PN0tVRDJVek45aURLV2o1OE92QnZMYW9vZHY2NzhiamtpR0ZR?=
 =?utf-8?B?RXZ6OG10VGt0ajlIMEFlcysvQkRnQTZ0SjhGNCtwU0dxVVhDMXVobG95ZGtH?=
 =?utf-8?B?MzlvbCtsczhvc1l3Q0dlZ3hKbFA2a0tMNVVzUXNueWpLSXRWTThUZXhMUmk1?=
 =?utf-8?B?TU8ranB2R0pIVnhLelgyREpPek1zdi9WcU1xTzZ4QkNpOG1oQmxGVFZiZisw?=
 =?utf-8?B?UjF4WEwvM2xMMXZDMFhkbHNnbGExYVRyQ2NYeHY2UEJzWXJmdWYveTlPUmYr?=
 =?utf-8?B?OXdnT2JnUk4xRUdERjIzT0dLQVlPWWhSSlV1OVBsUGdrLzY5eDU3UkU4UzEx?=
 =?utf-8?B?ZVJlaUcrY0RQUHY3MmdtdUlTMzE2N0I0VjlZQnByaTBWSXFPbk9DQ2UrdElv?=
 =?utf-8?B?SkZ4MXRXY1hWOHVZUE1OVjFWRVZ0cmp5VFY4ZEIrcUM4K1ROS1g4eXA1MUVG?=
 =?utf-8?Q?+6WVJAqcE5STC0tkPRZgj8t5J?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a50789a-e9b3-44fc-e0e2-08da8fd823a8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 07:19:30.1262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GXvB+4bEIiZ8QQujuJQVzRztB1d2mA51dc+gFvuZbX3Hmdsl4MofiywgscRbfSMjndHxKTRvsCEYKFo5E97uhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7434

On 06.09.2022 09:14, Penny Zheng wrote:
> Hi Jan
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Tuesday, September 6, 2022 2:34 PM
>> To: Penny Zheng <Penny.Zheng@arm.com>
>> Cc: Wei Chen <Wei.Chen@arm.com>; Andrew Cooper
>> <andrew.cooper3@citrix.com>; George Dunlap <george.dunlap@citrix.com>;
>> Julien Grall <julien@xen.org>; Stefano Stabellini <sstabellini@kernel.org>;
>> Wei Liu <wl@xen.org>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v10 8/9] xen: retrieve reserved pages on
>> populate_physmap
>>
>> On 05.09.2022 09:08, Penny Zheng wrote:
>>> Hi jan
>>>
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: Wednesday, August 17, 2022 6:05 PM
>>>> To: Penny Zheng <Penny.Zheng@arm.com>
>>>> Cc: Wei Chen <Wei.Chen@arm.com>; Andrew Cooper
>>>> <andrew.cooper3@citrix.com>; George Dunlap
>>>> <george.dunlap@citrix.com>; Julien Grall <julien@xen.org>; Stefano
>>>> Stabellini <sstabellini@kernel.org>; Wei Liu <wl@xen.org>;
>>>> xen-devel@lists.xenproject.org
>>>> Subject: Re: [PATCH v10 8/9] xen: retrieve reserved pages on
>>>> populate_physmap
>>>>
>>>> On 16.08.2022 04:36, Penny Zheng wrote:
>>>>> @@ -2867,6 +2854,61 @@ int __init acquire_domstatic_pages(struct
>>>>> domain *d, mfn_t smfn,
>>>>>
>>>>>      return 0;
>>>>>  }
>>>>> +
>>>>> +/*
>>>>> + * Acquire nr_mfns contiguous pages, starting at #smfn, of static
>>>>> +memory,
>>>>> + * then assign them to one specific domain #d.
>>>>> + */
>>>>> +int __init acquire_domstatic_pages(struct domain *d, mfn_t smfn,
>>>>> +                                   unsigned int nr_mfns, unsigned
>>>>> +int
>>>>> +memflags) {
>>>>> +    struct page_info *pg;
>>>>> +
>>>>> +    ASSERT_ALLOC_CONTEXT();
>>>>> +
>>>>> +    pg = acquire_staticmem_pages(smfn, nr_mfns, memflags);
>>>>> +    if ( !pg )
>>>>> +        return -ENOENT;
>>>>> +
>>>>> +    if ( assign_domstatic_pages(d, pg, nr_mfns, memflags) )
>>>>> +        return -EINVAL;
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +/*
>>>>> + * Acquire a page from reserved page list(resv_page_list), when
>>>>> +populating
>>>>> + * memory for static domain on runtime.
>>>>> + */
>>>>> +mfn_t acquire_reserved_page(struct domain *d, unsigned int
>>>>> +memflags) {
>>>>> +    struct page_info *page;
>>>>> +
>>>>> +    ASSERT_ALLOC_CONTEXT();
>>>>> +
>>>>> +    /* Acquire a page from reserved page list(resv_page_list). */
>>>>> +    spin_lock(&d->page_alloc_lock);
>>>>> +    page = page_list_remove_head(&d->resv_page_list);
>>>>> +    spin_unlock(&d->page_alloc_lock);
>>>>> +    if ( unlikely(!page) )
>>>>> +        return INVALID_MFN;
>>>>> +
>>>>> +    if ( !prepare_staticmem_pages(page, 1, memflags) )
>>>>> +        goto fail;
>>>>> +
>>>>> +    if ( assign_domstatic_pages(d, page, 1, memflags) )
>>>>> +        goto fail_assign;
>>>>> +
>>>>> +    return page_to_mfn(page);
>>>>> +
>>>>> + fail_assign:
>>>>> +    free_staticmem_pages(page, 1, memflags & MEMF_no_scrub);
>>>>
>>>> Doesn't this need to be !(memflags & MEMF_no_scrub)? And then - with
>>>
>>> I got a bit confused about this flag MEMF_no_scrub, does it mean no
>>> need to scrub?
>>
>> Yes, as its name says.
>>
>>> Since I saw that in alloc_domheap_pages(...)
>>>     if ( assign_page(pg, order, d, memflags) )
>>>     {
>>>         free_heap_pages(pg, order, memflags & MEMF_no_scrub);
>>>         return NULL;
>>>     }
>>> It doesn't contain exclamation mark too...
>>
>> Hmm, you're right - on these error paths the scrubbing is needed if the page
>> wasn't previously scrubbed, as part of the set of pages may have been
>> transiently exposed to the guest (and by guessing it may have been able to
>> actually access the pages; I'm inclined to say it's its own fault though if that
>> way information is being leaked).
>>
> 
> Then, the same for the acquire_domstatic_pages(...)
> 
>     if ( assign_pages(pg, nr_mfns, d, memflags) )
>     {
>         free_staticmem_pages(pg, nr_mfns, memflags & MEMF_no_scrub);
>         return -EINVAL;
>     }
> On this error path, it has misused the MEMF_no_scrub too.

Why do you say "misused"?

> But IMO, as we are talking about these pages will always be reserved to the guest,
> maybe here it also doesn't need scrubbing at all?

Perhaps. It feels as if we had been there before, quite some time ago.

Jan

