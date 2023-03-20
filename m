Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E7D6C232F
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 21:56:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512131.791846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peMXN-0002uN-3w; Mon, 20 Mar 2023 20:55:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512131.791846; Mon, 20 Mar 2023 20:55:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peMXN-0002rv-0j; Mon, 20 Mar 2023 20:55:25 +0000
Received: by outflank-mailman (input) for mailman id 512131;
 Mon, 20 Mar 2023 20:55:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gj8w=7M=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1peMXL-0002rp-Uz
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 20:55:23 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83a82d10-c761-11ed-b464-930f4c7d94ae;
 Mon, 20 Mar 2023 21:55:18 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id D6B42320092D;
 Mon, 20 Mar 2023 16:55:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 20 Mar 2023 16:55:14 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Mar 2023 16:55:12 -0400 (EDT)
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
X-Inumbo-ID: 83a82d10-c761-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1679345713; x=1679432113; bh=tPdEHJrDWu35SXj7s5oJv+WkSuBYmRSustA
	PqJd6BuE=; b=FTA/06kbyHxLYNnJeJoXkr23kjdgH5MO2qrrsSYXFk7xhmnX7BL
	LixFhO8gxVwf8WOIvh8jIJevnZAdV2sH53+SGuOX63dUN95rmvyadFf4bFxDl+36
	SKjNbf0SEvUai2CEoFW3Fsr1eYr3OMjlB/g0ip/IRVkNVytHHHxyfq3ujqxk/iAK
	u0Lt2O4EYd8ngB35XyY4XX4xF9K84+wKWfvEtYtwemXO3Gs1uS+IgqUbXTSdycGP
	DDVzHN7Lv+Y94FTXfl5WLHcb+9bYF2vRmgwwEVlsw+QB3PZOloS5rI0+UBPNoGmK
	WqqcD7AiIkm6CiD2Ls5E4wq0pbJic308/og==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1679345713; x=1679432113; bh=tPdEHJrDWu35S
	Xj7s5oJv+WkSuBYmRSustAPqJd6BuE=; b=AZCHBRScufC1BtzkiWTLDQPLAsPTn
	FZVNDPOLSIS9sQzWsrmIV73JhbZ16w05hXm4i4TZSOpmtGoi4QlzIdGiS/ffBdvZ
	r86CacryV1vVwqSKboHaPmWpdZ6faemC/Tlhth/pJPc4jg6dUUY2kT8EE/QJcCDv
	1pRR3RWmSyswz2To6vkXlv04dxLMBfDDCUyPCSxLPI22KMqbHvCf8wd4HY/9HNji
	tAVc8t6wnezHPzWXfouh1fr6e5F3mOZzNhDX7mBFSW+y/i63oeTiG/XRkd08zyzu
	EXiZj2arUh1Ei8MiW8W2kvkUFwQGnaQiRhDYBSXP30v1MOzNdOV6SM+nA==
X-ME-Sender: <xms:McgYZO5AWlXdClB8TVIwS4muLm5BAgHZR__mvNGa6kqsx3Z5nzffwA>
    <xme:McgYZH6VIfU263N3VHJm3ovXZH_k7ifGR4lJNxhPQgPw4UhF_vRAeVWmqyQzmeJt8
    ok9HubFoincRQ>
X-ME-Received: <xmr:McgYZNcyJJdPr_2MObzmboRxGxTRCZ4JfwIiPopWR86TYfx43YdrbHNnmOWltT0TFnjcxRlUU8IIHi9q6tIOWjai96eDWr4D_k0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdefkedgudegvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeek
    gfeuffeggeeikeffhfduhedtkeeuhfeivdfhtdeghfefffevtddtieetjeefgfenucffoh
    hmrghinhepthhomhhlrdhithdpughotghkvghrrdgtohhmnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:McgYZLI7LnWX0QC532OM-XImFzi7fuerlcwjRHg29KPPsTqDZA46MQ>
    <xmx:McgYZCIbrQ5cJ6OrAlM3KPP-tI1Fnr2Na2mv5dR3jcXdYrBeOzMr4w>
    <xmx:McgYZMy1U8bFoPBKz8Xx4I-xTWWiBoudLQIYMcG0GZDqw6GU7JFCCg>
    <xmx:McgYZMwzngGygZ55emvWiQJ5B7yCkHnVzR9a00CRg6lw4UZYwCTCXw>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 20 Mar 2023 21:55:09 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 2/2] automation: add a suspend test on an Alder Lake
 system
Message-ID: <ZBjILVMZd3vRwrel@mail-itl>
References: <cover.5a69c1f96ff446a5872e9dbf6308be9ab278f9df.1679023966.git-series.marmarek@invisiblethingslab.com>
 <aa4385f5291ebc06551414e4d8cbf7cdd3996eef.1679023966.git-series.marmarek@invisiblethingslab.com>
 <alpine.DEB.2.22.394.2303171539520.3359@ubuntu-linux-20-04-desktop>
 <ZBULiU0222GlcC1W@mail-itl>
 <alpine.DEB.2.22.394.2303201258140.3359@ubuntu-linux-20-04-desktop>
 <ZBjDu+EEvQ51hWFU@mail-itl>
 <alpine.DEB.2.22.394.2303201337580.3359@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LgCbvsMqQZD1sKVN"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2303201337580.3359@ubuntu-linux-20-04-desktop>


--LgCbvsMqQZD1sKVN
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Mar 2023 21:55:09 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 2/2] automation: add a suspend test on an Alder Lake
 system

On Mon, Mar 20, 2023 at 01:41:45PM -0700, Stefano Stabellini wrote:
> On Mon, 20 Mar 2023, Marek Marczykowski-G=C3=B3recki wrote:
> > On Mon, Mar 20, 2023 at 01:08:42PM -0700, Stefano Stabellini wrote:
> > > On Sat, 18 Mar 2023, Marek Marczykowski-G=C3=B3recki wrote:
> > > > On Fri, Mar 17, 2023 at 04:10:22PM -0700, Stefano Stabellini wrote:
> > > > > On Fri, 17 Mar 2023, Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > +fakeroot -s ../fakeroot-save tar xzf ../binaries/initrd.tar.gz
> > > > >=20
> > > > > I am a bit confused about it: are you sure you need fakeroot for =
this?
> > > > > This script is running inside a container as root already? Are yo=
u using
> > > > > Docker on the RPi4 to run this job?
> > > >=20
> > > > This is running in a rootless podman container. But even with docke=
r,
> > > > for device files to work (see commit message) it would need to run
> > > > privileged container, which I'd like to avoid.
> > >=20
> > > Are you sure? I can run a non-privileged container with device assign=
ed
> > > just fine with Docker and
> > > =20
> > >   devices =3D ["/dev/ttyUSB0:/dev/ttyUSB0"]
> > >=20
> > > in the gitlab-runner config.toml.
> >=20
> > It isn't about accessing existing devices, it's about creating them
> > (unpacking rootfs which contains static /dev) and then packing it back
> > still having those devices.
>=20
> OK for that definitely you don't need a privileged container. A regular
> container comes with "root" by default, but without all the privileges
> that "root" normally allows outside of a container. That is enough (at
> least in my environments) to pack/unpack a rootfs successfully without
> fakeroot. Maybe this is a podman-specific limitation?

It seems so, as rootless podman isn't running commands as root on the
"host", but instead in a separate user namespace.

> If you are curious to try, you should be able to run a simple
> pack/unpack rootfs with Docker (of course without --privileged) without
> issues.

In fact, the same issue happens in docker, if I enable this extra
protection there[1].

[1] https://docs.docker.com/engine/security/userns-remap/

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--LgCbvsMqQZD1sKVN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmQYyC4ACgkQ24/THMrX
1ywvfwf/c4sqwC2SxM41ziSp2VKcQ/UBfspFfPE7ia9MTkEXBXPfgEBpc5Nqs5tr
A5BX/MaDyzX0RPl00fLQWRIAdys0L3gDGuDLR2VmXn7a11XZ7COB1Z6/Mt2kq+2c
LToTQ45YuniRfA8CasHpgnkxbu+qVKzHQ3yJU+8lF5VF9pu9p2Mdw+40YEbvnxDZ
A5NA98xFj6W5+m/qXQUyOUwj9nXy+ixceCZ0sdXI5fPBHbTS9oXJlD3KhZQVtnJO
bd7/1KlWeRAIdD9IXLPYQHBh16h9xovHkf30zyRO92s+5UKv+cI63DQGVMksqfXb
Yu1qk55EXD+pblWNANnJK0JsQR31/g==
=aUOH
-----END PGP SIGNATURE-----

--LgCbvsMqQZD1sKVN--

