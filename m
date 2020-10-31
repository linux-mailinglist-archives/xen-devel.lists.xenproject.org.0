Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A12E2A1844
	for <lists+xen-devel@lfdr.de>; Sat, 31 Oct 2020 15:42:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.16940.41705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYs4H-0003yF-67; Sat, 31 Oct 2020 14:41:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 16940.41705; Sat, 31 Oct 2020 14:41:21 +0000
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
	id 1kYs4H-0003xq-39; Sat, 31 Oct 2020 14:41:21 +0000
Received: by outflank-mailman (input) for mailman id 16940;
 Sat, 31 Oct 2020 14:41:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CThl=EG=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1kYs4E-0003xl-Hp
 for xen-devel@lists.xenproject.org; Sat, 31 Oct 2020 14:41:18 +0000
Received: from wout5-smtp.messagingengine.com (unknown [64.147.123.21])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e9788167-381b-41e5-b415-7554db7d6de4;
 Sat, 31 Oct 2020 14:41:17 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id A1F8E7BE;
 Sat, 31 Oct 2020 10:41:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Sat, 31 Oct 2020 10:41:16 -0400
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de
 [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7F7F23064682;
 Sat, 31 Oct 2020 10:41:15 -0400 (EDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=CThl=EG=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
	id 1kYs4E-0003xl-Hp
	for xen-devel@lists.xenproject.org; Sat, 31 Oct 2020 14:41:18 +0000
X-Inumbo-ID: e9788167-381b-41e5-b415-7554db7d6de4
Received: from wout5-smtp.messagingengine.com (unknown [64.147.123.21])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e9788167-381b-41e5-b415-7554db7d6de4;
	Sat, 31 Oct 2020 14:41:17 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id A1F8E7BE;
	Sat, 31 Oct 2020 10:41:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Sat, 31 Oct 2020 10:41:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=kXYNxB
	OxqUlfOmI3lIqO6KTgNeITrbBAq5pwLVQVuBE=; b=iTaQEwVPjYkBlkZuDFFtxo
	gYBrNOQsaBajTZTBydXHFFcEEsTQQW6PL/oWfGjRpTjBzYjrWdPS0fT0s4zxS/CZ
	8kS2rM2fVIlduP/4UiRejJblgudcxaBfUh+0b2f+Xdp2ygX5T9xbg3K+n17znwEY
	PP+GrgiR4bSRcDP5wh83ZpeCs+6dGbTWnVq5abWd1mw+iQUNFRgwCW9G9d0eck+O
	V7/XUfgqv6qX2N/C3e9+Yi4zwUE5jJdmzshEHBXiYNbXcKuVEniyDTEI7Y7AtuXX
	J0u9GxnnVmdPFxiVVsa5ZHQGaafCPC9TR9wnMrveOGH8IFDbySZ4Pl9o+NZmalxg
	==
X-ME-Sender: <xms:jHedX8mkldb__Qwm6YnQJP_NDk6SlpZuTEPDdaipItussGye_gOgkg>
    <xme:jHedX73bBU-7zAwrMA_ScuHdrnD_ozmwu7r9kdTuf75Q5F2u3abPyFLDX1Di5AV-X
    BdpvYct0aceuA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrleejgdeikecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepjeduieeg
    ieffkefguddvteeffeehhfelfeduveeljeevteffudegkeejudffhfefnecuffhomhgrih
    hnpeigvghnrdhorhhgnecukfhppeeluddrieegrddujedtrdekleenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:jHedX6q1hlitzzMAcFCAGjVEY1WkTAs6Rz9VNpQoN3iLVjLJynfH8g>
    <xmx:jHedX4mBLeJSYDVYB1ec8DB-O33W42WHjO064gqC7a8R3tJwPhb1vg>
    <xmx:jHedX60BUaQKG5Efc0K2KKYqfnTcXc15-qX0yfdUmvFzNzQVQ6ZmkQ>
    <xmx:jHedX7B_AM9Z3NozVhcUXrCQkUe9Gk-23KCZ8t-ucYauDbZlaMYZcQ>
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de [91.64.170.89])
	by mail.messagingengine.com (Postfix) with ESMTPA id 7F7F23064682;
	Sat, 31 Oct 2020 10:41:15 -0400 (EDT)
Date: Sat, 31 Oct 2020 15:41:12 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: Xen Security Advisory 331 v2 - Race condition in Linux event
 handler may crash dom0
Message-ID: <20201031144112.GB16953@mail-itl>
References: <E1kUqJd-0001yN-2q@xenbits.xenproject.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mxv5cy4qt+RJ9ypb"
Content-Disposition: inline
In-Reply-To: <E1kUqJd-0001yN-2q@xenbits.xenproject.org>


--mxv5cy4qt+RJ9ypb
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Xen Security Advisory 331 v2 - Race condition in Linux event
 handler may crash dom0

On Tue, Oct 20, 2020 at 12:00:33PM +0000, Xen.org security team wrote:
>                     Xen Security Advisory XSA-331
>                               version 2
>=20
>          Race condition in Linux event handler may crash dom0

(...)

> xsa331-linux.patch     Linux

Do you know when it will land in longterm Linux releases? I see it
is included in 5.10-rc1 (released on Oct 25), but not in any longterm
releases (latest published on Oct 29/30).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--mxv5cy4qt+RJ9ypb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl+dd4gACgkQ24/THMrX
1yxd8wgAmIkt/zDzGAA+H4NKz0QZnsU9WKlsPooMyKroQmaoLqCrBuO7+8E7QSS2
GEIcTywZEqVpqgXjRv/jTD3a2pC5taeZsRS+/RPEGTV7BKr4PDwJH77qaFbkfgkT
NlvEZsX4iWCD1ps3uQ/7dHtr/O/yPV4NELiLIoH5c4rWUJTkaiB/GwEImzeWm+xI
w2x7h6ndx3GCvcykfJ5T8hVgSrsqjetkHUzUuSnyMcv0yBzDI0NAMpMWF/mHoFSN
paEz4I0vp3Z0zOhymsVQNnTgHiq8RClTZ/UbY/wdY36qn9EooKLSq4oyomqII5pA
oFmGtMAfM9PNXICJhPpZafD79AnyUw==
=+Ed/
-----END PGP SIGNATURE-----

--mxv5cy4qt+RJ9ypb--

