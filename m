Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B85D73FD60E
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 10:57:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176127.320579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLM3S-0008Dh-Bd; Wed, 01 Sep 2021 08:57:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176127.320579; Wed, 01 Sep 2021 08:57:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLM3S-0008Bs-8J; Wed, 01 Sep 2021 08:57:10 +0000
Received: by outflank-mailman (input) for mailman id 176127;
 Wed, 01 Sep 2021 08:57:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mLM3Q-0008B1-Qz
 for xen-devel@lists.xenproject.org; Wed, 01 Sep 2021 08:57:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mLM3Q-0006Nv-JV; Wed, 01 Sep 2021 08:57:08 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mLM3Q-0002oP-Dk; Wed, 01 Sep 2021 08:57:08 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=2woEMNGAqbi5v4Yljw72/vRg6uMvPADMrGXsyYLrLmw=; b=J9cM7gqPONS5y8YD0FxhRvcIPi
	g0BV1hy5ajvTmAV8hx3an+GHQCZ+6De3d2cnAvR3axjZeZwxGWyvMaXWvN9a7zpUs5VwXJscYUC63
	6S+nSyUe76tBDSXtlEgEVitWQnWZnK7rTRExmZrjtTlMZNQzxvusI/cKumZRDSlYHNns=;
Subject: Re: [PATCH v5 1/7] xen/arm: introduce new helper
 device_tree_get_meminfo
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com
References: <20210824095045.2281500-1-penny.zheng@arm.com>
 <20210824095045.2281500-2-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <06395a17-24fb-35d5-8332-a6ca42dbc183@xen.org>
Date: Wed, 1 Sep 2021 09:57:06 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210824095045.2281500-2-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Penny,

On 24/08/2021 10:50, Penny Zheng wrote:
> A few functions iterate over the device tree property to get memory info,
> like "reg" or the later "xen,static-mem", so this commit creates a new helper
> device_tree_get_meminfo to extract the common codes.

The commit message needs to be updated as the patch has been reshuffled.

> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>   xen/arch/arm/bootfdt.c | 68 ++++++++++++++++++++++++------------------
>   1 file changed, 39 insertions(+), 29 deletions(-)
> 
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index 476e32e0f5..8c81be3379 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -63,6 +63,44 @@ void __init device_tree_get_reg(const __be32 **cell, u32 address_cells,
>       *size = dt_next_cell(size_cells, cell);
>   }
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
> +    return 0;
> +}
> +
>   u32 __init device_tree_get_u32(const void *fdt, int node,
>                                  const char *prop_name, u32 dflt)
>   {
> @@ -139,14 +177,6 @@ static int __init process_memory_node(const void *fdt, int node,
>                                         u32 address_cells, u32 size_cells,
>                                         void *data)
>   {
> -    const struct fdt_property *prop;
> -    int i;
> -    int banks;
> -    const __be32 *cell;
> -    paddr_t start, size;
> -    u32 reg_cells = address_cells + size_cells;
> -    struct meminfo *mem = data;
> -
>       if ( address_cells < 1 || size_cells < 1 )

This check will be the same for "xen,static-mem". So can it be moved to 
device_tree_get_meminfo()?

>       {
>           printk("fdt: node `%s': invalid #address-cells or #size-cells",
> @@ -154,27 +184,7 @@ static int __init process_memory_node(const void *fdt, int node,
>           return -EINVAL;
>       }
>   
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
>   }
>   
>   static int __init process_reserved_memory_node(const void *fdt, int node,
> 

Cheers,

-- 
Julien Grall

