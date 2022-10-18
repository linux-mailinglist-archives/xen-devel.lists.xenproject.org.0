Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFDE602B07
	for <lists+xen-devel@lfdr.de>; Tue, 18 Oct 2022 14:02:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424972.672683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oklIR-0003Fx-JP; Tue, 18 Oct 2022 12:02:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424972.672683; Tue, 18 Oct 2022 12:02:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oklIR-0003DE-FC; Tue, 18 Oct 2022 12:02:11 +0000
Received: by outflank-mailman (input) for mailman id 424972;
 Tue, 18 Oct 2022 12:02:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=llzQ=2T=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oklIP-0003BP-5s
 for xen-devel@lists.xenproject.org; Tue, 18 Oct 2022 12:02:09 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af5172aa-4edc-11ed-91b4-6bf2151ebd3b;
 Tue, 18 Oct 2022 14:02:07 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 85AC25C00C0;
 Tue, 18 Oct 2022 08:02:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 18 Oct 2022 08:02:05 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Oct 2022 08:02:01 -0400 (EDT)
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
X-Inumbo-ID: af5172aa-4edc-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1666094525; x=
	1666180925; bh=O2/dMz8NgpCHX1Sqp3OOccZ2LMUa8ynU7I6zNQmgh+0=; b=l
	70icwUpCYe/Aui9OGIpsAdTKFMrKO8qR1ZA95p2xUAPSBHbPaMwalL10N/XoI6DI
	6ZYD77TVYc7dvLvHSH9+Tr/quqSR4pVkgTMPy6WR2nxZYP8Ut0Xs2poaa5xessjT
	f0uFfDB2lp/qV5dIt1ZKRPcKvLNGIttJ1uOfymbM7q1E9tAMAED2VMWUfz6gcSyo
	Wcp2tBrYDTJF65c5gzf+BZ4ngpAAkq+049NxQB81884loVMp1TgjNwX7uArKJEl2
	C/HyOxcqSPNVw/zW1CAw+i1jfgB2OavopVZZbsW7XAPX+zrRKPdZYK8ma4BcaHMQ
	SW4Rm1QIAxLvBFC3lharw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1666094525; x=1666180925; bh=O2/dMz8NgpCHX1Sqp3OOccZ2LMUa
	8ynU7I6zNQmgh+0=; b=lTeAcC/icUBb+IlQWBzbTLHVrTH5ajyoSWtpcUiVRIhz
	vpZWIAP57iGUXKR6d58fDi2y3UqU8itb1kn3YjiiFZOvPy+j7aYBERpYoK9iqBMh
	1UIMYouGb6GVcaCyVQX6Em8XqnJBn8pc9MMZi6ywh29NsYiCcex7oCd0U4cA4fdc
	gylkVnvf+4YTZ76l0YOgdwz141C5gCEpOlLAxXJ5dAgdKN9JDhwJASxIy2B0G2A1
	wC8aGjGA72X596R6bBAIa3FbrSZf9r5AdvQ+1QZBGCV1i/qHoK6zfObK7og/p6pk
	D6BG0fCj8MS3pwqPUBVc4Vv1uqAz5/2WqnGnINd9JQ==
X-ME-Sender: <xms:u5VOY82j9ZJWwLuBuO62e6RXoISFTb8cxq7dqTz-s--dzOK8BUwnnw>
    <xme:u5VOY3EIs1KXrYXtuQ5BdB3VBwQXNeh9aE_uc-OFAT0zFkZH19lwuE3xP_pf0zFCK
    FpyTsYcCZi0cA>
X-ME-Received: <xmr:u5VOY052XM0GJlQstg7vCbpdciJsx8nAwC6pumYrNNN2YzoguXHE7OGHCe_vupzRSf6TVmW6AMZYC1TuSy1AuEk31VG9IbD5nOKu>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeelvddgudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:u5VOY13fc3uSr8JORwaxyD9b04YDru3oXdU9H8TxTJO-awSdPee5lA>
    <xmx:u5VOY_FsA3dQ_fLjy8D0865wmQ8NIDpv03MspxTHb5UhN5uSwOVAOA>
    <xmx:u5VOY--EaK2gNw3aY4jYloONLw6zwutGCRWDL3v6e6wst1ar8abn-A>
    <xmx:vZVOY8e5fR4nP3eZQFZ9S5n_lu5ZLNMZn3VC4iVGv_lu0b1PN0C6fw>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 18 Oct 2022 14:01:40 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	regressions@lists.linux.dev, xen-devel@lists.xenproject.org,
	iommu@lists.linux.dev, Robert Beckett <bob.beckett@collabora.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	Matthew Auld <matthew.auld@intel.com>,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: i915 "GPU HANG", bisected to a2daa27c0c61 "swiotlb: simplify
 swiotlb_max_segment"
Message-ID: <Y06VthUrV6PjOcJH@mail-itl>
References: <Y04i8V7xamTkuqNA@mail-itl>
 <20221018082413.GA25785@lst.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qtGIkQp0BUuCxgCT"
Content-Disposition: inline
In-Reply-To: <20221018082413.GA25785@lst.de>


--qtGIkQp0BUuCxgCT
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Oct 2022 14:01:40 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	regressions@lists.linux.dev, xen-devel@lists.xenproject.org,
	iommu@lists.linux.dev, Robert Beckett <bob.beckett@collabora.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	Matthew Auld <matthew.auld@intel.com>,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: i915 "GPU HANG", bisected to a2daa27c0c61 "swiotlb: simplify
 swiotlb_max_segment"

On Tue, Oct 18, 2022 at 10:24:13AM +0200, Christoph Hellwig wrote:
> On Tue, Oct 18, 2022 at 05:52:16AM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > not only) when using IGD in Xen PV dom0. After not very long time Xorg
> > crashes, and dmesg contain messages like this:
> >=20
> >     i915 0000:00:02.0: [drm] GPU HANG: ecode 7:1:01fffbfe, in Xorg [533=
7]
> >     i915 0000:00:02.0: [drm] Resetting rcs0 for stopped heartbeat on rc=
s0
> >     i915 0000:00:02.0: [drm] Xorg[5337] context reset due to GPU hang
>=20
> <snip>
>=20
> > I tried reverting just this commit on top of 6.0.x, but the context
> > changed significantly in subsequent commits, so after trying reverting
> > it together with 3 or 4 more commits I gave up.
> >=20
> > What may be an important detail, the system heavily uses cross-VM shared
> > memory (gntdev) to map window contents from VMs. This is Qubes OS, and
> > it uses Xen 4.14.
>=20
> Can you try the patch below?

Yes, this seems to help.

And since this is a PV domain, with Jan proposed change it should work
too. Intuitively this indeed should be PV-only thing (as was forcing
swiotlb before).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--qtGIkQp0BUuCxgCT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmNOlbUACgkQ24/THMrX
1ywetwf8DTYa8ZbhMb5HDzxNAzyTnFvsCY1DX+0u7OmcBugMCEX5sJViL7uuwVZJ
ZlJiCsAuFZ/FrBKchCzCND/GQ7rrAwRi/0QOjiOi6rf2dk8KMvGtY6GbcEf3cpqC
Oh9OZGCirz84We8EBSRTo+MwwnM5EVbtjnhdXahTBk01ZGSQVbBct59sqpbJNamu
oj/qXqFUuwVzn/5PuTUxifnWdj8nJbMFWwm5gyPEwJoqpG2e/31UmkJwGNifSvOy
ohr3oSYiv0UuPKctnCsjr9WjLCPZVynL674H6TiUBdH0ySEupEKrKdossTByT4+7
u7PQT2fMcvycjOi+XITjfwZ5p5d0Qg==
=ebS7
-----END PGP SIGNATURE-----

--qtGIkQp0BUuCxgCT--

