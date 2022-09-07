Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8446A5B0800
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 17:08:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401935.643914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVweF-0000io-Qr; Wed, 07 Sep 2022 15:07:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401935.643914; Wed, 07 Sep 2022 15:07:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVweF-0000fn-Nq; Wed, 07 Sep 2022 15:07:27 +0000
Received: by outflank-mailman (input) for mailman id 401935;
 Wed, 07 Sep 2022 15:07:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9k5L=ZK=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oVweD-0000fg-Ic
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 15:07:26 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6236b32-2ebe-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 17:07:23 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id BA7295C0189;
 Wed,  7 Sep 2022 11:07:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 07 Sep 2022 11:07:21 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Sep 2022 11:07:20 -0400 (EDT)
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
X-Inumbo-ID: c6236b32-2ebe-11ed-a016-b9edf5238543
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1662563241; x=
	1662649641; bh=v/s3MB60xE1vO2w5soDZvjjv4HBjjIg9iW3ayRKeD50=; b=N
	MOhShj+LUR+CksqAGwsGesU1DEE6tox3BdlMb4cHnRRvi5X/Y1+ZzWzyY+Rp8PUO
	ND0jXtCQ9RpDxZV/FaeUGfBza4whYfkKYTRcZJPCMsViuWGuAQHMNrI6BYiZ1I36
	Zziv2p03Wp59mZTD0+TTqlcwt5QSdKJwb9MN5CogbRdreMAvYb1p3Frev1a6Faey
	0d6mcdAhI+xUhEfhE8WsQX9CfD8wa1fE8J9AC9EVDRobEw45XvZskvdP2Cx1wB29
	09CX2/SWs94zEtxv3f6WoA2zMQJlXuabL6Os0okZhWhFxgvLxMg0Ph3EFaq3dtqx
	whJUgM9YhJrDb8zY2+Jfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1662563241; x=1662649641; bh=v/s3MB60xE1vO2w5soDZvjjv4HBj
	jIg9iW3ayRKeD50=; b=ByLurM+xMGG7XZwlllM7/fUr33HwWEKwNQ6V8m13mXij
	qXVlLFuB4O+RYDNCkL3GAvUQMn2V5g43qKq1Tm+tGspfnd2sTtv17NMtfrUTuMG3
	HueRIFPscOQUbP/sRWjhMu4SfvV2Vtni2fyIt+y8bRREfAjJVnf7odsVc7Z8WJ1o
	JjadjWpj7y53Ry5z1iQGmV+wUZZ7fERj13brvyMCF/SGyKYyFESUevXSmsRvUfUy
	4+mVS9fyeGXlFfYtcpvljKKkuay/JUDnenbz+piliKOXE3tfH0gwOyPrh2yI0fmH
	1Kw2wZGE20RGLVs3qSsMi5IPBE8oMOO5jmnGEFivPw==
X-ME-Sender: <xms:qbMYY36OQblVIA_F4ZF9eMbnC5JFD0w9NVN6MLPdI7cciWjNdAJwMQ>
    <xme:qbMYY877DK9ZOqM9jwtIITRD9RZknaPbhmY7upY643AfzZ6UI_sxfioey512SHn0A
    4ycD0eb2-aqXQ>
X-ME-Received: <xmr:qbMYY-eiCvAKUbW5yZjLVnJtytX98g_QKskY06m8gLOPvX9yIgfRDPgF4PmuywK3Aeykw7WOin1Sx5Js6B_47JW4V-doL__TwtqD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedttddgkeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepfdhmrghr
    mhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmfdcuoehmrghrmh
    grrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrght
    thgvrhhnpeekkeevieevkefhieetveehueekhedufeelgfevudejkefhffehuddtjeegte
    ehtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
    rghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:qbMYY4JSuoayVnC7-Dw5_zsUmpw-xeFShNr8aIpFrwqvqYeFKp1Z8Q>
    <xmx:qbMYY7KxkcsPgBFA3cVXQFXKB-v4HxqXIlKGyodSbx_eSCbOXY54gA>
    <xmx:qbMYYxwxrT_IqIu2v0WLj__t7IbYVvOZGwbgcYRqfVRyI-iKHpuW7w>
    <xmx:qbMYYz0eiCkCi7O9Hujpa9BG80XT8zp9I7KwlBwxZSfIH6aWNi5_eQ>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 7 Sep 2022 17:07:11 +0200
From: "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: Juergen Gross <jgross@suse.com>, "jgross@suse.de" <jgross@suse.de>,
	Jan Beulich <jbeulich@suse.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [Xen-devel] Xen crash after S3 suspend - Xen 4.13 and newer
Message-ID: <Yxizn+XDIftyMlpR@mail-itl>
References: <d243c1b5-712d-a958-0b6c-b232eb4edc80@suse.com>
 <20200929151627.GE1482@mail-itl>
 <ea53b845-5edf-a61e-62ae-7ababc30b3e0@suse.com>
 <20210131021526.GB6354@mail-itl>
 <YWHDIQC3K8J3LD8+@mail-itl>
 <YwJZ3X0HpT9w6Veh@mail-itl>
 <31f99f6b-0781-795b-731b-d5a9f1105887@suse.com>
 <919e328a-000e-0eeb-2253-6a4381b5ccaa@suse.com>
 <Yxc+fIlyKWU94/VM@mail-itl>
 <d2ca7b0c127e91837d74446ce6f4d576e3bc83a7.camel@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pu1WEvI8Qnh+B2zy"
Content-Disposition: inline
In-Reply-To: <d2ca7b0c127e91837d74446ce6f4d576e3bc83a7.camel@suse.com>


--pu1WEvI8Qnh+B2zy
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 7 Sep 2022 17:07:11 +0200
From: "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: Juergen Gross <jgross@suse.com>, "jgross@suse.de" <jgross@suse.de>,
	Jan Beulich <jbeulich@suse.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [Xen-devel] Xen crash after S3 suspend - Xen 4.13 and newer

On Wed, Sep 07, 2022 at 12:21:12PM +0000, Dario Faggioli wrote:
> On Tue, 2022-09-06 at 14:35 +0200, Marek Marczykowski-G=C3=B3recki wrote:
> > On Tue, Sep 06, 2022 at 01:46:55PM +0200, Juergen Gross wrote:
> > >=20
> > > Could you test the attached patch, please?
> >=20
> > I did a test with only dom0 running, and it works now. It isn't a
> > comprehensive test, but just dom0 was enough to crash it before, and
> > it
> > stays working now.
> >
> That's very cool to hear! Thanks for testing and reporting back.
>=20
> Just to be sure, did you check both Credit1 and Credit2 and do they
> both work, with Juergen's patch?

The test above was with credit1. I did checked credit2 later, and it
still crashes, unfortunately (Juergen knows already from our IRC chat).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--pu1WEvI8Qnh+B2zy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmMYs6AACgkQ24/THMrX
1yysjQf/cZhhYUO1wcQwjq8gBa+SFJmfz1rx8NkAd6Z7pc4Vli5cwFswLVcSj11g
cPR2OJAwmZd20seCiV+eH9TRo1UTVPn+4Vtu8+XrkOpbyfpQz4HJmbMJnW8CyuoN
WzdjE37N6zp1AsTl2m9mbS96wJKNyyKsEwURzDRDS5JCZcQ+BehDw1nMEc9857jP
xF4YKRurYdB7joFL6mCSW9Q4AXN7gwYzqDNqqteFWjHtPi6yN+XHxskhZrhdwFDI
BWVDcpoqHL+G6t8po8adYGRzPhWDRsQZizCGTSTgjbtc3Mry07ddRwzs7YlEwK7Y
dFmj/5ZA1OGWsoP0xCl6yxIcsRjO4A==
=l1pb
-----END PGP SIGNATURE-----

--pu1WEvI8Qnh+B2zy--

