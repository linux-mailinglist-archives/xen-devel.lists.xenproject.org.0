Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D51C3A01218
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 04:31:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865154.1276443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTusE-0006Ux-7j; Sat, 04 Jan 2025 03:30:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865154.1276443; Sat, 04 Jan 2025 03:30:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTusE-0006Rw-4X; Sat, 04 Jan 2025 03:30:50 +0000
Received: by outflank-mailman (input) for mailman id 865154;
 Sat, 04 Jan 2025 03:30:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTusC-0006KV-2m
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 03:30:49 +0000
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48f80ef8-ca4c-11ef-a0de-8be0dac302b0;
 Sat, 04 Jan 2025 04:30:46 +0100 (CET)
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
X-Inumbo-ID: 48f80ef8-ca4c-11ef-a0de-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=s7ibhm7tszfylmv2bzkghwvaqi.protonmail; t=1735961444; x=1736220644;
	bh=7sJpwoc7SabuRRSJdzdClF0vEc0inNR6LdstjmlKaUs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=MrRZKslsSgFSW4Jn0QBhCw2A1OOK8v07M7YbjntdYI+tliupGm1FdcvlIABzA4jko
	 lz4UZAkvj97Wkj5vAwHRR/v25vfGrPYcaVBsDB/0nv6LNW4/CB36fe7Xkb1srIgSuW
	 wGZc2+jJQgAwmtcyH+ElufLII37Y8lFYh7czydxLuGs+6qkSYNzByQFmLMIp3w67v2
	 gQigJEbTH+Y6tLu+dMtVjM3E7c3U5S7SZNpXuZmE1kjhcoLeUuKSORNMI7oD/vreTK
	 sD+2DZjhEBgbTcEKp6gLe/U77jtPyQPHPaDeHBmc9OlWXMsYb0moQEZFPH9uvCYZYD
	 8622WU2Zs62/w==
Date: Sat, 04 Jan 2025 03:30:40 +0000
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 19/35] xen/console: introduce console_set_owner()
Message-ID: <Nzs8m4tgOs8mh44axM9sAfsp2GGMk34p5Oi0dtXh8rLbKzHXmMtMXK_d_AJy-gSQuGRygaZbsvhy9QFvsCc0yyMiqzXslUNID1os1CCzNrA=@proton.me>
In-Reply-To: <Z1q3COsFN3J9G60E@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-19-e9aa923127eb@ford.com> <Z1q3COsFN3J9G60E@macbook.local>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: d86023204dae09867087e1731bfec1b25d222f43
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thursday, December 12th, 2024 at 2:12 AM, Roger Pau Monn=C3=A9 <roger.pa=
u@citrix.com> wrote:

>
>
> On Thu, Dec 05, 2024 at 08:41:49PM -0800, Denis Mukhin via B4 Relay wrote=
:
>
> > From: Denis Mukhin dmukhin@ford.com
> >
> > console_set_owner() is introduced for setting the new console owner.
> >
> > Switches console owner to domain ID vs range of integer numbers mapped =
to
> > domain IDs.
> >
> > This a public API to console driver, will be used in the follow on code=
 change.
> >
> > Signed-off-by: Denis Mukhin dmukhin@ford.com
> > ---
> > xen/drivers/char/console.c | 122 ++++++++++++++++++++++++++------------=
-------
> > xen/include/xen/console.h | 1 +
> > 2 files changed, 71 insertions(+), 52 deletions(-)
> >
> > diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> > index 8cbac54c66044ae8581e486a782102b75c8bfaa9..52cf64dbf6fd18d599cb888=
35d03501a23b3e3c4 100644
> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -463,82 +463,100 @@ static void cf_check dump_console_ring_key(unsig=
ned char key)
> >
> > /*
> > * CTRL-<switch_char> changes input direction, rotating among Xen, Dom0,
> > - * and the DomUs started from Xen at boot.
> > + * and the DomUs.
> > /
> > #define switch_code (opt_conswitch[0]-'a'+1)
> > +
> > /
> > - * console_owner=3D0 =3D> input to xen
> > - * console_owner=3D1 =3D> input to dom0 (or the sole shim domain)
> > - * console_owner=3DN =3D> input to dom(N-1)
> > + * Current console owner domain ID: either Xen or domain w/ d->is_cons=
ole =3D=3D
> > + * true.
> > + *
> > + * Initialized in console_endboot().
> > */
> > -static unsigned int __read_mostly console_owner =3D 0;
> > +static domid_t __read_mostly console_owner;
>
>
> Should this be initialized to DOMID_XEN? I assume it doesn't make
> much difference because the variable is not checked before
> console_endboot() anyway, but it might be safer to initialize to a
> value that assigns the console to Xen.

Fixed.

>
> > -#define max_console_rx (max_init_domid + 1)
> > +static struct domain *rcu_lock_domain_console_by_id(domid_t domid)
> > +{
> > + struct domain *d;
> > +
> > + d =3D rcu_lock_domain_by_id(domid);
> > +
>
>
> Nit: I would remove this newline.

Fixed.

>
> > + if ( d =3D=3D NULL )
> > + return NULL;
> > +
> > + if ( d->is_console )
> > + return d;
> > +
> > + rcu_unlock_domain(d);
> > +
> > + return NULL;
> > +}
> >
> > -#ifdef CONFIG_SBSA_VUART_CONSOLE
> > /* Make sure to rcu_unlock_domain after use */
> > struct domain *rcu_lock_domain_console_owner(void)
> > {
> > - if ( console_owner =3D=3D 0 )
> > - return NULL;
> > - return rcu_lock_domain_by_id(console_owner - 1);
> > + return rcu_lock_domain_console_by_id(console_owner);
> > }
> > -#endif
> >
> > -static void console_find_owner(void)
> > +static bool console_owner_possible(domid_t domid)
> > {
> > - unsigned int next_rx =3D console_owner;
> > -
> > - /*
> > - * Rotate among Xen, dom0 and boot-time created domUs while skipping
> > - * switching serial input to non existing domains.
> > - /
> > - for ( ; ; )
> > - {
> > - domid_t domid;
> > - struct domain d;
> > -
> > - if ( next_rx++ >=3D max_console_rx )
> > - {
> > - console_owner =3D 0;
> > - printk("* Serial input to Xen");
> > - break;
> > - }
> > -
> > - if ( consoled_is_enabled() && next_rx =3D=3D 1 )
> > - domid =3D get_initial_domain_id();
> > - else
> > - domid =3D next_rx - 1;
> > -
> > - d =3D rcu_lock_domain_by_id(domid);
> > - if ( d =3D=3D NULL )
> > - continue;
> > -
> > - if ( d->is_console )
> > - {
> > - rcu_unlock_domain(d);
> > - console_owner =3D next_rx;
> > - printk("*** Serial input to DOM%u", domid);
> > - break;
> > - }
> > + struct domain *d;
> >
> > + d =3D rcu_lock_domain_console_by_id(domid);
> > + if ( d !=3D NULL )
> > rcu_unlock_domain(d);
> > - }
> > +
> > + return d !=3D NULL;
> > +}
> > +
> > +int console_set_owner(domid_t domid)
> > +{
> > + if ( domid =3D=3D DOMID_XEN )
> > + printk("*** Serial input to Xen");
> > + else if ( console_owner_possible(domid) )
> > + printk("*** Serial input to DOM%u", domid);
> > + else
> > + return -ENOENT;
> > +
> > + console_owner =3D domid;
> >
> > if ( switch_code )
> > printk(" (type 'CTRL-%c' three times to switch input)",
> > opt_conswitch[0]);
> > printk("\n");
> > +
> > + return 0;
> > +}
> > +
> > +/*
> > + * Switch console input focus.
> > + * Rotates input focus among Xen, dom0 and boot-time created domUs whi=
le
> > + * skipping switching serial input to non existing domains.
> > + */
> > +static void console_find_owner(void)
> > +{
> > + domid_t i, n =3D max_init_domid + 1;
>
>
> n can be made const, I would even rename to nr for clarity, but that's
> personal taste.

`max_init_domid` can change at run-time actually (e.g. after `xl create`).
I kept `n` as is.

>
> > +
> > + if ( console_owner =3D=3D DOMID_XEN )
> > + i =3D get_initial_domain_id();
> > + else
> > + i =3D console_owner + 1;
> > +
> > + for ( ; i < n; i++ )
> > + if ( !console_set_owner(i) )
> > + break;
>
>
> Hm, that could be a non-trivial amount of iteration if max_init_domid
> is bumped for every domain created as you have it in patch 11/35
> (albeit I'm not sure that was intended?)

Yes, `max_init_domid` is advanced on each domain creation (v3).

>
> > + if ( i =3D=3D n )
> > + console_set_owner(DOMID_XEN);
> > }
> >
> > static void __serial_rx(char c)
> > {
> > switch ( console_owner )
> > {
> > - case 0:
> > + case DOMID_XEN:
> > return handle_keypress(c, false);
> >
> > - case 1:
> > + case 0:
>
>
> If console_owner now strictly contains a domid you cannot assume that
> domid 0 is the hardware domain, you will need to handle this
> differently and check whether the domain pointed by console_owner
> passes the is_hardware_domain() check.

Fixed.

>
> > /*
> > * Deliver input to the hardware domain buffer, unless it is
> > * already full.
> > @@ -556,7 +574,7 @@ static void __serial_rx(char c)
> > #ifdef CONFIG_SBSA_VUART_CONSOLE
> > default:
> > {
> > - struct domain *d =3D rcu_lock_domain_by_id(console_owner - 1);
> > + struct domain *d =3D rcu_lock_domain_by_id(console_owner);
> >
> > /*
> > * If we have a properly initialized vpl011 console for the
> > @@ -567,7 +585,7 @@ static void __serial_rx(char c)
> > vpl011_rx_char_xen(d, c);
> > else
> > printk("Cannot send chars to Dom%d: no UART available\n",
> > - console_owner - 1);
> > + console_owner);
> >
> > if ( d !=3D NULL )
> > rcu_unlock_domain(d);
> > @@ -1126,7 +1144,7 @@ void __init console_endboot(void)
> > * a useful 'how to switch' message.
> > */
> > if ( opt_conswitch[1] =3D=3D 'x' )
> > - console_owner =3D max_console_rx;
> > + console_owner =3D DOMID_XEN;
>
>
> Hm, are you sure this still works as expected? Setting console_owner
> =3D=3D DOMID_XEN will cause the call to switch_serial_input() below to
> switch the console back to the first domain in the system. Also
> initializing console_owner to 0 by default would also cause the call
> to switch_serial_input() to possibly switch it to the first domain
> after domid 0 (or back to Xen).

TBH, I did not test w/ conswitch=3Dx originally, but after addressing
your other feedback that is now fixed.
Thank you.

>
> Thanks, Roger.



