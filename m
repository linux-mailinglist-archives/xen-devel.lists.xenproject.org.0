Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB0EB17B04
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 03:53:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066692.1431828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhexb-0006HT-Fx; Fri, 01 Aug 2025 01:53:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066692.1431828; Fri, 01 Aug 2025 01:53:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhexb-0006Fl-DI; Fri, 01 Aug 2025 01:53:27 +0000
Received: by outflank-mailman (input) for mailman id 1066692;
 Fri, 01 Aug 2025 01:53:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GtvS=2N=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uhexZ-0006Fd-Bi
 for xen-devel@lists.xenproject.org; Fri, 01 Aug 2025 01:53:25 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c93842b-6e7a-11f0-b895-0df219b8e170;
 Fri, 01 Aug 2025 03:53:20 +0200 (CEST)
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
X-Inumbo-ID: 4c93842b-6e7a-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1754013198; x=1754272398;
	bh=7nYRYqyTpkgbjg/kvxtm6yMNGst/fiy6u+RTeI0aUws=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=jpDsMic2y/zW2RVS0DfcNfKXUJswslWWPT6hyUFFY+1aDO96R3d01b14LiB6Kz2m2
	 jzMD0l84kQEx29FbmUDG0T3UxcrbMdlGnU9Y18D9KReOxfdbtZVy5riiqvFzpfBzx2
	 yqW7pHQrrbVvZmeFN572mCagij61QtI8IAEkU07Cgao9hCZVITuVtTsyadLMQ3XkPX
	 yqzbLCpNCtpWvvyfPyXmr4cgixkTgeh8Tw3r4BIRKSA4IAJGTH/GCSR9rqv3c8DxVV
	 jZrr5QSx/XzmKdvHZxPV1oYBtfnL2MhJPUs76eUTrAr3AYT+HWIzbYZR40AmDHno4T
	 BOmLLYJ5JmU/w==
Date: Fri, 01 Aug 2025 01:53:15 +0000
To: Stefano Stabellini <sstabellini@kernel.org>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, dmukhin@ford.com
Subject: Re: [PATCH v4 7/8] tools/xl: enable NS16550-compatible UART emulator for PVH (x86)
Message-ID: <aIweBxdXJ3Rt2UO5@kraken>
In-Reply-To: <alpine.DEB.2.22.394.2507311745340.468590@ubuntu-linux-20-04-desktop>
References: <20250731192130.3948419-1-dmukhin@ford.com> <20250731192130.3948419-8-dmukhin@ford.com> <alpine.DEB.2.22.394.2507311745340.468590@ubuntu-linux-20-04-desktop>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 8f4c468e05c200e7f27a76b99b5a5a339d6daabc
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2025 at 05:46:37PM -0700, Stefano Stabellini wrote:
> On Thu, 31 Jul 2025, dmkhn@proton.me wrote:
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
> >
> > diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.=
c
> > index 0f039ca65a88..a40647c06cb9 100644
> > --- a/tools/libs/light/libxl_x86.c
> > +++ b/tools/libs/light/libxl_x86.c
> > @@ -54,7 +54,7 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
> >          break;
> >      case LIBXL_DOMAIN_TYPE_PVH:
> >          config->arch.emulation_flags =3D XEN_X86_EMU_LAPIC;
> > -        libxl__arch_domain_vuart_unsupported(gc, d_config, config);
> > +        libxl__arch_domain_vuart_enable(gc, d_config, config);
> >          break;
> >      case LIBXL_DOMAIN_TYPE_PV:
> >          config->arch.emulation_flags =3D 0;
> > diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> > index 6a010a509a60..39b0c0b199b9 100644
> > --- a/xen/arch/x86/domain.c
> > +++ b/xen/arch/x86/domain.c
> > @@ -769,12 +769,14 @@ static bool emulation_flags_ok(const struct domai=
n *d, uint32_t emflags)
> >          {
> >              .caps   =3D CAP_HVM | CAP_HWDOM,
> >              .min    =3D X86_EMU_LAPIC | X86_EMU_IOAPIC | X86_EMU_VPCI,
> > +            .opt    =3D X86_EMU_NS16550,
> >          },
> >
> >          /* PVH domU */
> >          {
> >              .caps   =3D CAP_HVM | CAP_DOMU,
> >              .min    =3D X86_EMU_LAPIC,
> > +            .opt    =3D X86_EMU_NS16550,
> >          },
> >
> >          /* HVM domU */
> > diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
> > index 7c725f9e471f..86fe3aa4a201 100644
> > --- a/xen/arch/x86/hvm/vioapic.c
> > +++ b/xen/arch/x86/hvm/vioapic.c
> > @@ -177,6 +177,16 @@ static int vioapic_hwdom_map_gsi(unsigned int gsi,=
 unsigned int trig,
> >
> >      ASSERT(is_hardware_domain(currd));
> >
> > +    /*
> > +     * Interrupt is claimed by one of the platform virtual devices (e.=
g.
> > +     * NS16550); do nothing.
> > +     */
> > +    read_lock(&currd->event_lock);
> > +    ret =3D domain_pirq_to_emuirq(currd, gsi);
> > +    read_unlock(&currd->event_lock);
> > +    if ( ret !=3D IRQ_UNBOUND )
> > +        return 0;
> > +
> >      /* Interrupt has been unmasked, bind it now. */
> >      ret =3D mp_register_gsi(gsi, trig, pol);
> >      if ( ret =3D=3D -EEXIST )
> > diff --git a/xen/arch/x86/include/asm/irq.h b/xen/arch/x86/include/asm/=
irq.h
> > index 8c81f66434a8..731d2bbbb1b4 100644
> > --- a/xen/arch/x86/include/asm/irq.h
> > +++ b/xen/arch/x86/include/asm/irq.h
> > @@ -221,6 +221,7 @@ void cleanup_domain_irq_mapping(struct domain *d);
> >  #define IRQ_UNBOUND (-1)
> >  #define IRQ_PT      (-2)
> >  #define IRQ_MSI_EMU (-3)
> > +#define IRQ_EMU     (-4)
> >
> >  bool cpu_has_pending_apic_eoi(void);
> >
> > diff --git a/xen/common/emul/vuart/vuart-ns16550.c b/xen/common/emul/vu=
art/vuart-ns16550.c
> > index 48bbf58264fe..9ec9aed2c594 100644
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
> >      else
> >          ASSERT_UNREACHABLE();
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
> >      else
> >          ASSERT_UNREACHABLE();
> > @@ -889,6 +893,17 @@ static int cf_check ns16550_init(struct domain *d,
> >                  return rc;
> >              }
> >
> > +            /* Claim virtual IRQ */
> > +            write_lock(&d->event_lock);
> > +            rc =3D map_domain_emuirq_pirq(d, r->addr, IRQ_EMU);
> > +            write_unlock(&d->event_lock);
> > +            if ( rc )
> > +            {
> > +                pr_err("%s: virtual IRQ#%"PRIu64": cannot claim: %d\n"=
,
> > +                        desc->name, r->addr, rc);
> > +                return rc;
> > +            }
> > +
> >              vdev->irq =3D r->addr;
> >          }
> >          else
> > @@ -919,12 +934,20 @@ static int cf_check ns16550_init(struct domain *d=
,
> >  static void cf_check ns16550_deinit(struct domain *d)
> >  {
> >      struct vuart_ns16550 *vdev =3D d->arch.hvm.vuart;
> > +    int rc;
> >
> >      if ( !vdev )
> >          return;
> >
> >      spin_lock(&vdev->lock);
> >
> > +    rc =3D unmap_domain_pirq_emuirq(vdev->owner, vdev->irq);
> > +    if ( rc )
> > +    {
> > +        pr_err("%s: virtual IRQ#%d: cannot unclaim: %d\n",
> > +                vdev->name, vdev->irq, rc);
> > +    }
>=20
> write_lock(&d->event_lock); ?

Thanks

>=20
>=20
> >      ns16550_fifo_tx_flush(vdev);
> >
> >      spin_unlock(&vdev->lock);
> > diff --git a/xen/drivers/passthrough/x86/hvm.c b/xen/drivers/passthroug=
h/x86/hvm.c
> > index a2ca7e0e570c..22905cd86f95 100644
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
> >
> >  static int cf_check _hvm_dpci_isairq_eoi(
> > --
> > 2.34.1
> >
> >


