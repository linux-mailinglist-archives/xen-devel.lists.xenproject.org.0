Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5065650C2
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 11:28:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.360054.589423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8IMM-0008Ue-HC; Mon, 04 Jul 2022 09:27:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 360054.589423; Mon, 04 Jul 2022 09:27:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8IMM-0008Se-EQ; Mon, 04 Jul 2022 09:27:14 +0000
Received: by outflank-mailman (input) for mailman id 360054;
 Mon, 04 Jul 2022 09:27:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mwje=XJ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1o8IMK-0008SY-Il
 for xen-devel@lists.xenproject.org; Mon, 04 Jul 2022 09:27:12 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79cf3bfc-fb7b-11ec-bd2d-47488cf2e6aa;
 Mon, 04 Jul 2022 11:27:10 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 318B05C00DA;
 Mon,  4 Jul 2022 05:27:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 04 Jul 2022 05:27:08 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 Jul 2022 05:27:06 -0400 (EDT)
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
X-Inumbo-ID: 79cf3bfc-fb7b-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1656926828; x=
	1657013228; bh=8jziQ/tSPba6u+MoT33u1zyVPomidh2U8mKhlRas2Zc=; b=L
	bNBY18Q/SaO6FJXjwOFC5xgj7H407Mt6ccwAHvyMSpAgyPvvzkl87bd4KncNLp7V
	MCpJ/IAMNCPYO3vXJFC+NPqonDS6jzgfLi2AqO6Td6B9nx0YPAEag/85wyGd7Xqd
	XlYJR5KndLYKQGiaoZUFxD0yhiFVBCEHGVntlvWSCx0oRxUKvEmj1q/9KhbxxlnR
	GRGzlXu+x4gll7Nk7LVIycLLRjlm5csOmxzO8TwXLvoYMR5pkmkD/XyroJx2m9TG
	PxmSAHH9OiSa1JScAyGedWhH3zHPFfERk3c7JDdknea7BIueC+9IPGfDAycElnPE
	7eDNDy1QM4P1YhsaBBEqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1656926828; x=1657013228; bh=8jziQ/tSPba6u+MoT33u1zyVPomi
	dh2U8mKhlRas2Zc=; b=Zd4pOkm6LKPrn5gvlR/uJg/SutDxmRQkB/fQEIILh+Iz
	rviPeplCtPC6QR2nSshOJVJAVxBPG7NvhCA6QGJD490nRDEICfb4WUAr/nz3wdcP
	B/XLXYOVQPST72oRCroeHSjWzUeO2nMF1uJiLQzplZVlSf+nUmUlTFVGXCpTAXAo
	jNzQ+mT3y7nucEAnmZ3nV90xCLtfwoA6GS1Ajo19mZyA4msByswB9UiSYk+5rlaa
	HP84yX7pXhDxntbwYPJuf+++lN2d4MXxqZ3j8l4NJDL3xuuhgG0/Hdm3esKyuHuL
	/V2iNKvksPE1xAAqw6h3yaq9UGFea0P57XmDd93Ubg==
X-ME-Sender: <xms:a7LCYgQAbk-Ckn1C-jpRvMUX21-XfP2lZyrpspjif-6LcgG1laq69A>
    <xme:a7LCYty1f2nq0z-k_CALWV8sOi9G6DlX6J924Erq42hlGopluZqmSShjRgYYARr8j
    5pLLGT98Snf_A>
X-ME-Received: <xmr:a7LCYt1u9A7smuw2OhjQp1XiZsR2i8NsbyCeuCaGxULFLQkUpi4ug5729l_3iQuTxnwmh_Cb2-5SI8WDTWiLN8jee6kteHCGjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehledgudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:a7LCYkAuTRgCOME5AUFBzAYPAYTgg6BaS7rlrMfoBb9y2f6J4WNjig>
    <xmx:a7LCYpj1rQ8_VuhR8JmD-z1KOFr8XXZAGyfHyw3krAw1KnQ5xsWLtQ>
    <xmx:a7LCYgq-vrBIXSnVIUU6-7B1oQ0VmZX5xVN-8OdnZKoVmiSSPJJsvw>
    <xmx:bLLCYhhv8qIjusRrNjUogHP1sh6wDYZR5NBg362lUVdLMGMZzUyGnQ>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 4 Jul 2022 11:27:03 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Connor Davis <davisc@ainfosec.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Connor Davis <connojdavis@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 01/10] drivers/char: Add support for Xue USB3 debugger
Message-ID: <YsKyZ22TVnc+r8ag@mail-itl>
References: <cover.5d286dc6304969ed7155051e900236947c1b14dc.1654612169.git-series.marmarek@invisiblethingslab.com>
 <87c73737fe8ec6d9fe31c844b72b6c979b90c25d.1654612169.git-series.marmarek@invisiblethingslab.com>
 <9c7c11f5-be1e-f0ef-0659-48026675ec1a@suse.com>
 <YrM5g3dLRJHTIVYt@mail-itl>
 <8322303f-021a-b520-d2ad-cf8310573df5@suse.com>
 <YsGIzXKPr+j05TC4@mail-itl>
 <c4ecb784-e6d9-6d77-67ec-1dec78dbde0d@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TC37I/yvhfaH08r1"
Content-Disposition: inline
In-Reply-To: <c4ecb784-e6d9-6d77-67ec-1dec78dbde0d@suse.com>


--TC37I/yvhfaH08r1
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 4 Jul 2022 11:27:03 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Connor Davis <davisc@ainfosec.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Connor Davis <connojdavis@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 01/10] drivers/char: Add support for Xue USB3 debugger

On Mon, Jul 04, 2022 at 08:05:06AM +0200, Jan Beulich wrote:
> On 03.07.2022 14:17, Marek Marczykowski-G=C3=B3recki wrote:
> > On Thu, Jun 23, 2022 at 11:29:31AM +0200, Jan Beulich wrote:
> >> On 22.06.2022 17:47, Marek Marczykowski-G=C3=B3recki wrote:
> >>> On Wed, Jun 15, 2022 at 04:25:54PM +0200, Jan Beulich wrote:
> >>>> On 07.06.2022 16:30, Marek Marczykowski-G=C3=B3recki wrote:
> >>>>> +    memset(xue, 0, sizeof(*xue));
> >>>>> +
> >>>>> +    xue->dbc_ctx =3D &ctx;
> >>>>> +    xue->dbc_erst =3D &erst;
> >>>>> +    xue->dbc_ering.trb =3D evt_trb;
> >>>>> +    xue->dbc_oring.trb =3D out_trb;
> >>>>> +    xue->dbc_iring.trb =3D in_trb;
> >>>>> +    xue->dbc_owork.buf =3D wrk_buf;
> >>>>> +    xue->dbc_str =3D str_buf;
> >>>>
> >>>> Especially the page-sized entities want allocating dynamically here,=
 as
> >>>> they won't be needed without the command line option requesting the =
use
> >>>> of this driver.
> >>>
> >>> Are you okay with changing this only in patch 9, where I restructure =
those
> >>> buffers anyway?
> >>
> >> I'm afraid I'll need to make it to patch 9 to answer this question. If
> >> suitable dealt with later, I don't see a fundamental problem, as long
> >> as it's clear then that I will request that this patch be committed in
> >> a batch with that later one, not in isolation.
> >=20
> > This turns out to be rather problematic. xue_uart_init() is called
> > really early (as it should, to get console as early as possible). It's
> > before even boot allocator is functioning, so I can't use alloc_boot_pa=
ges().
> > Are there any other options for memory allocations at this point?
>=20
> No "neat" ones. Stealing directly from E820 could be an option, but
> would of course be heavily x86-centric.
>=20
> > We are talking about 58 pages. It isn't much, but isn't exactly nothing
> > either. Maybe there is way to keep the memory allocated statically as it
> > is now, but return it to the allocator is xue is _not_ enabled?
>=20
> Well, yes, treating them like .init.data would seem to be the least bad
> alternative then, at least for now. Down the road we may want to generali=
ze
> what's needed here, as there are other full-page or larger memory areas
> which are used only under certain conditions. We may e.g. want to introdu=
ce
> an approach similar to Linux'es .brk section (recently renamed to .brk..b=
ss
> iirc). If a non-generalized approach ends up looking too ugly, I'd be okay
> with keeping things as they're now, just with a respective justification
> added to the patch description.

Looking at it, I see another issue - Xen uses superpages, so I'd either
need to:
 - reserve the whole superpage to be able to release it later (waste 6
   pages if xue is used), or
 - shatter superpage when releasing unused xue buffers

First one is probably less bad. But maybe, instead of doing all this,
add xue to the menuconfig (make the prompt visible) with appropriate
note about wasting 58 pages when built-in but not enabled. What do you
think?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--TC37I/yvhfaH08r1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmLCsmgACgkQ24/THMrX
1ywO9wf/XwqCQZHJnMrAxb/ZZXYr9wN7eCTgwKcoEUGXs0+kFRaSL28aNfVO+B2D
uhcTxKprnB5phKA6KE8QP1QgCb6uQ0u5VHyH7AGHsm2Yvu14FYlc6luHOD8sc+l/
5ax1sqerkiymsH8U5nuFsxMlV31voLczgYRkw+c9LdycHn3xC5t8y3mxfp9o4DDH
mi+gVab2v6IUxCFIikggmUhxNLUuVrGdcXieyXF6Z1nxFS4ztM6h2Y75oAL4di89
cCY7wIqRKVWbWVitcKfYmD+FqsU9dhHUNz9C5633SZSc5etIOcoLo1VGujWE5Ji4
iuG680+cEEWTgLu/JNAGdNPpJQiCGw==
=bnny
-----END PGP SIGNATURE-----

--TC37I/yvhfaH08r1--

