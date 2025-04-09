Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E83CA82D68
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 19:15:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944515.1342957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2Z1W-0006iB-IH; Wed, 09 Apr 2025 17:15:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944515.1342957; Wed, 09 Apr 2025 17:15:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2Z1W-0006gi-F4; Wed, 09 Apr 2025 17:15:38 +0000
Received: by outflank-mailman (input) for mailman id 944515;
 Wed, 09 Apr 2025 17:15:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=np/6=W3=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u2Z1V-0006gc-2c
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 17:15:37 +0000
Received: from fhigh-b7-smtp.messagingengine.com
 (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3feacaeb-1566-11f0-9eab-5ba50f476ded;
 Wed, 09 Apr 2025 19:15:36 +0200 (CEST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfhigh.stl.internal (Postfix) with ESMTP id BCF242540131;
 Wed,  9 Apr 2025 13:15:34 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Wed, 09 Apr 2025 13:15:34 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Apr 2025 13:15:33 -0400 (EDT)
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
X-Inumbo-ID: 3feacaeb-1566-11f0-9eab-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1744218934;
	 x=1744305334; bh=wGpyKbs9ds7K32EI3dmNdbOyB/Z8Y6/261UT8PUMal4=; b=
	kkOXDwxC97etcru2z58hTJaVv39k5QYRlUBJFIAJ5BcoSjpRBJ1HkUsvMlH+spq+
	Ytopc42iCyft2sRiL/Iq+Yr7hyQeNSqJJdlE3d+cD+6NqxyvgbKcBdOB7I23N1aq
	Kv+MESgXo7SmyvzwmUmcssltXBDdncb3QTwXP+ZX2d6nzfisvXPF6eQ5aXOV07dW
	EZUvA9E/Qa8+Xz6KXkGJDSPyA7yo4EHw3yRxzwG1cKxKRj8m9G8y6o2c8sXhM3kO
	ppT9i4AKDDNFWFIGwuYfV8bcgla8WUuy+6JsHRsXtvLv0bpMawCtBxwquvz6Hw2K
	W9eDuFVlCDpxqg7YdFZj6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744218934; x=1744305334; bh=wGpyKbs9ds7K32EI3dmNdbOyB/Z8Y6/261U
	T8PUMal4=; b=bDCJseBhZUo+kTpDxyo3dZ80AEksflQPM7w3mz+PXbVxhMibvhI
	aP1Uqt4x2Uj8lGbld0tEEKnnKKHr91IOoj1OizlwKQPqO09dG90RD8C1T5PQZlKU
	o9j/u2mINTNkO9tOU7UIevhJkwx0Uk6LuBp22akoIRKUybitxc1efu82TBZqFKh6
	YP+6bJ3iM7qTMCd4jnzZCtibFoG8Dm213LV+m52JZPLcIFF5G/0T7NT9zvg1GQ4O
	peAaJWmm48SU4Ro7Mo4cQ8qHA1Vax5sBeAYr8b1TiWHCxbkiJDbXlVie3iuP/bCA
	nTDJGpetK+WI3C4v5mOgu76UQFeHT+3i3Tg==
X-ME-Sender: <xms:Nqv2Z4qk2S6w-uoAiHnSkK9g7jEh5wsqE4eaF8TnytoEBPusnBEJxA>
    <xme:Nqv2Z-omrR_R9e-lmM4foT8YQqq2GJc0xfeD8IH2M15L576bhqs0MVArWRjeYKNXm
    LwYPA5KzTTBXA>
X-ME-Received: <xmr:Nqv2Z9MlyNC7utHRIB8YP0DsxyIedlWnOwbk4Velz8G8qtRBWU5CFEwdHicZMpq1pRIivJN4PNZRSKXwWxcOVuifPy7zr4uKCA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeiheekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepveeujeetgeelleetudeuvefhtefgffejvedtvdfgieevheethe
    elgeeuledvjeevnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeeipdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghith
    hrihigrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhp
    rhhojhgvtghtrdhorhhgpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihigrd
    gtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepmhhitghhrghlrdhorhiivghlsegrmhgurdgtohhmpdhrtghpthhtoheprg
    hnthhhohhnhidrphgvrhgrrhgusehvrghtvghsrdhtvggthh
X-ME-Proxy: <xmx:Nqv2Z_4Ym9Rsek8EUZpJ1Ht4r6PzEzV8qs20i2xBqsygKeC5GQjUbA>
    <xmx:Nqv2Z36c6Wj5kyBpAodcLJtVUVsu1j9R-qV3TwnAtwnmvlmF0SCzKA>
    <xmx:Nqv2Z_hxH5eplmv29yMAX6vYvjCLmeIx-iunH7Vz2WpNKH1yBEgudg>
    <xmx:Nqv2Zx7oBSzu3r2JF_Q8yihftH5OEF9eFadwqogRYnOAqIApYWVEYA>
    <xmx:Nqv2Z25v5kOkeiZ7jCFNMHRiJ5p05hol6gdpX81Z_FyuWvg9ar3ZGss3>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 9 Apr 2025 19:15:30 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 4/8] Clean up Gitlab yaml
Message-ID: <Z_arM5JqPuyt7dFm@mail-itl>
References: <20250409163702.2037301-1-andrew.cooper3@citrix.com>
 <20250409163702.2037301-5-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AE/uX+FxLgNYZRXe"
Content-Disposition: inline
In-Reply-To: <20250409163702.2037301-5-andrew.cooper3@citrix.com>


--AE/uX+FxLgNYZRXe
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 9 Apr 2025 19:15:30 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 4/8] Clean up Gitlab yaml

On Wed, Apr 09, 2025 at 05:36:58PM +0100, Andrew Cooper wrote:
> Factor out the registry into a common location.  Fix the worflow name.  L=
ist
> all the stages.  Set a default expiry of 1 month.

This is okay, since last artifacts for a branch are preserved even if
expired.

> Note all the current jobs as legacy.  Their naming scheme needs changing,=
 and
> we'll use this opportunity to switch formats too.  However, the artefacts=
 need
> to stay using the old name until the final staging-* branch using them is
> phased out.

This could use a comment what should the new naming be.

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> CC: Anthony PERARD <anthony.perard@vates.tech>
> ---
>  .gitlab-ci.yml | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>=20
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 36ec6a7e1ee5..5a0a853e551d 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -1,12 +1,19 @@
> +variables:
> +  REGISTRY: registry.gitlab.com/xen-project/hardware/test-artifacts
> +
>  workflow:
> -  name: "xen test artifacts"
> +  name: "Xen test artifacts"
> +
> +stages:
> +  - build
> =20
>  .artifacts:
>    stage: build
>    image:
> -    name: registry.gitlab.com/xen-project/hardware/test-artifacts/${CONT=
AINER}
> +    name: ${REGISTRY}/${CONTAINER}
>    artifacts:
>      name: "${CI_JOB_NAME_SLUG}"
> +    expire_in: 1 month
>      paths:
>        - binaries/
>      exclude:
> @@ -19,6 +26,9 @@ workflow:
>    variables:
>      CONTAINER: alpine:x86_64-build
> =20
> +#
> +# The jobs below here are legacy and being phased out.
> +#
>  x86_64-kernel-linux-6.6.56:
>    extends: .x86_64-artifacts
>    script:
> --=20
> 2.39.5
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--AE/uX+FxLgNYZRXe
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmf2qzMACgkQ24/THMrX
1yxkDAf+KjtqfLdfo01oocpP9QYd98e6n8VVuHOx5u0JdCcfmJpxkokLu7IoGPBL
7bFHIuJU+FaS3x6MfREOt2dKN5tZUxlocoOaZD5pKXQ1hkXx32bb2sNdwQYRPqbN
l0IQ5BQaDCo7OMWSl1zaleGfEmCJol7cW0KkThiEvnTK6WcYCAxLsfFNz9yqwBVn
smKSmeoUQVl3xeIwaVZK1fhzw9MMFsAxSJg3ZeE5Olytyn9c2r247FTDdMB6dmWx
yhjtBuh8sE9kFPl1OlHHWD81GvvOT9ZsWSPrENKPb8S5eYkQ0gfGPOyPcbSt3QYM
0X0rL8gzV1suMWpucuOd/wgPEBLPuQ==
=e7xZ
-----END PGP SIGNATURE-----

--AE/uX+FxLgNYZRXe--

