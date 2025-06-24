Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA96DAE722F
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 00:19:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024158.1400181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUBy2-0006CR-0i; Tue, 24 Jun 2025 22:18:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024158.1400181; Tue, 24 Jun 2025 22:18:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUBy1-0006B0-U1; Tue, 24 Jun 2025 22:18:13 +0000
Received: by outflank-mailman (input) for mailman id 1024158;
 Tue, 24 Jun 2025 22:18:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1A0Y=ZH=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uUBxz-0006Au-1z
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 22:18:12 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1756597b-5149-11f0-b894-0df219b8e170;
 Wed, 25 Jun 2025 00:18:01 +0200 (CEST)
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
X-Inumbo-ID: 1756597b-5149-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=ohpi6hxocbgyfgkikvprtbnmwa.protonmail; t=1750803480; x=1751062680;
	bh=V6io7CTkqeDWbh6RvldlLiRXAY5v70bWhoTL7mYz7uE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=i2YIviqOhyrkRjXycJTh8IzcH3sRQ/rFCVtfrTk+Hv8ds7J3nJoZdpY15kLAvsBNH
	 BqfzfnpeJHDL+8WGJP4MWlEpRK260qo2gHiP6RnYidPGDRQGFLYM6NaDoyNvgi5DLY
	 Y+9nGJGGUMW+pVjaIpq1xptTy6IhzT25R0c4C1TwCojfxHg2b6jIwuXpsyaA2oYhFn
	 T6W0HJVZko+arKE9iDgkhzewSwlrFviw0/5habyHl2wIsldjSN1oHxKmL6UVXFZfWk
	 QW96fl3z8HAUd7BREnAJa8xPhUgVviLbchfpn/L2QGaS1886zSm5FvJgAKxcb21NG8
	 0agFGZp21oaLQ==
Date: Tue, 24 Jun 2025 22:17:53 +0000
To: "Orzel, Michal" <michal.orzel@amd.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, oleksii.kurochko@gmail.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v1 03/16] arm/vpl011: use vuart_ prefix in vpl011 public calls
Message-ID: <aFskC3a74y+U8tnx@kraken>
In-Reply-To: <8c35481f-6a2b-4579-9b34-c912cf3bbd14@amd.com>
References: <20250624035443.344099-1-dmukhin@ford.com> <20250624035443.344099-4-dmukhin@ford.com> <8c35481f-6a2b-4579-9b34-c912cf3bbd14@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 7a1ad049282da2ee301df2a0fc54787e6b6a2ad5
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 12:11:10PM +0200, Orzel, Michal wrote:
>=20
>=20
> On 24/06/2025 05:55, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Use generic names prefixed with 'vuart_' in public PL011 emulator data
> > structures and functions.
> >
> > No functional change intended.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> >  xen/arch/arm/dom0less-build.c     |  4 ++--
> >  xen/arch/arm/domain.c             |  3 ++-
> >  xen/arch/arm/domctl.c             | 14 +++++++------
> >  xen/arch/arm/include/asm/vpl011.h | 20 ------------------
> >  xen/arch/arm/vpl011.c             | 24 +++++++++++-----------
> >  xen/drivers/char/console.c        |  6 ++----
> >  xen/include/xen/vuart.h           | 34 ++++++++++++++++++++++++++++++-
> >  7 files changed, 59 insertions(+), 46 deletions(-)
> >
> > diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-buil=
d.c
> > index 7c1b59750fb5..11b8498d3b22 100644
> > --- a/xen/arch/arm/dom0less-build.c
> > +++ b/xen/arch/arm/dom0less-build.c
> > @@ -216,7 +216,7 @@ int __init init_vuart(struct domain *d, struct kern=
el_info *kinfo,
> As can be seen here ...
>=20
> >       */
> >      if ( kinfo->arch.vpl011 )
> >      {
> > -        rc =3D domain_vpl011_init(d, NULL);
> > +        rc =3D vuart_init(d, NULL);
> we end up with init_vuart() and vuart_init(). That's quite confusing. May=
be
> domain_vuart_init() or alike?

That's right!
But domain_vuart_init() is used by MMIO-based variant :)
I will write an extra patch and put it to the end of the series to update t=
he
name here.

>=20
> >          if ( rc < 0 )
> >              return rc;
> >      }
> > @@ -247,7 +247,7 @@ void __init arch_create_domUs(struct dt_device_node=
 *node,
> >           * d->arch.vpl011.irq. So the logic to find the vIRQ has to
> >           * be hardcoded.
> >           * The logic here shall be consistent with the one in
> > -         * domain_vpl011_init().
> > +         * vuart_init().
> >           */
> >          if ( flags & CDF_directmap )
> >          {
> > diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> > index be58a23dd725..68297e619bad 100644
> > --- a/xen/arch/arm/domain.c
> > +++ b/xen/arch/arm/domain.c
> > @@ -11,6 +11,7 @@
> >  #include <xen/sched.h>
> >  #include <xen/softirq.h>
> >  #include <xen/wait.h>
> > +#include <xen/vuart.h>
> >
> >  #include <asm/arm64/sve.h>
> >  #include <asm/cpuerrata.h>
> > @@ -1072,7 +1073,7 @@ int domain_relinquish_resources(struct domain *d)
> >           * Release the resources allocated for vpl011 which were
> >           * allocated via a DOMCTL call XEN_DOMCTL_vuart_op.
> >           */
> > -        domain_vpl011_deinit(d);
> > +        vuart_exit(d);
> IMO, deinit is more meaningful here.

Yeah, it's just MMIO UART uses init/free, here it is init/deinit.

So I just picked init/exit similar to module_{init,exit} in Linux driver mo=
del
and applied to all existing vUARTs.

Can update all vUARTs to deinit()

>=20
> >
> >  #ifdef CONFIG_IOREQ_SERVER
> >          ioreq_server_destroy_all(d);
> > diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
> > index ad914c915f81..dde25ceff6d0 100644
> > --- a/xen/arch/arm/domctl.c
> > +++ b/xen/arch/arm/domctl.c
> > @@ -14,6 +14,7 @@
> >  #include <xen/mm.h>
> >  #include <xen/sched.h>
> >  #include <xen/types.h>
> > +#include <xen/vuart.h>
> >  #include <xsm/xsm.h>
> >  #include <public/domctl.h>
> >
> > @@ -30,10 +31,11 @@ static int handle_vuart_init(struct domain *d,
> >                               struct xen_domctl_vuart_op *vuart_op)
> >  {
> >      int rc;
> > -    struct vpl011_init_info info;
> > -
> > -    info.console_domid =3D vuart_op->console_domid;
> > -    info.gfn =3D _gfn(vuart_op->gfn);
> > +    struct vuart_params params =3D {
> > +        .console_domid =3D vuart_op->console_domid,
> > +        .gfn =3D _gfn(vuart_op->gfn),
> > +        .evtchn =3D 0,
> > +    };
> >
> >      if ( d->creation_finished )
> >          return -EPERM;
> > @@ -41,10 +43,10 @@ static int handle_vuart_init(struct domain *d,
> >      if ( vuart_op->type !=3D XEN_DOMCTL_VUART_TYPE_VPL011 )
> >          return -EOPNOTSUPP;
> >
> > -    rc =3D domain_vpl011_init(d, &info);
> > +    rc =3D vuart_init(d, &params);
> >
> >      if ( !rc )
> > -        vuart_op->evtchn =3D info.evtchn;
> > +        vuart_op->evtchn =3D params.evtchn;
> >
> >      return rc;
> >  }
> > diff --git a/xen/arch/arm/include/asm/vpl011.h b/xen/arch/arm/include/a=
sm/vpl011.h
> > index be64883b8628..5c308cc8c148 100644
> > --- a/xen/arch/arm/include/asm/vpl011.h
> > +++ b/xen/arch/arm/include/asm/vpl011.h
> > @@ -59,26 +59,6 @@ struct vpl011 {
> >      evtchn_port_t evtchn;
> >  };
> >
> > -struct vpl011_init_info {
> > -    domid_t console_domid;
> > -    gfn_t gfn;
> > -    evtchn_port_t evtchn;
> > -};
> > -
> > -#ifdef CONFIG_HAS_VUART_PL011
> > -int domain_vpl011_init(struct domain *d,
> > -                       struct vpl011_init_info *info);
> > -void domain_vpl011_deinit(struct domain *d);
> > -int vpl011_rx_char_xen(struct domain *d, char c);
> > -#else
> > -static inline int domain_vpl011_init(struct domain *d,
> > -                                     struct vpl011_init_info *info)
> > -{
> > -    return -ENOSYS;
> > -}
> > -
> > -static inline void domain_vpl011_deinit(struct domain *d) { }
> > -#endif
> >  #endif  /* _VPL011_H_ */
> >
> >  /*
> > diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
> > index cafc532cf028..2cf88a70ecdb 100644
> > --- a/xen/arch/arm/vpl011.c
> > +++ b/xen/arch/arm/vpl011.c
> > @@ -134,7 +134,7 @@ static void vpl011_write_data_xen(struct domain *d,=
 uint8_t data)
> >
> >  /*
> >   * vpl011_read_data_xen reads data when the backend is xen. Characters
> > - * are added to the vpl011 receive buffer by vpl011_rx_char_xen.
> > + * are added to the vpl011 receive buffer by vuart_putchar.
> >   */
> >  static uint8_t vpl011_read_data_xen(struct domain *d)
> >  {
> > @@ -571,9 +571,9 @@ static void vpl011_data_avail(struct domain *d,
> >  }
> >
> >  /*
> > - * vpl011_rx_char_xen adds a char to a domain's vpl011 receive buffer.
> > + * vuart_putchar adds a char to a domain's vpl011 receive buffer.
> >   */
> > -int vpl011_rx_char_xen(struct domain *d, char c)
> > +int vuart_putchar(struct domain *d, char c)
> How can putchar refer to RX? By definition putchar() is used to print dat=
a to
> STDOUT. Here we receive a character and put it in the RX FIFO.

That's confusing, I agree; I think this is a leftover from the earlier vUAR=
T
series.

Will update, thanks!

>=20
> ~Michal
>=20
>=20


