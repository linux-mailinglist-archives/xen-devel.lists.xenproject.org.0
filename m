Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE74BC1B53
	for <lists+xen-devel@lfdr.de>; Tue, 07 Oct 2025 16:23:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138923.1474504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v68b6-0004eJ-7N; Tue, 07 Oct 2025 14:23:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138923.1474504; Tue, 07 Oct 2025 14:23:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v68b6-0004cR-4n; Tue, 07 Oct 2025 14:23:24 +0000
Received: by outflank-mailman (input) for mailman id 1138923;
 Tue, 07 Oct 2025 14:23:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BI6X=4Q=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1v68b5-0004cB-6r
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 14:23:23 +0000
Received: from fout-a7-smtp.messagingengine.com
 (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ceadff6-a389-11f0-9d15-b5c5bf9af7f9;
 Tue, 07 Oct 2025 16:23:22 +0200 (CEST)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfout.phl.internal (Postfix) with ESMTP id 60F53EC000B;
 Tue,  7 Oct 2025 10:23:20 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Tue, 07 Oct 2025 10:23:20 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Oct 2025 10:23:17 -0400 (EDT)
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
X-Inumbo-ID: 2ceadff6-a389-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1759847000;
	 x=1759933400; bh=TW0txoT92THJ3DxWFRItDbicDK8F7sbGOTApIccrsdc=; b=
	UCXmGP/pR/c9/DWaJoEi2kWQoh65EYYnSptNk/SrsHqe54rkkl/voJRHasnlKhly
	e2l3ECmiQ2pSV+UEO4OV3S/F3smNhd+65m/11ifkCjng9Go6ZxSJyCxDdHs5wB/l
	tnTQYLATSslRo+XGcyC+I6BcIdmEEhD472JUMnhHejL02+FWb0QhICRu8H3DUpmv
	mgO1oz8+T5dqSEBeEhbf0by+iYecAIK3nCv526tQNxeIjP5oxyLGmUsN5KNg5wYb
	wCMKy0b1jY1fPkXy1NRodaEqq99XoARVderQevRZFO6efH2WwnjFA9X6xvwQ74yc
	noxSbo5YdTwl+PglQNHq0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1759847000; x=1759933400; bh=TW0txoT92THJ3DxWFRItDbicDK8F7sbGOTA
	pIccrsdc=; b=ThxY/Akk1mdd63s+gdqUMbko8K5Y34dG/MfvgcJqs4rLawhTRTx
	S+4/sfLtuQNlflgzoL2DHy7A3F5C716qB//OXxTNSqMdZ3K2NdIxM7G0XNoeCerC
	v5MBfNJ9iaJ+Symp6AxuQssetElJrk+XtstisXBIB3N7qEvOo22qQkDyyHaL5+cE
	2cgaJALC5VdEAJct1rjlagN1ivZXlS0s13M8G3al/rBAMwCskbbFmJtDR4iU8oh8
	DwIQOGUJ9c9tNkduTSIpdZ9mMOSjBvqjsTyXzjxcN1UG1YktxgBGMeESCH/hsca0
	lCjUNgBbTFhiTk7g81wT4CAGtCwXQvGm2mQ==
X-ME-Sender: <xms:VyLlaNdMVXMgnQ9vi2gPXGO9GXAUksILViWIfBiYT94pX4egiwKyzg>
    <xme:VyLlaHBMwMNLV6AHTmIZdPmYKsSQH3ilpBBUT7lIyIB1D1RIz8HNbM0a14D8WXpDN
    jPb4IRBP4nTkGeKFjzFsZjVIeTvJGdcylTvVTkaNsqdSk3F>
X-ME-Received: <xmr:VyLlaB5lHn2QbF__JqX-7go66HDIhTIbtV_IO8c1OZKhnkJwm4USXS8t10Nd4Kfc0-MfWddPj_j_-eMa_sDCHNkkFs2IC8FdVK4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddutddtieegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleet
    feevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepuddvpd
    hmohguvgepshhmthhpohhuthdprhgtphhtthhopehjsggvuhhlihgthhesshhushgvrdgt
    ohhmpdhrtghpthhtohepfhhrvgguihgrnhhordiiihhglhhiohestghlohhuugdrtghomh
    dprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdr
    ohhrghdprhgtphhtthhopegrnhhthhhonhihrdhpvghrrghrugesvhgrthgvshdrthgvtg
    hhpdhrtghpthhtohepmhhitghhrghlrdhorhiivghlsegrmhgurdgtohhmpdhrtghpthht
    ohepjhhulhhivghnseigvghnrdhorhhgpdhrtghpthhtoheprhhoghgvrhdrphgruhestg
    hithhrihigrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepughpshhmihhthhesrghpvghrthhushhsohhluhhtihhonh
    hsrdgtohhm
X-ME-Proxy: <xmx:VyLlaAc_IAOdfJzjgIraCitxRpEo7DbOaY1GxgLgOTG4Bvnpz9ckrw>
    <xmx:VyLlaHu2WcC-BpQJObOCu45epO0NpY_tk7_AN9Lfh-iO64To4eZnAg>
    <xmx:VyLlaAkGiI7zt58qhEq_g4McH4SBpdi1BKUzEwy7pjBQEp7f8u5C9Q>
    <xmx:VyLlaKS1Ow0-W4qG6UCnnb6O9QWWtGU0w6LMC3bmNiZIljToyYxHGA>
    <xmx:WCLlaNh8888X6AsTEP39OXtLTVnC6AoYw4Oed4_1XWN9VsiTXLH7-I86>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 7 Oct 2025 16:23:15 +0200
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
Message-ID: <aOUiU86LtvsVFukW@mail-itl>
References: <20250612100705.21988-1-frediano.ziglio@cloud.com>
 <586a66e5-4b11-485e-955a-da5fc3183737@citrix.com>
 <aN6H8dOlea2Um8y8@mail-itl>
 <1708c939-4b06-4d09-acb8-6965383d91f4@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YzRCS1DOCly72NWx"
Content-Disposition: inline
In-Reply-To: <1708c939-4b06-4d09-acb8-6965383d91f4@suse.com>


--YzRCS1DOCly72NWx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 7 Oct 2025 16:23:15 +0200
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

On Tue, Oct 07, 2025 at 04:12:13PM +0200, Jan Beulich wrote:
> On 02.10.2025 16:10, Marek Marczykowski-G=C3=B3recki wrote:
> > On Thu, Oct 02, 2025 at 02:05:56PM +0100, Andrew Cooper wrote:
> >> On 12/06/2025 11:07 am, Frediano Ziglio wrote:
> >>> For xen.gz file we strip all symbols and have an additional
> >>> xen-syms file version with all symbols.
> >>> Make xen.efi more coherent stripping all symbols too.
> >>> xen.efi.elf can be used for debugging.
> >>>
> >>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> >=20
> > Generally,
> > Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>
>=20
> Just to double check: You offer this after having read (and discarded) my
> comments on v1, which v2 left largely unaddressed?=20

You mean the one about objcopy result used for debugging? I didn't see
that before, since I wasn't in cc on v1...=20

Anyway, are you aware of some specific objcopy issue. Or in other words:
would xen.efi.elf _currently_ be broken (as in - unusable for
debugging/disassembly)? If not, then I take that relevant part of your
objection is mostly about inconsistent naming (xen.gz -> xen-syms, vs
xen.efi -> xen.efi.elf). Would xen-syms.efi.elf be better?

> IOW I continue to
> consider this a wrong move, and Andrew's remark towards "bootable vs not
> bootable" isn't quite relevant, seeing that prior to this patch we already
> had a way to strip the binary put onto the EFI partition (i.e. the one to
> be used for actual booting).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--YzRCS1DOCly72NWx
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmjlIlMACgkQ24/THMrX
1ywYJAf+P/4hhKVznSsxZXXLP5F6jetLxgSEGnULOFY+1YnYbf/QxsD7qVBFD+Rg
HFKw+U20PLSbPj/QlBvz5ur+N2tWT1kO/DPOUTb69QYjDeI0FtpFLUnk6LHCgspr
/0Bq2c19aJmeHY+tzvWXUiy3wfpRGsuLVSAFfud5v5dwLYoZbrfZaA660zUCzDYa
DBKiWlG61zj5hzWI5K0lczS9BMZdIVRBu2MeelOtpjZ2hwgOtbfmtXok0F4lsGH4
igWeZ/DKpFuL4hegc6mktIV9fhe0lfrhr7yOo9gGyzUgCqTS0eC+JzBVXCbJDkUU
GbW1sbiKeVJHuc56KEzBawPyOXYzmQ==
=0rv0
-----END PGP SIGNATURE-----

--YzRCS1DOCly72NWx--

