Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 272F54041C5
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 01:29:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182455.330057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mO70M-0003pk-MM; Wed, 08 Sep 2021 23:29:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182455.330057; Wed, 08 Sep 2021 23:29:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mO70M-0003nY-Ii; Wed, 08 Sep 2021 23:29:22 +0000
Received: by outflank-mailman (input) for mailman id 182455;
 Wed, 08 Sep 2021 23:29:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IK88=N6=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mO70L-0003nQ-HO
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 23:29:21 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9777562c-10fc-11ec-b18d-12813bfff9fa;
 Wed, 08 Sep 2021 23:29:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6E96260FDA;
 Wed,  8 Sep 2021 23:29:19 +0000 (UTC)
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
X-Inumbo-ID: 9777562c-10fc-11ec-b18d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631143759;
	bh=mGTIHxtsH3AVhxFFacA7WTV5cD6baIb/RYElMqmSSqw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KH1aFE/VHS6C4uJUtoa7uQapTlPEBmzNHCpuPKtry0l7gpIsDADDMBOQOKH/dyWOr
	 MBFiGZQ+bAT2mAGTq7GMPf57h/QuseXR0LA5SpJBKUYi0n0VaXHBjKUkEF4fldnIQb
	 kQQ0MHsKMF9ylJXzIUDPMEF4qm0mARTz+Xn4Qzvz2ysjqHvEOSdbGJteIGaa4fz92k
	 cEsyb4KIXx0+MaZp6esBlCDAD6ebtAvVTTBDT/uixwKqk4S5PinRTS9EkmiJog6Ted
	 hmooHvYyuE8GeFrF95Sb0JoYSfWjwoX55S763bydNc4QtjLURD7CX1dBZxMGZGflPP
	 pvcAjBMUZAwJw==
Date: Wed, 8 Sep 2021 16:29:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Penny Zheng <penny.zheng@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    Bertrand.Marquis@arm.com, Wei.Chen@arm.com, jbeulich@suse.com
Subject: Re: [PATCH v6 1/7] xen/arm: introduce new helper
 device_tree_get_meminfo
In-Reply-To: <20210908095248.545981-2-penny.zheng@arm.com>
Message-ID: <alpine.DEB.2.21.2109081628160.10523@sstabellini-ThinkPad-T480s>
References: <20210908095248.545981-1-penny.zheng@arm.com> <20210908095248.545981-2-penny.zheng@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 8 Sep 2021, Penny Zheng wrote:
> This commit creates a new helper device_tree_get_meminfo to iterate over a
> device tree property to get memory info, like "reg".
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/bootfdt.c | 83 ++++++++++++++++++++++++------------------
>  1 file changed, 47 insertions(+), 36 deletions(-)
> 
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index 476e32e0f5..b01badda3e 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -63,6 +63,52 @@ void __init device_tree_get_reg(const __be32 **cell, u32 address_cells,
>      *size = dt_next_cell(size_cells, cell);
>  }
>  
> +static int __init device_tree_get_meminfo(const void *fdt, int node,
> +                                          const char *prop_name,
> +                                          u32 address_cells, u32 size_cells,
> +                                          void *data)
> +{
> +    const struct fdt_property *prop;
> +    unsigned int i, banks;
> +    const __be32 *cell;
> +    u32 reg_cells = address_cells + size_cells;
> +    paddr_t start, size;
> +    struct meminfo *mem = data;
> +
> +    if ( address_cells < 1 || size_cells < 1 )
> +    {
> +        printk("fdt: property `%s': invalid #address-cells or #size-cells",
> +               prop_name);
> +        return -EINVAL;
> +    }
> +
> +    prop = fdt_get_property(fdt, node, prop_name, NULL);
> +    if ( !prop )
> +        return -ENOENT;
> +
> +    cell = (const __be32 *)prop->data;
> +    banks = fdt32_to_cpu(prop->len) / (reg_cells * sizeof (u32));
> +
> +    for ( i = 0; i < banks && mem->nr_banks < NR_MEM_BANKS; i++ )
> +    {
> +        device_tree_get_reg(&cell, address_cells, size_cells, &start, &size);
> +        /* Some DT may describe empty bank, ignore them */
> +        if ( !size )
> +            continue;
> +        mem->bank[mem->nr_banks].start = start;
> +        mem->bank[mem->nr_banks].size = size;
> +        mem->nr_banks++;
> +    }
> +
> +    if ( i < banks )
> +    {
> +        printk("Warning: Max number of supported memory regions reached.\n");
> +        return -ENOSPC;
> +    }
> +
> +    return 0;
> +}
> +
>  u32 __init device_tree_get_u32(const void *fdt, int node,
>                                 const char *prop_name, u32 dflt)
>  {
> @@ -139,42 +185,7 @@ static int __init process_memory_node(const void *fdt, int node,
>                                        u32 address_cells, u32 size_cells,
>                                        void *data)
>  {
> -    const struct fdt_property *prop;
> -    int i;
> -    int banks;
> -    const __be32 *cell;
> -    paddr_t start, size;
> -    u32 reg_cells = address_cells + size_cells;
> -    struct meminfo *mem = data;
> -
> -    if ( address_cells < 1 || size_cells < 1 )
> -    {
> -        printk("fdt: node `%s': invalid #address-cells or #size-cells",
> -               name);
> -        return -EINVAL;
> -    }
> -
> -    prop = fdt_get_property(fdt, node, "reg", NULL);
> -    if ( !prop )
> -        return -ENOENT;
> -
> -    cell = (const __be32 *)prop->data;
> -    banks = fdt32_to_cpu(prop->len) / (reg_cells * sizeof (u32));
> -
> -    for ( i = 0; i < banks && mem->nr_banks < NR_MEM_BANKS; i++ )
> -    {
> -        device_tree_get_reg(&cell, address_cells, size_cells, &start, &size);
> -        /* Some DT may describe empty bank, ignore them */
> -        if ( !size )
> -            continue;
> -        mem->bank[mem->nr_banks].start = start;
> -        mem->bank[mem->nr_banks].size = size;
> -        mem->nr_banks++;
> -    }
> -
> -    if ( i < banks )
> -        return -ENOSPC;
> -    return 0;
> +    return device_tree_get_meminfo(fdt, node, "reg", address_cells, size_cells, data);
>  }
>  
>  static int __init process_reserved_memory_node(const void *fdt, int node,
> -- 
> 2.25.1
> 

