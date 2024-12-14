Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E825E9F2040
	for <lists+xen-devel@lfdr.de>; Sat, 14 Dec 2024 19:05:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857447.1269740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tMWW6-0004DQ-9B; Sat, 14 Dec 2024 18:05:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857447.1269740; Sat, 14 Dec 2024 18:05:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tMWW6-0004Au-5h; Sat, 14 Dec 2024 18:05:26 +0000
Received: by outflank-mailman (input) for mailman id 857447;
 Sat, 14 Dec 2024 18:05:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vvNG=TH=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tMWW4-0004Am-LS
 for xen-devel@lists.xenproject.org; Sat, 14 Dec 2024 18:05:24 +0000
Received: from fout-b1-smtp.messagingengine.com
 (fout-b1-smtp.messagingengine.com [202.12.124.144])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb692edd-ba45-11ef-99a3-01e77a169b0f;
 Sat, 14 Dec 2024 19:05:21 +0100 (CET)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfout.stl.internal (Postfix) with ESMTP id DCE1F114007F;
 Sat, 14 Dec 2024 13:05:19 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Sat, 14 Dec 2024 13:05:20 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Dec 2024 13:05:18 -0500 (EST)
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
X-Inumbo-ID: fb692edd-ba45-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1734199519;
	 x=1734285919; bh=CGfjQ4mtSogkwDRwGFBcKvlSU+aE7jlwAxUbDSYEheI=; b=
	sU3x8/0Tg0UEcJqvlyq15K4oIIu7sEPwN0O5Mm8xTy1a19v5F4GTYvZUpucpJfpM
	jQQXagVba27EflURtcDh7s+GQJ+pWTpDcs3RdTDi7MbYYpJ2cA4ZGGWRgwzHuPLB
	qWk+TyoHK/sb/fL6ZDv68rbBTeU+oy+hH3FR0d/yyWqknuFy0r+PhE31v8ZLjPIc
	wD9V3xNXevgXaTfyitu7V5rnWJmdXuLteWaFJvuFQoO3elm+qnjvCycaNVj8v1eG
	xgR1GiTf1dgI5zHlLtMh1KQlSNBCRzrOyLI3FUEmxxUTvljAdddMX6IGNkvrQxn1
	1wJJ52ojHwI8PLlXaZGp/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1734199519; x=1734285919; bh=CGfjQ4mtSogkwDRwGFBcKvlSU+aE7jlwAxU
	bDSYEheI=; b=LCW/nM+Z8cDMXFhFYwnxGW8jqIu2eW16JBbYlUCMjb75etBHPsC
	fyqB6G+8HCLIB34m0ufFD1NvuQ9kHcmP4huZZNiJdM8sCv3pJudKfLGYjZLHOX7E
	XfNolzNN7ult1cLLcFV/6H/a0gHiYEUUkxf5pVzGSpoMrjrWUBLi17SUs2sKGbzF
	Q2JKVoyhMUEmI6hxMI0tMmElz2hzKSFP+EILml4w0nwbt9tYf7Y7g6WIySsyoS+I
	tuCvKqH4PtE1w2Bj2vVzCpCtxUDyyVhakFeiKMfu9GnBlX+QgSm6HcazVBp/DfRc
	RjF1qu77/zd591uTx02iT0BYSAGrlp2D1Ng==
X-ME-Sender: <xms:38hdZ27vtHSF9sMZXhFmWeq6FGGvMKbamXvJL8hYLr7LBEek_leJgw>
    <xme:38hdZ_7hhKW1aT2T4HmZXW5ktDvPiUiP_ygSGHyfhu7ffP5yLdTt0qx0Rhw6BvNe2
    QsN_-ruMYhhzw>
X-ME-Received: <xmr:38hdZ1fFJm4EmGji6p_1UgAt0u3-VKOet0L5CoULXRkDupuIVo8zkfyizgeiYaFAzhiSneiM4Yl6KdkQMP9vlMYIQyAsVLWz6w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrkeelgddutdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettddvge
    euteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnh
    gspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepughmuhhk
    hhhinhesfhhorhgurdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtsh
    drgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnughrvgifrdgtohhophgv
    rhefsegtihhtrhhigidrtghomhdprhgtphhtthhopehjsggvuhhlihgthhesshhushgvrd
    gtohhmpdhrtghpthhtohepjhhulhhivghnseigvghnrdhorhhgpdhrtghpthhtohepshhs
    thgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhlvghkshhiih
    drkhhurhhotghhkhhosehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:38hdZzKc5V5RP9xAX70rYXM9JcU678FkvltL3___hUYtEjuqvErhdQ>
    <xmx:38hdZ6IxdEgpfva270ykhlMtQTStGqvCjfeS04zf92kOZjMkIjWsRg>
    <xmx:38hdZ0xKT_x-m73Y-RBzvzS_DoGguIFGGYsb6ukiQQYfwL15hRdJRw>
    <xmx:38hdZ-J7MIO2yJJa-tKzbaSMd4fFT_TcKJpiMNrlEksiAd26d_zAyQ>
    <xmx:38hdZ7rnAqp_cIz0fA9Tartee6gQUI4aRExLQKnaSS4-f1XgI90hkpb1>
Feedback-ID: i1568416f:Fastmail
Date: Sat, 14 Dec 2024 19:05:15 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2 00/35] Introduce NS8250 UART emulator
Message-ID: <Z13I2xEJpkMouslw@mail-itl>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pF/P2cMhT/UHyHIG"
Content-Disposition: inline
In-Reply-To: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>


--pF/P2cMhT/UHyHIG
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Dec 2024 19:05:15 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2 00/35] Introduce NS8250 UART emulator

On Thu, Dec 05, 2024 at 08:41:30PM -0800, Denis Mukhin via B4 Relay wrote:
> The patch series introduces initial in-hypervisor emulator for
> NS8250/NS16x50-compatible UARTs under CONFIG_HAS_VUART_NS8250.
>=20
> In parallel domain creation scenario (hyperlaunch), NS8520 emulator helps
> early guest OS bringup debugging, because it eliminates dependency on the
> external emulator being operational by the time domains are created. Also,
> there's no early console facility similar to vpl011 to support x86 guest =
OS
> bring up.
>=20
> The NS8250 emulator is disabled by default.

On a high level, why the mechanism used by earlyprintk=3Dxen (IIUC i/o
port 0xe9) isn't enough?
Hyperlaunch can't start full (Xen-unaware) HVM domains anyway, so
a requirement to use a Xen-specific interface for the console shouldn't be
an issue, no?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--pF/P2cMhT/UHyHIG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmddyNsACgkQ24/THMrX
1yyiBQf/RLMejP9/MPjMcQylP4wOkr9Ltzz5VBvwcCuJfIb3RrdRF20KikVz1YFD
Ki3z97Jx3GpRpzDeVBORZvP29DpOlek1GTZuBCoHDBCqRrg3cbbboN0LrAuAGreI
disM2GLNckxIv7uLs6FYw3TciOufO/yT1+qN30XQgmrlYzrgRiksDmDVUQztnesi
zbAqEn6g4HbhJZNKtus5i49EZXpK7k42AuehxORi33E47anCmmCC3flYUnnSvYYy
5RKATImO/lFeTsXBhJq0P9bO2wdc4Y6I+9czgRMpLXREpBvMq+Pv1V+y5qNZrnxy
JN2YbKqqDMvfnlg01rm4bCY+YQrQ7w==
=aMUr
-----END PGP SIGNATURE-----

--pF/P2cMhT/UHyHIG--

