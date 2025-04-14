Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9DBA88496
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 16:22:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950473.1346780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Khd-0007dg-60; Mon, 14 Apr 2025 14:22:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950473.1346780; Mon, 14 Apr 2025 14:22:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Khd-0007b5-2x; Mon, 14 Apr 2025 14:22:25 +0000
Received: by outflank-mailman (input) for mailman id 950473;
 Mon, 14 Apr 2025 14:22:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JTEa=XA=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u4Khb-0007Yi-4g
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 14:22:23 +0000
Received: from fout-b7-smtp.messagingengine.com
 (fout-b7-smtp.messagingengine.com [202.12.124.150])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0a867e3-193b-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 16:22:22 +0200 (CEST)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfout.stl.internal (Postfix) with ESMTP id BBD7911400B4;
 Mon, 14 Apr 2025 10:22:20 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Mon, 14 Apr 2025 10:22:20 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Apr 2025 10:22:19 -0400 (EDT)
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
X-Inumbo-ID: e0a867e3-193b-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1744640540;
	 x=1744726940; bh=7HskunbLaLDVeUAl7RZ/zpIES69yBWZlfA2EVwQb9TE=; b=
	N4mRN1OPPFUi2A/JP4fHS2YA6ko1fuUTG2/Av6ouIloUSdStm8CVig8TCMbTvvzZ
	amN1YvT6g9wXZqCcL1dOlwOYIhSefhymgeSCZs/DJZHUcQOenFm55tUNF8NRcSlk
	FMsUCnnQqgX6tvEQRwB9rFJeSyxKX9e+go5bydLZ+bVm6aVv6mA0aLUIrMak3X1t
	vksDEPvmLwEdaHvuCqP7xwpqczNaTw+YQLiaz4tgtWPlx551eHKlLlzu0K6jYRq3
	8iiRDWXBCgqZ8LIWhL1l+cscNlJRUP9UAdhcQVmoBOL6Uq1pP9jZxr9Yz7ariz+a
	4gjtQuMThaGr/cQBYalAcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744640540; x=1744726940; bh=7HskunbLaLDVeUAl7RZ/zpIES69yBWZlfA2
	EVwQb9TE=; b=gHAo+kxOgoFgWnTB4BGbYNL7vJcJ9jMUkDaDWHoVZLdtGWQ/waU
	rBgXSXTCRAq33TKhd6bOtr0NF6nEqXQHKbau+lJwFeznvUPHphv78ugkVs4+URks
	6Fa4+Pd4kvWv9nrGW797R7FBKQiVqfrB3j2nalG1IrDJO+FZ0u1c6b8BheSe7Icb
	V3oQgkG/qS9gfHQcePlTPWNckCnlf9V+k+YBBAaUAANI/mc3IKuQYngnXBcUG/hu
	zRmCu0GG1LwS7JE95MkgsRsqBCFRVZLEkAcvBOFezU2Tnfd20Wp1uwn3hfF9NvCR
	9bBQnaCTnvy2ecC25Eud1uLkxmMPbXCoxXw==
X-ME-Sender: <xms:HBr9Z0G24uUVB9Dwl1jRHd9UplYgGdVN2Ym-Y6jw0TJBT3DwuqWxJA>
    <xme:HBr9Z9UbKDtlcqR_djuVV_ewzkFv4Azx7liHDWyN1gJe-_t9z6hEMeMTO47l8KGmu
    5mMSnGnz2AWQA>
X-ME-Received: <xmr:HBr9Z-KP0Y6z76AqJl6MWv3XsCE0xwXtk_A6__fEUTXkbFUfpI3_ob18ZDRazQyxBLmUqBRyNlLemXV1dB1fG4fSZ80Lkq9qvw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddtjeejucetufdoteggodetrf
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
X-ME-Proxy: <xmx:HBr9Z2G7uvtq-CKLJzvv-4gkdZh1cnbk1i1wtapb3qbowrqhMgnQZA>
    <xmx:HBr9Z6WyigouH9OEzJDqzmMexUrNQpv9hTIgrDioH47Odv4CcwxJiw>
    <xmx:HBr9Z5PqkGCeCbsFYAMNOh1mRmeaqPsVrLRBTmjh3jK38jR-R9LXnQ>
    <xmx:HBr9Zx2ElXwEBylTdM8BX7oZ2NiUI23hIetpE37k0N2nc-6MPcseIQ>
    <xmx:HBr9Z4o6IvJO1Qz2Am-wwwb2YvvArlqTCtHucu8m9T1LsA8C-74sj8o4>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 14 Apr 2025 16:22:17 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v2.1 4/7] Shrink the rootfs substantially
Message-ID: <Z_0aGT-YW-EeVPnb@mail-itl>
References: <20250414101843.2348330-5-andrew.cooper3@citrix.com>
 <20250414115226.2357714-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FvLreH1ddAa5vxOm"
Content-Disposition: inline
In-Reply-To: <20250414115226.2357714-1-andrew.cooper3@citrix.com>


--FvLreH1ddAa5vxOm
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Apr 2025 16:22:17 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v2.1 4/7] Shrink the rootfs substantially

On Mon, Apr 14, 2025 at 12:52:26PM +0100, Andrew Cooper wrote:
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
> Use apk --no-cache to avoid keeping a ~2M package index on disk.  Use apk
> upgrade in case there are changes to the base container.
>=20
> Remove the modules scan on boot.  We don't have or build any (except argo=
, and
> that's handled specially).  This removes a chunk of warnings on boot.
>=20
> This shrinks the rootfs from ~30M down to ~8M.
>=20
> Factor out some x86-isms in preparation for ARM64 support.
>=20
> No practical change.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--FvLreH1ddAa5vxOm
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmf9GhkACgkQ24/THMrX
1yxtpQf/a1SO2RhBh9N6yMD9jJNJqIZjD7OrjtmxqQH4sN+e5K3z7xLANuqKo6eI
VWd8+mAmMRGubq/KrNl4RgkBIaSyhjpyUtIJJjmxqc8PQTX+hP+WAaTIDCBM5uKz
88WR0VPc6t/9F48zOTCrdHdxb69HBZh4KnwBwXaTAWBdDZpJ9DicyumLH0vhAbzN
pl7h5v+M7BR+r1l/rny2+9v67EoEV1jpDXSTtRzpze/8x6jI7EGzOekkW97yYqeu
va8e9xAb6kf8URJvlusXL/lGVVBUXnPO0RmPD5YitAkmxCmurlh1XT1D80HbxsWH
orEh5fwwHZEuwwObOUHN28O0iSyaDg==
=TR81
-----END PGP SIGNATURE-----

--FvLreH1ddAa5vxOm--

