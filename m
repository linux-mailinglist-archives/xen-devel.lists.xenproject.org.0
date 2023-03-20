Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B846C1A5F
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 16:52:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511988.791503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peHo6-0003RN-Vv; Mon, 20 Mar 2023 15:52:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511988.791503; Mon, 20 Mar 2023 15:52:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peHo6-0003Ov-T1; Mon, 20 Mar 2023 15:52:22 +0000
Received: by outflank-mailman (input) for mailman id 511988;
 Mon, 20 Mar 2023 15:52:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AUe7=7M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peHo5-0003Op-G6
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 15:52:21 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31068a9e-c737-11ed-b464-930f4c7d94ae;
 Mon, 20 Mar 2023 16:52:18 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GVXPR04MB9759.eurprd04.prod.outlook.com (2603:10a6:150:111::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 15:52:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 15:52:11 +0000
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
X-Inumbo-ID: 31068a9e-c737-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JNU8UU1C9nSSzG3pXKeeuMTMtlknPnlyI1ckpkztK9dQeI1Lteb/mWYMLyhhxHgMc/7IDofA9loyAQGgT3mQB1PcyzpEmiF1wtKo+sTwdi8XW14UlbhenUH3FTaJSSmGo7UyNLRpaiCtsvEEd6737rsZCM+TgZgvvGzeYnGXNFyFYbVYtYxpUlXFpq6Lnd0w4TjbCh8dKmkAhJ5saYvsi1wYgT9qtBuFnk6dpqgtet1NnAGNe8DAP07ZUZohYbjfXc/6kLaK/odQRANVIVeZAwoP/czzwYsW/ZdgmVbIDxTpW5MfPxHfWANen6/AfncJPs494W9knUZg5OFmQt6+dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=whgh7E4wYCKa5w7i14KUbrAoNj8Edyj89uGBumGUEDk=;
 b=O/pdKBmLEWffyKYWWDk3OaW9uYvwin/v0bpTOvVCq3P2vy98WSyLj0MYvcZ1RpUk4zFPYh7CLi0hmnN9aE8TpIZXsOaKyZeKB3ZOKXZiQhHFkHMXwxKtXkA5fyz5L+J+wENsoldZ/6qrsqFphCObqFU0F4Qw5rILjIQ0RMfI/Pq6C0do0bZHp5KbBfssy2o13KsksY+ZpkU4ll2/uZdEo2dLhvGjinLscE9vLa6AhpmTBvIFfpzJTmqTPPk8zKsFtkSTT3XGJ5xbKYqPSMVgnq7UyarN6hPsHZwUVmq9wItXW4canxbrBwGuEMQ+aZOB4yn7jxl9DPbf/UL/ElSYsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=whgh7E4wYCKa5w7i14KUbrAoNj8Edyj89uGBumGUEDk=;
 b=rIJF+E6e86ftEnmGdKe7YI5fRf8hvg0USUQL1bF7NMN+vGKz5d+mkC/A6RG8qCeZq2rng9piMiWukPzoqpMBYCZJ8StukSVjfZNWoVMd2tKWq5pv7LWW+qvvA1rkojjew5G6FsTNVGCPoO5VEb4X3Y8Wao5KgvWQ59yu4JVvCq0gXslUoSj/9s5NevR3wS/e8En8q8QBGtNpOKATkZSU7o+HQNRqPr4RPwNGFEHM0Q4p2BIuRnMquVe6VSLlx1LXk00W8JfBkjU56TCcmqx6+Eb4B5kInYbbiRgrcuau7fpuq6TFDc7HdlrgGWMxjEi62pPtPYhKrrQ94J5kR4Lu4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9fc0babb-c3c3-1896-c5fa-e7f5ae2ede27@suse.com>
Date: Mon, 20 Mar 2023 16:52:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [BUG] x2apic broken with current AMD hardware
Content-Language: en-US
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org, Neowutran <xen@neowutran.ovh>
References: <ZAiobgH4L0OAS6XP@mattapan.m5p.com>
 <a2e5cb62-9aef-4f91-b5e9-35fee6739fc8@suse.com>
 <ZAkVVhIldUv/xQqt@mattapan.m5p.com>
 <21436010-8212-7b09-a577-09d3f57156bf@suse.com>
 <ZAvGvokloPf+ltr9@mattapan.m5p.com>
 <f33c9b8a-f25d-caab-659d-d34ba21ebc25@suse.com>
 <ZBOSKo+sT/FtWY9C@mattapan.m5p.com>
 <e5b28dae-3699-cb0d-ab7e-42fdd42d3222@suse.com>
 <ZBSi2KfoQXo7hr6z@mattapan.m5p.com>
 <b2eaeacc-de5f-ebe9-a330-fbf9e20626b1@suse.com>
 <ZBh9sueCbOSX8iUu@mattapan.m5p.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZBh9sueCbOSX8iUu@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GVXPR04MB9759:EE_
X-MS-Office365-Filtering-Correlation-Id: d23298f7-3313-4e2b-ecd0-08db295b1123
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cNjqnaNoRpP7tKStZX5NwfZDlXbcQ7Rtk5FnqHLk7WYJtFrE0HUEBV9dnRgn1tZaz6cOhBIW+fXattru3s8wATjc/m3PThL6RxaO7P5cGG9lPAGtuMUwnfjMXeWAZe+q+g1Sh/tz+vYCFL4Z4teU1ztGOcrapcXIo6NBrIPl73Un7zwb9AIw7RLu0bKH5jJex0vvydkr7uvhF3UJ6LRpKFev4t28HoC+Kz3ODsGJQw3bqQ8SdXYhf11XI7RTW0TgCG6YepuzqO0R8KkZklmousDpvdVMxmPjZ85ot/yfwVsT9r5QRmrCpnyaFDF1oLccDCbY1sIbBDe396xacDwQpGbcV0UwfhrG5HEMa5T/8dN7AmTQQIQFNpo39ySARUkKUAzGzZOJbAsgZIce0kloFY+qv+3rTBKF7DM3y/A/UmXxhNYFSz0UWIAgZIj45WBupTPQCahc9Yym+S4AnmLBK926EbhN4Kf4tBjT8sO6mP6seC7TIAQkh26kaxCxfURlagxCMAGcagTcy2aGRCBMIEfHj3QG9xTf/lmS8U2ySqXPx3PJJsVgrJG7HTZTlnaAFJ6bMb70PHVA/zxmIiYv3Oqb0WJDtHsAv6MiUl4d+5LvOAYqXst54UMcw2l2ney25kKVKAgCPYBdAUvvpuKVxcAUJF9iZgE0f4hH9W9XPbLFnZBxWtqA1yRMINf53GMerKdcFryQcfEdcACvDGqZDm8bDBZY1nttfmSsi/gT8cI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(136003)(346002)(39860400002)(366004)(396003)(451199018)(41300700001)(31686004)(4744005)(2906002)(8936002)(8676002)(66476007)(4326008)(66556008)(66946007)(5660300002)(316002)(31696002)(86362001)(6486002)(478600001)(36756003)(6512007)(53546011)(26005)(186003)(6506007)(38100700002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDFCNkZ3MXJIalVCaStJemFXWWFObTdWd3QvcXV4WWcraS96cGZWUmZLZE16?=
 =?utf-8?B?ZWY5Q3dLUGF1OVJIR2phQk9jNWJ0NEdndFFMQWp1SktqTFdZS1dLak12c1dG?=
 =?utf-8?B?Q2RRT2JZYmIyRVhxS1JPUWJYemxTd1NuZHl0d2E0YU1rMmhJK3R4ZkliWWdK?=
 =?utf-8?B?WXJRMG8vTlJJNTBuQi9lc283M1gyTnpxVWdDYlJSaXdiQWJpUjJRNkYzT1k3?=
 =?utf-8?B?R014c281QW1UV1AwVEFXRC9DWXJDbkRkU1lhbjRweWZCOTduM3pPTWlmdTZh?=
 =?utf-8?B?ZkZ4aWx4RitrRFF1VjhlcnU1cFNZQy8rT1Y4anVETEwrVUFnOGNUM2FKVnZB?=
 =?utf-8?B?ODQzMlRVWTNPd2h5K1I2TWdPMmxDOWQvd25kUFJwNW1XVkk3Z1UwLzR1eHVa?=
 =?utf-8?B?ckJjdGZicEdBa1NBM3h0Nlk5TTc3Mlk0bXFFTk15NGdseVRKUFgyK3dmNHJi?=
 =?utf-8?B?R1kwYkViZCtSaU5DempITi9pWEJxdk96SUVGTDNCblBuaVZiRmowTlRoeEQz?=
 =?utf-8?B?VVlaamdVYTloNlJiV0RrZjF3YzRlNzBZZHVVQkhObHViR09NNjlkY3IrdG1k?=
 =?utf-8?B?QU1XcHNYTmdQNzNUL2k0UXVhZkYxNnFpb2NST1lCKzdiWFJwbGZlNkpBbWlo?=
 =?utf-8?B?VEY1dDB4eks2RVJNcDJFZmxmUnB5VDFPellmOU9MdUNnUkhoQlVYWFBjWGJn?=
 =?utf-8?B?a20vWEp5NFc2K2pKNUR0OGhFYVhhbG9BdSt0SG1OMldsQ1V1WUVlZUlIVno1?=
 =?utf-8?B?TWVSTW95ZzluNitXeElYNXhhRXE1R05DSm5QM3hhN2FXSUs5QTdUdW1LeHdR?=
 =?utf-8?B?Mm9ER3R2SVUyeWRxZkFEU1VSa1JGYjUreVM1RExHRXg4a2NNT3d6UWZ3SzRn?=
 =?utf-8?B?WHVEVVIxRUN0MDNLdmpaTEZrRkNDNUhLWStkaG0vd0wwVS9TRlZFRUJKZnJj?=
 =?utf-8?B?S2JjeFZVcHRhTWwvZ01KNkdjRmFhRXNGSytNZXErclJhd2hXTkt4OVJtRGlm?=
 =?utf-8?B?LzZVVUxnRVRNQThWZEsrY2pEMWhpcmF0VzlUOGV5WG9kMFJxRlZIMUJQRmFM?=
 =?utf-8?B?WFdmaGl5VGZuUjRHbk9BempBU213emxjSWE0UzRTZGIxOHo1R0VJK3Ryb0tl?=
 =?utf-8?B?aHdxaElGek96Z0FPUk10c3ZRU1RPbmY2ZE1ZbFZDQVI1elFlNUk1dDVjbkI3?=
 =?utf-8?B?Y1VRWGFWa3NUcTg5dlRoL0RLMkQ0V2ZoLzNDV2hhSW1wWm9JR0VQRThxWXJk?=
 =?utf-8?B?M2JKMGZrbXhPbU1od3VzRUxBYnRlQ2lxV0JNZ3VFbGdGZGNwUHU3Y1MrbEUr?=
 =?utf-8?B?cjJ3eExYMUMvUzRxMlJDaU1qTExaZlZjY0c2Y0JWWUxPdC93cVVXd0hiblAr?=
 =?utf-8?B?OFEvQk9EQUhjTzFvMjdJZTBwZDZsb2ZXby82QTFXdSswWkhmR0VWdk9ZQVVv?=
 =?utf-8?B?cDlidEhHRG0yYlVxY3VuVVp0TWwraitLUlhPdjR2YUFZQXJ2cXNNZjF2eDlx?=
 =?utf-8?B?ditnOGJha1d2Z3l1a3pxaStqOW9MM1I0MTZkdkJLd3JCTDhibDNnRDBKK3Np?=
 =?utf-8?B?d00vZnFCdkQ4c2F2R1FVR2JMSGFYR29xUFl0V3JnbU9IbkwreHlxc0JFem9N?=
 =?utf-8?B?Ri9iSVVKTis2N1hqY0RhUzBaWE4zbGJPM3dFOG80MjM2NE4yQzJBSVh6cU41?=
 =?utf-8?B?T1d5bTRlZ2d1UUtMYVZscjJYV2NmRlFESis0bkNHa1oreGx1bUxERUNYYWE4?=
 =?utf-8?B?Rk1hREtqcUIzMFdxcWJ4ZkFaTXlDTU94SHlLU1pRV0p5RW94d0JnbVJwMXNn?=
 =?utf-8?B?NGxGUlZZL1NPVDJnL3YyZVlSbk1FSVVQS2lrTXRvV2NzdUFpeWhDeUZRcGNn?=
 =?utf-8?B?dVNadmlXc00vcmttV3VJaHhscFpXVjFkZ0JTWUIyeVBoRm4rSHNaNmJ4Um1P?=
 =?utf-8?B?ZnZTWG5nVy9oS2wyNnNSWE5ydFVVY1R3akNaL1hDMENzWk9Ud0pTSGJiSjND?=
 =?utf-8?B?cWZnZXNrWCtVVGgrZWtnQmRtVU1pV1Vhd3grSjhhWjNyZzVzZS9ndUxJL3lE?=
 =?utf-8?B?U2dqRW9oNEZ4cDdwU0txbjdtQTFQQ2pQbE9aRktmZE9vQlRNTDBSVWxFOHlL?=
 =?utf-8?Q?Ae9AlbvDE5TaKbCfxMfrJJea5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d23298f7-3313-4e2b-ecd0-08db295b1123
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 15:52:11.1261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zf2Js0Ev/I/GJLe4ygiEEXMomg47/MufVDQrUEb2Ng7VpJPONVhBWeCI89xParrR7F5M+ZGbLb9kNRL7wpVF8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9759

On 20.03.2023 16:37, Elliott Mitchell wrote:
> On Mon, Mar 20, 2023 at 09:14:17AM +0100, Jan Beulich wrote:
>> On 17.03.2023 18:26, Elliott Mitchell wrote:
>>> I'm tempted to propose allowing _Static_assert() since it is valuable
>>> functionality for preventing issues.
>>
>> How does _Static_assert() come into play here? Also note that we already
>> use it when available ...
> 
> This is more in relation to the patch.  Appears GCC's C90 mode disables
> _Static_assert(), so the _Static_assert(ARRAY_SIZE(args) == 8) had to be
> dropped.

I'm puzzled by this. It's been for a long time that we've been building
with -std=gnu99. Plus you simply open-coded BUILD_BUG_ON() - if you had
used it, it would have taken care of the necessary abstraction for you
anyway.

Jan

