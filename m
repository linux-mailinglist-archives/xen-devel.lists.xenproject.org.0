Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 503058A9C92
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 16:18:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708405.1107310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxSas-000618-0Q; Thu, 18 Apr 2024 14:18:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708405.1107310; Thu, 18 Apr 2024 14:18:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxSar-0005y9-Tc; Thu, 18 Apr 2024 14:18:29 +0000
Received: by outflank-mailman (input) for mailman id 708405;
 Thu, 18 Apr 2024 14:18:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6y+3=LX=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rxSaq-0005y3-F5
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 14:18:28 +0000
Received: from fout1-smtp.messagingengine.com (fout1-smtp.messagingengine.com
 [103.168.172.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8445c4c6-fd8e-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 16:18:25 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailfout.nyi.internal (Postfix) with ESMTP id 9237F1380253
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 10:18:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 18 Apr 2024 10:18:23 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 10:18:22 -0400 (EDT)
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
X-Inumbo-ID: 8445c4c6-fd8e-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1713449903;
	 x=1713536303; bh=cB8BeAsT8tlU56yAefbXCLs1pYRltgxFnr5YqICx8DY=; b=
	fYo5n6Q/eFzQWPuzzlBYvEL1cdZUGjSq9Y4jDLgOtTq+u2ViK+eUlrXxYB2fLw/e
	v0B+vSe87WwkvppCiSlsoUb5hNe7Kqy4Re7zKqu+AM+sD9nb2M3h1+ZYuAqCQOkb
	FzHz5t6x9H5AZdZHTNFPTEt29PUVye4M+FVswvbsoVfqyEo01vVyTXWDFFrmrHpk
	Tb2+aCSJDrMP4L8pj7ftQud/s1pT2Vs93CeszQMlHolKCAOnYVViug/O1AKudZLA
	q84FbEFuOCwEXSUZ9DQi7AouNBxDMKSAZGQqmVVt0VrF4GZrclS9rjrEr3MJ2KQp
	thwzgrTiumSuo1hSfzDMFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1713449903; x=1713536303; bh=cB8BeAsT8tlU56yAefbXCLs1pYRl
	tgxFnr5YqICx8DY=; b=HRIlYvLm+67L5VzLm66hFcekJxDCR+KDhKjxPEStYuJ4
	vEkLgPpQmKdN5yGavIiYztdswOnkQ0uGgqKtC7+/7ZM4P0gFDzyzRs7GoX6YEPlN
	PlE2xhqsNYLz2s4f80DRlSHItbinu2YYpCYAOJZRScn8x3VujFH50Fkbe/tgY2T3
	OVGchVSN0Eub0YK67H+wyrixP/f5V8Z2G+wRRiWECQU71q8pbjVzKo+F3QuD4ngU
	0CscOlwuQv5z4+iAzD+EBziP/8sCCAdGVM8pIh+qbqInw8UpJ8ISEusEpMUclqZ7
	0ZMMNc9LJcHsk4An5qW4MxkPo0DJal0DzX93RUClug==
X-ME-Sender: <xms:ryshZv7-xK1ifK9RhFP4Mei-6v9qmELjqkkBwa7tBPRQRRNVXKvCng>
    <xme:ryshZk7iFph2WvCUXRJiCfslU6La8PbAevNP9loKq8TUSjhZk9M95_Q7O_zh9UIb-
    R3kJzU2tWU9Bg>
X-ME-Received: <xmr:ryshZmfHWIzFx0YPaXazfMXOER9LRBtV_UvS5qvUN0Om41UjaPHihYgZDsVMDVa0tUnZVNgVP-_IKFwYNSWb3etKGT0tu-5K1A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudektddgjeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesghdtre
    ertddtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggt
    khhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    eqnecuggftrfgrthhtvghrnheptefhhfetffeitdehieefieelgfeuhfehvdfhffejjedu
    leekgeegueeuvefghedtnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpghhithhlrg
    gsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:ryshZgLdyu4XEg5VEv7RtxD5oWSidilSWQqYOmIekX7KjI82qx1plQ>
    <xmx:ryshZjKqC6WUJ4SDHMJDO_c4J7nDZzZtWmtK6rRhdmRCOlREP3oHuQ>
    <xmx:ryshZpz_3oNgKoJ4Bl9shAITya-Om2wRSmbS1BMsO5DMdS9a0mxhiA>
    <xmx:ryshZvKOBt68Tyrxjs_nkqLbph7b3Gv-OL5HLCn760tVXFJ5cb7gTw>
    <xmx:ryshZlzKei4NAqUVUJKdFRbhKYOaHfnUBvA5ag_JKaFYTqN1LeRDqKF9>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 18 Apr 2024 16:18:20 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 0/7] MSI-X support with qemu in stubdomain, and other
 related changes
Message-ID: <ZiErrOBth4rGDnsp@mail-itl>
References: <cover.afa2d89161590f5193dd6bfd340c5e9347877aae.1710342968.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HOpJB9fSj7kUIaHG"
Content-Disposition: inline
In-Reply-To: <cover.afa2d89161590f5193dd6bfd340c5e9347877aae.1710342968.git-series.marmarek@invisiblethingslab.com>


--HOpJB9fSj7kUIaHG
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Apr 2024 16:18:20 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 0/7] MSI-X support with qemu in stubdomain, and other
 related changes

On Wed, Mar 13, 2024 at 04:16:05PM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> This series includes changes to make MSI-X working with Linux stubdomain =
and
> especially Intel Wifi 6 AX210 card. This takes care of remaining reasons =
for
> QEMU to access /dev/mem, but also the Intel Wifi card violating spec by p=
utting
> some registers on the same page as the MSI-X table.
> Besides the stubdomain case (of which I care more), this is also necessar=
y for
> PCI-passthrough to work with lockdown enabled in dom0 (when QEMU runs in =
dom0).
>=20
> See individual patches for details.
>=20
> This series include also tests for MSI-X using new approach (by preventin=
g QEMU
> access to /dev/mem). But for it to work, it needs QEMU change that
> makes use of the changes introduced here. It can be seen at
> https://github.com/marmarek/qemu/commits/msix
>=20
> Here is the pipeline that used the QEMU fork above:
> https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/1211237368
>=20
> Marek Marczykowski-G=C3=B3recki (7):
>   x86/msi: passthrough all MSI-X vector ctrl writes to device model
>   x86/msi: Extend per-domain/device warning mechanism
>   x86/hvm: Allow access to registers on the same page as MSI-X table
>   automation: prevent QEMU access to /dev/mem in PCI passthrough tests
>   automation: switch to a wifi card on ADL system
>   [DO NOT APPLY] switch to qemu fork
>   [DO NOT APPLY] switch to alternative artifact repo
>=20
>  Config.mk                                           |   4 +-
>  automation/gitlab-ci/build.yaml                     |   4 +-
>  automation/gitlab-ci/test.yaml                      |   4 +-
>  automation/scripts/qubes-x86-64.sh                  |   9 +-
>  automation/tests-artifacts/alpine/3.18.dockerfile   |   7 +-
>  automation/tests-artifacts/kernel/6.1.19.dockerfile |   2 +-
>  xen/arch/x86/hvm/vmsi.c                             | 224 ++++++++++++-
>  xen/arch/x86/include/asm/msi.h                      |  15 +-
>  xen/arch/x86/msi.c                                  |  50 ++-
>  xen/common/kernel.c                                 |   1 +-
>  xen/include/public/features.h                       |   8 +-
>  11 files changed, 308 insertions(+), 20 deletions(-)
>=20
> base-commit: 03cf7ca23e0e876075954c558485b267b7d02406
> --=20
> git-series 0.9.1

Ping, can I ask for a review?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--HOpJB9fSj7kUIaHG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmYhK6wACgkQ24/THMrX
1yx3/Qf+LYoLhkIPlBweuCuAISHJIMCLG+LK1ms+zm+aOrTbmzAh3V9rPhZrC1dk
d1AMy6ULfeOxHd2v9EgYgbKtiVuG80IP4M7FhNJoScN1/QDt9cqmgM1oZtw4wo7+
RXt2R8Z0NouaIFKDugwtvDBC8kKHPWHBWwWFiW0Gob8z5BTF9STraukLx9/sBpo4
VX0QDHByFNoKjPXczvAhHFNfVyUMjKbtMil1GMTMtscvpe4T5AQtfMH0nvJ7NvZR
cttzf/3ZzSwPfryCItb1yhcfKOHE7GvzrHP+WAR7GcKeAA+ygtCswHr6JsBHBDFS
9uniu9hNwABtt+egGRw52fSicyA6Wg==
=9Wlb
-----END PGP SIGNATURE-----

--HOpJB9fSj7kUIaHG--

