Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38011153936
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 20:40:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izQUI-0005og-CV; Wed, 05 Feb 2020 19:37:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yhvQ=3Z=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1izQUG-0005ob-3f
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 19:37:24 +0000
X-Inumbo-ID: edfad85c-484e-11ea-b211-bc764e2007e4
Received: from wout3-smtp.messagingengine.com (unknown [64.147.123.19])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id edfad85c-484e-11ea-b211-bc764e2007e4;
 Wed, 05 Feb 2020 19:37:23 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id B936D616;
 Wed,  5 Feb 2020 14:37:21 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Wed, 05 Feb 2020 14:37:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=q46uhA
 rwRjXxTgCIO6oWc+dsP8wHqfP6d5X7Hcd5mjk=; b=246Ojb2qwuLMJCWp4foX6y
 Dech5O+6vh3EzO1kAdXi5rrY3MoSm9ynNkCVT45eGyt4ZSBd7h4RowSpQm/1NsUc
 mK+oDeAUembRy7/L8H/QsWhwYEErtKKQVT7zdSlhpU4nzXeeUDq7PRw0QjLFcwo9
 98sWoiThrFZT/Lp/Mj/v5JRw8o+uLkvBE+nLIPRumeCPq+K1XhIBN2sQqKmxOeyM
 8HfYsjhWV1zV3kCb2UQTh/a4fm2/RZSBxSxXPKNHfH5792juS9aINYslmz2JPe3z
 wvwHBWtDztqNprE3tjFuGx1dNDtCHBzp4e87okQvZOoVnp4OHVeyOFnNCHUb2Z4Q
 ==
X-ME-Sender: <xms:cRk7Xk2z14a8X1Qcku9nnkkHYVLppmLM0aYEiT9ZBnXYXiHYR-dm9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrhedugdduvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 hrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:cRk7Xv3jwEALVMCiEw4r50vascY4_02Vdz6iS-CiKcpxhlDWqUnS9A>
 <xmx:cRk7XgugJwYJpPKDGvA3NRcbbyVu7XH2ybU3W3jADAQtzn-JWaXwYQ>
 <xmx:cRk7Xva05qZSbTUJ_zl9f0XX2rlTDNQvCKRzwJDiLyr01KrVtrZ33A>
 <xmx:cRk7Xu8ukLC9W3yY9CWZWSM79C0x-qlUz1NoDuTKFuuxZ0qk2JHcWw>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7A3BA328005E;
 Wed,  5 Feb 2020 14:37:20 -0500 (EST)
Date: Wed, 5 Feb 2020 20:37:17 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200205193717.GV15453@mail-itl>
References: <20200205165056.11734-1-andrew.cooper3@citrix.com>
 <20200205165056.11734-4-andrew.cooper3@citrix.com>
MIME-Version: 1.0
In-Reply-To: <20200205165056.11734-4-andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH 3/6] tools/python: Drop cpuid helpers
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: multipart/mixed; boundary="===============1046841128724491414=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1046841128724491414==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="t98UOKzcpBZ5uth4"
Content-Disposition: inline


--t98UOKzcpBZ5uth4
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/6] tools/python: Drop cpuid helpers

On Wed, Feb 05, 2020 at 04:50:53PM +0000, Andrew Cooper wrote:
> These are believed-unused, and the underlying infrastructure is about to =
be
> rewritten completely.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--t98UOKzcpBZ5uth4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl47GW0ACgkQ24/THMrX
1yxo8QgAjFOBAHQVzeZ52m3jwkfiA2xHW+npedQHlamtUV2aeVU++KJ87D3tlgtI
vQAejCLETziHokj83p4Iu55RdaYpymVtS4ZG4vJpksk0SxH4687j7lNtoLugu6Av
iWCiRfpPjNEpgL/t6wnqjGHyGhVOGDlfg7DVofFeCbzPAaGN2V6JAa33AU0I+O0P
H5+VW5Qk5HMCc4sJiSOdg88wUk828lhM+NWAve0Wrk4QAzWh9vJSyKfRRv3ZmkZW
lFn9cx2lnzczFG7W3BfvVaOAQuQZj/5ZqhCu9E16RelmABSa/p3OTTJ4J/YiNS3t
NNOJ2fwp1pJbQ0R91cOe2NcBM0yOlw==
=IzmS
-----END PGP SIGNATURE-----

--t98UOKzcpBZ5uth4--


--===============1046841128724491414==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1046841128724491414==--

