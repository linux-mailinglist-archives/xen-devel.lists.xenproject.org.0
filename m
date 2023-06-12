Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE8D72C290
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 13:11:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547017.854184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8fSK-0001Nu-Jy; Mon, 12 Jun 2023 11:11:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547017.854184; Mon, 12 Jun 2023 11:11:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8fSK-0001L3-Gh; Mon, 12 Jun 2023 11:11:28 +0000
Received: by outflank-mailman (input) for mailman id 547017;
 Mon, 12 Jun 2023 11:11:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lBpl=CA=aculab.com=david.laight@srs-se1.protection.inumbo.net>)
 id 1q8fSJ-0001Kx-9H
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 11:11:27 +0000
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de7e144b-0911-11ee-8611-37d641c3527e;
 Mon, 12 Jun 2023 13:11:25 +0200 (CEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-85-DewxziyUPXuyU4DjMJIpxA-1; Mon, 12 Jun 2023 12:11:22 +0100
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Mon, 12 Jun
 2023 12:11:11 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Mon, 12 Jun 2023 12:11:11 +0100
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
X-Inumbo-ID: de7e144b-0911-11ee-8611-37d641c3527e
X-MC-Unique: DewxziyUPXuyU4DjMJIpxA-1
From: David Laight <David.Laight@ACULAB.COM>
To: 'Demi Marie Obenour' <demi@invisiblethingslab.com>, Hans de Goede
	<hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, "Sakari
 Ailus" <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Juergen Gross <jgross@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Lee Jones <lee@kernel.org>, Andy Lutomirski
	<luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Vincenzo Frascino
	<vincenzo.frascino@arm.com>, Petr Mladek <pmladek@suse.com>, Steven Rostedt
	<rostedt@goodmis.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, "Andy
 Shevchenko" <andriy.shevchenko@linux.intel.com>, Rasmus Villemoes
	<linux@rasmusvillemoes.dk>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Christoph
 Hellwig" <hch@lst.de>
Subject: RE: [PATCH v3 3/4] vsscanf(): do not skip spaces
Thread-Topic: [PATCH v3 3/4] vsscanf(): do not skip spaces
Thread-Index: AQHZm9wFvdHGuD5F0k2o+1T0Ru69aa+HA4AQ
Date: Mon, 12 Jun 2023 11:11:11 +0000
Message-ID: <0c8bb9a3d2de4cf5b06f912d784e7292@AcuMS.aculab.com>
References: <20230610204044.3653-1-demi@invisiblethingslab.com>
 <20230610204044.3653-4-demi@invisiblethingslab.com>
In-Reply-To: <20230610204044.3653-4-demi@invisiblethingslab.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Demi Marie Obenour
> Sent: 10 June 2023 21:41
>=20
> Passing spaces before e.g. an integer is usually
> not intended.  This was suggested by Christoph in
> https://lore.kernel.org/lkml/ZIQrohcizoj4bZWx@infradead.org/.

This is contrary to libc scanf and could easily affect userspace
writing fixed width values into sysctl nodes (etc).

IIRC strtoul() (etc) are also expected to strip leading spaces.
Removing the sign in sscanf() may lead to "-    12" being
valid - which may not be desired.

=09David

>=20
> Suggested-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> ---
>  lib/vsprintf.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>=20
> diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> index 9e53355c35b1d6260631868228ede1d178fe3325..665f6197f8313d653f67d7886=
b12c43942e058dd 100644
> --- a/lib/vsprintf.c
> +++ b/lib/vsprintf.c
> @@ -3551,8 +3551,6 @@ int vsscanf(const char *buf, const char *fmt, va_li=
st args)
>  =09=09=09char *s =3D (char *)va_arg(args, char *);
>  =09=09=09if (field_width =3D=3D -1)
>  =09=09=09=09field_width =3D SHRT_MAX;
> -=09=09=09/* first, skip leading white space in buffer */
> -=09=09=09str =3D skip_spaces(str);
>=20
>  =09=09=09/* now copy until next white space */
>  =09=09=09while (*str && !isspace(*str) && field_width--)
> @@ -3639,11 +3637,7 @@ int vsscanf(const char *buf, const char *fmt, va_l=
ist args)
>  =09=09=09return num;
>  =09=09}
>=20
> -=09=09/* have some sort of integer conversion.
> -=09=09 * first, skip white space in buffer.
> -=09=09 */
> -=09=09str =3D skip_spaces(str);
> -
> +=09=09/* have some sort of integer conversion. */
>  =09=09digit =3D *str;
>  =09=09if (is_sign && digit =3D=3D '-') {
>  =09=09=09if (field_width =3D=3D 1)
> --
> Sincerely,
> Demi Marie Obenour (she/her/hers)
> Invisible Things Lab

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)


