Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46156B1D007
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 03:17:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072381.1435532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujpFV-0004k9-5L; Thu, 07 Aug 2025 01:16:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072381.1435532; Thu, 07 Aug 2025 01:16:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujpFV-0004ii-2B; Thu, 07 Aug 2025 01:16:53 +0000
Received: by outflank-mailman (input) for mailman id 1072381;
 Thu, 07 Aug 2025 01:16:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ybbA=2T=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ujpFT-0004ia-H6
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 01:16:51 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31955f43-732c-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 03:16:49 +0200 (CEST)
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
X-Inumbo-ID: 31955f43-732c-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1754529408; x=1754788608;
	bh=rTBc5sMJPbERlOInnoBAMaIzbKCImXmp4SIHQ9+POEg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ngsWqaY9Pl588Zce8h2WuA8QMewAK2kPS2yeqktbnI0MK6aXTy9tqz9rUCcH6SKOr
	 POIjmDphcP5sMZF5cVDDtqqysnFz/GMqgRuYUdfDzyNoOY9A/x9++PZPq54Y7X9STD
	 TDNdTPhqBkMBVDJH0WZwgHomr5ylaZpWGZLFfAoU14zvwN1Gf0punSCkK7T4PLF2m8
	 wx3yEeg5c51H6Lq0JYAyozQe45Isn5HORrbx3Yn7cUH3I1AEOciM9nWDha+ZXWE7Kb
	 7w4QmSv7AvOXj4SovRbUFjVjk+QnmLQwuBo+bjlqK6FHqsBbZUjMtFMPXpWrpRJMp+
	 sSTkLS4sjjcnA==
Date: Thu, 07 Aug 2025 01:16:45 +0000
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, alejandro.garciavallejo@amd.com, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v13 1/3] xen/domain: unify domain ID allocation
Message-ID: <aJP+d6FxbFsk63ws@kraken>
In-Reply-To: <aJIJXX4yO0zC8898@macbook.local>
References: <20250730174042.1632011-1-dmukhin@ford.com> <20250730174042.1632011-2-dmukhin@ford.com> <aJIJXX4yO0zC8898@macbook.local>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 63f62ea6ee7e52bc687288994530f2b79801a95f
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 05, 2025 at 03:38:37PM +0200, Roger Pau Monn=C3=A9 wrote:
> On Wed, Jul 30, 2025 at 05:40:54PM +0000, dmkhn@proton.me wrote:
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
> > new common/domid.c based on the bitmap.
> >
> > Allocation algorithm:
> > - If an explicit domain ID is provided, verify its availability and use=
 it if
> >   ID is not used;
> > - If DOMID_INVALID is provided, search the range [1..DOMID_FIRST_RESERV=
ED-1],
> >   starting from the last used ID.
> >   Implementation guarantees that two consecutive calls will never retur=
n the
> >   same ID. ID#0 is reserved for the first boot domain (currently, dom0)=
 and
> >   excluded from the allocation range.
> >
> > Remove is_free_domid() helper as it is not needed now.
> >
> > No functional change intended.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > Reviewed-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> > ---
> > Changes since v12:
> > - updated comment for domid_alloc() and commit message
> > - added Alejandro's R-b
> > ---
> >  xen/arch/arm/domain_build.c             |  7 +-
> >  xen/arch/x86/setup.c                    |  7 +-
> >  xen/common/Makefile                     |  1 +
> >  xen/common/device-tree/dom0less-build.c | 15 ++--
> >  xen/common/domain.c                     |  2 +
> >  xen/common/domctl.c                     | 42 ++---------
> >  xen/common/domid.c                      | 94 +++++++++++++++++++++++++
> >  xen/include/xen/domain.h                |  3 +
> >  8 files changed, 124 insertions(+), 47 deletions(-)
> >  create mode 100644 xen/common/domid.c
> >
> > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > index 463ae4474d30..789f2b9d3ce7 100644
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -2050,6 +2050,7 @@ void __init create_dom0(void)
> >          .grant_opts =3D XEN_DOMCTL_GRANT_version(opt_gnttab_max_versio=
n),
> >      };
> >      unsigned int flags =3D CDF_privileged | CDF_hardware;
> > +    domid_t domid;
> >      int rc;
> >
> >      /* The vGIC for DOM0 is exactly emulating the hardware GIC */
> > @@ -2074,7 +2075,11 @@ void __init create_dom0(void)
> >      if ( !llc_coloring_enabled )
> >          flags |=3D CDF_directmap;
> >
> > -    dom0 =3D domain_create(0, &dom0_cfg, flags);
> > +    domid =3D domid_alloc(0);
> > +    if ( domid =3D=3D DOMID_INVALID )
> > +        panic("Error allocating domain ID 0\n");
> > +
> > +    dom0 =3D domain_create(domid, &dom0_cfg, flags);
> >      if ( IS_ERR(dom0) )
> >          panic("Error creating domain 0 (rc =3D %ld)\n", PTR_ERR(dom0))=
;
> >
> > diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> > index 1543dd251cc6..2ff7c28c277b 100644
> > --- a/xen/arch/x86/setup.c
> > +++ b/xen/arch/x86/setup.c
> > @@ -1047,8 +1047,11 @@ static struct domain *__init create_dom0(struct =
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
>=20
> Nit: in other error messages in the same function we handle the domid
> as an unsigned integer, so %u probably wants using here.  Unless you
> have an explicit intention to print IDs >=3D DOMID_FIRST_RESERVED as
> negative integers?

No negative integers, that should be %u
Thanks!

>=20
> > +
> >      d =3D domain_create(bd->domid, &dom0_cfg,
> >                        pv_shim ? 0 : CDF_privileged | CDF_hardware);
> >      if ( IS_ERR(d) )
> > diff --git a/xen/common/Makefile b/xen/common/Makefile
> > index c316957fcb36..0c7d0f5d46e1 100644
> > --- a/xen/common/Makefile
> > +++ b/xen/common/Makefile
> > @@ -11,6 +11,7 @@ obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) +=3D d=
evice.o
> >  obj-$(CONFIG_DEVICE_TREE_PARSE) +=3D device-tree/
> >  obj-$(CONFIG_IOREQ_SERVER) +=3D dm.o
> >  obj-y +=3D domain.o
> > +obj-y +=3D domid.o
> >  obj-y +=3D event_2l.o
> >  obj-y +=3D event_channel.o
> >  obj-$(CONFIG_EVTCHN_FIFO) +=3D event_fifo.o
> > diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/devic=
e-tree/dom0less-build.c
> > index 6bb038111de9..f4b6b515d2d2 100644
> > --- a/xen/common/device-tree/dom0less-build.c
> > +++ b/xen/common/device-tree/dom0less-build.c
> > @@ -833,6 +833,7 @@ void __init create_domUs(void)
> >      {
> >          struct kernel_info ki =3D KERNEL_INFO_INIT;
> >          int rc =3D parse_dom0less_node(node, &ki.bd);
> > +        domid_t domid;
> >
> >          if ( rc =3D=3D -ENOENT )
> >              continue;
> > @@ -842,13 +843,13 @@ void __init create_domUs(void)
> >          if ( (max_init_domid + 1) >=3D DOMID_FIRST_RESERVED )
> >              panic("No more domain IDs available\n");
> >
> > -        /*
> > -         * The variable max_init_domid is initialized with zero, so he=
re it's
> > -         * very important to use the pre-increment operator to call
> > -         * domain_create() with a domid > 0. (domid =3D=3D 0 is reserv=
ed for Dom0)
> > -         */
> > -        ki.bd.d =3D domain_create(++max_init_domid,
> > -                                &ki.bd.create_cfg, ki.bd.create_flags)=
;
> > +        domid =3D domid_alloc(DOMID_INVALID);
> > +        if ( domid =3D=3D DOMID_INVALID )
> > +            panic("Error allocating ID for domain %s\n", dt_node_name(=
node));
> > +
> > +        max_init_domid =3D max(max_init_domid, domid);
> > +
> > +        ki.bd.d =3D domain_create(domid, &ki.bd.create_cfg, ki.bd.crea=
te_flags);
> >          if ( IS_ERR(ki.bd.d) )
> >              panic("Error creating domain %s (rc =3D %ld)\n",
> >                    dt_node_name(node), PTR_ERR(ki.bd.d));
> > diff --git a/xen/common/domain.c b/xen/common/domain.c
> > index 5241a1629eeb..12fbab01cd8e 100644
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -1473,6 +1473,8 @@ void domain_destroy(struct domain *d)
> >      /* Remove from the domlist/hash. */
> >      domlist_remove(d);
> >
> > +    domid_free(d->domain_id);
>=20
> The domlist removal above still allows current users to continue
> "operating" on the domain until the next RCU.  Should for safety the
> freeing of the domid be deferred to _domain_destroy(), which is
> executed in RCU context, and thus ensures there are no current users
> of the removed domain?
>=20
> I cannot think of a specific scenario where this could be dangerous
> right now, but deferring to RCU context together with the final
> cleanup seems safer overall.

I agree, _domain_destroy() is the place for domid_free().

>=20
> > +
> >      /* Schedule RCU asynchronous completion of domain destroy. */
> >      call_rcu(&d->rcu, complete_domain_destroy);
> >  }
> > diff --git a/xen/common/domctl.c b/xen/common/domctl.c
> > index f2a7caaf853c..5509998aa139 100644
> > --- a/xen/common/domctl.c
> > +++ b/xen/common/domctl.c
> > @@ -51,20 +51,6 @@ static int xenctl_bitmap_to_nodemask(nodemask_t *nod=
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
> > -
> >  void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *=
info)
> >  {
> >      struct vcpu *v;
> > @@ -423,36 +409,18 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_=
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
>=20
> This is a change in behavior AFAICT, as you now allow
> XEN_DOMCTL_createdomain to possibly create a domain with domid 0 (if
> it's available).  Currently op->domain =3D=3D 0 is handled as op->domain
> =3D=3D DOMID_FIRST_RESERVED. You either need to adjust the code here, so
> that you do:
>=20
> domid_t domid =3D domid_alloc(op->domain ?: DOMID_FIRST_RESERVED);
>=20
> Or domid_alloc() needs to be adjusted to handle an input domid =3D=3D 0 a=
s
> it handles DOMID_FIRST_RESERVED.

Thanks!
I will adjust code in do_domctl().

>=20
> >          {
> >              ret =3D -EEXIST;
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
> > diff --git a/xen/common/domid.c b/xen/common/domid.c
> > new file mode 100644
> > index 000000000000..e727dcaf0793
> > --- /dev/null
> > +++ b/xen/common/domid.c
> > @@ -0,0 +1,94 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Domain ID allocator.
> > + *
> > + * Covers dom0 or late hwdom, predefined domains, post-boot domains.
> > + * Excludes Xen system domains (ID >=3D DOMID_FIRST_RESERVED).
> > + *
> > + * Copyright 2025 Ford Motor Company
> > + */
> > +
> > +#include <xen/domain.h>
> > +
> > +static DEFINE_SPINLOCK(domid_lock);
> > +static DECLARE_BITMAP(domid_bitmap, DOMID_FIRST_RESERVED);
> > +
> > +/*
> > + * Allocate domain ID.
> > + *
> > + * @param domid Domain ID hint:
> > + * - If an explicit domain ID is provided, verify its availability and=
 use it
> > + *   if ID is not used;
> > + * - If DOMID_INVALID is provided, search [1..DOMID_FIRST_RESERVED-1] =
range,
> > + *   starting from the last used ID. Implementation guarantees that tw=
o
> > + *   consecutive calls will never return the same ID. ID#0 is reserved=
 for
> > + *   the first boot domain (currently, dom0) and excluded from the all=
ocation
> > + *   range.
> > + * @return Valid domain ID in case of successful allocation,
> > + *         DOMID_INVALID - otherwise.
> > + */
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
> > +     */
> > +    else
> > +    {
> > +        domid =3D find_next_zero_bit(domid_bitmap,
> > +                                   DOMID_FIRST_RESERVED,
> > +                                   domid_last + 1);
> > +        if ( domid =3D=3D DOMID_FIRST_RESERVED )
>=20
> Nit: you could further gate this second search to domid_last !=3D 0, as
> otherwise the first search has already scanned the whole bitmap.

Ack.

>=20
> > +            domid =3D find_next_zero_bit(domid_bitmap,
> > +                                       DOMID_FIRST_RESERVED,
> > +                                       1);
>=20
> Nit: you could possibly limit this second search to (domid_last + 1)
> size, as you have already searched from [domid_last + 1,
> DOMID_FIRST_RESERVED], and the bitmap couldn't have changed as the
> lock is being held.

Ack.

>=20
> Thanks, Roger.


