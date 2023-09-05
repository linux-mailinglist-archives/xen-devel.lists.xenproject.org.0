Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC467923DE
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 17:20:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595751.929356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdXqC-0003r0-4N; Tue, 05 Sep 2023 15:19:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595751.929356; Tue, 05 Sep 2023 15:19:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdXqC-0003o5-1R; Tue, 05 Sep 2023 15:19:44 +0000
Received: by outflank-mailman (input) for mailman id 595751;
 Tue, 05 Sep 2023 15:19:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JoEh=EV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qdXqA-0003nw-29
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 15:19:42 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1e1881f-4bff-11ee-8783-cb3800f73035;
 Tue, 05 Sep 2023 17:19:40 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB6814.eurprd04.prod.outlook.com (2603:10a6:803:138::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Tue, 5 Sep
 2023 15:19:37 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 15:19:37 +0000
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
X-Inumbo-ID: a1e1881f-4bff-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mBN9r0yPkkm8Am4vW1I7eshiIfnMMO5UQQGgpKvdaI83hSuG67EZc/ENOsjROJprmJbUkWkdZHjOhfn96190bhR4ZImH3m3FxLlrMZN1QFPen/sz2jeOOpRYrcgw/G2WmLJeQ6m73AuEfR4wDLg7AQ1yeCFSoVxSmkdqiCrL2D1/QzBejaW16+DeyYOi+SBUWKOvUxrDj4ARVqpLvBF33uOpv/IkkDkOphv2fhdTZpmp+5RsZ18rQ8kUp5YE2/oa/CmCWvHpybsMQpYjeFwiBlQdEjO2b8cx9jaR/g7ah190BoKiJqBVUqpn0Kp/NO9Vw+dO1P8hILSKr3gf9cgJQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LtWe0SSwjHO3z5r7lMC4iyu2laZ7ykPv0D+eZiZDU3w=;
 b=JFBE3FGEworlWUYs2Jj6SPdfESblQiXTEvueNuo2e2y1NysZSsMbrAsiXm3Ez4jfxu8y9KgtoBmAK5AvzExBlLlxeSoXRaJhQ21JHK9M9zayUN35rlwMya2idM0lLWOP1fnmquUVEoY6EtfH9YQ2G5tGKu/AHCn3mz/xjWXHH03MJUvcOLIXwXauUxfUaZIMf5/HbOyl8Xnli1uyvL3VuD5VpWtxFW+uTgoisdCFYgF0tpFn7bOAtJaYg9k7M7ZXfxbzC5WV7iv0cG4x1iBT1pk9NKpDa9am9Lmyc33QfvfPgMdGsGaEa9lUyc5HfOdEVNgGZ0CRvcGDLZX9tvqXCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LtWe0SSwjHO3z5r7lMC4iyu2laZ7ykPv0D+eZiZDU3w=;
 b=eKA8WkUswrSXAbeqhGbISZBe8ppMgDVqhFHDz13sUhd8W7tUu/3yQLy9bGFjcAjS8OQ46LLrFx8mBho89dLiL2GeYOcIrXdANIdsXHqzsIjTIqww/m8m+SAhyqYq0cNgPJztLA4248mx1iP2l53wNmcZuGTxXM2VhvMOhSBO1W9G2mw5DAhcG47r37JGK1hQy7DWF/beVbABCa3yZBOvgtwEW3r7cXrdZsFM7q88HhfXFJc82yk/LUPSKEXmZRLiIf5Wha2SvPWaVqGmLYMf7E3FiDiOF5TB52wOLSrkWXakX4hcc3tEt+BdA3dRUZTrTw2L42oJjqV26VlpBA6Z9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <003690cf-e34b-2e61-1166-86bcfd9da3b7@suse.com>
Date: Tue, 5 Sep 2023 17:19:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 2/5] xen/ppc: Implement bitops.h
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1693591462.git.sanastasio@raptorengineering.com>
 <63e66eed26da8f957315cb1db05693b1799ee7ad.1693591462.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <63e66eed26da8f957315cb1db05693b1799ee7ad.1693591462.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB6814:EE_
X-MS-Office365-Filtering-Correlation-Id: f6c9e884-f686-4b20-5994-08dbae238469
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GI3mCyoDrQAxNtNLtz4H5rls6j2gcxY04YGK/QG+ZPFIhJR0EXSuccCEEtlyqlkd9T47jac4EMKnnun82jrIj8C5CuqDlBcO4jWAW+gRfNnx0bATzYCiMaA3pTgfFWdyDxzNLzITco1ab2oO4d7npyadzQWZAE5GAP+kWrl/FN2jMs8CsFNQgnNKFUYh6gfCvpHDnBhCmsWRxYVgTbw3wL1d49qvCIXKS7ita9S0GaulFxYAXWat8Q/yGQ1o57jQ1ofTtilou6HB9EvM3gQgdBj9zCxAkn8IumbNF4qHZrRJKlWtip7uQo3aL2elENKlnwqUfotMJUy5/6W9I1pIq0xC+3tU26yegHUZnqH52y7WYYWqcBDn4WYzj2jZVo8UlrYJwxCPFErwIKg0C3hb6GvHYXhTC1ehI3TStAj8/WqoMRFplBo+In0WXu/d6yLgBQSpETf6Eb3pfiVggoW16Wogv+BFTnFKwtyKHxdtjMFoMGaceFqpG89S1nS9FumTz7CfhlO/xWQYkSykzXrDBv21NZ/1am0IxofGamhPSqtxOoT64RtcJTbS9g0GtzYSzZOvtAuYQIv/SJ29FsmNt6i9CPU1tKTCmN49S4BekzWwRMPSA9UaUz99xJCmBWhPvS2vc4Y8gltRcJQs4WSIgw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(136003)(366004)(346002)(396003)(376002)(186009)(1800799009)(451199024)(6486002)(2616005)(6666004)(66556008)(38100700002)(26005)(478600001)(66946007)(66476007)(6512007)(316002)(6916009)(2906002)(6506007)(8936002)(8676002)(4326008)(53546011)(31696002)(86362001)(5660300002)(36756003)(83380400001)(41300700001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHMxWlg2NlYwME55WEc5UDlZa3p4cmpRMW1pVHNyeXIwRVh2VjYrazJ0RzlS?=
 =?utf-8?B?Q1R0SmNLVzQrQnVkK0tjNVVCNGlTdDZCZHIydjMyTmRkNDdaZ0RLRlNTRjdw?=
 =?utf-8?B?MmtjSEcrdVVjT2VFa3I2R1h2Z1lUcjEzSHU3ZDlkRjBzSWZydEhaM2xjK3hK?=
 =?utf-8?B?UnRFSzMyY3cyRHg3U2lzZGhmWVBqbXdzYW8yTmloUjlCTGl4ZzFwQUs0WEZF?=
 =?utf-8?B?a2hGeFVoVGZvZ0ZDSk1sWlNhZUF5VWk0ZDc4QnZjaVIrQUhNTlRESUt5Skhm?=
 =?utf-8?B?RzBLb0pOMm9ZOTBFck9NM1JkNTZVcG5xcHR6cXo3ODFwcHF6TExWTktBVVFK?=
 =?utf-8?B?dDRud3BIeU0yNEZkSGFqMW9yaTFHeHg1cU8xT1VPQ3J1MFdoM3RMUGtSV0o3?=
 =?utf-8?B?eTMyOGFwZHNyditQTGZNZ3Y3UUk3UmcxOUNHRkxtTFg4ZElQRUk2NnRlNStV?=
 =?utf-8?B?Y1ZwN3o5ZE5uUGk1SjJJdVRWam8zaXlnUXArK1dzUGRmV2Rnd3o3cFNkNGFu?=
 =?utf-8?B?djhMSGZaeFIyZjBsKzI0Y1BHV3Z1ZnlDZm5adFlqOVFmVExiQis0YmNNaCs3?=
 =?utf-8?B?OFN6QmVoL3RtbENZbEVLVjZZbzR6ZE9UL2NQT2RaOWk5RFRBTEo1N2s5UXdR?=
 =?utf-8?B?TGE4U1k5QTVDZDJJWUJVZ1VKWnFONU5aM3VnSzUrWlZYSnVVTUpxMG4zWHAr?=
 =?utf-8?B?bitVRk5nL1NGcktZVCtwTjlLNXdublBvNnRoZDhLY2dtdmFKYlpKbHhLdk1o?=
 =?utf-8?B?WFVRSUtkVVgwam0zRGpVVWlib096QXo2cFNVTkQ5ZlBxMGJONmozcXg5dkli?=
 =?utf-8?B?RjRxRzl0SDRISVEyNHdEVk9lN0V1ajU3UXAzSkh1TlBQWUxXYUdyR0VMTHNi?=
 =?utf-8?B?ZUNqdjYyTDMzd0lBMGJ6NFJqZ0NneW9zRWZzWlpYYmdMdmVvRWhvZzBIcjdZ?=
 =?utf-8?B?Wk1aeWdERUxIL2E5ZHBnN1cxM0oxajZXM09TUjdHZG5weTMxcnVTMHdsOU9F?=
 =?utf-8?B?WWQ5bHR0ODVVQnVQelU3Zk9GVWxBbnBXZzg1ek8wd1JTOTlyYkFYRWFnOS9Q?=
 =?utf-8?B?Q2k2QlRGVmR0YXJYRTFHSVppVzgvYlJDQ0ZwZm9weGdrajN2M1lUZ2JjaGlX?=
 =?utf-8?B?OFJyZGllbXVKSjlXT3ZuQWlLNXMxOXd1OG9ZdTl4UVo3WmlmaDgyYjNDS2E0?=
 =?utf-8?B?K3JwdkRKU3dkYW1YR3Z0MWMvNk5oSmFGTmVYN0t1UGIxdnBKV21OcDcwR01t?=
 =?utf-8?B?VE9SMVh0S1FnVm8vSmdteElnZmVyU0hQdCs3RmQ4UWphTWZUTzZIWTlVY0hm?=
 =?utf-8?B?N09Wa3RaME5uSW9pRTNoV0FJSEVkdm9SREYxdWJYMTcwVG9uVExPNTlEbEJl?=
 =?utf-8?B?anA0NEdiVVhPM2xHZ1pMdU1CVzJnZ3BTQVhrUHFGTlRPUjNwSHVOS2xZV0ZB?=
 =?utf-8?B?U1dFbk92VWdUT2xEbVJHVXJQaThxM0djWGN6ZmhVbzBWZVZtZWpFVnp1cEFX?=
 =?utf-8?B?ZjRISWFDSFMzQVAxSnJ0QldQTHdZZUdiN1k0UWluS0pnNUFjcjhvc2NQSDZP?=
 =?utf-8?B?dGlLL2RHekZrSW1iZVpETUo3NUVxaWZwTTJseC90clpnM3JVQlMzV2l1Zy9k?=
 =?utf-8?B?bHMxSWRLMmNVb092bzZLTEMzbThIVnE4aXVleFhZV2lMUm1TU3JqcS9FZ053?=
 =?utf-8?B?RHNqMXZFaXMxQ1BCRnBkWXJaV1MxVkdJdy9ZVVEzTWNIVmJzUlludE11VkhZ?=
 =?utf-8?B?UGw2KzVuczY4Q3owd05SYS8wU0YvNytjcHcvQVYzUUlMQWZUU0RBeHZNQkNB?=
 =?utf-8?B?OWdkM09nWWZTMTlYOWtJYXk0Z1NnNVFrY3NqWHd4WXZKRWF1bzc0bE9rTG8y?=
 =?utf-8?B?YXhWUTkyZk9MeU5PK1dWUlJKQnNGYnFTSVhIZWhoNUhNS0V6MldPOHVqMXdj?=
 =?utf-8?B?U0NENjJuSHFOcndFd1VOWU9nOEV3aERYRUczejNJTHlYTUIvZjRncEk2Q20r?=
 =?utf-8?B?cXMzWEZQdlNjNVA3MmkvQ2RRMkFvN1h5NlFGQzZtbkZHOTdRM1hTY0h6bjRw?=
 =?utf-8?B?RGFsVUFpUEpGUGpKL2JISW96NDc2Snc0MzVDNTNKU05RU0lFTlpFaHd2NUV5?=
 =?utf-8?Q?nUcA/1jzHjF9c/CLfIcv6X+er?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6c9e884-f686-4b20-5994-08dbae238469
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 15:19:37.2642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ViR6VGWzVOAJeCxJXSLxLl7VhneDltNQ3UiWNQlx/V/2EpfbvBajKkioFzgkt5zq2q2GOkTkkm1rUUunT31GtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6814

On 01.09.2023 20:25, Shawn Anastasio wrote:
> Implement bitops.h, based on Linux's implementation as of commit
> 5321d1b1afb9a17302c6cec79f0cbf823eb0d3fc. Though it is based off of
> Linux's implementation, this code diverges significantly in a number of
> ways:
>   - Bitmap entries changed to 32-bit words to match X86 and Arm on Xen
>   - PPC32-specific code paths dropped
>   - Formatting completely re-done to more closely line up with Xen.
>     Including 4 space indentation.

Isn't ...

> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> ---
> v3:
>   - Fix style of inline asm blocks.
>   - Fix underscore-prefixed macro parameters/variables
>   - Use __builtin_popcount for hweight* implementation

... this also a divergence worth calling out?

> --- a/xen/arch/ppc/include/asm/bitops.h
> +++ b/xen/arch/ppc/include/asm/bitops.h
> @@ -1,9 +1,333 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Adapted from Linux's arch/powerpc/include/asm/bitops.h.
> + *
> + * Merged version by David Gibson <david@gibson.dropbear.id.au>.
> + * Based on ppc64 versions by: Dave Engebretsen, Todd Inglett, Don
> + * Reed, Pat McCarthy, Peter Bergner, Anton Blanchard.  They
> + * originally took it from the ppc32 code.
> + */
>  #ifndef _ASM_PPC_BITOPS_H
>  #define _ASM_PPC_BITOPS_H
> 
> +#include <asm/memory.h>
> +
> +#define __set_bit(n, p)         set_bit(n, p)
> +#define __clear_bit(n, p)       clear_bit(n, p)
> +
> +#define BITOP_BITS_PER_WORD     32
> +#define BITOP_MASK(nr)          (1UL << ((nr) % BITOP_BITS_PER_WORD))

With the switch to 32-bit operations, doesn't this want to be 1U?

> +#define BITOP_WORD(nr)          ((nr) / BITOP_BITS_PER_WORD)
> +#define BITS_PER_BYTE           8
> +
>  /* PPC bit number conversion */
> -#define PPC_BITLSHIFT(be)	(BITS_PER_LONG - 1 - (be))
> -#define PPC_BIT(bit)		(1UL << PPC_BITLSHIFT(bit))
> -#define PPC_BITMASK(bs, be)	((PPC_BIT(bs) - PPC_BIT(be)) | PPC_BIT(bs))
> +#define PPC_BITLSHIFT(be)    (BITS_PER_LONG - 1 - (be))
> +#define PPC_BIT(bit)         (1UL << PPC_BITLSHIFT(bit))
> +#define PPC_BITMASK(bs, be)  ((PPC_BIT(bs) - PPC_BIT(be)) | PPC_BIT(bs))
> +
> +/* Macro for generating the ***_bits() functions */
> +#define DEFINE_BITOP(fn, op, prefix)                                           \
> +static inline void fn(unsigned long mask,                                      \
> +                      volatile unsigned int *p_)                               \
> +{                                                                              \
> +    unsigned long old;                                                         \
> +    unsigned int *p = (unsigned int *)p_;                                      \
> +    asm volatile ( prefix                                                      \
> +                   "1: lwarx %0,0,%3,0\n"                                      \
> +                   #op "%I2 %0,%0,%2\n"                                        \
> +                   "stwcx. %0,0,%3\n"                                          \
> +                   "bne- 1b\n"                                                 \
> +                   : "=&r" (old), "+m" (*p)                                    \
> +                   : "rK" (mask), "r" (p)                                      \
> +                   : "cc", "memory" );                                         \
> +}
> +
> +DEFINE_BITOP(set_bits, or, "")
> +DEFINE_BITOP(change_bits, xor, "")
> +
> +#define DEFINE_CLROP(fn, prefix)                                               \
> +static inline void fn(unsigned long mask, volatile unsigned int *_p)           \

Leftover leading underscore.

> +{                                                                              \
> +    unsigned long old;                                                         \
> +    unsigned int *p = (unsigned int *)_p;                                      \
> +    asm volatile ( prefix                                                      \
> +                   "1: lwarx %0,0,%3,0\n"                                      \
> +                   "andc %0,%0,%2\n"                                           \
> +                   "stwcx. %0,0,%3\n"                                          \
> +                   "bne- 1b\n"                                                 \
> +                   : "=&r" (old), "+m" (*p)                                    \
> +                   : "r" (mask), "r" (p)                                       \
> +                   : "cc", "memory" );                                         \
> +}
> +
> +DEFINE_CLROP(clear_bits, "")
> +
> +static inline void set_bit(int nr, volatile void *addr)
> +{
> +    set_bits(BITOP_MASK(nr), (volatile unsigned int *)addr + BITOP_WORD(nr));
> +}
> +static inline void clear_bit(int nr, volatile void *addr)
> +{
> +    clear_bits(BITOP_MASK(nr), (volatile unsigned int *)addr + BITOP_WORD(nr));
> +}
> +
> +/**
> + * test_bit - Determine whether a bit is set
> + * @nr: bit number to test
> + * @addr: Address to start counting from
> + */
> +static inline int test_bit(int nr, const volatile void *addr)
> +{
> +    const volatile unsigned long *p = (const volatile unsigned long *)addr;
> +    return 1 & (p[BITOP_WORD(nr)] >> (nr & (BITOP_BITS_PER_WORD - 1)));
> +}
> +
> +static inline unsigned long test_and_clear_bits(unsigned long mask, volatile void *_p)

Again. And there are more. Yet here (and below) ...

> +{
> +    unsigned long old, t;
> +    unsigned int *p = (unsigned int *)_p;
> +
> +    asm volatile ( PPC_ATOMIC_ENTRY_BARRIER
> +                   "1: lwarx %0,0,%3,0\n"
> +                   "andc %1,%0,%2\n"
> +                   "stwcx. %1,0,%3\n"
> +                   "bne- 1b\n"
> +                   PPC_ATOMIC_EXIT_BARRIER
> +                   : "=&r" (old), "=&r" (t)
> +                   : "r" (mask), "r" (p)
> +                   : "cc", "memory" );

... do you actually need the helper variable, when there's no "+m"
constraint operand?

> +    return (old & mask);
> +}
> +
> +static inline int test_and_clear_bit(unsigned int nr,
> +                                     volatile void *addr)
> +{
> +    return test_and_clear_bits(BITOP_MASK(nr), addr + BITOP_WORD(nr)) != 0;
> +}
> +
> +#define DEFINE_TESTOP(fn, op, eh)                                              \
> +static inline unsigned long fn(unsigned long mask, volatile unsigned int *_p)  \
> +{                                                                              \
> +    unsigned long old, t;                                                      \
> +    unsigned int *p = (unsigned int *)_p;                                      \
> +    asm volatile ( PPC_ATOMIC_ENTRY_BARRIER                                    \
> +                   "1: lwarx %0,0,%3,%4\n"                                     \
> +                   #op "%I2 %1,%0,%2\n"                                        \
> +                   "stwcx. %1,0,%3\n"                                          \
> +                   "bne- 1b\n"                                                 \
> +                   PPC_ATOMIC_EXIT_BARRIER                                     \
> +                   : "=&r" (old), "=&r" (t)                                    \
> +                   : "rK" (mask), "r" (p), "n" (eh)                            \
> +                   : "cc", "memory" );                                         \
> +    return (old & mask);                                                       \
> +}
> +
> +DEFINE_TESTOP(test_and_set_bits, or, 0)

Why can't test_and_clear_bits() not use this macro-ization? And if it
can't and hence there's only this single use, wouldn't it make sense
to avoid going through a macro here, too?

> +static inline int test_and_set_bit(unsigned long nr, volatile void *addr)
> +{
> +    return test_and_set_bits(BITOP_MASK(nr), (volatile unsigned int *)addr +
> +                                             BITOP_WORD(nr)) != 0;

This wants wrapping differently, e.g.

static inline int test_and_set_bit(unsigned long nr, volatile void *addr)
{
    return test_and_set_bits(BITOP_MASK(nr),
                             (volatile unsigned int *)addr +
                             BITOP_WORD(nr)) != 0;
}

or

static inline int test_and_set_bit(unsigned long nr, volatile void *addr)
{
    return test_and_set_bits(
               BITOP_MASK(nr),
               (volatile unsigned int *)addr + BITOP_WORD(nr)) != 0;
}

> +#define flsl(x) generic_flsl(x)
> +#define fls(x) generic_fls(x)
> +#define ffs(x) ({ unsigned int t_ = (x); fls(t_ & - t_); })
> +#define ffsl(x) ({ unsigned long t_ = (x); flsl(t_ & - t_); })

Nit: No blanks after unary operators, please.

> +/* Based on linux/include/asm-generic/bitops/ffz.h */
> +/*
> + * ffz - find first zero in word.
> + * @word: The word to search
> + *
> + * Undefined if no zero exists, so code should check against ~0UL first.
> + */
> +#define ffz(x)  __ffs(~(x))

Nit: Stray double padding blank?

Jan

