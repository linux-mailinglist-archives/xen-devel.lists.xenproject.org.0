Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DA2AD3B67
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 16:41:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011028.1389315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP0AB-0000EJ-JJ; Tue, 10 Jun 2025 14:41:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011028.1389315; Tue, 10 Jun 2025 14:41:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP0AB-0000Bs-Fz; Tue, 10 Jun 2025 14:41:19 +0000
Received: by outflank-mailman (input) for mailman id 1011028;
 Tue, 10 Jun 2025 14:41:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zL97=YZ=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uP0A8-0000Bi-VJ
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 14:41:18 +0000
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch
 [79.135.106.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ecbc64b2-4608-11f0-b894-0df219b8e170;
 Tue, 10 Jun 2025 16:40:59 +0200 (CEST)
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
X-Inumbo-ID: ecbc64b2-4608-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1749566458; x=1749825658;
	bh=6bWOkAdXEnKQAQODlD2qLkfzKN8t0PvEMwSj30Kvyi8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=EUtQCMmF4UZ2BrA/QItWsfwzYSNV0ZqaCzljM1ZeULod07Mf5w8E2/GSkoWA8T0qE
	 uou9ojdi/4NQjil0tNcxEVpbaSbPswLCAT8aILBWkM7SRK23O/Z6UaE2mzxcLbLEdv
	 C+vCGN2W191CUHn12Rt5KH8GyYZSf/o69kcpHIcN9omWucjEwSN/qySLva8q6ggb5h
	 D1C3PRIcIPLKLzepsiSBLDg/nSfq2FJzOpdPEdVKaWYPPJhp1D6yJ2TiPr+ePrmAp0
	 xqZpCIPNZcbGiVmomzeqdjGd1XJQ0pFVm4VcqzgY2kGhTNYJd1YSKjasmtuqywJ/GA
	 fNRyodZwRe7ew==
Date: Tue, 10 Jun 2025 14:40:52 +0000
To: Teddy Astie <teddy.astie@vates.tech>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v6] xen/domain: rewrite emulation_flags_ok()
Message-ID: <aEhD7nA+oz5dQTP0@kraken>
In-Reply-To: <c45d0a55-fe95-4216-a82f-481bb381b753@vates.tech>
References: <20250610004216.3012253-1-dmukhin@ford.com> <c45d0a55-fe95-4216-a82f-481bb381b753@vates.tech>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: f7e9a450fb503a1fd13dcf5881858a2b5044f820
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 08:55:58AM +0000, Teddy Astie wrote:
> Hello,
>=20
> Le 10/06/2025 =C3=A0 02:45, dmkhn@proton.me a =C3=A9crit=C2=A0:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Rewrite emulation_flags_ok() to simplify future modifications.
> >
> > No functional change intended.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
>=20
> Reviewed-by: Teddy Astie <teddy.astie@vates.tech>

Thanks!

There's a way to optimize PV case even further, so I will send v7.

>=20
> > ---
> > Changes since v5:
> > - optimized `configs[]` table - just one record for PV case
> > - sorted entries in `configs[]` table by domain type: PV, then PVH, the=
n HVM
> >    entries
> > - addressed `caps` initializaton
> >
> > Link to v5: https://lore.kernel.org/xen-devel/20250602191717.148361-3-d=
mukhin@ford.com/
> > Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelin=
es/1861382846/
> > ---
> >   xen/arch/x86/domain.c | 86 ++++++++++++++++++++++++++++++++++--------=
-
> >   1 file changed, 68 insertions(+), 18 deletions(-)
> >
> > diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> > index 7536b6c871..82b126351b 100644
> > --- a/xen/arch/x86/domain.c
> > +++ b/xen/arch/x86/domain.c
> > @@ -743,32 +743,82 @@ int arch_sanitise_domain_config(struct xen_domctl=
_createdomain *config)
> >       return 0;
> >   }
> >
> > +/*
> > + * Verify that the domain's emulation flags resolve to a supported con=
figuration.
> > + *
> > + * This ensures we only allow a known, safe subset of emulation combin=
ations
> > + * (for both functionality and security). Arbitrary mixes are likely t=
o cause
> > + * errors (e.g. null pointer dereferences).
> > + *
> > + * NB: use the internal X86_EMU_XXX symbols, not the public XEN_X86_EM=
U_XXX
> > + * symbols.
> > + */
> >   static bool emulation_flags_ok(const struct domain *d, uint32_t emfla=
gs)
> >   {
> > +    enum {
> > +        CAP_PV          =3D BIT(0, U),
> > +        CAP_HVM         =3D BIT(1, U),
> > +        CAP_HWDOM       =3D BIT(2, U),
> > +        CAP_DOMU        =3D BIT(3, U),
> > +    };
> > +    static const struct {
> > +        unsigned int caps;
> > +        uint32_t min;
> > +        uint32_t opt;
> > +    } configs[] =3D {
> > +#ifdef CONFIG_PV
> > +        /* PV dom0 and domU */
> > +        {
> > +            .caps   =3D CAP_PV | CAP_HWDOM | CAP_DOMU,
> > +            .min    =3D X86_EMU_PIT,
> > +        },
> > +#endif /* #ifdef CONFIG_PV */
> > +
> > +#ifdef CONFIG_HVM
> > +        /* PVH dom0 */
> > +        {
> > +            .caps   =3D CAP_HVM | CAP_HWDOM,
> > +            .min    =3D X86_EMU_LAPIC | X86_EMU_IOAPIC | X86_EMU_VPCI,
> > +        },
> > +
> > +        /* PVH domU */
> > +        {
> > +            .caps   =3D CAP_HVM | CAP_DOMU,
> > +            .min    =3D X86_EMU_LAPIC,
> > +        },
> > +
> > +        /* HVM domU */
> > +        {
> > +            .caps   =3D CAP_HVM | CAP_DOMU,
> > +            .min    =3D X86_EMU_ALL & ~(X86_EMU_VPCI | X86_EMU_USE_PIR=
Q),
> > +            /* HVM PIRQ feature is user-selectable. */
> > +            .opt    =3D X86_EMU_USE_PIRQ,
> > +        },
> > +#endif /* #ifdef CONFIG_HVM */
> > +    };
> > +    unsigned int i;
> > +    unsigned int caps =3D (is_pv_domain(d) ? CAP_PV : CAP_HVM) |
> > +                        (is_hardware_domain(d) ? CAP_HWDOM : CAP_DOMU)=
;
> > +
> > +    /*
> > +     * NB: PV domain can have 0 in emulation_flags.
> > +     * See qemu-alpine-x86_64-gcc CI job.
> > +     * Inject fake flag to keep the code checks simple.
> > +     */
> > +    if ( (caps & CAP_PV) && emflags =3D=3D 0 )
> > +        emflags |=3D X86_EMU_PIT;
> > +
> >   #ifdef CONFIG_HVM
> >       /* This doesn't catch !CONFIG_HVM case but it is better than noth=
ing */
> >       BUILD_BUG_ON(X86_EMU_ALL !=3D XEN_X86_EMU_ALL);
> >   #endif
> >
> > -    if ( is_hvm_domain(d) )
> > -    {
> > -        if ( is_hardware_domain(d) &&
> > -             emflags !=3D (X86_EMU_VPCI | X86_EMU_LAPIC | X86_EMU_IOAP=
IC) )
> > -            return false;
> > -        if ( !is_hardware_domain(d) &&
> > -             /* HVM PIRQ feature is user-selectable. */
> > -             (emflags & ~X86_EMU_USE_PIRQ) !=3D
> > -             (X86_EMU_ALL & ~(X86_EMU_VPCI | X86_EMU_USE_PIRQ)) &&
> > -             emflags !=3D X86_EMU_LAPIC )
> > -            return false;
> > -    }
> > -    else if ( emflags !=3D 0 && emflags !=3D X86_EMU_PIT )
> > -    {
> > -        /* PV or classic PVH. */
> > -        return false;
> > -    }
> > +    for ( i =3D 0; i < ARRAY_SIZE(configs); i++ )
> > +        if ( (caps & configs[i].caps) =3D=3D caps &&
> > +             (emflags & ~configs[i].opt) =3D=3D configs[i].min )
> > +            return true;
> >
> > -    return true;
> > +    return false;
> >   }
> >
> >   void __init arch_init_idle_domain(struct domain *d)
>=20
>=20
> Teddy Astie | Vates XCP-ng Developer
>=20
> XCP-ng & Xen Orchestra - Vates solutions
>=20
> web: https://vates.tech
>=20
>=20


