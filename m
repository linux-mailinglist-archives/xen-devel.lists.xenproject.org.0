Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE95A6EF00E
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 10:16:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526550.818377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1praJS-0003W5-Og; Wed, 26 Apr 2023 08:15:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526550.818377; Wed, 26 Apr 2023 08:15:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1praJS-0003Sp-Lm; Wed, 26 Apr 2023 08:15:42 +0000
Received: by outflank-mailman (input) for mailman id 526550;
 Wed, 26 Apr 2023 08:15:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dTkW=AR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1praJQ-0003Sj-NT
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 08:15:40 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061e.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 874f29d5-e40a-11ed-b224-6b7b168915f2;
 Wed, 26 Apr 2023 10:15:39 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6881.eurprd04.prod.outlook.com (2603:10a6:208:18b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 08:15:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Wed, 26 Apr 2023
 08:15:36 +0000
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
X-Inumbo-ID: 874f29d5-e40a-11ed-b224-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fV8eUIoxeD8dpX7aHLfsmuX5F/A1uCGWYGC0BzVk3bVDNxNTclemmj+pH+oj2w5U0wLkXDA/vv9ZP1WUSdx//rNC6FgmWmzElo2A6duadZggmhguC+5L1uyBORgXU6cEHKpNEsB6CnpGDhuoit7fnKjwVjmCQeWUJunRYYt4X4I2FfuNLdgFRH2U5x2K3umgvmtvJZqzblhprzRHFSts7Of92re2ixvzkyeKVjUf/uuAwVfTCPFgvk4V+WLZsJA3AcbRFiBnqUGwj1gJ9Ol7OgUAfjme4obHUEVUJePz38F6HJJ4BTvdB7hc2ED42fghtpu6SwIXB6GOycMqZizuxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AUVIJJ8M4zMA2gdqaaEFVL9XVXUvzQBeqI9JnyTXkv0=;
 b=DubAwJ8Bz8myQQPSmkN+0qFqcn75WyahI62JGcHonsZGA78LiZM4NRypdD7fMa0Hxe3ebBfU5XK+5V/GGfieR2hGX4BW5SYWci8L/fary42Sk9Sz3FqYytaqf5seNN2dXPecQBgM99J1ohzx5yH6DEqmgzrS5lW8g8Tcksi1K1l8Z0DzqhYWvMYbIEhttk63nmDxJldut0niUMZXcU1gwd4tFGRWQi3a2SOYc6JlQnNJ/00foNsaulZukMppwybSTuMoTLrRnhPCDhtEOAvYS1VNq/0dM/DygiybaVkX67w90eYCNi8Vv5vKDDsOIK0hmdZv7XOPV35xe68Kws6Vng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AUVIJJ8M4zMA2gdqaaEFVL9XVXUvzQBeqI9JnyTXkv0=;
 b=YA3RZRV1OjXbKj5tndAecLyeClifzwEt6lmncjA/93Z9xGCWZ3RzH0RcCXzL1UwdG8J2F7yDVEKycvMbQvTDg8VND5j86CG+1YqpBYH6+fm00gN7TUVEBejfbsPo/D7Mq7qVvlGb9OAxkBdwGMWwhW+G0rXT49cSfOjCr5UU1z/qcAx6V+2ZpSlCWjaDJ0WJ9aaj9RkNxReZjQgmHr5OW8614Vg2Y4UjpUXzzJiJNmKzqdaXsSGHeRJDH+vr4OwykZgWfBTVWBxp2WYNHa52TxpHqJMYXakRhSeOfU+URywl/JttUqhSLBtcE861UKpYfK/5vXD9GvOxHINm/zWR0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cebf1a46-71cb-a700-78ac-f9ee8bb64c22@suse.com>
Date: Wed, 26 Apr 2023 10:15:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 09/17] xen/arm: introduce a helper to parse device tree
 NUMA distance map
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230425075655.4037980-1-Henry.Wang@arm.com>
 <20230425075655.4037980-10-Henry.Wang@arm.com>
 <188a01f0-a2d1-0f2d-4d01-61a259c790f1@suse.com>
 <AS8PR08MB7991F2DDC4C13F33390557EA92659@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <e783d71f-cc0c-e235-28a8-7ec9ad63d41f@suse.com>
 <AS8PR08MB79919EAEDCD85073CAECE5DD92659@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB79919EAEDCD85073CAECE5DD92659@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6881:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ab69b8b-2f12-4c91-2c4d-08db462e69c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1gm205BiATvtlBhUM7QpDeS81iN4cdcYP6wxZ7Bd3clbKXpm08HjZ4j3uUfOUG1QPeOc1euCLUCrZR3vVZL3ZYbvCXcONtM9mkFv52zjhshz2/OiY0Fc7fEzuQdOgESFVrUxRayLVrART6g7/DHvRWuaFOEwjmTmlro8PNYJXEwbS1blK26nKGAbqFG9w/HX1Toafpke3tadlDPYENlKeuTv8jHorYQE0TSklhHDR/Wl7+oY///gvHFeq+w0JYAtWhbYeeffBSfT5Rwg56djbvslEO4m/0CljDwAB4CZ2D+wfpfrcZZ00mGabYnPKFGy4UnGRMPix8rBkgSgpjRveVJCJw8X9oV48cvdu5g5ij6o5K5gLxyS0ztcRHDwcUvdIbQa6SCZ14VC2THbsWntmywyONHAc6jKxB092LJPCy79FTKPb2PoMa81xRinqjgCDSBGP4Uv6qmbByZDUqALLjQRz8hPzTwYc7pOe3S7c7mW1M9B3wNiAhuQ0EYPOJanoPWI+dYV39Y0PZR26jb1b5095jWXcmqBfqZLUZDUnQVxPjTBDdFEe2cdpx/WZVODZCesWCrPCMhdvB9VquYO1UetA1tEGg8La++u24oNr1svGs+tDGZXPBSReDv2kO78yKS4ZJyV21e8iUjpkrKFTw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(376002)(396003)(39860400002)(366004)(451199021)(66556008)(66946007)(66476007)(316002)(6916009)(4326008)(54906003)(66899021)(5660300002)(41300700001)(8936002)(8676002)(2906002)(38100700002)(186003)(53546011)(31696002)(6512007)(6506007)(26005)(83380400001)(31686004)(86362001)(36756003)(2616005)(478600001)(6486002)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjdTMVVpTXl3Z1c5QjJvb2lVRXpIb2hsRXVucjdzUmhTZTFrMXZWcU5OOExD?=
 =?utf-8?B?VjNtU2pIWkRKTGNwdmw4bmRpWWxnaXlWdUl5QWVrb1pua1RyRW9vZXozOEFa?=
 =?utf-8?B?YzFNamhXcDQ4L0NjWmlRMWkxUlhoS3hvZ3ZST0pEL3dIbFpkSXRJdndMNE1h?=
 =?utf-8?B?aVNHdWVJR2c2dXFpUnF6Zy9OOEVFdG5RengyNUkrY0xZZzBzZXdQM1Z1Mlhx?=
 =?utf-8?B?ZzJ5bkJHbXRjUHRlV2xETS9FSGJmcGhWVmgyU0xtamhsemgrWmRYUDY3KzVJ?=
 =?utf-8?B?N3hqcjU0aThrZFU3eWUyYXFkalovQXlZR3F6ZVJQNjdJWE42Yk11ZnpvT3c1?=
 =?utf-8?B?OFhoSkZuSjdNWjQ3bXM2azRqdEM4c0swSDVzcGJTeDJqOVRLWlNZYm83eFcz?=
 =?utf-8?B?VGo1VkFzNVJnd0hXeGczNitKeWxwN2dpYVRqMElUakJwVURZQWZJancvZ1I1?=
 =?utf-8?B?OXJkT3dXQnIyNitpK1U1SHRVU2U3emVQRjNKSzVYZ1VaWHdVL2NXeWI4b0hh?=
 =?utf-8?B?WURUd3k0cGdYL3dmaythY1lmbms5MXNSNm9kb1ZqaUpXT0loN0xtZWl6QlhH?=
 =?utf-8?B?NFNOUk00OGJOaS9zdGVYKzBsTVdRYk9GV0NVWjVKUzBseW5RVVlNZlMvSzFQ?=
 =?utf-8?B?UDdkSHZZL0V3Yk9CMlNNRFExQWg2VnI4a3hxVkgrUWZkY3JsVkltc0pETEFu?=
 =?utf-8?B?S1ZQRUY4bmlna05FaGZnNnJTdGFJN1ZpNVMycm00QVZTbDBHTHc5cEk5QWIw?=
 =?utf-8?B?ZDZ6R050clRxZWZ3elhwbGNhQWU1WWZjcGhCYlQyOE1Pem80cDJwZFBFVVZl?=
 =?utf-8?B?YVJ2VHluMDJRenlEcERqVE1vRmo3Z1UxTHpmSCtLQlIvRkRTQzZmSUIwMlhu?=
 =?utf-8?B?Nm1TOENzSkt1Tk1mSDRNR0w4K0MvOUJzbENYZmJobDBJeC9jcnRPb1Z1MEtL?=
 =?utf-8?B?Z0xBNk9PVVVoVjl1UkVZSXB6ZzJDVTZYVFF6SzczTEI3b3VBSVNIRVJ2TEJ0?=
 =?utf-8?B?UE10OHE0dEQ0S0h0WnZDVUpvR2VUbmZqdUV0Y2V2ck0vZGVHaTdqMjIwWkF0?=
 =?utf-8?B?MnhZV1RrWS9reFQrVURTelZ4MzM2bTJPSnBOMkV6Rzd0bE1Lb3o4bGV2eHJw?=
 =?utf-8?B?VFI4UWdMcGlIN2ZOZ2J0dzNOVStOc0NuNW1RNHZjVU95UFR3RWRZclZsanNm?=
 =?utf-8?B?UVo0U0xhOE5FR3h1UUtQcDdRdFE0REhVNThQWDk5azBxMzZ6YS9vS1ZXN0JR?=
 =?utf-8?B?aTdueENmYXE1bG9rZ2p0Ly9qME5XZG1BR2lDUTFFall6M1FxNHF0QkMzWGhL?=
 =?utf-8?B?cys5WGRnVC9SK0lOOVl4dXVxdXoxVExtRkpnRXlPelE2enRXYzluVWZpTXky?=
 =?utf-8?B?NW5uQlR6dDAzUWwyQS9pbThPSlFwQ2dJSjBiU0JYdlJmMXJlWFhEVzhZTHJP?=
 =?utf-8?B?QmVuZmxEU1NTMkFiSWFVbUR4a2VUeHRYbnVXN2tXYjlOd05WMCtqVFNpV284?=
 =?utf-8?B?Q3hDYmtWbS8yZm9TYzFzajc3ZXZQZWpQamN1bytrZElhNjZib0FWdlBwemsv?=
 =?utf-8?B?aDllTVJZVSt3NDFUTS9QUTdIVjVGVTJHVm5NZmZVcHVaT2pKbnA0NzcvbkM3?=
 =?utf-8?B?SEpsQkp1OXMzZjRFaE5FeDhqaHVCZ0VhUFY4aFB0R1JvczhMMGJWZWEwMlVm?=
 =?utf-8?B?SUt6d0VJeGM5SFJhdW9UaHFROHkxSWFTWkJURDYrRkZCTVZFSWpxYTYzM2tC?=
 =?utf-8?B?NHFuakcxZTVYR04zYmM3dTJpNTlacHVZeFdWTE9lczVJSUhvc1gzTzdNWm1h?=
 =?utf-8?B?MUNic2xHaGw0d0NTSnJIcFJONkFTQUE4WDZhN2Z2WTNoMm91NFVVUVpkNjh6?=
 =?utf-8?B?SDBEZHJ0OUxSYk1GckJaWmdDeFE0SFdvb2owU3prREsvSkYwU1pxUlFnM29x?=
 =?utf-8?B?b3NFditaSTJ4MzlnOUJtdzVoWE0vakJSLy92RXo2NmJWK3RsS0xZK2VVaW5R?=
 =?utf-8?B?N2JBWVA4YWNySzVlTDhaNHBENkI1SmR6WW1CN3h6Wm1FTCtLbWk0SDNmalNr?=
 =?utf-8?B?VW1RdFpyZEw0SHkrNTVza1F0cnU2aGRVUS9KYWJYYkhJZGI5UFpmWHk2R2Q3?=
 =?utf-8?Q?22TgCRVRY7UIQNZcKqmV5Igr9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ab69b8b-2f12-4c91-2c4d-08db462e69c7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 08:15:36.1385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ellOj0OT5eMCtqbZAwhMddo4Vlg+jsPc1RrUAQu8MHmuo15025xvQ0yKuOH19DX1NrAxk4HFSuGyMCrqKlrrIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6881

On 26.04.2023 09:36, Henry Wang wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>>
>> On 26.04.2023 08:29, Henry Wang wrote:
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>>
>>>>> +        distance = dt_next_cell(1, &matrix);
>>>>
>>>> Upon second thought I checked what dt_next_cell() returns: You're silently
>>>> truncating here and then ...
>>>>
>>>>> +            /* Bi-directions are not set, set both */
>>>>> +            numa_set_distance(from, to, distance);
>>>>> +            numa_set_distance(to, from, distance);
>>>>
>>>> ... here again. Is that really the intention?
>>>
>>> By hunting down the historical discussions I found that using dt_next_cell()
>> is
>>> what Julien suggested 2 years ago in the RFC series [1]. Given the truncation
>>> here is for node id (from/to) and distance which I am pretty sure will not
>>> exceed 32-bit range, I think the silent truncation is safe.
>>
>> That discussion is orthogonal; the previously used dt_read_number() is no
>> different in the regard I'm referring to.
>>
>>> However I understand your point here, the silent truncation is not ideal, so
>>> I wonder if you have any suggestions to improve, do you think I should
>> change
>>> these variables to u64 or maybe I need to do the explicit type cast or any
>>> better suggestions from you? Thanks!
>>
>> So one thing I overlooked is that by passing 1 as the first argument, you
>> only request a 32-bit value. Hence there's no (silent) truncation then on
>> the dt_next_cell() uses. But the numa_set_distance() calls still truncate
>> to 8 bits. Adding explicit type casts won't help at all - truncation will
>> remain as silent as it was before. However, numa_set_distance()'s first
>> two arguments could easily become "unsigned int", resulting in its node
>> related bounds checking to take care of all truncation issues. The
>> "distance" parameter already is unsigned int, and is already being bounds
>> checked against NUMA_NO_DISTANCE.
> 
> Great points! Thanks for pointing the 8-bit truncation out. You are correct.
> Somehow my impression of numa_set_distance()'s first two arguments are
> already "unsigned int" so I missed this part...Sorry.
> 
> In that case, I think I will add a check between "from, to" and MAX_NUMNODES
> as soon as the values of "from" and "to" are populated by dt_next_cell().
> Hopefully this will address your concern.

While this would address by concern, I don't see why you want to repeat
the checking that numa_set_distance() already does.

Jan

