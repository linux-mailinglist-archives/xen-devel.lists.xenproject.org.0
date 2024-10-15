Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DC499EAE8
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2024 15:00:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819177.1232468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0h9S-0006VK-Sc; Tue, 15 Oct 2024 12:59:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819177.1232468; Tue, 15 Oct 2024 12:59:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0h9S-0006T4-Ob; Tue, 15 Oct 2024 12:59:50 +0000
Received: by outflank-mailman (input) for mailman id 819177;
 Tue, 15 Oct 2024 12:59:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dl/V=RL=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1t0h9R-0006Sy-St
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2024 12:59:50 +0000
Received: from fhigh-a7-smtp.messagingengine.com
 (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5aade90d-8af5-11ef-a0be-8be0dac302b0;
 Tue, 15 Oct 2024 14:59:47 +0200 (CEST)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal
 [10.202.2.43])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 04ADE11401B2;
 Tue, 15 Oct 2024 08:59:46 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Tue, 15 Oct 2024 08:59:46 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Oct 2024 08:59:44 -0400 (EDT)
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
X-Inumbo-ID: 5aade90d-8af5-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1728997186;
	 x=1729083586; bh=D+yPD3sJo6UcTsBjzbrUAo9lMQTGJBDkFSmL6ut468c=; b=
	NCXb6mtYCDWZMt9LUJGEaIQ9YEWDNmwZBfP6JkCiysLAh9bMGw6nmgQJWHvrieY/
	22VkMXb4f6rEEGlnMDXB3Fkl7MSwew00NZ991xbn+cnkS5ALX6FMagkYfG4LwFaO
	ndCqRCAeO9zhYyoBgn6Pp828GxRTWDC6LF9F1hs/8Dz8QuY+SMPkt2WkxMKb8kB/
	U/VqdZc1qTQRb4O/QLV5kx7S4C7QDne2wfD7ABAtn7Ex2xa252fBiiqOkNbv9qTA
	/fr37aGsnE52uAuxYhcKmq8/IULqZmlC0JR/9dOkq9HLWC98rmQJsT95AABJ7k2t
	tkxvws57LfC5chQUcWKjNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1728997186; x=1729083586; bh=D+yPD3sJo6UcTsBjzbrUAo9lMQTG
	JBDkFSmL6ut468c=; b=nEbgGTPXeXziUXRugREiWVaKcXTLYREbguWDoIsPSCUj
	8t7k2oOvkz5burQ42K4nI0rwSs0KOGf1qVmpMe7sQn2IGcSO9I5QuIytb7UAsHhz
	eBB7eCED7Lfj3eSJzZmtKXFdb2vexTYffeYed3d/sET6ZpyO+FahvKGA6F9c8+Ph
	wb/Q+XA6cYqCKAKlpmQSPInZUmHNRD0y+wo39P4EGcxbL/5AW+TtS1t6jvoeqMza
	takplwbk/vSijyZqAg6N6MRcZTbELPb8aAE/dYGMAvHgrJxXhs3laQxf86/ehmpF
	jobHAzykoHhBrVsA+poWMb7RPEweiVNpXr+vxy2w1A==
X-ME-Sender: <xms:QWcOZ5NFk4AoMSZxkKXvd5mPQS-kQSWe5AspAMfv0VxbhJF7cRj1dg>
    <xme:QWcOZ7_NsPSpK-fDjQIgotIEWYjX7xC_J-4-b7wu0rBkAe1LKQvpqHUs_chZCF-GO
    ffVVqWiOzuU6A>
X-ME-Received: <xmr:QWcOZ4SMlU1_I49jGte6nvXl9bCz4uLjZzLc8o7tIeWRkLxTlTS6vF2N_dptVYhsJr3BxJPPAkd53n0X4Kl3Kvb5mhelZsr9Cw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdegjedgheekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettddvge
    euteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnh
    gspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepfhhrvggu
    ihgrnhhordiiihhglhhiohestghlohhuugdrtghomhdprhgtphhtthhopeigvghnqdguvg
    hvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopeguphhs
    mhhithhhsegrphgvrhhtuhhsshholhhuthhiohhnshdrtghomhdprhgtphhtthhopehjsg
    gvuhhlihgthhesshhushgvrdgtohhmpdhrtghpthhtoheprghnughrvgifrdgtohhophgv
    rhefsegtihhtrhhigidrtghomhdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrh
    higidrtghomh
X-ME-Proxy: <xmx:QWcOZ1vYfqu5WD1133NW4BpTisKf6USRDZga0yBkfXlR5WvJkTLieQ>
    <xmx:QWcOZxeli5UNcffXIWKQqvDNKIihUY6sWgZqXvUnzeVGMF86IrQR2Q>
    <xmx:QWcOZx2R4sY_yHEclfR7dZcCg52YZMPUpUGTObCtU8v0MQ8V9yfS8Q>
    <xmx:QWcOZ99oMZx1uYyKLrGOgY5h8Uz2dlMJ0q3aEjkaVdPFy5Bv0LgTHg>
    <xmx:QWcOZ6HKkBgp_VgMNz42LF6SeoAwcP-d7HCw0zrnXyb4YbQFDluLAkGN>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 15 Oct 2024 14:59:42 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v10 0/2] x86/boot: Improve MBI2 structure check (was:
 Reduce assembly code)
Message-ID: <Zw5nPgJ8it9BsRv5@mail-itl>
References: <20241015082513.2477806-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fQOMTUCr/4DPAMZ/"
Content-Disposition: inline
In-Reply-To: <20241015082513.2477806-1-frediano.ziglio@cloud.com>


--fQOMTUCr/4DPAMZ/
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Oct 2024 14:59:42 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v10 0/2] x86/boot: Improve MBI2 structure check (was:
 Reduce assembly code)

On Tue, Oct 15, 2024 at 09:25:11AM +0100, Frediano Ziglio wrote:
> This series came from part of the work of removing duplications between
> boot code and rewriting part of code from assembly to C.

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> Changes since v1, more details in specific commits:
> - style updates;
> - comments and descriptions improvements;
> - other improvements.
>=20
> Changes since v2:
> - rebased on master, resolved conflicts;
> - add comment on trampoline section.
>=20
> Changes since v3:
> - changed new function name;
> - declare efi_multiboot2 in a separate header;
> - distinguish entry point from using magic number;
> - other minor changes (see commens in commits).
>=20
> Changes since v4:
> - rebase on staging;
> - set %fs and %gs as other segment registers;
> - style and other changes.
>=20
> Changes since v5:
> - fixed a typo.
>=20
> Changes since v6:
> - remove merged patch;
> - comment and style;
> - change some pointer checks to avoid overflows;
> - rename parse-mbi2.c to mbi2.c.
>=20
> Changes since v7:
> - removed merged parts;
> - add required stack alignment.
>=20
> Changes since v8:
> - added "Fixes:" line;
> - typo in commit message: Adler -> Alder;
> - add ".init" to mbi2.o;
> - reduce difference in Makefile.
>=20
> Changes since v9:
> - minor messages updates.
>=20
> Frediano Ziglio (2):
>   x86/boot: Align mbi2.c stack to 16 bytes
>   x86/boot: Improve MBI2 structure check
>=20
>  xen/arch/x86/efi/Makefile | 4 ++--
>  xen/arch/x86/efi/mbi2.c   | 7 +++++--
>  2 files changed, 7 insertions(+), 4 deletions(-)
>=20
> --=20
> 2.34.1
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--fQOMTUCr/4DPAMZ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmcOZz4ACgkQ24/THMrX
1yydTgf9HuAKSVicmQL6T29k74yc2lbAMJITP/y3vuszamugHBil7xzV7hs4hi5h
JiQczjoq6FsQ0V1HyzxWrYNcsyjTuclj2yr1GiO78L99eTRRWXKn7quNlLY7D17r
8Znd3I5f2M+0+lyJt6DMkIg8o/t/VVfoO1rxSjN/RR9r0TAXmGOkZCRY5VRPJZrB
7a9IvxgBeEUOhea2FnpTt3vZzDpIluq1104623rLG1QKiPzWOF6Gb7NXSqUYuKWV
Tqc+fxi2EdB5CxpjwS5WMmfHM/+uMkA3TRnl0LIKH1rrPI/vSlQeg4XBaBlOwbOS
EdRck1+FilNXEYJdn+1orcufS4yLEA==
=BI7J
-----END PGP SIGNATURE-----

--fQOMTUCr/4DPAMZ/--

