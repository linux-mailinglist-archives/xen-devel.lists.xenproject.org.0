Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 114E6A99E64
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 03:40:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965740.1356195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7lZj-000820-1t; Thu, 24 Apr 2025 01:40:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965740.1356195; Thu, 24 Apr 2025 01:40:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7lZi-0007zo-Ui; Thu, 24 Apr 2025 01:40:26 +0000
Received: by outflank-mailman (input) for mailman id 965740;
 Thu, 24 Apr 2025 01:40:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9zow=XK=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u7lZg-0007zi-36
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 01:40:25 +0000
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch
 [79.135.106.31]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15a70189-20ad-11f0-9eb1-5ba50f476ded;
 Thu, 24 Apr 2025 03:40:21 +0200 (CEST)
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
X-Inumbo-ID: 15a70189-20ad-11f0-9eb1-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745458819; x=1745718019;
	bh=E/pMn9s671PtyemGwfmn/DeTr7HmEQ+adb1LZrX6IO4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=jErJxlF2dfnoc5+fuT+lJCNaLoYepJq8hOlGpjDtp5IxwqGCoG2me7gFIyDXzk7mA
	 36W2XODrN8nJ9vTlQsf4uDOmUAM7now0ywq5Jja66UW/vzAdWBgA5yEoNA9XZjbadT
	 okEXpGuthjnD2brR7HkF+66hR9yt3qWWqu3P/MYgSwZAqz7QRx4Cjf/lEbk7yr9rAa
	 3XlqTkGi/Kluj3SrSUNi3uVzrl6kK1mCOJ7mO45SlDQJJF18SWx26pLm25FitNep9e
	 Js6kIw3ebnJ5dQYd4orol/pUw9/FPaR0mEmr8Sb+3inl8KtTvfixdPGGj4x3ZdmFLa
	 eF1FgHe/sarqA==
Date: Thu, 24 Apr 2025 01:40:13 +0000
To: Julien Grall <julien@xen.org>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v4] xen/domain: unify domain ID allocation
Message-ID: <aAmWep+FJKCcw5hd@kraken>
In-Reply-To: <f0f159e6-ad79-4c1a-a61e-0272615754d6@xen.org>
References: <20250422215322.521464-1-dmukhin@ford.com> <f0f159e6-ad79-4c1a-a61e-0272615754d6@xen.org>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: c001325e1c16558bfb4bb2bbc1ee4262a3042bf4
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Julien,

Thanks a lot for review!

On Wed, Apr 23, 2025 at 12:22:39PM +0100, Julien Grall wrote:
> Hi Denis,
>=20
> On 22/04/2025 22:54, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Currently, hypervisor code has two different non-system domain ID alloc=
ation
> > algorithms:
> >
> >    (a) Arm port allocates IDs sequentially based on max_init_domid;
> >
> >    (b) x86 has another algorithm implementation embedded into
> >        XEN_DOMCTL_createdomain; does not use max_init_domid, but does s=
imilar
> >        thing wrt sequentially allocating IDs.
>=20
> I am a bit confused with this statement. This is implying the code is
> only used by x86. However, XEN_DOMCTL_createdomain is common code and
> used by Arm when creating domains from the toolstack. Can you clarify?

Sorry for confusion. On x86, only implementation in "XEN_DOMCTL_createdomai=
n"
is used; I should have provided a clearer explanation.

> With this in mind...
>=20
> >
> > It makes sense to have a common helper code for such task across archit=
ectures
> > (Arm and x86).
>=20
> ... the unification is effectively between dom0less domU allocation and
> the toolstack domU allocation.

Correct; I will re-phrase, once there's agreement on the direction for this
patch in general.

>=20
> >
> > Wrap the domain ID allocation as an arch-independent function domid_all=
oc() in
> > common/domain.c.
> >
> > Allocation algorithm:
> > - If an explicit domain ID is provided, verify its availability and
> >    use it if ID is unused;
> > - Otherwise, perform an exhaustive search starting from the end of the =
used
> >    domain ID range, excluding hardware_domid.
> >
> > Move the is_free_domid() helper closer to domid_alloc(). Simplify
> > is_free_domid() by removing the domain ID range check, as the ID is now
> > guaranteed to be within the valid range. Additionally, update the predi=
cate to
> > return a bool value instead of an int.
> >
> > No functional change intended.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Changes v3->v4:
> > - fixed the behavior of domctl ID allocator to match the original behav=
ior
> >    in case of exhaustive search
> > - use domid_t input argument in domid_alloc()
> > - use DOMID_INVALID as an indicator of performing an exhaustive search
> > - use DOMID_INVALID as an indicator of allocator failure
> > - use %pd formatting for domain ID printouts in the modified code
> > - some comments fixups
> > - Link to v2: https://lore.kernel.org/xen-devel/20250416061509.934220-1=
-dmukhin@ford.com/
> > - CI run: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines=
/1780576277
> > ---
> >   xen/arch/arm/dom0less-build.c | 17 ++++++------
> >   xen/arch/arm/domain_build.c   | 17 ++++++++----
> >   xen/arch/x86/setup.c          | 11 +++++---
> >   xen/common/domain.c           | 51 ++++++++++++++++++++++++++++++++++=
+
> >   xen/common/domctl.c           | 41 +++-------------------------
> >   xen/include/xen/domain.h      |  2 ++
> >   6 files changed, 84 insertions(+), 55 deletions(-)
> >
> > diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-buil=
d.c
> > index a356fc94fc..61e01b7306 100644
> > --- a/xen/arch/arm/dom0less-build.c
> > +++ b/xen/arch/arm/dom0less-build.c
> > @@ -1038,15 +1038,13 @@ void __init create_domUs(void)
> >           };
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
> >           if ( dt_property_read_u32(node, "capabilities", &val) )
> >           {
> >               if ( val & ~DOMAIN_CAPS_MASK )
> > @@ -1218,12 +1216,13 @@ void __init create_domUs(void)
> >           if ( !llc_coloring_enabled && llc_colors_str )
> >               panic("'llc-colors' found, but LLC coloring is disabled\n=
");
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
>=20
> While I think it is a good idea to have a single way to allocate domain
> IDs, I am a bit concerned of the change for dom0less domUs. By
> introducing domid_alloc(), it will now be easier to change the behavior
> of the domain ID allocation without realizing the impact for dom0less
> domUs (max_init_domid is mainly used to limit the loop when switching
> consoles).

max_init_domid is (originally) why I am touching this code, in the context =
of:
  https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v3-v1-0-c5d36b31d=
66c@ford.com/

>=20
> I think we need to document explicitely in domid_alloc() that some
> callers specifically rely on the existing allocation scheme. So we need
> to be careful when changing it.
>=20
> > +
> > +        d =3D domain_create(domid, &d_cfg, flags);
> >           if ( IS_ERR(d) )
> >               panic("Error creating domain %s (rc =3D %ld)\n",
> >                     dt_node_name(node), PTR_ERR(d));
> > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > index 270a6b97e4..fe968dd66b 100644
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -2371,6 +2371,7 @@ void __init create_dom0(void)
> >           .grant_opts =3D XEN_DOMCTL_GRANT_version(opt_gnttab_max_versi=
on),
> >       };
> >       unsigned int flags =3D CDF_privileged | CDF_hardware;
> > +    domid_t domid;
> >       int rc;
> >
> >       /* The vGIC for DOM0 is exactly emulating the hardware GIC */
> > @@ -2395,19 +2396,25 @@ void __init create_dom0(void)
> >       if ( !llc_coloring_enabled )
> >           flags |=3D CDF_directmap;
> >
> > -    dom0 =3D domain_create(0, &dom0_cfg, flags);
> > +    domid =3D domid_alloc(get_initial_domain_id());
>=20
> This is technically a change of behavior for Arm if the hardware_domid
> is not 0. I think we need to using 0 here. If you want to change the
> behavior, then this should be a separate patch=C2=A0with a proper explana=
tion.

I agree, it is better to isolate Arm hardware_domid-related change in a
separate patch; will do that.

My understanding that the code in create_dom0() should have been using
hardware_domid instead of open coded 0: get_initial_domain_id() returns the
value of hardware_domid on Arm, and then domid_alloc(DOMID_INVALID) in domU
case should ensure that ID of get_initial_domain_id() is skipped during the
domain ID search.

>=20
> > +    if ( domid =3D=3D  DOMID_INVALID )
> > +        panic("Error allocating domain ID %d\n", get_initial_domain_id=
());
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
> > diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> > index 24b36c1a59..e61c023085 100644
> > --- a/xen/arch/x86/setup.c
> > +++ b/xen/arch/x86/setup.c
> > @@ -1009,8 +1009,11 @@ static struct domain *__init create_dom0(struct =
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
> > @@ -1038,7 +1041,7 @@ static struct domain *__init create_dom0(struct b=
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
> > @@ -1053,7 +1056,7 @@ static struct domain *__init create_dom0(struct b=
oot_info *bi)
> >
> >       bd->d =3D d;
> >       if ( construct_dom0(bd) !=3D 0 )
> > -        panic("Could not construct domain 0\n");
> > +        panic("Could not construct domain %pd\n", d);
> >
> >       return d;
> >   }
> > diff --git a/xen/common/domain.c b/xen/common/domain.c
> > index abf1969e60..7c0f7a4990 100644
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -66,6 +66,57 @@ DEFINE_RCU_READ_LOCK(domlist_read_lock);
> >   static struct domain *domain_hash[DOMAIN_HASH_SIZE];
> >   struct domain *domain_list;
> >
> > +/* Domain ID allocator */
> > +static unsigned int domid_last;
> > +
> > +static inline bool is_free_domid(domid_t dom)
> > +{
> > +    struct domain *d =3D rcu_lock_domain_by_id(dom);
> > +
> > +    if ( d )
> > +        rcu_unlock_domain(d);
> > +
> > +    return !d;
> > +}
> > +
> > +/*
> > + * Allocate new domain ID based on the hint.
>=20
> Maybe clarify this should not be used for system domains?

Agree, this I forgot to add; thanks!

>=20
> > + *
> > + * If hint is outside of valid [0..DOMID_FIRST_RESERVED - 1] range of =
IDs,
> > + * perform an exhaustive search starting from the end of the used doma=
in ID
> > + * range, excluding hardware_domid.
> > + */
> > +domid_t domid_alloc(domid_t hint)
>=20
>  From the name, my naive expectation is a second call to domid_alloc()
> (whether concurrent or not) would return a different domid. However,
> AFAICT, this is not the case.

Yes, to guarantee domid_alloc() to return a different value, domid_alloc()
call should be followed by domain_create() call, since domid_alloc()
internally relies on the domain list. I missed that explanation.

>=20
> I am in two mind whether this is the right interface to have. I think
> the minimum would be to clarify the expectation from the callers.

I think that "domain ID check/allocation" can be a library function
shared across all architectures, there's no need to re-implement it:
it looks very unlikely new architectures will need to implement a new schem=
e.

There's another similar domain ID check implementation coming from the
hyperlaunch series, in a part of validating hyperlaunch DT; with having a
library function (my current implementation still needs adjustment),
hyperlaunch code can re-use it.

>=20
> > +{
> > +    domid_t domid =3D DOMID_INVALID;
> > +
> > +    if ( hint < DOMID_FIRST_RESERVED )
> > +    {
> > +        /* Exact match. */
> > +        if ( is_free_domid(hint) )
> > +            domid =3D hint;
> > +    }
> > +    else
> > +    {
> > +        for ( domid =3D domid_last + 1; domid !=3D domid_last; domid++=
 )
> > +        {
> > +            if ( domid =3D=3D DOMID_FIRST_RESERVED )
> > +                domid =3D 0;
> > +
> > +            if ( domid =3D=3D hardware_domid )
> > +                continue;
> > +
> > +            if ( is_free_domid(domid) )
> > +                break;
> > +        }
> > +
> > +        if ( domid !=3D domid_last )
> > +            domid_last =3D domid;
> > +    }
> > +
> > +    return domid;
> > +}
> > +
> >   /*
> >    * Insert a domain into the domlist/hash.  This allows the domain to =
be looked
> >    * up by domid, and therefore to be the subject of hypercalls/etc.
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
> > diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
> > index e10baf2615..43e9411fc0 100644
> > --- a/xen/include/xen/domain.h
> > +++ b/xen/include/xen/domain.h
> > @@ -38,6 +38,8 @@ void arch_get_domain_info(const struct domain *d,
> >
> >   domid_t get_initial_domain_id(void);
> >
> > +domid_t domid_alloc(domid_t hint);
> > +
> >   /* CDF_* constant. Internal flags for domain creation. */
> >   /* Is this a privileged domain? */
> >   #define CDF_privileged           (1U << 0)
>=20
> Cheers,
>=20
> --
> Julien Grall
>=20


