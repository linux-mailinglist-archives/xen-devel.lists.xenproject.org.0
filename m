Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF3BCB9E45
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 22:34:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185863.1507815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUAmI-0004cr-G6; Fri, 12 Dec 2025 21:34:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185863.1507815; Fri, 12 Dec 2025 21:34:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUAmI-0004Zw-D2; Fri, 12 Dec 2025 21:34:18 +0000
Received: by outflank-mailman (input) for mailman id 1185863;
 Fri, 12 Dec 2025 21:34:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vPyE=6S=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vUAmH-0004Zq-0K
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 21:34:17 +0000
Received: from fout-b7-smtp.messagingengine.com
 (fout-b7-smtp.messagingengine.com [202.12.124.150])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e84ea0d-d7a2-11f0-b15b-2bf370ae4941;
 Fri, 12 Dec 2025 22:34:15 +0100 (CET)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfout.stl.internal (Postfix) with ESMTP id B0D351D0001D;
 Fri, 12 Dec 2025 16:34:14 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Fri, 12 Dec 2025 16:34:14 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 Dec 2025 16:34:13 -0500 (EST)
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
X-Inumbo-ID: 4e84ea0d-d7a2-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1765575254;
	 x=1765661654; bh=2+YzOw1U5rJDpRAuNhuLJtLfCR/ST+UE/HlgIi/6LxU=; b=
	ohd4LqndH+u44ivtlPFshgkg1MMqXG9E4x3gSFxQHOtgnhFybPK+yxI+2LmHNnPQ
	16UOM/FW9Xptb31ks0ZuzgCSwhUyu9YzZDcB87SokR5t7MoH9VSpNy2T7+s5Gcke
	KWZ3QXcUnyo68ro+RTJs0aGF89S/hZQBjWmOubS1OFGJzIQmXZ4mSkCWR67qAkFi
	IeW3bRlpCtFLG8zqn4Bp3DqCXOa3Zbmlz3yP19H3+DFPHUOR+3Mj5PvEwTxTBIBj
	0frdaeZN8QqYRM1WkcIQKDMbOkssAujsy4R8FVPuYbBwIytHSmUwn3Tm4u1RrpuV
	g1l+6iU9nXE0ko8eOswYug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1765575254; x=1765661654; bh=2+YzOw1U5rJDpRAuNhuLJtLfCR/ST+UE/Hl
	gIi/6LxU=; b=jJm9xSMbxK77UHy4sTkOte7Kpl29DGyfn8gsc48Ve0Hcwp5VS4m
	vGaUIHgaIYoCptmexrSymNDmPYw7HCnINRlmlJzI+UdNnYq47Llce7kYP4COi96X
	/Q/K0lY4byUyO439vHVd2CpLT1LYjFK38c0tnXS2BZkZ9fo2RQ09hjplwdP6leC9
	63zajC/TKSk0pIflX8dreiNa8lwkFyDa+uxgGxoz1TsJlsxBaZOCPdvwexsulkd+
	GcjXXGVmW2kv8LD2fSnfrWZwDUP576CjwHxvXm1GXNW+OcUNCSScha3XnJbAd+OO
	6U/bpdInsHihuoK4GmeDxXSeXrqaXlNXJpA==
X-ME-Sender: <xms:Voo8aWxhP7WKLS0kTbmjsKEIXy1BYAEAbOD-2PeyCwUJsxooMhUmjA>
    <xme:Voo8aZRDQvjSk4T6g45AatZCbkH7rPxH2ZPD_4e7sVR1B_eXkqdo48BMPRreX5Q-A
    5HhXUWrExngpJED4p5mHsPZq5Sqo8lvUaTCNoOjwHGUVoX9cA>
X-ME-Received: <xmr:Voo8adXLR09nGY3bLpZAPQZq8TAesOSprGNawVKH8d7ijcRNIwbPznlDAL_PMM_G-Gui_Jv8-dz9YHh85XG1QgRBamFE-LFG1R0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvledvjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudelteef
    vefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeegpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghi
    thhrihigrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnh
    hprhhojhgvtghtrdhorhhgpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihigrdgtohhm
X-ME-Proxy: <xmx:Voo8abY1L7oNqzIv-S4V2DN6E0ln7H9mIz0ruNV-2fwRdV_a6cNBdw>
    <xmx:Voo8aT2YZLVV8LDdRxHxyUuPLhUR8fvILW8WJV0wg6jfEa3h9M_E3g>
    <xmx:Voo8adjtbSnu2r71dLL53ObjSH2QGnJKN2Zd3ztooDer87w9ASk94Q>
    <xmx:Voo8aXZoiYIj5txYLEn8Wf0Y1aWIhoEoEwgwAB5NlKRxh14sgQjjDg>
    <xmx:Voo8aZq7sXf_OlhQTJOdbTFdNzQawCobD3jB0OSch7d5IadN4JEs1T_0>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 12 Dec 2025 22:34:11 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 02/12] Switch Linux builds to use Alpine 3.22 container
Message-ID: <aTyKU-KyOhMuvvuf@mail-itl>
References: <cover.fb9bd2be49ef9017f3552508f8c59849b8c0086f.1764866136.git-series.marmarek@invisiblethingslab.com>
 <b1d58190ac7e2b65f80542685191944b83338960.1764866136.git-series.marmarek@invisiblethingslab.com>
 <f79a31b6-9153-47c1-b1c9-21f5aa5c5a8f@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Hdu4f8EpiRufg3m4"
Content-Disposition: inline
In-Reply-To: <f79a31b6-9153-47c1-b1c9-21f5aa5c5a8f@citrix.com>


--Hdu4f8EpiRufg3m4
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Dec 2025 22:34:11 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 02/12] Switch Linux builds to use Alpine 3.22 container

On Fri, Dec 12, 2025 at 09:15:34PM +0000, Andrew Cooper wrote:
> On 04/12/2025 4:37 pm, Marek Marczykowski-G=C3=B3recki wrote:
> > Slowly phase out 3.18 one.
> >
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> >  .gitlab-ci.yml | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> > index 17d25ce..36622c7 100644
> > --- a/.gitlab-ci.yml
> > +++ b/.gitlab-ci.yml
> > @@ -21,14 +21,14 @@ stages:
> >    tags:
> >      - arm64
> >    variables:
> > -    CONTAINER: alpine:3.18-arm64-build
> > +    CONTAINER: alpine:3.22-arm64-build
> > =20
> >  .x86_64-artifacts:
> >    extends: .artifacts
> >    tags:
> >      - x86_64
> >    variables:
> > -    CONTAINER: alpine:3.18-x86_64-build
> > +    CONTAINER: alpine:3.22-x86_64-build
> > =20
> >  #
> >  # ARM64 artifacts
>=20
> Just to double check.=C2=A0 This should be safe because it gets us a newer
> build environment for Linux, but the resulting kernel and modules are
> not tied the alpine runtime.

Yes, they shouldn't be specific to alpine runtime, and I'm pretty sure
we already mix Alpine and Debian here without issues.

> i.e. I can commit this to test-artefacts and it won't break Xen's CI ?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Hdu4f8EpiRufg3m4
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmk8ilMACgkQ24/THMrX
1yx6pAgAiF/mE+3d3tFQZ5VFlIDm/gPYUV/K/0fYDvc96EnVoPZKShv7i84C9jAX
ve4kN4ahq+HmvXWA7T6ZfCHmHt1A7cLbvlcKRmrSWLZHkR17vKRG9WK6KUNaOdh1
T5GAz8awhsBfMObbtP/UkuLctugTpfZxqnWxCFA5n5+AUXZ68x20aXBrSSsP06EI
FmSNQLsrA4iHflUBfFaOidvd1+U9fanlJXMdeApwkur9IeJbIGcENZHRy/WMATvP
bCWo1G4rP5WFrPukwRu4+3G5iD7fdYD2zQLwVZPzbdmFUM4L8pCU4nfAXELaUqHW
up8CRN4TWsCOHknyTH8niI+U6bGDvA==
=8/la
-----END PGP SIGNATURE-----

--Hdu4f8EpiRufg3m4--

