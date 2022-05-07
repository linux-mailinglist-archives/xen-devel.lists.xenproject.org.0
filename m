Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 717BD51E2F3
	for <lists+xen-devel@lfdr.de>; Sat,  7 May 2022 03:17:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323505.545208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nn943-0000ip-Bp; Sat, 07 May 2022 01:16:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323505.545208; Sat, 07 May 2022 01:16:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nn943-0000hM-4g; Sat, 07 May 2022 01:16:55 +0000
Received: by outflank-mailman (input) for mailman id 323505;
 Sat, 07 May 2022 01:16:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DtL8=VP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nn8ws-0004gy-QB
 for xen-devel@lists.xenproject.org; Sat, 07 May 2022 01:09:30 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5826c5b8-cda2-11ec-8fc4-03012f2f19d4;
 Sat, 07 May 2022 03:09:29 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 97C7961D48;
 Sat,  7 May 2022 01:09:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A96B7C385A8;
 Sat,  7 May 2022 01:09:27 +0000 (UTC)
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
X-Inumbo-ID: 5826c5b8-cda2-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651885768;
	bh=7mxKR5V7yjX3pVVFvNZXazmwCrgjUR55tn8aB+Zr22k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Dz+pjQijuVNFVy8qYnrNBUTfi7/3tc/jjqHafn5hykgYBNLDZnUZQN0sKHVXzH9/Z
	 p63LHDg44uOhJ84GBqHZcMg3ABtXrIe2qP+5svrdzULN9zBUQdAF18X0WQH/5j/rGK
	 TYRwnOu/mS9couoGW8CZ6iSsuAJGZLdTSCICxcqqa5S704KAnrcUsU/o+2TrXyI58q
	 KplDzN1rniVcrGH5Gv0GSiIZYz6xgulzpxED5NdLVMSGSv6pWdBH0Na33eyOBt3fOJ
	 o2fSGx2B6j4UNFbyulU8OFz02eNxABovUMfu4UJ5e/KI9UlQgxgOhBpMT0aoQu6zzN
	 UFuuVY8EZ9/GA==
Date: Fri, 6 May 2022 18:09:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@arm.com>
cc: xen-devel@lists.xenproject.org, wei.chen@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 8/9] xen/arm: create shared memory nodes in guest
 device tree
In-Reply-To: <20220506072502.2177828-9-Penny.Zheng@arm.com>
Message-ID: <alpine.DEB.2.22.394.2205061750400.43560@ubuntu-linux-20-04-desktop>
References: <20220506072502.2177828-1-Penny.Zheng@arm.com> <20220506072502.2177828-9-Penny.Zheng@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 6 May 2022, Penny Zheng wrote:
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
> v2 change:
> - using xzalloc
> - shm_id should be uint8_t
> - make reg a local variable
> - add #address-cells and #size-cells properties
> - fix alignment
> ---
>  xen/arch/arm/domain_build.c       | 144 ++++++++++++++++++++++++++++++
>  xen/arch/arm/include/asm/domain.h |   1 +
>  xen/arch/arm/include/asm/setup.h  |   1 +
>  3 files changed, 146 insertions(+)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 8d299a3616..f08606d2c0 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -894,6 +894,26 @@ static int __init allocate_shared_memory(struct domain *d,
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
> +        d->arch.shm_mem = xzalloc(struct meminfo);
> +        if ( d->arch.shm_mem == NULL )
> +            return -ENOMEM;
> +    }
> +
> +    d->arch.shm_mem->bank[d->arch.shm_mem->nr_banks].start = start;
> +    d->arch.shm_mem->bank[d->arch.shm_mem->nr_banks].size = size;
> +    d->arch.shm_mem->bank[d->arch.shm_mem->nr_banks].shm_id = shm_id;
> +    d->arch.shm_mem->nr_banks++;
> +
> +    return 0;
> +}

Can we call xfree(d->arch.shm_mem) at domain destruction?

Even better, we might be able to call it earlier, soon after the
make_resv_memory_node() call because we don't need it any longer after
that?


>  static int __init process_shm(struct domain *d,
>                                const struct dt_device_node *node)
>  {
> @@ -975,6 +995,14 @@ static int __init process_shm(struct domain *d,
>              if ( ret )
>                  return ret;
>          }
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
> @@ -1305,6 +1333,117 @@ static int __init make_memory_node(const struct domain *d,
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
> +        uint64_t start = mem->bank[i].start;
> +        uint64_t size = mem->bank[i].size;
> +        uint8_t shm_id = mem->bank[i].shm_id;
> +        /* Placeholder for xen-shmem@ + a 64-bit number + \0 */
> +        char buf[27];
> +        const char compat[] = "xen,shared-memory-v1";
> +        __be32 reg[4];
> +        __be32 *cells;
> +        unsigned int len = (addrcells + sizecells) * sizeof(__be32);
> +
> +        snprintf(buf, sizeof(buf), "xen-shmem@%"PRIx64, mem->bank[i].start);
> +        res = fdt_begin_node(fdt, buf);
> +        if ( res )
> +            return res;
> +
> +        res = fdt_property(fdt, "compatible", compat, sizeof(compat));
> +        if ( res )
> +            return res;
> +
> +        cells = reg;
> +        dt_child_set_range(&cells, addrcells, sizecells, start, size);
> +
> +        res = fdt_property(fdt, "reg", reg, len);
> +        if ( res )
> +            return res;
> +
> +        dt_dprintk("Shared memory bank %lu: %#"PRIx64"->%#"PRIx64"\n",
> +                   i, start, start + size);
> +
> +        res = fdt_property_cell(fdt, "xen,id", shm_id);
> +        if ( res )
> +            return res;
> +
> +        res = fdt_end_node(fdt);
> +        if ( res )
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
> +    char resvbuf[16] = "reserved-memory";
> +
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
> +
> +    res = fdt_property_cell(fdt, "#address-cells", addrcells);
> +    if ( res )
> +        return res;
> +
> +    res = fdt_property_cell(fdt, "#size-cells", sizecells);
> +    if ( res )
> +        return res;
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
> @@ -3041,6 +3180,11 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
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
> index ed63c2b6f9..d0d1e12cfe 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -104,6 +104,7 @@ struct arch_domain
>  #endif
>  
>      bool directmap;
> +    struct meminfo *shm_mem;
>  }  __cacheline_aligned;
>  
>  struct arch_vcpu
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index 38e02ced36..b5909acf68 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -29,6 +29,7 @@ struct membank {
>      bool xen_domain; /* whether the memory bank is bound to a Xen domain. */
>  #ifdef CONFIG_STATIC_SHM
>      unsigned long nr_shm_domain;
> +    uint8_t shm_id ; /* ID identifier of a static shared memory bank. */
>  #endif
>  };
>  
> -- 
> 2.25.1
> 

