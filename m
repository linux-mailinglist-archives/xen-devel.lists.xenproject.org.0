Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D654E4A6A
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 02:20:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293708.499054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWpeH-00023R-Ac; Wed, 23 Mar 2022 01:18:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293708.499054; Wed, 23 Mar 2022 01:18:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWpeH-00021b-7a; Wed, 23 Mar 2022 01:18:53 +0000
Received: by outflank-mailman (input) for mailman id 293708;
 Wed, 23 Mar 2022 01:18:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RTL5=UC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nWpeF-00021V-Hl
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 01:18:51 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30d46e77-aa47-11ec-8fbc-03012f2f19d4;
 Wed, 23 Mar 2022 02:18:49 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9BAAE61350;
 Wed, 23 Mar 2022 01:18:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95877C340EC;
 Wed, 23 Mar 2022 01:18:46 +0000 (UTC)
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
X-Inumbo-ID: 30d46e77-aa47-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647998327;
	bh=npkLsUY5uh9Ov0ic4uXzYMNGltANFcSwbIlTdxfP0+E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=b32KYLqu2ywWX95Y5jzTLTUM3JxHcFdw6OyU0+Eh8ymUr8f8TAqjhEJcoiTmbFTo8
	 2mya+yoDqC2PZT2Ph62buPaoR5v91R8jka43g+0d+90jJ/b2FefFQ2UCnQjpKyZbQT
	 7an8U3UV+lfCVhf9Zyy+sSDTP06JgWTe2hnvulVXBw1v/z4cy4zODl248QdcN8Ze5X
	 QHO6Z8xpWfcrwiMvqa/SSXXODFT+uSHFqosrHuDUftSzTwhY0sPR0N6FuPUuLhSk7h
	 4bIuBFmdNgQ2mra7eRvzd7pURRaVtyH9B0zZBH6E/zlKKaIJYh0ujnAfREgQSmbbZ4
	 OKxhuf3ZYLbUg==
Date: Tue, 22 Mar 2022 18:18:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, jgross@suse.com, Bertrand.Marquis@arm.com, 
    Volodymyr_Babchuk@epam.com, Luca Miccio <lucmiccio@gmail.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v3 3/5] xen/arm: configure dom0less domain for enabling
 xenstore after boot
In-Reply-To: <e55c03f6-5b20-ce9c-ce88-11dc85623dce@xen.org>
Message-ID: <alpine.DEB.2.22.394.2203221722430.2910984@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2201281330520.27308@ubuntu-linux-20-04-desktop> <20220128213307.2822078-3-sstabellini@kernel.org> <e55c03f6-5b20-ce9c-ce88-11dc85623dce@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 29 Jan 2022, Julien Grall wrote:
> On 28/01/2022 21:33, Stefano Stabellini wrote:
> > From: Luca Miccio <lucmiccio@gmail.com>
> > 
> > If "xen,enhanced" is enabled, then add to dom0less domains:
> > 
> > - the hypervisor node in device tree
> > - the xenstore event channel
> > 
> > The xenstore event channel is also used for the first notification to
> > let the guest know that xenstore has become available.
> > 
> > Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> > CC: Julien Grall <julien@xen.org>
> > CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> > CC: Bertrand Marquis <bertrand.marquis@arm.com>
> > 
> > ---
> > Changes in v3:
> > - use evtchn_alloc_unbound
> > 
> > Changes in v2:
> > - set HVM_PARAM_STORE_PFN to ~0ULL at domain creation
> > - in alloc_xenstore_evtchn do not call _evtchn_alloc_unbound
> > ---
> >   xen/arch/arm/domain_build.c | 41 +++++++++++++++++++++++++++++++++++++
> >   1 file changed, 41 insertions(+)
> > 
> > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > index 9144d6c0b6..8e030a7f05 100644
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -27,6 +27,7 @@
> >   #include <asm/setup.h>
> >   #include <asm/cpufeature.h>
> >   #include <asm/domain_build.h>
> > +#include <xen/event.h>
> >     #include <xen/irq.h>
> >   #include <xen/grant_table.h>
> > @@ -2619,6 +2620,8 @@ static int __init prepare_dtb_domU(struct domain *d,
> > struct kernel_info *kinfo)
> >       int ret;
> >         kinfo->phandle_gic = GUEST_PHANDLE_GIC;
> > +    kinfo->gnttab_start = GUEST_GNTTAB_BASE;
> > +    kinfo->gnttab_size = GUEST_GNTTAB_SIZE;
> >         addrcells = GUEST_ROOT_ADDRESS_CELLS;
> >       sizecells = GUEST_ROOT_SIZE_CELLS;
> > @@ -2693,6 +2696,13 @@ static int __init prepare_dtb_domU(struct domain *d,
> > struct kernel_info *kinfo)
> >               goto err;
> >       }
> >   +    if ( kinfo->dom0less_enhanced )
> > +    {
> > +        ret = make_hypervisor_node(d, kinfo, addrcells, sizecells);
> 
> Looking at the code, I think the extended regions will not work properly
> because we are looking at the host memory layout. In the case of domU, we want
> to use the guest layout. Please have a look how it was done in libxl.

Yeah you are right, I'll do that.


> > +        if ( ret )
> > +            goto err;
> > +    }
> > +
> >       ret = fdt_end_node(kinfo->fdt);
> >       if ( ret < 0 )
> >           goto err;
> > @@ -2959,6 +2969,25 @@ static int __init construct_domain(struct domain *d,
> > struct kernel_info *kinfo)
> >       return 0;
> >   }
> >   +static int __init alloc_xenstore_evtchn(struct domain *d)
> > +{
> > +    evtchn_alloc_unbound_t alloc;
> > +    int rc;
> > +
> > +    alloc.dom = d->domain_id;
> > +    alloc.remote_dom = hardware_domain->domain_id;
> 
> The first thing evtchn_alloc_unbound() will do is looking up the domain. This
> seems a bit pointless given that we have the domain in hand. Shouldn't we
> extend evtchn_alloc_unbound() to pass the domain?

That's a good point, but I actually think it is better to go back to
[2]. The evtchn_alloc_unbound discussion is still ongoing but I'll keep
this suggestion in mind.

[2] https://marc.info/?l=xen-devel&m=164203543615114


> > +    rc = evtchn_alloc_unbound(&alloc, true);
> > +    if ( rc )
> > +    {
> > +        printk("Failed allocating event channel for domain\n");
> > +        return rc;
> > +    }
> > +
> > +    d->arch.hvm.params[HVM_PARAM_STORE_EVTCHN] = alloc.port;
> > +
> > +    return 0;
> > +}
> > +
> >   static int __init construct_domU(struct domain *d,
> >                                    const struct dt_device_node *node)
> >   {
> > @@ -3014,7 +3043,19 @@ static int __init construct_domU(struct domain *d,
> >           return rc;
> >         if ( kinfo.vpl011 )
> > +    {
> >           rc = domain_vpl011_init(d, NULL);
> > +        if ( rc < 0 )
> > +            return rc;
> > +    }
> > +
> > +    if ( kinfo.dom0less_enhanced )
> > +    {
> > +        rc = alloc_xenstore_evtchn(d);
> > +        if ( rc < 0 )
> > +            return rc;
> > +        d->arch.hvm.params[HVM_PARAM_STORE_PFN] = ~0ULL;
> 
> I think it would be easy to allocate the page right now. So what prevent us to
> do it right now?

Because (as you noted as a comment to the following patch) as soon as
d->arch.hvm.params[HVM_PARAM_STORE_PFN] is set the guest can continue
with the initialization and will expect the right data to be set on the
page. In other words: it is not enough to have the pfn allocated, we
also need xenstore to initialize it. At that point, it is better to do
both later from init-dom0less.c.

