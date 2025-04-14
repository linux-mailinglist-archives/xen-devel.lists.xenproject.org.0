Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0858AA884A4
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 16:24:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950489.1346791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Kij-000069-G2; Mon, 14 Apr 2025 14:23:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950489.1346791; Mon, 14 Apr 2025 14:23:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Kij-0008Ug-CI; Mon, 14 Apr 2025 14:23:33 +0000
Received: by outflank-mailman (input) for mailman id 950489;
 Mon, 14 Apr 2025 14:23:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JTEa=XA=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u4Kih-0008UW-Ej
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 14:23:31 +0000
Received: from fhigh-b6-smtp.messagingengine.com
 (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08afdf74-193c-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 16:23:29 +0200 (CEST)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfhigh.stl.internal (Postfix) with ESMTP id CE4F72540357;
 Mon, 14 Apr 2025 10:23:27 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Mon, 14 Apr 2025 10:23:28 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Apr 2025 10:23:26 -0400 (EDT)
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
X-Inumbo-ID: 08afdf74-193c-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1744640607;
	 x=1744727007; bh=CpJrLx5acj21e4lYyniSM+Z+z3MKb2tvuLP7wJWy1dA=; b=
	UfAHWMCyAMMvL0Q8imTgn4jZ91+4LXaZH8M/XMIap1ICs1uLMxlEiPTDFKPus7hR
	ofpf25RTQ5cN2KwTzIsxQ/nrgP/iRYi3if5956SnaWF06b5SpZqneEg5sG60Wt8t
	i7f2SebB6sxgqZiPoiCUUf5Mg+XCnE8XBkBbbTYlVb0c8Wd9wKOvVxU8EGAT3toj
	3QHU3XgdfGc3OUvCd0iANJmIZKnfZDBCt93k63HsGpcDhpPpsys2Vnx5Ap+PpalX
	BOyRJY6uxNo2AopJ2FUUX36bikFMDiuwrfpiWMni2wSlOimIpavN6MRqZLzhsDt0
	2OeWTnixH09NimDjA2KJbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744640607; x=1744727007; bh=CpJrLx5acj21e4lYyniSM+Z+z3MKb2tvuLP
	7wJWy1dA=; b=xYcVmO75D5GKHL6/xB5IC+QDwNfAnSv8w0eEUaAjkJ1zj7hBNcx
	RdQ/eRb094EG9QO3F3qCLCV3nPdMP7yUqOwQLCGUpaH3ssXkvqa3vnDNRkdmYA/G
	Y5aGgvIRUkQOk+jnvD8buu4W6sVaq0Gj4OJh4ltAf87CRY2lW6A/AB7WtEqZ6lP7
	kqcCtFQzNK/0hiWoOb3cDsc6jRyvwrZD/jNJ3+b/r4IOWJDKP+nNwBrQ8Ovv3BeV
	tVPBYipMe7rSGS59AagcheYcyGBEFyuAuWUYyO2gBh1z8ILmGooH5/weaAXjf2jm
	t/dkCAoW0AWQoTxXVJOhY+s+hD+GmVuNHsA==
X-ME-Sender: <xms:Xxr9ZwNNuxcZCes7y5deps8gJGdlqW5kK0kJY7Hg5WdYMlWoZl_6Bw>
    <xme:Xxr9Z2-YqkJ3ZePRYTSuGC7oTBLAgBAjiSxAvfhLXf8CD7vHKu4qrfR0GXKuZA7-t
    VaNK8rtnYsOPA>
X-ME-Received: <xmr:Xxr9Z3T5SmcxIHwvDgoSsSEg0Hjb5oYWEJ5YixCiAtIp8mM2hgpzcAfJs8pHrQhY4LUiyqitenV2dMB1gNU8aBZlsUnr8b7wtg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddtjeelucetufdoteggodetrf
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
X-ME-Proxy: <xmx:Xxr9Z4va3Sp1gQXAHamK2EsFs9vNgjS0DugkgaGh_cnCSzj0QzzYpw>
    <xmx:Xxr9Z4ezNtFmikM43hxCzNNyzGVK4JJZqx2Jbrr-_Sj4MS2I9NkZBg>
    <xmx:Xxr9Z81W8EzFXbYNmN0yI_jIIdWvA20o30QqRcfJ9x6i5wYW3Zhhmg>
    <xmx:Xxr9Z8-06u3_gXlD4xy_sVlCLGmnIC76z5YadlCc0Zxq6gtkQm08ww>
    <xmx:Xxr9Z0z1f7eIo3Syr4341sY-1Ef41Phww2FATo2CSfspNuNF-woiwWjU>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 14 Apr 2025 16:23:24 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v2 6/7] Provide an ARM64 rootfs too
Message-ID: <Z_0aXI4blnpek86T@mail-itl>
References: <20250414101843.2348330-1-andrew.cooper3@citrix.com>
 <20250414101843.2348330-7-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UUc2FnNDIN9wif9Z"
Content-Disposition: inline
In-Reply-To: <20250414101843.2348330-7-andrew.cooper3@citrix.com>


--UUc2FnNDIN9wif9Z
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Apr 2025 16:23:24 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v2 6/7] Provide an ARM64 rootfs too

On Mon, Apr 14, 2025 at 11:18:42AM +0100, Andrew Cooper wrote:
> The only extra package needed is libfdt.
>=20
> The older ARM64 rootfs configured modloop, networking and sysctl, but non=
e of
> this is used in any of the testing, so is omitted here for now.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--UUc2FnNDIN9wif9Z
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmf9GlwACgkQ24/THMrX
1yyMkAgAgGS2Oa/4B8l5ECw09JChrvPtI6gR/117TebHK7q9ueccNyoeiX+pu0sS
vUnxT97HcLCxbLSE+3rZSMaKKNyF0OF4znfAYXZpdOTdpu5Z5/wLcMsbdormy9mm
tOLRyHT9UuAOHN/jfWWx5Nlht3R91YzcbrXwwfsYK1Hu4mHEZt5ybqrXk+BHYZEp
nLyTPe1YhAp87v8L08zJbCiTVw/5322hMTk709gL3fLzbFPJOpjlb+AYn+qKwbVd
MdkQnDbMlzxEtTLRA4y9yt0GPa0Cu6jw0kG4a+P4WvHBLDGCdmdVmrGBi4azlX1Y
U+y4swgyd1/ezNZSLmH1jC8qAMqq2A==
=svLQ
-----END PGP SIGNATURE-----

--UUc2FnNDIN9wif9Z--

