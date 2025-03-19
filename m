Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C30D5A68DFC
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 14:41:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920686.1324778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tutf1-0006Im-DJ; Wed, 19 Mar 2025 13:40:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920686.1324778; Wed, 19 Mar 2025 13:40:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tutf1-0006GS-AL; Wed, 19 Mar 2025 13:40:43 +0000
Received: by outflank-mailman (input) for mailman id 920686;
 Wed, 19 Mar 2025 13:40:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WMzd=WG=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tutez-00064e-VK
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 13:40:42 +0000
Received: from fout-b8-smtp.messagingengine.com
 (fout-b8-smtp.messagingengine.com [202.12.124.151])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be4ddd10-04c7-11f0-9ea0-5ba50f476ded;
 Wed, 19 Mar 2025 14:40:39 +0100 (CET)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal
 [10.202.2.52])
 by mailfout.stl.internal (Postfix) with ESMTP id 034621140155;
 Wed, 19 Mar 2025 09:40:37 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-12.internal (MEProxy); Wed, 19 Mar 2025 09:40:38 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Mar 2025 09:40:35 -0400 (EDT)
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
X-Inumbo-ID: be4ddd10-04c7-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1742391637;
	 x=1742478037; bh=WGdcaH9S2zyHd+Ev6AdNPCUKJOyfUbK9mdajqlDJOdg=; b=
	xjRFbEc75WKLBdLZ+It9/L0/nxqGkCaGkmH38WujiEqp+RQ0nz+dxFtEUIe6vt4s
	nRnVBSHM3bxEyqBt+jQgVGTWv92ps6yF38f3KttpzsRKjH015rkpo4iwwYVbG38j
	mand0ec9F+3pRyzrsTiauH2YyaDFAk0fVapwHDthkgUyMIpIw3hKuyvup4jrXU4j
	rMf75JiIPNbqZfYrj3W2K6bkRBzqNp/mcT18pFnUWrrXPEbE8p/3pe3DJ04UZ6Lg
	6haZtJ1NOmwV6VbT7Q105X27Buc6y/F8kYi8bVHDgkLR504fvPGdVW3s+nrqFdWO
	sHLnCVfGk1V5xgGqbcyXuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1742391637; x=1742478037; bh=WGdcaH9S2zyHd+Ev6AdNPCUKJOyfUbK9mda
	jqlDJOdg=; b=DawZ2wNwx0fXLnPiCiIDprllheIkuEDC5Pop2K9XTztjdLWYWVe
	g75SsgA8HAhw1sSiFLRY1ic6Mj/tuq0ukRYM04tNZvd6Ju2x6G5NXk7WF/idZkXK
	rnOLzdQ7td153cVzs356k79U72zvooJCvgMeLA6Hu6JVl69MvQnwCljO1g+Y0KTT
	Wk/ck/MML86yv1IdChBcsaOfkRRNBMVtqLE/Dn1R2+kfuj54j3sHjRpDEtcH8WKZ
	yF21wnADtEom39v3cQJ2F5DqsAMMAOtTlcb1HVMG6eExbGCvdKq84PpddRyqwl51
	0kSqeeedpcPlbPmKP+TjUVUvYDTX0d/KVJA==
X-ME-Sender: <xms:VcnaZ5KmyphXc3tpqFKxFiUrCnCJSzSlqb8fmpddARN9Lu7un02Vdw>
    <xme:VcnaZ1I0fpJO1e4U0rOboJ7D0bCjQ9oQO83UbAbEhw_fa17zpNq9NLn5G0ou3F-rH
    ZNWw27lxrOTxw>
X-ME-Received: <xmr:VcnaZxtLthG9iHUGbJXtdhbERUcqZYpXFEsK8Wiw0MplIcTSVF3M8LnmbuNtE8p_ymWv8SdjH3dXebq3fJsywQkU5gKXsu_V-A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeehgeejucetufdoteggodetrf
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
X-ME-Proxy: <xmx:VcnaZ6ao3z3mRdQeUJAENALb_oMw1yXoetwyMZcj_IosjnfIiHfiuw>
    <xmx:VcnaZwa3C_NAT0cHtKm0mg4Kow-Z5OMiJEYEzQV6Yh8ZatknHC1U2g>
    <xmx:VcnaZ-Dt2nBzS33B-n_n0aV7ikktpU8pAu6M-chqLu3Pxz4Gb2WgVg>
    <xmx:VcnaZ-YZDLxI6eAiIRJTv83IMkF60Fy7dRaOuhZM_ZNTFexgjnbHFg>
    <xmx:VcnaZ-k-aD3ChOzLW6tBjcONq_8B5xi2HZXxLgipkSqdXniE_C4JZP89>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 19 Mar 2025 14:40:33 +0100
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
Message-ID: <Z9rJUWCARMQYqNXr@mail-itl>
References: <cover.a5cb9c3a17249fc067ab501818c3a3e6c7c229cf.1742317309.git-series.marmarek@invisiblethingslab.com>
 <0370c0eb1fd9ac00acab016792132fa0b943d384.1742317309.git-series.marmarek@invisiblethingslab.com>
 <017d5c41-d4ea-4d91-b6ec-b4660e7325ae@suse.com>
 <e112ecca-b891-4c23-ace1-8128e586cb94@suse.com>
 <Z9qxcRtap-k-wW8B@mail-itl>
 <943644a3-45f2-46ef-a54b-6dd0bc6171ed@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zbbruPcfNXoBnAyX"
Content-Disposition: inline
In-Reply-To: <943644a3-45f2-46ef-a54b-6dd0bc6171ed@suse.com>


--zbbruPcfNXoBnAyX
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Mar 2025 14:40:33 +0100
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

On Wed, Mar 19, 2025 at 01:43:59PM +0100, Jan Beulich wrote:
> On 19.03.2025 12:58, Marek Marczykowski-G=C3=B3recki wrote:
> > On Wed, Mar 19, 2025 at 10:43:12AM +0100, Jan Beulich wrote:
> >> On 19.03.2025 10:15, Jan Beulich wrote:
> >>> On 18.03.2025 18:01, Marek Marczykowski-G=C3=B3recki wrote:
> >>>> --- a/xen/Makefile
> >>>> +++ b/xen/Makefile
> >>>> @@ -411,6 +411,8 @@ ifneq ($(CONFIG_CC_IS_CLANG),y)
> >>>>  CFLAGS +=3D -Wa,--strip-local-absolute
> >>>>  endif
> >>>> =20
> >>>> +$(call cc-option-add CFLAGS,CC,-ffile-prefix-map=3D$(XEN_ROOT)=3D.)
> >>>
> >>> This is lacking a comma:
> >>>
> >>> $(call cc-option-add,CFLAGS,CC,-ffile-prefix-map=3D$(XEN_ROOT)=3D.)
> >>
> >> And then, having tried the correct form (seeing the option then is pas=
sed
> >> to the compiler), I can't spot any difference in the resulting
> >> xen-syms.map. There were a few absolute paths there before (for
> >> arch/x86/x86_64/kexec_reloc.S and arch/x86/acpi/wakeup_prot.S), and the
> >> exact same ones are present afterwards.
> >=20
> > I'm not sure about xen-syms.map, it's about build path included in
> > xen-syms. It appears at least once in .debug_str and once in
> > .debug_line_str.
>=20
> In which case -fdebug-prefix-map=3D may suffice, which is available on
> more compiler versions? And then only if DEBUG_INFO=3Dy?

Oh, and xen.efi is full of build path. Binary on plain staging has 790
occurrences. But there, -fdebug-prefix-map=3D also helps.

But also I don't think -fdebug-prefix-map=3D will be enough for tools, it
looks like at least libxl has build path embedded in .rodata too.

> > But also, I see the patch lost a chunk during rebase (from before
> > 4.17...), that adjusts XEN_ROOT to use $(realpath ...). That's the part
> > even mentioned in the commit message...
> >=20
> > I'll send v2 shortly.
>=20
> Provided there's actually a need. I was in fact wondering whether this
> was known to have significant effect prior to Anthony's work to make
> out-of-tree builds possible (plus less related adjustments), but may
> have lost most of its functionality since then (yet was still carried
> forward for all the time).

There are clearly some build path embedding left. And
-ffile-prefix-map=3D/-fdebug-prefix-map=3D doesn't work correctly with
XEN_ROOT having xen/.. at the end.
BTW, would it be acceptable to have this?

    $(call cc-option-add,CFLAGS,CC,-fdebug-prefix-map=3D$(realpath $(XEN_RO=
OT))=3D.)

It may be less efficient (if make doesn't cache result), but helps
especially in tools, where XEN_ROOT is set in _a lot_ of places.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--zbbruPcfNXoBnAyX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmfayVEACgkQ24/THMrX
1yxB/Qf+L9ORO+eBWkhvV6rA3gtBfaXlz+S6sfaHx/o3Li2MLGvBgTSa3yNSPc34
6mqczOHvKDikWtIo9yUzrcgZG65K/laDBOTJFF5oKl5SYj8ClS9ZVjl2BdnP//CG
6wJoLaJoTiwq23y5K2QWa4+Jjt6UznNyt11ObhiuQEzudIDgpXzVvY/dGfdwv6I7
Sn+Gs9E63CCGK6RJiXNeVJIVvksLoeyyrDt4Pxnogr2KX4Wj6Ksj/3E0fHLmI2lC
hq/DPXBgQEPRBfTAD5mbgVMm7sBxGxFPOPnl7DPTjx/nP5lTopAOa54XEcVJldRX
0lsYW9AQH6pBrB4VGSfOJZLnaF/QvA==
=mAAN
-----END PGP SIGNATURE-----

--zbbruPcfNXoBnAyX--

