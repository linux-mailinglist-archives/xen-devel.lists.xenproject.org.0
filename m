Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7543939343
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 19:38:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762302.1172456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVwzS-0000vX-Ha; Mon, 22 Jul 2024 17:38:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762302.1172456; Mon, 22 Jul 2024 17:38:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVwzS-0000tP-Eb; Mon, 22 Jul 2024 17:38:26 +0000
Received: by outflank-mailman (input) for mailman id 762302;
 Mon, 22 Jul 2024 17:38:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIMA=OW=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sVwzQ-0000tG-Ua
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 17:38:25 +0000
Received: from fhigh8-smtp.messagingengine.com
 (fhigh8-smtp.messagingengine.com [103.168.172.159])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f59fba1-4851-11ef-bbfe-fd08da9f4363;
 Mon, 22 Jul 2024 19:38:21 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id A977C1140110;
 Mon, 22 Jul 2024 13:38:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 22 Jul 2024 13:38:17 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Jul 2024 13:38:16 -0400 (EDT)
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
X-Inumbo-ID: 2f59fba1-4851-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1721669897;
	 x=1721756297; bh=QfWFEiQoO0d2N+zlRKZzz1xU7LUjZhR3iK4T7LXrC/Y=; b=
	Wt9Dc6nE7idxYVskIaSSg6Bt+iehUsKatiQk8An+ws0J38nAEmyCrU0CGgNgTaPE
	UaFOMViMSyRtZejuRKbFFwM565fYNjtJqSKDxpospwri9zWFRNTUJ+D+IYg6WVbv
	SJ/tI8wTRwpBxZuxRljG3LO0KmqZAq4X7/woCWnQtJKbdqfdK+2pAkGUao4fGKbn
	xM75uSjUcssJMmdJsDO/4ByIYu1ke7ZGeJUaT3exXyaZc2ZLT8brYBv160QCh79Y
	mNiZQMcOqDE0yePzdN8VKVKZxVK+zZYewgyMUi1jF/wjE7B2iTW9J8WfQfq4X9As
	6DvR1GgIZ9bw5HN8lM+j0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1721669897; x=1721756297; bh=QfWFEiQoO0d2N+zlRKZzz1xU7LUj
	ZhR3iK4T7LXrC/Y=; b=V4xONANVeQ+Pwg+c8PC/fxT7JRNrsVp742T9XNGGSdxc
	vcPFkEZdelJIr6aXtyrEPJgvUWBX1YL9yxdItLxf4ZVQxPa9DpsdQe9l2IA9/LF2
	VhGAxZwVMmWfu7FTMR9jJNh6sh1p4P/HY6HmRfcPqbRjr2LML7MyQiGyR5ydSmSH
	EepQmzZsNl4T7E8ul7xfNETItfY2NlFwQIeti93aevOKT/5wjrmU6UG+HkzufDwt
	tKyIZQyqJbwY3FiUERBkaPwLxskv94A7ppz1yhgBc6OzUUsOvCJyNwCQpqbf5yZM
	k5K37+HuMI5vVkaNlRnvfsLucYXNQuKFAEoRWZv6iw==
X-ME-Sender: <xms:CZmeZgYf0w26rSg9UVtPC7gMk70PVS9YqtXhjsqx4i2fOLHfcj8fng>
    <xme:CZmeZra1QabIrafQqTGMww9LV0m3eApfXfJVOlrVzyzutDRzg0-fjFLKp1AKhkk-j
    CTzsCERZbpUnQ>
X-ME-Received: <xmr:CZmeZq86ZCInGKkf43SkLS7WOKuRfSr4M_VJhlCt1709PDJFfS3v8c0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrheejgdduudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepueel
    tedtleevtdeuueelvedvueeifffhkeeggedtieeifeellefgheeuffeuhedunecuffhomh
    grihhnpehgihhtlhgrsgdrtghomhdpughotghkvghrfhhilhgvrdhinhenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:CZmeZqqindFTbyzTZts42F9kt7Yui5W_1rKJZTSbdK6tcqhvB5veQg>
    <xmx:CZmeZrrCPn2Ztao3EkwzL2-ifx2bkaUTMyBpWxYWX2edjFN51fC4IQ>
    <xmx:CZmeZoShCgfA7l7gxSncJqRyUdNfzH1X0Q0Xxv4aqFQAMBm_y1ybog>
    <xmx:CZmeZrru8Fz4QHQRHrTDCxpCZjrtZutRTw4Rkfm7MM5O6-GZxF62UA>
    <xmx:CZmeZqUzbLw3lm4Lqj5dvAVTcgaYY4nYDPnoswcoOserO3bqcSz4Rivk>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 22 Jul 2024 19:38:11 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] CI: workaround broken selinux+docker interaction in yocto
Message-ID: <Zp6ZBPP0tCRuzDjE@mail-itl>
References: <20240720001508.1673856-1-marmarek@invisiblethingslab.com>
 <0a640ce6-fd10-45e5-af98-3a0f92cb6850@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nnsOsptkJjgqLIOP"
Content-Disposition: inline
In-Reply-To: <0a640ce6-fd10-45e5-af98-3a0f92cb6850@citrix.com>


--nnsOsptkJjgqLIOP
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 22 Jul 2024 19:38:11 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] CI: workaround broken selinux+docker interaction in yocto

On Mon, Jul 22, 2024 at 06:16:51PM +0100, Andrew Cooper wrote:
> On 20/07/2024 1:15 am, Marek Marczykowski-G=C3=B3recki wrote:
> > `cp --preserve=3Dxattr` doesn't work in docker when SELinux is enabled.=
 It
> > tries to set the "security.selinux" xattr, but SELinux (or overlay fs?)
> > denies it.
> > Workaround it by skipping selinux.selinux xattr copying.
> >
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> > Tested here:
> > https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/7386198058
> >
> > But since yocto container fails to build, it isn't exactly easy to apply
> > this patch...
> > "kirkstone" branch of meta-virtualization seems to target Xen 4.15 and
> > 4.16, so it isn't exactly surprising it fails to build with 4.19.
>=20
> Why is the external version of Xen relevant to rebuilding the container ?

I think it tries to build xen_git.bb, which fetches "master" branch, and
this fails to build with its current state.

> Or is it that kirkstone has updated since the container was last built?
>=20
> I'm not familiar with yocto, and a quick glance at the docs haven't
> helped...
>=20
> ~Andrew
>=20
> >
> > I tried also bumping yocto version to scarthgap (which supposedly should
> > have updated pygrub patch), but that fails to build for me too, with a
> > different error:
> >
> >     ERROR: Layer 'filesystems-layer' depends on layer 'networking-layer=
', but this layer is not enabled in your configuration
> >     ERROR: Parse failure with the specified layer added, exiting.
> >     ...
> >     ERROR: Nothing PROVIDES 'xen-image-minimal'. Close matches:
> >       core-image-minimal
> >       core-image-minimal-dev
> >     Parsing of 2472 .bb files complete (0 cached, 2472 parsed). 4309 ta=
rgets, 101 skipped, 0 masked, 0 errors.

In the meantime I've solved this issue by reordering layers in
build-yocto.sh (meta-networking before meta-filesystems). But then, ran
out of disk space (40GB wasn't enough) and hasn't retried yet...

> > ---
> >  automation/build/yocto/yocto.dockerfile.in | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/automation/build/yocto/yocto.dockerfile.in b/automation/bu=
ild/yocto/yocto.dockerfile.in
> > index fbaa4e191caa..600db7bf4d19 100644
> > --- a/automation/build/yocto/yocto.dockerfile.in
> > +++ b/automation/build/yocto/yocto.dockerfile.in
> > @@ -68,6 +68,10 @@ RUN locale-gen en_US.UTF-8 && update-locale LC_ALL=
=3Den_US.UTF-8 \
> >  ENV LANG en_US.UTF-8
> >  ENV LC_ALL en_US.UTF-8
> > =20
> > +# Workaround `cp --preserve=3Dxattr` not working in docker when SELinu=
x is
> > +# enabled
> > +RUN echo "security.selinux skip" >> /etc/xattr.conf
> > +
> >  # Create a user for the build (we don't want to build as root).
> >  ENV USER_NAME docker-build
> >  ARG host_uid=3D1000
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--nnsOsptkJjgqLIOP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmaemQQACgkQ24/THMrX
1yy7+Qf7B5ez1xmVEnwo2El2gkeK16xxwbIzaGwiEWFe98Lp+O4BabaUcqVk4m77
yCoQ8LTOM95FtqxpPC3U/eoDm/uupasmqXPTMZWifWytV5Oi5jJSW6n/ssfSX9HN
A6c1QE1LnUw4ghVCx7Z/oplwxwMW8LcnVi9RMmA9EMZCQ4Xbdz6Dx9bv1kMuj0Yv
b463Utk8LmBq9Fb4UK859bR0LjCtWO7Lrf0NbufD2KIEIERm4tTI0h/2WjoCMIHC
HRYAHDRt9se3IT1/2RyEvh0kE0ech64HRFi71rQ58Z+eFYjqDpp0fZO5Zo3uBaNf
cmxrdCTBNLvp6Mp2x8WOd9/WnLuqAw==
=CV2h
-----END PGP SIGNATURE-----

--nnsOsptkJjgqLIOP--

