Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D6AA84292
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 14:09:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945519.1343713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qip-0002SE-JW; Thu, 10 Apr 2025 12:09:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945519.1343713; Thu, 10 Apr 2025 12:09:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qip-0002Pq-Fg; Thu, 10 Apr 2025 12:09:31 +0000
Received: by outflank-mailman (input) for mailman id 945519;
 Thu, 10 Apr 2025 12:09:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S0bf=W4=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u2qin-0002PR-L4
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 12:09:29 +0000
Received: from fout-b2-smtp.messagingengine.com
 (fout-b2-smtp.messagingengine.com [202.12.124.145])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3838602-1604-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 14:09:23 +0200 (CEST)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfout.stl.internal (Postfix) with ESMTP id 14F5F11401D4;
 Thu, 10 Apr 2025 08:09:22 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-11.internal (MEProxy); Thu, 10 Apr 2025 08:09:22 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Apr 2025 08:09:20 -0400 (EDT)
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
X-Inumbo-ID: a3838602-1604-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1744286961;
	 x=1744373361; bh=PZEgb330gVH7BSPCy/LRDnWpvZBO+8QSuPUnDifhoOI=; b=
	hxetcrME6n8V5x5WPAT2PN2HRiHVgCgxgqrLHCSuPIlTfCxz4gY1DhbEjYXlpkFY
	h58eYgdYSAwOX2RymLU5cB2LsWErTf3Y1Z1prFXFU/rEZQQeRH8jM+mEbhD1ackx
	WaLWRX4LtPJ5IElrZPLYq0S/ipndhiI7BSRJSq3EdEudahoqbajjrn30NRO/IE9g
	juXEygtnfvSafbzai4TdMo1cPFbqdxew+fPAM83tDySdNpnouPOu+X08zvCJUDLB
	JrWAZOWBPId1ZxoaudAhl8eVCoQa7Lf/fOnM3+4xWwjy38jSnpcFhZiOu3uuJlrs
	gJG3bDXfobF7EupOuCjA/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744286961; x=1744373361; bh=PZEgb330gVH7BSPCy/LRDnWpvZBO+8QSuPU
	nDifhoOI=; b=Vvdj5Ja2S0KfNcahYILg5QG537UBuBFKdhRW7iDmFQ151Sai9ue
	ABpGLpxXTZ1KCFQadXiMErtRHW41iDOw2POCDz3FnbrmTV3yb9ZhtmpPyC0WKgr9
	rBX90gQ75FkBnE58Pkjx/OTzhUbVWzVLnOil09UyhoYU6ZqTVaW5zU5IctwaHXwJ
	IaJ7yWTq2cDbbcXt43pYbPF7HbwYbxR6Drld/E16bi0NtQSJAMnPIrodgGxIeztO
	IgxVrOPI0OSi7gJmr3WNiCCWjxgXDRUo+cuWQ//3Z1mawBx2kTQ6DVp8USyZ19Ns
	DWTg11F+TaxNBO45RTBwJlquHfwAQ20ffcQ==
X-ME-Sender: <xms:8bT3Z4esBlj6zAq-LtLUW2rLN8AYbp4bCc3i46RN7WknT6VhUKA3YQ>
    <xme:8bT3Z6PbQuByUGMuny3Jc-c-8XfmNETdyLQQYtxSQM5_jp-5c2Y-_qRp-lzWNvqnJ
    kdJXw6HwLIBHA>
X-ME-Received: <xmr:8bT3Z5hOcFnU4JlFPpjiC5BhfG6zVp_Z1PrxGhSCAd-AUbnxg191WTMxQKviBX67u-L0lK2bzoQ1NONguVdc_ZcZf6LTpiTQfQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdekkeejucetufdoteggodetrf
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
X-ME-Proxy: <xmx:8bT3Z99ycYTMckaibyVdoWslBxOGdu4kRrZIJXao5GVPy1xnJFZ8pw>
    <xmx:8bT3Z0sHWtWVRtaUiqWyy9hfR-6cCHRj1hh2uKQ14LJ4_44kMVt7CQ>
    <xmx:8bT3Z0EZ7f1E48KAuOaHXfjOlsm3ECTxsn-86rBRzcLi6Q08RQlsKA>
    <xmx:8bT3ZzO4LTuTWj6PhBUt916kwp-mxglFWe9Xaxphe0X7VVmdX1d1_g>
    <xmx:8bT3Z_sGI2AVkjsIjXbr91t4gHYJUCw_Nd4mnQd2gYRDXG0hmGCS5dxP>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 10 Apr 2025 14:09:17 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 3/6] Adjust Linux build script to work with other major
 versions
Message-ID: <Z_e07sow3o0bv-W9@mail-itl>
References: <20250410114628.2060072-1-andrew.cooper3@citrix.com>
 <20250410114628.2060072-4-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3cyWOqAS0erRWFr1"
Content-Disposition: inline
In-Reply-To: <20250410114628.2060072-4-andrew.cooper3@citrix.com>


--3cyWOqAS0erRWFr1
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Apr 2025 14:09:17 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 3/6] Adjust Linux build script to work with other major
 versions

On Thu, Apr 10, 2025 at 12:46:25PM +0100, Andrew Cooper wrote:
> Simply the tar expression, as 'tar xf' can figure out the compression
> automatically.
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
>=20
> v2:
>  * Use 'tar xf'
> ---
>  scripts/x86_64-kernel-linux.sh | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/scripts/x86_64-kernel-linux.sh b/scripts/x86_64-kernel-linux=
=2Esh
> index 2a816f0b3204..5ed5608628bc 100755
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
> +tar xf linux-"${LINUX_VERSION}".tar.xz
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

--3cyWOqAS0erRWFr1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmf3tO4ACgkQ24/THMrX
1yxI7Af+OVkmKGKJ6zOctC1A2aKkc5h2u0Bm/WVvT3dQE+DLCqmu0TQqTOEIy3H9
ArLEkAxhsZus0EEunhMRQcBE8vLdVoiKH7gsmbumkAGQ0g0fttn4GrzQJ9teLD8k
dEHneRZvXEfXkunc4O9CZpNehAmZTBIros3gaXdZc8UWO2szHgXSqLwzXDeJSPiR
8Ii6logeY30QWs0OMkSSsx6+iQn0YUCrpyvFyKG/gTNhHerH0mJz2F0NHmp9hzqC
Kh+IuHcg8lg8ZhP9VvUspfqwykK7LV1VKjAZA4xaH99PVPToW9/sspoOpn7EGfro
xvYWdb9YQLPEcMl7Flnu+9iIAq65nA==
=x4ZY
-----END PGP SIGNATURE-----

--3cyWOqAS0erRWFr1--

