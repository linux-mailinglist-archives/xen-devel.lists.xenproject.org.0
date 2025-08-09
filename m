Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F36B1F5F1
	for <lists+xen-devel@lfdr.de>; Sat,  9 Aug 2025 20:56:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1076217.1437904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukojQ-0007wq-Dk; Sat, 09 Aug 2025 18:55:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1076217.1437904; Sat, 09 Aug 2025 18:55:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukojQ-0007v8-Aj; Sat, 09 Aug 2025 18:55:52 +0000
Received: by outflank-mailman (input) for mailman id 1076217;
 Sat, 09 Aug 2025 18:55:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gHj1=2V=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ukojP-0007v2-8W
 for xen-devel@lists.xenproject.org; Sat, 09 Aug 2025 18:55:51 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74a1ca3e-7552-11f0-b898-0df219b8e170;
 Sat, 09 Aug 2025 20:55:45 +0200 (CEST)
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
X-Inumbo-ID: 74a1ca3e-7552-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1754765744; x=1755024944;
	bh=V0dPOPPGKZioYBhiypfxDr+zGniz/rls6nMEBhUeJK0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=NZ9i7Nik2NDWTh0lPHQyeKFRPMRv4EapJMUmW5cRcWd7X7SKEvgLxLEw4j2eXbjl7
	 /dQ+jZdQNaxecZC+9YhOHypMeOmIfS8sdYIvFRCyXTnv+vlrMnDu0tefGBo7D4SLQf
	 kVAMHLkM/F9gtOavAZ8UdnJ4s1uZtIKPdw/T5+uoJz0sBe0voqQToSh/kMUEVKRAbb
	 0nID0J8zXLnUP5L8VrARimzDy4xC0EytWmWPVZQmnFZupAABmTGL51+TRL7g62Y+to
	 wOGlR3C1QXidGu++vUbZpdzoXRyM1kl486tq0ylY6htZJFK6L0RQG9bI9ulJ8M7u4i
	 LOcX/nuIs3Zvg==
Date: Sat, 09 Aug 2025 18:55:39 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 2/8] emul/vuart: introduce framework for UART emulators
Message-ID: <aJeZpiM35gOtB+4Z@starscream>
In-Reply-To: <a416cc08-5970-433a-8015-5d2aa961a000@suse.com>
References: <20250731192130.3948419-1-dmukhin@ford.com> <20250731192130.3948419-3-dmukhin@ford.com> <a416cc08-5970-433a-8015-5d2aa961a000@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 91913e1add216a34988391efbfb1d45c74a31d02
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 04, 2025 at 12:11:03PM +0200, Jan Beulich wrote:
> On 31.07.2025 21:21, dmkhn@proton.me wrote:
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
>=20
> Yet then still - why "HAS"? Call it just VUART or VUART_FRAMEWORK or some=
 such.
>=20
> > --- a/xen/common/Kconfig
> > +++ b/xen/common/Kconfig
> > @@ -1,6 +1,8 @@
> >
> >  menu "Common Features"
> >
> > +source "common/emul/Kconfig"
> > +
> >  config COMPAT
>=20
> Why at the very top?

I did not find a better place, since the settings are not sorted and to me =
it
makes sense to list emulation capabilities first...

Where would be the best location for that submenu?
Close to another submenu `source "common/sched/Kconfig"`?

>=20
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
>=20
> With this you can ...
>=20
> > --- /dev/null
> > +++ b/xen/common/emul/vuart/Makefile
> > @@ -0,0 +1 @@
> > +obj-$(CONFIG_HAS_VUART) +=3D vuart.o
>=20
> ... use the simpler obj-y here.

Thanks.

>=20
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
> Nit: Xen style please. Any preferably no leading underscores; in no case
> two of them.

Ack.

>=20
> > +extern const struct vuart_ops *const __start_vuart_array[];
> > +extern const struct vuart_ops *const __start_vuart_end[];
>=20
> Is there an actual need for this extra level of indirection? It is in the
> process of being done away with for vPCI.

Ack.

>=20
> > +int vuart_add_node(struct domain *d, const void *node)
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
>=20
> Here and below - shouldn't you call hooks only when the kind of driver is
> actually enabled for the domkain in question?

Thanks; this looks a bit raw...

I will rework that in the follow on change. I will drop vuart_add_node()
from NS16550 series since it is not used yet.

>=20
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
> > +
> > +    for_each_vuart(vdev)
> > +    {
> > +        rc =3D vdev->init(d, params);
> > +        if ( rc )
> > +            return rc;
> > +    }
> > +
> > +    d->console.input_allowed =3D true;
>=20
> Unconditionally?

Thanks.
That should be a least under rc =3D=3D 0.

>=20
> > +void vuart_deinit(struct domain *d)
> > +{
> > +    const struct vuart_ops *vdev;
> > +
> > +    for_each_vuart(vdev)
> > +        vdev->deinit(d);
> > +}
>=20
> I can perhaps see why this hook wants to uniformly be set, but ...
>=20
> > +void vuart_dump_state(const struct domain *d)
> > +{
> > +    const struct vuart_ops *vdev;
> > +
> > +    for_each_vuart(vdev)
> > +        vdev->dump_state(d);
> > +}
>=20
> ... state dumping pretty surely wants to be optional?

Ack.

>=20
> > +/*
> > + * Put character to the first suitable emulated UART's FIFO.
> > + */
>=20
> What's "suitable"? Along the lines of the earlier remark, what if the dom=
ain
> has vUART kind A configured, ...

"suitable" is meant to be the first emulator with put_rx !=3D NULL.
I will update that.

>=20
> > +int vuart_put_rx(struct domain *d, char c)
> > +{
> > +    const struct vuart_ops *vdev =3D NULL;
> > +
> > +    ASSERT(domain_has_vuart(d));
> > +
> > +    for_each_vuart(vdev)
> > +        if ( vdev->put_rx )
>=20
> ... but only kind B offers this hook?
>=20
> > +            break;
> > +
> > +    return vdev ? vdev->put_rx(d, c) : -ENODEV;
>=20
> The check for NULL helps for the "no vUART drivers" case, but it won't
> help if you exhausted the array without finding a driver with the wanted
> hook.

Ack.

>=20
> > +}
> > +
> > +bool domain_has_vuart(const struct domain *d)
> > +{
> > +    uint32_t mask =3D 0;
>=20
> unsigned int?

Ack.

>=20
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
>=20
> How verbose is this going to get?

Looks something like this:
```
(XEN) [   88.334893] 'q' pressed -> dumping domain info (now =3D 8833482830=
3)
[..]
(XEN) [   88.335673] Virtual ns16550 (COM2) I/O port 0x02f8 IRQ#3 owner d0
(XEN) [   88.335681]   RX FIFO size 1024 in_prod 258 in_cons 258 used 0
(XEN) [   88.335689]   TX FIFO size 2048 out_prod 15 out_cons 0 used 15
(XEN) [   88.335696]   00 RBR 02 THR 6f DLL 01 DLM 00
(XEN) [   88.335703]   01 IER 05
(XEN) [   88.335709]   02 FCR 81 IIR c1
(XEN) [   88.335715]   03 LCR 13
(XEN) [   88.335720]   04 MCR 0b
(XEN) [   88.335726]   05 LSR 60
(XEN) [   88.335731]   06 MSR b0
(XEN) [   88.335736]   07 SCR 00

```

>=20
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
>=20
> The order is wrong - types must be available before public headers are in=
cluded.

Ack.

>=20
> > +struct vuart_params {
> > +    domid_t console_domid;
> > +    gfn_t gfn;
> > +    evtchn_port_t evtchn;
> > +};
> > +
> > +struct vuart_ops {
> > +    int (*add_node)(struct domain *d, const void *node);
> > +    int (*init)(struct domain *d, struct vuart_params *params);
> > +    void (*deinit)(struct domain *d);
> > +    void (*dump_state)(const struct domain *d);
> > +    int (*put_rx)(struct domain *d, char c);
> > +};
> > +
> > +#define VUART_REGISTER(name, x) \
> > +    static const struct vuart_ops *const __name##_entry \
> > +        __used_section(".data.vuart." #name) =3D (x);
> > +
> > +#ifdef CONFIG_HAS_VUART
> > +
> > +int vuart_add_node(struct domain *d, const void *node);
> > +int vuart_init(struct domain *d, struct vuart_params *params);
> > +void vuart_deinit(struct domain *d);
> > +void vuart_dump_state(const struct domain *d);
> > +int vuart_put_rx(struct domain *d, char c);
> > +bool domain_has_vuart(const struct domain *d);
> > +
> > +#else
> > +
> > +static inline int vuart_add_node(struct domain *d, const void *node)
> > +{
> > +    return 0;
> > +}
> > +
> > +static inline int vuart_init(struct domain *d, struct vuart_params *pa=
rams)
> > +{
> > +    return 0;
> > +}
> > +
> > +static inline void vuart_deinit(struct domain *d)
> > +{
> > +}
> > +
> > +static inline void vuart_dump_state(const struct domain *d)
> > +{
> > +}
> > +
> > +static inline int vuart_put_rx(struct domain *d, char c)
> > +{
> > +    ASSERT_UNREACHABLE();
> > +    return -ENODEV;
> > +}
> > +
> > +static inline bool domain_has_vuart(const struct domain *d)
> > +{
> > +    return false;
> > +}
>=20
> With this, some of the other stubs should not be necessary. Declarations
> will suffice, e.g. for vuart_put_rx().

Thanks, will update.

>=20
> > --- a/xen/include/xen/xen.lds.h
> > +++ b/xen/include/xen/xen.lds.h
> > @@ -194,4 +194,14 @@
> >  #define VPCI_ARRAY
> >  #endif
> >
> > +#ifdef CONFIG_HAS_VUART
> > +#define VUART_ARRAY     \
> > +       . =3D ALIGN(POINTER_ALIGN); \
> > +       __start_vuart_array =3D .;  \
> > +       *(SORT(.data.vuart.*))    \
>=20
> This is r/o data afaict, so would want naming .rodata.vuart.*. Which in
> turn means the uses of the macros need to move up in the linker scripts.

Ack.

>=20
> Jan
>=20


