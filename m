Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A71A8477C
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 17:14:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945969.1344023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2tbp-0007pA-B5; Thu, 10 Apr 2025 15:14:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945969.1344023; Thu, 10 Apr 2025 15:14:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2tbp-0007m2-7N; Thu, 10 Apr 2025 15:14:29 +0000
Received: by outflank-mailman (input) for mailman id 945969;
 Thu, 10 Apr 2025 15:14:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S0bf=W4=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u2tbn-0007lw-J4
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 15:14:27 +0000
Received: from fhigh-b4-smtp.messagingengine.com
 (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d5abbc0-161e-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 17:14:26 +0200 (CEST)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 4151B2540234;
 Thu, 10 Apr 2025 11:14:25 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-11.internal (MEProxy); Thu, 10 Apr 2025 11:14:25 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Apr 2025 11:14:23 -0400 (EDT)
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
X-Inumbo-ID: 7d5abbc0-161e-11f0-9eac-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1744298065;
	 x=1744384465; bh=5QQsBcjFo6nquo9YfzTRNkQiWrZy6Oy28KlGjOd1USQ=; b=
	NfhZjLgAeo5AIYVwbTDKgdnvSeQiYmsdKINzYsMuceio3PPdwZXMLt6xTNnBgF6A
	RhRrDr9+BP8kDINOl6HTw5DR7PUDwbqAuzaefl1OZhRjcX0Qu/AjG7oPKSMb1nF0
	T+pYwFjw0pillxLaJqcpz90GKRQZB7MtGg5Whd7X5kRl606Yxjedl/5wjg5+n9Mf
	FldoA9h5lONSsh2ImsYc/tIJo5lnX/weFZX2y6HpbT5TnVHbPV584a0IfxgvuuKV
	yU8R4+dvkxhrLOguxt/yolw1f/nPN4flNjJGJdiegF7sdKKiO7Do9T2YtmFB4j+Z
	B12MztKpsPvK7YLK5OfNOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744298065; x=1744384465; bh=5QQsBcjFo6nquo9YfzTRNkQiWrZy6Oy28Kl
	GjOd1USQ=; b=QdWwwt2zCFn7oexm1mKkUG/ltU4LzbvZxILrk3qKfskEU8OT1ow
	FN4WyMJLYALYkJxlT+qapHjc1aF4nj+9pbto/xZxuE7ElzsaADop7JDzaGf67uVc
	4RBW6sMJnJI5j5wXsiZ2B0nZRwW7C+bAnyyMDEivbZ9bX7EL2g1l7nHa25IjvQTV
	T0NCM6jjnhCwPmU8DaN5NOq6emxI226KgSVS8g8X/M2GHDne5m/jk9FP95n3LHW6
	Ncb1Q9Ah2wicoRcVw7W53cZjGXW5yNtz9PQt4T5Dzu21S09jempjTfQ/gzHyv9KY
	dvTi45Vsmg3jI+8JBGmJIhZfqis1WMCe72Q==
X-ME-Sender: <xms:UOD3Z0q3NpoZVPHaQKg7EzRGgwihVhtq-VMqEVRt8yvt4z3lXLUhiQ>
    <xme:UOD3Z6qiJj6Xy5gyOez9spRGyuCCm2IGMEwvzBDCffAKpuLWQWti1NVPs_2mOvwGG
    2vbf6DAM29KEA>
X-ME-Received: <xmr:UOD3Z5NWsITMOOG6CD3F61RK2za-14MrGS6lELLzUGCInq77uMcXE61z0-ddYkHNAt-prJ_UGl7l6vjAvgS_notLho35UBzMJQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdelvdegucetufdoteggodetrf
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
X-ME-Proxy: <xmx:UOD3Z75aRHujpfZ4DI6fABu3T26W02R2f_eMYCMzua9LDKxF0AqLtw>
    <xmx:UOD3Zz4bDY2KXWBGsN1c61JSZtzLM1GrG1IQ8b-ImgwCxjzlPpKCaA>
    <xmx:UOD3Z7jpHDeA4LSj8CzEBQo4lvg8qHoTFZHh1LyETZxp30iJ8fBRuQ>
    <xmx:UOD3Z95kiOkFbDfB8Y46PKPT829N8MFVKhB1djxM2kEE7J_UStoOCA>
    <xmx:UeD3Z5OdxDxHQUY2XqrgLzyF1YrvcwOQ2Lvoe6n3aVL0b3cmLzX9jxYB>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 10 Apr 2025 17:14:21 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 3/3] CI: Drop stale test-artifacts/alpine/3.18.dockerfile
Message-ID: <Z_fgTZMOeTv5MnMD@mail-itl>
References: <20250410120520.2062328-1-andrew.cooper3@citrix.com>
 <20250410120520.2062328-4-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KfgvAcwpA3vVb/ja"
Content-Disposition: inline
In-Reply-To: <20250410120520.2062328-4-andrew.cooper3@citrix.com>


--KfgvAcwpA3vVb/ja
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Apr 2025 17:14:21 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 3/3] CI: Drop stale test-artifacts/alpine/3.18.dockerfile

On Thu, Apr 10, 2025 at 01:05:20PM +0100, Andrew Cooper wrote:
> This should have been dropped too, as the authoritative copy lives in ano=
ther
> repo now.
>=20
> Fixes: babe11b46c1a ("CI: Drop alpine-3.18-rootfs-export and use test-art=
efacts")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--KfgvAcwpA3vVb/ja
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmf34E0ACgkQ24/THMrX
1yzoEAf/cMgGBIfWdGVziDJZXfNxEypLo2jBqJvcjAmf0kNguVNAg0/i3lqEFRUA
fkF8TcpaDirDH3AOGlh0181Q595WK7kjoSYr9K+9j1far55FNY0QW5cegO1q7AQC
w81ZwkNluV6zF/Pw+9fGFUGeES814k5nU+pp3WniCZ8kMi2kzVCl19JeFm3JVp2F
vnJcHTH8wkTxI97jhOswmGr3y28FoSpthog8Ak6uCiowsML7AUZJNGXSu9U9Vhqe
CLRaOSo7gQC1NdyypdT6xHIDYHD0yWFWrAAcUALpZhqwvSO3ImE/hUCTHPUxIPRs
6uHf4SYBzzU8c9+6u1K4S4qgME9jDA==
=qkJ6
-----END PGP SIGNATURE-----

--KfgvAcwpA3vVb/ja--

