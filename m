Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4645B6FDE
	for <lists+xen-devel@lfdr.de>; Tue, 13 Sep 2022 16:23:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406440.648834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oY6o6-0005tX-H3; Tue, 13 Sep 2022 14:22:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406440.648834; Tue, 13 Sep 2022 14:22:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oY6o6-0005qm-Dp; Tue, 13 Sep 2022 14:22:34 +0000
Received: by outflank-mailman (input) for mailman id 406440;
 Tue, 13 Sep 2022 14:22:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iobZ=ZQ=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1oY6o4-0005qg-Mv
 for xen-devel@lists.xenproject.org; Tue, 13 Sep 2022 14:22:32 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f9ab6cd-336f-11ed-9761-273f2230c3a0;
 Tue, 13 Sep 2022 16:22:30 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 046D65C0176;
 Tue, 13 Sep 2022 10:22:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 13 Sep 2022 10:22:29 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Sep 2022 10:22:28 -0400 (EDT)
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
X-Inumbo-ID: 7f9ab6cd-336f-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1663078948; x=
	1663165348; bh=V790zDsuQ68CsfWzc0YeGKmaeU08gUUaFFII1gpZAXQ=; b=L
	gynG4N+xLVl7wraFDA+Za6Co1M6BYONYUJ6RHLv+eWoi77JKVhGVS+TKg2wF37+k
	b5kTh7GoCbXiIoAShe4Iy/McI9jsQ4nXKGGEnq8KEUJE5qWlTQVFHji4CI/+SHsM
	WZ0hO7lQUD6E5xv4fgu/HHDm4j5iMTi1Buvzw8M+vVHgldozvD9JOzniEw8mF0+D
	qT54JfHpjZ+sawQs2pKhh92U3K0od1qHeUA8nXA2s2MLQSqVY/oBqB9mUAfqSFEd
	J06gq19wZBqOl5mF231KYxunyaizzm/x1VzOKOUHQhRpDVMCMzZ9u5E7nlZ7RwPm
	1Z0lc2n0Dkvp9oJkQJa6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663078948; x=1663165348; bh=V790zDsuQ68CsfWzc0YeGKmaeU08
	gUUaFFII1gpZAXQ=; b=S5esmuvhCCtGQrN9MtdJdmAShAgcGue+mQ3tzOoN/W2M
	Y4+yPKrCSwgrARuUAURrgB6/VG+ZDijlT/71PpymyVR4gbmR9u++Esj6At49NjRm
	fTsh781fovVMgYdQgthgY3LyGBfSxDfrBqirr/rjcuAr+6PaoaIWOpFXO9rV7A0j
	gzRo0Cgp6+1JSXyyjYjnE98l8lm2Bp4OsXqFgryMszVaFw54cn91SRBy9Aaa0fGW
	sjQV7/PmSFER8V77UH07b6sGe1eR3a04wKh7qPrGn/+MQcdc9EfVHI/oW2OBAPSw
	J4GJ6HQb2XwZlvHAtvAOOi4lFiHRIg78Qr0W6dtt1Q==
X-ME-Sender: <xms:JJIgY3J4PF5Moeq19hNw13_TCIJbh7VtsXduMJ-uaNaWubisndKICg>
    <xme:JJIgY7LQA6HwuZswwkPyK1swkK43G8fe8s2EagRebaRjqE_MXI3sXyJ5mxR_cKXa-
    FePOWT-pD-HYto>
X-ME-Received: <xmr:JJIgY_sfmLM6TSWjwAILILPSkaAtdLvViMktMQy4Wlk0Qj63xxMuaX8v1JZX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedugedgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepleefjeeukeehkeegiedtgeekkeel
    tedvhfduudefgfffheffheeuvedvieelfefhnecuffhomhgrihhnpehkvghrnhgvlhdroh
    hrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegu
    vghmihesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:JJIgYwaMyI5dxWEwb0g4ilTAtjp8bRur0Kr4w4JlZgt1if3VpVlAYg>
    <xmx:JJIgY-bG_H6py4Nl-nKsgKAAXmX0hVo8gIDTqCoBX-CIUq_0uygE9Q>
    <xmx:JJIgY0DwQX0dD-rZE64XzIgDAKaLmLF4T9iksFAqvoo2LgLicuU3eA>
    <xmx:JJIgY9mKJ7RzL4QBswu4qr6_omB1Hq0cbqid-XLvSbaZXbEJNZ7QZw>
Feedback-ID: iac594737:Fastmail
Date: Tue, 13 Sep 2022 10:22:03 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Simon Gaiser <simon@invisiblethingslab.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Re: Setting constant-time mode CPU flag
Message-ID: <YyCSIxyH4hDmTXIh@itl-email>
References: <YxFk2GaIQVCAFsyi@itl-email>
 <1d7b9e30-975b-b49f-fe09-e2aeda9e2af6@suse.com>
 <1b85702f-7efd-b13f-40d4-615750e20f4c@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C5NFp40jmoLS1AkG"
Content-Disposition: inline
In-Reply-To: <1b85702f-7efd-b13f-40d4-615750e20f4c@citrix.com>


--C5NFp40jmoLS1AkG
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Sep 2022 10:22:03 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Simon Gaiser <simon@invisiblethingslab.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Re: Setting constant-time mode CPU flag

On Tue, Sep 06, 2022 at 10:01:00AM +0000, Andrew Cooper wrote:
> On 06/09/2022 10:52, Jan Beulich wrote:
> > On 02.09.2022 04:05, Demi Marie Obenour wrote:
> >> On Intel chips (Ice Lake and later) and ARM64, a bit needs to be set in
> >> a CPU register to enforce constant-time execution.  Linux plans to set
> >> this bit by default; Xen should do the same.  See
> >> https://lore.kernel.org/lkml/YwgCrqutxmX0W72r@gmail.com/T/ for details.
> >> I recommend setting the bit unconditionally and ignoring guest attempts
> >> to change it.
> > I don't think we ought to set it by default; I can see reasons why kern=
els
> > may want to set it by default (providing a way to turn it off). In Xen
> > what I think we need is exposure of the bit to be guest-controllable.
>=20
> We absolutely should not have it set by default.=C2=A0 It's a substantial
> overhead for something that is only applicable to code which otherwise
> crafted to be constant-time.

Either Xen needs to set the bit by default, or guests need to both know
the bit needs to be set and be able set it.  Otherwise code that *is*
intended to be constant-time has no way to protect itself.

> As for why Xen doesn't enumerate/virtualise it, that's because
> virtualising MSR_ARCH_CAPS for guests is still not working yet, so the
> feature can't be enumerated yet even if we did support context switching =
it.

Intel and ARM64 guarantee that CPUs that do not enumerate this flag
behave as if it is set unconditionally.  Therefore, Xen=E2=80=99s current
behavior on Intel is incorrect and insecure.  On ARM64, it appears that
the flag is currently a noop, but as this might change in the future,
Xen should fix its behavior there too.

Without support for virtualising MSR_ARCH_CAPS, the only secure behavior
for Xen on Intel is to unconditionally set the DIT bit.  On ARM8.4+, the
bit currently appears to be a no-op, but as a precautionary measure, Xen
should either set or virtualise it.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--C5NFp40jmoLS1AkG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmMgkiIACgkQsoi1X/+c
IsHlPhAA17jg04X2KmoRFs+STLRCcf2pTVc85lFxQz04GiXtUJ5iByw5IMx4Jd5N
WAasL5PkJzeXnGHR8hIZhDcllUNHGzDrZDAQpAN0f7Ww1hygB7wI4YQz+ZN0w9Gs
zF1R5/WcBRQcktyPt5biC47S31NZjKkYKynTMMnjzQqildCyjZurkwwhpc6D+w0T
vqZNk+C3S9d85uxFxZT6HpP2KuVA1NRGE54rtGhGh2+1avhGhomJtgZIPJmXaoAg
2V2cPzEVfzVTbkJZzMNjQekSgGb+939dd5g1WQyNOrtaaMYHmP/b7lhXM3RUi11d
o104sNuCwas5AHdJAbCvi4o4O9I+/mI0LIY3OoMYpaV8aWcOl6jX28SbHfKc6RBO
jN3fSdFxGBU6ZAR/MzhGvjLXbVv7suOCf8bRLxJtVFjZAEeowv9QeXQGoi+iyrFP
UckqMMealXVMqZGozydcKWCYLlBMTjZmgz6+UbcXybjA1OTUYqm7ppiMARGnrT1S
vMnvboQTzwMwlY5FBd9S00ssHK1sZLYFnei4hV7wdenh/uIuM9JrAieeX9HuHayj
3KnZjbyUwmmeNsqd0oSTFp8R/BfvJ9xXa0DjwsIk7EuoghGGB0CoiTqK3wLt15qe
RF4eFBDtta269NfUE7sJBzOfqKWBHyGPnp5uvXa4FyjeOBtwDjQ=
=QBM/
-----END PGP SIGNATURE-----

--C5NFp40jmoLS1AkG--

