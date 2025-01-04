Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDAEA0128E
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 06:31:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865386.1276691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTwl7-0004DN-8S; Sat, 04 Jan 2025 05:31:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865386.1276691; Sat, 04 Jan 2025 05:31:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTwl7-0004Bk-5a; Sat, 04 Jan 2025 05:31:37 +0000
Received: by outflank-mailman (input) for mailman id 865386;
 Sat, 04 Jan 2025 05:31:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTwl6-0004Az-0g
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 05:31:36 +0000
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28ead655-ca5d-11ef-99a4-01e77a169b0f;
 Sat, 04 Jan 2025 06:31:34 +0100 (CET)
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
X-Inumbo-ID: 28ead655-ca5d-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1735968692; x=1736227892;
	bh=Y2QpLaztw8EV5eJ5IwUGXHfhnelAt9fPr0RSiVmbtoA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=gvLHYAfZl+PUQ5gStsEjOfsWcclPZ7nMpQI/nFFUvdJvxeDVC33m/dgZkUn14dayQ
	 q6pP/GV816GjcJ2oK/kkU9/j4guMWG/BVJBaolsNIh9jmaYQLYrkJc0i9DFT5QnVPY
	 qVLOJOKoZMzhWPKY8ZfPT2jXeb+cRWCZdszU0cy0HccKFxnJmhIHjTIH13HhiGxs6d
	 9Ui4ipqOa0Bvl+M3W2oeBALpDpEsOFlrXMy7bloCpE2FCYbBIJlZSG4PdIeIXiNEuW
	 Ff4kCy70v0yY+vGSeAEWYx9Jp51GKAxMyB1uxMQ6Fn9MmSAi3FmnPQikd/uodtc6wM
	 mmQNThPDYLXhQ==
Date: Sat, 04 Jan 2025 05:31:26 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 31/35] x86/hvm: introduce NS8250 UART emulator
Message-ID: <DJo9IkTvGXsao_hA4njnkX9OVYVR6tXdo95AeBiT8wGtbPb7UKQjLCqqIset3bJ3JbLqogcIb4wPqNXJ-2GFwyrW_UIvRg5Nt9QhpG0hfyo=@proton.me>
In-Reply-To: <3be247cc-900b-48f3-98f3-0d97532ede76@suse.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-31-e9aa923127eb@ford.com> <3be247cc-900b-48f3-98f3-0d97532ede76@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 0e628c91d7ef6a2ab55ce30b3d720dc93b297c51
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Monday, December 16th, 2024 at 7:04 AM, Jan Beulich <jbeulich@suse.com> =
wrote:

>
>
> On 06.12.2024 05:42, Denis Mukhin via B4 Relay wrote:
>
> > From: Denis Mukhin dmukhin@ford.com
> >
> > Add initial in-hypervisor emulator for NS8250/NS16x50-compatible UARTs =
under
> > CONFIG_HAS_VUART_NS8250.
> >
> > In parallel domain creation scenario (hyperlaunch), NS8520 emulator hel=
ps
> > early guest OS bringup debugging, because it eliminates dependency on t=
he
> > external emulator being operational by the time domains are created. Al=
so,
> > there's no early console facility similar to vpl011 to support x86 gues=
t OS
> > bring up.
> >
> > By default, CONFIG_HAS_VUART_NS8250 enables emulatio of NS8250 at I/O p=
ort
> > 0x3f8, IRQ#4 in guest OS.
> >
> > Limitations:
> > - Only x86;
> > - Only Linux guest tested so far;
> > - Only legacy COM{1,2,3,4} resources, no customization;
> > - Only Xen console as a backend, no inter-domain communication (similar=
 to
> > vpl011 on Arm);
> > - Only 8-bit characters;
> > - Baud rate is not emulated;
> > - FIFO-less mode is not emulated properly;
>
>
> With in particular this, why would it be called 8250 emulation in the fir=
st
> place? The driver Xen uses for itself is in ns16550.c; I'd suggest to cal=
l
> the child here ns16550 emulation right away, using vns16550.c as the file
> name.

NS8250 is the predecessor of NS16550, registers are defined in 8250-uart.h,
hence I used vuart_ns8250.c.

I do not have a strong opinion on this naming. 16550 makes sense because
all UARTs have a FIFO now.

Renamed to vuart-ns16550.c.

>
> > --- a/xen/arch/x86/hvm/Kconfig
> > +++ b/xen/arch/x86/hvm/Kconfig
> > @@ -61,3 +61,17 @@ config HVM_FEP
> > for use in production.
> >
> > If unsure, say N.
> > +
> > +config HAS_VUART_NS8250
> > + bool "NS8250-compatible UART Emulation"
>
>
> HAS_* options may not have prompts; they merely declare something to the
> rest of the build system.

There are examples in the code using HAS_xxx configuration exactly the way
I used it. Specifically, all physical UART drivers are declared under HAS_x=
xx
(drivers/char/Kconfig).

I reworked that part.

>
> > + depends on HVM && HAS_IOPORTS
>
>
> Why HAS_IOPORTS?

It is meant to highlight the fact that MMIO-based UART is not supported.
It is not currently possible to enable the emulator for, say, Arm platforms=
.

>
> > + default n
>
>
> No need for this.

Fixed.

>
> > --- a/xen/arch/x86/hvm/Makefile
> > +++ b/xen/arch/x86/hvm/Makefile
> > @@ -29,3 +29,4 @@ obj-y +=3D vm_event.o
> > obj-y +=3D vmsi.o
> > obj-y +=3D vpic.o
> > obj-y +=3D vpt.o
> > +obj-$(CONFIG_HAS_VUART_NS8250) +=3D vuart_ns8250.o
>
>
> If the vuart name pretix is to remain, then please avoid underscores in
> the names of new files, in favor of dashes.

I've seen such request few times on the mailing list and it seems the
recommendation is not followed all the time in the code base.

It's just all files in xen/arch/x86/hvm have underscores instead of
dashes.

IMO, this rule needs an explicit documentation in the coding style
guide. I'm happy to follow either dash- or underscore-way.

Addressed.

>
> > --- /dev/null
> > +++ b/xen/arch/x86/hvm/vuart_ns8250.c
> > @@ -0,0 +1,886 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only /
> > +/
> > + * NS8250-compatible UART Emulator.
> > + *
> > + * Limitations:
> > + * - Only x86;
> > + * - Only Linux guest tested so far;
> > + * - Only legacy COM{1,2,3,4} resources, no customization;
> > + * - Only Xen console as a backend, no inter-domain communication (sim=
ilar to
> > + * vpl011 on Arm);
> > + * - Only 8-bit characters;
> > + * - Baud rate is not emulated;
> > + * - FIFO-less mode is not emulated properly;
> > + * - RX FIFO interrupt moderation (FCR) is not emulated properly, TL16=
C750
> > + * has special FCR handling;
> > + * - No integration w/ VM snapshotting (HVM_REGISTER_SAVE_RESTORE() an=
d
> > + * friends);
> > + * - Assumes no ISA-device IRQ sharing;
> > + * - MMIO-based UART is not supported;
> > + * - PCI UART is not supported.
> > + /
> > +
> > +#define pr_fmt(fmt) "ns8250: " fmt
> > +#define pr_log_level hvm_ns8250_log_level
> > +
> > +/ Development debugging /
> > +#define NS8250_LOG_LEVEL 0
> > +
> > +#include <xen/types.h>
> > +#include <xen/event.h>
> > +#include <xen/lib.h>
> > +#include <xen/errno.h>
> > +#include <xen/sched.h>
> > +#include <xen/trace.h>
> > +#include <xen/resource.h>
> > +#include <xen/ctype.h>
> > +#include <xen/param.h>
> > +#include <xen/console.h> / console_input_domid() /
> > +#include <asm/setup.h> / max_init_domid */
> > +#include <asm/iocap.h>
> > +#include <asm/hvm/hvm.h>
> > +#include <asm/hvm/io.h>
> > +#include <asm/hvm/vuart_ns8250.h>
> > +
> > +#if !defined(pr_fmt)
> > +#define pr_fmt(fmt) fmt
> > +#endif
> > +
> > +#if !defined(pr_log_level)
> > +#define pr_log_level 0
> > +#endif
> > +
> > +#define pr_err(fmt, args...) \
> > + gprintk(KERN_ERR, pr_fmt(fmt), ## args)
> > +#define pr_warn(fmt, args...) \
> > + if (pr_log_level) gprintk(KERN_WARNING, pr_fmt(fmt), ## args)
> > +#define pr_info(fmt, args...) \
> > + if (pr_log_level) gprintk(KERN_INFO, pr_fmt(fmt), ## args)
> > +#define pr_debug(fmt, args...) \
> > + if (pr_log_level) gprintk(KERN_DEBUG, pr_fmt(fmt), ## args)
>
>
> On top of Roger's remark here: If you use such wrapper macros, then
> please arrange for them to be usable in arbitrary context. Think of
>
> if ( condition )
> pr_info(...);
> else
> ...

Done.

>
> > +/*
> > + * NS8250 emulator state machine logging (development only)
> > + * FIXME: use similar to parse_guest_loglvl()
> > + */
> > +static unsigned int __read_mostly hvm_ns8250_log_level =3D NS8250_LOG_=
LEVEL;
> > +integer_param("hvm.ns8250.log_level", hvm_ns8250_log_level);
>
>
> How can this be a command line option, when there may be many domains
> making use of the in-Xen driver? This and ...

TBH, I did not plan for configuring vUARTs per-domain. In its current shape=
,
the emulator is strictly for debugging purposes and not ready to be enabled
in production setup. Which means global configuration is fine, IMO. But the=
n
I decided that it's trivial to allow selecton of any of x86 legacy UARTs.

Such global configuration was hooked into the command line parsing because
it allows to test xen + dom0 w/o rebuild.

Reworked to Kconfig setting.

>
> > +/*
> > + * Default emulated NS8250 resources.
> > + * If not specified, COM1 (I/O port 0x3f8, IRQ#4) is emulated.
> > + * FIXME: follow Linux'es console=3D syntax or re-use
> > + * ns16550_parse_port_config().
> > + */
> > +static char __read_mostly hvm_ns8250_console[64];
> > +string_param("hvm.ns8250.console", hvm_ns8250_console);
>
>
> ... this need to be per-domain settings; a command line option may be
> applicable to Dom0 alone.
>
> > +/* I/O access mask */
> > +static const uint32_t io_access_mask[] =3D {
> > + [0] =3D 0X00000000U,
> > + [1] =3D 0X000000FFU,
> > + [2] =3D 0X0000FFFFU,
> > + [4] =3D 0XFFFFFFFFU,
> > +};
>
>
> I don't think this is needed; we're doing similar port I/O emulation in
> various other places, without resorting to such arrays.

Dropped.

>
> > +/*
> > + * Legacy IBM PC NS8250 resources.
> > + * There are only 4 I/O port ranges, hardcoding all of them here.
> > + */
> > +static const struct {
> > + const char *name;
> > + const struct resource *res;
> > +} ns8250_x86_legacy_uarts[4] =3D {
> > + [0] =3D {
> > + .name =3D "com1",
> > + .res =3D (const struct resource[]){
> > + { .type =3D IORESOURCE_IO, .addr =3D 0x3F8, .size =3D UART_MAX },
>
>
> Considering this, ...
>
> > +static int ns8250_io_write8(
> > + struct vuart_ns8250 *vdev, uint32_t reg, uint8_t *data)
> > +{
> > + uint8_t val;
> > + int rc =3D 0;
> > +
> > + val =3D data;
> > +
> > + switch ( reg )
> > + {
> > + / DLAB=3D0 /
> > + case UART_THR:
> > + if ( vdev->regs[UART_MCR] & UART_MCR_LOOP )
> > + {
> > + ns8250_fifo_rx_putchar(vdev, val);
> > + vdev->regs[UART_LSR] |=3D UART_LSR_OE;
> > + }
> > + else
> > + ns8250_fifo_tx_putchar(vdev, val);
> > +
> > + vdev->flags |=3D NS8250_IRQ_THRE_PENDING;
> > +
> > + break;
> > +
> > + case UART_IER:
> > + if ( val & vdev->regs[UART_IER] & UART_IER_ETHREI )
> > + vdev->flags |=3D NS8250_IRQ_THRE_PENDING;
> > +
> > + vdev->regs[UART_IER] =3D val & UART_IER_MASK;
> > +
> > + break;
> > +
> > + case UART_FCR: / WO /
> > + if ( val & UART_FCR_CLRX )
> > + ns8250_fifo_rx_reset(vdev);
> > +
> > + if ( val & UART_FCR_CLTX )
> > + ns8250_fifo_tx_reset(vdev);
> > +
> > + if ( !(val & UART_FCR_ENABLE) )
> > + val =3D 0;
> > +
> > + vdev->regs[UART_FCR] =3D val & (UART_FCR_ENABLE |
> > + UART_FCR_DMA |
> > + UART_FCR_TRG_MASK);
> > +
> > + break;
> > +
> > + case UART_LCR:
> > + vdev->regs[UART_LCR] =3D val;
> > + break;
> > +
> > + case UART_MCR: {
> > + uint8_t msr_curr, msr_next, msr_delta;
> > +
> > + msr_curr =3D vdev->regs[UART_MSR];
> > + msr_next =3D 0;
> > + msr_delta =3D 0;
> > +
> > + / Set modem status /
> > + if ( val & UART_MCR_LOOP )
> > + {
> > + if ( val & UART_MCR_DTR )
> > + msr_next |=3D UART_MSR_DSR;
> > + if ( val & UART_MCR_RTS )
> > + msr_next |=3D UART_MSR_CTS;
> > + if ( val & UART_MCR_OUT1 )
> > + msr_next |=3D UART_MSR_RI;
> > + if ( val & UART_MCR_OUT2 )
> > + msr_next |=3D UART_MSR_DCD;
> > + }
> > + else
> > + msr_next |=3D UART_MSR_DCD | UART_MSR_DSR | UART_MSR_CTS;
> > +
> > + / Calculate changes in modem status /
> > + if ( (msr_curr & UART_MSR_CTS) ^ (msr_next & UART_MSR_CTS) )
> > + msr_delta |=3D UART_MSR_DCTS;
> > + if ( (msr_curr & UART_MCR_RTS) ^ (msr_next & UART_MCR_RTS) )
> > + msr_delta |=3D UART_MSR_DDSR;
> > + if ( (msr_curr & UART_MSR_RI) & (msr_next & UART_MSR_RI) )
> > + msr_delta |=3D UART_MSR_TERI;
> > + if ( (msr_curr & UART_MSR_DCD) ^ (msr_next & UART_MSR_DCD) )
> > + msr_delta |=3D UART_MSR_DDCD;
> > +
> > + vdev->regs[UART_MCR] =3D val & UART_MCR_MASK;
> > + vdev->regs[UART_MSR] =3D msr_next | msr_delta;
> > +
> > + break;
> > + }
> > +
> > + case UART_LSR: / RO /
> > + case UART_MSR: / RO /
> > + rc =3D -EINVAL;
> > + break;
> > +
> > + /
> > + * NB: Firmware like OVMF rely on SCR presence to initialize the ns825=
0
> > + * driver.
> > + /
> > + case UART_SCR:
> > + vdev->regs[UART_SCR] =3D val;
> > + break;
> > +
> > + / DLAB=3D1 */
> > + case UART_MAX + UART_DLL:
>
>
> ... how can you go at or past UART_MAX here and ...
>
> > + vdev->dl =3D (vdev->dl & 0xFF00U) | val;
> > + break;
> > +
> > + case UART_MAX + UART_DLM:
>
>
> ... here? I notice a caller up the tree sets things up like this, but thi=
s
> feels pretty fragile. How would one easily spot all producers and consume=
rs
> without also hitting all other uses of UART_MAX?

The idea was to flatten the register address space regardless DLAB.
I also agree with your point: having all register handling stated explicitl=
y
makes the code more understandable.

Reworked.

>
> > +static int cf_check ns8250_io_handle(
> > + int dir, unsigned int addr, unsigned int size, uint32_t *data)
> > +{
> > +#define op(dir) (((dir) =3D=3D IOREQ_WRITE) ? 'W' : 'R')
> > + struct domain *d =3D rcu_lock_current_domain();
> > + struct vuart_ns8250 *vdev =3D &d->arch.hvm.vuart;
> > + uint32_t offset, reg;
> > + int rc;
> > +
> > + spin_lock(&vdev->lock);
> > +
> > + BUG_ON( vdev->owner !=3D d );
> > +
> > + if ( !(vdev->flags & NS8250_READY) )
> > + {
> > + pr_err("%c io 0x%04x %d 0x%08"PRIx32": propagate to external I/O emul=
ator\n",
> > + op(dir), addr, size, *data);
> > + rc =3D X86EMUL_UNHANDLEABLE;
> > + goto out;
> > + }
> > +
> > + reg =3D addr - vdev->io_addr;
> > + BUG_ON( reg >=3D UART_MAX );
> > + if ( reg % size !=3D 0 )
> > + {
> > + pr_err("%c 0x%04x %d 0x%08"PRIx32": unaligned access\n",
> > + op(dir), addr, size, data & io_access_mask[size]);
> > + rc =3D X86EMUL_OKAY;
> > + goto out;
> > + }
> > +
> > + / Redirect access to divisor latch registers */
> > + if ( !!(vdev->regs[UART_LCR] & UART_LCR_DLAB)
> > + && (reg =3D=3D UART_DLL || reg =3D=3D UART_DLM) )
> > + offset =3D UART_MAX + reg;
> > + else
> > + offset =3D reg;
> > +
> > + if ( dir =3D=3D IOREQ_WRITE )
> > + {
> > + pr_debug("%c 0x%04x %d 0x%08"PRIx32" %s[0x%02"PRIx32"]\n",
> > + op(dir), addr, size,
> > + *data & io_access_mask[size],
> > + ns8250_regname(vdev, offset, dir), reg);
> > + rc =3D ns8250_io_write(vdev, offset, size, data);
> > + }
> > + else
> > + {
> > + rc =3D ns8250_io_read(vdev, offset, size, data);
> > + pr_debug("%c 0x%04x %d 0x%08"PRIx32" %s[0x%02"PRIx32"]\n",
> > + op(dir), addr, size,
> > + *data & io_access_mask[size],
> > + ns8250_regname(vdev, offset, dir), reg);
> > + }
> > + if ( rc )
> > + pr_err("%c 0x%04x %d 0x%08"PRIx32": unsupported access\n",
> > + op(dir), addr, size, *data & io_access_mask[size]);
> > + rc =3D X86EMUL_OKAY;
> > +
> > +out:
>
>
> Nit: Missing indentation (see ./CODING_STYLE). Also elsewhere.

Fixed.

>
> > --- /dev/null
> > +++ b/xen/arch/x86/include/asm/hvm/vuart_ns8250.h
> > @@ -0,0 +1,75 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only /
> > +/
> > + * NS8250-compatible UART Emulator.
> > + /
> > +#if !defined(HVM__VUART_NS8250_H)
> > +#define HVM__VUART_NS8250_H
> > +
> > +#include <xen/spinlock.h>
> > +#include <xen/8250-uart.h>
> > +#include <public/io/console.h> / xencons_interface */
>
>
> I assume you mean ...
>
> > +/*
> > + * NS8250 emulator operational flags.
> > + /
> > +enum {
> > + / Emulator is ready /
> > + NS8250_READY =3D BIT(0, U),
> > + / Trigger re-delivery of THRE interrupt /
> > + NS8250_IRQ_THRE_PENDING =3D BIT(1, U),
> > +};
> > +
> > +/
> > + * Virtual NS8250 device state.
> > + /
> > +struct vuart_ns8250 {
> > + uint16_t dl; / Divisor Latch /
> > + uint8_t regs[UART_MAX]; / Registers /
> > + uint32_t flags; / Virtual device flags /
> > + uint64_t io_addr; / Guest I/O region base address /
> > + uint64_t io_size; / Guest I/O region size /
> > + int irq; / Guest IRQ# */
> > + struct xencons_interface cons; / Emulated RX/TX FIFOs */
>
>
> ... this use, but that doesn't even require a forward decl of the struct
> in C (in C++ such a forward decl would be all that's needed).

I declared vUART handler as `void *` in hvm_domain and moved all the data
types to .c, so there's no need in header file at all.

>
> Jan



