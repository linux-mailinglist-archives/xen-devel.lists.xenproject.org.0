Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B8774D0BC
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 10:59:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561130.877484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qImjs-00029Z-U9; Mon, 10 Jul 2023 08:59:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561130.877484; Mon, 10 Jul 2023 08:59:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qImjs-00027N-PX; Mon, 10 Jul 2023 08:59:24 +0000
Received: by outflank-mailman (input) for mailman id 561130;
 Mon, 10 Jul 2023 08:59:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=72qR=C4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qImjr-00027H-F3
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 08:59:23 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2077.outbound.protection.outlook.com [40.107.7.77])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ef391ac-1f00-11ee-8611-37d641c3527e;
 Mon, 10 Jul 2023 10:59:21 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AS8PR04MB8246.eurprd04.prod.outlook.com (2603:10a6:20b:3f6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 08:58:52 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Mon, 10 Jul 2023
 08:58:52 +0000
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
X-Inumbo-ID: 0ef391ac-1f00-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hKarVCWOTRdGwwEcOpE5MJP74wVFvmn1Bk2lDBFDpCUvc7jEuVSy7sIeGuDEDDoh9J0La0y/CsvHx72/P4riW4DEjdRhmjHNljjzpqFh4AnFZgO72BwKzoZF2NPfwLQIQD8CTb8Tz0HZNVPhsTjeMh0kRKxdIUQ8ywtmr49v3x2MkR2PLPrgMfwzKwv6qk64yIPHwUpeAnjqER03WnHSXrBGgixt/7ad6PqKK7wJfJBn8VQ2esXSsNPSr41FD3n6BiEmCijed66t1lo8dvxkwZHteKpdVye78gj/ODriGUhuItyRa62CfsClKI+VRBmv8DrkH9cg8/SZ7FD7wumtrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h811xvasPtVt7HU8DbIZ6kPfEgVZiU2VhfJhpHl8PoE=;
 b=h+J4J5qPi07d1ExMqYMKLTquMPuGvPHIW/HdEnYRAyQLlUBOdAwx/JIZ8LuYG9kHQc30DrlL21ykxHd8LSWzR6UIz6HcbdLCD3YupdVc8LhUx2jUuEu/7xbi3RWWnG3AiBHA1MkmrdWekFq5vXakyVd7/ZHdI2VbOeDTwD6UDs+ox2YwKS1O3v7+qrQGPNUy7qAz9lQleSWxkJnLOKl0UZvVr4eAI1SOhuVCWdlM/Ga2KXYcYZ/+XzrdyfRJlvaaCxio1Zx9ymWxMbbKSiPKszLFsyNX1yozxmEvZuxUg5ftSFxZKHhewiuk08FUbEIuW64pgdPprrxziAaPcJyFsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h811xvasPtVt7HU8DbIZ6kPfEgVZiU2VhfJhpHl8PoE=;
 b=dbnIDKxqGNjo/pFJSAJc8P2gjNKnIN4EnxmBkcgq1FSGw+8gQcpttG0PHQUOydt/DuCCrjDRUtUu8SS8PqaQfuCpomUZj9jNb9H7R0EpHBZnqJF5B5HlBHD9XWbrFxqRDNbENIb90CZbdROXrBngPpUSlcqComqMSMD1tKoy521XjH9ZmuTokeoB0xYTygJRwMLmA3HxyDkllpNohMsvdB0InshznqyDzjIuUGaCoidGjHwe1Ep5jf0feAUorGh9chGdQiqLDVP8lQPEHdYDb3bUvpCYEj36vP8bGTyMLHe/+KGJc8iq2BWhF6JtHMUlkibvWmGHukrYFhw3nZMcow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <60e57a9b-8091-0e6a-6066-2364d7d5441a@suse.com>
Date: Mon, 10 Jul 2023 10:58:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 6/8] RISC-V: annotate entry points with type and size
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <a4907ba1-a247-f96d-54e4-090f27665b20@suse.com>
 <959bdb6d-9b6c-cde0-9459-c83cd3f58b18@suse.com>
In-Reply-To: <959bdb6d-9b6c-cde0-9459-c83cd3f58b18@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::16) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AS8PR04MB8246:EE_
X-MS-Office365-Filtering-Correlation-Id: 621c4fd7-5486-46bb-14d1-08db8123e28c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G7eXVxPSzcjxRBqaCe/yEAnDOkxwyWzac5/PEtmiYW/imrSmhE919mQNE6ksZauF6VGzTFLzhY2seyy09CHQLkxrqUcRJ+udLn0W6lPcVCG9fRaGpEJI2zzHbAUJ4XTgr6/fi0Fm9mcjQ6IPLRyDb970+r317daZojVg1gunrLDNVChNCTANGfHZDyZvkWluZpyJ4PIp/Hx3kWmykAVI28DQ8a4aKEI2XAXcV61hTTcEddEWST6EYVPc+Dld3c8F4v/8ucUPhQUfIxhQe8HIACCI6eHtUGlMfWyigOqMHS7g/cqQs5x8iO4/ga9SesQVbd4DFuWVOWnCZDEQ7n77YKLpD76TO7f3fALvIJbveWLMgzAeM9Pvl3MzbkpVPeLSa7Tcbo1VwAMMyJqW8wF432Uypasr4Rr8GxJtRPp/DXe+4fCju+gJCaILpuOiaTIBBwyJz5CdD0M6mI8Nq5T8jPNig5On7W+FLTns1Xkpd4EHN6CPnUR/mN3UoIgdCNG0UJrFJSNi+xycPej4kSsGt08VlgsgwHwrOaflWP/fLd/Ftk4jpKU4pdElQX6CO35vCDR5TaHycRrPcvAAfNE85Cf6Y9ewYzik4jSm310tpBiOZIEEJYH+n5LHyMVo+ZLnlk03fqdm4yXWnTTATafR9w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(376002)(396003)(136003)(346002)(451199021)(86362001)(31696002)(38100700002)(31686004)(36756003)(54906003)(6486002)(53546011)(26005)(6506007)(186003)(6512007)(2616005)(66556008)(316002)(2906002)(478600001)(66946007)(8676002)(8936002)(66476007)(5660300002)(83380400001)(4326008)(6916009)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WlJQdXkyTXdCSm5PblFqU1hXVGR6YUo2UWRvNnVtU25PTlg4dyt3bTRxRVRG?=
 =?utf-8?B?S3N6RU9nVlZQSjd3ZlQrekM5ZGdEN3RMcW9tT2JqRUNUS1p2cFNtbTZQZ2xv?=
 =?utf-8?B?bWc3TmlRcnhBb3FxR3c5cEY3Qy9NaCt0Q00zQzJUK2VEbE9PZldPMlB2dWZM?=
 =?utf-8?B?MDJTK1JVWVo0cDBxWlRRZGtlajEvZDBUdGo0WGE0d1h4VVUzVi9BRTRGWEJy?=
 =?utf-8?B?UEZ1STNQR2MwM2RxUTdFUGR3UkhOVlJDdTdnNVlpOFZDMDAvcHpYR1pWcVRW?=
 =?utf-8?B?cXpzVGt3K1kxelhYK2h6c293RzduTjMrdzBaZmRvSWJRNGdTZFRnN2EwT0hE?=
 =?utf-8?B?djNXSm1haWJQVmgxMjB4Q0tZS1JRSzBkc1ZmRmFRRHdsaGUzWUk0QmkvbVh3?=
 =?utf-8?B?ZDMwNWx4TTJWd1l3TUdSVTRIUERBZDIxR2ZPRHJZVlQ1Tyt3ckZKN0JhV3A4?=
 =?utf-8?B?NnN0cW1SaUduOTJFT2RPczYrZHJVZHdxVE5IMlo0eWsvdEszRnZBYWlrNkg4?=
 =?utf-8?B?Skg0N2tNYVppMVNKNjdDQ0JHMFhOSGdyblhKYjRvb2VtbHZtMDB1cWF0dGFq?=
 =?utf-8?B?NFZzU1lRZGFxYml5dEdQTU0vN1R5Q0N0OGdsZUFVUU1LVmkyZktZb004dUlj?=
 =?utf-8?B?TllYMURNbE81VjB2d3lYc2V4RXRtN3IwVXh0UjJNdnQwSHNxRyt1eFZlekQ0?=
 =?utf-8?B?T0RzRkxHMG9VUEpueTBaYmRBN0h5ZnorbjFBbmk1M2ppYWRwS3k2azhCdEFr?=
 =?utf-8?B?ZHpGaUo4WjMweUdTblF6NUorMG5UVDdmSllIY0hNcEJiNi92V3kxazlRaXNi?=
 =?utf-8?B?ckZ1NHBIN2JRN3ZNVnJVczdjQ2tleEFNZWVvVlh5K3ZBM3dwcytsckZEcWxD?=
 =?utf-8?B?eFR2Z3dKazZkVUl2WVFHVFNYaHVKMmdFK0hoOXd4bGhlODg2d3R6OWJBenky?=
 =?utf-8?B?S1RqemNiMGo5dVhSOGs5amtMUldGVnZpejh1bGxsSmh2UXJSZmlrQVpRV2F1?=
 =?utf-8?B?SUR3SGhFK2d3MnhHdW5VWlRmbng2OWUrbDQ3MU9peXg0VWJ6RlF6TXhBK2l5?=
 =?utf-8?B?OUhyNUl0QU1raE4yTVdQOTBQdm5uVStxKy91L3VWbmMrclpxeHZBK2w4R3pn?=
 =?utf-8?B?ZEgrazZDYjNnY2JTR2wxUFdrcTJ5ZnJBblVna3RvaXluYm9WM2NZSVN5K2Nu?=
 =?utf-8?B?eVpYSTJNSUZhaXBJTHU3WVJtZnhOUjdjeGN3WWJIQVgvTjFnM3FGMkZPQzN3?=
 =?utf-8?B?MFNSQjVwR2E2VUpkazR5YkdkaHdCT3FRUjhjZEpBMTJLRnNYWElyalRHUzE2?=
 =?utf-8?B?eXBQQnBYMFliYjYwL0svckJmRGltcmtuY00reE5EZmk3VXQySk96UkRLTVhI?=
 =?utf-8?B?MTU2clFPWTNGK1lnVGlGOE5BWVQ4RldtVWZaQkVpS21rZ0NHQm44WFBtZ3pn?=
 =?utf-8?B?MEUvdEF3dTRCMTdUWG9vTjB2VHJYTStSSG4rNitMcmk4b2xqMWtPRGRUdEs5?=
 =?utf-8?B?VDVnY0lEbFAwRitLa0dNTVd2LzhiSXBFZkhXaS82MHBjSHpQbGp6ODRlb3o5?=
 =?utf-8?B?eVhGUnhXZ2RsVytHU1VyL29Xekg3bXd3bDc3Zm9KYk5oK2wvTVdoWUllVTc1?=
 =?utf-8?B?RWNFYkZUNTBOVnNyOGIzMFpEd0dmVFJxU2RNWk5ReVpna1Y2RDVjeDFoRE42?=
 =?utf-8?B?R3E4MSthS3FTOHVmaFFSSjlqS1BTS05keW1uSFBDaHUzRGx3eGw5Q3JUdEpK?=
 =?utf-8?B?Z1RKN21SYTBrTjdqanBiMzdIVExIMFdSMVA0OTV6cUpPSzlKbkZ0YXJra3l0?=
 =?utf-8?B?YjF0bERXVHNtRjZic3pEMlUyNkRPVzRlNW9NYk8wWE1sWmFuR2IxOFUxOFk4?=
 =?utf-8?B?ckVRQ1U3Q0UrczdiZXpralczaXpPM1F2YmFFNTJsSnM3SmxjS1Z5NjdzV2FM?=
 =?utf-8?B?RWdLWVpwSkFIeUtvUHlnUEp5M3lsYTdDMnEwUzA3QnFLN1l6eFZmSFZId2dN?=
 =?utf-8?B?bStIOExUdFhWa3RSUmNKaW14Mk5NQ2NkNlRhUFBXOEkwSUpqYy94SVAyb21o?=
 =?utf-8?B?YzA5QUMvekJ6TU9GcWNtS3hFbGo5WGwwclJrTGpYclVxbW5wMXYwcEZOdGJs?=
 =?utf-8?Q?7ETbEs9zRTSSlTDEo7nTkQFq8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 621c4fd7-5486-46bb-14d1-08db8123e28c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 08:58:52.8524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rmgahp+JM6WRy07vUN79RJoOgJvxGIp9DkVJHxU2KHinOJRQsaw9XYA+dNAPDnVC+u/RpnIzkoEcj1jZrGrkHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8246

On 10.07.2023 10:56, Jan Beulich wrote:
> Use the generic framework in xen/linkage.h. No change in generated code
> except of course the converted symbols change to be hidden ones and gain
> a valid size.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I'm sorry, the Cc list was incomplete here. Adding back the remaining REST
maintainers.

Jan

> ---
> Probably count_args_exp() should move to macros.h, but I first wanted to
> see whether anyone can suggest any better approach for checking whether
> a defined macro expands to nothing.
> ---
> v3: New.
> 
> --- a/xen/arch/riscv/entry.S
> +++ b/xen/arch/riscv/entry.S
> @@ -5,7 +5,7 @@
>  #include <asm/traps.h>
>  
>  /* WIP: only works while interrupting Xen context */
> -ENTRY(handle_trap)
> +FUNC(handle_trap)
>  
>      /* Exceptions from xen */
>  save_to_stack:
> @@ -92,3 +92,4 @@ restore_registers:
>          REG_L   sp, CPU_USER_REGS_SP(sp)
>  
>          sret
> +END(handle_trap)
> --- a/xen/arch/riscv/include/asm/asm.h
> +++ b/xen/arch/riscv/include/asm/asm.h
> @@ -7,6 +7,7 @@
>  #define _ASM_RISCV_ASM_H
>  
>  #ifdef __ASSEMBLY__
> +#include <xen/linkage.h>
>  #define __ASM_STR(x)	x
>  #else
>  #define __ASM_STR(x)	#x
> --- a/xen/arch/riscv/include/asm/config.h
> +++ b/xen/arch/riscv/include/asm/config.h
> @@ -67,12 +67,8 @@
>  
>  /* Linkage for RISCV */
>  #ifdef __ASSEMBLY__
> -#define ALIGN .align 4
> -
> -#define ENTRY(name)                                \
> -  .globl name;                                     \
> -  ALIGN;                                           \
> -  name:
> +#define CODE_ALIGN 16
> +#define CODE_FILL /* empty */
>  #endif
>  
>  #ifdef CONFIG_RISCV_64
> --- a/xen/arch/riscv/riscv64/head.S
> +++ b/xen/arch/riscv/riscv64/head.S
> @@ -8,7 +8,7 @@
>           *   a0 -> hart_id ( bootcpu_id )
>           *   a1 -> dtb_base 
>           */
> -ENTRY(start)
> +FUNC(start)
>          /* Mask all interrupts */
>          csrw    CSR_SIE, zero
>  
> @@ -30,13 +30,14 @@ ENTRY(start)
>          jal     reset_stack
>  
>          tail    start_xen
> +END(start)
>  
>          .section .text, "ax", %progbits
>  
> -ENTRY(reset_stack)
> +FUNC(reset_stack)
>          la      sp, cpu0_boot_stack
>          li      t0, STACK_SIZE
>          add     sp, sp, t0
>  
>          ret
> -
> +END(reset_stack)
> --- a/xen/include/xen/linkage.h
> +++ b/xen/include/xen/linkage.h
> @@ -37,17 +37,28 @@
>  
>  #define END(name) .size name, . - name
>  
> +/*
> + * CODE_FILL in particular may need to expand to nothing (e.g. for RISC-V), in
> + * which case we also need to get rid of the comma in the .balign directive.
> + */
> +#define count_args_exp(args...) count_args(args)
> +#if count_args_exp(CODE_FILL)
> +# define DO_CODE_ALIGN(algn...) LASTARG(CODE_ALIGN, ## algn), CODE_FILL
> +#else
> +# define DO_CODE_ALIGN(algn...) LASTARG(CODE_ALIGN, ## algn)
> +#endif
> +
>  #define FUNC(name, algn...) \
> -        SYM(name, FUNC, GLOBAL, LASTARG(CODE_ALIGN, ## algn), CODE_FILL)
> +        SYM(name, FUNC, GLOBAL, DO_CODE_ALIGN(algn))
>  #define LABEL(name, algn...) \
> -        SYM(name, NONE, GLOBAL, LASTARG(CODE_ALIGN, ## algn), CODE_FILL)
> +        SYM(name, NONE, GLOBAL, DO_CODE_ALIGN(algn))
>  #define DATA(name, algn...) \
>          SYM(name, DATA, GLOBAL, LASTARG(DATA_ALIGN, ## algn), DATA_FILL)
>  
>  #define FUNC_LOCAL(name, algn...) \
> -        SYM(name, FUNC, LOCAL, LASTARG(CODE_ALIGN, ## algn), CODE_FILL)
> +        SYM(name, FUNC, LOCAL, DO_CODE_ALIGN(algn))
>  #define LABEL_LOCAL(name, algn...) \
> -        SYM(name, NONE, LOCAL, LASTARG(CODE_ALIGN, ## algn), CODE_FILL)
> +        SYM(name, NONE, LOCAL, DO_CODE_ALIGN(algn))
>  #define DATA_LOCAL(name, algn...) \
>          SYM(name, DATA, LOCAL, LASTARG(DATA_ALIGN, ## algn), DATA_FILL)
>  
> 
> 


