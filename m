Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CB212FFE8
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2020 02:10:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inXvN-000220-KQ; Sat, 04 Jan 2020 01:08:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=r6QG=2Z=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1inXvL-00021v-Rr
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2020 01:08:15 +0000
X-Inumbo-ID: a9c11da6-2e8e-11ea-b6f1-bc764e2007e4
Received: from wout2-smtp.messagingengine.com (unknown [64.147.123.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a9c11da6-2e8e-11ea-b6f1-bc764e2007e4;
 Sat, 04 Jan 2020 01:08:07 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 2F1BF481
 for <xen-devel@lists.xenproject.org>; Fri,  3 Jan 2020 20:08:05 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Fri, 03 Jan 2020 20:08:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=O8pVQNShyS3YszR5tcpgo2dNmVf/n
 93Zw1N5ynpKt3Q=; b=egIQXeO4V83bjrp6IRfM7IiBeMTGwkfopQMDHTj51gM+G
 YOGGxT/biEaLDHAGiqHvU0vr8zVR9cC5DfWmT2E8+i9RNk4FbV/g3SZFHNAwhZDY
 wYwHvKS0uSNeM0IXqj6OeJPBiD572bUH7DHFGe+PIqwPqd6Vgzc35blMov/e5NIh
 FOCbJwMpWWBAqXhQnMS5mdJf1EaM/dbTbYIdOYN7VwqdlnYH1/L9ldTqAoCVMioC
 GroM4o/M4vWBzswyrhLvQWTFs8LKfRv5zjZvwRfl3+gO799ZN/Ng+HygF+zJC8gh
 llq2DQaCw/ki9Gk7AV+bFamSiu0CBNKkulfHgfkvw==
X-ME-Sender: <xms:dOUPXqX3hi27BeCpaV7UmZuz2ITDoVsng4XjhC-1odNTTlgkuOkXHQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdeggedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesghdtreertd
 dtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhi
 uceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqne
 cukfhppeeluddrieehrdefgedrfeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghr
 mhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmnecuvehluhhsth
 gvrhfuihiivgeptd
X-ME-Proxy: <xmx:dOUPXlqqepWfN3vjNRICyHwUTlUd2bPCwmy7qIUY1jbs1gT2Mac1gg>
 <xmx:dOUPXkkizIQvXQVeW72BH35CkXyBRzRYR3Gj8p8dXAnF3FH6WKVSEw>
 <xmx:dOUPXt1M7U-ro_y6ZFD49pojxhjBAWc0LwBy4awyLNthNb9wRZF-Sw>
 <xmx:dOUPXhCntPnXUNb3Z8z4yXIFsUsC8VaIYndt2Wmq1c5ryQ-wO1WaUA>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 20FBE3060774
 for <xen-devel@lists.xenproject.org>; Fri,  3 Jan 2020 20:08:04 -0500 (EST)
Date: Sat, 4 Jan 2020 02:07:59 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <20200104010759.GA2507@mail-itl>
MIME-Version: 1.0
Subject: [Xen-devel] Broken PCI device passthrough, after XSA-302 fix?
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
Content-Type: multipart/mixed; boundary="===============4253441227574653177=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============4253441227574653177==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
Content-Disposition: inline


--W/nzBZO5zC0uMSeA
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Broken PCI device passthrough, after XSA-302 fix?

Hi,

I have a multi-function PCI device, behind a PCI bridge, that normally
I assign to a single domain. But now it fails with:

(XEN) [VT-D]d14: 0000:04:00.0 owned by d0!<G><0>assign 0000:05:00.0 to dom1=
4 failed (-22)

This is Xen 4.8.5 + XSA patches. It started happening after some update
during last few months, not really sure which one.

I guess it is because quarantine feature, so initial ownership of
0000:05:00.0 is different than the bridge it is connected to.
I'm not sure if relevant for this case, but I also set
pcidev->rdm_policy =3D LIBXL_RDM_RESERVE_POLICY_RELAXED.

Booting with iommu=3Dno-quarantine helps. Note I do not use `xl
pci-assignable-add` command, only bind the device to the pciback driver
in dom0.

Relevant part of lspci and lspci -t:

00:00.0 Host bridge: Intel Corporation 4th Gen Core Processor DRAM Controll=
er (rev 06)
=2E.
00:1c.3 PCI bridge: Intel Corporation 9 Series Chipset Family PCI Express R=
oot Port 4 (rev d0)
=2E.
04:00.0 PCI bridge: Intel Corporation 82801 PCI Bridge (rev 41)
05:00.0 USB controller: NEC Corporation OHCI USB Controller (rev 43)
05:00.1 USB controller: NEC Corporation OHCI USB Controller (rev 43)
05:00.2 USB controller: NEC Corporation uPD72010x USB 2.0 Controller (rev 0=
4)

-[0000:00]-+-00.0
=2E.
           +-1c.3-[04-05]----00.0-[05]--+-00.0
           |                            +-00.1
           |                            \-00.2


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl4P5W8ACgkQ24/THMrX
1yy39Qf8CBhbn/14pGQOBXuUzhfah3IYu7QXoeq25mANFABhgrP1tTFd6lUc2c2i
uZPAeOLCqZ28No8eMN2Y3vlZcSjck6Tm0/kHw8IgdNG7SjVoKFmHQv/4y2kppi6v
Lm1f+M6G7D/B76wsLBtC5iHXckUMC43bdU4Bfi5dGB91cKh4Zm1nToFF9k/WR0Qr
LZBofJg+rkYQIi0nV3bgjC0KX7eSdqrz+ggYwh7Git4bTNF86+Y7kdPcanWCoCIo
2vGBEb7RzL4kp+JSr65H5AealJxAX2Oot5wJ/9ozyOs2IFUQbfXwLOvbsqSAeKir
ROi6LYj4PxTP/7Sxyr/MjOoLqc/j2g==
=TWyL
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--


--===============4253441227574653177==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4253441227574653177==--

