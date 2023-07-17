Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 794D57566F7
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 16:59:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564675.882276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLPgd-0005oI-D5; Mon, 17 Jul 2023 14:58:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564675.882276; Mon, 17 Jul 2023 14:58:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLPgd-0005lB-9k; Mon, 17 Jul 2023 14:58:55 +0000
Received: by outflank-mailman (input) for mailman id 564675;
 Mon, 17 Jul 2023 14:58:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hD51=DD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLPgb-0005l5-QL
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 14:58:53 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20629.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 712d2ee1-24b2-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 16:58:52 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7218.eurprd04.prod.outlook.com (2603:10a6:20b:1d9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Mon, 17 Jul
 2023 14:58:49 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 14:58:49 +0000
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
X-Inumbo-ID: 712d2ee1-24b2-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bh0vG7yO+97d/69SQ9kw6t1j0s6engY/m4BNr86+IGqqRuTOei+LVonot5lzCw8ibZquzl8pkIOVGp52H2PA/yVNq35a8p3zu1rrnnp5zlW3KB5nMcgFNXvG4A8zSz9hlKWMRDh+BS1n94J37TzhzXMUMN/xWCP52xTejFxbGrmtM3XkXWXsQFFKT3wCplcZEO6vimDNFjsmHYZiRO7+byvPihYrPxjhPL3gibiMakQ69PbxaP0T85+iWXy/OR7u3UibfmnjY+S/ACEL49L3HBh9efK9rX0062/LSzlAn/W7RT/GbmWIH4F+0lMRNvgZdqQMRd/3v27f4octaD4FZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZPoecbJRYlRk6sfmVlBwFwGvOQqhrFi6GDzPvdfhZQ=;
 b=CI+3Xnf9BGTCZbkup+QH5Yn9JvtuDJ8BFc5u6JPkHI0RF3DFsVkj79KarOTkeX97BaWHI8cxbamOfG/2BFzGbIhzrR3TV8DOP0fnpVYTGcukAtTfZPLREH5Z8XCF+ruJ1NXrQ5/d29HUjRwWIZ3gr0b9ClUPXEIYAAR+rXiEsLk5ltg38uIeJBcEW9+27HIhBsMUxPtRb6+BXR/NoTZFHMyb4ibb2LXIMmvsqQQUZ29KexXPjxz7V9SJZsv6xTpdJG4k+XSaCYNlqINQ5pAGP9s89GA867D/jrNo6nC7gMFIIMHaVC7ycimTOm8CaOVf+UCQzGvF/y/EUdXQ+yhx4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZPoecbJRYlRk6sfmVlBwFwGvOQqhrFi6GDzPvdfhZQ=;
 b=wdUuXdTIatUlV4z3YqgSD9eG6Ha1SvEP58zJFJpMID8MTBbFJ22gzp/rQgDHdyei9gX17N9f9ZEYybluCOHK1PJ3cvj4bg7d5cHni4F1/VolaalRgmHVbhk0TDN56niUluGZQZNdOVN+8vxt3VNd0Q1QBswyFMUsn6Pa/gUHcWAY+ZcrhucBEGXZ8FxeM3XpyIIedWQM9VZJndBjPKvn43XqC1zU5v8idBLZr8747I5QzV6PzTDV2mdQSmel0wqv98n6Z3weIV3lij5Dy1fQPdKU+IGLBYhhxhy378OzxAtw0/EbaDhcIU03nF5JFg1OocRncdrxGUCK5mCACiDmvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5cec8802-a109-2a0c-10e2-803fdfcb9cf1@suse.com>
Date: Mon, 17 Jul 2023 16:58:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 2/3] xen/riscv: introduce function for physical offset
 calculation
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1689604562.git.oleksii.kurochko@gmail.com>
 <f86724014bf5234f22cd18e7b3da8e8aa83e1e08.1689604562.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f86724014bf5234f22cd18e7b3da8e8aa83e1e08.1689604562.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0062.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7218:EE_
X-MS-Office365-Filtering-Correlation-Id: eabcb529-f446-46f1-914f-08db86d653d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dYLIDCW2B+hnwH3d3jJ6ws9ObMGZtHTKv424lorS0iE6eQ7nR1TiWE6XgzTSiQCuoaPP6fJFoHiMlhqbV7DX9KOmUhUPeuSupaWfUYo2F0arv5ftl0aucNkeC81pv+Iw6WO67XWb4ZIEh9TxzcEGzDQANK2ZAytrZVsCGx1DsoFyLJ1nwSfwnwD0XO7Veo1DmGk4C27sfasyrVOZVkzDBIu2MiIKlSV/gbn9fO3sirgP6saZCUGtWxd/KT5sjR8gs+oZK0P+dTYodFea15o9oLzr9OQ/ebGrFtvOfN0+sr1UHIm2vK3idBhrRMPagogp8fxcwmGbpt6nyz4jOMLS0EfI+JtJSk1gL1c9MSFaK+AK8L4oA3DImPFHUkod5ry8Oi/zt6lJBE0rXyI1kh5CfxboFIOdN1gRUnSNmsXT2wtMcHh5fUUL1uNWFTsFgKiEmxaPsuD803zCQATrznwQ/caN/wwOfvT7TVEFYNTwkeR1kdZStGljgVycEoicWZBpxouDhq7E4LBYl9N97wn8yyS8i9xjxC60vXL0ERTDgLvSuiwanu7w6Q45hDnMPBCXixPOruxwemqLwYy9f6uovo+BU5c5rq0CR9EdHZ+2/IbXoTB9YX3Keyq7JN47VA+ty0udRY7WDHEcoddpPw//Dw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(346002)(136003)(39860400002)(376002)(451199021)(31686004)(2906002)(54906003)(478600001)(6666004)(6486002)(36756003)(8676002)(4326008)(316002)(41300700001)(6916009)(66556008)(66476007)(8936002)(66946007)(83380400001)(38100700002)(6512007)(5660300002)(86362001)(31696002)(53546011)(26005)(2616005)(186003)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHg1N3E5dkRoZzJxWEF2VTFhL25IaHVreTkyV2l1R2xERTlsRktMN1FndHpY?=
 =?utf-8?B?ekNOTDAzSnhwa1B6ZjRwMDhLcVdvdDQ5cXdLcWlBMWsxcWdZZGZlSkczbHVC?=
 =?utf-8?B?TTkvQ3dhdS9wOG9JWEJLdDdwRFF4VDVvL3o3VG51ZGxickJlaUIzZWdodHY3?=
 =?utf-8?B?RUJRYXBaSVh4K3VuK0daV2k2MUFVRlhlWlc5NVlIQ3lPL3FHRmptcFZkUGFN?=
 =?utf-8?B?eFI2S1Q3SEVWeGRCRExxOHdRamtaL1ROZk8wNUZPWVNlMEJrRXRvc0FEaWFn?=
 =?utf-8?B?cldKOHJmOFlCMlk1MGlaeTBkM0NqSUlXV0k4TUJlTm1nMm04OXNhd0pFNXIy?=
 =?utf-8?B?MVVnejZyRWYxbVh6UTZnOFVxenJqMmJMVnJSMzRZbUR3WDJxR1htZ2lweGNC?=
 =?utf-8?B?V3U3TU1zZkRnczNLUXZZUURvRTY0TVcyNTFpUnJjWWxyVWg2OTZsWjVNOHh2?=
 =?utf-8?B?QjUzYm1WS01WT0lJMGJONm1GWkhjWUFJcG0wSUhrMFIwRHM2SWQyVm9YeE9J?=
 =?utf-8?B?dTdVZ3J3YTkzdjFwOXV6bjBrTXRUNXZSbld5VWorWktjRU1HY2RhditHOW4w?=
 =?utf-8?B?QTJkbWY1ejBiSk15cnpoMzdZNGp0Zm0wVE5UUmZ5QWpma3o3dkJwaU5qbzRh?=
 =?utf-8?B?SmUyS1dUQlhYRmJLYVNTT0ZYbFNOSnhXMTllWmJLc0NYd3RPNHpvVzFzbWZv?=
 =?utf-8?B?VTFWWE5HUTZOZGwyMGh4Zk5EVGhCc3Rrenh6d0hzWFFLdTlVLzNZa1k1T3Bw?=
 =?utf-8?B?RGt5d2wzdWVLVTBZWml1bUxad2NmMC9IZndZUUUwdGk4Wnd6VGZhbjhQU0s2?=
 =?utf-8?B?MXlGVHBHTHJETUtoZkk0c2pOVllWYktMMkdxTVBBVXFzMFhnUnR4RXZCMktC?=
 =?utf-8?B?ait5bjB2VWdyVk9yN1I1cWQzUkowRjA2c3JyZWt1YnQyWnZiK3g1L3JyQUcv?=
 =?utf-8?B?K29BUkVZbDM2Y2NONVo2WHVxZ0U4eGFFZ3l3ekJyN2VqSzZPM2dzMURSQWNq?=
 =?utf-8?B?L1JORWx1aVJvN0FiR0UwbWp5NUtrcXdJL3J1MGZzZmpIYStzMGx2S1R4eWJF?=
 =?utf-8?B?SldaTGJDMFdjTlMyQnpJYUdWVDYyRk53MFJvd0NpV1hyODUzcWlKUVBHN1dr?=
 =?utf-8?B?QXhaTzRCR1FaZDdNai9RMERJVEFIM0duVXpMNUxRelpMY2xadEtydlpsTVcw?=
 =?utf-8?B?NzJkWEwybTcwSnl1dzdHSldGN25MZmZ0MFY0cEs1eHplTXJUNlJ1V0RGbHRV?=
 =?utf-8?B?YzRrS2pCbjVJQm51aVY1ZU85V0ZVSzFmUVoyRHR1cjAzcDNuY2NyUVJBUkNm?=
 =?utf-8?B?U0hteW9tRlRiSTZjaE1pR1BqV1RDeFhENFNJS2o1ZG94OHlUUzJ4ckJ0Q0RR?=
 =?utf-8?B?RHFrNkNKTCszK2RRMlk3dS9TZHMzaWltL2ExWm5xSTJzU2lTZ3phUFNXamJv?=
 =?utf-8?B?aWdDdlRJVnY2dVg5Vk1TaG1FNUFkbUgxeE9GbmVEV2YxR0w0NWdKdG9qSWor?=
 =?utf-8?B?dWM5b2ZZRS83RE5GNm1oZjNZUmtBSHlIeFEzZTVlaHVTUDFqUTBCY1ZYckxE?=
 =?utf-8?B?bUs3eVY3bSt3QXFwMm5BT0lPemZOSGZ5K3dvYy9wSjdMMlVDZlFNelg5YkZy?=
 =?utf-8?B?dCtveTR1TTI1eFQ1OGM4eEp0VkpiZkNTd2V6QUNNL2QreHI5dUZRLzN1UVNO?=
 =?utf-8?B?N2NHVnlWSVhiS09hNE1pZmdlbldDUVBYWTlHSG1nRlZtTmZkR3NZTHpvMzI3?=
 =?utf-8?B?NXZ3SDVOZWFpOFFuZGE5QmREYnpyR0NvNWVJRUt3K2c4UnVkY1g5S0NnSkEz?=
 =?utf-8?B?OVhGMW1raFc2YnJFc0dnNDdUWGZwbEtiVGIwNXppRjJrRWdncW8rTFN5ak5L?=
 =?utf-8?B?Ky9RM2drNUtQNzdsK0Uvcm1pLzdhOUZSQnMyU0xYc3hqcjhHK3ZJYU9ZVFNI?=
 =?utf-8?B?N0dpTVVLTVFCTFcwTUdSVkdYWlRoT2JkcGQrNW16SFZKdnBkUjNtMGVnOURk?=
 =?utf-8?B?cXdyWWVUd0xXK2tBSThRaTU3dUk0c1BIOGpXNEE3TnQvT1B2M3hCdEtHRkhN?=
 =?utf-8?B?WVZ3cUlWNGthS05ka3ByUWh5QkJhNHJta3IyVjUyL3hRRUFtUHJRVGEzc0ll?=
 =?utf-8?Q?ypmxXqQeqGdOr5R8xwDGYj8IN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eabcb529-f446-46f1-914f-08db86d653d0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 14:58:49.1715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZTvaTmFUokEjr+8q6PjNYmMBV3NVhBy+8d5Y32cwdaArb5CJgCDDJw1wXXO1+jaCJLgJAFn7v0HDuyaZW840pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7218

On 17.07.2023 16:40, Oleksii Kurochko wrote:
> The function was introduced to calculate and save physical
> offset before MMU is enabled because access to start() is
> PC-relative and in case of linker_addr != load_addr it will
> result in incorrect value in phys_offset.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V3:
>  - save/restore of a0/a1 registers before C first function call.
> ---
> Changes in V2:
>   - add __ro_after_init for phys_offset variable.
>   - remove double blank lines.
>   - add __init for calc_phys_offset().
>   - update the commit message.
>   - declaring variable phys_off as non static as it will be used in head.S.
> ---
>  xen/arch/riscv/include/asm/mm.h |  2 ++
>  xen/arch/riscv/mm.c             | 18 +++++++++++++++---
>  xen/arch/riscv/riscv64/head.S   | 14 ++++++++++++++
>  3 files changed, 31 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
> index 5e3ac5cde3..d9c4205103 100644
> --- a/xen/arch/riscv/include/asm/mm.h
> +++ b/xen/arch/riscv/include/asm/mm.h
> @@ -15,4 +15,6 @@ void setup_initial_pagetables(void);
>  void enable_mmu(void);
>  void cont_after_mmu_is_enabled(void);
>  
> +void calc_phys_offset(void);
> +
>  #endif /* _ASM_RISCV_MM_H */
> diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
> index fddb3cd0bd..c84a8a7c3c 100644
> --- a/xen/arch/riscv/mm.c
> +++ b/xen/arch/riscv/mm.c
> @@ -1,5 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  
> +#include <xen/cache.h>
>  #include <xen/compiler.h>
>  #include <xen/init.h>
>  #include <xen/kernel.h>
> @@ -19,9 +20,10 @@ struct mmu_desc {
>      pte_t *pgtbl_base;
>  };
>  
> -#define PHYS_OFFSET ((unsigned long)_start - XEN_VIRT_START)
> -#define LOAD_TO_LINK(addr) ((addr) - PHYS_OFFSET)
> -#define LINK_TO_LOAD(addr) ((addr) + PHYS_OFFSET)
> +unsigned long __ro_after_init phys_offset;
> +
> +#define LOAD_TO_LINK(addr) ((unsigned long)(addr) - phys_offset)
> +#define LINK_TO_LOAD(addr) ((unsigned long)(addr) + phys_offset)
>  
>  /*
>   * It is expected that Xen won't be more then 2 MB.
> @@ -273,3 +275,13 @@ void __init noreturn noinline enable_mmu()
>      switch_stack_and_jump((unsigned long)cpu0_boot_stack + STACK_SIZE,
>                            cont_after_mmu_is_enabled);
>  }
> +
> +/*
> + * calc_phys_offset() should be used before MMU is enabled because access to
> + * start() is PC-relative and in case when load_addr != linker_addr phys_offset
> + * will have an incorrect value
> + */
> +void __init calc_phys_offset(void)
> +{
> +    phys_offset = (unsigned long)start - XEN_VIRT_START;
> +}
> diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
> index 2c0304646a..9015d06233 100644
> --- a/xen/arch/riscv/riscv64/head.S
> +++ b/xen/arch/riscv/riscv64/head.S
> @@ -29,6 +29,20 @@ ENTRY(start)
>  
>          jal     reset_stack
>  
> +        /*
> +         * save hart_id and dtb_base as a0 and a1 register can be used
> +         * by C code ( f.e. setup_initial_pagetables will update a0 and
> +         * a1 )

I'd recommend dropping the part in parentheses - for one the function
doesn't exist yet, and then you're merely restating what the ABI has.

> +         */
> +        mv      s0, a0
> +        mv      s1, a1
> +
> +        jal     calc_phys_offset
> +
> +        /* restore bootcpu_id and dtb address */

Is the first name here intentionally different from that in the other
comment (where it's "hart_id")?

Jan

> +        mv      a0, s0
> +        mv      a1, s1
> +
>          tail    start_xen
>  
>          .section .text, "ax", %progbits


