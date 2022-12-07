Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B96F646567
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 00:49:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456723.714520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3490-0007HM-4l; Wed, 07 Dec 2022 23:48:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456723.714520; Wed, 07 Dec 2022 23:48:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3490-0007Eh-1g; Wed, 07 Dec 2022 23:48:06 +0000
Received: by outflank-mailman (input) for mailman id 456723;
 Wed, 07 Dec 2022 23:48:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CKq1=4F=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p348y-0007Eb-LC
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 23:48:04 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 966d3feb-7689-11ed-91b6-6bf2151ebd3b;
 Thu, 08 Dec 2022 00:48:02 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B67D8B82193;
 Wed,  7 Dec 2022 23:48:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86205C433C1;
 Wed,  7 Dec 2022 23:47:59 +0000 (UTC)
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
X-Inumbo-ID: 966d3feb-7689-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670456880;
	bh=nNUKfCzbYvNTh1m1rikQiGM5msg/dC0QTd+gX8Tdb+0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TzjG+oN2QdvzV452SHG5nCPZ4IJNYgFHAtJ0x0zNgmcQZ7C0qa7IhZWuf0vK8f97e
	 odn4PSt3IucNF9aJBLQ2IGzioGfWpW5GbbrWbEtlMn7+TFcJxGtDHEjxWQsbCYja9i
	 gAe/EX26zGQQhyc2vndnSYWFzljz4pIwc2k93jTotSWsj8rD5XtAyUFSek6XQlAIdM
	 zN77c1I8mZJL2+qm0ZwRAbRHwE6buRi/6od1qXw3Ay5ozrjC152D+kgflw+a8QebOZ
	 SR6OCfpUBoXMV7Z1LlpX/JqPXT/pbdhKySFf56fWZRpGiXX91OxmKRyq+I8OXX9t23
	 D263Q682riojw==
Date: Wed, 7 Dec 2022 15:47:55 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/3] xen/arm: Add memory overlap check for
 bootinfo.reserved_mem
In-Reply-To: <556d4b3f-3983-a336-f299-ce6b2b4a6e72@xen.org>
Message-ID: <alpine.DEB.2.22.394.2212071534260.2730675@ubuntu-linux-20-04-desktop>
References: <20221205025753.2178965-1-Henry.Wang@arm.com> <20221205025753.2178965-2-Henry.Wang@arm.com> <alpine.DEB.2.22.394.2212061716170.4039@ubuntu-linux-20-04-desktop> <8e635354-fdf4-a37f-0dba-c4b29063e152@xen.org> <alpine.DEB.2.22.394.2212071424060.4039@ubuntu-linux-20-04-desktop>
 <556d4b3f-3983-a336-f299-ce6b2b4a6e72@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 7 Dec 2022, Julien Grall wrote:
> On 07/12/2022 22:27, Stefano Stabellini wrote:
> > On Wed, 7 Dec 2022, Julien Grall wrote:
> > > On 07/12/2022 01:37, Stefano Stabellini wrote:
> > > > On Mon, 5 Dec 2022, Henry Wang wrote:
> > > > > As we are having more and more types of static region, and all of
> > > > > these static regions are defined in bootinfo.reserved_mem, it is
> > > > > necessary to add the overlap check of reserved memory regions in Xen,
> > > > > because such check will help user to identify the misconfiguration in
> > > > > the device tree at the early stage of boot time.
> > > > > 
> > > > > Currently we have 3 types of static region, namely (1) static memory,
> > > > > (2) static heap, (3) static shared memory. (1) and (2) are parsed by
> > > > > the function `device_tree_get_meminfo()` and (3) is parsed using its
> > > > > own logic. Therefore, to unify the checking logic for all of these
> > > > > types of static region, this commit firstly introduces a helper
> > > > > `check_reserved_regions_overlap()` to check if an input physical
> > > > > address range is overlapping with the existing reserved memory regions
> > > > > defined in bootinfo. After that, use this helper in
> > > > > `device_tree_get_meminfo()` to do the overlap check of (1) and (2)
> > > > > and replace the original overlap check of (3) with this new helper.
> > > > > 
> > > > > Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> > > > 
> > > > I wonder if the check should only be done #ifdef DEBUG. The idea would
> > > > be that a given static configuration should be validated and corrected
> > > > before going into production. By the time you go in production, it is
> > > > too late to do checks anyway. Especially the panic below.
> > > > 
> > > > Julien, Bertrand, what do you think about this?
> > > 
> > > The integrator may be a different person (or even a different company)
> > > than
> > > the one building Xen.
> > > 
> > > So I think, the new check shoudl not be protected by CONFIG_DEBUG.
> > 
> > It is almost like we need something else to say "this is really a
> > production build, disable all checks, I want it to go fast and be as
> > small as possible". Maybe it would be better as a new kconfig option?
> 
> I am not convinced this should be a Kconfig option for the same reason as
> before: the integrator may be a different entity and you want to be able to
> check your setup with the final binary.
> 
> So this most likely want to a be a command line option.
> 
> > 
> > In any case, this patch is OK as is.
> > 
> > 
> > > That said, any output in bootfd will only printed when earlyprintk is
> > > enabled.
> > > I think we should consider to support dynamic early printk. Anyway, that's
> > > something that doesn't need to be handled in this series.
> > 
> > +1
> > 
> > 
> > > > > ---
> > > > >    xen/arch/arm/bootfdt.c           | 13 ++++----
> > > > >    xen/arch/arm/include/asm/setup.h |  2 ++
> > > > >    xen/arch/arm/setup.c             | 52
> > > > > ++++++++++++++++++++++++++++++++
> > > > >    3 files changed, 60 insertions(+), 7 deletions(-)
> > > > > 
> > > > > diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> > > > > index 6014c0f852..b31379b9ac 100644
> > > > > --- a/xen/arch/arm/bootfdt.c
> > > > > +++ b/xen/arch/arm/bootfdt.c
> > > > > @@ -91,6 +91,9 @@ static int __init device_tree_get_meminfo(const void
> > > > > *fdt, int node,
> > > > >        for ( i = 0; i < banks && mem->nr_banks < NR_MEM_BANKS; i++ )
> > > > >        {
> > > > >            device_tree_get_reg(&cell, address_cells, size_cells,
> > > > > &start,
> > > > > &size);
> > > > > +        if ( mem == &bootinfo.reserved_mem &&
> > > > > +             check_reserved_regions_overlap(start, size) )
> > > > > +            return -EINVAL;
> > > > >            /* Some DT may describe empty bank, ignore them */
> > > > >            if ( !size )
> > > > >                continue;
> > > > > @@ -485,7 +488,9 @@ static int __init process_shm_node(const void
> > > > > *fdt,
> > > > > int node,
> > > > >                    return -EINVAL;
> > > > >                }
> > > > >    -            if ( (end <= mem->bank[i].start) || (paddr >=
> > > > > bank_end) )
> > > > > +            if ( check_reserved_regions_overlap(paddr, size) )
> > > > > +                return -EINVAL;
> > > > > +            else
> > > > >                {
> > > > >                    if ( strcmp(shm_id, mem->bank[i].shm_id) != 0 )
> > > > >                        continue;
> > > > > @@ -496,12 +501,6 @@ static int __init process_shm_node(const void
> > > > > *fdt,
> > > > > int node,
> > > > >                        return -EINVAL;
> > > > >                    }
> > > > >                }
> > > > > -            else
> > > > > -            {
> > > > > -                printk("fdt: shared memory region overlap with an
> > > > > existing entry %#"PRIpaddr" - %#"PRIpaddr"\n",
> > > > > -                        mem->bank[i].start, bank_end);
> > > > > -                return -EINVAL;
> > > > > -            }
> > > > >            }
> > > > >        }
> > > > >    diff --git a/xen/arch/arm/include/asm/setup.h
> > > > > b/xen/arch/arm/include/asm/setup.h
> > > > > index fdbf68aadc..6a9f88ecbb 100644
> > > > > --- a/xen/arch/arm/include/asm/setup.h
> > > > > +++ b/xen/arch/arm/include/asm/setup.h
> > > > > @@ -143,6 +143,8 @@ void fw_unreserved_regions(paddr_t s, paddr_t e,
> > > > >    size_t boot_fdt_info(const void *fdt, paddr_t paddr);
> > > > >    const char *boot_fdt_cmdline(const void *fdt);
> > > > >    +int check_reserved_regions_overlap(paddr_t region_start, paddr_t
> > > > > region_size);
> > > > > +
> > > > >    struct bootmodule *add_boot_module(bootmodule_kind kind,
> > > > >                                       paddr_t start, paddr_t size,
> > > > > bool
> > > > > domU);
> > > > >    struct bootmodule *boot_module_find_by_kind(bootmodule_kind kind);
> > > > > diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> > > > > index 4395640019..94d232605e 100644
> > > > > --- a/xen/arch/arm/setup.c
> > > > > +++ b/xen/arch/arm/setup.c
> > > > > @@ -270,6 +270,42 @@ static void __init dt_unreserved_regions(paddr_t
> > > > > s,
> > > > > paddr_t e,
> > > > >        cb(s, e);
> > > > >    }
> > > > >    +static int __init overlap_check(void *bootinfo_type,
> > > > > +                                paddr_t region_start, paddr_t
> > > > > region_end)
> > > > > +{
> > > > > +    unsigned int i, num = 0;
> > > > > +    paddr_t bank_start = INVALID_PADDR, bank_end = 0;
> > > > > +    char *type_str = "NONAME";
> > > > > +
> > > > > +    if ( bootinfo_type == &bootinfo.reserved_mem )
> > > > > +    {
> > > > > +        num = bootinfo.reserved_mem.nr_banks;
> > > > > +        type_str = "reserved_mem";
> > > > > +    }
> > > > > +    else
> > > > > +        panic("Invalid bootinfo type passed to overlap check\n");
> > > > > +
> > > > > +    for ( i = 0; i < num; i++ )
> > > > > +    {
> > > > > +        if ( bootinfo_type == &bootinfo.reserved_mem )
> > > > > +        {
> > > > > +            bank_start = bootinfo.reserved_mem.bank[i].start;
> > > > > +            bank_end = bank_start +
> > > > > bootinfo.reserved_mem.bank[i].size;
> > > > > +        }
> > > > > +
> > > > > +        if ( region_end <= bank_start || region_start >= bank_end )
> > > > > +            continue;
> > > > > +        else
> > > > > +        {
> > > > > +            printk("%s: Region %#"PRIpaddr" - %#"PRIpaddr"
> > > > > overlapping
> > > > > with bank[%u] %#"PRIpaddr" - %#"PRIpaddr"\n",
> > > > > +                   type_str, region_start, region_end, i, bank_start,
> > > > > bank_end);
> > > > > +            return -EINVAL;
> > > > > +        }
> > > > > +    }
> > > > > +
> > > > > +    return 0;
> > > > > +}
> > > > 
> > > > As much as I dislike MACROs in general I think this function should be
> > > > written as a MACRO so that we can write it once for all use cases. The
> > > > below in not compiled and not tested, just for explanation purposes.
> > > > Look how much simpler the code becomes.
> > > 
> > > I agree the duplication is not nice. But it is not clear to me why a
> > > static
> > > inline function cannot be used.
> > 
> > You mean a macro generating static inline functions?
> > 
> > It cannot be a single static inline function because the bootinfo
> > arguments are of three different types, it just happens that all three
> > have a "start" and "size" struct member so it works great with a macro,
> > but doesn't for a function.
> 
> It is not clear to me what are the three types you are referring to. Looking
> at the definition of bootinfo is:
> 
> struct bootinfo {
>     struct meminfo mem;
>     /* The reserved regions are only used when booting using Device-Tree */
>     struct meminfo reserved_mem;
>     struct bootmodules modules;
>     struct bootcmdlines cmdlines;
> #ifdef CONFIG_ACPI
>     struct meminfo acpi;
> #endif
>     bool static_heap;
> };
> 
> cmdlines is something uninteresting here. So we have two types:
>   - bootmodules for modules
>   - meminfo used by reserved_mem, mem and acpi
> 
> Looking in details the code, now I understand why you suggested the macro.
> This is far better than the checking what the array type (not very scalable).

Thank you :-)


> Personally, I think trying to share the code between the two types is a bit
> odd. The logic is the same today, but I envision to merge reserved_mem, mem
> and acpi in a single array (it would look like the E820) as this would make
> easier to find the caching attributes per regions when mapping the RAM. So
> sharing the code would not be possible.
> 
> That said, if you really want to share the code between the two types. Then I
> would prefer one of the following option:
>    1) Provide a callback that is used to fetch the information from the array
>    2) Provide a common structure that could be used by the function.
> 
> This would match other generic function like sort & co.

I think option 2) would be the best but I couldn't think of a simple way
to do it (without using a union and I thought a union would not make
things nicer in this case).

Rather than option 1), I think I would rather have 2 different functions
to check struct bootmodules and struct meminfo, or the macro.

