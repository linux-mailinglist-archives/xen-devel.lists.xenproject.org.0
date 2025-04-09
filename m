Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FACEA82CF9
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 18:58:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944441.1342907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2YkU-0006iM-5R; Wed, 09 Apr 2025 16:58:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944441.1342907; Wed, 09 Apr 2025 16:58:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2YkU-0006fQ-2D; Wed, 09 Apr 2025 16:58:02 +0000
Received: by outflank-mailman (input) for mailman id 944441;
 Wed, 09 Apr 2025 16:58:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=np/6=W3=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u2YkT-0006fG-36
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 16:58:01 +0000
Received: from fout-b7-smtp.messagingengine.com
 (fout-b7-smtp.messagingengine.com [202.12.124.150])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9aff393-1563-11f0-9ffb-bf95429c2676;
 Wed, 09 Apr 2025 18:57:58 +0200 (CEST)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfout.stl.internal (Postfix) with ESMTP id 44EE711401AD;
 Wed,  9 Apr 2025 12:57:57 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-10.internal (MEProxy); Wed, 09 Apr 2025 12:57:57 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Apr 2025 12:57:55 -0400 (EDT)
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
X-Inumbo-ID: c9aff393-1563-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1744217877;
	 x=1744304277; bh=2zNQBhLPL4Hi8ZMwWWfRxN1R3r028WPVEYKBEgTgK5M=; b=
	gFyiAvFdxZ8SVGo0zSfAWsWITUHZKLdEhOVLz5QhRT0q2XEhGfBiKY8JlViu44cD
	Go8UC4jeNcJi1viu6J+oTEL1Te5HT9vRXtXNxV4/GmwWdhEfu3KKB7aBCs7+v0Jt
	sJrlY6nRhzN7Jd3XfLXO5xtzXzF3oVPtFiM9rOGar9kheqS2flBneB4//qQSBa5c
	sVtSjfLjdg9ZRhuHQ69t4qrJNrZTma9CbWJWDgLcVAfWeWvQsn1f//3QJHzN1IqZ
	Ph6obhkMnHiLAQ3PYj/Zsm4MrXFvgopeuFvNK8UxToto6vaJGhOCjb8xB4paHo/V
	AexnF1sIK/yFbvSqEiDygw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744217877; x=1744304277; bh=2zNQBhLPL4Hi8ZMwWWfRxN1R3r028WPVEYK
	BEgTgK5M=; b=kfG7Bgz7prAsZ4eXduLATIss0KY0wmtPXl7kj4P8tpOUer3lrDs
	1tgV1m00qAlLVsacFMEQmHL9MtZcSfLUnqnlfoK9BxYM5D1MpxH1xacsvnGL0ivm
	X7YthyGYJH6CbWA2IMuHcfdNHugROAe1qEpAL7gpJ4XL6pjSiuB7ghmUChIaAgLA
	tHRDCPvlqKSkKqw2TFNxdF6DpjRiaRylN+ScmAnpiEqs3IB8ZvI2szLD0E0uhW2d
	jMqfra6P+ZMkJhhgnKRalU7sYDd2HyHoOqz7AN9Jm/x/PCS15rqlrk+n64eU3mgf
	M4PtpQTwHL2lm8IU108TanWM4R2yqXuCE2Q==
X-ME-Sender: <xms:FKf2Z3A2Dlb1ONZ6oJk7Xssoj5r4QsUKjckXbBG-nQnzJH-9QAFHMQ>
    <xme:FKf2Z9jpKwBDuER0O3PXWgx8SdckxJdl7xpUsJ7ZZS7PDZpgMwIFlwcQiC684tl-U
    SwwuAOcWUor5w>
X-ME-Received: <xmr:FKf2Zyn5SmEI8XdXgdDoruEe3n7qahz5JaFkJV6fqEGbD9fdv-vGVgks9B1V5ee_dvbNegLa7_fGHCgLIvZp82B5yLBe5RaTtA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeiheegucetufdoteggodetrf
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
X-ME-Proxy: <xmx:FKf2Z5xYdk2BaicEWZgIySq-p_AVLWVsozRrqJhT7zO095eKp_NeNw>
    <xmx:FKf2Z8SmE4OhAopSZmmkeVqcICh64DSmKuykF60rWarrMJjBVRlHRA>
    <xmx:FKf2Z8a1yKxQOydkUFPG3FgWCrffCsKIGCNeYWI-pMXR1VjnS0utgA>
    <xmx:FKf2Z9Ta6p2VIb8YvqFyUlYCApIFt9Y3CID1BIOxnua8oIRnjcJ1oQ>
    <xmx:Faf2ZzQodCfKdyI3BU-tPbbsMBkuwDDAdWWOfLCmqSlCp9k65DH4bzmG>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 9 Apr 2025 18:57:53 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 5/8] Adjust Linux build script to work with other major
 versions
Message-ID: <Z_anEWAVTD5tjbg5@mail-itl>
References: <20250409163702.2037301-1-andrew.cooper3@citrix.com>
 <20250409163702.2037301-6-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Vz3fr8hXWo+Ktb/I"
Content-Disposition: inline
In-Reply-To: <20250409163702.2037301-6-andrew.cooper3@citrix.com>


--Vz3fr8hXWo+Ktb/I
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 9 Apr 2025 18:57:53 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 5/8] Adjust Linux build script to work with other major
 versions

On Wed, Apr 09, 2025 at 05:36:59PM +0100, Andrew Cooper wrote:
> Also use 'tar o' to decompress based on file name.

Do you mean 'tar a'? -o is --no-same-owner. Anyway, just 'tar xf'
works too, even in alpine.

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> CC: Anthony PERARD <anthony.perard@vates.tech>
> ---
>  scripts/x86_64-kernel-linux.sh | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/scripts/x86_64-kernel-linux.sh b/scripts/x86_64-kernel-linux=
=2Esh
> index 2a816f0b3204..5a0160655bea 100755
> --- a/scripts/x86_64-kernel-linux.sh
> +++ b/scripts/x86_64-kernel-linux.sh
> @@ -11,9 +11,10 @@ WORKDIR=3D"${PWD}"
>  COPYDIR=3D"${WORKDIR}/binaries/"
> =20
>  # Build Linux
> +MAJOR=3D${LINUX_VERSION%%.*}
>  curl -fsSLO \
> -    https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-"${LINUX_VERSION}=
".tar.xz
> -tar xJf linux-"${LINUX_VERSION}".tar.xz
> +    https://cdn.kernel.org/pub/linux/kernel/v"${MAJOR}".x/linux-"${LINUX=
_VERSION}".tar.xz
> +tar oxf linux-"${LINUX_VERSION}".tar.xz
>  cd linux-"${LINUX_VERSION}"
>  make ARCH=3Dx86 defconfig
>  make ARCH=3Dx86 xen.config
> --=20
> 2.39.5
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Vz3fr8hXWo+Ktb/I
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmf2pxEACgkQ24/THMrX
1yxgaQf+N4j0XEDM+FHU35RJQYel9+RChPvPFFCKMp8hyVtgDSwaom0dreM2l0WI
VJrxWkEAquAboWwd3YMMhl7W77PZF8LRF2r7NIXC34ZhvHNDumTQZQebtpUo/OhT
Xh642NCmdvsZR3ZyZP14M2+sDHXuhFqCB3PB2vaY1bF2RiUfT43Yt6LV2KxVvSH0
7BCSq3C6s4dC+9jXZKDaFYjNNonQac7pCzSCi7+PntK/z6bJ9YA6Lq5zMtcTnUiX
XNWILMCcAp+QNm5i6eQRbc+UrZ225BV8k12ZT7am5mgUmc1du5F0Lg//UcUvkTfL
7XuETMpsci7PPWFC06kR4CEb7jZl/w==
=XR2C
-----END PGP SIGNATURE-----

--Vz3fr8hXWo+Ktb/I--

