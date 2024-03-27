Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5687088D4C6
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 03:46:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698286.1089788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpJJE-00087E-S2; Wed, 27 Mar 2024 02:46:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698286.1089788; Wed, 27 Mar 2024 02:46:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpJJE-00085f-P9; Wed, 27 Mar 2024 02:46:36 +0000
Received: by outflank-mailman (input) for mailman id 698286;
 Wed, 27 Mar 2024 02:46:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Klda=LB=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rpJJD-00085G-63
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 02:46:35 +0000
Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com
 [103.168.172.146]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38bfb2d0-ebe4-11ee-afe3-a90da7624cb6;
 Wed, 27 Mar 2024 03:46:34 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfout.nyi.internal (Postfix) with ESMTP id CDFF6138016F;
 Tue, 26 Mar 2024 22:46:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 26 Mar 2024 22:46:32 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Mar 2024 22:46:31 -0400 (EDT)
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
X-Inumbo-ID: 38bfb2d0-ebe4-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1711507592;
	 x=1711593992; bh=QO4nVzCmPjbcTyIF2cXjMY9yPrx3YHooLGijX9GaD4o=; b=
	NSFsCxFiesfAuDAa8+Ex7AxYY7aYP/RZluLJP5nIooI72VXd7LAaaCMrstUvDstF
	NYpNb8xl7mPSucmYQuY9QZgPKerJB7gE0kAyitNPO5p8xSv28Px3cSB6FNalC1k5
	9mli7urpbZHuBOFOcQvUTO6OX6aH2GErK/fIzWEVkxfrM2/UE4x5UJlomudIKM4k
	rqFAEq1I18AczQ0E6qUIqAfMiUVNBA+fT4nkLecBCeZpmMYq4HjDl4y9bhEbROMZ
	kaodw6jhk2IcR5dEPWc+uH9Q39tIDD4sYeJhIyRtYXV267pOk8g4vghg1xvZWlj4
	v3SCUq/3L/1j9A8N7ibNiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1711507592; x=1711593992; bh=QO4nVzCmPjbcTyIF2cXjMY9yPrx3
	YHooLGijX9GaD4o=; b=v7qXt4mFDL8u3AdC9XyX4+97DYduxi/7wPqriAAcVJbu
	9XO+zjjOzpgs2P3mYXJA0sIhY9bcT8ea/1aq0NY0U/19KSUbk4bAg4JhygwaA0Qp
	0kREma/cM/3KdNJ4CSv+rDyBlj8b8eQ4aAeUUNXAyukIkeOvbblb2W9OJ2tFQWBA
	RUfXsc7WIHg1+KstmvLVsun+AYOtjugTU4hGVfDP8EJzXmlQaNWvliQbJ1podFI1
	yeFNGzuQFlnsf71H9F2QIBTq4ifo1oyuLVStCl70+IleUxcJ3sIrJo5CBqt9Gqrh
	tHYgWfN9UajJEJFzXpOmMnO3Ucc1zU7ocIQTqxZC/w==
X-ME-Sender: <xms:iIgDZgBDZ9a3Ey2FgwZmgFG1EfcYGcppBT-FW2LZ8P0qINM986AhZA>
    <xme:iIgDZiijHxy4HSxJ3mcnVPl4VACyxmUjT0PybRm5kGnbaZLBlXz09cHcMKDZzHQXL
    WwaOsbS-hgKwg>
X-ME-Received: <xmr:iIgDZjnATnaZEmikPUW8A6Q7oVQ5fLojFEA6U71wp3POyEzHFyZNN4tu0pIFHutraRs8yumByg6KYwLycuQxVTV8mPMynxxvIw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledruddugedghedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:iIgDZmx6qge4UmzNg72uD3P52Rray-dMftR1c7FxCWrCxAsvWE5zHw>
    <xmx:iIgDZlTsZi2Bjar3j6Tu_GOpETghK1XKh6gDixATPgFMngVB5ce2xw>
    <xmx:iIgDZha0fAOOFeG26HDb1AsW3Ad5NN41DOQ_CvxlrjSdLesD9cIW9A>
    <xmx:iIgDZuQCyhACrxeJW43JadlZZnrdfQ9SFRCgXFsBJGbiXLRldJrZow>
    <xmx:iIgDZi8OQ11ve7YiJLL217Nj2o6GD9yS5_JTIfPAbT7Omrn7W0ypbw>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 27 Mar 2024 03:46:28 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/2] IOMMU: store name for extra reserved device memory
Message-ID: <ZgOIhXRO_c1mbCV7@mail-itl>
References: <20240312162541.384793-1-marmarek@invisiblethingslab.com>
 <3ab49282-6b67-4ab0-bb65-f04c62bcadcb@suse.com>
 <ZfhjSgAwZnSuI10N@macbook>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iDMBP8wO4N0lDexN"
Content-Disposition: inline
In-Reply-To: <ZfhjSgAwZnSuI10N@macbook>


--iDMBP8wO4N0lDexN
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 Mar 2024 03:46:28 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/2] IOMMU: store name for extra reserved device memory

On Mon, Mar 18, 2024 at 04:52:42PM +0100, Roger Pau Monn=C3=A9 wrote:
> On Mon, Mar 18, 2024 at 02:40:21PM +0100, Jan Beulich wrote:
> > On 12.03.2024 17:25, Marek Marczykowski-G=C3=B3recki wrote:
> > > It will be useful for error reporting in a subsequent patch.
> > >=20
> > > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethi=
ngslab.com>
> >=20
> > In principle
> > Acked-by: Jan Beulich <jbeulich@suse.com>
> > However, ...
> >=20
> > > --- a/xen/drivers/passthrough/iommu.c
> > > +++ b/xen/drivers/passthrough/iommu.c
> > > @@ -682,6 +682,7 @@ struct extra_reserved_range {
> > >      unsigned long start;
> > >      unsigned long nr;
> > >      pci_sbdf_t sbdf;
> > > +    const char *name;
> > >  };
> >=20
> > ... to me "descr" (or the longer "description") would seem more suitabl=
e.
> > Thoughts?
>=20
> I'm happy either way, but I don't find 'name' odd.

"descr" sounds a bit weird (even though it's clear what it means),
"name" is a full word. And also, quick grep suggest other places use
"name" for similar purpose (I haven't found a single "descr" nor
"description" struct field).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--iDMBP8wO4N0lDexN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmYDiIUACgkQ24/THMrX
1yzE0QgAmH38pY87x6BmEU3hG502FHm6hsP4NHezxOk4SDFEXnqzwcXPEcBjKiNf
fjK0QKQiUDqd+lCD5hS9ixANlKTygZWsdmoll5VJsJXmVWvdR15C40nDn2dI8qyG
M+kX7Zk2T83Qk+T0znOwWaiZJs1E6itiJFE3c9RNbntd3+D+Eq8Tj656/N8r13ZF
9AfMHNIHxKCxUTGzFK9PcRFDT+Kz0QPg6mhmwhbmqCGBagET7+VFVIDwR4bZ/kFN
Wq6NYHjXuMGZm4FphwkesnMSpuneEjcErd6CblkP1zUGP7lf1rdU+11tj4/W/r0h
OHQkNaUPO6rDD471mFBZtCfGRms5Cw==
=sj0f
-----END PGP SIGNATURE-----

--iDMBP8wO4N0lDexN--

