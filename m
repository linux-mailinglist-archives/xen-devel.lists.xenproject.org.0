Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F5CABA277
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 20:07:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.987417.1372691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFzSh-0003V1-JC; Fri, 16 May 2025 18:07:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 987417.1372691; Fri, 16 May 2025 18:07:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFzSh-0003SQ-G6; Fri, 16 May 2025 18:07:11 +0000
Received: by outflank-mailman (input) for mailman id 987417;
 Fri, 16 May 2025 18:07:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=07xk=YA=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uFzSf-0003SK-Db
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 18:07:10 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91c6c285-3280-11f0-9eb6-5ba50f476ded;
 Fri, 16 May 2025 20:07:03 +0200 (CEST)
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
X-Inumbo-ID: 91c6c285-3280-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1747418821; x=1747678021;
	bh=P6nu4SsxXiP2P+YxNX+aZdhXlSA+W3wSb6kfH+jAAIk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=jCZmIBChTQurmXZOQU++Dpd2cQ9NGLVxDOCcQxmpr0+WiITOEiR/hSYEZyX+lCrZg
	 RnTAe6OPPp5wqoTtCbyvYMB4UPIZUNoEKxLX668AoUQxMVufQUtOssXTw1C222PbDX
	 ni7KeK9k5lSUknw90VfqL5zZXXPHu7CGpsX8JSaws70shWWtU0JQINwHBL+jHsSTek
	 9ldW7HXFKne6DfjQAZcOf4WqO3IdK/mFShEJ6+8hWIvCPAKHP9onWRHNucC4cRZQr1
	 EnI7w2pu6zFxUJqmW6p5jYeasMqjn71b9jMpOBkiycaHSQajZYYH49R7jGDOw4bx6E
	 XQboQRYvrRkIQ==
Date: Fri, 16 May 2025 18:06:56 +0000
To: Teddy Astie <teddy.astie@vates.tech>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v6 1/2] xen/domain: unify domain ID allocation
Message-ID: <aCd+vEOrQcbCYFgY@kraken>
In-Reply-To: <3c9f60b3-cedb-4689-a3b4-15ebddcf9f67@vates.tech>
References: <20250516020434.1145337-1-dmukhin@ford.com> <20250516020434.1145337-2-dmukhin@ford.com> <3c9f60b3-cedb-4689-a3b4-15ebddcf9f67@vates.tech>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 550e272c748fe01b69429eddf7b387fcaccd2847
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 08:43:35AM +0000, Teddy Astie wrote:
> Hello,
>=20
> Le 16/05/2025 =C3=A0 04:06, dmkhn@proton.me a =C3=A9crit=C2=A0:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Currently, hypervisor code has two different non-system domain ID alloc=
ation
> > implementations:
> >
> >    (a) Sequential IDs allocation in dom0less Arm code based on max_init=
_domid;
> >
> >    (b) Sequential IDs allocation in XEN_DOMCTL_createdomain; does not u=
se
> >        max_init_domid (both Arm and x86).
> >
> > It makes sense to have a common helper code for such task across archit=
ectures
> > (Arm and x86) and between dom0less / toolstack domU allocation.
> >
> > Wrap the domain ID allocation as an arch-independent function domid_all=
oc() in
> > common/domain.c based on rangeset.
> >
> > Allocation algorithm:
> > - If an explicit domain ID is provided, verify its availability and
> >    use it if ID is not used;
> > - Otherwise, perform an exhaustive search starting from the end of the =
used
> >    domain ID range. domid_alloc() guarantees that two subsequent calls =
will
> >    result in different IDs allocation.
> >
> > Initialize the domain IDs rangeset from the new domid_init() which is c=
alled
> > from arch setup code.
> >
> > Also, remove is_free_domid() helper as it is not needed now.
> >
> > No functional change intended.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Changes since v5:
> > - rebased
> > ---
> >   xen/arch/arm/domain_build.c             | 17 ++++--
> >   xen/arch/arm/setup.c                    |  2 +
> >   xen/arch/x86/setup.c                    | 13 +++--
> >   xen/common/device-tree/dom0less-build.c | 10 ++--
> >   xen/common/domain.c                     | 70 ++++++++++++++++++++++++=
+
> >   xen/common/domctl.c                     | 41 ++-------------
> >   xen/include/xen/domain.h                |  4 ++
> >   7 files changed, 107 insertions(+), 50 deletions(-)
> >
> > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > index b189a7cfae..e9d563c269 100644
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -2010,6 +2010,7 @@ void __init create_dom0(void)
> >           .grant_opts =3D XEN_DOMCTL_GRANT_version(opt_gnttab_max_versi=
on),
> >       };
> >       unsigned int flags =3D CDF_privileged | CDF_hardware;
> > +    domid_t domid;
> >       int rc;
> >
> >       /* The vGIC for DOM0 is exactly emulating the hardware GIC */
> > @@ -2034,19 +2035,25 @@ void __init create_dom0(void)
> >       if ( !llc_coloring_enabled )
> >           flags |=3D CDF_directmap;
> >
> > -    dom0 =3D domain_create(0, &dom0_cfg, flags);
> > +    domid =3D domid_alloc(0);
> > +    if ( domid =3D=3D DOMID_INVALID )
> > +        panic("Error allocating domain ID 0\n");
> > +
> > +    dom0 =3D domain_create(domid, &dom0_cfg, flags);
> >       if ( IS_ERR(dom0) )
> > -        panic("Error creating domain 0 (rc =3D %ld)\n", PTR_ERR(dom0))=
;
> > +        panic("Error creating domain %d (rc =3D %ld)\n", domid, PTR_ER=
R(dom0));
> >
> >       if ( llc_coloring_enabled && (rc =3D dom0_set_llc_colors(dom0)) )
> > -        panic("Error initializing LLC coloring for domain 0 (rc =3D %d=
)\n", rc);
> > +        panic("Error initializing LLC coloring for domain %pd (rc =3D =
%d)\n",
> > +              dom0, rc);
> >
> >       if ( alloc_dom0_vcpu0(dom0) =3D=3D NULL )
> > -        panic("Error creating domain 0 vcpu0\n");
> > +        panic("Error creating domain %pdv0\n", dom0);
> >
> >       rc =3D construct_dom0(dom0);
> >       if ( rc )
> > -        panic("Could not set up DOM0 guest OS (rc =3D %d)\n", rc);
> > +        panic("Could not set up guest OS for domain %pd (rc =3D %d)\n"=
,
> > +              dom0, rc);
> >
> >       set_xs_domain(dom0);
> >   }
> > diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> > index 10b46d0684..c3959e8d8e 100644
> > --- a/xen/arch/arm/setup.c
> > +++ b/xen/arch/arm/setup.c
> > @@ -418,6 +418,8 @@ void asmlinkage __init start_xen(unsigned long fdt_=
paddr)
> >
> >       timer_init();
> >
> > +    domid_init();
> > +
> >       init_idle_domain();
> >
> >       rcu_init();
> > diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> > index 2518954124..02f665f520 100644
> > --- a/xen/arch/x86/setup.c
> > +++ b/xen/arch/x86/setup.c
> > @@ -1030,8 +1030,11 @@ static struct domain *__init create_dom0(struct =
boot_info *bi)
> >       if ( iommu_enabled )
> >           dom0_cfg.flags |=3D XEN_DOMCTL_CDF_iommu;
> >
> > -    /* Create initial domain.  Not d0 for pvshim. */
> > -    bd->domid =3D get_initial_domain_id();
> > +    /* Allocate initial domain ID. Not d0 for pvshim. */
> > +    bd->domid =3D domid_alloc(get_initial_domain_id());
> > +    if ( bd->domid =3D=3D DOMID_INVALID )
> > +        panic("Error allocating domain ID %d\n", get_initial_domain_id=
());
> > +
> >       d =3D domain_create(bd->domid, &dom0_cfg,
> >                         pv_shim ? 0 : CDF_privileged | CDF_hardware);
> >       if ( IS_ERR(d) )
> > @@ -1063,7 +1066,7 @@ static struct domain *__init create_dom0(struct b=
oot_info *bi)
> >
> >           if ( (strlen(acpi_param) =3D=3D 0) && acpi_disabled )
> >           {
> > -            printk("ACPI is disabled, notifying Domain 0 (acpi=3Doff)\=
n");
> > +            printk("ACPI is disabled, notifying domain %pd (acpi=3Doff=
)\n", d);
> >               safe_strcpy(acpi_param, "off");
> >           }
> >
> > @@ -1078,7 +1081,7 @@ static struct domain *__init create_dom0(struct b=
oot_info *bi)
> >
> >       bd->d =3D d;
> >       if ( construct_dom0(bd) !=3D 0 )
> > -        panic("Could not construct domain 0\n");
> > +        panic("Could not construct domain %pd\n", d);
> >
> >       bd->cmdline =3D NULL;
> >       xfree(cmdline);
> > @@ -1915,6 +1918,8 @@ void asmlinkage __init noreturn __start_xen(void)
> >       mmio_ro_ranges =3D rangeset_new(NULL, "r/o mmio ranges",
> >                                     RANGESETF_prettyprint_hex);
> >
> > +    domid_init();
> > +
> >       xsm_multiboot_init(bi);
> >
> >       /*
> > diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/devic=
e-tree/dom0less-build.c
> > index 2c56f13771..9236dbae11 100644
> > --- a/xen/common/device-tree/dom0less-build.c
> > +++ b/xen/common/device-tree/dom0less-build.c
> > @@ -850,15 +850,13 @@ void __init create_domUs(void)
> >           struct xen_domctl_createdomain d_cfg =3D {0};
> >           unsigned int flags =3D 0U;
> >           bool has_dtb =3D false;
> > +        domid_t domid;
> >           uint32_t val;
> >           int rc;
> >
> >           if ( !dt_device_is_compatible(node, "xen,domain") )
> >               continue;
> >
> > -        if ( (max_init_domid + 1) >=3D DOMID_FIRST_RESERVED )
> > -            panic("No more domain IDs available\n");
> > -
> >           d_cfg.max_evtchn_port =3D 1023;
> >           d_cfg.max_grant_frames =3D -1;
> >           d_cfg.max_maptrack_frames =3D -1;
> > @@ -981,7 +979,11 @@ void __init create_domUs(void)
> >            * very important to use the pre-increment operator to call
> >            * domain_create() with a domid > 0. (domid =3D=3D 0 is reser=
ved for Dom0)
> >            */
> > -        d =3D domain_create(++max_init_domid, &d_cfg, flags);
> > +        domid =3D domid_alloc(++max_init_domid);
> > +        if ( domid =3D=3D DOMID_INVALID )
> > +            panic("Error allocating ID for domain %s\n", dt_node_name(=
node));
> > +
> > +        d =3D domain_create(domid, &d_cfg, flags);
> >           if ( IS_ERR(d) )
> >               panic("Error creating domain %s (rc =3D %ld)\n",
> >                     dt_node_name(node), PTR_ERR(d));
> > diff --git a/xen/common/domain.c b/xen/common/domain.c
> > index abf1969e60..0ba3cdc47d 100644
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -66,6 +66,74 @@ DEFINE_RCU_READ_LOCK(domlist_read_lock);
> >   static struct domain *domain_hash[DOMAIN_HASH_SIZE];
> >   struct domain *domain_list;
> >
> > +/* Non-system domain ID allocator. */
> > +static DEFINE_SPINLOCK(domid_lock);
> > +static struct rangeset *domid_rangeset;
> > +static unsigned int domid_last;
> > +
> > +void __init domid_init(void)
> > +{
> > +    domid_rangeset =3D rangeset_new(NULL, "domid", RANGESETF_prettypri=
nt_hex);
> > +    if ( !domid_rangeset )
> > +        panic("cannot allocate domain ID rangeset\n");
> > +
> > +    rangeset_limit(domid_rangeset, DOMID_FIRST_RESERVED);
> > +}
> > +
> > +/*
> > + * Allocate new non-system domain ID based on the hint.
> > + *
> > + * If hint is outside of valid [0..DOMID_FIRST_RESERVED - 1] range of =
IDs,
> > + * perform an exhaustive search starting from the end of the used doma=
in ID
> > + * range.
> > + */
> > +domid_t domid_alloc(domid_t domid)
> > +{
> > +    spin_lock(&domid_lock);
> > +
> > +    if ( domid < DOMID_FIRST_RESERVED )
> > +    {
> > +        if ( rangeset_contains_singleton(domid_rangeset, domid) )
> > +            domid =3D DOMID_INVALID;
> > +    }
> > +    else
> > +    {
> > +        for ( domid =3D domid_last + 1; domid !=3D domid_last; domid++=
 )
> > +        {
> > +            if ( domid =3D=3D DOMID_FIRST_RESERVED )
> > +                domid =3D 0;
> > +
> > +            if ( !rangeset_contains_singleton(domid_rangeset, domid) )
> > +                break;
> > +        }
> > +
> > +        if ( domid =3D=3D domid_last )
> > +            domid =3D DOMID_INVALID;
> > +    }
> > +
> > +    if ( domid !=3D DOMID_INVALID )
> > +    {
> > +        ASSERT(!rangeset_add_singleton(domid_rangeset, domid));
> > +
> > +        if ( domid !=3D domid_last )
> > +            domid_last =3D domid;
> > +    }
> > +
> > +    spin_unlock(&domid_lock);
> > +
> > +    return domid;
> > +}
>=20
> It's mostly a matter of implementation choice, but I am not really fan
> of relying on rangesets, which to me are meant for address ranges or
> something similar but at least large.
>=20
> I would rather rely on a bitmap using find_first_zero_bit+set_bit which
> avoids doing a per-domid test, and may be simpler overall. The bitmap
> size for 0x3FF0 domains is almost 4KB, which looks acceptable.
>=20
> I don't know what other thinks.

Thanks for taking a look!

TBH, I was initially considering using a bitmap. But then I chose use range=
sets
because statically defined bitmap will increase the binary size, which may =
be
indesirable; and for dynamic allocation, rangeset has all convenience APIs
implemented...

>=20
> > +
> > +void domid_free(domid_t domid)
> > +{
> > +    spin_lock(&domid_lock);
> > +
> > +    if ( rangeset_contains_singleton(domid_rangeset, domid) )
> > +        ASSERT(!rangeset_remove_singleton(domid_rangeset, domid));
> > +
> > +    spin_unlock(&domid_lock);
> > +}
> > +
> >   /*
> >    * Insert a domain into the domlist/hash.  This allows the domain to =
be looked
> >    * up by domid, and therefore to be the subject of hypercalls/etc.
> > @@ -1449,6 +1517,8 @@ void domain_destroy(struct domain *d)
> >
> >       TRACE_TIME(TRC_DOM0_DOM_REM, d->domain_id);
> >
> > +    domid_free(d->domain_id);
> > +
> >       /* Remove from the domlist/hash. */
> >       domlist_remove(d);
> >
> > diff --git a/xen/common/domctl.c b/xen/common/domctl.c
> > index bfe2e1f9f0..2e02139660 100644
> > --- a/xen/common/domctl.c
> > +++ b/xen/common/domctl.c
> > @@ -49,20 +49,6 @@ static int xenctl_bitmap_to_nodemask(nodemask_t *nod=
emask,
> >                                      MAX_NUMNODES);
> >   }
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
> >   void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo =
*info)
> >   {
> >       struct vcpu *v;
> > @@ -421,34 +407,15 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_=
t) u_domctl)
> >
> >       case XEN_DOMCTL_createdomain:
> >       {
> > -        domid_t        dom;
> > -        static domid_t rover =3D 0;
> > +        domid_t domid =3D domid_alloc(op->domain);
> >
> > -        dom =3D op->domain;
> > -        if ( (dom > 0) && (dom < DOMID_FIRST_RESERVED) )
> > +        if ( domid =3D=3D DOMID_INVALID )
> >           {
> >               ret =3D -EEXIST;
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
> >           }
> >
> > -        d =3D domain_create(dom, &op->u.createdomain, false);
> > +        d =3D domain_create(domid, &op->u.createdomain, false);
> >           if ( IS_ERR(d) )
> >           {
> >               ret =3D PTR_ERR(d);
>=20
> In case the domain creation failure, we need to free the domid,
> otherwise, it would not be used anymore as considered used by the domid
> allocator.

Thanks!

>=20
> > diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
> > index e10baf2615..039bb7eeaf 100644
> > --- a/xen/include/xen/domain.h
> > +++ b/xen/include/xen/domain.h
> > @@ -38,6 +38,10 @@ void arch_get_domain_info(const struct domain *d,
> >
> >   domid_t get_initial_domain_id(void);
> >
> > +void domid_init(void);
> > +void domid_free(domid_t domid);
> > +domid_t domid_alloc(domid_t domid);
> > +
> >   /* CDF_* constant. Internal flags for domain creation. */
> >   /* Is this a privileged domain? */
> >   #define CDF_privileged           (1U << 0)
>=20
> Teddy
>=20
>=20
> Teddy Astie | Vates XCP-ng Developer
>=20
> XCP-ng & Xen Orchestra - Vates solutions
>=20
> web: https://vates.tech
>=20
>=20
>=20


