Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B781C70540
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 18:09:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166179.1492785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLlfg-0001rA-84; Wed, 19 Nov 2025 17:08:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166179.1492785; Wed, 19 Nov 2025 17:08:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLlfg-0001pN-5D; Wed, 19 Nov 2025 17:08:44 +0000
Received: by outflank-mailman (input) for mailman id 1166179;
 Wed, 19 Nov 2025 17:08:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G5Pp=53=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vLlfe-0001pH-4R
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 17:08:42 +0000
Received: from fout-b1-smtp.messagingengine.com
 (fout-b1-smtp.messagingengine.com [202.12.124.144])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6284ca81-c56a-11f0-980a-7dc792cee155;
 Wed, 19 Nov 2025 18:08:37 +0100 (CET)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfout.stl.internal (Postfix) with ESMTP id 236281D00176;
 Wed, 19 Nov 2025 12:08:35 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Wed, 19 Nov 2025 12:08:35 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Nov 2025 12:08:32 -0500 (EST)
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
X-Inumbo-ID: 6284ca81-c56a-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1763572114;
	 x=1763658514; bh=mDpgXtaCN+orxNRhmcjmJ7cvGHaNrOgIkQZfa3C8Zj4=; b=
	lrbpnjXTEM7PX1DCC8o1t/mTWv3f95vyXHhyOekLypyySZFwVNdG53PwB0CGdDWW
	iaoacghGxG8Y7C52oeT5IOzRY9nLFa7c59FnfMm/yerRePwSBgVkH8lp5yqVCMnw
	PMza1z+gQizqGR8Kc4m5yaSeUKC96RZUBSEOoCw7yS8nKQqIeVqncWhVwjQn7cCa
	wYGAuSrDv0tsjfvLVNRw4vzJzS31AQLq9X9YRsQQ+pY9cYpYXqwXKc9J2qHFqTuR
	05Tge1qTOg5EMEa3Xwze9fIMNknxlIKtosCj2aKWaCCYvlvu3yBjlcvZWJpOYhFF
	rtIFBHXsLCX1Nn7oQkasQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1763572114; x=1763658514; bh=mDpgXtaCN+orxNRhmcjmJ7cvGHaNrOgIkQZ
	fa3C8Zj4=; b=WberbUE/A7zOyBKZ33Rc6HLy5t1ywN0QvsaHlqCUd/iPRKorFq9
	6Yc2Q8Qwb0s9SONwP+YQxr3+MligWTh6ggiiCvR66MNF9srUp++9VpcGkegGn91I
	r5Z0hx3m+TPdRMqLlXhYR6ei6v5vSpAVuVuc9e35tadYTh8HwTInmFgAHQQKAq0f
	Bxf1RhlMB9GraLYtcvDjiTGndI87zXZZBc2ZM6DBZlDKBIAhD2D8g4X+DzJjAvmj
	aMpkbaR1wsogG68m+P9nGRFI4lT/ehFixGBQ6NuwJPon2FYJbzSxGJpk7ApoIJuY
	XSoUN+dMM/9LtbCJwqSHov37S6MRqZXb6Jg==
X-ME-Sender: <xms:kvkdaXedrmGn2uOwN21Pp-ZHn6DNOZe58zuqsX9fcKb8I3gN5nL4dQ>
    <xme:kvkdaQ7pS3J-jO8NJLCrNoFKHUfRo6h7nCQBqrqkbcXmxAfIQ6drqNY9JAjUCL1nj
    rgy43gEe4ASlynP1Om6CvUfQh0hFYSDLWCCgyD5GPA7G-W5zA>
X-ME-Received: <xmr:kvkdaZIcFKJi3ra7KxZqJ_gdmtC8KElG90u334AWggzXvSEXA8VAUNfRu9x87T0J2O9mQBTUEteFHXwamPDIuBjiosB00D_oKF8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvvdegjeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleet
    feevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepudegpd
    hmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfees
    tghithhrihigrdgtohhmpdhrtghpthhtohepfhhrvgguugihjeejsehgmhgrihhlrdgtoh
    hmpdhrtghpthhtohepohhlvghkshhiihdrkhhurhhotghhkhhosehgmhgrihhlrdgtohhm
    pdhrtghpthhtohepfhhrvgguihgrnhhordiiihhglhhiohestghithhrihigrdgtohhmpd
    hrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdho
    rhhgpdhrtghpthhtohepfhhrvgguihgrnhhordiiihhglhhiohestghlohhuugdrtghomh
    dprhgtphhtthhopegrnhhthhhonhihrdhpvghrrghrugesvhgrthgvshdrthgvtghhpdhr
    tghpthhtohepmhhitghhrghlrdhorhiivghlsegrmhgurdgtohhmpdhrtghpthhtohepjh
    gsvghulhhitghhsehsuhhsvgdrtghomh
X-ME-Proxy: <xmx:kvkdaaWdUzfdFNQeMWDcgELukCB9bRDEYmRrLtFpG4V8x7pSGxK87w>
    <xmx:kvkdaVHlwjfwG8r5WA7n-P7r3yz9P_8xgKKhSvJuaHPz6CSxzjBuPQ>
    <xmx:kvkdaZ6ozBoKpx4aePWiHYOWZR2mtwkHIXvzErR48Yc7w87RZagBmQ>
    <xmx:kvkdabdSxaDJx2g3RtR_OYh-5nEul7-GfBeW2UY1ZOfQnGrB7HvLDw>
    <xmx:kvkdaRClgYp5yO4o60PqIdT54k-r_QR5YWX1Wa0ViNMdBDS75CTSw5Ve>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 19 Nov 2025 18:08:30 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Frediano Ziglio <freddy77@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Frediano Ziglio <frediano.ziglio@citrix.com>,
	xen-devel@lists.xenproject.org,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Demi Marie Obenour <demiobenour@gmail.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v8] xen: Strip xen.efi by default
Message-ID: <aR35jsEXBcV2uEFY@mail-itl>
References: <20251113154358.28704-1-frediano.ziglio@citrix.com>
 <6729f3d9-618c-4dcd-93f8-d02ca7cea017@gmail.com>
 <8f8a769d-95ea-4554-8ee0-d6247f583e37@citrix.com>
 <CAHt6W4eDDm-fNUB7W1Zgj+x-bkK2fxTB50C38T4Uy0_Ofy_cww@mail.gmail.com>
 <aR3dFPTeH4Wegodd@mail-itl>
 <38ba402c-6920-47f6-91d3-7b499c407c36@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="himx9ggVNJp+HM6G"
Content-Disposition: inline
In-Reply-To: <38ba402c-6920-47f6-91d3-7b499c407c36@citrix.com>


--himx9ggVNJp+HM6G
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Nov 2025 18:08:30 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Frediano Ziglio <freddy77@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Frediano Ziglio <frediano.ziglio@citrix.com>,
	xen-devel@lists.xenproject.org,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Demi Marie Obenour <demiobenour@gmail.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v8] xen: Strip xen.efi by default

On Wed, Nov 19, 2025 at 04:02:30PM +0000, Andrew Cooper wrote:
> Given it's now only 16.04 broken, how about simply excluding xen.efi
> with these broken toolchains?

That would mean adjusting README to say a newer binutils is required for
xen.efi, right? Then ofc we would need to figure out which version
specifically. FWIW Ubuntu 16.04 has 2.26 and Ubuntu 18.04 has 2.30.
Would raising required toolchain version (for some configuration here)
even accepted, especially if considered for backporting?

Alternatively, simply disable building xen.efi in CI on 16.04, and maybe
document as "known issue" pointing at toolchain bug? Result is very
similar, but might be more acceptable on the process side...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--himx9ggVNJp+HM6G
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmkd+Y4ACgkQ24/THMrX
1ywgnQf/RI6jbzFCKb3GmIGW5l9VaoZYxUsjs/bCn9fQvTkHWO9abOYjlfF6pmf1
JZUxHOl5oyGH4lRAdf3NTzpQBzVo9vbkkmZD57sUarSafPQ7Fe9ZGw2hnzdz0Uvw
guITmuLmPVEtCiHFCgNmS6hstZp2tdoxFSwOhAPCaTPZ95/1XptkoK5Lmwr2h3RQ
X4rgPQg8U+TME/s94/BWMJYsySrF0oV3hzgLbC6Va86HsEUCuK6zHeBEzVP2Fcvi
6l1IouFCQnp7WOV8h/6NK4kHgFrFJVBqJcZYr+snBA8XyT92noXPZbbbG29qtnT8
ECg37nK1KoSQOQePrj3K8+ClP59gHA==
=/X0a
-----END PGP SIGNATURE-----

--himx9ggVNJp+HM6G--

