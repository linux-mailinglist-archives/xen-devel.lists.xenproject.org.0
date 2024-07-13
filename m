Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB9D930361
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jul 2024 04:46:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758380.1167851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSSlV-0004UG-1X; Sat, 13 Jul 2024 02:45:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758380.1167851; Sat, 13 Jul 2024 02:45:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSSlU-0004Rg-UF; Sat, 13 Jul 2024 02:45:36 +0000
Received: by outflank-mailman (input) for mailman id 758380;
 Sat, 13 Jul 2024 02:45:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PEx+=ON=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sSSlT-0004Ra-9X
 for xen-devel@lists.xenproject.org; Sat, 13 Jul 2024 02:45:35 +0000
Received: from fhigh2-smtp.messagingengine.com
 (fhigh2-smtp.messagingengine.com [103.168.172.153])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8b897c7-40c1-11ef-8776-851b0ebba9a2;
 Sat, 13 Jul 2024 04:45:32 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 254161140F6E
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jul 2024 22:45:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 12 Jul 2024 22:45:31 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Fri, 12 Jul 2024 22:45:29 -0400 (EDT)
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
X-Inumbo-ID: f8b897c7-40c1-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1720838731; x=1720925131; bh=RTzINzHHk4
	QcHsd7cEbTPB8Y6T0eHxc0HxvJyt1EJPA=; b=Qikc5g3YM+j346rmJ+l8Gn/9g4
	TE0aqjWI1/njLLmJPZU6uzM4xm03sVQP2h1cUmSk6ZFqt/vu1TEThKyRC9FLM60y
	vjOFFdGliQx1uoobnKFPC9HlarzUtsj6txl7cuU1r95Hqkj+G1iUscNe0BWn1IdQ
	NHyeb5UlSsOkunvT34qRfdMmsODG3agUFNBW5neShJqcK1bI6JcDzvJzMW5padzE
	REks/hR0FXwG2hoSiCr4MzDP7detPWSymC092BjGltLlTVZmAhUdVJxylrwvREvh
	WE9BUh60fa/DMyIaG4SlbR6jOSrUpt8kVK0ACpbU3r63ocFNpTxNX7qKTjyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1720838731; x=1720925131; bh=RTzINzHHk4QcHsd7cEbTPB8Y6T0eHxc0Hxv
	Jyt1EJPA=; b=W+oVvrT3YsF2JpVaTm3j4DGBg6ETtgTDqH4hj7XJlivH7jJ4w1d
	l635XHnzZh5npyyU98CAsDN8/S3eXidQO81ovnS93LQVv/D7ZrwHIsRWmqAd+3aA
	u7JukHikPo4v8z12dNnWwXpK1kYcN3HoZTa3ynIQ2Gtgb+IIhS4aXFdqufNBYIoF
	icEyrzhBoJB9rSDrAbyLndh+y4rU4DG02mL4JZmim0DNoyiJrd0VdJywdxutbLVr
	hoKnjfXO9dHd1ygwHNhCqL26Dt+M2mGGX9yZddc0jUb8viMDqezfW01bDoiqD5Qt
	xGiyRhJV7TgVCZ6h7w77g+S3MwbIJrvTXFQ==
X-ME-Sender: <xms:SeqRZvDFZecMp3znPo1HaHou9Y-He9U9RcKc70ksbtnJmkemVVZO3Q>
    <xme:SeqRZlgDYddDqhlDZRhZfhxcTxBslNIU8Iy0GCa5n6l2VN6arYxNfeEOBRfGghG6r
    5Z0SsHUtAVLlg>
X-ME-Received: <xmr:SeqRZqnUzzloXHusvtNaLpklh2je_fWjyPVkunHxnncc3hki_WaApSU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrfeejgdeigecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfggtggusehgtderredttd
    ejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcu
    oehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedtudfgteduveduieevvefgteeujeelgffggffhhffhhedtffef
    fefgudeugeefhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:SeqRZhzOPDUUrrlRNSTWufCK_p-dSntgDhTxytHbPSBffb20iwsEuQ>
    <xmx:SeqRZkSuJNLg5cDLjmqSYNeoZgby6HNlfLdXn2OFwD5cj7qHmnEn4Q>
    <xmx:SeqRZkbnxY0pAbNSKolPgo3DtsbP41AM7RTSuZGNMCbzFWyl-JZ9SA>
    <xmx:SeqRZlTuMYaobXOT70uuFrOByIaH_7IlUfhXuJU0fKm96HgmW4zUiw>
    <xmx:S-qRZt59mWTZHd_A453gRVNpDNymPOFIpvilibUy6Sg_XH0vjKTz3iPm>
Feedback-ID: i1568416f:Fastmail
Date: Sat, 13 Jul 2024 04:45:23 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: systemd units are not installed in 4.19.0-rc2 anymore
Message-ID: <ZpHqR4e3VaFAXC3m@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rfShu3Sxzvplo84j"
Content-Disposition: inline


--rfShu3Sxzvplo84j
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 13 Jul 2024 04:45:23 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: systemd units are not installed in 4.19.0-rc2 anymore

Hi,

Something has changed between -rc1 and -rc2 that systemd units are not
installed anymore by default.

Reproducer:=20

    ./configure --prefix=3D/usr
    make dist-tools
    ls dist/install/usr/lib/systemd/system

It does work, if I pass --enable-systemd to ./configure.

My guess is the actual change is earlier, specifically 6ef4fa1e7fe7
"tools: (Actually) drop libsystemd as a dependency", but configure was
regenerated only later. But TBH, I don't fully understand interaction
between those m4 macros...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--rfShu3Sxzvplo84j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmaR6kcACgkQ24/THMrX
1yxCjAgAhFb2fu9P0SHcjyq1Ae5+ZviVlqo2furBPu7gizpjTYXoGXN19el3X7im
bWxQfsVeUQhtp4qsJgs6aSSVY46mPL7FbtgSFibsB+U3sjtzKXcrHn4uyz01c/Qp
p2c1RpXXE7cLKCcXC71/IsuvYXWht0VvXeh/+An56zqIAz4lpPUZ+pbvIX8K6E7L
na9bT8zAaIMsoNOySo973dyGJv1a4v8k7y9U8Rwxh6gTVe7dOagq7ouZXwzwHM5w
e4uq4ZlW64/NYWZpxb0gHV3gsmL3j1R2xQSDzmxS0f19uSDLeOS6o96qxC2fOXeM
EWLso1oEnbDtLFJ0xd33T8xmNceQag==
=ACfB
-----END PGP SIGNATURE-----

--rfShu3Sxzvplo84j--

