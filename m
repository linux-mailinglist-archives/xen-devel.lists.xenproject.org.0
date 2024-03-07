Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D2E8745E8
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 03:09:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689618.1074781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ri3CE-0007gd-DF; Thu, 07 Mar 2024 02:09:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689618.1074781; Thu, 07 Mar 2024 02:09:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ri3CE-0007el-A4; Thu, 07 Mar 2024 02:09:22 +0000
Received: by outflank-mailman (input) for mailman id 689618;
 Thu, 07 Mar 2024 02:09:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nvJe=KN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ri3CC-0007bR-2y
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 02:09:20 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2f2aa8a-dc27-11ee-afda-a90da7624cb6;
 Thu, 07 Mar 2024 03:09:17 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E9D23CE2364;
 Thu,  7 Mar 2024 02:09:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16593C433F1;
 Thu,  7 Mar 2024 02:09:10 +0000 (UTC)
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
X-Inumbo-ID: b2f2aa8a-dc27-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709777352;
	bh=hYROHoVH0buEWWfmdF9lYIqOOaFMpk53Aaj3DKaC1uA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=eLi548Y2tDV6U5/gKH6izQuz+bR+LjEYJ8FvYnbS5BDBjHdzqE+ELHKk1pukD17Dy
	 G12/i+ik2bwV8A+VlSh0x5pQ+YiHw03YJA8ieXMv0Kh4V2IRKF2mcRGbbeKH/1aXcJ
	 EC5MO4nDakULFvjfUlkl+Sp/+SvSNsWP5vkianR06fndKO9p9kHkUJ2aIY+YTROi8y
	 KYZeOjcTTSN9/QQ5wbf2gLeOeR3tcICwR3pToGclEjCCTyQXwkuX+SorRY4ELd6leC
	 JLBwRGirfqz72vsTWYo109ozlpeOpRyvLw9L6Uint3w04O5DRrZ3QWKCVuEVehJZX/
	 FpHjgSLzqISTQ==
Date: Wed, 6 Mar 2024 18:09:09 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Andryuk <jason.andryuk@amd.com>
cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 3/3] x86/PVH: Support relocatable dom0 kernels
In-Reply-To: <20240306185032.103216-4-jason.andryuk@amd.com>
Message-ID: <alpine.DEB.2.22.394.2403061805440.853156@ubuntu-linux-20-04-desktop>
References: <20240306185032.103216-1-jason.andryuk@amd.com> <20240306185032.103216-4-jason.andryuk@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 6 Mar 2024, Jason Andryuk wrote:
> Xen tries to load a PVH dom0 kernel at the fixed guest physical address
> from the elf headers.  For Linux, this defaults to 0x1000000 (16MB), but
> it can be configured.
> 
> Unfortunately there exist firmwares that have reserved regions at this
> address, so Xen fails to load the dom0 kernel since it's not RAM.
> 
> The PVH entry code is not relocatable - it loads from absolute
> addresses, which fail when the kernel is loaded at a different address.
> With a suitably modified kernel, a reloctable entry point is possible.
> 
> Add the XENFEAT_pvh_relocatable flag to let a kernel indicate that it
> supports a relocatable entry path.
> 
> Change the loading to check for an acceptable load address.  If the
> kernel is relocatable, support finding an alternate load address.
> 
> Linux cares about its physical alignment.  This can be pulled out of the
> bzImage header, but not from the vmlinux ELF file.  If an alignment
> can't be found, use 2MB.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> Put alignment as a new ELF note?  Presence of that note would indicate
> relocation support without a new XENFEAT flag.
> 
> Default alignment to a multiple of 2MB to make more cases work?  It has
> to be a power of two, and a multiple might allow loading a customized
> kernel.  A larger alignment would limit the number of possible load
> locations.
> ---
>  xen/arch/x86/hvm/dom0_build.c | 109 ++++++++++++++++++++++++++++++++++
>  xen/include/public/features.h |   5 ++
>  2 files changed, 114 insertions(+)
> 
> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> index bbae8a5645..34d68ee8fb 100644
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -537,6 +537,109 @@ static paddr_t __init find_memory(
>      return INVALID_PADDR;
>  }
>  
> +static bool __init check_load_address(
> +    const struct domain *d, const struct elf_binary *elf)
> +{
> +    paddr_t kernel_start = (paddr_t)elf->dest_base & PAGE_MASK;
> +    paddr_t kernel_end = ROUNDUP((paddr_t)elf->dest_base + elf->dest_size,
> +                                 PAGE_SIZE);
> +    unsigned int i;
> +
> +    /*
> +     * The memory map is sorted and all RAM regions starts and sizes are
> +     * aligned to page boundaries.
> +     */
> +    for ( i = 0; i < d->arch.nr_e820; i++ )
> +    {
> +        paddr_t start = d->arch.e820[i].addr;
> +        paddr_t end = d->arch.e820[i].addr + d->arch.e820[i].size;
> +
> +        if ( start <= kernel_start &&
> +             end >= kernel_end &&
> +             d->arch.e820[i].type == E820_RAM )
> +            return true;
> +    }
> +
> +    return false;
> +}
> +
> +/*
> + * Find an e820 RAM region that fits the kernel at a suitable alignment.
> + */
> +static paddr_t find_kernel_memory(
> +    const struct domain *d, struct elf_binary *elf, paddr_t align)
> +{
> +    paddr_t kernel_start = (paddr_t)elf->dest_base & PAGE_MASK;
> +    paddr_t kernel_end = ROUNDUP((paddr_t)elf->dest_base + elf->dest_size,
> +                                 PAGE_SIZE);
> +    unsigned int i;
> +
> +    /*
> +     * The memory map is sorted and all RAM regions starts and sizes are
> +     * aligned to page boundaries.
> +     */
> +    for ( i = 0; i < d->arch.nr_e820; i++ )
> +    {
> +        paddr_t start = d->arch.e820[i].addr;
> +        paddr_t end = d->arch.e820[i].addr + d->arch.e820[i].size;
> +        paddr_t kstart, kend, offset;
> +
> +        if ( d->arch.e820[i].type != E820_RAM )
> +            continue;
> +
> +        if ( d->arch.e820[i].size < elf->dest_size )
> +            continue;
> +
> +        if ( end < kernel_end )
> +            continue;

Why this check? Is it to make sure we look for e820 regions that are
higher in terms of addresses? If so, couldn't we start from
d->arch.nr_e820 and go down instead of starting from 0 and going up?

The PVH entry point is a 32-bit entry point if I remember right? Do we
need a 32-bit check? If so then it might not be a good idea to start
from arch.nr_e820 and go down.



> +        kstart = ROUNDUP(start, align);
> +        offset = kstart - kernel_start;
> +        kend = kernel_end + offset;
> +
> +        if ( kend <= end )
> +            return offset;
> +    }
> +
> +    return 0;
> +}
> +
> +/*
> + * Check the kernel load address, and adjust if necessary and possible.
> + */
> +static bool __init adjust_load_address(
> +    const struct domain *d, struct elf_binary *elf, struct elf_dom_parms *parms,
> +    paddr_t align)
> +{
> +    paddr_t offset;
> +
> +    /* Check load address */
> +    if ( check_load_address(d, elf) )
> +        return true;
> +
> +    if ( !test_bit(XENFEAT_pvh_relocatable, parms->f_supported) )
> +    {
> +        printk("Address conflict and %pd kernel is not relocatable\n", d);
> +        return false;
> +    }
> +
> +    if ( align == 0 )
> +        align = MB(2);
> +
> +    offset = find_kernel_memory(d, elf, align);
> +    if ( offset == 0 )
> +    {
> +        printk("Failed find a load offset for the kernel\n");
> +        return false;
> +    }
> +
> +    printk("Adjusting load address by %#lx\n", offset);
> +    elf->dest_base += offset;
> +    parms->phys_entry += offset;
> +
> +    return true;
> +}
> +
>  static int __init pvh_load_kernel(struct domain *d, const module_t *image,
>                                    unsigned long image_headroom,
>                                    module_t *initrd, void *image_base,
> @@ -587,6 +690,12 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
>      elf.dest_base = (void *)(parms.virt_kstart - parms.virt_base);
>      elf.dest_size = parms.virt_kend - parms.virt_kstart;
>  
> +    if ( !adjust_load_address(d, &elf, &parms, align) )
> +    {
> +        printk("Unable to load kernel\n");
> +        return -ENOMEM;
> +    }
> +
>      elf_set_vcpu(&elf, v);
>      rc = elf_load_binary(&elf);
>      if ( rc < 0 )
> diff --git a/xen/include/public/features.h b/xen/include/public/features.h
> index 4437f25d25..300480cb22 100644
> --- a/xen/include/public/features.h
> +++ b/xen/include/public/features.h
> @@ -120,6 +120,11 @@
>  #define XENFEAT_runstate_phys_area        18
>  #define XENFEAT_vcpu_time_phys_area       19
>  
> +/*
> + * PVH: If set, the guest supports relocation in load address.
> + */
> +#define XENFEAT_pvh_relocatable           20
> +
>  #define XENFEAT_NR_SUBMAPS 1
>  
>  #endif /* __XEN_PUBLIC_FEATURES_H__ */
> -- 
> 2.44.0
> 
> 

