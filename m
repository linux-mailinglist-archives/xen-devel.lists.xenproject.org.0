Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA289E0BB9
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 20:09:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846983.1262115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIBmf-00050I-JM; Mon, 02 Dec 2024 19:08:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846983.1262115; Mon, 02 Dec 2024 19:08:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIBmf-0004yp-FX; Mon, 02 Dec 2024 19:08:37 +0000
Received: by outflank-mailman (input) for mailman id 846983;
 Mon, 02 Dec 2024 19:08:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vU5T=S3=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tIBme-0004yj-2x
 for xen-devel@lists.xen.org; Mon, 02 Dec 2024 19:08:36 +0000
Received: from fout-b8-smtp.messagingengine.com
 (fout-b8-smtp.messagingengine.com [202.12.124.151])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d26037f7-b0e0-11ef-99a3-01e77a169b0f;
 Mon, 02 Dec 2024 20:08:33 +0100 (CET)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfout.stl.internal (Postfix) with ESMTP id 717A611401D7;
 Mon,  2 Dec 2024 14:08:31 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-11.internal (MEProxy); Mon, 02 Dec 2024 14:08:31 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Dec 2024 14:08:29 -0500 (EST)
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
X-Inumbo-ID: d26037f7-b0e0-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1733166511;
	 x=1733252911; bh=stQmbIMB6d7bKFQLedKn3FV9vJ6OJpwsH/zhKzioNxg=; b=
	XNa//SLCXxxBDA37f203pw958ORH2cAtJOlBToDGw2SKI3aok0k2Z175nU3urEqo
	k4ZSrGSCVmg3Qd3TgSXRRh7LibUxPqFPiXaE9yJW9HiDZ7JP+Nf+wWCfO6V6GLPn
	dKJsk8XZyRUIjgRsUJU5mT19FuKXdsqjdbiyVOTrOZ8WugiyklMDCdT9cfTgwYHG
	Afqkdqs+WgO4KBCfh+pjh7d43ru+T4l4qt9xQdOMM6Wz1oHGx5l2UbkdVl7aVKmC
	4TwXO9cr7z7uch2kAdKyj9iZgOumcLgEJ8jYit+8mHNYGzQCIAWDHqZ42/LabG6+
	p9i3YDGXmUp/PEaEmJQ5YA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1733166511; x=1733252911; bh=stQmbIMB6d7bKFQLedKn3FV9vJ6OJpwsH/z
	hKzioNxg=; b=gyfIwML+8tY0+2IjQzdAH/pbejFKAoq8JSdQRPHsgO6HTWMHu95
	oE+wBUObVYFUOQ40HFnuohrmkkOrdymxfUqceyAEMagXBbXoH9ii29ZZdGOMFdc9
	UnYPnIllpoXl3DYXkoNg8G2iZpuhGd7cLfBgTTV7QU48AOBPNqUVtg3pUshGirgb
	3szk3g+/S2yTWg543WCzPO9d3ut3/dVMPkEUlSo9bevhCWR+O1XyzFpH7Umbo5a1
	rOadKeVDwmsEzhNwhnvleguNO6o5oxn3rXW983/SibJUvKTVWWW0grE9HoGNi6xV
	oXluxqVg8Yd1fJHmYVAgUqNZmK5w9exgCUw==
X-ME-Sender: <xms:rgVOZ2FZijkpxfj0FyWmYdWKp8r3-vImWBR8ZkC2wi8VEZ_ScaVNfw>
    <xme:rgVOZ3VQl5epcwxpF-A507vRs20BgI99n9-f8mpGGC-5k8YKkGXAmINSqy9e5J7Yj
    vQqtTCCUByL2w>
X-ME-Received: <xmr:rgVOZwK48hZNKOcfAP66eqeTGy_dVNnwL2lTue5x8uMEdAlVJDthQm4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrheelgdduudelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettddvge
    euteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnh
    gspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgrmhgv
    shesughinhhgfigrlhhlrdhmvgdruhhkpdhrtghpthhtohepgigvnhdquggvvhgvlheslh
    hishhtshdrgigvnhdrohhrghdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfees
    tghithhrihigrdgtohhmpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomh
    dprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomhdprhgtphhtthho
    pehsvggtuhhrihhthiesgigvnhhprhhojhgvtghtrdhorhhg
X-ME-Proxy: <xmx:rgVOZwGRZXlwvSir0yF_Xl2Lch8BdDCtAzARXCaQM7hHxOM_lCrEJQ>
    <xmx:rgVOZ8VntbcdzEtm26JWTVu0znQ8c0zMoE5PDxrtB6DjJpd2iw_LtA>
    <xmx:rgVOZzPJ-jNfjP1S-K9MoIQhI3ljy5GI7YTjxMKZd22NXUoOCNxlQg>
    <xmx:rgVOZz0OLZp1HPar48sa0ZdMBNAfK89mqGXSuwytdRVkukM3JjnwCw>
    <xmx:rwVOZ2cCEayJxZJF8SQJhTwrMCXMcY_OUyiV8uwXNYo2cFegXW22nike>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 2 Dec 2024 20:08:27 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: James Dingwall <james@dingwall.me.uk>
Cc: xen-devel@lists.xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	"security@xenproject.org" <security@xenproject.org>
Subject: Re: stable-4.18: reliably crash network driver domain by squeezing
 free_memory
Message-ID: <Z04Fq1dXfIim_A8u@mail-itl>
References: <Z0iMxP2gah9Ky4Pl@dingwall.me.uk>
 <6614df33-e383-44dd-aebc-a238ad82f398@citrix.com>
 <Z03YL1KHwE1fO98g@dingwall.me.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cbMKMcFLg4avRI/E"
Content-Disposition: inline
In-Reply-To: <Z03YL1KHwE1fO98g@dingwall.me.uk>


--cbMKMcFLg4avRI/E
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 2 Dec 2024 20:08:27 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: James Dingwall <james@dingwall.me.uk>
Cc: xen-devel@lists.xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	"security@xenproject.org" <security@xenproject.org>
Subject: Re: stable-4.18: reliably crash network driver domain by squeezing
 free_memory

On Mon, Dec 02, 2024 at 03:54:23PM +0000, James Dingwall wrote:
> So there is some undefined range for (free_memory - m) to (free_memory - =
n)
> where it is possible to crash the driver domain depending on the guest
> startup ordering.  My (perhaps naive) reasoning would be that
> free_memory is the resource available to safely assign without having to
> allow for some unknown overhead and if I do ask for too much then I
> get a 'safe' failure.

FWIW Qubes OS tries to always keep at least 50MB free for Xen. So, our
formula is (free_memory - 50MB).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--cbMKMcFLg4avRI/E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmdOBasACgkQ24/THMrX
1yxybAgAgTv8qhLuSCoOhHfNrOvAeuQ7aAmoX7xaf0b2rY6Vc9jtQMeLSXT4FbEn
0jKR94kVqDULqElpWeqgPwjldmpF1mDWNgvoDQuf85qqV+eGMOq5bROAsHH7Pt69
Uo7fh23YA7lFQl6JdcPD4+DB36eXYqEWqqaSAtZWu3iAYZhinPhHASSY4X5WFsvo
C9ty8trS+lr65BN5OCZ9zhUhLfFsu3h07qsxZQn2mwQoeEHHIb4fbxTKcMQ1Zhdo
l+KuUao8sr1KuwsutBac4eEmadRMPgQfWNTVofLZEkzONKYuAKXsKBnGBnZFFM1o
AgSyfTiMa+bPBPA5mhP6QvWKnoYG3g==
=PZEU
-----END PGP SIGNATURE-----

--cbMKMcFLg4avRI/E--

