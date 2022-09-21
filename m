Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF46D5C0282
	for <lists+xen-devel@lfdr.de>; Wed, 21 Sep 2022 17:53:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409860.652853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ob22J-00072u-9F; Wed, 21 Sep 2022 15:53:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409860.652853; Wed, 21 Sep 2022 15:53:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ob22J-00070Y-6c; Wed, 21 Sep 2022 15:53:19 +0000
Received: by outflank-mailman (input) for mailman id 409860;
 Wed, 21 Sep 2022 15:53:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9cOY=ZY=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ob22H-000709-Pp
 for xen-devel@lists.xenproject.org; Wed, 21 Sep 2022 15:53:18 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f72c8a8-39c5-11ed-9647-05401a9f4f97;
 Wed, 21 Sep 2022 17:53:15 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 7CFC5320092E
 for <xen-devel@lists.xenproject.org>; Wed, 21 Sep 2022 11:53:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 21 Sep 2022 11:53:11 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Wed, 21 Sep 2022 11:53:10 -0400 (EDT)
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
X-Inumbo-ID: 7f72c8a8-39c5-11ed-9647-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1663775591; x=1663861991; bh=uwrXo0INqm
	9jN6ZIm6RJvUZkVVHPagZuuXSryAI6i/o=; b=LnQ40G7fuJl525ibcaoEs87XdX
	aobPchrUBbhvVTWJLocFjWbUAmYI4lQQ/RrMhZ5BEbH1Gzu+IDzCODnZmtYPf87q
	+zH6lTN4WA6WLoBGD5N8JcDO7ZfvG4kiWBgnNg/kqhsRjnKBhxyJ3M94Y+OFcCBb
	Dv+QLwVXIq8WIzvvClUDsa32n018SgpLs0+FD00JSsaZn99mmhnItQ435d3WHltL
	+bslr3Q3GQmk/1PWGaU2lerm6sTwR4LzW1bmjqc1J0QU8wWiUY5uzIs9i8HoHeSO
	kexl/mn8RtiZLsamAdd6WbCCBPLQaq4UwRy/101tnENL5S2Y1GS4gQtHnBUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:mime-version
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663775591; x=
	1663861991; bh=uwrXo0INqm9jN6ZIm6RJvUZkVVHPagZuuXSryAI6i/o=; b=W
	vabXcVDzhvvvcqsaYHuGz+oTMWZaUkBV4Ll803h9xJ+lAgP62Jmi8u8fPRWmADOM
	FUslE0iglQWeIyveSZ7ICBEsGg9Y7SHedF1y8Ij4jjWEHeT5nRy0+/pcF7ijsfjy
	NNEcXQx89YBLGJw/dcge7jvdN6fIbWHBeot7pxgAF+XpYUCMED03eD2zCcQ1IiDC
	Olvrxco4z99eb8MW3HSk4BKmBRUZi/gB3P0hM1OmpEG07IGwBgZrf0G2o3OFcYtE
	qafnyCqnBPj5g8TbdRWV3O5FEPyINCDBDNu6c8ANgSLxHqvjLh1Ifi6euynzMiC+
	dhcKWLzMvH6FnYp7glg0A==
X-ME-Sender: <xms:ZjMrY66Q9RTLE9p6VQzM3QPNYuSsapm89PVcEjjdJzQYvZZuKFtT3Q>
    <xme:ZjMrYz4K6Rhd-sbL4tSnFf11Ya_WscfMYxBescImc57w2CkfZB5XASgg3xmOBn7hH
    VnQQp26-cCtjA>
X-ME-Received: <xmr:ZjMrY5do9SaDw4gPoTj5jExMUeBIKxl6bqZEesqbqyo6WxgkJ_6YjD7jRAig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefuddgleehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesghdtreertd
    dtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhi
    uceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqne
    cuggftrfgrthhtvghrnhepieffjeeuheeghfeutefftdeufefhieethfehveehteefgfeu
    udelffefffehledvnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:ZjMrY3KejLQtVBS4_T5iPqctEYzetGLBUPTYLHrcZMxYZ15JF5eAEw>
    <xmx:ZjMrY-KmlV9hKlp1Wp9uhheQeWRPTFg40qlw4nE6-X4wKliPKxE8Tg>
    <xmx:ZjMrY4y25XuuzXHNiUTG5HrYgPoDmylfNfrb2uSpgM3S3QXwuwTRZg>
    <xmx:ZzMrYzUj-r8smr0v0PRz-Kt-aCnJrPoW_F3Bim4n9MXQiXUxD9brQw>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 21 Sep 2022 17:53:07 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Design session PVH dom0
Message-ID: <YyszY+qHOVkCTe92@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ao6S49Ltxifgcs3i"
Content-Disposition: inline


--ao6S49Ltxifgcs3i
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Sep 2022 17:53:07 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Design session PVH dom0

Session description (by Jan):
In the course of working on an XSA I had to finally get PVH Dom0 work on at=
 least one of my systems, in a minimal fashion. This had turned up a number=
 of issues, some of which have since remained pending. Therefore I=E2=80=99=
d like to gain understanding on whether there is any future to this mode of=
 Dom0 operation, and if so when it can be expected to be better than tech p=
review or even just experimental.

Open issues off the top of my head: - PCI pass-through / SR-IOV - passing o=
f video settings to Dom0 kernel - serial console (at least when on a plug-i=
n PCI card)


J=C3=BCrgen: PVH dom0 would be nice, related to feature parity PV vs PVH (P=
CI passthrough etc)

George: gitlab has related tickets
https://gitlab.com/groups/xen-project/-/epics/2
When completed, PV could be called "legacy"

Stefano: dom0less could help with PV-less setup
      fully featured vPCI required

Roger: still need to support HVM way of passthrough with qemu, otherwise so=
me devices via vPCI and some emulated for the same guest

Stefano: qemu is not certifiable, should be avoided in cerifiable configura=
tions

J=C3=BCrgen: use qemu for virtio

Stefano: ioreq server needs to work together with vPCI

George: move from just qemu to vPCI may move devices -> Windows BSOD

Jan: no problem with qemu coexisting with vPCI

Roger: some use cases still require qemu for passthrough (HVM), if some par=
ts are special handling

George: GVT-g(?) is such case

Marek: actually, the ioreq server is in dom0 kernel, qemu only reserves slot

Jan: host bridge, root complex emulation currently is ARM specific

George: who is going to do the work?

Jan: that's why this session, no progress, or even patch review

Stefano: there was proposal from Julien about using platform hypercalls for=
 [???]

George: track what's happening to related patches

Stefano: PVH dom0 is useful

Roger: EPAM already do vPCI for PVH dom0, minimal configuration for Q35

Stefano: what other gaps for PVH dom0?

George: see gitlab epic

Jan: hide serial cards - if dom0 doesn't enumerate it, something gets confu=
sed (overlap check?)
Jan: video information - for PV dom0 framebuffer info is in start_info, but=
 no equivalent for PVH

J=C3=BCrgen: use Linux boot config protocol?

Jan: Xen don't speak it

Stefano: EFI services?

Jan: dom0 doesn't have boot services access

Stefano: that was video output on RPi

Jan: do hypercall to obtain the info

Roger: PVH is a thing on firecracker

George: there are definitely more issues, but the big ones are the above

J=C3=BCrgen: PVH dom0 performance?

Roger: it's bad; mostly relevant is qemu interfaces

George: only for safety certifications? performance penalty may be okay

J=C3=BCrgen: hypercalls can be improved (virtual buffers?)

Stefano: litte sense in performance optimization before feature complete

Roger: limited capacity what we can work on

Stefano: safety certification may motivate the effort

George: sell it this way to AMD






--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--ao6S49Ltxifgcs3i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmMrM2MACgkQ24/THMrX
1yxjfwf/fI5zdBJ5aLgIKSJ2mfQRDSXbf16EuVcLUA9iMJMnt/KtiAWLeCe9eiAX
RXsHBoUeTv2tYWUCzzaPzFt1dERv1z0FKzhM2SJFPcuCa1pJeOIlwQYqK9pvNTq/
a23DcwSvjC/Ajm+8WyWrYURc5CbBa0lfXt5bHX03dKGTB7Fa7aaPwICTcoKPl6ID
8dt4QhPRoIz1t+qHjaKRo62E1twolu1P9svCh5ID7XvBjqkjx9kcQdeCpqZHp/zx
bh/akfvynSMt6LodHxpxJYQu6ZR03K+N7Rlvs7vdEkex+BFmod8AhKLtWt63z/+Y
5oz4NUojN8AShLGp4iBkJHG8f7hj6Q==
=vA0t
-----END PGP SIGNATURE-----

--ao6S49Ltxifgcs3i--

