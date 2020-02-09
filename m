Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A38156D06
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 00:12:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j0vfM-0003y6-0o; Sun, 09 Feb 2020 23:07:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YVFN=35=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1j0vfK-0003y1-3t
 for xen-devel@lists.xenproject.org; Sun, 09 Feb 2020 23:07:02 +0000
X-Inumbo-ID: e10a0e5c-4b90-11ea-a677-bc764e2007e4
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e10a0e5c-4b90-11ea-a677-bc764e2007e4;
 Sun, 09 Feb 2020 23:07:01 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id EFBCA21AFB;
 Sun,  9 Feb 2020 18:07:00 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Sun, 09 Feb 2020 18:07:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=l3rpnl+0+72OJimZKjhkdcsqdVMWt
 LiM1rfeoNt5m3o=; b=NGbj1VyVgZlaysuYKOaLntrLEPOQlJjeeUnzare3ocsih
 gI5+RinwcyOWUVeshM+WtbqNLp+VpQJsSfmC9qFy8l11SPJC2+ni3XgFYGA+s771
 XQxolFaKdVge8qKRnh288ksuvIbqYf23H2ihLyImw9RsA8x3lPMw/iYE1beI3QlE
 JKcDt8c32UByxZAPJ7L1r8Qnj69JLYWWG2H6rgYKxiAhxUETtUWfUYYIud4hXZla
 DogOTcY0i1NZLnkf/WZCtkKv9jm0nlXcRtkKMsa1GBXmSfOaXQdvXBwZJDTCeqy8
 yZ7sxRtgGcj+6SR5UrINqywnRXTGKuV2iJarlz8JQ==
X-ME-Sender: <xms:lJBAXg-spy5bHLHMZ8R-MTqZl6kwopGfJvcNOHk6kbb0hQrxxrWcgw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrheelgddugeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesghdtreertd
 dtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhi
 uceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqne
 cukfhppeejjedrvdegfedrudekfedrvddtfeenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthh
 hinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:lJBAXrpSW__CawkhUcL5r6kPIWrPyOQHXGU1DAQz44wXmHCnTttPTg>
 <xmx:lJBAXqMgr216N2AfCyvVHEITGmBJEOs7BSt1vlitvPRORpoI0Osw9A>
 <xmx:lJBAXtra15psAd9RTK4OznK9Fyi49qvPIzfGvnowkmXe_F8MP8VCog>
 <xmx:lJBAXtJfsR7dXpRwtoHLZxbTZTjV4naiOG21h8FTDxRDtZ8oRuaXUA>
Received: from mail-itl (unknown [77.243.183.203])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8F79C3280059;
 Sun,  9 Feb 2020 18:06:59 -0500 (EST)
Date: Mon, 10 Feb 2020 00:06:55 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <20200209230655.GA32524@mail-itl>
MIME-Version: 1.0
Subject: [Xen-devel] Xen fails to resume on AMD Fam15h (and Fam17h?) because
 of CPUID mismatch
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
Cc: zachm1996@gmail.com, Claudia <claudia1@disroot.org>
Content-Type: multipart/mixed; boundary="===============5354225725348335112=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============5354225725348335112==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Content-Disposition: inline


--6TrnltStXW4iwmi0
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Xen fails to resume on AMD Fam15h (and Fam17h?) because of CPUID
 mismatch

Hi,

Multiple Qubes users have reported issues with resuming from S3 on AMD
systems (Ryzen 2500U, Ryzen Pro 3700U, maybe more). The error message
is:

(XEN) CPU0: cap[ 1] is 7ed8320b (expected f6d8320b)

If I read it right, this is:
  - OSXSAVE: 0 -> 1
  - HYPERVISOR: 1 -> 0

Commenting out the panic on a failed recheck_cpu_features() in power.c
makes the system work after resume, reportedly stable. But that doesn't
sounds like a good idea generally.

Is this difference a Xen fault (some missing MSR / other register
restore on resume)? Or BIOS vendor / AMD, that could be worked around in
Xen?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl5AkI8ACgkQ24/THMrX
1yyb9ggAk9n4G5bxD8j+t12GXNgYH+WBxGPKbZ3HcXR1O3xAQTsR7NyMtdFM5fKR
DYfGhOX7qQSSCWrUrncGTtYKvepxaFL8G4RZKZM8MdK0oTCp4JzUNvOOmwMw7x+M
94rgewTyAxmXNRh25vbHFbRNeJVlhhFhsZEKq4AGm6YZsM2GKmEJcOTAVcl1l1+S
3fZbyQxX2CywMlhRH6Yi/7/2A/XPSpnndnQPJT+4bHbm8RFCTwI81R3wEVL5SP5c
7Jfqe8RdgKfcD8QLsodyQ5cEeyV7Z4oRdheY26RHEacpw5ajBFTT0ypXJcgwzLLp
8dA65OTIrJLHKl23eLotVdg3gGL3eQ==
=Dggq
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--


--===============5354225725348335112==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5354225725348335112==--

