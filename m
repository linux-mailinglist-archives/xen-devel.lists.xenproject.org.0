Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E97D890BC52
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 22:47:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742616.1149452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJJFA-0000h4-J2; Mon, 17 Jun 2024 20:46:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742616.1149452; Mon, 17 Jun 2024 20:46:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJJFA-0000eV-G4; Mon, 17 Jun 2024 20:46:24 +0000
Received: by outflank-mailman (input) for mailman id 742616;
 Mon, 17 Jun 2024 20:46:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BQ9S=NT=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sJJF9-0000e9-Ib
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 20:46:23 +0000
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com
 [103.168.172.149]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a64ba5e1-2cea-11ef-90a3-e314d9c70b13;
 Mon, 17 Jun 2024 22:46:20 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailfout.nyi.internal (Postfix) with ESMTP id BD62813800E2;
 Mon, 17 Jun 2024 16:46:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 17 Jun 2024 16:46:18 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Jun 2024 16:46:15 -0400 (EDT)
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
X-Inumbo-ID: a64ba5e1-2cea-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1718657178;
	 x=1718743578; bh=+KIGKt3L+2xGLRMAjC07BGnH/n0I2J6DSDMjl2wShMw=; b=
	f9B3pVOAOSQ3slBOgF5ZqBkD7Yz9+nMxVf6RSRnUTkPpP4rXVgZTVQfPLynzXAVM
	SpRG/GF4sUy9wc6FkIXknPaag/cqsAW+SUZVOpJ0OrFhjAduuLw4SyXc5NIFg49c
	zMe17Uf8C5Dsy6e/1KJrrLoYtpOUOWuHWvwlLjJ7MRbi+YfqaBhghol/wXLA1AIU
	K6R3TlfNwmd/LQ0YfiiF9RHD1pqu5l3ZSr1EHipYfLua1SCp1baGVNhvpxsuJuq5
	UVT9vZgBFbdhzwVILCjEGj6IxxxLGTtn4rnTTKM+fmZV9u0b6IKoC/UjtMZanU0v
	2ZCdZex4TOzhKuiwjbuaZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1718657178; x=1718743578; bh=+KIGKt3L+2xGLRMAjC07BGnH/n0I
	2J6DSDMjl2wShMw=; b=nONttP2/Irx7cZ9/mn6X4T5mlolhyFXaSbzRhC9D6siV
	h0PLUKO7135lLLilsIViBboyeKCJcSXiSgtiaXkSurflYOiLtscI5iQWs3NcC00u
	xj36aoO0gXUyxtTtng69uRywEqHlnGUvN6tOoHR4up9Pewv+P3pPr0yaVEHDJQyz
	XXARIaworkn4eqAWS6wvmf3CAOKkWD7sMobKmUX4oOCoOtAlIofYiU9wXHzgbauY
	H0pFlxKMMC3osrrPLxPEwXVJdlUsMSSAto44yYDUU9WD0qywh2P7/PiOGgTMPmwd
	+qKLAigEK3e/mXxtzY7pRVa78PZTvEKMkiYbBfCNag==
X-ME-Sender: <xms:mqBwZjsU9oi0g7ZOJzofngkZt5LnJtm6aTOSPg-3x2W4AStomO6O_Q>
    <xme:mqBwZke7TX_YdMuDOHZ1C3-49b0p3VDC1d_wpKwP0NtLG6ZqZo_TL4ZizQpBJ1IHx
    o6clkuB1HAsKw>
X-ME-Received: <xmr:mqBwZmzfLjlkmlQa4XUqjvnDHIeImmsVSditHvFgn0iPE0t8tSw9IuIEfR8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvhedgudehfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtdorredttdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedt
    tedvhfekudetvdelffeguedtkeethfethfffhfefteeghfeigeelvddttdektdenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:mqBwZiOVI1oq8Hb6dsrU0f8U3AwyIM-QFm0HUUIBlhJ9jLBZhQoJNg>
    <xmx:mqBwZj-2q2sHejWxfd7dSZqWaF-lcNcUKR9cCMcPE7xoZFsN67zIyA>
    <xmx:mqBwZiXP00JcyCPhOFHLc7khZJH9UQbDG5W6IR7Saw-ZPP7Q9a4pAA>
    <xmx:mqBwZkcCBD-xtkDwrZWIfdCJufPTmU3FnGFQrkmdQKE-DFkNDhg78A>
    <xmx:mqBwZjz-zKgHlDLARfdfPnVU0YWUJ62kWHn384uNi9nPkosymHoL0D6w>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 17 Jun 2024 22:46:13 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>,
	Ray Huang <ray.huang@amd.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Design session notes: GPU acceleration in Xen
Message-ID: <ZnCglhYlXmRPBZXE@mail-itl>
References: <Zms9tjtg06kKtI_8@itl-email>
 <440d6444-3b02-4756-a4fa-02aae3b24b14@suse.com>
 <ZmvvlF0gpqFB7UC9@macbook>
 <af1f966b-b28f-4a14-b932-3f1523adeff0@suse.com>
 <ZmwByZnn5vKcVLKI@macbook>
 <Zm-FidjSK3mOieSC@itl-email>
 <Zm_p1QvoZcjQ4gBa@macbook>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yIH0d/1pE7yrflk9"
Content-Disposition: inline
In-Reply-To: <Zm_p1QvoZcjQ4gBa@macbook>


--yIH0d/1pE7yrflk9
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Jun 2024 22:46:13 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>,
	Ray Huang <ray.huang@amd.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Design session notes: GPU acceleration in Xen

On Mon, Jun 17, 2024 at 09:46:29AM +0200, Roger Pau Monn=C3=A9 wrote:
> On Sun, Jun 16, 2024 at 08:38:19PM -0400, Demi Marie Obenour wrote:
> > In both cases, the device physical
> > addresses are identical to dom0=E2=80=99s physical addresses.
>=20
> Yes, but a PV dom0 physical address space can be very scattered.
>=20
> IIRC there's an hypercall to request physically contiguous memory for
> PV, but you don't want to be using that every time you allocate a
> buffer (not sure it would support the sizes needed by the GPU
> anyway).

Indeed that isn't going to fly. In older Qubes versions we had PV
sys-net with PCI passthrough for a network card. After some uptime it
was basically impossible to restart and still have enough contagious
memory for a network driver, and there it was about _much_ smaller
buffers, like 2M or 4M. At least not without shutting down a lot more
things to free some more memory.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--yIH0d/1pE7yrflk9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmZwoJYACgkQ24/THMrX
1yxKvwf9Guw4aqpy5v+VhCgQ95lk7MKJmp79thklrahi/8YDVryBuwVd+hfJnCCK
HGyoahndaV0k2kZK77lkDtayP1Vyeg0WCWeLDr8hgIykdaupN4A/9Ep0iiTpDyn1
1e/Isroc9Wxt7/1HPqDOSVc8hU5hI2ccTVuNdyUUzK5Ps3rVpINIr7xSdY3NNYTn
5fKYnGrGb7fJjczCgPlGwvK2wDiLKeI+gC8NRQrS3QeLsEowEckMDMFmzhymfqDA
/RKfGj9hGf7ehhKZ8Zr/jV7qztUtWXRnMg4Ozp4CVs87fPFWjp/Kg/eW7vJrr7ov
/3QAzzB5RpII+3AH0O6XUIO5cpGIgw==
=/1j1
-----END PGP SIGNATURE-----

--yIH0d/1pE7yrflk9--

