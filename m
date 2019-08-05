Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C549482108
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 18:02:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hufP7-00016f-Sv; Mon, 05 Aug 2019 16:00:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vjjD=WB=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hufP6-00016a-FV
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 16:00:08 +0000
X-Inumbo-ID: 17b46f8c-b79a-11e9-a66a-43d98a09db75
Received: from out5-smtp.messagingengine.com (unknown [66.111.4.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 17b46f8c-b79a-11e9-a66a-43d98a09db75;
 Mon, 05 Aug 2019 16:00:06 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 0516921F15;
 Mon,  5 Aug 2019 12:00:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Mon, 05 Aug 2019 12:00:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=lHYoGu
 gcmZqd3StnM6P3Ux3qQFrx/v4aNkzTXBYHqFY=; b=Dh/MZBMPEwhKJIBEKucXqu
 J2emmyKTSglhP2M/zCcUgnEN+RpQeZzWs7AY/jzdtvswzWLVp6N+GobXsx5SE83+
 gVei0RzrQopX35gz5YyOfoRezI/bNTS7E80uz5vgW8gVRMlskFMwIadaNodzyoew
 aEs2jZSwLOY9UtvuIr4ZEisdNWjg20dJz/tiA8DIKyawbELAa/IFZHjXFJXU7vkZ
 1oLJH7XFzt+BcQxKoNjQ8fQbwkFsb1lCWe62Y1r3FNDvBd91I3Q6r/pddl+WBJTL
 qdr8PlgAewjCWnLXZNtcIZg7TzeBgzaQgco24X8wIGcX21rPxS2/2RZl3P1SByBw
 ==
X-ME-Sender: <xms:hVJIXSc4BN5V4Mup-m4EGbEDi1oicsy7Zth1c_VaDFtvcIzvr9ca0A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddtjedgleehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjfgesghdtreertderjeenucfhrhhomhepofgrrhgv
 khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
 hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecukfhppeeluddrieehrdefgedr
 feefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisg
 hlvghthhhinhhgshhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:hVJIXQfoV4nd5FeLtXf6N13PnzleIFnilncTshDi9b4HAC-X5fI58Q>
 <xmx:hVJIXegBAy9N0kHIdJQewvo44s3AkRXd16Or5bPyye-TFJcncVV21A>
 <xmx:hVJIXURJ3bj9TC1GeLuCZEYkx15vuVkWkfLXuGRPgqSALJuTmAZbhA>
 <xmx:hVJIXdqTs3UUxrfzUaNoiWxbE6Sl8izrvqwld9GYF2Oyo_bSzMX9NQ>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5979F380089;
 Mon,  5 Aug 2019 12:00:04 -0400 (EDT)
Date: Mon, 5 Aug 2019 17:59:58 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20190805155958.GE1250@mail-itl>
References: <20190429224252.29000-1-marmarek@invisiblethingslab.com>
 <23752.8472.14097.76030@mariner.uk.xensource.com>
 <23880.17310.533723.275468@mariner.uk.xensource.com>
MIME-Version: 1.0
In-Reply-To: <23880.17310.533723.275468@mariner.uk.xensource.com>
User-Agent: Mutt/1.12+29 (a621eaed) (2019-06-14)
Subject: Re: [Xen-devel] [PATCH v2] python: Adjust xc_physinfo wrapper for
 updated virt_caps bits
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wei.liu2@citrix.com>
Content-Type: multipart/mixed; boundary="===============1614501127391224769=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1614501127391224769==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4zKt6bo/V7G+vDr7"
Content-Disposition: inline


--4zKt6bo/V7G+vDr7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 05, 2019 at 03:56:30PM +0100, Ian Jackson wrote:
> Ian Jackson writes ("Re: [PATCH v2] python: Adjust xc_physinfo wrapper fo=
r updated virt_caps bits"):
> > Marek Marczykowski-G=C3=B3recki writes ("[PATCH v2] python: Adjust xc_p=
hysinfo wrapper for updated virt_caps bits"):
> > > Commit f089fddd94 "xen: report PV capability in sysctl and use it in
> > > toolstack" changed meaning of virt_caps bit 1 - previously it was
> > > "directio", but was changed to "pv" and "directio" was moved to bit 2.
> > > Adjust python wrapper to use #defines for the bits values, and add
> > > reporting of both "pv_directio" and "hvm_directio".
> > >=20
> > > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethi=
ngslab.com>
> >=20
> > Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
>=20
> I think this is a backport candidate for 4.12, since f089fddd94 was in
> 4.12.  Am I right ?

Yes, definitely.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--4zKt6bo/V7G+vDr7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl1IUoAACgkQ24/THMrX
1yxvRgf9G+TA1SNC7EZV0fEu5zGHfo0ol79mXK84CJcMTf6aPk4wKYDogCEYBJCA
YmuxIdP4NQOlf48krKDq2HecO0BtYZ0OO8uPFiDhuSk7rA5G92QmXWCMhgiIeUpL
DvjhosG5cbnjdNtrr9MV2zmN/eGPsFSmfAID3RtR6pGPhtLNJXPtY/nZqH//F7qb
3P8n+ACqwZGYjHfbzNsbtP3s2qcJNg8uUx43TVjcIJ1X2oxMoIXmMdl5mVLDg1aR
Y4cTAfl0tnMl8Pa5pAtoi5Rq5oCNreCO6E/1MPFA+18UfdqUTTHkIi8GQ1/Q46p0
YGPwjC65V7bTLdKOUhjEOA4hhQXXVw==
=dMG6
-----END PGP SIGNATURE-----

--4zKt6bo/V7G+vDr7--


--===============1614501127391224769==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1614501127391224769==--

