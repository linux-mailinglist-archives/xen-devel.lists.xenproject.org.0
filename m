Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2F7825D92
	for <lists+xen-devel@lfdr.de>; Sat,  6 Jan 2024 02:12:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.662416.1032534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLvEU-0006tg-4v; Sat, 06 Jan 2024 01:12:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 662416.1032534; Sat, 06 Jan 2024 01:12:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLvEU-0006rB-0p; Sat, 06 Jan 2024 01:12:14 +0000
Received: by outflank-mailman (input) for mailman id 662416;
 Sat, 06 Jan 2024 01:12:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g2yR=IQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rLvER-0006Lk-Q6
 for xen-devel@lists.xenproject.org; Sat, 06 Jan 2024 01:12:11 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d0c897f-ac30-11ee-98ef-6d05b1d4d9a1;
 Sat, 06 Jan 2024 02:12:10 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 93F2BCE09B1;
 Sat,  6 Jan 2024 01:12:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 237DBC433C7;
 Sat,  6 Jan 2024 01:12:04 +0000 (UTC)
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
X-Inumbo-ID: 9d0c897f-ac30-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704503526;
	bh=LZGW0rTnjiFVF+gq8jTRBgHQ8qC6OuDow6Brm+Fanw0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ptQD2iihbQAj4u5r2UceTsuNKJP9RVi3V/PLIMlO416/shwHHIMkodPqOPCvlWvLn
	 kyBeqP3o8b//dFg8czWnglZH0kFyEYEnWyvwJkGp5O80n3EJETCUdGx+JXwmmaDwpR
	 qrfHgftuVqukjj1jXLAmXMpySxo3vtOsNKMR4t0GidvX/vCZ8eGrrkdgbHR9Sy4hX9
	 CFoJGc0Obz1ugxxCQKoKolrzyV3dVoSp2PptK3bHAAYqvxst9NBVQ21N8Vj3cxX81l
	 er5pRXEK9x9mTHWcyquvOf6k4aYjkVxDCwrB0n0kWYvbchVxFwgjV5jvBNXXojRMQa
	 MDU21wMb0Cujw==
Date: Fri, 5 Jan 2024 17:12:03 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Jiqian Chen <Jiqian.Chen@amd.com>, xen-devel@lists.xenproject.org, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, 
    Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>, 
    Stewart Hildebrand <Stewart.Hildebrand@amd.com>, 
    Huang Rui <Ray.Huang@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: Re: [RFC XEN PATCH v4 4/5] domctl: Use gsi to grant/revoke irq
 permission
In-Reply-To: <alpine.DEB.2.22.394.2401051702200.3675@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2401051711300.3675@ubuntu-linux-20-04-desktop>
References: <20240105070920.350113-1-Jiqian.Chen@amd.com> <20240105070920.350113-5-Jiqian.Chen@amd.com> <alpine.DEB.2.22.394.2401051702200.3675@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 5 Jan 2024, Stefano Stabellini wrote:
> On Fri, 5 Jan 2024, Jiqian Chen wrote:
> > Some type of domain don't have PIRQ, like PVH, current
> > implementation is not suitable for those domain.
> > 
> > When passthrough a device to guest on PVH dom0, this
> > pci_add_dm_done->XEN_DOMCTL_irq_permission will failed
> > at domain_pirq_to_irq.
> > 
> > So, change it to use gsi to grant/revoke irq permission.
> > And change the caller of XEN_DOMCTL_irq_permission to
> > pass gsi to it instead of pirq.
> > 
> > Co-developed-by: Huang Rui <ray.huang@amd.com>
> > Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> 
> I realize there is no explanation or comment right now, but I think this
> change would benefit from a in-code comment in xen/include/public/domctl.h
> E.g.:
> 
> /* XEN_DOMCTL_irq_permission */
> struct xen_domctl_irq_permission {
>     uint32_t pirq;           /* pirq is the GSI on x86 */
>     uint8_t allow_access;    /* flag to specify enable/disable of IRQ access */
>     uint8_t pad[3];
> };
> 
> 
> > ---
> >  tools/libs/light/libxl_pci.c |  6 ++++--
> >  tools/libs/light/libxl_x86.c |  5 ++++-
> >  xen/common/domctl.c          | 12 ++++++++++--
> >  3 files changed, 18 insertions(+), 5 deletions(-)
> > 
> > diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
> > index 96cb4da0794e..e1341d1e9850 100644
> > --- a/tools/libs/light/libxl_pci.c
> > +++ b/tools/libs/light/libxl_pci.c
> > @@ -1418,6 +1418,7 @@ static void pci_add_dm_done(libxl__egc *egc,
> >      unsigned long long start, end, flags, size;
> >      int irq, i;
> >      int r;
> > +    int gsi;

After reading patch #5 I think you could just rename the int irq local
variable to int gsi.


> >      uint32_t flag = XEN_DOMCTL_DEV_RDM_RELAXED;
> >      uint32_t domainid = domid;
> >      bool isstubdom = libxl_is_stubdom(ctx, domid, &domainid);
> > @@ -1486,6 +1487,7 @@ static void pci_add_dm_done(libxl__egc *egc,
> >          goto out_no_irq;
> >      }
> >      if ((fscanf(f, "%u", &irq) == 1) && irq) {
> > +        gsi = irq;
> 
> A question for Roger and Jan: are we always guaranteed that gsi == irq
> (also in the PV case)?
> 
> Also I don't think we necessarily need the gsi local variable, I would
> just add an in-code comment below...
> 
> 
> >          r = xc_physdev_map_pirq(ctx->xch, domid, irq, &irq);
> >          if (r < 0) {
> >              LOGED(ERROR, domainid, "xc_physdev_map_pirq irq=%d (error=%d)",
> > @@ -1494,10 +1496,10 @@ static void pci_add_dm_done(libxl__egc *egc,
> >              rc = ERROR_FAIL;
> >              goto out;
> >          }
> 
> ... like this:
> 
> /* xc_domain_irq_permission takes a gsi, here we assume irq == gsi */
> r = xc_domain_irq_permission(ctx->xch, domid, irq, 1);
> 
> 
> > -        r = xc_domain_irq_permission(ctx->xch, domid, irq, 1);
> > +        r = xc_domain_irq_permission(ctx->xch, domid, gsi, 1);
> >          if (r < 0) {
> >              LOGED(ERROR, domainid,
> > -                  "xc_domain_irq_permission irq=%d (error=%d)", irq, r);
> > +                  "xc_domain_irq_permission irq=%d (error=%d)", gsi, r);
> >              fclose(f);
> >              rc = ERROR_FAIL;
> >              goto out;
> > diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
> > index d16573e72cd4..88ad50cf6360 100644
> > --- a/tools/libs/light/libxl_x86.c
> > +++ b/tools/libs/light/libxl_x86.c
> > @@ -654,12 +654,15 @@ out:
> >  int libxl__arch_domain_map_irq(libxl__gc *gc, uint32_t domid, int irq)
> 
> you could just rename the int irq parameter to int gsi ?
> 
> 
> >  {
> >      int ret;
> > +    int gsi;
> > +
> > +    gsi = irq;
> >  
> >      ret = xc_physdev_map_pirq(CTX->xch, domid, irq, &irq);
> >      if (ret)
> >          return ret;
> >  
> > -    ret = xc_domain_irq_permission(CTX->xch, domid, irq, 1);
> > +    ret = xc_domain_irq_permission(CTX->xch, domid, gsi, 1);
> >      return ret;
> >  }
> > diff --git a/xen/common/domctl.c b/xen/common/domctl.c
> > index f5a71ee5f78d..eeb975bd0194 100644
> > --- a/xen/common/domctl.c
> > +++ b/xen/common/domctl.c
> > @@ -653,12 +653,20 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
> >          unsigned int pirq = op->u.irq_permission.pirq, irq;
> >          int allow = op->u.irq_permission.allow_access;
> 
> here we could benefit from renaming pirq to gsi, at least it becomes
> clear:
> 
> unsigned int gsi = op->u.irq_permission.pirq, irq;
> 
> 
> > -        if ( pirq >= current->domain->nr_pirqs )
> > +        if ( pirq >= nr_irqs_gsi )
> >          {
> >              ret = -EINVAL;
> >              break;
> >          }
> > -        irq = pirq_access_permitted(current->domain, pirq);
> > +
> > +        if ( irq_access_permitted(current->domain, pirq) )
> > +            irq = pirq;
> > +        else
> > +        {
> > +            ret = -EPERM;
> > +            break;
> > +        }
> > +
> >          if ( !irq || xsm_irq_permission(XSM_HOOK, d, irq, allow) )
> >              ret = -EPERM;
> >          else if ( allow )
> > -- 
> > 2.34.1
> > 
> 

