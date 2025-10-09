Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96114BC8D7F
	for <lists+xen-devel@lfdr.de>; Thu, 09 Oct 2025 13:36:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1140482.1475349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6owk-0006th-Bb; Thu, 09 Oct 2025 11:36:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1140482.1475349; Thu, 09 Oct 2025 11:36:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6owk-0006rW-8v; Thu, 09 Oct 2025 11:36:34 +0000
Received: by outflank-mailman (input) for mailman id 1140482;
 Thu, 09 Oct 2025 11:36:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m3kf=4S=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1v6owi-0006rQ-U0
 for xen-devel@lists.xenproject.org; Thu, 09 Oct 2025 11:36:33 +0000
Received: from fhigh-b6-smtp.messagingengine.com
 (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2eea188e-a504-11f0-9809-7dc792cee155;
 Thu, 09 Oct 2025 13:36:24 +0200 (CEST)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfhigh.stl.internal (Postfix) with ESMTP id A35077A00B0;
 Thu,  9 Oct 2025 07:36:22 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Thu, 09 Oct 2025 07:36:22 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Oct 2025 07:36:20 -0400 (EDT)
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
X-Inumbo-ID: 2eea188e-a504-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1760009782;
	 x=1760096182; bh=UWCjOBEeRQr4DYqLYqToTkWlK1iPJtkXJVOAtu+bAKE=; b=
	iSiQRObsFMQfjRIQsnAhmktkwi1p1BQm42njj5rT1TwgiIRWdpEKWhGhzgWfAS4j
	S8qVJiPumTcZtIOU/YGLLn3ab9U8v3yTgDI9PUDPPyeCDHilVfA44AfoxIbXXKqp
	7Z4QGUZ7MOm0fq1277Y7x5dI5CiEEhcQFfDUMNKKcQVQjgtamOMEh4mwMV1IaxGm
	BG8//o51QDCC0gyQ/ONUK0BEWjHp9IXLmpiHPyiFdVbpUPu0ZuNqmaNrbv75Czh4
	14XNUB3+X8e3kustN+BdFhIsKjF427N0jwCdWd7zWsT2Ed6aLlKU8NwabL9qaxn0
	tEZ5xCeP77kSL8ME/qLa3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1760009782; x=1760096182; bh=UWCjOBEeRQr4DYqLYqToTkWlK1iPJtkXJVO
	Atu+bAKE=; b=raQs1yQSCZ57LMAu2e9uXg8Bsn4UnlMobSWBnQnv0Tx5/03EyMT
	EZ3yGNlsC0N1Qix5aE5IZ/77Q3/HDqphobQ4zjLL6KfFGndtLhJWNXesLDS+ldVz
	WPnjjSEupefkF9I45X1F6HFbPEY69Cw/PdJmcTF0oEhUJ+QgXrDBsWEfpfznB7x6
	Xd3E2oj3PiKaTGRsSpez09cxqtjaNIkqDJH9nEnJ8PtV9bbELEmX08ENjUA2yW22
	P5Uzmdziqc0skVb+9tI0QxdPR5bMpIYiOrYOWltSNdL919PI7Ui6hzKpQ99ZprjY
	XZ8R22D/J4qiiKlzqw6dKpbAwfWd/FIhPPQ==
X-ME-Sender: <xms:NZ7naPLnFoB2JTAl3jtF4IdrmdXmmAskvGAWVttrguJZKp47lxsm2A>
    <xme:NZ7naO-YbYrlFkwJC33V5fYxRsUBIWlh4iHsHWECT8mW1TFaySjqOE0XRXdVdEjXy
    njpoRcAyUnyiRmvrPL8J22_pc-tQsVOLEEE35rFFckq-yO7Bg>
X-ME-Received: <xmr:NZ7naDERtm46uzneHUT_vVxyrUqLozgK4oioZUQE6OEgPLj7CriJWwxpKFr-77czIzulXbAkG5jEGjRGVZOL9fH0HudkZLaatqI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddutdeitdejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtroertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepheekuddt
    teduhedvkefgvddukeevffekjedttefgteehgeduledtfeefieevjedvnecuffhomhgrih
    hnpegvfhhirdhithenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hmpdhnsggprhgtphhtthhopeduvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    jhgsvghulhhitghhsehsuhhsvgdrtghomhdprhgtphhtthhopehfrhgvughirghnohdrii
    highhlihhosegtlhhouhgurdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhi
    shhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnthhhohhnhidrph
    gvrhgrrhgusehvrghtvghsrdhtvggthhdprhgtphhtthhopehmihgthhgrlhdrohhriigv
    lhesrghmugdrtghomhdprhgtphhtthhopehjuhhlihgvnhesgigvnhdrohhrghdprhgtph
    htthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomhdprhgtphhtthhopehsshht
    rggsvghllhhinhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopeguphhsmhhithhhse
    grphgvrhhtuhhsshholhhuthhiohhnshdrtghomh
X-ME-Proxy: <xmx:NZ7naB6V0UBGyB29_bzDGBcc68xAMZ6hZkzr8deHjbQ391_77RNr1A>
    <xmx:NZ7naEYIaKc56tbcsMTxZj7Xbh3lwBw_BF3-t0V_1sSL5ht7KMjZ_g>
    <xmx:NZ7naHg7QT51TZigpTV8stnQxTrcpU87CReO5B-qHcIpLVrlIQVm1A>
    <xmx:NZ7naOcvbcmotzB6AwN1cJ2Zu5tve3q3lBkLV89CYmxzE_OTpvPm2Q>
    <xmx:Np7naM5FXwInudrx86UhFAETMvnqfGZqhP27y80C51Y7EwxNvb44EOje>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 9 Oct 2025 13:36:18 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	"michal.zygowski@3mdeb.com" <michal.zygowski@3mdeb.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] xen: Strip xen.efi by default
Message-ID: <aOeeMtiJEhdEiadg@mail-itl>
References: <20250612100705.21988-1-frediano.ziglio@cloud.com>
 <586a66e5-4b11-485e-955a-da5fc3183737@citrix.com>
 <aN6H8dOlea2Um8y8@mail-itl>
 <1708c939-4b06-4d09-acb8-6965383d91f4@suse.com>
 <aOUiU86LtvsVFukW@mail-itl>
 <e3db4a71-336c-4039-a2fc-7997fadc81b3@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UJw6lDv7/WYuVVcM"
Content-Disposition: inline
In-Reply-To: <e3db4a71-336c-4039-a2fc-7997fadc81b3@suse.com>


--UJw6lDv7/WYuVVcM
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 9 Oct 2025 13:36:18 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	"michal.zygowski@3mdeb.com" <michal.zygowski@3mdeb.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] xen: Strip xen.efi by default

On Tue, Oct 07, 2025 at 04:46:17PM +0200, Jan Beulich wrote:
> On 07.10.2025 16:23, Marek Marczykowski-G=C3=B3recki wrote:
> > On Tue, Oct 07, 2025 at 04:12:13PM +0200, Jan Beulich wrote:
> >> On 02.10.2025 16:10, Marek Marczykowski-G=C3=B3recki wrote:
> >>> On Thu, Oct 02, 2025 at 02:05:56PM +0100, Andrew Cooper wrote:
> >>>> On 12/06/2025 11:07 am, Frediano Ziglio wrote:
> >>>>> For xen.gz file we strip all symbols and have an additional
> >>>>> xen-syms file version with all symbols.
> >>>>> Make xen.efi more coherent stripping all symbols too.
> >>>>> xen.efi.elf can be used for debugging.
> >>>>>
> >>>>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> >>>
> >>> Generally,
> >>> Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> >>
> >> Just to double check: You offer this after having read (and discarded)=
 my
> >> comments on v1, which v2 left largely unaddressed?=20
> >=20
> > You mean the one about objcopy result used for debugging? I didn't see
> > that before, since I wasn't in cc on v1...=20
> >=20
> > Anyway, are you aware of some specific objcopy issue. Or in other words:
> > would xen.efi.elf _currently_ be broken (as in - unusable for
> > debugging/disassembly)?
>=20
> I can't tell. I've seen fair parts of the code in the course of addressing
> various issues, and I would be very surprised if all of that was working
> correctly.
>=20
> > If not, then I take that relevant part of your
> > objection is mostly about inconsistent naming (xen.gz -> xen-syms, vs
> > xen.efi -> xen.efi.elf). Would xen-syms.efi.elf be better?
>=20
> Plus the one asking to strip only debug info, but not the symbol table.
> (And no, none of the suggested names look really nice to me.)
>=20
> Plus the one indicating that the change better wouldn't be made in the
> first place. As said, to deal with size issues we already have machinery
> in place. Not very nice machinery, but it's apparently functioning.

I'm of the opinion that defaults matter. Just having ability to build a
binary that works on more systems is not sufficient, if you'd need to
spend a day (or more...) on debugging obscure error message to figure
out which hidden option to use to get there. And while one could argue
that CONFIG_DEBUG=3Dy builds are only for people familiar with details to
deal with such issues, IMO just CONFIG_DEBUG_INFO=3Dy shouldn't need
arcane knowledge to get it working... And since that's a common option
to enable in distribution packages, person hitting the issue might not
even be the one doing the build (and thus controlling the build
options).

As for the details how to get there, I'm more flexible. Based on earlier
comments, it seems that (not stripped) xen.efi isn't very useful for
debugging directly, an ELF version of it is. So IMO it makes sense to
have the debug binary already converted. But if you say you have use for
xen.efi with all debug info too, I'm okay with keeping it too, maybe as
xen-syms.efi. It's a bit of more space (to have both efi and elf version
with debug info), but since it doesn't apply to the installed version,
only the one kept in the build directory, not a big issue IMO.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--UJw6lDv7/WYuVVcM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmjnnjIACgkQ24/THMrX
1yy+cwf/fwXZE4tucpW+aJaaX5QQJZEMBtkoXB6VesFejjM4gAM0r5U/xLSICfj8
lzdJwkaojH9JUaxBGBr3fQr1uRl8uZWZO5q7fsjRws3tBSMNisSXqi2Q3jYNWGYN
YpaPp31EL4PFsPNsVj368RcIE+8BUEG0+INQoMHC8zm4C+ma8cROtuFs6RFtE9H2
novKCV69bwTkwlhNO0owRbgFyb5r2zpSfX7VWSFNnh/ub97IvihzDnrjL/TdY4cg
vpbjQSL5fH7PioZqpxMyjoy0xbwdSiQNpkGu5yKlCrtMzlJXxtdniTy4Fva8qB8V
wqjgT/PIb1FiU39HjnLA3MGPtXXEyQ==
=1AFs
-----END PGP SIGNATURE-----

--UJw6lDv7/WYuVVcM--

