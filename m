Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3296BAD37B9
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 15:01:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010771.1388961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOybg-0003ih-CZ; Tue, 10 Jun 2025 13:01:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010771.1388961; Tue, 10 Jun 2025 13:01:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOybg-0003fd-9F; Tue, 10 Jun 2025 13:01:36 +0000
Received: by outflank-mailman (input) for mailman id 1010771;
 Tue, 10 Jun 2025 13:01:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fiUs=YZ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uOybf-0003VU-5e
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 13:01:35 +0000
Received: from fout-b1-smtp.messagingengine.com
 (fout-b1-smtp.messagingengine.com [202.12.124.144])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08588eab-45fb-11f0-a306-13f23c93f187;
 Tue, 10 Jun 2025 15:01:33 +0200 (CEST)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal
 [10.202.2.48])
 by mailfout.stl.internal (Postfix) with ESMTP id F2DAA1140138;
 Tue, 10 Jun 2025 09:01:31 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-08.internal (MEProxy); Tue, 10 Jun 2025 09:01:32 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Jun 2025 09:01:29 -0400 (EDT)
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
X-Inumbo-ID: 08588eab-45fb-11f0-a306-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1749560491;
	 x=1749646891; bh=pRcD5pALVM0dFl9dfhRKDUY0teVuhxRxNF8HPHYofwQ=; b=
	cXdel6H68HXY5s19eg0J3nO3qUi7svHFC4JC4f/y9kGwCgUvogumIEp5V/aWSnNP
	s6FbEwcKw6GESxTkT/WmJX3JYj0N8MHqnTd358R78QzT543oCar0EVbioh+GaxeQ
	IKdyRli4NVgyYYBJf7Znh1YEam2uhN3UyC9iXMfzDwfzyr5pQW6TVOAkoy2PjUJE
	DZL6YHamUha88N2C5yL81Gm8Of+FRsuJOfaNlQqDpcL3fsRX26oMUFxy5nMt3g71
	S/TiHeujBzMvQlDNqnFDrXIjpblLLXVJWy2YjRcAs/VsFQfx3ir1bXg1ezsgzooU
	dIIkF+h+fredSB70K1OOrg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749560491; x=1749646891; bh=pRcD5pALVM0dFl9dfhRKDUY0teVuhxRxNF8
	HPHYofwQ=; b=ZYBmfduLtM9Lz5yH0ngYcoL/MAyphV4r4Qed3PcGNZIU09PIgId
	wPq/gBwB27b5hnS4fmKPlir4bZ296ErZK75M2voscXHIRtFTee9HWAyfDXuTmskd
	JFOdMXqznCtWEb0LaXWrqm4Pk20xtiYClmItzkzXPPxoR3zCRZP2uH0h5a0XluDE
	yC6KcKErIzMZAW00S4txK3Czt4RzqMIB/FBMoSlMd1QqKlMFtBHjepFW+wfbYF/J
	p5chM/bHf7Hnq3b7Ag3XBnyIaQp3d1WckfgDJKV5wsqtF/zMg+pwgnGjeDUksWdb
	3ycW2T52pFm5OxkN3EaWDH5mdaG5ODthneA==
X-ME-Sender: <xms:qyxIaHMD-AVqRJTQDkCuHvCqo0F9UIqe516FAHN-TcstnGnUtZhE9g>
    <xme:qyxIaB_mrI3WK02oBc4Fn1gMFGJUzTXUA8fxUbgetJnuUDB3wYHnjoaGy6jhFvBrO
    7Fn2NKpiHrlog>
X-ME-Received: <xmr:qyxIaGQtUqc7yHBvECMcymqKU_HDpIkWwmX9eAfRUqkbjG9hnfMITAgyaZ2Q9JPUVF15XwjSv-3fInHoHAmIwx6pAKgrZbIACEA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddutdejjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdej
    necuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoe
    hmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucgg
    tffrrghtthgvrhhnpefgudelteefvefhfeehieetleeihfejhfeludevteetkeevtedtvd
    egueetfeejudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpd
    hnsggprhgtphhtthhopeekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhgu
    rhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtohepjhgsvghulh
    hitghhsehsuhhsvgdrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhs
    rdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehrohhgvghrrdhprghusegtih
    htrhhigidrtghomhdprhgtphhtthhopegrnhhthhhonhihrdhpvghrrghrugesvhgrthgv
    shdrthgvtghhpdhrtghpthhtohepmhhitghhrghlrdhorhiivghlsegrmhgurdgtohhmpd
    hrtghpthhtohepjhhulhhivghnseigvghnrdhorhhgpdhrtghpthhtohepshhsthgrsggv
    lhhlihhniheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:qyxIaLuX2OdaSjRLM2qggC3ovvxQRPU_YyPRXshsZJU9Y5aUYph5Hw>
    <xmx:qyxIaPdgMpZC2Bhyl0MyLk-d9xyh99qHLzTZkj3jhydp3l6XtFYS8Q>
    <xmx:qyxIaH3PK0370JWnnwX_ENx_XrnL16vy4JSoFkwYa1c7l6fLIJ216A>
    <xmx:qyxIaL8361cVzZT5nHvcKgNrqsblzErAWtPkoXaqY0t17mfEu1VSBQ>
    <xmx:qyxIaNRibXoDFvrBldmx8mJUpqNFcyCdNFDefl5N63MXOs6OBzYZD31j>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 10 Jun 2025 15:01:27 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 1/5] console: add relocation hook
Message-ID: <aEgsqOghLiYMQ3M0@mail-itl>
References: <0b17da9c-57db-4a8b-90af-e53e45cb1243@citrix.com>
 <aDSLNeFRZWoxMTEt@mail-itl>
 <66cfdee6-5dc2-4139-8550-ef441fa7a7a0@suse.com>
 <aEGu6-6dGqc_WUlg@mail-itl>
 <ea285192-c39c-43b4-a879-7ca4ff7f9b4a@suse.com>
 <aEHBAsLFvZni1_5Y@mail-itl>
 <83c22da9-62c5-4fb2-bc2d-f34ad5956d3e@suse.com>
 <aEMPMa0-1XwlbsPM@mail-itl>
 <cb408883-c6c7-4cd3-819c-0e5978086dd2@suse.com>
 <480626d3-550a-4836-adc3-0af96d7e1fd7@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="k9kRAc7EJmbiy7Tp"
Content-Disposition: inline
In-Reply-To: <480626d3-550a-4836-adc3-0af96d7e1fd7@citrix.com>


--k9kRAc7EJmbiy7Tp
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Jun 2025 15:01:27 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 1/5] console: add relocation hook

On Tue, Jun 10, 2025 at 01:54:04PM +0100, Andrew Cooper wrote:
> On 10/06/2025 8:52 am, Jan Beulich wrote:
> > On 06.06.2025 17:54, Marek Marczykowski-G=C3=B3recki wrote:
> >> On Fri, Jun 06, 2025 at 08:26:33AM +0200, Jan Beulich wrote:
> >>> On 05.06.2025 18:08, Marek Marczykowski-G=C3=B3recki wrote:
> >>>> On Thu, Jun 05, 2025 at 06:05:02PM +0200, Jan Beulich wrote:
> >>>>> On 05.06.2025 16:51, Marek Marczykowski-G=C3=B3recki wrote:
> >>>>>> On Thu, Jun 05, 2025 at 04:42:53PM +0200, Jan Beulich wrote:
> >>>>>>> Why is it that this ring is dependent upon Xen's position? If the=
 ring was
> >>>>>>> dynamically allocated, it wouldn't change position when Xen is mo=
ved.
> >>>>>> The console is setup quite early, I don't think I can allocate mem=
ory at
> >>>>>> this stage, no?
> >>>>> But you allocate before Xen is moved, I suppose.
> >>>> Well, I have those buffers in BSS exactly to avoid the need to alloc=
ate
> >>>> them (or rather: have bootloader allocate them for me).
> >>> Yet them remaining in .bss is now getting in the way. Imo moving them=
 to
> >>> .init.* and adding proper allocation is going to be easier than the h=
ook-
> >>> ary you are proposing.
> >> So, when would you propose to allocate them? Wouldn't that be yet
> >> another hook?
> > Exactly one, yes. Given Andrew's earlier reply my understanding was tha=
t to
> > get things correct in your proposed model would end up requiring more t=
han
> > one. However, the point in time where move_xen() is called is still too
> > early to allocate memory a (somewhat) normal way - even the boot alloca=
tor
> > gets seeded only later. So I guess console_init_preirq() may need to in=
form
> > its caller how much memory is going to be needed later on (and what add=
ress
> > constraints there are, if any). Then a suitable chunk would need setting
> > aside kind of like it's done for kexec. That address would then need to=
 be
> > passed into the new hook.
>=20
> How about initialising the console using _va(_pa(xxx)) of the Xen
> datastructures?
>=20
> Xen is mapped into the directmap (pagetable handling depends on this),
> so these pointers will work right from the very outset, and will
> (intentionally) refer to the old position.
>=20
> After relocation (specifically, before we free the old Xen image), we
> can drain in-flight requests and update the pointers.

Ah, you mean to use directmap to access the ring pages. Yes, that should
work, and should be enough to not need the pre-relocate hook. The post
relocate would still be needed though (none of existing console init
hooks fits this purpose). I'll try that approach.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--k9kRAc7EJmbiy7Tp
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmhILKgACgkQ24/THMrX
1yzeyQgAmq+Y/Ug1zIi0Rg2V5AlPB+YeZ65onfb5omWiXxaO05H2b3BTYgl2MLdr
46UGnt977IzBOkt40o8oVVks652fuuJrwZ0Jy/dMfPsR8q43KNI94AoVy61VD/hc
P0QYWvzZqLGzWhLwD4TGRN4A2RSd4W0usQSW8SAt5EdPwT09ncLm9piZo9Aly4je
YMjkAsAQhIL+HZkm1lFS0Nm8NuH63jCapRn0IzKv9moKhg6K4GjJCqg/ffGZ63jQ
cFv9Dg8nEq7J3SzALqNW+wdmJdP8cxBiN6qwWGVjfS+zLQYbbKfpLxXznTu/3w7T
FW2UkAvmiftHuA2809N/pTK4edzdDw==
=QPrn
-----END PGP SIGNATURE-----

--k9kRAc7EJmbiy7Tp--

