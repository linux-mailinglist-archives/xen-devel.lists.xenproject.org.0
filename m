Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A354B0E74E
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 01:46:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053115.1421883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueMgu-0007Jo-Pp; Tue, 22 Jul 2025 23:46:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053115.1421883; Tue, 22 Jul 2025 23:46:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueMgu-0007Hq-ND; Tue, 22 Jul 2025 23:46:36 +0000
Received: by outflank-mailman (input) for mailman id 1053115;
 Tue, 22 Jul 2025 23:46:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=an6O=2D=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ueMgt-0007Hf-D6
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 23:46:35 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16dcd713-6756-11f0-b894-0df219b8e170;
 Wed, 23 Jul 2025 01:46:30 +0200 (CEST)
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
X-Inumbo-ID: 16dcd713-6756-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=53qtfkbxgngg5jcpntbjmpbcue.protonmail; t=1753227989; x=1753487189;
	bh=pd+R1+33CVP02wEr5HfW+7CD/Ty7Wb30o+CowyDmjJo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=DxXXT8XqNziLH94GTkyQgEts7OWaG+5hlpT+/VG4Nz46DVcj3s6zqyK0pcVdncDtP
	 ufePt3SlCUa5MgAsDFcXVh7VQt2NmoCcAxXtk7CtVlWG3eDvlmC3w3r+NkYb35ISeo
	 vF0iZjL+0tjAwlPy4npSbzmTnHb4Ue1BYmrGjahtoERopwjMmiWTHDuHLj+p0OhaYr
	 flQdyzpgEM3IkrhC8te4n4VBdxqhxWZVLZTFb7RpB4eSuSJETOisxAZIC+7D/9m9KK
	 vKBA3g2k/OXpj/b+g4vaNver0RuQfeO4TymziBL6IZeXb0rfcikH1e9OtYUsscNsK7
	 lQR7+x8y843Zw==
Date: Tue, 22 Jul 2025 23:46:25 +0000
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH v10 3/3] xen/domain: use get_initial_domain_id() instead of open-coded 0
Message-ID: <aIAd/UizUq0wCfqU@kraken>
In-Reply-To: <DBEA05LLKKR8.2SWMMEL6KJTL9@amd.com>
References: <20250623182721.194238-1-dmukhin@ford.com> <20250623182721.194238-4-dmukhin@ford.com> <DBEA05LLKKR8.2SWMMEL6KJTL9@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 209fc8ad3598d099c31f3a943a969362fe39c753
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2025 at 12:59:15PM +0200, Alejandro Vallejo wrote:
> +Juergen for late-hwdom bit
>=20
> Hi,
>=20
> On Mon Jun 23, 2025 at 8:28 PM CEST, dmkhn wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Remove the open-coded domain ID 0 and replace it with a call to
> > get_initial_domain_id().
>=20
> Ideally we'd be better off replacing it where applicable with  is
> hardware_domain(), or is_control_domain(), or a ORd version of both depen=
ding
> on what the hardcoded 0 means to do.

I agree.

I think I will postpone this change until the design of dom0 split into
control/hardware settles.

P.S. Corrected the list of Cc for mail to be sent.

>=20
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Changes since v9:
> > - new patch
> > ---
> >  xen/arch/arm/domain_build.c | 4 ++--
> >  xen/common/domain.c         | 6 +++---
> >  2 files changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > index b59b56636920..b525d78c608f 100644
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -2074,9 +2074,9 @@ void __init create_dom0(void)
> >      if ( !llc_coloring_enabled )
> >          flags |=3D CDF_directmap;
> >
> > -    domid =3D domid_alloc(0);
> > +    domid =3D domid_alloc(get_initial_domain_id());
> >      if ( domid =3D=3D DOMID_INVALID )
> > -        panic("Error allocating domain ID 0\n");
> > +        panic("Error allocating domain ID %d\n", get_initial_domain_id=
());
> >
> >      dom0 =3D domain_create(domid, &dom0_cfg, flags);
> >      if ( IS_ERR(dom0) )
>=20
> On arm this is just another level of indirection. It might work as a mark=
er to
> know where dom0 is hardcoded, though. So sounds good to me.
>=20
> > diff --git a/xen/common/domain.c b/xen/common/domain.c
> > index be022c720b13..27575b4610e3 100644
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -492,7 +492,7 @@ static int late_hwdom_init(struct domain *d)
> >      struct domain *dom0;
> >      int rv;
> >
> > -    if ( d !=3D hardware_domain || d->domain_id =3D=3D 0 )
> > +    if ( d !=3D hardware_domain || d->domain_id =3D=3D get_initial_dom=
ain_id() )
>=20
> This is tricky. get_initial_domain_id() is only non-zero in shim-mode. An=
d in
> that mode there's no control nor hardware domain (hence why the initial d=
omain
> id is not zero in that case).
>=20
> >          return 0;
> >
> >      rv =3D xsm_init_hardware_domain(XSM_HOOK, d);
> > @@ -501,7 +501,7 @@ static int late_hwdom_init(struct domain *d)
> >
> >      printk("Initialising hardware domain %d\n", hardware_domid);
> >
> > -    dom0 =3D rcu_lock_domain_by_id(0);
> > +    dom0 =3D rcu_lock_domain_by_id(get_initial_domain_id());
>=20
> Hmmm. More generally this is probably trying to find the previous hardwar=
e
> domain. Which the caller already has a pointer to.
>=20
> Maybe this would work?
>=20
> ```
> =09-static int late_hwdom_init(struct domain *d)
> =09+static int late_hwdom_init(struct domain *d, struct domain *old_hwdom=
)
> =09 {
> =09 #ifdef CONFIG_LATE_HWDOM
> =09     struct domain *dom0;
> =09     int rv;
>=20
> =09-    if ( d !=3D hardware_domain || d->domain_id =3D=3D 0 )
> =09+    if ( d !=3D hardware_domain || !old_hwdom )
> =09         return 0;
>=20
> =09     rv =3D xsm_init_hardware_domain(XSM_HOOK, d);
> =09@@ -493,8 +493,6 @@ static int late_hwdom_init(struct domain *d)
>=20
> =09     printk("Initialising hardware domain %d\n", hardware_domid);
>=20
> =09-    dom0 =3D rcu_lock_domain_by_id(0);
> =09-    ASSERT(dom0 !=3D NULL);
> =09     /*
> =09      * Hardware resource ranges for domain 0 have been set up from
> =09      * various sources intended to restrict the hardware domain's
> =09@@ -512,11 +510,9 @@ static int late_hwdom_init(struct domain *d)
> =09 #ifdef CONFIG_X86
> =09     rangeset_swap(d->arch.ioport_caps, dom0->arch.ioport_caps);
> =09     setup_io_bitmap(d);
> =09-    setup_io_bitmap(dom0);
> =09+    setup_io_bitmap(old_hwdom);
> =09 #endif
>=20
> =09-    rcu_unlock_domain(dom0);
> =09-
> =09     iommu_hwdom_init(d);
>=20
> =09     return rv;
> =09@@ -967,7 +963,7 @@ struct domain *domain_create(domid_t domid,
> =09     if ( (err =3D sched_init_domain(d, config->cpupool_id)) !=3D 0 )
> =09         goto fail;
>=20
> =09-    if ( (err =3D late_hwdom_init(d)) !=3D 0 )
> =09+    if ( (err =3D late_hwdom_init(d, old_hwdom)) !=3D 0 )
> =09         goto fail;
> ```
>=20
> Juergen, do you have any thoughts about this?
>=20
> >      ASSERT(dom0 !=3D NULL);
> >      /*
> >       * Hardware resource ranges for domain 0 have been set up from
> > @@ -2479,7 +2479,7 @@ domid_t domid_alloc(domid_t domid)
> >          if ( domid =3D=3D DOMID_FIRST_RESERVED )
> >              domid =3D find_next_zero_bit(domid_bitmap,
> >                                         DOMID_FIRST_RESERVED,
> > -                                       1);
> > +                                       get_initial_domain_id() + 1);
>=20
> IMO, this should be either 1 (for defence in depth against using zero) or=
 0.
> There's nothing special with any other initial domain ids.
>=20
> >  #endif
> >
> >          if ( domid < DOMID_FIRST_RESERVED )
>=20
> Cheers,
> Alejandro
>=20


