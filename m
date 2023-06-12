Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F13172C65F
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 15:49:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547146.854394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8huK-0003BJ-Gt; Mon, 12 Jun 2023 13:48:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547146.854394; Mon, 12 Jun 2023 13:48:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8huK-000380-Dv; Mon, 12 Jun 2023 13:48:32 +0000
Received: by outflank-mailman (input) for mailman id 547146;
 Mon, 12 Jun 2023 13:48:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Cme/=CA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q8huI-00037u-FU
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 13:48:30 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20612.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfaa519f-0927-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 15:48:29 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB7120.eurprd04.prod.outlook.com (2603:10a6:800:124::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Mon, 12 Jun
 2023 13:48:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Mon, 12 Jun 2023
 13:48:25 +0000
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
X-Inumbo-ID: cfaa519f-0927-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xt5XTC+2dpfMrDOC2ukXbARp/WKeIM8ROU93AJUfsMWf61qEWGo6aXBy5fVE/s8Gg3CIoVwSxoNgGEIR1rdkupj8/9Z5kC+GpAfDo2Pt9wUoyAA1ChPHtlSHBZtEjdn1D1xCN2UxssyIiIfsF4NLWoXbui/4NFvngg0f7XFCW2ydbB2zzJDxHEq4dPxP4dtFZASxdxo5MV7o+25k3ieBHWcyypAH6sDjNX2/Msh7vGT0Olavf6DlVo2GTzpk1tY/fmmwK5KgMLVKPX5Ue19rDuhKruJeCO4Fb4RoQ+ohLbK7fVzbzohY+wrBPpEoTso4ZbBay5DTuVAVvEBk3v/8Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=THykHUDivjtyj8SV40sWxFCHsjWEitcQNrdaK+5l+Nk=;
 b=Tv0yKwudQ/tN3g2BiVIFXMp0f90P+MO6Wv/0jBz0ELvAPJhCbn4Qh9tl8p4uGx9z91Ef26aVGxeWOTbcGdEOHfsi+4y8C+W+YtXtlrH7IhOI4bJ8ibzv0ie85/hATYtdCahgZUNUf2EYAWD611T0t87mQwCe330fXeQ4arOaVa9wczveVXqgaZvgGoPsavYe0kpk65oeGJrkuo3isFwhM6c2y9HDwnf42J/wA2jQP1o+xMXMH1QrFoGqYalIBGJr2FCszBjF1rzxBrDMF/XSy2MSJa5XdVaFsHVNL+iXmzyhEKnIejKtk4fupx/YyanBk3WZUSnFuGLOthAWAPzCgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=THykHUDivjtyj8SV40sWxFCHsjWEitcQNrdaK+5l+Nk=;
 b=2wB8QNNkUrIJHvoxcvCDWGO3LPJb1WyhTUlS0gshm+qR19mgvLuy0ujmTKIvSsqxkxyXmdc8EPgYWqYov7zsS1ydqUXpoxdeFK96GqoK90xImjtTcEuNNED2fguRPdVtwXHO0mbr/Qv9xmbcVKIwCcL1XZJess7yTsZX8uhSZqy/rD7RAALGntw2v7e0K66n95Xh1uKl9HU1rRaYZTNBP8V1bUnF+lCvx1y9aVSpPmNWuUqbWEzsod2Gpvh61nkRXxSQojag8y7GSzwQVmNnGB383IihE320QMJQwrao/COH+I1eiK0GHJAa6Q2EClrnFQQWGtEVtRAnXV6GDQHibA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4ac462c3-9cb6-f467-2b86-925fb068486d@suse.com>
Date: Mon, 12 Jun 2023 15:48:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1 5/8] xen/riscv: introduce identity mapping
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1686080337.git.oleksii.kurochko@gmail.com>
 <32aef31768cd81ffc8c848af6c29cd8510bbbf6d.1686080337.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <32aef31768cd81ffc8c848af6c29cd8510bbbf6d.1686080337.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0035.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB7120:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fb9e3b1-8d55-4756-9ab3-08db6b4bb1c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	X6AJNfkmh7/oqsoyqVJTpfpAuWsL983KTZuy4d04RhnK9yQ68b0CCOBPJzaxVYoB82kxgbYBN1Tknrq2N6wq3e8py5+wUdyxQmNWvg7onwN53XamORsVleh3VdBVRejgAeg2XGcd8OktPeO4h/qnt/PWXgE4wHu4GLrTngqno4tcnD7GT02Kqfox7h9wPTkoxQNYdakXl1VU5Wl+tZhIafFEt+jROMqgms3EH2noNOMmgBV0GZ9o46jqW2kbgV9KjUhHoW0Oq37Czi0ohD5c2mdY7PAN1rAln1b8JmS62sea1XkIItL0yYlux0IRRB0dm4i2ePZeVRjQ/fOAfNZmozvk494+b1oovKQWMhtvghoEdQOFe1OYztLxfmbem0Oq1LT82wlLd0z5OnMCE9tRTs2n/KZ5PxNTqPwyIrkiDw0v1yEhtQ3ASE7OyTrkkeNlOeLLrLFjzdfenv/nvPB8xrxMhkvwDaDgBr/ouvQi8lE1x9ir468pZ/Xd3H8II7CxgYusokT7UFAFim4gpngkxZ+yBTs2KA7HNgE9NayONUfPd7FTsfVon0G1kRh9hIoGgFNVbBeOovk46C9Bco0gQdBXUvmgpLjGeSqE0IllI0doAMC9R0dEH1q9C7QPRHHpJJ9z0FOXYpG+63sLFDskFA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(346002)(366004)(376002)(39850400004)(451199021)(5660300002)(8936002)(8676002)(2906002)(31686004)(66556008)(66946007)(66476007)(54906003)(6486002)(4326008)(26005)(6512007)(6506007)(53546011)(316002)(6916009)(41300700001)(186003)(83380400001)(2616005)(478600001)(36756003)(38100700002)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnRRVUJ1KzhTaVFLZkJXNUw5N1ZhcmpWMXhpWHZkQXl5ZnZBK0VSUUlmYlpv?=
 =?utf-8?B?SHlnMUplVGJZcm8zMXg5SVkvY25YYnVuTDRwaDBkOVJraStwRlBxeUM3ODcr?=
 =?utf-8?B?MkUvUDAvTFhYOGVWYzRCR2dqNE8xRHZCd0l0R1VlK1UreVBoWVA2MVRBZHpu?=
 =?utf-8?B?WjRocTNjZ01oaWVNaDhsTUZGbGlVKzQrd25rbENkSFJQS2oxcE5ZOUY5ZVEx?=
 =?utf-8?B?UFZEci9UWXc0S1crckRVaE1UTUw5UWtyU2dNVzFFVkpmQ0ZRSjhSMU1hOGt1?=
 =?utf-8?B?dHM5ano1R1lxT0Q2Z3k1NVp3eEJER2RXbDdjN1Z2UnJuUHMvbkUxRGRLUG4v?=
 =?utf-8?B?ZjBtbGttTUdDYzkxUzhGMm1UTFdoazVJVDIyOU1xdlN2UlNoYnh6UFYzcmxS?=
 =?utf-8?B?WnhnZ0l0M01McmIyWXpWdktIV2lISmZWRERqQ3F3N2RtaThLbXp2OTNnbld2?=
 =?utf-8?B?dDNOSXFzZFFtRzI4ZVZ5ZXRKUzNscjNvRitiUDFFWmo3ZENRU2I4YVRuTzB0?=
 =?utf-8?B?WUlUQXd3Z3piME9LbEZKU3ZESWcxNUhlM05QdHpXU29Nb0hFckZpMzFxQXM5?=
 =?utf-8?B?SnhXUUo1Ui9aQllaZXY4TDlXUFZRbThlMExCSS94TVhkZS9naXM5TjRJcUhR?=
 =?utf-8?B?VW5lUWR4VHB5bEFHSEVvSi9IQkQvWjRIcnlldURDMklMWWNVTXFmcjVzT2JM?=
 =?utf-8?B?bEljdmhoMGFrQVJvWmlZVS85M2UvWi8zTk4wbWtBR2gyR29OT3BNa2FJbEVB?=
 =?utf-8?B?SFo1VzZTMVJYQVYxYWpKNlMwVkRqYThGbFlIY3hTa2VJclgraFZhNGM0K0Fr?=
 =?utf-8?B?V3JpQ1p1OHlSY0ZwbmM1Z1ZYOFN1elRIZkc2RGl2VHo4SkJtVUl6bDlmVno2?=
 =?utf-8?B?SUtNRkNHWXNFaEE4b0NNL0FOa2U3VG9DZzRZNHNudGRkc2VZOStuU3Z0clEx?=
 =?utf-8?B?Mmswc2xLTm82ZDZtRUkrT1Vkb1R1MGJNSGdrSktrY01FMHBYdjBoVlFOeU9j?=
 =?utf-8?B?M2VqdkxVNU1yWkI3SU5kc2NnblVqdnVVM2NIYUdwNU16dVI0L0hvbmtBZVBM?=
 =?utf-8?B?UnR6ZlJ1Z01WVEZrQmVOOHViWkZyWXhQU081MVViMFJ6NmdwSUtDaXVMRUsy?=
 =?utf-8?B?RC9PSW16bkZXa1VZOS91TTh1SGhEaXNNUzRvdSsza1BVZ2VNTE1xUVo0VUo2?=
 =?utf-8?B?SXdIZTZLUm9ELzNiNk9Pa1BpMlBqY0NrNzZ4RlQ5aDdMeE5YczNSdk9yS0pR?=
 =?utf-8?B?b2lRTGtCRTUwejJuZlpqUmQyM3lhaGpMY05QeVp4UG5MbExPL1Z6ZXBxbTNr?=
 =?utf-8?B?SzBkb0srcGRnMCs5V1EzKzlISnVnSXFkb2IvTXVHdUhWVEtVMGl0UnJkeTFX?=
 =?utf-8?B?c01ZTDZVVExBSU9rSFJMMXdGOVQ1a0wzOVBBVGtHTDBxell0clJQYXVpZmEr?=
 =?utf-8?B?RUFyMm1VNnNiM3BVa2ltQ1RTV3NkeEQ5aFNBVVAxTzByY0RPMUVkNXRPL3dS?=
 =?utf-8?B?NmdaRDMxNkFQdHZHcC83WVBVbkJxVVA0Zkk5MnRhc0IwcnB0Y3B2VFFidFcr?=
 =?utf-8?B?T0s4eWRINWsxYzJqRFp1cHp4RXRFUE5Qclhxc2t4NjRDa2FyTktmcG1qU1cw?=
 =?utf-8?B?Y09ldndsc3A3SFloWGtSZHJzVjJqYk9wcVBqcjJIdWY1MUpBNzNqTndzL2ND?=
 =?utf-8?B?MWpkM2N3RHROK1J1SmthcnVMZ2RMTWVNYkJxYmRIa3lsRitSaFBidGs1RFZM?=
 =?utf-8?B?NG1SU1BQS1JxcTlTME84aHdGc2NQS3lMMkNybmYyM2lFZXZ6ZVJXN3NvcS9w?=
 =?utf-8?B?ZDE2aURZMEk4M2JFUk91R3U4d2pITXJGVFFiZ1p6OGZWOVEwT0lrako4aS9n?=
 =?utf-8?B?bVMxK3ZmNEl5SWM3cXphWlZReHMyNG5kYzZKeG82ZlV6ZkEweUU3SnR1YXBj?=
 =?utf-8?B?Z2VWV3BOWVRCKzd4YmgwVXJ2UWlwTDVqWThrMURXeGErREhpZVZLaU5YenpL?=
 =?utf-8?B?RDdMbWppVndJbFdxNUdEcnBTNVplMTE2emk0dVk2cVZLaXU4VEhmWTdDOE1i?=
 =?utf-8?B?WE52QlJ3YXAwYmpSajVtUHZyRDFGdC9lbng1aHNiNFF0L3BRUVlRQndHMlMr?=
 =?utf-8?Q?vupEA3MG45JEk+2bmT+11ytda?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fb9e3b1-8d55-4756-9ab3-08db6b4bb1c4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 13:48:25.3915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cQr/Ql707XpGY9ZU58wx9djOiwwwvLkgNyc2VnU8z/H/t7GOljTQPLdPPA3f7u2qjjxmtuXF/RsIhicq+SOWFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7120

On 06.06.2023 21:55, Oleksii Kurochko wrote:
> The way how switch to virtual address was implemented in the
> commit e66003e7be ("xen/riscv: introduce setup_initial_pages")
> wasn't safe enough so identity mapping was introduced and
> used.

I don't think this is sufficient as a description. You want to make
clear what the "not safe enough" is, and you also want to go into
more detail as to the solution chosen. I'm particularly puzzled that
you map just two singular pages ...

> @@ -35,8 +40,10 @@ static unsigned long phys_offset;
>   *
>   * It might be needed one more page table in case when Xen load address
>   * isn't 2 MB aligned.
> + *
> + * 3 additional page tables are needed for identity mapping.
>   */
> -#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) + 1)
> +#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) + 1 + 3)

What is this 3 coming from? It feels like the value should (again)
somehow depend on CONFIG_PAGING_LEVELS.

> @@ -108,16 +116,18 @@ static void __init setup_initial_mapping(struct mmu_desc *mmu_desc,
>              {
>                  unsigned long paddr = (page_addr - map_start) + pa_start;
>                  unsigned int permissions = PTE_LEAF_DEFAULT;
> +                unsigned long addr = (is_identity_mapping) ?

Nit: No need for parentheses here.

> +                                     page_addr : LINK_TO_LOAD(page_addr);

As a remark, while we want binary operators at the end of lines when
wrapping, we usually do things differently for the ternary operator:
Either

                unsigned long addr = is_identity_mapping
                                     ? page_addr : LINK_TO_LOAD(page_addr);

or

                unsigned long addr = is_identity_mapping
                                     ? page_addr
                                     : LINK_TO_LOAD(page_addr);

.

> @@ -232,22 +242,27 @@ void __init setup_initial_pagetables(void)
>                            linker_start,
>                            linker_end,
>                            load_start);
> +
> +    if ( linker_start == load_start )
> +        return;
> +
> +    setup_initial_mapping(&mmu_desc,
> +                          load_start,
> +                          load_start + PAGE_SIZE,
> +                          load_start);
> +
> +    setup_initial_mapping(&mmu_desc,
> +                          (unsigned long)cpu0_boot_stack,
> +                          (unsigned long)cpu0_boot_stack + PAGE_SIZE,

Shouldn't this be STACK_SIZE (and then also be prepared for
STACK_SIZE > PAGE_SIZE)?

> +                          (unsigned long)cpu0_boot_stack);
>  }
>  
> -void __init noreturn noinline enable_mmu()
> +/*
> + * enable_mmu() can't be __init because __init section isn't part of identity
> + * mapping so it will cause an issue after MMU will be enabled.
> + */

As hinted at above already - perhaps the identity mapping wants to be
larger, up to covering the entire Xen image? Since it's temporary
only anyway, you could even consider using a large page (and RWX
permission). You already require no overlap of link and load addresses,
so at least small page mappings ought to be possible for the entire
image.

> @@ -255,25 +270,41 @@ void __init noreturn noinline enable_mmu()
>      csr_write(CSR_SATP,
>                PFN_DOWN((unsigned long)stage1_pgtbl_root) |
>                RV_STAGE1_MODE << SATP_MODE_SHIFT);
> +}
> +
> +void __init remove_identity_mapping(void)
> +{
> +    int i, j;

Nit: unsigned int please.

> +    pte_t *pgtbl;
> +    unsigned int index, xen_index;

These would all probably better be declared in the narrowest possible
scope.

> -    asm volatile ( ".p2align 2" );
> - mmu_is_enabled:
>      /*
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
> +     * id_addrs should be in sync with id mapping in
> +     * setup_initial_pagetables()

What is "id" meant to stand for here? Also if things need keeping in
sync, then a similar comment should exist on the other side.

>       */
> +    unsigned long id_addrs[] =  {
> +                                 LINK_TO_LOAD(_start),
> +                                 LINK_TO_LOAD(cpu0_boot_stack),
> +                                };
>  
> -    switch_stack_and_jump((unsigned long)cpu0_boot_stack + STACK_SIZE,
> -                          cont_after_mmu_is_enabled);
> +    pgtbl = stage1_pgtbl_root;
> +
> +    for ( j = 0; j < ARRAY_SIZE(id_addrs); j++ )
> +    {
> +        for ( pgtbl = stage1_pgtbl_root, i = CONFIG_PAGING_LEVELS - 1; i >= 0; i-- )
> +        {
> +            index = pt_index(i, id_addrs[j]);
> +            xen_index = pt_index(i, XEN_VIRT_START);
> +
> +            if ( index != xen_index )
> +            {
> +                pgtbl[index].pte = 0;
> +                break;
> +            }

Up to here I understand index specifies a particular PTE within pgtbl[].

> +            pgtbl = &pgtbl[index];

But then how can this be the continuation of the page table walk? Don't
you need to read the address out of the PTE?

> --- a/xen/arch/riscv/riscv64/head.S
> +++ b/xen/arch/riscv/riscv64/head.S
> @@ -31,6 +31,36 @@ ENTRY(start)
>  
>          jal     calc_phys_offset
>  
> +        jal     setup_initial_pagetables
> +
> +        jal     enable_mmu
> +
> +        /*
> +         * Calculate physical offset
> +         *
> +         * We can't re-use a value in phys_offset variable here as
> +         * phys_offset is located in .bss and this section isn't
> +         * 1:1 mapped and an access to it will cause MMU fault
> +         */
> +        li      t0, XEN_VIRT_START
> +        la      t1, start
> +        sub     t1, t1, t0

If I'm not mistaken this calculates start - XEN_VIRT_START, and ...

> +        /* Calculate proper VA after jump from 1:1 mapping */
> +        la      t0, .L_primary_switched
> +        sub     t0, t0, t1

... then this .L_primary_switched - (start - XEN_VIRT_START). Which can
also be expressed as (.L_primary_switched - start) + XEN_VIRT_START,
the first part of which gas ought to be able to resolve for you. But
upon experimenting a little it looks like it can't. (I had thought of
something along the lines of

        li      t0, .L_primary_switched - start
        li      t1, XEN_VIRT_START
        add     t0, t0, t1

or even

        li      t1, XEN_VIRT_START
        add     t0, t1, %pcrel_lo(.L_primary_switched - start)

.)

Jan

