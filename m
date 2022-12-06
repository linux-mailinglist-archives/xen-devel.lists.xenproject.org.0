Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36675644A73
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 18:39:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455388.712840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2btr-0004pg-6c; Tue, 06 Dec 2022 17:38:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455388.712840; Tue, 06 Dec 2022 17:38:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2btr-0004ne-3d; Tue, 06 Dec 2022 17:38:35 +0000
Received: by outflank-mailman (input) for mailman id 455388;
 Tue, 06 Dec 2022 17:38:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Feu=4E=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p2btp-0004nY-IF
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 17:38:33 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb735672-758c-11ed-8fd2-01056ac49cbb;
 Tue, 06 Dec 2022 18:38:30 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id DF2B63200916;
 Tue,  6 Dec 2022 12:38:26 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 06 Dec 2022 12:38:27 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Dec 2022 12:38:25 -0500 (EST)
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
X-Inumbo-ID: cb735672-758c-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1670348306; x=
	1670434706; bh=V2nKmtARX8y3Galthxhhq6hUM5pjvz4rWj2KWQTxA3s=; b=t
	InGqcOPPt1J4IJS/PtQgxWV3kPeRDDJTwhGACtBhIXrJqp6yzLEcAsasfHN6oYC7
	lX3F9poTfwiUQw2GRSkDeJo7tXG86u9lh/L/p+3fTX1cVnJl1TKEkE9PDpqFQfZC
	OAiNQkfRDeK8wAdKdjxCtdidKS1UeGZnx6xE9Ood7E4HcerBm2I0eBiQ5WOS9YZA
	5eqZFh7mN+nT8raIZlKU1qz7FzymrXWL4zjTtxY8PnVlGVb5A3snwe4lJI1CXqp2
	gCf2MqhwElAwK5sE/okeFUg1uuVKXo/zMRK91+DLsMV9YdvBL2psGyNWK4v/dhiX
	SO08Vog6cu3CE0jwsEVfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1670348306; x=1670434706; bh=V2nKmtARX8y3Galthxhhq6hUM5pj
	vz4rWj2KWQTxA3s=; b=jZk2cnjYvqcIxDwRoKq/RLnE9KneL3onRo8RLdLgMV4b
	fVULeJIu0bbA0+ZXStXZMF065syeeXWK+at0TJATHC6maYfe/2u66WLoGYJ1iBXx
	9rpOLXedUhwgchT6AZRIUYjO6suw7rqclLmOvboG1TwbA1w5NcqCiYflG8b6/RFr
	rJ8n9RbxpsS/4R3adQQmr3AiJKrgWxkfAokEZcHUQRYcagBunpWzeJo2gUm1DYHl
	3HTVH1lkoH60/rPOLiDL0vgX4CjMOwTKMnli2TswhndZx5lnldmNkTnp3F75CYJX
	luR4HQMtbONX18lYOeJwaH2aIf3EqvtSL28AAAjJbg==
X-ME-Sender: <xms:En6PYz8TN64ZufiFwhkDrxdrs3MJx5f9ERIIvrT6-S0bjqTqEAakkg>
    <xme:En6PY_vnx1BuBQDwXGK-cNvFNe5iAuuSn9qebcxWMXRgjOlzk6Hyg_ZMovscG0mVd
    Uts47mur0cre2U>
X-ME-Received: <xmr:En6PYxCgTXx78GPJQn8Vhfjwbc7Skr56tsl6KRFEELo4BhLrBX4uTT1tbdsm>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeigddutdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepvdejteegkefhteduhffgteffgeff
    gfduvdfghfffieefieekkedtheegteehffelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:En6PY_fyfl7pLpgzA7BJpLKo4uTntiFCtTsYaIjJTQQ4RpF3Kk7ugg>
    <xmx:En6PY4MhT7Sv6GjdwxGpKG3ORl167PK3WdButZgqBYAO_ht29AcGsw>
    <xmx:En6PYxmTd91zXMqSwxicUtuuSNeyEZ9gqPdJfOB74P2uq7A-x39cHw>
    <xmx:En6PY32iVGO818INr4auMuJx1C8FpUBqNxipVrkDm6hPjp6H82kf7Q>
Feedback-ID: iac594737:Fastmail
Date: Tue, 6 Dec 2022 12:38:19 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <George.Dunlap@citrix.com>,
	"Tim (Xen.org)" <tim@xen.org>
Subject: Re: [PATCH 4/8] efi: Avoid hard-coding the various PAT constants
Message-ID: <Y49+DyuzcLU2PxLt@itl-email>
References: <cover.1670300446.git.demi@invisiblethingslab.com>
 <ea32e526153a40837484ba9c64a7d157804b6c27.1670300446.git.demi@invisiblethingslab.com>
 <4f34f039-b0b9-1761-b5d0-936f25e8a50a@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vnZ8zmPhSWM/Qsr8"
Content-Disposition: inline
In-Reply-To: <4f34f039-b0b9-1761-b5d0-936f25e8a50a@citrix.com>


--vnZ8zmPhSWM/Qsr8
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 6 Dec 2022 12:38:19 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <George.Dunlap@citrix.com>,
	"Tim (Xen.org)" <tim@xen.org>
Subject: Re: [PATCH 4/8] efi: Avoid hard-coding the various PAT constants

On Tue, Dec 06, 2022 at 11:17:20AM +0000, Andrew Cooper wrote:
> On 06/12/2022 04:33, Demi Marie Obenour wrote:
> > This makes the code much easier to understand, and avoids problems if
> > Xen's PAT ever changes in the future.
> >
> > Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> > ---
> >  xen/common/efi/boot.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> > index 8e880fe30c7541a202dec3e665300d6549953aa3..260997b251b09dae4b48c1b=
1db665778e02d760a 100644
> > --- a/xen/common/efi/boot.c
> > +++ b/xen/common/efi/boot.c
> > @@ -1746,21 +1746,21 @@ void __init efi_init_memory(void)
> >          if ( desc->Attribute & EFI_MEMORY_WB )
> >              /* nothing */;
>=20
> This is an implicit 0 case which wants changing to _PAGE_WB.

Good catch!  I will make this change in v2, but I also will add
BUILD_BUG_ON(_PAGE_WB), as at least Linux assumes that _PAGE_WB is 0.

> >          else if ( desc->Attribute & EFI_MEMORY_WT )
> > -            prot |=3D _PAGE_PWT | MAP_SMALL_PAGES;
> > +            prot |=3D _PAGE_WT | MAP_SMALL_PAGES;
> >          else if ( desc->Attribute & EFI_MEMORY_WC )
> > -            prot |=3D _PAGE_PAT | MAP_SMALL_PAGES;
> > +            prot |=3D _PAGE_WC | MAP_SMALL_PAGES;
> >          else if ( desc->Attribute & (EFI_MEMORY_UC | EFI_MEMORY_UCE) )
> > -            prot |=3D _PAGE_PWT | _PAGE_PCD | MAP_SMALL_PAGES;
> > +            prot |=3D _PAGE_UC | MAP_SMALL_PAGES;
> >          else if ( efi_bs_revision >=3D EFI_REVISION(2, 5) &&
> >                    (desc->Attribute & EFI_MEMORY_WP) )
> > -            prot |=3D _PAGE_PAT | _PAGE_PWT | MAP_SMALL_PAGES;
> > +            prot |=3D _PAGE_WP | MAP_SMALL_PAGES;
>=20
> Unrelated to the transformation. I'm unconvinced about the correctness
> of using MAP_SMALL_PAGES here.=C2=A0 There's nothing wrong with large pag=
es
> of reduced cache-ability, and the framebuffer is going to live in one of
> these regions, probably a WC one...

I can make that a separate patch.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--vnZ8zmPhSWM/Qsr8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmOPfg8ACgkQsoi1X/+c
IsEJMQ//XOXQbEYaPL6XgfY/SQhZccnCqSgjPX+pxmqHXFaFOw0SvUrhIY5sOMBV
C7MFKum9xS9QlvoNZ1Czk8aak1uGMmiRLJ3y10SKqspAkm5+aqPhfwIE5gGpA883
JtpFg0CMXkop8sJdtTLKSYZDmCO/k/0ji8RmUOBjVmGR66A6d1oXGsJtR4Av9csJ
GwU+aPUmp9hxh/2Yo4zplPQwOP6k8ojP7Jtu6SpxWY4PjQa6lnaeC0XwAOTXVqu0
NG9VelMmwZlSME3pVFWKBjTbZOvoLwNdPfK9f7IOkdt2UtDQVlzNeCRo7HRxcDNm
RJNs3w66O8Xg7tJNx6WWNUqwZntQ3l4xT3o4XN/Ns5zUtBHM9ZLkiPu8IS6k6IT6
6uAEbNlDARczzR5tHT+oWEu+9Lj6cvIQwHxZ+69oP78z1HIA0u3VKKzHtCNTaUrF
W6wz8jO1fTzyetsmBhHU75ivBZXXeGjJKLcf6uMHl6+Y+yRgH5mciOb19ErIE9gi
+5Fh3eBcuhzxA2e4SEj2Ip4tu/E1YKEP1YVS5dJeLxJbYOkeI+Xg3XH51JB8m1yo
CO7B5fQFEEJ9nWirJsIYHdwhmzENqX2Jp7o4EQWAQYDGhS+jTr+pvEvw9h+8xODo
KVNUrMJxuhUc/Qp8Aaoo23h+WfJkAyTgIJNBnIPkFCh49t8qtkM=
=uMcZ
-----END PGP SIGNATURE-----

--vnZ8zmPhSWM/Qsr8--

