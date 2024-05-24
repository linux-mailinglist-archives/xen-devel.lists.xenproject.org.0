Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD7F8CEC7B
	for <lists+xen-devel@lfdr.de>; Sat, 25 May 2024 00:50:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729944.1135272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAdis-0000XN-8Q; Fri, 24 May 2024 22:49:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729944.1135272; Fri, 24 May 2024 22:49:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAdis-0000VJ-5e; Fri, 24 May 2024 22:49:14 +0000
Received: by outflank-mailman (input) for mailman id 729944;
 Fri, 24 May 2024 22:49:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K6bJ=M3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sAdiq-0000VD-VK
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 22:49:12 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5e86990-1a1f-11ef-90a1-e314d9c70b13;
 Sat, 25 May 2024 00:49:11 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4E40A61255;
 Fri, 24 May 2024 22:49:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 462EFC2BBFC;
 Fri, 24 May 2024 22:49:07 +0000 (UTC)
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
X-Inumbo-ID: d5e86990-1a1f-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716590950;
	bh=0rp9M/83s6/hHN25ro65L52vQUSP8Gvb0ejiv3SUi3s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DgiBPkJSJiBgYey3oQHiOGSRrmbUVl0OBVAUOP8hZIxNmMbBghYevOFqWg2HKlgVx
	 56zFoZZEVYXlx1fnvuMVNiw/JDBMlMGH2bXvYkvre3Dik/+khK6UcrfJqlWFPOpgKX
	 05PylNUzm78Hs7JOcYSqblmvjwV7N7KHqSEs2NHe7M1E++Vi6XBs/LtXRkGk72gYhm
	 x4BhNaLDmEH+OsW1Nav+B77B9VAaz43mCShb6JNPSsK0h8SXgW5R0MYmSEnd2c1LTB
	 kNOC5EbdfxDl3lk/i9gUoM+U9y5Z2RDDZxOYYQGVMeZSqS1DHtVRrx/GKAMKPc9GoK
	 Ob2hG+I7Bq95A==
Date: Fri, 24 May 2024 15:49:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Henry Wang <xin.wang2@amd.com>, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Alec Kwapis <alec.kwapis@medtronic.com>, 
    "Daniel P . Smith" <dpsmith@apertussolutions.com>, 
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 2/4] xen/arm: Alloc XenStore page for Dom0less DomUs
 from hypervisor
In-Reply-To: <cf0a096a-0fe8-4d91-a064-910bd6c43951@xen.org>
Message-ID: <alpine.DEB.2.22.394.2405241536510.2557291@ubuntu-linux-20-04-desktop>
References: <20240517032156.1490515-1-xin.wang2@amd.com> <20240517032156.1490515-3-xin.wang2@amd.com> <cf0a096a-0fe8-4d91-a064-910bd6c43951@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 24 May 2024, Julien Grall wrote:
> Hi Henry,
> 
> + Juergen as the Xenstore maintainers. I'd like his opinion on the approach.
> The documentation of the new logic is in:
> 
> https://lore.kernel.org/xen-devel/20240517032156.1490515-5-xin.wang2@amd.com/
> 
> FWIW I am happy in principle with the logic (this is what we discussed on the
> call last week). Some comments below.
> 
> On 17/05/2024 04:21, Henry Wang wrote:
> > There are use cases (for example using the PV driver) in Dom0less
> > setup that require Dom0less DomUs start immediately with Dom0, but
> > initialize XenStore later after Dom0's successful boot and call to
> > the init-dom0less application.
> > 
> > An error message can seen from the init-dom0less application on
> > 1:1 direct-mapped domains:
> > ```
> > Allocating magic pages
> > memory.c:238:d0v0 mfn 0x39000 doesn't belong to d1
> > Error on alloc magic pages
> > ```
> > 
> > The "magic page" is a terminology used in the toolstack as reserved
> > pages for the VM to have access to virtual platform capabilities.
> > Currently the magic pages for Dom0less DomUs are populated by the
> > init-dom0less app through populate_physmap(), and populate_physmap()
> > automatically assumes gfn == mfn for 1:1 direct mapped domains. This
> > cannot be true for the magic pages that are allocated later from the
> > init-dom0less application executed in Dom0. For domain using statically
> > allocated memory but not 1:1 direct-mapped, similar error "failed to
> > retrieve a reserved page" can be seen as the reserved memory list is
> > empty at that time.
> > 
> > Since for init-dom0less, the magic page region is only for XenStore.
> > To solve above issue, this commit allocates the XenStore page for
> > Dom0less DomUs at the domain construction time. The PFN will be
> > noted and communicated to the init-dom0less application executed
> > from Dom0. To keep the XenStore late init protocol, set the connection
> > status to XENSTORE_RECONNECT.
> 
> So this commit is allocating the page, but it will not be used by
> init-dom0less until the next patch. But Linux could use it. So would this
> break bisection? If so, then I think patch #3 needs to be folded in this
> patch.

I think that's fine, I'll leave that with you on commit. I'll resend as
is addressing the other comments.


> > 
> > Reported-by: Alec Kwapis <alec.kwapis@medtronic.com>
> > Suggested-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> > Signed-off-by: Henry Wang <xin.wang2@amd.com>
> > ---
> > v3:
> > - Only allocate XenStore page. (Julien)
> > - Set HVM_PARAM_STORE_PFN and the XenStore connection status directly
> >    from hypervisor. (Stefano)
> > v2:
> > - Reword the commit msg to explain what is "magic page" and use generic
> >    terminology "hypervisor reserved pages" in commit msg. (Daniel)
> > - Also move the offset definition of magic pages. (Michal)
> > - Extract the magic page allocation logic to a function. (Michal)
> > ---
> >   xen/arch/arm/dom0less-build.c | 44 ++++++++++++++++++++++++++++++++++-
> >   1 file changed, 43 insertions(+), 1 deletion(-)
> > 
> > diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> > index 74f053c242..95c4fd1a2d 100644
> > --- a/xen/arch/arm/dom0less-build.c
> > +++ b/xen/arch/arm/dom0less-build.c
> > @@ -1,5 +1,6 @@
> >   /* SPDX-License-Identifier: GPL-2.0-only */
> >   #include <xen/device_tree.h>
> > +#include <xen/domain_page.h>
> >   #include <xen/err.h>
> >   #include <xen/event.h>
> >   #include <xen/grant_table.h>
> > @@ -10,6 +11,8 @@
> >   #include <xen/sizes.h>
> >   #include <xen/vmap.h>
> >   +#include <public/io/xs_wire.h>
> > +
> >   #include <asm/arm64/sve.h>
> >   #include <asm/dom0less-build.h>
> >   #include <asm/domain_build.h>
> > @@ -739,6 +742,42 @@ static int __init alloc_xenstore_evtchn(struct domain
> > *d)
> >       return 0;
> >   }
> >   +#define XENSTORE_PFN_OFFSET 1
> > +static int __init alloc_xenstore_page(struct domain *d)
> > +{
> > +    struct page_info *xenstore_pg;
> > +    struct xenstore_domain_interface *interface;
> > +    mfn_t mfn;
> > +    gfn_t gfn;
> > +    int rc;
> > +
> > +    d->max_pages += 1;
> 
> Sorry I should have spotted it earlier. But you want to check d->max_pages is
> not overflowing. You can look at acquire_shared_memory_bank() for how to do
> it.
> 
> Also, maybe we want an helper to do it so it is not open-coded in multiple
> places.

Makes sense. I open-coded it because I wasn't sure if you preferred a
static inline or a macro and where to add the implementation.


> > +    xenstore_pg = alloc_domheap_page(d, 0);
> 
> I think we may want to restrict where the page is allocated. For instance,
> 32-bit domain using short page-tables will not be able to address all the
> physical memory.
> 
> I would consider to try to allocate the page below 32-bit (using
> MEMF-bits(32). And then fallback to above 32-bit only 64-bit for domain.

done


> Also, just to note that in theory alloc_domheap_page() could return MFN 0. In
> practice we have excluded MFN 0 because it breaks the page allocator so far.
> 
> But I would still prefer if we add a check on the MFN. This will make easier
> to spot any issue if we ever give MFN 0 to the allocator.

Good idea, but for simplicity I added a check on MFN and if the result
is zero return an error. At least we have explicit check.


> A possible implementation would be to call alloc_domphea_page() a second time
> and then free the first one (e.g. MFN 0).
>
> > +    if ( xenstore_pg == NULL )
> > +        return -ENOMEM;
> > +
> > +    mfn = page_to_mfn(xenstore_pg);
> > +    if ( !is_domain_direct_mapped(d) )
> > +        gfn = gaddr_to_gfn(GUEST_MAGIC_BASE +
> > +                           (XENSTORE_PFN_OFFSET << PAGE_SHIFT));
> > +    else
> > +        gfn = gaddr_to_gfn(mfn_to_maddr(mfn));
> > +
> > +    rc = guest_physmap_add_page(d, gfn, mfn, 0); > +    if ( rc )
> > +    {
> > +        free_domheap_page(xenstore_pg);
> > +        return rc;
> > +    }
> > +
> > +    d->arch.hvm.params[HVM_PARAM_STORE_PFN] = gfn_x(gfn);
> > +    interface = (struct xenstore_domain_interface *)map_domain_page(mfn);
> 
> map_domain_page() will return a void *. So why do you need to an explicit
> case?

Changed


> > +    interface->connection = XENSTORE_RECONNECT;
> > +    unmap_domain_page(interface);
> > +
> > +    return 0;
> > +}
> > +
> >   static int __init construct_domU(struct domain *d,
> >                                    const struct dt_device_node *node)
> >   {
> > @@ -839,7 +878,10 @@ static int __init construct_domU(struct domain *d,
> >           rc = alloc_xenstore_evtchn(d);
> >           if ( rc < 0 )
> >               return rc;
> > -        d->arch.hvm.params[HVM_PARAM_STORE_PFN] = ~0ULL;
> > +
> > +        rc = alloc_xenstore_page(d);
> > +        if ( rc < 0 )
> > +            return rc;
> >       }
> >         return rc;
> 
> Cheers,
> 
> -- 
> Julien Grall
> 

