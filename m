Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0C35A270B
	for <lists+xen-devel@lfdr.de>; Fri, 26 Aug 2022 13:47:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393744.632863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRXn8-0002gN-G8; Fri, 26 Aug 2022 11:46:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393744.632863; Fri, 26 Aug 2022 11:46:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRXn8-0002cv-DF; Fri, 26 Aug 2022 11:46:26 +0000
Received: by outflank-mailman (input) for mailman id 393744;
 Fri, 26 Aug 2022 11:46:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/ol=Y6=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oRXn6-0002cn-3B
 for xen-devel@lists.xenproject.org; Fri, 26 Aug 2022 11:46:24 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1b825e4-2534-11ed-bd2e-47488cf2e6aa;
 Fri, 26 Aug 2022 13:46:21 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 0DF4A32009BA;
 Fri, 26 Aug 2022 07:46:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 26 Aug 2022 07:46:15 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Aug 2022 07:46:13 -0400 (EDT)
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
X-Inumbo-ID: b1b825e4-2534-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1661514374; x=
	1661600774; bh=yhS27Ab1W8mIUyTQLj+wS32fp2GXOTqJpSeJR/gvLbo=; b=n
	Ny1m2vKz6pgUQMS+9WOx7sU/zTVqO2NzW4BxKjT2vwltSdWaID5mePKsuFj63x5g
	AcNjRySxglkeGVcG+gHOnfjb8MR5e45QDpRNXsjh3cldKbNzee9Qz810LWfzRUtO
	wn9U0o/u5YRnDDMSdbElcApWCxkTO1juKaVxSBc1NhpfiTLR/PZkJ3LYOopHtLHG
	JMbIK2gqaYUw6iTZvjf1w7IWpPJsb9ZS+jdkM1ZxAt1+Z+hmNLN6Q/ybrURbZj8q
	Fa2LHIVbDBAzXO43X3IxxqYoc68ztFuXPxnc+AnB4hFclnppS0/vcfvLoYpS892T
	tEX4OCveMRKD3vOzdli6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1661514374; x=1661600774; bh=yhS27Ab1W8mIUyTQLj+wS32fp2GX
	OTqJpSeJR/gvLbo=; b=Wdp0DpT2ER+eitMUds5Yo2xqzIxI3Um+czjLVCtVKqcA
	i3KHliQf8DsYN3UsDVoxNjQFbaGDPZS+Qqy73A8AcFG8TZ3UkyUME6EeOje51Jw5
	3HLdZE2iHefyK9cIvkIIkk/seo+5LIPpHZnOud7sOOMSKi4xk7r2qKXwGdxBV1xe
	RsboDJxujoTo3+1UY92Bv2X7l5kIwrbqWkLpTTdxLECWFszpSKVfGNJ85Ie99YQi
	VCHBxCp3z42gwnLyPifmD5/rspZr8bBWnJR65+tu33cBfL7sQlBkW6L360gnW+3y
	Cs6k/Lxif5a/pvVzZkn2xSKnHHCon5KMHqk6bsZosQ==
X-ME-Sender: <xms:hrIIYzNdMaqNpK5WVz6RIko7NDp-hhfVijorDxcERZeDz35eD5jAWA>
    <xme:hrIIY9-cuj1PyiZk_Wk9rb0b5gDPZkkQ_0nL9Ta5yPmjxvUQDyUXebeheJWwgQqSE
    yY694zwECxSfw>
X-ME-Received: <xmr:hrIIYyR9Wegr8iRw-2Cl75zEDO5wcB3Ri7ReBmjVjLOtk6jYV5-3K2pD_pcgIDkQM5PMXA-83O8veLvMwtFOsIxxra91HxPVBTto>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejhedggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:hrIIY3sMnC6ZmJgMa_AHKBTgaVup9by6B1bHAGqHL-5KqRvWrAI1IA>
    <xmx:hrIIY7eWT3Mm9hudY0FAIXwroc5h4tzEgYEltA0mdAYhEe8gEnx64Q>
    <xmx:hrIIYz0y5r3v1p4pxFmvKPUYpBSZHdCrJz3Jakkx4ypl3o8C7NfXSQ>
    <xmx:hrIIYy6jsEaS5m3bW8K1uyavrtN8Rm5rbFGArxQkknLwuVOGhIy-qg>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 26 Aug 2022 13:46:09 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 1/9] drivers/char: separate dbgp=xhci to dbc=xhci
 option
Message-ID: <YwiygukKUUqiAke9@mail-itl>
References: <cover.4afa0fece5b70e838e4f1c7c7f25d0fa3d157073.1661181584.git-series.marmarek@invisiblethingslab.com>
 <edff5ba0d286a41b94a6b4bb332b63228f7faebe.1661181584.git-series.marmarek@invisiblethingslab.com>
 <b323ebc3-68fc-f6e1-b9ac-d508855a605b@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Li+cuNswEYNZshdT"
Content-Disposition: inline
In-Reply-To: <b323ebc3-68fc-f6e1-b9ac-d508855a605b@suse.com>


--Li+cuNswEYNZshdT
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Aug 2022 13:46:09 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 1/9] drivers/char: separate dbgp=xhci to dbc=xhci
 option

On Thu, Aug 25, 2022 at 05:44:54PM +0200, Jan Beulich wrote:
> On 22.08.2022 17:27, Marek Marczykowski-G=C3=B3recki wrote:
> > This allows configuring EHCI and XHCI consoles separately,
> > simultaneously.
> >=20
> > Suggested-by: Jan Beulich <jbeulich@suse.com>
>=20
> But was I maybe confused, and much less of a change would suffice? After
> all ...
>=20
> > --- a/xen/drivers/char/xhci-dbc.c
> > +++ b/xen/drivers/char/xhci-dbc.c
> > @@ -1058,9 +1058,9 @@ static struct xhci_dbc_ctx ctx __aligned(16);
> >  static uint8_t out_wrk_buf[DBC_WORK_RING_CAP];
> >  static struct xhci_string_descriptor str_buf[DBC_STRINGS_COUNT];
> > =20
> > -static char __initdata opt_dbgp[30];
> > +static char __initdata opt_dbc[30];
> > =20
> > -string_param("dbgp", opt_dbgp);
> > +string_param("dbc", opt_dbc);
> > =20
> >  void __init xhci_dbc_uart_init(void)
> >  {
> > @@ -1068,25 +1068,25 @@ void __init xhci_dbc_uart_init(void)
> >      struct dbc *dbc =3D &uart->dbc;
> >      const char *e;
> > =20
> > -    if ( strncmp(opt_dbgp, "xhci", 4) )
> > +    if ( strncmp(opt_dbc, "xhci", 4) )
> >          return;
>=20
> ... this already avoids mixing up who's going to parse what. So right
> now I think that ...
>=20
> > @@ -1102,7 +1102,7 @@ void __init xhci_dbc_uart_init(void)
> >      dbc->dbc_str =3D str_buf;
> > =20
> >      if ( dbc_open(dbc) )
> > -        serial_register_uart(SERHND_DBGP, &dbc_uart_driver, &dbc_uart);
> > +        serial_register_uart(SERHND_DBC, &dbc_uart_driver, &dbc_uart);
> >  }
>=20
> ... this and other SERHND_* related changes are enough, and there's no
> need for a separate "dbc=3D" option.

But then you wouldn't be able to configure "dbgp=3Dehci dbgp=3Dxhci" as
one would override the other, no?

>=20
> > --- a/xen/include/xen/serial.h
> > +++ b/xen/include/xen/serial.h
> > @@ -95,6 +95,7 @@ struct uart_driver {
> >  # define SERHND_COM1    (0<<0)
> >  # define SERHND_COM2    (1<<0)
> >  # define SERHND_DBGP    (2<<0)
> > +# define SERHND_DBC     (3<<0)
>=20
> Please also update the comment just out of context.
>=20
> Jan

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Li+cuNswEYNZshdT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmMIsoIACgkQ24/THMrX
1yzW+AgAhFh2Zfp7PGtgXSy9OUqvvWr3e2+HvaUqGY867L+BYFq14TxSKaGX2Qcr
OTJZ1d8X1CcMpyfAjAyA1hD2GT568lXM9oh5EdHEOriczLPrKsVfSIK/K3zj8j1s
X9DGYC92lAQ1dRW9HQDnNZXY9QJGcUCu5GKvb2xjnPqfbD6XwW1Zy4AS7dIEsRXk
ey5oCEmhH5OGah6RNxB8IMFRSIrZ1sBOtipZXlgtDtnGSwNOgDfK9pCjHOna1MFP
aad2p6m+enIutyrfdNJhOEaBDQ2lnr1rPqRhQjleqxEBkrRaFc7hkZJVh8vj/hSr
u1PCLSKjGCF3WTXGtxl2+BXFv09dWg==
=qJoS
-----END PGP SIGNATURE-----

--Li+cuNswEYNZshdT--

