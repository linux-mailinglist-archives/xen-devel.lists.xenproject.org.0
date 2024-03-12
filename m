Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AC3878D03
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 03:34:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691621.1077808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjrxO-0007Qx-IG; Tue, 12 Mar 2024 02:33:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691621.1077808; Tue, 12 Mar 2024 02:33:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjrxO-0007OO-Ei; Tue, 12 Mar 2024 02:33:34 +0000
Received: by outflank-mailman (input) for mailman id 691621;
 Tue, 12 Mar 2024 02:33:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+jUN=KS=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rjrxM-0007OI-Gi
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 02:33:32 +0000
Received: from wfhigh3-smtp.messagingengine.com
 (wfhigh3-smtp.messagingengine.com [64.147.123.154])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e70f818f-e018-11ee-afdd-a90da7624cb6;
 Tue, 12 Mar 2024 03:33:29 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailfhigh.west.internal (Postfix) with ESMTP id 59DF018000B1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Mar 2024 22:33:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 11 Mar 2024 22:33:24 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Mon, 11 Mar 2024 22:33:22 -0400 (EDT)
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
X-Inumbo-ID: e70f818f-e018-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1710210803; x=1710297203; bh=BrpS3iRZms
	Wt2KXlgkMm+h/Ca4L1BiAjNrHJCHgaR+8=; b=NTZ7j3d7GwWPZvA5zCpQp0zXw4
	7cxJWu5rqnfe85PVFSyHpgI51sqxR5CE7RfP7gZT2k6FwCryAlBa4jlU7f3huexS
	FmOLS7adrS6dpuJhP8LG7c61alqoJcDs3aI7wXdPmpbPCdE/7U3cknl0IqsOQf8M
	tRp9+krCOoiasDs/pOvJNRRrbo1vIiQI6NG/5q6tKFNPZ1VztLMvyEKFuED7zXI1
	WH8HiIrEnEhDjRiQ5TLxdDW9vSVjhnfKoS45xKzkzdbjGYyZYs83ey45N2VhJIaF
	R7dTV24CjWAUSL981xIenTDbD1GNveuV4sGjBleSWrEkBZRUeNxWh6xHnXPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1710210803; x=1710297203; bh=BrpS3iRZmsWt2KXlgkMm+h/Ca4L1BiAjNrH
	JCHgaR+8=; b=NvtiX3c7+sB5me222MW+63TEKBPQpMcqGZ0+W+/nzYUdQjJyyFX
	AImUM+QKmjWHSrEpySWDa1i0vyCKG8oLMT2dTDmfp0UpzcnuiAc84p8Hcjf0DGKY
	phbT8ggfn5KMqNlbGQ8gCLeS/sYv4UiVb6uYD0ylqMDrCWsVSySrbCeBLWAbSrxA
	c33JIegiaJecIg8TiwzdSGEAArl3mQ3yh4Ma/zELlUdpC6UuzqOeHT98DqO70y0n
	2qBghQ7FibKsbyoa1vn5QIFjGkyvcgYoepUWBhnJXmy0jPd5nS6xeP63HlIdlKrQ
	RMnCrFkH66/TOFZ3ZW2IDUMhj2PRt5/Wafw==
X-ME-Sender: <xms:877vZSufhw_ko5bHd_witSandshQzpObqJCd3bHpimctELcsQgF9Ew>
    <xme:877vZXeDWcOEJmDLWIzHNkHUdwrH07raiVHPxElx552lTFXP4_MDtU4EX3wT9niH_
    Q79_LaFO_mCLg>
X-ME-Received: <xmr:877vZdw7TvR0QNjnGQD3Wij2406sNbAx0Ffn3N6Kh-skF8aSHWeXoxg6qz_kRzFfSXy7ejZCJIX8d02j1El4Lja5kLK7nsf3Ig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrjedvgdegkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfggtggusehgtderredttd
    ejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcu
    oehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeejffejudehgfegleejiedutedvudefhefgueeujeeikeehjeei
    fedtteethfeuvdenucffohhmrghinhepgigvnhhprhhojhgvtghtrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:877vZdOQyoq4tHBF-fCrwRP3Z4omyEI4089uSoTshaimaeN-RpTTTQ>
    <xmx:877vZS8AJc8A_5Zlr6EewZnKcDDc5BUvqTFDt79UVnPRVXZ1Njwaow>
    <xmx:877vZVXqJd8btrBpNpzyi8j3QLUgiWE5ZlZ3aljkepHFU6SOxAqu9Q>
    <xmx:877vZbe1pkK41ZuvetHt5AVK8Iv6WRKVx9RGfG--EH2pKMiMk9gibA>
    <xmx:877vZYnD5cp8jMOgFdHBZXVPKusOxb9Wac6qEbuWwjVb9InqlF5AkWDFhtg>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 12 Mar 2024 03:33:19 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: 4.17.3 download is missing on the website
Message-ID: <Ze--8L_GDtbQpk4n@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5GMSWMzpDNhlgOXw"
Content-Disposition: inline


--5GMSWMzpDNhlgOXw
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 Mar 2024 03:33:19 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: 4.17.3 download is missing on the website

Hi,

https://xenproject.org/xen-project-archives/ doesn't include 4.17.3.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--5GMSWMzpDNhlgOXw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmXvvvAACgkQ24/THMrX
1yzhugf+IuXpYXwZejfZ27n6Arh8BbziNGtD/PDWClZRx2J1m2WTBTStLpvtKzA6
8csSdfX9UTjlQ6NDeQQcaYiYNfxRFqMPTSmt5u7GONbcqu2HSbxpKZVtdKv92tH8
EH60L+CpHFbAlJPiLapgNuz2IupFxrgSJF80MoOjis+poMF2JZy7wLJ1U6xhI3Yg
Z9fAyR3p/D3wd2B2aip8CqVD88I+lykyGDywjvi3KlooPLpZ0nTsD1wX1Kmehn7w
wYMGjf3FvFbof+KO2fthtbhj5FJTiX/XAMgy7HKdEkxTzMf69sG9RU3HajB1+yiT
Cts7mxETYU13YCy55AWwDyeHKsUCIg==
=ie5y
-----END PGP SIGNATURE-----

--5GMSWMzpDNhlgOXw--

