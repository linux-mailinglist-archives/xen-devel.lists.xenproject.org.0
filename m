Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 800A46FF5F5
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 17:28:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533480.830203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px8Dd-0006vP-Kt; Thu, 11 May 2023 15:28:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533480.830203; Thu, 11 May 2023 15:28:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px8Dd-0006sy-I6; Thu, 11 May 2023 15:28:37 +0000
Received: by outflank-mailman (input) for mailman id 533480;
 Thu, 11 May 2023 15:28:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3dl8=BA=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1px8Db-0006ss-TF
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 15:28:35 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c6ba083-f010-11ed-b229-6b7b168915f2;
 Thu, 11 May 2023 17:28:34 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2F0245C0655;
 Thu, 11 May 2023 11:28:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 11 May 2023 11:28:31 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 May 2023 11:28:30 -0400 (EDT)
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
X-Inumbo-ID: 7c6ba083-f010-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1683818911; x=1683905311; bh=giWFEUQ7CavNhcZALMqM8wfoPHUPcBghLDI
	TMO2MFvk=; b=d6n9L6ceCtInBL0eUPhsbNGYEi6Bv3935fwMJDYpInSWb0ROfqQ
	YFZ8gaLe49td2kPoIfPY+DwO55x5UgeJfKngTUEIErXdUho4YF5m6zbP90nnEo5V
	OTNNc3SZZsXqlVqbBKrlQnboBNk87ioVq1w/4NNRkNX2mzVWO0hNQzpwEQTSySiG
	Mw06/oNygfRJYP0iv13HJaJExRrc9Muj03FbC3ulE5qsDS+kj0NWmeU/haScZxQv
	JM2IFBy8AH9CB5R5XE6yJjlfa3RSbtgwSUSrU7Q4KvCo43saY9QTjj1yYS4CJOU7
	Y382uSxMmDNxilkZCTH7q+7RRmvHqf7mfyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1683818911; x=1683905311; bh=giWFEUQ7CavNh
	cZALMqM8wfoPHUPcBghLDITMO2MFvk=; b=gznDip2ddyPcfQWSjhklR7gcAqesU
	zh+034EKuajFTnaSkZIUcwndtQL3PUFcVbvZRUKjvPif3pRMD+j0IrxhVaiFcTP5
	F7ZYDOi2dtftRq+NSyjUJYRRNv8zSbim/t66+2mJ92aX1RRxYP/VoQO3r0ZumG1l
	2887gIEOB2za+7MKZX2XgtYpYmiWw69P5F5G1PkViPEbrmYNG/NJdiSfIfyJgT0C
	V3s8V7F5v5P6UBJSU89monZ/Yo1QyBhwb4YweRezELmP38x0Ss+iOBL9g86kbY02
	u/qGJlEEiumduYGssdNnKtsA1vMU/qpFmti4ztEFqh9jyV5S7McbBvjMg==
X-ME-Sender: <xms:nwldZGVNXD5o3g6jFyHkSo6Zg4Hkb4EV8RGHxxTpD7IHYUBiRwSfaA>
    <xme:nwldZCnO57EWzCe1MnH2f6gLLxdzpDQLZao4RakBqDFfaRj_PKSc5UN5xGUETsY7B
    mRY9ksvlvVfpg>
X-ME-Received: <xmr:nwldZKb1F5aiT2hkt7omPTBiZEn1oXB6S3DQwhVN9Ft_hGiNJQgFWn658PyWCCrDm0tou6GnJAHrWeZkAO8uKXmdA-YLCVFSYME>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeegkedgkeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:nwldZNUn0hzYLJ6if9AwRDSd286_eauLdoFg90NhkOwk4EzyqK2eXQ>
    <xmx:nwldZAkY5L9v6tv0WFLvpz8HB7wF95AAN-mMnZMNd641bQVKjSBOPg>
    <xmx:nwldZCfu6BjTqWF2Lt3QnNQgytGRFdqTufmubh1SlF9_7Kxfl_nPIA>
    <xmx:nwldZCQ9npqBXqP3VwAPoaE75uKjElT6ucLUEs7PqMr_5yQJ_upPBA>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 11 May 2023 17:28:27 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 0/2] Add API for making parts of a MMIO page R/O and
 use it in XHCI console
Message-ID: <ZF0Jm5anuVGLHSL7@mail-itl>
References: <cover.dd82aca339854e90ffe12e7bc4298254a6caaf0d.1683321183.git-series.marmarek@invisiblethingslab.com>
 <CAKf6xpspPdt6mM4MuL2-vwXHu23ahm874e4kZqROqCwC4cd=fA@mail.gmail.com>
 <ZF0ISD/uMns0aLtd@mail-itl>
 <CAKf6xpsLg-Dve9-uLysGv-hnkVuk0vPsxf=a6fc3ebduzryqbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zdjTCr1l9KJcVKkv"
Content-Disposition: inline
In-Reply-To: <CAKf6xpsLg-Dve9-uLysGv-hnkVuk0vPsxf=a6fc3ebduzryqbQ@mail.gmail.com>


--zdjTCr1l9KJcVKkv
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 May 2023 17:28:27 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 0/2] Add API for making parts of a MMIO page R/O and
 use it in XHCI console

On Thu, May 11, 2023 at 11:27:02AM -0400, Jason Andryuk wrote:
> On Thu, May 11, 2023 at 11:22=E2=80=AFAM Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com> wrote:
> >
> > On Thu, May 11, 2023 at 10:58:48AM -0400, Jason Andryuk wrote:
> > > On Fri, May 5, 2023 at 5:26=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
> > > <marmarek@invisiblethingslab.com> wrote:
> > > >
> > > > On older systems, XHCI xcap had a layout that no other (interesting=
) registers
> > > > were placed on the same page as the debug capability, so Linux was =
fine with
> > > > making the whole page R/O. But at least on Tiger Lake and Alder Lak=
e, Linux
> > > > needs to write to some other registers on the same page too.
> > > >
> > > > Add a generic API for making just parts of an MMIO page R/O and use=
 it to fix
> > > > USB3 console with share=3Dyes or share=3Dhwdom options. More detail=
s in commit
> > > > messages.
> > > >
> > > > Marek Marczykowski-G=C3=B3recki (2):
> > > >   x86/mm: add API for marking only part of a MMIO page read only
> > > >   drivers/char: Use sub-page ro API to make just xhci dbc cap RO
> > >
> > > Series:
> > > Tested-by: Jason Andryuk <jandryuk@gmail.com>
> > >
> > > I had the issue with a 10th Gen, Comet Lake, laptop.  With an HVM
> > > usbvm with dbgp=3Dxhci,share=3D1, Xen crashed the domain because of:
> > > (XEN) d1v0 EPT violation 0xdaa (-w-/r-x) gpa 0x000000f1008470 mfn 0xc=
c328 type 5
> >
> > Hmm, this series is supposed to avoid exactly this issue. I tested it on
> > 12th Gen, so maybe 10th Gen has a bit different layout.
> > Can you add a debug print before subpage_mmio_ro_add() call in
> > xhci-dbc.c and see what area is getting protected?
>=20
> Your series fixes the problem!
>=20
> I just had the details from the original issue, so I included them.  I
> was trying to highlight what this series fixed for me.  Sorry for the
> confusion.

Ah, then all is good, thanks for testing! :)

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--zdjTCr1l9KJcVKkv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmRdCZwACgkQ24/THMrX
1yzmzQgAgp8lD3YdqZnWNV9XnP4jWqNjenCU9UFyUDYps6sJmJW3J5VBttxs/o/o
0UTOMVY7H3KhOc4+noT7dZ2NzggwkwhLZoG0B+j40fN4OrDt1vpuI74xKqxz/LzM
Qaiy1ozLNCOX/yl2ar9+sDO7YSQQMKkk/JuPddqL9F8XwUn2Dilxs0XO54RczKxo
K4KWsnMHz4xS66dk/txpX5KlvZsjgi3iXAFMmbK9S7o11wPB81ehHZyXF19G5DYm
hEJG807TcYpmZXF/QK6H6p/Ln+UZVbYVdT53r44n6bbguQlCPnLlm7BhPkifD+2G
TCyGn9SqqZ2ex4+AC+TCRcldRDMzhQ==
=P8Pi
-----END PGP SIGNATURE-----

--zdjTCr1l9KJcVKkv--

