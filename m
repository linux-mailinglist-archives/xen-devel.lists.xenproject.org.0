Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC31A0127E
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 06:20:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865358.1276662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTwZB-0000Ar-MU; Sat, 04 Jan 2025 05:19:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865358.1276662; Sat, 04 Jan 2025 05:19:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTwZB-00007k-In; Sat, 04 Jan 2025 05:19:17 +0000
Received: by outflank-mailman (input) for mailman id 865358;
 Sat, 04 Jan 2025 05:19:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTwZ8-00006g-Tm
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 05:19:15 +0000
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch
 [79.135.106.31]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ed65d01-ca5b-11ef-99a4-01e77a169b0f;
 Sat, 04 Jan 2025 06:19:12 +0100 (CET)
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
X-Inumbo-ID: 6ed65d01-ca5b-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1735967950; x=1736227150;
	bh=/UYjyA+oK7mFTIA5K+v6KxEop26cmT9VoQMQK6vunsM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=QrHgtOhAiKvT1iLwrgpsfo+XMRV/Gl3wAyo8aeAu7hxReg4AuhxyG29KHRZHwwZQm
	 SLHbM48ZbR1tspPc30z2ejjBd6M9y+8luMVHKoRj1De6Z6aU25ipQprxlMx2/+pcQe
	 frmdrwU70Lyyfd8FXqfRZ8VIMUAv+X9V+CIMhypLWVYyjtmm1u8Tq+iJirTIV0DXDy
	 LryCYjvrcORbB1iYLXTigZriL0OKhgOCgjGS2DuSp7gQYH6+FLOvZAq9lHhqgFjJ3a
	 kU29ge9KWDKjo+sYXQHsHyqDRBaxEvur3NgNuzyXFH1AJURUllbB+jV26Mk6dIocA8
	 RUmVBQRJzpiFg==
Date: Sat, 04 Jan 2025 05:19:07 +0000
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 33/35] x86/domain: implement domain_has_vuart()
Message-ID: <Tz4Idf7hUa85arksVC6UYYRNbhinY-0wHXqxIInbLCWGNiGZSEIvGNGLmICNLmHK5o7m6MUMhnUlrJX10WO1XHhyRSgCX7Gknz0xBGZJiD8=@proton.me>
In-Reply-To: <Z1wnUzDCPDzHKr6o@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-33-e9aa923127eb@ford.com> <Z1wnUzDCPDzHKr6o@macbook.local>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 6517eb9cb37cd4c7de575d4ebbdb7dfb4f0b593e
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Friday, December 13th, 2024 at 4:23 AM, Roger Pau Monn=C3=A9 <roger.pau@=
citrix.com> wrote:

>
>
> On Thu, Dec 05, 2024 at 08:42:03PM -0800, Denis Mukhin via B4 Relay wrote=
:
>
> > From: Denis Mukhin dmukhin@ford.com
> >
> > Add new emulation flag for virtual UART on x86 and plumb it through the=
 stack.
> >
> > This change enables NS8250 emulator initialization.
> >
> > Signed-off-by: Denis Mukhin dmukhin@ford.com
> > ---
> > tools/libs/light/libxl_x86.c | 6 +++++-
> > tools/ocaml/libs/xc/xenctrl.ml | 1 +
> > tools/ocaml/libs/xc/xenctrl.mli | 1 +
> > tools/python/xen/lowlevel/xc/xc.c | 4 +---
> > xen/arch/x86/domain.c | 8 +++++---
> > xen/arch/x86/include/asm/domain.h | 7 ++++---
> > xen/include/public/arch-x86/xen.h | 14 +++++++++++++-
> > 7 files changed, 30 insertions(+), 11 deletions(-)
> >
> > diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.=
c
> > index a3164a3077fec7e1b81a34074894dc646954a49a..de5f05e18cb0671bb031b10=
1b9a7159eb0fe0178 100644
> > --- a/tools/libs/light/libxl_x86.c
> > +++ b/tools/libs/light/libxl_x86.c
> > @@ -8,7 +8,11 @@ int libxl__arch_domain_prepare_config(libxl__gc gc,
> > {
> > switch(d_config->c_info.type) {
> > case LIBXL_DOMAIN_TYPE_HVM:
> > - config->arch.emulation_flags =3D (XEN_X86_EMU_ALL & ~XEN_X86_EMU_VPCI=
);
> > + config->arch.emulation_flags =3D XEN_X86_EMU_ALL;
> > + config->arch.emulation_flags &=3D ~XEN_X86_EMU_VPCI;
> > + / Virtual UART is selected at Xen build time */
> > + config->arch.emulation_flags &=3D ~XEN_X86_EMU_VUART;
> > +
> > if (!libxl_defbool_val(d_config->b_info.u.hvm.pirq))
> > config->arch.emulation_flags &=3D ~XEN_X86_EMU_USE_PIRQ;
> > break;
> > diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenct=
rl.ml
> > index 2690f9a92316b812ad3d3ff0e1c36823070adb4a..647239b3e55e88b00eb8e97=
73a5267894cbbae54 100644
> > --- a/tools/ocaml/libs/xc/xenctrl.ml
> > +++ b/tools/ocaml/libs/xc/xenctrl.ml
> > @@ -47,6 +47,7 @@ type x86_arch_emulation_flags =3D
> > | X86_EMU_PIT
> > | X86_EMU_USE_PIRQ
> > | X86_EMU_VPCI
> > + | X86_EMU_VUART
> >
> > type x86_arch_misc_flags =3D
> > | X86_MSR_RELAXED
> > diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenc=
trl.mli
> > index febbe1f6ae3f10c5abe45eaa3c06a8a67d9ba268..4f5f64c786e83e8a0c3dd3c=
db0460f7095de4a62 100644
> > --- a/tools/ocaml/libs/xc/xenctrl.mli
> > +++ b/tools/ocaml/libs/xc/xenctrl.mli
> > @@ -41,6 +41,7 @@ type x86_arch_emulation_flags =3D
> > | X86_EMU_PIT
> > | X86_EMU_USE_PIRQ
> > | X86_EMU_VPCI
> > + | X86_EMU_VUART
> >
> > type x86_arch_misc_flags =3D
> > | X86_MSR_RELAXED
> > diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowle=
vel/xc/xc.c
> > index 9feb12ae2b16e48cb5d0c3c45044ae226f152f2d..e54308956efc7061d58d216=
6ec9a95bc1dcd1781 100644
> > --- a/tools/python/xen/lowlevel/xc/xc.c
> > +++ b/tools/python/xen/lowlevel/xc/xc.c
> > @@ -159,9 +159,7 @@ static PyObject *pyxc_domain_create(XcObject *self,
> >
> > #if defined (__i386) || defined(x86_64)
> > if ( config.flags & XEN_DOMCTL_CDF_hvm )
> > - config.arch.emulation_flags =3D XEN_X86_EMU_ALL &
> > - ~(XEN_X86_EMU_VPCI |
> > - XEN_X86_EMU_USE_PIRQ);
> > + config.arch.emulation_flags =3D XEN_X86_EMU_HVM_ALLOWABLE;
> > #elif defined (arm) || defined(aarch64)
> > config.arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
> > #else
> > diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> > index c88d422a64544531c1e1058fa484364bb4277d1e..439da7adc92a3a8eb481075=
bf834da5f9670dd54 100644
> > --- a/xen/arch/x86/domain.c
> > +++ b/xen/arch/x86/domain.c
> > @@ -752,10 +752,10 @@ static bool emulation_flags_ok(const struct domai=
n *d, uint32_t emflags)
> > if ( is_hardware_domain(d) &&
> > emflags !=3D (X86_EMU_VPCI | X86_EMU_LAPIC | X86_EMU_IOAPIC) )
> > return false;
> > +
> > + emflags &=3D ~X86_EMU_VUART;
>
>
> I think you want to allow X86_EMU_VUART only for domains created by
> Xen itself, so X86_EMU_VUART can only be valid if system_state <
> SYS_STATE_active.

I think vUART should be configurable for domains created via toolstack
as well as for domains created by Xen.

But, TBH, I did not plan for toolstack integration in this series.

For Xen-created domains enabling emulator for HVM domains only and enabling
it globally (since that's debugging/bringup only) seemed enough for the
initial change.

>
> > if ( !is_hardware_domain(d) &&
> > - /* HVM PIRQ feature is user-selectable. */
> > - (emflags & ~X86_EMU_USE_PIRQ) !=3D
> > - (X86_EMU_ALL & ~(X86_EMU_VPCI | X86_EMU_USE_PIRQ)) &&
> > + xen_emflags_allowable(emflags) !=3D XEN_X86_EMU_HVM_ALLOWABLE &&
> > emflags !=3D X86_EMU_LAPIC )
> > return false;
> > }
> > @@ -806,6 +806,8 @@ int arch_domain_create(struct domain *d,
> >
> > emflags =3D config->arch.emulation_flags;
> >
> > + if ( IS_ENABLED(CONFIG_HAS_VUART_NS8250) && is_hvm_domain(d) )
> > + emflags |=3D XEN_X86_EMU_VUART;
>
>
> Doesn't this need to be limited to domains created by Xen itself, as
> otherwise it's the toolstack that should specify the XEN_X86_EMU_VUART
> flag, and even then the recommendation would be to use the vUART from
> QEMU?

re: toolstack: I agree, toolstack should support vUART configuration.
I plan to address it in the follow on series.

>
> > if ( is_hardware_domain(d) && is_pv_domain(d) )
> > emflags |=3D XEN_X86_EMU_PIT;
> >
> > diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/a=
sm/domain.h
> > index c1d0d1f47324e8cc678a4c76c43f86820a89e7b3..dacea6e1aad46e9f8710b22=
02bb81203c5e92807 100644
> > --- a/xen/arch/x86/include/asm/domain.h
> > +++ b/xen/arch/x86/include/asm/domain.h
> > @@ -484,7 +484,8 @@ struct arch_domain
> > #define X86_EMU_VPCI 0
> > #endif
> >
> > -#define X86_EMU_PIT XEN_X86_EMU_PIT
> > +#define X86_EMU_PIT XEN_X86_EMU_PIT
>
>
> Unintended indentation change?

Actually, this change was intentional: it fixes the alignment against
previous #ifdefs.

>
> > +#define X86_EMU_VUART XEN_X86_EMU_VUART
> >
> > /* This must match XEN_X86_EMU_ALL in xen.h */
> > #define X86_EMU_ALL (X86_EMU_LAPIC | X86_EMU_HPET | \
> > @@ -492,7 +493,7 @@ struct arch_domain
> > X86_EMU_IOAPIC | X86_EMU_PIC | \
> > X86_EMU_VGA | X86_EMU_IOMMU | \
> > X86_EMU_PIT | X86_EMU_USE_PIRQ | \
> > - X86_EMU_VPCI)
> > + X86_EMU_VPCI | X86_EMU_VUART)
> >
> > #define has_vlapic(d) (!!((d)->arch.emulation_flags & X86_EMU_LAPIC))
> > #define has_vhpet(d) (!!((d)->arch.emulation_flags & X86_EMU_HPET))
> > @@ -507,7 +508,7 @@ struct arch_domain
> > #define has_vpci(d) (!!((d)->arch.emulation_flags & X86_EMU_VPCI))
> >
> > /* NB: same symbol as in Arm port */
> > -#define domain_has_vuart(d) false
> > +#define domain_has_vuart(d) (!!((d)->arch.emulation_flags & X86_EMU_VU=
ART))
> >
> > #define gdt_ldt_pt_idx(v) \
> > ((v)->vcpu_id >> (PAGETABLE_ORDER - GDT_LDT_VCPU_SHIFT))
> > diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arc=
h-x86/xen.h
> > index fc2487986642a7694578ab9d2f5f16d09761bff8..e7922e3f9ddc1742a464d22=
8807279839df31e52 100644
> > --- a/xen/include/public/arch-x86/xen.h
> > +++ b/xen/include/public/arch-x86/xen.h
> > @@ -283,13 +283,25 @@ struct xen_arch_domainconfig {
> > #define XEN_X86_EMU_USE_PIRQ (1U<<_XEN_X86_EMU_USE_PIRQ)
> > #define _XEN_X86_EMU_VPCI 10
> > #define XEN_X86_EMU_VPCI (1U<<_XEN_X86_EMU_VPCI)
> > +#define _XEN_X86_EMU_VUART 11
> > +#define XEN_X86_EMU_VUART (1U<<_XEN_X86_EMU_VUART)
> >
> > #define XEN_X86_EMU_ALL (XEN_X86_EMU_LAPIC | XEN_X86_EMU_HPET | \
> > XEN_X86_EMU_PM | XEN_X86_EMU_RTC | \
> > XEN_X86_EMU_IOAPIC | XEN_X86_EMU_PIC | \
> > XEN_X86_EMU_VGA | XEN_X86_EMU_IOMMU | \
> > XEN_X86_EMU_PIT | XEN_X86_EMU_USE_PIRQ |\
> > - XEN_X86_EMU_VPCI)
> > + XEN_X86_EMU_VPCI | XEN_X86_EMU_VUART)
> > +
> > +/* HVM PIRQ feature is user-selectable (libxl). */
> > +#define XEN_X86_EMU_HVM_SELECTABLE (XEN_X86_EMU_VPCI | \
> > + XEN_X86_EMU_USE_PIRQ | \
> > + XEN_X86_EMU_VUART)
>
>
> XEN_X86_EMU_HVM_OPTIONAL is maybe clearer?

Looks like it, thanks for suggestion!
Fixed.

>
> Albeit PVH is kind of HVM.

PVH does not have vPIC so there's some more work to enable vUART
for PVH on x86: emulator currently supports only ISA IRQs.

>
> > +
> > +#define xen_emflags_allowable(x) ((x) & ~XEN_X86_EMU_HVM_SELECTABLE)
> > +
> > +#define XEN_X86_EMU_HVM_ALLOWABLE xen_emflags_allowable(XEN_X86_EMU_AL=
L)
>
>
> XEN_X86_EMU_HVM_BASELINE I think would also be better?

Fixed.

>
> Thanks, Roger.



