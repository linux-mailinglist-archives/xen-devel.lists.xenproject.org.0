Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DBF29FC2D
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 04:30:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15386.38371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYL5l-0004ge-Li; Fri, 30 Oct 2020 03:28:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15386.38371; Fri, 30 Oct 2020 03:28:41 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYL5l-0004gF-IP; Fri, 30 Oct 2020 03:28:41 +0000
Received: by outflank-mailman (input) for mailman id 15386;
 Fri, 30 Oct 2020 03:28:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e1N+=EF=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1kYL5j-0004gA-TA
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 03:28:40 +0000
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d408ed9-47a9-4720-b2f9-0c90b863b4ad;
 Fri, 30 Oct 2020 03:28:38 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id BDE9D5C0131;
 Thu, 29 Oct 2020 23:28:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 29 Oct 2020 23:28:38 -0400
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de
 [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0861A3280063;
 Thu, 29 Oct 2020 23:28:37 -0400 (EDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=e1N+=EF=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
	id 1kYL5j-0004gA-TA
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 03:28:40 +0000
X-Inumbo-ID: 1d408ed9-47a9-4720-b2f9-0c90b863b4ad
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1d408ed9-47a9-4720-b2f9-0c90b863b4ad;
	Fri, 30 Oct 2020 03:28:38 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id BDE9D5C0131;
	Thu, 29 Oct 2020 23:28:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 29 Oct 2020 23:28:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=nldD6o
	fiqaXXlTDlB3bpDhEfk1kq2/CjjYuqgH3H7W4=; b=kxQO6WTrIWD++n8RmjVjQS
	pLDxSA3uO4ztQjA0DiMBI/AGWZ4cIdpzm5We7GacS468E5UazX2MpWsYOlbbsthf
	VMhDJf+TBrfTKSTJR958JnXcAo3+jMGxEQPRQvDja3H6jKMlewPiHB0ZvSdAikHA
	ZMTvEQobWwTVFFOM/HyHm3FGjnctk/PXkP2M4JzK/9K5k87vVJrFa/QvTniYCzFe
	ZxcqoyCMEntTbdtaf4j9NiZqkZ3616KXDh++5hJpo3+/9qyo2uSjX+vyYuRnuXLc
	/8kcUvI8WMd3ati3qTrB8i3x2YbPhBi9DbQXgxNWLe+K4CR6i0g6jhHkXaHSP2UQ
	==
X-ME-Sender: <xms:ZoibX8-xRz5Ympyuea7dt22rIAKJVH50qPQ5PDQ35sXKi1XttfHdVw>
    <xme:ZoibX0vLEKOtz2nb3_mNixSlsOXz93LEfDuKuKhEdsTIjzABS2Jc-kVwuyz89dUB6
    _65V-lvVHZj0w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrleeggdehkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhih
    hnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgefhtdfhuddtjefgjeevhffh
    jeejtefgjeevgeeijeduhfdtteehieffvdettddvnecukfhppeeluddrieegrddujedtrd
    ekleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
    rghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:ZoibXyBJUO9x3O-71CIPPEPRjAAdCPs5IKwhnaKuG-upjD6FjjpunA>
    <xmx:ZoibX8dORXVHQT8GtpCTkYLiEsh5SOOBMWJ5Dl1WLO-OoeFap93UGw>
    <xmx:ZoibXxMZAaGs4KGDwRKReRyzWpEYdQuuUAnmmIbEOZWc5OhlaEXiQQ>
    <xmx:ZoibX3bn6F7bit2hMvNer2h-XtJxnr9cLpI5wtb1DonjFT-aTTaBTw>
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de [91.64.170.89])
	by mail.messagingengine.com (Postfix) with ESMTPA id 0861A3280063;
	Thu, 29 Oct 2020 23:28:37 -0400 (EDT)
Date: Fri, 30 Oct 2020 04:28:34 +0100
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] tools/python: pass more -rpath-link options to ld
Message-ID: <20201030032834.GC1447@mail-itl>
References: <d10bb94f-c572-6977-40a4-57a61da4094b@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="F4Dl6XKrV7PH8SJF"
Content-Disposition: inline
In-Reply-To: <d10bb94f-c572-6977-40a4-57a61da4094b@suse.com>


--F4Dl6XKrV7PH8SJF
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] tools/python: pass more -rpath-link options to ld

On Mon, Oct 19, 2020 at 10:31:37AM +0200, Jan Beulich wrote:
> With the split of libraries, I've observed a number of warnings from
> (old?) ld.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> It's unclear to me whether this is ld version dependent - the pattern
> of where I've seen such warnings doesn't suggest a clear version
> dependency.
>=20
> --- a/tools/python/setup.py
> +++ b/tools/python/setup.py
> @@ -7,10 +7,15 @@ XEN_ROOT =3D "../.."
>  extra_compile_args  =3D [ "-fno-strict-aliasing", "-Werror" ]
> =20
>  PATH_XEN      =3D XEN_ROOT + "/tools/include"
> +PATH_LIBXENTOOLCORE =3D XEN_ROOT + "/tools/libs/toolcore"
>  PATH_LIBXENTOOLLOG =3D XEN_ROOT + "/tools/libs/toollog"
> +PATH_LIBXENCALL =3D XEN_ROOT + "/tools/libs/call"
>  PATH_LIBXENEVTCHN =3D XEN_ROOT + "/tools/libs/evtchn"
> +PATH_LIBXENGNTTAB =3D XEN_ROOT + "/tools/libs/gnttab"
>  PATH_LIBXENCTRL =3D XEN_ROOT + "/tools/libs/ctrl"
>  PATH_LIBXENGUEST =3D XEN_ROOT + "/tools/libs/guest"
> +PATH_LIBXENDEVICEMODEL =3D XEN_ROOT + "/tools/libs/devicemodel"
> +PATH_LIBXENFOREIGNMEMORY =3D XEN_ROOT + "/tools/libs/foreignmemory"
>  PATH_XENSTORE =3D XEN_ROOT + "/tools/libs/store"
> =20
>  xc =3D Extension("xc",
> @@ -24,7 +29,13 @@ xc =3D Extension("xc",
>                 library_dirs       =3D [ PATH_LIBXENCTRL, PATH_LIBXENGUES=
T ],
>                 libraries          =3D [ "xenctrl", "xenguest" ],
>                 depends            =3D [ PATH_LIBXENCTRL + "/libxenctrl.s=
o", PATH_LIBXENGUEST + "/libxenguest.so" ],
> -               extra_link_args    =3D [ "-Wl,-rpath-link=3D"+PATH_LIBXEN=
TOOLLOG ],
> +               extra_link_args    =3D [ "-Wl,-rpath-link=3D"+PATH_LIBXEN=
CALL,
> +                                      "-Wl,-rpath-link=3D"+PATH_LIBXENDE=
VICEMODEL,
> +                                      "-Wl,-rpath-link=3D"+PATH_LIBXENEV=
TCHN,
> +                                      "-Wl,-rpath-link=3D"+PATH_LIBXENFO=
REIGNMEMORY,
> +                                      "-Wl,-rpath-link=3D"+PATH_LIBXENGN=
TTAB,
> +                                      "-Wl,-rpath-link=3D"+PATH_LIBXENTO=
OLCORE,
> +                                      "-Wl,-rpath-link=3D"+PATH_LIBXENTO=
OLLOG ],

This basically open-codes SHLIB_libxenctrl + SHLIB_libxenguest. Isn't it
better to pass it from make that already has all the dependencies
resolved?

>                 sources            =3D [ "xen/lowlevel/xc/xc.c" ])
> =20
>  xs =3D Extension("xs",
> @@ -33,6 +44,7 @@ xs =3D Extension("xs",
>                 library_dirs       =3D [ PATH_XENSTORE ],
>                 libraries          =3D [ "xenstore" ],
>                 depends            =3D [ PATH_XENSTORE + "/libxenstore.so=
" ],
> +               extra_link_args    =3D [ "-Wl,-rpath-link=3D"+PATH_LIBXEN=
TOOLCORE ],
>                 sources            =3D [ "xen/lowlevel/xs/xs.c" ])
> =20
>  plat =3D os.uname()[0]

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--F4Dl6XKrV7PH8SJF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl+biGMACgkQ24/THMrX
1ywLpAf+JOAKhIphCQaat0Kg8bFiR/QoCzGlgTAabln1b5D+Gbl8qPO9HW6XuBo1
9wGKElizC/lgIZhFAMw0ulxCrNKn+fpCYQ16H2v/6JaSbXtsSBTEukiRw47AIjBC
crcgkdSYDd26bniXZFTW/kY7kTpeVCYZYTwSHpzwmVnk3KP/BluAq4hER2fPYLna
SUh7Moyh0RJNlGyUjV4D9+00bgjPUF2ppGc6McFjeKukctSV7U3uzhHHLjF/X/ko
NecKn+pdSTe8I1K6ga78JB/yhHygUYqg3EY0GmahgbJTCT2IcIDUcLIwY2ym3cSB
kpI/3E9Ggr5akcNxGhSYTEISPcQbCA==
=2fCX
-----END PGP SIGNATURE-----

--F4Dl6XKrV7PH8SJF--

