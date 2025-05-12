Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A43AB3AD5
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 16:40:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981588.1367989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEUKd-00034G-Jt; Mon, 12 May 2025 14:40:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981588.1367989; Mon, 12 May 2025 14:40:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEUKd-00032P-HD; Mon, 12 May 2025 14:40:39 +0000
Received: by outflank-mailman (input) for mailman id 981588;
 Mon, 12 May 2025 14:40:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jVxJ=X4=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uEUKb-0002zR-Qw
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 14:40:38 +0000
Received: from fhigh-b8-smtp.messagingengine.com
 (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f049c08-2f3f-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 16:40:34 +0200 (CEST)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 000B1254008E;
 Mon, 12 May 2025 10:40:32 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-11.internal (MEProxy); Mon, 12 May 2025 10:40:33 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 12 May 2025 10:40:31 -0400 (EDT)
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
X-Inumbo-ID: 0f049c08-2f3f-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1747060832;
	 x=1747147232; bh=NmRDmWTFg3ocMBQn/1j5ysNHailaYK3KynlSL0Gb9pw=; b=
	dwPj1iHZWC7ovuIkQ75P9Hngh3Zd1/RHLvKtfm7eW/8+W1P79XrpVS+sij3hCdC7
	X1ScGEigDoJLLSLq6uHS0zWDeTTojCLcwWTD9MGrLc1XPJAVPk7vITNvxyoy1hDi
	UaVFcVn+fOsVKgIx2JLygqE3sRCzVHGF0tUfflgNez+peumvIqnUkj9E9keWy2xJ
	cYkuk8y9NtoYglnRhG0vCKlxqqKwaBM1gn6eLJ1Uhfzw4dr44hafCK4yNhpiVEt+
	85G1J/EUxcDc8lWWRAVEo+iMXkPSUgYn64hFTvkR5GXAL7nY6FeoktbBene1JJf+
	MoPwypPYzP9CwPWWRk2cWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1747060832; x=1747147232; bh=NmRDmWTFg3ocMBQn/1j5ysNHailaYK3Kynl
	SL0Gb9pw=; b=uuawL/7URmchijrmoE26AySGUXWqL5sUaGC3X4XozWSIj+y3qLB
	INivGbuOw5LJcWvexTjatLTXm0JTTV8eJFx6+KfPI02upp83m2sn0gOMfdTjmoTa
	qycTxUcUFLAB/xdgaxsHQPilpLJIp/KVFE3ZyOsTOBp+LYTd4T7jInz7bJT2oTYP
	w8EV8JxLmnKLCDJj3P3wh3eWjSfGoE7Rkkku6T0HkMa739htUVodB4XOZDyMYgzb
	VTBXOCLQA2url3caWrB1noOSi1pW9BFs6zA42fOcAWhnF70UdRVHT9n0Y6CSKpP3
	ptxHAJAJlRkiLjF6AjETv+q3sHwT0m/Mg5Q==
X-ME-Sender: <xms:YAgiaNKaROkxNbtQ9ytb0YRrauDdEmbaC7hEdoY-V2ynRR3QQxqTFQ>
    <xme:YAgiaJKz3BIhgN4EkMEcXfbhdwKkYcRJnMzMhGlbR7Qj7VhWLbjHe5dP3szQvTf0d
    03enFaCm6-sfQ>
X-ME-Received: <xmr:YAgiaFv5RW8i4E58lmU9ePolo0UhKxMyeVj_yJC3t-NpzpFou6MqFtCJYGIt7Jp2afAA4JE8QsouV1H0qxEtKPDCKaezcS4syw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdduhedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepveeujeetgeelleetudeuvefhtefgffejvedtvdfgieevheethe
    elgeeuledvjeevnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopedvpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtg
    homhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggt
    thdrohhrgh
X-ME-Proxy: <xmx:YAgiaOZZmk2XqmPTmqVYh1UEoo9fGTBK02hsihedM5H9JULxQiDllA>
    <xmx:YAgiaEavyEdtyFilmVwtp8sV1q6SizYHL7bR9FLSiHsfkoDakCFVWA>
    <xmx:YAgiaCAhWqenWFvzQIXKQtmGKjyVz1zHiTGS81YkNrhPiS5sYckUYw>
    <xmx:YAgiaCZsQPcaiWRKBh4Tk5V0yrVOMsQoYF7y5yTXIj9HV8XMlHzhQg>
    <xmx:YAgiaOXMmTVaKKhK-9xgCy4Kh7YYymdXbn-s-aGrL-ra2wAIXzDvetQX>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 12 May 2025 16:40:29 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Issues on Zen4 (hw12) runner
Message-ID: <aCIIXkYar0TNP7H_@mail-itl>
References: <aB0XtEor2rCxBKWR@mail-itl>
 <aCHMwWd7cq-ZIMOl@macbook.lan>
 <aCH4MnNQ7IzhJfkl@mail-itl>
 <aCIDj_8tDcjR1nUS@macbook.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="udp08jojfO2v1HwX"
Content-Disposition: inline
In-Reply-To: <aCIDj_8tDcjR1nUS@macbook.lan>


--udp08jojfO2v1HwX
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 May 2025 16:40:29 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Issues on Zen4 (hw12) runner

On Mon, May 12, 2025 at 04:19:59PM +0200, Roger Pau Monn=C3=A9 wrote:
> On Mon, May 12, 2025 at 03:31:19PM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Mon, May 12, 2025 at 12:26:09PM +0200, Roger Pau Monn=C3=A9 wrote:
> > > On Thu, May 08, 2025 at 10:44:36PM +0200, Marek Marczykowski-G=C3=B3r=
ecki wrote:
> > > > Hi,
> > > >=20
> > > > I wanted to post another revision of the series adding hw12 runner,
> > > > hoping that all known issues are fixed now, but unfortunately there=
 is
> > > > still something broken. I've rebased my series on top of staging
> > > > (ed9488a0d) and got this pipeline:
> > > >=20
> > > > https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/1807=
819142
> > > > (note due to some added debugging, some tests are incorrectly marke=
d as
> > > > success even if they failed...)
> > > >=20
> > > > 1. USB ethernet doesn't work on PVH dom0: https://gitlab.com/xen-pr=
oject/people/marmarek/xen/-/jobs/9978694739
> > > > There supposed to be an USB ethernet device connected to the USB
> > > > controller at c3:00.4. In the PV dom0 case it's detected as:
> > > >=20
> > > >     [    3.911555] usb 7-1.4: new high-speed USB device number 3 us=
ing xhci_hcd
> > > >     [    4.004201] usb 7-1.4: New USB device found, idVendor=3D0bda=
, idProduct=3D8153, bcdDevice=3D30.00
> > > >     [    4.004675] usb 7-1.4: New USB device strings: Mfr=3D1, Prod=
uct=3D2, SerialNumber=3D6
> > > >     [    4.005079] usb 7-1.4: Product: USB 10/100/1000 LAN
> > > >     [    4.005349] usb 7-1.4: Manufacturer: Realtek
> > > >     [    4.005599] usb 7-1.4: SerialNumber: 684D35
> > > >=20
> > > > But it's not there on PVH. The USB controller itself is detected, j=
ust
> > > > not device(s) connected to it. This applies to other controllers too
> > > > (there should be about 3 or 4 other USB devices - none of them show=
 up).
> > > >=20
> > > > 2. There is a bunch of "unhandled memory read" errors during PVH do=
m0
> > > > startup: https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/=
9978694739
> > > >=20
> > > >     (XEN) [    4.026323] arch/x86/hvm/emulate.c:417:d0v0 unhandled =
memory read from 0xfedc0020 size 1
> > > >     (XEN) [    4.026789] arch/x86/hvm/emulate.c:417:d0v0 unhandled =
memory read from 0xfedc0021 size 1
> > > >     (XEN) [    4.027247] arch/x86/hvm/emulate.c:417:d0v0 unhandled =
memory read from 0xfedc0020 size 1
> > > >     (XEN) [    4.027671] arch/x86/hvm/emulate.c:417:d0v0 unhandled =
memory read from 0xfedc0021 size 1
> > > >     ...
> > > >=20
> > > > This repeats several times. Could be related to the USB issue above?
> > >=20
> > > Can you try with dom0=3Dpf-fixup?  Those unhandled accesses might be =
the
> > > cause of the USB issues.
> >=20
> > It did got rid of those messages, but USB still doesn't work:
> > https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/10006580289
>=20
> Hm, is it possible that the usage of console=3Dxhci is interfering with
> USB devices?  Could you try to boot without console=3Dxhci and see if
> you can still reproduce the issue?  You will need the physical device
> by your side, which I'm not sure it's possible.  Don't know if you
> host those remotely somewhere.

I can try, but will need a proper driver there (in dom0?) - AFAIR VGA
nor efifb doesn't output to HDMI there (and eDP is not connected).
Anyway, it's IMO unlikely, given it works just fine with PV dom0...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--udp08jojfO2v1HwX
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmgiCF0ACgkQ24/THMrX
1yz5pgf5AXuzojrbbMGQoZr7k+8lI/PQjYisPyTyCwajAyeXxqO5tZhfWzYXNxRe
wCgSjJ1YybIvJxW7vZMqyl5Hg54ZzK9Y5Ew1/O29m97mfLvltAunGMZ7sxSy2tiF
8QK3zAw6AKlHivrBHDXmO7M02lzxUyJqgfHvFgrqQ3KYdq3ZTAnRuSlD//oodJuz
KfSlbYABeXN/ZsbtMR3Xpxli395bK2yjtr5Lpn6daGgoO2ad0OSHUNZQIMn+Y+D1
5nk7pWCYw9LbxCBUBveknRHd2oyvNNqcbLNt2mM0FDjIzIO6Qk/PJttPv5+cCMhm
q8jomsE25noFmybCYSRJ69qBKyvCjA==
=U694
-----END PGP SIGNATURE-----

--udp08jojfO2v1HwX--

