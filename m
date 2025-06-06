Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB22ACFD28
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 08:55:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007935.1387113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNQzK-00083W-R9; Fri, 06 Jun 2025 06:55:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007935.1387113; Fri, 06 Jun 2025 06:55:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNQzK-00081m-OQ; Fri, 06 Jun 2025 06:55:38 +0000
Received: by outflank-mailman (input) for mailman id 1007935;
 Fri, 06 Jun 2025 06:55:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fxa/=YV=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uNQzI-00081f-FA
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 06:55:37 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e34ee37-42a3-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 08:55:34 +0200 (CEST)
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
X-Inumbo-ID: 3e34ee37-42a3-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1749192932; x=1749452132;
	bh=iVWTtAlXZPIUCCqlJJu2YtHiSgf61XcJ9kO3TkASNDM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=X3aurnJYW+no1NmCfR4YkujfThakW7ktJm3DD3uimajCMiqZlJ5EazO7Yfj4d/XmB
	 5uvH98h3w43dyFIO0MjbZ9CFVIdxDiKc7d9khFgHgsR4d4jwpSnh4xWb1iXASv7pxl
	 tSFRU8SB0B3ASl2hIN4V9bCLsGtgqq/eTA0qOLvO5274O5nZ/fgxDQ8OhHIXApeHFS
	 6F+uTAEWETmZ0VqPICKcgD5lbiiEEV3qpr/ERRJC3Fcgu/xKH8eEvw/jiz+8GNSfza
	 /eXpOk3GP7c8f51kFrrJzn7li6PlG3/N4aF38w4QQ7r8yVWi5NQQN5hPzUF17AtjtM
	 CNg+gzoRFWzsA==
Date: Fri, 06 Jun 2025 06:55:26 +0000
To: Julien Grall <julien@xen.org>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, roger.pau@citrix.com, sstabellini@kernel.org, teddy.astie@vates.tech, dmukhin@ford.com
Subject: Re: [PATCH v9 1/3] xen/domain: unify domain ID allocation
Message-ID: <aEKQ2Fpfah+qVkB2@kraken>
In-Reply-To: <d0829041-1375-4161-b2c4-f8dffadbb657@xen.org>
References: <20250528225030.2652166-1-dmukhin@ford.com> <20250528225030.2652166-2-dmukhin@ford.com> <d0829041-1375-4161-b2c4-f8dffadbb657@xen.org>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 60c800d892fe51859f77e4f018191c785f9565ed
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 05, 2025 at 10:58:48PM +0100, Julien Grall wrote:
> Hi Denis,
>=20
> On 28/05/2025 23:50, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmkhn@proton.me>
> >
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Currently, hypervisor code has two different domain ID allocation
> > implementations:
> >
> >    (a) Sequential IDs allocation in dom0less Arm code based on max_init=
_domid;
> >
> >    (b) Sequential IDs allocation in XEN_DOMCTL_createdomain; does not u=
se
> >        max_init_domid (both Arm and x86).
> >
> > The domain ID allocation covers dom0 or late hwdom, predefined domains,
> > post-boot domains, excluding Xen system domains (domid >=3D
> > DOMID_FIRST_RESERVED).
> >
> > It makes sense to have a common helper code for such task across archit=
ectures
> > (Arm and x86) and between dom0less / toolstack domU allocation.
> >
> > Wrap the domain ID allocation as an arch-independent function domid_all=
oc() in
> > common/domain.c based on the bitmap.
> >
> > Allocation algorithm:
> > - If an explicit domain ID is provided, verify its availability and use=
 it if
> >    ID is not used;
> > - If DOMID_INVALID is provided, search the range [0..DOMID_FIRST_RESERV=
ED-1],
> >    starting from the last used ID and wrapping around as needed. It gua=
rantees
> >    that two consecutive calls will never return the same ID. ID#0 is ex=
cluded
> >    to account for late hwdom case.
> >
> > Also, remove is_free_domid() helper as it is not needed now.
> >
> > No functional change intended.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Changes since v8:
> > - skip ID #0 in domid_alloc() to account for late hwdom
> > ---
> >   xen/arch/arm/domain_build.c             | 17 +++++---
> >   xen/arch/x86/setup.c                    | 11 +++--
> >   xen/common/device-tree/dom0less-build.c | 10 +++--
> >   xen/common/domain.c                     | 54 ++++++++++++++++++++++++=
+
> >   xen/common/domctl.c                     | 42 +++----------------
> >   xen/include/xen/domain.h                |  3 ++
> >   6 files changed, 87 insertions(+), 50 deletions(-)
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
>=20
> The change in the panic here and below seems unrelated to the goal of
> the patch. I am ok to keep them here, but I think it should be mentioned
> in the commit message.

Will do.

>=20
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
> > index 1f5cb67bd0..b36ce4491b 100644
> > --- a/xen/arch/x86/setup.c
> > +++ b/xen/arch/x86/setup.c
> > @@ -1031,8 +1031,11 @@ static struct domain *__init create_dom0(struct =
boot_info *bi)
> >       if ( iommu_enabled )
> >           dom0_cfg.flags |=3D XEN_DOMCTL_CDF_iommu;
> >
> > -    /* Create initial domain.  Not d0 for pvshim. */
> > -    bd->domid =3D get_initial_domain_id();
> > +    /* Allocate initial domain ID. Not d0 for pvshim. */
>=20
> NIT: The two spaces were valid here. This is in fact quite common to
> unambiguously mark the end of a sentence.

Yep, I changed the text in comment and forgot to keep the double space.

>=20
> > +    bd->domid =3D domid_alloc(get_initial_domain_id());
> > +    if ( bd->domid =3D=3D DOMID_INVALID )
> > +        panic("Error allocating domain ID %d\n", get_initial_domain_id=
());
> > +
> >       d =3D domain_create(bd->domid, &dom0_cfg,
> >                         pv_shim ? 0 : CDF_privileged | CDF_hardware);
> >       if ( IS_ERR(d) )
> > @@ -1064,7 +1067,7 @@ static struct domain *__init create_dom0(struct b=
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
> > @@ -1079,7 +1082,7 @@ static struct domain *__init create_dom0(struct b=
oot_info *bi)
> >
> >       bd->d =3D d;
> >       if ( construct_dom0(bd) !=3D 0 )
> > -        panic("Could not construct domain 0\n");
> > +        panic("Could not construct domain %pd\n", d);
> >
> >       bd->cmdline =3D NULL;
> >       xfree(cmdline);
> > diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/devic=
e-tree/dom0less-build.c
> > index 39cb2cd5c7..a509f8fecd 100644
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
>=20
> I can't find a similar check in domid_alloc(). But if the value is
> unlikely above DOMID_FIRST_RESERVED, then we would end up to allocate a
> random domid.

Yes, thanks.
I think I need to add tools/tests with a self-test for the domain ID alloca=
tion
code.

>=20
> > -            panic("No more domain IDs available\n");
> > -
>  >           d_cfg.max_evtchn_port =3D 1023;>
> d_cfg.max_grant_frames =3D -1;
> >           d_cfg.max_maptrack_frames =3D -1;
> > @@ -981,7 +979,11 @@ void __init create_domUs(void)
> >            * very important to use the pre-increment operator to call
> >            * domain_create() with a domid > 0. (domid =3D=3D 0 is reser=
ved for Dom0)
> >            */
> > -        d =3D domain_create(++max_init_domid, &d_cfg, flags);
> > +        domid =3D domid_alloc(++max_init_domid);
>=20
> In the commit message you wrote:
>=20
>=20
> """
>      (b) Sequential IDs allocation in XEN_DOMCTL_createdomain; does not u=
se
>          max_init_domid (both Arm and x86).
> """
>=20
> I read it as max_init_domid should have been moved to common code. I see
> this is done in the next patch. So I would suggest to clarify this will
> be handled separately.

Will do.

>=20
>=20
> > +        if ( domid =3D=3D DOMID_INVALID )
> > +            panic("Error allocating ID for domain %s\n", dt_node_name(=
node));
> > +
> > +        d =3D domain_create(domid, &d_cfg, flags);
> >           if ( IS_ERR(d) )
> >               panic("Error creating domain %s (rc =3D %ld)\n",
> >                     dt_node_name(node), PTR_ERR(d));
> > diff --git a/xen/common/domain.c b/xen/common/domain.c
> > index abf1969e60..ae0c44fcbb 100644
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -66,6 +66,10 @@ DEFINE_RCU_READ_LOCK(domlist_read_lock);
> >   static struct domain *domain_hash[DOMAIN_HASH_SIZE];
> >   struct domain *domain_list;
> >
> > +/* Non-system domain ID allocator. */
> > +static DEFINE_SPINLOCK(domid_lock);
> > +static DECLARE_BITMAP(domid_bitmap, DOMID_FIRST_RESERVED);
> > +
> >   /*
> >    * Insert a domain into the domlist/hash.  This allows the domain to =
be looked
> >    * up by domid, and therefore to be the subject of hypercalls/etc.
> > @@ -1449,6 +1453,8 @@ void domain_destroy(struct domain *d)
> >
> >       TRACE_TIME(TRC_DOM0_DOM_REM, d->domain_id);
> >
> > +    domid_free(d->domain_id);
> > +
> >       /* Remove from the domlist/hash. */
> >       domlist_remove(d);
> >
> > @@ -2405,6 +2411,54 @@ domid_t get_initial_domain_id(void)
> >       return hardware_domid;
> >   }
> >
> > +domid_t domid_alloc(domid_t domid)
> > +{
> > +    spin_lock(&domid_lock);
> > +
> > +    if ( domid < DOMID_FIRST_RESERVED )
> > +    {
> > +        if ( __test_and_set_bit(domid, domid_bitmap) )
> > +            domid =3D DOMID_INVALID;
> > +    }
> > +    else
> > +    {
> > +        static domid_t domid_last;
> > +        /* NB: account for late hwdom case, skip ID#0 */
>=20
> I am somewhat confused with this comment. For the late hwdom case, I
> thought we were using a non-zero ID. Dom0 should also always be the
> first dom0 to be reserved. Can you clarify?

My current understanding is:
- the ID of "domain 0" (privileged domain) can be overridden at the boot-ti=
me
  via hardware_domid parameter.

- there's only one reserved (and configurable) domain ID =3D=3D hardware_do=
mid in
  the allocation range (which is 0 by default).

- get_initial_domain_id() returns the reserved domain ID value (which is
  used in the in the follow on change to keep the change isolated).

Is my understanding correct?

I will update the comment.

>=20
> That said, if you want to skip to dom0. Wouldn't it be better to have
> domid_last set to 1 and then ...
>=20
>  > +        const domid_t reserved_domid =3D 0;> +        const bool
> reserved =3D __test_and_set_bit(reserved_domid, domid_bitmap);
> > +
> > +        domid =3D find_next_zero_bit(domid_bitmap, DOMID_FIRST_RESERVE=
D,
> > +                                   domid_last);
> > +
> > +        if ( domid =3D=3D DOMID_FIRST_RESERVED )
> > +            domid =3D find_next_zero_bit(domid_bitmap, DOMID_FIRST_RES=
ERVED, 0);
>=20
> ... use 1 here? This would avoid to temporarily mark the domid 0 as
> reserved.
>=20
> Cheers,
>=20
> --
> Julien Grall
>=20
>=20


