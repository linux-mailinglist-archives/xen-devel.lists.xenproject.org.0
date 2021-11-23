Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64ECD45AA1A
	for <lists+xen-devel@lfdr.de>; Tue, 23 Nov 2021 18:29:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229872.397466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpZbV-0006w3-Pc; Tue, 23 Nov 2021 17:29:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229872.397466; Tue, 23 Nov 2021 17:29:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpZbV-0006tJ-Ld; Tue, 23 Nov 2021 17:29:13 +0000
Received: by outflank-mailman (input) for mailman id 229872;
 Tue, 23 Nov 2021 17:29:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mpZbT-0006tD-Sp
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 17:29:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mpZbT-0000Kf-KN; Tue, 23 Nov 2021 17:29:11 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.23.209]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mpZbT-0006RU-Df; Tue, 23 Nov 2021 17:29:11 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=CBFv2Bp2OU2+W3vAWQifjM1fpqfhreWE5CNCSHKUI5k=; b=obLbbZH4/Jd1zYWAOyaAc3LUuA
	tWAgZiO1qdS+F9g4HW4doKKoGCpHE67QE7BRwJQ9/1VRFILd+KxMBnOfmPeMDt1ECe0Hf+1C1jreR
	26mqw28x8JZFWf9pqhNH3PRdC3S5O5jF0FA0QmAdq/F5MKkbUccXPmVkd6oCrkP61i6c=;
Message-ID: <ab241d33-89bf-c429-9022-b6185c34a16c@xen.org>
Date: Tue, 23 Nov 2021 17:29:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [PATCH v3 03/10] xen/arm: introduce new helper
 parse_static_mem_prop and acquire_static_memory_bank
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com
References: <20211116063155.901183-1-penny.zheng@arm.com>
 <20211116063155.901183-4-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211116063155.901183-4-penny.zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 16/11/2021 06:31, Penny Zheng wrote:
> Later, we will introduce allocate_static_memory_11 for allocating static
> memory for direct-map domains, and it will share a lot common codes with
> the existing allocate_static_memory.
> 
> In order not to bring a lot of duplicate codes, and also to make the whole
> code more readable, this commit extracts common codes into two new helpers
> parse_static_mem_prop and acquire_static_memory_bank.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> v3 changes:
> - new commit to move the split off of the code outside in a separate patch
> ---
>   xen/arch/arm/domain_build.c | 100 +++++++++++++++++++++++-------------
>   1 file changed, 64 insertions(+), 36 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 7a063f62fe..1dc728e848 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -515,12 +515,69 @@ static bool __init append_static_memory_to_bank(struct domain *d,
>       return true;
>   }
>   
> +static mfn_t __init acquire_static_memory_bank(struct domain *d,
> +                                             const __be32 **cell,
> +                                             u32 addr_cells, u32 size_cells,
> +                                             paddr_t *pbase, paddr_t *psize)
> +{
> +    mfn_t smfn;
> +    int res;
> +
> +    device_tree_get_reg(cell, addr_cells, size_cells, pbase, psize);
> +    ASSERT(IS_ALIGNED(*pbase, PAGE_SIZE) && IS_ALIGNED(*psize, PAGE_SIZE));
> +    if ( PFN_DOWN(*psize) > UINT_MAX )
> +    {
> +        printk(XENLOG_ERR "%pd: static memory size too large: %#"PRIpaddr,
> +               d, *psize);
> +        return INVALID_MFN;
> +    }
> +
> +    smfn = maddr_to_mfn(*pbase);
> +    res = acquire_domstatic_pages(d, smfn, PFN_DOWN(*psize), 0);
> +    if ( res )
> +    {
> +        printk(XENLOG_ERR
> +               "%pd: failed to acquire static memory: %d.\n", d, res);
> +        return INVALID_MFN;
> +    }
> +
> +    return smfn;
> +}
> +
> +static int __init parse_static_mem_prop(const struct dt_device_node *node,
> +                                        u32 *addr_cells, u32 *size_cells,
> +                                        int *length, const __be32 **cell)
> +{
> +    const struct dt_property *prop;
> +
> +    prop = dt_find_property(node, "xen,static-mem", NULL);
> +    if ( !dt_property_read_u32(node, "#xen,static-mem-address-cells",
> +                               addr_cells) )
> +    {
> +        printk(XENLOG_ERR
> +               "failed to read \"#xen,static-mem-address-cells\".\n");
> +        return -EINVAL;
> +    }
> +
> +    if ( !dt_property_read_u32(node, "#xen,static-mem-size-cells",
> +                               size_cells) )
> +    {
> +        printk(XENLOG_ERR
> +               "failed to read \"#xen,static-mem-size-cells\".\n");
> +        return -EINVAL;
> +    }
> +
> +    *cell = (const __be32 *)prop->value;
> +    *length = prop->length;
> +
> +    return 0;
> +}
> +
>   /* Allocate memory from static memory as RAM for one specific domain d. */
>   static void __init allocate_static_memory(struct domain *d,
>                                             struct kernel_info *kinfo,
>                                             const struct dt_device_node *node)
>   {
> -    const struct dt_property *prop;
>       u32 addr_cells, size_cells, reg_cells;
>       unsigned int nr_banks, gbank, bank = 0;
>       const uint64_t rambase[] = GUEST_RAM_BANK_BASES;
> @@ -529,24 +586,10 @@ static void __init allocate_static_memory(struct domain *d,
>       u64 tot_size = 0;
>       paddr_t pbase, psize, gsize;
>       mfn_t smfn;
> -    int res;
> -
> -    prop = dt_find_property(node, "xen,static-mem", NULL);
> -    if ( !dt_property_read_u32(node, "#xen,static-mem-address-cells",
> -                               &addr_cells) )
> -    {
> -        printk(XENLOG_ERR
> -               "%pd: failed to read \"#xen,static-mem-address-cells\".\n", d);
> -        goto fail;
> -    }
> +    int length;
>   
> -    if ( !dt_property_read_u32(node, "#xen,static-mem-size-cells",
> -                               &size_cells) )
> -    {
> -        printk(XENLOG_ERR
> -               "%pd: failed to read \"#xen,static-mem-size-cells\".\n", d);
> +    if ( parse_static_mem_prop(node, &addr_cells, &size_cells, &length, &cell) )
>           goto fail;
> -    }
>       reg_cells = addr_cells + size_cells;
>   
>       /*
> @@ -557,29 +600,14 @@ static void __init allocate_static_memory(struct domain *d,
>       gbank = 0;
>       gsize = ramsize[gbank];
>       kinfo->mem.bank[gbank].start = rambase[gbank];
> -
> -    cell = (const __be32 *)prop->value;
> -    nr_banks = (prop->length) / (reg_cells * sizeof (u32));
> +    nr_banks = length / (reg_cells * sizeof (u32));
>   
>       for ( ; bank < nr_banks; bank++ )
>       {
> -        device_tree_get_reg(&cell, addr_cells, size_cells, &pbase, &psize);
> -        ASSERT(IS_ALIGNED(pbase, PAGE_SIZE) && IS_ALIGNED(psize, PAGE_SIZE));
> -
> -        if ( PFN_DOWN(psize) > UINT_MAX )
> -        {
> -            printk(XENLOG_ERR "%pd: static memory size too large: %#"PRIpaddr,
> -                   d, psize);
> +        smfn = acquire_static_memory_bank(d, &cell, addr_cells, size_cells,
> +                                          &pbase, &psize);
> +        if ( !mfn_valid(smfn) )

I would use mfn_eq(mfn, INVALID_MFN) because this is the only value used 
to indicate there is an error and this is more lightweight than mfn_valid().

>               goto fail;
> -        }
> -        smfn = maddr_to_mfn(pbase);
> -        res = acquire_domstatic_pages(d, smfn, PFN_DOWN(psize), 0);
> -        if ( res )
> -        {
> -            printk(XENLOG_ERR
> -                   "%pd: failed to acquire static memory: %d.\n", d, res);
> -            goto fail;
> -        }
>   
>           printk(XENLOG_INFO "%pd: STATIC BANK[%u] %#"PRIpaddr"-%#"PRIpaddr"\n",
>                  d, bank, pbase, pbase + psize);
> 

Cheers,

-- 
Julien Grall

