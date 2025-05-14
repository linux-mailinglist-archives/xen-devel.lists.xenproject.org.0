Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF3DAB6937
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 12:52:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984184.1370372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF9in-0002vi-1x; Wed, 14 May 2025 10:52:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984184.1370372; Wed, 14 May 2025 10:52:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF9im-0002tm-VO; Wed, 14 May 2025 10:52:20 +0000
Received: by outflank-mailman (input) for mailman id 984184;
 Wed, 14 May 2025 10:52:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VfaI=X6=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uF9il-0002PN-Dx
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 10:52:19 +0000
Received: from fhigh-b3-smtp.messagingengine.com
 (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 802d1885-30b1-11f0-9eb6-5ba50f476ded;
 Wed, 14 May 2025 12:52:17 +0200 (CEST)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 12D3F2540125;
 Wed, 14 May 2025 06:52:16 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Wed, 14 May 2025 06:52:16 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 May 2025 06:52:14 -0400 (EDT)
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
X-Inumbo-ID: 802d1885-30b1-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1747219935;
	 x=1747306335; bh=233wQiFQhCEA3GqilV0zOcKakDfKEZGWRfw9wwU7uVw=; b=
	jth0kBYxnAOQs6CFZFOZXX3P5NuB8m2T7EjLFWck79vrMnt1MzO3YXGORVyHF3kd
	IlHMVMeSh91lEgdO9p+3iCNE3gjQ68ql/puJmUTyKaUWTwYl3p+YE0Gn9CB3JVI5
	dJAtRIN2/AnQnfNbpXsXapvUshyd7mtv4RyShszSk5grTg1EbSPDz4mHdWkTVtq+
	OJxy9+ppXjTK39TXFsPIhOD1AZzQzZWNjXn1cd4FZJtJbNTEgjFTVoePlYzhmtH0
	1/yvp+yCha0lMo6crwWKrRdjE4cN1G9XijLiwvdm1GJTFMcz7JKkP652WOnjdme/
	8aWyjyWBOYG4Hv6IKovD1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1747219935; x=1747306335; bh=233wQiFQhCEA3GqilV0zOcKakDfKEZGWRfw
	9wwU7uVw=; b=sMOKELqf/JWWLXJZYVznX3lE6FNQnZ53pULHPRRlq+FiIIXW4vA
	dag0+3rmewrt6zAvkYeAQGZCxqWfiCxCFV0SNKiqNcG3PB7539XCE3+pCukMGE9N
	DOKVPH0iVNsgHC8kedELMZK8lQCyrSzctQzTGUO0gU7j/fhgSKn2Z7V3A8dRNl17
	QbMdmsO7wlF4oQBIuuCgvQWLeSyKoQ4gwtPambaT0WljfOmpJHeKS/36JrFl+8Ym
	7un20ohJMqUqGNh79/cNLavLZFGrQ4rQJYuh2Qrg+ix6RQRSn8eQ4tbwA/+k1/gB
	sJzUAhcwmyZr5VVsWhe8xOfLLb+h9KtLB6Q==
X-ME-Sender: <xms:33UkaG6Pu_PxZA8yw_PK3wCJPJ0Co5XvsWPHw2-waQoLcki9CHej1Q>
    <xme:33UkaP4BFy-UNng_LOAcYROQZhYm453KqWA-H0HSLipSka88yDpujdIudfZMHsL64
    c91G1y2XXvF6Q>
X-ME-Received: <xmr:33UkaFdlHspKsGE43KkQkQyyEZL7uK73Nvi7oI7U9Om7mi5K1hA0T9H_gjE4Gr6_124gjnH8rn5X43qU0bAenfcFt5rheKPjhvY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdeijeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiuceomhgrrhhmrghrvg
    hksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghr
    nhepgfekuddtffettefhieeuheffkeeuffelvdffuddtteetledtveekfeekleehjefgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhm
    rghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpth
    htohepfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgsvghulhhitghhsehs
    uhhsvgdrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnph
    hrohhjvggtthdrohhrghdprhgtphhtthhopeguphhsmhhithhhsegrphgvrhhtuhhsshho
    lhhuthhiohhnshdrtghomh
X-ME-Proxy: <xmx:33UkaDK8FIHijWjK0yeXppj53G3vGoLoJnZwM9Ruf9Js7_DtwMawtA>
    <xmx:33UkaKLRRK18vsDE1r5Lmo_4EKxrawZIrd7I3IMc-daHpRfhpb8Fkw>
    <xmx:33UkaExq49i7tPVjznT_R0NM_LM3W75uoLDm0fJrLNfi33ffV_fJ8g>
    <xmx:33UkaOIbAgOUfYd0ummBhUgu5-_wsCWX6pq_F28WDU8YFWjoVQuljw>
    <xmx:33UkaKEeOj-7Hmo4AS8RrACyrqliGPTJsj2CuAQTa1_0yNwWy_-1Sq2F>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 14 May 2025 12:52:12 +0200
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Daniel Smith <dpsmith@apertussolutions.com>
Subject: Re: [PATCH] x86/EFI: purge a stray semicolon
Message-ID: <aCR13PThb0yJNyKL@mail-itl>
References: <b1aca3d5-958f-4389-82e2-375ddfb04100@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="r+fbsk94B5i2H0P/"
Content-Disposition: inline
In-Reply-To: <b1aca3d5-958f-4389-82e2-375ddfb04100@suse.com>


--r+fbsk94B5i2H0P/
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 May 2025 12:52:12 +0200
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Daniel Smith <dpsmith@apertussolutions.com>
Subject: Re: [PATCH] x86/EFI: purge a stray semicolon

On Wed, May 14, 2025 at 12:21:57PM +0200, Jan Beulich wrote:
> Aiui in principle this constitutes a Misra C:2012 rule 2.2 violation.
> Just that we didn't adopt this rule (yet?).
>=20
> Fixes: afcb4a06c740 ("x86/thunk: Build Xen with Return Thunks")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>

> ---
> Noticed while backporting to 4.14, where patch context changes.
>=20
> --- a/xen/arch/x86/efi/check.c
> +++ b/xen/arch/x86/efi/check.c
> @@ -4,7 +4,7 @@ int __attribute__((__ms_abi__)) test(int
>  }
> =20
>  /* In case -mfunction-return is in use. */
> -void __x86_return_thunk(void) {};
> +void __x86_return_thunk(void) {}
> =20
>  /*
>   * Populate an array with "addresses" of relocatable and absolute values.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--r+fbsk94B5i2H0P/
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmgkddwACgkQ24/THMrX
1yzbowgAjBWlLtCROwmyPxTStOKRmjYFh4xlFxmdgGOJcgfSCYhENqTYnANbOLfy
iSF8Pke1qvUMke61Q6DjXa/ntIgpTVyoTVlLOUmxfmVTfKVxrpVoV0rOEvFXTnd5
VgL3w2ffseG6Fsvw13Y4T/UFmwW7Qmaobcuq9G/X0itqywtL88h0jcadbDr2sevw
oZGym7tO9DaNBj87qqb/RXgdgj31FV/RKbUeuOQBrbHUu00l0ppiJJ5kKVWwJo6W
xws5z5RknBGDQzFrxbQJpInszLZQDd9i2wGHkBDHksxb0iMSkCb1dx/FbnWrVwXS
jtnVGLUl15GeAmCOGZcPZMVDMO+/DQ==
=pW3W
-----END PGP SIGNATURE-----

--r+fbsk94B5i2H0P/--

