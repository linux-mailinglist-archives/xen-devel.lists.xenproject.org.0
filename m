Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D0FAC0163
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 02:27:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992709.1376342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHtlv-0000px-AK; Thu, 22 May 2025 00:26:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992709.1376342; Thu, 22 May 2025 00:26:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHtlv-0000nU-7e; Thu, 22 May 2025 00:26:55 +0000
Received: by outflank-mailman (input) for mailman id 992709;
 Thu, 22 May 2025 00:26:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=45pF=YG=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uHtlt-00009y-KC
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 00:26:53 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7446b271-36a3-11f0-b892-0df219b8e170;
 Thu, 22 May 2025 02:26:50 +0200 (CEST)
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
X-Inumbo-ID: 7446b271-36a3-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1747873609; x=1748132809;
	bh=cDzBWx2PUvd+hyF8v9TP1zwOFBaZmTOPmpHMtGIx5UM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=nS19H3a0BK+8+rUoQMwXayWJG3CRBabHUg5rzN/UGviPRuf4EW+a/3Bt/PVegFBtA
	 hwnqGfoJyAs2u62IjHnDMyfJtrFNsemVw2U2/dch5fT4I2f5ejSLv9K61uGSlrWSBS
	 egURQaWSBcW75iSy02EBE64T2WP/ryAqbUbjgtPuSPjjxBA5sSuVkabx4Tbvb94I5A
	 mgP+twPBZ/UUntpdRwPwSqTxd7XCrm+EflzpN/E/wZbvvpHxQWheIOcKfUtBM9N+My
	 MXhwDz5nzYqFiEvcoBE0lXq1GFSZDQ5Jd7WZD9od7YZL7Hho3MM58+GIVevdvKaz1h
	 xt1iZYz1MRjTA==
Date: Thu, 22 May 2025 00:26:43 +0000
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v2 2/2] xen/domain: rewrite emulation_flags_ok()
Message-ID: <aC5vPS5dGScEBNSn@kraken>
In-Reply-To: <aC3sIHgUpCFxW35K@macbook.local>
References: <20250516022855.1146121-1-dmukhin@ford.com> <20250516022855.1146121-3-dmukhin@ford.com> <aC3sIHgUpCFxW35K@macbook.local>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: fcdbfc96e22b2eff129ba87c7f3a38e1322409ed
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 05:07:12PM +0200, Roger Pau Monn=C3=A9 wrote:
> On Fri, May 16, 2025 at 02:29:16AM +0000, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Rewrite emulation_flags_ok() to simplify future modifications.
> >
> > Also, introduce X86_EMU_{BASELINE,OPTIONAL} helper macros.
> >
> > No functional change intended.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Changes since v1:
> > - kept use of non-public X86_EMU_XXX flags
> > - corrected some comments and macro definitions
> > ---
> >  xen/arch/x86/domain.c             | 29 +++++++++++------------------
> >  xen/arch/x86/include/asm/domain.h |  6 ++++++
> >  2 files changed, 17 insertions(+), 18 deletions(-)
> >
> > diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> > index f197dad4c0..c64c2c6fef 100644
> > --- a/xen/arch/x86/domain.c
> > +++ b/xen/arch/x86/domain.c
> > @@ -750,25 +750,18 @@ static bool emulation_flags_ok(const struct domai=
n *d, uint32_t emflags)
> >      BUILD_BUG_ON(X86_EMU_ALL !=3D XEN_X86_EMU_ALL);
> >  #endif
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
> > +    /* PV */
> > +    if ( !is_hvm_domain(d) )
> > +        return emflags =3D=3D 0 || emflags =3D=3D X86_EMU_PIT;
> >
> > -    return true;
> > +    /* HVM */
> > +    if ( is_hardware_domain(d) )
> > +        return emflags =3D=3D (X86_EMU_LAPIC |
> > +                           X86_EMU_IOAPIC |
> > +                           X86_EMU_VPCI);
> > +
> > +    return (emflags & ~X86_EMU_OPTIONAL) =3D=3D X86_EMU_BASELINE ||
> > +            emflags =3D=3D X86_EMU_LAPIC;
> >  }
> >
> >  void __init arch_init_idle_domain(struct domain *d)
> > diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/a=
sm/domain.h
> > index 8c0dea12a5..3a9a9fd80d 100644
> > --- a/xen/arch/x86/include/asm/domain.h
> > +++ b/xen/arch/x86/include/asm/domain.h
> > @@ -494,6 +494,12 @@ struct arch_domain
> >                                   X86_EMU_PIT | X86_EMU_USE_PIRQ |     =
  \
> >                                   X86_EMU_VPCI)
> >
> > +/* User-selectable features. */
> > +#define X86_EMU_OPTIONAL        (X86_EMU_USE_PIRQ)
> > +
> > +#define X86_EMU_BASELINE        (X86_EMU_ALL & ~(X86_EMU_VPCI | \
> > +
> > X86_EMU_OPTIONAL))
>=20
> If you go this route I think you need to name those
> X86_EMU_HVM_{BASELINE,OPTIONAL}, because they are really meaningful
> only for HVM domains.
>=20
> Regarding vPCI and HVM: we might want to enable it in the future for
> domUs, but the fact is that right now it will collide badly with
> ioreqs.  So for the time being on x86 it would be best if vPCI is
> limited to PVH hardware domain exclusively, otherwise the hypervisor
> internals might malfunction.  We shouldn't really allow dom0 to create
> this kind of malformed domain as much as possible.
>=20
> static const struct {
>    bool pv, hwdom;
>    uint32_t base, optional;
> } allowed_conf[] =3D {
>     /* PV */
>     { true, false, 0, X86_EMU_PIT },
>     /* PVH hardware domain */
>     { false, true, X86_EMU_LAPIC | X86_EMU_IOAPIC | X86_EMU_VPCI, 0 },
>     /* PVH domU */
>     { false, false, X86_EMU_LAPIC, 0 },
>     /* HVM */
>     { false, false, X86_EMU_ALL & ~(X86_EMU_VPCI | X86_EMU_USE_PIRQ),
>       X86_EMU_VPCI | X86_EMU_USE_PIRQ },
> };
> unsigned int i;
>=20
> for ( i =3D 0; i < ARRAY_SIZE(allowed_conf); i++ )
> {
>     if ( is_pv_domain(d) =3D=3D allowed_conf[i].pv &&
>          /*
> =09  * A hardware domain can also use !hwdom entries, but not the
> =09  * other way around
> =09  */
>          (is_hardware_domain(d) ||=C2=A0!allowed_conf[i].hwdom) &&
> =09 (emflags & ~allowed_conf[i].optional) =3D=3D allowed_conf[i].base )
>         return true;
> }
>=20
> printk(XENLOG_INFO "%pd: invalid emulation flags: %#x\n", d, emflags);
>=20
> return false;
>=20
> I think the above (not even build tested) is slightly clearer, and
> allows for easier expansion going forward?

I like the idea! Thanks for the suggestion.

I will wait a bit to collect some feedback, if any, before doing coding.

>=20
> Regards, Roger.


