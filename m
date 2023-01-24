Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9C7678CA8
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 01:13:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483366.749498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK6vk-0006vC-2f; Tue, 24 Jan 2023 00:12:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483366.749498; Tue, 24 Jan 2023 00:12:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK6vj-0006sr-W1; Tue, 24 Jan 2023 00:12:51 +0000
Received: by outflank-mailman (input) for mailman id 483366;
 Tue, 24 Jan 2023 00:12:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wk+X=5V=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pK6vi-0006sl-98
 for xen-devel@lists.xenproject.org; Tue, 24 Jan 2023 00:12:50 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5138a01-9b7b-11ed-b8d1-410ff93cb8f0;
 Tue, 24 Jan 2023 01:12:47 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3E705B80EF1;
 Tue, 24 Jan 2023 00:12:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D047C433D2;
 Tue, 24 Jan 2023 00:12:44 +0000 (UTC)
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
X-Inumbo-ID: d5138a01-9b7b-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674519165;
	bh=+zVOav+xfHiiyz9QiF0DoSvUa/Eu3zqbeOq7fVYdDXY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AcWNaqO8OUbXno/TKsAHr49S8QhV8f2ZXXC/S42/B5nAb4HCZJPK6/ijyjfBqzy8b
	 fvb9/vjhFsa0KE5T762qjdb2PILHr94//t8ms/h08G6bUVifVLpV2s8ggCx5KXmBVg
	 wXBo1pthLQZn6wAe4BNVBPHik109jnLD81kG4/AERN1+/3C8Q5eeYHnwv7Ogs8KBL4
	 xnnSTacY1IOsZXEZCtP/4ilL+HUF/qOKKt8UoUlaUGAmE+gqpny2jsEplSwHR2CYHQ
	 aZI1SjGCJ3I7BlyEwFSr2yjF7yJrpujNfkAa6PSac18CCMg6I5qh0ttCVDCpG/gwff
	 VdSMc7lEDlOMA==
Date: Mon, 23 Jan 2023 16:12:43 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 22/22] xen/arm64: Allow the admin to enable/disable the
 directmap
In-Reply-To: <92c4daa2-d841-3109-c1ec-4bdb088d6670@xen.org>
Message-ID: <alpine.DEB.2.22.394.2301231605291.1978264@ubuntu-linux-20-04-desktop>
References: <20221216114853.8227-1-julien@xen.org> <20221216114853.8227-23-julien@xen.org> <alpine.DEB.2.22.394.2301231437170.1978264@ubuntu-linux-20-04-desktop> <92c4daa2-d841-3109-c1ec-4bdb088d6670@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 23 Jan 2023, Julien Grall wrote:
> Hi Stefano,
> 
> On 23/01/2023 22:52, Stefano Stabellini wrote:
> > On Fri, 16 Dec 2022, Julien Grall wrote:
> > > From: Julien Grall <jgrall@amazon.com>
> > > 
> > > Implement the same command line option as x86 to enable/disable the
> > > directmap. By default this is kept enabled.
> > > 
> > > Also modify setup_directmap_mappings() to populate the L0 entries
> > > related to the directmap area.
> > > 
> > > Signed-off-by: Julien Grall <jgrall@amazon.com>
> > > 
> > > ----
> > >      This patch is in an RFC state we need to decide what to do for arm32.
> > > 
> > >      Also, this is moving code that was introduced in this series. So
> > >      this will need to be fix in the next version (assuming Arm64 will
> > >      be ready).
> > > 
> > >      This was sent early as PoC to enable secret-free hypervisor
> > >      on Arm64.
> > > ---
> > >   docs/misc/xen-command-line.pandoc   |  2 +-
> > >   xen/arch/arm/include/asm/arm64/mm.h |  2 +-
> > >   xen/arch/arm/include/asm/mm.h       | 12 +++++----
> > >   xen/arch/arm/mm.c                   | 40 +++++++++++++++++++++++++++--
> > >   xen/arch/arm/setup.c                |  1 +
> > >   5 files changed, 48 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/docs/misc/xen-command-line.pandoc
> > > b/docs/misc/xen-command-line.pandoc
> > > index a63e4612acac..948035286acc 100644
> > > --- a/docs/misc/xen-command-line.pandoc
> > > +++ b/docs/misc/xen-command-line.pandoc
> > > @@ -760,7 +760,7 @@ Specify the size of the console debug trace buffer. By
> > > specifying `cpu:`
> > >   additionally a trace buffer of the specified size is allocated per cpu.
> > >   The debug trace feature is only enabled in debugging builds of Xen.
> > >   -### directmap (x86)
> > > +### directmap (arm64, x86)
> > >   > `= <boolean>`
> > >     > Default: `true`
> > > diff --git a/xen/arch/arm/include/asm/arm64/mm.h
> > > b/xen/arch/arm/include/asm/arm64/mm.h
> > > index aa2adac63189..8b5dcb091750 100644
> > > --- a/xen/arch/arm/include/asm/arm64/mm.h
> > > +++ b/xen/arch/arm/include/asm/arm64/mm.h
> > > @@ -7,7 +7,7 @@
> > >    */
> > >   static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned
> > > long nr)
> > >   {
> > > -    return true;
> > > +    return opt_directmap;
> > >   }
> > >     #endif /* __ARM_ARM64_MM_H__ */
> > > diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> > > index d73abf1bf763..ef9ad3b366e3 100644
> > > --- a/xen/arch/arm/include/asm/mm.h
> > > +++ b/xen/arch/arm/include/asm/mm.h
> > > @@ -9,6 +9,13 @@
> > >   #include <public/xen.h>
> > >   #include <xen/pdx.h>
> > >   +extern bool opt_directmap;
> > > +
> > > +static inline bool arch_has_directmap(void)
> > > +{
> > > +    return opt_directmap;
> > > +}
> > > +
> > >   #if defined(CONFIG_ARM_32)
> > >   # include <asm/arm32/mm.h>
> > >   #elif defined(CONFIG_ARM_64)
> > > @@ -411,11 +418,6 @@ static inline void page_set_xenheap_gfn(struct
> > > page_info *p, gfn_t gfn)
> > >       } while ( (y = cmpxchg(&p->u.inuse.type_info, x, nx)) != x );
> > >   }
> > >   -static inline bool arch_has_directmap(void)
> > > -{
> > > -    return true;
> > > -}
> > > -
> > >   /* Helpers to allocate, map and unmap a Xen page-table */
> > >   int create_xen_table(lpae_t *entry);
> > >   lpae_t *xen_map_table(mfn_t mfn);
> > > diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> > > index f5fb957554a5..925d81c450e8 100644
> > > --- a/xen/arch/arm/mm.c
> > > +++ b/xen/arch/arm/mm.c
> > > @@ -15,6 +15,7 @@
> > >   #include <xen/init.h>
> > >   #include <xen/libfdt/libfdt.h>
> > >   #include <xen/mm.h>
> > > +#include <xen/param.h>
> > >   #include <xen/pfn.h>
> > >   #include <xen/pmap.h>
> > >   #include <xen/sched.h>
> > > @@ -131,6 +132,12 @@ vaddr_t directmap_virt_start __read_mostly;
> > >   unsigned long directmap_base_pdx __read_mostly;
> > >   #endif
> > >   +bool __ro_after_init opt_directmap = true;
> > > +/* TODO: Decide what to do for arm32. */
> > > +#ifdef CONFIG_ARM_64
> > > +boolean_param("directmap", opt_directmap);
> > > +#endif
> > > +
> > >   unsigned long frametable_base_pdx __read_mostly;
> > >   unsigned long frametable_virt_end __read_mostly;
> > >   @@ -606,16 +613,27 @@ void __init setup_directmap_mappings(unsigned long
> > > base_mfn,
> > >       directmap_virt_end = XENHEAP_VIRT_START + nr_mfns * PAGE_SIZE;
> > >   }
> > >   #else /* CONFIG_ARM_64 */
> > > -/* Map the region in the directmap area. */
> > > +/*
> > > + * This either populate a valid fdirect map, or allocates empty L1 tables
> > 
> > fdirect/direct
> > 
> > 
> > > + * and creates the L0 entries for the given region in the direct map
> > > + * depending on arch_has_directmap().
> > > + *
> > > + * When directmap=no, we still need to populate empty L1 tables in the
> > > + * directmap region. The reason is that the root page-table (i.e. L0)
> > > + * is per-CPU and secondary CPUs will initialize their root page-table
> > > + * based on the pCPU0 one. So L0 entries will be shared if they are
> > > + * pre-populated. We also rely on the fact that L1 tables are never
> > > + * freed.
> > 
> > You are saying that in case of directmap=no we are still creating empty
> > L1 tables and L0 entries because secondary CPUs will need them when they
> > initialize their root pagetables.
> > 
> > But why? Secondary CPUs will not be using the directmap either? Why do
> > seconday CPUs need the empty L1 tables?
> 
> From the cover letter,
> 
> "
> The subject is probably a misnomer. The directmap is still present but
> the RAM is not mapped by default. Instead, the region will still be used
> to map pages allocate via alloc_xenheap_pages().
> 
> The advantage is the solution is simple (so IHMO good enough for been
> merged as a tech preview). The disadvantage is the page allocator is not
> trying to keep all the xenheap pages together. So we may end up to have
> an increase of page table usage.
> 
> In the longer term, we should consider to remove the direct map
> completely and switch to vmap(). The main problem with this approach
> is it is frequent to use mfn_to_virt() in the code. So we would need
> to cache the mapping (maybe in the struct page_info).
> "

Ah yes! I see it now that we are relying on the same area
(alloc_xenheap_pages calls page_to_virt() then map_pages_to_xen()).

map_pages_to_xen() is able to create pagetable entries at every level,
but we need to make sure they are shared across per-cpu pagetables. To
make that happen, we are pre-creating the L0/L1 entries here so that
they become common across all per-cpu pagetables and then we let
map_pages_to_xen() do its job.

Did I understand it right?


> I can add summary in the commit message.

I would suggest to improve a bit the in-code comment on top of
setup_directmap_mappings. I might also be able to help with the text
once I am sure I understood what is going on :-)

