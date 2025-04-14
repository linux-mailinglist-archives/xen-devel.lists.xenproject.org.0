Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 602BCA87DC8
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 12:36:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949646.1346133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4HAQ-0006hs-U4; Mon, 14 Apr 2025 10:35:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949646.1346133; Mon, 14 Apr 2025 10:35:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4HAQ-0006fd-RG; Mon, 14 Apr 2025 10:35:54 +0000
Received: by outflank-mailman (input) for mailman id 949646;
 Mon, 14 Apr 2025 10:35:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JTEa=XA=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u4HAP-0006fX-57
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 10:35:53 +0000
Received: from fhigh-b3-smtp.messagingengine.com
 (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3bb3cde2-191c-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 12:35:51 +0200 (CEST)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 3A543254020A;
 Mon, 14 Apr 2025 06:35:49 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-11.internal (MEProxy); Mon, 14 Apr 2025 06:35:49 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Apr 2025 06:35:47 -0400 (EDT)
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
X-Inumbo-ID: 3bb3cde2-191c-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1744626949;
	 x=1744713349; bh=DAX49eePCx3O4CfAqAUMUViHZ27+XcqSMrm4WvzhXs0=; b=
	BYi3S5gvMrZBTeEnBW9LFXCSMVZQy6Lr3QOfpsRaQGtc5cslmVcGIPMrZD0kV+Om
	JRFI4iUMogN+8xR0nf8LD9tyGY3P+3k27g4kxX/U/0wuq9xJcBtzBt9dlzzl8ETY
	Jbe2rd3rnPXwIwL3HiVzCkR2QtLtWYySgk7fwjCYDyN4hGhQ/Zqs2pvnxUlr584c
	HjX8mz1K4hX3u3lDgABSjncaT+w63RJgvBKl1jlNSDkNXs5wlfD7fimAse40tE8e
	FvBQHuc1+ptLukMOmsYKZAedsaR5bh6DbkRyrwNwBb/105j/kgI3fICip4z/fXhS
	b6VjHdEpS7A0b51Sg5Y68g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744626949; x=1744713349; bh=DAX49eePCx3O4CfAqAUMUViHZ27+XcqSMrm
	4WvzhXs0=; b=lJ8zC3gMWi4nv+MRfmm4rn/PoNsp4q2j4TuCPQk4+pHKjqFJjk0
	OKnEaO4IFHCvM9XCBidYWIvHAJCeKt8FIu1KUbSy9bnnrqscxLNSw5Z1H8F2gq29
	bsOw+l5FO9c6tCvISwhTwVqk/m8mE39a80etIS9tJSU/KYbom4pzOrtS6tNGmvqO
	Y7de8ZfQVBCRh5ZzK0KqAIuJmJubkPbd/sDzA/MTtcHegrLYfACR7U7zUB/tfGy4
	AGQY7cOig6++ePA5tTpQgCyA0k7dv4OLXVkhAr09o4krurokbYRfscPZNVOGO/3a
	wKC99xv9wrZDH+Cd7UDpn9gOdtS3YTT2+bg==
X-ME-Sender: <xms:BOX8Z8KXtu5OskKmAFA6GjGn3Kl1X_lBkckS0xQP1fiek-gQ-JBM9w>
    <xme:BOX8Z8IF5RrF-0S_HK8gVGuu-PklzwZFaSCWcGVUj6Se6zpVbBf5nNQ6tHDZYZvhk
    3ZeOchXpVgNug>
X-ME-Received: <xmr:BOX8Z8sX6LhUXgJLtOsJhmKhhT-u3LxjLWLEw4BxtpXwRVRnxXQJoPdiaZnq_l-4EJigM-xYURzTrAcQJtn0hOiXA72mhqWL3g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddtfedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettd
    dvgeeuteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    dpnhgspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghn
    ughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopeigvghnqd
    guvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopegr
    nhhthhhonhihrdhpvghrrghrugesvhgrthgvshdrthgvtghhpdhrtghpthhtohepshhsth
    grsggvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhhitghhrghlrdho
    rhiivghlsegrmhgurdgtohhmpdhrtghpthhtoheptggrrhguohgvsegtrghrughovgdrtg
    homhdprhgtphhtthhopehjrghsohhnrdgrnhgurhihuhhksegrmhgurdgtohhmpdhrtghp
    thhtohepughpshhmihhthhesrghpvghrthhushhsohhluhhtihhonhhsrdgtohhm
X-ME-Proxy: <xmx:BOX8Z5bvOX75lk6zqZ88CCQ9D7XCfs8p-dFlZVLizajLv1Q7hx6bMA>
    <xmx:BOX8ZzaLd_oNiQEqRoyMmQEdCmOJAYlnHJmJkBEeyKh9kMsRkRIwbA>
    <xmx:BOX8Z1Bmp7YXDsTcGCoVWF15PhLVNutNCOws05xo5jvGLfBzRhg2MA>
    <xmx:BOX8Z5YBkE_XU4tfHG5bHwCTtMAc6DhPeTIv7SkuTqfysU97EcY6GA>
    <xmx:BeX8ZxwLDoYPhhKSeUZ0WJwP7ndyELP58FVuxXnhboJ4GUbXM93XklGt>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 14 Apr 2025 12:35:44 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 2/7] Overhaul how Argo is built and packged
Message-ID: <Z_zlAKOMjbrw_5bS@mail-itl>
References: <20250414101843.2348330-1-andrew.cooper3@citrix.com>
 <20250414101843.2348330-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/LQ66Il45QxuqqrP"
Content-Disposition: inline
In-Reply-To: <20250414101843.2348330-3-andrew.cooper3@citrix.com>


--/LQ66Il45QxuqqrP
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Apr 2025 12:35:44 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 2/7] Overhaul how Argo is built and packged

On Mon, Apr 14, 2025 at 11:18:38AM +0100, Andrew Cooper wrote:
> --- a/scripts/build-linux.sh
> +++ b/scripts/build-linux.sh
> @@ -8,7 +8,7 @@ fi
>  set -ex -o pipefail
> =20
>  WORKDIR=3D"${PWD}"
> -COPYDIR=3D"${WORKDIR}/binaries/"
> +COPYDIR=3D"${WORKDIR}/binaries"

Is this change intentional? It has worse failure mode if "binaries" dir
wouldn't exist for some reason...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--/LQ66Il45QxuqqrP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmf85QAACgkQ24/THMrX
1yzCaAf/VCOS8gB09Qij6p0ubfIc5gZZPtu0pGc8NJfIOKGQaQ7JgIZXHHyvJl85
fTX+0pphIDVKJOe74+EDUgvftThE4DhzmWjZm8Qjj0WpdHeSxoDPy1v4tiE7Q3UF
aTixYrqnT+rtnSdbdJDagjxdzy1hF/jOXnJkineos6nwKGEhaoJk1XuwSqm+M+aV
ZbUcXEPAdRaUVEwE+NPX7mNdkMptwLQL6Tm5torlvAcLjNCe06BTo3/cMYRJG0eT
lxtz5Ybq63GOPfqp1+jU26mq29gIjoAmtDsMnJ6mRdsvWV7+ITTXcZ8n3BacT+up
bHqQ5Jy/fWzPxI0BcfiN6Qv5tjzBPg==
=llb9
-----END PGP SIGNATURE-----

--/LQ66Il45QxuqqrP--

