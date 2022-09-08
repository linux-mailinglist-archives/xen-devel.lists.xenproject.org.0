Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 481B45B2816
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 23:05:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403621.645775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWOiU-0000Vr-9i; Thu, 08 Sep 2022 21:05:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403621.645775; Thu, 08 Sep 2022 21:05:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWOiU-0000TC-6l; Thu, 08 Sep 2022 21:05:42 +0000
Received: by outflank-mailman (input) for mailman id 403621;
 Thu, 08 Sep 2022 21:05:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5KOk=ZL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oWOiS-0000T6-CS
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 21:05:40 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fcf9ec9a-2fb9-11ed-9760-273f2230c3a0;
 Thu, 08 Sep 2022 23:05:38 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 693DA61E28;
 Thu,  8 Sep 2022 21:05:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6AFEC433C1;
 Thu,  8 Sep 2022 21:05:35 +0000 (UTC)
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
X-Inumbo-ID: fcf9ec9a-2fb9-11ed-9760-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662671136;
	bh=zYV4niBGo2C6EYFdrPfUPDo7pOJunhfSjauGD0K7kPw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=g03SwsyOIJV54DTD4Vvf1armktQivaZvHNaT0uIydH4q+Jmv0oY9dJptS8AUOCD7D
	 0722hDulp7lRypTFYYpowmFLcEAxMwtwVWw/goJFgtV2SGkib/VGNTnnG3Z+Y2cC2C
	 o/dTREmtYxth5SLj5x9mOKbEaHNgtHN491VYQC3Jqh2wQ5uiIlmE+8iw4+oQ9nxIQK
	 yhMYfiFMPEU59wen3/yXVBZTlFnojez5w/Bjej6equGLUkV0L3CCmjKruWvSzwOrIY
	 SzJ7WTknwxyOTWc3r4FiI6B3yQG1L6sIlHYHCEJgEO02iQMZcSxAXv3Sai3He6oq9Z
	 5alkuBqhKTXmQ==
Date: Thu, 8 Sep 2022 14:05:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@arm.com>
cc: xen-devel@lists.xenproject.org, wei.chen@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v8 7/9] xen/arm: create shared memory nodes in guest
 device tree
In-Reply-To: <20220908135513.1800511-8-Penny.Zheng@arm.com>
Message-ID: <alpine.DEB.2.22.394.2209081404000.157835@ubuntu-linux-20-04-desktop>
References: <20220908135513.1800511-1-Penny.Zheng@arm.com> <20220908135513.1800511-8-Penny.Zheng@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 8 Sep 2022, Penny Zheng wrote:
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
> - xen,offset: (borrower VMs only)
>         64 bit integer offset within the owner virtual machine's shared
>         memory region used for the mapping in the borrower VM.
> Currently, we provide "xen,offset=<0x0>" as a temprary placeholder.
                                                ^ temporary

Another minor style issue below


> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
> v8 changes:
> - Fix missing property "xen,offset" for borrower VMs by temporarily
> adding "xen,offset=<0x0>"
> - use >= to avoid thinking about the overflow case for nr_banks
> - check the return value of dt_property_read_string() for parsing
> shm_id
> - struct meminfo *mem and char resvbuf[16] = "reserved-memory" could be
> const
> - change "__be32 reg[4]" to "__be32 reg[GUEST_ROOT_ADDRESS_CELLS +
> GUEST_ROOT_SIZE_CELLS]"
> ---
> v7 changes:
> - allocate reg for worst case addrcells + sizecells
> - replace assert() with BUG_ON() since it is init code
> ---
> v6 change:
> - change "struct meminfo *mem" to "const struct meminfo *mem"
> - change "unsigned long i" to "unsigned int i" to match the type of nr_banks.
> - accroding to the Linux binding, "xen,id" is meant to be a string, not
> an integer
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
>  xen/arch/arm/domain_build.c       | 160 +++++++++++++++++++++++++++++-
>  xen/arch/arm/include/asm/kernel.h |   1 +
>  2 files changed, 159 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index a10d07266b..cd03370b38 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -914,7 +914,22 @@ static int __init assign_shared_memory(struct domain *d,
>      return ret;
>  }
>  
> -static int __init process_shm(struct domain *d,
> +static int __init append_shm_bank_to_domain(struct kernel_info *kinfo,
> +                                            paddr_t start, paddr_t size,
> +                                            const char *shm_id)
> +{
> +    if ( kinfo->shm_mem.nr_banks >= NR_MEM_BANKS )
> +        return -ENOMEM;
> +
> +    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].start = start;
> +    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].size = size;
> +    safe_strcpy(kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].shm_id, shm_id);
> +    kinfo->shm_mem.nr_banks++;
> +
> +    return 0;
> +}
> +
> +static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>                                const struct dt_device_node *node)
>  {
>      struct dt_device_node *shm_node;
> @@ -928,6 +943,7 @@ static int __init process_shm(struct domain *d,
>          int ret = 0;
>          unsigned int i;
>          const char *role_str;
> +        const char *shm_id;
>          bool owner_dom_io = true;
>  
>          if ( !dt_device_is_compatible(shm_node, "xen,domain-shared-memory-v1") )
> @@ -972,6 +988,13 @@ static int __init process_shm(struct domain *d,
>          if ( dt_property_read_string(shm_node, "role", &role_str) == 0 )
>              owner_dom_io = false;
>  
> +        if ( dt_property_read_string(shm_node, "xen,shm-id", &shm_id) )
> +        {
> +            printk("%pd: invalid \"xen,shm-id\" property", d);
> +            return -EINVAL;
> +        }
> +        BUG_ON((strlen(shm_id) <= 0) || (strlen(shm_id) >= MAX_SHM_ID_LENGTH));
> +
>          /*
>           * DOMID_IO is a fake domain and is not described in the Device-Tree.
>           * Therefore when the owner of the shared region is DOMID_IO, we will
> @@ -999,6 +1022,14 @@ static int __init process_shm(struct domain *d,
>              if ( ret )
>                  return ret;
>          }
> +
> +        /*
> +         * Record static shared memory region info for later setting
> +         * up shm-node in guest device tree.
> +         */
> +        ret = append_shm_bank_to_domain(kinfo, gbase, psize, shm_id);
> +        if ( ret )
> +            return ret;
>      }
>  
>      return 0;
> @@ -1331,6 +1362,126 @@ static int __init make_memory_node(const struct domain *d,
>      return res;
>  }
>  
> +#ifdef CONFIG_STATIC_SHM
> +static int __init make_shm_memory_node(const struct domain *d,
> +                                       void *fdt,
> +                                       int addrcells, int sizecells,
> +                                       const struct meminfo *mem)
> +{
> +    unsigned int i = 0;
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
> +        /* Placeholder for xen-shmem@ + a 64-bit number + \0 */
> +        char buf[27];
> +        const char compat[] = "xen,shared-memory-v1";
> +        /* Worst case addrcells + sizecells */
> +        __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
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
> +        dt_dprintk("Shared memory bank %u: %#"PRIx64"->%#"PRIx64"\n",
> +                   i, start, start + size);
> +
> +        res = fdt_property_string(fdt, "xen,id", mem->bank[i].shm_id);
> +        if ( res )
> +            return res;
> +
> +        /* TODO:

It should be:

/*
 * TODO:
 *

I think this is good to go. The two minor style issues could be fixed on
commit. I haven't committed to give Julien & Bertrand another chance to
have a look.



> +         * - xen,offset: (borrower VMs only)
> +         *   64 bit integer offset within the owner virtual machine's shared
> +         *   memory region used for the mapping in the borrower VM
> +         */
> +        res = fdt_property_u64(fdt, "xen,offset", 0);
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
> +                                       const struct meminfo *mem)
> +{
> +    ASSERT_UNREACHABLE();
> +}
> +#endif
> +
> +static int __init make_resv_memory_node(const struct domain *d,
> +                                        void *fdt,
> +                                        int addrcells, int sizecells,
> +                                        const struct meminfo *mem)
> +{
> +    int res = 0;
> +    /* Placeholder for reserved-memory\0 */
> +    const char resvbuf[16] = "reserved-memory";
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
>  static int __init add_ext_regions(unsigned long s, unsigned long e, void *data)
>  {
>      struct meminfo *ext_regions = data;
> @@ -3108,6 +3259,11 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>      if ( ret )
>          goto err;
>  
> +    ret = make_resv_memory_node(d, kinfo->fdt, addrcells, sizecells,
> +                                &kinfo->shm_mem);
> +    if ( ret )
> +        goto err;
> +
>      /*
>       * domain_handle_dtb_bootmodule has to be called before the rest of
>       * the device tree is generated because it depends on the value of
> @@ -3484,7 +3640,7 @@ static int __init construct_domU(struct domain *d,
>          assign_static_memory_11(d, &kinfo, node);
>  
>  #ifdef CONFIG_STATIC_SHM
> -    rc = process_shm(d, node);
> +    rc = process_shm(d, &kinfo, node);
>      if ( rc < 0 )
>          return rc;
>  #endif
> diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
> index c4dc039b54..2cc506b100 100644
> --- a/xen/arch/arm/include/asm/kernel.h
> +++ b/xen/arch/arm/include/asm/kernel.h
> @@ -19,6 +19,7 @@ struct kernel_info {
>      void *fdt; /* flat device tree */
>      paddr_t unassigned_mem; /* RAM not (yet) assigned to a bank */
>      struct meminfo mem;
> +    struct meminfo shm_mem;
>  
>      /* kernel entry point */
>      paddr_t entry;
> -- 
> 2.25.1
> 

