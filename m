Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD4CACE823
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 04:01:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006139.1385390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMzuX-0007Fr-Ph; Thu, 05 Jun 2025 02:00:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006139.1385390; Thu, 05 Jun 2025 02:00:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMzuX-0007Dg-MX; Thu, 05 Jun 2025 02:00:53 +0000
Received: by outflank-mailman (input) for mailman id 1006139;
 Thu, 05 Jun 2025 02:00:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nB46=YU=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uMzuV-0007DV-Dp
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 02:00:52 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7108670-41b0-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 04:00:49 +0200 (CEST)
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
X-Inumbo-ID: e7108670-41b0-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1749088846; x=1749348046;
	bh=faC1QDkVXavzq1jMkkEEKtrZ8+5HWOz5ffowOpSVkWE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=KeaMpnvzntYbZa4wT/x7Nz1X4X+VfgIx9FhNCg5d9KKMkliT9kQ1wedNgVIS1Ia93
	 AAkAMQsZV9aHjka6acotAaDuiXOoD/sU5ipgecRsye4SHicj3QfoJtDUSf7AQ0qaUM
	 V6iieT6tmfCsGrH8dWM8+NwnyBF62l8PHcxjufP5cl1e/qLne35oGap2m01RQgr9Jo
	 9lepPu9O8a+5IYy5Xl7Lp641Ajhwhg5RmFZvY1Z5i99TJNOsZgtQtc9mrB4l9K0qkE
	 k78ftDMW3+KApCnQHvCV++D41F5SNl7Z17DRwNYsaPRv3oBkNjp74OLKU+TpTdKAfe
	 hiTd+tZBypubg==
Date: Thu, 05 Jun 2025 02:00:41 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, teddy.astie@vates.tech, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 2/2] xen/domain: rewrite emulation_flags_ok()
Message-ID: <aED6Q3MK9D0FgSSG@kraken>
In-Reply-To: <b0970d27-ff9f-43ee-a7e4-b0aa24bf0916@suse.com>
References: <20250602191717.148361-1-dmukhin@ford.com> <20250602191717.148361-3-dmukhin@ford.com> <b0970d27-ff9f-43ee-a7e4-b0aa24bf0916@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 11b5ddd624975d30e4186a776adfb07b6bbd7971
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 04, 2025 at 12:43:22PM +0200, Jan Beulich wrote:
> On 02.06.2025 21:17, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Rewrite emulation_flags_ok() to simplify future modifications.
> >
> > No functional change intended.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> > Reviewed-by: Teddy Astie <teddy.astie@vates.tech>
> > ---
> > Changes since v4:
> > - updated commentaries
> > - added Teddy's R-b, kept Stefano's R-b
> > ---
> >  xen/arch/x86/domain.c | 91 ++++++++++++++++++++++++++++++++++---------
> >  1 file changed, 73 insertions(+), 18 deletions(-)
>=20
> Given this diffstat, I wonder what the other x86 maintainers think about
> this.
>=20
> > --- a/xen/arch/x86/domain.c
> > +++ b/xen/arch/x86/domain.c
> > @@ -743,32 +743,87 @@ int arch_sanitise_domain_config(struct xen_domctl=
_createdomain *config)
> >      return 0;
> >  }
> >
> > +/*
> > + * Verify that the domain's emulation flags resolve to a supported con=
figuration.
> > + *
> > + * This ensures we only allow a known, safe subset of emulation combin=
ations
> > + * (for both functionality and security). Arbitrary mixes are likely t=
o cause
> > + * errors (e.g., null pointer dereferences).
> > + *
> > + * NB: use the internal X86_EMU_XXX symbols, not the public XEN_X86_EM=
U_XXX
> > + * symbols.
> > + */
> >  static bool emulation_flags_ok(const struct domain *d, uint32_t emflag=
s)
> >  {
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
> > +        /* PV */
> > +        {
> > +            .caps   =3D CAP_PV | CAP_DOMU,
> > +            .min    =3D 0,
> > +            .opt    =3D 0,
>=20
> Why the latter two initializers? Imo adding ones which say nothing else t=
han
> what's the default is only enlarging code without much real benefit.

Sure, no problem, I can address that.
Thanks!

>=20
> > +        },
> > +
> > +        /* PV dom0 */
> > +        {
> > +            .caps   =3D CAP_PV | CAP_HWDOM,
> > +            .min    =3D X86_EMU_PIT,
> > +            .opt    =3D 0,
> > +        },
> > +#endif /* #ifdef CONFIG_PV */
> > +
> > +#ifdef CONFIG_HVM
> > +        /* PVH dom0 */
> > +        {
> > +            .caps   =3D CAP_HVM | CAP_HWDOM,
> > +            .min    =3D X86_EMU_LAPIC | X86_EMU_IOAPIC | X86_EMU_VPCI,
> > +            .opt    =3D 0,
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
> > +
> > +        /* PVH domU */
> > +        {
> > +            .caps   =3D CAP_HVM | CAP_DOMU,
> > +            .min    =3D X86_EMU_LAPIC,
> > +            .opt    =3D 0,
> > +        },
> > +#endif /* #ifdef CONFIG_HVM */
> > +    };
> > +    unsigned int i, caps =3D is_hardware_domain(d) ? CAP_HWDOM : CAP_D=
OMU;
> > +
> > +    if ( is_pv_domain(d) )
> > +        caps |=3D CAP_PV;
> > +    else if ( is_hvm_domain(d) )
> > +        caps |=3D CAP_HVM;
>=20
> There's no 3rd case, so this could be expressed with plain "else", and he=
nce
> also with a conditional operator, and hence could also be right in the
> initializer. How far to go with those transformations I'm not sure; perso=
nally
> I'd go all the way, but I'd be okay-ish with just the first of the steps.

Ack.

>=20
> Jan


