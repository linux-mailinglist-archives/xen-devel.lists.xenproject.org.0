Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A48B0E6FF
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 01:18:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053047.1421793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueMEt-0006zb-Ub; Tue, 22 Jul 2025 23:17:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053047.1421793; Tue, 22 Jul 2025 23:17:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueMEt-0006xg-RU; Tue, 22 Jul 2025 23:17:39 +0000
Received: by outflank-mailman (input) for mailman id 1053047;
 Tue, 22 Jul 2025 23:17:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=an6O=2D=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ueMEq-0006xU-HG
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 23:17:37 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b768737-6752-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 01:17:33 +0200 (CEST)
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
X-Inumbo-ID: 0b768737-6752-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=eutbuyjmhnggpjxlpfx4khjiye.protonmail; t=1753226251; x=1753485451;
	bh=2gytftRczKW0tX2u2ImrtvkAsqoFKBZFS/B1DYaQuT8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=N0optU19V1N3wUtxVJ80QlY3K8qEDPbtyi+ubIOhKjFjBY4PHgl4El8ZouTlE0I4m
	 +h5vvbo27CQR1F2dqZtmRdyI02vEWYzZdUNeQ5z8oltwJew9vTsLREr+FXWq69X6e9
	 wuhQaBu8YOtuP6CX5ZCy3QubN0lJXdEfDTXg6kvghBZrQ5QgNu9mR6B3dSARx2YvNW
	 QhaaVtISB7Ean7CtD2BJrEdNdro+sPn9NvJgtPxhl1ccbya8BmzVr4wVkLTsVe/KzB
	 7BbqEL1ip6blkf78iuVu1z7rQCch9OUg40gdSf/8z/kvomW3o/C/1EW7ErjqTGyMko
	 GWUCsMKBrydkQ==
Date: Tue, 22 Jul 2025 23:17:24 +0000
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH v10 1/3] xen/domain: unify domain ID allocation
Message-ID: <aIAb/svgOWoiopR7@kraken>
In-Reply-To: <DBE9C2TQR079.3IQXRH5DEQ2JU@amd.com>
References: <20250623182721.194238-1-dmukhin@ford.com> <20250623182721.194238-2-dmukhin@ford.com> <DBE9C2TQR079.3IQXRH5DEQ2JU@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 5731aef11ccb106f97ebe11634d83cc5043ceae9
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2025 at 12:27:48PM +0200, Alejandro Vallejo wrote:
> Hi,
>=20
> Sorry I'm so late to this. I have a few suggestions to improve the ergono=
mics
> of domid handling in dom0less/Hyperlaunch.

Thanks for the feedback!

>=20
> On Mon Jun 23, 2025 at 8:28 PM CEST, dmkhn wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Currently, there are two different domain ID allocation implementations=
:
> >
> >   1) Sequential IDs allocation in dom0less Arm code based on max_init_d=
omid;
> >
> >   2) Sequential IDs allocation in XEN_DOMCTL_createdomain; does not use
> >      max_init_domid (both Arm and x86).
> >
> > The domain ID allocation covers dom0 or late hwdom, predefined domains,
> > post-boot domains, excluding Xen system domains (domid >=3D
> > DOMID_FIRST_RESERVED).
> >
> > It makes sense to have a common helper code for such task across archit=
ectures
> > (Arm and x86) and between dom0less / toolstack domU allocation.
> >
> > Note, fixing dependency on max_init_domid is out of scope of this patch=
.
> >
> > Wrap the domain ID allocation as an arch-independent function domid_all=
oc() in
> > common/domain.c based on the bitmap.
> >
> > Allocation algorithm:
> > - If an explicit domain ID is provided, verify its availability and use=
 it if
> >   ID is not used;
> > - If DOMID_INVALID is provided, search the range [1..DOMID_FIRST_RESERV=
ED-1],
> >   starting from the last used ID. IDs are not wrapped around in dom0les=
s case.
> >   Implementation guarantees that two consecutive calls will never retur=
n the
> >   same ID. ID#0 is reserved for the first boot domain (currently, dom0)=
 and
> >   excluded from allocation range.
> >
> > Remove is_free_domid() helper as it is not needed now.
> >
> > No functional change intended.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Changes from v9:
> > - dropped unrelated message formatting from create_dom0()
> > - no wraparound of IDs in dom0less case
> > - fixed ID#0 treatment
> >
> > Link to v9: https://lore.kernel.org/r/20250528225030.2652166-2-dmukhin@=
ford.com
> > ---
> >  xen/arch/arm/domain_build.c             |  7 ++-
> >  xen/arch/x86/setup.c                    |  7 ++-
> >  xen/common/device-tree/dom0less-build.c | 17 +++---
> >  xen/common/domain.c                     | 75 +++++++++++++++++++++++++
> >  xen/common/domctl.c                     | 42 ++------------
> >  xen/include/xen/domain.h                |  3 +
> >  6 files changed, 102 insertions(+), 49 deletions(-)
> >
> > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > index 4ff161887ec3..9fa5143eb98c 100644
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -2049,6 +2049,7 @@ void __init create_dom0(void)
> >          .grant_opts =3D XEN_DOMCTL_GRANT_version(opt_gnttab_max_versio=
n),
> >      };
> >      unsigned int flags =3D CDF_privileged | CDF_hardware;
> > +    domid_t domid;
> >      int rc;
> >
> >      /* The vGIC for DOM0 is exactly emulating the hardware GIC */
> > @@ -2073,7 +2074,11 @@ void __init create_dom0(void)
> >      if ( !llc_coloring_enabled )
> >          flags |=3D CDF_directmap;
> >
> > -    dom0 =3D domain_create(0, &dom0_cfg, flags);
> > +    domid =3D domid_alloc(0);
>=20
> The way I=C2=B4d expect domid_alloc() to be used is twofold:
>=20
>   1. "Give me this specific domid"
>=20
> for which this interface looks fine, perhaps renamed to domid_alloc_exact=
(domid)
>=20
>   2. "Give me any domid"
>=20
> for which we'd benefit more from a domid_alloc()
>=20
> This removes the heuristics from the interface. Worst-case execution rema=
ins the
> same, under 500 iterations. (32K minus a little bit, checked 64bits at a =
time).

I think we've settled on the domid_alloc() with partitioned values:
- exact ID allocation within [0..DOMID_FIRST_RESERVED-1]
  if input value is within the range
- exhaustive search within the range of [1..DOMID_FIRST_RESERVED-1] (skippi=
ng
  reserved ID#0) if the input value is DOMID_INVALID

I was thinking about having two calls originally, but with splitting the AP=
Is,
do_domctl() should have an extra check for the range to re-direct to the
proper alloc variant. In current implementation it is not needed.

>=20
> > +    if ( domid =3D=3D DOMID_INVALID )
> > +        panic("Error allocating domain ID 0\n");
> > +
> > +    dom0 =3D domain_create(domid, &dom0_cfg, flags);
> >      if ( IS_ERR(dom0) )
> >          panic("Error creating domain 0 (rc =3D %ld)\n", PTR_ERR(dom0))=
;
> >
> > diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> > index f32efa7c6045..7adb92d78a18 100644
> > --- a/xen/arch/x86/setup.c
> > +++ b/xen/arch/x86/setup.c
> > @@ -1044,8 +1044,11 @@ static struct domain *__init create_dom0(struct =
boot_info *bi)
> >      if ( iommu_enabled )
> >          dom0_cfg.flags |=3D XEN_DOMCTL_CDF_iommu;
> >
> > -    /* Create initial domain.  Not d0 for pvshim. */
> > -    bd->domid =3D get_initial_domain_id();
> > +    /* Allocate initial domain ID.  Not d0 for pvshim. */
> > +    bd->domid =3D domid_alloc(get_initial_domain_id());
> > +    if ( bd->domid =3D=3D DOMID_INVALID )
> > +        panic("Error allocating domain ID %d\n", get_initial_domain_id=
());
> > +
> >      d =3D domain_create(bd->domid, &dom0_cfg,
> >                        pv_shim ? 0 : CDF_privileged | CDF_hardware);
> >      if ( IS_ERR(d) )
> > diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/devic=
e-tree/dom0less-build.c
> > index 3d503c697337..576fdfa6a19a 100644
> > --- a/xen/common/device-tree/dom0less-build.c
> > +++ b/xen/common/device-tree/dom0less-build.c
> > @@ -839,15 +839,13 @@ void __init create_domUs(void)
> >          struct xen_domctl_createdomain d_cfg =3D {0};
> >          unsigned int flags =3D 0U;
> >          bool has_dtb =3D false;
> > +        domid_t domid;
> >          uint32_t val;
> >          int rc;
> >
> >          if ( !dt_device_is_compatible(node, "xen,domain") )
> >              continue;
> >
> > -        if ( (max_init_domid + 1) >=3D DOMID_FIRST_RESERVED )
> > -            panic("No more domain IDs available\n");
> > -
> >          d_cfg.max_evtchn_port =3D 1023;
> >          d_cfg.max_grant_frames =3D -1;
> >          d_cfg.max_maptrack_frames =3D -1;
> > @@ -965,12 +963,13 @@ void __init create_domUs(void)
> >
> >          arch_create_domUs(node, &d_cfg, flags);
> >
> > -        /*
> > -         * The variable max_init_domid is initialized with zero, so he=
re it's
> > -         * very important to use the pre-increment operator to call
> > -         * domain_create() with a domid > 0. (domid =3D=3D 0 is reserv=
ed for Dom0)
> > -         */
> > -        d =3D domain_create(++max_init_domid, &d_cfg, flags);
> > +        domid =3D domid_alloc(DOMID_INVALID);
> > +        if ( domid =3D=3D DOMID_INVALID )
> > +            panic("Error allocating ID for domain %s\n", dt_node_name(=
node));
> > +        if ( max_init_domid < domid )
> > +            max_init_domid =3D domid;
> > +
> > +        d =3D domain_create(domid, &d_cfg, flags);
> >          if ( IS_ERR(d) )
> >              panic("Error creating domain %s (rc =3D %ld)\n",
> >                    dt_node_name(node), PTR_ERR(d));
> > diff --git a/xen/common/domain.c b/xen/common/domain.c
> > index 434d32901b1b..be022c720b13 100644
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -66,6 +66,14 @@ DEFINE_RCU_READ_LOCK(domlist_read_lock);
> >  static struct domain *domain_hash[DOMAIN_HASH_SIZE];
> >  struct domain *domain_list;
> >
> > +/*
> > + * Domain ID allocator.
> > + * Covers dom0 or late hwdom, predefined domains, post-boot domains; e=
xcludes
> > + * Xen system domains (ID >=3D DOMID_FIRST_RESERVED).
> > + */
> > +static DEFINE_SPINLOCK(domid_lock);
> > +static DECLARE_BITMAP(domid_bitmap, DOMID_FIRST_RESERVED);
> > +
> >  /*
> >   * Insert a domain into the domlist/hash.  This allows the domain to b=
e looked
> >   * up by domid, and therefore to be the subject of hypercalls/etc.
> > @@ -1452,6 +1460,8 @@ void domain_destroy(struct domain *d)
> >
> >      TRACE_TIME(TRC_DOM0_DOM_REM, d->domain_id);
> >
> > +    domid_free(d->domain_id);
> > +
>=20
> Shouldn't this go after domlist_remove()? Otherwise fun things might happ=
en
> if a domid is allocated while the old domain that still keeps the old dom=
id
> is still in its hash.

Yep, it should! Thanks for the catch.

>=20
> The domctl lock (maybe) protects this case implicitly, but it's probably =
better
> to destroy things in a reasonable order.
>=20
> >      /* Remove from the domlist/hash. */
> >      domlist_remove(d);
> >
> > @@ -2433,6 +2443,71 @@ void thaw_domains(void)
> >      rcu_read_unlock(&domlist_read_lock);
> >  }
> >
> > +domid_t domid_alloc(domid_t domid)
> > +{
> > +    static domid_t domid_last;
> > +
> > +    spin_lock(&domid_lock);
> > +
> > +    /* Exact match. */
> > +    if ( domid < DOMID_FIRST_RESERVED )
> > +    {
> > +        if ( __test_and_set_bit(domid, domid_bitmap) )
> > +            domid =3D DOMID_INVALID;
> > +    }
> > +    /*
> > +     * Exhaustive search.
> > +     *
> > +     * Domain ID#0 is reserved for the first boot domain (e.g. control=
 domain)
> > +     * and excluded from allocation.
> > +     *
> > +     * In dom0less build, domains are not dynamically destroyed, so th=
ere's no
> > +     * need to do a wraparound of the IDs.
> > +     */
> > +#ifdef CONFIG_DOM0LESS_BOOT
>=20
> These ifdef guards are problematic. The fact that a platform supports dom=
0less
> doesn't mean that every boot is dom0less (I can boot a non-dom0less syste=
m on
> a dom0less-capable Xen).

These #ifdefs are meant to align the code with the current Arm behavior, bu=
t
there will be correction.

There was v9 feedback around create_domUs() on that:
  https://lore.kernel.org/all/d0829041-1375-4161-b2c4-f8dffadbb657@xen.org/

>=20
> Furthermore, the rationale for panicking on wraparound is because of exha=
ustion,
> but you do have a proper bitmap here to do proper exhaustive search, so I=
MO,
> this branch is not necessary.
>=20
> > +    else if ( domid_last + 1 >=3D DOMID_FIRST_RESERVED )
> > +    {
> > +        domid =3D DOMID_INVALID;
> > +    }
> > +#endif
> > +    else
> > +    {
> > +        domid =3D find_next_zero_bit(domid_bitmap,
> > +                                   DOMID_FIRST_RESERVED,
> > +                                   domid_last + 1);
> > +#ifdef CONFIG_DOM0LESS_BOOT
> > +        if ( domid =3D=3D DOMID_FIRST_RESERVED )
> > +            domid =3D find_next_zero_bit(domid_bitmap,
> > +                                       DOMID_FIRST_RESERVED,
> > +                                       1);
>=20
> nit: I'd say 0 is fair game. On Hyperlaunch (and soon dom0less) it'll be =
possible
> to have a domU with domid=3D0 and a hwdom/ctldom with domids !=3D 0 via t=
he domid
> property on the DTB.
>=20
> Starting from 1 might be slightly saner for defence in depth, so it reall=
y is
> a nit. I don't think being cautious about dom0 is necessarily a bad thing=
.

I kept 1 to ensure ID#0 is reserved for dom0.

There was v9 feedback around domid_alloc() on that:
  https://lore.kernel.org/all/d0829041-1375-4161-b2c4-f8dffadbb657@xen.org/

>=20
> > +#endif
> > +
> > +        if ( domid < DOMID_FIRST_RESERVED )
> > +        {
> > +            __set_bit(domid, domid_bitmap);
> > +            domid_last =3D domid;
>=20
> Rather than setting domid_last here, I'd move it right before the spin_un=
lock()
> gated by "if ( domid !=3D DOMID_INVALID )". That'd also bump domid_last i=
n the
> exact match case.
>=20
> It also allows to drop the (then) redundant braces.
>=20
> > +        }
> > +        else
> > +        {
>=20
> nit: redundant braces

Ack.

>=20
> > +            domid =3D DOMID_INVALID;
> > +        }
> > +    }
> > +
> > +    spin_unlock(&domid_lock);
> > +
> > +    return domid;
> > +}
> > +
> > +void domid_free(domid_t domid)
> > +{
> > +    if ( domid < DOMID_FIRST_RESERVED )
> > +    {
> > +        spin_lock(&domid_lock);
> > +        __clear_bit(domid, domid_bitmap);
> > +        spin_unlock(&domid_lock);
> > +    }
> > +}
> > +
> >  /*
> >   * Local variables:
> >   * mode: C
> > diff --git a/xen/common/domctl.c b/xen/common/domctl.c
> > index bfe2e1f9f057..8ef0c147c9b0 100644
> > --- a/xen/common/domctl.c
> > +++ b/xen/common/domctl.c
> > @@ -49,20 +49,6 @@ static int xenctl_bitmap_to_nodemask(nodemask_t *nod=
emask,
> >                                     MAX_NUMNODES);
> >  }
> >
> > -static inline int is_free_domid(domid_t dom)
> > -{
> > -    struct domain *d;
> > -
> > -    if ( dom >=3D DOMID_FIRST_RESERVED )
> > -        return 0;
> > -
> > -    if ( (d =3D rcu_lock_domain_by_id(dom)) =3D=3D NULL )
> > -        return 1;
> > -
> > -    rcu_unlock_domain(d);
> > -    return 0;
> > -}
>=20
> Good riddance. This is racy without the domctl lock.
>=20
> > -
> >  void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *=
info)
> >  {
> >      struct vcpu *v;
> > @@ -421,36 +407,18 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_=
t) u_domctl)
> >
> >      case XEN_DOMCTL_createdomain:
> >      {
> > -        domid_t        dom;
> > -        static domid_t rover =3D 0;
> > +        domid_t domid =3D domid_alloc(op->domain);
> >
> > -        dom =3D op->domain;
> > -        if ( (dom > 0) && (dom < DOMID_FIRST_RESERVED) )
> > +        if ( domid =3D=3D DOMID_INVALID )
> >          {
> >              ret =3D -EEXIST;
>=20
> nit: IMO. If createdomain didn't set domctl.domid, we shouldn't return EE=
XIST,
>      but ENOSPC. It's a very impossible case, so I don't care much though=
.

I agree, but that will be behavior change which I want to avoid.
I kept -EEXIST because I am not sure how users treat the return value.

>=20
> > -            if ( !is_free_domid(dom) )
> > -                break;
> > -        }
> > -        else
> > -        {
> > -            for ( dom =3D rover + 1; dom !=3D rover; dom++ )
> > -            {
> > -                if ( dom =3D=3D DOMID_FIRST_RESERVED )
> > -                    dom =3D 1;
> > -                if ( is_free_domid(dom) )
> > -                    break;
> > -            }
> > -
> > -            ret =3D -ENOMEM;
> > -            if ( dom =3D=3D rover )
> > -                break;
> > -
> > -            rover =3D dom;
> > +            break;
> >          }
> >
> > -        d =3D domain_create(dom, &op->u.createdomain, false);
> > +        d =3D domain_create(domid, &op->u.createdomain, false);
> >          if ( IS_ERR(d) )
> >          {
> > +            domid_free(domid);
> >              ret =3D PTR_ERR(d);
> >              d =3D NULL;
> >              break;
> > diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
> > index e10baf2615fd..8aab05ae93c8 100644
> > --- a/xen/include/xen/domain.h
> > +++ b/xen/include/xen/domain.h
> > @@ -38,6 +38,9 @@ void arch_get_domain_info(const struct domain *d,
> >
> >  domid_t get_initial_domain_id(void);
> >
> > +domid_t domid_alloc(domid_t domid);
> > +void domid_free(domid_t domid);
> > +
> >  /* CDF_* constant. Internal flags for domain creation. */
> >  /* Is this a privileged domain? */
> >  #define CDF_privileged           (1U << 0)
>=20
> Cheers,
> Alejandro
>=20


