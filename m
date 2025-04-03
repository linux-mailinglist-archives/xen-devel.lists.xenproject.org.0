Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C5CA7A2CF
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 14:26:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936767.1337933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0Jdg-0006D8-Uz; Thu, 03 Apr 2025 12:25:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936767.1337933; Thu, 03 Apr 2025 12:25:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0Jdg-0006Aw-QM; Thu, 03 Apr 2025 12:25:44 +0000
Received: by outflank-mailman (input) for mailman id 936767;
 Thu, 03 Apr 2025 12:25:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X4pi=WV=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u0Jdf-0006Aq-6W
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 12:25:43 +0000
Received: from fhigh-b4-smtp.messagingengine.com
 (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf1eae95-1086-11f0-9ffb-bf95429c2676;
 Thu, 03 Apr 2025 14:25:37 +0200 (CEST)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 27A4825401BD;
 Thu,  3 Apr 2025 08:25:36 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-11.internal (MEProxy); Thu, 03 Apr 2025 08:25:36 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Apr 2025 08:25:34 -0400 (EDT)
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
X-Inumbo-ID: bf1eae95-1086-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1743683136;
	 x=1743769536; bh=zgwlwTNzCGdH3NPWh11FkbzBozSDnxWC3ARCo8yyOWE=; b=
	AdSndEGCF42eQiNxOUZuRnxr3fTJpbrWkDW0FRED+gWedy7aXp86BJGkWwbcTBot
	ZUPpjW1tfpY2ZVN7McGZJ01RJJ8py8BPsltFDQfVYxD7xbEoyFF3RcvZBR5ixWSl
	nSOLDUDui0bQKPr2bSP8yfnuapV8sosEdMaIIxytWw58kZTlRdaa0r0lt6Obj3HZ
	HoS9KxvzLFxJ8DNfBoPaPgvMvaZ8CRsd2wQZoHIEbesRtkU7ODC8nxRVZzHXIJWu
	B4xic6Miti0/S1cYs+MLGcoWsmdeWQIz5LiZ+HGSM/wq6IOrDTzi7CqrClRCwXp3
	Ly3Rmt3QJ3E5B3gLXQIoIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1743683136; x=1743769536; bh=zgwlwTNzCGdH3NPWh11FkbzBozSDnxWC3AR
	Co8yyOWE=; b=umk23coZ0SlmfUhXM8KXJvrKzQXK5GCg2zgdeh7Ppc1OqgikOdQ
	dI64l1LP8uHWsmvH3hL75IahnzeTiISr/i3dMN/WJpd7xBZvKetAHFLT0jKihV+5
	G5bsdGPE4/CEQlDQzC4nMd0As88QRL8HHfHxd5W6JFYeGYgAHWG8ML4Fb2JXtcw+
	jNZTrUJ62CYRybRL5Ks7LtcqSSqdLt/+eKNK6tOcLEFwfhpOTGGXwHaEFA8nndsP
	/BFw5rrcLE1SEJENmIht9BxVQ9SQhvskRjfjfR6upvmh9bQmJQhMXXr11ck++eYr
	NWFhagBZIk3RuJEL8L3V57P/Aiv2JEjUq7g==
X-ME-Sender: <xms:P37uZ50uZMhwHBbP84-1gNLuaK-lkbDQneyM2LsgG-3eBtuoXd0qkA>
    <xme:P37uZwEDO7utwRX4C0z2zcH0P1NvLg3Aq-dkDcTr_fwPScAmw3NoueBvlj-Wd5B1w
    qCuIVTyGsPt9g>
X-ME-Received: <xmr:P37uZ56FH1d24wqUnKYFfwv1hU1U_V89xNSzAyQePwUGoD7qZo96iiqqci_P08vPrqhxyYOy7vENn4WY6py9-71_IADL5B6B7w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeekheehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettd
    dvgeeuteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    dpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgs
    vghulhhitghhsehsuhhsvgdrtghomhdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvg
    hrfeestghithhrihigrdgtohhmpdhrtghpthhtoheptggrrhguohgvsegtrghrughovgdr
    tghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhr
    gh
X-ME-Proxy: <xmx:P37uZ21EA-Fbh5xj5QRdna_2kDkzKz4llOspPnZTgVMwJyx5T1ViAA>
    <xmx:P37uZ8HUnZRhfdHl5lKA1okNBvC0lR9h5XrXb8Fdrw-4j9WmmWW5AQ>
    <xmx:P37uZ3-YKxWu5ubGYlu-jQDo88r2NTcJOmonK-oYSovsubE-CWv98g>
    <xmx:P37uZ5mZQ1h14TiYCbtmq3V3-PmobQnGlXsbtzpas302Kbj4mDhmgw>
    <xmx:P37uZx2KhALQNJBnfTMSmeyiY7bo-GhZbr6HyPC37D9gzg1giEjlHMVK>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 3 Apr 2025 14:25:32 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 02/11] ci: increase timeout for hw tests
Message-ID: <Z-5-PBcbtUOCSAiv@mail-itl>
References: <cover.59b4d1e66776c1e577aa5dd5460605dc6c240613.1743678257.git-series.marmarek@invisiblethingslab.com>
 <7578489af5c7df525d4c82231b68bbb7d955d2b4.1743678257.git-series.marmarek@invisiblethingslab.com>
 <9e4660fc-b78f-4323-8a1b-aca3d410edd3@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HpxtcURhaqsRspkz"
Content-Disposition: inline
In-Reply-To: <9e4660fc-b78f-4323-8a1b-aca3d410edd3@suse.com>


--HpxtcURhaqsRspkz
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 3 Apr 2025 14:25:32 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 02/11] ci: increase timeout for hw tests

On Thu, Apr 03, 2025 at 01:32:38PM +0200, Jan Beulich wrote:
> On 03.04.2025 13:04, Marek Marczykowski-G=C3=B3recki wrote:
> > It appears as sometimes it takes more time for Xen even start booting,
> > mostly due to firmware and fetching large boot files by grub. In some
> > jobs the current timeout is pretty close to the actual time needed, and
> > sometimes (rarely for now) test fails due to timeout expiring in the
> > middle of dom0 booting. This will be happening more often if the
> > initramfs will grow (and with more complex tests).
>=20
> With that, ...
>=20
> > This has been observed on some dom0pvh-hvm jobs, at least on runners hw3
> > and hw11.
> >=20
> > Increase the timeout by yet another 60s (up to 180s now).
>=20
> ... is this little a bump going to be sufficient? How about moving straig=
ht
> to 5min?

I don't like this, as many (most) actual failures are visible as timeout
(for example panic that prevents reaching Alpine prompt). One
improvement I can see is splitting this into two separate timeouts: one
before seeing the first line from Xen and then the second one for
reaching Alpine login prompt. The first one can be longer as its mostly
about firmware+fetching boot files and shouldn't hit on crashes (unless
a crash happen before printing anything on the console - but those are
rare).

> As to observed failing jobs - the PV Dom0 boot failure seen today looks to
> also be due to too short a timeout.

As responded on Matrix, I'm not so sure, there is over 1m wait after
"Built 1 zonelists, mobility grouping on.  Total pages: 8228487" line
=66rom dom0 (or a bit later, due to buffering by sed), while in successful
test next lines follow instantaneously.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--HpxtcURhaqsRspkz
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmfufjwACgkQ24/THMrX
1yxQfwf7B3erNxfwdP8M6xErtOisjCkENZOPtm63gUzStPJakX2qEqycfCGncf7D
4rfprv321vgK9+zO+/jl6QlwW3rpIKLlpt7koBSwDF1cvd761uZl7nCwcHXSI+t4
voHSxHB7PEWG8K4yDFwo0KyWc6ijQ3FWzoAzTnFECQXHc03W1GCHg/ewh8AycLM0
5gii3JUBFb4DAku+JyoirZY7VsfLG8yr2bbfW2BaukkpU0Vlj7+N37E1Gw6GZ9WO
FLv1cQKaJaTeWgk3TFhG8asmvOOplf0ocAdZimi8RjJtM4478OpYcEUw73otbuYh
NK7121JFR5L4FK7xLQEeBgIAsOMHaA==
=CnYR
-----END PGP SIGNATURE-----

--HpxtcURhaqsRspkz--

