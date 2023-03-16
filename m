Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CC56BD9EC
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 21:11:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510813.789208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pctvM-0006j9-Cp; Thu, 16 Mar 2023 20:10:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510813.789208; Thu, 16 Mar 2023 20:10:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pctvM-0006gE-8W; Thu, 16 Mar 2023 20:10:08 +0000
Received: by outflank-mailman (input) for mailman id 510813;
 Thu, 16 Mar 2023 20:10:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ItE1=7I=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pctvK-0006bU-69
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 20:10:06 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8832ce2a-c436-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 21:10:02 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 97B0032007F0;
 Thu, 16 Mar 2023 16:09:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 16 Mar 2023 16:10:00 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Mar 2023 16:09:57 -0400 (EDT)
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
X-Inumbo-ID: 8832ce2a-c436-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1678997399; x=1679083799; bh=hzgNRXzays8HvxzuC82pt71uH+GRCDcVkOp
	+L80q5pE=; b=ihVK6fz/CT5vRdBFMFFtrNYM2rqXeezl79xT0eHjp5Emx+AHnsn
	gWoTLZk7t3lVgp58UH1eFBVJsXcPbqjXsb7zOfuD5BlroxrJoNDxNbbAW+psAeds
	LaC9leznag0EYSKYqfpOlnwhI9T2xRPdFfxqsTdQ+1RjImP4BjjG6CUMI7PxnrHT
	jRRv/kXfsaUR9m757uwBPtygdTySDA9NV+cSElQ57GUckK4GGS9g730+p1s/yu+f
	Dcr79tdWV6oKAa/gdYNaJ3GyJAumx7xMR+YYelZJBnEyQQAKdBPA5g5v5jAAmE0o
	Ljn2zO7Bb+WhB/I9BI75uFGdQ3OA96hMvow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1678997399; x=1679083799; bh=hzgNRXzays8Hv
	xzuC82pt71uH+GRCDcVkOp+L80q5pE=; b=Q/JszpKzseDbxeFNH3armMHRN6u1Z
	6adonN0HN65MU8iJKaTUeAEksu/K8UsPw9z0jomrvPDuZJG48uBPEk9lQiEFCohc
	dtOGu/VolBrbgN8Wr6+b/MgZOCG9GBme/En0QdkJL/NVOYSKnH/HL/GsjemY7WRA
	UMityXv51X4h4qTNkaEMGDovCQND8lY1gEDxJ7QB+TjbTynb2vMYMxL9Ccj9jxf8
	+pMDBW2PC1pqX/RLlT8VokKBKP/7eqSVT4XT7IOUL8bzCqfQnp/FLySXvt/b2JvY
	Ex2XuF688LBUyIA1qy9fSOjNiS4TmedjzIkvNzDfPBosJ0l1/qvw7C0Iw==
X-ME-Sender: <xms:lncTZN_2Y-S02VJ9Vtl_jPMEYdoj2xHXOswCli1ZJPUWXC3SZ3UK5A>
    <xme:lncTZBuT5k08CcsAgTJYJgFoFThkm1_GwkuzAF2-6foxC8EsOw4WYlj-8IlLEzrqO
    1zUiJBtQi4bsA>
X-ME-Received: <xmr:lncTZLA8m1FGyv5ryShheyGtQUBTkmk-5sTgTwQ7ib73XhfkOh285YwsdVnQgXEWKq4CKL3OHSsA_JEQM9nf0PCtFxsRsfwfNME>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeftddgudefiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    udelteefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:lncTZBdjwg6gQaZy7sRZ4GIQAnR9mS8B5tKNBKAVQdX1yt5rGyCWXQ>
    <xmx:lncTZCOfQnWAuL_J3NsPf7vOh4VyhdaJepJwx8tSC78wd2EeQL6Cdw>
    <xmx:lncTZDnQgVcLoqmzcNwU87Wf714WxDJ1cLmKBjrY_zkkOdHAXroTUw>
    <xmx:l3cTZLZNR_jvrtbZwcW_qiHm1XEldpkZ6Tcyx4zd13t3mpWct-4lDQ>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 16 Mar 2023 21:09:54 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Bernhard Kaindl <bernhard.kaindl@citrix.com>
Subject: Re: [PATCH v2 5/7] tools: Use -s for python shebangs
Message-ID: <ZBN3k6FvvHvfeWxi@mail-itl>
References: <20230314141520.3652451-6-andrew.cooper3@citrix.com>
 <20230316193744.1077012-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yTo0yZdKwJ/gMcU5"
Content-Disposition: inline
In-Reply-To: <20230316193744.1077012-1-andrew.cooper3@citrix.com>


--yTo0yZdKwJ/gMcU5
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Mar 2023 21:09:54 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Bernhard Kaindl <bernhard.kaindl@citrix.com>
Subject: Re: [PATCH v2 5/7] tools: Use -s for python shebangs

On Thu, Mar 16, 2023 at 07:37:44PM +0000, Andrew Cooper wrote:
> This is mandated by the Fedora packaging guidelines because it is a secur=
ity
> vulnerability otherwise in suid scripts.  While Xen doesn't have suid scr=
ipts,
> it's a very good idea generally, because it prevents the users local pyth=
on
> environment interfering from system packaged scripts.
>=20
> pygrub is the odd-script-out, being installed by distutils rather than
> manually with INSTALL_PYTHON_PROG.  distutils has no nice way of editing =
the
> shebang, so arrange to use INSTALL_PYTHON_PROG on pygrub too.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Wei Liu <wl@xen.org>
> CC: Anthony PERARD <anthony.perard@citrix.com>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> CC: Bernhard Kaindl <bernhard.kaindl@citrix.com>
>=20
> v2:
>  * Remove accidental setuputils dependency.

=2E.. and tools/python/setup.py doesn't install any scripts, so it isn't
relevant there.

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
>  tools/Rules.mk        | 2 +-
>  tools/pygrub/Makefile | 4 +++-
>  tools/pygrub/setup.py | 1 -
>  3 files changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/tools/Rules.mk b/tools/Rules.mk
> index 6e135387bd7e..18cf83f5be83 100644
> --- a/tools/Rules.mk
> +++ b/tools/Rules.mk
> @@ -179,7 +179,7 @@ CFLAGS +=3D $(CFLAGS-y)
>  CFLAGS +=3D $(EXTRA_CFLAGS_XEN_TOOLS)
> =20
>  INSTALL_PYTHON_PROG =3D \
> -	$(XEN_ROOT)/tools/python/install-wrap "$(PYTHON_PATH)" $(INSTALL_PROG)
> +	$(XEN_ROOT)/tools/python/install-wrap "$(PYTHON_PATH) -s" $(INSTALL_PRO=
G)
> =20
>  %.opic: %.c
>  	$(CC) $(CPPFLAGS) -DPIC $(CFLAGS) $(CFLAGS_$*.opic) -fPIC -c -o $@ $< $=
(APPEND_CFLAGS)
> diff --git a/tools/pygrub/Makefile b/tools/pygrub/Makefile
> index 29ad0513212f..4963bc89c6ed 100644
> --- a/tools/pygrub/Makefile
> +++ b/tools/pygrub/Makefile
> @@ -18,8 +18,10 @@ build:
>  .PHONY: install
>  install: all
>  	$(INSTALL_DIR) $(DESTDIR)/$(bindir)
> +	$(INSTALL_DIR) $(DESTDIR)/$(LIBEXEC_BIN)
>  	$(setup.py) install --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
> -		--root=3D"$(DESTDIR)" --install-scripts=3D$(LIBEXEC_BIN) --force
> +		--root=3D"$(DESTDIR)" --force
> +	$(INSTALL_PYTHON_PROG) src/pygrub $(DESTDIR)/$(LIBEXEC_BIN)/pygrub
>  	set -e; if [ $(bindir) !=3D $(LIBEXEC_BIN) -a \
>  	             "`readlink -f $(DESTDIR)/$(bindir)`" !=3D \
>  	             "`readlink -f $(LIBEXEC_BIN)`" ]; then \
> diff --git a/tools/pygrub/setup.py b/tools/pygrub/setup.py
> index 0e4e3d02d372..502aa4df2dae 100644
> --- a/tools/pygrub/setup.py
> +++ b/tools/pygrub/setup.py
> @@ -23,7 +23,6 @@ setup(name=3D'pygrub',
>        author_email=3D'katzj@redhat.com',
>        license=3D'GPL',
>        package_dir=3D{'grub': 'src', 'fsimage': 'src'},
> -      scripts =3D ["src/pygrub"],
>        packages=3Dpkgs,
>        ext_modules =3D [ xenfsimage ]
>        )
> --=20
> 2.30.2
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--yTo0yZdKwJ/gMcU5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmQTd5IACgkQ24/THMrX
1ywuZwf+Mqr8JmKlewM3orz74wqFy79BJencQwPD7pjtvvbDii7sY/Pfjo59gPaR
cKD+hgFJ946HJyk43OYoYUoXLIo2h3NIjHDrhNSD8MJ5ExNaZWcsc9E/5ZEj7jHz
FYLwuEtEL/e53zOLfCiMkQOalX5EqfbCf3t0GXzwH8tES9UZOZfvyGDgsmjvVekP
ZJ/SxUwReU062FPsSDIZUGfaPWhoeziDGO2dg/AP62c+Vlfu50PVPDjfMUQ+g3+Y
MVzJeOA06Id7/QlhG2dmXnjzMnzNeCggDjDBOpfTXfRbKasb2Gm0SgWwIbzdiwIp
+9jZM9VizhcQQ5tio4JNcuu8BxGjzw==
=p9Xh
-----END PGP SIGNATURE-----

--yTo0yZdKwJ/gMcU5--

