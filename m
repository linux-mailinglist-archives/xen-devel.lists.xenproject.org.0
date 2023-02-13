Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EFA694431
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 12:15:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494371.764414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRWnQ-0002uz-2F; Mon, 13 Feb 2023 11:14:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494371.764414; Mon, 13 Feb 2023 11:14:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRWnP-0002sG-VJ; Mon, 13 Feb 2023 11:14:55 +0000
Received: by outflank-mailman (input) for mailman id 494371;
 Mon, 13 Feb 2023 11:14:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c9jb=6J=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pRWnO-0002sA-Ps
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 11:14:55 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1846ca4-ab8f-11ed-933c-83870f6b2ba8;
 Mon, 13 Feb 2023 12:14:52 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 64FC45C0090
 for <xen-devel@lists.xenproject.org>; Mon, 13 Feb 2023 06:14:49 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 13 Feb 2023 06:14:49 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Mon, 13 Feb 2023 06:14:48 -0500 (EST)
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
X-Inumbo-ID: a1846ca4-ab8f-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1676286889; x=1676373289; bh=2pPy/nkWBs
	pmeK2LkD1hV1s6LzYbozDlDEjpya7pepI=; b=ly7fbWCyyKlvyYjOPTO+/77EQo
	R6LorCs5v3Msc2iF9DjEjuJZTh7nkyRPbBbJki9VWrNo/uR+w8xTUFiR0B28Q0UE
	gxkpqhmngSN1V1tqjLysOWZtCzhAm92XCXkp5u5Jt0BkbKc62eTy1ibnPFjrEl8X
	IjsGlDYgU2XlrBv7nTOR+kAMfgLIjDwB1s9kVYxfI7ti6YkBLs3lbfuUKdw2OVsN
	KK24m3EOKQm7w9cw7bR6YHTQbg9W1xCaHxTIk/giouD8UhFqvCldviQNMsgJInt4
	c0EspIhLu20GeMxVHoS6Kx44oG7Zu/HivGxJ4bZ5tkdpEpoyXWY+Im8VXBjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:mime-version
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1676286889; x=
	1676373289; bh=2pPy/nkWBspmeK2LkD1hV1s6LzYbozDlDEjpya7pepI=; b=G
	2GuprV1hRYSrPJtrKFb1Uk6QlRwS1xXeeyi9vOk1rAx4ixgK3Y9h/EcjOw/SNSRh
	6stFs7nE0+FwevCpYTj3zcO2QTz3HFbRE4BEFWhx0FdwKXQbgZkqVEcXHcv5Kpxm
	EydMqSqRTJ0Ox+8hq2805Hc1ojG+j45kUX1eR4ryG9dY+QL5ZwdfFSSq+HDEYKK7
	1wZRYult/iOcYPQYQKH6SadLK7jm6AkqNgilbIghAWGRPleK3FiggTsZRdzrXsja
	AwAyY2zjRY4AzrR6JdOfhT24PadgF1pg10AwMIlZv9vEX2U4WIbuUCGpsdPYUmcK
	mILiZiR+sHGul1dVEueyA==
X-ME-Sender: <xms:qRvqY9Yn3MwgDLk0YPcRv_wG85Yay7irgM9dW4YIAJWo9C6YGr9f4w>
    <xme:qRvqY0ZWxZoToqFGpq_7me7twlYOXH1LqO358g1xdJAbUEIHoKpQKnEC3SPoLb0eE
    __rjGA6l_pCjA>
X-ME-Received: <xmr:qRvqY__3cGXFj1hzaHcWwzHW75lNElNtVOfdszduTYIRAORs2VbddY4YYgU4Q06r2wdljfANIKoFhS6Mi9uvx8KpFtIh9KsEl8k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeiuddgvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesghdtreertd
    dtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhi
    uceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqne
    cuggftrfgrthhtvghrnhepvddviefgjefhvddvjeduueeihfdvvdffjeevieektdejueei
    ffetffefieethfefnecuffhomhgrihhnpehquhgsvghsqdhoshdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:qRvqY7od4LX_dAfj_hQwtLIkSVvT_w9ZB5SQLt-A1-vYb2Gbt_mEyg>
    <xmx:qRvqY4qI3bqORjIDRmU0mHTty0Gwas1VRAl_8ae1SWqrN7-4BHlRxA>
    <xmx:qRvqYxS7HaWBj6KTTsbNnSLLbe-bsjJyR52a1tTiEKONW6DReTVV8w>
    <xmx:qRvqY113XV1VDxPKMqHyg2UNfaeJzd3NSkBJfVRMooRfh-nYdT0EiQ>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 13 Feb 2023 12:14:45 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: xen (multiboot) binary gets corrupted ELF notes
Message-ID: <Y+obpe5nnLybL/8y@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dVeArZAaTGNr5ot0"
Content-Disposition: inline


--dVeArZAaTGNr5ot0
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Feb 2023 12:14:45 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: xen (multiboot) binary gets corrupted ELF notes

Hi,

I'm getting some ELF note issues on multiboot binary
specifically:
xen/xen: ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV), statical=
ly linked, BuildID[sha1]=3Df7d2c37a4ad599b268f2f2d94bff3776d12649b3, bad no=
te description size 0xc0010001, stripped

readelf additionally says:

    Displaying notes found in: .note
      Owner                Data size 	Description
      GNU                  0x00000014	NT_GNU_BUILD_ID (unique build ID bits=
tring)
        Build ID: c5825a0d08edc4d11b1138fedca6b14ce8ba7302
      (NONE)               0x00000004	Unknown note type: (0x00000020)
       description data: 05 00 00 00=20
    readelf: xen/xen: Warning: note with invalid namesz and/or descsz found=
 at offset 0x34
    readelf: xen/xen: Warning:  type: 0x4, namesize: 0x00554e47, descsize: =
0xc0010001, alignment: 4

Grub doesn't care, but launching such xen with kexec doesn't work.

Initially found when booting Xen via Heads: https://openqa.qubes-os.org/tes=
ts/60151#step/install_startup/11

Andy says:
> yeah, I've seen the same on XTF
> binutil's recent elf notes for CET compatibility use an unsigned long
> so they're not compatible when we build as 64bit and then re-package as 32
> I think we need to strip all elf notes in mkelf32

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--dVeArZAaTGNr5ot0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmPqG6YACgkQ24/THMrX
1yz2sQf8DiPk02lMWZw13na//TKTCOvhhpeMlAGQUshmnXuaB7LcR2naFQw5owmW
ayMzzF6p5ibGd4HPrM/9xDhtnaN5PpEVy4xG0OgSiBrCIqftMujcv91VIiofmpBW
uGwr1niDQvoVCCNA2ziX2s4HDa8PlFmvrFi9GLJd7sis/8IaeT1zmfuosvAE0exV
tkz7ARNnxkyzeYtK5eE593463xDXVSsZw0U7Fs+GAjfNl/DNBYhvqny9oD8ytFg3
b17MUX9RAztQUEzqDLVoQQWsu02TByLQpaTIiUdObQNodtdjWhPpie2zcG0KRaCb
iMd4638oBX5pnvGKSf2HeeZFyQTLbA==
=FEtz
-----END PGP SIGNATURE-----

--dVeArZAaTGNr5ot0--

