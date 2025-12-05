Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9DACA7DBA
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 14:58:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179128.1502746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRWJQ-0008Fb-5S; Fri, 05 Dec 2025 13:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179128.1502746; Fri, 05 Dec 2025 13:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRWJQ-0008Di-2f; Fri, 05 Dec 2025 13:57:32 +0000
Received: by outflank-mailman (input) for mailman id 1179128;
 Fri, 05 Dec 2025 13:57:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZEed=6L=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vRWJP-0008Da-5p
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 13:57:31 +0000
Received: from fout-b4-smtp.messagingengine.com
 (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 532cabdf-d1e2-11f0-980a-7dc792cee155;
 Fri, 05 Dec 2025 14:57:24 +0100 (CET)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfout.stl.internal (Postfix) with ESMTP id 3E2DB1D00192;
 Fri,  5 Dec 2025 08:57:23 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Fri, 05 Dec 2025 08:57:23 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Dec 2025 08:57:22 -0500 (EST)
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
X-Inumbo-ID: 532cabdf-d1e2-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1764943043;
	 x=1765029443; bh=QX/gPZm+x1mcyArJqj0mE5WToJQ/FY7tVZSoiGMcEAc=; b=
	bdOWTmFoV3YYswtCp/B5stofi9im0WquEkkns0ym17HHtD3s+cXCE5KnSVpXHXrs
	4ccKfbbjmSyEVUc5Ypqb+eLr5bXkm8MzrNLtRjsCoWAj90O8hYMVeXa+DwxKF91a
	tp5sfqWoOSe68Y2FPnrwxdsvmVLY7i6QGx6TPgTDaSs0Cx6VrCme/4IdrBRphUGk
	0UXPHMKIWBJ6loUg4M6TEY9W3W50NfxpTR+I7Rcjf+KhDySDy03HgD5KQtHrIqup
	/bqbjo5UvMCTk7JSSgjYZc4dUAGrcrUUUXO4gbHxzAj3St0SSFN46IgsQEAAB68P
	IiowoPbSKY9LZpJfh9Xy4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1764943043; x=1765029443; bh=QX/gPZm+x1mcyArJqj0mE5WToJQ/FY7tVZS
	oiGMcEAc=; b=GS6lUveM1htf1mnLWak6ID4Uh7oyH2T65UpqiCkphI9iszci/et
	7NHjsh8OHfcqaseth5sLgTLfkKnBKA+ZpHvJMF8pgPALgJ+Me17Etum4jti8WVE2
	jjGmtPkoO54y5oZD7MePf6GK9kkR6urPU5U0dhuU25JIJDA7TO1vggLrJBezFQfj
	1QkSnJm6o5L4gkQbs4qrA4fx1XMWJRi+ZudkhjRrKvGsx7W6rY/g3A25WorcivO2
	YcF+uoUvcjJNXIGAPtqQExI01psSTRSs2to9pkps8qecSm0QqRAYGWAObUQCACEy
	9cKxPDQ2c8fgK+uHB8dwMWWNvjxZgWFQwCg==
X-ME-Sender: <xms:wuQyaf3SXYLFCTZ_vpXlIwB4BUn40cNN29wirS5YPpZhlGqbc9Z_Pg>
    <xme:wuQyaVHk7BdF8EJiGKKbuwwbJHGUseXMifOcBA0pFF4TtqSmQnR-MfzeJk1hdhKxC
    _0LoSEvOqgOCQOIp0Vx71QEGyMYtSIIRXC7CfRD2v7yLZea9g>
X-ME-Received: <xmr:wuQyaU4KlCvpI-8YPxbPBqjhTS1-55RyELW5MfTye2OESQk9aX2yoIb4s-M_Xl3kdJse8FYE2rbRYfQBestdKRt9luBdmD4Fa2A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdekheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesghdtroertddtjeenucfhrhhomhepofgrrhgvkhcuofgr
    rhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepkedvgfdtkeff
    ueehheekgfeuudegvdejueehteejgeefffehkeejhfejveeugffhnecuffhomhgrihhnpe
    hgihhtlhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
    gtohhmpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    peigrghkvghprdgrmhgrthhophesghhmrghilhdrtghomhdprhgtphhtthhopeigvghnqd
    guvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehm
    hihkohhlrggpkhhvrggthhesvghprghmrdgtohhmpdhrtghpthhtoheprghnthhhohhnhi
    drphgvrhgrrhgusehvrghtvghsrdhtvggthh
X-ME-Proxy: <xmx:wuQyaTuFUowVwzquDnH5s8F22m0B6WvNHVcg0xMK9-uavw92yjttJQ>
    <xmx:wuQyad7xeozjNesL44PaYXPSaDYKXZivbvV5GlELnaHUPY7PScyFuw>
    <xmx:wuQyaWW95BDCdPpqfex9LejM-8Q7z4mQ73_l-fDwIFWCkexZsQX4Rw>
    <xmx:wuQyaX91lGq_t9je51Ojjs6ewNRX2NS-ZLUTY5leH4JDCIwdvaXrEw>
    <xmx:w-QyaY5rLX_r0MIUoUsFO0U2dXm9RU4K_5DLQumKNNzPheAnd39Ddlql>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 5 Dec 2025 14:57:20 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH] systemd: default system-sleep dir without pkg-config
Message-ID: <aTLkwMpxchYSMnyT@mail-itl>
References: <f03c8a2fe81527841966ed6c8ed603d1d90ee5c4.1764940296.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DCwzspm2pCAnNB/v"
Content-Disposition: inline
In-Reply-To: <f03c8a2fe81527841966ed6c8ed603d1d90ee5c4.1764940296.git.mykola_kvach@epam.com>


--DCwzspm2pCAnNB/v
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 5 Dec 2025 14:57:20 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH] systemd: default system-sleep dir without pkg-config

On Fri, Dec 05, 2025 at 03:13:32PM +0200, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
>=20
> Using PKG_CHECK_VAR() to obtain SYSTEMD_SLEEP_DIR reintroduced a build-ti=
me
> dependency on systemd-devel. This breaks --enable-systemd builds that only
> need the initscripts.
>=20
> Use the same defaulting scheme as other systemd paths: if SYSTEMD_SLEEP_D=
IR
> isn't provided, set it to "$(prefix)/lib/systemd/system-sleep/".
>=20
> Fixes: e54a6cd6a1f3 ("systemd: Add hooks to stop/start xen-watchdog on su=
spend/resume")
> Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=
=2Ecom>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Build in which the regression was detected:
> https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/10959608099

Requires re-running autoconf, otherwise still fails:

https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/12336879267

With autoconf:
https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/2198372475

It's better now, so:
Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>

But unconditional --enable-systemd uncovered other issues (not related
to the configure change).


> ---
>  m4/systemd.m4 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/m4/systemd.m4 b/m4/systemd.m4
> index c47a25ef93..ee684d3391 100644
> --- a/m4/systemd.m4
> +++ b/m4/systemd.m4
> @@ -77,7 +77,7 @@ AC_DEFUN([AX_CHECK_SYSTEMD_LIBS], [
>  	], [])
> =20
>  	AS_IF([test "x$SYSTEMD_SLEEP_DIR" =3D x], [
> -	    PKG_CHECK_VAR([SYSTEMD_SLEEP_DIR], [systemd], [systemdsleepdir])
> +	    SYSTEMD_SLEEP_DIR=3D"\$(prefix)/lib/systemd/system-sleep/"
>  	], [])
> =20
>  	AS_IF([test "x$SYSTEMD_SLEEP_DIR" =3D x], [
> --=20
> 2.43.0
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--DCwzspm2pCAnNB/v
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmky5MAACgkQ24/THMrX
1yyGzwf/aYXyZrZRqFquh701nuF0r74G734PeOFwZx3KgjcmZM3LPQwnP6JQjzoe
gF4Q0SrGZxQreROJ6iLJc+V5+upCHVenr9TEwgftfKuzQzcU1V9jbyh5xvZz2lXn
JZltDzmHiHJczpOzlele6rzujs5mmI7Nqe8SNfBFKOgxtYP98//hb8MCnMiBi9mt
EOOdNpEwYyBLqhTCg+q43q5YFZ1TYAZqYAlGyeoLFAErwz2Q5DVm58BG3WJQaYso
4yVv6j//gqvYuU1nLo0vmucbHl0E5FJZFu7sWeXeHkOEpIoihKskku/zF4XkRvTf
hrEHVa2msqq5z/6Qs+8idBGoyCVK7w==
=Zr3v
-----END PGP SIGNATURE-----

--DCwzspm2pCAnNB/v--

