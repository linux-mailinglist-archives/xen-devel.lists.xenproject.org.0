Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B6D4DD2B3
	for <lists+xen-devel@lfdr.de>; Fri, 18 Mar 2022 03:00:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291825.495607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nV1uc-0002sA-J8; Fri, 18 Mar 2022 02:00:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291825.495607; Fri, 18 Mar 2022 02:00:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nV1uc-0002q8-Fk; Fri, 18 Mar 2022 02:00:18 +0000
Received: by outflank-mailman (input) for mailman id 291825;
 Fri, 18 Mar 2022 02:00:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3xU5=T5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nV1ub-0008RA-3z
 for xen-devel@lists.xenproject.org; Fri, 18 Mar 2022 02:00:17 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 279cd4aa-a65f-11ec-853c-5f4723681683;
 Fri, 18 Mar 2022 03:00:16 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5628BB820EE;
 Fri, 18 Mar 2022 02:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1E64C340E9;
 Fri, 18 Mar 2022 02:00:13 +0000 (UTC)
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
X-Inumbo-ID: 279cd4aa-a65f-11ec-853c-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647568814;
	bh=Lnk7Z5Z75/4vwf7YjhuOVNKBvM+ByHJkRUtEx89jWCY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hZGJFL3FKDRKsa5uq9j6Ex9QfwAP2r4AyJYizYrmTacUuh62/lKmoCcGlw+soMhwh
	 Udm0e1Em7I/o4ORLeJveRJx/mDcGF6fnNteD9PuI0yS1Wnq4nBi4zaYBipfKaO95R+
	 0dEZA/M8vqTIiJQ7EvwXa8aBq0kLhOjx6KPsvCZl0Py6XnYoHZ8ITdOH8oXpACCFXI
	 Xs/jLpYX1jxFQW9RWJOEDiCoV2AjhkPFqysej2U8aujSu3Rw9dAD1FAt8gI7oabmbd
	 gGe9/HyFstGwd7T07b0a94K1fyL4pHcOwuAag7DutFiT1dcKPH6Nm6HUJesOBvd2D1
	 a3UWTg9GHNAZQ==
Date: Thu, 17 Mar 2022 19:00:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@arm.com>
cc: xen-devel@lists.xenproject.org, nd@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 07/13] xen/arm: create shared memory nodes in guest
 device tree
In-Reply-To: <20220311061123.1883189-8-Penny.Zheng@arm.com>
Message-ID: <alpine.DEB.2.22.394.2203171807510.3497@ubuntu-linux-20-04-desktop>
References: <20220311061123.1883189-1-Penny.Zheng@arm.com> <20220311061123.1883189-8-Penny.Zheng@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 11 Mar 2022, Penny Zheng wrote:
> From: Penny Zheng <penny.zheng@arm.com>
> 
> We expose the shared memory to the domU using the "xen,shared-memory-v1"
> reserved-memory binding. See
> Documentation/devicetree/bindings/reserved-memory/xen,shared-memory.txt
> in Linux for the corresponding device tree binding.
> 
> To save the cost of re-parsing shared memory device tree configuration when
> creating shared memory nodes in guest device tree, this commit adds new field
> "shm_mem" to store shm-info per domain.
> 
> For each shared memory region, a range is exposed under
> the /reserved-memory node as a child node. Each range sub-node is
> named xen-shmem@<address> and has the following properties:
> - compatible:
>         compatible = "xen,shared-memory-v1"
> - reg:
>         the base guest physical address and size of the shared memory region
> - xen,id:
>         a string that identifies the shared memory region.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>  xen/arch/arm/domain_build.c       | 144 ++++++++++++++++++++++++++++++
>  xen/arch/arm/include/asm/domain.h |   1 +
>  xen/arch/arm/include/asm/setup.h  |   3 +
>  3 files changed, 148 insertions(+)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 8cee5ffbd1..997df46ddd 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -840,6 +840,28 @@ static int __init guest_physmap_add_shm(struct domain *od, struct domain *bd,
>      return ret;
>  }
>  
> +static int __init append_shm_bank_to_domain(struct domain *d,
> +                                            paddr_t start, paddr_t size,
> +                                            u32 shm_id)
> +{
> +    /* Allocate memory at first insertion. */
> +    if ( d->arch.shm_mem == NULL )
> +    {
> +        d->arch.shm_mem = xmalloc_bytes(sizeof(struct meminfo));
> +        if ( d->arch.shm_mem == NULL )
> +            return -ENOMEM;
> +
> +        memset(d->arch.shm_mem, 0, sizeof(struct meminfo));

_xzalloc ?


> +    }
> +
> +    d->arch.shm_mem->bank[d->arch.shm_mem->nr_banks].start = start;
> +    d->arch.shm_mem->bank[d->arch.shm_mem->nr_banks].size = size;
> +    d->arch.shm_mem->bank[d->arch.shm_mem->nr_banks].shm_id = shm_id;
> +    d->arch.shm_mem->nr_banks++;
> +
> +    return 0;
> +}
> +
>  static int __init process_shm(struct domain *d,
>                                const struct dt_device_node *node)
>  {
> @@ -907,6 +929,14 @@ static int __init process_shm(struct domain *d,
>                                      PFN_DOWN(gbase), PFN_DOWN(psize));
>          if ( ret )
>              return ret;
> +
> +        /*
> +         * Record static shared memory region info for later setting
> +         * up shm-node in guest device tree.
> +         */
> +        ret = append_shm_bank_to_domain(d, gbase, psize, shm_id);
> +        if ( ret )
> +            return ret;
>      }
>  
>      return 0;
> @@ -1237,6 +1267,115 @@ static int __init make_memory_node(const struct domain *d,
>      return res;
>  }
>  
> +#ifdef CONFIG_STATIC_SHM
> +static int __init make_shm_memory_node(const struct domain *d,
> +                                       void *fdt,
> +                                       int addrcells, int sizecells,
> +                                       struct meminfo *mem)
> +{
> +    unsigned long i = 0;
> +    int res = 0;
> +    int reg_size = addrcells + sizecells;
> +
> +    if ( mem->nr_banks == 0 )
> +        return -ENOENT;
> +
> +    /*
> +     * For each shared memory region, a range is exposed under
> +     * the /reserved-memory node as a child node. Each range sub-node is
> +     * named xen-shmem@<address>.
> +     */
> +    dt_dprintk("Create xen-shmem node\n");
> +
> +    for ( ; i < mem->nr_banks; i++ )
> +    {
> +        u64 start = mem->bank[i].start;
> +        u64 size = mem->bank[i].size;
> +        u32 shm_id = mem->bank[i].shm_id;

Wasn't shm_id supposed to be u8?


> +        /* Placeholder for xen-shmem@ + a 64-bit number + \0 */
> +        char buf[27];
> +        const char compat[] = "xen,shared-memory-v1";
> +        __be32 *reg, *cells;
> +       unsigned int len;

alignment


> +        snprintf(buf, sizeof(buf), "xen-shmem@%"PRIx64, mem->bank[i].start);
> +        res = fdt_begin_node(fdt, buf);
> +        if ( res )
> +            return res;
> +
> +        res = fdt_property(fdt, "compatible", compat, sizeof(compat));
> +        if ( res )
> +            return res;
> +
> +       len = reg_size * sizeof(__be32);

alignment


> +        reg = xmalloc_bytes(len);

This is the same size for each bank. I think it is better as a local
variable on the stack.


> +        if ( reg == NULL )
> +            return -ENOMEM;
> +        cells = reg;
> +
> +        dt_child_set_range(&cells, addrcells, sizecells, start, size);
> +
> +        res = fdt_property(fdt, "reg", reg, len);
> +        xfree(reg);
> +        if (res)
> +            return res;
> +
> +        dt_dprintk("Shared memory bank %lu: %#"PRIx64"->%#"PRIx64"\n",
> +                   i, start, start + size);
> +
> +        res = fdt_property_cell(fdt, "xen,id", shm_id);
> +        if (res)
> +            return res;
> +
> +        res = fdt_end_node(fdt);
> +        if (res)
> +            return res;
> +    }
> +
> +    return res;
> +}
> +#else
> +static int __init make_shm_memory_node(const struct domain *d,
> +                                       void *fdt,
> +                                       int addrcells, int sizecells,
> +                                       struct meminfo *mem)
> +{
> +    ASSERT_UNREACHABLE();
> +}
> +#endif
> +
> +static int __init make_resv_memory_node(const struct domain *d,
> +                                        void *fdt,
> +                                        int addrcells, int sizecells,
> +                                        struct meminfo *mem)
> +{
> +    int res = 0;
> +    /* Placeholder for reserved-memory\0 */
> +    char resvbuf[16] = "reserved-mem";

The node is called "reserved-memory", why did you initialize it to
"reserved-mem" instead?


> +    if ( mem == NULL )
> +        /* No shared memory provided. */
> +        return 0;
> +
> +    dt_dprintk("Create reserved-memory node\n");
> +
> +    res = fdt_begin_node(fdt, resvbuf);
> +    if ( res )
> +        return res;
> +
> +    res = fdt_property(fdt, "ranges", NULL, 0);
> +    if ( res )
> +        return res;

We should also add #address-cells and #size-cells properties


> +
> +    res = make_shm_memory_node(d, fdt, addrcells, sizecells, mem);
> +    if ( res )
> +        return res;
> +
> +    res = fdt_end_node(fdt);
> +
> +    return res;
> +}
> +
>  static int __init add_ext_regions(unsigned long s, unsigned long e, void *data)
>  {
>      struct meminfo *ext_regions = data;
> @@ -2974,6 +3113,11 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>      if ( ret )
>          goto err;
>  
> +    ret = make_resv_memory_node(d, kinfo->fdt, addrcells, sizecells,
> +                                d->arch.shm_mem);
> +    if ( ret )
> +        goto err;
> +
>      /*
>       * domain_handle_dtb_bootmodule has to be called before the rest of
>       * the device tree is generated because it depends on the value of
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index ea7a7219a3..6df37d2c46 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -110,6 +110,7 @@ struct arch_domain
>  #endif
>  
>      bool directmap;
> +    struct meminfo *shm_mem;
>  }  __cacheline_aligned;
>  
>  struct arch_vcpu
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index 7a1e1d6798..b6ff04889c 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -27,6 +27,9 @@ struct membank {
>      paddr_t start;
>      paddr_t size;
>      bool xen_domain; /* whether the memory bank is bound to a Xen domain. */
> +#ifdef CONFIG_STATIC_SHM
> +    u32 shm_id ;     /* ID identifier of a static shared memory bank. */
> +#endif

No need to be u32 considering that the field is u8. In any case, this is
an internal Xen header so we would use uint8_t.


>  };
>  
>  struct meminfo {
> -- 
> 2.25.1
> 

