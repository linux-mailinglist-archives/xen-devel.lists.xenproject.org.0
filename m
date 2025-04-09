Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBFAA82D2B
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 19:05:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944471.1342927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2Yri-0002Dz-5j; Wed, 09 Apr 2025 17:05:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944471.1342927; Wed, 09 Apr 2025 17:05:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2Yri-0002Br-2n; Wed, 09 Apr 2025 17:05:30 +0000
Received: by outflank-mailman (input) for mailman id 944471;
 Wed, 09 Apr 2025 17:05:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=np/6=W3=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u2Yrg-0002Bl-Mg
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 17:05:28 +0000
Received: from fout-b7-smtp.messagingengine.com
 (fout-b7-smtp.messagingengine.com [202.12.124.150])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4ce2ead-1564-11f0-9ffb-bf95429c2676;
 Wed, 09 Apr 2025 19:05:26 +0200 (CEST)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal
 [10.202.2.52])
 by mailfout.stl.internal (Postfix) with ESMTP id 4E91211401B4;
 Wed,  9 Apr 2025 13:05:25 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-12.internal (MEProxy); Wed, 09 Apr 2025 13:05:25 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Apr 2025 13:05:23 -0400 (EDT)
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
X-Inumbo-ID: d4ce2ead-1564-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1744218325;
	 x=1744304725; bh=xx0nHWKHf+Zskp6NtrRD6qV2xV28XOz7LauZoiISX4o=; b=
	PO7A+DO6qKaEPPcY6Vyj91g/hEt0ebSY24j8tfuCUoVPFelMuMO1LehxBFvRBk8R
	ydYygaauCfR5aliAQnleQlVMTTNkN44W5tLGPhl7qbGNsUeQDJIYrGjBsHEJKYWc
	btqSqeCKS98whIoPibOi8CAbwfwlbFDhPGMYXoUuo4Hezkhn8kwW58B4JeqVZBup
	X4U8tA/vjzJM9La66Lq+Ds/4mMBJxfxHS8vQ9ltFgeljc7n9cgTX614Zk4yvmKYV
	+vuyBOdskgJrHqwsLiVJ9YTas/IRM8oQhhxOg8jZhDMAmwQZZJ4K2BFuBSp5SkDj
	PzbiTKLurVSF4EQ1Puu9pQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744218325; x=1744304725; bh=xx0nHWKHf+Zskp6NtrRD6qV2xV28XOz7Lau
	ZoiISX4o=; b=PjWdxj02lbLqhRoff+Sd38OcVqi+OQV+96ta37L6cyPZsT1crEh
	G9wLTLek24wGvnof91JTWZyUM+FscNV32I2RBlVChyzNDp3JYAA7sclr7juPBJuO
	SuL26lKZDVSExI3PSw6VzKYN4cWgYrP3aSM4dPPk53+RZO+2CbGrxiAJQNupv9vF
	WRzxyx3KO3BZ6Zf1uRX8X11055qDKQ/Yyza3VcqRy8+UPpwhOOra4Ni044Gqh/Ma
	BEW1TGS0juNCCAQoiS3a/3AFdO8cL9kgZeAEBWjoY1RtV1of95x96fiTTy9M5k2l
	0jdysJQR9/YnqQxfOaIoS2/gjmqnbEl+8JQ==
X-ME-Sender: <xms:1Kj2Z_W4jiu_NZE8tpgqyu2YFn6UeOC1a4ovGSBKGPfG24jMQ1Xubw>
    <xme:1Kj2Z3n6wgWxuwLr7Y2y0a2l-ILQNiYUBR-cdMgHMxqUmkFZoh4cBQMgGEdS2sgXq
    CWoAEuaBMrW6Q>
X-ME-Received: <xmr:1Kj2Z7az-W3MQSWqwfcDdSZmXfm3kLUgEy2EnZjKMmCPAJ9LlkzVwppliMXPG1J_I8ULDmsF6AjQPHzzlrtMIcyUP_pmcX4Tqg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeiheehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepieeluddvkeejueekhfffteegfeeiffefjeejvdeijedvgfejhe
    etuddvkeffudeinecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeeipdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghith
    hrihigrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhp
    rhhojhgvtghtrdhorhhgpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihigrd
    gtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepmhhitghhrghlrdhorhiivghlsegrmhgurdgtohhmpdhrtghpthhtoheprg
    hnthhhohhnhidrphgvrhgrrhgusehvrghtvghsrdhtvggthh
X-ME-Proxy: <xmx:1Kj2Z6V0cu-0co0WQyKokvWWKYcictAjDg9hWT5okLaM_GXXwzLjRQ>
    <xmx:1Kj2Z5ms56I7GUfySTI5hNLlIzvvya1S2WQwD5_ktE9tesZSUKcb5A>
    <xmx:1Kj2Z3ePqM27srt6RJQHbriIhens1bwg_SZW4LcYM0B11dOeAntJsw>
    <xmx:1Kj2ZzGR--ePWGPD5XrnLBlPYCcKNy8GfRVEYUZK481_QfEBDPupAg>
    <xmx:1aj2ZxXDUOzycjES_6AKnPpHkMeh5Ct3DSxKMYwBKB2VnFQSGJANzp1o>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 9 Apr 2025 19:05:21 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 6/8] Factor our x86-isms in the linux build script
Message-ID: <Z_ao0d530OwAUqGW@mail-itl>
References: <20250409163702.2037301-1-andrew.cooper3@citrix.com>
 <20250409163702.2037301-7-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="W86cjPxvxVxLs5Mx"
Content-Disposition: inline
In-Reply-To: <20250409163702.2037301-7-andrew.cooper3@citrix.com>


--W86cjPxvxVxLs5Mx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 9 Apr 2025 19:05:21 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 6/8] Factor our x86-isms in the linux build script

On Wed, Apr 09, 2025 at 05:37:00PM +0100, Andrew Cooper wrote:
> ... in preparation to use it for arm64 too.  Rename the script.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>
> ---
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> CC: Anthony PERARD <anthony.perard@vates.tech>
> ---
>  .gitlab-ci.yml                                |  3 +-
>  ...{x86_64-kernel-linux.sh =3D> build-linux.sh} | 34 +++++++++++++------
>  2 files changed, 24 insertions(+), 13 deletions(-)
>  rename scripts/{x86_64-kernel-linux.sh =3D> build-linux.sh} (55%)
>=20
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 5a0a853e551d..ff8dce7be05d 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -31,8 +31,7 @@ stages:
>  #
>  x86_64-kernel-linux-6.6.56:
>    extends: .x86_64-artifacts
> -  script:
> -    - . scripts/x86_64-kernel-linux.sh
> +  script: ./scripts/build-linux.sh
>    variables:
>      LINUX_VERSION: 6.6.56
> =20
> diff --git a/scripts/x86_64-kernel-linux.sh b/scripts/build-linux.sh
> similarity index 55%
> rename from scripts/x86_64-kernel-linux.sh
> rename to scripts/build-linux.sh
> index 5a0160655bea..5e25e958c0f3 100755
> --- a/scripts/x86_64-kernel-linux.sh
> +++ b/scripts/build-linux.sh
> @@ -9,6 +9,7 @@ set -ex -o pipefail
> =20
>  WORKDIR=3D"${PWD}"
>  COPYDIR=3D"${WORKDIR}/binaries/"
> +UNAME=3D$(uname -m)
> =20
>  # Build Linux
>  MAJOR=3D${LINUX_VERSION%%.*}
> @@ -16,17 +17,28 @@ curl -fsSLO \
>      https://cdn.kernel.org/pub/linux/kernel/v"${MAJOR}".x/linux-"${LINUX=
_VERSION}".tar.xz
>  tar oxf linux-"${LINUX_VERSION}".tar.xz
>  cd linux-"${LINUX_VERSION}"
> -make ARCH=3Dx86 defconfig
> -make ARCH=3Dx86 xen.config
> +
> +make defconfig
>  ./scripts/config --enable BRIDGE
>  ./scripts/config --enable IGC
>  ./scripts/config --enable TUN
> -cp .config .config.orig
> -cat .config.orig \
> -    | grep 'XEN' \
> -    | grep '=3Dm' \
> -    | sed 's/=3Dm/=3Dy/g' \
> -    >> .config
> -make ARCH=3Dx86 olddefconfig
> -make -s -j "$(nproc)" ARCH=3Dx86
> -cp arch/x86/boot/bzImage "${COPYDIR}"
> +
> +case $UNAME in
> +    x86_64)
> +        make xen.config
> +        cp .config .config.orig
> +        cat .config.orig \
> +            | grep 'XEN' \
> +            | grep '=3Dm' \
> +            | sed 's/=3Dm/=3Dy/g' >> .config
> +        ;;
> +esac
> +
> +make olddefconfig
> +
> +case $UNAME in
> +    x86_64)
> +        make -j$(nproc) bzImage
> +        cp arch/x86/boot/bzImage "${COPYDIR}"
> +        ;;
> +esac
> --=20
> 2.39.5
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--W86cjPxvxVxLs5Mx
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmf2qNEACgkQ24/THMrX
1yxmswgAgUXcg2pbwLf6EQ8CVuwZoFadWbi2nksXxuBs88rR+ACpatjEaXcQoLGi
e2Mu9BOo+lGoc4gfN7Uoysa9Gnh12sZEbgW1K6eBVvETCe96DMC8O4pDWLzIYXbo
z4koPYK1GEylQnKzxG8PmkCMYCJnedqcgwZMPOo+jdxitUJfllrSI8qnM7ujT2Ha
ouck+6Qe0m90PTEhQrdz/4worrfGAJz3vxGyZVKVgk+tkwBZHWxn2aPFlcQQIfGz
5b/12gEyCBc4t0IR7RCWGOrp3U8dtjUIu3fZUDW6+37pCS5tM8wn4WmYV+HOmWhF
cZutksf28EwqarhIqMXIB1rzmPD6sQ==
=qOfE
-----END PGP SIGNATURE-----

--W86cjPxvxVxLs5Mx--

