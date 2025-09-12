Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1049B553BF
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 17:35:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1122264.1466081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux5oD-00005e-Of; Fri, 12 Sep 2025 15:35:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1122264.1466081; Fri, 12 Sep 2025 15:35:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux5oD-0008Us-M0; Fri, 12 Sep 2025 15:35:33 +0000
Received: by outflank-mailman (input) for mailman id 1122264;
 Fri, 12 Sep 2025 15:35:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TRZT=3X=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ux5oC-0008Su-BP
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 15:35:32 +0000
Received: from fhigh-a5-smtp.messagingengine.com
 (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ce3f907-8fee-11f0-9d13-b5c5bf9af7f9;
 Fri, 12 Sep 2025 17:35:30 +0200 (CEST)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 4F04B1400459;
 Fri, 12 Sep 2025 11:35:29 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Fri, 12 Sep 2025 11:35:29 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 Sep 2025 11:35:27 -0400 (EDT)
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
X-Inumbo-ID: 1ce3f907-8fee-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1757691329;
	 x=1757777729; bh=N878IgmG87czFFaXvhNllDFTWf5isiDCSYiZ1CojGH8=; b=
	UgwaAVgjfldmkQVJc9M5MLmxXgoajhU9j9bdi+p+QygNfRqnTlRwUDbPJomZMZ5u
	lGxPExOpU72Poqx1P4IlSCI78d38gPnMVltUMRkAZoaVs2LI/4ltZgwI4KsXHMP2
	AJmY2a9rxdVef4q6dp9DaeOyfSaGtT735FA58FpLm7jgkHBKseXzbZK6TelHZHKd
	YZfZBISyrQvgHuUWtA0yxSFV9rR9iY4AaIpYPgl8BENu3tjbhiym+MYGGpEy4xtu
	AqXr93mDFkGzH+kPU/HiYjfeLWmKzNM86Sr+ePwvPIfnGDS6UDPjEttq9sjFby1a
	zNApuMknRC+fkejNynoTqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1757691329; x=1757777729; bh=N878IgmG87czFFaXvhNllDFTWf5isiDCSYi
	Z1CojGH8=; b=b5W/wOIshuYHkwx8n2Z8VmVN1j1s2suZH2QBxp1NPZ81/Hlb+9X
	mN8Xw4J4ZPknuHM3YT3/W0sHuIzkyBN5pK+3s664rnqZJX8P1BsTinUCWqKHKgyy
	jKPwm8335hKdydxW3db8s/vFpZvZmsA/ZdmPgCJsxat94J48Gv9/YxbO824qzrG9
	Fv1YJfnIC7Yj8QDlJPtgRR8dJb4fJ4tvfutH1i2apRKCGNV4zWnzCnw8w1iUqITL
	nFZfi2Fc9iQcbHwzk3AqGZS2g4+RHdybbRjYbmBlU0aF4xFTx2Xta54EDEjZ+QTy
	sL6eVZdxOqFw+/9aWeMDxJjM/j0hE9yV3uQ==
X-ME-Sender: <xms:wD3EaKC_jwqne_PMUu7nUhfHHOlqKOIcjDCRv8fx1f79f9jXam-rwA>
    <xme:wD3EaI6QL9Vx-RIVBcsjm-9PIKOMe8uUl5hjROY6kfrCkgj6A84RCab7XKkkO7kE0
    -v33efIZzm0lQ>
X-ME-Received: <xmr:wD3EaLddthoIXoAeudYF4af_TrK0Wp5jFVVui_hVPUXH9GcSGBzbnbmxnSaJf3bVGOEdbfl6O5OogKIuPRhZAkMjHIaRdl890-4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvleegfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudelteef
    vefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeduvddpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegt
    ihhtrhhigidrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvg
    hnphhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhhthhhonhihrdhpvghrrghruges
    vhgrthgvshdrthgvtghhpdhrtghpthhtohepmhhitghhrghlrdhorhiivghlsegrmhgurd
    gtohhmpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdprhgtphhtthho
    pehjuhhlihgvnhesgigvnhdrohhrghdprhgtphhtthhopehrohhgvghrrdhprghusegtih
    htrhhigidrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehsrghnrghsthgrshhiohesrhgrphhtohhrvghnghhinhgvvg
    hrihhnghdrtghomh
X-ME-Proxy: <xmx:wD3EaGvnFpXKcVSQshG693gw1ZHM8cYh7fs_pPp7RbcOU3gFhPPGpw>
    <xmx:wD3EaDl8TVq3PGrvu7tl2x4k8w1gX0V3DEu2qhQmhvOVZNUKA-UjiA>
    <xmx:wD3EaBQovsz7XKfxslDPvRLxkEJwSiT6jnrZ7Z2EsGXHVI9xR-a_9w>
    <xmx:wD3EaBKH06Flom2ZzMXqNAaxaVmrL_G7qdMWIYmF1To5DLdOWway-w>
    <xmx:wT3EaBk-KhioibomfWFFC6OpLjCAYzDOLPKJ5AcBr-M9A4hSdqiVyq51>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 12 Sep 2025 17:35:25 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Victor Lira <victorm.lira@amd.com>
Subject: Re: [PATCH v4 6/8] CI: Use pipefail in scripts/build
Message-ID: <aMQ9vSyPN2se3r6J@mail-itl>
References: <20250912144427.1905141-1-andrew.cooper3@citrix.com>
 <20250912144427.1905141-7-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="q81WF+hWZXgVrHl1"
Content-Disposition: inline
In-Reply-To: <20250912144427.1905141-7-andrew.cooper3@citrix.com>


--q81WF+hWZXgVrHl1
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Sep 2025 17:35:25 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Victor Lira <victorm.lira@amd.com>
Subject: Re: [PATCH v4 6/8] CI: Use pipefail in scripts/build

On Fri, Sep 12, 2025 at 03:44:25PM +0100, Andrew Cooper wrote:
> Marek noticed that some builds were failing with:
>=20
>   + cd dist/install
>   + find
>   + cpio -R 0:0 -o -H newc
>   ./automation/scripts/build: line 111: cpio: command not found
>   + gzip
>=20
> but succeeding overall, and producing a zero length xen-tools.cpio.gz as =
an
> artefact.
>=20
> In fact, it's all of:
>=20
>   archlinux:current
>   debian:12-x86_32
>   fedora:41
>   opensuse:tumbleweed
>   ubuntu (all versions)
>=20
> Add cpio into all of these containers, including opensuse leap for good
> measure, and use pipefail in the build script.
>=20
> Fixes: 4611ae6fb8f9 ("CI: save toolstack artifact as cpio.gz")
> Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=
=2Ecom>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--q81WF+hWZXgVrHl1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmjEPb0ACgkQ24/THMrX
1ywHqgf/cd7wMyXHKnPl3O9dGa6YrPxBuG5mLXrbhzxrtTCl1MumRuPdIgHSy9b3
HsXdnjgkxijEXtjjdsqd/t+SXh0bU0AuAS6qsRRMp8fMG045cCjLSaVQCx3Vrai5
cucpsHUlh3TK2VsAmMmiOCGC0kAPX7LgEEJPYSBzqlyfG0JTl8XbxegS5/NmDnRq
QSpZxUrnFKBoIY4G9XtXflHJEvNql2KaosTd7te+CLBPPec6G0WRTDRsxZvfTsXk
lq9gEgOXDQDs5NT54CiZZrAUpkb+DvY6blRRECS+UeufQCERClecNn/pVoBxC1Nn
m26vLddf9hBGvoyDAYt+LhSQNVxrrA==
=9W0q
-----END PGP SIGNATURE-----

--q81WF+hWZXgVrHl1--

