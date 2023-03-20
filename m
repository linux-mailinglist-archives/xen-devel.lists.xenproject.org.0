Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC2C6C22E5
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 21:36:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512124.791826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peMEz-00087C-B3; Mon, 20 Mar 2023 20:36:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512124.791826; Mon, 20 Mar 2023 20:36:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peMEz-00085N-6q; Mon, 20 Mar 2023 20:36:25 +0000
Received: by outflank-mailman (input) for mailman id 512124;
 Mon, 20 Mar 2023 20:36:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gj8w=7M=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1peMEx-00085H-D9
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 20:36:23 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ddeb0598-c75e-11ed-87f5-c1b5be75604c;
 Mon, 20 Mar 2023 21:36:20 +0100 (CET)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id C1ADB32007D7;
 Mon, 20 Mar 2023 16:36:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 20 Mar 2023 16:36:17 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Mar 2023 16:36:15 -0400 (EDT)
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
X-Inumbo-ID: ddeb0598-c75e-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1679344576; x=1679430976; bh=hvuKvPCswA+4GGF4uZhCiMM3DTbXMxPWRVe
	Fy5E0JSo=; b=ml2ogotx/A4/63gn0pDGaAcFAjvBvtNIiqTAdIanvEv4dBsO7Ha
	ZoDeVuYpk6cvbouH2VbI4FjfHX7R9BX6+MG2tPMtcy3zONWqd/O18FHWXauEFxcf
	qaNTr/cOOJ/unRWssx184NpBM+pQxXKm0oCPuBJv62FF27Vn+En0tg731RWVAEL8
	7B9eo7WrmLhsn+F/t7l2rstgWDAknhlDkAUpIzYk7zNfDwIEB3AAyfXYkU6g1zV6
	MDvHYDsC8ncfcx1X2r0AIQ6enbMhZGWSB57XIFKXpwMY9N2hy27Z14f39qIGmM25
	MO3fw7QTx7uHGgv6eR99W3SL3UeJTgyHA8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1679344576; x=1679430976; bh=hvuKvPCswA+4G
	GF4uZhCiMM3DTbXMxPWRVeFy5E0JSo=; b=mq3/jqJbu7FtmYBmu24lmrNfs+eTN
	k/1JIkWcuOt7LDlsMi5TgGIzsFWHGi/2g7ySe/tLEt/PZrkMUOObAGVBrxFc0QO6
	Ht23rcmayiaZX2QDdQJBvBMaa/ooKHxduVCM4OnTVxD9V0WjC7P48K6SHqIPF4ey
	X+56BclVOAMMV8Gs174CWEqTWyuwna25A4NKOqk61X7ZUQu8grpfnR9koZdHJ5bw
	CswyWvE6puhI8RJMkhAxzgc7+6fpv9bsylg5XQEfLikEW26XNuEuOr7ysekqCDpQ
	J4f+ZipVoDRoX6OkJL8zrUHUcnezzH3ZCX713BBKOYUP8k2hVJb1FvHrQ==
X-ME-Sender: <xms:wMMYZAjaiFM52FqFVrq6Kno3OhZUDCGpa0eE4dGSGieYZtUwfUMfDg>
    <xme:wMMYZJAhfrxbw5_paNmjsFF5S_dAkiQUIzFhSGyHEULivdLfxU-8_ONeyXU-ZkAuc
    B0FG8Pd0Uf8mA>
X-ME-Received: <xmr:wMMYZIEC_FuIUyOe_yYrRr9J2bxIG-RPUVP9a3s580Q8_6XuDVdQxkCeKzG_iuhjk4C1kiHOKNrpnnSMZRonVDg6GEaobUCniAs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdefkedgudefjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeh
    gfeludfhieeihfdugfduheehgeeuvdeutefhleeugfduudfhtdetfeetvdfffeenucffoh
    hmrghinhepthhomhhlrdhithenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrg
    gsrdgtohhm
X-ME-Proxy: <xmx:wMMYZBRjXAYV9z-C78p3-O4hfyJFBl_GxGILUaSaxoe8amooqrvA9Q>
    <xmx:wMMYZNzrDaEiR-owgw6UNxZdzbF47wG2n3TJkCdfDFJmvaJRDvVbCg>
    <xmx:wMMYZP6wi8ysRC_yFrMpheFitwnsbw5ihvaIj7QLhRQwbi8UheOvCw>
    <xmx:wMMYZLaO_ASejkEsa4HVxKFvz4j5PQ5YEbS50v29L11KLcO9XGn2Ag>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 20 Mar 2023 21:36:11 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 2/2] automation: add a suspend test on an Alder Lake
 system
Message-ID: <ZBjDu+EEvQ51hWFU@mail-itl>
References: <cover.5a69c1f96ff446a5872e9dbf6308be9ab278f9df.1679023966.git-series.marmarek@invisiblethingslab.com>
 <aa4385f5291ebc06551414e4d8cbf7cdd3996eef.1679023966.git-series.marmarek@invisiblethingslab.com>
 <alpine.DEB.2.22.394.2303171539520.3359@ubuntu-linux-20-04-desktop>
 <ZBULiU0222GlcC1W@mail-itl>
 <alpine.DEB.2.22.394.2303201258140.3359@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="M005QHqNLzh7gz7I"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2303201258140.3359@ubuntu-linux-20-04-desktop>


--M005QHqNLzh7gz7I
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Mar 2023 21:36:11 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 2/2] automation: add a suspend test on an Alder Lake
 system

On Mon, Mar 20, 2023 at 01:08:42PM -0700, Stefano Stabellini wrote:
> On Sat, 18 Mar 2023, Marek Marczykowski-G=C3=B3recki wrote:
> > On Fri, Mar 17, 2023 at 04:10:22PM -0700, Stefano Stabellini wrote:
> > > On Fri, 17 Mar 2023, Marek Marczykowski-G=C3=B3recki wrote:
> > > > +fakeroot -s ../fakeroot-save tar xzf ../binaries/initrd.tar.gz
> > >=20
> > > I am a bit confused about it: are you sure you need fakeroot for this?
> > > This script is running inside a container as root already? Are you us=
ing
> > > Docker on the RPi4 to run this job?
> >=20
> > This is running in a rootless podman container. But even with docker,
> > for device files to work (see commit message) it would need to run
> > privileged container, which I'd like to avoid.
>=20
> Are you sure? I can run a non-privileged container with device assigned
> just fine with Docker and
> =20
>   devices =3D ["/dev/ttyUSB0:/dev/ttyUSB0"]
>=20
> in the gitlab-runner config.toml.

It isn't about accessing existing devices, it's about creating them
(unpacking rootfs which contains static /dev) and then packing it back
still having those devices.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--M005QHqNLzh7gz7I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmQYw7sACgkQ24/THMrX
1yzwQAgAk9aBEvEZhZxllxPgi6EUxj9ghdRiYO1ZXSi7obOvl+eFMAtXuqO0nviB
FpQ/yFlyYEzUKWhFa27HJ6cuBl7wgWOSvdvLqPdtemlyYzO0dd4/M9ZoSLqaD3uE
UWeitNcWy8cZ7I5r1LUsPFNHfr7aJGSLilGnvnL07nuddLEuFDodIbHw7RIzq7nO
Fn/fWNTmkmTuW+XKqgbznungwlC9s7qQB3aEfJNFhQqOR6OkA00aHVL1XSG+oitY
bJ8V9vZUy+Bf8z7bgXNmPFz/waYc+T1AVb1+N/3nCBppEdDZMhO/tzyTOw1cYRRq
ie8LnTjSeg4WlkPd2JQHvo9MF9DXVQ==
=LDwy
-----END PGP SIGNATURE-----

--M005QHqNLzh7gz7I--

