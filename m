Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0987F577200
	for <lists+xen-devel@lfdr.de>; Sun, 17 Jul 2022 00:41:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368888.600298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCqSu-00062p-MM; Sat, 16 Jul 2022 22:40:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368888.600298; Sat, 16 Jul 2022 22:40:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCqSu-00060u-Jd; Sat, 16 Jul 2022 22:40:48 +0000
Received: by outflank-mailman (input) for mailman id 368888;
 Sat, 16 Jul 2022 22:40:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lLXC=XV=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oCqSt-00060o-0p
 for xen-devel@lists.xenproject.org; Sat, 16 Jul 2022 22:40:47 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51e4c9cb-0558-11ed-bd2d-47488cf2e6aa;
 Sun, 17 Jul 2022 00:40:43 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 69F6B5C0098;
 Sat, 16 Jul 2022 18:40:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sat, 16 Jul 2022 18:40:40 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 16 Jul 2022 18:40:38 -0400 (EDT)
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
X-Inumbo-ID: 51e4c9cb-0558-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1658011240; x=
	1658097640; bh=ceZsdSL2HT6asQORyI7l3sLKAzKheJh2gl0LFzFi/rg=; b=d
	K+Xc6EvnTGGxGTV6JrZRIHc8WvZOexzOe8O278Bg9PTS2gKXMfMW9yUaxeGWgigr
	+Oa4v6oaHGvyRS3xuN/jPRi4aC62fU9us2WJuD9Aug3up9VYSkvRN8gJbJvybHdW
	HI096u3rjsIMNe/umE6OrIu2ssPC0jE0fFk4I3apKSUE0ShlTWKur46HEnV7vlws
	J/IvHC/OKvrq2u525QTTt1uPGuSZfdsu2/RwKv6TPdSr6Hyt8bGO23QVwzjFhjrk
	HmUB4PV37dK6vdF9qloenEGGA3zlSH8S7WIaq/bP6mzhbwo5x+FA2UgfDQbyEpJx
	M3caUBoOe3VhTSrIxBHBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1658011240; x=1658097640; bh=ceZsdSL2HT6asQORyI7l3sLKAzKh
	eJh2gl0LFzFi/rg=; b=n528aPq7l1Rxx0JqHkiErInu9qSoVxUCItUErdyY0bb1
	OMhG/l83/N618pJPsXxPc2xPhism2869N/pVMYFSSmlsN8uwgqqUoaSwXOoh4xD3
	MItEC3S4/FOQDglg97124KAA1409NzYOUDpjOTHw0E1deENYugTKpv8v6/VH07Pu
	DhFzzoa+9Q1+L6qMR1OxGbOhMKlhcazG5P7m5GidRzSXbGG7websUO07lwuG5G7q
	jX0Pt2fJX4p35KH8Q5hCVMl3M5dPhJrs4BhMz3oayPripF6LzxuULQDQLfOgiOFY
	lV9N/8dXldFv2Q2TaFlXNFw4mmNxPQmVMcLg1rS54A==
X-ME-Sender: <xms:Zz7TYumO_FZQ7QBks6B8b26NRwnt8_BUqr03Ca-RGpK5lcX_RlFmpA>
    <xme:Zz7TYl1LsAa6MCipb-NjQwxOch4MBPQxhYCljB4PldF9vI-l1cyjmuJ3XORBnIj8q
    zloLfnD-GamDg>
X-ME-Received: <xmr:Zz7TYsr84VN_ELww2biOTwhrEibPEc--K-1PFqebo5__zL-mkMzUmGECflOIzQC1umjbe4w49hfhXei4TocGUKIup_0PyVjLlg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekgedguddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:Zz7TYimKcTtp4ZqIOcOzmuIwvEaQJKEr3xICANWs-zm14EXYoWcjiQ>
    <xmx:Zz7TYs1tiHlGYk8Gez46D0-nJ6eBGvWV2oJFXoDiVWCIzKuX5KcZTA>
    <xmx:Zz7TYpuKn9HWuL6mlXV4KcQ5087mFttLPINV2a5QboHT23xTomIYnQ>
    <xmx:aD7TYmqAP9wQoDNiTMxzbdFek2RB9r66iSnS2qwiXdrTuBS5FrBLvQ>
Feedback-ID: i1568416f:Fastmail
Date: Sun, 17 Jul 2022 00:40:35 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org,
	Connor Davis <connojdavis@gmail.com>
Subject: Re: [PATCH v2 1/9] drivers/char: Add support for Xue USB3 debugger
Message-ID: <YtM+ZGb6FnkVVCj6@mail-itl>
References: <cover.991b72d99d9e5bd4c2c76791ceb49f1056ce5d1c.1657121519.git-series.marmarek@invisiblethingslab.com>
 <80051b9dc5c99532e18a10a941c3523945d77698.1657121519.git-series.marmarek@invisiblethingslab.com>
 <d55ad603-1d54-f3cc-5a7e-87103704564d@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="V1v6WYkCrxpsBPdv"
Content-Disposition: inline
In-Reply-To: <d55ad603-1d54-f3cc-5a7e-87103704564d@suse.com>


--V1v6WYkCrxpsBPdv
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 17 Jul 2022 00:40:35 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org,
	Connor Davis <connojdavis@gmail.com>
Subject: Re: [PATCH v2 1/9] drivers/char: Add support for Xue USB3 debugger

On Thu, Jul 14, 2022 at 08:05:28AM +0200, Jan Beulich wrote:
> On 06.07.2022 17:32, Marek Marczykowski-G=C3=B3recki wrote:
> > +struct xue {
> > +    struct xue_dbc_reg *dbc_reg;
> > +    struct xue_dbc_ctx *dbc_ctx;
> > +    struct xue_erst_segment *dbc_erst;
> > +    struct xue_trb_ring dbc_ering;
> > +    struct xue_trb_ring dbc_oring;
> > +    struct xue_trb_ring dbc_iring;
> > +    struct xue_work_ring dbc_owork;
> > +    char *dbc_str;
> > +
> > +    pci_sbdf_t sbdf;
> > +    uint64_t xhc_mmio_phys;
> > +    uint64_t xhc_mmio_size;
> > +    uint64_t xhc_dbc_offset;
>=20
> One more observation: None of these four field look to be needed.
> They're all used only in a single function, so could be local
> variables there (and xhc_dbc_offset is only ever written, so
> could be dropped altogether).

While xhc_mmio_size indeed isn't used outside of this function,
xhc_mmio_phys and xhc_dbc_offset are in later patches.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--V1v6WYkCrxpsBPdv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmLTPmMACgkQ24/THMrX
1ywlEQf7BqEwX/O78YamDaHtZ6aSO7ZjejZx1ZG5inBoKTuJ/qQuH4voOjXfFcJH
u/QDp4Xn/UCgbZuXJqKGucqavc5fVHhZgdvtLGhNlMPZ00CxTj4V2+v4ZcbCzKba
yTHadDKx18NrFPQCQ03OyjkkPndP39bx4N++IYUtSvMOAPvordfMFoI6I5aGrV/F
AoqL+bq2SHtAaVi/+F9ENITmJ4EWmorrEhdYseBWYQ6xRKBONa5+mW0ZexRBvvSx
4qDFNV9HbdEmsQ+oj50RJvMMPy2gxa3K+gsR9S+O7nTyeBzj1mODn1IIDm8pyg4W
2Qs4iotBWchrQTjsZLuXJrFACZ4UHQ==
=wO1A
-----END PGP SIGNATURE-----

--V1v6WYkCrxpsBPdv--

