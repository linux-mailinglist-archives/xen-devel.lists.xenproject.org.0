Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD49548E0A2
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 23:46:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257424.442268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n88rE-0003C5-21; Thu, 13 Jan 2022 22:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257424.442268; Thu, 13 Jan 2022 22:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n88rD-00039U-V4; Thu, 13 Jan 2022 22:46:11 +0000
Received: by outflank-mailman (input) for mailman id 257424;
 Thu, 13 Jan 2022 22:46:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4cYr=R5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n88rD-00039O-6c
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 22:46:11 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 953436f8-74c2-11ec-a563-1748fde96b53;
 Thu, 13 Jan 2022 23:46:02 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 474D0B823A1;
 Thu, 13 Jan 2022 22:46:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF422C36AE3;
 Thu, 13 Jan 2022 22:45:59 +0000 (UTC)
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
X-Inumbo-ID: 953436f8-74c2-11ec-a563-1748fde96b53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642113960;
	bh=YVmlwaeNOyjoloA3iD1BGD0fAFrQ9Oy9eAoweuRmdww=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NrnJJtrDz5eBbmQBPqEXGDr+yKf5FTHVP9h0ZkDEg/6L60z8tQmtfnhqu7NgzFGEo
	 7yoLW9npWjMV7WJP8jfBlAJ+5vt+qodOR5IwKwJeLE3RGNkZBCEtTFxlp4WitnIib8
	 ru9aSHzAmjSyEyb4eqP9/YwB8WMf6JjYWAuFcsLhCaU4MBgXKkaKjGNo99UqmbRW31
	 9ePrKb7PMOgM0xeLMAUeV9q1rDswhg8QJvRL+dtRjIc/V/IEIoOuuuicXocJBxj+Ua
	 ucDk6V/CO3adB6ZOL8y1aWozs5p73GrOcDDIeAvIB30E+nsuR3cQJnVQ3G/slY7o77
	 EQfM6zc6ssN9g==
Date: Thu, 13 Jan 2022 14:45:58 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <penny.zheng@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    Bertrand.Marquis@arm.com, Wei.Chen@arm.com
Subject: Re: [PATCH v4 04/11] xen/arm: introduce new helper parse_static_mem_prop
 and acquire_static_memory_bank
In-Reply-To: <20211220052123.969876-5-penny.zheng@arm.com>
Message-ID: <alpine.DEB.2.22.394.2201131441020.19362@ubuntu-linux-20-04-desktop>
References: <20211220052123.969876-1-penny.zheng@arm.com> <20211220052123.969876-5-penny.zheng@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 20 Dec 2021, Penny Zheng wrote:
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
> v4 changes:
> - use mfn_eq() instead, because it is the only value used to indicate
> there is an error and this is more lightweight than mfn_valid()
> ---
>  xen/arch/arm/domain_build.c | 100 +++++++++++++++++++++++-------------
>  1 file changed, 64 insertions(+), 36 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 5a106a977c..9206ec908d 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -509,12 +509,69 @@ static bool __init append_static_memory_to_bank(struct domain *d,
>      return true;
>  }
>  
> +static mfn_t __init acquire_static_memory_bank(struct domain *d,
> +                                             const __be32 **cell,
> +                                             u32 addr_cells, u32 size_cells,
> +                                             paddr_t *pbase, paddr_t *psize)

NIT: we usually align the parameters:

static mfn_t __init acquire_static_memory_bank(struct domain *d,
                                               const __be32 **cell,
                                               u32 addr_cells, u32 size_cells,
                                               paddr_t *pbase, paddr_t *psize)

with that addressed:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


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
>  /* Allocate memory from static memory as RAM for one specific domain d. */
>  static void __init allocate_static_memory(struct domain *d,
>                                            struct kernel_info *kinfo,
>                                            const struct dt_device_node *node)
>  {
> -    const struct dt_property *prop;
>      u32 addr_cells, size_cells, reg_cells;
>      unsigned int nr_banks, gbank, bank = 0;
>      const uint64_t rambase[] = GUEST_RAM_BANK_BASES;
> @@ -523,24 +580,10 @@ static void __init allocate_static_memory(struct domain *d,
>      u64 tot_size = 0;
>      paddr_t pbase, psize, gsize;
>      mfn_t smfn;
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
>          goto fail;
> -    }
>      reg_cells = addr_cells + size_cells;
>  
>      /*
> @@ -551,29 +594,14 @@ static void __init allocate_static_memory(struct domain *d,
>      gbank = 0;
>      gsize = ramsize[gbank];
>      kinfo->mem.bank[gbank].start = rambase[gbank];
> -
> -    cell = (const __be32 *)prop->value;
> -    nr_banks = (prop->length) / (reg_cells * sizeof (u32));
> +    nr_banks = length / (reg_cells * sizeof (u32));
>  
>      for ( ; bank < nr_banks; bank++ )
>      {
> -        device_tree_get_reg(&cell, addr_cells, size_cells, &pbase, &psize);
> -        ASSERT(IS_ALIGNED(pbase, PAGE_SIZE) && IS_ALIGNED(psize, PAGE_SIZE));
> -
> -        if ( PFN_DOWN(psize) > UINT_MAX )
> -        {
> -            printk(XENLOG_ERR "%pd: static memory size too large: %#"PRIpaddr,
> -                   d, psize);
> +        smfn = acquire_static_memory_bank(d, &cell, addr_cells, size_cells,
> +                                          &pbase, &psize);
> +        if ( mfn_eq(smfn, INVALID_MFN) )
>              goto fail;
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
>          printk(XENLOG_INFO "%pd: STATIC BANK[%u] %#"PRIpaddr"-%#"PRIpaddr"\n",
>                 d, bank, pbase, pbase + psize);
> -- 
> 2.25.1
> 

