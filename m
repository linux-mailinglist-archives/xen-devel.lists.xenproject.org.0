Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9CA67CA97
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 13:09:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485012.751931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL14L-0001hH-KZ; Thu, 26 Jan 2023 12:09:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485012.751931; Thu, 26 Jan 2023 12:09:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL14L-0001dt-Hl; Thu, 26 Jan 2023 12:09:29 +0000
Received: by outflank-mailman (input) for mailman id 485012;
 Thu, 26 Jan 2023 12:09:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0+3p=5X=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pL14J-0001df-Rd
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 12:09:28 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 417314ed-9d72-11ed-b8d1-410ff93cb8f0;
 Thu, 26 Jan 2023 13:09:18 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id AE6425C00E9;
 Thu, 26 Jan 2023 07:09:22 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 26 Jan 2023 07:09:22 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Jan 2023 07:09:21 -0500 (EST)
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
X-Inumbo-ID: 417314ed-9d72-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1674734962; x=
	1674821362; bh=MND+nG8pu/5o9eYIVl8ltWETmqVJtI/WQW+hfRrRrds=; b=m
	ynJNHI/FA+1/zJLzLQ14gzn5u/HAUkwxpH6vJt0At08its2oxLUq/ROxHpwHfFz/
	1U5Wuch0Iz5mLoP76fvqRGT8m2qmWj37mnIhLVIuCmVnYRD7eOKpSBFhRWHudfAv
	2GdkL0prYD7yuxEL2gV3IjeGhArUjaN5vlSHrdsc0a/qzB7xG7XGa91Vro//B/Ab
	ZmoMs+z7RP0ApIrrEaVKJlAYxN6QxVR0+QmqrOlXZGXphN7Iec3cVNwKm/PaS0iC
	lWmDniNSHj/sPay0PufokSTe7M0nLu1Vl4UXnnwXR52Q+IDevypLp22/b7A/KRpD
	+5QE8U42JWvCX/vLQXapw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1674734962; x=1674821362; bh=MND+nG8pu/5o9eYIVl8ltWETmqVJ
	tI/WQW+hfRrRrds=; b=rqDjc7CM0cvAd1bAmhbYRsyOJ6WRq8eG0p0oezojlekb
	zBhQQmPiP6SMt7dr73VDsiFdKYk3R0fbsvBHYu80AMYTAHWY3K1lDu9cC1FmM0Qj
	PpgW/HeyIz+anAjQ2N9ahrswAkOyYk/KR63zpqkqpb2YYgiFZgwTaWMzitRYlWFj
	GvNIAclljoDFa4bXEEs8R++cxXhOdfG8+M+UdYelIaDK8+nDo8ann1TJANf5bTOj
	xJQr9W2f9dHuOsel/AODn4KODt0YIvZxWno00khnDIfkwwVOLGazibUD6atWTnV0
	U5ksPw5MCGQqqQI/ayb4KVJ4QQvOinGld4YJAyLuTA==
X-ME-Sender: <xms:cm3SY5R2hoTzzltHGsW_4ToZeopEE9UPWIJSJwK6KIvTxmEyxvySTA>
    <xme:cm3SYyyRLyxY4EaKmQN1w2tX1YNC7nrrJLMDCD62ORK0nb22looOitckwtskj_FSp
    YWIoXey5MuXSQ>
X-ME-Received: <xmr:cm3SY-2vnoCcM8k1vC8iqp5WIWPZW1IS-E9ZTgVyF6NSqTNCvTfc4VDOdRhoTA42ZJQBTlB1uJf6v4gGoqb6ChJcoV2OKT8NGGw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvgedgfeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhephfet
    udegleeuvdekudfghedufeekuefgffeukeejvdfgkeegtdehhfegueejteelnecuffhomh
    grihhnpehphihthhhonhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhm
X-ME-Proxy: <xmx:cm3SYxBC_07Dp-3AD_oik2M0jEuwxJHs0mQ-nujdBFBXwPQsa9khQQ>
    <xmx:cm3SYyhFDfuboj-IBirvVJnw8cP2bYq69e-eykdEUCYlIWQtAPWMTQ>
    <xmx:cm3SY1r-jsIF17EHfr9h7YvEKIsSR2SmC9__Y6pFpVjt3CphXs-6BQ>
    <xmx:cm3SY2Z_llDIaSQD1VB8Rz04jpcgEuacwG34vITnkeF5-9GBRULOvg>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 26 Jan 2023 13:09:18 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] tools/python: change 's#' size type for Python >= 3.10
Message-ID: <Y9Jtbr596V0F5cLm@mail-itl>
References: <20230126051310.4149074-1-marmarek@invisiblethingslab.com>
 <5804fff0-b26e-bcc5-fc76-7e2be09bcd71@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="c65UIZuL6tzF9P1v"
Content-Disposition: inline
In-Reply-To: <5804fff0-b26e-bcc5-fc76-7e2be09bcd71@suse.com>


--c65UIZuL6tzF9P1v
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Jan 2023 13:09:18 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] tools/python: change 's#' size type for Python >= 3.10

On Thu, Jan 26, 2023 at 10:14:54AM +0100, Jan Beulich wrote:
> On 26.01.2023 06:13, Marek Marczykowski-G=C3=B3recki wrote:
> > @@ -1774,7 +1775,7 @@ static PyObject *pyflask_load(PyObject *self, PyO=
bject *args, PyObject *kwds)
> >  {
> >      xc_interface *xc_handle;
> >      char *policy;
> > -    uint32_t len;
> > +    Py_ssize_t len;
>=20
> I find this suspicious - by the name, this is a signed type when an
> unsigned one was used here before (and properly, imo).

It is suspicious indeed, but correct according to the documentation:
https://docs.python.org/3/c-api/arg.html#strings-and-buffers

> Irrespective of the remark of course I'll leave acking (or not) of this
> to people knowing Python better than I do.
>=20
> Jan

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--c65UIZuL6tzF9P1v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmPSbW8ACgkQ24/THMrX
1yyP/Af8ClrtiKVKa9h/6+XbaBPSszAMSDXCnpeEhRAXRyiICnPjwUlPWBnDveMg
XOjeA7ewhtvpg+HvI92lYU1oCnYyI+7q+V24u01kFFlPQSlHkD3BFu1ReW+q2MwP
oN1mM81wJ0LB2XMTyzyi/xolW1tIqxaCPaVRjyHKqY1SqkEs0nwsebjxDrgsn1OL
kQpKmV4JR/CsCljxuU9U771l8sB6Xn9LwycdyJG9Js97sSetqshI9SnTNgMFmIkS
qn/I/vlMIDbCU/FqymDHaqsQk41SlnTbHbA5KDkWZsUjXAqg5sxWGNL70nX0P2cM
4E9MHL0T6T3sH1TO1n/DHGelcoMqXw==
=Sctc
-----END PGP SIGNATURE-----

--c65UIZuL6tzF9P1v--

