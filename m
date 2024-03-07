Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC49874AE2
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 10:31:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689694.1074919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riA56-00026N-Ih; Thu, 07 Mar 2024 09:30:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689694.1074919; Thu, 07 Mar 2024 09:30:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riA56-00024B-Fe; Thu, 07 Mar 2024 09:30:28 +0000
Received: by outflank-mailman (input) for mailman id 689694;
 Thu, 07 Mar 2024 09:30:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z5IG=KN=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1riA55-000245-5F
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 09:30:27 +0000
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [2607:f8b0:4864:20::82c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53cf966e-dc65-11ee-afda-a90da7624cb6;
 Thu, 07 Mar 2024 10:30:25 +0100 (CET)
Received: by mail-qt1-x82c.google.com with SMTP id
 d75a77b69052e-42f13eebabbso2921141cf.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 01:30:25 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 he29-20020a05622a601d00b0042ee1ff302esm4843954qtb.66.2024.03.07.01.30.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 01:30:24 -0800 (PST)
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
X-Inumbo-ID: 53cf966e-dc65-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709803824; x=1710408624; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5EkqeA+Q9vgb52Bj9IdDE0G1TqzZ7hUIGlxQCNPLfKQ=;
        b=dcbI7gwZysLOQQ2RcSkS/nycuodVrhaO8wGOs9GMHgqIrRdS5e08zCTHCElnekgQDK
         Sye+QzsBH21g2XfooKnmVJQgbifaW2bfkF3rUSlTO+X1zPT8rNwhH4RNX2S6DiGjDMRR
         gaknPfr8GBQrd9I5elIrM/oSUoVp7EIpygpbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709803824; x=1710408624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5EkqeA+Q9vgb52Bj9IdDE0G1TqzZ7hUIGlxQCNPLfKQ=;
        b=v3rC6w1EL1vYAoEHmdJv29ibwy/Px82KHOQfXh8Vh/BVUEBkrAfo+Xcw/SgeovQdnI
         jhEQHSvtdeS6KZAcIrUCE7w/kE98KJqWurMw4PM4j3UHqMSjzxZNLWJCX6W80JLokEfY
         ZSWL65C5VZgNKOEQb4m4CukcBviRhgcvUjVBuD/R+6ZGUlh0n0RBrvKLcRZ0ztv9NWj/
         42LknmrRPe0tIHhSRx56o7U9C2HS0V4zCAwyfaTWJvFJVXoTKGh9ZkgKtJ338ZGG2fo5
         zXXqo08r8BN8LzZYiZ3eIAzzHVxs+ZpY0WI0x+9kxJQc1sP70NVUihULYQZZOEoRYG2n
         tYhg==
X-Gm-Message-State: AOJu0YzHzwwwd/k9BI1dWDDIBmFw4c5JTmonWI/ujSMjcZMKWhle6j8J
	8FZyX7Bci7y5OiTSVhDyLp8N8ZB5ecHidozsfdI7bNJEAhMB0HeBs4xP5JHTU6Y=
X-Google-Smtp-Source: AGHT+IHJyWl/nytobRd3BzNxS/KpUyq50cBg5xwCWUDkCilRbVXXPTokdYnKO2qPQq+DLNi2aV7dPg==
X-Received: by 2002:ac8:5bc4:0:b0:42e:da42:9c73 with SMTP id b4-20020ac85bc4000000b0042eda429c73mr9321418qtb.57.1709803824476;
        Thu, 07 Mar 2024 01:30:24 -0800 (PST)
Date: Thu, 7 Mar 2024 10:30:22 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 3/3] x86/PVH: Support relocatable dom0 kernels
Message-ID: <ZemJLs0yHiSGI6nO@macbook>
References: <20240306185032.103216-1-jason.andryuk@amd.com>
 <20240306185032.103216-4-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240306185032.103216-4-jason.andryuk@amd.com>

On Wed, Mar 06, 2024 at 01:50:32PM -0500, Jason Andryuk wrote:
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

While I'm fine with having a Linux specific way, there needs to be a
generic way of passing the alignment for non-bzImage kernels.

ELF program headers have an align field, would that be suitable to
use?

In elf_parse_binary() where the p{start,end} is calculated, you could
also fetch the p_offset from the lower found program header and use it
as the required alignment.  Would that be OK for Linux and maybe avoid
having to fiddle with the bzImage header?  FWIW it is likely fine for
FreeBSD.

> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

I created a gitlab ticket for this:

https://gitlab.com/xen-project/xen/-/issues/180

If you want to reference it.

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

You can use PAGE_ALIGN() here (and below) for simplicity.

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

Since the memory map is sorted you can end the loop once end start >=
kernel_end?  As further regions are past the kernel destination.

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

This (and other) comment seems to fit in a single line: /* ... */.

> +static paddr_t find_kernel_memory(
> +    const struct domain *d, struct elf_binary *elf, paddr_t align)

elf can be const AFAICT.

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

I'm not sure I understand this check, why would we refuse regions
below the fixed kernel end?  Those should be equally suitable if big
enough and meeting the alignment requirements.

> +
> +        kstart = ROUNDUP(start, align);
> +        offset = kstart - kernel_start;
> +        kend = kernel_end + offset;
> +
> +        if ( kend <= end )
> +            return offset;

Why not return this as an address to use to load the kernel instead of
an offset from dest_base?  That would also make the calculations
easier IMO.

> +    }

This should be limited to a range below 4GB.

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

I think this would be more helpful if the previous and the new ranges
are printed, as I'm not sure the previous dest_base is printed, in
which case the offset doesn't help much.  I would do:

if ( opt_dom0_verbose )
    printk("relocating kernel from [%lx, %lx] -> [%lx, %lx]\n", ...);

> +    elf->dest_base += offset;
> +    parms->phys_entry += offset;

As noted above, I think it would be better if find_kernel_memory()
find an absolute address which is then adjusted here.

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

check_and_adjust_?  As the address is not unconditionally adjusted.

Thanks, Roger.

