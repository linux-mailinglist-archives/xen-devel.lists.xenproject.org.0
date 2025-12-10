Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA22CB1AAF
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 02:54:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182505.1505371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT9P7-0007vO-HR; Wed, 10 Dec 2025 01:54:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182505.1505371; Wed, 10 Dec 2025 01:54:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT9P7-0007sk-ET; Wed, 10 Dec 2025 01:54:09 +0000
Received: by outflank-mailman (input) for mailman id 1182505;
 Wed, 10 Dec 2025 01:54:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RTTf=6Q=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vT9P5-0007se-Qw
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 01:54:07 +0000
Received: from fhigh-b7-smtp.messagingengine.com
 (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b852086-d56b-11f0-9cce-f158ae23cfc8;
 Wed, 10 Dec 2025 02:54:05 +0100 (CET)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 5D0C27A019D;
 Tue,  9 Dec 2025 20:54:04 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Tue, 09 Dec 2025 20:54:04 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 9 Dec 2025 20:54:03 -0500 (EST)
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
X-Inumbo-ID: 1b852086-d56b-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1765331644;
	 x=1765418044; bh=yMFPRLeoM8jfJMeveP0/VibaSV0LekSZ4zGY9iaKxWo=; b=
	L4ultSxkf+d+o266wMx/qrcWD3NLlMppoY8vGLuxNc0YcgrJOKAXYfKlFTAeKYoh
	ZCUHN3ohcFCcucxNp/CSKyrPcWS8n1g3FpXYA8LRALbgpDM7SLNZ3XO50fWxTtCt
	KAkQsTiBhJcItw4zJii3NXQJKZdXgEDpsIUWGnJSrIR5WHo+s5q9Y1ikBidKK8/m
	2bJKxF/Ei9KZ90I1f7U2SSPL3CnIiZOmozUlZcRb5XIhDZ+wIFEV4FVamXeKl3d7
	+5rTMm4zbgwfUH2/lrRZLjPE5s9GvWe0RKnAQbn2IHYGdfqvzvB9HN9QKhTKi4S1
	UM9xoz7W5oMJRRwKmu/nEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1765331644; x=1765418044; bh=yMFPRLeoM8jfJMeveP0/VibaSV0LekSZ4zG
	Y9iaKxWo=; b=I49QDDWNBZCcj6GlUNvIwNPNavEaqXuCcD8832axcFcFrS7REOI
	FXwWZCRKBM8uYDV4sFhTsxFmv998kUd58B621vwPilvdEHD1OpW3e3dRDmoDd9TP
	bx9f3agx2ji9lM7AqFzRfG6F9M++55ImnHLinPk67gqw7lJWRKWpiqlv5MZpOnXe
	59kfLB5kSJ6RffBJFoFcGcXp0aUSo9L5PQmksgztI56uhQBJ8Ddsv1M6w4pleEv/
	aFBDkNRAJHyDXl3ks+wsSksJiOuqjizKMEr8V8F6hKV34GyOcFM4mFZTHAYy6JrP
	Nuv1ScH42Sc4mAEne6sBPZLJ976p9/jSGHg==
X-ME-Sender: <xms:vNI4aWzpbGP_dwUSvutqm9vylY0DaBv6Z7NCOAm2Lq6rcyAX-qVpHw>
    <xme:vNI4aZQr1WnC_hM2cRAYHjzzwcOysV0C6Q260UWyP2yZGd-yPcI4ZbQpKPzXyVwk4
    88YxJfnTuRtxVt52eyojWBFQoNHnwIcrQlr3VzDmkSaEOp7Wg>
X-ME-Received: <xmr:vNI4adWTRIf8vdKc8ZZQHWdde6GeN8pkqjjuYh91poVF4HDmPaDavu0NIfZmehec2Dnfq1MmDqM_WM-7XWjnTSWJhmHMJpNBCm8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvuddujecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudelteef
    vefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeegpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhroh
    hjvggtthdrohhrghdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhr
    ihigrdgtohhmpdhrtghpthhtoheptggrrhguohgvsegtrghrughovgdrtghomh
X-ME-Proxy: <xmx:vNI4abZdgAwgP0rbo6bKi0iqMwvRGbUDBymfdNdxtSIGJ3neTkY-IQ>
    <xmx:vNI4aT2g4otQTrbZkyiGynyPRfCBzBzp4at-W91rT2IJyr5IBEXMmQ>
    <xmx:vNI4adhVRxjCVZiozOhQ7sC1UYKI3whHRRFctyVdHgEXtdXt_P5_lQ>
    <xmx:vNI4aXawimgEFPQtwLpEdwegtUfp91lteoeLCJmufKCx0JeHwaI9ng>
    <xmx:vNI4aU32AWtgESe-fr9GCtof1FoDMFj374vbqzIBZEFgP6g9O412gBFP>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 10 Dec 2025 02:54:01 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v4 2/6] CI: extract qubes test container
Message-ID: <aTjSueQPKmjmuLj0@mail-itl>
References: <cover.b56a66dfe4d98db2f1cc8b1fe0c2091d02cebe38.1764989098.git-series.marmarek@invisiblethingslab.com>
 <ca2b4dfc19441f2ff609b197b4e97805ae2ef2ba.1764989098.git-series.marmarek@invisiblethingslab.com>
 <alpine.DEB.2.22.394.2512091508500.19429@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YcNbIcUxKP1fGIyi"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2512091508500.19429@ubuntu-linux-20-04-desktop>


--YcNbIcUxKP1fGIyi
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Dec 2025 02:54:01 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v4 2/6] CI: extract qubes test container

On Tue, Dec 09, 2025 at 03:12:06PM -0800, Stefano Stabellini wrote:
> On Sat, 6 Dec 2025, Marek Marczykowski-G=C3=B3recki wrote:
> > -  \
> > -  # qemu build deps
> > -  glib-dev \
> > -  libattr \
> > -  libcap-ng-dev \
> > -  pixman-dev \
>=20
> it would be good to mention in the commit message that the QEMU
> build dependency packages are not needed anymore

TBH, I'm not sure why they were here in the first place, none of the
build jobs for ARM64 build QEMU, and commit adding those initially (for
Alpine 3.12) doesn't tell either. I guess it's copy&paste from x86 one?

> anyway:
>=20
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Thanks.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--YcNbIcUxKP1fGIyi
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmk40rkACgkQ24/THMrX
1yz20wf9HUNh+aI+BGudwSNGVy1WROGbB+7KnDgeQwU6VYTdCzvrG2deWlpIHb6A
YNoMgaw/Q4f29G0+7ghytek5y44hX3yoMvPINOqNC3r3f0cpa2spw5wUegbI3Gw6
34MI+shE20XUeFius14fq0Ek0TGqTwp5NRUjSBZEYjELEGPUOD9gj+aFm1ZOpzGx
wVGpyJ5r4PGYaaLyM99rnOMNfchjkLA2HqW0PgEh8w+k24IhiG/5zdmV/rboQ5FI
l22ySANB1R64xubNAu11CclmIMue5Q5rLxyn9Q3hDqZ2gGRq7krd5+JumC72zsxR
i4ItVOi7ZDeQiD7hHtCKfOP/YEgLxA==
=sKyG
-----END PGP SIGNATURE-----

--YcNbIcUxKP1fGIyi--

