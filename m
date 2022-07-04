Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C0C564D80
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 08:06:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.359741.589068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8FCr-0005qw-Dn; Mon, 04 Jul 2022 06:05:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 359741.589068; Mon, 04 Jul 2022 06:05:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8FCr-0005oi-9o; Mon, 04 Jul 2022 06:05:13 +0000
Received: by outflank-mailman (input) for mailman id 359741;
 Mon, 04 Jul 2022 06:05:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rvAI=XJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8FCp-0005oc-CC
 for xen-devel@lists.xenproject.org; Mon, 04 Jul 2022 06:05:11 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50043.outbound.protection.outlook.com [40.107.5.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41c95537-fb5f-11ec-bd2d-47488cf2e6aa;
 Mon, 04 Jul 2022 08:05:09 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR0402MB2910.eurprd04.prod.outlook.com (2603:10a6:800:b6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Mon, 4 Jul
 2022 06:05:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 06:05:06 +0000
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
X-Inumbo-ID: 41c95537-fb5f-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gUlCiR32fQw8dv+bdv8bVF5w9d+1grJNZWHut28eApfOO/1+eCojPQmoIH1nWQReL2ahhqPFXkv2yBq7Ob26tkmqTIcq/JCAcNyj0qiOp/RzI/as/qV5418//VJAGyiXFU41FxSnj3I3Zn6hWwSqSqhQ1aJGsV3Owo5a+N8tMDIdIpkMeMscTwl/FXKZTn64iH24GwnGLYqGnSqXZtMKEpYViusmVvF2gn7r6pCCXcujn5XMAfzVodm5hHpokdUT6SaeAdzb1pt6G7Iw0t1dSzzR2CDYfMwJCfMEZuWts/pIjyLJFlio2koBhNhLDqJwbbFgPQ9loGaTOSd6TC98Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V+4b50n6O1Uybgj13S/964ltpSyYgtDOEKfEbuOghrY=;
 b=KWRw4QBPmaaeNgbvoqWos4R5BGBL4Lyoo41UsBUR2dSscYd1qYT5r+CpOWbnxvzU6pdDnnjaPJQ2AQOfYjMIz3Z23C+VODybKjzYI/uhJw6XraCgsCHNWrUi/EEV+f9mQZx6pW7dY0efudrPS+hEW0v5cion2SCKWzXE3KdoWB6gG8hvve2vGBos6N6xQQuAl6t12jX+d7f4/xGqxPzuO2YjqV8GGd2swc6OtYfeFRvAUhd/tZxXK8+eKX6ZmPivjSMzi+l7nl6nNyoqBhqy+iMiCIyemI9O5ZzPDMtRQ5B5LZM+i6ygqWyPYKNvs4S3WCRnhCjRgCrYm04o8+j0Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+4b50n6O1Uybgj13S/964ltpSyYgtDOEKfEbuOghrY=;
 b=PzBe0yl5ZJHyZLphrrnfy0ORwwaeu7UpFJHoKK28CZYZs1c+XEC+R1EEAb+Mw+78mIvYyWk3sLAU0NQ89kHRTD6XzwhgJoyfHQMz8b2RNmqszKjZhUFqftSN1Pwe+mH1+kh+YAlwRhatg8ffWFqt9zbk5hpOfVlKevmjfdzWRI0VhEnj1jgxUO1T27GADX5tjrCB7d2e6MhlUqBUWmsDeuMHLK/IjzgoF7YM2dq5HbqbxS4jPth3n/OI50XGdYyL721q7u7nv8dYEaA2Mvd8Y8KFJm5lzQjHU9DnvrK1lOhAIABQsF1xz47VC/K2An4b9PYykhpn4AWtbS7L8gPzHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c4ecb784-e6d9-6d77-67ec-1dec78dbde0d@suse.com>
Date: Mon, 4 Jul 2022 08:05:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 01/10] drivers/char: Add support for Xue USB3 debugger
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Connor Davis <davisc@ainfosec.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.5d286dc6304969ed7155051e900236947c1b14dc.1654612169.git-series.marmarek@invisiblethingslab.com>
 <87c73737fe8ec6d9fe31c844b72b6c979b90c25d.1654612169.git-series.marmarek@invisiblethingslab.com>
 <9c7c11f5-be1e-f0ef-0659-48026675ec1a@suse.com> <YrM5g3dLRJHTIVYt@mail-itl>
 <8322303f-021a-b520-d2ad-cf8310573df5@suse.com> <YsGIzXKPr+j05TC4@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YsGIzXKPr+j05TC4@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf09292c-26b7-401d-b817-08da5d8324c5
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2910:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kxh5popoyXqYLuoH293PIZdsOCall+YPKoLIDdZl4h8xbWxxVsZT2mw7nNdj4/GC8Tc7XAPUB4qevywxAXYpRGP6p8hee446mnmZy2263LTuJ88MT6FppX0HVufdq2znQp2lWIvAARQMz2/qo8Yjz0hP8CKfB3E9EWOPwBtBaKQ+o/BAhdQ62kWKHrgGoGgNXElxiKDbNIwY1/OwX8rBDY8d3GgPoFSATQPZJfHM5WDj5hwpUuJ5CUKK56vBxHCqgZmY7I/V+Xg2DPf8EYwAHo4rmEkKvTFZ+X0jjV40V9SbVAWlb0h37zS6MNKChjODXVSaGGl0iYsWqFRNKxYDdZXfYVFPrqzHwOy8r73L8W+nZMcNZhTlqniW6oqs/JeaUnWN9gCETb8TGsQL9WTlrevB5qoDl0dOa2vB5s08Hj1RdKf+ACVBNYK2JXzVqk25K/QYe5H8Vsibn8gAPwwtR9lbIpWMu3wAhzGisaWv3s/UbUau5reHiHh4spmdLnnb4Yh3peNewmcXgLjZN3ujLoqnqH6ZKKY1148eDbw0jpkbZttSUFO+oqZUZaKVNNQrKJ+6n4A7jTHRtpQgMCcpai7k7hJw1a1B6kswwoBNK8cI0LDkelWXRpOqrR/lAHHppEu7/KKSA7jrKW2emydHNmIH/0isjjlQJK4Oxbu/ue1aG/3YSsKt0f9DJAqkdxxt4sh6qu8XKXGK6uR9r1+mmFmKpbrtIoQGUUXhUghCt45eRSpe/cKLr2r13WQtQGakx1nV5DB577sVYbAM5ONMOsa+ViOEyuTQJh8aDpfeBUlNOerq6RkEAH8gYGYadfPTDrY2Be35iHzgzcjKoPYX36oRvR+ORSL1wmxiC+hPb+M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(396003)(136003)(366004)(39850400004)(26005)(7416002)(53546011)(5660300002)(316002)(6916009)(54906003)(6512007)(41300700001)(86362001)(31696002)(6506007)(8936002)(478600001)(6486002)(66946007)(4326008)(8676002)(66476007)(66556008)(66574015)(186003)(83380400001)(36756003)(38100700002)(2906002)(31686004)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjhkVm50UnJxeGdscS9RY09kZ2JrMXdIMW4xeTR4T2pBdVFRUHZuS1JxUGVS?=
 =?utf-8?B?ODZjZ3laSFUwclFiU2lSdjBVd2xyRWYzTW1GRit0RU5oQzVUTkhkRjA0eG1t?=
 =?utf-8?B?azI5TFAwSzUrSWdWYU9Edk9sOVBVeDJSRCtvMWd0SWozWVBoWGRCeDBxZ3FS?=
 =?utf-8?B?NUpJeHBDaTdxWGtwelZvNUVGTCtGb2xKUC9scm5nWHFIMnBPU1BiU1NLZFdx?=
 =?utf-8?B?anV1Z2JlZjhDME81dkpWK0x0THVzaXdRaTdvK0dqOFpjYXBDck1vRS9OU2Jj?=
 =?utf-8?B?ZDBhTjM4SEE4SUQ3YzdXTUs3UEN6MnB6eVBaVlRvS2RrZEtCNkJEaHk3Slpa?=
 =?utf-8?B?TzJQakFmbGxwR084Z0NhemRsS0VwM2hZMTZqSTRWLzVBOTFRbVZ1SHJTTVJX?=
 =?utf-8?B?elhia0pxcHFmK0xUQ3AxMUQ0Nmt4NURyL2ZxaGc2YmxCb3VHMVVoUnd1bVhy?=
 =?utf-8?B?MDRWSDZxZEY2REN1cENueDgwY1pJc0FranpEbHRTOSs4OTVzV1ZNTXlodlR0?=
 =?utf-8?B?NEN2TEVlUXdqSDdvSWNmQi9vTU85T0p1TitLNEIzb0thdkJqOTc1QkVGWUtk?=
 =?utf-8?B?NXN0N21temY4Vzd4b1RLbkxpaXhEc0JTaFRPdFh1MnRZK0VoajZuaFYySzF4?=
 =?utf-8?B?eDQxNUVRQ2s2cC9MS0JTZ2JoRFBITnhCZ0lyQndBWGRlbDlYSS8remlyK0NV?=
 =?utf-8?B?a05KSklUTS8xZk1lZit2MDlxMldEK25kNllDU3R0RVROUkxmaXRKRTh2YnY0?=
 =?utf-8?B?Y0hBQ1pwSkprNjIrdjFGeHpMWDAvcHlJREhZcFFJWm1IOGtzSVRIMG5EcG4z?=
 =?utf-8?B?ZmRqajVUMTN5eFAwem1SVWIzNHFPOXgzYzRqcUpFNDJvRzhiWHFGM0NBczNK?=
 =?utf-8?B?ZFVueTQ1enh5YWc2YmpiMjVJQm1XUUtuQU14VUthR3BOVFoyR1Bua3BtYjVZ?=
 =?utf-8?B?YXlqcWpYc2VpUGw1VGtrTTY1RmhEK3BnTlRBT053MDFhQ3hKYWxQUm9tOTlL?=
 =?utf-8?B?eFNtVWRiMCtFN1NzVkJUS1dvTG1MTUVnbXNPZXZxcnVJeWZIdEQzbm00VDZP?=
 =?utf-8?B?bmdJeDBEWk5EWFJ1SE9QMndGT0FZTHhMdytZa1VreVBBS2E2cU9lOHJESHh5?=
 =?utf-8?B?alpoR2luc2pNWGlCU1d1am5VL0JhdWVyWkpZZzF3OEd5SnI3TFlsODZvSVhG?=
 =?utf-8?B?MDNLNk9Rb25ENXhtdU81a3FJbDF5R1pZWjJXNS96QzdHSHJxRHB2bERLaFFo?=
 =?utf-8?B?L2RSR1lWTlNKTlp1YS80MFFlSEN1OUlIOG95MmcyQTZmbERoWGpNYjZYSzNj?=
 =?utf-8?B?YXJzZDkxclpyZzh1U2Z3RE1oMkhrelV6WDFmYXE5dmlXdk1JQXNzeVMzQzlO?=
 =?utf-8?B?QjNjTVpJVHZkWG9jREdjMWNNclZFc0hKa3JaZDlzUlVzZzluUGVuU2h6OGR5?=
 =?utf-8?B?bk5HN0hJODQ5eVJxTGlFU2EvYlVzOHVFb1MvUTNCMFQ5Mk1NMkEvK0tGYUVJ?=
 =?utf-8?B?SDNaMFErQiswNldXUTgxVm91WTg1OXJ6MVlUNGZvMEt6clp0UG1vRUw0ZzI3?=
 =?utf-8?B?dmtpWlZsekF0eXozQkNRcGsyd1dnTDU1cEN3TmFIcVlXMDlqbEVKTnIxWG5z?=
 =?utf-8?B?UW02VGtWMkNlRlYvSmlJbzM5OVFqN2h2VzFuNHd4dlpkaktVTll0ODhGQml6?=
 =?utf-8?B?a3ZjNUk0QU9UT2pFL01KTS9PTTdjNGcrVE84RC9lL0FIVmRub3hZNGNVd3ds?=
 =?utf-8?B?RFQzeVdoT1lzVnQxVS9rbWJaWDZjYmRKS3F1WkRuSVorS2hYTmpJVVZsT1hi?=
 =?utf-8?B?bjU1bDUvZDNIZWk1SjF4bEJmVXkweXZ6VVdWT1hoOFVzTHRuVlVBTjY2bHo0?=
 =?utf-8?B?M2tyZm45MERlV0M5VHk4YkN4MGNteGx3MG9OcjB3NFcvZUVTNXgycHhCTU5n?=
 =?utf-8?B?VTZNOVkxZldBTm44NVZBTXliL2p2bEJQZzVmSGRWMGhUU28yeDRJdEU3Y3Jk?=
 =?utf-8?B?eG5oSnpKcWxPK2JaZGZaZXBKZS9aVWRLYW4rZi95UEsxa0RmK3ZxMGEwMmda?=
 =?utf-8?B?SGVNUUNET01jRkpwa0FIMGg2ZXR1VWpTbm8rOUN2SmRoWFd3ekNUL05BQXNO?=
 =?utf-8?Q?kYupDKY8HlVl/JCQxiI+gNW5e?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf09292c-26b7-401d-b817-08da5d8324c5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 06:05:06.6789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z42Caw+32cmhJ1VbcYjZVxeewEnQyiHNDoRt3BH+OK8kmJ3ONxMk30lYH8/UPhnqVONmlJ51FYanaQ3fSgvgQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2910

On 03.07.2022 14:17, Marek Marczykowski-Górecki wrote:
> On Thu, Jun 23, 2022 at 11:29:31AM +0200, Jan Beulich wrote:
>> On 22.06.2022 17:47, Marek Marczykowski-Górecki wrote:
>>> On Wed, Jun 15, 2022 at 04:25:54PM +0200, Jan Beulich wrote:
>>>> On 07.06.2022 16:30, Marek Marczykowski-Górecki wrote:
>>>>> +    memset(xue, 0, sizeof(*xue));
>>>>> +
>>>>> +    xue->dbc_ctx = &ctx;
>>>>> +    xue->dbc_erst = &erst;
>>>>> +    xue->dbc_ering.trb = evt_trb;
>>>>> +    xue->dbc_oring.trb = out_trb;
>>>>> +    xue->dbc_iring.trb = in_trb;
>>>>> +    xue->dbc_owork.buf = wrk_buf;
>>>>> +    xue->dbc_str = str_buf;
>>>>
>>>> Especially the page-sized entities want allocating dynamically here, as
>>>> they won't be needed without the command line option requesting the use
>>>> of this driver.
>>>
>>> Are you okay with changing this only in patch 9, where I restructure those
>>> buffers anyway?
>>
>> I'm afraid I'll need to make it to patch 9 to answer this question. If
>> suitable dealt with later, I don't see a fundamental problem, as long
>> as it's clear then that I will request that this patch be committed in
>> a batch with that later one, not in isolation.
> 
> This turns out to be rather problematic. xue_uart_init() is called
> really early (as it should, to get console as early as possible). It's
> before even boot allocator is functioning, so I can't use alloc_boot_pages().
> Are there any other options for memory allocations at this point?

No "neat" ones. Stealing directly from E820 could be an option, but
would of course be heavily x86-centric.

> We are talking about 58 pages. It isn't much, but isn't exactly nothing
> either. Maybe there is way to keep the memory allocated statically as it
> is now, but return it to the allocator is xue is _not_ enabled?

Well, yes, treating them like .init.data would seem to be the least bad
alternative then, at least for now. Down the road we may want to generalize
what's needed here, as there are other full-page or larger memory areas
which are used only under certain conditions. We may e.g. want to introduce
an approach similar to Linux'es .brk section (recently renamed to .brk..bss
iirc). If a non-generalized approach ends up looking too ugly, I'd be okay
with keeping things as they're now, just with a respective justification
added to the patch description.

Jan

