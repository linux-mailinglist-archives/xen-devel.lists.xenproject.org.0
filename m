Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B17A82644
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 15:29:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944030.1342605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2VUH-0001V4-3N; Wed, 09 Apr 2025 13:29:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944030.1342605; Wed, 09 Apr 2025 13:29:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2VUH-0001T8-0W; Wed, 09 Apr 2025 13:29:05 +0000
Received: by outflank-mailman (input) for mailman id 944030;
 Wed, 09 Apr 2025 13:29:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=np/6=W3=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u2VUF-0001T2-Ao
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 13:29:03 +0000
Received: from fout-b5-smtp.messagingengine.com
 (fout-b5-smtp.messagingengine.com [202.12.124.148])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98b67a66-1546-11f0-9eab-5ba50f476ded;
 Wed, 09 Apr 2025 15:29:01 +0200 (CEST)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfout.stl.internal (Postfix) with ESMTP id 982101140126;
 Wed,  9 Apr 2025 09:28:59 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Wed, 09 Apr 2025 09:28:59 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Apr 2025 09:28:57 -0400 (EDT)
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
X-Inumbo-ID: 98b67a66-1546-11f0-9eab-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1744205339;
	 x=1744291739; bh=nwKHfm9obr9oR8qaXDPa6mbV4VTD//5H0BhCvn+VrxM=; b=
	LeBs8B370E+whnYJZV2NDnoYDeltuD7o34P0Ps07/Tc5u1BAWJV/Uma4QW+eOm0C
	dYtB3oSKXZsTEhGwDo+gADtaMorQDw+sLbJTqOctbcbflHk0AZHIroOCNyu/apVC
	FY3VU5PCiaoKS2qi0emMFBwiKeT27e7Bextk8umM/uSOCkGKgEvzgv1N3rvmMazT
	axh/FjWBkAWUS+MT0AzxajlLwahagjlc5J9iOCq52wmWmCdYxzKtCowJFDx2Y+T9
	bPm9NgJCphjMkdYZMSiX/DUalKmhNPiiA+gmhjpIfpFqqhUiKQAikA+EgmA9zwjc
	znQR4dkrUyfzY+sBTbltNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744205339; x=1744291739; bh=nwKHfm9obr9oR8qaXDPa6mbV4VTD//5H0Bh
	Cvn+VrxM=; b=Yq89phOqbxAF7NbCXg+scAOP2wKQrm0R8E/3mWGMBnR2JNxEdRC
	MqXI6uGENy3eVllUwi1dppP/QALoAKyyHIKcV8G+5UmctZ7S4eX+yNif5ZUT59e3
	hYtd0R/wGF58QoFwTnmSu0VgAdgJw71Ogf9DT1Xh2mdniim7xtdQBGKoWjcUIfXF
	MTmvLFN/+ap5QTVmM8XwTmRZzfNAAf8HRznV+a3D1EN3x4xZu1LEmjtBTh0hUFbF
	A+kRG4urb6x3k3wOdvJnIBBFVImDRowrYCGWn7s2JUhHAh60/+9Gy6oIarfxgL9h
	ehWTU+l4R9EIer9lvtGoU0cLwpdpVpwIBRA==
X-ME-Sender: <xms:Gnb2Z5Qt8b4XqZbpNkeXuhrz66vgwm38-6upbcKJ3m8Oj-AmzxNsgQ>
    <xme:Gnb2Zyx8CaBmY05CcFQ7WoxYOY-lmEQ4m9kMEFiGdl0_GjiYFkWGJhtF0KNU40FU2
    2KjZp6ihDBfug>
X-ME-Received: <xmr:Gnb2Z-2-iUEIB1N0xCSo_4pwsQDHJqX5phztu0vTPkvDQUsvleKBleaad0jDw9yfDPzlXsYJcaflh2YklFhMZz8MHp1uU1sW4w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeiuddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepveeujeetgeelleetudeuvefhtefgffejvedtvdfgieevheethe
    elgeeuledvjeevnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeeipdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghith
    hrihigrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhp
    rhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnthhhohhnhidrphgvrhgrrhgusehvrg
    htvghsrdhtvggthhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehmihgthhgrlhdrohhriigvlhesrghmugdrtghomhdprhgtph
    htthhopegtrghrughovgestggrrhguohgvrdgtohhm
X-ME-Proxy: <xmx:Gnb2ZxCljnYJin0gQU2bE6eaX2phTa6V2hyzX4FfSbI2bPSl2czA3g>
    <xmx:Gnb2ZyhsDOrJ0whkrgi8twjZv2VIHCjqaflZSc_GNWmbih3y5Y5OMg>
    <xmx:Gnb2Z1qZPLa4pWUz8WqY0ZtaRXPBUyYwryD-Msw60c6Na973-lZpNw>
    <xmx:Gnb2Z9i4KefHzTkefdYmjZyM8R7NCbOXIjFdlytClFnm1q38DCPFHA>
    <xmx:G3b2ZxyOyg8AhVETSwG-ZN0qeyWWSdLcyujXqeSt6_qBARpHWF--ekSr>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 9 Apr 2025 15:28:53 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH] CI: Update x86 tests from Linux 6.1.19 to 6.6.56
Message-ID: <Z_Z2F4EvxqPB35bh@mail-itl>
References: <20250409130505.2011604-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8cWod6rD7BGAt/AV"
Content-Disposition: inline
In-Reply-To: <20250409130505.2011604-1-andrew.cooper3@citrix.com>


--8cWod6rD7BGAt/AV
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 9 Apr 2025 15:28:53 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH] CI: Update x86 tests from Linux 6.1.19 to 6.6.56

On Wed, Apr 09, 2025 at 02:05:05PM +0100, Andrew Cooper wrote:
> Linux 6.6.56 was already added to test-artifacts for the argo testing, and
> this removes one moving part while cleaning things up.
>=20
> Drop the associated export job, and dockerfile.

My hw12 runner series adds CONFIG_USB_RTL8152, there are also other
series that needs extending kernel config. Is there some better way of
handling such series than sending patches to two repositories? Maybe
test-artifacts.git scripts could pull some parts from xen.git? But the
committing order would still be weird (commit kernel change into
xen.git, rebuild test-artifacts, commit the rest to xen.git)...

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Doug Goldstein <cardoe@cardoe.com>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
>=20
> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1760198654

This still waits in the queue for adl and kbl. But should be good, given
it worked also with 6.12.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--8cWod6rD7BGAt/AV
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmf2dhcACgkQ24/THMrX
1yzrpggAipsPgSgOzUYaXBhXrSMYxithk1XLhN68WWivIO8S4n70jiZhQ6qmyQZJ
cV9Nq07BYLXSUs7AR4iHGvLxY0GMPf4QuaR8Kx3b1EGURAyaY/emqHz7IMLTi4oD
JJjjM7P+BZ8JAHnRQWSwBYiGsJ7/vHbbYNQeA0O03BNo6Y1TE4MabYBHazc7th1b
km0honAPxLQLlfMglQXPjFbHt0Y5GWURIAU33O20mn/eQ9z1bWKvfnEY8/zFX+3f
eRyDQEyw/vkfSJtqO2Qp+KKwilGjSH7Ore7dsnBljFGdTP37NLbB/pB2LcJddKyl
+BvDtWkgU7rdnYn9af/HNK9romz0rg==
=11i1
-----END PGP SIGNATURE-----

--8cWod6rD7BGAt/AV--

