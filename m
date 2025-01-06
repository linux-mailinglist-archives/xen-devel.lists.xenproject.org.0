Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F24A03131
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 21:12:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865970.1277266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUtSD-0008Vo-U7; Mon, 06 Jan 2025 20:12:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865970.1277266; Mon, 06 Jan 2025 20:12:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUtSD-0008T2-QR; Mon, 06 Jan 2025 20:12:01 +0000
Received: by outflank-mailman (input) for mailman id 865970;
 Mon, 06 Jan 2025 20:12:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4xez=T6=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tUtKT-0002s4-7N
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 20:04:02 +0000
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch
 [79.135.106.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e4eea91-cc69-11ef-a0df-8be0dac302b0;
 Mon, 06 Jan 2025 21:04:00 +0100 (CET)
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
X-Inumbo-ID: 5e4eea91-cc69-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1736193838; x=1736453038;
	bh=GlOMQvqo4cIB66QIoN3r6E1UFBz8QKBPa0xck1ph4pI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Kt+wUK0IZhGAMFUIJYZWm463E0gFPCxB9SW5uB77S/xrSTL6Szfzf6Inywknz1BCU
	 /c6inUJV8ct9RWWkWm1xop2JpnZQn9fqKR3sdIvQoNG8RhXZ39iiM2R6Fo2CMBQqW1
	 8jpxH5p0KyN/k5BGlQH7UwD5ggySe75StbSMSw3hgOilE+HQVq0lhXqi5mjJ0egPNf
	 JJ+SM7FBy1O6e7+IJKWcegkKnwvhrDk8oKh5yjLqTCejTOFKz5QvmmpRJwTMc3K4C+
	 TK88iN82AkARj/r8PAcphFOhctBgJSNSMoS1tIN2EGOVQ6PKvsJxM8CxCUZD4mVuO+
	 6hy6Elylx8D7g==
Date: Mon, 06 Jan 2025 20:03:52 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: Denis Mukhin <dmkhn@proton.me>, dmukhin@ford.com, xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 19/35] xen/console: introduce console_set_owner()
Message-ID: <WdwwQV5SUUes7R0BWeDutEQWGvnv_YSB8yc-jMeij_uOqMPVYTpAkpmojwppDdKmact1UU3eXZ61TMZZf7s3JKMlG8EnNEaCGbPbd_7Qo30=@proton.me>
In-Reply-To: <3b9635bc-e196-4a7e-95ea-277172ae052a@suse.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-19-e9aa923127eb@ford.com> <Z1q3COsFN3J9G60E@macbook.local> <Nzs8m4tgOs8mh44axM9sAfsp2GGMk34p5Oi0dtXh8rLbKzHXmMtMXK_d_AJy-gSQuGRygaZbsvhy9QFvsCc0yyMiqzXslUNID1os1CCzNrA=@proton.me> <3b9635bc-e196-4a7e-95ea-277172ae052a@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: eca3f3d04e6634835ca46d7ef2ae0dc7d21355df
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Monday, January 6th, 2025 at 1:58 AM, Jan Beulich <jbeulich@suse.com> wr=
ote:

>=20
>=20
> On 04.01.2025 04:30, Denis Mukhin wrote:
>=20
> > On Thursday, December 12th, 2024 at 2:12 AM, Roger Pau Monn=C3=A9 roger=
.pau@citrix.com wrote:
> >=20
> > > On Thu, Dec 05, 2024 at 08:41:49PM -0800, Denis Mukhin via B4 Relay w=
rote:
> > >=20
> > > > --- a/xen/drivers/char/console.c
> > > > +++ b/xen/drivers/char/console.c
> > > > @@ -463,82 +463,100 @@ static void cf_check dump_console_ring_key(u=
nsigned char key)
> > > >=20
> > > > /*
> > > > * CTRL-<switch_char> changes input direction, rotating among Xen, D=
om0,
> > > > - * and the DomUs started from Xen at boot.
> > > > + * and the DomUs.
> > > > /
> > > > #define switch_code (opt_conswitch[0]-'a'+1)
> > > > +
> > > > /
> > > > - * console_owner=3D0 =3D> input to xen
> > > > - * console_owner=3D1 =3D> input to dom0 (or the sole shim domain)
> > > > - * console_owner=3DN =3D> input to dom(N-1)
> > > > + * Current console owner domain ID: either Xen or domain w/ d->is_=
console =3D=3D
> > > > + * true.
> > > > + *
> > > > + * Initialized in console_endboot().
> > > > */
> > > > -static unsigned int __read_mostly console_owner =3D 0;
> > > > +static domid_t __read_mostly console_owner;
> > >=20
> > > Should this be initialized to DOMID_XEN? I assume it doesn't make
> > > much difference because the variable is not checked before
> > > console_endboot() anyway, but it might be safer to initialize to a
> > > value that assigns the console to Xen.
> >=20
> > Fixed.
> >=20
> > > > -#define max_console_rx (max_init_domid + 1)
> > > > +static struct domain *rcu_lock_domain_console_by_id(domid_t domid)
> > > > +{
> > > > + struct domain *d;
> > > > +
> > > > + d =3D rcu_lock_domain_by_id(domid);
> > > > +
> > >=20
> > > Nit: I would remove this newline.
> >=20
> > Fixed.
> >=20
> > > > + if ( d =3D=3D NULL )
> > > > + return NULL;
> > > > +
> > > > + if ( d->is_console )
> > > > + return d;
> > > > +
> > > > + rcu_unlock_domain(d);
> > > > +
> > > > + return NULL;
> > > > +}
> > > >=20
> > > > -#ifdef CONFIG_SBSA_VUART_CONSOLE
> > > > /* Make sure to rcu_unlock_domain after use */
> > > > struct domain *rcu_lock_domain_console_owner(void)
> > > > {
> > > > - if ( console_owner =3D=3D 0 )
> > > > - return NULL;
> > > > - return rcu_lock_domain_by_id(console_owner - 1);
> > > > + return rcu_lock_domain_console_by_id(console_owner);
> > > > }
> > > > -#endif
> > > >=20
> > > > -static void console_find_owner(void)
> > > > +static bool console_owner_possible(domid_t domid)
> > > > {
> > > > - unsigned int next_rx =3D console_owner;
> > > > -
> > > > - /*
> > > > - * Rotate among Xen, dom0 and boot-time created domUs while skippi=
ng
> > > > - * switching serial input to non existing domains.
> > > > - /
> > > > - for ( ; ; )
> > > > - {
> > > > - domid_t domid;
> > > > - struct domain d;
> > > > -
> > > > - if ( next_rx++ >=3D max_console_rx )
> > > > - {
> > > > - console_owner =3D 0;
> > > > - printk("* Serial input to Xen");
> > > > - break;
> > > > - }
> > > > -
> > > > - if ( consoled_is_enabled() && next_rx =3D=3D 1 )
> > > > - domid =3D get_initial_domain_id();
> > > > - else
> > > > - domid =3D next_rx - 1;
> > > > -
> > > > - d =3D rcu_lock_domain_by_id(domid);
> > > > - if ( d =3D=3D NULL )
> > > > - continue;
> > > > -
> > > > - if ( d->is_console )
> > > > - {
> > > > - rcu_unlock_domain(d);
> > > > - console_owner =3D next_rx;
> > > > - printk("*** Serial input to DOM%u", domid);
> > > > - break;
> > > > - }
> > > > + struct domain *d;
> > > >=20
> > > > + d =3D rcu_lock_domain_console_by_id(domid);
> > > > + if ( d !=3D NULL )
> > > > rcu_unlock_domain(d);
> > > > - }
> > > > +
> > > > + return d !=3D NULL;
> > > > +}
> > > > +
> > > > +int console_set_owner(domid_t domid)
> > > > +{
> > > > + if ( domid =3D=3D DOMID_XEN )
> > > > + printk("*** Serial input to Xen");
> > > > + else if ( console_owner_possible(domid) )
> > > > + printk("*** Serial input to DOM%u", domid);
> > > > + else
> > > > + return -ENOENT;
> > > > +
> > > > + console_owner =3D domid;
> > > >=20
> > > > if ( switch_code )
> > > > printk(" (type 'CTRL-%c' three times to switch input)",
> > > > opt_conswitch[0]);
> > > > printk("\n");
> > > > +
> > > > + return 0;
> > > > +}
> > > > +
> > > > +/*
> > > > + * Switch console input focus.
> > > > + * Rotates input focus among Xen, dom0 and boot-time created domUs=
 while
> > > > + * skipping switching serial input to non existing domains.
> > > > + */
> > > > +static void console_find_owner(void)
> > > > +{
> > > > + domid_t i, n =3D max_init_domid + 1;
> > >=20
> > > n can be made const, I would even rename to nr for clarity, but that'=
s
> > > personal taste.
> >=20
> > `max_init_domid` can change at run-time actually (e.g. after `xl create=
`).
> > I kept `n` as is.
>=20
>=20
> How does max_init_domid potentially changing affect (possible) const-ness=
 of n?

Sorry, what I meant is I kept the original name as is in v3.
Forgot to address `const`.

>=20
> However it changing, ...
>=20
> > > > +
> > > > + if ( console_owner =3D=3D DOMID_XEN )
> > > > + i =3D get_initial_domain_id();
> > > > + else
> > > > + i =3D console_owner + 1;
> > > > +
> > > > + for ( ; i < n; i++ )
> > > > + if ( !console_set_owner(i) )
> > > > + break;
> > >=20
> > > Hm, that could be a non-trivial amount of iteration if max_init_domid
> > > is bumped for every domain created as you have it in patch 11/35
> > > (albeit I'm not sure that was intended?)
> >=20
> > Yes, `max_init_domid` is advanced on each domain creation (v3).
>=20
>=20
> ... as you confirm here, undermines what it's used for right now (if I'm
> not mistaken), and would render the variable misnamed.

Yes, the name will be a bit confusing.
Will something like `last_domid` work?

>=20
> Jan



