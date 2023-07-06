Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5C7749AC0
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 13:36:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559870.875267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHNGo-0000kb-ST; Thu, 06 Jul 2023 11:35:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559870.875267; Thu, 06 Jul 2023 11:35:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHNGo-0000io-PR; Thu, 06 Jul 2023 11:35:34 +0000
Received: by outflank-mailman (input) for mailman id 559870;
 Thu, 06 Jul 2023 11:35:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdui=CY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qHNGn-0000ig-Ei
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 11:35:33 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20625.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 372df7f3-1bf1-11ee-b237-6b7b168915f2;
 Thu, 06 Jul 2023 13:35:32 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS5PR04MB9755.eurprd04.prod.outlook.com (2603:10a6:20b:650::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 11:35:30 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Thu, 6 Jul 2023
 11:35:30 +0000
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
X-Inumbo-ID: 372df7f3-1bf1-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UFgCxtRCzOsCAnEN51lyK9dH7dVeTmRFegGIEEueEXNZXJnC8Jt9t8cekS2zwfD0rQHcFL9OL1kzT1bfuDusyE1aQW2FOa4o3g6CGA0XylvTJmz7jgEFvXVhooycTF2MbnT3CPEGnlHnN8SV+Eji2xpkFXwjG6ADFr7xPx5f8GI4wwiZQ4rOP+1OdQbWJjj/Fzk5+AyaywdilbC0F56gzkaFwfzqAqAzVOwEzKQSrfG1VpKKjVVI6Y0MMWND+ymuQNGrEDBmvxYMnI8BHY72Oxb9MVt7+Y7NWAks5ZT1+0SuFYZxHcrEcetrm55f7fIIzA1uTEJ/RCRdAoCN37EczQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+quS3CO3zvxhccjUTIkOuJF4zafkjpKtTXzsyQgJbp0=;
 b=TbcYJfaZ/PkePJvy+fcMB666AOFZagJeLVEM3ak+5uw8cTX9ddY9k1s7CaRMkATuhznR3llQ68BS4T+GG8agyx10s7WwStXtHrOMqiB1erH0YtJjFSuxOhaBFUSQycD+2P1dQ6cxDRQC2CkNPmGtH4bqOLzSjWMhzFSq4v/xQYRJ1yVbZy78XefdoBKNU07Rlcs5JK/IeK1Okux55yD8MY63nMxSEcWhEEfwFvqbtoCWcIftZGaog4GQslr9yosrposKabFcSUYvCAiIsxr3hJJCDjbSzI+sOX2jYSfVg4ddZ0HPIGp1RvPAUPYMGI7GvPz7MQ/3sV8+NLs2UPdqgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+quS3CO3zvxhccjUTIkOuJF4zafkjpKtTXzsyQgJbp0=;
 b=MJoQdb4T2P91xyUP7L1zCdlWmnBOtJV7xZeTjz4MuUahu+Jqlh5uR2Da/EuM93eHr3SHkc9eIb4Luo/1tbkUgN6/CZPYbnGHj1djNwSy3ak5RYHz4VkI+5gPGbQYPMtiY4t0EtuJnU21vZIb0TrsIY2lG5QFw3xmgCthLqLHwZr1n1SoyRhfTASJz4grDWR/EKqEfvDnN931+MX0Cq7xzanlQZKUD2q4OcwpgDRZ9ObyukM+vBsSubWilESR5iUW56l1eNKrNaiAgqBGMOaO0+mds+Qb7cXRSy45FCCij/ilyCLdTMXbqoQO/0Gs5HJCq5E9txq4KFk8xXQBtTivPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <67df28ad-060e-07d5-acf2-02c3cd5f0b96@suse.com>
Date: Thu, 6 Jul 2023 13:35:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 4/6] xen/riscv: introduce identity mapping
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1687178053.git.oleksii.kurochko@gmail.com>
 <21d8ce65f718bc10c2213688f79cf5f978bcaf16.1687178053.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <21d8ce65f718bc10c2213688f79cf5f978bcaf16.1687178053.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS5PR04MB9755:EE_
X-MS-Office365-Filtering-Correlation-Id: 95d88692-bc33-4f99-92f4-08db7e151a40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eqJdMUiEyagkzPUSA8wwfdRbjQovftalcsCG1T8d2zsq//AG/tdY8dwDBNyJ3yrHFLlTuiH97ELt+G8jsd7UAsc9+H31BGyQEK3yeg0mFw5MgJY43UG9Ei5jM0KQlmo3BJFinemPdCWOT2/UJI3joO18Z/4qg+ev0NqABwBikAu3M4pkUpS/v65c9DmvFmB8pwkz4t08G95mnTBpwBQt29moqBdamDT0NUXkedlYTDmmLixgVnqGFYk39wNKOBPJ454Kvxf9g+sy+8Jp3x6I9qrQvj6qI85URwPLYI4Un7gjqqa1sKKdKy77lVvqORw2CY0DXJlyyah0v2Wxx0E2aOpMVn3IM1c+C7JmOeC24R8t+yl9uZ0WRt4FXbZ0GqObQc7Do9F1O02KBQfQrKGthimvgWLdUn0VPdIaqNKQE/nzwu/X1XJeULrFTGPE0GTS0HjXlNpTPoW1ZGSdd6z4kqeWlS2WwaLEqWuhqWfuZSqE3yqDyOPp86x+GnaGp2C0myTWu6VXvPE83czRa+IyyYrYE+ZBDbCJwqHmr9vVXdVYmclnjEiCr3GicY9/4RIEWZqKv1SKhyy2JZ31GMId4F9JfwHjFwL8WY8WEaAutOFR9y8KLcPKU1cyZhbMHTTsa/RyI/GBr/NCWYdMsVHhtQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(376002)(396003)(39860400002)(136003)(451199021)(66556008)(6916009)(4326008)(66476007)(2616005)(66946007)(38100700002)(31696002)(86362001)(186003)(26005)(6506007)(53546011)(83380400001)(6512007)(478600001)(54906003)(36756003)(41300700001)(8676002)(8936002)(31686004)(2906002)(6486002)(5660300002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnJ1V0xWYUdKcENDQ0hsTlg1Q0JTbTdlamptZm8vOUFDTi9rNGRSVitYYm5B?=
 =?utf-8?B?U2JGV3gwRExHMTFCN1pUb2x2a3N0dkcyY3kzOUJYTXBVb2RSWlRreXZqSy9D?=
 =?utf-8?B?RTdSZEdsSjVmcVBiUFBPWU90WkxGZTZ6NFhlTXRkR09JMDRuWEUwNzh5Q1Fp?=
 =?utf-8?B?cWlvTk5zNGxXTERRSU8xcnpKN0FNNFNYUTVxQ1VyakZsNzJTVWxoNGlhNHBJ?=
 =?utf-8?B?UHdTN05kZmloMkhYVWE2ZTcwckRRbVp1OWhwS2IyT1FDYStuOGJDeG4vTHJN?=
 =?utf-8?B?dkN1c1V0ZGlqRkZ6YjlDZW1wdmxHRGxuWFNHWmkrTXg2MXBxRHRnV3A5bkZW?=
 =?utf-8?B?bnlLdmFpNDhKbXNBcUZvdFg1NlV3QWN1alc4cHlsd0p6WjBMU3RRS0s2bXFo?=
 =?utf-8?B?Q0tOTENOWERMUCt1WDJMZU5ZUDVVbTRSQmltWmlpY3BoMThkYkl4dlpwdVl2?=
 =?utf-8?B?WWhHRVk2OXIrYWJlQmd2WVFybXVYL0VwN095a2NnRmFOVWxnUzBVL1VJL200?=
 =?utf-8?B?MGlJekFxWlI3ZXlSaXJmQStRdWZqK3NadVJzVVR6NjYrT1plMGg5NWlXTzAv?=
 =?utf-8?B?ZHpYSzRPa2QwbHJ4dERxWHZQQlJWVTR3WlZFaHpqcllMODBKUmszcGFaOGJN?=
 =?utf-8?B?YTFaWUo1MVRRdTBPZUJEdG5QbGhScHZhN2ZXRzhra2VReDJMN0NhMStSdFBn?=
 =?utf-8?B?RnZTakc0ZVlLVGtDb2pma25GT3FiSmdndm5ScG02a0p4M3hpeklzTEx1UExT?=
 =?utf-8?B?d2dodm5PWXBKT1U4TFFxV3RPdUJOTHA3ZkRFb2Rvc1N6TklwQm51ekkvTy82?=
 =?utf-8?B?dXhUMkEwRDFHUDRGZmNFNlpUQnZEUjFXT2VqM3dHNnNLcWNFN2hFcnNGaGdr?=
 =?utf-8?B?S2FhVEVFU08rOUIyVXNQS2JobnlkOFlmWE50TlhhYndybFBVOWxsOEdjVGxt?=
 =?utf-8?B?MC9xZGtvc3JJRVBhbk9nejlhdFlJdm53RzVCbmJiM3VDQ0p2SExTM1MweUJC?=
 =?utf-8?B?bldrT3A4TjdWTitNV3VONlNySnRNNWRJVnhtL01OOFpnRW5xQjJzMlpsNTBn?=
 =?utf-8?B?bVJ0NjFxVzF4NytLbmJtK2c5aVNIL0FwR1RKbVZ5eVEvbitzL1RrSUlqWG8x?=
 =?utf-8?B?MnNMNjNlQ0VHZDdXQXhwSnVMeTBpbWxSTDhtYjhoemZOZmZnOU1DeHV6YmJY?=
 =?utf-8?B?R0FlUnpiSzRHSmZscEVvZy94NW1JMGRLWVdzUTZvcWxwRlJ3U3VXVUw4MGl0?=
 =?utf-8?B?K092NWRld2ZOcFBIR3poTU1MQnc3T2Z2Sm9EeGtmdWdxVEwwZ1ppOXdRUmRv?=
 =?utf-8?B?RTk1cXBVcFcwM0pSVkkrYjA4T2d3RldkK1J3QitsaUw4UU02WVBDeHFjSWNM?=
 =?utf-8?B?d2RjMGk2K1BLN1ZiRGhGdHluQ0IvTlRoU3FVQy9wZy9ud01Vb2wyZjVNaExI?=
 =?utf-8?B?R1FWM29acHNCbUNZc0J5Y3dlQTFla2Jnb1krTzFUM1FVOUVTczhQckFTWnRs?=
 =?utf-8?B?VUl2T04veHV1MHdIZWRicjlTaUp3NzVPb2Y4cHpJbm1HcmdLTXRZWTdmbkRX?=
 =?utf-8?B?SHJBZ0JVWUx3K2pDd28xdmFKYjRwVVdNZlBrNFhLTisxcm9jYXQyazBDQkZF?=
 =?utf-8?B?eXd1V2JVdWpmZWhidVl2Wmhwd1Q2NVhiRDNHWmhqbk56c2JYKzV6QXpHenBu?=
 =?utf-8?B?dGtub1VJMHg1azNtVytUSk1WSnpEUE96dG9NUXBCNjVnZjRjTUp6OFhpQ0NN?=
 =?utf-8?B?ZzhzQUtLVU9EQkJHZWdCUytBRVJXUnZxYmxCK0RHRXpWUkl4ZE1zaUNQRXJw?=
 =?utf-8?B?VE1iMGduQkdjVFZlUmVNVEpNMDRmUHNpVUNjanlYUkZJRnJzcEoyVHFLN3Yz?=
 =?utf-8?B?TXpLYzJac3dEY25nN0ZPUW95Z0Q4U3lKdmpWaWtJTU5SUWRuQzBBRU5jM21u?=
 =?utf-8?B?cFR5ZFVhdmQrbFlnYVdvbXpvLyt0T0RCVHd1dTJPQ2gxb0EyTkdlVVprVGVu?=
 =?utf-8?B?RnAvNVVtNGl6OUVFQUJMZ0d4eWt0NHA3VmlJK1lCQVhEMTVpTU5aRzVHcm5s?=
 =?utf-8?B?eUpiVGlBK3hrRXJqb2RGYnpJRmJPQmhQRE1VM0JObUgwTXFGQXFhSFdYdEt0?=
 =?utf-8?Q?y5jOCSfEBqUN7zRteZ3eL79wC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95d88692-bc33-4f99-92f4-08db7e151a40
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 11:35:30.3877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xe9MCmegJNCsLIJK+JXDfFHBpgCbl8iCLc86JHF/2QG6gm+NoOhveVRroFta89w1Mx+oEq/fmyQXi1/aCWFrtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9755

On 19.06.2023 15:34, Oleksii Kurochko wrote:
> Since it is not easy to keep track where the identity map was mapped,
> so we will look for the top-level entry exclusive to the identity
> map and remove it.

I think you mean "top-most" or some such, as it's not necessarily the
top-level entry you zap.

> --- a/xen/arch/riscv/include/asm/config.h
> +++ b/xen/arch/riscv/include/asm/config.h
> @@ -1,3 +1,5 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
>  #ifndef __RISCV_CONFIG_H__
>  #define __RISCV_CONFIG_H__
>  

Unrelated change?

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
> +
>  /*
>   * It is expected that Xen won't be more then 2 MB.
>   * The check in xen.lds.S guarantees that.
> @@ -35,8 +41,10 @@ unsigned long __ro_after_init phys_offset;
>   *
>   * It might be needed one more page table in case when Xen load address
>   * isn't 2 MB aligned.
> + *
> + * (CONFIG_PAGING_LEVELS - 1) page tables are needed for identity mapping.
>   */
> -#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) + 1)
> +#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) * 2 + 1)

How come the extra page (see the comment sentence in context) isn't
needed for the identity-mapping case?

> @@ -255,25 +262,30 @@ void __init noreturn noinline enable_mmu()
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
> +    unsigned long load_addr = LINK_TO_LOAD(_start);
>  
> -    switch_stack_and_jump((unsigned long)cpu0_boot_stack + STACK_SIZE,
> -                          cont_after_mmu_is_enabled);
> +    for ( pgtbl = stage1_pgtbl_root, i = 0;
> +          i <= (CONFIG_PAGING_LEVELS - 1);

i < CONFIG_PAGING_LEVELS ? But maybe it would be easier for i to start
at CONFIG_PAGING_LEVELS and be decremented, simplifying ...

> +          i++ )
> +    {
> +        index = pt_index(CONFIG_PAGING_LEVELS - 1 - i, load_addr);
> +        xen_index = pt_index(CONFIG_PAGING_LEVELS - 1 - i, XEN_VIRT_START);

... these two expressions?

> +        if ( index != xen_index )
> +        {
> +            pgtbl[index].pte = 0;
> +            break;
> +        }

Is this enough? When load and link address are pretty close (but not
overlapping), can't they share a leaf table, in which case you need
to clear more than just a single entry? The present overlap check
looks to be 4k-granular, not 2M (in which case this couldn't happen;
IOW adjusting the overlap check may also be a way out).

Jan

