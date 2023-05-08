Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1EE6FA2C4
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 11:00:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531302.826877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvwhj-0005Q3-G5; Mon, 08 May 2023 08:58:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531302.826877; Mon, 08 May 2023 08:58:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvwhj-0005OE-7e; Mon, 08 May 2023 08:58:47 +0000
Received: by outflank-mailman (input) for mailman id 531302;
 Mon, 08 May 2023 08:58:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tnRg=A5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pvwhh-0005O8-LX
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 08:58:45 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0609.outbound.protection.outlook.com
 [2a01:111:f400:fe02::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 882dd0b1-ed7e-11ed-8611-37d641c3527e;
 Mon, 08 May 2023 10:58:43 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9455.eurprd04.prod.outlook.com (2603:10a6:20b:4d8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.25; Mon, 8 May
 2023 08:58:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.031; Mon, 8 May 2023
 08:58:39 +0000
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
X-Inumbo-ID: 882dd0b1-ed7e-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPgeT+f6Yjxm99p+kwwV3Na2TYYFl7636mLjD5uXp72T/0kD/nA9aRN8OBrmOz+XB95yH5sqYSxirZYnIY4gGpfS0zp3m0fMMX9/37hgz98pODAswg4TOFnApwAW9mSS1PS/4tkYIrzE/1RZpOzYXfyTEu/3RVqQbDSnvO/7XihNNW08FVajejzhC2kiWv2ufe6JvyyVmWkhKms4qbXTIWmCFd+kE//abVSozGuSQ5n+Oxz0+KDvFQNpJYwKjJCrqT16uSV4AIQBxlOcEXs0V0mCkZRSl2214qd1XDGl1/0oKRkCzNmSQiz1L/jn9hVLKlSONXHIgy5MJRyG2QechA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3EL6ZrgkM24n1dJrDjr80nVR/ElPrBMW09G6XzgUZYk=;
 b=UqFVz0vfUiv2fa4lK7KRUunQlk1SK1oE2NSmt0tLSr7Z6T/Co4pLgVuDu/DN6b8jiSiYUYyPkLO9CqZ68tdt7w1dx07A5GwQDX2ncpbl9YjbGrLTnBi68AIchPb7EQAFhMPl+iuS/7NGeBaqjYUqi4VU4WDvVtGU6Jhh59lyTcILWhfweHU5ZkNFNcQddCfeYGzFjh7DNBIR5F9w51oiwNGjMlWCIRXnlkuhXRjl74Q76vPi8nqSbejwgxbbp9SLbuFWqG+D4I1yhZNQk938kmMQXSkmM0gy8xlA155IFkYcDvRBeLcRW9xtg9hS51RW8jCN+z43M7cEzm+1Ua8Njw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3EL6ZrgkM24n1dJrDjr80nVR/ElPrBMW09G6XzgUZYk=;
 b=HWmivzP/XgSoqU4zxE3FiUMe1XhY9IfVFGlEbob/80qSYHXmSDilcL27xbG40aFsPLI090T+M8nwvjX0O43/zDmf0+r+4kLN192euTYh6990jXgKwnZi+tb8/ymFYolKbK4DbVtCQ2HZLngIqPVOIT9gQJ1feKLiiH4F1AnFrFzY2XewaSzkmilZHrl5po8PzYUVySxCBzRnGAjeHAgRWgDOLwVJ4P5rJzWQRCqVkTtxw46PvVpSQjBtn8PcoN7LLcEIdcgUdhMiPjWqXK5ESx1U/iZqAcuTBYUoEJA551pkfv0ZKv6RVinKZCQMumwwM9J0g+oOdsA+a2FN5ehEag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0533b045-f4cb-0834-ae88-9229bd816cf2@suse.com>
Date: Mon, 8 May 2023 10:58:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v6 2/4] xen/riscv: introduce setup_initial_pages
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1683131359.git.oleksii.kurochko@gmail.com>
 <d1a6fb6112b61000645eb1a4ab9ade8a208d4204.1683131359.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d1a6fb6112b61000645eb1a4ab9ade8a208d4204.1683131359.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR04CA0117.eurprd04.prod.outlook.com
 (2603:10a6:208:55::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9455:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b094322-54b8-4480-149e-08db4fa26a82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+bXLWORfFJYX7l6WtLwL04HkLxaxFPJRd3f+cr8b2UCbZPPwHRvrI3yMnWJyNf5XYp/bLsHX82FnuDwzEh4YcF5uSNy0Rm5aTgJSEArxeUCYmBakiywKk5Sycj4BGmncg3X4GOH4IVbWZVyXnvd0iSVttjjgBU4pCULnbsZdosxu1GlSMByTrtdu47Cpic9if+iERCafu95GGfMpspKekvPlJKtIC+vvj4wFFgYvu841YCykbZfqipFFo6OkioZb3JmUPfj5+nAaQfsA+K9LUJxC4dC0UVlUtWbMD/IwS+vGSB0nSBEK9glIhgfF4gTEKw2W1VAMB7vzASZ4q1ldFsbnZxAlRW4uoLT4um3bdtvpwXHDZyq7t7T9iXbfOCPrZSvdk6LmHMSjyx1gTBafkRpVPsaW50cHP7uUdE0TDXJ7H0vFL1Pd8+MC8uyJ3epiX6b+LiaqRxoXsFTWBpx15ERUd+LVZRhtcZ35Ndf+zYvgj7cn2TBegMGYQz5Vc8AUD5VCHjX8Re61Coimei8jXhZaEuUKIxe8FW81ABVBRwJsrU7Stfe8RNcPFF1QHXHAisyH7/0XjfyHTw92yY6bmBty9wVFMquiQvoyVX0nS3NiPfLtJkN031jYmCLYPzEvxjTYW3Wp4Hu9cs4Y9NuJyA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(376002)(346002)(39860400002)(366004)(451199021)(31686004)(66946007)(66556008)(66476007)(6916009)(4326008)(478600001)(6486002)(316002)(6666004)(54906003)(86362001)(31696002)(36756003)(83380400001)(2616005)(53546011)(6512007)(6506007)(26005)(8936002)(5660300002)(41300700001)(8676002)(30864003)(2906002)(186003)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3NLcCtYemFubVo2RW4xUlRidEpXM0x2WVZxb0I1aEpBSVhpU1hKb1YxeEJz?=
 =?utf-8?B?TmVlemVaYUZ2TG9yclNneFVXTUphb2tFNUFDNTZLSk9ESjRqWnpPbjhMV2Iy?=
 =?utf-8?B?T2FXRS9UWklTOFN4SXFlLzhwNVl6K2hxdG9sWVFJMmp2eW9lRVFxcHkxcCsy?=
 =?utf-8?B?Q2xKOHIzb1o1MWZvaC9DVWRUN05wMGh0VE1rTDcvN0pUMm50OFFBcWVIQU5x?=
 =?utf-8?B?ZFRaWFdoLzVubC9xU2JjZDZsVy9mSEh3eDFNczREUVNiclJEcVlsdkYvRm00?=
 =?utf-8?B?ZytQNkdYVzZWTG5KZnhBdFl1R09TQU5kOTRBN09oRmRrZ1ZpaGF2RUxmSUdN?=
 =?utf-8?B?WFczdnJQQlpOcEw1c0xVR0k2VXRvd01waXBUYUZGWHRuWkxUUWJvanU0czJC?=
 =?utf-8?B?WjA1ckp5NXNnR2plbkpPM09meWx3QlNOeTVwU3RVb2dCbEp3SGh4bmd4STE5?=
 =?utf-8?B?UHR2dFQ2d0NJU2Z2ZW5nVDYwRXp6dFphVnA5YmlmS3NLSkJFbzk1cXVUbCtn?=
 =?utf-8?B?aWJrLzlyVHdSTnJyVmFRT2lweEw2SkZpaFNOdmdCSlZmd2dVZVlOVHVpTjBL?=
 =?utf-8?B?eFh5ZENGSWd0bmRKdnErUDZGVStBU1kvWVFWUzhsU2hhV0tILzlnMHhNc0dQ?=
 =?utf-8?B?d1Z2aXlLK2ErOHlsajZxOFpUMS9uRUJJY3d6aFVHZ09XUG5tOUdqbTltVEVk?=
 =?utf-8?B?bGNyTGlWSHpIY0Z3QmlTTzVDMnVxaE1yRVdPK0x0anQwVnlKMDZIZk1zS2FE?=
 =?utf-8?B?Z1p1Z1AvbzdxcFpqWU55REJGb3hnUDlSTk9TelpzTHZpZVhxd0NKeXJwSyt1?=
 =?utf-8?B?cjk0NjBFT25td2pieHc5TGV4akIzZ0RQY2w3b0ptSXZUZVpUenlxcFpGQ3dl?=
 =?utf-8?B?VnQ0NlljOXJWcU5jUnhOcUIrWlE5MnlwZktsNEhha1pYN3owNTdWV01HL0t6?=
 =?utf-8?B?Rk1RUjFFQk80a28yMTh5Z2x3eUNlUTk3VE1aTmFaMjVxaHVXTndaRTNrNitS?=
 =?utf-8?B?MDd1VG5IR1dWOFlHU0V4TXhVdkpIa2dTc3FTckloZW44KzhFNjBycVMzelBp?=
 =?utf-8?B?cDlrSksvbGlpS2F3dXRQTnlpRDlSZHNWMDdEa2QyZ0k0ZEtyR3NrYUpiMGhH?=
 =?utf-8?B?WDVHaEZ2VUlNcGJYazdyVTNubGlFY2Z2VmVnc0g4eWhscWJTblZscE8xMFFZ?=
 =?utf-8?B?VmtkaVN1cm1vOE9FT1hnYTZCZkllbWRnNi9BWjA3YjduT2NsMWdrSjBiTXFP?=
 =?utf-8?B?S3N0T21UY3RaRXEzc3JjVEdJaDhpNC81QVFXT0ZFSE5FcVF6Vm9aK1RjUFlC?=
 =?utf-8?B?MEVHK2RNbmlEYVNMUHowZFlER29wbHViNzFudENVYXJOSnZBTjJNTm5FVHdU?=
 =?utf-8?B?Skdlc3Rya0dnZlQwTHRYMzJkTUMwNVNjYkdZeko1NWVJV0hJVmk2N1BiYk5Q?=
 =?utf-8?B?bkNhRkxzaWxVUnhHdlpKaHMrNncyWDBrbEJKZTZoUnVKeSt1S0FqMnVIVnBF?=
 =?utf-8?B?Tmx2SGM5SGRRdEhTckwrMDQ2RE15dHhFVkp1a25oOW1CTTVJWXAvZmNDL0JI?=
 =?utf-8?B?WklEWEwra2FDaGlPUlQySm1aS2ZmTFAxNCt1UWI1bVpoRndDdjlJRXo1MW1V?=
 =?utf-8?B?Y1ZnckppY3cxc0ZtZk1TeHRuTW9OQlJ0N3kxR3JjOEtlNE84Q2RZcXBUM3lD?=
 =?utf-8?B?cThlb2VWYWhreDhzNXNWWlV4SWdVeUh5Rnh0ZXBmNlZXaWNHUXlEb2x5MVZZ?=
 =?utf-8?B?YlU1RG9wdzJjUjZZNnZrUDJxVXo1MVdZV3E4Z0I4bUxRZjc5MHUvQ29mOWNs?=
 =?utf-8?B?YWVmbTBZUXNMcUthK2lYVHBCYnNaSE1qSDJaOTNBQ3BSb2dIby9HWFN1eVNX?=
 =?utf-8?B?bWlMYjliR1lQVWVhS3o4ZFJpQUx3OTVCQVl4MEc5Y1p4S2d3d0o4ZU5IZ3Ur?=
 =?utf-8?B?KzROT3ZadHVndVFQMGsrZVhlMzY4YmRjbGE2cjNmbWlOYlZtL1hQMVlDRVdF?=
 =?utf-8?B?c01QNDlDWXFJVi9ONWdzMksrd2k2SzlSVnVaUjRwMnhrYlBtOXRWbkwzaHB2?=
 =?utf-8?B?ekhDTWJRRnlCdy8xbTVPWDNiRXhJZDFoZERvOGo3R0NmR1lDVEJJN1crMVI1?=
 =?utf-8?Q?5H6mqrezS52OJ5IWlUIdPGU6S?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b094322-54b8-4480-149e-08db4fa26a82
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 08:58:39.4982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: do41envXp+MuNom/I54rbH9pmSbC7B9VZkCu/9etSKZ31sAJiNuNwRwnHzq3CLAly2Lh6mdUsICJSKfATyafyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9455

On 03.05.2023 18:31, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/config.h
> +++ b/xen/arch/riscv/include/asm/config.h
> @@ -70,12 +70,23 @@
>    name:
>  #endif
>  
> -#define XEN_VIRT_START  _AT(UL, 0x80200000)
> +#ifdef CONFIG_RISCV_64
> +#define XEN_VIRT_START 0xFFFFFFFFC0000000 /* (_AC(-1, UL) + 1 - GB(1)) */
> +#else
> +#error "RV32 isn't supported"
> +#endif
>  
>  #define SMP_CACHE_BYTES (1 << 6)
>  
>  #define STACK_SIZE PAGE_SIZE
>  
> +#ifdef CONFIG_RISCV_64
> +#define CONFIG_PAGING_LEVELS 3
> +#define RV_STAGE1_MODE SATP_MODE_SV39
> +#else

#define CONFIG_PAGING_LEVELS 2

(or else I would think ...

> +#define RV_STAGE1_MODE SATP_MODE_SV32

... this and hence the entire "#else" should also be omitted)

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/current.h
> @@ -0,0 +1,10 @@
> +#ifndef __ASM_CURRENT_H
> +#define __ASM_CURRENT_H
> +
> +#define switch_stack_and_jump(stack, fn)    \
> +    asm volatile (                          \
> +            "mv sp, %0 \n"                  \
> +            "j " #fn :: "r" (stack) :       \
> +    )

Nit: Style. Our normal way of writing this would be

#define switch_stack_and_jump(stack, fn)    \
    asm volatile (                          \
            "mv sp, %0\n"                   \
            "j " #fn :: "r" (stack) )

i.e. unnecessary colon omitted, no trailin blank on any generated
assembly line, and closing paren not placed on its own line (only
closing figure braces would normally live on their own lines).

However, as to the 3rd colon: Can you really get away here without a
memory clobber (i.e. the construct being a full compiler barrier)?

Further I think you want to make the use of "fn" visible to the
compiler, by using an "X" constraint just like Arm does.

Finally I think you want to add unreachable(), like both Arm and x86
have it. Plus the "noreturn" on relevant functions.

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/page.h
> @@ -0,0 +1,62 @@
> +#ifndef _ASM_RISCV_PAGE_H
> +#define _ASM_RISCV_PAGE_H
> +
> +#include <xen/const.h>
> +#include <xen/types.h>
> +
> +#define VPN_MASK                    ((unsigned long)(PAGETABLE_ENTRIES - 1))
> +
> +#define XEN_PT_LEVEL_ORDER(lvl)     ((lvl) * PAGETABLE_ORDER)
> +#define XEN_PT_LEVEL_SHIFT(lvl)     (XEN_PT_LEVEL_ORDER(lvl) + PAGE_SHIFT)
> +#define XEN_PT_LEVEL_SIZE(lvl)      (_AT(paddr_t, 1) << XEN_PT_LEVEL_SHIFT(lvl))
> +#define XEN_PT_LEVEL_MAP_MASK(lvl)  (~(XEN_PT_LEVEL_SIZE(lvl) - 1))
> +#define XEN_PT_LEVEL_MASK(lvl)      (VPN_MASK << XEN_PT_LEVEL_SHIFT(lvl))
> +
> +#define PTE_VALID                   BIT(0, UL)
> +#define PTE_READABLE                BIT(1, UL)
> +#define PTE_WRITABLE                BIT(2, UL)
> +#define PTE_EXECUTABLE              BIT(3, UL)
> +#define PTE_USER                    BIT(4, UL)
> +#define PTE_GLOBAL                  BIT(5, UL)
> +#define PTE_ACCESSED                BIT(6, UL)
> +#define PTE_DIRTY                   BIT(7, UL)
> +#define PTE_RSW                     (BIT(8, UL) | BIT(9, UL))
> +
> +#define PTE_LEAF_DEFAULT            (PTE_VALID | PTE_READABLE | PTE_WRITABLE)
> +#define PTE_TABLE                   (PTE_VALID)
> +
> +/* Calculate the offsets into the pagetables for a given VA */
> +#define pt_linear_offset(lvl, va)   ((va) >> XEN_PT_LEVEL_SHIFT(lvl))
> +
> +#define pt_index(lvl, va) pt_linear_offset(lvl, (va) & XEN_PT_LEVEL_MASK(lvl))

Maybe better

#define pt_index(lvl, va) (pt_linear_offset(lvl, va) & VPN_MASK)

as the involved constant will be easier to use for the compiler?

> +/* Page Table entry */
> +typedef struct {
> +#ifdef CONFIG_RISCV_64
> +    uint64_t pte;
> +#else
> +    uint32_t pte;
> +#endif
> +} pte_t;
> +
> +#define pte_to_addr(x) (((paddr_t)(x) >> PTE_PPN_SHIFT) << PAGE_SHIFT)
> +
> +#define addr_to_pte(x) (((x) >> PAGE_SHIFT) << PTE_PPN_SHIFT)

Are these two macros useful on their own? I ask because I still consider
them somewhat misnamed, as they don't produce / consume a PTE (but the
raw value). Yet generally you want to avoid any code operating on raw
values, using pte_t instead. IOW I would hope to be able to convince
you to ...

> +static inline pte_t paddr_to_pte(paddr_t paddr,
> +                                 unsigned int permissions)
> +{
> +    return (pte_t) { .pte = addr_to_pte(paddr) | permissions };
> +}
> +
> +static inline paddr_t pte_to_paddr(pte_t pte)
> +{
> +    return pte_to_addr(pte.pte);
> +}

... expand them in the two inline functions and then drop the macros.

> --- /dev/null
> +++ b/xen/arch/riscv/mm.c
> @@ -0,0 +1,315 @@
> +#include <xen/compiler.h>
> +#include <xen/init.h>
> +#include <xen/kernel.h>
> +#include <xen/pfn.h>
> +
> +#include <asm/early_printk.h>
> +#include <asm/config.h>

No inclusion of asm/config.h (or xen/config.h) in any new code please.
For quite some time xen/config.h has been forcefully included everywhere
by the build system.

> +/*
> + * It is expected that Xen won't be more then 2 MB.
> + * The check in xen.lds.S guarantees that.
> + * At least 3 page (in case of Sv39 )
> + * tables are needed to cover 2 MB.

I guess this reads a little better as "At least 3 page tables (in case of
Sv39) ..." or "At least 3 (in case of Sv39) page tables ..." Also could I
talk you into using the full 80 columns instead of wrapping early in the
middle of a sentence?

> One for each page level
> + * table with PAGE_SIZE = 4 Kb
> + *
> + * One L0 page table can cover 2 MB
> + * (512 entries of one page table * PAGE_SIZE).
> + *
> + */
> +#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) + 1)

Hmm, did you lose the part of the comment explaining the "+ 1"? Or did
the need for that actually go away (and you should drop it here)?

> +#define PGTBL_ENTRY_AMOUNT  (PAGE_SIZE / sizeof(pte_t))

Isn't this PAGETABLE_ENTRIES (and the constant hence unnecessary)?

> +static void __init setup_initial_mapping(struct mmu_desc *mmu_desc,
> +                                         unsigned long map_start,
> +                                         unsigned long map_end,
> +                                         unsigned long pa_start,
> +                                         unsigned int permissions)

What use is the last parameter, when the sole caller passes
PTE_LEAF_DEFAULT (i.e. a build-time constant)? Then ...

> +{
> +    unsigned int index;
> +    pte_t *pgtbl;
> +    unsigned long page_addr;
> +    pte_t pte_to_be_written;
> +    unsigned long paddr;
> +    unsigned int tmp_permissions;

... this variable (which would better be of more narrow scope anyway, like
perhaps several more of the above) could also have its tmp_ prefix dropped
afaict.

> +    if ( (unsigned long)_start % XEN_PT_LEVEL_SIZE(0) )
> +    {
> +        early_printk("(XEN) Xen should be loaded at 4k boundary\n");
> +        die();
> +    }
> +
> +    if ( map_start & ~XEN_PT_LEVEL_MAP_MASK(0) ||
> +         pa_start & ~XEN_PT_LEVEL_MAP_MASK(0) )
> +    {
> +        early_printk("(XEN) map and pa start addresses should be aligned\n");
> +        /* panic(), BUG() or ASSERT() aren't ready now. */
> +        die();
> +    }
> +
> +    for ( page_addr = map_start; page_addr < map_end; page_addr += XEN_PT_LEVEL_SIZE(0) )

Nit: Style (line looks to be too long now).

    for ( page_addr = map_start; page_addr < map_end;
          page_addr += XEN_PT_LEVEL_SIZE(0) )

is the way we would typically wrap it, but

    for ( page_addr = map_start;
          page_addr < map_end;
          page_addr += XEN_PT_LEVEL_SIZE(0) )

would of course also be okay if you preferred that.

> +    {
> +        pgtbl = mmu_desc->pgtbl_base;
> +
> +        switch ( mmu_desc->num_levels )
> +        {
> +        case 4: /* Level 3 */
> +            HANDLE_PGTBL(3);
> +        case 3: /* Level 2 */
> +            HANDLE_PGTBL(2);
> +        case 2: /* Level 1 */
> +            HANDLE_PGTBL(1);
> +        case 1: /* Level 0 */
> +            index = pt_index(0, page_addr);
> +            paddr = (page_addr - map_start) + pa_start;
> +
> +            tmp_permissions = permissions;
> +
> +            if ( is_kernel_text(LINK_TO_LOAD(page_addr)) ||
> +                    is_kernel_inittext(LINK_TO_LOAD(page_addr)) )

Nit: Style (and I'm pretty sure I did comment on this kind of too deep
indentation already).

> +                tmp_permissions =
> +                    PTE_EXECUTABLE | PTE_READABLE | PTE_VALID;
> +
> +            if ( is_kernel_rodata(LINK_TO_LOAD(page_addr)) )
> +                tmp_permissions = PTE_READABLE | PTE_VALID;
> +
> +            pte_to_be_written = paddr_to_pte(paddr, tmp_permissions);
> +
> +            if ( !pte_is_valid(pgtbl[index]) )
> +                pgtbl[index] = pte_to_be_written;
> +            else
> +            {
> +                /*
> +                * get an adresses of current pte and that one to
> +                * be written
> +                */

Nit: Style (one missing blank each in the last three lines, and comment
text wants to start with a capital letter).

> +                unsigned long curr_pte =
> +                    pgtbl[index].pte & ~(PTE_DIRTY | PTE_ACCESSED);

While technically "unsigned long" is okay to use here (afaict), I'd still
recommend ...

> +                pte_to_be_written.pte &= ~(PTE_DIRTY | PTE_ACCESSED);
> +
> +                if ( curr_pte != pte_to_be_written.pte )

... doing everything in terms of pte_t:

                pte_t curr_pte = pgtbl[index];

                curr_pte.pte &= ~(PTE_DIRTY | PTE_ACCESSED);
                pte_to_be_written.pte &= ~(PTE_DIRTY | PTE_ACCESSED);

                if ( curr_pte.pte != pte_to_be_written.pte )

or perhaps even simply

                if ( (pgtbl[index].pte ^ pte_to_be_written.pte) &
                      ~(PTE_DIRTY | PTE_ACCESSED) )

> +                {
> +                    early_printk("PTE overridden has occurred\n");
> +                    /* panic(), <asm/bug.h> aren't ready now. */
> +                    die();
> +                }
> +            }
> +        }
> +    }
> +    #undef HANDLE_PGTBL

Nit: Such an #undef, even if technically okay either way, would imo
better live in the same scope (and have the same indentation) as the
corresponding #define. Since your #define is ahead of the function, it
would ...

> +}

... then live here.

> +static void __init calc_pgtbl_lvls_num(struct  mmu_desc *mmu_desc)

Nit: Double blank after "struct".

> +{
> +    unsigned long satp_mode = RV_STAGE1_MODE;
> +
> +    /* Number of page table levels */
> +    switch (satp_mode)
> +    {
> +    case SATP_MODE_SV32:
> +        mmu_desc->num_levels = 2;
> +        break;
> +    case SATP_MODE_SV39:
> +        mmu_desc->num_levels = 3;
> +        break;
> +    case SATP_MODE_SV48:
> +        mmu_desc->num_levels = 4;
> +        break;
> +    default:
> +        early_printk("(XEN) Unsupported SATP_MODE\n");
> +        die();
> +    }
> +}

Do you really need this function anymore? Isn't it now simply

    mmu_desc.num_levels = CONFIG_PAGING_LEVELS?

in the caller? WHich could then even be the variable's initializer
there?

> +static bool __init check_pgtbl_mode_support(struct mmu_desc *mmu_desc,
> +                                            unsigned long load_start,
> +                                            unsigned long satp_mode)
> +{
> +    bool is_mode_supported = false;
> +    unsigned int index;
> +    unsigned int page_table_level = (mmu_desc->num_levels - 1);
> +    unsigned level_map_mask = XEN_PT_LEVEL_MAP_MASK(page_table_level);
> +
> +    unsigned long aligned_load_start = load_start & level_map_mask;
> +    unsigned long aligned_page_size = XEN_PT_LEVEL_SIZE(page_table_level);
> +    unsigned long xen_size = (unsigned long)(_end - start);
> +
> +    if ( (load_start + xen_size) > (aligned_load_start + aligned_page_size) )
> +    {
> +        early_printk("please place Xen to be in range of PAGE_SIZE "
> +                     "where PAGE_SIZE is XEN_PT_LEVEL_SIZE( {L3 | L2 | L1} ) "
> +                     "depending on expected SATP_MODE \n"
> +                     "XEN_PT_LEVEL_SIZE is defined in <asm/page.h>\n");
> +        die();
> +    }
> +
> +    index = pt_index(page_table_level, aligned_load_start);
> +    stage1_pgtbl_root[index] = paddr_to_pte(aligned_load_start,
> +                                            PTE_LEAF_DEFAULT | PTE_EXECUTABLE);
> +
> +    asm volatile ( "sfence.vma" );
> +    csr_write(CSR_SATP,
> +              PFN_DOWN((unsigned long)stage1_pgtbl_root) |
> +              satp_mode << SATP_MODE_SHIFT);
> +
> +    if ( (csr_read(CSR_SATP) >> SATP_MODE_SHIFT) == satp_mode )
> +        is_mode_supported = true;

Just as a remark: While plain shift is kind of okay here, because the field
is the top-most one in the register, generally you will want to get used to
MASK_EXTR() (and MASK_INSR()) in cases like this one.

> +    csr_write(CSR_SATP, 0);
> +
> +    /* Clean MMU root page table */
> +    stage1_pgtbl_root[index] = paddr_to_pte(0x0, 0x0);
> +
> +    asm volatile ( "sfence.vma" );

Doesn't this want to move between the SATP write and the clearing of the
root table slot? Also here and elsewhere - don't these asm()s need memory
clobbers? And anyway - could I talk you into introducing an inline wrapper
(e.g. named sfence_vma()) so all uses end up consistent?

> +void __init setup_initial_pagetables(void)
> +{
> +    struct mmu_desc mmu_desc = { 0, 0, NULL, NULL };
> +
> +    /*
> +     * Access to _stard, _end is always PC-relative

Nit: Typo-ed symbol name. Also ...

> +     * thereby when access them we will get load adresses
> +     * of start and end of Xen
> +     * To get linker addresses LOAD_TO_LINK() is required
> +     * to use
> +     */

see the earlier line wrapping remark again. Finally in multi-sentence
comments full stops are required.

> +    unsigned long load_start    = (unsigned long)_start;
> +    unsigned long load_end      = (unsigned long)_end;
> +    unsigned long linker_start  = LOAD_TO_LINK(load_start);
> +    unsigned long linker_end    = LOAD_TO_LINK(load_end);
> +
> +    if ( (linker_start != load_start) &&
> +         (linker_start <= load_end) && (load_start <= linker_end) )
> +    {
> +        early_printk("(XEN) linker and load address ranges overlap\n");
> +        die();
> +    }
> +
> +    calc_pgtbl_lvls_num(&mmu_desc);
> +
> +    if ( !check_pgtbl_mode_support(&mmu_desc, load_start, RV_STAGE1_MODE) )

It is again questionable here whether passing a constant to a function
at its sole call site is really useful.

> +void __init noinline enable_mmu()
> +{
> +    /*
> +     * Calculate a linker time address of the mmu_is_enabled
> +     * label and update CSR_STVEC with it.
> +     * MMU is configured in a way where linker addresses are mapped
> +     * on load addresses so in a case when linker addresses are not equal
> +     * to load addresses, after MMU is enabled, it will cause
> +     * an exception and jump to linker time addresses.
> +     * Otherwise if load addresses are equal to linker addresses the code
> +     * after mmu_is_enabled label will be executed without exception.
> +     */
> +    csr_write(CSR_STVEC, LOAD_TO_LINK((unsigned long)&&mmu_is_enabled));
> +
> +    /* Ensure page table writes precede loading the SATP */
> +    asm volatile ( "sfence.vma" );
> +
> +    /* Enable the MMU and load the new pagetable for Xen */
> +    csr_write(CSR_SATP,
> +              PFN_DOWN((unsigned long)stage1_pgtbl_root) |
> +              RV_STAGE1_MODE << SATP_MODE_SHIFT);
> +
> +    asm volatile ( ".align 2" );

May I suggest to avoid .align, and to prefer .balign and .p2align instead?
This helps people coming from different architectures, as which of the two
.align resolves to is arch-dependent.

> --- a/xen/arch/riscv/riscv64/head.S
> +++ b/xen/arch/riscv/riscv64/head.S
> @@ -1,4 +1,5 @@
>  #include <asm/asm.h>
> +#include <asm/asm-offsets.h>
>  #include <asm/riscv_encoding.h>
>  
>          .section .text.header, "ax", %progbits

How does a need for this arise all of the sudden, without other changes
to this file? Is this maybe a leftover which wants dropping?

> --- a/xen/arch/riscv/xen.lds.S
> +++ b/xen/arch/riscv/xen.lds.S
> @@ -137,6 +137,7 @@ SECTIONS
>      __init_end = .;
>  
>      .bss : {                     /* BSS */
> +        . = ALIGN(POINTER_ALIGN);
>          __bss_start = .;
>          *(.bss.stack_aligned)
>          . = ALIGN(PAGE_SIZE);

Doesn't this want to be a separate change?

Jan

