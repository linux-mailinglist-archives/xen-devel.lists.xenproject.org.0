Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F6C77399D
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 12:28:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579573.907605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTJwI-0004dU-3Q; Tue, 08 Aug 2023 10:27:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579573.907605; Tue, 08 Aug 2023 10:27:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTJwI-0004aJ-0a; Tue, 08 Aug 2023 10:27:46 +0000
Received: by outflank-mailman (input) for mailman id 579573;
 Tue, 08 Aug 2023 10:27:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GY6=DZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTJwG-0004aD-SD
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 10:27:44 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0600.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34863260-35d6-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 12:27:43 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8263.eurprd04.prod.outlook.com (2603:10a6:20b:3f9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 10:27:39 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Tue, 8 Aug 2023
 10:27:39 +0000
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
X-Inumbo-ID: 34863260-35d6-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j1MPDeyYi4+5zCex9lGXDobjwUvlloBn/fKQ+Gi1ZwLZjU4KTEK0QiES2VaWEKL3qbkTvkEnm/Y9PDI9sdKkyeJGNzwjWAgMncyyTMDjd9keCqHNrlIB3pR8iKEpiYdnipsaJNVKN/TB2dNWj29YUx2b/EPPAAw6MAWq8FaVtRlW6NWVzTsMUrTBo80zd6mZ94KBRLu+qElQRNIe6PrDhALelLgSVFdhmYseLhdBmjVH6z7vmkGXR/HmnoS3gsyRJNKjUuC2tIP9bFbAFl3ZdlYREYq6XTmGLPH1niRCnKLrGj+fUYmlhmA2Y+MeNjtrs5Faqw/E4oOJubd5pYIHVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p0017iN4hQj/VyiDseYwsrRDB1EjpFC20roEf6xPZg0=;
 b=gT8NZ8hvx01WqdW3iGe37kaOpIPOsdkRDh9/0x/QrEo2Kd7VWLnNcmeZD3d0osZeh8jUdvqBtAhGKEfsqEhoCXWZTGa18SfYdSgK9Tlvoq3nJGyFKT1vktFsHuzqjdXO0mcJCQgkAToTkSk7eyS8f9ZDehh0RYhSabsZayrZPp3tpldTym37xaBzEUO0oJb3fsc336gCSyF7hLE/xRrQK5SQqDisldJTDL8ntItgYwnLEcNiDWfoeUmmPUqN8qQM5/bkrlrtKC0wb9CgkntoR8g7Vv0siB52HQ33v8+lixoZTcGfuvrUsLOPlmEuXol70o1KXt1krmT4PkknSp9rHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p0017iN4hQj/VyiDseYwsrRDB1EjpFC20roEf6xPZg0=;
 b=AihQ3wl64AGg3KAPpB0Mp7XdUla6QuDb2VfEncfy+hYUUvFqae94H4RvYsHw+gh3NmUMQ40J0D3mvRSDDPjYxn2IoE9sKJ0BItNLTEuY5DeR2zyAt83Xm9ZmFn/6nlX4/QlNa/2RxP/Va+FMgR4XjcpwDRAGw3D7Rk3FYFTSm64H9F2qfoRZd5rbCkr+GzGDRmw2aVE8k1CL/gMoJeVfgs34h3UAcpG3kzLGKll7kgS31SxkdECzGRemOdNlYOssmbhzI6YdPAKBQ4a9IvV7Jix2Hp24txxd3ku7QnoXwu1j3Q5kFKNwjSFCjJUtYkIJV+W6db1gmf84sQRP0tGgKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1866073f-9611-f5bb-9b5b-05ad463650e6@suse.com>
Date: Tue, 8 Aug 2023 12:27:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 8/9] xen/ppc: Add stub function and symbol definitions
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1691016993.git.sanastasio@raptorengineering.com>
 <2702cfa486aa92e82fccd6393519073f10f4c40c.1691016993.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2702cfa486aa92e82fccd6393519073f10f4c40c.1691016993.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0192.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8263:EE_
X-MS-Office365-Filtering-Correlation-Id: 42b18577-063a-43b8-9033-08db97fa1761
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nvwHSsvINKNWxMgo1YMbtUVay7vBslXAKvusBVimJsbbCpH/D5UbqyWAJHlzZvwlpqlMnA+k+lvc/xbr9+8I0ktOY4rVyhX4sQG8oVdRjcLxkF2i3BPAoKPqhH4DHNWwIPgxxPSMfV9VDnsm9KDlsxvUyHFcvBC5PSlh6ISw91A1gU+7H55UIH27QIysTJR65RQym212gowCGIbZ1Pg3V86rTTZ1Ium0dKQLUCmZS6gbYhu04sPqAzGMvv+f/0M+eMnbhA7Gq6aRdiPCixfInd/7E0QhdRCcwdVCYMQD50jfbtYBf/AewTmb91uOvgErb0Spl54emUFhq70YiymgrgGKboMB7pQ5yEQ5FdLkzgegIeOV8GzCZcVnp+9jluxABJGRQA1z0eJg/5slYaTKRwWFy5ccPMkQTaTq12wuwNAC5IaTYOpdsHbv/5sFLbTQYaL7VGj4AetSJUfVkcRBynIjox9iPbgqTGnhNcW+wfRVBuEutyt+i5Uxnj+oveTlqaNgeWx6EzukUTNNz9YWwpWX430cmWxILgVe7fMagpwRz7tf68o0xbB1kmJBt5RvJMe+kxusVlH8b6Dkx1yzn4zOXvSbk0iHMO7DqkT9CphTFoUVw77ULvgVx1oLcrdFioGJyA1zYXTKiZWWBnyrZQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(366004)(346002)(376002)(396003)(186006)(1800799003)(451199021)(2616005)(53546011)(26005)(6506007)(6512007)(6486002)(31686004)(478600001)(54906003)(38100700002)(36756003)(66946007)(66476007)(66556008)(4326008)(6916009)(316002)(41300700001)(8676002)(8936002)(5660300002)(2906002)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlFtYWFiQ2xncWUvK2ZtUUMrajZvMituaDB1QlJHMjVzVVl1OWVTWWJFMXhR?=
 =?utf-8?B?SmxMKzh3YklJdDlkOXd1Sk1HcTN0a1NjcUlNcHdIcnA0bTZHVHVXMGUzeElm?=
 =?utf-8?B?M25YbENndzBreitNdDZXQlRGcDhqUEN6UmdlRVpmOEo1TXZ2bWNVbTlNeHBr?=
 =?utf-8?B?ejZWeUlXOG9oS29OMW9pbVFRK0dqTzhKekJJMndaa2RBcjRldEYrS2x1KzJY?=
 =?utf-8?B?MHJYbFA3UCtFUVRGRVRQdXNKbFlUODJvN3NyOGNpSGg0NjhpVVlCcTd3UGw0?=
 =?utf-8?B?ek1WeTJUK2hCQ05GejF0YlVpRDVVQVcvYjBBNTZMLzdURXdDaTN3NW9HUzR6?=
 =?utf-8?B?NHh2dUFxdUxjbG1kWmdPTFJPOGoxMWhNdHlyc3o0b083NmhaOUEza2NzUFJ0?=
 =?utf-8?B?Z2xzTE5ZSkR6ODRhdmRhUGpFUmUzUWlaUDVZbTdHTnhhTCt1ZHVyeCtRekVT?=
 =?utf-8?B?RlVhMUNBV2dyckN1UkZFSWxhNWxvMXhDWmk5ZkFBOWk4MFlDaHN0dHh0Um5p?=
 =?utf-8?B?R2x6Tk9ocFVIM2U2dVFUMWx0UEhMK05mNlBYNGdHQkV3YnFOd2hSUzhaU21s?=
 =?utf-8?B?LzlJaHIvTXFET3JLZE1TRDBnMVRudS9wMFBHUUtOanZhVFVtVlRQd2hSNHYr?=
 =?utf-8?B?aE9YV2xSZ1NVVGxZOVN3dVIzRSt2WmhZbEpvT0R3RE56dWU0d0R0dVJHNWhl?=
 =?utf-8?B?N25iUWtocXdJRXBYVmlPbmNieGdzakplTWZKTG9hZGwwYzUwWWpBSUJKQ1d5?=
 =?utf-8?B?dmw2L2NvcEg3T2tOZ0hSaW5pZ1VScVJWY25RWnNhZ0RvRkNOR2hDSnVQR28x?=
 =?utf-8?B?UXBmaTNHM1REa2txYzFVODFMaU5YQ1YxL0lnM3p1NnNwTjhvMWtyRVVzcm83?=
 =?utf-8?B?TmhKZGNkVkpkcWF6Y0srY0NtZ2JyMDFDSXlZUDNnSDRyZFJja0I4NzVtSDZ4?=
 =?utf-8?B?MUYzeGViNVBRblpCeXlCeVdXRzBXUlRqS0w5SmVjL1FPZDlDRndGakpmMWFW?=
 =?utf-8?B?YktPM2pOZzZYS1RibHg1Sld2dk9nMTE0ZHlOeEppNlh3L1ZiL2xFdEsrNUE5?=
 =?utf-8?B?RnZDWnNtQ2R2MWxRTkh5S0Nib09lUFMwZ2pBeUJTNFFhU2Vvc0lzaHg2UHNW?=
 =?utf-8?B?NFVIYnFNTXl6eUZiYkFlbXI2Y3lNalhBNWZKWGJ3TnVWMDZXUUNOZ3d4Yzdq?=
 =?utf-8?B?NkNpcWRZdlBxQVRUQVp2aGxZbU1XallYbVhwOUt6MEF1WmhSOFR6Z0JwUHE2?=
 =?utf-8?B?YXFndnovM0tJK1BZdncxK1NXQ2txSXg0Si9oZVQ5MHYvUldBM0R5UlUwZ1Jl?=
 =?utf-8?B?U0k3dTJTRWJCUlloeDNmSnJtU1oyRnloZkphVjVQRStScSthamFPS0MwSDJU?=
 =?utf-8?B?QTdBSFU3SlE4aDZzTWpDVzRJZE5OdjkrMXIzNEFseEhQdE9zcVU0LzhvWTVZ?=
 =?utf-8?B?MXliMlh0TDVvVVMyVXhub2h3aWM0K3ZWZ1JQaXNvK3haQzlVZS9NSitWN1l5?=
 =?utf-8?B?TWZIY1B1VFBRR2lEaHAyOTR4RVRyMjZkVHhZZC82aXJCSWxEdHhXL2VwcXFw?=
 =?utf-8?B?L1l3MG9JNkhFM3JoU1FtL2xrNDF4QW5lT0Y0eHNBMlpZVUQ2NGpLTTg1Rldq?=
 =?utf-8?B?cDFYdTVVKzRXTHpsS3RmblR3TGFoK1dnaVpjM29VMlp4U3h5bGVkc0J2UVVX?=
 =?utf-8?B?aGRaZ09QdlRCaWVWTk1vdHNQanBYaStOY0VtSzc4Zis2Q1hIOEViQU16eTNM?=
 =?utf-8?B?YURoRmRkU0dubWlkbVJDWFFuUWhiY3B6QTJlZXJWVnRHNENKanNjZFVSUGU1?=
 =?utf-8?B?NTUyWWh4V1R4aTdUWm5rRlBPdG5RN0MxZStPSnFTeHBMNE44cEM0R2VML21q?=
 =?utf-8?B?TTdjbDVPV3ZQdWdUQ0VTSmRoaTVZd3FIcVpWSi9aK0RsZVlXcHczUjBFSFNT?=
 =?utf-8?B?ZGNVVFJVM0lqajE0UXlMZS8xbGVVTG9nMjVxR0R1eG9rckowUDFnbVBNMjc4?=
 =?utf-8?B?WXZvY1lWVXpDMHltOUpJeWdJSnhIc0RDZDl6TVc1WWxqLytDZytBTGoxOVl5?=
 =?utf-8?B?K2hsVnU0emU5b25Ld0RSSkRoM3VrM0tHYTV0c2xXajZUZVFEKzJFeUltR0tH?=
 =?utf-8?Q?pd3CD49EQPbtoUZVTf92/f1GO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42b18577-063a-43b8-9033-08db97fa1761
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 10:27:39.4350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d5dRuTJaAytLjsZ7B0zUemRupofuwLRs5rtw27I+HraSMNNPd+9LBDEZmJRBjW07vrlIHWqcyEH89xkdHOJthw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8263

On 03.08.2023 01:03, Shawn Anastasio wrote:
> --- a/xen/arch/ppc/mm-radix.c
> +++ b/xen/arch/ppc/mm-radix.c
> @@ -266,3 +266,47 @@ void __init setup_initial_pagetables(void)
>      /* Turn on the MMU */
>      enable_mmu();
>  }
> +
> +

Nit: No double blank lines please.

> +/*
> + * TODO: Implement the functions below
> + */
> +unsigned long total_pages;

Hmm, yet one more prereq patch for me to make: There should be no need
for every arch to have a definition, when common code requires the
variable. While looking there I found max_page, which common code
references as well. I'm surprised you get away without. I guess I'll
learn why that is when making the patch moving both.

> +unsigned long frametable_base_pdx __read_mostly;

While we still have many instances like this, we prefer this form:

unsigned long __read_mostly frametable_base_pdx;

> +
> +void put_page(struct page_info *p)
> +{
> +    BUG();
> +}
> +
> +void arch_dump_shared_mem_info(void)
> +{
> +    BUG();
> +}

And perhaps one further prereq patch to avoid the need for this.

> +int xenmem_add_to_physmap_one(struct domain *d,
> +                              unsigned int space,
> +                              union add_to_physmap_extra extra,
> +                              unsigned long idx,
> +                              gfn_t gfn)
> +{
> +    BUG();
> +}
> +
> +int destroy_xen_mappings(unsigned long s, unsigned long e)
> +{
> +    BUG();
> +}
> +
> +int map_pages_to_xen(unsigned long virt,
> +                     mfn_t mfn,
> +                     unsigned long nr_mfns,
> +                     unsigned int flags)

There's a patch in flight regarding the naming of this last parameter.
I guess PPC would best be in sync right away.

> --- a/xen/arch/ppc/setup.c
> +++ b/xen/arch/ppc/setup.c
> @@ -1,5 +1,8 @@
>  /* SPDX-License-Identifier: GPL-2.0-or-later */
> +#include <xen/lib.h>
>  #include <xen/init.h>
> +#include <xen/mm.h>
> +#include <public/version.h>
>  #include <asm/boot.h>
>  #include <asm/early_printk.h>
>  #include <asm/processor.h>

There's no need for xen/lib.h to come ahead of xen/init.h, is there?

> --- /dev/null
> +++ b/xen/arch/ppc/stubs.c
> @@ -0,0 +1,351 @@
>[...]
> +static void ack_none(struct irq_desc *irq)
> +{
> +    BUG();
> +}
> +
> +static void end_none(struct irq_desc *irq)
> +{
> +    BUG();
> +}
> +
> +hw_irq_controller no_irq_type = {
> +    .typename = "none",
> +    .startup = irq_startup_none,
> +    .shutdown = irq_shutdown_none,
> +    .enable = irq_enable_none,
> +    .disable = irq_disable_none,
> +    .ack = ack_none,
> +    .end = end_none
> +};

I would recommend to avoid filling pointers (and hence having private
hook functions) where it's not clear whether they'll be required. "end",
for example, is an optional hook on x86. Iirc common code doesn't use
any of the hooks.

Jan

