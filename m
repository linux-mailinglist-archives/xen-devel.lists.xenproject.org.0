Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BA7A68C3D
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 12:59:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920373.1324569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tus4R-0003Ms-8H; Wed, 19 Mar 2025 11:58:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920373.1324569; Wed, 19 Mar 2025 11:58:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tus4R-0003KF-58; Wed, 19 Mar 2025 11:58:51 +0000
Received: by outflank-mailman (input) for mailman id 920373;
 Wed, 19 Mar 2025 11:58:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WMzd=WG=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tus4P-0003K9-HM
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 11:58:49 +0000
Received: from fhigh-b7-smtp.messagingengine.com
 (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83cb52ad-04b9-11f0-9ea0-5ba50f476ded;
 Wed, 19 Mar 2025 12:58:48 +0100 (CET)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfhigh.stl.internal (Postfix) with ESMTP id C946D25401A2;
 Wed, 19 Mar 2025 07:58:46 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Wed, 19 Mar 2025 07:58:47 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Mar 2025 07:58:44 -0400 (EDT)
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
X-Inumbo-ID: 83cb52ad-04b9-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1742385526;
	 x=1742471926; bh=u9HByR81iDQ5nJqrj0d8iVu/KDGH4EKBh5gSfD6d4tg=; b=
	K6Yi0X7D+oZjJDjtZ5TAwp/4KcRgVvJmsza9XZQsvW39DpIMsgUsm4wNtTvTvWhd
	up6l5RoPbTPx8agb8ZOnmSWDL5pWogbL4it0T+UfdfFaczoeaHou7iNYXE0cSoiP
	WmTBRMZn2HWjVUyWRImYcWdnyb4V9c+cLS4o6r0f2T72pPgmrfJoJZdvX7u1XB5b
	4VF/c9Ovop+6j2K/DVLTwMqaX3BwyUNIhaanMmxagohpC3G0zloRdeMe3c3dvPn9
	9e2e6xOM2ERu0eznqcItMoaOuTNHL+DHQ2ByPJ7P6QgjsxqsixzIeXhYTixVKArf
	ujxtDAELXI+zh85OhYDp6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1742385526; x=1742471926; bh=u9HByR81iDQ5nJqrj0d8iVu/KDGH4EKBh5g
	SfD6d4tg=; b=o+tpaJm2KwVP5TYtX5ya5zsFQges2hOUAjLspJoyuqTFj8cBsy/
	4IQoPh4D1HfOvzQRbNIVReAq9g23cTIgXJgvWUpgghf7nmgpLg7mskMsAiY0sdKX
	yYFLIstbpuPb9DfUyS6K2WDO7siVTxOXYucxoJ3XcSQt/enYjK+ZZuD50n0gELgA
	Sn2q1iGZR3Ph2iDeHqOk+XahxwmKoWOQMLiKYmtAl3j7/xsCpfMew6tRrM8oh9VY
	uKn0ZBrZGRiu01PMFCl5QdcxsAGqZqRLJpp75LMi8Fo+2jEiPjPdEkOk7ScBDG4p
	RBABLQTXFJrG+er+FAb5zqhHvsXnsybcqMg==
X-ME-Sender: <xms:drHaZzOQAY66-ErwEE9WV4gTmMHPrdlqyXRT0Za28aPJa46VC-HwsQ>
    <xme:drHaZ99TMk-hICNkwjqmOQPwIUiqaEbPFUnoBYFlKe0lU4f9ImYS0X_rhgAnSSC1q
    p5inARWCs1e4g>
X-ME-Received: <xmr:drHaZyRovJqOEho6mlpzVmDsRIeEixjQ93_cgNMMTaTu30Y1ykszr3hluElNDYsn4dVGeBgfqO_yjf5z_vpSG1GSATVDjiJqQg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeehvdekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettd
    dvgeeuteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    dpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgs
    vghulhhitghhsehsuhhsvgdrtghomhdprhgtphhtthhopehfrhgvuggvrhhitgdrphhivg
    hrrhgvthesqhhusggvshdqohhsrdhorhhgpdhrtghpthhtoheprghnthhhohhnhidrphgv
    rhgrrhgusehvrghtvghsrdhtvggthhdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvg
    hrfeestghithhrihigrdgtohhmpdhrtghpthhtohepmhhitghhrghlrdhorhiivghlsegr
    mhgurdgtohhmpdhrtghpthhtohepjhhulhhivghnseigvghnrdhorhhgpdhrtghpthhtoh
    eprhhoghgvrhdrphgruhestghithhrihigrdgtohhmpdhrtghpthhtohepshhsthgrsggv
    lhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepgigvnhdquggvvhgvlheslh
    hishhtshdrgigvnhhprhhojhgvtghtrdhorhhg
X-ME-Proxy: <xmx:drHaZ3sb3KWdLT1e5YiU64qIUMxXgtTC3T5-Bb9_uRJJkk3Pisxcjw>
    <xmx:drHaZ7f5D5vamiF-NS6ySDgNfp2NnFfo5tbxYpGsCAc8NgOD1p_fjg>
    <xmx:drHaZz1ZwsfZSQyaAzAX4iTY35rl_pepxm5gYe3e94r_pwE5NQbeBw>
    <xmx:drHaZ39exkYn247BIjpr8WQqtNicRL7SVvojmySptnp2c6SKWCYrsQ>
    <xmx:drHaZ_4Q64WzoZi2uqyXc4Io3yuR520oc-KZh9NRsTqnA7xcHHbAMpw7>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 19 Mar 2025 12:58:41 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: =?utf-8?Q?Fr=C3=A9d=C3=A9ric_Pierret_=28fepitre=29?= <frederic.pierret@qubes-os.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 2/2] Strip build path directories in tools, xen and
 xen/arch/x86
Message-ID: <Z9qxcRtap-k-wW8B@mail-itl>
References: <cover.a5cb9c3a17249fc067ab501818c3a3e6c7c229cf.1742317309.git-series.marmarek@invisiblethingslab.com>
 <0370c0eb1fd9ac00acab016792132fa0b943d384.1742317309.git-series.marmarek@invisiblethingslab.com>
 <017d5c41-d4ea-4d91-b6ec-b4660e7325ae@suse.com>
 <e112ecca-b891-4c23-ace1-8128e586cb94@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PpeQ3rwt4y1oLfY/"
Content-Disposition: inline
In-Reply-To: <e112ecca-b891-4c23-ace1-8128e586cb94@suse.com>


--PpeQ3rwt4y1oLfY/
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Mar 2025 12:58:41 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: =?utf-8?Q?Fr=C3=A9d=C3=A9ric_Pierret_=28fepitre=29?= <frederic.pierret@qubes-os.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 2/2] Strip build path directories in tools, xen and
 xen/arch/x86

On Wed, Mar 19, 2025 at 10:43:12AM +0100, Jan Beulich wrote:
> On 19.03.2025 10:15, Jan Beulich wrote:
> > On 18.03.2025 18:01, Marek Marczykowski-G=C3=B3recki wrote:
> >> --- a/xen/Makefile
> >> +++ b/xen/Makefile
> >> @@ -411,6 +411,8 @@ ifneq ($(CONFIG_CC_IS_CLANG),y)
> >>  CFLAGS +=3D -Wa,--strip-local-absolute
> >>  endif
> >> =20
> >> +$(call cc-option-add CFLAGS,CC,-ffile-prefix-map=3D$(XEN_ROOT)=3D.)
> >=20
> > This is lacking a comma:
> >=20
> > $(call cc-option-add,CFLAGS,CC,-ffile-prefix-map=3D$(XEN_ROOT)=3D.)
>=20
> And then, having tried the correct form (seeing the option then is passed
> to the compiler), I can't spot any difference in the resulting
> xen-syms.map. There were a few absolute paths there before (for
> arch/x86/x86_64/kexec_reloc.S and arch/x86/acpi/wakeup_prot.S), and the
> exact same ones are present afterwards.

I'm not sure about xen-syms.map, it's about build path included in
xen-syms. It appears at least once in .debug_str and once in
=2Edebug_line_str.

But also, I see the patch lost a chunk during rebase (from before
4.17...), that adjusts XEN_ROOT to use $(realpath ...). That's the part
even mentioned in the commit message...

I'll send v2 shortly.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--PpeQ3rwt4y1oLfY/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmfasXEACgkQ24/THMrX
1yzfvwf+KcnWvIBvOv56Zedo/f7glcwzBgDpu0IdzqQr5jKBK9FfTSFmgYSuowVh
13Sph/rIOq4skRo+2wU5kKSgW8Z4GuhegOmrxlIpIXIHhlmlY5THqeQ1dh1KfAa8
j1WveGyqZoH5mudHsshUd9PEZx6RYwLzQNp3QqKaXktx+psDw3i2qFJG0F9xQzMr
uadyW0RtqMTQxsQSx3C/UK21l4+cMUk8aG51LlksX94F/4jkQTyvwQkjXHRea2Jn
3fCRcAeLhf5lV1ByabwJix/8WINzglRkwnEs7lEmUlVd5RYLo4CyNC9HOCcdeG3S
El1J33fNgubF7LcOX1lXAW98QFFkYA==
=A6S1
-----END PGP SIGNATURE-----

--PpeQ3rwt4y1oLfY/--

