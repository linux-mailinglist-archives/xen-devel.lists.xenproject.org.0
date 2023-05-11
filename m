Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5AD6FEBDB
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 08:44:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533132.829528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px01d-0006ar-3b; Thu, 11 May 2023 06:43:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533132.829528; Thu, 11 May 2023 06:43:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px01d-0006Xo-0X; Thu, 11 May 2023 06:43:41 +0000
Received: by outflank-mailman (input) for mailman id 533132;
 Thu, 11 May 2023 06:43:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CrlD=BA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1px01c-0006Xi-79
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 06:43:40 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20623.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27c8a928-efc7-11ed-8611-37d641c3527e;
 Thu, 11 May 2023 08:43:36 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8488.eurprd04.prod.outlook.com (2603:10a6:20b:41b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.21; Thu, 11 May
 2023 06:43:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 06:43:27 +0000
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
X-Inumbo-ID: 27c8a928-efc7-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RuA1kLntLId123K2dwZnqFylwdHHugLn6LxdGmBUHugtIKwTNSQsadhJt4sxl5vKzHFaQWDcB1itYJRMMi4tsFtrhMjjVnF/zJ9RHKMCVA1jK3d6EaT3idgrU3lJjviXLh/b5sftR7YH/WyTzQ/C62d6DSVtul62P2KZd+4G/cbrwvhpicFr4wHDAduIa8u2UFWB5xQZm9lVO7AN8BO+z7xPh+xSwjCnStmzduBPoUcYWTa2jqQEPUdQFFnpTt5zhQCoFyzMY18SECwiiRUEXTY4ES70n5eJ/mc8tz110B8WNTUzhVhRgAGTdd72xiCe0NofuVIh31uEgbntExmv9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gxUeFdZzi4EVHfRrfaok42W1uoCrMVnOIH+dcDcBxHE=;
 b=gvR+2oiwFH2mUzWcuyIoFrP78LyzMEUoCXjTL8QgmSklUkN0AB0iUWeYJkyhYrmJPpoBEbgq53wQPf6uYdMJIpN/JFrPw6c7af2YHsSVimORfeZ+sQHCLETBawLW4F/JokS0b9Shz3iho4OpPh0SPMD3JgcKLYPeXPueA+TDZSDFpL5oURQIuXHmRvwT0MlJKP2LI1ue2CUT7P/p8vKCTTB/fR2bZy3Dl9yJowKGJLhCUcc1iJxMDjAuSGlxPaiUoTCNTn2dqga4uBoCB0oHqZ5E+VnU7TE8gyqQomfb5qCO7MOK0M/X/on0U5XYXwfjUDmmEybcWLK2NPslW8Q9yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gxUeFdZzi4EVHfRrfaok42W1uoCrMVnOIH+dcDcBxHE=;
 b=O5g2JbFj60fkE6jx/mC+rxBEBRqfHZQYf+5Xr5+sD+vZM7Y9rbHDE2NR+G6+C/EjPJsAxwLF6nxlIxRbe32ibpkESO+PEqJAu7JbRkN52nyuJ7KAMyxl0XrSqLsgbkoY+mAnv7TcbZsrLJfgv2crSvyWwEP4TkMYiMszWOeHYEDUKl9MwOrEYrTFiagZCHwIe88e+4VQq/KVg/Gt9v38o8Ehyowt8RUu4x3s+z6up2b41dbqBk811BPPpNtDWmjWtnBt1fXXqYWVr0kcfVAM4guw2FZbwv/xMVqyKPml1Y2lyf1uazbx0jMhZAL68vv+NLb7GVDX7mgxYptECNwbdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <62b721a0-7d09-751f-5d95-086584f3d7e5@suse.com>
Date: Thu, 11 May 2023 08:43:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/6] x86/cpu-policy: Drop build time cross-checks of
 featureset sizes
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230504193924.3305496-1-andrew.cooper3@citrix.com>
 <20230504193924.3305496-2-andrew.cooper3@citrix.com>
 <6531df09-7f7f-a1e2-5993-bd2a14e22421@suse.com>
 <18090224-6838-8ed4-6be5-ae10a334e277@citrix.com>
 <bbbd4c8b-e681-f785-b85c-474b380d6160@suse.com>
 <742a5807-dd53-0cd1-d478-aed567d5c4f5@citrix.com>
 <c8cb1df9-33af-8cae-291d-9a86a3b7f6b9@suse.com>
 <6d62ba23-d247-08da-3a84-ed8d1cdc4271@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6d62ba23-d247-08da-3a84-ed8d1cdc4271@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8488:EE_
X-MS-Office365-Filtering-Correlation-Id: c9fc5d2f-fac7-4791-f6a0-08db51eb0673
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ma93dwO/Dob/JBI2thkvtK0K7k2sJ+w0cT+wKR+snNqbYG4+O2O+bqqyRzmQmhAOLsiFdmup7BZElZEbs6kM4BdVOw299jttJnAyXCnga5e+UfMBGoxDrU2O/Z9k1WR0nORmgrBZfCi0zwsSomzL5QFpgedY3VUmXOS16IZ2XL+8ldaO10Ts9itRF5pabePf155/fDzPUNJ/5aP6K59vBbK87np402QNkJbWvGrkyqicJ3Gc+rATiUbUfABm2JhQf1+rsrqbmJ1MX4Mq34Tfmzo0GX8KLXiFJg5PIbJoZdYNNK1yLYPLOAX+c+SEZbpp/bYfcufdqQgwjj5vBbYiRoa3C3pmsh5xal/v/W0LQNTkvMeh+/OjeeDqqZcYQpW6Crw1+BQZPVe72cVyBz6VTCpmp7c4X5SZyYEWBB+XyFRlsCAO57kapjUXj+m/A1BrNBP9DXKUOLDOHYewfFd7kbhROmj8Ha6x6hH42A0r4egzolYxNoq3ABo6lbdWOawcYD9mws4kDznSFG3dBggolzXI9GGnheH54HG0k19ddARq8CP1Qu5M4qyXlBnhvx8MDM4efWRN8VFJU31ySA2tykPYYKv/muu2b7DEKtxQ7euqh4GE2p0XDadELXeHDY/nZBLQ+zT1A/vOKZmGjMQ1/Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(366004)(39860400002)(396003)(136003)(451199021)(38100700002)(2616005)(83380400001)(2906002)(86362001)(36756003)(186003)(54906003)(53546011)(478600001)(6512007)(6506007)(26005)(8676002)(6666004)(6486002)(41300700001)(5660300002)(8936002)(66946007)(316002)(66476007)(66556008)(31696002)(6916009)(4326008)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkVMQVkxZGxVN3dwclh1cjBJSE5iU20rcm1TNTZsSXJYL3pDVE5HNnFoTnZq?=
 =?utf-8?B?eFRUellCYUQzd0VmS3A3QmRsSEltQThWLzJiN1NjNDM0Y1VlRENRZmhncVFa?=
 =?utf-8?B?V3JkNktBbHcydjJKTUVmZ2ZKUkc5VzJCVmN2bVlBeTY4UVd4YVlzaXR4OFhE?=
 =?utf-8?B?UzF3UkNCanpIQXFpQ3UvY1lEOTFXWFd3RUVWK0wvTlRlcUJ6L1haK1JKcCsy?=
 =?utf-8?B?R3JNUWw2T2xWdFlsaWFOL3IvUThQWUpMa0xseW92QmhkZnRVdkRPOFpVRk9j?=
 =?utf-8?B?SDdSUUlpV1pkcHFLQW1Bc2ZBYWIwZ2E0cnpEMEUrNFZ0Y3N4RUtjUlJaYW5Z?=
 =?utf-8?B?S204a1JWNTJSWU14TlBKS0RMbkZhVGJ0aWpjS2FMS0lwK3kwSVlsRTNEWU5N?=
 =?utf-8?B?SGYwcmw3MUdkMzRqeXdsZFRyNnJEN243cXIveWVJQ1BMRGRiUkdOZ1BHTVk4?=
 =?utf-8?B?aVYrQ1NFMDJIT0VoZUMzZmExQksrTWFZSWtvanQxU0NtZ0FZa284eHRrUGdh?=
 =?utf-8?B?bS9BQ2pkQU9obWIzbVR4ZWNPN3Q1enhkTlZsN0dhSDlKeW1QVGtLTmdRVjZG?=
 =?utf-8?B?UkFwNWE1VUJ6Zkc0WTBVU2UwZFM0dytwWVJuVVhVS0lRajBmcWN5eEVvYStM?=
 =?utf-8?B?NENObjJsSCtncnhXd0VUeTNVL0hWbXhmaFlrSkdjN3pvZTRTQzFqUy92K3hx?=
 =?utf-8?B?QUppNkVjRENOYll3clcrbzJnQllaQXNwWVpBMXozcGtIUEswKzNYOGh5RFZi?=
 =?utf-8?B?L2lSQ3VoTTBrcC9RdGJEVVdHUGNNa2NHUkJISCtjR1dWMVJ3RkV4N2JWR05N?=
 =?utf-8?B?bENFQjlrL0dZZU4vaWwvSmU2VkFmZmF2cGgrMmkxcFcxN3c5Rkx1YXRMREVR?=
 =?utf-8?B?ZkNZMmRCaFNnUnM5dUN0cGtrY043cmJhZy9pM2NPUm5LazUvVllJVnpvSDNU?=
 =?utf-8?B?bWhpNE5EYkZVZ2FyeitJSkRxWXFueThsZGdPbmdsRzlRdDk2NGt5czJrdFoy?=
 =?utf-8?B?OS9zd3ltaVhRNlVxYW5qY1FIUVZmSCtacWhqWG4waTVBQVdKUUdETG1IQ1NV?=
 =?utf-8?B?Z2xwSjNnN1NGSVZHRGIzMWt2RGVHMTdTOVlZVndKZnRCaEZqemRKbzdlNXVx?=
 =?utf-8?B?T215aWlUdkE2bWdrc3ZVZnVQU0ZkLzBHY2hMcGZDZDFDd2FpT3kzbk5pNWp0?=
 =?utf-8?B?NVgrUHpwT2d1RjVES1dBcUF6U28yYXVnK09tK2szcmFSM3ZDR2gzWFhBNEZz?=
 =?utf-8?B?N0VyUExxZUVnUmVEZ1Z3V0xTbXBhWGI3MDFzQXdaS0NnK0RZd1NsVFZDWTZk?=
 =?utf-8?B?S25vaWxrbjNlRHhuOEc4UTVqVVFURkNucU5ha2gxOWlBK2pMeW55a2NlcmI2?=
 =?utf-8?B?NWZ4bHloVENuY0hhK3BqckJzQ2ZPQ3ZsNk9lWFdsbkoxeDZKRHZnbWFoTnpE?=
 =?utf-8?B?dDREMW01b1VSRWIwdUxsMGRJVVFnUFV4YlU0UlQxWGVtOFNXZUhTMFpibCtT?=
 =?utf-8?B?KzJ0OGQ0OVpXd2RVby9FRTNZNkp5R0xMYUZhVGRBUjVoNmFmRTRkNlJKNG5t?=
 =?utf-8?B?TzJncS9GN1lnOVNwZFpOc2dQSTl4cTVNSGJldFlPSjZtSmJ2cHlZUGJTdTN2?=
 =?utf-8?B?d1Arblo1NFJnTHlwUTZyMFZlRDRlUGIzTjZZa3gvenVEZEU1QVVHZUYzblkx?=
 =?utf-8?B?a1RUNTRzNGVVdzZMY1dBK3FlZHFPR2JXdFdNWGltenVibzlxYjkvcHM3c0Iv?=
 =?utf-8?B?VGljNEYvWjg5cGxsS1l0dWY3OTBQTDBCeHR2Nnhna3hmbzhiZzhvNWVGaE1F?=
 =?utf-8?B?OVpJYTRjd2ZGaHBKbE9KQWE3ZzRRaS9NZmpad0p0a2xyNjFYSTV0SkRZME9P?=
 =?utf-8?B?ckZaUDREWVBUTjBmbkVtTDRqQnNJTUp6Qno4VlJ6TVh1eFc1UUoyY3dLMEFl?=
 =?utf-8?B?dDFmRlphSnRGTVNJZmU2UHdzeFFnN2NBK0k0QkhVblhFZVh3OXRxRkdiK0ZU?=
 =?utf-8?B?ZUtLOEM4Y1RuMCtHSGFXOU8yelNNcTNlZktycnNVSWlsNUpXNUdpc1JvcEQ4?=
 =?utf-8?B?bTFUZFFhZmRrZHpqVWFib0pvMVFZOHJxdEdBZzdIQzlIWlNvV1F1MkxtZldD?=
 =?utf-8?Q?CoTmgQsx3xjq2l6HddD0gkoJ+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9fc5d2f-fac7-4791-f6a0-08db51eb0673
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 06:43:27.2668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XGdK1+rhk4+e/bHAmWUC6BjVRdTja2qNwjGbX4qaAky2vA6LqSDd7tZlhMbQVY6JqReOFHdiaB38KOYU3LZu9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8488

On 10.05.2023 17:06, Andrew Cooper wrote:
> On 09/05/2023 5:15 pm, Jan Beulich wrote:
>> On 09.05.2023 17:59, Andrew Cooper wrote:
>>> On 09/05/2023 3:28 pm, Jan Beulich wrote:
>>>> On 09.05.2023 15:04, Andrew Cooper wrote:
>>>>> On 08/05/2023 7:47 am, Jan Beulich wrote:
>>>>>> On 04.05.2023 21:39, Andrew Cooper wrote:
>>>>>>> These BUILD_BUG_ON()s exist to cover the curious absence of a diagnostic for
>>>>>>> code which looks like:
>>>>>>>
>>>>>>>   uint32_t foo[1] = { 1, 2, 3 };
>>>>>>>
>>>>>>> However, GCC 12 at least does now warn for this:
>>>>>>>
>>>>>>>   foo.c:1:24: error: excess elements in array initializer [-Werror]
>>>>>>>     884 | uint32_t foo[1] = { 1, 2, 3 };
>>>>>>>         |                        ^
>>>>>>>   foo.c:1:24: note: (near initialization for 'foo')
>>>>>> I'm pretty sure all gcc versions we support diagnose such cases. In turn
>>>>>> the arrays in question don't have explicit dimensions at their
>>>>>> definition sites, and hence they derive their dimensions from their
>>>>>> initializers. So the build-time-checks are about the arrays in fact
>>>>>> obtaining the right dimensions, i.e. the initializers being suitable.
>>>>>>
>>>>>> With the core part of the reasoning not being applicable, I'm afraid I
>>>>>> can't even say "okay with an adjusted description".
>>>>> Now I'm extra confused.
>>>>>
>>>>> I put those BUILD_BUG_ON()'s in because I was not getting a diagnostic
>>>>> when I was expecting one, and there was a bug in the original featureset
>>>>> work caused by this going wrong.
>>>>>
>>>>> But godbolt seems to agree that even GCC 4.1 notices.
>>>>>
>>>>> Maybe it was some other error (C file not seeing the header properly?)
>>>>> which disappeared across the upstream review?
>>>> Or maybe, by mistake, too few initializer fields? But what exactly it
>>>> was probably doesn't matter. If this patch is to stay (see below), some
>>>> different description will be needed anyway (or the change be folded
>>>> into the one actually invalidating those BUILD_BUG_ON()s).
>>>>
>>>>> Either way, these aren't appropriate, and need deleting before patch 5,
>>>>> because the check is no longer valid when a featureset can be longer
>>>>> than the autogen length.
>>>> Well, they need deleting if we stick to the approach chosen there right
>>>> now. If we switched to my proposed alternative, they better would stay.
>>> Given that all versions of GCC do warn, I don't see any justification
>>> for them to stay.
>> All versions warn when the variable declarations / definitions have a
>> dimension specified, and then there are excess initializers. Yet none
>> of the five affected arrays have a dimension specified in their
>> definitions.
>>
>> Even if dimensions were added, we'd then have only covered half of
>> what the BUILD_BUG_ON()s cover right now: There could then be fewer
>> than intended initializer fields, and things may still be screwed. I
>> think it was for this very reason why BUILD_BUG_ON() was chosen.
> 
> ???
> 
> The dimensions already exist, as proved by the fact GCC can spot the
> violation.

Where? Quoting cpu-policy.c:

const uint32_t known_features[] = INIT_KNOWN_FEATURES;

static const uint32_t __initconst pv_max_featuremask[] = INIT_PV_MAX_FEATURES;
static const uint32_t hvm_shadow_max_featuremask[] = INIT_HVM_SHADOW_MAX_FEATURES;
static const uint32_t __initconst hvm_hap_max_featuremask[] =
    INIT_HVM_HAP_MAX_FEATURES;
static const uint32_t __initconst pv_def_featuremask[] = INIT_PV_DEF_FEATURES;
static const uint32_t __initconst hvm_shadow_def_featuremask[] =
    INIT_HVM_SHADOW_DEF_FEATURES;
static const uint32_t __initconst hvm_hap_def_featuremask[] =
    INIT_HVM_HAP_DEF_FEATURES;
static const uint32_t deep_features[] = INIT_DEEP_FEATURES;

I notice that known_features[], as an exception, has its dimension declared
in cpuid.h.

> On the other hand, zero extending a featureset is explicitly how they're
> supposed to work.  How do you think Xapi has coped with migration
> compatibility over the years, not to mention the microcode changes which
> lengthen a featureset?
> 
> So no, there was never any problem with constructs of the form uint32_t
> foo[10] = { 1, } in the first place.
> 
> The BUILD_BUG_ON()s therefore serve no purpose at all.

As per above the very minimum would be to accompany their dropping with
adding of explicitly specified dimensions for all the static arrays. I'm
not entirely certain about the other side (the zero-extension), but I'd
likely end up simply trusting you on that.

Jan

