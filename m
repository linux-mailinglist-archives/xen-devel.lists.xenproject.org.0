Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39ED5A84759
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 17:10:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945933.1343993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2tXK-0003Jh-9j; Thu, 10 Apr 2025 15:09:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945933.1343993; Thu, 10 Apr 2025 15:09:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2tXK-0003H5-67; Thu, 10 Apr 2025 15:09:50 +0000
Received: by outflank-mailman (input) for mailman id 945933;
 Thu, 10 Apr 2025 15:09:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S0bf=W4=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u2tXI-0003Gz-KH
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 15:09:48 +0000
Received: from fout-b4-smtp.messagingengine.com
 (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d443d410-161d-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 17:09:42 +0200 (CEST)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfout.stl.internal (Postfix) with ESMTP id 3C58011400F4;
 Thu, 10 Apr 2025 11:09:41 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Thu, 10 Apr 2025 11:09:41 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Apr 2025 11:09:39 -0400 (EDT)
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
X-Inumbo-ID: d443d410-161d-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1744297781;
	 x=1744384181; bh=v2g2wY6PHyh5SHheJVAGimZSOvjIAiR65LRo8ZuZmYg=; b=
	LswaTYYQwD9pFvkrqIyhm0Bqw1/a0QtNovPnz5NGyDh+3A2esZ5Ghm9o9oeDcZl9
	ySjUI2v7IKuuSZjV8ys3o5ZTAFA5e5RSpglF3C3Bfo98CzGFOAg8GENRcc4dJOg/
	eRKcl3w0RFHKFQLdkdL+xM5VbBDNx9vFPiwK3+VbM9CLZJ5BpjY8Koxdb82L5fBN
	w1dmyb9yYFAdpUkkA9+moq8slGFRPAzSyKlvpLwBp1i/9bbMHsuswk/rH72/KRrT
	LYhZkprh/2lNhbJ6PCXzTzUzqSiupoBVLJ74ibtdVK1+m2/ySjj+hdQf6EKj6OEc
	WZBwdu2wXzdOglnTA+TFFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744297781; x=1744384181; bh=v2g2wY6PHyh5SHheJVAGimZSOvjIAiR65LR
	o8ZuZmYg=; b=pn/tEvwpDKep2OxLjJH+SFAHr1J8H9uiZ6yxD25aGs6jigiLhne
	YxkLK0N0fZe58AFj6xpX4la2vsSxGGzvIenIBKuIHsVDllZXPbU3xvNN99HWl5+g
	6B1J/0lotCg/OQcnStKo5jY3W9rNUZJIdMAVb25xrCws0r9af1AvkTdCd1aaVzxs
	kuIlzuE5LR8VYlotxBVqtxP8Emw3QAISGfyrcKCqK/W5Pw+NF63F2eEyGFuaXQAv
	QXU5h9EtTWfmJ25cOKReA4FXvEXL47cjSVkrZw4eTFqdma9T5Y6asXImGYs1g6Pf
	e6lgrqm+A7Zsc42WgYhAncWJGrGklI8PVzg==
X-ME-Sender: <xms:NN_3Z_iWJgTSHoKAGPEsZxAzPNxmTA8WxvCqUN9A1IKDN2C9gBdubg>
    <xme:NN_3Z8Azp_ShWKmCstAJmVy6x_kjDzPdKXFaBGIamc9Vi2lpeDY0bAK-bz7qsomQR
    HixAxNy7It7Aw>
X-ME-Received: <xmr:NN_3Z_HgD5AXWfUy8EULSET4uXGPZO-14G4ZkT19OAop459w6TdVgVcBnq8X_WcamOR2H53qt-syfbzwp3XLtyYklcWUio3bTQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdelvdegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettd
    dvgeeuteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    dpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghn
    ughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopeigvghnqd
    guvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopegr
    nhhthhhonhihrdhpvghrrghrugesvhgrthgvshdrthgvtghhpdhrtghpthhtohepshhsth
    grsggvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhhitghhrghlrdho
    rhiivghlsegrmhgurdgtohhmpdhrtghpthhtoheptggrrhguohgvsegtrghrughovgdrtg
    homh
X-ME-Proxy: <xmx:NN_3Z8S46jv6udRq2Ec-sXq_HQR_cO3RgFN8MlOStvfuVi4rc1TTpQ>
    <xmx:NN_3Z8yH5O13CYyhbwzYNtfm2PL76U9h1RkyqL0veF-2hzIjn0zRiA>
    <xmx:NN_3Zy62RTU5KJOf61lG2EXyG-mrheEg8jm03LRmpfiPZqGCB-xBaQ>
    <xmx:NN_3Zxx3YZlEoGvnXRGuiiF39b4P6PmCFAvD-T8ZSKT7L5qSRwIHrg>
    <xmx:Nd_3Z0E5B4jJFCv877l12ivH6MBnraOIRB78hm98Rp4nyHwK4O-dJA1b>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 10 Apr 2025 17:09:37 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 1/3] CI: Update x86 tests from Linux 6.1.19 to 6.6.56
Message-ID: <Z_ffMXLTy4Q9e-X5@mail-itl>
References: <20250410120520.2062328-1-andrew.cooper3@citrix.com>
 <20250410120520.2062328-2-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8xhOegneLUwPER9f"
Content-Disposition: inline
In-Reply-To: <20250410120520.2062328-2-andrew.cooper3@citrix.com>


--8xhOegneLUwPER9f
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Apr 2025 17:09:37 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 1/3] CI: Update x86 tests from Linux 6.1.19 to 6.6.56

On Thu, Apr 10, 2025 at 01:05:18PM +0100, Andrew Cooper wrote:
> Linux 6.6.56 was already added to test-artifacts for the argo testing, and
> this removes one moving part while cleaning things up.
>=20
> Drop the associated export job, and dockerfile.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--8xhOegneLUwPER9f
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmf33zEACgkQ24/THMrX
1ywuBwf/cNaf5XnsYw+1wMBMwLdPx7DpR+ASfHT/mMcJpLVhUn0HJCrsMlrMWxDI
3pXGvAIuukQUFIamUVMboDuQGv763AdU01/j0QiWsLjT/5/1oRWv0fbvlsD3MdS2
q1lVZb3Qrjms6bzjB/4IaJ2Fv/OfwhmKTPAQxpdY12H9Z/9Y0OWig1x1/Gv0ozTg
V8zzwolVEatWPVcn63vRm+DouzBOQL2ePn2ICcCfDhTdKqBgiMT+PkWVTSInAMK1
tIBpVCBzJdspnyDdYOUUcENmBrNjIMnmTqFnzPr1yNAYfc4P97vpghP92vQN+EHC
Q2h2E4tSofT94Bw0AsCxcbTcgWEXCw==
=xD1q
-----END PGP SIGNATURE-----

--8xhOegneLUwPER9f--

