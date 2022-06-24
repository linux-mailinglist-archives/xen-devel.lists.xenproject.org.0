Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7F055A1CC
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 21:30:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355864.583807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4p0Q-000810-Pv; Fri, 24 Jun 2022 19:30:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355864.583807; Fri, 24 Jun 2022 19:30:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4p0Q-0007zE-Mq; Fri, 24 Jun 2022 19:30:14 +0000
Received: by outflank-mailman (input) for mailman id 355864;
 Fri, 24 Jun 2022 19:30:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o4p0P-0007z8-PS
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 19:30:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4p0P-0006As-HM; Fri, 24 Jun 2022 19:30:13 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238] helo=[192.168.4.76])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4p0P-0000gp-Bj; Fri, 24 Jun 2022 19:30:13 +0000
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
	bh=wkyiEZEDmm24IGcBliVvx06/FI5j+95uuo4cUEmfNdE=; b=HE+EJ+AyXi3A4rPVKy2Io2ptW/
	8BT//VPpK4CNnOZmLjtrE5FOEumuBJSRTn8fzVhqjC7QJshs/Ly2RJGiIyjcvttI54GOCahP++Sd3
	ccz0g3uXEHfp78srQqBVPceIycpW+3wlnxbdrku9oEIyk77q1d6O4FTfRohk14yAqrkU=;
Message-ID: <84641d6e-202d-934c-9ea9-bbf090e29bdb@xen.org>
Date: Fri, 24 Jun 2022 20:30:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v5 7/8] xen/arm: create shared memory nodes in guest
 device tree
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220620051114.210118-1-Penny.Zheng@arm.com>
 <20220620051114.210118-8-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220620051114.210118-8-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 20/06/2022 06:11, Penny Zheng wrote:
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
>          compatible = "xen,shared-memory-v1"
> - reg:
>          the base guest physical address and size of the shared memory region
> - xen,id:
>          a string that identifies the shared memory region.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
> v5 change:
> - no change
> ---
> v4 change:
> - no change
> ---
> v3 change:
> - move field "shm_mem" to kernel_info
> ---
> v2 change:
> - using xzalloc
> - shm_id should be uint8_t
> - make reg a local variable
> - add #address-cells and #size-cells properties
> - fix alignment
> ---
>   xen/arch/arm/domain_build.c       | 143 +++++++++++++++++++++++++++++-
>   xen/arch/arm/include/asm/kernel.h |   1 +
>   xen/arch/arm/include/asm/setup.h  |   1 +
>   3 files changed, 143 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 1584e6c2ce..4d62440a0e 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -900,7 +900,22 @@ static int __init allocate_shared_memory(struct domain *d,
>       return ret;
>   }
>   
> -static int __init process_shm(struct domain *d,
> +static int __init append_shm_bank_to_domain(struct kernel_info *kinfo,
> +                                            paddr_t start, paddr_t size,
> +                                            u32 shm_id)
> +{
> +    if ( (kinfo->shm_mem.nr_banks + 1) > NR_MEM_BANKS )
> +        return -ENOMEM;
> +
> +    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].start = start;
> +    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].size = size;
> +    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].shm_id = shm_id;
> +    kinfo->shm_mem.nr_banks++;
> +
> +    return 0;
> +}
> +
> +static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>                                 const struct dt_device_node *node)
>   {
>       struct dt_device_node *shm_node;
> @@ -971,6 +986,14 @@ static int __init process_shm(struct domain *d,
>               if ( ret )
>                   return ret;
>           }
> +
> +        /*
> +         * Record static shared memory region info for later setting
> +         * up shm-node in guest device tree.
> +         */
> +        ret = append_shm_bank_to_domain(kinfo, gbase, psize, shm_id);
> +        if ( ret )
> +            return ret;
>       }
>   
>       return 0;
> @@ -1301,6 +1324,117 @@ static int __init make_memory_node(const struct domain *d,
>       return res;
>   }
>   
> +#ifdef CONFIG_STATIC_SHM
> +static int __init make_shm_memory_node(const struct domain *d,
> +                                       void *fdt,
> +                                       int addrcells, int sizecells,
> +                                       struct meminfo *mem)

NIT: AFAICT mem is not changed, so it should be const.

> +{
> +    unsigned long i = 0;

NIT: This should be "unsigned int" to match the type of nr_banks.

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

Looking at the Linux binding, "xen,id" is meant to be a string. But here 
you are writing it as an integer.

Given that the Linux binding is already merged, I think the Xen binding 
should be changed.

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
> +    if ( mem->nr_banks == 0 )
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
>   static int __init add_ext_regions(unsigned long s, unsigned long e, void *data)
>   {
>       struct meminfo *ext_regions = data;
> @@ -3078,6 +3212,11 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>       if ( ret )
>           goto err;
>   
> +    ret = make_resv_memory_node(d, kinfo->fdt, addrcells, sizecells,
> +                                &kinfo->shm_mem);
> +    if ( ret )
> +        goto err;
> +
>       /*
>        * domain_handle_dtb_bootmodule has to be called before the rest of
>        * the device tree is generated because it depends on the value of
> @@ -3454,7 +3593,7 @@ static int __init construct_domU(struct domain *d,
>           assign_static_memory_11(d, &kinfo, node);
>   
>   #ifdef CONFIG_STATIC_SHM
> -    rc = process_shm(d, node);
> +    rc = process_shm(d, &kinfo, node);
>       if ( rc < 0 )
>           return rc;
>   #endif
> diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
> index c4dc039b54..2cc506b100 100644
> --- a/xen/arch/arm/include/asm/kernel.h
> +++ b/xen/arch/arm/include/asm/kernel.h
> @@ -19,6 +19,7 @@ struct kernel_info {
>       void *fdt; /* flat device tree */
>       paddr_t unassigned_mem; /* RAM not (yet) assigned to a bank */
>       struct meminfo mem;
> +    struct meminfo shm_mem;
>   
>       /* kernel entry point */
>       paddr_t entry;
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index 5063e5d077..7497cc40aa 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -29,6 +29,7 @@ struct membank {
>       bool xen_domain; /* whether the memory bank is bound to a Xen domain. */
>   #ifdef CONFIG_STATIC_SHM
>       unsigned int nr_shm_domain;
> +    uint8_t shm_id ; /* ID identifier of a static shared memory bank. */

I am not entirely happy that we are defining shm_id for everyone. We are 
at v5, so I am OK for now.

But I would at least like "shm_id" to be defined before nr_shm_domain so 
we re-use the existing hole and avoid increasing the size of the structure.

Cheers,

-- 
Julien Grall

