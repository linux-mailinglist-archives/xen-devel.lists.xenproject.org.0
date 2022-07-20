Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A37957BF16
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jul 2022 22:12:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372291.604127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEG3K-0004IK-Ee; Wed, 20 Jul 2022 20:12:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372291.604127; Wed, 20 Jul 2022 20:12:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEG3K-0004G5-Bo; Wed, 20 Jul 2022 20:12:14 +0000
Received: by outflank-mailman (input) for mailman id 372291;
 Wed, 20 Jul 2022 20:12:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kTCF=XZ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oEG3J-0004Fw-2F
 for xen-devel@lists.xenproject.org; Wed, 20 Jul 2022 20:12:13 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b74536f-0868-11ed-924f-1f966e50362f;
 Wed, 20 Jul 2022 22:12:11 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id AA9E43200495;
 Wed, 20 Jul 2022 16:12:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 20 Jul 2022 16:12:07 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 20 Jul 2022 16:12:04 -0400 (EDT)
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
X-Inumbo-ID: 3b74536f-0868-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1658347926; x=
	1658434326; bh=84itqUMajeqYwj5llAtvXiSFE04XLiuJMB4+T3BZ0gk=; b=K
	xAunL5+xyG5B/KdhqnknPhILJ2iLgrP94ghEeOt0UWl5W38x5II9c4hL9vwPye3r
	2dNmirfnqC3llgf6Awti0tbkyk670ZS5CaHxoWD8Pbne6b4KiSq3IFPy+TkJW34b
	oZS51/ZZkWPat05oklQHS97RdPLif+z/uuxGuNmRiYmxF+ylU6zqcQJ2s1UDaW7b
	VM1+cLiG5egPTj7bUvD7gIbjOfJ6CplAXMfrRbGMy1998LLZ1hF3Wt008nIH/4z2
	AZ/9zyPzCt/kxtazJ1v0VFy6s20lG869bLUnJsmCilEPXdDJnZKACnawdsuB7L6N
	AgWuWggHzfKfYSxPXBHyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1658347926; x=1658434326; bh=84itqUMajeqYwj5llAtvXiSFE04X
	LiuJMB4+T3BZ0gk=; b=ntbMfc8sUp/ABJlF+IqoGOz70IXTxTyOk8cWTKByPbyZ
	NgnDFJvcZV5izL6uBCe/YmWVYdnILhM/Woq2heEjewMLwvKy9Ebzv8Kty/fRQmkh
	KwD3E2QcxNliUDZ2Hu/zmiAeQY0tz/VdlFgz1QKdvi6/yDYOMmaSQE3DYBRchdag
	hSrQeLU5urjumJ6MK+hyx1U0OWFBPDkY2ST9jdpC09y9oPVp/CzrkQVubALB9tyC
	FzSxHTMhQJeyY8hGWxfjLw6q/7IRlP5GNBTiirxhtLajoNXEZcCqWbjNlAMR0F0+
	hHTwmGKjcnkbwo+1epuG+ww22tswE1IK9rS5figAYQ==
X-ME-Sender: <xms:lWHYYhxxtgO6TCrYD01aAQOHyNQBLXC9l4HRDd7IAHG3sXlLtsOdEw>
    <xme:lWHYYhRtE1Qg82s4tG448i5_LoQEWaP1p26g5Ap0eKwV3HxjPK0Wqz1qg2JY4q0u6
    odk9b-oKkQ_jg>
X-ME-Received: <xmr:lWHYYrXBFR4C5Vj1TCQYt9aSo-P67X3gJ1WFCCiZw553oBmXPFSMhFmQ95__iE3biPFi-5aSDSVizkPEzHWkFiknem8FKoaV5g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudelvddgudegkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtdorredttdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedt
    tedvhfekudetvdelffeguedtkeethfethfffhfefteeghfeigeelvddttdektdenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:lWHYYjiECymJLdfUCohzJywyJL6W3TRQ16LHbhV-vnx37jb4Xzpmnw>
    <xmx:lWHYYjBglYI_lQ3WyRbrj8Ctl9zEPpAkKsvgWQji4giPBjPmvJQpFA>
    <xmx:lWHYYsKwK5swL5PvvZNeNojoS20vEGZMwF9Kne5xChAlRY7CYqns7w>
    <xmx:lmHYYl1VUsqfbeSBI368o8tdisX-DpEJ9q4wOO9B8LPwUNFWxvURfQ>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 20 Jul 2022 22:12:01 +0200
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
Message-ID: <YthhkXbFpFRSHHHR@mail-itl>
References: <cover.991b72d99d9e5bd4c2c76791ceb49f1056ce5d1c.1657121519.git-series.marmarek@invisiblethingslab.com>
 <80051b9dc5c99532e18a10a941c3523945d77698.1657121519.git-series.marmarek@invisiblethingslab.com>
 <dc195aca-79e1-7faa-d29a-ea0626e257ad@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gmazUWtArVsxmRsl"
Content-Disposition: inline
In-Reply-To: <dc195aca-79e1-7faa-d29a-ea0626e257ad@suse.com>


--gmazUWtArVsxmRsl
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 Jul 2022 22:12:01 +0200
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

On Thu, Jul 14, 2022 at 01:58:25PM +0200, Jan Beulich wrote:
> On 06.07.2022 17:32, Marek Marczykowski-G=C3=B3recki wrote:
> > +static int xue_init_dbc(struct xue *xue)
> > +{
> > +    uint64_t erdp =3D 0;
> > +    uint64_t out =3D 0;
> > +    uint64_t in =3D 0;
> > +    uint64_t mbs =3D 0;
> > +    struct xue_dbc_reg *reg =3D xue_find_dbc(xue);
> > +
> > +    if ( !reg )
> > +        return 0;
> > +
> > +    xue->dbc_reg =3D reg;
> > +    xue_disable_dbc(xue);
> > +
> > +    xue_trb_ring_init(xue, &xue->dbc_ering, 0, XUE_DB_INVAL);
> > +    xue_trb_ring_init(xue, &xue->dbc_oring, 1, XUE_DB_OUT);
> > +    xue_trb_ring_init(xue, &xue->dbc_iring, 1, XUE_DB_IN);
> > +
> > +    erdp =3D virt_to_maddr(xue->dbc_ering.trb);
> > +    if ( !erdp )
> > +        return 0;
> > +
> > +    memset(xue->dbc_erst, 0, sizeof(*xue->dbc_erst));
> > +    xue->dbc_erst->base =3D erdp;
> > +    xue->dbc_erst->size =3D XUE_TRB_RING_CAP;
> > +
> > +    mbs =3D (reg->ctrl & 0xFF0000) >> 16;
> > +    out =3D virt_to_maddr(xue->dbc_oring.trb);
> > +    in =3D virt_to_maddr(xue->dbc_iring.trb);
> > +
> > +    memset(xue->dbc_ctx, 0, sizeof(*xue->dbc_ctx));
> > +    xue_init_strings(xue, xue->dbc_ctx->info);
> > +    xue_init_ep(xue->dbc_ctx->ep_out, mbs, xue_ep_bulk_out, out);
> > +    xue_init_ep(xue->dbc_ctx->ep_in, mbs, xue_ep_bulk_in, in);
> > +
> > +    reg->erstsz =3D 1;
> > +    reg->erstba =3D virt_to_maddr(xue->dbc_erst);
> > +    reg->erdp =3D erdp;
> > +    reg->cp =3D virt_to_maddr(xue->dbc_ctx);
>=20
> The only place this field is read looks to be xue_dump().

No, reg is MMIO, all those assignments are actually configuring the
device.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--gmazUWtArVsxmRsl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmLYYZIACgkQ24/THMrX
1ywEvgf+PCnLYL2uWM9r9NN4JiRqxuxl6rzWgvOJTiJg7KKOjDypZtAqElL3otjA
00bxs1eRdzPupmUJ0K26dZTNtlMOOMRU4SSuWWK/VOUnwMPFqIQl0G9ZprGI0pO7
wCz6sae1atCT9YP5ijlSUw9ss4+SURYwxu2NtoAwMHvWSLLVLi7zVCIfAI+x6HtO
lFcIBtK0dZG2Nx7oEUubJNmn1C8nq4dtlQv++zYllhEqP7R6B7kATR7rDCSjQwGd
ziPWSn8flfuxfGnx7etxE85EbNzwW9Qs1Szw7XE3U0rpJt5zYYxzrhwPDXi0FbNQ
0P96sEM/lrMo61E7jDPXpwiFm+8aRw==
=2BSg
-----END PGP SIGNATURE-----

--gmazUWtArVsxmRsl--

