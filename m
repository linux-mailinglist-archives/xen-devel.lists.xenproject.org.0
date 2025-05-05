Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B55AAA436
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 01:25:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976586.1363714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uC5Bs-0005X7-MB; Mon, 05 May 2025 23:25:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976586.1363714; Mon, 05 May 2025 23:25:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uC5Bs-0005U8-Ii; Mon, 05 May 2025 23:25:40 +0000
Received: by outflank-mailman (input) for mailman id 976586;
 Mon, 05 May 2025 23:25:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9/1y=XV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uC5Bq-0005U2-TV
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 23:25:38 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e2b360e-2a08-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 01:25:34 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9A25C629CA;
 Mon,  5 May 2025 23:25:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37559C4CEE4;
 Mon,  5 May 2025 23:25:32 +0000 (UTC)
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
X-Inumbo-ID: 3e2b360e-2a08-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746487533;
	bh=Q1yJA4SS3bjMpoJiCL9Fm0psuO3lko1C/k5Ebu3H3KY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=J1FDZsu/Q4+XtE8n0oDvXKgV+ISYxwjpuuRxcRIoHWZZ/bg/xNazDVKXAkPnWTLTQ
	 UoROAJT8zUycXdsPD5HlG/1WwCuQYHjtCuNV2vp//sGS7wczvl2fnTSsLMQXX5irHF
	 NyEVFGVNjVlvUxDM6t5/8u+FOGLDlEMiFczvXX72InuN4O1n7bU8jwbnLj4Euo5qMb
	 ssSZoAVT1mAl+AhzBqK87g9m6V7RPN8uOsU/DWD7OmD92q8AblsFKRzAMnwboN0dmm
	 AIegqtguqpnp91MGYUEaxsWnoC6uZInePgBEvahRKWl45H37YuludbzcG5DIpTIDtK
	 cAtCj1TdHFk6g==
Date: Mon, 5 May 2025 16:25:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 3/6] xen/arm: switch find_domU_holes to rangesets
In-Reply-To: <20250505025631.207529-4-stewart.hildebrand@amd.com>
Message-ID: <alpine.DEB.2.22.394.2505051625230.3879245@ubuntu-linux-20-04-desktop>
References: <20250505025631.207529-1-stewart.hildebrand@amd.com> <20250505025631.207529-4-stewart.hildebrand@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 4 May 2025, Stewart Hildebrand wrote:
> remove_shm_holes_for_domU() is unnecessarily complex: it re-creates the
> extended regions from scratch.
> 
> Move the rangeset into find_domU_holes() and create the extended regions
> only once. This makes is simpler to further manipulate the rangeset for
> removing other regions.
> 
> Remove now-unused remove_shm_holes_for_domU().
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/domain_build.c             | 46 ++++++++++++-----
>  xen/arch/arm/include/asm/static-shmem.h |  9 ----
>  xen/arch/arm/static-shmem.c             | 65 -------------------------
>  3 files changed, 35 insertions(+), 85 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index a0f3c074337d..3dcdd7a8c46f 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1256,34 +1256,58 @@ static int __init find_domU_holes(const struct kernel_info *kinfo,
>                                    struct membanks *ext_regions)
>  {
>      unsigned int i;
> -    uint64_t bankend;
>      const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
>      const uint64_t banksize[] = GUEST_RAM_BANK_SIZES;
>      const struct membanks *kinfo_mem = kernel_info_get_mem_const(kinfo);
> -    int res = -ENOENT;
> +    struct rangeset *mem_holes;
> +    int res;
> +
> +    mem_holes = rangeset_new(NULL, NULL, 0);
> +    if ( !mem_holes )
> +        return -ENOMEM;
>  
>      for ( i = 0; i < GUEST_RAM_BANKS; i++ )
>      {
> -        struct membank *ext_bank = &(ext_regions->bank[ext_regions->nr_banks]);
> +        uint64_t bankend, start, size = 0;
>  
> -        ext_bank->start = ROUNDUP(bankbase[i] + kinfo_mem->bank[i].size, SZ_2M);
> +        start = ROUNDUP(bankbase[i] + kinfo_mem->bank[i].size, SZ_2M);
>  
>          bankend = ~0ULL >> (64 - p2m_ipa_bits);
>          bankend = min(bankend, bankbase[i] + banksize[i] - 1);
> -        if ( bankend > ext_bank->start )
> -            ext_bank->size = bankend - ext_bank->start + 1;
> +
> +        if ( bankend > start )
> +            size = bankend - start + 1;
>  
>          /* 64MB is the minimum size of an extended region */
> -        if ( ext_bank->size < MB(64) )
> +        if ( size < MB(64) )
>              continue;
> -        ext_regions->nr_banks++;
> -        res = 0;
> +
> +        res = rangeset_add_range(mem_holes, PFN_DOWN(start), PFN_DOWN(bankend));
> +        if ( res )
> +        {
> +            printk(XENLOG_ERR "Failed to add: %#"PRIx64"->%#"PRIx64"\n",
> +                   start, start + size - 1);
> +            goto out;
> +        }
>      }
>  
> +    /* Remove static shared memory regions */
> +    res = remove_shm_from_rangeset(kinfo, mem_holes);
>      if ( res )
> -        return res;
> +        goto out;
> +
> +    res = rangeset_report_ranges(mem_holes, 0,
> +                                 PFN_DOWN((1ULL << p2m_ipa_bits) - 1),
> +                                 add_ext_regions, ext_regions);
> +    if ( res )
> +        ext_regions->nr_banks = 0;
> +    else if ( !ext_regions->nr_banks )
> +        res = -ENOENT;
>  
> -    return remove_shm_holes_for_domU(kinfo, ext_regions);
> + out:
> +    rangeset_destroy(mem_holes);
> +
> +    return res;
>  }
>  
>  static int __init find_host_extended_regions(const struct kernel_info *kinfo,
> diff --git a/xen/arch/arm/include/asm/static-shmem.h b/xen/arch/arm/include/asm/static-shmem.h
> index 94eaa9d500f9..ad8267c6bfbe 100644
> --- a/xen/arch/arm/include/asm/static-shmem.h
> +++ b/xen/arch/arm/include/asm/static-shmem.h
> @@ -28,9 +28,6 @@ void init_sharedmem_pages(void);
>  int remove_shm_from_rangeset(const struct kernel_info *kinfo,
>                               struct rangeset *rangeset);
>  
> -int remove_shm_holes_for_domU(const struct kernel_info *kinfo,
> -                              struct membanks *ext_regions);
> -
>  int make_shm_resv_memory_node(const struct kernel_info *kinfo, int addrcells,
>                                int sizecells);
>  
> @@ -74,12 +71,6 @@ static inline int remove_shm_from_rangeset(const struct kernel_info *kinfo,
>      return 0;
>  }
>  
> -static inline int remove_shm_holes_for_domU(const struct kernel_info *kinfo,
> -                                            struct membanks *ext_regions)
> -{
> -    return 0;
> -}
> -
>  static inline int make_shm_resv_memory_node(const struct kernel_info *kinfo,
>                                              int addrcells, int sizecells)
>  {
> diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
> index e8d4ca3ba3ff..06f32be097c8 100644
> --- a/xen/arch/arm/static-shmem.c
> +++ b/xen/arch/arm/static-shmem.c
> @@ -820,71 +820,6 @@ int __init remove_shm_from_rangeset(const struct kernel_info *kinfo,
>      return 0;
>  }
>  
> -int __init remove_shm_holes_for_domU(const struct kernel_info *kinfo,
> -                                     struct membanks *ext_regions)
> -{
> -    const struct membanks *shm_mem = kernel_info_get_shm_mem_const(kinfo);
> -    struct rangeset *guest_holes;
> -    unsigned int i;
> -    paddr_t start;
> -    paddr_t end;
> -    int res;
> -
> -    /* No static shared memory region. */
> -    if ( shm_mem->nr_banks == 0 )
> -        return 0;
> -
> -    dt_dprintk("Remove static shared memory holes from extended regions of DomU\n");
> -
> -    guest_holes = rangeset_new(NULL, NULL, 0);
> -    if ( !guest_holes )
> -        return -ENOMEM;
> -
> -    /* Copy extended regions sets into the rangeset */
> -    for ( i = 0; i < ext_regions->nr_banks; i++ )
> -    {
> -        start = ext_regions->bank[i].start;
> -        end = start + ext_regions->bank[i].size;
> -
> -        res = rangeset_add_range(guest_holes, PFN_DOWN(start),
> -                                 PFN_DOWN(end - 1));
> -        if ( res )
> -        {
> -            printk(XENLOG_ERR
> -                   "Failed to add: %#"PRIpaddr"->%#"PRIpaddr", error: %d\n",
> -                   start, end, res);
> -            goto out;
> -        }
> -    }
> -
> -    /* Remove static shared memory regions */
> -    res = remove_shm_from_rangeset(kinfo, guest_holes);
> -    if ( res )
> -        goto out;
> -
> -    /*
> -     * Take the interval of memory starting from the first extended region bank
> -     * start address and ending to the end of the last extended region bank.
> -     */
> -    i = ext_regions->nr_banks - 1;
> -    start = ext_regions->bank[0].start;
> -    end = ext_regions->bank[i].start + ext_regions->bank[i].size - 1;
> -
> -    /* Reset original extended regions to hold new value */
> -    ext_regions->nr_banks = 0;
> -    res = rangeset_report_ranges(guest_holes, PFN_DOWN(start), PFN_DOWN(end),
> -                                 add_ext_regions, ext_regions);
> -    if ( res )
> -        ext_regions->nr_banks = 0;
> -    else if ( !ext_regions->nr_banks )
> -        res = -ENOENT;
> -
> - out:
> -    rangeset_destroy(guest_holes);
> -
> -    return res;
> -}
> -
>  void __init shm_mem_node_fill_reg_range(const struct kernel_info *kinfo,
>                                          __be32 *reg, int *nr_cells,
>                                          int addrcells, int sizecells)
> -- 
> 2.49.0
> 

