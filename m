Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8BF646413
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 23:28:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456672.714455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p32tW-0002yU-QF; Wed, 07 Dec 2022 22:28:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456672.714455; Wed, 07 Dec 2022 22:28:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p32tW-0002wH-Ml; Wed, 07 Dec 2022 22:28:02 +0000
Received: by outflank-mailman (input) for mailman id 456672;
 Wed, 07 Dec 2022 22:28:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CKq1=4F=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p32tV-0002w6-Kk
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 22:28:01 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67c3fa66-767e-11ed-91b6-6bf2151ebd3b;
 Wed, 07 Dec 2022 23:28:00 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2FFB5B8218D;
 Wed,  7 Dec 2022 22:27:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 044E7C433D6;
 Wed,  7 Dec 2022 22:27:56 +0000 (UTC)
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
X-Inumbo-ID: 67c3fa66-767e-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670452077;
	bh=tgPQ2mWMzxgSkGzvglQ1jFn5k21sCkirOeqVwzNCPt0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZWjDzpJOj7W+YxRU22IEsBjo0qVy4F1Y2Rz3j5hbFVxhVqoaOr8ZzQhK69aCYIpae
	 h3kdSixX4bRhiG2PhvXeVzztwrt7AOi71JRJ7jg2az5I9C7d63Rxhb8SYIW9XsuHjd
	 uoQrl/xmErz+ZF3NoYuYiF21cxqBvmr17NrddTnN1R7ex4izWkHcSmzcfrZcjIB7bM
	 d4R4PK1QA8esfT5vb7665Veq/xJA6Pi2UisIbujGw4uqwE7gGZc0uQJJ0AFReBE2Hi
	 Br3yysEyFaGiDLpdZZHwXAFlthWLp9yqRjw0yQDni1IDiyOeHEBAwGScWE5XB8SB2x
	 nxdMnxA0nIDOw==
Date: Wed, 7 Dec 2022 14:27:55 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/3] xen/arm: Add memory overlap check for
 bootinfo.reserved_mem
In-Reply-To: <8e635354-fdf4-a37f-0dba-c4b29063e152@xen.org>
Message-ID: <alpine.DEB.2.22.394.2212071424060.4039@ubuntu-linux-20-04-desktop>
References: <20221205025753.2178965-1-Henry.Wang@arm.com> <20221205025753.2178965-2-Henry.Wang@arm.com> <alpine.DEB.2.22.394.2212061716170.4039@ubuntu-linux-20-04-desktop> <8e635354-fdf4-a37f-0dba-c4b29063e152@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 7 Dec 2022, Julien Grall wrote:
> Hi Stefano,
> 
> On 07/12/2022 01:37, Stefano Stabellini wrote:
> > On Mon, 5 Dec 2022, Henry Wang wrote:
> > > As we are having more and more types of static region, and all of
> > > these static regions are defined in bootinfo.reserved_mem, it is
> > > necessary to add the overlap check of reserved memory regions in Xen,
> > > because such check will help user to identify the misconfiguration in
> > > the device tree at the early stage of boot time.
> > > 
> > > Currently we have 3 types of static region, namely (1) static memory,
> > > (2) static heap, (3) static shared memory. (1) and (2) are parsed by
> > > the function `device_tree_get_meminfo()` and (3) is parsed using its
> > > own logic. Therefore, to unify the checking logic for all of these
> > > types of static region, this commit firstly introduces a helper
> > > `check_reserved_regions_overlap()` to check if an input physical
> > > address range is overlapping with the existing reserved memory regions
> > > defined in bootinfo. After that, use this helper in
> > > `device_tree_get_meminfo()` to do the overlap check of (1) and (2)
> > > and replace the original overlap check of (3) with this new helper.
> > > 
> > > Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> > 
> > I wonder if the check should only be done #ifdef DEBUG. The idea would
> > be that a given static configuration should be validated and corrected
> > before going into production. By the time you go in production, it is
> > too late to do checks anyway. Especially the panic below.
> > 
> > Julien, Bertrand, what do you think about this?
> 
> The integrator may be a different person (or even a different company) than
> the one building Xen.
> 
> So I think, the new check shoudl not be protected by CONFIG_DEBUG.

It is almost like we need something else to say "this is really a
production build, disable all checks, I want it to go fast and be as
small as possible". Maybe it would be better as a new kconfig option?

In any case, this patch is OK as is.


> That said, any output in bootfd will only printed when earlyprintk is enabled.
> I think we should consider to support dynamic early printk. Anyway, that's
> something that doesn't need to be handled in this series.

+1


> > > ---
> > >   xen/arch/arm/bootfdt.c           | 13 ++++----
> > >   xen/arch/arm/include/asm/setup.h |  2 ++
> > >   xen/arch/arm/setup.c             | 52 ++++++++++++++++++++++++++++++++
> > >   3 files changed, 60 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> > > index 6014c0f852..b31379b9ac 100644
> > > --- a/xen/arch/arm/bootfdt.c
> > > +++ b/xen/arch/arm/bootfdt.c
> > > @@ -91,6 +91,9 @@ static int __init device_tree_get_meminfo(const void
> > > *fdt, int node,
> > >       for ( i = 0; i < banks && mem->nr_banks < NR_MEM_BANKS; i++ )
> > >       {
> > >           device_tree_get_reg(&cell, address_cells, size_cells, &start,
> > > &size);
> > > +        if ( mem == &bootinfo.reserved_mem &&
> > > +             check_reserved_regions_overlap(start, size) )
> > > +            return -EINVAL;
> > >           /* Some DT may describe empty bank, ignore them */
> > >           if ( !size )
> > >               continue;
> > > @@ -485,7 +488,9 @@ static int __init process_shm_node(const void *fdt,
> > > int node,
> > >                   return -EINVAL;
> > >               }
> > >   -            if ( (end <= mem->bank[i].start) || (paddr >= bank_end) )
> > > +            if ( check_reserved_regions_overlap(paddr, size) )
> > > +                return -EINVAL;
> > > +            else
> > >               {
> > >                   if ( strcmp(shm_id, mem->bank[i].shm_id) != 0 )
> > >                       continue;
> > > @@ -496,12 +501,6 @@ static int __init process_shm_node(const void *fdt,
> > > int node,
> > >                       return -EINVAL;
> > >                   }
> > >               }
> > > -            else
> > > -            {
> > > -                printk("fdt: shared memory region overlap with an
> > > existing entry %#"PRIpaddr" - %#"PRIpaddr"\n",
> > > -                        mem->bank[i].start, bank_end);
> > > -                return -EINVAL;
> > > -            }
> > >           }
> > >       }
> > >   diff --git a/xen/arch/arm/include/asm/setup.h
> > > b/xen/arch/arm/include/asm/setup.h
> > > index fdbf68aadc..6a9f88ecbb 100644
> > > --- a/xen/arch/arm/include/asm/setup.h
> > > +++ b/xen/arch/arm/include/asm/setup.h
> > > @@ -143,6 +143,8 @@ void fw_unreserved_regions(paddr_t s, paddr_t e,
> > >   size_t boot_fdt_info(const void *fdt, paddr_t paddr);
> > >   const char *boot_fdt_cmdline(const void *fdt);
> > >   +int check_reserved_regions_overlap(paddr_t region_start, paddr_t
> > > region_size);
> > > +
> > >   struct bootmodule *add_boot_module(bootmodule_kind kind,
> > >                                      paddr_t start, paddr_t size, bool
> > > domU);
> > >   struct bootmodule *boot_module_find_by_kind(bootmodule_kind kind);
> > > diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> > > index 4395640019..94d232605e 100644
> > > --- a/xen/arch/arm/setup.c
> > > +++ b/xen/arch/arm/setup.c
> > > @@ -270,6 +270,42 @@ static void __init dt_unreserved_regions(paddr_t s,
> > > paddr_t e,
> > >       cb(s, e);
> > >   }
> > >   +static int __init overlap_check(void *bootinfo_type,
> > > +                                paddr_t region_start, paddr_t region_end)
> > > +{
> > > +    unsigned int i, num = 0;
> > > +    paddr_t bank_start = INVALID_PADDR, bank_end = 0;
> > > +    char *type_str = "NONAME";
> > > +
> > > +    if ( bootinfo_type == &bootinfo.reserved_mem )
> > > +    {
> > > +        num = bootinfo.reserved_mem.nr_banks;
> > > +        type_str = "reserved_mem";
> > > +    }
> > > +    else
> > > +        panic("Invalid bootinfo type passed to overlap check\n");
> > > +
> > > +    for ( i = 0; i < num; i++ )
> > > +    {
> > > +        if ( bootinfo_type == &bootinfo.reserved_mem )
> > > +        {
> > > +            bank_start = bootinfo.reserved_mem.bank[i].start;
> > > +            bank_end = bank_start + bootinfo.reserved_mem.bank[i].size;
> > > +        }
> > > +
> > > +        if ( region_end <= bank_start || region_start >= bank_end )
> > > +            continue;
> > > +        else
> > > +        {
> > > +            printk("%s: Region %#"PRIpaddr" - %#"PRIpaddr" overlapping
> > > with bank[%u] %#"PRIpaddr" - %#"PRIpaddr"\n",
> > > +                   type_str, region_start, region_end, i, bank_start,
> > > bank_end);
> > > +            return -EINVAL;
> > > +        }
> > > +    }
> > > +
> > > +    return 0;
> > > +}
> > 
> > As much as I dislike MACROs in general I think this function should be
> > written as a MACRO so that we can write it once for all use cases. The
> > below in not compiled and not tested, just for explanation purposes.
> > Look how much simpler the code becomes.
> 
> I agree the duplication is not nice. But it is not clear to me why a static
> inline function cannot be used.

You mean a macro generating static inline functions?

It cannot be a single static inline function because the bootinfo
arguments are of three different types, it just happens that all three
have a "start" and "size" struct member so it works great with a macro,
but doesn't for a function.


> > 
> > #define overlap_check(bootinfo,     \
> >                        num,          \
> >                        region_start, \
> >                        region_end)   \
> > ({  \
> >      unsigned int i, ret; \
> >      paddr_t bank_start = INVALID_PADDR, bank_end = 0; \
> >      \
> >      for ( i = 0; i < num; i++ ) \
> >      { \
> >          bank_start = bootinfo->start; \
> >          bank_end = bank_start + bootinfo->size; \
> >      \
> >          if ( region_end <= bank_start || region_start >= bank_end ) \
> >              continue; \
> >          else \
> >          { \
> >              printk("Region %#"PRIpaddr" - %#"PRIpaddr" overlapping with
> > bank[%u] %#"PRIpaddr" - %#"PRIpaddr"\n", \
> >                     region_start, region_end, i, bank_start, bank_end); \
> >              ret = -EINVAL; \
> >              break; \
> >          } \
> >      } \
> >      \
> >      retval = 0; \
> >      retval;\
> > })
> > 
> > 
> > And the caller:
> > 
> > check_reserved_regions_overlap(&bootinfo.reserved_mem,
> >                                 bootinfo.reserved_mem.nr_banks,
> >                                 start, size);

