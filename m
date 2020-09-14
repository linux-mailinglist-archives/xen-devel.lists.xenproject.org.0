Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B9B2688A0
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 11:38:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHkwZ-00007Y-By; Mon, 14 Sep 2020 09:38:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K6qy=CX=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1kHkwX-00007R-N9
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 09:38:37 +0000
X-Inumbo-ID: 3fefe7c7-540a-48c0-9273-f77db968913f
Received: from wout5-smtp.messagingengine.com (unknown [64.147.123.21])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3fefe7c7-540a-48c0-9273-f77db968913f;
 Mon, 14 Sep 2020 09:38:26 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 562BB490;
 Mon, 14 Sep 2020 05:38:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 14 Sep 2020 05:38:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=OcxkFH
 z+iiDsoxyB2uJPX+h+i4pw0/kI0i1dvBijHZQ=; b=skiT/Y+YBCLBxbnGXPPbLh
 FPGatc6Vwc8qkDkrPNkuun0OcWoNxunRvvIzQf6X2NDA5K2Ae+aQP4F9W9vcVmeW
 OQijhe2BkAxy/3PKLSsYt4RWovf8++nHECRk+M9zAeKNO0JuwcFgzK9Kl4ZMYad2
 HwNEM3muLEM3CRpVX4vCkUj6DdBW7zP3JpM5E5yYBA5LQ21Yo3FOVfCu6Iw6etyc
 uRYyvitBnwNnzJB+z4hpJcnaG1N/gBg1EJsECigkbSw63bFkLjQd08tYbC369H7k
 Oslel12U1Nmdd0ibV9oFn+iakqpmPKIw1AVYPfK+jVHNQk+fyAaN9yTNFZU5Fvfg
 ==
X-ME-Sender: <xms:EDpfX1Bp6VKzujIDX2O7yheRJbOaqdFDBIdGi_dbOceVUkad4H6pww>
 <xme:EDpfXzjTtb9bmHtXqUQ89GRMYZSheZ8C6_W-JU-CpGJZU_Yoeq-e8n0c-lovKZ1PK
 _n9gwHPjh7kaw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudeiiedgudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
 iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucfkpheple
 durdeigedrudejtddrkeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
 rghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsg
 drtghomh
X-ME-Proxy: <xmx:EDpfXwmXLzsV_k5sg4Uel6qN5c8As5cxkyzDJX__kmVDXzGwqUFGNQ>
 <xmx:EDpfX_zQJERSHvfvJRdo8XRtIkBkbuXTzfHW5wNaJsnt3Jx1lDV3ew>
 <xmx:EDpfX6QnA4Tg4Awh-FK1siwrdjht3_xTygftu_Vz6eRFTdTnEoOF6w>
 <xmx:EDpfXz4si8M2exl2DKHw5w9mxdOESU84TK_cJwJBumADgBhQ0CYM2Q>
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de
 [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id B0E2F3064674;
 Mon, 14 Sep 2020 05:38:23 -0400 (EDT)
Date: Mon, 14 Sep 2020 11:38:19 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Wei Liu <wl@xen.org>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH] tools/build: fix python xc bindings
Message-ID: <20200914093819.GF1482@mail-itl>
References: <20200912135807.28293-1-jgross@suse.com>
 <20200914093541.nfs3ajzuh4hqu5lq@liuwe-devbox-debian-v2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dgjlcl3Tl+kb3YDk"
Content-Disposition: inline
In-Reply-To: <20200914093541.nfs3ajzuh4hqu5lq@liuwe-devbox-debian-v2>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--dgjlcl3Tl+kb3YDk
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] tools/build: fix python xc bindings

On Mon, Sep 14, 2020 at 09:35:42AM +0000, Wei Liu wrote:
> On Sat, Sep 12, 2020 at 03:58:07PM +0200, Juergen Gross wrote:
> > Commit 7c273ffdd0e91 ("tools/python: drop libxenguest from setup.py")
> > was just wrong: there is one function from libxenguest used in the
> > bindings, so readd the library again.
> >=20
> > While at it remove the unused PATH_LIBXL setting.
> >=20
> > Fixes: 7c273ffdd0e91 ("tools/python: drop libxenguest from setup.py")
> > Signed-off-by: Juergen Gross <jgross@suse.com>
>=20
> Acked-by: Wei Liu <wl@xen.org>

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> Since this blocks osstest and is just putting back old code I want to
> commit it as quickly as possible.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--dgjlcl3Tl+kb3YDk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl9fOgsACgkQ24/THMrX
1yztmAf+MtknJJBpjN1FozfzI8SpWNiWcAzSvUq4eP50O1QmGSsVLnkF877FGSfZ
GZK7kEz/kkGk55WMq/ygz51/geT8sbKIhRLe76rtuB8SLZgYi9T9NAGb4AyB/RdI
OGtkWNzWZOq2qg/hoCKYUPxwbfca7V+kSvRDLdw5h3bGsbKUhvNNw5qyR6+BxY4S
21U7Nf74YG6K9/bmDNJ46DO7qVsHM2dZLhTARfSfXbuHiS8Gv5RoTMjbnc9BuUgJ
SrYOBPoiDi1jaiEnhJ3BASV74PPeE305HCdnnTG8EENDXiYcolfjRcfJuxD2Jhw4
Ew2XiXUfzErfwNXzmckCWg9STkJI6Q==
=Ycqv
-----END PGP SIGNATURE-----

--dgjlcl3Tl+kb3YDk--

