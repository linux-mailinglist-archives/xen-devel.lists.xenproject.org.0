Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF789E7EE1
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 04:31:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPI8Z-0003F4-Nm; Tue, 29 Oct 2019 03:25:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vzw3=YW=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iPI8Y-0003Ez-KK
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2019 03:25:38 +0000
X-Inumbo-ID: c5f3c40a-f9fb-11e9-950a-12813bfff9fa
Received: from wout5-smtp.messagingengine.com (unknown [64.147.123.21])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c5f3c40a-f9fb-11e9-950a-12813bfff9fa;
 Tue, 29 Oct 2019 03:25:36 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id DD45342F
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2019 23:25:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Mon, 28 Oct 2019 23:25:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=4Y0MeD43T3D1XeQqzVlcy1rjsSfys
 NG7txItNGQa8i4=; b=LfbUJHUFmyeCiitUa4L2xVKCZ/noQF4WqRe2IN2cHBWQO
 l7P0FmPkhofjjUWcVPx+42p+slqSxjWnP0eshK8+yGg7SCVrtpGXOMIxis+T8rrz
 vrgan4L7SObviy5k2KfA43WwORRMc2yAqU7Mu4ETs4m22UHKl0PHEWjP2SoFUZe9
 9IxUhoXQ6rUP58YKw253erzExDsfWVI04teJSnxS3aJy+mHhA8/GhNxXBbFjrX/M
 TTHHlyZeCym2zvf2VtatZzfcmNWj9+NpD0NoVRaLThe4CFf3Ynnv/gCfB+aY7NKQ
 t+uPAnvdavqG8G+CMQwGmdjmJd672BZV8YV2FzI8w==
X-ME-Sender: <xms:L7G3XQulq-6ToS4xfe35JsgMNTv-_pylFBUfgwOKb_yyNpLV_OQ7UA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddttddgheejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesghdtreertd
 dtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhi
 uceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqne
 cukfhppeeluddrieehrdefgedrfeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghr
 mhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmnecuvehluhhsth
 gvrhfuihiivgeptd
X-ME-Proxy: <xmx:L7G3Xa5tW9hiYyjB_Q-LwGjtATnAGyHgHXcXE5F10usQ6xTmWmzGVQ>
 <xmx:L7G3XbvCMGJxUZJr36WNhcoeu8_6ZfKXUR79HuPJUubsKUsz96NEcw>
 <xmx:L7G3XU2EX7bMJxzlymvjJhqKv2ZF9I0azdNKavjj3OL7lzm7tIp6rQ>
 <xmx:L7G3XeDT6A5TramYhBkBT-oP2fMTcc39bSfE3-S6ykkvc5avE52TPQ>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id EB787D6005D
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2019 23:25:34 -0400 (EDT)
Date: Tue, 29 Oct 2019 04:25:31 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <20191029032531.GQ1410@mail-itl>
MIME-Version: 1.0
Subject: [Xen-devel] xenstore backend cleanup issue with driver domains
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
Content-Type: multipart/mixed; boundary="===============6402354275223972486=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============6402354275223972486==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WZLuFERxa6Y0cbOt"
Content-Disposition: inline


--WZLuFERxa6Y0cbOt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: xenstore backend cleanup issue with driver domains

Hi,

I've found an issue with backend xenstore entries cleanup when driver
domains are in use. I've found it on vif devices (and will use them as
examples) but I believe the issue is generic.
When device is removed, backend domain (driver domain or not) is
responsible for removing entries in /local/domain/.../backend/ tree.
Specifically, it's done in libxl__device_destroy ->
libxl__xs_path_cleanup. The issue is that driver domain don't have
necessary access for this:

backend/vif/36 =3D ""   (n0,r1)
backend/vif/46 =3D ""   (n0,r1)
backend/vif/46/0 =3D ""   (n1,r46)
backend/vif/46/0/frontend =3D "/local/domain/46/device/vif/0"   (n1,r46)
backend/vif/46/0/frontend-id =3D "46"   (n1,r46)
backend/vif/46/0/online =3D "1"   (n1,r46)
backend/vif/46/0/state =3D "4"   (n1,r46)

As you can see, backend domain (1) has access only to a specific device
node, but not to the parent directory. This leads to a lot of empty
directories left behind, to the point xenstore list fails with E2BIG (if
you create and destroy a lot of domains).

I see two solutions for this:
 - adjust xenstore permissions, so the driver domain can properly
   cleanup those entries
 - cleanup it from dom0

I think the first one is better, especially when libxl keeps its view of
the things in /libxl (so there is less risk of malicious driver domain
confusing libxl). The second one don't require any permission change,
but may be racy if both dom0 and driver domain try to cleanup things.

Any insights?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--WZLuFERxa6Y0cbOt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl23sSwACgkQ24/THMrX
1ywljwf/c2yhcyBjzKmXGNbEobbLgLay0SvowvqhLJC7mqB50WsG8sfQDRL56j+m
GY4VQuOrDjbCxgbu5RcDEW1FB7E38BtDvmgK6JZQoCn8FRKw21XjV9LfTMk+N5ug
otVZV71I/expZxz0X2/iyz/ZV7OClGJstkpLAi0l6BsKyQdJZcNNM4cuafM2jjSp
1UXpN+itCDPJXDImK/VJk8SZwWSbvpf5tMbp1BGzYIgJIC3Idst/CQDOzgtPRDsA
4CKB1yj2k2FMJYdsuP5p2prVQxwHLrXrzP8Xrpe7FOD+evnTq8APGjOMk+uG6tGS
UPswP7f12/EMYfPc9wAWVAXMbrH5Vw==
=SX0o
-----END PGP SIGNATURE-----

--WZLuFERxa6Y0cbOt--


--===============6402354275223972486==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6402354275223972486==--

