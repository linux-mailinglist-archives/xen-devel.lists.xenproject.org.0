Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CH2PImD6uWlfQAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2026 02:05:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7802B4D40
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2026 02:05:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1256264.1550958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2fKi-0006ys-89; Wed, 18 Mar 2026 01:04:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256264.1550958; Wed, 18 Mar 2026 01:04:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2fKi-0006vj-1e; Wed, 18 Mar 2026 01:04:24 +0000
Received: by outflank-mailman (input) for mailman id 1256264;
 Wed, 18 Mar 2026 01:04:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JLcR=BS=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1w2fKh-0006vd-14
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2026 01:04:23 +0000
Received: from fhigh-b5-smtp.messagingengine.com
 (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5de16ec1-2266-11f1-9ccf-f158ae23cfc8;
 Wed, 18 Mar 2026 02:04:09 +0100 (CET)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 1B81E7A00F4;
 Tue, 17 Mar 2026 21:04:06 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Tue, 17 Mar 2026 21:04:07 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Mar 2026 21:04:04 -0400 (EDT)
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
X-Inumbo-ID: 5de16ec1-2266-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1773795846;
	 x=1773882246; bh=4E/oYgX7RURloo9ZVyizIvmsI1VUSG37wAU60yZqilk=; b=
	RO3GmVi0SdhFk06UixJH4AqPLRj/PdV9dJ5mtOY4ekJa1L8XjwNsaNANEIzGnSJZ
	KskdmWMR9eFQhAlbiRVozFwMJyH+Uo7I18TrTM7knMYTUpI73bLSiTriUcsk0ezU
	whQOPld5pz9eTDFs7kBdoeYGM1mIN5YjvU8qVUgmvFwuKEWB1MOpb1Xj7LqnRA7x
	QtxVwb8AiALNFx0SW3jEsvwsD2mQ+Q4WZ9othWdVM8CvL4abPYvgEi+nnmmqbjDj
	dhGEaB43Yv8WenXpxXhS7sUohCtgnRjK/QZvnK1B4BJlftN9pvk8vYPW/ZZvLWk7
	wghMVTfGw8bfd7xdTjcoVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1773795846; x=1773882246; bh=4E/oYgX7RURloo9ZVyizIvmsI1VUSG37wAU
	60yZqilk=; b=1OdEaaT1dAAO7ckBCOUAMZ80VgHA0mZIjqxzmqwLUg9GhLks2Z5
	TLYe/LvUlK4gmgIvHUItexA69FT1h9l0PLsjrE/UZgReNaKDFUxLC01BHqJShcZ0
	Sj9r31nrUPeSmneXL7tEMaJniFmS/9/2lymJk/jZ6nMVYoRm+BMI5QKu4ou/lN1U
	2BPoddZxqIuOf1d/5lqo47PS6m9EFuJDdtFFLzxQWtLYhWynNEk3kue2utmahk5c
	6HhGQRtEwemuO6/QsszzwXI2HAdEVQE0pekOht7JtgQjSxLN5Rvw8+nhOq5pqcpL
	Y7WyXQ5Xeq6l6ZsVbH4sMEyMRo8wCeOpZNQ==
X-ME-Sender: <xms:Bvq5aeretq2nWAevY-pemzmwp7gOBVmJoEY_g_aFs7CYH6BTEAG_4A>
    <xme:Bvq5afMFj-HoTU0jszuVm2K8qq7B5prq2mjl5s0vTQk0DgmMwl-YOvGM3AQ0zM95P
    RfbKC68KJM-1eTHD8pOf-hMiQ5JqoWF7GIOoHxhHfaBY6Pj>
X-ME-Received: <xmr:Bvq5aW2vX0aYrQxZHWrn0JCR20mFPoFXVTHJfwBZmr55RQCvV7BnrQIzaRUJcVY5MxDtK5uATgDzcfp536yjnGzhKm0jmTMQHHE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftddvjeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfffhfek
    veffudelleeggfelueevuefgkeegfeejgeeigfevveefkeelffffffdvnecuffhomhgrih
    hnpehvrghtvghsrdhtvggthhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrg
    gsrdgtohhmpdhnsggprhgtphhtthhopeelpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehtvgguugihrdgrshhtihgvsehvrghtvghsrdhtvggthhdprhgtphhtthhopeigvg
    hnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthho
    pegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtoheprg
    hnthhhohhnhidrphgvrhgrrhgusehvrghtvghsrdhtvggthhdprhgtphhtthhopehmihgt
    hhgrlhdrohhriigvlhesrghmugdrtghomhdprhgtphhtthhopehjsggvuhhlihgthhessh
    hushgvrdgtohhmpdhrtghpthhtohepjhhulhhivghnseigvghnrdhorhhgpdhrtghpthht
    oheprhhoghgvrhdrphgruhestghithhrihigrdgtohhmpdhrtghpthhtohepshhsthgrsg
    gvlhhlihhniheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Bvq5aeBUYjogiQk_DijurLkcE7z83rFC35WKtgMuStnTxB6Di0__3Q>
    <xmx:Bvq5aTKTHzTAO4Nnx23d2ZKPm8qKPwAhgEaGXmQhyhp0TkrPYvXdRA>
    <xmx:Bvq5aXlOaq9Nypof95ES8vfVOBzpYAMIf1rPMaRVmdDSUZZHBbtPfQ>
    <xmx:Bvq5acYbV0GI6SdUSU0gCzqXpyclhfUSDbKPidknCkvRPMfyt8Vw5Q>
    <xmx:Bvq5aafqlTOKWYHB1YZH2u1XuWBRTSFqMXrUHMxDRJocWodlmf89QZb4>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 18 Mar 2026 02:04:02 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] efi: Enable EFI_SET_VIRTUAL_ADDRESS_MAP by default
Message-ID: <abn6Aj4TzSHF2KLe@mail-itl>
References: <14146a9dd53d1662d1e35220125d816045b2f184.1773757913.git.teddy.astie@vates.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gUCD34k0ZGhT3ikn"
Content-Disposition: inline
In-Reply-To: <14146a9dd53d1662d1e35220125d816045b2f184.1773757913.git.teddy.astie@vates.tech>
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm1];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,invisiblethingslab.com:dkim,invisiblethingslab.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: BA7802B4D40
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--gUCD34k0ZGhT3ikn
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Mar 2026 02:04:02 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] efi: Enable EFI_SET_VIRTUAL_ADDRESS_MAP by default

On Tue, Mar 17, 2026 at 02:33:34PM +0000, Teddy Astie wrote:
> Many machines fails to boot if this option is disabled.
> It's off by default as it was deemed too risky for being enabled
> by default late in the Xen 4.13 cycle, but found out to be safe.
> As there are no known drawback by having this option on, enable
> it by default.
>=20
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

I think this is enough for this change to go in. If somebody wants to do
more archaeology, mailing list archives exist, there is no point in
summarizing it all here.

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
> v2:
>  - review commit description
>  - drop "If unsure" note
>=20
>  xen/common/Kconfig | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index d7e79e752a..0a20aa0a12 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -363,14 +363,13 @@ config KEXEC
> =20
>  config EFI_SET_VIRTUAL_ADDRESS_MAP
>      bool "EFI: call SetVirtualAddressMap()" if EXPERT
> +    default y
>      help
>        Call EFI SetVirtualAddressMap() runtime service to setup memory ma=
p for
>        further runtime services. According to UEFI spec, it isn't strictly
>        necessary, but many UEFI implementations misbehave when this call =
is
>        missing.
> =20
> -      If unsure, say N.
> -
>  config XSM
>  	bool "Xen Security Modules support"
>  	default ARM
> --=20
> 2.53.0
>=20
>=20
>=20
> --
> Teddy Astie | Vates XCP-ng Developer
>=20
> XCP-ng & Xen Orchestra - Vates solutions
>=20
> web: https://vates.tech
>=20
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--gUCD34k0ZGhT3ikn
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmm5+gIACgkQ24/THMrX
1ywv7Af+NPWZtpLH0VYvwRIx+VtsHnnbWt54HM27LxzN4SIUyGUpPF1V/E8kYGVb
7qZOC4tLR4/B8OqexEbLCpO9mYUCGJGemBX1aDq350qNdqslfHu6ogpqMOn8vXYs
6npzG5J+yKgW1l5QrhtqHkEmzDacO3V6rHDnk7fB1l+e8SEZDdvCIztP0Q3kJSFm
txdztMMCJrpAHItUSuiIWcChXoEeswhqLcrrZvbawR7NoJK7q2Dg+2hfn+IV6Ug4
D3ju1eOS2DFESuhl70uSjTZFLq7D26+di65w8rJuOQIAsOrs5fzoZmzqY+CDh2LZ
G5zVi27sXCdKPkuUT7++X6ivQu4QMw==
=FuL+
-----END PGP SIGNATURE-----

--gUCD34k0ZGhT3ikn--

