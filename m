Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 000944F9FB9
	for <lists+xen-devel@lfdr.de>; Sat,  9 Apr 2022 00:47:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301801.515121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncxNT-0005l5-0i; Fri, 08 Apr 2022 22:46:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301801.515121; Fri, 08 Apr 2022 22:46:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncxNS-0005iP-U0; Fri, 08 Apr 2022 22:46:50 +0000
Received: by outflank-mailman (input) for mailman id 301801;
 Fri, 08 Apr 2022 22:46:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5u+K=US=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ncxNQ-0005iJ-I3
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 22:46:48 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c479111c-b78d-11ec-8fbc-03012f2f19d4;
 Sat, 09 Apr 2022 00:46:47 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 08BD6B82BFA;
 Fri,  8 Apr 2022 22:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 703E2C385A3;
 Fri,  8 Apr 2022 22:46:43 +0000 (UTC)
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
X-Inumbo-ID: c479111c-b78d-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649458003;
	bh=4aHfOaNyNQRjnkOEi1kEdQeYOXfCqpP1x4neRiU/2DQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dy4d4igpXnmjxw8H9RC6gzR5jk37ZgBhne0PbOiJi92AQQlh2tCzNZq7qJ6pt3hu0
	 3MlJE9sJAJbnTio2z734mgPuv2M2wBkTpgvpvP/wv7Uri1I8VQhP92YIpmxWbNzl/n
	 dWVs3yAo/InsgjDhUrn3fTlp89rszS4goxOoF4kAJrl4Bn7AcBemEbr/ejicUXVfxP
	 xvNiC4G1ouwiojvduzXZAD9ICMsRNtnKNR1KjXbZ9slUt0er5mG1ITgCO3pKFfOwUC
	 8EnV4XLtjM7hhjxDz7m7cXjB5vWDa1TmZFp6SZJQ2ACEjuT7RXSdWcbIQfim+bm72c
	 1cwAzUyitDnCw==
Date: Fri, 8 Apr 2022 15:46:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    nd <nd@arm.com>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v1 11/13] xen/arm: store shm-info for deferred foreign
 memory map
In-Reply-To: <DU2PR08MB732592AD40BAA48F390445AAF71E9@DU2PR08MB7325.eurprd08.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2204081523110.3066615@ubuntu-linux-20-04-desktop>
References: <20220311061123.1883189-1-Penny.Zheng@arm.com> <20220311061123.1883189-12-Penny.Zheng@arm.com> <alpine.DEB.2.22.394.2203171831410.3497@ubuntu-linux-20-04-desktop> <DU2PR08MB732592AD40BAA48F390445AAF71E9@DU2PR08MB7325.eurprd08.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 29 Mar 2022, Penny Zheng wrote:
> > On Fri, 11 Mar 2022, Penny Zheng wrote:
> > > From: Penny Zheng <penny.zheng@arm.com>
> > >
> > > In a few scenarios where owner domain, is defined after borrower
> > > domain in device tree configuration, then statically shared pages
> > > haven't been properly allocated if borrower domain tries to do foreign
> > > memory map during domain construction.
> > >
> > > In order to cover such scenario, we defer all borrower domains'
> > > foreign memory map after all domain construction finished, then only
> > > need to store shm-info during domain construction.
> > >
> > > Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> > > ---
> > >  xen/arch/arm/domain.c             |  3 +++
> > >  xen/arch/arm/domain_build.c       | 34 ++++++++++++++++++++++++++++++-
> > >  xen/arch/arm/include/asm/domain.h | 25 +++++++++++++++++++++++
> > >  3 files changed, 61 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c index
> > > f0bfd67fe5..73ffbfb918 100644
> > > --- a/xen/arch/arm/domain.c
> > > +++ b/xen/arch/arm/domain.c
> > > @@ -47,6 +47,9 @@ DEFINE_PER_CPU(struct vcpu *, curr_vcpu);
> > >
> > >  #ifdef CONFIG_STATIC_SHM
> > >  struct domain *__read_mostly dom_shared;
> > > +
> > > +shm_info_t shm_list[NR_MEM_BANKS];
> > 
> > Instead of adding shm_list, maybe we can we re-use mem->bank
> > (bootinfo.reserved_mem)?
> > 
> > It is already storing the physical address and size (added in patch #1 with
> > process_shm_node). We should be able to find the other info from the mfn:
> > mfn_to_page, page_get_owner, mfn_to_gfn. At most, we need to mark the
> > memory bank as shared and we could do that with another field in struct
> > membank.
> > 
> > 
> > > +DECLARE_BITMAP(shm_list_mask, NR_MEM_BANKS);
> > 
> > This is the third bitmask we introduce :-)
> > 
> > Can we narrow it down to a single bitmask? Maybe we don't need it at all if we
> > switch to using bootinfo.mem.bank.
> > 
> > 
> > >  #endif
> > >
> > >  static void do_idle(void)
> > > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > > index 7ee4d33e0b..4b19160674 100644
> > > --- a/xen/arch/arm/domain_build.c
> > > +++ b/xen/arch/arm/domain_build.c
> > > @@ -771,7 +771,7 @@ static mfn_t __init
> > > acquire_shared_memory_bank(struct domain *d,
> > >
> > >  }
> > >
> > > -static int __init allocate_shared_memory(struct domain *d,
> > > +static int __init allocate_shared_memory(struct domain *d, u32
> > > +shm_id,
> > 
> > No need for it to be u32?
> > 
> > 
> > >                                           u32 addr_cells, u32 size_cells,
> > >                                           paddr_t pbase, paddr_t psize,
> > >                                           paddr_t gbase) @@ -795,6
> > > +795,18 @@ static int __init allocate_shared_memory(struct domain *d,
> > >          return ret;
> > >      }
> > >
> > > +    /*
> > > +     * If owner domain is not default dom_shared, shm-info of owner domain
> > > +     * shall also be recorded for later deferred foreign memory map.
> > > +     */
> > > +    if ( d != dom_shared )
> > > +    {
> > > +        shm_list[shm_id].owner_dom = d->domain_id;
> > > +        shm_list[shm_id].owner_gbase = gbase;
> > > +        shm_list[shm_id].size = psize;
> > > +        set_bit(shm_id, shm_list_mask);
> > > +    }
> > >      return ret;
> > >  }
> > >
> > > @@ -962,6 +974,26 @@ static int __init process_shm(struct domain *d,
> > >              if ( ret )
> > >                  return ret;
> > >          }
> > > +        else
> > > +        {
> > > +            if ( strcmp(role_str, "borrower") == 0 )
> > > +            {
> > > +                /*
> > > +                 * In a few scenarios where owner domain, is defined after
> > > +                 * borrower domain in device tree configuration, statically
> > > +                 * shared pages haven't been properly allocated if borrower
> > > +                 * domain here tries to do foreign memory map.
> > > +                 * In order to cover such scenario, we defer all borrower
> > > +                 * domains'foreign memory map after all domain construction
> > > +                 * finished, and only store shm-info here for later use.
> > > +                 */
> > > +                shm_list[shm_id].borrower_dom[shm_list[shm_id].nr_borrower] =
> > > +                                                                d->domain_id;
> > > +                shm_list[shm_id].borrower_gbase[shm_list[shm_id].nr_borrower] =
> > > +                                                                gbase;
> > > +                shm_list[shm_id].nr_borrower++;
> > > +            }
> > > +        }
> > 
> > Maybe we don't need to defer this at all. guest_physmap_add_shm does only
> > two things:
> > 
> > 1) get a page ref using the owner domain
> > 2) add page to borrower p2m
> > 
> > 
> > We can do 2) straight away even if the owner is not yet allocated.
> > 
> > For 1), we need to get the right amount of references when the owner is
> > allocated (which could be after the borrowers).
> > 
> > Keeping in mind that we have already parsed all the info in
> > xen/arch/arm/bootfdt.c:process_shm_node, I wonder if we can add a field to
> > mem->bank[mem->nr_banks] to keep a count of the number of borrowers.
> > 
> > Then when we allocate the page to the owner here, we just get as many
> > additional reference as the number of borrowers.
> > 
> > This would:
> > - add a field to bootinfo.reserved_mem
> > - remove the need for shm_list
> > - remove the need for shm_list_mask
> > - remove the need for the deferral
> > 
> > Just trying to make things simpler :-)
> > 
> 
> Thanks for the detailed comments.
> Here is what I thought and understood, PLZ correct me if I'm wrong. ;)
> '''
> > For 1), we need to get the right amount of references when the owner is
> > allocated (which could be after the borrowers).
> '''
> We could add another field `nr_shm_borrowers` in struct membank to
> keep a count of the number of borrowers, which is also the number of
> the reference count. 

Yes


> And like you said, it shall be done in xen/arch/arm/bootfdt.c:process_shm_node.
> The only shortcoming here is that we need to iterate the parsed shm
> mem banks each time to do the increment, since we used shm_mask
> at first to treat space with time, but it really could decrease the
> complexity here and remove all the defer codes.

Yes, that's true, but the number of elements in the array should be very
small. We can always optimized data structures later if needed. Also, we
would save one loop in shm_init_late.


> But here is another concern about the shm_list. Another reason why I
> created shm_list is that when destroyed domain is an owner domain, 
> we need to unmap shared memory for all borrower domains too. IMO,
> so that it fits the definition of owner and borrower. It is also
> what commit "xen/arm: unmap foreign memory mapping when
> destroyed domain is owner domain" is trying to solve.

Actually, I am not sure about this. I don't think that we need to unmap
the memory at the borrowers. We just decrease the ref count on the
pages. When the borrower domains die, the ref count goes to zero and the
pages are finally freed.

So I don't think that when the owner dies, we need to actively go and
unmap the pages at the borrowers. Also because it would likely cause
them to crash: from their point of view the memory was there, and
suddenly it is not there anymore.

But we don't need to do anything special to decrease the ref count on
the shared pages because it would happen automatically when the owner
domain is destroyed.


> we need a way to find all borrower domains info, when you
> only know the owner domain.
> Based on your suggestion, I suggest to add new field
> ` domid_t *shm_borrower_dom` and `paddr_t *shm_borrower_gbase`
> in struct membank. And both two fields are going to be allocated and set
> during domain construction phase xen/arch/arm/domain_build.c:process_shm.
> 
> Another thing is that maybe we could not store all above shared mem
> banks in bootinfo.reserved_mem, since it is only valid during boot time,
> and we need that info also for domain deconstruction at runtime.
> Another struct meminfo shm_list may still also be needed.
> 
> BTW, I suggest that the index of shm_list.bank is shm_id
> In case user abuse it in device tree configuration, we let xen to allocate.
> In xen/arch/arm/bootfdt.c:process_shm_node, each time parsing a new
> shm node, iterate the whole shm_list and only if the physical
> address and size of all entries are not matched, we allocate a new bank for the
> shm node.  
>  
> > 
> > >          /*
> > >           * Record static shared memory region info for later setting
> > > diff --git a/xen/arch/arm/include/asm/domain.h
> > > b/xen/arch/arm/include/asm/domain.h
> > > index 6df37d2c46..1c0f2e22ca 100644
> > > --- a/xen/arch/arm/include/asm/domain.h
> > > +++ b/xen/arch/arm/include/asm/domain.h
> > > @@ -10,6 +10,7 @@
> > >  #include <asm/gic.h>
> > >  #include <asm/vgic.h>
> > >  #include <asm/vpl011.h>
> > > +#include <asm/setup.h>
> > >  #include <public/hvm/params.h>
> > >
> > >  struct hvm_domain
> > > @@ -33,6 +34,30 @@ enum domain_type {
> > >
> > >  #ifdef CONFIG_STATIC_SHM
> > >  extern struct domain *dom_shared;
> > > +
> > > +/* Maximum number of borrower domains. */ #define NR_SHM_DOMAIN
> > 32
> > > +/*
> > > + * shm_list is indexed by unique identifier "xen,shm-id", but it only
> > > +stores
> > > + * a subset of static shared memory regions, of which owner domain is
> > > +not the
> > > + * default dom_shared.
> > > + * shm_list_mask bitmask is to record the position of these static
> > > +shared
> > > + * memory regions.
> > > + * Per bit represents a entry in shm_list, and setting it 1 means the
> > > + * static shared memory region here is owned by a specific domain,
> > > +then bit 0
> > > + * means the static shared memory region here is either owned by the
> > > +default
> > > + * dom_shared or no static shared memory region here at all.
> > > + */
> > > +typedef struct {
> > > +    domid_t owner_dom;
> > > +    paddr_t owner_gbase;
> > > +    paddr_t size;
> > > +    domid_t borrower_dom[NR_SHM_DOMAIN];
> > > +    paddr_t borrower_gbase[NR_SHM_DOMAIN];
> > > +    unsigned long nr_borrower;
> > > +} shm_info_t;
> > > +extern shm_info_t shm_list[NR_MEM_BANKS]; extern unsigned long
> > > +shm_list_mask[BITS_TO_LONGS(NR_MEM_BANKS)];
> > >  #else
> > >  #define dom_shared NULL
> > >  #endif
> > > --
> > > 2.25.1
> > >
> 

