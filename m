Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D4E57724E
	for <lists+xen-devel@lfdr.de>; Sun, 17 Jul 2022 01:33:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368902.600322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCrHP-0004OJ-Ts; Sat, 16 Jul 2022 23:32:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368902.600322; Sat, 16 Jul 2022 23:32:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCrHP-0004Kp-Qh; Sat, 16 Jul 2022 23:32:59 +0000
Received: by outflank-mailman (input) for mailman id 368902;
 Sat, 16 Jul 2022 23:32:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lLXC=XV=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oCrHO-0004Kd-13
 for xen-devel@lists.xenproject.org; Sat, 16 Jul 2022 23:32:58 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9cb9d13b-055f-11ed-924f-1f966e50362f;
 Sun, 17 Jul 2022 01:32:56 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id C42F35C006E;
 Sat, 16 Jul 2022 19:32:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sat, 16 Jul 2022 19:32:52 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 16 Jul 2022 19:32:51 -0400 (EDT)
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
X-Inumbo-ID: 9cb9d13b-055f-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1658014372; x=
	1658100772; bh=AyLBseLVw0cxvFBVtnYDeDLdNs68t9fYviQCJ7yrw/E=; b=o
	ECoCc5KDdwSFpi1YrmCMYg5KY6/eM4FML5Ri+453lYK+s21s4BUtG3PbGgtBQoIb
	VjaSItb31NDR3ZdPz/bcLYIwYPJ9PiBddeGbrtPzbAn0vxTuf2kJk4xVL6SMqpT6
	Gqunr6Nsga+67ZwE2JdW7DncBjM4UI2d++LJVCh4MwvrlG/H2ouzv4w6TjeYI9PF
	/Kb0KZlLcEigDHWX6A1TbqL1D/qz9WFQ6odiZpuHr31GCZRdn8zP5mUHYhMrM8Gp
	KLvnzgyVlMsNn27N5bqLESTlPoiCt5uTMfvQ02bjKVuIdMF5tIlolpwertVgcO/m
	U3N6CL1ucw5GM2e4R9qDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1658014372; x=1658100772; bh=AyLBseLVw0cxvFBVtnYDeDLdNs68
	t9fYviQCJ7yrw/E=; b=UqwPEzTsxlnSoNqtE8Uwhgq9b25c11FfE8R0HAdq1zAW
	7cetDHAamQpF9zeaXbnLACotU61l1/DI29/YE5g9JuAexxE03PEhhRGenVEpfnFT
	Aj2yrURXF5PbKP8UKEGOV+m1XqoTRQnmT4OUCrvcMWyqs/K3lkl0nRFgdFjbltqE
	wI/dv4ho0fXJQadYUnk5y7ivxmQYBddUgP6OJDrfeFmbB2bryorEKbO7CayC/udx
	4Tqnc3ifqT7dMA800lUMVuxBZQOgvv4yTG8WauH/B1zKOZ/hxaO1Ds+tZquuic/n
	AeIQKfjy74G6WFKXac17lkxanJUaFJ4oG6oNwv0lrA==
X-ME-Sender: <xms:pErTYtoY47VC05G14mQAGaef-SIAZIBw3O3d3o_LmBaFLCwH_aLRDA>
    <xme:pErTYvqM87Yzjhk72awNkkc9Qfsdp_E4u4iLuMCHjcp3vRur93ncnHOeBA6jZU1N-
    qKj7cNZJWM8QA>
X-ME-Received: <xmr:pErTYqP6M3ACPGxqcaVY9nUL95uh22i9fO-VY6YDEgaN3ChZb5uRZqQdwfERjWjCpHE_Xa-G4beonoqY3m7S0-U_VntEFa9PvA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekgedgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:pErTYo6VdybxnxWXuCyILdQpBTtzKffsXYGsMow95lkqAom9DIpaEA>
    <xmx:pErTYs4FdBAaLbIo0eEnv_EgrxmSsjCAoYkVUgBBimSmMB4x0y4aQQ>
    <xmx:pErTYggpbL2daS5_CXx79_Y1nJNGwuJqqMS4y6Ddy6Syi90GpdahyQ>
    <xmx:pErTYptoEKPfIsgwbl1d2yUtc9bxK2-SnXX97iswct1AJGSK61GS0w>
Feedback-ID: i1568416f:Fastmail
Date: Sun, 17 Jul 2022 01:32:48 +0200
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
Message-ID: <YtNKoDY2oB3S1v3p@mail-itl>
References: <cover.991b72d99d9e5bd4c2c76791ceb49f1056ce5d1c.1657121519.git-series.marmarek@invisiblethingslab.com>
 <80051b9dc5c99532e18a10a941c3523945d77698.1657121519.git-series.marmarek@invisiblethingslab.com>
 <dc195aca-79e1-7faa-d29a-ea0626e257ad@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bqKZOL95VrcQIk2G"
Content-Disposition: inline
In-Reply-To: <dc195aca-79e1-7faa-d29a-ea0626e257ad@suse.com>


--bqKZOL95VrcQIk2G
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 17 Jul 2022 01:32:48 +0200
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
>=20
> > +static struct xue_trb evt_trb[XUE_TRB_RING_CAP] __aligned(XUE_PAGE_SIZ=
E);
> > +static struct xue_trb out_trb[XUE_TRB_RING_CAP] __aligned(XUE_PAGE_SIZ=
E);
> > +static struct xue_trb in_trb[XUE_TRB_RING_CAP] __aligned(XUE_PAGE_SIZE=
);
> > +static struct xue_erst_segment erst __aligned(64);
> > +static struct xue_dbc_ctx ctx __aligned(64);
> > +static uint8_t wrk_buf[XUE_WORK_RING_CAP] __aligned(XUE_PAGE_SIZE);
> > +static char str_buf[XUE_PAGE_SIZE] __aligned(64);
>=20
> While I think I can see the point of the page-size alignment, can you
> please clarify the need for the three instances of 64-byte alignment?

(Guessing why original author of this code did it this way) At least
ERSTBA (5.5.2.3.2 section of the spec) is required to be 64-byte aligned
by the xHCI spec. Interestingly the DbC version of this register
(DCERSTBA, section 7.6.8.3.2) requires just 16-byte alignment.
ctx seems to require just 16-byte alignment too, and str_buf (in
practice) requires just 2-byte alignment.
I'll try to reduce those alignments and see if that still works...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--bqKZOL95VrcQIk2G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmLTSp8ACgkQ24/THMrX
1yx6GQf8CyX1b7X/rrlEXSSdK1+GTeAP/I1fgx4N3OAq6GceCvkBzys6tJKuA8CO
S6ee0BOkOwWCmwqcJOMD7ZudO9e0i04Y+5YqmCwvIVMv0jx8Yk4H/hH5OGPgHDjR
R9Cw/XRFS5ie0uMvV/K4nHJj0ErH+uWbExIFKdSp6wlX1EBADwpLanxdaYsR35em
AV2+77FL8MgXHETfR+QRn8BTNrrcD9puu5U4dt7O9CFhNzp2HuGM+B1MK8DAHKLC
sdzrhaqfb/v8XAtBrq3/PsXhPa2NJ2T9E4aWy1yLdUTG3ZJQHFKZKcU/2Ljl82I+
8Kp0xCvt40JiFbPmfbxE2gQiMrQZiA==
=Ou61
-----END PGP SIGNATURE-----

--bqKZOL95VrcQIk2G--

