Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3F9829C0B
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jan 2024 15:09:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665511.1035696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNZGX-0002fr-5o; Wed, 10 Jan 2024 14:09:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665511.1035696; Wed, 10 Jan 2024 14:09:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNZGX-0002dr-20; Wed, 10 Jan 2024 14:09:09 +0000
Received: by outflank-mailman (input) for mailman id 665511;
 Wed, 10 Jan 2024 14:09:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZQnm=IU=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rNZGU-0002dl-SJ
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2024 14:09:07 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce8f277d-afc1-11ee-9b0f-b553b5be7939;
 Wed, 10 Jan 2024 15:09:03 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DC6A85C013F;
 Wed, 10 Jan 2024 09:09:01 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 10 Jan 2024 09:09:01 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Jan 2024 09:09:00 -0500 (EST)
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
X-Inumbo-ID: ce8f277d-afc1-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1704895741;
	 x=1704982141; bh=bgoorML9XGgR+UjI6N8gRse37mKdRM23JidHXsYL+2g=; b=
	kfI1O4miDZoUVu9fNGVcPl+hVoq2BHlpYqRgL0sAXPFc9a4Pb+sbg6eDDsml0jSe
	EgoI1d40+Ov+1ec92BZD+eMPf47b1DTu06ejISIyTlbwnfxtDa4Afhph06DPEUGP
	JAgBbC+o5q05lIHSgKhPVLpXpsqHjOlFiWMszEHOh/4mqPOlaNMZOGwHKFNhgMnm
	d39Ed2J8ztN8D/txKctPEeJwVcdEEEiL8Ui42DA0QLa+gCw+1MeR6ELIfo5RCcfU
	RVANU5784IdKUwU1T1ndAG0eClXzr/jJSLEnVHAfoLfVUSQrQmOrcLwF4h3eReiz
	PYX3fh3KRw8iUH8KzCu8ZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1704895741; x=1704982141; bh=bgoorML9XGgR+UjI6N8gRse37mKd
	RM23JidHXsYL+2g=; b=JvC75SJ6S9zX9ZLCu3R0mHY0VM6mkET+HLemG9x+B9Nq
	5U3XbPzER/0uDMjV1zA26Y1sMM7l5h4zsK7L0+DUHmJSTg/jjNOTgJpAsd+lmHbH
	kksHACFIneu0bRxSD15e7dU7Pnco7JsicTYeAu+Oi75QVYBGbEpRI+i4wnPQK05o
	J0Kk/m9AW85QwiZcZ9q1WIHbxosL/TMSceAYfGlHwRhScD0mIHzb10H+G7am0eYo
	bH2LhBs+MTrNK+6CR0CSxReiNRUxvPWXkp/SptOfnihnvP0t6G7lzf7CzKEsMDhK
	g711uRGwmyzcZ/aau09D1NlPCqQtyOv1Rh6NF52ctA==
X-ME-Sender: <xms:_aSeZZDUv0CFaK4SQ4ksIfP7NveWCijXAimILMWr3sWYMofp4o-arA>
    <xme:_aSeZXj9XAcNTXdjTsdevuqPSRm04DNmDEm8yK5nSQdJJW5sghSuIwpztWfsTC_0g
    LqDIICzSAKfuA>
X-ME-Received: <xmr:_aSeZUkUUmAdE-BNqEA4aRivNUdpobviuzhjOdQbxbw-CbY22BIxy4w7NID6j1CjnBnO2zH4xHwZlO_gFsS3N3zl2KcVenjepA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdeiuddgiedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:_aSeZTylWwdysArquconLTeTXWgdoueRLqHVZmGTtL8IRKTdCRFZlA>
    <xmx:_aSeZeQGDRBxxCuVa071NO8oDOC-diDCL5z6Jpd7ZCixVwN0vIF78Q>
    <xmx:_aSeZWZj0xw-pnGEfEBqHZATAI0jlfpxnlX3c5gotyRBEj2bAhAkbA>
    <xmx:_aSeZZeMtICwP872c6lC5olKuSv9fKnCxt4HH4n6s37a_-neaAbTiw>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 10 Jan 2024 15:08:56 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/2] libxl: Remove cdrom forced QDISK w/ stubdom
Message-ID: <ZZ6k-D3CXoq9rO28@mail-itl>
References: <20240109204655.72063-1-jandryuk@gmail.com>
 <20240109204655.72063-2-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WiBhh2yyrufcCwQA"
Content-Disposition: inline
In-Reply-To: <20240109204655.72063-2-jandryuk@gmail.com>


--WiBhh2yyrufcCwQA
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jan 2024 15:08:56 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/2] libxl: Remove cdrom forced QDISK w/ stubdom

On Tue, Jan 09, 2024 at 03:46:54PM -0500, Jason Andryuk wrote:
> A Linux HVM domain ignores PV block devices with type cdrom.  The
> Windows PV drivers also ignore device-type !=3D "disk".  Therefore QEMU's
> emulated CD-ROM support is used.  This allows ejection and other CD-ROM
> features to work.
>=20
> With a stubdom, QEMU is running in the stubdom.  A PV disk is still
> connected into the stubdom, and then QEMU can emulate the CD-ROM into
> the guest.  This removes the need for forcing to a QDISK.  Relax the
> checks to support this.
>=20
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---
>  tools/libs/light/libxl_disk.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/tools/libs/light/libxl_disk.c b/tools/libs/light/libxl_disk.c
> index b65cad33cc..d1f84ef404 100644
> --- a/tools/libs/light/libxl_disk.c
> +++ b/tools/libs/light/libxl_disk.c
> @@ -192,7 +192,8 @@ static int libxl__device_disk_setdefault(libxl__gc *g=
c, uint32_t domid,
> =20
>      /* Force Qdisk backend for CDROM devices of guests with a device mod=
el. */
>      if (disk->is_cdrom !=3D 0 &&
> -        libxl__domain_type(gc, domid) =3D=3D LIBXL_DOMAIN_TYPE_HVM) {
> +        libxl__domain_type(gc, domid) =3D=3D LIBXL_DOMAIN_TYPE_HVM &&
> +        !libxl_get_stubdom_id(CTX, domid)) {

Should this check for stubdomain flavor too? I guess it won't really
work with qemu-traditional.
Similar check also wants to be in the next patch, instead of completely
dropping stubdomain check.

>          if (!(disk->backend =3D=3D LIBXL_DISK_BACKEND_QDISK ||
>                disk->backend =3D=3D LIBXL_DISK_BACKEND_UNKNOWN)) {
>              LOGD(ERROR, domid, "Backend for CD devices on HVM guests mus=
t be Qdisk");
> --=20
> 2.43.0
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--WiBhh2yyrufcCwQA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmWepPgACgkQ24/THMrX
1yyJ9Qf/b2DI03JVmzUhX7Y9DjoagGaZZTVDGJrnTxjPNPUvs31Q7Kh53wPN8vwl
SUJxmNZndO4OuIc0b9z//+SoR0Dd4MQMzsT5qMBfXHOUJfzlL8IULTx1hmAX+DhS
z/BGQrYaP9beDxeJPjAFhcHL3/zeKokJoK2tKYD/Manwf45+1sGL5cNZPSPIT91Q
vFy+fOzThGeBlYf0FpPhD0v7lVYCnu2j4+V+nHrzLp6T/NoN507JbmHVfUScp5xE
9loIQCZPfVi2F1n8ZoM5UcC/VFB2nfwXmAzAzyLzgycDJiLKgFON3K0BgvZj0Tze
QHw6d5rvgUQhAKm5Tlti1vrsRHQHSA==
=+IZt
-----END PGP SIGNATURE-----

--WiBhh2yyrufcCwQA--

