Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 886CCA87EF0
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 13:25:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949884.1346346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4HwL-0005Ec-7P; Mon, 14 Apr 2025 11:25:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949884.1346346; Mon, 14 Apr 2025 11:25:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4HwL-0005Bj-4d; Mon, 14 Apr 2025 11:25:25 +0000
Received: by outflank-mailman (input) for mailman id 949884;
 Mon, 14 Apr 2025 11:25:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JTEa=XA=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u4HwK-0005Bd-CZ
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 11:25:24 +0000
Received: from fhigh-b4-smtp.messagingengine.com
 (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27616937-1923-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 13:25:23 +0200 (CEST)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal
 [10.202.2.43])
 by mailfhigh.stl.internal (Postfix) with ESMTP id BF38A2540201;
 Mon, 14 Apr 2025 07:25:21 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Mon, 14 Apr 2025 07:25:21 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Apr 2025 07:25:20 -0400 (EDT)
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
X-Inumbo-ID: 27616937-1923-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1744629921;
	 x=1744716321; bh=T78yndSFkF25qy6wm7BDhLd54IBW4DKs/uPlUEyLFXc=; b=
	XGF+Ng2iyWsuULkTVFRVe4M0iUV1ApvQ+nXkkkKAOH65SX5P3HwWv93BMsK4vA7G
	OeBFmOw4EdKD9hZneUvRj58GUacPO8Po79WBBLGEpwz8k7Qu5T4ZMyGkLUc4eGgs
	gEjHak49bWsFrl/WFfBBji2o6TxnM4FuccNd+X976V40xbHfEwS/VHRtGc3muVcG
	k8zEJ/X6+P/2JMIeUVK7H9+35tRNgjYgp1oK3WyW8ijhuagDgckiHPZwW1nBb8Kg
	Fx5hwV10qeAvlQs15VREaR2MualrIzfMGB7SJWBiV9nsECkAEpRkFkFvwNTzSQwk
	7VRpIY9fKQV6OTGy0wqvtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744629921; x=1744716321; bh=T78yndSFkF25qy6wm7BDhLd54IBW4DKs/uP
	lUEyLFXc=; b=eMcqTjG8iLlbTpYnpNInWS145IouEtVWYmF2aEgQnr8BGLxsPwJ
	lsA3QTtR3p3OACigQH7FZrc6v4MoovE86/x7KOXhot11NDEEiEIx1vHBW9B7Vd8r
	nmolaeYNdtI1oIsfhLNjJUvQBBxOwehpXcgF7omzgUk/hP+A/vR267WQy+LCVjDy
	HneocEkqSiLV3gILeQmQBa+YqhaNC3Uhefsk/uHekFRoJm6mNaVKWN2ewL3TgdSj
	YoVF4duotUhMgz8DzBfaicdBb3qpW7g3befvJLgFUO7bIM18D03CyjnSp3MIDUWR
	WebI9bImyu4gDrLpKNdQLXWu3iPrYoEMIAQ==
X-ME-Sender: <xms:ofD8Z12_HrHvNkCwn6cm938DdTzybXGScs43zTYn6hkHy8gGSPZk2g>
    <xme:ofD8Z8Ekt2E5NBPxbphe_BycMZlqXCAfADzle4G4eHFBCe71aVlUN8hdhdDlq0DXZ
    YeuKV7zQc51FQ>
X-ME-Received: <xmr:ofD8Z15kTF2QNBNlWWaS46D6EAUDCWcCVwn30AIW-jTyksWeDtM5nVEuFab2gsU5XPcxcDavmneY7MkrjFi1wCPxYHvKi98XTA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddtgeefucetufdoteggodetrf
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
X-ME-Proxy: <xmx:ofD8Zy2cPqv-ZLRMIlURAG-TmWUaDeSF2oZypNqXPPHmGerCSilSBA>
    <xmx:ofD8Z4GxuGV7_XCAqj6TIkfgbBE3_d8LCOzA3SDw7RLT0ZYqkFmRXA>
    <xmx:ofD8Zz8W8ECiU-a-pSnplxQm3OA1AZT6Q1d2h8f0uAnV6iNHN9rFxg>
    <xmx:ofD8Z1mk5_BL_7_Jyr7UFSPcGqrNeanc2JS3Oiyatft7eTuZC57gdw>
    <xmx:ofD8Z6Y7Q_M8xo9FhebKLcNsbhEA9Fc-S8wnANiMZ8zrpNqYc0MwZ7kJ>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 14 Apr 2025 13:25:18 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v2 4/7] Shrink the rootfs substantially
Message-ID: <Z_zwnpmO_6VLwoMM@mail-itl>
References: <20250414101843.2348330-1-andrew.cooper3@citrix.com>
 <20250414101843.2348330-5-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gxC3D/kKw+fomu75"
Content-Disposition: inline
In-Reply-To: <20250414101843.2348330-5-andrew.cooper3@citrix.com>


--gxC3D/kKw+fomu75
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Apr 2025 13:25:18 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v2 4/7] Shrink the rootfs substantially

On Mon, Apr 14, 2025 at 11:18:40AM +0100, Andrew Cooper wrote:
> bash, busybox, musl and zlib are all in the base container.
>=20
> python3 and ncurses are in principle used by bits of Xen, but not in anyt=
hing
> we test in CI.  argp-standlone, curl, dbus, libfdt, libgcc and sudo aren't
> used at all (for x86 at least).
>=20
> libbz2 and libuuid were pulled in transitively before, and need to be inc=
luded
> explicitly now.
>=20
> Use apk --no-cache to avoid keeping a ~2M package index on disk.
>=20
> Remove the modules scan on boot.  We don't have or build any.  This remov=
es a
> chunk of warnings on boot.

Strictly speaking there is xen-argo.ko, but that's handled manually
anyway, so probably not worth mentioning.

> This shrinks the rootfs from ~30M down to ~8M.
>=20
> No practical change.

This also adds some preparation (the case on `uname -m`) for ARM64
rootfs, would be nice to mention it too. Especially since libfdt removed
here will be re-added for ARM.

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Doug Goldstein <cardoe@cardoe.com>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> ---
>  scripts/alpine-rootfs.sh | 60 +++++++++++++++++++++++-----------------
>  1 file changed, 34 insertions(+), 26 deletions(-)
>=20
> diff --git a/scripts/alpine-rootfs.sh b/scripts/alpine-rootfs.sh
> index 75e2f8648ce5..72c29e0a0a13 100755
> --- a/scripts/alpine-rootfs.sh
> +++ b/scripts/alpine-rootfs.sh
> @@ -4,33 +4,42 @@ set -eu
> =20
>  WORKDIR=3D"${PWD}"
>  COPYDIR=3D"${WORKDIR}/binaries"
> +UNAME=3D$(uname -m)
> =20
> -apk update
> +apk --no-cache update

This is no-op, no? IIUC the only thing `apk update` does is updating the
cache, which you disabled...

> -# xen runtime deps
> -apk add musl
> -apk add libgcc
> -apk add openrc
> -apk add busybox
> -apk add sudo
> -apk add dbus
> -apk add bash
> -apk add python3
> -apk add zlib
> -apk add lzo
> -apk add ncurses
> -apk add yajl
> -apk add libaio
> -apk add xz
> -apk add util-linux
> -apk add argp-standalone
> -apk add libfdt
> -apk add glib
> -apk add pixman
> -apk add curl
> -apk add udev
> -apk add pciutils
> -apk add libelf
> +PKGS=3D(
> +    # System
> +    openrc
> +    udev
> +    util-linux
> +
> +    # Xen toolstack runtime deps
> +    libbz2
> +    libuuid
> +    lzo
> +    xz
> +    yajl
> +
> +    # QEMU
> +    glib
> +    libaio
> +    pixman
> +    )
> +
> +case $UNAME in
> +    x86_64)
> +        PKGS+=3D(
> +            # System
> +            pciutils
> +
> +            # QEMU
> +            libelf
> +            )
> +        ;;
> +esac
> +
> +apk add --no-cache "${PKGS[@]}"
> =20
>  # Xen
>  cd /
> @@ -45,7 +54,6 @@ rc-update add dmesg sysinit
>  rc-update add hostname boot
>  rc-update add hwclock boot
>  rc-update add hwdrivers sysinit
> -rc-update add modules boot
>  rc-update add killprocs shutdown
>  rc-update add mount-ro shutdown
>  rc-update add savecache shutdown
> --=20
> 2.39.5
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--gxC3D/kKw+fomu75
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmf88J4ACgkQ24/THMrX
1yzMQwf/Qs+oKkcfkjEADff2XuiEgjCFqNfFS7xrJXkr6do4jcYGc1R2tlAykWya
WMDh9jUKQL36/M5OWZtYp7rJr7uxRJOZohcEADfwWFwp4avvfBXX5HGbfByXEEPP
7yPc7QtQ9fFvUlZKuIYRsFlz9k+prMopXLIAg7ibUgTjWDT/GZmWsrktEy4yYYEd
efV/nOkcbpXeRBsRkP3YWZ8MS7JByDqUm0yvsdSoZXVm5s6fE+H0KAoz0jDbO4lJ
QJjv/0meBoyQHN3RjfqtyluUdr8QZYTJxfikUO89Ic7slBteMTX9gbuDVANhxwSx
BetPDvL8V6I1cRBkMajdMqgAmAiA4w==
=lDsL
-----END PGP SIGNATURE-----

--gxC3D/kKw+fomu75--

