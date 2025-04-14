Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA083A87EBD
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 13:15:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949838.1346284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Hmo-0000DT-LF; Mon, 14 Apr 2025 11:15:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949838.1346284; Mon, 14 Apr 2025 11:15:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Hmo-0000CA-He; Mon, 14 Apr 2025 11:15:34 +0000
Received: by outflank-mailman (input) for mailman id 949838;
 Mon, 14 Apr 2025 11:15:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JTEa=XA=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u4Hmn-00082l-C4
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 11:15:33 +0000
Received: from fout-b5-smtp.messagingengine.com
 (fout-b5-smtp.messagingengine.com [202.12.124.148])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c66ee0e4-1921-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 13:15:31 +0200 (CEST)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfout.stl.internal (Postfix) with ESMTP id E6E4D1140162;
 Mon, 14 Apr 2025 07:15:29 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-11.internal (MEProxy); Mon, 14 Apr 2025 07:15:30 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Apr 2025 07:15:28 -0400 (EDT)
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
X-Inumbo-ID: c66ee0e4-1921-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1744629329;
	 x=1744715729; bh=RsSLBnmvKC+7cW6pj9tCcX+ncCfbYkrFfvzHM6CDIns=; b=
	bFJEn5iv5HqEsctJLqcxfoved6GhJLsKugGelxk5jftKQoXhsKB6ipsLxa101wa4
	4zlSNyaZqbgFw2UeXHKZruXqgoRQYz3o7yRTPiyf6GxqFr4I73HlRFSuO8Mb7vnZ
	VrCArJ3N3CA++uAiBYc0p1dZdF/CP1jLNrnMGjPayUDaKOHQDUq/YoChfr45/4FM
	LMk38ycqN/yd8vgzWWqz/CQw5Mchxe0jDhmNENMLcf9b0JNTxbbmjMM+NlKXs7NT
	8VEcheyOPrIXOD2Qi4mchdpjg5Cnn2fe1qphZyB+j6OWRdht5q1FqejsEHI3OTNY
	y5MVAb1/8bEDBfBOC2C17A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744629329; x=1744715729; bh=RsSLBnmvKC+7cW6pj9tCcX+ncCfbYkrFfvz
	HM6CDIns=; b=VxLrg3tcx9vYJXP0pDpU0pWR/RhRdpNnW6u76U0HOkkO3gVofW1
	OhhaD/UvziD7awQbc8C+VfU9NUQN3Jqs4qF1cWYV5jgzuJsO+TW8xnx5kZ+H3YQ0
	fa0jo1YCu74Iwq3YPtSijk0iztQ5reU1dsyB9P8L7/0EhvtGov/x0D7pHPhj5xBm
	46gOT/1j9xQ9/IXajR9G3y4qKlQTWRvkBsCIqUdTkBQXLIJxu0RtIwOQv/ykRC8N
	sH2w5xE6tLxScla8u7tmR2XoSjeY5SNasf3UNNofjM4lMHjLWXyXh3ZOzFw8/LbS
	KxGHJzv1rgsUr7kzdvQ33sUQ9MOYt2MEoeQ==
X-ME-Sender: <xms:Ue78Z8q0Sgmx2h74L-o0-tHLr_YFWom2rihKiqKaGm7lqstC77wB7Q>
    <xme:Ue78ZyqSajF_p4hBpKgGNPo5D-Mk9Ro-aTXEKds9zld7eQLr2X-vVwCZn7Mu8-Hac
    kNe-3TSqt2tUA>
X-ME-Received: <xmr:Ue78ZxNQyusWyw74zK6xu5szsIHbNlHBkvhFs0S4mxm9EeBXPiZmm4VA-YTGccDmkbeVQ-CqR-3v2vgd6l2m9TPHk7b_iGoA7g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddtgedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettd
    dvgeeuteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    dpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghn
    ughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopeigvghnqd
    guvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopegu
    mhhukhhhihhnsehfohhrugdrtghomhdprhgtphhtthhopegrnhhthhhonhihrdhpvghrrg
    hrugesvhgrthgvshdrthgvtghhpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepmhhitghhrghlrdhorhiivghlsegrmhgurdgtoh
    hmpdhrtghpthhtoheptggrrhguohgvsegtrghrughovgdrtghomh
X-ME-Proxy: <xmx:Ue78Zz6WfLlrWm-FbkncwcV6__z9HDGENayZIfuJ3o5BOlk0UM2uMg>
    <xmx:Ue78Z75wc2pDEUljIOVHhnySa0d1cF6aIUsVlVpeTCWC2WRfE_dmzQ>
    <xmx:Ue78ZzhRgD7oqk2k9qpdqv7332r2QnP_GVukKvH0REhZYgjBENjdVQ>
    <xmx:Ue78Z1522MfN7vMbf2rOcNOKPQuDo8cE8ahOCg-SNOLiGIMmSTe8Kg>
    <xmx:Ue78ZyAogJyb5UsiopN3sWQGIcy925jrSJXr60cKShSqQnKH7y-lqzde>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 14 Apr 2025 13:15:26 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Denis Mukhin <dmukhin@ford.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v2 3/7] Rework rootfs generation to make a cpio archive
Message-ID: <Z_zuTiYSY7qgToRd@mail-itl>
References: <20250414101843.2348330-1-andrew.cooper3@citrix.com>
 <20250414101843.2348330-4-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5t/yxu3MjlztxTBv"
Content-Disposition: inline
In-Reply-To: <20250414101843.2348330-4-andrew.cooper3@citrix.com>


--5t/yxu3MjlztxTBv
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Apr 2025 13:15:26 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Denis Mukhin <dmukhin@ford.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v2 3/7] Rework rootfs generation to make a cpio archive

On Mon, Apr 14, 2025 at 11:18:39AM +0100, Andrew Cooper wrote:
> Rename the script as we're going to use it for ARM64 shortly, and have it=
 take
> a tar or cpio parameter to determine the output format.
>=20
> Turn it into a proper bash script, and provide the cpio form under the new
> artefact naming scheme.
>=20
> No functional change.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--5t/yxu3MjlztxTBv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmf87k4ACgkQ24/THMrX
1yyTxggAmQr2mn+JCa5Wl0nZ7al4PtEbfw9dbrA6jAR84VMSErgxzRs3lo69QsXW
yuxvCKd55XGn/ZQoGSD/G2MoNdITzTLhVtR6pduiBwYXAZFCOrIfW3Omd4cG6Agn
rilqydyXfURv4UjjmRxf3h7cjnwny1f+9jtQF+FHD3KAxmmyfsn2K07arhvaBQYn
cR7uPow1cmRtJa/ZDVPqRzssgGZ6jpXVEx8fheO7RtKZAAXbEbrqC/baITxV7jce
G23WjzK68GFQS7NuAXY4KdK+LSwu8TGd8dyzAwfhq7/jEk3RBbRgU7NBXqnTrf71
NNXgmYe2IBJAkVdhjarxROsoCDo1VA==
=VA7u
-----END PGP SIGNATURE-----

--5t/yxu3MjlztxTBv--

