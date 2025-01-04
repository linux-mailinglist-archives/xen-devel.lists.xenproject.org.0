Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A91EA0128C
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 06:26:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865374.1276681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTwgO-0002Sn-OY; Sat, 04 Jan 2025 05:26:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865374.1276681; Sat, 04 Jan 2025 05:26:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTwgO-0002Qe-LJ; Sat, 04 Jan 2025 05:26:44 +0000
Received: by outflank-mailman (input) for mailman id 865374;
 Sat, 04 Jan 2025 05:26:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTwgN-0001so-KV
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 05:26:43 +0000
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch
 [79.135.106.31]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b6ae491-ca5c-11ef-a0de-8be0dac302b0;
 Sat, 04 Jan 2025 06:26:42 +0100 (CET)
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
X-Inumbo-ID: 7b6ae491-ca5c-11ef-a0de-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1735968401; x=1736227601;
	bh=Fzjy7R4ZFUGFhDTFtaOf688KQhnM2jDDlws+2C47Wno=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=T/xBDYDhnMx2KUr5JiOTiljXx/DiT8CuPF1WesH6B3nf/hDAtOocgsHjR9tjtoM/S
	 frCwBCEPJvbly3PdTbROUSjDV7K6JHCKzun/ygGkqHGNsgkdz90p5outfxH2vhnZNV
	 pYvwoMN6oMXS2gZjNpfwVkpQLU2PkaPwogHLeQ/SLMhBJSIJHMZhV3mwIs+xN/uyRo
	 OnkIsYDaaY4CNSMugsEANi61kEb2Db/ElnO80MLuNszjUyaTykk67L5KV7djXrNPOQ
	 maCEn7Wj5LVdAILwB5YT+1oJWqb5c8agii1vh9arQsg27b51L0ooTY9i/3aCodOlYX
	 MM54FjUjHbIUw==
Date: Sat, 04 Jan 2025 05:26:37 +0000
To: Stefano Stabellini <sstabellini@kernel.org>
From: Denis Mukhin <dmkhn@proton.me>
Cc: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, dmukhin@ford.com, xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 33/35] x86/domain: implement domain_has_vuart()
Message-ID: <2f5Un81oSi9Cg2nylEVS3nbS-KczBOwkCPFt_7QE_fhVLa_-H-xLIwpsNnO2Oe_T0LCBq8jfqCeWg8CrrYj7wou0M_0rpvK8T3I58Rd2lEk=@proton.me>
In-Reply-To: <alpine.DEB.2.22.394.2412131245300.463523@ubuntu-linux-20-04-desktop>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-33-e9aa923127eb@ford.com> <Z1wnUzDCPDzHKr6o@macbook.local> <alpine.DEB.2.22.394.2412131245300.463523@ubuntu-linux-20-04-desktop>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: f4aa9c7dd8a4cc57d73f5760d243223b2ab90040
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Friday, December 13th, 2024 at 12:45 PM, Stefano Stabellini <sstabellini=
@kernel.org> wrote:

>
>
> On Fri, 13 Dec 2024, Roger Pau Monn=C3=A9 wrote:
>
> > On Thu, Dec 05, 2024 at 08:42:03PM -0800, Denis Mukhin via B4 Relay wro=
te:
> >
> > > From: Denis Mukhin dmukhin@ford.com
> > >
> > > Add new emulation flag for virtual UART on x86 and plumb it through t=
he stack.
> > >
> > > This change enables NS8250 emulator initialization.
> > >
> > > Signed-off-by: Denis Mukhin dmukhin@ford.com
> > > ---
> > > tools/libs/light/libxl_x86.c | 6 +++++-
> > > tools/ocaml/libs/xc/xenctrl.ml | 1 +
> > > tools/ocaml/libs/xc/xenctrl.mli | 1 +
> > > tools/python/xen/lowlevel/xc/xc.c | 4 +---
> > > xen/arch/x86/domain.c | 8 +++++---
> > > xen/arch/x86/include/asm/domain.h | 7 ++++---
> > > xen/include/public/arch-x86/xen.h | 14 +++++++++++++-
> > > 7 files changed, 30 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x8=
6.c
> > > index a3164a3077fec7e1b81a34074894dc646954a49a..de5f05e18cb0671bb031b=
101b9a7159eb0fe0178 100644
> > > --- a/tools/libs/light/libxl_x86.c
> > > +++ b/tools/libs/light/libxl_x86.c
> > > @@ -8,7 +8,11 @@ int libxl__arch_domain_prepare_config(libxl__gc gc,
> > > {
> > > switch(d_config->c_info.type) {
> > > case LIBXL_DOMAIN_TYPE_HVM:
> > > - config->arch.emulation_flags =3D (XEN_X86_EMU_ALL & ~XEN_X86_EMU_VP=
CI);
> > > + config->arch.emulation_flags =3D XEN_X86_EMU_ALL;
> > > + config->arch.emulation_flags &=3D ~XEN_X86_EMU_VPCI;
> > > + / Virtual UART is selected at Xen build time */
> > > + config->arch.emulation_flags &=3D ~XEN_X86_EMU_VUART;
> > > +
> > > if (!libxl_defbool_val(d_config->b_info.u.hvm.pirq))
> > > config->arch.emulation_flags &=3D ~XEN_X86_EMU_USE_PIRQ;
> > > break;
> > > diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xen=
ctrl.ml
> > > index 2690f9a92316b812ad3d3ff0e1c36823070adb4a..647239b3e55e88b00eb8e=
9773a5267894cbbae54 100644
> > > --- a/tools/ocaml/libs/xc/xenctrl.ml
> > > +++ b/tools/ocaml/libs/xc/xenctrl.ml
> > > @@ -47,6 +47,7 @@ type x86_arch_emulation_flags =3D
> > > | X86_EMU_PIT
> > > | X86_EMU_USE_PIRQ
> > > | X86_EMU_VPCI
> > > + | X86_EMU_VUART
> > >
> > > type x86_arch_misc_flags =3D
> > > | X86_MSR_RELAXED
> > > diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xe=
nctrl.mli
> > > index febbe1f6ae3f10c5abe45eaa3c06a8a67d9ba268..4f5f64c786e83e8a0c3dd=
3cdb0460f7095de4a62 100644
> > > --- a/tools/ocaml/libs/xc/xenctrl.mli
> > > +++ b/tools/ocaml/libs/xc/xenctrl.mli
> > > @@ -41,6 +41,7 @@ type x86_arch_emulation_flags =3D
> > > | X86_EMU_PIT
> > > | X86_EMU_USE_PIRQ
> > > | X86_EMU_VPCI
> > > + | X86_EMU_VUART
> > >
> > > type x86_arch_misc_flags =3D
> > > | X86_MSR_RELAXED
> > > diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/low=
level/xc/xc.c
> > > index 9feb12ae2b16e48cb5d0c3c45044ae226f152f2d..e54308956efc7061d58d2=
166ec9a95bc1dcd1781 100644
> > > --- a/tools/python/xen/lowlevel/xc/xc.c
> > > +++ b/tools/python/xen/lowlevel/xc/xc.c
> > > @@ -159,9 +159,7 @@ static PyObject *pyxc_domain_create(XcObject *sel=
f,
> > >
> > > #if defined (__i386) || defined(x86_64)
> > > if ( config.flags & XEN_DOMCTL_CDF_hvm )
> > > - config.arch.emulation_flags =3D XEN_X86_EMU_ALL &
> > > - ~(XEN_X86_EMU_VPCI |
> > > - XEN_X86_EMU_USE_PIRQ);
> > > + config.arch.emulation_flags =3D XEN_X86_EMU_HVM_ALLOWABLE;
> > > #elif defined (arm) || defined(aarch64)
> > > config.arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
> > > #else
> > > diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> > > index c88d422a64544531c1e1058fa484364bb4277d1e..439da7adc92a3a8eb4810=
75bf834da5f9670dd54 100644
> > > --- a/xen/arch/x86/domain.c
> > > +++ b/xen/arch/x86/domain.c
> > > @@ -752,10 +752,10 @@ static bool emulation_flags_ok(const struct dom=
ain *d, uint32_t emflags)
> > > if ( is_hardware_domain(d) &&
> > > emflags !=3D (X86_EMU_VPCI | X86_EMU_LAPIC | X86_EMU_IOAPIC) )
> > > return false;
> > > +
> > > + emflags &=3D ~X86_EMU_VUART;
> >
> > I think you want to allow X86_EMU_VUART only for domains created by
> > Xen itself, so X86_EMU_VUART can only be valid if system_state <
> > SYS_STATE_active.
> >
> > > if ( !is_hardware_domain(d) &&
> > > - /* HVM PIRQ feature is user-selectable. */
> > > - (emflags & ~X86_EMU_USE_PIRQ) !=3D
> > > - (X86_EMU_ALL & ~(X86_EMU_VPCI | X86_EMU_USE_PIRQ)) &&
> > > + xen_emflags_allowable(emflags) !=3D XEN_X86_EMU_HVM_ALLOWABLE &&
> > > emflags !=3D X86_EMU_LAPIC )
> > > return false;
> > > }
> > > @@ -806,6 +806,8 @@ int arch_domain_create(struct domain *d,
> > >
> > > emflags =3D config->arch.emulation_flags;
> > >
> > > + if ( IS_ENABLED(CONFIG_HAS_VUART_NS8250) && is_hvm_domain(d) )
> > > + emflags |=3D XEN_X86_EMU_VUART;
> >
> > Doesn't this need to be limited to domains created by Xen itself, as
> > otherwise it's the toolstack that should specify the XEN_X86_EMU_VUART
> > flag, and even then the recommendation would be to use the vUART from
> > QEMU?
>
>
> While I agree with you that this feature is really useful mostly for the
> domains created by Xen, as for those there is no other way to get early
> output, I think Denis has been also testing successfully this feature
> with PVH or HVM domains created by the toolstack.

I tested w/ HVM only for now.
PVH needs some more work as it does not have vPIC.

>
> I'll let you decide whether you want to expose the feature to xl created
> domains, but yes my understanding is that they already work with this
> series. One benefit would be that for PVH domains you could get early
> output without having to start QEMU, but I'll leave this to you.

TBH, I planned to enable xl support in the follow on series.



