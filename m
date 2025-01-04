Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DEEA01215
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 04:23:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865136.1276422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTulE-0004IY-BZ; Sat, 04 Jan 2025 03:23:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865136.1276422; Sat, 04 Jan 2025 03:23:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTulE-0004GV-7h; Sat, 04 Jan 2025 03:23:36 +0000
Received: by outflank-mailman (input) for mailman id 865136;
 Sat, 04 Jan 2025 03:23:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTulC-0004GJ-1j
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 03:23:34 +0000
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46299bfb-ca4b-11ef-99a4-01e77a169b0f;
 Sat, 04 Jan 2025 04:23:32 +0100 (CET)
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
X-Inumbo-ID: 46299bfb-ca4b-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1735961011; x=1736220211;
	bh=wSlvcvz7YaxKsrcRmxXl53lexT/W3qQfPGAYeSHaIFI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=TbNdSfFfKaiY51TITzaMKnnDs7pf0w1XcZ0yHTP7rmIp8McFaKss7DBAJoVSVPPS0
	 tq+2CKQ8ipcca/MKDscChxp/FTx0s9ymEsTrBLk6eBStOo9+Mw64/YWlXzQDDoOqT0
	 VDkvR+UZanoxd4I1JJbv3Dt0YwqhxOYo6GQxuJFQWlJCm9ze4MK+T6v3fEJEtOX3Wt
	 P2sA3/zG/ork0iTOv2b6RFJYyZ+M8Z5rI26pvTawmocsOdr/jrrSLuaziJEcoDBSji
	 S1qSTHSrJxGALnmA7KijJRllDozhZBGyB7tkp9T+BFcFwW5DNCbIfhggosHb39vFY/
	 OqUcA1KwljItA==
Date: Sat, 04 Jan 2025 03:23:24 +0000
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 21/35] xen/console: introduce console_init_owner()
Message-ID: <lMx7K935PGMAY1vvXEQXe2hhN_55g1m_0VBZngzoddGl2zVl9uvxh2BSZgSAkE5n6gmtBVXWs_r42k69E1cTf6kDj_1Tx-ndx3N_H01w40Y=@proton.me>
In-Reply-To: <Z1q5v3XkBo1VxT4p@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-21-e9aa923127eb@ford.com> <Z1q5v3XkBo1VxT4p@macbook.local>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 8797bec7533a5505a073afdaffee2b8ce230457e
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thursday, December 12th, 2024 at 2:23 AM, Roger Pau Monn=C3=A9 <roger.pa=
u@citrix.com> wrote:

>
>
> On Thu, Dec 05, 2024 at 08:41:51PM -0800, Denis Mukhin via B4 Relay wrote=
:
>
> > From: Denis Mukhin dmukhin@ford.com
> >
> > console_init_owner() is introduced for selecting the boot-time console =
owner.
> >
> > Signed-off-by: Denis Mukhin dmukhin@ford.com
> > ---
> > xen/drivers/char/console.c | 27 +++++++++++++++++----------
> > 1 file changed, 17 insertions(+), 10 deletions(-)
> >
> > diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> > index a8ab5c2bcb98e4cadf9ad2c9ad28d297977d0557..6261bdb5a2ac1075bc89fa4=
08c0fd6cfef380ae6 100644
> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -554,6 +554,22 @@ static void console_find_owner(void)
> > console_set_owner(DOMID_XEN);
> > }
> >
> > +static void console_init_owner(void)
>
>
> __init attribute missing (given current call context), but see below.
>
> > +{
> > + domid_t domid;
> > +
> > + /*
> > + * If user specifies so, we fool the switch routine to redirect input
> > + * straight back to Xen.
> > + */
> > + if ( opt_conswitch[1] =3D=3D 'x' )
> > + domid =3D DOMID_XEN;
> > + else
> > + domid =3D get_initial_domain_id();
> > +
> > + console_set_owner(domid);
> > +}
> > +
> > static void __serial_rx(char c)
> > {
> > switch ( console_owner )
> > @@ -1143,14 +1159,6 @@ void __init console_endboot(void)
> >
> > video_endboot();
> >
> > - /*
> > - * If user specifies so, we fool the switch routine to redirect input
> > - * straight back to Xen. I use this convoluted method so we still prin=
t
> > - * a useful 'how to switch' message.
> > - */
> > - if ( opt_conswitch[1] =3D=3D 'x' )
> > - console_owner =3D DOMID_XEN;
> > -
> > register_keyhandler('w', dump_console_ring_key,
> > "synchronously dump console ring buffer (dmesg)", 0);
> > register_irq_keyhandler('+', &do_inc_thresh,
> > @@ -1160,8 +1168,7 @@ void __init console_endboot(void)
> > register_irq_keyhandler('G', &do_toggle_guest,
> > "toggle host/guest log level adjustment", 0);
> >
> > - /* Serial input is directed to DOM0 by default. */
> > - console_find_owner();
> > + console_init_owner();
>
>
> Oh, so this is what fixes the regression introduced in patch 19/35.
> THB I'm not sure it's worth introducing the console_init_owner()
> helper if it's just for this usage. You could do:
>
> console_set_owner(opt_conswitch[1] =3D=3D 'x' ? DOMID_XEN
> : get_initial_domain_id());

Right, thank you.
Addressed in v3.

>
> Thanks, Roger.



