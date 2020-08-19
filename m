Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1094324998A
	for <lists+xen-devel@lfdr.de>; Wed, 19 Aug 2020 11:42:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8KbC-0005fH-4t; Wed, 19 Aug 2020 09:41:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tsRI=B5=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1k8KbA-0005fC-VR
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2020 09:41:37 +0000
X-Inumbo-ID: 1a937cde-7277-4200-94b2-3e41ee1ec85c
Received: from wout4-smtp.messagingengine.com (unknown [64.147.123.20])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a937cde-7277-4200-94b2-3e41ee1ec85c;
 Wed, 19 Aug 2020 09:41:36 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id B808A509;
 Wed, 19 Aug 2020 05:41:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 19 Aug 2020 05:41:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=8lFhNE
 j3oA3/9/vfgwXkaTZyQc77f+mXCbIE3SgW8dM=; b=H9jEqWNiJYkN+6AskHoz73
 YA7OAWwTaM5cIG75JgHh9pcI4kDb5XwEr8RoKG1EqIJT3ESXQBiut2VXVfNRsB+A
 I8+AZkDxJbdUnrfW0ZTdjKJoAd4ZDgurn1vSSV8mhTKgRfjtbW51W7K/xBJ6wtZy
 zwRYBnYUHMjYV8Xubv1aVDjaJ7Z5i5BxuctWrEDsUoh9Cp/z5oUmY2Hg2jdmJ4EC
 6hFFK76AVCgN3U2SCuTtyxrnYlnOFpzLfkmFOTXXtE7UwgwurzmmYylhbsTb+e5L
 +QvLFEjXXUpnjibqZkoCnLF4ZZQJ3Nt3I7QQ2DjtdVNOF9OA/2JVsCKjYW4HDtIg
 ==
X-ME-Sender: <xms:zfM8X2MUaX2KY4ul_Hw8HVpt-YFNVsir7iruTQsKRnMCBOrwrOoMgQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddtkedgudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqiferrehrvggtkhhiuceomhgrrhhmrghrvghksehinh
 hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepuddv
 jeekieelgfeljefgjeelffefleduheehvdehfeehffeuveejvdevveeufeehnecukfhppe
 eluddrieegrddujedtrdekleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
 mhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrg
 gsrdgtohhm
X-ME-Proxy: <xmx:zfM8X0-8SLtRJUqaPvgvX3png4A65DeaNAJLprnrOU6zZfOSptcGRQ>
 <xmx:zfM8X9R_Wykpy1d-CfCKnb5cCkxD41xB34v-nT2rzBELPOZMP8zfTg>
 <xmx:zfM8X2tRIcUk6Is2ImaRX08tPbeQsxfXpwQkBvTV8KdbX6dMRZAAqw>
 <xmx:zvM8X2lDIXcTc02LlLLMC2q9N1EdSofgLN00OhgGy9uCM9Tqiq9sJw>
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de
 [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id 19502328005D;
 Wed, 19 Aug 2020 05:41:33 -0400 (EDT)
Date: Wed, 19 Aug 2020 11:41:23 +0200
From: Marek Marczykowski-G??recki <marmarek@invisiblethingslab.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 2/2] libxl: fix -Werror=stringop-truncation in
 libxl__prepare_sockaddr_un
Message-ID: <20200819094123.GO1626@mail-itl>
References: <20200819020036.599065-1-marmarek@invisiblethingslab.com>
 <20200819020036.599065-2-marmarek@invisiblethingslab.com>
 <20200819034356.GA29116@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3199z2xwsLUuj0Hj"
Content-Disposition: inline
In-Reply-To: <20200819034356.GA29116@mattapan.m5p.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--3199z2xwsLUuj0Hj
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] libxl: fix -Werror=stringop-truncation in
 libxl__prepare_sockaddr_un

On Tue, Aug 18, 2020 at 08:43:56PM -0700, Elliott Mitchell wrote:
> On Wed, Aug 19, 2020 at 04:00:36AM +0200, Marek Marczykowski-G??recki wro=
te:
> > diff --git a/tools/libxl/libxl_utils.c b/tools/libxl/libxl_utils.c
> > index f360f5e228..b039143b8a 100644
> > --- a/tools/libxl/libxl_utils.c
> > +++ b/tools/libxl/libxl_utils.c
>=20
>=20
> >      }
> >      memset(un, 0, sizeof(struct sockaddr_un));
> >      un->sun_family =3D AF_UNIX;
> > -    strncpy(un->sun_path, path, sizeof(un->sun_path));
> > +    strncpy(un->sun_path, path, sizeof(un->sun_path) - 1);
> >      return 0;
> >  }
>=20
> While the earlier lines are okay, this line introduces an error. =20

Why exactly? strncpy() copies up to n characters, quoting its manual
page:

    If there is no null byte among the first n bytes of src, the string
    placed in dest will not be null-terminated

But since the whole struct is zeroed out initially, this should still
result in a null terminated string, as the last byte of that buffer will
not be touched by the strncpy.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--3199z2xwsLUuj0Hj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl8888MACgkQ24/THMrX
1ywL3gf+PgsKuJBztYVTYMi8PsYElBgBxvvdpURU84bpoftXgNEzyh6SWcziAHS9
6po5djImLUV3LL+pNskcoB3Mg9FMqaKUOWSTMZm791Q8yZwW8ypV5UV7kbe0wF5S
0MYibcZjJ1D8ZPC95cDySacoeG4XbXn8q+OQYxJH144AXfUZZBJzqEUzw5kHQAPU
Moz5GJkAOytrX3vs8OAsM0yWhK+FX6MFI7+r2fHUVcCeRX8vG7HsYyq3qdyP7TmU
YEXSXbbCyzq3d9o3BEO7hok2hdqth7IQ6BxhxysnW87h1SMn+voF54IETbg70ywB
pd456NQNvXEDyRUCw0r468hXOWclSA==
=wOMb
-----END PGP SIGNATURE-----

--3199z2xwsLUuj0Hj--

