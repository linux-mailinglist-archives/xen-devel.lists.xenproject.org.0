Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C57ABA0122A
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 04:57:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865205.1276502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTvHf-0005DP-GI; Sat, 04 Jan 2025 03:57:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865205.1276502; Sat, 04 Jan 2025 03:57:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTvHf-0005B2-D6; Sat, 04 Jan 2025 03:57:07 +0000
Received: by outflank-mailman (input) for mailman id 865205;
 Sat, 04 Jan 2025 03:57:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTvHd-0004gB-Qc
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 03:57:05 +0000
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch
 [79.135.106.31]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f54666a8-ca4f-11ef-99a4-01e77a169b0f;
 Sat, 04 Jan 2025 04:57:04 +0100 (CET)
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
X-Inumbo-ID: f54666a8-ca4f-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1735963022; x=1736222222;
	bh=0xCrTmqSGdZK91yhbegSZQuG87yaWMwjDCGfXp/h/6o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=bqLgCNogNUdF5Jf685cQpS6yXerXO3szRpouK6BxWNimM6rXm4B9PyO6X2E5Jd2rC
	 adPgyNoT4A2+lsP+l8OEYdvgC2Z+9Ha5wd9DlPF4zcbomo4uF2dol4DtXhkM/Ajo2L
	 gtVU1xVpbSYR3/JFeDtu6aCGj9KVVOtGzKof4GhdQTlxuVF8/k/2Rj+q+va3wN57rz
	 I0kKWzDuYoZ25dfF8aDOXfxXpVufax1t/8jtdE01RCST2bqhlj1j+CgfvM1KGNPBq1
	 7R2n7aqpPlFTJnw2ft3eg/abjRxt8BzeGDJk3JxtwhwOmW08jIjS6UQL/WECtDbM6l
	 X3fVC3qZhSiTg==
Date: Sat, 04 Jan 2025 03:56:57 +0000
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 27/35] xen/console: flush console ring to physical console
Message-ID: <IKbFL_PYBasA9J8ETcYRY47L6fcBAyfZYY1aGiC7plAQ0d0I920_WIysrhHrd-q6U_SbLKEjGdZqfh51TZaGmSNjwQoOLOx9tSfy7pkxkBQ=@proton.me>
In-Reply-To: <Z1rxWJtUGsUsMn91@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-27-e9aa923127eb@ford.com> <Z1rxWJtUGsUsMn91@macbook.local>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: e6ff59a3c0c57259cfed49fe8bdd469137a35858
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thursday, December 12th, 2024 at 6:21 AM, Roger Pau Monn=C3=A9 <roger.pa=
u@citrix.com> wrote:

>
>
> On Thu, Dec 05, 2024 at 08:41:57PM -0800, Denis Mukhin via B4 Relay wrote=
:
>
> > From: Denis Mukhin dmukhin@ford.com
> >
> > Messages printed before the serial and VGA consoles are initialized end=
 up in
> > the internal console buffer (conring). Flush contents of conring to all
> > external consoles after external consoles are fully initialied.
> >
> > Link: https://gitlab.com/xen-project/xen/-/issues/184
> > Signed-off-by: Denis Mukhin dmukhin@ford.com
> > ---
> > xen/drivers/char/console.c | 54 +++++++++++++++++++++++++++++++++------=
-------
> > 1 file changed, 39 insertions(+), 15 deletions(-)
> >
> > diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> > index 581ee22b85302a54db5b9d5d28e8b2d689d31403..a26daee9c4c4b1134d0ae3d=
105ffdb656340b6df 100644
> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -426,23 +426,35 @@ void console_serial_puts(const char *s, size_t nr=
)
> > pv_console_puts(s, nr);
> > }
> >
> > -static void cf_check dump_console_ring_key(unsigned char key)
> > +/*
> > + * Write characters to physical console(s).
> > + * That covers:
> > + * - serial console;
> > + * - video output.
> > + */
> > +static void console_puts(const char str, size_t len)
> > +{
> > + ASSERT(rspin_is_locked(&console_lock));
> > +
> > + console_serial_puts(str, len);
> > + video_puts(str, len);
> > +}
> > +
> > +/
> > + * Flush contents of the conring to the physical console devices.
> > + */
> > +static int console_flush(void)
> > {
> > uint32_t idx, len, sofar, c;
> > unsigned int order;
> > char *buf;
> >
> > - printk("'%c' pressed -> dumping console ring buffer (dmesg)\n", key);
> > -
> > - /* create a buffer in which we'll copy the ring in the correct
> > - order and NUL terminate */
> > order =3D get_order_from_bytes(conring_size + 1);
> > buf =3D alloc_xenheap_pages(order, 0);
> > if ( buf =3D=3D NULL )
> > - {
> > - printk("unable to allocate memory!\n");
> > - return;
> > - }
> > + return -ENOMEM;
> > +
> > + nrspin_lock_irq(&console_lock);
> >
> > c =3D conringc;
> > sofar =3D 0;
> > @@ -457,10 +469,23 @@ static void cf_check dump_console_ring_key(unsign=
ed char key)
> > c +=3D len;
> > }
> >
> > - console_serial_puts(buf, sofar);
> > - video_puts(buf, sofar);
> > + console_puts(buf, sofar);
> > +
> > + nrspin_unlock_irq(&console_lock);
> >
> > free_xenheap_pages(buf, order);
> > +
> > + return 0;
> > +}
> > +
> > +static void cf_check dump_console_ring_key(unsigned char key)
> > +{
> > + int rc;
> > +
> > + printk("'%c' pressed -> dumping console ring buffer (dmesg)\n", key);
> > + rc =3D console_flush();
> > + if ( rc )
> > + printk("failed to dump console ring buffer: %d\n", rc);
> > }
> >
> > /*
> > @@ -707,10 +732,7 @@ static inline void xen_console_write(const char *s=
tr, size_t len)
> > */
> > static void console_write(const char *str, size_t len)
> > {
> > - ASSERT(rspin_is_locked(&console_lock));
> > -
> > - console_serial_puts(str, len);
> > - video_puts(str, len);
> > + console_puts(str, len);
> >
> > if ( opt_console_xen )
> > xen_console_write(str, len);
> > @@ -1177,6 +1199,8 @@ void __init console_endboot(void)
> >
> > video_endboot();
> >
> > + /* NB: send conring contents to all enabled physical consoles, if any=
 */
> > + console_flush();
>
>
> This is way too late: at this point Xen has already finished booting,
> and is about to handover execution to dom0. Flushing here will result
> in duplicating almost all Xen output already printed?

Yes, indeed; fixed.

>
> The flush needs to be done inside of console_init_preirq(), just
> before printing xen_banner() I think. This sequentially after the
> console has been initialized. Otherwise you are just duplicating
> messages.

Fixed.

>
> Thanks, Roger.



