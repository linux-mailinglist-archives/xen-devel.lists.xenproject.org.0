Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF19678B10
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 23:53:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483316.749412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK5g6-0002EI-Qx; Mon, 23 Jan 2023 22:52:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483316.749412; Mon, 23 Jan 2023 22:52:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK5g6-0002BV-Nv; Mon, 23 Jan 2023 22:52:38 +0000
Received: by outflank-mailman (input) for mailman id 483316;
 Mon, 23 Jan 2023 22:52:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QMpG=5U=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pK5g5-0002BP-2j
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 22:52:37 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a044ab99-9b70-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 23:52:35 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B158961031;
 Mon, 23 Jan 2023 22:52:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD4FCC4339C;
 Mon, 23 Jan 2023 22:52:31 +0000 (UTC)
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
X-Inumbo-ID: a044ab99-9b70-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674514353;
	bh=id8H5Ax/kFYEZ196VNAOQFBbJIMV50dtP9C73f9JjXE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ACN9GFKUL6m3RMA37xM4xANNNDn16dVzBvtC0NlDtvvdxpjQRK2KWJEYXqVCDnx19
	 ZA/K745gkG8YqkDW1FyRdoeZVySbRDOci/dR2ldc3aYNQMlt01W0d545peo4+tbBu9
	 4h36nZbIV7rWeIWT1JUWrV3ZhOEd/Gz68RPv0puP8f77YGnEjMtqJKWG+QFdYYnqWC
	 +NoP4tEfsUkVnYRDlyFHfYyPHVoCpp9Hn90eb3/WVcc7uy3UxooJvtVMghLQg7bdjz
	 UK99S9CSxFsWuIFGlYPf/uIz+3ty2SzN9xdRcpcsc/+VVLp7pA2yBJ5LupBI1OEyj5
	 PNkrvp1znUDRw==
Date: Mon, 23 Jan 2023 14:52:30 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 22/22] xen/arm64: Allow the admin to enable/disable the
 directmap
In-Reply-To: <20221216114853.8227-23-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2301231437170.1978264@ubuntu-linux-20-04-desktop>
References: <20221216114853.8227-1-julien@xen.org> <20221216114853.8227-23-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 16 Dec 2022, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Implement the same command line option as x86 to enable/disable the
> directmap. By default this is kept enabled.
> 
> Also modify setup_directmap_mappings() to populate the L0 entries
> related to the directmap area.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ----
>     This patch is in an RFC state we need to decide what to do for arm32.
> 
>     Also, this is moving code that was introduced in this series. So
>     this will need to be fix in the next version (assuming Arm64 will
>     be ready).
> 
>     This was sent early as PoC to enable secret-free hypervisor
>     on Arm64.
> ---
>  docs/misc/xen-command-line.pandoc   |  2 +-
>  xen/arch/arm/include/asm/arm64/mm.h |  2 +-
>  xen/arch/arm/include/asm/mm.h       | 12 +++++----
>  xen/arch/arm/mm.c                   | 40 +++++++++++++++++++++++++++--
>  xen/arch/arm/setup.c                |  1 +
>  5 files changed, 48 insertions(+), 9 deletions(-)
> 
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index a63e4612acac..948035286acc 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -760,7 +760,7 @@ Specify the size of the console debug trace buffer. By specifying `cpu:`
>  additionally a trace buffer of the specified size is allocated per cpu.
>  The debug trace feature is only enabled in debugging builds of Xen.
>  
> -### directmap (x86)
> +### directmap (arm64, x86)
>  > `= <boolean>`
>  
>  > Default: `true`
> diff --git a/xen/arch/arm/include/asm/arm64/mm.h b/xen/arch/arm/include/asm/arm64/mm.h
> index aa2adac63189..8b5dcb091750 100644
> --- a/xen/arch/arm/include/asm/arm64/mm.h
> +++ b/xen/arch/arm/include/asm/arm64/mm.h
> @@ -7,7 +7,7 @@
>   */
>  static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
>  {
> -    return true;
> +    return opt_directmap;
>  }
>  
>  #endif /* __ARM_ARM64_MM_H__ */
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index d73abf1bf763..ef9ad3b366e3 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -9,6 +9,13 @@
>  #include <public/xen.h>
>  #include <xen/pdx.h>
>  
> +extern bool opt_directmap;
> +
> +static inline bool arch_has_directmap(void)
> +{
> +    return opt_directmap;
> +}
> +
>  #if defined(CONFIG_ARM_32)
>  # include <asm/arm32/mm.h>
>  #elif defined(CONFIG_ARM_64)
> @@ -411,11 +418,6 @@ static inline void page_set_xenheap_gfn(struct page_info *p, gfn_t gfn)
>      } while ( (y = cmpxchg(&p->u.inuse.type_info, x, nx)) != x );
>  }
>  
> -static inline bool arch_has_directmap(void)
> -{
> -    return true;
> -}
> -
>  /* Helpers to allocate, map and unmap a Xen page-table */
>  int create_xen_table(lpae_t *entry);
>  lpae_t *xen_map_table(mfn_t mfn);
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index f5fb957554a5..925d81c450e8 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -15,6 +15,7 @@
>  #include <xen/init.h>
>  #include <xen/libfdt/libfdt.h>
>  #include <xen/mm.h>
> +#include <xen/param.h>
>  #include <xen/pfn.h>
>  #include <xen/pmap.h>
>  #include <xen/sched.h>
> @@ -131,6 +132,12 @@ vaddr_t directmap_virt_start __read_mostly;
>  unsigned long directmap_base_pdx __read_mostly;
>  #endif
>  
> +bool __ro_after_init opt_directmap = true;
> +/* TODO: Decide what to do for arm32. */
> +#ifdef CONFIG_ARM_64
> +boolean_param("directmap", opt_directmap);
> +#endif
> +
>  unsigned long frametable_base_pdx __read_mostly;
>  unsigned long frametable_virt_end __read_mostly;
>  
> @@ -606,16 +613,27 @@ void __init setup_directmap_mappings(unsigned long base_mfn,
>      directmap_virt_end = XENHEAP_VIRT_START + nr_mfns * PAGE_SIZE;
>  }
>  #else /* CONFIG_ARM_64 */
> -/* Map the region in the directmap area. */
> +/*
> + * This either populate a valid fdirect map, or allocates empty L1 tables

fdirect/direct


> + * and creates the L0 entries for the given region in the direct map
> + * depending on arch_has_directmap().
> + *
> + * When directmap=no, we still need to populate empty L1 tables in the
> + * directmap region. The reason is that the root page-table (i.e. L0)
> + * is per-CPU and secondary CPUs will initialize their root page-table
> + * based on the pCPU0 one. So L0 entries will be shared if they are
> + * pre-populated. We also rely on the fact that L1 tables are never
> + * freed.

You are saying that in case of directmap=no we are still creating empty
L1 tables and L0 entries because secondary CPUs will need them when they
initialize their root pagetables.

But why? Secondary CPUs will not be using the directmap either? Why do
seconday CPUs need the empty L1 tables?



> + */
>  void __init setup_directmap_mappings(unsigned long base_mfn,
>                                       unsigned long nr_mfns)
>  {
> +    unsigned long mfn_gb = base_mfn & ~((FIRST_SIZE >> PAGE_SHIFT) - 1);
>      int rc;
>  
>      /* First call sets the directmap physical and virtual offset. */
>      if ( mfn_eq(directmap_mfn_start, INVALID_MFN) )
>      {
> -        unsigned long mfn_gb = base_mfn & ~((FIRST_SIZE >> PAGE_SHIFT) - 1);
>  
>          directmap_mfn_start = _mfn(base_mfn);
>          directmap_base_pdx = mfn_to_pdx(_mfn(base_mfn));
> @@ -636,6 +654,24 @@ void __init setup_directmap_mappings(unsigned long base_mfn,
>          panic("cannot add directmap mapping at %lx below heap start %lx\n",
>                base_mfn, mfn_x(directmap_mfn_start));
>  
> +
> +    if ( !arch_has_directmap() )
> +    {
> +        vaddr_t vaddr = (vaddr_t)__mfn_to_virt(base_mfn);
> +        unsigned int i, slot;
> +
> +        slot = first_table_offset(vaddr);
> +        nr_mfns += base_mfn - mfn_gb;
> +        for ( i = 0; i < nr_mfns; i += BIT(XEN_PT_LEVEL_ORDER(0), UL), slot++ )
> +        {
> +            lpae_t *entry = &cpu0_pgtable[slot];
> +
> +            if ( !lpae_is_valid(*entry) && !create_xen_table(entry) )
> +                panic("Unable to populate zeroeth slot %u\n", slot);
> +        }
> +        return;
> +    }
> +
>      rc = map_pages_to_xen((vaddr_t)__mfn_to_virt(base_mfn),
>                            _mfn(base_mfn), nr_mfns,
>                            PAGE_HYPERVISOR_RW | _PAGE_BLOCK);
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index b1a8f91bb385..83ded03c7b1f 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -1032,6 +1032,7 @@ void __init start_xen(unsigned long boot_phys_offset,
>      cmdline_parse(cmdline);
>  
>      setup_mm();
> +    printk("Booting with directmap %s\n", arch_has_directmap() ? "on" : "off");
>  
>      vm_init();
>  
> -- 
> 2.38.1
> 

