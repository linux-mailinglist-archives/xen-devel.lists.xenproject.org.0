Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D52590FDE
	for <lists+xen-devel@lfdr.de>; Fri, 12 Aug 2022 13:08:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385582.621262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMSWT-0007tA-Px; Fri, 12 Aug 2022 11:08:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385582.621262; Fri, 12 Aug 2022 11:08:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMSWT-0007pi-Mp; Fri, 12 Aug 2022 11:08:13 +0000
Received: by outflank-mailman (input) for mailman id 385582;
 Fri, 12 Aug 2022 11:08:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yzoh=YQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oMSWR-0007pc-Qm
 for xen-devel@lists.xenproject.org; Fri, 12 Aug 2022 11:08:11 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70088.outbound.protection.outlook.com [40.107.7.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d16d59f-1a2f-11ed-924f-1f966e50362f;
 Fri, 12 Aug 2022 13:08:10 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR0402MB2825.eurprd04.prod.outlook.com (2603:10a6:3:d4::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Fri, 12 Aug
 2022 11:08:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Fri, 12 Aug 2022
 11:08:08 +0000
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
X-Inumbo-ID: 0d16d59f-1a2f-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LXe4kLZyyWURuzZcQYuqgVrA31y+1yt0lQDPCBYUmva5dBUyZbrZXJ6j5NrgMcfQN397A1lKHp/OXPDP6v5FZm7PgB50D1pdILqccCHj6MT/vsqSxM799A7XdJd3gt9ndk0vtXrN4MgYJs8pGDDOaCotGkePDGFlag5hHNH4w8Gf2JMWnVNseFakUyYbvz/RnpEmXjVPnsI7o9vA2S/o5LlvNorXyxLgHIrwuljqNZmyBKesF69UkHYOHQSwKltHPQttMaU8Ns9wmpBNqsiwMd+iSNrJ4jZqSi/Ds8oPaWE4PJgDMT8TrgM8Oxq9SQXfqjjFEklCJKcwM47v5vsEhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WwiCXNhylA79WLyOxDZn0OgicSVqUfhyODZ5kPzLKe4=;
 b=TCF9DqXg/WKjuyj7rkmoDbe6Na8Zs+rR4Thr7Adiu+6NPxSMVELpzpgPEaQooHb4qQF1e6/VRDuT2b3KV5MadQlwQj5IY6eIvMNGun2RG9ZS/p3OJ9KEdXBtvHU5lVNL+6sdA18oBY7t2W5Gvj3RCIvfMkfrdqxl+8NvLvTSaBU53DP9kA4OYzoCcV0otvliWmIslZRyD+uTV1ptxt3RNngPtgPox172iC+VgNdqA1jut77iIQhkFzbRf8iUcJcbJplJqprokKJ1UEoCDMEWLpVso4ib9QYjCNwM0hmD65TdsqeZUjTqAIlwJC0Qn4Up1qqDrbiy7duP6qRndt4rYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WwiCXNhylA79WLyOxDZn0OgicSVqUfhyODZ5kPzLKe4=;
 b=I2/dcrD6j02bSdQOAa3CuFYNg1Ro6dDOhFxv3HX2CtrrPQ25zP/7B5cDaq8DAjQXHEyIq5IlrHq/FI7ebka6oxFzKjQeAB5rIioSJKajkdUQcBY3vGZOOLtuzjYmw1g0RfYdCXsJyfIUWxH+eaD3Wcy5q8CXASScsuZtkUGBhtGfMSkHzp69u/j5XvBuwm//9mU353gyzwVk93N7ZU9O9yf40eZ5JvY0f83HKUAr7m/Y14VE2dmc6LbR7mrvuwPPkL6ygDAJOqDAhvrjShYlUErLYbXvDDxy17ECSvlFn806CBCDXk/kE58O9MlzvqH61d8x7M2J+pYAC3FlHj+BUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <841ab214-b59c-d08e-dc3c-778a7e420723@suse.com>
Date: Fri, 12 Aug 2022 13:08:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v9 8/8] xen: retrieve reserved pages on populate_physmap
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Penny Zheng <Penny.Zheng@arm.com>
Cc: Wei Chen <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220720054611.2695787-1-Penny.Zheng@arm.com>
 <20220720054611.2695787-9-Penny.Zheng@arm.com>
 <d050bcf4-f71d-423d-a157-4243548f47a6@suse.com>
 <DU2PR08MB7325EB83FDD208467A493557F7629@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <99e65678-c394-01f1-9f49-827388f2fff6@suse.com>
 <DU2PR08MB7325A733C5B374ED899A2007F7629@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <14ce6b41-c422-abac-4b59-541511d75cae@suse.com>
 <DU2PR08MB732531F03BB6F436FCC79673F7629@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <21CCFB81-D43F-48D9-8EC0-A8CD08835261@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <21CCFB81-D43F-48D9-8EC0-A8CD08835261@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0123.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0004881b-955d-4e1e-f81a-08da7c52efee
X-MS-TrafficTypeDiagnostic: HE1PR0402MB2825:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z/0UJPvYvIFmHn2tlgJsTK3jn++Q8XhSRl0gHgqtZpd8olD6at1YVtWthIVr7AjLoZaB57xMzN6u1W4UQ74Azy33V9Ys/IofPnl4ds4FjlPxD0eMR0xd7ulDcLDoqJg9o9iaFbyYse/VQl8VISNhxbVFl941fWJO6oqCvD3/uJEysV4N31a17faL2PjTDDrKZQQ9tQMP3YkoGzpI1bkmiCJ5y8DJklIOeS8e+qectR4VePd/aDpsNlB+M6m62JTG+v7UHvU43a0HcxwSCr0ylwH91wuVmKDcMTQ/a5KgvuNyEKbgyOuI0sn9WbLqahktKOQJGLDjCTzgPsIPTxNt28quxaxbUafSryQzqscUfNXfgAZWRaR87IEhpn62mlO8gglE3N5kbmGUXbmmh1kd/VL4cVbr/1GMqaDCpKYOxzb2EL77OfqsZMsvv4uoNnJNlegEvpEyZ3l4mQK74og067WDG+EUCZwb6atrmMFjQnlg5mpKraECEkR38HsjUx6B0s8gHbG8EvJ7FKXSPphEUthWvG5FFcpabeniZY0eaPE+kFj123PhDdL/AOwBg9ThXwxHsQUQbvGlUH8fsuBhAzZ9eEPWEt0vQiVXIWzjrvtgBSQp/sAj7ChSMbquAfM92id2u/BR0I8i4icjQfs6DD8kFpbFSibvQFIbsY/4wdNBDs1i5dN+tw5050sqV0EYZ2mornbg5atDftCRSgGvS5VcZzI10dEuweWvGJ5qwYFxw8CdENfx25bd+AXTRHa+aLItOSE3ih2YXK7Z5dZIE2wL+fmhFNss3qTEB4qraKQ24j4DkTDPkbrk+tY5HbB/xrbnMSYZ9haHZj/rhKprhQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(346002)(396003)(39860400002)(376002)(6666004)(478600001)(41300700001)(6486002)(26005)(53546011)(83380400001)(6506007)(6512007)(2616005)(2906002)(5660300002)(186003)(316002)(54906003)(8676002)(4326008)(31686004)(86362001)(66556008)(66476007)(66946007)(31696002)(36756003)(110136005)(38100700002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RE0vaWppS2x0cGpzdkJxeEh5MFhITzNNd0I0bzFXOURVdmIrbm1ScTh4V2tJ?=
 =?utf-8?B?cTJUM1c1SXhjanh3STA5MHdrOWtuZzZNTFRhUDlIc3BCRHE2U3NLYTNKV1hj?=
 =?utf-8?B?dVY2MTNFdVZCYTdyOWZlNW5QV1FCWDB1cXAwUXBsa1Q3T1R1TElHRy9DQlly?=
 =?utf-8?B?cTg1MTJLdUhheDBMWWJ2SVpmaVhIODhxbUVSTndGMzIzcTZTSWxRaFg3K0NG?=
 =?utf-8?B?b0ptR2Z6Z21ub3RHK2wxRDlmWUd1RGVyWVlleWtjbnFKaXlXL2h6Y0t6Ni9l?=
 =?utf-8?B?RmxlQlVFc2hSbkgxNlh3WWVwK21PYUVtTjNBeElNbTBuSm1wT3l5SEpPU3FM?=
 =?utf-8?B?RGYrZW1xdkYrdkpnaHhrUmxtOFJBYktJZDhWSXdTd1EwMXIxZ1h6S0t3N2tY?=
 =?utf-8?B?NXZLVWgrREZmSTAxa3NKczNSeFRDeDhoOHFwc3VNQWxMYlFtSThLY0IyODNQ?=
 =?utf-8?B?dVE4REZQUDkrREVCNWRmNTRTN1c1S2MrUGtOeDYreldpVURDRHhGZmhkWmkz?=
 =?utf-8?B?Z1NJL1lRZ1pYRXlIdGZPQ3M0L01qZkVrN1VINERMUWlBMGg2N0FzT3NkV1lx?=
 =?utf-8?B?MHc3aUdBZHFhaUNyQmRiTnJhd0xUMkhwOVNoamQvd2hHc2NqeS8vYm1OQXll?=
 =?utf-8?B?a21WSkY4WFJWOE5XS1BoQ1VpR3dqY3lQYy95VjloZ1EyWDAvNiswdmw5R3hw?=
 =?utf-8?B?ZXg1YXJWeVVCOW1nVnl0bUZXaGRqaTNrbzNydG1WYVMzQmhjY3R0UUk1djZl?=
 =?utf-8?B?SzFOS0xuZkdhc1NpcnMrWFRzU0oyOUpLN2xlRVZ1NFFWZjRkNlpxK1Vhc0k3?=
 =?utf-8?B?Z1F3bCt5bms2RHhvakFET1dIcTFYRHBvMkZVMHpBc1MyYW1CZ3BnNkdsVThH?=
 =?utf-8?B?RHhqU3dONDN1dCt2VDRUSU5hSFFBL1JVOTdPWHlZRnphSGM0a3JkN1liY0dm?=
 =?utf-8?B?enJpWW4rOGdFa21OUzJaaVJnMk5YSVV6Ui9majRvSW5Tam5yT3lNTFJqcXVP?=
 =?utf-8?B?RkRQelRKaXBFZzdXYUs3b29sNk1pUEJ5R0JMTzZNZUhkTTJMRk9nOS9RM3JE?=
 =?utf-8?B?TjRkL2tnaENLZGdjV1NnaGs2R0FSTENFUENPTjBVbDJ5R0dDdFloQVJPUjJX?=
 =?utf-8?B?WEpzZU40dXlOOVB4c1dSTmltT2RXRjIxQVVHM1k5WFBPelgrNnl2Q0R6a1pU?=
 =?utf-8?B?enVSVGl0NlQyZkRHRzd3MGxHOFZON0VzN1d3NUhjb3lwdlhjUzM5SC9TRW5M?=
 =?utf-8?B?WWorZVRqd1doMmJGSTNRUXhuNFdJQkRJeDBlN2k3UUthY3NSc0xLME51eC9D?=
 =?utf-8?B?MndWY25nU2xuelJyWjZ1VkJRNXg2dnlMQnZKL3RrM3pxNFhxV2VFWjVLeHNo?=
 =?utf-8?B?Qm9NNms1S1RFbjFGSnFrQld4NlFxN2FvVzBYRUFLRkRjdHBUTkw2S2ZuL1U2?=
 =?utf-8?B?dlM0YnF1bkdiV2p5VUxqQzBLQjZPZjIzK0hIdXVUUEtLK29ENFp3Tzg2cVpr?=
 =?utf-8?B?dVBxZXNaUjRtRXR1dTlZa0lqQ1JHT1ZMUkR0M0pvUjZHek5oakVLb1BsRmFx?=
 =?utf-8?B?elJRQ2dlcldDT2tRNXdwdHNodjdpb3hBbDNSTHZ1SmtyRWF3WWRoajJQUGlD?=
 =?utf-8?B?S0Z3MXBzNHByNUdGUUJoYkIzRk9NaXJkRlZ6S2lSZVFnc2F5UkllY0hIUFlV?=
 =?utf-8?B?OVZHb2RHeExFWHFjNStuQXNkUklVa1o1S2ZZVG1SQXdOUUYvK2JQYnMrcDBK?=
 =?utf-8?B?NG9pNW1SSjcxaG1kV0Vkb1FrUENiUnNvOTh6R3UxancrRGZsK2JmODg5UHFJ?=
 =?utf-8?B?elBpcEd2ZEYrdDNUODF4NFNQZGkrUUlsc1FFNVRSUUhRWm9KcmVIUkhHQjJj?=
 =?utf-8?B?bEFTVzBLMDAra3FqazdiWm4zY3pXSmdtMFZwWkhmZ1Njc3J5dTFHSjVMSGFk?=
 =?utf-8?B?TG8vTk1OU0FSSm1wVUxCTDgyNU1XR05GNmhlbXdtTzgyVzNuQ1d1cklIOENQ?=
 =?utf-8?B?aUNxb1pCM1NHdzRZWTVuOTUyNmtMTXhnNFY0a0FMcjBUUjBHNjNwUTRiZDRN?=
 =?utf-8?B?U3N4VGJ0NGp0UjhNRGF3UHUrTDJ3Q2dlaFl0bkkrWjVpNDIzaUpKWWMxQVpw?=
 =?utf-8?Q?/2vyNuqe4cepMcC7jlx2jwl7J?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0004881b-955d-4e1e-f81a-08da7c52efee
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 11:08:08.2330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LDX03Iugldxkh/WrGLCIeOUMXdVFX00vyx7waCkm7nu1Eo8Wu1JSWQE4h3BGg8XWWc+MwZ5H3S1QNsCAS6/0UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB2825

On 12.08.2022 11:53, Bertrand Marquis wrote:
>> On 9 Aug 2022, at 09:58, Penny Zheng <Penny.Zheng@arm.com> wrote:
>>> -----Original Message-----
>>> From: Jan Beulich <jbeulich@suse.com>
>>> Sent: Tuesday, August 9, 2022 4:27 PM
>>>
>>> On 09.08.2022 10:07, Penny Zheng wrote:
>>>>> -----Original Message-----
>>>>> From: Jan Beulich <jbeulich@suse.com>
>>>>> Sent: Tuesday, August 9, 2022 3:59 PM
>>>>>
>>>>> On 09.08.2022 09:53, Penny Zheng wrote:
>>>>>>> -----Original Message-----
>>>>>>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf
>>>>>>> Of Jan Beulich
>>>>>>> Sent: Monday, July 25, 2022 11:44 PM
>>>>>>>
>>>>>>> On 20.07.2022 07:46, Penny Zheng wrote:
>>>>>>>> When a static domain populates memory through populate_physmap
>>> at
>>>>>>>> runtime, it shall retrieve reserved pages from resv_page_list to
>>>>>>>> make sure that guest RAM is still restricted in statically
>>>>>>>> configured memory
>>>>>>> regions.
>>>>>>>> This commit also introduces a new helper acquire_reserved_page to
>>>>>>>> make
>>>>>>> it work.
>>>>>>>>
>>>>>>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>>>>>>> ---
>>>>>>>> v9 changes:
>>>>>>>> - Use ASSERT_ALLOC_CONTEXT() in acquire_reserved_page
>>>>>>>> - Add free_staticmem_pages to undo prepare_staticmem_pages when
>>>>>>>> assign_domstatic_pages fails
>>>>>>>
>>>>>>> May I suggest to re-consider naming of the various functions?
>>>>>>> Undoing what "prepare" did by "free" is, well, counterintuitive.
>>>>>>>
>>>>>>
>>>>>> How about change the name "prepare_staticmem_pages" to
>>>>> "allocate_staticmem_pages"?
>>>>>
>>>>> Perhaps - if what the function does really resembles allocation in some
>>> way.
>>>>> So far I wasn't really certain in that regard, and hence I was
>>>>> wondering whether "prepare" doesn't better describe what it does, but
>>>>> then its inverse also doesn't really "free" anything.
>>>>>
>>>>
>>>> Hmmmm, “prepare” with “destroy” in its inverse? Do you have any
>>> suggestion in mind?
>>>
>>> To be honest I was hoping you would make an attempt at finding a suitable
>>> pair of verbs. To me "destroy" is more the opposite of "create", and I'm
>>> unable to think of a good opposite of "prepare" (short of resorting to
>>> "unprepare"); if I really needed to come up with something then it would
>>> likely be "cleanup", albeit I'd not be overly happy with that either.
>>>
>>
>> Maybe unprepare is better here, I was searching linux code for the help, and
>> they are using prepare/unprepare as a pair of verbs a lot in drivers codes.
>>
>> For the renaming here, I suggest to fix it with a new commit, since free_staticmem_pages
>> has already been merged.
> 
> I think that unprepare is ok and it make sense to do this in an independent patch.
> 
> @jan: can you confirm that you agree with this way to go ?

I don't mind this, yes.

Jan

