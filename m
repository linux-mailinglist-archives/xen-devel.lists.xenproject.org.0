Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AB0A7A204
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 13:37:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936673.1337857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0IsY-0005Jm-47; Thu, 03 Apr 2025 11:37:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936673.1337857; Thu, 03 Apr 2025 11:37:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0IsY-0005HE-1E; Thu, 03 Apr 2025 11:37:02 +0000
Received: by outflank-mailman (input) for mailman id 936673;
 Thu, 03 Apr 2025 11:37:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X4pi=WV=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u0IsW-0005H8-B0
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 11:37:00 +0000
Received: from fhigh-a8-smtp.messagingengine.com
 (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f34edcae-107f-11f0-9ffb-bf95429c2676;
 Thu, 03 Apr 2025 13:36:58 +0200 (CEST)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 6983B1140255;
 Thu,  3 Apr 2025 07:36:57 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Thu, 03 Apr 2025 07:36:57 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Apr 2025 07:36:56 -0400 (EDT)
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
X-Inumbo-ID: f34edcae-107f-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1743680217;
	 x=1743766617; bh=L6b51u07NUi5iWd5pUhdlpThPd7fQk/6wY6Utkvz2bg=; b=
	RCgEciAaZ9j3nhKYF8EAlUIWlSrzUh6YQU5gsTWi5hf/rKVA3fjrklrYtSf5ntxG
	DfoAWeyCH/+exu4Sf+pbFLwyusFkBo9QZuaJLWPwQVi//Iq9EQWCfG7+nEyav2kV
	31m1vm1zW7HKpp/Dw6t8nEdsi2tMOhA2VmQKOWaMQc4xNzF4cUCNcBVGzLUizAqu
	pTgwcmGUTwCm3r/qQUfpJLELBJbT0d11wQ3ey2Y3aACkWpV6HuERJviP7NMvNOJ+
	28Kasw7vqAXChyxOsg53/EHWT1bww39nlQPh7UxlYI8FqaXmgpoqK5uGYb83Ppr0
	83PTtDE9FYGL0+q23wimZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1743680217; x=1743766617; bh=L6b51u07NUi5iWd5pUhdlpThPd7fQk/6wY6
	Utkvz2bg=; b=JlRplBgaT/wO5Auw82ZAxgY6ve58H65NU47/hWoB7eMDmcwqAW0
	SS+mBCug46OSRf7/q/9syCyM53TGZ+1H01mF9MEWxDqZj8qPjnr1tzavhM2BWUVc
	UAbFvZUEbbgZB239ubTJNC3NKOF0W3X0fHDoDLUMveZX4xCJpaQ78QfFilHO1Xfx
	kI066VRZB0CvsBF53EMtPMUNUNBFN2jnac+wXT7/F+JarRpTboSfSan91dfGbRhG
	Z6LFrHkeYsZjgwCTIUot2lZ85y4RrBEG4XjARNTo5fmIbWfymastdeRi4TZRQPQN
	g9bJxSWwSNHRKP0P3hrLBFAvmwdoVqMVzuQ==
X-ME-Sender: <xms:2XLuZ5LNXDKQpaBaLSiMtqnqMyJvDKnCPOKT9aes2If1OuugDBN7MQ>
    <xme:2XLuZ1LPwjhle9sOLX8RyY174A_I36CBvuEt-TzlMqmdVP-FogvsMXmobaGktOZaN
    CN8o_-VTtIUYA>
X-ME-Received: <xmr:2XLuZxtKLmQ5_aQAbOw8cPc1pU2-LJeWpif0FWdMDWqC5bY3km1E0Qt4SxQBmIAwQH5z3HnOXXDpyRv8jGIhcCXYP5j5N8pHLA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeekgeehucetufdoteggodetrf
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
X-ME-Proxy: <xmx:2XLuZ6Y7ET5l3p5EaZ2JJwTPEYEfVbeBbUoqGRtPNfcGeUIb12Kmpg>
    <xmx:2XLuZwZOORY_pVfuU21nFrNc3f5hHAlCHnbCV0slBM_H30IwSz6Dxg>
    <xmx:2XLuZ-A47pR4xZQzqWCzq8lLoSMiV_deatEr1O54903s7RsAsCeVtg>
    <xmx:2XLuZ-YIpZEPNwv0eW_N9DRTAE8uQuylpyLtVE1qbRMA7DR5BuroHA>
    <xmx:2XLuZz5yxQ2Kli6gqk0EOPCwRPp3fXEqCoQFpW3xOhcsUukhLm8VdnSp>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 3 Apr 2025 13:36:53 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 01/11] ci: prevent grub unpacking initramfs
Message-ID: <Z-5y1pCNlEVm5rsY@mail-itl>
References: <cover.59b4d1e66776c1e577aa5dd5460605dc6c240613.1743678257.git-series.marmarek@invisiblethingslab.com>
 <e1d07b26a92a45ed387594dd789453def1ef1eb2.1743678257.git-series.marmarek@invisiblethingslab.com>
 <a64136e8-c74e-4f47-b52f-cd5b25c57b2e@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Z/3W7kebW6kr+ooI"
Content-Disposition: inline
In-Reply-To: <a64136e8-c74e-4f47-b52f-cd5b25c57b2e@suse.com>


--Z/3W7kebW6kr+ooI
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 3 Apr 2025 13:36:53 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 01/11] ci: prevent grub unpacking initramfs

On Thu, Apr 03, 2025 at 01:29:16PM +0200, Jan Beulich wrote:
> On 03.04.2025 13:04, Marek Marczykowski-G=C3=B3recki wrote:
> > It fails on larger initramfs (~250MB one) and sometimes even smaller
> > depending on memory size/memory map, let Linux do it.
>=20
> Iirc grub only unpacks gzip-ed modules, so wouldn't a yet better approach
> be to use a better compressing algorithm, which simply as a side effect
> would keep grub from decompressing it, while at the same time moving
> farther away from any critical boundaries?

That should also make the test faster (if it's a significant
difference). OTOH likely we wouldn't have found the issue with
map_pages_to_xen().

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Z/3W7kebW6kr+ooI
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmfuctYACgkQ24/THMrX
1yzaHgf+M7bxiY0Y8Cod7GFvsKzYODdbuM5w6tf29WZ6mdFYTWF8pQd546ZLhr1R
ccyJV7ABkD9t03ufZn4i81dlsLQaLn+FcMgYw06uDoEbIidW0EJImGFMQnDzHgMN
R8kj0JCEZTYr7Ia8EavYuD9mtZ0Pxu2ehbLVtDfPhxVJ6RmEAW7+UdDnbUO7wmrA
x5I8TxzJ4DxhKaLE0cx+Y5Di23Qc5PAxbsfYUF7CLEZ8P4tzNj90Cw45nIcQ5L2a
kUrv3H4MlmD5ERjGVXaB4qFa/ASuQCePiyFZOP2SnIrjd8LXXTDMozhv/ODVYWfi
TZeD78E9HFqC/YrsXZqAE2nPqBF2cA==
=ddMy
-----END PGP SIGNATURE-----

--Z/3W7kebW6kr+ooI--

