Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4B8B358D6
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 11:27:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094183.1449530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqpxC-0007r7-PG; Tue, 26 Aug 2025 09:26:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094183.1449530; Tue, 26 Aug 2025 09:26:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqpxC-0007q4-LQ; Tue, 26 Aug 2025 09:26:58 +0000
Received: by outflank-mailman (input) for mailman id 1094183;
 Tue, 26 Aug 2025 09:26:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vqZn=3G=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uqpxA-0007pS-Bc
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 09:26:57 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cda9069d-825e-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 11:26:54 +0200 (CEST)
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
X-Inumbo-ID: cda9069d-825e-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1756200412; x=1756459612;
	bh=r3mxhllkZRkvWtnYYROiTE/T7kp18InogEEVlpsaEag=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Y1A5y+BlsKHagTrC4rDcgm5gPmvxxFHpsGwQBt7cPmEv3//t80HWUIL1fgq/GuMr8
	 HBN9YyiAR/2aO5fTR3tDY6b7gaUcUwRe1o4452PD87ALjQUMTzJwYTN3ssWHh7Kp8x
	 w1HsX/raAQM7P676VLmHWXMv5u5k2lxZO48D4te1o7iborgCBIgu5yYFkCkODq95qq
	 6dXms5VIZXwbhaiu5eYOEpzX+NXioQXN2l0+9zWHhApdcPFfyPJ8Tk1O61B55DQy+7
	 zYwo5FxopxDFqOk9byV/RDFqTB6ms6zyhzLrW7l0aPEsqjzIJ3PnuYVu9w5xfHTAFL
	 2MEd/dLlgPT8Q==
Date: Tue, 26 Aug 2025 09:26:46 +0000
To: Anthony PERARD <anthony@xenproject.org>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v4 6/8] tools/xl: enable NS16550-compatible UART emulator for HVM (x86)
Message-ID: <aK190s5IAscTuJlr@kraken>
In-Reply-To: <aKx4FtlhAbXxtZlB@l14>
References: <20250731192130.3948419-1-dmukhin@ford.com> <20250731192130.3948419-7-dmukhin@ford.com> <aKx4FtlhAbXxtZlB@l14>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 1b5c829be0a5f14815cbdb6b70997b470238edb2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 25, 2025 at 04:49:58PM +0200, Anthony PERARD wrote:
> On Thu, Jul 31, 2025 at 07:22:12PM +0000, dmkhn@proton.me wrote:
> > diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> > index 5362fb0e9a6f..e1d012274eaf 100644
> > --- a/docs/man/xl.cfg.5.pod.in
> > +++ b/docs/man/xl.cfg.5.pod.in
> > @@ -3032,14 +3032,17 @@ the domain was created.
> >  This requires hardware compatibility with the requested version, eithe=
r
> >  natively or via hardware backwards compatibility support.
> >
> > -=3Ditem B<vuart=3D"uart">
> > +=3Ditem B<vuart=3D[ "sbsa_uart", "ns16550" ]>
>=20
> This syntax here would inditace that `vuart` takes a list of items. You
> could write instead:
>=20
>     vuart=3D"UART"
>=20
> which seems more in line with the rest of the man page. Then you can add
> some thing like "with UART been one of "sbsa_uart" or "ns16550". It's
> possible to also have a sublist, like the `tee` option have.

OK, will do.

>=20
>=20
> >  To enable vuart console, user must specify the following option in the
> > -VM config file:
> > +VM config file, e.g:
> >
> > +```
>=20
> This file isn't in markdown, it's in perlpod.

Whoops, muscle memory. Thanks.

>=20
> >  vuart =3D "sbsa_uart"
> > +```
> >
> > -Currently, only the "sbsa_uart" model is supported for ARM.
> > +Currently, "sbsa_uart" (ARM) and "ns16550" (x86) are the only supporte=
d
> > +UART models.
> >
> >  =3Dback
> >
> > diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.=
c
> > index 4a19a8d22bdf..f4721b24763c 100644
> > --- a/tools/libs/light/libxl_arm.c
> > +++ b/tools/libs/light/libxl_arm.c
> > @@ -92,14 +92,26 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc=
,
> >      uint32_t virtio_mmio_irq =3D GUEST_VIRTIO_MMIO_SPI_FIRST;
> >      int rc;
> >
> > -    /*
> > -     * If pl011 vuart is enabled then increment the nr_spis to allow a=
llocation
> > -     * of SPI VIRQ for pl011.
> > -     */
> > -    if (d_config->b_info.arch_arm.vuart =3D=3D LIBXL_VUART_TYPE_SBSA_U=
ART) {
> > +    switch ( d_config->b_info.vuart )
> > +    {
> > +    case LIBXL_VUART_TYPE_SBSA_UART:
> > +        /*
> > +         * If pl011 vuart is enabled then increment the nr_spis to all=
ow
> > +         * allocation of SPI VIRQ for pl011.
> > +         */
> >          nr_spis +=3D (GUEST_VPL011_SPI - 32) + 1;
> >          vuart_irq =3D GUEST_VPL011_SPI;
> >          vuart_enabled =3D true;
> > +        break;
> > +
> > +    case LIBXL_VUART_TYPE_NS16550:
> > +        LOG(ERROR, "unsupported UART emulator %d\n", d_config->b_info.=
vuart);
>=20
> This seems too late in libxl.  I think checking if the config value is
> correct could be done in one of the *_setdefault() like many other
> config check are done. There's
> libxl__arch_domain_build_info_setdefault() that could be used.

Thanks for the pointer.

>=20
> > +        abort();
> > +        break;
> > +
> > +    case LIBXL_VUART_TYPE_UNKNOWN:
> > +    default:
> > +        break;
> >      }
> >
> >      for (i =3D 0; i < d_config->num_disks; i++) {
> > diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_=
types.idl
> > index fe251649f346..fd60c2b26764 100644
> > --- a/tools/libs/light/libxl_types.idl
> > +++ b/tools/libs/light/libxl_types.idl
> > @@ -276,6 +276,7 @@ libxl_checkpointed_stream =3D Enumeration("checkpoi=
nted_stream", [
> >  libxl_vuart_type =3D Enumeration("vuart_type", [
> >      (0, "unknown"),
> >      (1, "sbsa_uart"),
> > +    (2, "ns16550"),
> >      ])
> >
> >  libxl_vkb_backend =3D Enumeration("vkb_backend", [
> > @@ -722,7 +723,6 @@ libxl_domain_build_info =3D Struct("domain_build_in=
fo",[
> >
> >
> >      ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
> > -                               ("vuart", libxl_vuart_type),
>=20
> arch_arm.vuart is part of libxl's API, it can't be removed. There's some
> explanation about "libxl API compatibility" at the top of "libxl.h".
> But for this change, you could add `vuart` to `arch_x86`, or if you want
> to add `vuart` at the root like you did, you'll need to check that both
> `arch_arm.vuart` and `vuart` aren't set at the same time, and have one
> of the *_setdefault() function do the work of migrating the option.
>=20
> You'll need also a LIBXL_HAVE_* macro in libxl.h, probably named
> LIBXL_HAVE_VUART_NS16550.

Thanks for details, I will proceed with option 2, adding `vuart` at the roo=
t.

>=20
> >                                 ("sve_vl", libxl_sve_type),
> >                                 ("nr_spis", uint32, {'init_val': 'LIBXL=
_NR_SPIS_DEFAULT'}),
> >                                ])),
> > @@ -739,6 +739,7 @@ libxl_domain_build_info =3D Struct("domain_build_in=
fo",[
> >
> >      ("vpmu", libxl_defbool),
> >      ("trap_unmapped_accesses", libxl_defbool),
> > +    ("vuart", libxl_vuart_type),
> >
> >      ], dir=3DDIR_IN,
> >         copy_deprecated_fn=3D"libxl__domain_build_info_copy_deprecated"=
,
> > diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.=
c
> > index 60d4e8661c93..0f039ca65a88 100644
> > --- a/tools/libs/light/libxl_x86.c
> > +++ b/tools/libs/light/libxl_x86.c
> > @@ -2,6 +2,45 @@
> >  #include "libxl_arch.h"
> >  #include <xen/arch-x86/cpuid.h>
> >
> > +static void libxl__arch_domain_vuart_assert(
> > +    libxl__gc *gc,
> > +    libxl_domain_config *d_config,
> > +    struct xen_domctl_createdomain *config)
> > +{
> > +    LOG(ERROR, "unsupported UART emulator %d\n", d_config->b_info.vuar=
t);
> > +    abort();
>=20
> The name of the function is wrong. It doens't assert anything, and just
> abort...
> I don't think this function is useful.

Yeah, I mostly added it to avoid typing the same error message several time=
s.=20
Will remove.

>=20
> Also, don't abort() for configuration error, you need to return an error
> instead.

Ack.

>=20
> > +}
> > +
> > +static void libxl__arch_domain_vuart_unsupported(
> > +    libxl__gc *gc,
> > +    libxl_domain_config *d_config,
> > +    struct xen_domctl_createdomain *config)
> > +{
> > +    if ( d_config->b_info.vuart !=3D LIBXL_VUART_TYPE_UNKNOWN )
> > +        libxl__arch_domain_vuart_assert(gc, d_config, config);
>=20
> This function have also a bad name, it doesn't check if a uart is
> unsupported.

Will rework.

>=20
> > +}
> > +
> > +static void libxl__arch_domain_vuart_enable(
> > +    libxl__gc *gc,
> > +    libxl_domain_config *d_config,
> > +    struct xen_domctl_createdomain *config)
> > +{
> > +    switch ( d_config->b_info.vuart )
> > +    {
> > +    case LIBXL_VUART_TYPE_SBSA_UART:
> > +        libxl__arch_domain_vuart_assert(gc, d_config, config);
> > +        break;
> > +
> > +    case LIBXL_VUART_TYPE_NS16550:
> > +        config->arch.emulation_flags |=3D XEN_X86_EMU_NS16550;
> > +        break;
> > +
> > +    case LIBXL_VUART_TYPE_UNKNOWN:
> > +    default:
> > +        break;
> > +    }
> > +}
> > +
> >  int libxl__arch_domain_prepare_config(libxl__gc *gc,
> >                                        libxl_domain_config *d_config,
> >                                        struct xen_domctl_createdomain *=
config)
> > @@ -9,14 +48,17 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
> >      switch(d_config->c_info.type) {
> >      case LIBXL_DOMAIN_TYPE_HVM:
> >          config->arch.emulation_flags =3D (XEN_X86_EMU_ALL & ~XEN_X86_E=
MU_VPCI);
> > +        libxl__arch_domain_vuart_enable(gc, d_config, config);
> >          if (!libxl_defbool_val(d_config->b_info.u.hvm.pirq))
> >              config->arch.emulation_flags &=3D ~XEN_X86_EMU_USE_PIRQ;
> >          break;
> >      case LIBXL_DOMAIN_TYPE_PVH:
> >          config->arch.emulation_flags =3D XEN_X86_EMU_LAPIC;
> > +        libxl__arch_domain_vuart_unsupported(gc, d_config, config);
> >          break;
> >      case LIBXL_DOMAIN_TYPE_PV:
> >          config->arch.emulation_flags =3D 0;
> > +        libxl__arch_domain_vuart_unsupported(gc, d_config, config);
> >          break;
> >      default:
> >          abort();
>=20
> Thanks,

Thanks for review!

--
Denis

>=20
> --
> Anthony PERARD


