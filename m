Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EED54830F
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jun 2022 11:19:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.347907.574234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0gDm-0003u0-06; Mon, 13 Jun 2022 09:18:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 347907.574234; Mon, 13 Jun 2022 09:18:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0gDl-0003rB-Tf; Mon, 13 Jun 2022 09:18:53 +0000
Received: by outflank-mailman (input) for mailman id 347907;
 Mon, 13 Jun 2022 09:18:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T645=WU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o0gDk-0003r5-H8
 for xen-devel@lists.xenproject.org; Mon, 13 Jun 2022 09:18:52 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on060c.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5b128c7-eaf9-11ec-8901-93a377f238d6;
 Mon, 13 Jun 2022 11:18:50 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7824.eurprd04.prod.outlook.com (2603:10a6:102:cd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.20; Mon, 13 Jun
 2022 09:18:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 09:18:48 +0000
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
X-Inumbo-ID: d5b128c7-eaf9-11ec-8901-93a377f238d6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HpYuO+uMbPdYY0Bb86idYNgm7q/+0G8mFAG9o1+xMhPElOD4EwIOxKMSiCgRiUbXoAnxql2+BFT1DfFyOzGtvkt72T0TOc67gxaYDXHp3rI1cteDWE+mkQeGy+QmuPvGhGg90vA0YS/nf9tLXPdRAtqE5GKEZzdq+RITVlaerhlVovng/r8G00iZIM6J5nmcaMhPe1yqsRqfK7y8xR/2I5E0xR0uZTg4shzW7V5rBHZPcSrQRs5cZuEvXxbPlcJyJHpIT/OCstgIMnkVaE4OdkZ4IA66F1o1ivxS9SRwdlUJF5GP/IWiTb47cT8fDOCRBTnpUqJALOKR3mZbnBroZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/MfOVtcYc6x/YwYDCZkS2LDzAnNUQsrVsmViqAcAxVc=;
 b=NjRo6x8gBGuKSWUnXYkPSsEqxHRvyb0iFA+Lh0f/YD4GigrKUb5187eUfSVjhSea3Wbef1ib4kLdumHGWhBa5rLS+KsFHzc/HeIjS0qMLYS/eCMXVkGRmv2Q6ubO5NkMebE44ztQu24OEFF4ryGaZMSXU1BW5+6qOr4daQ3B3Sx6hI6PZeMuIfuDMs7TvVmUONYJo/VeUJjsW1Y02Es2oeX+QS8bndVavgA+Xoyrr/px3UkIycdyCc3knutkTZMzd1URyM3SZO4B/eg2cgM429I3sduOKD2+kWDabtENqaNR+G/v7jWzo1OUt/E0yj2tY8X9QRnqQO9juj4UAwznUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/MfOVtcYc6x/YwYDCZkS2LDzAnNUQsrVsmViqAcAxVc=;
 b=oC3BCGc1Lyg1A8TcC6blp6uBL6lWM4DUd046cwFBzOHUYNLz/bIIouRlMQHpP5Lv30MadJMIM+xBNkMFv0UrPzKdjWdP2ar8ZLN1gl/zVc3ZKYGRYJQWzkXl7QtsNtYQNy+m+24fd2Ac7quU/ZbQPlp8dCTLKVx/xYmp9vR9LNkoydKd/mzVtEF6mQnlhAvoeh0ame2zAHHGW4gmcwlhwwhGbS198vD4U8XAavSypl8CssjitX9ywCE9QbMNq5VuHLvU+FOpGQegDWimTwsEEVqAdJCtM9n8EbK24m4/sbITsF4zwOu3e9VyFVwf4mHgHXxoAdDzEOjFubHwFGetEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <afa0a9e3-fd35-be38-427e-3389f4c3ca26@suse.com>
Date: Mon, 13 Jun 2022 11:18:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] xen/console: do not drop serial output from the hardware
 domain
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220610150651.29933-1-roger.pau@citrix.com>
 <3a462021-1802-4764-3547-6d0a02cd092f@suse.com>
 <YqbziQGizoNX7YFr@Air-de-Roger>
 <3d0d74d8-55a9-cdb6-0c5e-616ddd47bbc0@suse.com>
 <Yqb9gKUMokLAots7@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yqb9gKUMokLAots7@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR07CA0020.eurprd07.prod.outlook.com
 (2603:10a6:20b:46c::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9e08681-ff9a-475d-c9b6-08da4d1db914
X-MS-TrafficTypeDiagnostic: PA4PR04MB7824:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR04MB7824A2262F84C14C38E9D350B3AB9@PA4PR04MB7824.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iEQrqm2WoTQhjiwsDLPmiGckoy+bnXr+qBnnPp39+hMdmK7jYMpntlwLYb5wvMz76M8ysI/ujrNWXQpmcw4QDey+wzrfBkeGimTlFHyuOAFEWlai1rS0y+0lDS0Hzxw8ePqvfGG78CqUsVQJKlOST0aCTwnQa6sqWaCytcQfd9s4vHfAI84MwcB98y8sbNZJeMr1O3KTxgwuKxdS3Kec+pAKyhrz3zUhYnUnqJnE6Wx9Ic4mNjlPahpLKw5OYHR/omgAyqaDPhwqT8r2+p7Ag2TRJBClDdmv3u9Ysu1CoB+GLclBLjCYEdDAP5Ejd486JsxTmwmvn3ByrK/OAQipprdJz2qImsBZcTqExQaFUbPt2yUYpdeX7GcQVv5/KxymlyN+PI7dq3O1RNEP9kmHP+X2oEZs4xm+WM2zsW74JjvG+npOf9+IdNU29ytwouA1J4OM7Xboi4X19RA3FptKMkG7lwPi0eoSzH5y6YJ0mAO3TVhhIoqKsybbWJ9mm3NjfqowuRI29mZp13dsudMoputa8vPwfQx4RBH3Xw2cY1g//jS0SkUqDIRmertrwT9Y3KEr2oK48hZ/ZPrAoKpbwaTtqOA4zajXQEc5HzK8WS+ublcWrq06CHnyFFVvxpK7OkqqOGXqpY7DvfMys9WdBVn7AwzIVfMBbp/56MvmBEuAlIKgRNq/yEpv0dnlFNSCuKHFmqh1Q8eVpra5dIEgQrkVpyP5G4qVdd7K6XrviVieHlGRNavBqmyCaFhMGsDc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(508600001)(66946007)(316002)(6486002)(6916009)(54906003)(53546011)(6512007)(31686004)(86362001)(36756003)(26005)(5660300002)(66476007)(4326008)(8676002)(2616005)(66556008)(2906002)(31696002)(8936002)(186003)(6506007)(38100700002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cm9oUkpIUUVjOHpaRE9YTC9HUzBLOUFVVE5uNWdqNW1qVzRQT0NIaFV3YzZz?=
 =?utf-8?B?YytGdGg3WjZoSEhmUi8yUVdTWmtuVzJWUTlNWlVTbjVuZFhRQmIrbXcxZ0Y3?=
 =?utf-8?B?VFE0b3RiblFaZ09WaFNCT2hQUk1KS1dtZ3BzeHhVVWdSUXN3bXZlV2lBNEYz?=
 =?utf-8?B?UFI3VEpMYm5HZFNkQlArOVBmcjltellrV1FEZjd1WlV2S0poc3lMOVNzdWE3?=
 =?utf-8?B?ZkVMQW1NTlArVVRQcXo0VGNpYmQvTnlrV1FYSVVXL1dtd3BwUGhTaUdwdWVH?=
 =?utf-8?B?bVk2cXJOMVBwZmZhLzBoR0laNjkyUUxJaXV1V29GQ3M2MDZ5N3pGMlhaZmJI?=
 =?utf-8?B?ZlMwRGMzc0UvMVlLYWtZZFRlU29JZzl2d0V1dThiTGNVRFE4THQ2Mit4ZVM0?=
 =?utf-8?B?LytmWVpjUUpTVGE5N01yUWpGYzUxL0I3NE54MVNBOTI5blpDM3NuYTR6S1Z0?=
 =?utf-8?B?MzcvMFIwSWQwOWhRQWp6MzVvSmpQK2hWZUVKUUEwWU5jNzFra21OQ1gzazdT?=
 =?utf-8?B?SlNCSzFxSWp6TzA3UUVncE95a3pHT3VWdVJZU1pRZGt5TDNWbUJIMm94T2xW?=
 =?utf-8?B?VWVaOE9IQWd2b3VEWWR2aFRmaUY5VldBT0tpTzhXZmZYQXlFNDJOdUNGVTlT?=
 =?utf-8?B?UnQwMkg0RE5DdTY1VjF6MEx4L1NINWplTi9BdjFNKzh1ZDhIQ05HRmZlTUM1?=
 =?utf-8?B?U1Q5a1BscWZNMUt3UThId3NldFI2Z2lTWERNcG8vdDhJREpaWU13aTlwUVpE?=
 =?utf-8?B?TWRtaDUvMm5YMXBGeTR6YmtUSGlyK2cyRDI2ckNBTFBVMkorWXRVdGhPTWdx?=
 =?utf-8?B?Y1JkK1h0TzFmWjdpQ1JTV28zK3lWamUrczYwOHRzNEd0WGFyakRDUGM1MmVD?=
 =?utf-8?B?dzduVDFkemY3VGVUaFA2SWttODNtU1FhZWQzV3Fhck1sY1RERVBmSGI0aE5G?=
 =?utf-8?B?bGQrVVNIckJKNGxIVmZqOElxNEdIZ0RyQ2lBOC9WNU1UeWJZV0s0aE9xNnla?=
 =?utf-8?B?bVhqVElncjBZcnZFakFub2RXNUlXMzVudk5FMEFrY283d1A1MlBQQ3lubEJj?=
 =?utf-8?B?NWgrNzlCLzc2K0hDZ1VWY1dLcmVKdjJKTjY5ckZ1UndTTmhBTnQ0ZENaTHhi?=
 =?utf-8?B?aGcxcmxKQVhid3o0TEp5eS8vd1NqQmtCRW4rUU9jemxQelcvdFAvNzRUOENy?=
 =?utf-8?B?Wmx5eGxJbEV2d2dzSUdKZDF4SER1bTVUUlNRemh1eTlDeVB1UFpVMzh1bkNv?=
 =?utf-8?B?QnVMQy9rNTB1TW1SbzVwbzJsQ1lGVnd0SUlXTktFOUZ3bDdWUmxVSllxcVQw?=
 =?utf-8?B?N1dLdjNKWEI5OXdFWC9yWlpmUkw5eGVHcWtsYU1JUWZwOVhNZTFIYmVSV2xk?=
 =?utf-8?B?Z0sxS0orMFg2MTJSU2hqelFiMTd3YmZZckRTOU5HblNlRXFBWWNYQUVJWkdR?=
 =?utf-8?B?RlVuZWxCanhxK0c1UDJhS25yWVk1Vzh4TVJ4K3AvQlV2NVJrSU9VaEdzS3Y5?=
 =?utf-8?B?V2NSQnhsRC9mM0NGc1JBVWp5Zk03QnlNaHBtU0JtZ0U0eHdYajgwT0NPVUhL?=
 =?utf-8?B?SWVwSmRqNGFtdFJTVG9Wc29XeWtQMWs5SHR6NUhkK0VaTFBjVVNtVWtDcVFK?=
 =?utf-8?B?Sm16OXRPYjZrNlVsZDk0ZVNUR1lpU0ZmQ1NpL0duTGpadjVYWU5pdTBKYy9v?=
 =?utf-8?B?L09zWEhOd1NQWWR1MDlCbWp3U0xqTFpoZ2NZWldmZDRSWjZHWHNnQ3hkdHUw?=
 =?utf-8?B?Y0dhRnF1L2RxLzMraFlBQ2kyQm1BcDl2cTZ3ZVQ4MmxGZjR2bVRYSWMyRllr?=
 =?utf-8?B?SVhCQ2h1RS9ENW9aU05kcktUTE9hS0trczQ5V3NiZHVVeFh2SCt4TFZRVEhh?=
 =?utf-8?B?b01kVC9aRWlvZ281czhacml1MFQybXJYaGhWWG1WTEkvRWVPYTBaT3BJL3ZR?=
 =?utf-8?B?NGhlSXRWdDJUVTFwSkZnOThxaThoU0FVbHV5dVM2RllmZ3NiRng4dlE2OGpr?=
 =?utf-8?B?S2FCRmZwbVVNdUtnZHFGNmpuejdZbW5RRVAyZ2VlUUFhdjd3Z2p1YjROMkYr?=
 =?utf-8?B?ZEFidmRtWVJseC9ma05FcC9oSzMrU0pnSkZXVjV4N3hHTWFueWhyUFM5Q1I5?=
 =?utf-8?B?UFQxeVNpaHhwVVBoQkljNVlNSDBFOUJyNTczMHkxT2JzWXl3MzRWQ0E5WE9F?=
 =?utf-8?B?WHg0d28vQmVmMVR5bkZaTk84bWVXbFBpZUEySGRrU3NsOTFWcVVXLzhqeGh4?=
 =?utf-8?B?d1dzWmZ0ZVVsem5aWUJwaFFxVkw3VldCT3BXS2I2UlBHTmdzNjdxYWN5aGlm?=
 =?utf-8?B?V2ZGTXdXQVpRTk1QeXJWL1Rla1RRTDUrUXRneTJ4MjU3TmFvV3VVdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9e08681-ff9a-475d-c9b6-08da4d1db914
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 09:18:48.2290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2c/NSRC1PY1AuXABq/9AYZ3HYJid/OQJM2JxQhHhM6woDhg9BoUVV8siZSVcac6JQqPe3Q8QxC3KrHd77vSdBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7824

On 13.06.2022 11:04, Roger Pau Monné wrote:
> On Mon, Jun 13, 2022 at 10:29:43AM +0200, Jan Beulich wrote:
>> On 13.06.2022 10:21, Roger Pau Monné wrote:
>>> On Mon, Jun 13, 2022 at 09:30:06AM +0200, Jan Beulich wrote:
>>>> On 10.06.2022 17:06, Roger Pau Monne wrote:
>>>>> Prevent dropping console output from the hardware domain, since it's
>>>>> likely important to have all the output if the boot fails without
>>>>> having to resort to sync_console (which also affects the output from
>>>>> other guests).
>>>>>
>>>>> Do so by pairing the console_serial_puts() with
>>>>> serial_{start,end}_log_everything(), so that no output is dropped.
>>>>
>>>> While I can see the goal, why would Dom0 output be (effectively) more
>>>> important than Xen's own one (which isn't "forced")? And with this
>>>> aiming at boot output only, wouldn't you want to stop the overriding
>>>> once boot has completed (of which, if I'm not mistaken, we don't
>>>> really have any signal coming from Dom0)? And even during boot I'm
>>>> not convinced we'd want to let through everything, but perhaps just
>>>> Dom0's kernel messages?
>>>
>>> I normally use sync_console on all the boxes I'm doing dev work, so
>>> this request is something that come up internally.
>>>
>>> Didn't realize Xen output wasn't forced, since we already have rate
>>> limiting based on log levels I was assuming that non-ratelimited
>>> messages wouldn't be dropped.  But yes, I agree that Xen (non-guest
>>> triggered) output shouldn't be rate limited either.
>>
>> Which would raise the question of why we have log levels for non-guest
>> messages.
> 
> Hm, maybe I'm confused, but I don't see a direct relation between log
> levels and rate limiting.  If I set log level to WARNING I would
> expect to not loose _any_ non-guest log messages with level WARNING or
> above.  It's still useful to have log levels for non-guest messages,
> since user might want to filter out DEBUG non-guest messages for
> example.

It was me who was confused, because of the two log-everything variants
we have (console and serial). You're right that your change is unrelated
to log levels. However, when there are e.g. many warnings or when an
admin has lowered the log level, what you (would) do is effectively
force sync_console mode transiently (for a subset of messages, but
that's secondary, especially because the "forced" output would still
be waiting for earlier output to make it out). We strongly advise against
use of sync_console in production environments, so I'm afraid I have
trouble seeing how using this mode transiently can be safe. This is quite
different from forcing all output to appear when e.g. we're about to
crash Xen.

Jan

