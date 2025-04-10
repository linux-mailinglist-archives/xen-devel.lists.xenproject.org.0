Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 982A4A84313
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 14:26:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945602.1343772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qyk-0003pJ-3L; Thu, 10 Apr 2025 12:25:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945602.1343772; Thu, 10 Apr 2025 12:25:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qyk-0003nG-0k; Thu, 10 Apr 2025 12:25:58 +0000
Received: by outflank-mailman (input) for mailman id 945602;
 Thu, 10 Apr 2025 12:25:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S0bf=W4=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u2qyi-0003nA-KZ
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 12:25:56 +0000
Received: from fout-b3-smtp.messagingengine.com
 (fout-b3-smtp.messagingengine.com [202.12.124.146])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2244db9-1606-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 14:25:54 +0200 (CEST)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfout.stl.internal (Postfix) with ESMTP id 50619114017E;
 Thu, 10 Apr 2025 08:25:53 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Thu, 10 Apr 2025 08:25:53 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Apr 2025 08:25:51 -0400 (EDT)
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
X-Inumbo-ID: f2244db9-1606-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1744287953;
	 x=1744374353; bh=DfLCFzu8PFo6+vzQj8Gc87r0NwjsjlrKy6uU5YmqphQ=; b=
	Evq2F7BJgE5iT9WCvzdbEagytKHl7kPsqZ3h+a3n/HEeFrSGBqA3KlPZQEOQefAs
	3H9c67cTx+3L3Ckl8DwdNCrjj5qpee9CdIwksbZtfFknzKWy9Kr81d9EiEHQL2Le
	OEcG0QQQa7HFgVtZbDLurpyIQXZIT7Ca/N7nVQjdBOHzG8js3N1ad910XP6s+gz1
	5XE09yd4FLBq+johPUioXQnPq2bUUIA6pzSNUg4ENGIUt2cNddAHYY6cbln/hGbT
	EBxQYSzf2Rnl4Vc1apAUlE/7vX7mSSwAaPz7OEYDOOsDKNd8775V8n/MeUJWVHE0
	N7DYdeVvUY+crmQTssVDbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744287953; x=1744374353; bh=DfLCFzu8PFo6+vzQj8Gc87r0NwjsjlrKy6u
	U5YmqphQ=; b=l3umyN0cFDfjTotjlBMG5iCIe4VAoN1y7c+iXMfa6WDB3XRkTWg
	2vw4ShnejKYMVHdVFXPrQrHcvqh/0l0ubOefu79qCsNMxy7SJTxVravLEULviqPQ
	qLA4rDVoFfcelil7cQrnTq69YDzFfuG/AtTH7+VukyJ4JqEOZ2HIWsKgpgxz3ZCb
	c5DPAxrDUJXbrrgiyD6hpyi2VXisvNpfguUvY9yRGz3CzJBi4151o3buOK9FH43G
	5v5YHljhyEVzx4W+zYoByWQqxnqIAsvAc9lj80VPvwCX5CC8VVJfI8cPftdg81Nj
	voE0YAZ5fl6hnppXfl07Ba9AaI+V7EAbUJA==
X-ME-Sender: <xms:0Lj3Z8ktY7_P1wqzjikXR5G5bA6NaQuyktq96T75MXSPd6_4CgZQZA>
    <xme:0Lj3Z70wn2MOf4CIfgY2Vzc_vT0I9WBw-7f1yx1iE86asi-rIw3bDTWcklbWZVDqM
    ao854BRxTVFrQ>
X-ME-Received: <xmr:0Lj3Z6rmLTzfQJuDa1r1-8W8iYSd3mI27PEgKPNukwfi15LKnZeoNcFsKkdq9mWv84JG2ntaNjzBsuuBYKAtcMR_P--b7dUeUA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdekleduucetufdoteggodetrf
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
X-ME-Proxy: <xmx:0Lj3Z4leYzLEfn-IKHwNudRyh7NgU_UpCPg3yLUp_qiUABDbaZmvIg>
    <xmx:0Lj3Z60azusxSGmmUiIwhKJovueNXy-neRJD8JwQviX8RszP88_DyQ>
    <xmx:0Lj3Z_tlG7HGJMHMZm7hf1p3sH4QnSewEfR-UBAc_qRQUpAnRkEStQ>
    <xmx:0Lj3Z2V_SybD4T8YusKXpgGADR4AtZXqJOZCRKCSqC2ahFOVe1E9Hg>
    <xmx:0bj3Z90BGw6vuID7fsKDcd6rSq079togZdrLDGdbNYUa7KRgUoppHt2t>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 10 Apr 2025 14:25:49 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 2/6] Clean up Gitlab yaml
Message-ID: <Z_e4zbUVVDrDmFUf@mail-itl>
References: <20250410114628.2060072-1-andrew.cooper3@citrix.com>
 <20250410114628.2060072-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/4Mq+QJ+tWL6h2hY"
Content-Disposition: inline
In-Reply-To: <20250410114628.2060072-3-andrew.cooper3@citrix.com>


--/4Mq+QJ+tWL6h2hY
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Apr 2025 14:25:49 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 2/6] Clean up Gitlab yaml

On Thu, Apr 10, 2025 at 12:46:24PM +0100, Andrew Cooper wrote:
> Factor out the registry into a common location.  Drop the worflow name, a=
s all
> it does is hide the commit message of the change that triggered the pipel=
ine.
> List all the stages.  Set a default expiry of 1 month.
>=20
> Note all the current jobs as legacy.  Their naming scheme needs changing,=
 and
> we'll use this opportunity to switch formats too.  However, the artefacts=
 need
> to stay using the old name until the final staging-* branch using them is
> phased out.
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
>  * Drop the workflow name.
> ---
>  .gitlab-ci.yml | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>=20
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 36ec6a7e1ee5..734f3982c46f 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -1,12 +1,16 @@
> -workflow:
> -  name: "xen test artifacts"
> +variables:
> +  REGISTRY: registry.gitlab.com/xen-project/hardware/test-artifacts
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
> @@ -19,6 +23,9 @@ workflow:
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

--/4Mq+QJ+tWL6h2hY
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmf3uM0ACgkQ24/THMrX
1yxZDAf7B9vcz9oi7ppXQpHd5uBt0JSqvsMWo0Vt9+gq/fxhgjtX3bUnhNVT4mRv
Jn6yDqFjBPg6dLg4nCyhC7a4fJTZDOt4PVP0QAT/nQPyr9H8DflC1JdQhL5/Z72I
+l0wHOpTIFNKWFQovUCcR+pQGE7cgxmzwpWLq2xk7a8wWj7Oi0Q6k7iDXtnaQRs6
Qdgyd8JJLQiZtA+LL7J/3GQDP3m2QTxQTMqiHY7yQCiBDr+qFKErUuFs0cvO39/t
nUwoIOnjzUdWfKg8QnhH/r7NxJk5Ea4QGaPoKiLOsewwv56EmhymzFrkRhqGjKcH
hfoiBjHSex6oGeoTv14Y9SHMGk/ckg==
=vlDd
-----END PGP SIGNATURE-----

--/4Mq+QJ+tWL6h2hY--

