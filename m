Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A49AEB3513C
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 03:50:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093805.1449202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqioq-0000V8-R4; Tue, 26 Aug 2025 01:49:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093805.1449202; Tue, 26 Aug 2025 01:49:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqioq-0000Sg-OJ; Tue, 26 Aug 2025 01:49:52 +0000
Received: by outflank-mailman (input) for mailman id 1093805;
 Tue, 26 Aug 2025 01:49:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EpqW=3G=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uqiop-0000Sa-0a
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 01:49:51 +0000
Received: from fout-b2-smtp.messagingengine.com
 (fout-b2-smtp.messagingengine.com [202.12.124.145])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f26f7c42-821e-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 03:49:48 +0200 (CEST)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
 by mailfout.stl.internal (Postfix) with ESMTP id 0D0491D000BD;
 Mon, 25 Aug 2025 21:49:47 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-11.internal (MEProxy); Mon, 25 Aug 2025 21:49:47 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Aug 2025 21:49:45 -0400 (EDT)
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
X-Inumbo-ID: f26f7c42-821e-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1756172986; x=1756259386; bh=zW
	/szYVjxGxpfeH5evKixXehFIEwHg8GMfugR2/Z8gM=; b=oYBaYBzVm1yB6gncHV
	oz1fnsZyEEaaDM4H5WTS5raF8pD7teo0bUiuB32nNybqrghWGQA8ESWRYA/BPEi3
	qScBHm3BySJvwVvfVy8gyNb3IvLj1oNjtIgzf1jcXXGRqIGUQj/7ovMlnBou1R/c
	pGV3+RCC18lQb/5vogVH2GoCw4uhIr+coioTI6aRtTn/FiCRDFwmJozE8BdgVA4W
	AaLy3BlFVC2VXe7jO+TIZ3c/RyVQ1vgd1Ja67DQdJ6C9M+AN7OZKpr8ArW67CTTk
	RVIFtCjkd9HaipSEEdnK2X3EKreLl5C6GO9t7H/RKNeMWmVY5Q/MAd0m30DV7imk
	EW3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1756172986; x=
	1756259386; bh=zW/szYVjxGxpfeH5evKixXehFIEwHg8GMfugR2/Z8gM=; b=k
	IGdspNOm+EN+CuFD/ibV3J6qOMbd0GYXEEYdOC1Q95bl6tzR/skKTRVB1K0xMnov
	HSid3p7obfXjoJq+9Ez0PQhkzG0SIID5opD7w4vt0wxOldfFh4jEZm9hh4YOGt62
	x5tnh+KPZekIh4nTG0xpP3/Tl/F0q0FhxAe42U4VyZa9Yw33v9JF+Win80D41YLO
	NEU8qTFh+uyIRtAUZE54qsIS57EDXU7OMjnnWtPB+WYBVbJdh3kFZqrKK1ewav9V
	5Mg31mOOfFY7213YECjGBppbMPbm2B6hS96xf14Zq6XcZNt5y0r+SuOY9GdNazn0
	UmqAvdUmhzNubnQyakPRw==
X-ME-Sender: <xms:uhKtaAOHjDCSVY8Vym-fUARb9Rje4C6-qZ5dD2GVolnaT359mT1J6A>
    <xme:uhKtaHIkLzJlXiuO1YKi3dzkBRrftkqmBVtKDlEbFUOWx825w3_PKnU78zXdbmI-a
    st6O09TJ-batQ>
X-ME-Received: <xmr:uhKtaJE5w1V5zSTNbm-u_C7mKcnDKxT1EH0nNtHXPt5NM-Ce0RHeVm5siakLQriLmdrMmHaDjAnp84RnZdQNF-OhMDYVoDu-2a4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddujeefleelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkgggtugesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgr
    rhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhephfetuefhiefg
    tddtlefggffggeevhedtvdefffeugfeiieeiheefteefgefggeejnecuffhomhgrihhnpe
    hgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
    gtohhmpdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    peigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtph
    htthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomh
X-ME-Proxy: <xmx:uhKtaHRGSqNAA2GV3KXlb6HX0oBwFVladQCu-s4uMHNlNxZArQmg5g>
    <xmx:uhKtaNEidGovcbhblZl5rGxJTTxSVb6H74PDDKs76rejJjAviPWp0A>
    <xmx:uhKtaL9L-9zIMWQclz_L70pTVICUTKTw3T_vf7eOm_KLm4txNQnQ4Q>
    <xmx:uhKtaPLR8gS7Fh-z12Ad7xGMUiuuZYpg0wCe5Y4tikT_nnOZWkVFkA>
    <xmx:uhKtaM0E7tfC4cggEbdZGZf0yOsD6J54jRYIH8Cv8rSxQ1tWLwxhFQAX>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 26 Aug 2025 03:49:43 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: MSI-X cleanup(?) issue with passthrough after domU restart
Message-ID: <aK0St0oUkJzR9lO0@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="k7vqmfkeGtKK+j9s"
Content-Disposition: inline


--k7vqmfkeGtKK+j9s
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 Aug 2025 03:49:43 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: MSI-X cleanup(?) issue with passthrough after domU restart

Hi,

I'm hitting an MSI-X issue after rebooting the domU. The symptoms are
rather boring: on initial domU start the device (realtek eth card) works
fine, but after domU restart, the link doesn't come up (there is no
"Link is Up" message anymore). No errors from domU driver or Xen. I
tracked it down to MSI-X - if I force INTx (via pci=3Dnomsi on domU
cmdline) it works fine. Convincing the driver to poll instead of waiting
for an interrupt also workarounds the issue.

I noticed also some interrupts are not cleaned up on restart. The list
of MSIs in 'Q' debug key output grows:

    (XEN) 0000:03:00.0 - d22 - node -1  - MSIs < 41 42 43 44 45 46 47 >
    restart sys-net domU
    (XEN) 0000:03:00.0 - d24 - node -1  - MSIs < 41 42 43 44 45 46 47 48 >
    restart sys-net domU
    (XEN) 0000:03:00.0 - d26 - node -1  - MSIs < 41 42 43 44 45 46 47 48 49=
 >

and 'M' output is:

    (XEN)  MSI-X   41 vec=3Db1 lowest  edge   assert  log lowest dest=3D000=
00001 mask=3D1/H /1
    (XEN)  MSI-X   42 vec=3Db9 lowest  edge   assert  log lowest dest=3D000=
00004 mask=3D1/HG/1
    (XEN)  MSI-X   43 vec=3Dc1 lowest  edge   assert  log lowest dest=3D000=
00010 mask=3D1/HG/1
    (XEN)  MSI-X   44 vec=3Dd9 lowest  edge   assert  log lowest dest=3D000=
00001 mask=3D1/HG/1
    (XEN)  MSI-X   45 vec=3De1 lowest  edge   assert  log lowest dest=3D000=
00001 mask=3D1/HG/1
    (XEN)  MSI-X   46 vec=3De9 lowest  edge   assert  log lowest dest=3D000=
00040 mask=3D1/HG/1
    (XEN)  MSI-X   47 vec=3D32 lowest  edge   assert  log lowest dest=3D000=
00004 mask=3D1/HG/1
    (XEN)  MSI-X   48 vec=3D3a lowest  edge   assert  log lowest dest=3D000=
00040 mask=3D1/HG/1
    (XEN)  MSI-X   49 vec=3D42 lowest  edge   assert  log lowest dest=3D000=
00010 mask=3D1/ G/1

And also, after starting and stopping the domU, `xl pci-assignable-remove 0=
3:00.0`
makes pciback to complain:

    [ 1180.919874] pciback 0000:03:00.0: xen_pciback: MSI-X release failed =
(-16)

This is all running on Xen 4.19.3, but I don't see much changes in this
area since then.

Some more info collected at https://github.com/QubesOS/qubes-issues/issues/=
9335

My question is: what should be responsible for this cleanup on domain
destroy? Xen, or maybe device model (which is QEMU in stubdomain here)?
I see some cleanup (apparently not enough) happening via QEMU when the
domU driver is unloaded, but logically correct cleanup shouldn't depend
on correct domU operation...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--k7vqmfkeGtKK+j9s
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmitErcACgkQ24/THMrX
1yw/AQf/S8N23ucod684RxL+Zs54rJxwit7YotZ5B5cRPqAwGv3S+0eIzIPmmiWC
7m+TmDJM6GtXF8/LA+T3oGmruA0BT/RXFoHhKndDJVZC8eKfvYqttP25zqnVunmc
nq/wv4QdyVvF9vRy35pnqvveC4af7E/uPF70AXh5OmXNrji0KCGk1DZlkmKLF25q
k2GjkHsgEHEqX47iCRY4oKtvkkSbPor2AUmw995CbqlDXnt1J9K1M3UkNqpu+D3b
3vwNLPAJKjDtkwi8nYOrGYPANTy6mw78uQ3xPEF//v63ZPU3eWa7y6EdpXjHvqMV
95v4a5k20e1izD+0HQRb80N/VoASuQ==
=KKt0
-----END PGP SIGNATURE-----

--k7vqmfkeGtKK+j9s--

