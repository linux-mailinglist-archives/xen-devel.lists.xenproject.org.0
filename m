Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A81435BB
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 13:59:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbOJo-0001CH-OD; Thu, 13 Jun 2019 11:55:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QIng=UM=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hbOJn-0001BX-39
 for xen-devel@lists.xen.org; Thu, 13 Jun 2019 11:54:59 +0000
X-Inumbo-ID: 0f938bbe-8dd2-11e9-8980-bc764e045a96
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::2])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0f938bbe-8dd2-11e9-8980-bc764e045a96;
 Thu, 13 Jun 2019 11:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1560426895;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=J8EOr4BXV2quku/2mAw5Ck2dWs8c/hdeFWpYzq9OfjQ=;
 b=FRMyUTQhGAZpUR6l0qEkKasCz40IBqOuGb8zGRE36H2JEuhbbFNHJhGmWEScjSs9TC
 HwaSyXRi5DUdvkWU3G7BI16MxGZPQlL40cFPNHMRZOBrdwF6SnT5z8dDSnwNjqM+tFSM
 lqpasQR4w9NcFPzDvVtNws0+x/nTq4cGHCa0a6OSY4T8No63sxaDiaqP8pS4UrOV0Vlm
 NAvpg0ojCFY0FcxsDv/oAhMYJvLzvrllIsbCg+dVoRknncB3Ye8WJSnJFNzrSoPGhvy/
 Vbf28HMqovGIhXhau7xAojUANJG46sP5vk7RgmNrFjUm4bvZZgIQW4Efah6XKjhbhMMh
 J+rA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4kV1cX92EW4mFvNjTRB"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.23 AUTH)
 with ESMTPSA id g0b44av5DBqi0tr
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Thu, 13 Jun 2019 13:52:44 +0200 (CEST)
Date: Thu, 13 Jun 2019 13:52:43 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Daniel De Graaf <dgdegra@tycho.nsa.gov>, Quan Xu <quan.xu0@gmail.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Message-ID: <20190613135243.47dbec54.olaf@aepfle.de>
In-Reply-To: <20180529120648.30429-1-olaf@aepfle.de>
References: <20180529120648.30429-1-olaf@aepfle.de>
X-Mailer: Claws Mail 2019.05.18 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v1] stubdom/vtpm: include stdio.h for
 declaration of printf
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xen.org
Content-Type: multipart/mixed; boundary="===============6849919789435844487=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6849919789435844487==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/JCCJ4lAt1GPvAp.Oh1Vw=py"; protocol="application/pgp-signature"

--Sig_/JCCJ4lAt1GPvAp.Oh1Vw=py
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Please review this patch.

Am Tue, 29 May 2018 14:06:48 +0200
schrieb Olaf Hering <olaf@aepfle.de>:

> The function read_vtpmblk uses printf(3), but stdio.h is not included
> in this file. This results in a warning from gcc-7:
>=20
> vtpmblk.c: In function 'read_vtpmblk':
> vtpmblk.c:322:7: warning: implicit declaration of function 'printf' [-Wim=
plicit-function-declaration]
>        printf("Expected: ");
> vtpmblk.c:322:7: warning: incompatible implicit declaration of built-in f=
unction 'printf'
> vtpmblk.c:322:7: note: include '<stdio.h>' or provide a declaration of 'p=
rintf'
>=20
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> ---
>  stubdom/vtpm/vtpmblk.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/stubdom/vtpm/vtpmblk.c b/stubdom/vtpm/vtpmblk.c
> index fe529ab5ac..681f0c01b6 100644
> --- a/stubdom/vtpm/vtpmblk.c
> +++ b/stubdom/vtpm/vtpmblk.c
> @@ -20,6 +20,7 @@
>  #include <unistd.h>
>  #include <errno.h>
>  #include <fcntl.h>
> +#include <stdio.h>
> =20
>  /*Encryption key and block sizes */
>  #define BLKSZ 16


--Sig_/JCCJ4lAt1GPvAp.Oh1Vw=py
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl0COQsACgkQ86SN7mm1
DoDmLA/9HGs5VN+MMv+IJmtoEJji9c17BvpuS7c1mX8qQ8YHZm348yKZyz/c3A9b
B5ht12xAmyTfpnJX7xD5La+ECJa0d55gFEpAvu2kvdQQvSUS3C+25uQ7JVW+zzus
kQ3grUN5yPxcjHV7OJ2p9twRhXqRjPKfrzXj2BUbqq2ynRfDcQzk3qasxeNA/t1B
jMCx5/jrzP0CrksVIKD07lSUjq3HF0iAfAj6KK6eDSZ9PFwf4cZ8PWnWpQ12iJEa
0swfHWgwiZg+DVpSwZ/XYtWsRBg5VihEGAD43BqfJhZQv7eXH+FNYP7tFXND4zwQ
7WTSO/1LclKMy2DxC7L7uxTcZUkOiROlZwZNNckSG1akEOB1bYDOtKNbPYCXg78d
nmJqvnb5PP1VxiHPvugh7enuRt9VaUIKjswi+bbfBK7igIOpJ0ozXb7SvrulCsTz
3l4ecQXh5WP2wk7B4+pSr64Ml297FEBrSgJCny743DbFoJYQclRV7FS4DcYdAmT6
kK7VMn0WK0x1DHop01hfr0Xv9VC7/X5jJk/MkMuYBUOhB2WhcQ5ocQZIvbYfUk7Q
mAcHS2yqsQVUigsShKowa0+gkxPl4yyRebS91+XxDTKdl5qCvFafbdWcCaI/gS/F
yP9BgUkDrpQUFPX5utxvzldlS5FypdSS5zmLF7FKUOrKZBgPrJw=
=ompE
-----END PGP SIGNATURE-----

--Sig_/JCCJ4lAt1GPvAp.Oh1Vw=py--


--===============6849919789435844487==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6849919789435844487==--

