Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C324ACEF10
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 14:20:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006763.1385992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN9aL-0000Ww-5I; Thu, 05 Jun 2025 12:20:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006763.1385992; Thu, 05 Jun 2025 12:20:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN9aL-0000VS-2c; Thu, 05 Jun 2025 12:20:41 +0000
Received: by outflank-mailman (input) for mailman id 1006763;
 Thu, 05 Jun 2025 12:20:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B23G=YU=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uN9aJ-0000U9-GC
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 12:20:39 +0000
Received: from fout-a2-smtp.messagingengine.com
 (fout-a2-smtp.messagingengine.com [103.168.172.145])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b3bdadf-4207-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 14:20:35 +0200 (CEST)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfout.phl.internal (Postfix) with ESMTP id 478B413803A5;
 Thu,  5 Jun 2025 08:20:34 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Thu, 05 Jun 2025 08:20:34 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Jun 2025 08:20:32 -0400 (EDT)
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
X-Inumbo-ID: 7b3bdadf-4207-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1749126034;
	 x=1749212434; bh=6eWybKvdJd3EZ3bLh3sBKWehT7wSYUGIiOahcpXYyTM=; b=
	lOieqIxvazyxFpU+IHPvABAhEYkffuY4U7I7IM0rZnIw5sKj9mBLgZaxaSxVgGJB
	5OPBwvx6YIFpN36zq7ayTybj6vVWK6Nm9OXs57HgGWsWxMI+92zIr4Eunzn4sL8F
	0P0OgaN58DQpEwx5fqkdReZ1YFAkUwPCJtht8X1PJjQ8im86kipimweXtMWe49bq
	xYDe2thiwJnuVqvN6tjf8I7V6E79wsacTKOThBjgdJXMyJknwzXe0xaM1fuJ75uT
	fB985aIReY4SgYqJoAT1qiOMSAYZm1CbKu22Iw83WP253huXTP/v+u8uwBsSv66w
	bavuw7v9AS5JaM2YkWnaHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749126034; x=1749212434; bh=6eWybKvdJd3EZ3bLh3sBKWehT7wSYUGIiOa
	hcpXYyTM=; b=KhNyc23yIBmVb3B7aT4g3o79FbE20YJ3XwBLLVZGMmBvLpTTXx2
	5Z1ZIGj+6DpQP3c2KO1IxPjAZwPIEO2i/k4Z8vmhAAr/SPKA/TFfhlrWfGnueCog
	AX2JB6npUxa1Grz2JR7sj6/0yqWKv+WH7htaNxttUA4c/AVyGcMOuk/1fZ4k/Zkq
	ktI1VNcGJQzqxSir/4tn1asla+DNxg/DgoZPF3U8TGQMX8fpiWvKdgi5bvXzVTw7
	5dDffuEZh4rj9Byl14xJTp3ta1Pu4MejOQdHhPGwqo/i2bTQg0iyPqUk084Nat0M
	ln8h0OcADfCxXxU2+BJSHDsB4hsqP2CaqpQ==
X-ME-Sender: <xms:kYtBaPArZpaf_mA429aTegRlRvzfjSlYoqGK0vfyRsiPZaB_p3XoUQ>
    <xme:kYtBaFhxML7DfQcYQmHqXbAqw7GtRKCCFHitupbrAsLOTurBXz3JN84vfCJPPO2Mp
    iCloZibhGpkbA>
X-ME-Received: <xmr:kYtBaKmq9UQfc0leB2FOzbO6Zsd1jx2AfOzsgfy0ob5xjVxeFdOYcB1dv6L4NgsKuAIiXRUGu4xgpXgjV8ONz6hb6uDBxVfqVXQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdefiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettddvge
    euteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnh
    gspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgsvghu
    lhhitghhsehsuhhsvgdrtghomhdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfe
    estghithhrihigrdgtohhmpdhrtghpthhtoheprhhoshhsrdhlrghgvghrfigrlhhlsegt
    ihhtrhhigidrtghomhdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtg
    homhdprhgtphhtthhopeguphhsmhhithhhsegrphgvrhhtuhhsshholhhuthhiohhnshdr
    tghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvg
    gtthdrohhrgh
X-ME-Proxy: <xmx:kYtBaBzsnDrCFO3huquEoPJ3E75h4uhGGNlbJv9XJpzisEtu7eD30w>
    <xmx:kYtBaER0BR_dWhTszUXeWckD6n8FgCSkWYPjrvheAlRA3TCFA9ri0A>
    <xmx:kYtBaEY1XsNG093_2tbULyYk81wpiWBIcaOijYShJ1vI7cuRvBm_XA>
    <xmx:kYtBaFQkHxb8yQsYGk8iriLYhQL4s8mmZ8PvaKpE83_Eg9G8ZqrgQw>
    <xmx:kotBaFK0SdRC1v5Xxo7qQRUSf403W5fUqzjEeiFTOzfwfuJZ1ieFKwPk>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 5 Jun 2025 14:20:30 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/3] x86/EFI: Fix detection of buildid
Message-ID: <aEGLjhw8kTXKbkdV@mail-itl>
References: <20250605111638.2869914-1-andrew.cooper3@citrix.com>
 <20250605111638.2869914-2-andrew.cooper3@citrix.com>
 <0a314400-126a-4c2a-b36c-dda61bb0b751@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EahQsmcuVhjgAOZm"
Content-Disposition: inline
In-Reply-To: <0a314400-126a-4c2a-b36c-dda61bb0b751@suse.com>


--EahQsmcuVhjgAOZm
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 5 Jun 2025 14:20:30 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/3] x86/EFI: Fix detection of buildid

On Thu, Jun 05, 2025 at 02:02:21PM +0200, Jan Beulich wrote:
> On 05.06.2025 13:16, Andrew Cooper wrote:
> > The format of the buildid is a property of the binary, not a property o=
f how
> > it was loaded.  This fixes buildid recognition when starting xen.efi fr=
om it's
> > MB2 entrypoint.
> >=20
> > Suggested-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>=20
> I'll pick this up without a Fixes: tag, but I think it ought to have one.=
 (I
> didn't check whether MB2 or build-id support came later, hence introducin=
g the
> issue.)
>=20
> > --- a/xen/common/version.c
> > +++ b/xen/common/version.c
> > @@ -203,8 +203,11 @@ void __init xen_build_init(void)
> >      rc =3D xen_build_id_check(n, sz, &build_id_p, &build_id_len);
> > =20
> >  #ifdef CONFIG_X86
> > -    /* Alternatively we may have a CodeView record from an EFI build. =
*/
> > -    if ( rc && efi_enabled(EFI_LOADER) )
> > +    /*
> > +     * xen.efi built with a new enough toolchain will have a CodeView =
record,
> > +     * not an ELF note.
> > +     */
> > +    if ( rc )
>=20
> Instead of dropping the efi_enabled(), I think you want to replace EFI_LO=
ADER
> by EFI_BOOT.

Part of the motivation for MB2 entry point in xen.efi is using the
same binary in all boot modes, including legacy boot - in which case
none of EFI_* checks would be appropriate here. The grub series adds
support for loading PE binaries, and IIUC it isn't tied to booting via
EFI.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--EahQsmcuVhjgAOZm
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmhBi44ACgkQ24/THMrX
1yxgQAf/ccoj8J82ogFnLnZYjU5sH/KgGoBPZalxGcPvjUBZR6PL9FyhELXsQRKX
pOJ9B0IRQtmxAf8OTs0qlgvstzPd0ZGzG1+0CRIfUHBs4Tkn9gm966M05LVAdfEH
j8k/MBvC2QvjySMMTpaRWGa06R55J5HPiVIwrFL81gWIEQA3wsd5KGXQLrKMEW/N
5N87uyFLzhbY0358N/Aoqv9BKMBJfF//UBe9QfoIq3HfCzYdxybytuzne1VRELLV
irhnVEqFOElnelOnWsEF34vJhY6i9vBPHjtv/ji4Igv97N3nMAPZKnJ3vUKdN82A
gbNooecZ+zi1K6KNbK7zGCs4OZeOIQ==
=m/31
-----END PGP SIGNATURE-----

--EahQsmcuVhjgAOZm--

