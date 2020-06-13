Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2011F8345
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2020 14:41:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jk5Sr-00033m-9f; Sat, 13 Jun 2020 12:40:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhnu=72=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1jk5Sq-00033c-EA
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2020 12:40:48 +0000
X-Inumbo-ID: 1b39691c-ad73-11ea-b675-12813bfff9fa
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1b39691c-ad73-11ea-b675-12813bfff9fa;
 Sat, 13 Jun 2020 12:40:47 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id ADA4E5C0109;
 Sat, 13 Jun 2020 08:40:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sat, 13 Jun 2020 08:40:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Yt1FUr
 ieZSejFahl0lKYsx3SCjSZvSJd0zCGv8cs+Ew=; b=Vl+eybBrhzqD/gb1Smn7l4
 vWYYw1UCYYBTHmvP72LYBw0VxWgdt9WUMNKtlirX/SsnM5sk5B4O3Hkvv1N1j8ua
 zYLxsNRvQPSydmGaWQfQTKfQ0LM0mm5hhCoZ7Lkw7YKCZVdjWWfaFDMl4IZd876r
 2fsort8ytRzjY9UbWFYntMzJc9l/UE6L3D2ZN/Md/sM1qG1h2KVZGvDGRglLDzKi
 0uj8VdpRsEW+9nTqnSu9/BzO6jLo0WzohERX7YP/xheDowscRQH4vOl0GT9EgVjH
 GeVvYoFPW4F4S2irobzDt4X1CxqVQnddG8+ZXNcMVw9ngReF8doA7KHqnIgqz/lA
 ==
X-ME-Sender: <xms:T8nkXqg1zH7winxk3ZBN9UTZn_NSERGY3YGfpb3BBYvRak-NRtSNvg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudeifedgheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
 iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucfkpheple
 durdeihedrfeegrdeffeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgr
 ihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
 gtohhm
X-ME-Proxy: <xmx:T8nkXrDk_eMkH3o0ggUqQfMhs7ykqafCUtWBz7kwu0-ongNTHgl87A>
 <xmx:T8nkXiHXMJjJmbLu4OAxzNRqLX22Y2jEhWExchzrwh2lXIT1l9BEWQ>
 <xmx:T8nkXjSrYuPadHkKSFgfnn21nPfQFw2e5MHGY8Nxlrx-bQkiF_vKjg>
 <xmx:T8nkXov99-FBj6e35x4SyCAZqvsEr9qDwSzrOIu3oiOquUpph7uZDA>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id F3A6D328005D;
 Sat, 13 Jun 2020 08:40:46 -0400 (EDT)
Date: Sat, 13 Jun 2020 14:40:44 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH 0/8] Coverity fixes for vchan-socket-proxy
Message-ID: <20200613124044.GN6329@mail-itl>
References: <20200525024955.225415-1-jandryuk@gmail.com>
 <CAKf6xpvRxeUdOOogacDvncC3yogcTN4gALVWO+V8ZJ8x__RafA@mail.gmail.com>
 <CAKf6xps9j=bszbw5SAYeZdrGS9jP-3Hu9RCGT45ifNR6qdAX3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EVh9lyqKgK19OcEf"
Content-Disposition: inline
In-Reply-To: <CAKf6xps9j=bszbw5SAYeZdrGS9jP-3Hu9RCGT45ifNR6qdAX3Q@mail.gmail.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--EVh9lyqKgK19OcEf
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/8] Coverity fixes for vchan-socket-proxy

On Wed, May 27, 2020 at 10:59:55PM -0400, Jason Andryuk wrote:
> On Mon, May 25, 2020 at 6:36 PM Jason Andryuk <jandryuk@gmail.com> wrote:
> >
> > On Sun, May 24, 2020 at 10:50 PM Jason Andryuk <jandryuk@gmail.com> wro=
te:
> > >
> > > This series addresses some Coverity reports.  To handle closing FDs, a
> > > state struct is introduced to track FDs closed in both main() and
> > > data_loop().
> >
> > I've realized the changes here are insufficient to handle the FD
> > leaks.  That is, the accept()-ed FDs need to be closed inside the for
> > loop so they aren't leaked with each iteration.  I'll re-work for a
> > v2.
>=20
> So it turns out this series doesn't leak FDs in the for loop.  FDs are
> necessarily closed down in data_loop() when the read() returns 0.  The
> only returns from data_loop() are after the FDs have been closed.
> data_loop() and some of the functions it calls will call exit(1) on
> error, but that won't leak FDs.
>=20
> Please review this series.  Sorry for the confusion.

For the whole series:

Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--EVh9lyqKgK19OcEf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl7kyUsACgkQ24/THMrX
1yzcZQf/cRqczpfB7bFKJy59Cr7a7jW+YdgtS8IfUNL+mn2dKJuzLp4BoVwD8IhK
aWZS2LrRWKN7V9rtGd7LHHlM4AZ7Ero/zwkv9fEK8ea0myvoL8MrBu7vniqAAxPJ
N6NlMuwuFCKSMW4UO/4gyPoOpzVUU8jHYMYygSAdyjK8s3RbAufJXXk/TSevnnjz
hnPW9EkSOi/jjXS9sstpCsmD5e7InKBqI+rEEBjG7WA7HjpSDv1rFn8NmrORllJH
kaKiCUF8V2ORv+gYEDZCqU6QSVR/29OPL6hkTj5didvDd5ucTbadTFqXzRv63039
/LMFJ0l4VqSx34E7xN8v9JGC9hpN0Q==
=vHik
-----END PGP SIGNATURE-----

--EVh9lyqKgK19OcEf--

