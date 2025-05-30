Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AF3AC8609
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 03:37:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000370.1380679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKofv-0002HH-8J; Fri, 30 May 2025 01:36:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000370.1380679; Fri, 30 May 2025 01:36:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKofv-0002EN-5Z; Fri, 30 May 2025 01:36:47 +0000
Received: by outflank-mailman (input) for mailman id 1000370;
 Fri, 30 May 2025 01:36:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AEV3=YO=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uKofu-0002EH-Ep
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 01:36:46 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a87df89-3cf6-11f0-a2ff-13f23c93f187;
 Fri, 30 May 2025 03:36:43 +0200 (CEST)
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
X-Inumbo-ID: 8a87df89-3cf6-11f0-a2ff-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1748569001; x=1748828201;
	bh=CKaqFvWvPyKHuXOwCCyN16zZfzshLl5KYWefcBaou7E=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=limt1uXqh80fqMVmCPKqwiXdnaBVfPQMtlPRXwvbCKRaoZHMrHiY/Da8JUDHA11r5
	 gcVsHO7BgHoWU2YRytHilGQ7tuPSl7+m1s+IBrxs7zH+N+yuZ7DJu7WaSKJ6l2nLvI
	 P9lKdByX7BS+qLGIQLlkrbFR3PAdRPFj7jRWVmBRwIeuyjgyuxxWBolM97stXZg1VP
	 6MIb+7fEd7QGGzbRdZ7OLjfz3Z5sAtznuIjrlugqNkvWlEUnm7hoLYxnRrSEA/QLIc
	 W9E6xhx/kl5hbWNe9s8UOTRiQhr0AMGZhXXQlmBI9udqVXwoZStVfv60iXaAzeim0V
	 g45E+5X0CJSnA==
Date: Fri, 30 May 2025 01:36:35 +0000
To: Stefano Stabellini <sstabellini@kernel.org>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, dmukhin@ford.com
Subject: Re: [PATCH v4 2/4] xen/console: introduce console input permission
Message-ID: <aDkLngnYbSG2CePq@kraken>
In-Reply-To: <alpine.DEB.2.22.394.2505291736530.135336@ubuntu-linux-20-04-desktop>
References: <20250529000848.2675903-1-dmukhin@ford.com> <20250529000848.2675903-3-dmukhin@ford.com> <alpine.DEB.2.22.394.2505291736530.135336@ubuntu-linux-20-04-desktop>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: d61b8b5b16409b258872f296506ff8cab64dd46f
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 29, 2025 at 05:58:00PM -0700, Stefano Stabellini wrote:
> On Thu, 29 May 2025, dmkhn@proton.me wrote:
> > Add new flag to domain structure for marking permission to intercept
> > the physical console input by the domain.
> >
> > Update console input switch logic accordingly.
> >
> > No functional change intended.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Changes since v3:
> > - rebased
> > ---
> >  xen/arch/arm/vpl011.c      |  2 ++
> >  xen/arch/x86/pv/shim.c     |  2 ++
> >  xen/common/domain.c        |  2 ++
> >  xen/drivers/char/console.c | 18 +++++++++++++++++-
> >  xen/include/xen/sched.h    |  8 +++++++-
> >  5 files changed, 30 insertions(+), 2 deletions(-)
> >
> > diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
> > index 66047bf33c..147958eee8 100644
> > --- a/xen/arch/arm/vpl011.c
> > +++ b/xen/arch/arm/vpl011.c
> > @@ -737,6 +737,8 @@ int domain_vpl011_init(struct domain *d, struct vpl=
011_init_info *info)
> >      register_mmio_handler(d, &vpl011_mmio_handler,
> >                            vpl011->base_addr, GUEST_PL011_SIZE, NULL);
> >
> > +    d->console.input_allowed =3D true;
>=20
> This should be set only when backend_in_domain =3D false.
>=20
>=20
> >      return 0;
> >
> >  out1:
> > diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
> > index c506cc0bec..bc2a7dd5fa 100644
> > --- a/xen/arch/x86/pv/shim.c
> > +++ b/xen/arch/x86/pv/shim.c
> > @@ -238,6 +238,8 @@ void __init pv_shim_setup_dom(struct domain *d, l4_=
pgentry_t *l4start,
> >       * guest from depleting the shim memory pool.
> >       */
> >      d->max_pages =3D domain_tot_pages(d);
> > +
> > +    d->console.input_allowed =3D true;
> >  }
> >
> >  static void write_start_info(struct domain *d)
> > diff --git a/xen/common/domain.c b/xen/common/domain.c
> > index 87e5be35e5..9bc66d80c4 100644
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -835,6 +835,8 @@ struct domain *domain_create(domid_t domid,
> >          flags |=3D CDF_hardware;
> >          if ( old_hwdom )
> >              old_hwdom->cdf &=3D ~CDF_hardware;
> > +
> > +        d->console.input_allowed =3D true;
> >      }
> >
> >      /* Holding CDF_* internal flags. */
> > diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> > index 30701ae0b0..8a0bcff78f 100644
> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -512,9 +512,21 @@ static unsigned int __read_mostly console_rx =3D 0=
;
> >
> >  struct domain *console_get_domain(void)
> >  {
> > +    struct domain *d;
> > +
> >      if ( console_rx =3D=3D 0 )
> >              return NULL;
> > -    return rcu_lock_domain_by_id(console_rx - 1);
> > +
> > +    d =3D rcu_lock_domain_by_id(console_rx - 1);
> > +    if ( !d )
> > +        return NULL;
> > +
> > +    if ( d->console.input_allowed )
> > +        return d;
> > +
> > +    rcu_unlock_domain(d);
> > +
> > +    return NULL;
>=20
> The original idea was to skip over domains that cannot have any input so
> I don't think we should get in this situation. We could even have an
> assert.
>=20
>=20
> >  }
> >
> >  void console_put_domain(struct domain *d)
> > @@ -551,6 +563,10 @@ static void console_switch_input(void)
> >          if ( d )
> >          {
> >              rcu_unlock_domain(d);
> > +
> > +            if ( !d->console.input_allowed )
> > +                break;
>=20
> shouldn't this be continue instead of break?
>=20
>=20
> >              console_rx =3D next_rx;
> >              printk("*** Serial input to DOM%u", domid);
> >              break;
> > diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> > index 559d201e0c..e91c99a8f3 100644
> > --- a/xen/include/xen/sched.h
> > +++ b/xen/include/xen/sched.h
> > @@ -512,7 +512,7 @@ struct domain
> >      bool             auto_node_affinity;
> >      /* Is this guest fully privileged (aka dom0)? */
> >      bool             is_privileged;
> > -    /* Can this guest access the Xen console? */
> > +    /* XSM: permission to use HYPERCALL_console_io hypercall */
> >      bool             is_console;
>=20
> While I am in favor of this direction and we certainly need a better way
> to distinguish domains that can use HYPERCALL_console_io hypercall from
> others, could we simplify this and just assume that "is_console" implies
> input_allowed and also set is_console =3D true in all the same places you
> are setting input_allowed =3D true in this patch?
>=20
> For clarity, I am suggesting:
> - do not add input_allowed
> - set is_console =3D true in domain_vpl011_init, pv_shim_setup_dom, etc.
>=20
> The only side effect is that we would allow domains with vpl011 to also
> use console hypercalls but I don't think there is any harm in that?
>=20
> I don't feel strongly about this, I am just trying to find ways to make
> things simple. I apologize if it was already discussed during review of
> one of the previous versions.

There was feedback on using is_console:

  https://lore.kernel.org/xen-devel/e899f63b-6182-4b53-9fb4-9a821e75648b@su=
se.com/

AFAIU, since XSM is the existing user of is_console, there should be a new
separate flag to avoid collision with the existing one.

>=20
> I am also OK with this approach.
>=20
>=20
> >      /* Is this guest being debugged by dom0? */
> >      bool             debugger_attached;
> > @@ -651,6 +651,12 @@ struct domain
> >      unsigned int num_llc_colors;
> >      const unsigned int *llc_colors;
> >  #endif
> > +
> > +    /* Console settings. */
> > +    struct {
> > +        /* Permission to take ownership of the physical console input.=
 */
> > +        bool input_allowed;
> > +    } console;
> >  } __aligned(PAGE_SIZE);
> >
> >  static inline struct page_list_head *page_to_list(
> > --
> > 2.34.1
> >
> >
>=20


