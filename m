Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8304A6A7C4
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 14:59:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922087.1325962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvGQT-0007RJ-No; Thu, 20 Mar 2025 13:59:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922087.1325962; Thu, 20 Mar 2025 13:59:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvGQT-0007Pm-Jp; Thu, 20 Mar 2025 13:59:13 +0000
Received: by outflank-mailman (input) for mailman id 922087;
 Thu, 20 Mar 2025 13:59:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W2V2=WH=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tvGQS-0007Pg-2g
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 13:59:12 +0000
Received: from fhigh-b7-smtp.messagingengine.com
 (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7edae741-0593-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 14:59:10 +0100 (CET)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal
 [10.202.2.49])
 by mailfhigh.stl.internal (Postfix) with ESMTP id D33FF2540043;
 Thu, 20 Mar 2025 09:59:08 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-09.internal (MEProxy); Thu, 20 Mar 2025 09:59:09 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Mar 2025 09:59:06 -0400 (EDT)
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
X-Inumbo-ID: 7edae741-0593-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1742479148;
	 x=1742565548; bh=menqTGC5jv34nVyrYSvpopaD1UUjKRWyU5VisiDKQ+k=; b=
	hBcmBzrrqKllqr3GLCSvXOEwyx2LSLk36Ne0AUZQnAMgZ0Pn6mFTRFYke7jRKMgS
	K1XoAzS9xobsm4v0eYF1+PRx/RBDW3K1C+vnWyfjGm0XwsAppLthibjVC7kI02g+
	sx1JPvWDC2C7Ttmc3S81kHBVhpF1OScIlrvXMw+fP64LIWKmHdJHLhuw7nnBHf44
	VjxtW4MRe2JjtZ1ZWTovjQ9QFjmD221xG+TIrwDbKSzhtKCzFYiLDxqqZrF4OTL1
	Osq6r5383y0BTkPBooKWPSLeUNsAdrBLfbMTnLkC08ScF6opWZ6FkkcGgmQjVbED
	CW3lD50FUo3Ten1nzNUj9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1742479148; x=1742565548; bh=menqTGC5jv34nVyrYSvpopaD1UUjKRWyU5V
	isiDKQ+k=; b=B9N7JJGclL1j1fJ8eGhR2AfPqG6TyLUTJnHH3KFXu3nXWxXCeAT
	zYgCsiJIkOpp56mcG1iqGrmWoMSGBs08Pfwfb6XnXoSyK5fI5mCDtydQtwLNGkT2
	fnTRc9/e/VuYVWqC4deNgkuInkGaIcYuyXh7gOokUx6KOsSBvyWjtFDH80LFC1Og
	37za+SsJUjF1DhYO7EtKMxXk9oK++DEiQk2ucbwICoeyJtsdLGJW5dyHT/VSmyrP
	h275XgBLUxO9TPKhZm7nkjUqwUzVsmyXLA1uD5E8jDJ38BaqhcSNxXDwryzjq0Sl
	jHGWteHaibc3KYSCjxVUSBLIhaaqcKhm/KQ==
X-ME-Sender: <xms:LB_cZ0hXwkBzwYLRx6LFELUrsCwDJHDGsCdJSd2kRGIWYDWYYMFAxQ>
    <xme:LB_cZ9D1f1uSpSTT3wSw7HRHWqg-PBJIpZvIl35s80k_R7LZL1SYUFZb8VLNycYLQ
    AbWuBoipDi9OQ>
X-ME-Received: <xmr:LB_cZ8HhdN8DE2Bq40i5sGGM5R1KCJQTXggPKr93a0gvkEXcQ-P1y-vUi_u1bDkwSOHkU87-detTdde5pPEzcJvRO-_H5toMFA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeekgedtucetufdoteggodetrf
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
    hrrhgvthesqhhusggvshdqohhsrdhorhhgpdhrtghpthhtoheprghnughrvgifrdgtohho
    phgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopehmihgthhgrlhdrohhriigvlh
    esrghmugdrtghomhdprhgtphhtthhopehjuhhlihgvnhesgigvnhdrohhrghdprhgtphht
    thhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomhdprhgtphhtthhopehsshhtrg
    gsvghllhhinhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopeigvghnqdguvghvvghl
    sehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhhthhhonh
    ihrdhpvghrrghrugesvhgrthgvshdrthgvtghh
X-ME-Proxy: <xmx:LB_cZ1TxZuho7mCqoONr0TTJRB2Snb4wjtNlJ5o9yw8OAJWlPoxYRQ>
    <xmx:LB_cZxz9Wf4EqrVXn2p89iakA6sIwEFh1fjskge4_8lP1dzqRBDRkg>
    <xmx:LB_cZz6JbkTv-3WqLDgHWKsLkIuZQyuMy4URW1M2jelIRDXByg_quw>
    <xmx:LB_cZ-y0Iy5_lKweLCi8yxLxVRpIXhn8az67ik4Es5uRQyegEYGLxg>
    <xmx:LB_cZxcPK8dv_zwIucD-tqTDpr0s-OsqSVdRLHN5Prx6nlFw2yCYV5AG>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 20 Mar 2025 14:59:04 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: =?utf-8?Q?Fr=C3=A9d=C3=A9ric_Pierret_=28fepitre=29?= <frederic.pierret@qubes-os.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH v1 2/2] Strip build path directories in tools, xen and
 xen/arch/x86
Message-ID: <Z9wfKB0vdngn3xXX@mail-itl>
References: <cover.a5cb9c3a17249fc067ab501818c3a3e6c7c229cf.1742317309.git-series.marmarek@invisiblethingslab.com>
 <0370c0eb1fd9ac00acab016792132fa0b943d384.1742317309.git-series.marmarek@invisiblethingslab.com>
 <017d5c41-d4ea-4d91-b6ec-b4660e7325ae@suse.com>
 <e112ecca-b891-4c23-ace1-8128e586cb94@suse.com>
 <Z9qxcRtap-k-wW8B@mail-itl>
 <943644a3-45f2-46ef-a54b-6dd0bc6171ed@suse.com>
 <Z9rJUWCARMQYqNXr@mail-itl>
 <Z9vrc1Xvm5OEy8rM@l14>
 <Z9wPVGd0fEsbaO_s@mail-itl>
 <a9831a95-2828-4b46-8cae-58b2c531f507@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Nj8fbVXqtF1UaXKL"
Content-Disposition: inline
In-Reply-To: <a9831a95-2828-4b46-8cae-58b2c531f507@suse.com>


--Nj8fbVXqtF1UaXKL
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Mar 2025 14:59:04 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: =?utf-8?Q?Fr=C3=A9d=C3=A9ric_Pierret_=28fepitre=29?= <frederic.pierret@qubes-os.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH v1 2/2] Strip build path directories in tools, xen and
 xen/arch/x86

On Thu, Mar 20, 2025 at 02:49:27PM +0100, Jan Beulich wrote:
> On 20.03.2025 13:51, Marek Marczykowski-G=C3=B3recki wrote:
> > On Thu, Mar 20, 2025 at 10:18:28AM +0000, Anthony PERARD wrote:
> >> On Wed, Mar 19, 2025 at 02:40:33PM +0100, Marek Marczykowski-G=C3=B3re=
cki wrote:
> >>> There are clearly some build path embedding left. And
> >>> -ffile-prefix-map=3D/-fdebug-prefix-map=3D doesn't work correctly with
> >>> XEN_ROOT having xen/.. at the end.
> >>> BTW, would it be acceptable to have this?
> >>>
> >>>     $(call cc-option-add,CFLAGS,CC,-fdebug-prefix-map=3D$(realpath $(=
XEN_ROOT))=3D.)
> >>
> >> Hi,
> >>
> >> Could you avoid using $(XEN_ROOT) in hypervisor build system? (It's fi=
ne
> >> in "tools/"). In "xen/", there's a few variables you can use if they a=
re
> >> needed: $(abs_objtree) $(abs_srctree) for absolutes path, and $(srctre=
e)
> >> $(objtree) for relative path. That also should avoid the need to use
> >> $(realpath ).
> >=20
> > XEN_ROOT is literally "$(abs_srctree)/..". And I need to resolve it to
> > not have /.. for prefix-map to work correctly. Would it be better to use
> > literal $(realpath $(abs_srctree)/..)? Or use just $(abs_srctree) and
> > have paths in debug symbols relative to hypervisor source dir, instead
> > of xen repo root? I'm not sure if that wouldn't confuse some tools...
>=20
> abs_srctree being computed using realpath, can't we replace
>=20
> export XEN_ROOT :=3D $(abs_srctree)/..
>=20
> by something as simpl{e,istic} as
>=20
> export XEN_ROOT :=3D $(patsubst %/xen,%,$(abs_srctree))
>=20
> ?

That works too. It's slightly less robust, but I don't expect "xen"
directory to be renamed, so shouldn't be an issue. I'll leave also a
comment there why not /.. .

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Nj8fbVXqtF1UaXKL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmfcHygACgkQ24/THMrX
1yzrHgf/f1+eSQHuNyDq3mHwvYioXWRk3V2bDDzqSIxS3dKR3XkKI9SsF76zHv9U
a94xrpcCXslaHKSIfG5Wr+6lqVEL0XbZKiCIKNhIcNKZBZ/9jedVCQ/il8XxVPG5
9FlG4o856C4mGssI9sBnHidFW8RoyYFdk/aXrNTJyoknHnadc1Gy0pGM+kkK0P8M
xyixbET7i8swY+4samUuvs9sJv71JyOAPGKlqvYdXhO4bAI9STWVuEmazzTpd9zm
tN3X+9uHoMrDSMuR000Mq5Hgv6Ng2N3mkjmNpXy/QzMVXMVKIhGaua5SLv0cejZj
YWeK+SxuAbzIoILoaVCV6Sr6PygHXQ==
=F2Vx
-----END PGP SIGNATURE-----

--Nj8fbVXqtF1UaXKL--

