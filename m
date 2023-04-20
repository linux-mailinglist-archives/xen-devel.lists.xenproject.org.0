Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D24B46E974C
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 16:36:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524302.815141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppVOh-0006P7-Ln; Thu, 20 Apr 2023 14:36:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524302.815141; Thu, 20 Apr 2023 14:36:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppVOh-0006Mq-Ir; Thu, 20 Apr 2023 14:36:31 +0000
Received: by outflank-mailman (input) for mailman id 524302;
 Thu, 20 Apr 2023 14:36:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fY2H=AL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ppVOf-0006Mk-HN
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 14:36:29 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20625.outbound.protection.outlook.com
 [2a01:111:f400:fe12::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbc314a0-df88-11ed-b21f-6b7b168915f2;
 Thu, 20 Apr 2023 16:36:28 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9678.eurprd04.prod.outlook.com (2603:10a6:102:23c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 14:36:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 14:36:26 +0000
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
X-Inumbo-ID: bbc314a0-df88-11ed-b21f-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UF4FEj40QIceYJ1OYQzVsOKEOLmVZuFkThKk46nTZYBNFEpnWx/alJWs2fa6Gwll4oz0Tp3G6SiNmrkfeTclJF2UzvDHLbMVFAgsAreQoQiSlGImXbE17pUUCG6067rVbjQpd3yk/FsQlA5/yZZ4qbDS4YgktKK5URmaoGOxKf/RxW/5qkA7cGjASlqCxEskFqOKTwBZhdcHlfwiyICg15Hnuj14ZPngF/3qWUEBxv46i6utfDKJYU2TvkGQPLS21ZaoOCXZcbAiNbPKSh7mIsXjcfmN2jnimFWh89ZfNDRC9f6w26agjKuZbn9V/ODa3SpSh61YLYqeOrNXLTmSug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8GYrhpBVt5Xann+A51gcmJLcBXuzZJmCGtZW7sESBss=;
 b=kkcItEmcheUYIF8kbxS2b5H3p9WN5aDLztR1teLSoljH5TmVgqzYCVnrMrQWAtn9Pxkettk9mRhAZez7QDKs/G90bec6maaBLTsm9bymEOPh3/VFqnXpvgSEOEosvd9Qim+1WjGsiFq2VoPclrjJx+98ZdLfhWaHclneT36K73X17pODJZJ4C55yotFcVoSrPF0JhRe5tWi8yg9rln2iMp72ywFCMREQxs3wRRvoqFhdShDUwOgKayhGCklentYLowF0xJpzOKTu9+86svU8bWuzr6GcrPF2I24+tsqqwFcEi+OtHizyfyWQpeEE2o1bOKAabKf7Re/WzQci0hjgxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8GYrhpBVt5Xann+A51gcmJLcBXuzZJmCGtZW7sESBss=;
 b=Hz4P22aW1+d0thdIE8AUkjAVTltsnBaHypvrN0YcCNljd8BIxJ3qEQm2imKoox94jin/K8ZswayJfZEXtWv76NrmWkZ87MqiN+w4Zp0Td3AJhj7fKyzfngiGbJu/HB2+JRZ7l3pt+21favrcGvLoWStg/MVINfKdi+OKrEsgDetpuRcDaVHFNNK9a67x5lkBkRrzPgCy1HM2zV7E/UU+jLrPqGeoPdryImrcog8IEB+jepseIeW2R0ATt20EW4LDzR2jDytqDgqELA4NbZKJtRN+FQJAjt/ADckwnqTw3aSi4ZfwjsVVDwNyvy5XEuACADPmRhsXCD/K4cuIhk4LPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <67d8574f-2e0d-4eb6-19aa-67fe7645e35a@suse.com>
Date: Thu, 20 Apr 2023 16:36:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5 2/4] xen/riscv: introduce setup_initial_pages
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1681918194.git.oleksii.kurochko@gmail.com>
 <5b27693bcdf6d64381314aeef72cfe03dee8d73a.1681918194.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5b27693bcdf6d64381314aeef72cfe03dee8d73a.1681918194.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9678:EE_
X-MS-Office365-Filtering-Correlation-Id: 37104aaa-e517-405e-77ed-08db41ac9ea6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DI/UFgrYcx0zLReDFFj64mRW24zErCOedlJjUdTHiv1eHCVFTk4l+w6DkfeCKUi7ZyhrBUCW917G5A1hCpSZFluiT2l2GScFNaKy7TjqOQFwle4BEIeYWeuR0RyG9YvtyldcqJM9K/frzUwWP5g40SXXQ1Yj37p5GSrl/hYLvi/ljql+6r60D8CwjM0fWYNGujX8Banb7HcjjEYx6wd+YvpWgU/x/tXOAMxKjC1wp9L2J9G50xE5A3aJkMwY5ahQWCt7ykiZhsHvU8jR1t9Pwky6R579U/XHCBMzw9MabncQThYkb6gKqb+C8OLIPbpOIXHIcb82e8kBBHm13SCx5CNRmVdYYWqGMAaT5iVkAW24P4DNAPIpiXk0SZefzOxpKYwd6pknM8SPn/rwwGhF2HXA8vIvEz/IZGYOKr97uQN3dlUBGxTB0pqv/bb774QeQPur7cXhD9GASXBy/kmrtT8wgIJM/GTwy0iJFWRHWJvAjabIN2pEOfeNqm7LE3/NckJiKgOXKdJtJ1M9tK/wqtpcbc79ZNvGq48xPQAKR+UpGYQRgKpNKY8PRS14AuxAnABtXC4X6gno6/sN5Ptbj7klkmcslykYa1Cgn+NfXv+81cefe3bnLnGKOvOBbKFIRL/IexJ+UfPmlvvSBdV2gg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(376002)(366004)(346002)(396003)(451199021)(6666004)(6486002)(86362001)(83380400001)(36756003)(53546011)(2616005)(38100700002)(31696002)(8936002)(8676002)(26005)(186003)(6512007)(31686004)(6506007)(41300700001)(6916009)(4326008)(316002)(66476007)(66556008)(30864003)(2906002)(66946007)(54906003)(5660300002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3lYWWtDbGloclE0WVYxMXEzcmQyQmZtb0cxQUFaTm9IQWt6QmZoWlN0YzNG?=
 =?utf-8?B?NXZ1VUl4NW5PSmJjekNhMG42SmhZSDV4ZlF0SkhqZzZ4Z2ZiZzh6a3JnV2hr?=
 =?utf-8?B?VkR5L0ZCTmQwVkFpcnRwTytWRVBCV0dHUjZUKy85Q3hocU1wbmFLZjZIQ09I?=
 =?utf-8?B?SGdKcnpnK1lmZXRzekdTRnVrVnNCTzdMVG9qZjNJTXNaN21qNkVobGdEdzdk?=
 =?utf-8?B?bjJyNXhReUplejNINUpzMm5nVzhlUDBzazVyRHplWU9NOUZESTdKNkFWd0lM?=
 =?utf-8?B?aTdIWlNEK3RHK21PWFNMQjFUYUtpZ1F1dGt0K3AxaXlUd1VoQUh1bVorbHB4?=
 =?utf-8?B?cEZCdXZyaVNaYWc2dHRZeWh6dTM0N2JsMVFyMnNuWFlCbFIxeHZHZU9tdGNG?=
 =?utf-8?B?U0xtdFFJSVFHZE9LbHJkbnZRWWd0RHAvTVNiZ1l1VXgzazM3NlB5QXF6cnI5?=
 =?utf-8?B?RzF3SGRabUFSdTg1ZG9aRGZyVUhtT2dhNVVMd2ZMejFLZklmQXRNamUwTlkw?=
 =?utf-8?B?TzNhVWtkMndPOS9jRVRBcEZGSGt3VU4xRS9rK1Iwb1ZxTkFxUHR6WDhrOXhW?=
 =?utf-8?B?TzZ4Z0VzUldyc1lCZzRLVWNsS3Q2KzRLZkIzVWZKL0dMZ3dpU2NIbGhCL1BH?=
 =?utf-8?B?UzVkV1RPaVQ0KzlBMDFnWW9SRHU3TG9ZUk8xdFBOc090RnVJQnNmSCt1WUdR?=
 =?utf-8?B?RXo5TUpGbUREUWY3OWpXRkJHandSS0hUVUVtNDFzUjBjMWZEUkZjSDZNL2Zw?=
 =?utf-8?B?b2dCazFkT1BiQmtpNlUvQ1NCYk5xdkQraUVzUzZrdmJuTDJlMUp3Z1U4UkdW?=
 =?utf-8?B?TFJPdUpHby9sRXF1MGMwOTdxMzIrQmRBcEhWc0ZMRHhFOWVuNzdMU09VYlVG?=
 =?utf-8?B?QVc1V1VweFZCeUpodTNack1IYUg2TCt6SUZzK2JLT1JURXZEdUk2VytWV2lp?=
 =?utf-8?B?RHJjeE4yeU81SnN5WFFHWjJ3YW1lOVpXWnNoMis2ZXNnUVgzNWc5R2hHeUUy?=
 =?utf-8?B?NVFXMnU3V3FWd25rOWtlZW9jRVpPZUw5SFFORytvMzI2QkVEY3d3aEhPbUU5?=
 =?utf-8?B?SHNhSGpNM0VyeXFER3BDYTM3STNENERReGtzdWE1alFZNUlGT3dieGJoQVpL?=
 =?utf-8?B?OEl1UWJEK1A5c0RpS2pyY3lSWjcxSTBTd2VLR0ZUQ1lIOU5kTGFEWDlmbGM4?=
 =?utf-8?B?Uml1SUowcWdKSzQ1Y0VaMkFBaElFdjZVeDNIU2F0THp6MWE5clMxU3VHTzhR?=
 =?utf-8?B?RENWV0xkN0RlQXZteWsrT3crYU0yMlF5MjJFTkZMd29YZ0NRWmlzdDBhS0tv?=
 =?utf-8?B?akRjWG53SFhrYzljejJUWGZRYWx0cnd4UForOEhnMzJlWi9NUnlxQnc3TG9n?=
 =?utf-8?B?UVBGMjNjSmg0YnYrbExkOHZHODlHVjVZTGJKNG9OWFhxaWlzaFZCVndSNVZj?=
 =?utf-8?B?eHZzVG1QY1o0bmNLMXg1RDRnMjE3b2xCTVJJLzJQSDkxbVVGSit3cy9pRUNM?=
 =?utf-8?B?cjBVS1Bqand1aENEbDhoQytPd1ZXeFRQakwzMWExVytIeDRsc2huZEhLcjBQ?=
 =?utf-8?B?dkRMMWV6dWtxWjEydWM5YlpJQ2w4TFQrTnRTdTlsdVhTdFhXYm5ZVWM2TTZQ?=
 =?utf-8?B?QmI3ZEZQbWpEK1REVnVIM0QreWVDMFlPZjArOGlzRHJIZVZWY2tlVUw4TWhO?=
 =?utf-8?B?dWJJdUdyWGExaS9ZcDloTU9CVDBRY2xsQ2xPV29ZcEhtcFVnK3YzTVJkTHg4?=
 =?utf-8?B?K093VUJKWE9hb0ptMXZsVEVqT0VVRVY3WEI0c0hEdHhGZWIycjBkZm50bmRw?=
 =?utf-8?B?L3FPYWdQUWRHWlNud2xZU1d0NmRRaDI1VElHeWkrTUk4dkhEaFpyakpseUlm?=
 =?utf-8?B?dXJod0QyOG1Tc0lqaFlKYU9oVmkyQ1lMZE1oaHBwR0hEb1lrZHI4dWlpTlpM?=
 =?utf-8?B?MkRtNk5oa3M2ZnhPSm5CdWh2cDY5eGVNREUyQk9JdXRQaW1OWVJLRnd5YklH?=
 =?utf-8?B?L1NML0gwOVhSS2RwamY2NGRqQzdCMHJpUzRLWjRGUWY3VzFOZlNYTlNKV1ZJ?=
 =?utf-8?B?NnVNUHF3UncvMW5yK2FrcTRWRWJhKzIzY3hxUkQrajJ2eExIUlBVa2Z2VzhG?=
 =?utf-8?Q?onT0il2HVi+9rJs3Rt5lo8zfz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37104aaa-e517-405e-77ed-08db41ac9ea6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 14:36:25.7715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bzMlj0nRKa6T6b9MzCbXA2jPqSTTGVWdTI3DdfnFE4xPGQUYQlmx4u2plrdzwNQyVCuSflubj74ZeZLNB3cgzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9678

On 19.04.2023 17:42, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/page-bits.h
> +++ b/xen/arch/riscv/include/asm/page-bits.h
> @@ -1,6 +1,16 @@
>  #ifndef __RISCV_PAGE_BITS_H__
>  #define __RISCV_PAGE_BITS_H__
>  
> +#ifdef CONFIG_RISCV_64
> +#define PAGETABLE_ORDER         (9)
> +#else /* CONFIG_RISCV_32 */
> +#define PAGETABLE_ORDER         (10)
> +#endif
> +
> +#define PAGETABLE_ENTRIES       (1 << PAGETABLE_ORDER)
> +
> +#define PTE_PPN_SHIFT           10
> +
>  #define PAGE_SHIFT              12 /* 4 KiB Pages */
>  #define PADDR_BITS              56 /* 44-bit PPN */

Personally I think these two would better remain at the top. But maybe
that's just me ...

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/page.h
> @@ -0,0 +1,63 @@
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
> +
> +/* Page Table entry */
> +typedef struct {
> +#ifdef CONFIG_RISCV_64
> +    uint64_t pte;
> +#else
> +    uint32_t pte;
> +#endif
> +} pte_t;
> +
> +#define pte_to_addr(x) (((x) >> PTE_PPN_SHIFT) << PAGE_SHIFT)

This will be at risk of overflow for RV32 without a cast to paddr_t (which
I expect would be a 64-bit type on RV32 just like it is on RV64).

> +#define addr_to_pte(x) (((x) >> PAGE_SHIFT) << PTE_PPN_SHIFT)
> +
> +static inline pte_t paddr_to_pte(const paddr_t paddr,
> +                                 const unsigned long permissions)
> +{
> +    unsigned long tmp = addr_to_pte(paddr);
> +    return (pte_t) { .pte = tmp | permissions };
> +}
> +
> +static inline paddr_t pte_to_paddr(const pte_t pte)
> +{
> +    return pte_to_addr(pte.pte);
> +}
> +
> +static inline bool pte_is_valid(const pte_t p)
> +{
> +    return p.pte & PTE_VALID;
> +}

A remark on all of the "const" here: It's fine if you want to keep them,
but generally we care about const-correctness only for pointed-to types.
Scalar and compound parameter values are owned by called function anyway,
so all the "const" achieves is that the function can't alter its own
argument(s).

> --- /dev/null
> +++ b/xen/arch/riscv/mm.c
> @@ -0,0 +1,319 @@
> +#include <xen/compiler.h>
> +#include <xen/init.h>
> +#include <xen/kernel.h>
> +
> +#include <asm/early_printk.h>
> +#include <asm/config.h>
> +#include <asm/csr.h>
> +#include <asm/mm.h>
> +#include <asm/page.h>
> +#include <asm/processor.h>
> +
> +struct mmu_desc {
> +    unsigned long num_levels;

Isn't "unsigned int" sufficient here?

> +/*
> + * It is expected that Xen won't be more then 2 MB.
> + * The check in xen.lds.S guarantees that.
> + * At least 4 page (in case when Sv48 or Sv57 are used )
> + * tables are needed to cover 2 MB. One for each page level
> + * table with PAGE_SIZE = 4 Kb
> + *
> + * One L0 page table can cover 2 MB
> + * (512 entries of one page table * PAGE_SIZE).
> + *
> + * It might be needed one more page table in case when
> + * Xen load address isn't 2 MB aligned.
> + *
> + */
> +#define PGTBL_INITIAL_COUNT     (5)

On x86 we have a CONFIG_PAGING_LEVELS constant. If you had something
like this as well, this 5 would better match the comment as
((CONFIG_PAGING_LEVELS - 1) + 1), avoiding to make space for the two
levels you won't need as long as only Sv39 is really meant to be used.

> +#define PGTBL_ENTRY_AMOUNT  (PAGE_SIZE / sizeof(pte_t))
> +
> +pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
> +stage1_pgtbl_root[PGTBL_ENTRY_AMOUNT];
> +
> +pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
> +stage1_pgtbl_nonroot[PGTBL_INITIAL_COUNT * PGTBL_ENTRY_AMOUNT];
> 
> +#define HANDLE_PGTBL(curr_lvl_num)                                          \
> +    index = pt_index(curr_lvl_num, page_addr);                              \
> +    if ( pte_is_valid(pgtbl[index]) )                                       \
> +    {                                                                       \
> +        /* Find L{ 0-3 } table */                                           \
> +        pgtbl = (pte_t *)pte_to_paddr(pgtbl[index]);                        \
> +    }                                                                       \
> +    else                                                                    \
> +    {                                                                       \
> +        /* Allocate new L{0-3} page table */                                \
> +        if ( mmu_desc->pgtbl_count == PGTBL_INITIAL_COUNT )                 \
> +        {                                                                   \
> +            early_printk("(XEN) No initial table available\n");             \
> +            /* panic(), BUG() or ASSERT() aren't ready now. */              \
> +            die();                                                          \
> +        }                                                                   \
> +        mmu_desc->pgtbl_count++;                                            \
> +        pgtbl[index] = paddr_to_pte((unsigned long)mmu_desc->next_pgtbl,    \
> +                                    PTE_VALID);                             \
> +        pgtbl = mmu_desc->next_pgtbl;                                       \
> +        mmu_desc->next_pgtbl += PGTBL_ENTRY_AMOUNT;                         \
> +    }
> +
> +static void __init setup_initial_mapping(struct mmu_desc *mmu_desc,
> +                                         unsigned long map_start,
> +                                         unsigned long map_end,
> +                                         unsigned long pa_start,
> +                                         unsigned long permissions)

Wouldn't the last one more sensibly be "unsigned int"?

> +{
> +    unsigned int index;
> +    pte_t *pgtbl;
> +    unsigned long page_addr;
> +    pte_t pte_to_be_written;
> +    unsigned long paddr;
> +    unsigned long tmp_permissions;
> +
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
> +    page_addr = map_start;
> +    while ( page_addr < map_end )
> +    {
> +        pgtbl = mmu_desc->pgtbl_base;
> +
> +        switch (mmu_desc->num_levels)

Nit: Style (missing blanks).

> +        {
> +            case 4: /* Level 3 */

Nit: Indentation of case labels matches that of the opening brace in our
style.

> +                HANDLE_PGTBL(3);
> +            case 3: /* Level 2 */
> +                HANDLE_PGTBL(2);
> +            case 2: /* Level 1 */
> +                HANDLE_PGTBL(1);
> +            case 1: /* Level 0 */
> +                index = pt_index(0, page_addr);
> +                paddr = (page_addr - map_start) + pa_start;
> +
> +                tmp_permissions = permissions;
> +
> +                if ( is_kernel_text(LINK_TO_LOAD(page_addr)) ||
> +                     is_kernel_inittext(LINK_TO_LOAD(page_addr)) )
> +                    tmp_permissions =
> +                        PTE_EXECUTABLE | PTE_READABLE | PTE_VALID;
> +
> +                if ( is_kernel_rodata(LINK_TO_LOAD(page_addr)) )
> +                    tmp_permissions = PTE_READABLE | PTE_VALID;
> +
> +                pte_to_be_written = paddr_to_pte(paddr, tmp_permissions);
> +
> +                if ( !pte_is_valid(pgtbl[index]) )
> +                    pgtbl[index] = pte_to_be_written;
> +                else
> +                {
> +                    /*
> +                    * get an adresses of current pte and that one to
> +                    * be written without permission flags
> +                    */
> +                    unsigned long curr_pte =
> +                        pgtbl[index].pte & ~((1 << PTE_PPN_SHIFT) - 1);
> +
> +                    pte_to_be_written.pte &= ~((1 << PTE_PPN_SHIFT) - 1);

If you mean to only compare addresses, why don't you use pte_to_paddr()?
Question though is whether it's correct to ignore permission differenes.
I'd expect you only want to mask off PTE_ACCESSED and PTE_DIRTY.

> +                    if ( curr_pte != pte_to_be_written.pte )
> +                    {
> +                        early_printk("PTE that is intended to write isn't the"
> +                                    "same that the once are overwriting\n");

Nit: One-off indentation. As to the message text - I take it that's
temporary only anyway, and hence there's little point thinking about
improving it?

> +                        /* panic(), <asm/bug.h> aren't ready now. */
> +                        die();
> +                    }
> +                }
> +        }
> +
> +        /* Point to next page */
> +        page_addr += XEN_PT_LEVEL_SIZE(0);

Seeing this as well as the loop heading - maybe more suitable as a
for(;;) loop?

> +    }
> +}

Since HANDLE_PGTBL() is strictly for use above only, I think you'd better
#undef it here.

> +static void __init calc_pgtbl_lvls_num(struct  mmu_desc *mmu_desc)
> +{
> +    unsigned long satp_mode = RV_STAGE1_MODE;
> +
> +    /* Number of page table levels */
> +    switch (satp_mode)
> +    {
> +        case SATP_MODE_SV32:
> +            mmu_desc->num_levels = 2;
> +            break;
> +        case SATP_MODE_SV39:
> +            mmu_desc->num_levels = 3;
> +            break;
> +        case SATP_MODE_SV48:
> +            mmu_desc->num_levels = 4;
> +            break;
> +        default:
> +            early_printk("(XEN) Unsupported SATP_MODE\n");
> +            die();
> +    }
> +}
> +
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
> +    asm volatile("sfence.vma");

Nit (here and several times again below): Style (missing three blanks, as
"asm" is a keyword).

> +    csr_write(CSR_SATP,
> +              ((unsigned long)stage1_pgtbl_root >> PAGE_SHIFT) |
> +              satp_mode << SATP_MODE_SHIFT);
> +
> +    if ( (csr_read(CSR_SATP) >> SATP_MODE_SHIFT) == satp_mode )
> +        is_mode_supported = true;
> +
> +    /* Clean MMU root page table and disable MMU */
> +    stage1_pgtbl_root[index] = paddr_to_pte(0x0, 0x0);
> +
> +    csr_write(CSR_SATP, 0);
> +    asm volatile("sfence.vma");

I guess what you do in this function could do with some more comments.
Looks like you're briefly enabling the MMU to check that what you wrote
to SATP you can also read back. (Isn't there a register reporting
whether the feature is available?)

If so, I think you cannot clear the stage1_pgtbl_root[] slot before
you've disabled the MMU again.

(As a minor aspect, I'd like to encourage you to write plain zero just
as 0, not as 0x0, unless used in contexts where other hex numbers nearby
make this desirable.)

> +    return is_mode_supported;
> +}
> +
> +/*
> + * setup_initial_pagetables:
> + *
> + * Build the page tables for Xen that map the following:
> + *  1. Calculate page table's level numbers.
> + *  2. Init mmu description structure.
> + *  3. Check that linker addresses range doesn't overlap
> + *     with load addresses range
> + *  4. Map all linker addresses and load addresses ( it shouldn't
> + *     be 1:1 mapped and will be 1:1 mapped only in case if
> + *     linker address is equal to load address ) with
> + *     RW permissions by default.
> + *  5. Setup proper PTE permissions for each section.
> + */
> +void __init setup_initial_pagetables(void)
> +{
> +    struct mmu_desc mmu_desc = { 0, 0, NULL, 0 };

Just {} ought to do as initializer, but if you want to spell things out,
then please use 0 / NULL consistently for integral / pointer type fields.

> +    /*
> +     * Access to _{stard, end } is always PC-relative

I guess you mean _start. For just a leading underscore I also don't think
using this braced form is useful.

> +     * thereby when access them we will get load adresses
> +     * of start and end of Xen
> +     * To get linker addresses LOAD_TO_LINK() is required
> +     * to use
> +     */
> +    unsigned long load_start    = (unsigned long)_start;
> +    unsigned long load_end      = (unsigned long)_end;
> +    unsigned long linker_start  = LOAD_TO_LINK(load_start);
> +    unsigned long linker_end    = LOAD_TO_LINK(load_end);
> +
> +    if ( (linker_start != load_start) &&
> +         (linker_start <= load_end) && (load_start <= linker_end) ) {

Nit: Style (brace placement).

> +        early_printk("(XEN) linker and load address ranges overlap\n");
> +        die();
> +    }
> +
> +    calc_pgtbl_lvls_num(&mmu_desc);
> +
> +    if ( !check_pgtbl_mode_support(&mmu_desc, load_start, RV_STAGE1_MODE) )
> +    {
> +        early_printk("requested MMU mode isn't supported by CPU\n"
> +                     "Please choose different in <asm/config.h>\n");
> +        die();
> +    }
> +
> +    mmu_desc.pgtbl_base = stage1_pgtbl_root;
> +    mmu_desc.next_pgtbl = stage1_pgtbl_nonroot;
> +
> +    setup_initial_mapping(&mmu_desc,
> +                          linker_start,
> +                          linker_end,
> +                          load_start,
> +                          PTE_LEAF_DEFAULT);
> +}
> +
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
> +    asm volatile("sfence.vma");
> +
> +    /* Enable the MMU and load the new pagetable for Xen */
> +    csr_write(CSR_SATP,
> +              ((unsigned long)stage1_pgtbl_root >> PAGE_SHIFT) |

Please try to avoid open-coding of existing constructs: Here you mean
either PFN_DOWN() or paddr_to_pfn() (you see, we have even two). (As I
notice I did overlook at least similar earlier instance.)

> +              RV_STAGE1_MODE << SATP_MODE_SHIFT);
> +
> +    asm volatile(".align 2");
> +      mmu_is_enabled:

How in the world is one to spot this label? Yes, it shouldn't be entirely
unindented. But it also should be indented less than the surrounding code
(with the exception of switch() statement case labels, where a non-case
label might be intended the same as a case ones). Our rule of thumb is to
indent such labels by a single space.

> +    /*
> +     * Stack should be re-inited as:
> +     * 1. Right now an address of the stack is relative to load time
> +     *    addresses what will cause an issue in case of load start address
> +     *    isn't equal to linker start address.
> +     * 2. Addresses in stack are all load time relative which can be an
> +     *    issue in case when load start address isn't equal to linker
> +     *    start address.
> +     */
> +    asm volatile ("mv sp, %0" : : "r"((unsigned long)cpu0_boot_stack + STACK_SIZE));

Nit: Style (overly long line).

What's worse - I don't think it is permitted to alter sp in the middle of
a function. The compiler may maintain local variables on the stack which
don't correspond to any programmer specified ones, including pointer ones
which point into the stack frame. This is specifically why both x86 and
Arm have switch_stack_and_jump() macros.

> +    /*
> +     * We can't return to the caller because the stack was reseted
> +     * and it may have stash some variable on the stack.
> +     * Jump to a brand new function as the stack was reseted
> +    */

Nit: Style (indentation).

> +    cont_after_mmu_is_enabled();
> +}
> +
> diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
> index 8887f0cbd4..b3309d902c 100644
> --- a/xen/arch/riscv/riscv64/head.S
> +++ b/xen/arch/riscv/riscv64/head.S
> @@ -1,4 +1,5 @@
>  #include <asm/asm.h>
> +#include <asm/asm-offsets.h>
>  #include <asm/riscv_encoding.h>
>  
>          .section .text.header, "ax", %progbits
> @@ -32,3 +33,4 @@ ENTRY(start)
>          add     sp, sp, t0
>  
>          tail    start_xen
> +

???

> --- a/xen/arch/riscv/xen.lds.S
> +++ b/xen/arch/riscv/xen.lds.S
> @@ -136,6 +136,7 @@ SECTIONS
>      . = ALIGN(POINTER_ALIGN);
>      __init_end = .;
>  
> +    . = ALIGN(PAGE_SIZE);
>      .bss : {                     /* BSS */
>          __bss_start = .;
>          *(.bss.stack_aligned)

Why do you need this? You properly use __aligned(PAGE_SIZE) for the
page tables you define, and PAGE_SIZE wouldn't be enough here anyway
if STACK_SIZE > PAGE_SIZE (as .bss.stack_aligned comes first). The
only time you'd need such an ALIGN() is if the following label
(__bss_start in this case) needed to be aligned at a certain
boundary. (I'm a little puzzled though that __bss_start isn't
[immediately] preceded by ". = ALIGN(POINTER_ALIGN);" - didn't .bss
clearing rely on such alignment?)

Jan

