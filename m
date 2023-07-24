Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFFF75F975
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 16:12:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568990.889265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNwHU-0008Ff-BQ; Mon, 24 Jul 2023 14:11:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568990.889265; Mon, 24 Jul 2023 14:11:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNwHU-0008DE-8o; Mon, 24 Jul 2023 14:11:24 +0000
Received: by outflank-mailman (input) for mailman id 568990;
 Mon, 24 Jul 2023 14:11:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vJ35=DK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qNwHS-0008D8-BZ
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 14:11:22 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20613.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f61c3889-2a2b-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 16:11:20 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7738.eurprd04.prod.outlook.com (2603:10a6:10:1ea::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 14:11:17 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 14:11:16 +0000
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
X-Inumbo-ID: f61c3889-2a2b-11ee-8612-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MTGAFiv9oWvajNv5HyJ+qgnSWIOQoXFoPbj13gRXv7fYq58PxcvEO5mFfE2VjmAxNcaMJmk5yXSs0c6doKEqARyBQ56q3QxWzu1oT0/lxddXRajQ8pNBmepL/zaN6ktb6IrR1IceYrt7c5RErCP2qIZ/29Pno7YJHxwVSxX3pOQLBqxGQi38rWNALL4yO3ocBqnXCf7YOxpWG6RTWA3is3R+iVBYRpIrJFaKsikN7yFU72pWMJ1ZxuoaOgtCHS6kgFEMtsm/2KcmrDHVgiQdcWrXNym5yKVWc703plF8CM/OxmCC3HdjmCVJsOtlI3VsufEk9EXOo+jYKFTNZwIl8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N5Osi0aa+CbeShEqaHlKJY5wZo+F4aku0BuKH8iWEDk=;
 b=DW3OIK/WAGzjxF3ul6vOmrhxJpbRzWkkamdw2Uj46AFXLx9i2MO3lDwVyfFCai2P4/avqEGqZT7usx+NcRe0c/QI0mk43JIwU4BsC7iN9wfOYKILs1PmkgrvmbAoETqW/pyThQw1pAhdMKMjHhGzsHeKWX5MZ0esiaSuqE4v66V7c3UEyfTCND/cFmHbd/5YbZ8/nVuxAYIL+/Q3vBUI+GBRD4DrmV68Uz0hMD8ugfvP2xX8HrNzzWgj2WpTX0O+RTU2BM3oqcbln/EAf/M9GOaGW0fa59SV424VpmSAZREXwylfrEMefzMCvt//I329kbVhx01o9CcywU8WfCO3WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N5Osi0aa+CbeShEqaHlKJY5wZo+F4aku0BuKH8iWEDk=;
 b=0xM99MuA1DZiSP82X8DvUioan9cb9rbQhRX8aFG5IrPteRxu0xmKsfYfKt9hiE2zig+DmNkoK/R0E787jj4N5H3ZFK6fYqyx1fIywRoxicR85L+v7ypdsRyaEh7lJjEYnMW4CO6kRqFwdvVMC/JTLLD6vLpHisT2G5jMIoUlEjHdLc/oQDtbqYZsuAN+Bmqx5n++RAyd9xDxatR2Bjivo1Hl7/kGWuCZIiGDh70BIhse27Ae/cBHMlNzocX0Nkp4Pl4/7P9q5Vp6TJR6mGgIHLoWNH4KThe3HPScn0pmr/K6XACABbZFQBIg/qKatgMkNSKgLLtI9AaaD1Ti9Rpd1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c32d8be8-75cf-78f8-304d-247b93b611cb@suse.com>
Date: Mon, 24 Jul 2023 16:11:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 2/2] xen/riscv: introduce identity mapping
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1690191480.git.oleksii.kurochko@gmail.com>
 <a8ab1829ab718dda869db3df3348ded211e81967.1690191480.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a8ab1829ab718dda869db3df3348ded211e81967.1690191480.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7738:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fc575c7-311c-4764-11ac-08db8c4fd888
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TnYZXvbBZ4bikZWMsjG7k+JLui/QICbQHsvuCoXieqxh0jVsyrY4a7JF56kZN3zE6BlQ4BFoG3h7/gBvNjCzTJyNkwShEkrQYX3NGzz2bQfMdEc4sq2JR18DPt89FyfpjSWkcx4LJMxDsS2j+mcbsF62Uu6/tCjHzu7I5aPGFYsX86ArR0HkGoQcChEIGGKfLZytF10ezs6nn4/b3g0w4M7jKORM3z/zs7JduW6zokSKvEGIht4DluHNuc5/cdfOR4+CCyPWmaJ99iY6f+LK09MB68G9xU/K7iDftQiawO5Qfuf30WBnU9rc7z00eL7LdFKwW8+vN5j9HCbC3B3CkpW1Md6o1mPSD0lCGIQHOy4U/PBvl8mk6raLdxnLIWYm+eIUeEsmfzIYcyLGTWCl4Z78N5GBf+0xPoqafLhkbrxgciO6/VCIBGCzgiVXBQVu37jls6TzBA2m3vSJWPYv81MY5dfD9RiOShXW+awBsXu5Qt36XB9om2UC7KmBp+NAdWloGoWoSDunHSjdRL4nTQT/CuATjzA8AN7K6BukbUmqJWE6rmYWkNNVKNccdrAkwObXsRl7kiq/EQjSW2+gQGFlfUUa1avHvQVD/iETDHfhw6VrQRlo/hbkN9+K8aqQxR0BNum+hpk/UQs8XC3BQw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(346002)(396003)(366004)(376002)(451199021)(6506007)(26005)(186003)(36756003)(5660300002)(31696002)(8936002)(8676002)(2906002)(53546011)(38100700002)(86362001)(6486002)(66476007)(66556008)(6512007)(66946007)(83380400001)(31686004)(54906003)(478600001)(41300700001)(2616005)(6916009)(4326008)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWVLTURiOFdaVS9ZWmEvdG41T1dkUStlUUxBQmdJdVhiRWNRTG5QSTczRWZU?=
 =?utf-8?B?VVhJRzgrcnN6YXp3WTJtem1ZZ3ViL1JTTWJLMnd1QXJ6aTNyUHlOeFhnaUQw?=
 =?utf-8?B?VW5NMXZudVhBWnBRV2VYdk45dGRxR2RKQ04vYnFTbkpZUkJSMm9RUWdpMkNC?=
 =?utf-8?B?UG1CTzYwS0RBZUxEMFg1L1FNSWNkaWhzUjVPL2REalU4Rjc3RTBLSndEa2R6?=
 =?utf-8?B?eDU1ekJwcG9lOHI3aFN5MG16Vkc0RktTRk5Ha25sOGlhMFo0QjFZOGtEMElN?=
 =?utf-8?B?Y2RKeXJ1aGV1UG5uZ1ZEKzk5ZDE4eWJBQTFEWGNYZm5ZdWFGZ0xBcGhWRFBw?=
 =?utf-8?B?dStEb0pBT3FzTnB3Y24rRVdrRjhVVmRiUkkrVFh3ZDFqT1ZrdEVrd2MzTzYv?=
 =?utf-8?B?QXJoTW5CblBDdmlqdGlTUCtaYU1nMXFTRUdsNmdIRXhSSnVjTXMreTdFQjRx?=
 =?utf-8?B?bUJhMkpjV2k5bHgrUGltejlITjdCNnpkYXVvRis2cXZRcmd4dmo5eVFqRE9Z?=
 =?utf-8?B?eWkrVEVTMDJIZDgveEpWb2V5MTI4Y3A5RDE1UzZlNVR4d0haZHNRUkpNTS9n?=
 =?utf-8?B?Rm1ybVlKN29pR29XVVlEbzJhSWFSWVBmL0krc2FWNGxuYVRmUFUyRVlWRTJj?=
 =?utf-8?B?cTRMcFFJT0dyb3YvQzNkcWJIMW4xM3ZQSXZMZG91M0Fja0xzd1ZDYmZFOUVU?=
 =?utf-8?B?Rm13bVVwTW1VQnVLejFPRmVDeGdBb1FXN0FCdWFRWjg4aXJOYkJLcHJ1aFVO?=
 =?utf-8?B?encwdlFEa2V1ZWRFdXp2bkFwNWtldzJDRUJ6ZUxKYk1NMkhzc1FBQmVuL01k?=
 =?utf-8?B?cTlaMlgzMnU4bWlFcGtIaUZ5MXN4U0JZd2U1Z3ZMdWtGaTZqdGlOK3BNUE56?=
 =?utf-8?B?dnVSUHI4QzhXV3hURkVXbk9GT0dmME9MNGR2bGhvSmNBRSthbEV1Rmk1TW9u?=
 =?utf-8?B?RzRRdjdlaVMrMEJ4Vk84VEdZeWZ6aytqY1dYRkh0eWdjQURhbWdXRkorRFhh?=
 =?utf-8?B?Wk9hVVhmSXVrVWFsRHZQMmVHSUVzVFJnU3llV1pNT0Fka0Fteko0dlFyK0Nh?=
 =?utf-8?B?TndtNU9pOUswWllqTElFSWZJMmxoRVZmOVluR0hvR0kveUdObGhzSFdZcER1?=
 =?utf-8?B?VmhIcVI0aGdmYjB5cUNxVkVOc0l0QVZBYUVlR1g5OFhKclpWYWtxSVd0NEg4?=
 =?utf-8?B?R2t6bU13M3I1RHpBRGxVMUx0bFhvUTQ0QlkrOUliS1lXODhRYnZKcXdnTFdT?=
 =?utf-8?B?eXRvUHZLYXlweGNRMHVNVnc5empFKy9uZThCTkxjM2wyeS9HL1RZZExkRFVa?=
 =?utf-8?B?UzNuU0tnVkRUNDJZVFI0alFndUNjRmNJUlpuMGk3amZ6TXo4NWx4ZDBOTzNE?=
 =?utf-8?B?SDRaTTNTSGhub2VWZks5NWM4NDAzU2xHeWpUVC9hblBBMkV4ekowSFlJL2Na?=
 =?utf-8?B?QVV6bGMrWERCcTV2TTNGeHVMc0E2Rm9tU1J4K1RWcmYwUVgvNnZ2WXVLQzNV?=
 =?utf-8?B?czdYVTFWK1EyRUV6MXlSU25jdmhqYW4vN0lFZ0tZVkpvaTdGNGFmc0E1SDlr?=
 =?utf-8?B?aWR3Q0lxRnQzYmIzVTdXNml0T2YzcmszMVhGdzJHQ0ZPTHpsWis0Unp0ZW9w?=
 =?utf-8?B?blZJNEVWMXdXWjJ2NXFhTlZOMDhISFZ3aUZxam1Pek9haTRZSXhmRzdTeTZN?=
 =?utf-8?B?SnZkeU1jTkxFaVVJcEFBMEpSUWlNZjV6aHJjNERPRnUyNXdjWDFhcWlxajVo?=
 =?utf-8?B?cmJSS2s5azh2N0dDOThWc3I5eW1UdXN4SmhxcnJJVzRPTnVISTdqQnhTR2tY?=
 =?utf-8?B?UTRxenM3Sk1lcnVZSUdyMktpRnM4Szgrb054SU9UU0k4Tm9ORVRUZ2Y2NXlX?=
 =?utf-8?B?TTd4U1hZN2FFelJ0cVdtazZhY2RtdnV6MUZHcThWZWxHSUxqUUlrS1NpRGxz?=
 =?utf-8?B?MDM4RGZ2M25OdGRtK0RPclJuYWxNdkR6WG5XZU9RcmNTeHUyeGMvaHZFWlQ2?=
 =?utf-8?B?V2U5NUhRUU1FSkJqQ2hlK2plZGJYRW03SHVCZHJrVHJsRUNqbnpBSGlPYXFl?=
 =?utf-8?B?VzlkUlY3UWUvRVhaTjkzR1hXMUtlOTlscUdTalUvbGxHQ1JlZDNUR1Y3WGxz?=
 =?utf-8?Q?WcwDDJGYnDTJmP1wkeVlba6db?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fc575c7-311c-4764-11ac-08db8c4fd888
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 14:11:16.7317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4oD3Lg43BaiKGxEwbtfmdwDoHPDgNFT+D8nBMjR/4zAjeqb0ag1slEqQHCn3siKOyP1hFflR16jW3ISD7l7cvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7738

On 24.07.2023 11:42, Oleksii Kurochko wrote:
> @@ -35,8 +36,10 @@ unsigned long __ro_after_init phys_offset;
>   *
>   * It might be needed one more page table in case when Xen load address
>   * isn't 2 MB aligned.
> + *
> + * CONFIG_PAGING_LEVELS page tables are needed for identity mapping.
>   */
> -#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) + 1)
> +#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) * 2) + 1

Comment addition and code change are at least apparently out of sync:
With such a comment and without thinking much one would expect the
constant to be bumped by CONFIG_PAGING_LEVELS. It is true that you
only need CONFIG_PAGING_LEVELS - 1, because the root table is shared,
but that would then be nice to also clarify in the comment. E.g.

"CONFIG_PAGING_LEVELS page tables are needed for the identity mapping,
 except that the root page table is shared with the initial mapping."

Also - where did the outermost pair of parentheses go? (Really you
don't need to parenthesize the multiplication, so the last closing
one can simply move last.)

> @@ -75,10 +78,11 @@ static void __init setup_initial_mapping(struct mmu_desc *mmu_desc,
>      unsigned int index;
>      pte_t *pgtbl;
>      unsigned long page_addr;
> +    bool is_identity_mapping = map_start == pa_start;
>  
> -    if ( (unsigned long)_start % XEN_PT_LEVEL_SIZE(0) )
> +    if ( !IS_ALIGNED((unsigned long)_start, KB(4)) )
>      {
> -        early_printk("(XEN) Xen should be loaded at 4k boundary\n");
> +        early_printk("(XEN) Xen should be loaded at 4KB boundary\n");

The change to the message looks unrelated.

> @@ -255,25 +261,44 @@ void __init noreturn noinline enable_mmu()
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
> +    static pte_t *pgtbl = stage1_pgtbl_root;
> +    static unsigned long load_start = XEN_VIRT_START;
> +    static unsigned int pt_level = CONFIG_PAGING_LEVELS - 1;

These all want to be __initdata, but personally I find this way of
recursing a little odd. Let's see what the maintainers say.

> +    unsigned long load_end = LINK_TO_LOAD(_end);
> +    unsigned long xen_size;
> +    unsigned long pt_level_size = XEN_PT_LEVEL_SIZE(pt_level);
> +    unsigned long pte_nums;
> +
> +    unsigned long virt_indx = pt_index(pt_level, XEN_VIRT_START);
> +    unsigned long indx;
> +
> +    if ( load_start == XEN_VIRT_START )
> +        load_start = LINK_TO_LOAD(_start);
> +
> +    xen_size = load_end - load_start;

When you come here recursively, don't you need to limit this
instance of the function to a single page table's worth of address
space (at the given level), using load_end only if that's yet
lower?

> +    pte_nums = ROUNDUP(xen_size, pt_level_size) / pt_level_size;
> +
> +    while ( pte_nums-- )
> +    {
> +        indx = pt_index(pt_level, load_start);
>  
> -    switch_stack_and_jump((unsigned long)cpu0_boot_stack + STACK_SIZE,
> -                          cont_after_mmu_is_enabled);
> +        if ( virt_indx != indx )
> +        {
> +            pgtbl[indx].pte = 0;
> +            load_start += XEN_PT_LEVEL_SIZE(pt_level);
> +        }
> +        else
> +        {
> +            pgtbl =  (pte_t *)LOAD_TO_LINK(pte_to_paddr(pgtbl[indx]));

Nit: Stray double blank.

> +            pt_level--;
> +            remove_identity_mapping();

Don't you need to restore pgtbl and pt_level here before the loop
can continue? And because of depending on load_start, which would
have moved, xen_size also needs suitably reducing, I think. Plus
pte_nums as well, since that in turn was calculated from xen_size.

Jan

