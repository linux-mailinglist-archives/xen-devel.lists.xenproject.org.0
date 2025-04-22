Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1635A97A4B
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 00:18:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963705.1354662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Lvz-0001Bw-0c; Tue, 22 Apr 2025 22:17:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963705.1354662; Tue, 22 Apr 2025 22:17:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Lvy-00019p-Tq; Tue, 22 Apr 2025 22:17:42 +0000
Received: by outflank-mailman (input) for mailman id 963705;
 Tue, 22 Apr 2025 22:17:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8D33=XI=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u7Lvw-00019h-MK
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 22:17:41 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98cc7618-1fc7-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 00:17:38 +0200 (CEST)
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
X-Inumbo-ID: 98cc7618-1fc7-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745360256; x=1745619456;
	bh=7Wu2uOPStbgSJHG7Qg7V3UBIekIE4bEuyBNMyQr086w=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=nSmS32hXFdUT1Wka/S0+DyShONS2R486osd7VIfhOWtqPW6/tAkNOLFZzmG76B2+9
	 6MKiyDBRZcMOID4mUNKlr0PHaSEbHLq5y2w2KZgLp93y34YWrlCJQaS09aQBXQmbub
	 LFdPXkZbc83iEDLZPnCcqVkbAr6PTfb9Vt6RktG9W2r/pRnhLlrl8dAsskGZLrbDRE
	 RdKnuAyeNIAIZfnb3FHx4M04ZqJ6v2P/TbqhgTRH0dwJTSJK9G/KD2SJcC38GAdeHD
	 LVJ0X8Z3q945IhCQUC2a8BCEjC6EBEtkYog5loOekApOxkKZp/dUS3PN1aOdq+kMes
	 3zyimYVXODAQA==
Date: Tue, 22 Apr 2025 22:17:33 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] xen/domain: unify domain ID allocation
Message-ID: <aAgVeonUoPltoPE1@starscream>
In-Reply-To: <7c5c1e59-248f-4b62-9e15-fdb692fd1c7c@suse.com>
References: <20250416061509.934220-1-dmukhin@ford.com> <7c5c1e59-248f-4b62-9e15-fdb692fd1c7c@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 512200601c6bafbffe1055a193b6fde8a5618861
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 11:47:07AM +0200, Jan Beulich wrote:
> On 16.04.2025 08:15, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Unify the logic of domain ID allocation, so that both the initial domai=
n
> > creation and the usage by domctl use the same helper function across
> > architectures (Arm and x86).
> >
> > Wrap the domain ID allocation as an arch-independent function domid_all=
oc() in
> > common/domain.c.
> >
> > Allocation algorithm:
> > - If an explicit domain ID is provided, verify its availability and
> >   use it if ID is unused;
> > - Otherwise, perform an exhaustive search for the first available ID
> >   within the [0..DOMID_FIRST_RESERVED) range, excluding hardware_domid.
> >
> > Move the is_free_domid() helper closer to domid_alloc(). Simplify
> > is_free_domid() by removing the domain ID range check, as the ID is now
> > guaranteed to be within the valid range. Additionally, update the predi=
cate to
> > return a bool value instead of an int.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
>=20
> Please can you clarify whether this is intended to be no functional chang=
e
> (as far as one would be able to observe from the outside)? (It isn't, and
> when it isn't, the behavioral change needs justifying. Which I fear you
> won't be able to, in which case it needs undoing. Not using the first
> unused ID is a deliberate property of the present allocation scheme.)

Reverted the algorithm to the original one (v4).
Thanks for review!

>=20
> > ---
> >  xen/arch/arm/dom0less-build.c | 19 ++++++++-------
> >  xen/arch/arm/domain_build.c   | 19 +++++++++++----
> >  xen/arch/x86/setup.c          |  8 +++++--
> >  xen/common/domain.c           | 45 +++++++++++++++++++++++++++++++++++
> >  xen/common/domctl.c           | 45 ++++-------------------------------
> >  xen/include/xen/domain.h      |  2 ++
> >  6 files changed, 81 insertions(+), 57 deletions(-)
>=20
> This suggests it's not clearly an improvement. And I'm heavily inclined
> to ask (also considering the above) that this simply be dropped.
>=20
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -2370,6 +2370,7 @@ void __init create_dom0(void)
> >          .grant_opts =3D XEN_DOMCTL_GRANT_version(opt_gnttab_max_versio=
n),
> >      };
> >      unsigned int flags =3D CDF_privileged;
> > +    domid_t domid;
> >      int rc;
> >
> >      /* The vGIC for DOM0 is exactly emulating the hardware GIC */
> > @@ -2394,19 +2395,27 @@ void __init create_dom0(void)
> >      if ( !llc_coloring_enabled )
> >          flags |=3D CDF_directmap;
> >
> > -    dom0 =3D domain_create(0, &dom0_cfg, flags);
> > +    rc =3D domid_alloc(get_initial_domain_id());
> > +    if ( rc < 0 )
> > +        panic("Error allocating domain ID %d (rc =3D %d)\n",
> > +              get_initial_domain_id(), rc);
> > +    domid =3D rc;
> > +
> > +    dom0 =3D domain_create(domid, &dom0_cfg, flags);
> >      if ( IS_ERR(dom0) )
> > -        panic("Error creating domain 0 (rc =3D %ld)\n", PTR_ERR(dom0))=
;
> > +        panic("Error creating domain %d (rc =3D %ld)\n", domid, PTR_ER=
R(dom0));
>=20
> Up to here using domid is okay. However, ...
>=20
> >      if ( llc_coloring_enabled && (rc =3D dom0_set_llc_colors(dom0)) )
> > -        panic("Error initializing LLC coloring for domain 0 (rc =3D %d=
)\n", rc);
> > +        panic("Error initializing LLC coloring for domain %d (rc =3D %=
d)\n",
> > +              domid, rc);
> >
> >      if ( alloc_dom0_vcpu0(dom0) =3D=3D NULL )
> > -        panic("Error creating domain 0 vcpu0\n");
> > +        panic("Error creating domain %d vcpu0\n", domid);
> >
> >      rc =3D construct_dom0(dom0);
> >      if ( rc )
> > -        panic("Could not set up DOM0 guest OS (rc =3D %d)\n", rc);
> > +        panic("Could not set up guest OS for domain %d (rc =3D %d)\n",
> > +              domid, rc);
> >  }
>=20
> ... these all would better use %pd, when already being touched.
>=20
> While touching all of these I think you also want to aim at making output
> match that %pd or %pv would result in, if they were usable at those place=
s.
>=20
> > --- a/xen/arch/x86/setup.c
> > +++ b/xen/arch/x86/setup.c
> > @@ -1009,8 +1009,12 @@ static struct domain *__init create_dom0(struct =
boot_info *bi)
> >      if ( iommu_enabled )
> >          dom0_cfg.flags |=3D XEN_DOMCTL_CDF_iommu;
> >
> > -    /* Create initial domain.  Not d0 for pvshim. */
> > -    bd->domid =3D get_initial_domain_id();
> > +    /* Allocate initial domain ID. Not d0 for pvshim. */
> > +    bd->domid =3D domid_alloc(get_initial_domain_id());
>=20
> You're clipping the int return value to domid_t here, and thus ...
>=20
> > +    if ( bd->domid < 0 )
>=20
> ... this condition will be always false. I'm surprised the compiler didn'=
t
> flag this for you.
>=20
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -66,6 +66,51 @@ DEFINE_RCU_READ_LOCK(domlist_read_lock);
> >  static struct domain *domain_hash[DOMAIN_HASH_SIZE];
> >  struct domain *domain_list;
> >
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
> > + *
> > + * If hint is outside of valid [0..DOMID_FIRST_RESERVED] range of IDs,
>=20
> That's [0, DOMID_FIRST_RESERVED), to be unambiguous. In C array initializ=
er
> notation it would be [0 ... DOMID_FIRST_RESERVED - 1].
>=20
> > + * perform an exhaustive search of the first free domain ID excluding
> > + * hardware_domid.
> > + */
> > +int domid_alloc(int hint)
>=20
> I would have thought that I did comment already on the parameter being pl=
ain
> int.
>=20
> > +{
> > +    domid_t domid;
> > +
> > +    if ( hint >=3D 0 && hint < DOMID_FIRST_RESERVED )
> > +    {
> > +        if ( !is_free_domid(hint) )
> > +            return -EEXIST;
> > +
> > +        domid =3D hint;
> > +    }
> > +    else
> > +    {
> > +        for ( domid =3D 0; domid < DOMID_FIRST_RESERVED; domid++ )
> > +        {
> > +            if ( domid =3D=3D hardware_domid )
> > +                continue;
> > +            if ( is_free_domid(domid) )
> > +                break;
> > +        }
> > +
> > +        if ( domid =3D=3D DOMID_FIRST_RESERVED )
> > +            return -ENOMEM;
>=20
> There's no memory allocation here, so why ENOMEM? ENOSPC may already be s=
lightly
> better.
>=20
> Jan


