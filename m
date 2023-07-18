Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28405758056
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 17:03:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565353.883458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLmEN-0004So-5i; Tue, 18 Jul 2023 15:03:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565353.883458; Tue, 18 Jul 2023 15:03:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLmEN-0004QR-2O; Tue, 18 Jul 2023 15:03:15 +0000
Received: by outflank-mailman (input) for mailman id 565353;
 Tue, 18 Jul 2023 15:03:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g6ux=DE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLmEL-0004QJ-1g
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 15:03:13 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35d671f6-257c-11ee-8611-37d641c3527e;
 Tue, 18 Jul 2023 17:03:10 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU0PR04MB9672.eurprd04.prod.outlook.com (2603:10a6:10:31d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 15:03:09 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 15:03:09 +0000
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
X-Inumbo-ID: 35d671f6-257c-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mJXFRY/gKQFHqIuxQi0agpIFJ4I4EOEGzyhO8kHc8gKd9LoD3eSGZRhewYHdanlucmtks2Su58Rfe92QLeH9445FzlRIjachn7e2fBT6zbihWXZPnfZoWP27uDlXguSka9RBzWXaIJMfHF71zJIKc4MjY1dhQ36xukqPZXiTnF3pZGMR57ERHsqCdnsaSkGWOLLFwjPuJRpcVGX2FIAKgJWvJaxpeb30d7iTfQFOvLEi5XXd4+pXYlzYPNCYXGZe8lKlfWOfQ9Jt7/RQYGXu5ljTnnIMVuVg4Dmk0GpzCcB8nMUrrobxCLfGWHcqXR1x9DYGu5b6XVe7S6sBcv34PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j7XIIjbdxwU5oe6DH9OpvRRjlDoIeHwh7emp9bepywM=;
 b=DG5903gIt8rA6vMubNRnrDSb+AhwWwZ5A59BijA/egvSHpaUSrxUL8xktRJSdKXCSqOxt/I1QuPiAm5BIkK7A3EhgWbcSCVvdkvO4qY9hSbyZ1AMz0wxPGYYopZ8cEnQ0QsKbEebuxg5009o/Yv7Uvkm1wyRIiK+rbo81WOfVwOiiGm+ZYb7cQXvdPjrJYH92Oo+UuIhr6MGsDtf16SasKT86lRsHReBPj514ttsftMEVtgnLqsQXL0YSQsM/bc07ZP0hmzULHsF18tHOPSAMkLFgn5jnV0lmV4mPLwhqbFO9Q8cLhtas2lWMpERIf4STDKzMjFzJGoJNsUoeEMiog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j7XIIjbdxwU5oe6DH9OpvRRjlDoIeHwh7emp9bepywM=;
 b=16534d1JiAMRG5NlRJPn+F7IbMNGAWOD2FjxijXyKjVkTCUKTA4LAx4DCyOZrOaITaeOZHXGNQrF7AQwSXY9V0tbzkG1VMc5/UJwVnnOQuoEvQaP6BFzXATrN5+BxKQO0aDU+HKY1qb4AJTz+n0NkTrHswiJzAaU6A6WuWnomU61uo5kg8uyDU7fWaGHeD5/nGKs62JTeChrQUvq82pRpUqFWcT7AAhT+TGDbKMMa4TQ8tZCzzKILLOc1dKdcfeVDVoH8XBDLH7VccfZznZCKQnrO1kwvGmABXhsNpAhXnUhkoc57G/EwrgJ8Hgo0+pYq9icicOG8jpvIwPSJStmQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ad53c037-3c1b-ff1a-93df-b79ab2948174@suse.com>
Date: Tue, 18 Jul 2023 17:03:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 3/3] xen/riscv: introduce identity mapping
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1689604562.git.oleksii.kurochko@gmail.com>
 <8c69050d7b1f42df5e776ca9494164a4d15f2d52.1689604562.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8c69050d7b1f42df5e776ca9494164a4d15f2d52.1689604562.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0043.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU0PR04MB9672:EE_
X-MS-Office365-Filtering-Correlation-Id: 071fcd4b-50e1-4c4c-60de-08db87a0192c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k/uZ/n7FtTC46KfM6fcE6k+lgDhKPMTz0zF+s0zk2d0y3rTzVWN718GrWBUbLmnK5wCu+41FdSt3booIUSM55x1L55golOl9iWRyv0x5WZh0agKr2rIPMAKi715aREmQcNXNLryjtbtJ363bbPhgtLhFsjgdLCkLT9C22a+paDUUyAEQrF/6wLwfIcuNFA21y+jQYcNcgMkdgmLOSZlCYLgetalje1xwOg61mkybkUV50eqkq7ETHDRyQqVRPnGxMdaVh9WVtRIeeI8pxy/C2YgHa3rZzko9tdYZ8vRXVAImJkco/6D5VsyetWNC+PhDX4dX05BRtjWFJng4mepQi+c6ve66XYlOLM63xUlCv2MpT8HArCUvc9gS/xhThTT7nJ4ngqPv0jTw04nh5qWK5NlMp5XAupWkaiadbR4F810L4Uk5kTNoZPkYyPDhO7ldWaEzSDoptXe++cnWimfhqTOV6or1anXMIA8MFFeeM4Z13vDG8//XE7UEO9TcLyvCCbcMWtyuGe5jvF0/DJsfUrGTwUdbqA2KfwMuSdyhLlrInwDc7WLp8va/uEM5Zg6LgMtqWIk933m+ajVUNKVo4HR70Aj1S1dOsdOWR4roPKbpPTsGanbJz53KM4OjB9cPh+DohQTSjO/rPEYk4wpwvw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(136003)(346002)(39860400002)(366004)(451199021)(6666004)(6486002)(478600001)(36756003)(8936002)(2906002)(8676002)(5660300002)(54906003)(86362001)(6916009)(66556008)(4326008)(38100700002)(66476007)(66946007)(53546011)(41300700001)(2616005)(316002)(6506007)(31696002)(26005)(31686004)(83380400001)(186003)(966005)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzlhUXg0K01NTy81TDdnUitPYWJ4ekxlQnFiNXJkYjJmSGRMZkNwNXFjR3Nk?=
 =?utf-8?B?MUVIZ0JpNVJhN3hSRWNYMERZODZXblo5OXlJY1RCTTc3eUNHcSs3YmxpRm9Y?=
 =?utf-8?B?eEVTM0o4MnNJT3lnYTBkbDk3Z0owWkVPaDBZdVo3T0xkcUIxMFZ2Sll3SnpY?=
 =?utf-8?B?TU1ISk9CazNCSTIzNjhRMzRyN20rUTE4UGlqUDhLNEREazk1TzR0RVlaVkZQ?=
 =?utf-8?B?aS9TUDlOYm5QaWp1ZEFDUjdlUXJGeEFsNi95N3NEcGxpNzZKdk5VajVQY3JJ?=
 =?utf-8?B?VCtnSGZoVFloN05WN1E3a3BveG1Gd0YzUWZGMTlUaGdXeS95ZTRPWFRXREtt?=
 =?utf-8?B?V0VlZE1Gb05vQ0JxdmNieVpVY2FmY3BxRXl2UnZDRmdHb2M1UW1HS3hTUHBK?=
 =?utf-8?B?eEYrcEZva2ZQYUxkcm94Q3MxWEdpcTNkZXdaRlBoNDNLVnZ4SjJvdU9NY1JZ?=
 =?utf-8?B?S1p2dTJyb1pJZXZJZkl1NzA0cWxtQ3dEZnVzOTNaSFMxSVp4amRGMzBLNzlJ?=
 =?utf-8?B?ZTE1SnZDbGNXek9lS3JZMlJEWVEveHJndXlIeWZtUitueStFUjc4YjZBS0Zj?=
 =?utf-8?B?TnI1REpZMUFyNWt4b25kaUZUMlBZdWoyRWEreFh3RWVqcWtZLzh0NmRQVHVE?=
 =?utf-8?B?MUFic1VHQUdPQVk2RUFxNU81OXJmR25iTUU1MTBmc0hLODdMVWJ3REI3UVpS?=
 =?utf-8?B?S01kUVJvaGV5a0NlbmxWdzI5WjN1NlY5bjRkTjd6M1A3RVF3cUxJdVRIR0Ns?=
 =?utf-8?B?aEZkakJiOWVXL085SHJxeVJyVlNXZWtmSmFTTEd1K1YwZFRwSVdpM29XVHI2?=
 =?utf-8?B?TmE2TU1HeVdCVklybm5YZVVFYzV5Rk1iUmMxRk1NSmsyRW1QMUZTTjhUZGt0?=
 =?utf-8?B?YXRNb1JmS002VkwwMUc5MDZKRlhRQmVRL3B1SkpJR0ttWjFDbVorazBSa0V2?=
 =?utf-8?B?akdncytrNlJ3S0x1OVg2MFNJR01LK0c4L0hrMlhwY0ZXZXR1M0wvTjhVZTY3?=
 =?utf-8?B?OTZhSlpJWkVQL3owUVU2UkMvUkpBY0VyeUtYVWgycUNEZERtOEliUHlsQVR2?=
 =?utf-8?B?UXlOY1QxblZwMUNoajFmd05tNXZ4R1FUNUR5eTVxSmliMVJ2aEkrZzlLbVll?=
 =?utf-8?B?cnM3emlCR2IrU1JZRXhHdEJzNUdBQVVCd3FUVTIvQWZhU0pxYXRiMk43T0Iv?=
 =?utf-8?B?OXZyd1VnTlFBbzg3Tm0xNXpyRFEwR2FZb25BNmhtZDJWZ2NpWUpZSktzaW9m?=
 =?utf-8?B?NFl3UzFwRHhNY3hhL0lOcG4wSkI5cy84anZRUE91TVJFdnduc0k5cnhaOTFT?=
 =?utf-8?B?QzNPaW5PK1doZU5wMGF5VGdaZU54V0lyYk02c21BVHY1THZBVkRqallOZnk0?=
 =?utf-8?B?NGdXYjRGajh2Q3ZBRTZKNmVnVlg2VDg5Mm5BWVFyVDd6ajVHTWZCdkUzUGR5?=
 =?utf-8?B?U3ZqNm1uVnlTVm9Wa2s0bVpRL3BqN0h1aEpiZTRleFNaOU5jY2dqMTZ5Vnhm?=
 =?utf-8?B?cHl2S25PNzZHYUJCWXkyZVA4ZUNzYkhCdlZDalZqQjFicmZ6TkFzMmxGMk1h?=
 =?utf-8?B?NnZ5N1NhWkN4R3UxUHJJRWwraHA4RWx3LzRocTNTcnFzMFFEUm16QnRvVUlN?=
 =?utf-8?B?Y0hBNnJNZ1czNXBCbUtMTU9aSENuSUluUGl0RVdzZ1hCcnl4bmh0Zk1BOCtx?=
 =?utf-8?B?blNVWExCdm1odzd1eGFzUHRqeHpkWnB1QmhRbHliaEtSU2hNd3JqaTlxOXAr?=
 =?utf-8?B?empydmRBYytvbXJNdWRRMWVKM01NZUdiSTF3Y2RYRWd0eVNLd01acDg4eEdH?=
 =?utf-8?B?ZWtoK2Qzem1md245d21qeTJIWWpIZ244ZmVKUjd1Mm80MnN1R05LRnhoYjNF?=
 =?utf-8?B?ZG1sZFNjQUk3aDFOTWVpLzNyQUpyLzdQQ2NmNkEySWw5Q21rZnVqOXU4ejJR?=
 =?utf-8?B?MHg3aVBGam8zZE0wSGNHc1pJMzRvYWtWaVFzZU9kNmx4QVhBcjJuVUdnUnM0?=
 =?utf-8?B?bVRWS0tkZ1pvRXc5L0N1SVBqTTdTS1NsVVM4RjRNZjl1REJGZE9tNEhDRit2?=
 =?utf-8?B?ZHhCZTdRRi9PQ0VmM3htU09KREJhM2V2Z2F6R1NoT1JKOVJYMlFGS3JlRWlj?=
 =?utf-8?Q?OZWZEhl7a3RQBItg3Iy8rMSlq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 071fcd4b-50e1-4c4c-60de-08db87a0192c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 15:03:09.0773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9mLTG2531Jc0+yddDWjdXpza4zYZ79LDWR56iJr1aIEu5u8fLd1V0mJxYcfGqX2S0Mf1qz/ZjxP+mlMOP4yLXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9672

On 17.07.2023 16:40, Oleksii Kurochko wrote:
> The way how switch to virtual address was implemented in the
> commit e66003e7be ("xen/riscv: introduce setup_initial_pages")
> isn't safe enough as:
> * enable_mmu() depends on hooking all exceptions
>   and pagefault.
> * Any exception other than pagefault, or not taking a pagefault
>   causes it to malfunction, which means you will fail to boot
>   depending on where Xen was loaded into memory.
> 
> Instead of the proposed way of switching to virtual addresses was
> decided to use identity mapping of the entrire Xen and after
> switching to virtual addresses identity mapping is removed from
> page-tables.
> Since it is not easy to keep track where the identity map was mapped,
> so we will look for the top-most entry exclusive to the identity
> map and remove it.

Doesn't this paragraph need adjustment now?

> --- a/xen/arch/riscv/mm.c
> +++ b/xen/arch/riscv/mm.c
> @@ -25,6 +25,12 @@ unsigned long __ro_after_init phys_offset;
>  #define LOAD_TO_LINK(addr) ((unsigned long)(addr) - phys_offset)
>  #define LINK_TO_LOAD(addr) ((unsigned long)(addr) + phys_offset)
>  
> +/*
> + * Should be removed as soon as enough headers will be merged for inclusion of
> + * <xen/lib.h>.
> + */
> +#define ARRAY_SIZE(arr)		(sizeof(arr) / sizeof((arr)[0]))

Like said to Shawn for PPC in [1], there's now a pretty easy way to
get this macro available for use here without needing to include
xen/lib.h.

[1] https://lists.xen.org/archives/html/xen-devel/2023-07/msg01081.html

> @@ -35,8 +41,10 @@ unsigned long __ro_after_init phys_offset;
>   *
>   * It might be needed one more page table in case when Xen load address
>   * isn't 2 MB aligned.
> + *
> + * CONFIG_PAGING_LEVELS page tables are needed for identity mapping.
>   */
> -#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) + 1)
> +#define PGTBL_INITIAL_COUNT (CONFIG_PAGING_LEVELS * 2 + 1)

Where did the "- 1" go?

> @@ -255,25 +266,40 @@ void __init noreturn noinline enable_mmu()
>      csr_write(CSR_SATP,
>                PFN_DOWN((unsigned long)stage1_pgtbl_root) |
>                RV_STAGE1_MODE << SATP_MODE_SHIFT);
> +}
>  
> -    asm volatile ( ".p2align 2" );
> - mmu_is_enabled:
> -    /*
> -     * Stack should be re-inited as:
> -     * 1. Right now an address of the stack is relative to load time
> -     *    addresses what will cause an issue in case of load start address
> -     *    isn't equal to linker start address.
> -     * 2. Addresses in stack are all load time relative which can be an
> -     *    issue in case when load start address isn't equal to linker
> -     *    start address.
> -     *
> -     * We can't return to the caller because the stack was reseted
> -     * and it may have stash some variable on the stack.
> -     * Jump to a brand new function as the stack was reseted
> -     */
> +void __init remove_identity_mapping(void)
> +{
> +    unsigned int i;
> +    pte_t *pgtbl;
> +    unsigned int index, xen_index;
> +    unsigned long load_start = LINK_TO_LOAD(_start);
> +
> +    for ( pgtbl = stage1_pgtbl_root, i = CONFIG_PAGING_LEVELS; i; i-- )
> +    {
> +        index = pt_index(i - 1, load_start);
> +        xen_index = pt_index(i - 1, XEN_VIRT_START);
> +
> +        if ( index != xen_index )
> +        {
> +            /* remove after it will be possible to include <xen/lib.h> */
> +            #define ROUNDUP(x, a) (((x) + (a) - 1) & ~((a) - 1))

ROUNDUP() is even part of the patch that I've submitted already.

> +            unsigned long load_end = LINK_TO_LOAD(_end);
> +            unsigned long pt_level_size = XEN_PT_LEVEL_SIZE(i - 1);
> +            unsigned long xen_size = ROUNDUP(load_end - load_start, pt_level_size);
> +            unsigned long page_entries_num = xen_size / pt_level_size;
> +
> +            while ( page_entries_num-- )
> +                pgtbl[index++].pte = 0;
> +
> +            break;

Unless there's a "not crossing a 2Mb boundary" guarantee somewhere
that I've missed, this "break" is still too early afaict.

Jan

