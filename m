Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E5B52D140
	for <lists+xen-devel@lfdr.de>; Thu, 19 May 2022 13:15:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332847.556621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nre6h-0002M4-Ew; Thu, 19 May 2022 11:14:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332847.556621; Thu, 19 May 2022 11:14:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nre6h-0002Ia-Ax; Thu, 19 May 2022 11:14:15 +0000
Received: by outflank-mailman (input) for mailman id 332847;
 Thu, 19 May 2022 11:14:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hz7M=V3=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nre6g-0002IU-4K
 for xen-devel@lists.xenproject.org; Thu, 19 May 2022 11:14:14 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cecfb5a6-d764-11ec-bd2c-47488cf2e6aa;
 Thu, 19 May 2022 13:14:11 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 6BE785C01C9
 for <xen-devel@lists.xenproject.org>; Thu, 19 May 2022 07:14:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 19 May 2022 07:14:10 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Thu, 19 May 2022 07:14:09 -0400 (EDT)
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
X-Inumbo-ID: cecfb5a6-d764-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1652958850; x=1653045250; bh=e7UOwb51ZR
	vIfzKcwBFx4l4oCIv0K678V83oOqmAH5U=; b=ap9d34GdSYzsCvoI2rBj6BlS0T
	Njtz5R5JPtqciNV2SU0PktzffvVeaH9y60/v68jvUvakxsPEKyFAe96c5KjhxGdE
	shNfR9ZBCauVh1GailTJy18k9D7rrIkDH7drpHQOGJrdGoWk47FydAsg1vZpBrP0
	QDBwYTE1kTYRpU4QSq3wJtb7GNYMRl64YeuEkuC/MzfKqdYj24o0KPioBPrLnE77
	ioYZXpdQ0GAdJU4cUnIzRSiy7IT2WtzyrjfU1lLYeESpNagujzhbpjakTf+uTqRW
	z8VKZxAnDPME42Tg1fmKTFV4Sj5jZu5PfoF0jvjlz1ho3xK6LJv5+FZcIBzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:mime-version
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1652958850; x=
	1653045250; bh=e7UOwb51ZRvIfzKcwBFx4l4oCIv0K678V83oOqmAH5U=; b=K
	kVw1cjyD4A6agmrj5HjWqclNuM3bOD8CXGBSwzW7iOyQzrbGh8d+MBtem65s8XS2
	v4tAvlmtsFnWez7eb0Rxz3GNieg6CDkzMn8MFD1iLiBLOvuGxH8x5c6ozIJ1hGvM
	de7ZLDikUiFKejYqAQOKzd92w4uTfQc82E3cMAUy7uQq0gasRaMznBVuWcWibN7w
	fB47rLJbQ9Rh4ZXIYVrzEmBxishLpBJZ4bInxBpUPqQGBVJd7GTsWid6aU4g7vWR
	IPyIsNMT8SG8r/G4Bt+MsVR2TrdXpIGRDzssXvFQsqcHvgaqWhKukeFZJQt/PYnD
	pPUeucXXRkG3AASVKjRMA==
X-ME-Sender: <xms:giaGYoBG-CY4aEwEEa9C_ZebD82OemG7lf3gIdvJawvrQVcO94mk4g>
    <xme:giaGYqggA-2mf-b9W5-A3TAOiuS962nL4bUB3uZsskNpLocmRSOd9ZjFKq0eH0qba
    pzEuV6QdAbW2Q>
X-ME-Received: <xmr:giaGYrkv7HtRvIoitGBwAveaIP21PIw_ToP-YdyWHo0ZEjMgxdWzoiQf6ESHJGOtfmqjfu12Xdu01GA4iMKD82ucfyAxmX_yPw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedriedugdefjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfggtggusehgtdorredttd
    ejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcu
    oehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvueehheeitdeuieehgfetfeeuvedvteeuudeuheekvdefgfei
    kedutdegfeejleenucffohhmrghinhepqhhusggvshdqohhsrdhorhhgnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:giaGYuzz36drwbL-IXUHachuQxq3u_52j6H2p3_EwcKnS8h2vo422w>
    <xmx:giaGYtSnVHGjSELU7HkHiTwyIk6cL5vVtZmC5JmIU0I9DRVrQlWuTQ>
    <xmx:giaGYpaJKmBu_pcHi18bZzw-X2GbEuMzsgxsniz9xnzHh66RpdIvSQ>
    <xmx:giaGYkcBm3asxx3X0hvvzWnvWQ1re6zYXxG4r1CRr1l1zIOmN5u7ig>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 19 May 2022 13:14:06 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Showcase of openQA for testing on physical hardware
Message-ID: <YoYmfqdAPSmfhjSz@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HcZLkqUjUk/HWt8t"
Content-Disposition: inline


--HcZLkqUjUk/HWt8t
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 May 2022 13:14:06 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Showcase of openQA for testing on physical hardware

Hi all,

I have recent-ish made openQA to run tests not only inside KVM machines,
but also on physical hardware. The setup is described here:
https://www.qubes-os.org/news/2022/05/05/automated-os-testing-on-physical-l=
aptops/

The live instance is at https://openqa.qubes-os.org. Tests running on
physical machines are marked with "@hw(number)", but from outside they don't
differ that much from virtualized ones.

This might be interesting for you, in context of extending/replacing
OSSTest. I think the above setup is an overkill for testing just Xen -
in my case the goal is to test mostly unmodified Qubes system, the way
the user would interact with it, but for Xen, running tests over SSH
and/or collecting output over serial console should be enough (you don't
need all this HID emulation, HDMI capture etc).

openQA provides nice way to schedule tests on various machines, a
utility library for writing tests (most of it is useful for GUI tests,
but still) and then collect and present results. It's main use case is
running tests in virtual machines which is visible in few places (much
more flexible scheduling, if you can take a disk image and connect it
somewhere else), but running on a bare metal is supported use case.

BTW I intentionally decided to build thing to be tested elsewhere -
gitlab specifically, and then provide it as a test input (there are
various methods for it in openQA, mostly using URLs that will be
automatically downloaded).

I use subset of this setup for `git bisect run`, but that has more to do
with remote power and boot control, than openQA.

Currently I only run there Qubes-specific tests - especially only
Xen versions we have packaged there. Running tests on xen-unstable
(master or staging) is complicated in Qubes case, because unstable ABIs
force rebuilds of several parts in that case. But I guess testing just
Xen with its native toolstack won't have this problem (and you build all
of it in gitlab already).

I'm open for any questions about this setup :)

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--HcZLkqUjUk/HWt8t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmKGJn4ACgkQ24/THMrX
1yyL6Af+PEMr5t4A5eO7UcFS/2Bumi9lBqUUcy5iRrDTBqems4AF3pT/StIdg+ly
l6GL+em2mljCDVMg7EcXhb+CduofZ2UmZ9QfvKc6zwKrINeOyTKCxNTMyxX038I/
WSoD51pxSP7G0D/fR6I8D1fSqsNna9h2rvJ6k5qogDraNUx5+C4Dxloq2OORsHP7
8MUXfjqLD6Nh7s+xoi1R0T4ViHtglDF562odwh1Dt2ndIA+LJyptutWDb5qkocKN
xl7BrweSDFtxNy29EmP2PDCooyXbbbAGnC15Fq6Aek/wwzWmEDT421drA4DznFA4
vt2W52nEHIHMwKgZUdVysUfhJjZ4sw==
=WZ1e
-----END PGP SIGNATURE-----

--HcZLkqUjUk/HWt8t--

