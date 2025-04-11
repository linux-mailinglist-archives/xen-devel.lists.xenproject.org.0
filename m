Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AB0A85B0A
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 13:07:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947148.1344862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3CDj-0000he-Hp; Fri, 11 Apr 2025 11:06:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947148.1344862; Fri, 11 Apr 2025 11:06:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3CDj-0000g7-EP; Fri, 11 Apr 2025 11:06:51 +0000
Received: by outflank-mailman (input) for mailman id 947148;
 Fri, 11 Apr 2025 11:06:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5hfk=W5=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u3CDi-0000fz-OJ
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 11:06:50 +0000
Received: from fout-a2-smtp.messagingengine.com
 (fout-a2-smtp.messagingengine.com [103.168.172.145])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0de9e39d-16c5-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 13:06:45 +0200 (CEST)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfout.phl.internal (Postfix) with ESMTP id B3BD013801F8;
 Fri, 11 Apr 2025 07:06:44 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Fri, 11 Apr 2025 07:06:44 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Apr 2025 07:06:43 -0400 (EDT)
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
X-Inumbo-ID: 0de9e39d-16c5-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1744369604;
	 x=1744456004; bh=SgC2Y+59y1EVh7+yfXQx0vcZfBH8YY34cmY/cQn7Ubo=; b=
	bmcgkGECZIjHhtyYjDqXnW1NssFH5gFwb085RRKlXKyyE4XkvlK5V1EMFb0SYFgp
	8bc0Bxhe5snpFUB3Va6dNO7VIo/SQ9gYZia330UcVBuZ/bKEGAbGpJDzPhCBtxsr
	ITCdAxU9d46lr1+qpWSsAB7T+HHZ4Y5BdRBscnm4bD5pGKz0gvhE/4M7vpVgnRtO
	N21YKE/qEBcvXIkcZ/uXu7mNjNSYAytQLCXiZDFcxb2Grgj2vK4gANaKZWgiHQP+
	Fcb8kWl+nX/wc7bm7ghHaCnTomZqe5b3cFnIUzGKE/TYbDiemQHHaduoBqoYvWeW
	/YcW/Iwodff/nz/SORDcJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744369604; x=1744456004; bh=SgC2Y+59y1EVh7+yfXQx0vcZfBH8YY34cmY
	/cQn7Ubo=; b=U+EIf0wKUvqhq30P+zJooUFn0wb8OzLUswLKyRmhn4zt2EIH4yd
	t/IhMmziejrlDa+sgpjzmGEY1OfYqNFyejswTX2s46yk7qboQSKLs1H7D13VtgKl
	eOo/VpOLiya3kgsHVP63nQcAToceiTpVTzdGLcHTrQC5bGctujYRQ8qLwZ5rqBA0
	AdhPAAj51E/8dfJQL4U+yTOGtEbtWOQur9nJUtvRv0srdpsTHHtZBaf8GspUFFeM
	vdQ1KfV0DRwIfZKDnOvDQDXsNI+Sl3YZhVVog7PkQrTvWmNeuELy0KgUFChOoCTR
	/TIG4P9T704nEBMR0TkY9S4AQHbirrhYAmA==
X-ME-Sender: <xms:xPf4Z06je7E-J0D3UIIaV9s2hglKkgHZhaYY5Zxf1md0ECAB866Fig>
    <xme:xPf4Z164Oh6s6IXkn2ytirpVAxd0NmNbbYg4wF59sfCbyP-NYdnFRFEo0PiB7vmVj
    wBGGA6dZud1Kw>
X-ME-Received: <xmr:xPf4ZzdMrRJn2qtVSPXdhb-7zqx9U3e_2SUkDuA6zKMv98g2dedMoNCjFhmxfD1OHIxg3Ftw4caNUJph2vf0nXH0rLRR9p9tjw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvudduieegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettd
    dvgeeuteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    dpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghn
    ughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopeigvghnqd
    guvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopegr
    nhhthhhonhihrdhpvghrrghrugesvhgrthgvshdrthgvtghhpdhrtghpthhtohepshhsth
    grsggvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhhitghhrghlrdho
    rhiivghlsegrmhgurdgtohhmpdhrtghpthhtoheptggrrhguohgvsegtrghrughovgdrtg
    homh
X-ME-Proxy: <xmx:xPf4Z5JJ2t8XQXezRp4qFccOkrhk7lVfmBb8HmClxExCQjLaOqqN5w>
    <xmx:xPf4Z4JD5hixPOHGmaVZt-muwjIfbUxkbqCi4fiTjYk2FYf6OxP8Ow>
    <xmx:xPf4Z6wmcPO4pgaOVRzAXXWeV0feOm_NQXrIsxkQKR8IhQsLVY8qhg>
    <xmx:xPf4Z8KQrKq1g3ijXESTOPmB4hoq_EgR9wmQg6rLuA73r8DIGxXeYA>
    <xmx:xPf4Z5fR2Fl0JWXtPheJiwpo55wCWKg5QoDaJyCZAffhtlV9iDCOGIIA>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 11 Apr 2025 13:06:40 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 1/3] Rework rootfs generation to make a cpio archive
Message-ID: <Z_j3wXtigDHb6i6P@mail-itl>
References: <20250411105217.2141356-1-andrew.cooper3@citrix.com>
 <20250411105217.2141356-2-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rS4cfipOqjcGLxrj"
Content-Disposition: inline
In-Reply-To: <20250411105217.2141356-2-andrew.cooper3@citrix.com>


--rS4cfipOqjcGLxrj
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Apr 2025 13:06:40 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 1/3] Rework rootfs generation to make a cpio archive

On Fri, Apr 11, 2025 at 11:52:15AM +0100, Andrew Cooper wrote:
> Rename the script as we're going to use it for ARM64 shortly, and have it=
 take
> a tar or cpio parameter to determine the output format.
>=20
> Turn it into a proper bash script, and provide the cpio form under the new
> artefact naming scheme.
>=20
> No functional change.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Doug Goldstein <cardoe@cardoe.com>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> ---
>  .gitlab-ci.yml                                |  9 +++++++-
>  ...6_64-rootfs-alpine.sh =3D> alpine-rootfs.sh} | 21 +++++++++++++++++--
>  2 files changed, 27 insertions(+), 3 deletions(-)
>  rename scripts/{x86_64-rootfs-alpine.sh =3D> alpine-rootfs.sh} (75%)
>=20
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 1d2c72b268a3..916c5ae9d508 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -42,6 +42,13 @@ linux-6.6.86-arm64:
>  #
>  # x86_64 artifacts
>  #
> +alpine-3.18-x86_64-rootfs:
> +  extends: .x86_64-artifacts
> +  script:
> +    - ./scripts/alpine-rootfs.sh cpio
> +  variables:
> +    CONTAINER: alpine:3.18-x86_64-base
> +
>  linux-6.6.56-x86_64:
>    extends: .x86_64-artifacts
>    script: ./scripts/build-linux.sh
> @@ -62,7 +69,7 @@ x86_64-kernel-linux-6.6.56:
>  x86_64-rootfs-alpine-3.18:
>    extends: .x86_64-artifacts
>    script:
> -    - . scripts/x86_64-rootfs-alpine.sh
> +    - ./scripts/alpine-rootfs.sh tar
>    variables:
>      CONTAINER: alpine:3.18-x86_64-base
> =20
> diff --git a/scripts/x86_64-rootfs-alpine.sh b/scripts/alpine-rootfs.sh
> similarity index 75%
> rename from scripts/x86_64-rootfs-alpine.sh
> rename to scripts/alpine-rootfs.sh
> index b70b3a54ede5..c29c92d1c682 100755
> --- a/scripts/x86_64-rootfs-alpine.sh
> +++ b/scripts/alpine-rootfs.sh
> @@ -1,4 +1,9 @@
> +#!/bin/bash
> +
> +set -eu
> +
>  WORKDIR=3D"${PWD}"
> +COPYDIR=3D"${WORKDIR}/binaries"
> =20
>  apk update
> =20
> @@ -56,5 +61,17 @@ passwd -d "root" root
> =20
>  # Create rootfs
>  cd /
> -tar cvzf "${WORKDIR}/binaries/initrd.tar.gz" \
> -    bin dev etc home init lib mnt opt root sbin usr var
> +PATHS=3D"bin dev etc home init lib mnt opt root sbin usr var"
> +
> +case $1 in
> +    cpio)
> +        find $PATHS | cpio -o -H newc | gzip > "${COPYDIR}/rootfs.cpio.g=
z"
> +
> +        # Print the contents for the build log
> +        zcat "${COPYDIR}/rootfs.cpio.gz" | cpio -tv

add 'v' to cpio above instead?

> +        ;;
> +
> +    tar)
> +        tar cvzf "${COPYDIR}/initrd.tar.gz" $PATHS
> +        ;;
> +esac
> --=20
> 2.39.5
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--rS4cfipOqjcGLxrj
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmf498EACgkQ24/THMrX
1yyd0Qf9E9JpHgn3SkVElUQygmsoZlV5t3+nKYMjilKrQ+3p17kEsbdL9kbYd711
tLw//ztpkSB9OMKebHg31PT/gegxrzWdF4xb7gdR22frB2ab6EYMBy2gUECk9MQn
eCJIHF6xr9wJ+GZ1TVK0zfIc+U+DTm/2sAoCqIDEw1oX2skqaKeH6W1a4Evaxda8
46We65+VNos4Qs4VQCka6ly9Mif+cYfZj3By/mC5rHQIGp78lbYrYvryslfLW0Kz
/2/wuM04BO8VqQTgsgZywaOftEK5/7SUEX9tO0xAgxZqzovHBOILOXSKKhUPg8UI
7oChOQmdsW02HUCG266O0V7qhT7GAQ==
=Cw7F
-----END PGP SIGNATURE-----

--rS4cfipOqjcGLxrj--

