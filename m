Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A11ACF254
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 16:51:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007005.1386275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNBwJ-0002jr-5X; Thu, 05 Jun 2025 14:51:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007005.1386275; Thu, 05 Jun 2025 14:51:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNBwJ-0002hQ-2e; Thu, 05 Jun 2025 14:51:31 +0000
Received: by outflank-mailman (input) for mailman id 1007005;
 Thu, 05 Jun 2025 14:51:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B23G=YU=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uNBwH-0002ge-UB
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 14:51:30 +0000
Received: from fout-a4-smtp.messagingengine.com
 (fout-a4-smtp.messagingengine.com [103.168.172.147])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f160b73-421c-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 16:51:28 +0200 (CEST)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfout.phl.internal (Postfix) with ESMTP id 23A8713802AB;
 Thu,  5 Jun 2025 10:51:27 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Thu, 05 Jun 2025 10:51:27 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Jun 2025 10:51:25 -0400 (EDT)
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
X-Inumbo-ID: 8f160b73-421c-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1749135087;
	 x=1749221487; bh=gfg+NcyQfuLhm0vT8GeOOJR34EtiYSk1+xB/aBcVMmw=; b=
	XeLv3gNulUCMrxNTOXfq8CddMxvkJ1XbUkh7IIb2l0uRPEYCZBq9OOKv03eyHtAl
	p4nG5aW/yY9IabnFWOlwt5ywdlxrk07sAaF/7kW131unZYcMyj+BWLY0umNATf5T
	sFVCGlXeKSa8A5foPqi8WmzrMgPkHY/tULF5cnJpXa7TvCTn6vOT0ElZlBTjXiWu
	xEpykHNs0IM+EefiUaBmVg5LD+ST5v9M0fPBAdT7wNweJZnrPOpSuKRY7ScrGjCs
	0HA7ssXl6ev4WqsnTu3D7FnncNTOa3OJjCZV/h5LnfA9u+up49p1cNISfww7jXKS
	NCVxuMv1yb8TvYSuf/peTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749135087; x=1749221487; bh=gfg+NcyQfuLhm0vT8GeOOJR34EtiYSk1+xB
	/aBcVMmw=; b=bcf9QxT6zPX0BwHKLuQp62TO3NqpB+ieDHWXx4/XCp8sDC3df36
	OWQJwTluwKg9YADA5tFuv7JcHxgkiX7mgn8Cxoa8+qztdyUojg6fBG/Uo0Zr/p81
	C8+f1W9C5Ff9+k4HFndYx1CMLe73LARpaApz8+R6TXNCtBg6ZtsSFSmd9pGjoPlw
	V2YcxZ+RsbpWot18SHknfbigcPfEchSvRI8dfdEwtSK9sJ1pXFwi6+2+rsnzq75W
	eS9k2XqXSscs1blOBwAcVXekplUV9WzJHqnlfVJM47TjdmOu09xKf5ui+Yj3SQKq
	miP8nWpKpfQWWS3GxNwCN32V958pphyZsPw==
X-ME-Sender: <xms:7q5BaKA_RWNVC2iUCQsut0m-pKm-_x6DoQec1bF8C8uNrD7zwlE3Tg>
    <xme:7q5BaEjzGyuWJ7orD8YIXE57fg0vX65DbKNhigjbjZM6hNtfqx_xQaCsrzPXIhxhi
    hUtdUooU2zcdw>
X-ME-Received: <xmr:7q5BaNmdOSXDCDhjeG2wvr2rSspWc-gOM4D7Q1gTgEpg634R5yjbGohbHCPFYkeZpB0Y1JtPDZtpHXPIHhI3BXoxBptiXXDiszM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdefjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettddvge
    euteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnh
    gspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgsvghu
    lhhitghhsehsuhhsvgdrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsth
    hsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehrohhgvghrrdhprghusegt
    ihhtrhhigidrtghomhdprhgtphhtthhopegrnhhthhhonhihrdhpvghrrghrugesvhgrth
    gvshdrthgvtghhpdhrtghpthhtohepmhhitghhrghlrdhorhiivghlsegrmhgurdgtohhm
    pdhrtghpthhtohepjhhulhhivghnseigvghnrdhorhhgpdhrtghpthhtohepshhsthgrsg
    gvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughrvgifrdgtohho
    phgvrhefsegtihhtrhhigidrtghomh
X-ME-Proxy: <xmx:7q5BaIyXSJS6Z5rmm6p5B4ZroYjwIiF1dHaaStMpmTPaaHQo7QUwPQ>
    <xmx:7q5BaPQSZLQSk9frLixydg-R7QMxyPxKiO96Mww0cNicMo-2mt7iFw>
    <xmx:7q5BaDbmeUm7XMyU_jaKmqETVi5H_5yNqD-eUHRrygYL8VxYeb3ZmQ>
    <xmx:7q5BaIQaIU7h5D50ZrXKDVC53YEVjYOyrAu4pYTSC56MeVYwDkPOBg>
    <xmx:765BaBGYpLBqq7zp8ZYcGB0up4wY5aWbGZxjjCabhGS7RN3F_eeeMTAR>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 5 Jun 2025 16:51:23 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v1 1/5] console: add relocation hook
Message-ID: <aEGu6-6dGqc_WUlg@mail-itl>
References: <cover.defc562b917978814c8359bbd04f1dadba33fb77.1748182535.git-series.marmarek@invisiblethingslab.com>
 <4f1889dc03ec4aa2cc0cd2bd14523a2c6f670bdb.1748182535.git-series.marmarek@invisiblethingslab.com>
 <0b17da9c-57db-4a8b-90af-e53e45cb1243@citrix.com>
 <aDSLNeFRZWoxMTEt@mail-itl>
 <66cfdee6-5dc2-4139-8550-ef441fa7a7a0@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hAch/rFUOg5PeioD"
Content-Disposition: inline
In-Reply-To: <66cfdee6-5dc2-4139-8550-ef441fa7a7a0@suse.com>


--hAch/rFUOg5PeioD
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 5 Jun 2025 16:51:23 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v1 1/5] console: add relocation hook

On Thu, Jun 05, 2025 at 04:42:53PM +0200, Jan Beulich wrote:
> On 26.05.2025 17:39, Marek Marczykowski-G=C3=B3recki wrote:
> > On Mon, May 26, 2025 at 04:08:17PM +0100, Andrew Cooper wrote:
> >> On 25/05/2025 3:15 pm, Marek Marczykowski-G=C3=B3recki wrote:
> >>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> >>> index 25189541244d..3ef819a252e4 100644
> >>> --- a/xen/arch/x86/setup.c
> >>> +++ b/xen/arch/x86/setup.c
> >>> @@ -1481,6 +1481,8 @@ void asmlinkage __init noreturn __start_xen(voi=
d)
> >>>          highmem_start &=3D ~((1UL << L3_PAGETABLE_SHIFT) - 1);
> >>>  #endif
> >>> =20
> >>> +    console_init_pre_relocate();
> >>> +
> >>>      /*
> >>>       * Iterate backwards over all superpage-aligned RAM regions.
> >>>       *
> >>> @@ -1606,6 +1608,12 @@ void asmlinkage __init noreturn __start_xen(vo=
id)
> >>>      if ( !xen_phys_start )
> >>>          panic("Not enough memory to relocate Xen\n");
> >>> =20
> >>> +    /*
> >>> +     * Notify console drivers about relocation, before reusing old X=
en's
> >>> +     * memory.
> >>> +     */
> >>> +    console_init_post_relocate();
> >>> +
> >>
> >> With reference to the next patch, there are printk()'s in this region
> >> which want to work (in case something goes very wrong), so I don't thi=
nk
> >> setting dbc->suspended is the best approach.
> >=20
> > I guess the post_relocate hook might be moved a bit earlier, but still,
> > once relocation happens, the xhci console is not functional until it
> > gets relocated too (for example - it would post new TRBs into a ring
> > that isn't actually monitored by the controller).
>=20
> Why is it that this ring is dependent upon Xen's position? If the ring was
> dynamically allocated, it wouldn't change position when Xen is moved.

The console is setup quite early, I don't think I can allocate memory at
this stage, no?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--hAch/rFUOg5PeioD
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmhBrusACgkQ24/THMrX
1yy1XAf+I/S6cMtPZeGZosKFALu2NRpDqrK1ddIApICIzIjEbdjTISDHE/z+B7R0
uN3qQrfVGq5RneXgUHmfrdFm1tLcktzoNrPR5Z2ExX/jdL+53sHVSdaKuZR4NhIr
wI1nna0WGpBqFucBYDqWiDYh04GoFr+CoKEW8UmvAtEk0x74R0zRMKv0DpJ0LEva
vrUo5beAZhaC6ujMqxyyQUqVQFDnFHJPBIXMN5X98/y7OvnF3skSwsp6BoPL5a6u
ag4axr/+NzgjNRAmsa+RF3rVg/BFc5lBCvb019n3prV9humDEe5g4wwnnoNeLRQ2
8giSyRIccC4ocusnktxwZqj9yDoYEA==
=+AUt
-----END PGP SIGNATURE-----

--hAch/rFUOg5PeioD--

