Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 598D2A40278
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2025 23:13:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894688.1303410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlbH8-0001nA-PJ; Fri, 21 Feb 2025 22:13:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894688.1303410; Fri, 21 Feb 2025 22:13:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlbH8-0001lC-MD; Fri, 21 Feb 2025 22:13:38 +0000
Received: by outflank-mailman (input) for mailman id 894688;
 Fri, 21 Feb 2025 22:13:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RpDQ=VM=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tlbH7-0001l6-40
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2025 22:13:37 +0000
Received: from fhigh-a1-smtp.messagingengine.com
 (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fc0bfe8-f0a1-11ef-9aaa-95dc52dad729;
 Fri, 21 Feb 2025 23:13:23 +0100 (CET)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 504E6114009D;
 Fri, 21 Feb 2025 17:13:21 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Fri, 21 Feb 2025 17:13:21 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Feb 2025 17:13:18 -0500 (EST)
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
X-Inumbo-ID: 0fc0bfe8-f0a1-11ef-9aaa-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1740176001;
	 x=1740262401; bh=SzvDcTmAdEHnVCClV63ARtttCzos+yWMcbHzCLeRhUE=; b=
	fm7DBUJJu3sRh5l1YKK/dpb9OMRIp3eUN6UgZmmop/KgWLLEbgURO4NsGzYwxl55
	5OQvvxubOtpg0sLNcp6nywYiBIhqnKaGBN6kBGGVTz4xp368kV2FCjJrh3IKC8D3
	vnwLEIxieJDOcDNrGxR8Qagu8fQy79xIROOmACXJPkLNlH4dgHp8gMhgPOXraggz
	/CynoSjkOo143oTkenrCn8ekiA7MMRzoj/9Dt91hoq1o66+olQJJsL8rlp8g08kp
	8HsmkUWQ1LXdAGLaXG8OdTnoVbYXupqv55vMCGMlZJagxggSkptB5gN1f6dBhdN7
	aB/xzya5GOHVgcdstKUlWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1740176001; x=1740262401; bh=SzvDcTmAdEHnVCClV63ARtttCzos+yWMcbH
	zCLeRhUE=; b=ykqsdyCroIcRJj5CqFsYr3oKNDLaZPnPkl/sIZWEX6qhOG8F7hL
	DDT5TCusVyfE1sbx2AX1zE2MqL9yGLR5nZMXgJgr3TBMfXBVjT4ht1ZoS9ZQ1sQj
	ZTbHXoI4dn3GaujaE/Ukr/cQ0/gJ3acppPLK9c+PX7Hys+SGEFTS0H+FLWscHFmr
	TkqqaqTIrFwc4MMh9nYf+xWCbZiTApSzESqiNKmzEbX4pcYl//1g8QqifNmjaVYU
	jLIma2ZTyPBgkzgYWNV5EwjmLWILq1kY/D5a8JTLMRFFDDJCzd+brhfwIgN326bk
	S9Ss13LWCPWhS9ffdS2xfGEwWAzEXA7jSsg==
X-ME-Sender: <xms:gPq4Z_Lg-3RUaLOkZVXP63as-S01uFO58E5WZdkSn3Z8YdDPsx4EUA>
    <xme:gPq4ZzJPZp6lcjxenOFyJNjRDs-5bUguchrag7guN08n4lEbb2DH5gpFX7vUyA8Aq
    OrYCzDDZTe2mw>
X-ME-Received: <xmr:gPq4Z3v8LrJ4sRSGhYQ6pLKuwcvXDB1B6ANqiCERJktFvKSICyrZAu9uEg-StnKSaMGAhR2t73uNxcUfQQqXS3jqlhXE0fD6yQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejuddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdej
    necuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoe
    hmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucgg
    tffrrghtthgvrhhnpefgudelteefvefhfeehieetleeihfejhfeludevteetkeevtedtvd
    egueetfeejudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpd
    hnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepughm
    khhhnhesphhrohhtohhnrdhmvgdprhgtphhtthhopehjsggvuhhlihgthhesshhushgvrd
    gtohhmpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtgho
    mhdprhgtphhtthhopegrnhhthhhonhihrdhpvghrrghrugesvhgrthgvshdrthgvtghhpd
    hrtghpthhtohepjhhulhhivghnseigvghnrdhorhhgpdhrtghpthhtohepmhhitghhrghl
    rdhorhiivghlsegrmhgurdgtohhmpdhrtghpthhtoheprhhoghgvrhdrphgruhestghith
    hrihigrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepughmuhhkhhhinhesfhhorhgurdgtohhm
X-ME-Proxy: <xmx:gPq4Z4ZuH8X6K-bZYXqIDNQ1NkJp3SQ-2qlL6uHtAMH6PtodMI5euQ>
    <xmx:gPq4Z2Y3en9zJZOx4N8SHRSic5EKYHYUfVYx2VtdmquoOlSnPokPiA>
    <xmx:gPq4Z8DWvRs35mlWleeYPDDeUQ_fEYU7DaKYFb9uGdBniqp8OKNz2w>
    <xmx:gPq4Z0aBYkql2dtkGPcxRynKw2jXww-aVTtS-tTjaRgSyejPySjWug>
    <xmx:gfq4ZzRvFT0V_HVX7RvdrrBpDp7WKafKlWrCZLaP5sSGSZw6G6HsLaCh>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 21 Feb 2025 23:13:15 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Denis Mukhin <dmkhn@proton.me>
Cc: Jan Beulich <jbeulich@suse.com>, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com,
	roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/console: make console buffer size configurable
Message-ID: <Z7j6fCtdGwDkFpB8@mail-itl>
References: <20250212222157.2974150-1-dmukhin@ford.com>
 <4203576f-0b93-4647-9983-e36c15fa1d0c@suse.com>
 <o_C90Tb8fjLMkG-pSNmxycIsYytdAxHSTU7yrudH07-h6L9e4XGirmyyKKSRQsLuOyYwA6b-9jd8kOOnM21yC8I-6q5EzcX2lsLHcbgGqec=@proton.me>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nYuEY7RgrI5yAn4E"
Content-Disposition: inline
In-Reply-To: <o_C90Tb8fjLMkG-pSNmxycIsYytdAxHSTU7yrudH07-h6L9e4XGirmyyKKSRQsLuOyYwA6b-9jd8kOOnM21yC8I-6q5EzcX2lsLHcbgGqec=@proton.me>


--nYuEY7RgrI5yAn4E
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Feb 2025 23:13:15 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Denis Mukhin <dmkhn@proton.me>
Cc: Jan Beulich <jbeulich@suse.com>, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com,
	roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/console: make console buffer size configurable

On Fri, Feb 21, 2025 at 08:52:47PM +0000, Denis Mukhin wrote:
> Also, since there's a build-time configuration parameter along with the b=
oot-time
> configuration, perhaps it makes sense to retire boot-time setting in favo=
r of
> build-time setting?

IMO boot time setting is still useful to have, to not require rebuilding
just if you want bigger buffer in some specific case.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--nYuEY7RgrI5yAn4E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAme4+nwACgkQ24/THMrX
1yxbnwf/XYwPMhnzuLBitHTLUH5j+MqoAzUEI74SCeati1POfw48jZhjFs/6qHJj
+AM/lMZKkaENw9fM8/xhrt9fXThRSUwyq3X9WN+OCIfF//tdwvNIExF2Nqkzcy1A
rGANZByYPa6dsxUQypJ2izSTSE/MeX8sxxmY4oc53NwHFZFhgRqgJPMV/5nw+P5J
hsNgZ4rUoqqk3jvi4Sfv3uN7gJA2PcpG/ZxQhdyB7u290wC66Wp56BNmlpMqKhZv
D/k1OG03OZVFhXsBFuSi4qNUU7Gyi714UIaxjPDJJZd52RV+URly/CUGruT7hHGl
5IUE6iaZjn1MuXVWvoG/1w2jYGG7JA==
=STQC
-----END PGP SIGNATURE-----

--nYuEY7RgrI5yAn4E--

