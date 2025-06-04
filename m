Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F55FACE030
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 16:22:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005599.1385024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMp0b-0008MZ-Q4; Wed, 04 Jun 2025 14:22:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005599.1385024; Wed, 04 Jun 2025 14:22:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMp0b-0008Jy-Mu; Wed, 04 Jun 2025 14:22:25 +0000
Received: by outflank-mailman (input) for mailman id 1005599;
 Wed, 04 Jun 2025 14:22:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sp6j=YT=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uMp0a-0008Jr-Ah
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 14:22:24 +0000
Received: from fhigh-a7-smtp.messagingengine.com
 (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 539447fa-414f-11f0-b894-0df219b8e170;
 Wed, 04 Jun 2025 16:22:21 +0200 (CEST)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 417A21140237;
 Wed,  4 Jun 2025 10:22:20 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Wed, 04 Jun 2025 10:22:20 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Jun 2025 10:22:18 -0400 (EDT)
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
X-Inumbo-ID: 539447fa-414f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1749046940;
	 x=1749133340; bh=l9qTL6VyDfkoyc94nfz6CdcDFNs7QiHmBUzDCEMHvgE=; b=
	Q4ErSjeW4VOznKj0N+l3iczNlcBj+NXKv2ttSNWavCZIq8sDZ9aSXq6qnKzCuMsG
	K5In3r//KTUnq7X3M4aNES5WcC+p1RdR16RNz8VHhbvFYGcxnnODJGsc6p/D7OCs
	cky8j3l8OKDIkYrT4eiKkaYXYRWgm5/wOCGEYGA93nmrED45BFUKl+TeZIvmUHDx
	4r22XvBct4APiCGsoXjbFtSN+xZfCOz5tnKcN0m6gR1NvPlilC1MqyXdYE9Uqp+4
	ZfWkw0JiMdovs2aE4Mn3pQ3xKcQR8J63AhorWedPjEsZ/ZnX9qQMCOemxn1VyoUZ
	UrOQ9TirfiFKwq0Z/x/elg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749046940; x=1749133340; bh=l9qTL6VyDfkoyc94nfz6CdcDFNs7QiHmBUz
	DCEMHvgE=; b=D0j+LQ7cOJA1nQG4pbbCqsU+8T60bcyhWBSItXL5xkQ2AScoRup
	D6g4gDmau1B431JqpfNxV3xt57U4JDhFpjfZ+nhowCNxV4g4f/rJ+htSU9nXGg3o
	74J+lhyCe1zhavHk5HjkbV2NtYsXrLddg1LY6oYfM0d5FzrpEgbNxLawWBpNF7B9
	J2asq5O3u4rMDl4ayVWbUvR1Or1mSbYOuDfy403SsoLyDEwcaPtx3oUM/bWPZdeF
	u+Glkou7WcVwQHq6SKjdRXVkE7ZXYEkq8mBzvqvbs6VEMAd94p393OhV+ckBkhne
	fVinQQncbTo5iuwokYLteKc5APqImwNbZzg==
X-ME-Sender: <xms:m1ZAaPw6UWuK9hpeyxebyC6A52423UjSdibmiQKlGTFVdUVfMejm0w>
    <xme:m1ZAaHSh2tywL0-gFkcmuHcEBkbc70T-H7K4mJybqLp1XTy1rjeOh1Nve0O9AN7YL
    u8P6zxXU0V6XA>
X-ME-Received: <xmr:m1ZAaJVOddxB3gO064bczIBpuj1OQ_vGKB4MPRikzRCKr0eQhzkg0jpWVpOm4iHKKpNjmQ1bfcgDd0QY8H3VcaLdHBTph-YOq6k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvvdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtroertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnheptdetvdfhkedutedvleffgeeutdektefhtefhfffhfeetgefhieegle
    dvtddtkedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnh
    gspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhoghgv
    rhdrphgruhestghithhrihigrdgtohhmpdhrtghpthhtohepjhhgrhhoshhssehsuhhsvg
    drtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhj
    vggtthdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehjrghsohhnrdgrnhgurhihuhhksegrmhgurdgt
    ohhmpdhrtghpthhtohepjhifsehnuhgtlhgvrghrfhgrlhhlohhuthdrnhgvthdprhgtph
    htthhopehsshhtrggsvghllhhinhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopeho
    lhgvkhhsrghnughrpghthihshhgthhgvnhhkohesvghprghmrdgtohhmpdhrtghpthhtoh
    epshhtrggslhgvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:m1ZAaJi_yy7OaaEYivfAL-FTDb0mEe_8_itFv7hYF8TfdadF9Da2xQ>
    <xmx:m1ZAaBDoRqc-amRoTlDHMh_luKJYVdJJq8m2ZY10fIqFT5830IZaLQ>
    <xmx:m1ZAaCLLVT38noOg_E7NdYhKtNB50na0NfVage2tJKiaOL-_4fAA7Q>
    <xmx:m1ZAaACb_WNon-eBBvWPrABlBSzf3x4PwdbrF_dWVL47s0fa_Ugsug>
    <xmx:nFZAaP2ldpj4cJl3_ertUruqbAmMgG4SV2TvOG0W_agpxzhVp9iSGrxX>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 4 Jun 2025 16:22:16 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org, jason.andryuk@amd.com,
	John <jw@nuclearfallout.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] xen/x86: fix initial memory balloon target
Message-ID: <aEBWmAoDSaNpsrvQ@mail-itl>
References: <20250514080427.28129-1-roger.pau@citrix.com>
 <aCWtZNxfhazmmj_S@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rjdcZPeLS3c+Qw6Y"
Content-Disposition: inline
In-Reply-To: <aCWtZNxfhazmmj_S@mail-itl>


--rjdcZPeLS3c+Qw6Y
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 4 Jun 2025 16:22:16 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org, jason.andryuk@amd.com,
	John <jw@nuclearfallout.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] xen/x86: fix initial memory balloon target

On Thu, May 15, 2025 at 11:01:24AM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Wed, May 14, 2025 at 10:04:26AM +0200, Roger Pau Monne wrote:
> > When adding extra memory regions as ballooned pages also adjust the bal=
loon
> > target, otherwise when the balloon driver is started it will populate
> > memory to match the target value and consume all the extra memory regio=
ns
> > added.
> >=20
> > This made the usage of the Xen `dom0_mem=3D,max:` command line paramete=
r for
> > dom0 not work as expected, as the target won't be adjusted and when the
> > balloon is started it will populate memory straight to the 'max:' value.
> > It would equally affect domUs that have memory !=3D maxmem.
> >=20
> > Kernels built with CONFIG_XEN_UNPOPULATED_ALLOC are not affected, becau=
se
> > the extra memory regions are consumed by the unpopulated allocation dri=
ver,
> > and then balloon_add_regions() becomes a no-op.
> >=20
> > Reported-by: John <jw@nuclearfallout.net>
> > Fixes: 87af633689ce ('x86/xen: fix balloon target initialization for PV=
H dom0')
> > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>=20
> Tested-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>

I think this wants Cc: stable, since the commit named in Fixes: got
backported too. Or is the Fixes tag enough?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--rjdcZPeLS3c+Qw6Y
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmhAVpgACgkQ24/THMrX
1yxTXAf/f2m+HJfB41dbfKE54f3JNUqW0V87ci8kZTbhmd1/JxZFU+o1phpKn9Dd
PW4Dd2qzBqcu7h+rlG6C3q9Y6ugtR17qU3eTWA3OCNmBgwK34ga3oJ6bJ5Fbvkyv
//B71ZXIXTv3KxjQgRUH6v3n1WNNqLjkFQBtHqjlC/1K8NCierXgiQK25ysueo/K
yybT8woevQgoZm1E6VINtDYo6c8sbtGE+RorVX8Q4DeSn3AutWRG/AFL/yw1RF7U
QAgZq297ZSLAyHFVtNiGoWY5zELHTVb9EW/ajvPE0jPnuOjEgGw+Mwg2SnAmHejb
rgokQ7UTD84BW7b58MHEMK0W190lRA==
=Birs
-----END PGP SIGNATURE-----

--rjdcZPeLS3c+Qw6Y--

