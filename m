Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5093CA01217
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 04:26:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865145.1276432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTunS-0004rC-Lp; Sat, 04 Jan 2025 03:25:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865145.1276432; Sat, 04 Jan 2025 03:25:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTunS-0004pN-Iz; Sat, 04 Jan 2025 03:25:54 +0000
Received: by outflank-mailman (input) for mailman id 865145;
 Sat, 04 Jan 2025 03:25:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTunR-0004pH-6y
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 03:25:53 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9916942e-ca4b-11ef-99a4-01e77a169b0f;
 Sat, 04 Jan 2025 04:25:51 +0100 (CET)
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
X-Inumbo-ID: 9916942e-ca4b-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1735961150; x=1736220350;
	bh=ZqvdAzQRVUdyXekI041PtKo/lVVHva43F0eF5q4Wf+s=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=VtkZYuhbMLaF23mOgP3h9AuEIrDmaoMM8iHawXRNsyh12OB/HtVoAbJFkseDew/dP
	 dhW3Wlby93ut+DCffGmmOfCd7WvoXRE7jhAsrKMYbMiSyTu+YITJo1fTNQGr8LYLa8
	 4RvKpuJ6lG66YE/QO+CYH8yDv1q7Wk0fkhBnFoPPvPZ6e29rcFBLd3bMyc7PW1Rmjo
	 JXErW9Wsh3qgry4775Dehv/cyLSdv5l6RfJdT9VUYIYx6pW0hwNjbamxQtiWp1NZVU
	 JqVe7hYASTq1v1b7Vx79JpLkbRmFl98d28Ng7OnxyvJZXtQv9GyM2vG5evUFVO4qPS
	 xRsGrauhgAJ+g==
Date: Sat, 04 Jan 2025 03:25:44 +0000
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 22/35] xen/console: introduce handle_keypress_in_domain()
Message-ID: <l_g6VhEL4IeDKa54dVzpLQ6e3hPk5jyvFhPfFOnplJFSy3OT-kFvfSqa6PuRJIr1HL58WfNomF7u6Rlzuoz2pwwm-1q_7eU8GHh_qeOh17I=@proton.me>
In-Reply-To: <Z1rAJwSJvD-6rtM7@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-22-e9aa923127eb@ford.com> <Z1rAJwSJvD-6rtM7@macbook.local>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 31f05cccb46846b28f406896ad0e5c3cb02f4dba
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thursday, December 12th, 2024 at 2:51 AM, Roger Pau Monn=C3=A9 <roger.pa=
u@citrix.com> wrote:

>
>
> On Thu, Dec 05, 2024 at 08:41:52PM -0800, Denis Mukhin via B4 Relay wrote=
:
>
> > From: Denis Mukhin dmukhin@ford.com
> >
> > With introduction of NS8250 emulator for x86, the logic of switching co=
nsole
> > focus gets more convoluted: HVM domain w/ NS8205 must be able to receiv=
e the
> > physical console input for guest VM debugging.
> >
> > Also, existing code does not honor `hardware_dom=3D` xen command line p=
arameter
> > (hardware domain ID does not necessarily starts from 0).
> >
> > Introduce handle_keypress_in_domain() to account for all scenarios of c=
onsole
> > input forwarding.
> >
> > Signed-off-by: Denis Mukhin dmukhin@ford.com
> > ---
> > xen/drivers/char/console.c | 72 +++++++++++++++++++++++++++------------=
-------
> > 1 file changed, 42 insertions(+), 30 deletions(-)
> >
> > diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> > index 6261bdb5a2ac1075bc89fa408c0fd6cfef380ae6..ce3639a4cdcda00ea63e3bf=
119bc3b242cbfdf6a 100644
> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -570,14 +570,16 @@ static void console_init_owner(void)
> > console_set_owner(domid);
> > }
> >
> > -static void __serial_rx(char c)
> > +static void handle_keypress_in_domain(struct domain *d, char c)
> > {
> > - switch ( console_owner )
> > - {
> > - case DOMID_XEN:
> > - return handle_keypress(c, false);
> > + int rc =3D 0;
> >
> > - case 0:
> > + /*
> > + * Deliver input to the hardware domain buffer.
> > + * NB: must be the first check: hardware domain may have emulated UART=
.
> > + */
> > + if ( d =3D=3D hardware_domain )
>
>
> is_hardware_domain(d)

Fixed.

>
> > + {
> > /*
> > * Deliver input to the hardware domain buffer, unless it is
> > * already full.
> > @@ -590,34 +592,44 @@ static void __serial_rx(char c)
> > * getting stuck.
> > */
> > send_global_virq(VIRQ_CONSOLE);
> > - break;
> > -
> > -#ifdef CONFIG_SBSA_VUART_CONSOLE
> > - default:
> > - {
> > - struct domain d =3D rcu_lock_domain_by_id(console_owner);
> > -
> > - /
> > - * If we have a properly initialized vpl011 console for the
> > - * domain, without a full PV ring to Dom0 (in that case input
> > - * comes from the PV ring), then send the character to it.
> > - /
> > - if ( d !=3D NULL )
> > - vpl011_rx_char_xen(d, c);
> > - else
> > - printk("Cannot send chars to Dom%d: no UART available\n",
> > - console_owner);
> > -
> > - if ( d !=3D NULL )
> > - rcu_unlock_domain(d);
> > -
> > - break;
> > }
> > + /
> > + * Deliver input to the emulated UART.
> > + */
>
>
> For one-line comments you can use:
> /* Deliver input to the emulated UART. */

Fixed.

>
> I would however place the comment inside the `if` body.

Sure, no problem. Fixed.

>
> > + else if ( domain_has_vuart(d) )
> > + {
> > +#if defined(CONFIG_SBSA_VUART_CONSOLE)
> > + rc =3D vpl011_rx_char_xen(d, c);
> > #endif
>
>
> You can possibly make the preprocessor conditional also contain the
> if condition itself? As otherwise the if condition is dead code.

I removed the ifdef in v3 and reworked domain_has_vuart()
so that it checks build flag and d->arch.emulated_flags under the hood.

>
> > }
> > -
> > + /*
> > + * Deliver input to the PV shim console.
> > + */
> > if ( consoled_is_enabled() )
> > - consoled_guest_tx(c);
> > + rc =3D consoled_guest_tx(c);
> > +
> > + if ( rc && rc !=3D -ENODEV )
> > + printk(KERN_WARNING "console input domain %d: not ready: %d\n",
> > + d->domain_id, rc);
>
>
> XENLOG_ERR instead of KERN_WARNING, and use %pd to print domains, ie:

Addressed.

>
> printk(XENLOG_ERR "%pd: delivery of console input failed: %d\n",
> d, rc);
>
> And I wonder whether this should be printed just once per domain,
> or whether the domain should be marked as not having a console
> (is_console =3D false) after delivery of input keys failed.
>
> Otherwise you could spam the console with such error messages on every
> serial key press.

Thanks; fixed.

>
> > +}
> > +
> > +static void __serial_rx(char c)
> > +{
> > + struct domain *d;
> > +
> > + if ( console_owner =3D=3D DOMID_XEN )
> > + {
> > + handle_keypress(c, false);
> > + return;
> > + }
> > +
> > + d =3D rcu_lock_domain_console_owner();
> > + if ( d =3D=3D NULL )
> > + return;
> > +
> > + handle_keypress_in_domain(d, c);
>
>
> Is __serial_rx() the only caller of handle_keypress_in_domain() after
> the series? If so, I'm not sure it's worth placing this logic in a
> separate function.

Yep, that is the only caller; fixed.

>
> Thanks, Roger.



