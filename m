Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B078362F2
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 13:18:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669807.1042249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRtFR-0002dS-NW; Mon, 22 Jan 2024 12:17:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669807.1042249; Mon, 22 Jan 2024 12:17:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRtFR-0002aU-Kn; Mon, 22 Jan 2024 12:17:53 +0000
Received: by outflank-mailman (input) for mailman id 669807;
 Mon, 22 Jan 2024 12:17:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aFsQ=JA=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rRtFP-0002Xh-DT
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 12:17:51 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fc17a61-b920-11ee-9b0f-b553b5be7939;
 Mon, 22 Jan 2024 13:17:48 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 095205C0175;
 Mon, 22 Jan 2024 07:17:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 22 Jan 2024 07:17:45 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Jan 2024 07:17:43 -0500 (EST)
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
X-Inumbo-ID: 3fc17a61-b920-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1705925865;
	 x=1706012265; bh=wjrkwsD//Kml8KghVFOG+dVpRLvVyUQ5qRNrd7aylkg=; b=
	AdhxowG1jYradTuxXQ5HZx8jZG63iK1pZ3u+b92h3zKJ0wgYLy1I3JIbpUi7CRrn
	b8kJOo+f74UIHWkI1OwDcfG7WYLZSD0CEmGCsZDK3baMuVHB6sn6uSGBrbB9VDc6
	QZRvjLfS6tJ0nYHTnsSMBxvR5mqCO0K0VhQd3e1w2mgL5ao2C0Hl7/FnFByvvNE8
	J3QSLjSx5Dcn7+Mt4i6vUhRR9EeAZtcCfmLtQgFTQk8zWRth5KYb46U5JHMs9nO1
	gTQYhaR/nGfdX+RnLesxKztWJ1Zd5cwqN7QTxH4mbLOLYEXL+H6mUoQWDKTXWzDf
	qjGUpt9x6QmwQAbeQtDCtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1705925865; x=1706012265; bh=wjrkwsD//Kml8KghVFOG+dVpRLvV
	yUQ5qRNrd7aylkg=; b=tFoZVXa9+omN3ALY97pK08Rdkj1V2oUwUb4AjMqZNpFi
	Blrat3I2iTuswkbsHf0OWXXhec0MyPQM2ZVgvetztfn8aS7470+GebUu2cRbWruP
	VYBNOSzFaZPSj63K2kcgtyzRMkmw5AaYCYuTlbN3kTwAXy/yk3io0YYN/M5F5FNX
	9Q9meoEuwaLzAQoUp25X6q1pt6IuvqSGMp4brCM24nK+j8jrdP9e60ZhBfLkCNYm
	yy4SFT6gpOE1NI73wuNIzqKPpoCoR/RMidZygDHxZ4bVF6Ojz4E/x0GTNzEXamPM
	uWiOc3zyHKSr1rWG8E96PfuJufcZoRZ2b5bUvFsEJg==
X-ME-Sender: <xms:6FyuZSHbgsaoAbczTx8I9252kFEr5MISWwxvFFQ93m81bllgFsEZjQ>
    <xme:6FyuZTUP-f5HNeIMNeFl3Fg0GFSVemxIE2hs788iQT5hokMGMvb9BvOwuF6Ze97vz
    OZKceZtvpST0w>
X-ME-Received: <xmr:6FyuZcJv8UV2fQkYEZodWwgj1PRf4Y69zzpRTJ8DL07bAVNjvkG39ouv4E8K-Cpi8Wt2y311g0QcNkXUqAksv22p5193VGZjrQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdekiedgfeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:6FyuZcFN8Dnj5sC2flPCmj-e-DlOz9XqMT5cWfhl9I-xv3SIFQKQ5Q>
    <xmx:6FyuZYVFXNl_50mUr83Bkuo5q9FjUKNgc0StCR2QOT-fflN5F2ybpw>
    <xmx:6FyuZfOzQWCy7C5g5h8xcMq7eV7YFVgr793K0prtJL38Y6_emm-J0w>
    <xmx:6VyuZTfwgO8XJdtLUceuixW9I9wcOnJF5MccvOlCXq-d1IY9ze94vA>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 22 Jan 2024 13:17:41 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: George Dunlap <george.dunlap@cloud.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: Sketch of an idea for handling the "mixed workload" problem
Message-ID: <Za5c5pm9Qai82zvf@mail-itl>
References: <CA+zSX=Z904nF0yD1grRZc1miEOhdTHqAd4j-S1j8GY+1bo9COw@mail.gmail.com>
 <Za23cKyEOl1WTvhZ@itl-email>
 <CA+zSX=YNjVaGn8=kio=2iT8onHAP61pzP-dicMrr4pKJQ827gw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vLlQ3zIYsq/GZ1dK"
Content-Disposition: inline
In-Reply-To: <CA+zSX=YNjVaGn8=kio=2iT8onHAP61pzP-dicMrr4pKJQ827gw@mail.gmail.com>


--vLlQ3zIYsq/GZ1dK
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 22 Jan 2024 13:17:41 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: George Dunlap <george.dunlap@cloud.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: Sketch of an idea for handling the "mixed workload" problem

On Mon, Jan 22, 2024 at 11:54:14AM +0000, George Dunlap wrote:
> The other issue I have with this (and essentially where I got stuck
> developing credit2 in the first place) is testing: how do you ensure
> that it has the properties that you expect? =20

Audio is actually quite nice use case at this, since it's quite
sensitive for scheduling jitter. I think even a simple "PCI passthrough a
sound card and play/record something" should show results. Especially
you can measure how hard you can push the system (for example artificial
load in other domains) until it breaks.

> How do you develop a
> "regression test" to make sure that server-based workloads don't have
> issues in this sort of case?

For this I believe there are several benchmarking methods already,
starting with old trusty "Linux kernel build time".

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--vLlQ3zIYsq/GZ1dK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmWuXOYACgkQ24/THMrX
1yzjKAf/XztYiSO2yHgUmrbN1EhUuzdfsX9PTsgA0MiPySP6PrVixK52HxwRaeXU
YQ6IfiOzJiX9e9IwY73QIy/lMvoY3acIDi1PAAcWhe5xLB28aeRNANU4B0TISAFs
7pn26G7DuHTJl6cOUGKRRSJM/2yvoHLrBrB9g6nzT0gA6wuHZu3wffFA/zz3vPDe
JVGSf9tuekF4Op5NfK/CbdipDCcCv/1+VgxfrlHz7Z9tSCYIPLvLZ9ffbkDl13FM
W3rBMenhE3lcbkpH5qa4S2p9d9mF23nrdCWocIGdi9c0Pmkxai2NNwG0rEp81btQ
7d+OTTLT6R5C8BR0fDiyEz53Vm36RA==
=lehY
-----END PGP SIGNATURE-----

--vLlQ3zIYsq/GZ1dK--

