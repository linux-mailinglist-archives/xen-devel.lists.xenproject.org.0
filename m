Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 202435AF79A
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 00:02:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400577.642267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgeE-0005Jn-Jq; Tue, 06 Sep 2022 22:02:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400577.642267; Tue, 06 Sep 2022 22:02:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgeE-0005Gg-Gk; Tue, 06 Sep 2022 22:02:22 +0000
Received: by outflank-mailman (input) for mailman id 400577;
 Tue, 06 Sep 2022 22:02:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4s6j=ZJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oVgeD-0005DV-Ef
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 22:02:21 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93b7027a-2e2f-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 00:02:20 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 05B80616FA;
 Tue,  6 Sep 2022 22:02:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7152BC433D6;
 Tue,  6 Sep 2022 22:02:17 +0000 (UTC)
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
X-Inumbo-ID: 93b7027a-2e2f-11ed-a016-b9edf5238543
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662501738;
	bh=b2DEvnD6idHHsGoq/wgg1baSL6ZdkFsOHLYIFITUJ9o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZIYHIgK2xMcJYfW3LMDLU9orpk7Ke5sPVQibtQPwKG7Dh2eNG/OpdQjfQFEJxvzRr
	 PDXuwuruI0lQ72G0TCso/Op0SUNWEo6YE24ylLm31vNLoxyUgJ/WM1OnBG5fjexK77
	 +6xGwBA+wW7ZfWsxQJTxa827bgCLYV7XmTmXH5rbUgZpG69cbjV0ghKO6ix7oejXc7
	 BQMM/A+B7bKXUeRxA1dMlhv4kaIRdmZvyuMgQz0UCHko0M9eUTt71XVCuFexrep+X9
	 i3o7xwgMFndiWVVCo7qSV5nxXB1whs7bOOlrY/CZLAAQW3JBkIGjqbF9P17Nb5IzYK
	 qrlYxu2CYNMfA==
Date: Tue, 6 Sep 2022 15:02:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@arm.com>
cc: xen-devel@lists.xenproject.org, wei.chen@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v7 7/9] xen/arm: create shared memory nodes in guest
 device tree
In-Reply-To: <20220906085941.944592-8-Penny.Zheng@arm.com>
Message-ID: <alpine.DEB.2.22.394.2209061501480.157835@ubuntu-linux-20-04-desktop>
References: <20220906085941.944592-1-Penny.Zheng@arm.com> <20220906085941.944592-8-Penny.Zheng@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 6 Sep 2022, Penny Zheng wrote:
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
>  xen/arch/arm/domain_build.c       | 147 +++++++++++++++++++++++++++++-
>  xen/arch/arm/include/asm/kernel.h |   1 +
>  2 files changed, 146 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index d0ff487cc6..3b7436030e 100644
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
> +    if ( (kinfo->shm_mem.nr_banks + 1) > NR_MEM_BANKS )
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
> @@ -972,6 +988,9 @@ static int __init process_shm(struct domain *d,
>          if ( dt_property_read_string(shm_node, "role", &role_str) == 0 )
>              owner_dom_io = false;
>  
> +        dt_property_read_string(shm_node, "xen,shm-id", &shm_id);
> +        BUG_ON((strlen(shm_id) <= 0) || (strlen(shm_id) >= MAX_SHM_ID_LENGTH));
> +
>          /*
>           * DOMID_IO is a fake domain and is not described in the Device-Tree.
>           * Therefore when the owner of the shared region is DOMID_IO, we will
> @@ -999,6 +1018,14 @@ static int __init process_shm(struct domain *d,
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
> @@ -1329,6 +1356,117 @@ static int __init make_memory_node(const struct domain *d,
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
> +        __be32 reg[4];

I think it should be:

  __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS]

aside from that (it could be fixed on commit):

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>



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
>  static int __init add_ext_regions(unsigned long s, unsigned long e, void *data)
>  {
>      struct meminfo *ext_regions = data;
> @@ -3106,6 +3244,11 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
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
> @@ -3482,7 +3625,7 @@ static int __init construct_domU(struct domain *d,
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

