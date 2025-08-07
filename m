Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6922B1DD82
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 21:39:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073691.1436556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk6S0-0002BJ-7k; Thu, 07 Aug 2025 19:38:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073691.1436556; Thu, 07 Aug 2025 19:38:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk6S0-00029D-4Y; Thu, 07 Aug 2025 19:38:56 +0000
Received: by outflank-mailman (input) for mailman id 1073691;
 Thu, 07 Aug 2025 19:38:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ybbA=2T=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uk6Rx-00028o-L6
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 19:38:54 +0000
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch
 [79.135.106.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2228c100-73c6-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 21:38:46 +0200 (CEST)
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
X-Inumbo-ID: 2228c100-73c6-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=awzlv4zhezhw7oemvznntk3xka.protonmail; t=1754595524; x=1754854724;
	bh=Md4ZLamh7K53myDSejrsncYY3j59Md3XIf85NqU/2bg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=RL3dZNEG0TCqAeLp60w7Ors34LqrN5TRWWcxIqTk+BevYoZvQd6SnSdh4TYP16jDJ
	 ru1g7b3MD2T9EPNzHYpPd+QAZxlcs8inVdrxU14OiszOc5B6zIEe0ZF53m8m4Be3Kv
	 mFSqfB6vxe6EgHX0ZZjHnyKOQeSx0EgP5C2Hx8z+jgM15SFC6otZbLACRdj3vzdksq
	 YDoZyPFHMZM0mGqyGIvndyAghTx4RYdh4nzEEY/bT2Dc0cZo6lpaB2VFs8TYlrdCNk
	 gOWxrqrmi1DzMR/GnG45Nbaln4RnyifkWOyZNPMI9/S7EtdUYr/h/3j5eZ8RO+sLIk
	 SBM+SbCfu26Iw==
Date: Thu, 07 Aug 2025 19:38:40 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 7/8] tools/xl: enable NS16550-compatible UART emulator for PVH (x86)
Message-ID: <aJUAu46dcUzwrclZ@kraken>
In-Reply-To: <549bde88-38a3-4920-9309-f898b48d3bda@suse.com>
References: <20250731192130.3948419-1-dmukhin@ford.com> <20250731192130.3948419-8-dmukhin@ford.com> <549bde88-38a3-4920-9309-f898b48d3bda@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: d701da045a4ecc044bfc76dffd6ecadda041c7c4
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 04, 2025 at 01:06:32PM +0200, Jan Beulich wrote:
> On 31.07.2025 21:22, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Enable virtual NS16550 for PVH domains in xl.
> >
> > {map,unmap}_domain_emuirq_pirq() infrastructure is modified by adding n=
ew
> > type of interrupt resources 'IRQ_EMU' which means 'emulated device IRQ'
> > (similarly to IRQ_MSI_EMU).
> >
> > This is necessary to for IOAPIC emulation code to skip IRQ->PIRQ mappin=
g
> > (vioapic_hwdom_map_gsi()) when guest OS unmasks vIOAPIC pin correspondi=
ng to
> > virtual device's IRQ.
> >
> > Also, hvm_gsi_eoi() is modified to trigger assertion in hvm_gsi_deasser=
t()
> > path for ISA IRQs.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Changes since v3:
> > - new patch
> > ---
> >  tools/libs/light/libxl_x86.c          |  2 +-
> >  xen/arch/x86/domain.c                 |  2 ++
> >  xen/arch/x86/hvm/vioapic.c            | 10 ++++++++++
> >  xen/arch/x86/include/asm/irq.h        |  1 +
> >  xen/common/emul/vuart/vuart-ns16550.c | 27 +++++++++++++++++++++++++--
> >  xen/drivers/passthrough/x86/hvm.c     |  9 ++++-----
> >  6 files changed, 43 insertions(+), 8 deletions(-)
>=20
> Given this diffstat, how come the patch prefix is "tools/xl:"? You don't =
even
> touch xl ...

Yeah, my bad, that should have been saying something like
"enable IRQ emulation via vIOAPIC"

Will update.

>=20
> > --- a/xen/common/emul/vuart/vuart-ns16550.c
> > +++ b/xen/common/emul/vuart/vuart-ns16550.c
> > @@ -355,7 +355,9 @@ static void ns16550_irq_assert(const struct vuart_n=
s16550 *vdev)
> >      struct domain *d =3D vdev->owner;
> >      int vector;
> >
> > -    if ( has_vpic(d) ) /* HVM */
> > +    if ( has_vioapic(d) && !has_vpic(d) ) /* PVH */
> > +        vector =3D hvm_ioapic_assert(d, vdev->irq, false);
> > +    else if ( has_vpic(d) ) /* HVM */
> >          vector =3D hvm_isa_irq_assert(d, vdev->irq, vioapic_get_vector=
);
>=20
> Why not
>=20
>     if ( has_vpic(d) ) /* HVM */
>          vector =3D hvm_isa_irq_assert(d, vdev->irq, vioapic_get_vector);
>     else if ( has_vioapic(d) ) /* PVH */
>         vector =3D hvm_ioapic_assert(d, vdev->irq, false);
>=20
> Less code churn and maybe even less generated code.
>=20
> > @@ -367,7 +369,9 @@ static void ns16550_irq_deassert(const struct vuart=
_ns16550 *vdev)
> >  {
> >      struct domain *d =3D vdev->owner;
> >
> > -    if ( has_vpic(d) ) /* HVM */
> > +    if ( has_vioapic(d) && !has_vpic(d) ) /* PVH */
> > +        hvm_ioapic_deassert(d, vdev->irq);
> > +    else if ( has_vpic(d) ) /* HVM */
> >          hvm_isa_irq_deassert(d, vdev->irq);
>=20
> Same here then.
>=20
> > --- a/xen/drivers/passthrough/x86/hvm.c
> > +++ b/xen/drivers/passthrough/x86/hvm.c
> > @@ -924,12 +924,11 @@ static void hvm_gsi_eoi(struct domain *d, unsigne=
d int gsi)
> >  {
> >      struct pirq *pirq =3D pirq_info(d, gsi);
> >
> > -    /* Check if GSI is actually mapped. */
> > -    if ( !pirq_dpci(pirq) )
> > -        return;
> > -
> >      hvm_gsi_deassert(d, gsi);
> > -    hvm_pirq_eoi(pirq);
> > +
> > +    /* Check if GSI is actually mapped. */
> > +    if ( pirq_dpci(pirq) )
> > +        hvm_pirq_eoi(pirq);
> >  }
>=20
> The correctness of this change (in particular hvm_gsi_deassert() now alwa=
ys
> running) wants reasoning about in the description.
>=20
> Jan
>=20


