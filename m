Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF43EA012C5
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 07:29:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865395.1276701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTxeB-0002m9-AQ; Sat, 04 Jan 2025 06:28:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865395.1276701; Sat, 04 Jan 2025 06:28:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTxeB-0002kg-74; Sat, 04 Jan 2025 06:28:31 +0000
Received: by outflank-mailman (input) for mailman id 865395;
 Sat, 04 Jan 2025 06:28:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTxe8-0002k1-98
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 06:28:29 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19a735e2-ca65-11ef-a0de-8be0dac302b0;
 Sat, 04 Jan 2025 07:28:24 +0100 (CET)
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
X-Inumbo-ID: 19a735e2-ca65-11ef-a0de-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=7lcxlqtw2rakhomkj4gh3fuu44.protonmail; t=1735972102; x=1736231302;
	bh=5Rr9Hy5aGEbnz3kOGNY8spsmTkT2Iv5Y1dKdOmEiBU4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=mPMIg/aR268UQJzQKHLDJT3cILZBdV+nn6DLR0/wh/ScBzCivSMC4F97/u8I5JV3B
	 NgTkjfXb/UndX0VYdjw+ndCqmZsWn5CQwAwKT1/Ll3H7WmSGa1H97N+X5PvgXiIaIK
	 VxkRR4LX3YejgGnNr2KBoj4cX7eHnxrZ6tAqd/IZ0xxWsSq5Uq3Iy/xWE80aghhwKB
	 LLdCQwogNVNkpTlsCTPonU9UXBM1j8MdEQMJb0Ypp50iJnhxmEO/1AqHh3lmR4krqS
	 O7zCN2EqJccth4omg0Qcl5H2I4uUGnI95kJcT4Emq0KLa0BPZF6ULtdXjfiThzcmNZ
	 7IavNkyyzNTNw==
Date: Sat, 04 Jan 2025 06:28:18 +0000
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 31/35] x86/hvm: introduce NS8250 UART emulator
Message-ID: <7BvSh3ExOh8GocRqFUZc15WZsR9O1EngfdYF_PZrkIyjYdaNMEfS4yDIVDxnn1VtusTm65wl16SpanH2esD3iChDTutkhsdRGeGEtgIuxU0=@proton.me>
In-Reply-To: <Z1wd4iAmVzv1ISPZ@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-31-e9aa923127eb@ford.com> <Z1wd4iAmVzv1ISPZ@macbook.local>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 17968b6e9da562268a7c4be88f56f511cf8f04d0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Friday, December 13th, 2024 at 3:43 AM, Roger Pau Monn=C3=A9 <roger.pau@=
citrix.com> wrote:

>
>
> On Thu, Dec 05, 2024 at 08:42:01PM -0800, Denis Mukhin via B4 Relay wrote=
:
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
>
>
> emulatio -> emulation

Fixed.

>
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
> > - RX FIFO interrupt moderation (FCR) is not emulated properly, TL16C750
> > has special FCR handling;
> > - No integration w/ VM snapshotting (HVM_REGISTER_SAVE_RESTORE() and
> > friends);
> > - Assumes no ISA-device IRQ sharing;
> > - MMIO-based UART is not supported.
>
>
> Do you have a reference to the specification you have used to
> implement the driver?

I used these two (added links in the code comment):
  - https://download.freebsd.org/doc/en/articles/serial-uart/serial-uart_en=
.pdf
  - https://www.ti.com/lit/ds/symlink/tl16c550c.pdf

>
> Most of the comments below are quite generic, I haven't really looked
> into the implementation details of the ns8520 emulated registers.

Thanks a lot for the review!

>
> > Signed-off-by: Denis Mukhin dmukhin@ford.com
> > ---
> > xen/arch/x86/hvm/Kconfig | 14 +
> > xen/arch/x86/hvm/Makefile | 1 +
> > xen/arch/x86/hvm/hvm.c | 13 +
> > xen/arch/x86/hvm/vuart_ns8250.c | 886 ++++++++++++++++++++++++++++
> > xen/arch/x86/include/asm/hvm/domain.h | 5 +
> > xen/arch/x86/include/asm/hvm/vuart_ns8250.h | 75 +++
> > 6 files changed, 994 insertions(+)
> >
> > diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
> > index 361bb6572e633f3cf0fc972a3b391e8341c33361..af6e698b8be0d82af94b00c=
0cfdaf9a2bc24b154 100644
> > --- a/xen/arch/x86/hvm/Kconfig
> > +++ b/xen/arch/x86/hvm/Kconfig
> > @@ -61,3 +61,17 @@ config HVM_FEP
> > for use in production.
> >
> > If unsure, say N.
> > +
> > +config HAS_VUART_NS8250
> > + bool "NS8250-compatible UART Emulation"
> > + depends on HVM && HAS_IOPORTS
> > + default n
> > + help
> > + In-hypervisor NS8250/NS16x50 UART emulation.
> > +
> > + Only legacy PC I/O ports are emulated.
> > +
> > + This is strictly for testing purposes (early HVM guest console), and =
not
> > + appropriate for use in production.
>
>
> If it's strictly speaking for debug purposes, then it might be helpful
> to tie it to CONFIG_DEBUG, or if maybe that's too broad, make it tied
> to CONFIG_EXPERT, so that it's clear builds wit the option enabled
> won't be security supported.

I made it dependent on CONFIG_EXPERT.

>
> > +
> > + If unsure, say N.
> > diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
> > index 4c1fa5c6c2bf75d336b39f343241bfced5b91b09..14761435e0694109f815da6=
3289666c0f1cbf0ce 100644
> > --- a/xen/arch/x86/hvm/Makefile
> > +++ b/xen/arch/x86/hvm/Makefile
> > @@ -29,3 +29,4 @@ obj-y +=3D vm_event.o
> > obj-y +=3D vmsi.o
> > obj-y +=3D vpic.o
> > obj-y +=3D vpt.o
> > +obj-$(CONFIG_HAS_VUART_NS8250) +=3D vuart_ns8250.o
> > diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> > index 493b699c708949b2109c26573a107565543f5d45..db61af7defc5f5da795b7a6=
13fe4d32fbff7d93e 100644
> > --- a/xen/arch/x86/hvm/hvm.c
> > +++ b/xen/arch/x86/hvm/hvm.c
> > @@ -55,6 +55,7 @@
> > #include <asm/hvm/monitor.h>
> > #include <asm/hvm/viridian.h>
> > #include <asm/hvm/vm_event.h>
> > +#include <asm/hvm/vuart_ns8250.h>
> > #include <asm/altp2m.h>
> > #include <asm/mtrr.h>
> > #include <asm/apic.h>
> > @@ -679,6 +680,15 @@ int hvm_domain_initialise(struct domain *d,
> > if ( rc !=3D 0 )
> > goto fail1;
> >
> > + if ( domain_has_vuart(d) )
> > + {
> > + rc =3D domain_vuart_init(d);
> > + if ( rc =3D=3D 0 )
> > + d->is_console =3D true;
> > + else if ( rc !=3D -ENODEV )
> > + goto out_vioapic_deinit;
>
>
> Why do you shallow the ENODEV error? If a user has asked for a vUART,
> and there's no support in Xen it should error hard IMO, rather than
> ignoring it and continue building the domain.

re: shallowing error: my thought was - since this emulator is for debugging
purposes at this point, it is better to proceed w/ domain creation, rather
than disallowing domain creation.

Fixed.

>
> IMO emulation_flags_ok() should prevent hvm_domain_initialise() from
> being called with vUART when there's no support built-in.

Fixed.

>
> > + }
> > +
> > stdvga_init(d);
> >
> > rtc_init(d);
> > @@ -699,6 +709,9 @@ int hvm_domain_initialise(struct domain *d,
> > return 0;
> >
> > fail2:
> > + if ( domain_has_vuart(d) )
> > + domain_vuart_free(d);
> > + out_vioapic_deinit:
> > vioapic_deinit(d);
> > fail1:
> > if ( is_hardware_domain(d) )
> > diff --git a/xen/arch/x86/hvm/vuart_ns8250.c b/xen/arch/x86/hvm/vuart_n=
s8250.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..779dbd80d7be4e070ea9df3=
ae736ecdc662a527a
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
>
>
> IMO putting the limitations here is likely to make them go out of
> sync, noting in the commit message should be enough.

I cleaned up commit message and kept those limitations in the source
code only.

>
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
> > +#include <xen/console.h> / console_input_domid() */
>
>
> Includes would be better sorted alphabetically if possible.

Done.

>
> > +#include <asm/setup.h> /* max_init_domid */
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
> Is there any reason you cannot directly use gprintk() and need those
> wrappers?

Yes, I need to control emulator's printouts w/o changing global setting so
I can debug it; I plan for MMIO-based UART which will need more debugging.

>
> If the code has been imported from another project it would be good to
> have a reference, so that we can pickup updates in the future.

I looked at QEMU, bhyve and ACRN emulators as hints.

>
> > +
> > +/*
> > + * NS8250 emulator state machine logging (development only)
> > + * FIXME: use similar to parse_guest_loglvl()
> > + */
> > +static unsigned int __read_mostly hvm_ns8250_log_level =3D NS8250_LOG_=
LEVEL;
> > +integer_param("hvm.ns8250.log_level", hvm_ns8250_log_level);
>
>
> WE don't have any existing instances of command line options with
> dots, and also the documentation addition to xen-command-line.pandoc
> seems to be missing from this patch.

I reworked these options to Kconfig for now. Kconfig looks a better
alternative to control settings globally.

>
> My recommendation would be that the code here just uses normal logs
> levels, users can adjust the minimum log level of pritned messages.
> Adding ad-hoc log level settings for each subsystem just causes
> confusion.

I think I want to stick to having a way to control the verbosity of that
emulator independently of the rest of Xen subsystems. That helps debugging
this code. Initially, I looked into re-using HVM_DBG_LOG() facility, but
then decided against using it because it does not have a fine grain control
over debugging and it will be harder to port this emulator for other
architectures in the future.

>
> > +
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
> Same here, there seems to be no documentation about this option. And
> you likely want this to be a custom_param so you can do the parsing
> directly instead of storing into a buffer for later parsing.
>
> > +
> > +/* I/O access mask */
> > +static const uint32_t io_access_mask[] =3D {
> > + [0] =3D 0X00000000U,
> > + [1] =3D 0X000000FFU,
> > + [2] =3D 0X0000FFFFU,
> > + [4] =3D 0XFFFFFFFFU,
>
>
> lowercase x please.

Fixed.

>
> > +};
> > +
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
> > + { .type =3D IORESOURCE_IRQ, .addr =3D 4, .size =3D 1 },
> > + { .type =3D IORESOURCE_UNKNOWN },
> > + },
> > + },
> > + [1] =3D {
> > + .name =3D "com2",
> > + .res =3D (const struct resource[]){
> > + { .type =3D IORESOURCE_IO, .addr =3D 0x2F8, .size =3D UART_MAX },
> > + { .type =3D IORESOURCE_IRQ, .addr =3D 3, .size =3D 1 },
> > + { .type =3D IORESOURCE_UNKNOWN },
> > + },
> > + },
> > + [2] =3D {
> > + .name =3D "com3",
> > + .res =3D (const struct resource[]){
> > + { .type =3D IORESOURCE_IO, .addr =3D 0x3E8, .size =3D UART_MAX },
> > + { .type =3D IORESOURCE_IRQ, .addr =3D 4, .size =3D 1 },
> > + { .type =3D IORESOURCE_UNKNOWN },
> > + },
> > + },
> > + [3] =3D {
> > + .name =3D "com4",
> > + .res =3D (const struct resource[]){
> > + { .type =3D IORESOURCE_IO, .addr =3D 0x2E8, .size =3D UART_MAX },
> > + { .type =3D IORESOURCE_IRQ, .addr =3D 3, .size =3D 1 },
> > + { .type =3D IORESOURCE_UNKNOWN },
> > + },
> > + },
> > +};
> > +
> > +static bool ns8250_fifo_rx_empty(struct vuart_ns8250 *vdev)
> > +{
> > + struct xencons_interface *cons =3D vdev->cons;
>
>
> const here and in the function parameter.

Done.

>
> > +
> > + return cons->in_prod =3D=3D cons->in_cons;
> > +}
> > +
> > +static bool ns8250_fifo_rx_full(struct vuart_ns8250 *vdev)
> > +{
> > + struct xencons_interface *cons =3D vdev->cons;
>
>
> const here and in the function parameter.

Done.

>
> > +
> > + return cons->in_prod - cons->in_cons =3D=3D sizeof(cons->in);
> > +}
> > +
> > +static void ns8250_fifo_rx_reset(struct vuart_ns8250 *vdev)
> > +{
> > + struct xencons_interface *cons =3D vdev->cons;
> > +
> > + cons->in_cons =3D cons->in_prod;
> > +}
> > +
> > +static int ns8250_fifo_rx_getchar(struct vuart_ns8250 *vdev)
> > +{
> > + struct xencons_interface *cons =3D vdev->cons;
> > + int rc =3D -1;
>
>
> -ENOENT maybe instead of -1?

With -1 I do not have to filter out the error codes, the value can be direc=
tly
returned to the guest, 0xff will be eventually interpreted as a break signa=
l
in the guest OS.
Changed to -ENODATA and plumbed error checking where necessary.

>
> > +
> > + if ( !ns8250_fifo_rx_empty(vdev) )
> > + {
> > + rc =3D cons->in[MASK_XENCONS_IDX(cons->in_cons, cons->in)];
> > + cons->in_cons++;
> > + }
> > +
> > + return rc;
> > +}
> > +
> > +static int ns8250_fifo_rx_putchar(struct vuart_ns8250 *vdev, char c)
> > +{
> > + struct xencons_interface cons =3D vdev->cons;
> > + int rc =3D 0;
> > +
> > + /
> > + * FIFO-less 8250/16450 UARTs: newly arrived word overwrites the conte=
nts
> > + * of the THR.
> > + /
> > + if ( ns8250_fifo_rx_full(vdev) )
> > + {
> > + ns8250_fifo_rx_reset(vdev);
> > + rc =3D -ENOSPC;
> > + }
> > +
> > + cons->in[MASK_XENCONS_IDX(cons->in_prod, cons->in)] =3D c;
> > + cons->in_prod++;
> > +
> > + return rc;
> > +}
> > +
> > +/
> > + * Flush cached output to Xen console.
> > + * Can be called from ns8250_exit().
> > + */
> > +static void ns8250_fifo_tx_reset(struct vuart_ns8250 *vdev)
> > +{
> > + struct xencons_interface *cons =3D vdev->cons;
> > +
> > + if ( cons->out_prod =3D=3D 0 )
>
>
> Don't you need to check that cons->out_prod =3D=3D cons->out_cons instead=
?

xencons_interface usage here is a bit awkward.

The reason for that is I want to print messages on the physical console w/o
fragmenting them w/ "(XEN)" and timestamps, etc. prefixes -
NS16550-compatible UART FIFO is only 16 characters.

The idea is to collect the guest OS output until '\n' or until the
`size - 1` condition and then send the collected output all at once
to the physical console followed by resetting out_prod to 0.
This works fine for the debugging purposes (the main goal of the
emulator) and the baud rate is not emulated anyway (one of the limitations
of the emulator) - i.e. there's no timer for draining TX buffer.

With that, checking for 0 was enough.

Fixed.

>
> > + return;
> > +
> > + cons->out[cons->out_prod++] =3D '\0';
>
>
> You need to use MASK_XENCONS_IDX() otherwise this could result in a
> buffer overflow?
>
> If you expect (because of checks in other places) out_prod to always
> be < ring size - 1, please add an assert to that extent here. But see
> below about the usage of the ring indexes.

Added assertions.

>
> Also, no need for the trailing increment, you will unconditionally
> reset out_prod to 0 just below.

Fixed.

>
> > +
> > + /*
> > + * NB: do not show domain ID if the domain owning the virtual UART als=
o
> > + * owns Xen input console.
> > + */
> > + if ( vdev->owner->domain_id =3D=3D console_owner_domid() )
> > + printk_common("%s", cons->out);
> > + else
> > + guest_printk(vdev->owner, "%s", cons->out);
> > +
> > + cons->out_prod =3D 0;
>
>
> You should rather do cons->out_cons =3D cons->out_prod?
>
>
> Wait, you seem to use the out buffer differently than the input one,
> and only advance out_prod but not out_cons?
>
> It seems weird to drive the 'in' ring using both indexes, while the
> 'out' ring is just using one index.

Correct, the awkward way is because I need to accumulate long guest
output until '\n' before sending it all at once to Xen console.

>
> > +}
> > +
> > +/*
> > + * Send a character to Xen console.
> > + */
> > +static void ns8250_fifo_tx_putchar(struct vuart_ns8250 *vdev, char ch)
> > +{
> > + struct xencons_interface *cons =3D vdev->cons;
> > +
> > + if ( !isconsole(ch) )
> > + return;
> > +
> > + cons->out[cons->out_prod] =3D ch;
> > + cons->out_prod++;
> > +
> > + if ( cons->out_prod =3D=3D ARRAY_SIZE(cons->out) - 1
> > + || ch =3D=3D '\n' || ch =3D=3D '\0' )
>
>
> Bad indentation, should be:
>
> if ( cons->out_prod =3D=3D ARRAY_SIZE(cons->out) - 1 ||
>
> ch =3D=3D '\n' || ch =3D=3D '\0' )

Fixed.

>
> Albeit I'm not sure you need the '\0' check, as isconsole('\0') will
> already return false?
>
> > + ns8250_fifo_tx_reset(vdev);
> > +}
> > +
> > +static bool cf_check ns8250_iir_check_lsi(struct vuart_ns8250 *vdev)
>
>
> vdev should be const.

Done.

>
> > +{
> > + return !!( vdev->regs[UART_LSR] & UART_LSR_MASK );
>
>
> Extra spaces around the parentheses.

Done.

>
> > +}
> > +
> > +static bool cf_check ns8250_iir_check_rda(struct vuart_ns8250 *vdev)
> > +{
> > + return !ns8250_fifo_rx_empty(vdev);
> > +}
> > +
> > +static bool cf_check ns8250_iir_check_thr(struct vuart_ns8250 *vdev)
> > +{
> > + return !!( vdev->flags & NS8250_IRQ_THRE_PENDING );
> > +}
> > +
> > +static bool cf_check ns8250_iir_check_msi(struct vuart_ns8250 *vdev)
>
>
> const for all the 3 vdev parameters above.

Yep, missed those. Done.

>
> > +{
> > + return !!( vdev->regs[UART_MSR] & UART_MSR_DELTA );
>
>
> Extra spaces around the parentheses.

Done.

>
> > +}
> > +
> > +/*
> > + * Interrupt identity reasons by priority.
> > + * NB: highest priority are at lower indexes.
> > + */
> > +static const struct {
> > + uint8_t ier_mask;
> > + uint8_t iir_mask;
> > + bool (*iir_check)(struct vuart_ns8250 *vdev);
> > +} iir_by_prio[] =3D {
> > + [0] =3D { UART_IER_ELSI, UART_IIR_LSI, ns8250_iir_check_lsi },
> > + [1] =3D { UART_IER_ERDAI, UART_IIR_RDA, ns8250_iir_check_rda },
> > + [2] =3D { UART_IER_ETHREI, UART_IIR_THR, ns8250_iir_check_thr },
> > + [3] =3D { UART_IER_EMSI, UART_IIR_MSI, ns8250_iir_check_msi },
>
>
> You don't need the explicit array indexes (at least with the ones you
> are specifying here).
>
> I think those interrupt reasons are not likely to change, and the
> checker for each reason is a one line function. It would be better to
> open-code the checking in ns8250_irq_reason(), as that will avoid the
> indirect function call.
>
> Otherwise iir_by_prio array should be declared in the scope of
> ns8250_irq_reason(), as that's the only function where it's used.

Moved iir_by_prio in scope of xxx_irq_reason()

>
> > +};
> > +
> > +/*
> > + * Define the interrupt identity reason.
> > + * NB: NS8250 always reports high priority events first.
> > + */
> > +static uint8_t ns8250_irq_reason(struct vuart_ns8250 *vdev)
> > +{
> > + int i;
>
>
> unsigned int.

Done.

>
> > +
> > + ASSERT( spin_is_locked(&vdev->lock) );
>
>
> Extra spaces around the parentheses.

Done.

>
> > + for ( i =3D 0; i < ARRAY_SIZE(iir_by_prio); i++ )
> > + {
> > + if ( (vdev->regs[UART_IER] & iir_by_prio[i].ier_mask)
> > + && iir_by_prio[i].iir_check(vdev) )
>
>
> Wrong placement of the &&, plus indentation.

Sorry, muscle memory; fixed.

>
> > + return iir_by_prio[i].iir_mask;
> > + }
> > +
> > + return UART_IIR_NOINT;
> > +}
> > +
> > +/*
> > + * Assert virtual NS8250 interrupt line.
> > + */
> > +static void ns8250_irq_assert(struct vuart_ns8250 *vdev)
> > +{
> > + uint8_t iir;
> > +
> > + iir =3D ns8250_irq_reason(vdev);
> > + if (iir & UART_IIR_NOINT)
>
>
> Missing spaces around the parentheses.

Fixed.

>
> > + hvm_irq_lower(vdev->owner, vdev->irq);
> > + else
> > + hvm_irq_raise(vdev->owner, vdev->irq);
>
>
> I think you should use hvm_isa_irq_{,de}assert(), as the interrupt
> will unconditionally be < 16?

Switched to hvm_isa_irq_{,de}assert().

>
> > +
> > + pr_debug("IRQ#%d %x %s\n", vdev->irq, iir,
> > + !!(iir & UART_IIR_NOINT) ? "lower" : "raise");
>
>
> hm, this will get very verbose. While it might have been helpful
> during development, I don't think it would be appropriate to print at
> any debug level.

That is one of the reasons why I have local pr_xxx() macros. These verbose
messages will be compiled out in the default vUART build.

>
> > +}
> > +
> > +/*
> > + * Emulate 8-bit write access to NS8250 register.
> > + */
> > +static int ns8250_io_write8(
> > + struct vuart_ns8250 *vdev, uint32_t reg, uint8_t *data)
> > +{
> > + uint8_t val;
> > + int rc =3D 0;
> > +
> > + val =3D *data;
>
>
> You can init val at declaration.

Sure; fixed.

>
> > +
> > + switch ( reg )
> > + {
> > + /* DLAB=3D0 /
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
> > + case UART_MSR: / RO */
> > + rc =3D -EINVAL;
> > + break;
>
>
> Why are those not handled by the default case below? Is there any
> reason to explicitly mention those cases?

Yes: the intent was to be deliberately explicit so it is easier to
understand this code in the future.

>
> > +
> > + /*
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
> > + vdev->dl =3D (vdev->dl & 0xFF00U) | val;
> > + break;
> > +
> > + case UART_MAX + UART_DLM:
> > + vdev->dl =3D (val << 8) | (vdev->dl & 0x00FFU);
> > + break;
> > +
> > + default:
> > + rc =3D -EINVAL;
> > + break;
>
>
> Returning -EINVAL here is not correct I think, as the error gets
> propagated into the return of the IO handler. Those handlers expect
> to return a code in the range of X86EMUL_OKAY (see x86_emulate.h).
>
> But most importantly, what do you expect the caller to do with such
> error code? The access must be handled by the console driver, as it
> belongs to it's range of IO ports. What would hardware do in this
> case, ignore the write and continue operation?

This I overlooked while doing self-review, thanks.

The initial idea was to assert the virtual IRQ only if no "errors" returned
from the register I/O access emulation code. But then I forgot to clean
that up.

Fixed.

>
> If so, there's no point in returning any error from
> ns8250_io_write8(), the best would be to log a debug message in case
> of ignored accesses. This likely applies to all the handlers
> implemented below.

Yep, agree; fixed.

>
> > + }
> > +
> > + return rc;
> > +}
> > +
> > +/*
> > + * Emulate 16-bit write access to NS8250 register.
> > + * NB: some guest OSes use outw() to access UART_DLL.
> > + */
> > +static int ns8250_io_write16(
> > + struct vuart_ns8250 *vdev, uint32_t reg, uint16_t *data)
> > +{
> > + int rc;
> > +
> > + switch ( reg )
> > + {
> > + case UART_MAX + UART_DLL:
> > + vdev->dl =3D data;
> > + rc =3D 0;
> > + break;
> > +
> > + default:
> > + rc =3D -EINVAL;
> > + break;
> > + }
> > +
> > + return rc;
> > +}
> > +
> > +/
> > + * Emulate write access to NS8250 register.
> > + */
> > +static int ns8250_io_write(
> > + struct vuart_ns8250 *vdev, uint8_t reg, uint32_t size, uint32_t *data=
)
> > +{
> > + int rc =3D -EINVAL;
> > +
> > + switch ( size )
> > + {
> > + case 1:
> > + rc =3D ns8250_io_write8(vdev, reg, (uint8_t *)data);
> > + break;
> > +
> > + case 2:
> > + rc =3D ns8250_io_write16(vdev, reg, (uint16_t )data);
> > + break;
> > +
> > + default:
> > + break;
> > + }
> > +
> > + ns8250_irq_assert(vdev);
> > +
> > + return rc;
> > +}
> > +
> > +/
> > + * Emulate 8-bit read access to NS8250 register.
> > + */
> > +static int ns8250_io_read8(
> > + struct vuart_ns8250 *vdev, uint32_t reg, uint8_t *data)
> > +{
> > + int rc =3D 0;
> > + uint8_t val;
>
>
> In order to avoid unintentionally leaking stack contents, it would be
> best to initialize val at declaration:

Done.

>
> uint8_t val =3D ~0;
>
> > +
> > + switch ( reg )
> > + {
> > + /* DLAB=3D0 */
> > + case UART_RBR:
> > + val =3D (uint8_t)ns8250_fifo_rx_getchar(vdev);
>
>
> You seem to ignore that ns8250_fifo_rx_getchar() can return an error,
> is it intended to just propagate the error to the caller then?

The idea here is that UART_RBR read will emulate 0xff in case of RX FIFO
is empty which should be treated as a break signal by the guest OS.

I reworked that part so the code is followed easily.

>
> > + /* NB: do not forget to clear overrun condition /
> > + vdev->regs[UART_LSR] &=3D ~UART_LSR_OE;
> > + break;
> > +
> > + case UART_IER: / RO /
> > + val =3D vdev->regs[UART_IER];
> > + break;
> > +
> > + case UART_IIR:
> > + val =3D ns8250_irq_reason(vdev);
> > + if ( val & UART_IIR_THR )
> > + vdev->flags &=3D ~NS8250_IRQ_THRE_PENDING;
> > +
> > + if ( vdev->regs[UART_FCR] & UART_FCR_ENABLE )
> > + val |=3D UART_IIR_FE_MASK;
> > +
> > + break;
> > +
> > + case UART_LCR:
> > + val =3D vdev->regs[UART_LCR];
> > + break;
> > +
> > + case UART_MCR:
> > + val =3D vdev->regs[UART_MCR];
> > + break;
> > +
> > + case UART_LSR:
> > + val =3D vdev->regs[UART_LSR] | UART_LSR_THRE | UART_LSR_TEMT;
> > + if ( ns8250_fifo_rx_empty(vdev) )
> > + val &=3D ~UART_LSR_DR;
> > + else
> > + val |=3D UART_LSR_DR;
> > +
> > + vdev->regs[UART_LSR] =3D val & ~UART_LSR_MASK;
> > +
> > + break;
> > +
> > + case UART_MSR:
> > + val =3D vdev->regs[UART_MSR];
> > + vdev->regs[UART_MSR] &=3D ~UART_MSR_DELTA;
> > + break;
> > +
> > + case UART_SCR:
> > + val =3D vdev->regs[UART_SCR];
> > + break;
> > +
> > + / DLAB=3D1 */
> > + case UART_MAX + UART_DLL:
> > + val =3D vdev->dl & 0xFFU;
> > + break;
> > +
> > + case UART_MAX + UART_DLM:
> > + val =3D vdev->dl >> 8;
> > + break;
> > +
> > + default:
> > + val =3D (uint8_t)io_access_mask[1];
>
>
> Hm, not sure why you need this mask, isn't it OK to just do val =3D ~0;?

Dropped the mask.

>
> However see comment above about initializing at definition.
>
> > + rc =3D -EINVAL;
> > + break;
> > + }
> > +
> > + data =3D val;
> > +
> > + return rc;
> > +}
> > +
> > +/
> > + * Emulate 16-bit read access to NS8250 register.
> > + */
> > +static int ns8250_io_read16(
> > + struct vuart_ns8250 *vdev, uint32_t reg, uint16_t *data)
> > +{
> > + uint16_t val;
>
>
> Same comment as ns8250_io_read8() about initializing val at definition
> and not using io_access_mask.

Done.

>
> > + int rc;
> > +
> > + switch ( reg )
> > + {
> > + case UART_MAX + UART_DLL:
> > + val =3D vdev->dl;
> > + rc =3D 0;
> > + break;
> > +
> > + default:
> > + val =3D (uint16_t)io_access_mask[2];
> > + rc =3D -EINVAL;
> > + break;
> > + }
> > +
> > + data =3D val;
> > +
> > + return rc;
> > +}
> > +
> > +/
> > + * Emulate read access to NS8250 register.
> > + */
> > +static int ns8250_io_read(
> > + struct vuart_ns8250 *vdev, uint8_t reg, uint32_t size, uint32_t *data=
)
> > +{
> > + int rc;
> > +
> > + switch ( size )
> > + {
> > + case 1:
> > + rc =3D ns8250_io_read8(vdev, reg, (uint8_t *)data);
> > + break;
> > +
> > + case 2:
> > + rc =3D ns8250_io_read16(vdev, reg, (uint16_t *)data);
>
>
> I get the feeling you could handle both 1 and 2 byte accesses in the
> same function, as there's just a single register that allows 2 byte
> accesses.

I think it is possible to merge 1 and 2 bytes accesses. I wrote it this
way because it was easy to follow what's emulated. I kept this code as is
for now.

>
> Is the split done because further (to be implemented) features will
> require addition 2 byte accesses?

It does not seem there will be special 2 byte accesses involved for
MMIO-based UARTs.

>
> > + break;
> > +
> > + default:
> > + *data =3D io_access_mask[size];
> > + rc =3D -EINVAL;
> > + break;
> > + }
> > +
> > + ns8250_irq_assert(vdev);
> > +
> > + return rc;
> > +}
> > +
> > +static const char *ns8250_regname(
> > + const struct vuart_ns8250 *vdev, uint32_t reg, int dir)
> > +{
> > + static const char reg_names[UART_MAX + 2][2] =3D {
> > + / register W R */
> > + [UART_RBR] =3D { "THR", "RBR" },
> > + [UART_IER] =3D { "IER", "IER" },
> > + [UART_IIR] =3D { "FCR", "IIR" },
> > + [UART_LCR] =3D { "LCR", "LCR" },
> > + [UART_MCR] =3D { "MCR", "MCR" },
> > + [UART_LSR] =3D { "LSR", "LSR" },
> > + [UART_MSR] =3D { "MSR", "MSR" },
> > + [UART_SCR] =3D { "SCR", "SCR" },
> > + [UART_MAX + UART_DLL] =3D { "DLL", "DLL" },
> > + [UART_MAX + UART_DLM] =3D { "DLM", "DLM" },
> > + };
> > +
>
>
> To be in the safe saide I would assert that 'reg' and 'dir' are
> between the array bounds.

I dropped this function entirely.

>
> > + return reg_names[reg][dir];
> > +}
> > +
> > +/*
> > + * Emulate I/O access to NS8250 register.
> > + */
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
>
>
> Extra spaces around the parentheses.

Done.

>
> However I would rather use:
>
> if ( vdev->owner !=3D d )
>
> {
> gprintk(XENLOG_ERR, "vUART owner %pd doesn't match current domain\n",
> vdev->owner);
>
> ASSERT_UNREACHABLE();
> rcu_unlock_domain(d);
> return X86EMU_OKAY;
> }
>
> And place it before the spin_lock() call.

Thank you.

>
> > +
> > + if ( !(vdev->flags & NS8250_READY) )
> > + {
> > + pr_err("%c io 0x%04x %d 0x%08"PRIx32": propagate to external I/O emul=
ator\n",
> > + op(dir), addr, size, *data);
> > + rc =3D X86EMUL_UNHANDLEABLE;
>
>
> I think you need to unconditionally return X86EMU_OKAY and just ignore
> the access. I assume there's no point in attempting to forward this
> access to any other handler, as it must be handled by the vuart
> driver.

Agreed, that is "the user has configured vUART" case, so all accesses
shall be trapped by the emulator.

Fixed.

>
> > + goto out;
> > + }
> > +
> > + reg =3D addr - vdev->io_addr;
> > + BUG_ON( reg >=3D UART_MAX );
>
>
> If possible, might be best to use a construct similar to the one
> proposed above with ASSERT_UNREACHABLE().

Done.

>
> > + if ( reg % size !=3D 0 )
>
>
> IS_ALIGNED(reg, size) might be clearer.

Done.

>
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
>
>
> Indentation plus placement of the &&.

Fixed.

>
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
>
>
> The pr_debug() are likely too verbose.

Yes, those are verbose if enabled.

>
> > + }
> > + if ( rc )
> > + pr_err("%c 0x%04x %d 0x%08"PRIx32": unsupported access\n",
> > + op(dir), addr, size, *data & io_access_mask[size]);
> > + rc =3D X86EMUL_OKAY;
> > +
> > +out:
> > + spin_unlock(&vdev->lock);
>
>
> You seem to have forgotten a rcu_unlock_domain() call here? (even if
> it's a no-op).

I did not add it exactly because it is a no-op.
Fixed.

>
> > +
> > + return rc;
> > +#undef op
> > +}
> > +
> > +/*
> > + * Parse virtual NS8250 configuration.
> > + * hvm.ns8250.console=3D[com1|com2|com3|com4]
> > + */
> > +static const struct resource ns8250_parse(void)
> > +{
> > + int i;
> > +
> > + for ( i =3D 0; i < ARRAY_SIZE(ns8250_x86_legacy_uarts); i++ )
> > + if ( !strcasecmp(hvm_ns8250_console, ns8250_x86_legacy_uarts[i].name)=
 )
> > + return ns8250_x86_legacy_uarts[i].res;
> > +
> > + return ns8250_x86_legacy_uarts[0].res;
> > +}
> > +
> > +/
> > + * Claim virtual NS8250 resources to domain.
> > + */
> > +static int ns8250_claim(
> > + struct vuart_ns8250 *vdev, const struct resource *r, struct domain *d=
)
> > +{
> > + unsigned long size;
> > + unsigned long start;
> > + unsigned long end;
> > +
> > + vdev->irq =3D NO_IRQ;
> > + vdev->io_addr =3D IORESOURCE_UNKNOWN;
> > + vdev->io_size =3D IORESOURCE_UNKNOWN;
> > +
> > + foreach_resource(r)
> > + {
> > + if ( r->type & IORESOURCE_IO )
> > + {
> > + size =3D r->size;
> > + start =3D r->addr;
> > + end =3D r->addr + r->size - 1;
> > +
> > + if ( !ioports_access_permitted(d, start, end) )
> > + ioports_permit_access(d, start, end);
>
>
> Are you sure this is intended? By using ioports_permit_access() you
> are giving the domain access to the hardware (host) IO ports, and thus
> possibly avoiding the trapping into the IO handlers.
>
> However this is not very well-wired in HVM, because there's still an
> extra guest IO port -> host IO port translation that you are not
>
> adding.
>
> You shouldn't need the ioports_permit_access() for using the emulated
> vUART.

I see it now.

I understood it exactly the opposite way: ioports_permit_access() will
*lead* to trap on access.

Fixed.

Thanks a lot!

>
> > +
> > + register_portio_handler(d, start, size, ns8250_io_handle);
> > +
> > + /* Used to assert I/O port handler /
> > + vdev->io_addr =3D start;
> > + vdev->io_size =3D size;
> > + }
> > + else if ( r->type & IORESOURCE_IRQ )
> > + / "Claim" virtual IRQ; assumes no ISA-device IRQ sharing /
> > + vdev->irq =3D r->addr;
> > + else
> > + return -EINVAL;
> > + }
> > +
> > + if ( vdev->irq =3D=3D NO_IRQ
> > + || vdev->io_addr =3D=3D IORESOURCE_UNKNOWN
> > + || vdev->io_size =3D=3D IORESOURCE_UNKNOWN )
> > + return -ENODEV;
> > +
> > + return 0;
> > +}
> > +
> > +/
> > + * Unclaim virtual NS8250 resources.
> > + */
> > +static void ns8250_unclaim(struct vuart_ns8250 *vdev, struct domain *d=
)
> > +{
> > + unsigned long size =3D vdev->io_size;
> > + unsigned long start =3D vdev->io_addr;
> > + unsigned long end =3D start + size - 1;
> > +
> > + if ( ioports_access_permitted(d, start, end) )
> > + ioports_deny_access(d, start, size);
> > +}
> > +
> > +static int ns8250_init(struct domain *d, const struct resource *r)
> > +{
> > + struct vuart_ns8250 *vdev =3D &d->arch.hvm.vuart;
> > + struct xencons_interface *cons;
> > + int rc;
> > +
> > + cons =3D _xzalloc(sizeof(*vdev->cons), sizeof(void *));
>
>
> xvzalloc(typeof(*vdev->cons));

Done.

>
> > + if ( cons =3D=3D NULL )
> > + return -ENOMEM;
> > +
> > + rc =3D ns8250_claim(vdev, r, d);
> > + if ( rc )
> > + {
> > + xfree(cons);
> > + return rc;
> > + }
> > +
> > + spin_lock_init(&vdev->lock);
> > + hvm_irq_lower(d, vdev->irq);
> > +
> > + vdev->dl =3D (UART_CLOCK_HZ / 115200) >> 4; /* Report 115200 baud rat=
e */
> > + vdev->cons =3D cons;
> > + vdev->owner =3D d;
> > + vdev->flags =3D NS8250_READY | NS8250_IRQ_THRE_PENDING;
> > +
> > + return 0;
> > +}
> > +
> > +static void ns8250_exit(struct domain *d)
> > +{
> > + struct vuart_ns8250 *vdev =3D &d->arch.hvm.vuart;
> > +
> > + spin_lock(&vdev->lock);
> > +
> > + if ( !(vdev->flags & NS8250_READY) )
> > + goto out;
> > +
> > + ns8250_unclaim(vdev, d);
> > + ns8250_fifo_tx_reset(vdev);
> > + xfree(vdev->cons);
> > +
> > + vdev->cons =3D NULL;
> > + vdev->owner =3D NULL;
> > + vdev->flags =3D 0;
> > +
> > +out:
> > + spin_unlock(&vdev->lock);
> > +}
> > +
> > +int vuart_putchar(struct vuart_ns8250 vdev, char ch)
> > +{
> > + int rc;
> > +
> > + spin_lock(&vdev->lock);
> > +
> > + if ( !(vdev->flags & NS8250_READY) )
> > + {
> > + rc =3D -ENODEV;
> > + goto out;
> > + }
> > +
> > + / Echo the user input on the console */
> > + printk("%c", ch);
>
>
> FWIW, I would move the printk() after the error checks, so that the
> character is only echoed if handled.

Done.

>
> > +
> > + /*
> > + * Device is in loopback mode; do nothing.
> > + /
> > + if ( vdev->regs[UART_MCR] & UART_MCR_LOOP )
> > + {
> > + rc =3D -EBUSY;
> > + goto out;
> > + }
> > +
> > + rc =3D ns8250_fifo_rx_putchar(vdev, ch);
> > + if ( rc =3D=3D -ENOSPC )
> > + vdev->regs[UART_LSR] |=3D UART_LSR_OE | UART_LSR_DR;
> > + else
> > + / NB: UART_LSR_DR is also set when UART_LSR is accessed. /
> > + vdev->regs[UART_LSR] |=3D UART_LSR_DR;
> > +
> > + / FIXME: check FCR when to fire an interrupt */
> > + ns8250_irq_assert(vdev);
> > +
> > +out:
> > + spin_unlock(&vdev->lock);
> > +
> > + return rc;
> > +}
> > +
> > +int domain_vuart_init(struct domain *d)
> > +{
> > + struct vuart_ns8250 *vdev =3D &d->arch.hvm.vuart;
> > + const struct resource *r;
> > +
> > + memset(vdev, 0, sizeof(*vdev));
> > +
> > + r =3D ns8250_parse();
> > + if ( r !=3D NULL )
> > + return ns8250_init(d, r);
> > +
> > + return -ENODEV;
> > +}
> > +
> > +void domain_vuart_free(struct domain d)
> > +{
> > + ns8250_exit(d);
> > +}
> > +
> > +/
> > + * Local variables:
> > + * mode: C
> > + * c-file-style: "BSD"
> > + * c-basic-offset: 4
> > + * indent-tabs-mode: nil
> > + * End:
> > + */
> > diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/inclu=
de/asm/hvm/domain.h
> > index 333501d5f2ac01676646b9b277b551f06d43c3a5..d4ce25896259fc9763477e8=
8d56bacbe4f78af5b 100644
> > --- a/xen/arch/x86/include/asm/hvm/domain.h
> > +++ b/xen/arch/x86/include/asm/hvm/domain.h
> > @@ -16,6 +16,7 @@
> > #include <asm/hvm/io.h>
> > #include <asm/hvm/vmx/vmcs.h>
> > #include <asm/hvm/svm/vmcb.h>
> > +#include <asm/hvm/vuart_ns8250.h>
> >
> > #ifdef CONFIG_MEM_SHARING
> > struct mem_sharing_domain
> > @@ -73,6 +74,10 @@ struct hvm_domain {
> > struct hvm_vioapic **vioapic;
> > unsigned int nr_vioapics;
> >
> > +#if defined(CONFIG_HAS_VUART_NS8250)
> > + struct vuart_ns8250 vuart;
>
>
> Since this is supposed to possibly be used by just a small amount of
> domain on the system, I would rather make this a pointer:
>
> struct vuart_ns8250 *vuart;
>
> And embed the xencons_ring inside of it directly, so that you just
> have to allocate vuart_ns8250.

Fixed.

I ended up having just
    void *vuart;
in hvm_domain after addressing Jan's feedback.

That will also eliminate the need for NS8250_READY flag.

>
> > +#endif
> > +
> > /*
> > * hvm_hw_pmtimer is a publicly-visible name. We will defer renaming
> > * it to the more appropriate hvm_hw_acpi until the expected
> > diff --git a/xen/arch/x86/include/asm/hvm/vuart_ns8250.h b/xen/arch/x86=
/include/asm/hvm/vuart_ns8250.h
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..e1013751f955441a9089ea3=
8c96c4605a7f4cb75
> > --- /dev/null
> > +++ b/xen/arch/x86/include/asm/hvm/vuart_ns8250.h
> > @@ -0,0 +1,75 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only /
> > +/
> > + * NS8250-compatible UART Emulator.
> > + */
> > +#if !defined(HVM__VUART_NS8250_H)
>
>
> As commented by Jan, better use #ifndef.

Done.

>
> > +#define HVM__VUART_NS8250_H
> > +
> > +#include <xen/spinlock.h>
> > +#include <xen/8250-uart.h>
> > +#include <public/io/console.h> /* xencons_interface /
> > +
> > +/
> > + * NS8250 emulator operational flags.
> > + /
> > +enum {
> > + / Emulator is ready /
> > + NS8250_READY =3D BIT(0, U),
> > + / Trigger re-delivery of THRE interrupt */
> > + NS8250_IRQ_THRE_PENDING =3D BIT(1, U),
>
>
> I'm unsure the unnamed enum buys you much here if you end up assigning
> values anyway. You might as well do:
>
> #define NS8250_READY BIT(0, U)
> #define NS8250_IRQ_THRE_PENDING BIT(1, U)

re: why enum: muscle memory.

NS8250_READY is gone now that initialization code is reworked.
I also dropped the other flag and dropped enum.

>
> It would be good if you could integrate this with the flags field
> being declared using DECLARE_BITMAP(). Otherwise you might need some
> build-time check to ensure max defined flag fits in the struct flags
> field.

Dropped flags field.

>
> > +};
> > +
> > +/*
> > + * Virtual NS8250 device state.
> > + /
> > +struct vuart_ns8250 {
> > + uint16_t dl; / Divisor Latch /
> > + uint8_t regs[UART_MAX]; / Registers */
>
>
> Doesn't regs already account for the divisor latch register?

No, in this version `regs` registers are for DLAB=3D0.
Registers are accessed differently in NS16550 depending on type of
access (R/W) and LCR contents (DLAB=3D{0,1}).

I added some more comments; register emulation is updated in v3.

>
> > + uint32_t flags; /* Virtual device flags */
>
>
> See comment above about using DECLARE_BITMAP().
>
> > + uint64_t io_addr; /* Guest I/O region base address */
>
>
> IO space is limited to 16bits, hence there's no need to use a uint64_t
> to store the address. Either uint16_t, or just a plain unsigned int
> will suffice. Same for size below.

It is uint64_t for the follow on MMIO-based UART.

>
> > + uint64_t io_size; /* Guest I/O region size /
> > + int irq; / Guest IRQ# */
> > + struct xencons_interface cons; / Emulated RX/TX FIFOs */
>
>
> Any reason you re-use the xencons interface? And any reason it's a
> pointer instead of being part of vuart_ns8250 itself?

re: why re-use xencons: few reasons.
I decided to re-use something which is already invented in the code
base, rather then inventing my own buffering.
My understanding is that xencons will be needed for inter-domain
communication: xencons has pretty large buffers which may help
in case of slow domain. And I wanted to avoid guest OS printouts
"fragmentation" w/ prefixes printk injects into the each log message,
so large buffers should work around fragmenting messages.

re: why its a pointer: I did not think that d->arch.hvm can actually
contain just a pointer to vuart_ns16550 (I reworked it to `void *`).
That is pretty-much cut-n-paste from Arm's vpl011 design.

>
> > + struct domain owner; / Owner domain /
> > + spinlock_t lock; / Protection */
> > +};
> > +
> > +#if defined(CONFIG_HAS_VUART_NS8250)
> > +
> > +int vuart_putchar(struct vuart_ns8250 vdev, char ch);
> > +
> > +/
> > + * Match the names w/ arch/arm/vuart.h
> > + * FIXME: move to common vuart.h
> > + */
> > +int domain_vuart_init(struct domain *d);
> > +void domain_vuart_free(struct domain *d);
> > +
> > +#else
> > +
> > +static inline int vuart_putchar(struct vuart_ns8250 *vdev, char ch)
> > +{
>
>
> Hard to tell as there are no users of vuart_putchar() in this patch,
> but it seems you might want an ASSERT_UNREACHABLE() here.

Addressed in v3.

>
> > + return -1;
> > +}
> > +
> > +static inline int domain_vuart_init(struct domain *d)
> > +{
> > + return -ENODEV;
> > +}
> > +
> > +static inline void domain_vuart_free(struct domain *d)
> > +{
>
>
> Both init and free calls are gated with domain_has_vuart(), so you
> might want to also add ASSERT_UNREACHABLE() here.

Done.

>
> Thanks, Roger.



