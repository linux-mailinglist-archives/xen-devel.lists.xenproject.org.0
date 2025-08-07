Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A377B1DD36
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 20:50:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073621.1436505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5gJ-0005xq-PJ; Thu, 07 Aug 2025 18:49:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073621.1436505; Thu, 07 Aug 2025 18:49:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5gJ-0005wO-MH; Thu, 07 Aug 2025 18:49:39 +0000
Received: by outflank-mailman (input) for mailman id 1073621;
 Thu, 07 Aug 2025 18:49:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ybbA=2T=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uk5gI-0005wI-09
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 18:49:38 +0000
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch
 [79.135.106.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 431e3f7f-73bf-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 20:49:35 +0200 (CEST)
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
X-Inumbo-ID: 431e3f7f-73bf-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=fbqvfxsjfbbdfh3vmn7i2fdw5a.protonmail; t=1754592572; x=1754851772;
	bh=uP79nJUPMZvjz+y6rF/Ogp5wiZ2MFlwz5FUaKnU40Ys=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Wrxqq5Gi1lhbccHjXfkmJtjPBXn9ayqKkPeS+jZV7phcwIDUwhjBlmvKZ48J3PIad
	 8GJadstYXArUHi5J8jE3rxsovmOzt39UM6XyqkDqm/1G7XRqxgplUKg2XOhq9Bb2Ot
	 4Pnh+7S1kt6wEBS4+RE0DcBmIN2wZZqRnSYgmaQlsOVCtYg5HPGV3ZsglcTs+p5p1a
	 35EISxQC/lO+c7dDZI/XlzSLx15I10/6DIOP5fT92J1RSXDDgAOVMeiBXsOYA+X92u
	 zG3eEKwqDenQbmqenznCSeGcdIkqi9gYCsw4VU/+DNUbjXJe7usZ/5Axq50yCdWPL4
	 v53qSGdRTByeQ==
Date: Thu, 07 Aug 2025 18:49:28 +0000
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v4 5/8] emul/vuart-ns16550: introduce NS16550-compatible UART emulator (x86)
Message-ID: <aJT1M6wHFEXp25w1@kraken>
In-Reply-To: <aJNvcLgsUOahsQZl@macbook.local>
References: <20250731192130.3948419-1-dmukhin@ford.com> <20250731192130.3948419-6-dmukhin@ford.com> <aJNvcLgsUOahsQZl@macbook.local>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 9d1546b44189c93768678115b91a4512e9deefee
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 06, 2025 at 05:06:24PM +0200, Roger Pau Monn=C3=A9 wrote:
[..]
> > @@ -0,0 +1,1009 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * NS16550-compatible UART Emulator.
> > + *
> > + * See:
> > + * - Serial and UART Tutorial:
> > + *     https://download.freebsd.org/doc/en/articles/serial-uart/serial=
-uart_en.pdf
> > + * - UART w/ 16 byte FIFO:
> > + *     https://www.ti.com/lit/ds/symlink/tl16c550c.pdf
> > + * - UART w/ 64 byte FIFO:
> > + *     https://www.ti.com/lit/ds/symlink/tl16c750.pdf
> > + *
> > + * Limitations:
> > + * - Only x86;
> > + * - Only HVM domains support (build-time), PVH domains are not suppor=
ted yet;
> > + * - Only legacy COM{1,2,3,4} resources via Kconfig, custom I/O ports/=
IRQs
> > + *   are not supported;
> > + * - Only Xen console as a backend, no inter-domain communication (sim=
ilar to
> > + *   vpl011 on Arm);
> > + * - Only 8n1 emulation (8-bit data, no parity, 1 stop bit);
> > + * - No toolstack integration;
> > + * - No baud rate emulation (reports 115200 baud to the guest OS);
> > + * - No FIFO-less mode emulation;
> > + * - No RX FIFO interrupt moderation (FCR) emulation;
> > + * - No integration w/ VM snapshotting (HVM_REGISTER_SAVE_RESTORE() an=
d
> > + *   friends);
> > + * - No ISA IRQ sharing allowed;
> > + * - No MMIO-based UART emulation.
>=20
> Listing the limitations here might not be the beast approach, this is
> likely to get out of sync as it's too far away from the code
> implementation.
>=20
> If anything those comments want to be closer together to where the
> feature would otherwise be implemented.

I wanted to have some rough overview of the emulation capabilities in one
place so it is easy to get a grasp of how emulator can be used.

But I agree that can get out of hand if not maintained; I plan to maintain
that code.

>=20
> > + */
> > +
> > +#define pr_prefix               "ns16550"
> > +#define pr_fmt(fmt)             pr_prefix ": " fmt
> > +#define pr_log_level            CONFIG_VUART_NS16550_LOG_LEVEL
> > +
> > +#include <xen/8250-uart.h>
> > +#include <xen/console.h>
> > +#include <xen/iocap.h>
> > +#include <xen/ioreq.h>
> > +#include <xen/resource.h>
> > +#include <xen/vuart.h>
> > +#include <xen/xvmalloc.h>
> > +
> > +#include <public/io/console.h>
> > +
> > +#define pr_err(fmt, args...) do { \
> > +    gprintk(KERN_ERR, pr_fmt(fmt), ## args); \
> > +} while (0)
> > +
> > +#define pr_warn(fmt, args...) do { \
> > +    if ( pr_log_level >=3D 1) \
> > +        gprintk(KERN_WARNING, pr_fmt(fmt), ## args); \
> > +} while (0)
> > +
> > +#define pr_info(fmt, args...) do { \
> > +    if ( pr_log_level >=3D 2 ) \
> > +        gprintk(KERN_INFO, pr_fmt(fmt), ## args); \
> > +} while (0)
> > +
> > +#define pr_debug(fmt, args...) do { \
> > +    if ( pr_log_level >=3D 3 ) \
> > +        gprintk(KERN_DEBUG, pr_fmt(fmt), ## args); \
> > +} while (0)
>=20
> We would use the pr_* set of logging functions for code imported from
> Linux, but for Xen code we would directly use the gprintk() functions
> rather than wrap them as you do.

Oh, I see, pr_ is a "reserved namespace".

I will rename these to ns16550_ since those are extremely helpful for
debugging.

>=20
> > +
> > +#if defined(CONFIG_VUART_NS16550_PC_COM1)
> > +#define X86_PC_UART_IDX         0
> > +#elif defined(CONFIG_VUART_NS16550_PC_COM2)
> > +#define X86_PC_UART_IDX         1
> > +#elif defined(CONFIG_VUART_NS16550_PC_COM3)
> > +#define X86_PC_UART_IDX         2
> > +#elif defined(CONFIG_VUART_NS16550_PC_COM4)
> > +#define X86_PC_UART_IDX         3
> > +#else
> > +#error "Unsupported I/O port"
> > +#endif
> > +
> > +#ifdef CONFIG_VUART_NS16550_DEBUG
> > +#define guest_prefix            "FROM GUEST "
> > +#else
> > +#define guest_prefix            ""
> > +#endif
> > +
> > +/*
> > + * Number of supported registers in the UART.
> > + */
> > +#define NS16550_REGS_NUM        ( UART_SCR + 1 )
>=20
> Extra spaces around parentheses? (here and below)

Ack.

>=20
> > +
> > +/*
> > + * Number of emulated registers.
> > + *
> > + * - Emulated registers [0..NS16550_REGS_NUM] are R/W registers for DL=
AB=3D0.
> > + * - DLAB=3D1, R/W, DLL            =3D NS16550_REGS_NUM + 0
> > + * - DLAB=3D1, R/W, DLM            =3D NS16550_REGS_NUM + 1
> > + * -         R/O, IIR (IIR_THR)  =3D NS16550_REGS_NUM + 2
> > + */
> > +#define NS16550_EMU_REGS_NUM    ( NS16550_REGS_NUM + 3 )
> > +
> > +/*
> > + * Virtual NS16550 device state.
> > + */
> > +struct vuart_ns16550 {
> > +    struct xencons_interface cons;      /* Emulated RX/TX FIFOs */
> > +    uint8_t regs[NS16550_EMU_REGS_NUM]; /* Emulated registers */
> > +    unsigned int irq;                   /* Emulated IRQ# */
> > +    uint64_t io_addr;                   /* Emulated I/O region base ad=
dress */
> > +    uint64_t io_size;                   /* Emulated I/O region size */
> > +    const char *name;                   /* Device name */
> > +    struct domain *owner;               /* Owner domain */
> > +    spinlock_t lock;                    /* Protection */
> > +};
> > +
> > +/*
> > + * Virtual device description.
> > + */
> > +struct virtdev_desc {
> > +    const char *name;
> > +    const struct resource *res;
> > +};
> > +
> > +/*
> > + * Legacy IBM PC NS16550 resources.
> > + * There are only 4 I/O port ranges, hardcoding all of them here.
> > + */
> > +static const struct virtdev_desc x86_pc_uarts[4] =3D {
> > +    [0] =3D {
>=20
> You don't need the explicit array indexes?

Muscle memory; I will nuke that huge static array in v5.

>=20
> > +        .name =3D "COM1",
> > +        .res =3D (const struct resource[]){
> > +            { .type =3D IORESOURCE_IO,  .addr =3D 0x3f8, .size =3D NS1=
6550_REGS_NUM },
> > +            { .type =3D IORESOURCE_IRQ, .addr =3D 4,     .size =3D 1 }=
,
> > +            { .type =3D IORESOURCE_UNKNOWN },
> > +        },
> > +    },
> > +    [1] =3D {
> > +        .name =3D "COM2",
> > +        .res =3D (const struct resource[]){
> > +            { .type =3D IORESOURCE_IO,  .addr =3D 0x2f8, .size =3D NS1=
6550_REGS_NUM },
> > +            { .type =3D IORESOURCE_IRQ, .addr =3D 3,     .size =3D 1 }=
,
> > +            { .type =3D IORESOURCE_UNKNOWN },
> > +        },
> > +    },
> > +    [2] =3D {
> > +        .name =3D "COM3",
> > +        .res =3D (const struct resource[]){
> > +            { .type =3D IORESOURCE_IO,  .addr =3D 0x3e8, .size =3D NS1=
6550_REGS_NUM },
> > +            { .type =3D IORESOURCE_IRQ, .addr =3D 4,     .size =3D 1 }=
,
> > +            { .type =3D IORESOURCE_UNKNOWN },
> > +        },
> > +    },
> > +    [3] =3D {
> > +        .name =3D "COM4",
> > +        .res =3D (const struct resource[]){
> > +            { .type =3D IORESOURCE_IO,  .addr =3D 0x2e8, .size =3D NS1=
6550_REGS_NUM },
> > +            { .type =3D IORESOURCE_IRQ, .addr =3D 3,     .size =3D 1 }=
,
> > +            { .type =3D IORESOURCE_UNKNOWN },
> > +        },
> > +    },
> > +};
[..]
> > diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arc=
h-x86/xen.h
> > index fc2487986642..f905e1252c70 100644
> > --- a/xen/include/public/arch-x86/xen.h
> > +++ b/xen/include/public/arch-x86/xen.h
> > @@ -283,13 +283,15 @@ struct xen_arch_domainconfig {
> >  #define XEN_X86_EMU_USE_PIRQ        (1U<<_XEN_X86_EMU_USE_PIRQ)
> >  #define _XEN_X86_EMU_VPCI           10
> >  #define XEN_X86_EMU_VPCI            (1U<<_XEN_X86_EMU_VPCI)
> > +#define _XEN_X86_EMU_NS16550        11
> > +#define XEN_X86_EMU_NS16550         (1U<<_XEN_X86_EMU_NS16550)
> >
> >  #define XEN_X86_EMU_ALL             (XEN_X86_EMU_LAPIC | XEN_X86_EMU_H=
PET |  \
> >                                       XEN_X86_EMU_PM | XEN_X86_EMU_RTC =
|      \
> >                                       XEN_X86_EMU_IOAPIC | XEN_X86_EMU_=
PIC |  \
> >                                       XEN_X86_EMU_VGA | XEN_X86_EMU_IOM=
MU |   \
> >                                       XEN_X86_EMU_PIT | XEN_X86_EMU_USE=
_PIRQ |\
> > -                                     XEN_X86_EMU_VPCI)
> > +                                     XEN_X86_EMU_VPCI | XEN_X86_EMU_NS=
16550)
>=20
> libxl also consumes XEN_X86_EMU_ALL, and with the proposed change here
> it will create all HVM domains with XEN_X86_EMU_NS16550, which I don't
> think it's indented?
>=20
> Overall I agree for Jan it would be better if this patch could be
> split into somehow smaller units.  Is this something feasible?  We
> don't want a patch for each register handle, but maybe you cna somehow
> grup those into functional sections, so that patches can be < 250
> lines?
>=20
> Maybe you have already considered this approach and it wasn't
> feasible?

There __were__ pretty comprehensive reviews of this very emulator code
in the past without raising such concern (and this is v4).

Just in case, the most comprehensive review was this one (thanks Roger!):
  https://lore.kernel.org/xen-devel/Z1wd4iAmVzv1ISPZ@macbook.local/


