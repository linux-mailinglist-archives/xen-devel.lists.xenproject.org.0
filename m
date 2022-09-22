Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F29EC5E63F7
	for <lists+xen-devel@lfdr.de>; Thu, 22 Sep 2022 15:45:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410204.653261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obMVv-0001eT-Sa; Thu, 22 Sep 2022 13:45:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410204.653261; Thu, 22 Sep 2022 13:45:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obMVv-0001bb-P9; Thu, 22 Sep 2022 13:45:15 +0000
Received: by outflank-mailman (input) for mailman id 410204;
 Thu, 22 Sep 2022 13:45:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jJba=ZZ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1obMTK-0004DO-9o
 for xen-devel@lists.xenproject.org; Thu, 22 Sep 2022 13:42:34 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66da100a-3a7c-11ed-9647-05401a9f4f97;
 Thu, 22 Sep 2022 15:42:32 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 7FCA15C00D8
 for <xen-devel@lists.xenproject.org>; Thu, 22 Sep 2022 09:42:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 22 Sep 2022 09:42:29 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Thu, 22 Sep 2022 09:42:28 -0400 (EDT)
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
X-Inumbo-ID: 66da100a-3a7c-11ed-9647-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1663854149; x=1663940549; bh=1exnffNnck
	ocGFlvR2gG+KOq54oxSFUg2c0Ocjxgo9c=; b=e4+dzMT54kQrITQ9+ooWr1jlyd
	SgM0k5erFZW2U5vKwQbHL/kyCVHF1mSfVZgGUV0RX7c41nleBvAYDuYTfY6Gdjsv
	CcB57n+PTlv0U804Kt1CHiEEqvmYuWFx0w1S50kkcC6qt/0k26eYHmcZQt1uXCEt
	8751ikWktuZZ0ltawLiLgP49+wF85+96UMe7sXi7+CdBkC04twbMZxCKZvo6BJ+i
	/8891lwOirSaLxO4AYUB/8hUGvo9AyYgn9vmBKEHv6FtP+KwVU4oXSRY8Asf3/t6
	zMOOf1Dp3pp5Pup1b4QiRaKsDx07GCYzzUYHLLKBQCXGwUvO5SY3xzYzVLCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:mime-version
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663854149; x=
	1663940549; bh=1exnffNnckocGFlvR2gG+KOq54oxSFUg2c0Ocjxgo9c=; b=B
	Q88WU7BLPpmBeAIw9Ih02ExcccSU+gXqWN7FJIyMouW22E9j3tIteSovKUH1rsJO
	6npd4M4GWX+C572UvnZRiXuYbX7OytqYne6wQS3ptOgzPSfb2wk0cIDgHBWyVLg4
	ZWFz806mNDoROWa/dfdfgVEUYQkKb3D1udk7qIZS5vqhGsDMecGR7n+aYgRHO8y4
	7br/Z1TfDUf6TCnMzbfjQSqKIaqrESd0bjiUzY/mKCtorE1whHV+CHLDeYYZwkpy
	/lFWzdBFnVZstiOfXCVFlCo5fUFyeJop6IYRCwCfQQ+A+Mvq7bprV9xXGFD3hxOD
	/kcCu1RIrzk3LblCxJkZg==
X-ME-Sender: <xms:RWYsY7705JjmGxdbfJpGyAwFvNvmX3aWSmtD7176eHAckCEfAu9_GA>
    <xme:RWYsYw4FfXjboZvh3-QdVq3XHeLZWhXKVqj8h78hp80itDNeKasJnYnFUdUhxHfE9
    MpnZxw3TW8OQA>
X-ME-Received: <xmr:RWYsYycTDmSn0cbaZht_YK9Y2qceJE7JteWoIMxzc4GRdUR5DFgMoTW0IDKF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefgedgtdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesghdtreertd
    dtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhi
    uceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqne
    cuggftrfgrthhtvghrnheptddugfetudevudeiveevgfetueejlefggffghffhhfehtdff
    feefgfduueegfefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtgho
    mh
X-ME-Proxy: <xmx:RWYsY8KdCv6HTn0_jL2TJb7gvOrYDaxdz_8KDwuOB_lIVNM1ZEeV8w>
    <xmx:RWYsY_I7XZuRlw1ma0vLZ4W_2ThSCr_xlVu72o9dHdK4ocYVaSip0A>
    <xmx:RWYsY1yOjIqGh5xOIIf1n_vsXUsxi7Zt79af5c8LLGn-XINu80UnQg>
    <xmx:RWYsY0X5S9dm9L0fZvlaNPQU7K9Pm_t6BJnZx1Gh8IWQ1A6MGL9B7Q>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 22 Sep 2022 15:42:25 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Design session "grant v3"
Message-ID: <YyxmQf+q0BqsX8Nb@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/PqyDgNKiSkARGk5"
Content-Disposition: inline


--/PqyDgNKiSkARGk5
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Sep 2022 15:42:25 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Design session "grant v3"

J=C3=BCrgen: today two grants formats, v1 supports only up to 16TB addresses
        v2 solves 16TB issue, introduces several more features^Wbugs
        v2 is 16 bytes per entry, v1 is 8 bytes per entry, v2 more complica=
ted interface to the hypervisor
        virtio could use per-device grant table, currently virtio iommu dev=
ice, slow interface
        v3 could be a grants tree (like iommu page tables), not flat array,=
 separate trees for each grantee
        could support sharing large pages too
        easier to have more grants, continuous grant numbers etc
        two options to distingush trees (from HV PoV):
        - sharing guest ensure distinct grant ids between (multiple) trees
        - hv tells guest index under tree got registered
        v3 can be addition to v1/v2, old used for simpler cases where tree =
is an overkill
        hypervisor needs extra memory to keep refcounts - resource allocati=
on discussion
        hv could have TLB to speedup mapping
        issue with v1/v2 - granter cannot revoke pages from uncooperating b=
ackend
        tree could have special page for revoking grants (redirect to that =
page)
        special domids, local to the guest, toolstack restaring backend cou=
ld request to keep the same virtual domid
Marek:  that requires stateless (or recoverable) protocol, reusing domid cu=
rrently causes issues
Andrei: how revoking could work
J=C3=BCrgen: there needs to be hypercall, replacing and invalidating mappin=
g (scan page tables?), possibly adjusting IOMMU etc; may fail, problematic =
for PV

Yann:   can backend refuse revoking?
J=C3=BCrgen: it shouldn't be this way, but revoke could be controlled by fe=
ature flag; revoke could pass scratch page per revoke call (more flexible c=
ontrol)

Marek:  what about unmap notification?
J=C3=BCrgen: revoke could even be async; ring page for unmap notifications

Marek:  downgrading mappings (rw -> ro)
J=C3=BCrgen: must be careful, to not allow crashing backend

J=C3=BCrgen: we should consider interface to mapping large pages ("map this=
 area as a large page if backend shared it as large page")

Edwin:  what happens when shattering that large page?
J=C3=BCrgen: on live migration pages are rebuilt anyway, can reconstruct la=
rge pages


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--/PqyDgNKiSkARGk5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmMsZkIACgkQ24/THMrX
1yxyJAf+LgthiM6u3KSBdakLy/fvfO++QMQ2Looxzko/w9+npr9p3atAEnXqkbLf
yjfarMHKdD9ygxA1iuC0cdEWG58TN9yLME1BuQowUDJwEWe3sSrmHAFEYntxhR9A
2ItnEWmnD6x69IsmuX/VBnpjHfGe0FU05rIQmSKaYmkncJ16xPOtes1O0EmauwaT
AyygmV15vUsbIXH1nj/HVxUZtEg3HH/uTB28TKv/UZ+Fm/8F8pnsgLc7dgO/4IAJ
LGWJ2JEN+61CcwT0EpRUT+0n39uu3bctE7BI2E4Ddx98zouqGLoX5QXet0fFnOS6
2MSQx0suTNYMg7KnY9u8/h/QrP97zg==
=t9y2
-----END PGP SIGNATURE-----

--/PqyDgNKiSkARGk5--

