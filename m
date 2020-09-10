Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0735263BAE
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 05:58:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGDiE-0004LJ-9m; Thu, 10 Sep 2020 03:57:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sM5j=CT=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1kGDiC-0004LE-Np
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 03:57:29 +0000
X-Inumbo-ID: 7f386043-28c6-4274-8e52-d9e0984c2bfc
Received: from out1-smtp.messagingengine.com (unknown [66.111.4.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7f386043-28c6-4274-8e52-d9e0984c2bfc;
 Thu, 10 Sep 2020 03:57:27 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id BAA975C00DD
 for <xen-devel@lists.xenproject.org>; Wed,  9 Sep 2020 23:57:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 09 Sep 2020 23:57:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=BuV6JTHpe4+gm90ygUv6iR8Azj1Et
 J0WIsNSevs9/n4=; b=P7imFxrJ3nxsdcw/QsjTd531byM2SGK6GhYRAzIjUtvQy
 2HTSJJgACS1rU2deEhQr4GyAYt9B5AokJ6iPuvGG8VLiCHcR3kVkqBQYY8ChMBCg
 od0Tm2yAiILERVIOl35VKjIt0v9z0v8yIJotOedEUP16MGbz0jsbw5RZw2Ikl6ps
 FhAjgflNmYpdCWQ/qQ03yJBqc7zilJcqEIFxjcAS+bKhf33ZcfGU0xwGfTeX+F2q
 m28O/4YclQ7wUMTmfcex4vT5KfmVnrhVnO9CEepy6E/jLaRunmjL699FIWWZEgQQ
 6DczjJU1T0NfKJUPniOg7WXBL2ky8/DxzQsDziMUg==
X-ME-Sender: <xms:J6RZX4vc6KKayIddv-RVvAZ_Laf1HbieLdQlIJzUTb3_nQ15sVgyIg>
 <xme:J6RZX1flZLUINNgjLVXg01OkklAn1uZ8AK4quW8EIU7V824Q5EaDjzZKmSQM-ohAk
 3weD40DsokKNQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehiedgjeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesghdtreertd
 dtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhi
 uceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqne
 cuggftrfgrthhtvghrnheptddugfetudevudeiveevgfetueejlefggffghffhhfehtdff
 feefgfduueegfefhnecukfhppeeluddrieegrddujedtrdekleenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhi
 shhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:J6RZXzwolre_x4TZmQ-zZKpKjZ-Tey5j3KQwdXn5hLI-Dl8Jbh1GmA>
 <xmx:J6RZX7N1SHfkPidi5ngdUzWMDMJ6OpYeeVFITsIRHzVNlvc0RKT9-g>
 <xmx:J6RZX4-z4Nphi51Qa0CvSicWb7abwNVO3OYJCqkICZRZvlhqB3KAtA>
 <xmx:J6RZX6fobUrUb6Tza3ksyT4J-WE4eQC9fq60u0UodbV0LFQsFsgiKQ>
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de
 [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3D7EE306902A
 for <xen-devel@lists.xenproject.org>; Wed,  9 Sep 2020 23:57:27 -0400 (EDT)
Date: Thu, 10 Sep 2020 05:57:23 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: libxl - b_info.{acpi,apic} behaves differently than
 b_info.u.hvm.{acpi,apic}
Message-ID: <20200910035723.GY1626@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HeirNmDatrwrWTrV"
Content-Disposition: inline
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


--HeirNmDatrwrWTrV
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: libxl - b_info.{acpi,apic} behaves differently than
 b_info.u.hvm.{acpi,apic}

Hi,

After updating from Xen 4.13 to Xen 4.14 I have troubles starting any
HVM: just after hvmloader saying "Invoking SeaBIOS" I get "(XEN) MMIO
emulation failed (1): d29v0 32bit @ 0008:fffeedf d -> "

I come to a situation where seemingly the same domU started via xl
works, while when started via libvirt it crashes. This seems to be
related to xl setting b_info.{acpi,apic}, while libvirt setting
b_info.u.hvm.{acpi,apic}. Modifying libvirt to use the former fixes the
issue.

So, handling the old option got broken sometime between 4.13 and 4.14.
Or perhaps it is some other related side effect.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--HeirNmDatrwrWTrV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl9ZpCMACgkQ24/THMrX
1yyu7wf7Bl69mhxG9tROYg8Hj14zi4qUrFfbi3S+ocMJsuT/LCOKsxFnr0kNgd+y
AjypYm9ZS/Jy1rDHLTo/9OR2tX5N/PDDNSx34fYmdbrnLg0jdcVEAc1TwGQcHLQ3
Ai7qn4QW82kejnSHSiT/Pyp6emNdaVGPzBIjVUULWo51eUFyAQE5N5VMFY9MVTHe
K2GbvBnZXP81uPA3jD8kmS+Xawl8wupGBUv7lVrqXPYVSBgkFy+VvQ3rtwt3xCC0
OEpiZdH+5B1MuV/BsYTGrXl1EE5Iv51u+zxZusCXjtkQf8rvYnrolrorlxcU50SE
TWrMvcKohTT5NTidUTZMeUoFuBCucg==
=d2PZ
-----END PGP SIGNATURE-----

--HeirNmDatrwrWTrV--

