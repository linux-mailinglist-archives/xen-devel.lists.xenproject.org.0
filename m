Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1736E82098
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 17:44:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huf6Z-0007eY-9J; Mon, 05 Aug 2019 15:40:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vjjD=WB=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1huf6X-0007eT-Fd
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 15:40:57 +0000
X-Inumbo-ID: 69eb7aea-b797-11e9-8980-bc764e045a96
Received: from out5-smtp.messagingengine.com (unknown [66.111.4.29])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 69eb7aea-b797-11e9-8980-bc764e045a96;
 Mon, 05 Aug 2019 15:40:55 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 6C2A921FBA;
 Mon,  5 Aug 2019 11:40:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Mon, 05 Aug 2019 11:40:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=9x1QZx
 ytU2ki3SoDZFskudhUPSvnR4IkoCU84Vkwc/U=; b=DejroPvgddI5jB6mBFFqeo
 ExJoLIzFc0514Ec9DY3HaFKKPrZ7lWQhdQEdAnK1/JgQQqZwjyhKoLWc/XVl5Xr5
 Rrah7ilMAimfWDskF0OppZ98jeC59vqN0+fNAEuUX43oC1ZGUBG6pjJo7AzIjZnf
 wXRo5Xwv6KtMBdz++gsI18uo1Nn0rpw1m6uH5xxcek1mNtwxbMDMV0HxGRQjzrsc
 sRgYqZyY8zzmg20jm42UDa8VRn+6IFxMLRmE3spHYZniFIESaoPYHzvASj8w0VqG
 sPBVfEqXzYLrre0JQ3zdigAH9cVHEEOuDFsn55RzgDHdjXiAFx/x8nfgWNsBTKgw
 ==
X-ME-Sender: <xms:Bk5IXfr55ofe-ZpGGh-epXJYNFMVZkN6zy-iJIdoloaIEcCKKr_5Nw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddtjedgleduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjfgesghdtreertderjeenucfhrhhomhepofgrrhgv
 khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
 hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecukfhppeeluddrieehrdefgedr
 feefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisg
 hlvghthhhinhhgshhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:Bk5IXeBEuGgvF_hKQ4umXanCc0rV_z2zUPnyhvrVv-QfCkrXOTD29A>
 <xmx:Bk5IXaHQhBVBsssfrLQMa1rZgFvWQTIdnrrylFR4aFpaozgXgqFpfg>
 <xmx:Bk5IXQ0R9LUMQfqVF6IK5BKqvYf3N4sOxRWVgg7z1BzkuTDcKz4Owg>
 <xmx:B05IXVnTCXEiG5rB5VZa4i4g2eV-wsMM1hW7S8IEvBJe3iFR7gilVw>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 495CB38008F;
 Mon,  5 Aug 2019 11:40:53 -0400 (EDT)
Date: Mon, 5 Aug 2019 17:40:40 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20190805154040.GC20589@mail-itl>
References: <b1008379-a9cf-f7ab-b34b-da463ec5f074@suse.com>
 <20190723205929.GK3433@reaktio.net>
 <CAMmSBy_0KsjQ_e7S=nVxCEuowtEjfMOZ9Rf_DgHcgM6am3vCdQ@mail.gmail.com>
 <B92482B8-3A93-4085-9A6A-26D457261076@gmail.com>
 <23880.18663.729437.866196@mariner.uk.xensource.com>
MIME-Version: 1.0
In-Reply-To: <23880.18663.729437.866196@mariner.uk.xensource.com>
User-Agent: Mutt/1.12+29 (a621eaed) (2019-06-14)
Subject: Re: [Xen-devel] preparations for 4.12.1
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
Cc: Lars Kurth <lars.kurth@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Roman Shaposhnik <roman@zededa.com>, Rich Persaud <persaur@gmail.com>,
 Jan Beulich <JBeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============4854127917074510678=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============4854127917074510678==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZmUaFz6apKcXQszQ"
Content-Disposition: inline


--ZmUaFz6apKcXQszQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 05, 2019 at 04:19:03PM +0100, Ian Jackson wrote:
> > >> "libxl: fix pci device re-assigning after domain reboot":
> > >> commit  c19434d9284e93e6f9aaec9a70f5f361adbfaba6
>=20
> Thanks all.  I pushed this to staging-4.12 today.
>=20
> There are a couple of other things that I say in git log that might
> warrant a backport, and for which I'm hoping I get replies quickly.

I'd like to propose "video: fix handling framebuffer located above 4GB"
9cf11fdcd91ff8e9cd038f8336cf21f0701e8b7b (see commit message about a
little change needed during backport).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--ZmUaFz6apKcXQszQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl1ITfoACgkQ24/THMrX
1yzydQf/fz7JOQRHV62YxJBYyOobw+CMkpFCN26YeoUUSOSmOpeDPUIWk1xoouFS
hkuf6BhWDrrLpPirw2/yl39J/8ZjGRoEX5pIT5KcbeYM8vJETnloN/YREn2swcpE
V4USdUJiKueutZ8VrQUg1bsZ1W69lBrnh9Ws/5VtvV5fGSgbvknyPTWoyz4EuXRr
3cpeDSpAEV23CxNtjHmlAAZL5nagxYu/qgoGrUaiQ44nWylIB9V3IBGNOON/c8AI
yX6DASFWLllvIfJ4cQDVIUA5e089uQY7uBeuvOOj3KSm/d+PbrnfWzrybBJUvF7z
90HIBAOT0owDTQ0WVALcMrTZk852kg==
=OsgF
-----END PGP SIGNATURE-----

--ZmUaFz6apKcXQszQ--


--===============4854127917074510678==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4854127917074510678==--

