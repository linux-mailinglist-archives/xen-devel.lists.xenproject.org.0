Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE2EB2F776
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 14:04:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088588.1446330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up41o-0001M5-3I; Thu, 21 Aug 2025 12:04:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088588.1446330; Thu, 21 Aug 2025 12:04:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up41n-0001Jk-Vz; Thu, 21 Aug 2025 12:04:23 +0000
Received: by outflank-mailman (input) for mailman id 1088588;
 Thu, 21 Aug 2025 12:04:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hypg=3B=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1up41m-0000Xs-A2
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 12:04:22 +0000
Received: from fout-b6-smtp.messagingengine.com
 (fout-b6-smtp.messagingengine.com [202.12.124.149])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f76790ea-7e86-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 14:04:19 +0200 (CEST)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfout.stl.internal (Postfix) with ESMTP id 134E81D000D7;
 Thu, 21 Aug 2025 08:04:18 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Thu, 21 Aug 2025 08:04:18 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Aug 2025 08:04:15 -0400 (EDT)
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
X-Inumbo-ID: f76790ea-7e86-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1755777857;
	 x=1755864257; bh=Zs5GGhh1diHlRXersCi6lSAqxeFXG7ttOxhIr0eb8N4=; b=
	rSkqQ9k/EyRlli/ZjljYyYP5jKppe6ZfNtmKoq+JqqXUJqR99/urPePhZE7qKB02
	huy9Li5In5PXvGZCwS19ltATAMzdA5vw/T7DjBM1M7QRPv7EUTC4Z0QWP4fv3QNn
	0b2y5d3QUwFGD6sObBPKZSLS99W4hr0PUYmj+HzVJ0f4duaEy6/UGO45e82g7eGH
	qtuDhL8ZAieM7h3CTTcM4z/63wBh4Mt5JkcFQzsd0Qhpt7P36WvMv1JwL3QZJMyG
	iETTsL9EJbtZOstTySXdwMIYU/ea+A40TEVlV9ig6BOMB3C/Hq4awHQA1uspKUaK
	2rEuYCT9xUUuD769iws0dA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1755777857; x=1755864257; bh=Zs5GGhh1diHlRXersCi6lSAqxeFXG7ttOxh
	Ir0eb8N4=; b=GCFpWiTVYmmornpNaChPPrraGLxvTkMfiikWsMNEHzYl/NG5AcK
	rqFjuUDeRDUwwaz5XaVN5aa7e8c9usTLhSm5SrwfzvpiGQyKsy5cDwNvMM518alR
	CR5YQzcpjf4K1h9Sat2C0s3wP884N6xuNC///TXFZanQum6w2gYjUbIU5x09nO36
	5UwwPDvhxwWTXmggvRBtnkc/RndfIPha2rXomPJ2OeXzqTwys+GuETvk+F+X1Xqq
	zVnnIqJ/0m6aesB4Yk6wB0kiQCxECjTXBXlSefuT6DTHUbvJmMGBSxD+zdKowHGW
	Ak5JFzT/0V+whrlIym3dd0KVORUzwA7iz4Q==
X-ME-Sender: <xms:QQunaLIXHGWpIfVrgGBN-qYjoeF9H4bCmJs9yrYeofIZDNstEmpY2A>
    <xme:QQunaK07_vEDd3O1NMwihpl_mM7ot9xmKYGhbBxJPULwZCzBVo5eWPo3IR-CoNmz1
    7k2t2lAk3MxMg>
X-ME-Received: <xmr:QQunaALYzazIsdKrwdWiaPya4GvEgWZp_u0mLCgdumqfEZRZJISoO0GAJKAd_KkvHH4nLtkD8a_D95lKoAZlXba-5lzJ-pGQ7lw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduieduudelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleet
    feevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepuddtpd
    hmohguvgepshhmthhpohhuthdprhgtphhtthhopegumhihthhrohgpphhrohhkohhptghh
    uhhkudesvghprghmrdgtohhmpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtg
    homhdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhm
    pdhrtghpthhtoheprghnthhhohhnhidrphgvrhgrrhgusehvrghtvghsrdhtvggthhdprh
    gtphhtthhopehmihgthhgrlhdrohhriigvlhesrghmugdrtghomhdprhgtphhtthhopehj
    uhhlihgvnhesgigvnhdrohhrghdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrh
    higidrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopeguphhsmhhithhhsegrphgvrhhtuhhsshholhhuthhiohhnshdrtg
    homh
X-ME-Proxy: <xmx:QQunaNicrL0bt9MbMrbNxHNfDbVs02M9weIch7MsBDe5jgwPkRIe4A>
    <xmx:QQunaIBPi5eUma2XukGEbt4CX9Frq6njWUi8VpE67djEAOPK2-lG6Q>
    <xmx:QQunaH5Cfo2Ypl-rmPmnRJHY85Wxojbej5RgLn7C2FeyG3M8iv_ALQ>
    <xmx:QQunaFGUGQHJKNrwrfRKJoYLGq6LxhceJJZAK0_rw5TETxseIGgVlQ>
    <xmx:QQunaOz6rxALc9CmKa5InIp7xz_QZjl66N7j1Mx0b7fBLHGVHxVMvB0H>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 21 Aug 2025 14:04:14 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] common/efi: deviate Rule 2.1 violation in read_file()
Message-ID: <aKcLPhB771FsvXd4@mail-itl>
References: <c20a58f24875806adfaf491f9c6eef2ca8682d18.1755711594.git.dmytro_prokopchuk1@epam.com>
 <98e8ca88-75cd-4d59-9e94-f758324fa46a@suse.com>
 <61ba927d-876f-496d-966c-e29db3022a1d@epam.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="M4dvO/larT36ENG1"
Content-Disposition: inline
In-Reply-To: <61ba927d-876f-496d-966c-e29db3022a1d@epam.com>


--M4dvO/larT36ENG1
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 Aug 2025 14:04:14 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] common/efi: deviate Rule 2.1 violation in read_file()

On Thu, Aug 21, 2025 at 11:28:01AM +0000, Dmytro Prokopchuk1 wrote:
>=20
>=20
> On 8/21/25 13:33, Jan Beulich wrote:
> > On 20.08.2025 20:05, Dmytro Prokopchuk1 wrote:
> >> --- a/xen/common/efi/boot.c
> >> +++ b/xen/common/efi/boot.c
> >> @@ -852,7 +852,7 @@ static bool __init read_file(EFI_FILE_HANDLE dir_h=
andle, CHAR16 *name,
> >>       PrintErr(L" failed for ");
> >>       PrintErrMesg(name, ret);
> >>  =20
> >> -    /* not reached */
> >> +    /* SAF-15-safe deliberately unreachable code */
> >>       return false;
> >>   }
> >=20
> > Much better (even if not tagged as v2). Yet then, did you consider
> > alternatives? For example, with PrintErrMesg() properly annotated "nore=
turn",
> > I'd kind of expect compilers to not object to the omission of the "retu=
rn"
> > statement here. This would then let us get away without a new SAF comme=
nt.
> > While you explain in the SAF text why you retain the statement, I'm not
> > convinced of code clarity suffering if it was deleted, as long as a sui=
table
> > comment is still there. If PrintErrMesg() lost its "noreturn", surely
> > compilers would then diagnose the lack of "return".
> >=20
> > Jan
>=20
> Sure, the next version will be v3.
> Actually, the PrintErrMesg() already has property 'noreturn'.
> And it really gives an alternative way: remove 'return false;' from the=
=20
> function read_file() (leaving comment there).
>=20
> With that change Misra is "happy".
>=20
> In case of removing 'noreturn' attribute from PrintErrMesg() function=20
> compiler will detect that:
> arch/arm/efi/boot.c: In function =E2=80=98read_file=E2=80=99:
> arch/arm/efi/boot.c:854:1: error: control reaches end of non-void=20
> function [-Werror=3Dreturn-type]
>   }
>   ^
>=20
> Is it OK to prepare such ^ patch?

IMO sounds like the best solution for this issue.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--M4dvO/larT36ENG1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAminCz4ACgkQ24/THMrX
1yz5Dwf8De3BM7eu9WCetfITKkUDzUxJIQ/Lr06APWrwfpOzJJK5rvW2DUYd+NAM
3hMla90jCxFT9uS8Ldl3cjSaYJIZar8Z4Pkjf5+PaqMqc4XSvmFtAaevCLl3UNKI
vwxcZazTYSV6PCu/oAz0dtyfh/gt5UQusvqzvUqImwIu0jIQqHcsVXZDhhqH1NoH
OhpY7wfKWG/Mgq9BusIOwzpybvdFKR3kXwQS64PAxGzgam1iBn26d8dqlhox0Ame
u/H2wxacXLNgj/FR8jHFVeZJgouj5ctyEPOogX+NSYi2KTa+WRRTPAI+bokAg3PS
bfCkiZT/LdHuiDohGUy0aN7BSS1PwA==
=tOZH
-----END PGP SIGNATURE-----

--M4dvO/larT36ENG1--

