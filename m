Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 007F3144627
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 21:59:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iu0a2-00056Z-AR; Tue, 21 Jan 2020 20:56:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DWdk=3K=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iu0a0-00056T-H0
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 20:56:56 +0000
X-Inumbo-ID: 89ecf6ca-3c90-11ea-9fd7-bc764e2007e4
Received: from wout4-smtp.messagingengine.com (unknown [64.147.123.20])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89ecf6ca-3c90-11ea-9fd7-bc764e2007e4;
 Tue, 21 Jan 2020 20:56:47 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id C6ECB69A;
 Tue, 21 Jan 2020 15:56:46 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Tue, 21 Jan 2020 15:56:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=5lawpy
 dLulbJu0QG45IrC8sLvh0xajqT3Dwmm3qSe48=; b=I7AYiT4lCQ9PL2bIWC4P3W
 htgfF/xE2nyEqMLcPtzPcyhP13v8cyIWZxnawdR++Eg8M5c85xlSrJ0T1H2QHKkt
 AezRSEmuiM8AzXl+0BQzysgpYxwJbRn3wI+69+MspCsxbZtEryC3tBc4qaxrUHZS
 bjb0xTxEERRh+w2ghTLYk0ugQlRndzOR+FRzwOq46WshKUwHuqX/vis3vXXVBPfx
 RwlLSTCEVQz2D4B8nU7xxqnTEK9Trq5ZiVHxZkGu3d/kqjUhz5bycACs7sSp3voh
 Dthv7ORASt0s3GJp6xQnjPInkChOOyYetiXYl/0CurQ4q8C1whThiN99+zKPyg4A
 ==
X-ME-Sender: <xms:jmUnXhxsfknDYkokwytqO8vuUPzZvpFZkJWJsOGIkHOWyZSju4zTdQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudekgddugeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 hrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:jmUnXi1tcwTQ_eIQgdqDsabaGZ3Sb_Hnoa1-ruGnCNeKBmU7vSrGdQ>
 <xmx:jmUnXqmAQou0-x8K61nDYQhz7w32JkNW1iNzGlw9nUMi50nqRUJQMQ>
 <xmx:jmUnXp9vs1-2-riDcjx3NGaht_KUf4E3iAECqcfQpjKNsshoXW59mw>
 <xmx:jmUnXvcnVydukz3vNF5Hf7xudVGQQlsZLlJ1844dtx4MB_3fRWUepA>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 55B28328005C;
 Tue, 21 Jan 2020 15:56:45 -0500 (EST)
Date: Tue, 21 Jan 2020 21:56:42 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Rich Persaud <persaur@gmail.com>
Message-ID: <20200121205642.GN1314@mail-itl>
References: <844c2e98000772126a3168305d692192df90c204.1579055705.git-series.marmarek@invisiblethingslab.com>
 <839DA21B-FE80-47D0-91AB-740B36B381A8@gmail.com>
MIME-Version: 1.0
In-Reply-To: <839DA21B-FE80-47D0-91AB-740B36B381A8@gmail.com>
Subject: Re: [Xen-devel] [PATCH v4 13/16] Regenerate autotools files
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>
Content-Type: multipart/mixed; boundary="===============1270313967676853606=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1270313967676853606==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="x1rn9AXKBSVzW9+3"
Content-Disposition: inline


--x1rn9AXKBSVzW9+3
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] [PATCH v4 13/16] Regenerate autotools files

On Wed, Jan 15, 2020 at 04:57:29PM -0500, Rich Persaud wrote:
> > On Jan 14, 2020, at 21:42, Marek Marczykowski-G=C3=B3recki <marmarek@in=
visiblethingslab.com> wrote:
> > =EF=BB=BFSince we have those generated files committed to the repo (why=
?!),
> > update them after changing configure.ac.
>=20
> Is there any reason not to remove the generated configure files?  A devel=
oper using generated files on system B would be incorporating configuration=
 assumptions from system A where the configure script was generated.  If we=
 are going to ship configure scripts, do we need to document a "system A" r=
eference distro/environment where all configure scripts from Xen will be ge=
nerated?
>=20
>=20
> Other notes:
>=20
> 1.  Debian autoreconf works in the Xen root directory, but the default Op=
enEmbedded autoreconf uses Gnu libtoolize and fails because some Xen build =
subdirectories don't have configure.ac/.in.  =20
>=20
> 2.  If OpenEmbedded autoreconf is run only in the tools directory (where =
it works and generates a new tools configure), then root configure (generat=
ed from older configure.ac) will silently ignore the newer tools configure =
and write config.h _without_ tools-specific config, such as the vchan QMP p=
roxy.
>=20
> 3. If autoreconf runs successfully in the root directory, then tools-spec=
ific configure is correctly generated and everything works as expected.
>=20
> This silent failure could be avoided by deleting the generated configure =
scripts.  There may be other failure modes for using System A generated scr=
ipts on downstream build system B.

Yes, I think general good practices are:
1. don't keep generated autotools files in version control system
2. generate them into release tarballs

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--x1rn9AXKBSVzW9+3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl4nZYkACgkQ24/THMrX
1yyBTAf/RhoXCDRf4lJ3oZn1YFO96bLiJ8JaM+xSu2yuq37a09AlAiHkmUZLzSJo
tyOgiSqPkrnJg+Q122nJ9jE2T5xiVcl4lySGkcUzH0jSO0aTQu+cV/hiLPdDTCrw
iqsg7TToOb6wMPzH7TUQ6cDmSGlkT1YLajN9GmV5sgYFdAgIjLaT6v0BX/xqOdft
g/I87SRgodFYBjhVv/00wXU/9BXz6DX+tAaCwcSjTwEY7CnPCxZTA1O/SxrPZYmq
7sUUZkq3UXc1j7Rv5GUupF/R+Jh1zZfPuY9SQ6USQiyAsWlJcp48Wwt64fMiFWgJ
cj1b0m8I0iDQGbbQkHXIUrkQRQJntQ==
=tu+K
-----END PGP SIGNATURE-----

--x1rn9AXKBSVzW9+3--


--===============1270313967676853606==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1270313967676853606==--

