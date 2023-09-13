Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A1279E0D7
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 09:30:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600994.936877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgKJl-0007t9-3O; Wed, 13 Sep 2023 07:29:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600994.936877; Wed, 13 Sep 2023 07:29:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgKJl-0007qY-0X; Wed, 13 Sep 2023 07:29:45 +0000
Received: by outflank-mailman (input) for mailman id 600994;
 Wed, 13 Sep 2023 07:29:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qgKJi-0007qO-Rj
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 07:29:43 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060b.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d892a72-5207-11ee-8786-cb3800f73035;
 Wed, 13 Sep 2023 09:29:41 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB9810.eurprd04.prod.outlook.com (2603:10a6:800:1df::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Wed, 13 Sep
 2023 07:29:37 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.019; Wed, 13 Sep 2023
 07:29:37 +0000
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
X-Inumbo-ID: 4d892a72-5207-11ee-8786-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6CN046504YACvM/p+7epTiLfx88P1xkG6g16xY0pVKgAUp0MSWdZD8aoHc71ZSIcwxfB1nrVyVdj9i2xxhTqr2NximQWJ7lqMZOFhZnrUhpFoh2HBOIyouYUU0BdmqhvxpwjQXQ56ePTRMKbBOGEkt9kMFCd72dOmnSIGQTCLLDFEsq9VfdWbHKYt02w4zZ/uBdzyFuJfzV12mIkSgVZXibwfYpG65X1UpgdrEdE6CwlqL0ThEoKQjiBE13Q1bYAfT03AOwNm+lbxE+8cibPSUnBRbSXPV6f5x8qm7T9Gq2yt7VceStCnAntvVP/MuRRetUd9++kd7lQVj48SqZkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HNCw7ohUZz3U+URZOXzVYI6KdH4LIvexbVxm71GAocw=;
 b=Rm3V5NgtJUDeXltk7mBvHesJM/LHMSiLFgTLtM+MSqC/QUNFCYOGHc1hClqSjsO7vvxz10YYcmBvG5C9CCznstMOct3nprEncjNO3L5Y/585p0SrpdAa+q+sm3oL3Mqsb37jC5IBdc8U+5OP7/R2JoDcWw+8vyxPSGAGuXFZwIoxrgn3FYWBbQCHRutkkJ+8L2q35zDhN7613n+fWCEm6T+IIt/0Znfyyp2mXjVoC9XOxO1uchxk35ewgWfKu3I4ueiHAhGr9xONefeAlzF6lK2qtoMJvJcxT59t6J+2f4y+WxZA1OqQSB+drxwHvT2CyysfrfyiNgu8hnalbWhfFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HNCw7ohUZz3U+URZOXzVYI6KdH4LIvexbVxm71GAocw=;
 b=Sunv4OZVfeJuwwLUmwEw6xfcbgOXyNR2ioBMN9aDHYNeHKCZFg4jXH27oTCqR8QnBSHwC0D3Aty8WykUy84GtI7LDzbQh5j6luBfHE2gdXDrASiFAx6ulllhRpiWrg9CGW8SmcCFDtEv7hIsBwvO7f5KIQfvyARP0WfJGup1GkkfFxMaXONiluLoyfKbIekEi9SHLwa10sAW3XK6ZJhQSPt3cI4ZwJyVo++FKYVW3Oiuo8Ln+ZdsPc55p6hPQ961huQE6m1DtSnmgGxkmKKn8ZlvPjg7/Ic7xmXZ747/n20ZX9FI6tiVHkozHnA6crr6YqvzX9knUELSkui2Dsn/UA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <60d5d841-29da-519b-057c-18c5796c8f1e@suse.com>
Date: Wed, 13 Sep 2023 09:29:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v5 2/5] xen/ppc: Implement bitops.h
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1694543103.git.sanastasio@raptorengineering.com>
 <06892692342540b6dc1af4d530fe3c2c25cf4a2e.1694543103.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <06892692342540b6dc1af4d530fe3c2c25cf4a2e.1694543103.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB9810:EE_
X-MS-Office365-Filtering-Correlation-Id: acb64a7a-dc74-450c-492f-08dbb42b2f43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cjbw/I5hVH5/Y0+CIvZqTod5fllEKva1EgEEx1rd6xcG6d3rQ/3b9qubhJu60gX8mwr+hbLkQy26UvKBER3bZC1u1gaOklhcNcD/iIrnU8KGJR2c4n/WjA9tCiMG3TV8BEFNFJmxYsd0sM6DOSs/Z4ux3dDrsjJVfp4L3t6rpRBylO/NpXPkMtRP/7YKySNxJmn9O7Aiyd2vtkOFZbLCWCZXwVKl/4w/ReG/fVmNLzutuA2qjZBD7o8iJlAGoPc22oGt2eJ4fXnRBAsXzzZwmh05DsYIRK1wUjh3XJkDS5to1LasVG4KuDsT4gz8fWslbFpZ27j4ScrYbqrkp/Bff0DJeeXiHapesiZEXYIWwppEvk5Glw8WK1xakDG6tYcjM1gwHLG5OZqf1oKIC0VLDR9V0C6Pz75NYZpaRMA8Wm/E7HmmJRgCCUQdo5c+i6LitTxFmZPHCuCpeGoBmxr+tSH1FpWi2xkVhcs+Iz0h96PY+PYwq2GW0FRX/bchHJyEB22kWaTeIND35yFEGmF2DwFfAaDXdGhGVsSsTB2NsmlC5zrY51ARS758ER+R/bknWSJui87TUcx1KPPYJQNyqmhBfFzoRQ9+La8tqdQ6lLn+ouxB5odq8lO6/TbPa/WVIYptaIeTCtakNBuRcZZlHA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(366004)(39860400002)(376002)(346002)(186009)(451199024)(1800799009)(6916009)(316002)(66556008)(41300700001)(66476007)(66946007)(478600001)(38100700002)(86362001)(31696002)(36756003)(2906002)(5660300002)(8936002)(4326008)(8676002)(2616005)(31686004)(26005)(83380400001)(6486002)(53546011)(6506007)(6512007)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTFYZVYxSW5NR2hFOGc0VVNkVFlhUjREU0cxT2FmRXVHSTJNM1lqenBYSk1M?=
 =?utf-8?B?RXJsWkZNRitVeWdNbEE2dXRBTG9ocGdvVVdDTm10NE51UFBFTGVQZTZwOCtF?=
 =?utf-8?B?c0w3ZG1QNVJINVFNdUZFOGxONnh2a25rYTRRZEtzR09qaXZlZjRsbVBjTkM4?=
 =?utf-8?B?cTZFK1BSV1R6NEh5RDJNZmQwMmsxTU45S3VpbWpXeW4xaWM4M1EvNE82N00x?=
 =?utf-8?B?QmpKeXA2TEZMb2JOcGtTQ25vWVVsbjBSc20xVzAxNHV6Q0ZVSVRIendwZHFz?=
 =?utf-8?B?dlJBbnErNmZiUXJSNDNuSUoyRkM3Z2w5SmUzblUzVzRLeWZBZGZCY2lTNCtZ?=
 =?utf-8?B?ekJlQ1Q2eHpRU0ZGd3ROTUZmakhJTmFvRHIraGtpOUc1aTIvVG9KYXVrSzNr?=
 =?utf-8?B?clRPR0VQdlcyWjRjcXJTMDliMlpyZmZIMXpKR0Y0djJzOEFDOGM1WHVSRUNv?=
 =?utf-8?B?bmIxekg4U1lzVCtJOXFwOEpCY20rRmJpMmo4MlBHWit0MjQxR2IyUW1xTnN5?=
 =?utf-8?B?blRJcE96Q1VQZXBvRWlGZmhlWk5zcmdpY3ZqeGliQ0lMLzlhR1pPd2tTZHV2?=
 =?utf-8?B?dXd6cGsyeEIxaFpTMithcUFCUmZ4c1JsUERhQlJyWnBVNDlIR2syNk1JQ2pl?=
 =?utf-8?B?MFU5VkdkWjYwRVVXaGF4ZnJsTWZybHBmcU9WRmdCUHhBTXZlOXUzYVJkY2ha?=
 =?utf-8?B?VHcxYWU2bW1JNytRWTc1Rjl3UU1mdXdFYmZJVTZVaXRnZ2NvQW8zc01ySlRt?=
 =?utf-8?B?ZlcvdUIvaU1ad2l3UGt5eW94K1YzSmk4azEyTi90MzdZL3FBbHBNRDZPSmRz?=
 =?utf-8?B?cXpmc3lZRm10ZWdFK3gvdm9DaEt6VGlWS0VHRVJRSmF2b3NraUIxOW9pOXY2?=
 =?utf-8?B?UDgzejhhcDl2OHVPNHpNUkN5WFdUTE5FbkcwQnZBTG1ZY2pPd3N2Z3FEZWVz?=
 =?utf-8?B?cWVKVldIbXdYZHhaa3NBd3hXRUZRcDZYUlpsWVE1amF5R0w3dmdFRXJmNktL?=
 =?utf-8?B?TWV2S3hSU0gwYTg3QkdvU1pOK3Ntd3VBd0pBL2xSbzAxVHJDU3puQ2tFcFVL?=
 =?utf-8?B?d2p4MXhJQTJvR1lyREJSTENsM0o3K2ZWMG1XR2NDSVVuakFhcTZtaXp4eGw0?=
 =?utf-8?B?SEdjWkNJcHVvNXovWHBGcDRQNTdGMDJGUEN3bjZQVmEySlhLd1ZRZ0xPWTBX?=
 =?utf-8?B?dU94YWsrcTVaMGl4V3l3Wm5XOVdLZm92VUtkMmM4M1Z1NUJ5Qlh5MTdPQzRE?=
 =?utf-8?B?UWtKMEJMaFlnT1ZsK1JLd1l6VU5vdTNrL0hWZGF4NlAxbisvVDNmcWlKM0hP?=
 =?utf-8?B?ZkkzME5wSnFYb3FmakZTdUFBMHhsQ1NkcUdHL05vRlhuYlJwb1N5dWNGcGpI?=
 =?utf-8?B?Tmg4M1VLVmwyRFduTFpwcElja1NiMDBybVpJa2xZNDYzYXVUTjZYYmtpenpF?=
 =?utf-8?B?c1daMi9UaGdqRjdTRGx1SnlVOE1tNjhtZkFWdWw4RVdJV3haWmxnS0NwQUFi?=
 =?utf-8?B?NzAwcS9IMWdxMjBuOFpRajUzUHhXV2RudnVzNVFMNk5DYWlhR3laVVc2NkVO?=
 =?utf-8?B?L0xZQ04rc0FReWpwQWRxRUQ2SnovUnF0VnQwOGg3d2grUm5mNjZ4Zi9JRW5S?=
 =?utf-8?B?Zk5ENGlCTGoxSDVQT1dQeTlkM004RFJkNlQrUlA1bEs1Y24vNy96Q1VMYU9I?=
 =?utf-8?B?aEZ3QU4xdWNFbHplMFowcDNGekNSa2g3STNDckZYUVNxVm9qZ2JoVTR1Z25x?=
 =?utf-8?B?dkVVNmV6VW1MWXpwUS9kQlJZYnViWnVpenhnbVN2WkhZcy9Yc3NmeGM0ZUg2?=
 =?utf-8?B?SWY2ZzFkd1p4akZFQ1hxOHBla09VZi9oa3c5VG04NERaS25hRXZPWWpPWG0y?=
 =?utf-8?B?NTVNcXhkWlNwc0JRUmg5SXB3ZmRrNllmdlFib2xtZlQ2NndhQ2JMZFU5NGNC?=
 =?utf-8?B?THJDT0NLekp6bE45bHhyN2FWcGpzY0x4UjI0OVJGcGtKV05FMzYzQmdocWsy?=
 =?utf-8?B?Y3JXRThSUGtBbnFHUTVYMk1PeW9Ia3ZqL0RwUndad2hsT2NveG9ZUnpubGVL?=
 =?utf-8?B?MzJ5TVJLNmEvc1lmVkM3YTlmcm1VMGhlTzJQNlZ5M3lTNTZ6Vys0NlJyL0lk?=
 =?utf-8?Q?dYPsG+qJbWFbfw+6OmzgukdZI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acb64a7a-dc74-450c-492f-08dbb42b2f43
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 07:29:37.4132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XV/UpLpFy24wIv1TbE9wYdYqwmRtL4QL4iUjGKs2c4IT+n5kZQ8iX9/1o3NbrWTWxVrXaMXBk8R1aw5He/fPOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9810

On 12.09.2023 20:35, Shawn Anastasio wrote:
> Implement bitops.h, based on Linux's implementation as of commit
> 5321d1b1afb9a17302c6cec79f0cbf823eb0d3fc. Though it is based off of
> Linux's implementation, this code diverges significantly in a number of
> ways:
>   - Bitmap entries changed to 32-bit words to match X86 and Arm on Xen
>   - PPC32-specific code paths dropped
>   - Formatting completely re-done to more closely line up with Xen.
>     Including 4 space indentation.
>   - Use GCC's __builtin_popcount* for hweight* implementation
> 
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> ---
> v5:
>   - Switch lingering ulong bitop parameters/return values to uint.
> 
> v4:
>   - Mention __builtin_popcount impelmentation of hweight* in message
>   - Change type of BITOP_MASK expression from unsigned long to unsigned
>     int
>   - Fix remaining underscore-prefixed macro params/vars
>   - Fix line wrapping in test_and_clear_bit{,s}
>   - Change type of test_and_clear_bits' pointer parameter from void *
>     to unsigned int *. This was already done for other functions but
>     missed here.
>   - De-macroize test_and_set_bits.
>   - Fix formatting of ffs{,l} macro's unary operators
>   - Drop extra blank in ffz() macro definition
> 
> v3:
>   - Fix style of inline asm blocks.
>   - Fix underscore-prefixed macro parameters/variables
>   - Use __builtin_popcount for hweight* implementation
>   - Update C functions to use proper Xen coding style
> 
> v2:
>   - Clarify changes from Linux implementation in commit message
>   - Use PPC_ATOMIC_{ENTRY,EXIT}_BARRIER macros from <asm/memory.h> instead
>     of hardcoded "sync" instructions in inline assembly blocks.
>   - Fix macro line-continuing backslash spacing
>   - Fix hard-tab usage in find_*_bit C functions.
> 
>  xen/arch/ppc/include/asm/bitops.h | 332 +++++++++++++++++++++++++++++-
>  1 file changed, 329 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/ppc/include/asm/bitops.h b/xen/arch/ppc/include/asm/bitops.h
> index 548e97b414..0f75ff3f9d 100644
> --- a/xen/arch/ppc/include/asm/bitops.h
> +++ b/xen/arch/ppc/include/asm/bitops.h
> @@ -1,9 +1,335 @@
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
> +#define BITOP_MASK(nr)          (1U << ((nr) % BITOP_BITS_PER_WORD))
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
> +static inline void fn(unsigned int mask,                                      \
> +                      volatile unsigned int *p_)                               \
> +{                                                                              \
> +    unsigned int old;                                                         \
> +    unsigned int *p = (unsigned int *)p_;                                      \

What use is this, when ...

> +    asm volatile ( prefix                                                      \
> +                   "1: lwarx %0,0,%3,0\n"                                      \
> +                   #op "%I2 %0,%0,%2\n"                                        \
> +                   "stwcx. %0,0,%3\n"                                          \
> +                   "bne- 1b\n"                                                 \
> +                   : "=&r" (old), "+m" (*p)                                    \

... the "+m" operand isn't used and ...

> +                   : "rK" (mask), "r" (p)                                      \
> +                   : "cc", "memory" );                                         \

... there's a memory clobber anyway?

Also (nit) note that the long -> int change has caused some of the
backslashes to no longer align.

> +}
> +
> +DEFINE_BITOP(set_bits, or, "")
> +DEFINE_BITOP(change_bits, xor, "")

Are there further plans to add uses of DEFINE_BITOP() with the last argument
not an empty string? If not, how about simplifying things by dropping the
macro parameter?

> +#define DEFINE_CLROP(fn, prefix)                                               \
> +static inline void fn(unsigned int mask, volatile unsigned int *p_)           \
> +{                                                                              \
> +    unsigned int old;                                                         \
> +    unsigned int *p = (unsigned int *)p_;                                      \
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

Same question here.

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
> +    const volatile unsigned int *p = addr;
> +    return 1 & (p[BITOP_WORD(nr)] >> (nr & (BITOP_BITS_PER_WORD - 1)));
> +}
> +
> +static inline unsigned int test_and_clear_bits(
> +    unsigned int mask,
> +    volatile unsigned int *p)
> +{
> +    unsigned int old, t;
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
> +
> +    return (old & mask);
> +}
> +
> +static inline int test_and_clear_bit(unsigned int nr,
> +                                     volatile void *addr)
> +{
> +    return test_and_clear_bits(BITOP_MASK(nr), (volatile unsigned int *)addr +
> +                               BITOP_WORD(nr)) != 0;

Didn't you indicate you'd adjust the odd wrapping?

> +}
> +
> +static inline unsigned int test_and_set_bits(
> +    unsigned int mask,
> +    volatile unsigned int *p)
> +{
> +    unsigned int old, t;
> +
> +    asm volatile ( PPC_ATOMIC_ENTRY_BARRIER
> +                   "1: lwarx %0,0,%3,0\n"
> +                   "or%I2 %1,%0,%2\n"
> +                   "stwcx. %1,0,%3\n"
> +                   "bne- 1b\n"
> +                   PPC_ATOMIC_EXIT_BARRIER
> +                   : "=&r" (old), "=&r" (t)
> +                   : "rK" (mask), "r" (p)
> +                   : "cc", "memory" );
> +
> +    return (old & mask);
> +}
> +
> +static inline int test_and_set_bit(unsigned int nr, volatile void *addr)
> +{
> +    return test_and_set_bits(BITOP_MASK(nr), (volatile unsigned int *)addr +
> +                                             BITOP_WORD(nr)) != 0;

Same here then.

Jan

