Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C66CA01242
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 05:31:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865320.1276622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTvor-0000VS-H5; Sat, 04 Jan 2025 04:31:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865320.1276622; Sat, 04 Jan 2025 04:31:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTvor-0000Sz-Dp; Sat, 04 Jan 2025 04:31:25 +0000
Received: by outflank-mailman (input) for mailman id 865320;
 Sat, 04 Jan 2025 04:31:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTvop-0000Sd-6Y
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 04:31:23 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf601e63-ca54-11ef-99a4-01e77a169b0f;
 Sat, 04 Jan 2025 05:31:21 +0100 (CET)
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
X-Inumbo-ID: bf601e63-ca54-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=ahxuqxx4vzb3jct33gzt7x6wcq.protonmail; t=1735965080; x=1736224280;
	bh=Bo1HadBP70eWkjK2yccWreSwH+geo2mF8t0X/GoIaUI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=QTxfd5foq5LUfUOXvmS/GsVv+hRpowQw0s0hmcTcEhJwYVZcFTjGudycmVD0WL6vw
	 W+zAyV6YWjVC0Rfu8Y54c4m4waShVBc4ebu8RapK+7ZyhFF3zU35ZMmnIzRRGvH2fq
	 SjGra4DnnlMgz8+3CcQjJCqzVV0+vGHWr9vvol6hwgqfx1vtwxQa00TEUcJdhVcOgJ
	 F9JUTJYgKWlZ4L4vhFjN/K/279XLh92Hg5DUyjtzYtLwx61NiS9tMs5TQXgMQnlrWr
	 VLEE1LMr5z9mwnSkiWPuL8D/i7y6N0Ji7JEL5pr7dseoyuVbMSpWYFGvEoUEzr/WH2
	 IoNmRDR2D7Olw==
Date: Sat, 04 Jan 2025 04:31:17 +0000
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 32/35] x86/hvm: add debugging facility to NS8250 UART emulator
Message-ID: <AP865H1eMMvbQMRqHoG6NtVVnkco1kGbKQW2PYsdJg4mwTpxS8sxNcin5c5ds1T7kktlprU3D2e6RB8wPmQtZAOJ6yyFt-No-pYuKO1whXk=@proton.me>
In-Reply-To: <Z1wjt-JR95YoJBMs@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-32-e9aa923127eb@ford.com> <Z1wjt-JR95YoJBMs@macbook.local>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: fc81cecb0a26ff36da474daf4fd8de2ca08b8b6c
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Friday, December 13th, 2024 at 4:08 AM, Roger Pau Monn=C3=A9 <roger.pau@=
citrix.com> wrote:

>
>
> On Thu, Dec 05, 2024 at 08:42:02PM -0800, Denis Mukhin via B4 Relay wrote=
:
>
> > From: Denis Mukhin dmukhin@ford.com
> >
> > Enable keyhandler mechanism for dumping state of emulated NS8250 on the
> > console.
> >
> > Signed-off-by: Denis Mukhin dmukhin@ford.com
> > ---
> > xen/arch/x86/hvm/vuart_ns8250.c | 122 +++++++++++++++++++++++++++++++++=
+++++++
> > 1 file changed, 122 insertions(+)
> >
> > diff --git a/xen/arch/x86/hvm/vuart_ns8250.c b/xen/arch/x86/hvm/vuart_n=
s8250.c
> > index 779dbd80d7be4e070ea9df3ae736ecdc662a527a..c8c75afaf2b2419d1dae999=
da1d1e400fd367791 100644
> > --- a/xen/arch/x86/hvm/vuart_ns8250.c
> > +++ b/xen/arch/x86/hvm/vuart_ns8250.c
> > @@ -25,6 +25,7 @@
> >
> > /* Development debugging */
> > #define NS8250_LOG_LEVEL 0
> > +#undef NS8250_DEBUG
> >
> > #include <xen/types.h>
> > #include <xen/event.h>
> > @@ -35,6 +36,9 @@
> > #include <xen/resource.h>
> > #include <xen/ctype.h>
> > #include <xen/param.h>
> > +#if defined(NS8250_DEBUG)
> > +#include <xen/keyhandler.h>
> > +#endif
> > #include <xen/console.h> /* console_input_domid() /
> > #include <asm/setup.h> / max_init_domid */
> > #include <asm/iocap.h>
> > @@ -625,6 +629,121 @@ static const char *ns8250_regname(
> > return reg_names[reg][dir];
> > }
> >
> > +#if defined(NS8250_DEBUG)
>
>
> I don't think the keyhandler should be gated on NS8250_DEBUG, it
> should always be present if Xen is built with vUART support.
>
> > +static void ns8250_dump(struct vuart_ns8250 *vdev)
> > +{
> > + struct xencons_interface *cons =3D vdev->cons;
>
>
> const for both.

Fixed.

>
> > + uint8_t val;
> > +
> > + printk("I/O port %02"PRIx64" IRQ %d flags %"PRIx32" owner %d\n",
>
>
> I think you want 04 for the io_addr field width? So that the width is
> always fixed, and %pd for owner.

Fixed.

>
> > + vdev->io_addr, vdev->irq,
> > + vdev->flags, vdev->owner->domain_id);
> > +
> > + printk("RX size %ld in_prod %d in_cons %d used %d\n",
> > + sizeof(cons->in),
> > + cons->in_prod, cons->in_cons,
> > + cons->in_prod - cons->in_cons);
> > +
> > + printk("TX size %ld out_prod %d out_cons %d used %d\n",
> > + sizeof(cons->out),
> > + cons->out_prod, cons->out_cons,
> > + cons->out_prod - cons->out_cons);
> > +
> > + printk("%02x RBR [ %c ] THR [ %c ] DLL %02x DLM %02x\n",
> > + UART_RBR,
> > + cons->in[MASK_XENCONS_IDX(cons->in_prod, cons)],
> > + cons->out[MASK_XENCONS_IDX(cons->out_prod, cons)],
> > + vdev->dl & 0xFFU, vdev->dl >> 8);
> > +
> > + printk("%02"PRIx8" IER %02"PRIx8"\n", UART_IER, vdev->regs[UART_IER])=
;
> > +
> > + val =3D (vdev->regs[UART_FCR] & UART_FCR_ENABLE) ? UART_IIR_FE_MASK :=
 0;
> > + val |=3D ns8250_irq_reason(vdev);
> > + printk("%02"PRIx8" FCR %02"PRIx8" IIR %02"PRIx8"\n",
> > + UART_FCR, vdev->regs[UART_FCR], val);
> > +
> > + printk("%02"PRIx8" LCR %02"PRIx8"\n", UART_LCR, vdev->regs[UART_LCR])=
;
> > + printk("%02"PRIx8" MCR %02"PRIx8"\n", UART_MCR, vdev->regs[UART_MCR])=
;
> > + printk("%02"PRIx8" LSR %02"PRIx8"\n", UART_LSR, vdev->regs[UART_LSR])=
;
> > + printk("%02"PRIx8" MSR %02"PRIx8"\n", UART_MSR, vdev->regs[UART_MSR])=
;
> > +}
> > +
> > +static struct domain *rcu_find_first_domain_with_vuart(void)
> > +{
> > + struct domain *d =3D NULL;
> > + domid_t i;
> > +
> > + for ( i =3D 0; i < max_init_domid + 1; i++ )
> > + {
> > + d =3D rcu_lock_domain_by_id(i);
> > + if ( d =3D=3D NULL )
> > + continue;
> > +
> > + if ( domain_has_vuart(d) )
> > + break;
> > +
> > + rcu_unlock_domain(d);
> > + }
> > +
> > + return d;
> > +}
> > +
> > +static void cf_check ns8250_keyhandler_show(unsigned char key)
> > +{
> > + struct vuart_ns8250 *vdev;
> > + struct domain *d;
> > +
> > + d =3D rcu_find_first_domain_with_vuart();
> > + if ( d =3D=3D NULL )
> > + return;
>
>
> I wonder whether you should dump the state of all domains with a
> vUART, rather than just a single domain?

Looks like 'q' handler is a better place for such printout.

>
> > +
> > + printk("'%c' pressed -> dumping virtual NS8250 state (d%d)\n",
> > + key, d->domain_id);
> > +
> > + vdev =3D &d->arch.hvm.vuart;
> > + spin_lock(&vdev->lock);
>
>
> This should likely be a trylock, so that you can still print the
> console state in case of a deadlock.

Fixed.

>
> > + ns8250_dump(vdev);
> > + spin_unlock(&vdev->lock);
> > +
> > + rcu_unlock_domain(d);
> > +}
> > +
> > +static void cf_check ns8250_keyhandler_irq(unsigned char key)
> > +{
> > + struct vuart_ns8250 *vdev;
> > + struct domain *d;
> > +
> > + d =3D rcu_find_first_domain_with_vuart();
> > + if ( d =3D=3D NULL )
> > + return;
> > +
> > + printk("'%c' pressed -> triggering IRQ on virtual NS8250 (d%d)\n",
> > + key, d->domain_id);
> > +
> > + vdev =3D &d->arch.hvm.vuart;
> > + spin_lock(&vdev->lock);
> > + ns8250_irq_assert(vdev);
> > + spin_unlock(&vdev->lock);
> > +
> > + rcu_unlock_domain(d);
> > +}
> > +
> > +static void ns8250_keyhandler_init(void)
> > +{
> > + register_keyhandler('1', ns8250_keyhandler_show,
> > + "dump virtual NS8250 state", 0);
> > + register_keyhandler('2', ns8250_keyhandler_irq,
> > + "trigger IRQ from virtual NS8250", 0);
> > +}
> > +#else
> > +static inline void ns8250_keyhandler_init(void)
> > +{
> > +}
> > +static inline void ns8250_dump(struct vuart_ns8250 vdev)
> > +{
> > +}
> > +#endif / #if defined(NS8250_DEBUG) /
> > +
> > /
> > * Emulate I/O access to NS8250 register.
> > */
> > @@ -688,6 +807,7 @@ static int cf_check ns8250_io_handle(
> > rc =3D X86EMUL_OKAY;
> >
> > out:
> > + ns8250_dump(vdev);
>
>
> Likely a remaining of some debugging? Printing the state for every
> access is too verbose.

That was actually helpful for debugging.
Those calls will be compiled-out in default build w/ emulator.

>
> > spin_unlock(&vdev->lock);
> >
> > return rc;
> > @@ -786,6 +906,7 @@ static int ns8250_init(struct domain *d, const stru=
ct resource *r)
> > }
> >
> > spin_lock_init(&vdev->lock);
> > + ns8250_keyhandler_init();
>
>
> The keyhandler init should be in a __initcall(), otherwise you are
> calling it for each domain creation that has a vUART.

Thank you.
I nuked vUART keyhandlers altogether in v3.

>
> Thanks, Roger.



