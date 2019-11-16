Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90480FF618
	for <lists+xen-devel@lfdr.de>; Sun, 17 Nov 2019 00:11:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iW7AW-0001p5-79; Sat, 16 Nov 2019 23:07:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=inei=ZI=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iW7AU-0001p0-Cd
 for xen-devel@lists.xenproject.org; Sat, 16 Nov 2019 23:07:50 +0000
X-Inumbo-ID: e87cce8a-08c5-11ea-a2b2-12813bfff9fa
Received: from wout4-smtp.messagingengine.com (unknown [64.147.123.20])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e87cce8a-08c5-11ea-a2b2-12813bfff9fa;
 Sat, 16 Nov 2019 23:07:49 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 4D1FC1C7;
 Sat, 16 Nov 2019 18:07:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Sat, 16 Nov 2019 18:07:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=IIrwWR
 j5ZD0EBRW/Bbsgq1fmUpF/ixStcSvIumIiOvA=; b=iE8XOF8sRu+fIRYChhv3f4
 Hkq+NalTORlK4rf3GDsebmMKdXsVyF24QJrTtgnJth/WJYEADoL6nPYCGLwa3Wkq
 tNsa5vxtKPIifzPV+5OMhGt7TnYMCfcJB4stU29piVzZJOpvau5+jWspBTHol1gR
 m4MDTW0zYsxVniTM34zWlbgVEmjhzI6y5wKdg7DOYdUSO+Q4uP/aeOFnLOnzSWBD
 a3L5KXFIdrJI5N/Othv0x9TVw3VutQ0MLsTxczF8o/NABci2UBZOGkPFlphN1uCp
 XA7+re7oXwrdrOtSgQhNr6wSc16C+bJ0QAUtKA9qXqZiLBfLwmr6RkiAuQp3hHVQ
 ==
X-ME-Sender: <xms:Q4HQXW3tHXJV98FYad8ZKDI7WsSFPbzcO2aZLdUJv1HPNQwWluVIgw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudegtddgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:Q4HQXWfdpzx8D7140c2W0CSRm_SDzi9F9wXPlDdmN-oILkAkGcxjVQ>
 <xmx:Q4HQXWNGWuoVO22nKzA6k4MeR0gZWKRyjgEgHw43vHxOJCOCktvsKA>
 <xmx:Q4HQXSVTsTTdEUVEM1-LxYjjMh1tdK0dWk-Lky8EV6OPWbfNSGEz1Q>
 <xmx:Q4HQXYUSQUAvfUnEs3osFooxGwxbyi99NghxUaQUf-D2Y-eLKjX6mw>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1C1B78005A;
 Sat, 16 Nov 2019 18:07:47 -0500 (EST)
Date: Sun, 17 Nov 2019 00:07:44 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Roman Shaposhnik <roman@zededa.com>
Message-ID: <20191116230744.GC4109@mail-itl>
References: <CAMmSBy9VN9fFC1M5P7OdLOiwZdgWjjWjMWppA63gnOe5wwGr4A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMmSBy9VN9fFC1M5P7OdLOiwZdgWjjWjMWppA63gnOe5wwGr4A@mail.gmail.com>
Subject: Re: [Xen-devel] Likely regression in efi=no-rs option
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
Cc: xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============2931886857127258150=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============2931886857127258150==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="E13BgyNx05feLLmH"
Content-Disposition: inline


--E13BgyNx05feLLmH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] Likely regression in efi=no-rs option

On Fri, Nov 15, 2019 at 09:24:38PM -0800, Roman Shaposhnik wrote:
> Hi!
>=20
> as I've reported earlier -- part of my testing of Xen 4.13 RC2 failed
> in a massive way with Dom0 never coming up. I've traced that problem
> to the option that we're using to boot Xen:
>     efi=3Dno-rs
> We've been using this option for quite sometime and Xen 4.13 RC2
> is the first one that seems to make Dom0 boot fail with this option
> present (note that RC1 was fine).
>=20
> I was wondering whether there were any changes in the areas related
> to UEFI in Xen that may have triggered this.
>=20
> Here's the boot line that works with RC2:
>     dom0_mem=3D1024M,max:1024M dom0_max_vcpus=3D1 dom0_vcpus_pin smt=3Dfa=
lse
> adding efi=3Dno-rs make Dom0 boot process fail:
>     efi=3Dno-rs dom0_mem=3D1024M,max:1024M dom0_max_vcpus=3D1 dom0_vcpus_=
pin smt=3Dfalse

As Rich already said, there was indeed some related changes, that should
make efi=3Dno-rs not needed as an workaround on many machines.
But also it looks like the "efi: use directmap to access runtime
services table" commit broke efi=3Dno-rs case. I'll send the fix shortly.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--E13BgyNx05feLLmH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl3QgUAACgkQ24/THMrX
1ywRUgf8CX6AJZziIFPSF0WZnLISw47/uWQkRS4qWWE6ilzOhgAZjCGKe9fZGb3y
RxGl3cfxXYJ5yI8pGzLZrWVNG5yFW9b+43ZqeN1/qffUmpaNGC/+XlKpmkn9Ka01
9eWcDvLeA+g78CpnJh1hRIvqM9dXCsOmJNK4yf5OxwCu1MfiRgjrRSoE/kcTQvWt
tDY6+YWrQVl5iz2g2Cf6DKfMOhb59kwtSAw7ZrTNZji0RBGDEc0DuasNblBXbwtP
A/q1JTTK8D2IjLIJhGIRQN4aojvwOPSMuz3V1G8ZbGFRR6m9MECJvIkAqJeili+Z
MLTo6yvIwj4RikDv/+cZBNqQHZHi5g==
=U1f/
-----END PGP SIGNATURE-----

--E13BgyNx05feLLmH--


--===============2931886857127258150==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2931886857127258150==--

