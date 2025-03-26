Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 344B9A717F0
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 14:59:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927843.1330600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txRI5-0003pp-Ip; Wed, 26 Mar 2025 13:59:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927843.1330600; Wed, 26 Mar 2025 13:59:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txRI5-0003nF-Fw; Wed, 26 Mar 2025 13:59:33 +0000
Received: by outflank-mailman (input) for mailman id 927843;
 Wed, 26 Mar 2025 13:59:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PxEH=WN=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1txRI3-0003n2-TT
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 13:59:31 +0000
Received: from fout-b8-smtp.messagingengine.com
 (fout-b8-smtp.messagingengine.com [202.12.124.151])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86edeeb9-0a4a-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 14:59:26 +0100 (CET)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal
 [10.202.2.47])
 by mailfout.stl.internal (Postfix) with ESMTP id C202D1140160;
 Wed, 26 Mar 2025 09:59:24 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-07.internal (MEProxy); Wed, 26 Mar 2025 09:59:25 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Mar 2025 09:59:22 -0400 (EDT)
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
X-Inumbo-ID: 86edeeb9-0a4a-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1742997564;
	 x=1743083964; bh=W/FX7ohQ/5ZT9nYAekaJAdnJKpms/fZaHpPLyQzp93w=; b=
	uVa0g5LVgh+F1eNrk9m0NUqrXQ70cmnNeRNBHH7beItib9C+Xl46FuCK7aCBpnfQ
	KeWWCrTGxe8dUsZ1ktGsvfehPgNubudVQJJE612wtT79hOJNSsB5XDXX01ECErJC
	E0IKvXxwFIr47k2R5lubsSmSE60mv5OSQDuvGkHbigc42Ln+nu4RDZph5GTtR/I/
	4ckUsiT0lePbPvXGIOMvR7QLTlHNyFzLJOUzpnJGByixn5x6KiHsBa1ob8ANB/3a
	ouCtfcnO8Whbn6xWBT7TQ7I1NvBgY0fkWH109mxa/5ILDfnzyFd2+o9P6hye+WGv
	+03aKYBIZzSi5lRhZP+1PQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1742997564; x=1743083964; bh=W/FX7ohQ/5ZT9nYAekaJAdnJKpms/fZaHpP
	LyQzp93w=; b=trFMnLljfShmShB156yjl/TNED8011EgPTTNDJmYz2JfraLYTY1
	0ez3ow8eCp8tlFD8Fq7GoekRqEBuoCgSFq+Zt7dtzoX0/fU6H2lAgu44uBxjy7AG
	hmh1MJpdWiv+wGjgG/2lSBGmTxbF8j9qJJ6LwXITqW3V8lQMOvhLgFA31v3jBPT/
	p7lemuHlLLQXLnLeJo96QLqYPcsE+lKliyWIkI2jbQFOAac8xeTGoclaZEgJXrA8
	REQ9Ib8yLJ8yR8T5L4uxaI+mV7pKG3MZAqMth0OkfqMZVCpquUDaUVVfJTJ+3ekv
	c6RS355TtBkWP1OVl7KP+CBciTv5nuSvrOw==
X-ME-Sender: <xms:PAjkZyJIRTuBWC8x439dw_omlc6C88A__b2tDKL1W3ENa3K1ITXKWQ>
    <xme:PAjkZ6JenL51I2Axecz_Wca5C9q8CXSCfd2Ugml4n-riEwGyONXi_DLD6lb3EwbJW
    2oxmyUEBLCrgA>
X-ME-Received: <xmr:PAjkZysvUlYK3Zp0bpaDDNK-Aj8qwO6gygYEjZ41FN2Jfzv4NDO7F2ZFgGve7h_919Avj2XeJyfsdyOjq4-IKfOY46ZEvPpv3w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieehjeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepueekteetgefggfekudehteegieeljeejieeihfejgeevhfetgf
    fgteeuteetueetnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeelpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopegrlhgvjhgrnhgurhhordhvrghllhgvjhhose
    gtlhhouhgurdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigv
    nhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefse
    gtihhtrhhigidrtghomhdprhgtphhtthhopegrnhhthhhonhihrdhpvghrrghrugesvhgr
    thgvshdrthgvtghhpdhrtghpthhtohepmhhitghhrghlrdhorhiivghlsegrmhgurdgtoh
    hmpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdprhgtphhtthhopehj
    uhhlihgvnhesgigvnhdrohhrghdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrh
    higidrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgvlhdrohhr
    gh
X-ME-Proxy: <xmx:PAjkZ3Yj5qH6-xubYF58N9m6sKapJxAuRX8Qc6tYUKuY2N1n9AAGxA>
    <xmx:PAjkZ5bh5PPbdRJ487w1SGDXvuDO-MoLau7zmkH3xRjTuhXu9N4x7w>
    <xmx:PAjkZzBtTwYgKoeYi3Wsrvc88k1QofAYZkXehXkqWpxoGkke6uEyJg>
    <xmx:PAjkZ_YuyMYDiwWymMqdVt_7sxKLqvfsCFZ071fvu9nbw6vESzYiAw>
    <xmx:PAjkZ7kNQ1ZVCUQve3ubVBhhw2rG5xQ68tWyQjRQJI8wH5Jd-wItqfPR>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 26 Mar 2025 14:59:20 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] tools: Remove support for qemu-trad's battery reporting
Message-ID: <Z-QIOJax7of-y79f@mail-itl>
References: <20250325174110.467-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9JNzTgQ/l6L/ioVg"
Content-Disposition: inline
In-Reply-To: <20250325174110.467-1-alejandro.vallejo@cloud.com>


--9JNzTgQ/l6L/ioVg
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Mar 2025 14:59:20 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] tools: Remove support for qemu-trad's battery reporting

On Tue, Mar 25, 2025 at 05:41:10PM +0000, Alejandro Vallejo wrote:
> The way this undocumented feature works is via qemu-trad (who nobody
> uses anymore), by intercepting 3 magic PIOs. 0x88 is one of them, and
> it's probed by hvmloader as a means of detecting support for this (so,
> on qemu-upstream this check always fails). If hvmloader detects the
> feature, it appends an SSDT with AML inherited from some laptop ~20y
> ago. QEMU then communicates with a userspace daemon (xenpmd) via an
> undocumented xenstore key ("refreshbatterystatus") in order to report
> battery levels.
>=20
> Seeing how no one uses, mantains or cares about qemu-trad anymore, rip
> it all out. The hvmloader check, the SSDT generation logic and xenpmd.

Oh, I didn't know something like this existed!
We needed a feature like this, and solved it via extra kernel module +
PV-like interface to feed it with data from dom0:
https://github.com/QubesOS/qubes-dummy-psu/

I guess it doesn't make much sense for me to resurrect the old interface
and bring it to QEMU upstream, as I need the battery info in PVH too.
So, I'm fine with removing it as is.

> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
> If this feature is truly wanted, it must be implemented in
> qemu-upstream. Ideally in a MUCH less roundabout way. And definitely
> without involving xenstore.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--9JNzTgQ/l6L/ioVg
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmfkCDgACgkQ24/THMrX
1yxfzQf/cxFSm5+S81Qzk3jIpmox5DoY0f2/owTtjiHoTLFJQQhPiTbq8fiY/H/8
y0fG8L+wMIP4RnRZXa6NmI9m5ZzMxk7RVGCvlVahhCqrfHSviIY85soQAVREP8DS
hnSRCvlu6YCxWAwGFqpXV4fx3dbiakzZ+tITw1QFngDUth3YjNfeSMNTtxJ/l6dr
BcmRPwcvePQfti/sN21jC9uZhA+JBCYcg4zDgxZer2lOaY0hEg+/IIYaMatZzRqs
QTVDgf92yML1M3/4LjnbH8f3YGjb6A1Mu2BAWMfpn66ogwgK7neDdnXay+EZpmn+
5Qfcfq/Jc4X7RkCpTzQt1nMFS23lmA==
=FuQg
-----END PGP SIGNATURE-----

--9JNzTgQ/l6L/ioVg--

