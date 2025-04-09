Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E603A83456
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 01:00:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944800.1343147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2eOp-0006lh-Du; Wed, 09 Apr 2025 23:00:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944800.1343147; Wed, 09 Apr 2025 23:00:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2eOp-0006iv-A4; Wed, 09 Apr 2025 23:00:03 +0000
Received: by outflank-mailman (input) for mailman id 944800;
 Wed, 09 Apr 2025 23:00:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=np/6=W3=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u2eOo-0006TO-5I
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 23:00:02 +0000
Received: from fout-a4-smtp.messagingengine.com
 (fout-a4-smtp.messagingengine.com [103.168.172.147])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c976510-1596-11f0-9eab-5ba50f476ded;
 Thu, 10 Apr 2025 01:00:00 +0200 (CEST)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal
 [10.202.2.49])
 by mailfout.phl.internal (Postfix) with ESMTP id A85E613801EA;
 Wed,  9 Apr 2025 18:59:58 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-09.internal (MEProxy); Wed, 09 Apr 2025 18:59:58 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Apr 2025 18:59:56 -0400 (EDT)
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
X-Inumbo-ID: 5c976510-1596-11f0-9eab-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1744239598;
	 x=1744325998; bh=4FFfeDS/v7WXn+9LWeoyHWU758hmJflpZsDUvLZnPB0=; b=
	jb2vq8SyKQS5kR/6Z9WwzM8B101Uywz+vXPvf9tSR0CkNF7jhjSNzJoFBcGv4Rpi
	M4uxygUAvIL7l0PBnV5VAywUIFIIWBLzpp5T3edXhB/ZZutEManqJb8qTIjibai0
	sQ2U/ZabzZo3sdIx3ipExQfgMaCsfgXEJXddZ/wsuk6EmchNr5382FHB/9FXEpI5
	8M/xNCGJx+HEuW2UOXRqSFD//esiIkOWbmRXmcjCfzMgblXF1hYBftCdu2GS3sjB
	oe+AW3tIkaV4xAM5l0a/i9HUqAatGY2ASRFmCb3Xye6zkHwPxaSCNHmRHjovnkaP
	qKUA92e70DxQjB5QJN0hIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744239598; x=1744325998; bh=4FFfeDS/v7WXn+9LWeoyHWU758hmJflpZsD
	UvLZnPB0=; b=cdODKZFT77q79Mm3HJ2JRrSTLAUNK2HSh0Voj6/zsMmYP4ZmNht
	sxB2QO0lJ6hBKsaQ33SKupyjomTaPHoLaa+Es6lYw8JuxizhBGY+qNP/QtNWk5LL
	mTg64WXuP7cJWX60ZEPkY5zU36K+fMRLflqxs8Aapg7qrNzD5n1OQ9YNJP7ZwxEs
	qYlj8HVNZSUkeuGzyGNYFXmz9LDd2L8IxfxMg3jwP6uNExhTXq3sSw+DGx8c7FDJ
	HbHcqiiVnV1OMraZIhjb7Bg8pz2MUDFx1NCGJf0t8Gbgk07BU0AOKZe6oicxJ1n7
	dhreYey3JxdqyljbRg0KsCb/imhWFmY8fxw==
X-ME-Sender: <xms:7vv2Z13NZObeZjFe_q3akr7U9nbjhErRsyI98buyY4Kvdpp7YMLYrg>
    <xme:7vv2Z8EaH-kb0wVGFjN60_Jq3jgTgGR30UeS-0Nn2N74oC5Ez4UkNQsT0Y-EdugdL
    6k2-yOxax4Qng>
X-ME-Received: <xmr:7vv2Z14ilDPfAY5lYmFJ5yqaaDCd9yun7dyINR6B6UYnc65oBJysi3AGe9nH_wvs-vsy_czBOJFk6L26jaLKR_zkF05ljbXAfg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdejvdejucetufdoteggodetrf
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
    guvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehr
    ohhgvghrrdhprghusegtihhtrhhigidrtghomhdprhgtphhtthhopehsshhtrggsvghllh
    hinhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmihgthhgrlhdrohhriigvlhes
    rghmugdrtghomhdprhgtphhtthhopegrnhhthhhonhihrdhpvghrrghrugesvhgrthgvsh
    drthgvtghh
X-ME-Proxy: <xmx:7vv2Zy2CfoS-r65epCMJtyA6Mz5BcNK7-4CE8Bzvc5gK0wTBDvXFfQ>
    <xmx:7vv2Z4GfkVYIx7kDgkUQj33nwowGdKURtkaHFh8ZfGNlXQ-0R1caMQ>
    <xmx:7vv2Zz9sIRult5X0zMctiGxZ3Uo5Zy6krrk53Ztnzk4--Hvt9F7kEQ>
    <xmx:7vv2Z1lCLXNdOfCtDrgoBu4I3vn9TcX3GfYVfwNpEEbl5SDOuT_E8g>
    <xmx:7vv2Z7HRdCR_95CFDT_7k4s7QaVmJgrw2-RCMO6hvAVnIlLtQfuDXPt5>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 10 Apr 2025 00:59:54 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 6/8] Factor our x86-isms in the linux build script
Message-ID: <Z_b76k-NXoMPBRe_@mail-itl>
References: <20250409163702.2037301-1-andrew.cooper3@citrix.com>
 <20250409163702.2037301-7-andrew.cooper3@citrix.com>
 <Z_ao0d530OwAUqGW@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pp/gzWmHsaGWXAvO"
Content-Disposition: inline
In-Reply-To: <Z_ao0d530OwAUqGW@mail-itl>


--pp/gzWmHsaGWXAvO
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Apr 2025 00:59:54 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 6/8] Factor our x86-isms in the linux build script

On Wed, Apr 09, 2025 at 07:05:21PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Wed, Apr 09, 2025 at 05:37:00PM +0100, Andrew Cooper wrote:
> > ... in preparation to use it for arm64 too.  Rename the script.
> >=20
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>=20
> Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=
=2Ecom>

Replaying without dockerfile in context, so it actually hits the list...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--pp/gzWmHsaGWXAvO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmf2++oACgkQ24/THMrX
1yxH5Qf/VwWs4jXtnpmGhdu5Q1YGv6CUQJ23QOloNq6nHx74DhTY5QqOq27RbSkX
JRn9kXDRw74OZytBYBhECA/VxVWH5Bhp9nj6SCIbmEpQV6/a6W4aIfSqNtFC94QP
A3Bew7TJFV439p0+O08rV4wdSfeY9zE//mGzZ1QfcSL/SkP4iU1eDRLTT3VuGsbk
j4ybwR2zZT4t+x0CSxE20rDS/xhB70zf1JmMh+WSXfz0SJ/uI2u0wnRVF9iprBke
AK9gYEnTUqedmGNH8zSA4VWid/uz+sudXGYQQesR03bDi5e1W3IPzsD7L+RN/c/w
YW3TO7GJPIWtkpFhLN07IUINU+gnmA==
=E41T
-----END PGP SIGNATURE-----

--pp/gzWmHsaGWXAvO--

