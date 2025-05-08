Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CA8AB047A
	for <lists+xen-devel@lfdr.de>; Thu,  8 May 2025 22:19:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979581.1366123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uD7ha-0005QK-UQ; Thu, 08 May 2025 20:18:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979581.1366123; Thu, 08 May 2025 20:18:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uD7ha-0005OE-RR; Thu, 08 May 2025 20:18:42 +0000
Received: by outflank-mailman (input) for mailman id 979581;
 Thu, 08 May 2025 20:18:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LuaF=XY=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uD7hZ-0005O8-5Y
 for xen-devel@lists.xenproject.org; Thu, 08 May 2025 20:18:41 +0000
Received: from fout-b3-smtp.messagingengine.com
 (fout-b3-smtp.messagingengine.com [202.12.124.146])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a02caff2-2c49-11f0-9eb4-5ba50f476ded;
 Thu, 08 May 2025 22:18:39 +0200 (CEST)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal
 [10.202.2.43])
 by mailfout.stl.internal (Postfix) with ESMTP id 22AC31140113;
 Thu,  8 May 2025 16:18:37 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Thu, 08 May 2025 16:18:37 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 May 2025 16:18:35 -0400 (EDT)
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
X-Inumbo-ID: a02caff2-2c49-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1746735516;
	 x=1746821916; bh=wZArqTjX+Eurv0Dg2HLUKLKT6iFfH7o4KhILEFsOljQ=; b=
	Q8FUVZjPNpJ/FzRuhxRBClb0f67nvWwOxsgWk464ePTbMUvdbNaWH4bpkwIRcf0Q
	2Rpjwa6xsRndSFNDvGXyx+52WLteIHu5Po+6EQTxQAIqJv5WmqfyzgeTUenRcyy3
	Ln4iq8kXIGfuk6o1kHMrTudvYmN+aiTkh0OxWcn9E+ZNCvvhJRCSCf8QlyVOraFU
	npY7oQYqQAP2Z7NeENfHOFpxL2nd8XgrpYK40cBUNp7lIkeUWFo/ePh2Eoo14cNU
	oMx1PRvstTIlLcrwL3m+kCjRLXRPx5ZDNpHLAgd+gpFJ3XSidPtGNvKF9DX5ipzq
	XM2yCKD0BJqkGrZEAMGenw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1746735516; x=1746821916; bh=wZArqTjX+Eurv0Dg2HLUKLKT6iFfH7o4KhI
	LEFsOljQ=; b=jccUf1CUoeM6UEb4wTf0VBNfTcmD4D47LyEkDRUhFUrfq0bgRai
	zDrKS3+pBWUeUOjByBw69gp+4dtbM/IFZhtGT4DDYt9UdiYM8TfzPEj9bNMpHfrS
	kEaKrj/Q4OFiIIjUsR4M6DBwZQhwVVkc6fZIcYRHMpc6jEOFokAnarU/t3EPVvG3
	Trtub5jjvQuJ3Z5PZ0vFcnrkFndviqYPZNWuKBANFFs7Wdh4iLR3SrR2SEzNbuQG
	I0/31CbLO4AaS31I3IRW0E9SYUxZJGWhLr6X/SOT+0e2Ba0wreieC5KCm0f+3zhM
	7O8PNcE5w/dK48uPE9CeiCsfEJqH9Ry36zw==
X-ME-Sender: <xms:nBEdaHnPIlC_bYI96CN1LdHRjW3ChCvJ-xMotF0KVw_BO7oNAWWmtg>
    <xme:nBEdaK0ou96bGd0kKjp7vUviQDMVx1ub-Bj7hbGYJotWi56FsUqCG6aBZbniOgJH6
    G7TbW28flO0QQ>
X-ME-Received: <xmr:nBEdaNoXGHlGyjIVFYTb48xXmXH5CoOnS2X0fgRZQlXAbK6Nzct1sGJWaTzZdK638jqt7CBHtTs2teJxT-zI6UV5hnmy233T6g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvledtieekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepieeluddvkeejueekhfffteegfeeiffefjeejvdeijedvgfejhe
    etuddvkeffudeinecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeekpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehjrghsohhnrdgrnhgurhihuhhksegrmhgurd
    gtohhmpdhrtghpthhtohepjhhgrhhoshhssehsuhhsvgdrtghomhdprhgtphhtthhopehs
    shhtrggsvghllhhinhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopeholhgvkhhsrg
    hnughrpghthihshhgthhgvnhhkohesvghprghmrdgtohhmpdhrtghpthhtohepsghorhhi
    shdrohhsthhrohhvshhkhiesohhrrggtlhgvrdgtohhmpdhrtghpthhtohepshhtrggslh
    gvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepgigvnhdquggvvhgvlhes
    lhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheplhhinhhugidqkh
    gvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:nBEdaPlvi4KRC4tv4lLTlMV_hqpE_T1IGWug6zNOQPErjCTxSHXkYw>
    <xmx:nBEdaF0nyD9BrSz_XTPP2Aqmxmlv6Rnr2AcvUrcOHXPgF5Cwpg7XhQ>
    <xmx:nBEdaOvsOGzjb0H97LHWtLnLhaAWfsnYZmclG4Sjo-FiYZbZ4gCgDw>
    <xmx:nBEdaJWTWd7y8X--VVeVxZFxXaHUlbrHtbGQT-twwze1620kr36ChQ>
    <xmx:nBEdaJ0OSP63Hruxr1kpsRopqL4z2qSkXOGt0bKjBPskzYvnnbf1tdzI>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 8 May 2025 22:18:32 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	stable@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xenbus: Use kref to track req lifetime
Message-ID: <aB0Rmd1PCxA_7Gch@mail-itl>
References: <20250506210935.5607-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qkJiPgqLCT4AW8qo"
Content-Disposition: inline
In-Reply-To: <20250506210935.5607-1-jason.andryuk@amd.com>


--qkJiPgqLCT4AW8qo
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 8 May 2025 22:18:32 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	stable@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xenbus: Use kref to track req lifetime

On Tue, May 06, 2025 at 05:09:33PM -0400, Jason Andryuk wrote:
> Marek reported seeing a NULL pointer fault in the xenbus_thread
> callstack:
> BUG: kernel NULL pointer dereference, address: 0000000000000000
> RIP: e030:__wake_up_common+0x4c/0x180
> Call Trace:
>  <TASK>
>  __wake_up_common_lock+0x82/0xd0
>  process_msg+0x18e/0x2f0
>  xenbus_thread+0x165/0x1c0
>=20
> process_msg+0x18e is req->cb(req).  req->cb is set to xs_wake_up(), a
> thin wrapper around wake_up(), or xenbus_dev_queue_reply().  It seems
> like it was xs_wake_up() in this case.
>=20
> It seems like req may have woken up the xs_wait_for_reply(), which
> kfree()ed the req.  When xenbus_thread resumes, it faults on the zero-ed
> data.
>=20
> Linux Device Drivers 2nd edition states:
> "Normally, a wake_up call can cause an immediate reschedule to happen,
> meaning that other processes might run before wake_up returns."
> ... which would match the behaviour observed.
>=20
> Change to keeping two krefs on each request.  One for the caller, and
> one for xenbus_thread.  Each will kref_put() when finished, and the last
> will free it.
>=20
> This use of kref matches the description in
> Documentation/core-api/kref.rst
>=20
> Link: https://lore.kernel.org/xen-devel/ZO0WrR5J0xuwDIxW@mail-itl/
> Reported-by: "Marek Marczykowski-G=C3=B3recki" <marmarek@invisiblethingsl=
ab.com>
> Fixes: fd8aa9095a95 ("xen: optimize xenbus driver for multiple concurrent=
 xenstore accesses")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> Kinda RFC-ish as I don't know if it fixes Marek's issue.  This does seem
> like the correct approach if we are seeing req free()ed out from under
> xenbus_thread.

Thanks for the patch! I don't have easy way to test if it definitely
fixes the issues (due to poor reproduction rate), but it looks very
likely. I did run it through our CI and at least there it didn't crash
(but again, it doesn't happen often).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--qkJiPgqLCT4AW8qo
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmgdEZkACgkQ24/THMrX
1yz5FAgAhQUkBLIS6ba26NE9OtI7whD/OKYYKBosqmstTcpUark0KVM6gkGx/JNN
g7NFpvp/LeozFs+J/Ol27sqhCdUIFoFo4OGL31gR9riNimt2xG7xOfmv09376fjo
3UbYN0R9tXzr56c3jL2y2k1fNi4+K0udX6eYKz8YsLytYvt+TrUGVFAPl2HqC09Y
uMQaRfwGVq53kcfHDO7HAcP9Xi/Igc4ucyZ5fNk9RzlDAFK2VktYF3OcsLT3sZcs
dEkMZA3uAJl+PSCcMmQ7WwmyF06sYllkeGmMQ2dQL/OAWICUCfr7jv24Sh0m7kTx
abAMG7wNfu45kMbQtkK3yehIOllexQ==
=mAy6
-----END PGP SIGNATURE-----

--qkJiPgqLCT4AW8qo--

