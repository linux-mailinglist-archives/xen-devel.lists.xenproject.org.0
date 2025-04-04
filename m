Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC85DA7B440
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 02:35:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937606.1338541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0V21-0003gl-9x; Fri, 04 Apr 2025 00:35:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937606.1338541; Fri, 04 Apr 2025 00:35:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0V21-0003eq-62; Fri, 04 Apr 2025 00:35:37 +0000
Received: by outflank-mailman (input) for mailman id 937606;
 Fri, 04 Apr 2025 00:35:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n5Qt=WW=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u0V20-0003KW-FY
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 00:35:36 +0000
Received: from fout-a5-smtp.messagingengine.com
 (fout-a5-smtp.messagingengine.com [103.168.172.148])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7834258-10ec-11f0-9eaa-5ba50f476ded;
 Fri, 04 Apr 2025 02:35:34 +0200 (CEST)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfout.phl.internal (Postfix) with ESMTP id 2513A13801E2;
 Thu,  3 Apr 2025 20:35:32 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Thu, 03 Apr 2025 20:35:32 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Apr 2025 20:35:30 -0400 (EDT)
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
X-Inumbo-ID: b7834258-10ec-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1743726932;
	 x=1743813332; bh=wuC84Tknj9q9XWXbe+D3YerSpW1Lr2jJHf7iKC1E+a4=; b=
	cLJ61xiiDKIdapTT7XT6DlDmmemaiQ8JzUBd2YXtKR2qUTwHr1yeiXfjWFwqHAhk
	h3Cqlsw4zlInEFw+v8qbP636Rf6zDD4L9vZVQVbcvIkJ784xirvLnEIdrWOsVatd
	oCqdLn3JwS5F5uU/+N+OhhT3q0kMwdiYUAWT5UetSyscmfkQnCmj66blWO6fiNt2
	3UC5433xhY5hTDxNyyouTLAwXwK0RrdjsKWrAyPOyj2BomDOeyWNM1p+R0MTFl0C
	t0Sz9tzUum7Gx3pYd48JHEe0FV3nMv/WiecMRAbQjJcFt9yrjgXfyFC5KYEJEVnP
	R/oJSgvYSwhoxbSlQqmp6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1743726932; x=1743813332; bh=wuC84Tknj9q9XWXbe+D3YerSpW1Lr2jJHf7
	iKC1E+a4=; b=cM3ZuzBrmuoYaS/oxndzSfrelSGQCKzyfr1+OgGGYrAPFski3E7
	/uBfJTn+YnaeFRJulxC4zXnJF89hipolP1OOB7aa5FjHNqzbxjuALq7ccqdlcK1P
	29zXYEAD9+M8eAJSaZSBV0tUqtwoBuRXRo+PYo7QfjvkT8EFDjsmehYZYhpQ5qIK
	3lYjDv7Cih++0xhIYmX0u6k0RgqdQ/JqbGg31ZeeVipbY2B/XFRJljHByRhKnxWY
	glHao6CBohcZDphbuPakQu6O2G4/Jab44JRfKBIwDpeSpeaOYfYe9Uv7CvwriSak
	3XQkGhXzi3I18PeUvBtsE287KrN92EEwhgw==
X-ME-Sender: <xms:UynvZ-eyz8I5ILLc_MyBmIFeLej2sKdDcJdCGKwlVmIOarLJB8acSg>
    <xme:UynvZ4PSFBTkDeajolQtYPbZlPDE49O9XBgDI_yZvNVw1YERJHpQ5qi9_xgGfaoaK
    ia66RU20HdyFw>
X-ME-Received: <xmr:UynvZ_irI-SX0SuUkQd5ix04TsvL5ckDjlXf8VJwquylo4ORXe_vSNDTVt3IGt571OU5hfSBuIVyjCa3FLYwOw9IzvT2_StWZw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduledttdduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettd
    dvgeeuteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    dpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshhs
    thgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhgsvghulhhitg
    hhsehsuhhsvgdrtghomhdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghi
    thhrihigrdgtohhmpdhrtghpthhtoheptggrrhguohgvsegtrghrughovgdrtghomhdprh
    gtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhr
    gh
X-ME-Proxy: <xmx:UynvZ790NA2wSTKdrcdd-Ja5n40XIzWpKBphv0LSK0AXUtaiFNdxRA>
    <xmx:UynvZ6sTkT7kkoPXbyfTfhBn01gYQSsVRCtn1lW2euhHHUZHr4zV2Q>
    <xmx:UynvZyGe--fMvy2ohUx8zupqjpVgtkZHh1olclOljil22LXUKjuJYA>
    <xmx:UynvZ5OLPa0baYLBvzAUB8DpiinY39e2DRq5EDtWX1FRbjtDyti1nQ>
    <xmx:VCnvZz_nMwU3_ypFBJTIr86sCVulbiM7iFTteBshPVhhyceEQH8XG5Km>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 4 Apr 2025 02:35:28 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 02/11] ci: increase timeout for hw tests
Message-ID: <Z-8pUBzVty-5Us2l@mail-itl>
References: <cover.59b4d1e66776c1e577aa5dd5460605dc6c240613.1743678257.git-series.marmarek@invisiblethingslab.com>
 <7578489af5c7df525d4c82231b68bbb7d955d2b4.1743678257.git-series.marmarek@invisiblethingslab.com>
 <9e4660fc-b78f-4323-8a1b-aca3d410edd3@suse.com>
 <Z-5-PBcbtUOCSAiv@mail-itl>
 <alpine.DEB.2.22.394.2504031720260.3529306@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ka585L6JABnbgr+x"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2504031720260.3529306@ubuntu-linux-20-04-desktop>


--Ka585L6JABnbgr+x
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 4 Apr 2025 02:35:28 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 02/11] ci: increase timeout for hw tests

On Thu, Apr 03, 2025 at 05:21:56PM -0700, Stefano Stabellini wrote:
> Hi Marek, would you be up for moving your script to use "expect"?
> Something like ./automation/scripts/console.exp?
>=20
> That way, we would immediately complete the job no matter the timeout
> value. It is also nicer :-)

Oh, this is excellent idea, I'll see how it fits there. It seems I'll
need at least add support for wakeup for the suspend tests, but that
shouldn't be a problem.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Ka585L6JABnbgr+x
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmfvKVAACgkQ24/THMrX
1yw6ogf7BUAgFFrNp+wXn7sEwD4v+Aoj5ELhQNW5GIjMn0aFP3wnXxC87iy4ux6Q
eAhnDxtmbVSphWnciNttf54VBVPks/Jru5AIlgMMBiYJgyB8PXMfrdEPefpjQFim
37N2mlSnGrT5XD+ELPAc7zK4PAJwrW3RJ4TkB+U8zAmKbJp0KWtuBe5Hd7Ycf025
DjVZS08g9KnP10pb/N33UDNk7xbXgAtwR53YTynwdU/77Ad+LaTG5DJLbv3uC6+s
xtDX/trdrvjh6Dc3R3nFcPENOtXdzUFj+vxa0u8TBxh082US5wwa89A4mKfFgIxc
zY4bhUjd4oQkXewc6x+umgC5ijUfmQ==
=y+9A
-----END PGP SIGNATURE-----

--Ka585L6JABnbgr+x--

