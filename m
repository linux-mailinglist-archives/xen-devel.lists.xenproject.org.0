Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36210589DC8
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 16:41:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380480.614649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJc2N-0005R6-Ge; Thu, 04 Aug 2022 14:41:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380480.614649; Thu, 04 Aug 2022 14:41:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJc2N-0005PJ-Dw; Thu, 04 Aug 2022 14:41:23 +0000
Received: by outflank-mailman (input) for mailman id 380480;
 Thu, 04 Aug 2022 14:41:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nGyI=YI=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oJc2L-0005PA-EZ
 for xen-devel@lists.xenproject.org; Thu, 04 Aug 2022 14:41:21 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80d4d941-1403-11ed-bd2d-47488cf2e6aa;
 Thu, 04 Aug 2022 16:41:20 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 70FD25C00CD;
 Thu,  4 Aug 2022 10:41:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 04 Aug 2022 10:41:19 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Aug 2022 10:41:17 -0400 (EDT)
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
X-Inumbo-ID: 80d4d941-1403-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1659624079; x=
	1659710479; bh=DAXmyYfrP3+DoD6UWpfFmEJMmuoWP87l3Ec3UK+0GG8=; b=F
	wVvnm6v6KDVJgX3eqdBNHMWPcujJLCK/yrAifkOsFU335sOTJEjKXRKiuggqD6NI
	7Q/MAqWjY9EYM4/5WEcbuaAAQDnfzr0z4CIb0gbE+diKk/cJ+VT+5g22g5okiR4I
	DfiGwuVbyZjgKIzqkJZcqtuUPomoMWUbVdHSaoxKBv9HVN/teLv1vsacMTDDTSTz
	i6g9W5TwdPJyLR2D1hU3RNyM+WOL1t69F4FFKT+hIAyA6wfTup99GFExVjv25e51
	FAxX1e1hEXHYHY5IEjq/mqlUwuK3dbXbQOIh+prAlPKY9kmj5U7VjbdHf6vddneI
	Uy5GCoFizdmo7A00OGx3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1659624079; x=1659710479; bh=DAXmyYfrP3+DoD6UWpfFmEJMmuoW
	P87l3Ec3UK+0GG8=; b=ZHMzvXaGcWi+YB1m8IpufL4uT4goEk7wlim7Sm+GQs5j
	1wrUo1wzXsVoN/M17YDEloQWdSN3jm0jFYiQ4c2oEZ4vuNIF3Sb6Kf+Ajfc8NCw/
	d2j9ohoc4MS93bN3Wwh7tovLMzjrhR8goKJLklitWV76J/4YCNQ4Uag0jQmYHDhV
	1ltqfH2RS9vIpELWo8sriT5cXRHgRQCC+TVbEb81cnXPyfl4TLjVn7VCm0frmRh4
	NVvLAwTlEoyPRweb1fGgcfilj4jFKsZ27BiW2b8sVYzxSArT4xVpqTRCEtvdEEMM
	XzDGGlVxVGKsS3QwIljooBOmY7jismzt0da4YDGjWw==
X-ME-Sender: <xms:j9rrYv1-BqnBohHnbaht1wcBptQuE2tWMuBYA7dVGQzuynRgPneq7w>
    <xme:j9rrYuF7DY1Dixv3uTBf-IhcfC9mzcKE4W8Abcvy5lafsSo1nsEuF9buJoJDiyXi-
    XO1ZrSZLeG0ng>
X-ME-Received: <xmr:j9rrYv481nR-d8lqjmcbiDkAhtgI-pLy6LFt-jo6iXUxZVRjJeA-Q9n4vYveGhWI-H8BEnk3xS2voqKxgTWs3vOCE5ruS9teWYEg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvledgkedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:j9rrYk2YD_0-_HwNecqET3d0BjgF3NgxdwGuJNgJlGCdzaUf2smNfA>
    <xmx:j9rrYiHLuCv-Y5OdNrHwU5hjyOdqgcMIxb51IgEmkwaZYL5rJvWkQg>
    <xmx:j9rrYl-_gAXcT6hQv7iSNss3CoPnVUqQqt_VYbdxexE7hjh4jSXiEw>
    <xmx:j9rrYvMnKj6aYzxATw1AkKTg-kUsht-mH74viXxkFXbs_pj7_L-awA>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 4 Aug 2022 16:41:15 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 01/10] drivers/char: Add support for USB3 DbC debugger
Message-ID: <Yuvai11tHcXCBvSv@mail-itl>
References: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
 <e2e536b4b3d6ef417efbc399842b58aa420c1e3f.1658804819.git-series.marmarek@invisiblethingslab.com>
 <3bd56b9d-023b-1991-90bf-bc44d3c75bc8@suse.com>
 <YuvM7vElH/IdBJjq@mail-itl>
 <c9f9c980-6045-c697-eaf1-11e14a87e71a@suse.com>
 <YuvXjEZMlwjsuIGA@mail-itl>
 <fab2ccf5-43e9-e341-f448-092de2c01f17@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zD7e3iOr21iJdacL"
Content-Disposition: inline
In-Reply-To: <fab2ccf5-43e9-e341-f448-092de2c01f17@suse.com>


--zD7e3iOr21iJdacL
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 4 Aug 2022 16:41:15 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 01/10] drivers/char: Add support for USB3 DbC debugger

On Thu, Aug 04, 2022 at 04:36:35PM +0200, Jan Beulich wrote:
> On 04.08.2022 16:28, Marek Marczykowski-G=C3=B3recki wrote:
> > On Thu, Aug 04, 2022 at 04:21:01PM +0200, Jan Beulich wrote:
> >> L"Xen" looks sufficiently readable to me. We use this all over the
> >> place in the EFI interfacing code.
> >=20
> > Ok, I can try that. But given later adjustments, IIUC it will make the
> > whole 50+ pages structure land in .data. Is that okay?
>=20
> No. I was actually expecting the piece of data we're talking about here
> to land in .rodata, and hence be re-usable at the same address for all
> devices. Hence my reference to string literals.

"all devices" - this driver supports only a single xhci debug console at
a time. Anyway, as explained earlier, it would require reserving the
whole page for it (there are no other xhci-related structures that can
live in .rodata), which given your earlier comments about memory usage
is probably worse.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--zD7e3iOr21iJdacL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmLr2osACgkQ24/THMrX
1yyu7gf+L8zuTImST9NAp5ZB943uoob+9WwRghP95vvNBZlgAjJnDW8ePlP+mJOe
QYzXxU1WNW8S3ZXy6B6v/wpxTu86Ed2AWZLH/lIbYcqQuWjeTqo9rWnfhk+vTa/W
zmN7fzRlD9BofbmC4CMuaHzKmF7u31s8msFxlyJFq6WVvq7+SnNnxSgCJDEFG8Hl
ZeH8TGr694j6Q1dOyqmSKvh8pgIYA/iGvJjLCYtV4mRb2VuKEncDUVsSOb51wZJy
slOagWFN+xxdGwk3iDG7VPx1cp6QGdChFHdJHrmELiuRt4S46QNoYURBerEIg6UJ
iY7uIZuET4piYk/k01eHt+cxm0LiPw==
=9Hx4
-----END PGP SIGNATURE-----

--zD7e3iOr21iJdacL--

