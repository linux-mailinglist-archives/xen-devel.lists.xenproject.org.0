Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC8BCA6FF6
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 10:51:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178574.1502327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRSTJ-0006ZP-GZ; Fri, 05 Dec 2025 09:51:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178574.1502327; Fri, 05 Dec 2025 09:51:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRSTJ-0006WI-Da; Fri, 05 Dec 2025 09:51:29 +0000
Received: by outflank-mailman (input) for mailman id 1178574;
 Fri, 05 Dec 2025 09:51:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZEed=6L=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vRSTI-0006Uz-5K
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 09:51:28 +0000
Received: from fout-b2-smtp.messagingengine.com
 (fout-b2-smtp.messagingengine.com [202.12.124.145])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f37dae9c-d1bf-11f0-980a-7dc792cee155;
 Fri, 05 Dec 2025 10:51:21 +0100 (CET)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfout.stl.internal (Postfix) with ESMTP id BDCA41D00165;
 Fri,  5 Dec 2025 04:51:19 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Fri, 05 Dec 2025 04:51:19 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Dec 2025 04:51:18 -0500 (EST)
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
X-Inumbo-ID: f37dae9c-d1bf-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1764928279;
	 x=1765014679; bh=Q2RQwVyBrJPbkDGVao8N5yspjwHZGjVgo0c3wXL0Zq8=; b=
	g8mDXwT9uFM875UgI88ESs/XVWay+2Zj5nH+wRtJLAsDWp9u55rr14lKJxey6k3U
	mIq/SpJa1zxV4nbmJUeAP+920kOR/CFSZdCNckaZkB8JZ3vlLShOmg/rUOkPgdDa
	qqxMbRsim7HcLDfVWsakCQf3dIza52dXR7XYyBfDVnY2+mlx7sw8fIcYwhbCHG+a
	8NAZIRxKTw1uYT64PNT7B1wmV+jKpkgT16n88KmsF7QRUzdmIAV6+TSlYTNc4SKP
	L0aHkvxN6sB8lgUzVWpTpv78OBPuAELws9sndiKkqwH/XhyS+8/7fsw/otlHXbyX
	GUX4vABlD6mIiTLNMgirEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1764928279; x=1765014679; bh=Q2RQwVyBrJPbkDGVao8N5yspjwHZGjVgo0c
	3wXL0Zq8=; b=LjNdiLp2Y+VB59wUY4djK1rmyXmoTU3ebUXtYSQee+1lZPauNqy
	RB3icRehXdNODgaYb29Kkeqcd2lb+3zKLlmsRstNmgksO7dXUPoCNt/oxwLZIapf
	PbtQ3AKy2ffoewkOVcyT67ZCmiYggIWn+MRwFGtVYtbBSg1Oq7IgZLGBpmU1eJ4Q
	lim7Aa1XOgtuYrAmlPRvlzpf3DmmJNYbBu5xqpK8ePszMXO2FttKUC3AN4GRazZo
	e772uZJbxViyt8XGPM0EFH62BRdBe9mIyGhNBQul13wdUtx9qBrYYL1dMHtDpD7h
	ms16SU6bwNefm/+7DHvmygBa3fmXvw7Ojgg==
X-ME-Sender: <xms:F6syaZj_kBshY9uQzp1TZtLRn6E86ZGzU_p46NgHR3_GgrCL_Od3Ew>
    <xme:F6syaU5KrI3ULT4WjussnGP-CTt5PMbdfFQkcZPhTtD98Zr5rQUIGx0OJrcRdFBAW
    YSEYuhVMm2i3w2BdytP8K7qoN7U9i-cq7PeNwkgjGJ85Hyu>
X-ME-Received: <xmr:F6syaRZKGOS59Pj2olNGVtSTBVe9Gr-OBhyB6B8tmp9P_wzy6ui0Vi6PO7H-veaNPJ1MET4vfTbeqa8voeqj8HETXLMBHEqENwA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdektdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgr
    rhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepveeujeetgeel
    leetudeuvefhtefgffejvedtvdfgieevheetheelgeeuledvjeevnecuffhomhgrihhnpe
    hgihhtlhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
    gtohhmpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pehjsggvuhhlihgthhesshhushgvrdgtohhmpdhrtghpthhtoheprghnughrvgifrdgtoh
    hophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhi
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigi
    drtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhj
    vggtthdrohhrgh
X-ME-Proxy: <xmx:F6syaZ550Na3iPH8juIfzbEsoo6B_NMr8RRs8I---TkY0wUrCbdyMg>
    <xmx:F6syaUB5xRpZksb-6PrTOcg_ATkxO2iLrWs9WqwzWYjmsy7sBod08A>
    <xmx:F6syafd5ABy9KVeS9pP1mbZDnBfE72rjoAvTSKJQFjd8yGugJ9AKtw>
    <xmx:F6syaTIgtVGmICAoYBeNRCjaoB8oSuD7PYrQlePWhy_U3o4bOpJA_A>
    <xmx:F6syaVpZF0usdcIDd969IZqYXgEd53VVb2wJujBSnJ9hHN8k_rDJgRg5>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 5 Dec 2025 10:51:07 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 00/12] Changes for several CI improvements
Message-ID: <aTKrCwCNwtT9ysIz@mail-itl>
References: <cover.fb9bd2be49ef9017f3552508f8c59849b8c0086f.1764866136.git-series.marmarek@invisiblethingslab.com>
 <16830f7a-1bc9-472a-adfc-1d959b6fa58e@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ri+GoeUlSDMGECYy"
Content-Disposition: inline
In-Reply-To: <16830f7a-1bc9-472a-adfc-1d959b6fa58e@suse.com>


--ri+GoeUlSDMGECYy
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 5 Dec 2025 10:51:07 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 00/12] Changes for several CI improvements

On Fri, Dec 05, 2025 at 08:34:10AM +0100, Jan Beulich wrote:
> On 04.12.2025 17:37, Marek Marczykowski-G=C3=B3recki wrote:
> > - Alpine update
> > - Debian trixie
> > - Linux stubdom
> > - test arbitrary linux branch
> >=20
> > Technically, the last patch isn't strictly required, but it eases debug=
ging.
> >=20
> > Green pipeline: https://gitlab.com/xen-project/people/marmarek/test-art=
ifacts/-/pipelines/2196630637
> >=20
> > Marek Marczykowski-G=C3=B3recki (12):
> >   Add Alpine 3.22 containers
> >   Switch Linux builds to use Alpine 3.22 container
> >   Add debian rootfs artifact
> >   Add linux-6.12.60-x86_64
> >   Enable CONFIG_USB_RTL8152 in kernel for hw12 runner
> >   Include git in the ARM64 build container too
> >   Support building arbitrary Linux branch/tag/commit
> >   Save Linux config to artifacts too
> >   Add linux-stubdom dependencies
> >   Prepare grub for booting x86_64 HVM domU from a disk
> >   Prepare grub for booting x86_64 HVM domU from a cdrom
> >   Setup ssh access to test systems
>=20
> Like for the other series, where one patch is missing, I'd like to mention
> that here patches 01 and 03 didn't make it.

Yes...
I don't know what to do about it... xen-devel list reject emails with
dockerfile changes as "spam". People CCed directly got it. Should I
include more people in dockerfile patches, just in case?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--ri+GoeUlSDMGECYy
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmkyqwsACgkQ24/THMrX
1yzAzAgAgleBENfOGeduTjvDFY+aWuStHI00yi518MJ7uOfmpYvMKuu3O6uk/b7F
4/56Evt3HJ+yjA31ijhjMep3nYK00Qv86XDa2sIYff1EC1HRjzCViuW59LVCYYJi
IfsH1dzfn1GcMs+t1F++ZRDvcIZ/jwr7O6PkwGlTLcREVnnNIscet7+lNoRspl6G
m0BDsepBf6wG0EMyGMYGoIK4CIqQXV3LLcuMUJIRGEg0GImLdRZO5xMdYxQDcCaH
qlpq/hpsJtOuwo3PGuxna8K5ZA/x3UXCFgzEGCWvtg07YjVG/iTCvOewetrXGybE
NcnOnbU6RMxCIPaAHNoPoczILTYXMA==
=pXmm
-----END PGP SIGNATURE-----

--ri+GoeUlSDMGECYy--

