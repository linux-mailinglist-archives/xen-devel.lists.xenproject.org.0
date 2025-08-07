Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F25FFB1DD64
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 21:12:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073668.1436545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk62C-0005zJ-7g; Thu, 07 Aug 2025 19:12:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073668.1436545; Thu, 07 Aug 2025 19:12:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk62C-0005xs-4y; Thu, 07 Aug 2025 19:12:16 +0000
Received: by outflank-mailman (input) for mailman id 1073668;
 Thu, 07 Aug 2025 19:12:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ybbA=2T=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uk629-0005xg-Tc
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 19:12:14 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b42da76-73c2-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 21:12:11 +0200 (CEST)
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
X-Inumbo-ID: 6b42da76-73c2-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1754593928; x=1754853128;
	bh=CfGH4U++VyHQzycl2NYSaCJI7Pl5Tfs/2kRNN199kbs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=NKBzma8JZjNdyFzcusjgv96Hqx4CuT/6RjccwvLiAlivG7ZEh8OpKJg9tv1XH99nI
	 VhHu9mSriOBzwVoRxZ6enZU62MtUx2diPqhqzj6jREb52WjDQcoNH7HX2Ex8Oo/usj
	 KF6dcttlUH1ovqoVKlMChMHeTdmutZwITvyrzdlwHxgSb3H57STyUBBW7f80BxfEsO
	 nMQGZbnVeWgrsVPolADH/ia5t/ItrDwZHYNJMwHT8YPMazdS3pKuuL0AFCyhCeSm/C
	 PETYDAqO5icxLIGpVvH/S6x7DG/BmZLU7dUkMSu80MM72y/M7WmVx3MeF+8kfss5h5
	 ZssQaK8j8S8rw==
Date: Thu, 07 Aug 2025 19:12:04 +0000
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v4 2/8] emul/vuart: introduce framework for UART emulators
Message-ID: <aJT6fwpNpDuZpR3o@kraken>
In-Reply-To: <aJNltFHxLtCq4qio@macbook.local>
References: <20250731192130.3948419-1-dmukhin@ford.com> <20250731192130.3948419-3-dmukhin@ford.com> <aJNltFHxLtCq4qio@macbook.local>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: e1743175ef3ffd52514c65f05e020c4385426647
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 06, 2025 at 04:24:52PM +0200, Roger Pau Monn=C3=A9 wrote:
> On Thu, Jul 31, 2025 at 07:21:49PM +0000, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Introduce a driver framework to abstract UART emulators in the hypervis=
or.
> >
> > That allows for architecture-independent handling of virtual UARTs in t=
he
> > console driver and simplifies enabling new UART emulators.
> >
> > The framework is built under CONFIG_HAS_VUART, which will be automatica=
lly
> > enabled once the user enables any UART emulator.
> >
> > Current implementation supports maximum of one vUART of each kind per d=
omain.
> >
> > Use new domain_has_vuart() in the console driver code to check whether =
to
> > forward console input to the domain using vUART.
> >
> > Note: existing vUARTs are deliberately *not* hooked to the new framewor=
k to
> > minimize the scope of the patch: vpl011 (i.e. SBSA) emulator and "vuart=
" (i.e.
> > minimalistic MMIO-mapped dtuart for hwdoms on Arm) are kept unmodified.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Changes since v3:
> > - new patch
> > - original patch from ML: https://lore.kernel.org/xen-devel/20250624035=
443.344099-16-dmukhin@ford.com/
> > ---
> >  xen/arch/arm/xen.lds.S         |   1 +
> >  xen/arch/ppc/xen.lds.S         |   1 +
> >  xen/arch/riscv/xen.lds.S       |   1 +
> >  xen/arch/x86/xen.lds.S         |   1 +
> >  xen/common/Kconfig             |   2 +
> >  xen/common/Makefile            |   1 +
> >  xen/common/emul/Kconfig        |   6 ++
> >  xen/common/emul/Makefile       |   1 +
> >  xen/common/emul/vuart/Kconfig  |   6 ++
> >  xen/common/emul/vuart/Makefile |   1 +
> >  xen/common/emul/vuart/vuart.c  | 112 +++++++++++++++++++++++++++++++++
> >  xen/common/keyhandler.c        |   3 +
> >  xen/drivers/char/console.c     |   4 ++
> >  xen/include/xen/vuart.h        |  84 +++++++++++++++++++++++++
> >  xen/include/xen/xen.lds.h      |  10 +++
> >  15 files changed, 234 insertions(+)
> >  create mode 100644 xen/common/emul/Kconfig
> >  create mode 100644 xen/common/emul/Makefile
> >  create mode 100644 xen/common/emul/vuart/Kconfig
> >  create mode 100644 xen/common/emul/vuart/Makefile
> >  create mode 100644 xen/common/emul/vuart/vuart.c
> >  create mode 100644 xen/include/xen/vuart.h
> >
> > diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> > index 9f30c3a13ed1..bdba7eaa4f65 100644
> > --- a/xen/arch/arm/xen.lds.S
> > +++ b/xen/arch/arm/xen.lds.S
> > @@ -58,6 +58,7 @@ SECTIONS
> >         *(.rodata)
> >         *(.rodata.*)
> >         VPCI_ARRAY
> > +       VUART_ARRAY
> >         *(.data.rel.ro)
> >         *(.data.rel.ro.*)
> >
> > diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
> > index 1de0b77fc6b9..f9d4e5b0dcd8 100644
> > --- a/xen/arch/ppc/xen.lds.S
> > +++ b/xen/arch/ppc/xen.lds.S
> > @@ -52,6 +52,7 @@ SECTIONS
> >          *(.rodata)
> >          *(.rodata.*)
> >          VPCI_ARRAY
> > +        VUART_ARRAY
> >          *(.data.rel.ro)
> >          *(.data.rel.ro.*)
> >
> > diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
> > index edcadff90bfe..59dcaa5fef9a 100644
> > --- a/xen/arch/riscv/xen.lds.S
> > +++ b/xen/arch/riscv/xen.lds.S
> > @@ -47,6 +47,7 @@ SECTIONS
> >          *(.rodata)
> >          *(.rodata.*)
> >          VPCI_ARRAY
> > +        VUART_ARRAY
> >          *(.data.rel.ro)
> >          *(.data.rel.ro.*)
> >
> > diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
> > index 8e9cac75b09e..43426df33092 100644
> > --- a/xen/arch/x86/xen.lds.S
> > +++ b/xen/arch/x86/xen.lds.S
> > @@ -136,6 +136,7 @@ SECTIONS
> >         *(.rodata)
> >         *(.rodata.*)
> >         VPCI_ARRAY
> > +       VUART_ARRAY
> >         *(.data.rel.ro)
> >         *(.data.rel.ro.*)
> >
> > diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> > index 16936418a6e6..4e0bd524dc43 100644
> > --- a/xen/common/Kconfig
> > +++ b/xen/common/Kconfig
> > @@ -1,6 +1,8 @@
> >
> >  menu "Common Features"
> >
> > +source "common/emul/Kconfig"
> > +
> >  config COMPAT
> >  =09bool
> >  =09help
> > diff --git a/xen/common/Makefile b/xen/common/Makefile
> > index c316957fcb36..c0734480ee4b 100644
> > --- a/xen/common/Makefile
> > +++ b/xen/common/Makefile
> > @@ -11,6 +11,7 @@ obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) +=3D d=
evice.o
> >  obj-$(CONFIG_DEVICE_TREE_PARSE) +=3D device-tree/
> >  obj-$(CONFIG_IOREQ_SERVER) +=3D dm.o
> >  obj-y +=3D domain.o
> > +obj-y +=3D emul/
> >  obj-y +=3D event_2l.o
> >  obj-y +=3D event_channel.o
> >  obj-$(CONFIG_EVTCHN_FIFO) +=3D event_fifo.o
> > diff --git a/xen/common/emul/Kconfig b/xen/common/emul/Kconfig
> > new file mode 100644
> > index 000000000000..7c6764d1756b
> > --- /dev/null
> > +++ b/xen/common/emul/Kconfig
> > @@ -0,0 +1,6 @@
> > +menu "Domain Emulation Features"
> > +=09visible if EXPERT
> > +
> > +source "common/emul/vuart/Kconfig"
> > +
> > +endmenu
> > diff --git a/xen/common/emul/Makefile b/xen/common/emul/Makefile
> > new file mode 100644
> > index 000000000000..670682102c13
> > --- /dev/null
> > +++ b/xen/common/emul/Makefile
> > @@ -0,0 +1 @@
> > +obj-$(CONFIG_HAS_VUART) +=3D vuart/
> > diff --git a/xen/common/emul/vuart/Kconfig b/xen/common/emul/vuart/Kcon=
fig
> > new file mode 100644
> > index 000000000000..02f7dd6dc1a1
> > --- /dev/null
> > +++ b/xen/common/emul/vuart/Kconfig
> > @@ -0,0 +1,6 @@
> > +config HAS_VUART
> > +=09bool
> > +
> > +menu "UART Emulation"
> > +
> > +endmenu
> > diff --git a/xen/common/emul/vuart/Makefile b/xen/common/emul/vuart/Mak=
efile
> > new file mode 100644
> > index 000000000000..c6400b001e85
> > --- /dev/null
> > +++ b/xen/common/emul/vuart/Makefile
> > @@ -0,0 +1 @@
> > +obj-$(CONFIG_HAS_VUART) +=3D vuart.o
> > diff --git a/xen/common/emul/vuart/vuart.c b/xen/common/emul/vuart/vuar=
t.c
> > new file mode 100644
> > index 000000000000..14a7f8bd8b79
> > --- /dev/null
> > +++ b/xen/common/emul/vuart/vuart.c
> > @@ -0,0 +1,112 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * UART emulator framework.
> > + *
> > + * Copyright 2025 Ford Motor Company
> > + */
> > +
> > +#include <xen/errno.h>
> > +#include <xen/sched.h>
> > +#include <xen/vuart.h>
> > +
> > +#define VUART_ARRAY_SIZE    (__start_vuart_end - __start_vuart_array)
> > +
> > +#define for_each_vuart(vdev) \
> > +    for (unsigned __i =3D 0; \
> > +         __i < VUART_ARRAY_SIZE && (vdev =3D __start_vuart_array[__i],=
 1); \
> > +         __i++)
>=20
> Could you possibly do:
>=20
> #define for_each_vuart(vdev) \
>     for ( vdev =3D __start_vuart_array; vdev < __start_vuart_end: vdev++ =
)
>=20
> To avoid the extra __i variable in the inner scope?
>=20
> > +
> > +extern const struct vuart_ops *const __start_vuart_array[];
> > +extern const struct vuart_ops *const __start_vuart_end[];
>=20
> Naming here looks weird, why not __vuart_{start,end}?  Or
> __{start,end}_vuart_array.

I overlooked that, thanks.

>=20
> > +
> > +int vuart_add_node(struct domain *d, const void *node)
>=20
> What's the purpose of this function?  There's no comment here or in
> the declaration to figure out what's the purpose.  It's also not being
> called, which makes it unreachable code.  MISRA will likely complain
> about it?

That supposed to ge a hook to generate virtual firmware description for the
guest OS. On Arm/RISC-V that would be DT, on x86 that would be DSDT record =
in
guest's ACPI.

Stefano already asked to drop that until it is actually used, like for Arm'=
s
vUARTs.

Will remove in v5.

>=20
> > +{
> > +    const struct vuart_ops *vdev;
> > +    int rc;
> > +
> > +    for_each_vuart(vdev)
> > +    {
> > +        if ( !vdev->add_node )
> > +            continue;
> > +
> > +        rc =3D vdev->add_node(d, node);
> > +        if ( rc )
> > +            return rc;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +int vuart_init(struct domain *d, struct vuart_params *params)
> > +{
> > +    const struct vuart_ops *vdev;
> > +    int rc;
> > +
> > +    if ( !domain_has_vuart(d) )
> > +        return 0;
>=20
> Don't you need the domain_has_vuart() checks in all the handlers?
> Otherwise you are pointlessly iterating and calling handlers that
> won't do anything?

All handlers should check for vuart handler (per-vUART data structure)
not being NULL. Will update that code in v5.

>=20
> > +
> > +    for_each_vuart(vdev)
> > +    {
> > +        rc =3D vdev->init(d, params);
> > +        if ( rc )
> > +            return rc;
> > +    }
> > +
> > +    d->console.input_allowed =3D true;
> > +
> > +    return 0;
> > +}
> > +
> > +/*
> > + * Release any resources taken by UART emulators.
> > + *
> > + * NB: no flags are cleared, since currently exit() is called only dur=
ing
> > + * domain destroy.
> > + */
> > +void vuart_deinit(struct domain *d)
> > +{
> > +    const struct vuart_ops *vdev;
> > +
> > +    for_each_vuart(vdev)
> > +        vdev->deinit(d);
> > +}
> > +
> > +void vuart_dump_state(const struct domain *d)
> > +{
> > +    const struct vuart_ops *vdev;
> > +
> > +    for_each_vuart(vdev)
> > +        vdev->dump_state(d);
> > +}
> > +
> > +/*
> > + * Put character to the first suitable emulated UART's FIFO.
> > + */
> > +int vuart_put_rx(struct domain *d, char c)
> > +{
> > +    const struct vuart_ops *vdev =3D NULL;
> > +
> > +    ASSERT(domain_has_vuart(d));
> > +
> > +    for_each_vuart(vdev)
> > +        if ( vdev->put_rx )
> > +            break;
> > +
> > +    return vdev ? vdev->put_rx(d, c) : -ENODEV;
>=20
> The above functions seems to be designed to deal with multiple vUARTs
> in-use by the same domain, while the put_rx code gives up as soon as
> it finds an implementation that has the ->put_rx() hook set.

Correct, that is to account for hwdom vUART (or just "vuart" on Arm) which =
by
design has no RX buffer/register emulation.

>=20
> > +}
> > +
> > +bool domain_has_vuart(const struct domain *d)
> > +{
> > +    uint32_t mask =3D 0;
> > +
> > +    return !!(d->emulation_flags & mask);
> > +}
> > +
> > +/*
> > + * Local variables:
> > + * mode: C
> > + * c-file-style: "BSD"
> > + * c-basic-offset: 4
> > + * indent-tabs-mode: nil
> > + * End:
> > + */
> > diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
> > index eccd97c565c6..af427d25dc0d 100644
> > --- a/xen/common/keyhandler.c
> > +++ b/xen/common/keyhandler.c
> > @@ -22,6 +22,7 @@
> >  #include <xen/mm.h>
> >  #include <xen/watchdog.h>
> >  #include <xen/init.h>
> > +#include <xen/vuart.h>
> >  #include <asm/div64.h>
> >
> >  static unsigned char keypress_key;
> > @@ -354,6 +355,8 @@ static void cf_check dump_domains(unsigned char key=
)
> >                             v->periodic_period / 1000000);
> >              }
> >          }
> > +
> > +        vuart_dump_state(d);
> >      }
> >
> >      for_each_domain ( d )
> > diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> > index 963c7b043cd8..93254979817b 100644
> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -33,6 +33,7 @@
> >  #include <asm/setup.h>
> >  #include <xen/sections.h>
> >  #include <xen/consoled.h>
> > +#include <xen/vuart.h>
> >
> >  #ifdef CONFIG_X86
> >  #include <asm/guest.h>
> > @@ -601,6 +602,7 @@ static void __serial_rx(char c)
> >          /*
> >           * Deliver input to the hardware domain buffer, unless it is
> >           * already full.
> > +         * NB: must be the first check: hardware domain may have emula=
ted UART.
> >           */
> >          if ( (serial_rx_prod - serial_rx_cons) !=3D SERIAL_RX_SIZE )
> >              serial_rx_ring[SERIAL_RX_MASK(serial_rx_prod++)] =3D c;
> > @@ -611,6 +613,8 @@ static void __serial_rx(char c)
> >           */
> >          send_global_virq(VIRQ_CONSOLE);
> >      }
> > +    else if ( domain_has_vuart(d) )
> > +        rc =3D vuart_put_rx(d, c);
> >  #ifdef CONFIG_SBSA_VUART_CONSOLE
> >      else
> >          /* Deliver input to the emulated UART. */
> > diff --git a/xen/include/xen/vuart.h b/xen/include/xen/vuart.h
> > new file mode 100644
> > index 000000000000..e843026df4b1
> > --- /dev/null
> > +++ b/xen/include/xen/vuart.h
> > @@ -0,0 +1,84 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * UART emulator framework.
> > + *
> > + * Copyright 2025 Ford Motor Company
> > + */
> > +
> > +#ifndef XEN_VUART_H
> > +#define XEN_VUART_H
> > +
> > +#include <public/xen.h>
> > +#include <public/event_channel.h>
> > +#include <xen/types.h>
> > +
> > +struct vuart_params {
> > +    domid_t console_domid;
> > +    gfn_t gfn;
> > +    evtchn_port_t evtchn;
>=20
> I think this should be empty initially, as there's no implementation
> that uses the hooks it's completely opaque to me what should be placed
> in vuart_params.

Good point, will do.

>=20
> > +};
> > +
> > +struct vuart_ops {
> > +    int (*add_node)(struct domain *d, const void *node);
> > +    int (*init)(struct domain *d, struct vuart_params *params);
> > +    void (*deinit)(struct domain *d);
> > +    void (*dump_state)(const struct domain *d);
> > +    int (*put_rx)(struct domain *d, char c);
>=20
> We haven't been very good at this, but ideally hooks should be
> documented as to which task they are expected to perform, so that
> future implementations have some initial help in understanding how
> this is supposed to work.

Agreed.

>=20
> > +};
> > +
> > +#define VUART_REGISTER(name, x) \
> > +    static const struct vuart_ops *const __name##_entry \
> > +        __used_section(".data.vuart." #name) =3D (x);
>=20
> For vPCI we are moving this to a different section, I think you want
> to use ".data.rel.ro.vuart" here.

Ack.

>=20
> Thanks, Roger.


