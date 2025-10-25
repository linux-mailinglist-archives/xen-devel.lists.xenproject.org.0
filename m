Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C211AC09021
	for <lists+xen-devel@lfdr.de>; Sat, 25 Oct 2025 14:24:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1151143.1481877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCdIz-0000RK-UG; Sat, 25 Oct 2025 12:23:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151143.1481877; Sat, 25 Oct 2025 12:23:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCdIz-0000Pg-RE; Sat, 25 Oct 2025 12:23:33 +0000
Received: by outflank-mailman (input) for mailman id 1151143;
 Sat, 25 Oct 2025 12:23:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hxaW=5C=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vCdIy-0000Pa-Gi
 for xen-devel@lists.xenproject.org; Sat, 25 Oct 2025 12:23:32 +0000
Received: from fhigh-b8-smtp.messagingengine.com
 (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6871f739-b19d-11f0-9d16-b5c5bf9af7f9;
 Sat, 25 Oct 2025 14:23:30 +0200 (CEST)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 53A217A0187
 for <xen-devel@lists.xenproject.org>; Sat, 25 Oct 2025 08:23:26 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Sat, 25 Oct 2025 08:23:26 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Sat, 25 Oct 2025 08:23:25 -0400 (EDT)
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
X-Inumbo-ID: 6871f739-b19d-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1761395006; x=1761481406; bh=73SxmiYObq
	DtUnuCSzXP/l4C7MXseGGba+KsyngShX4=; b=chwpCb5K2pCAteoqX+3Q5GQyQO
	egCtoG67d4FNfCRpaXudtb2T/4cZ1CNCGO0SYzPT59q75pywgzT9NBn+k6rwCNhB
	W/Vt6uwPsei4eL0mw6OCtnR1ae0Qyd8FD4BrkjrohliLjCTdHtGX5sdl3qd36UxA
	1RrXM/f3goDy64VeQ60QsJEjOAJKYhJblZMLyDCCSTZQLeHVrJxQSH5NPNrJz6tM
	U+WnUn1Pg8AKTJojOkVn2dJlSFcbiWO5pB9qe6kQXbXeW3UcopWm9Lg6JYOIZnCw
	DvcutzB9UWqE6+yVTE1t6600i0wNE8vzxVhoBPFnWi9zGuq0FU+lGAWblXSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1761395006; x=
	1761481406; bh=73SxmiYObqDtUnuCSzXP/l4C7MXseGGba+KsyngShX4=; b=k
	H+v4du/GGzcvfGnkxsO5ZJHKg5xkH3btiIyMmGED+89U/mqXya1R7MRHxOvp1voA
	YHXGEmPE4atGJEZH6cV8DrK9C4PyDjHEP1CyWkrdTAl3guu9XGsvf4z2FEPYnFnJ
	bgsGI8O3npPOWIKFtYAmzthB6ewDg9qXKJKwQnHrSi0cP0FZ6QnhxKfE6sjGfQ0b
	LoBksB9rmWk7iVcoQXDXCHJ+GKc5lcRcnFFYMEL+eY6wH1DmZUcZn86mLUSLJwJP
	0dc6LR6u7j8lly7yrF24fao48antkaoQGfIe1BNY9GQCpmhyHt/wIf72zEjI+90S
	7QbM1yFv6Wd7G4yrEoEkA==
X-ME-Sender: <xms:PcH8aAuMdWCVxZtUTJ6STLQDJYdV8orNCQ7fBdURjV6QhMEPZsAVUw>
    <xme:PcH8aEaXoviO1wFLCqiVgnL1GsbVqCJ_mOPsCd1cxXdNt7VEzT22j2QvraMLUTi4F
    zTrCp9zCbChy_2GXv5GUC4nyaftpre_E8WSlCMWf6zYI-Aylg>
X-ME-Received: <xmr:PcH8aBa4zZXljnHlG1RiHNTOmKGm4IzRceSwrukIBlhtqXCIY7wM1mJNwQZy_rzyNPYuAtfKnsRJR2TvYBvgT2zY-gc0UlStLWw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduhedvvdduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesghdtreertddtje
    enucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceo
    mhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecugg
    ftrfgrthhtvghrnheptddugfetudevudeiveevgfetueejlefggffghffhhfehtdfffeef
    gfduueegfefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdp
    nhgspghrtghpthhtohepuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnh
    dquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhg
X-ME-Proxy: <xmx:PcH8aIWmuMwp4WhrGUM2cJQhg7oByvVAsgqGzHgRiMT2Dh5n10Pr9w>
    <xmx:PcH8aA1a-4muf3hV6XuAPQWL6RFFdAgXX3Jb3RGnSpkKvcChThtjsQ>
    <xmx:PcH8aHbyk572IM0Zqv_iqhbcnphlJSx4fGaBVuAg0AqZju7QYKVqEA>
    <xmx:PcH8aLpJm1iZhBBbtnuvbxUcsGL1c3QVqCW_Lux-XUT13yff6dqEoA>
    <xmx:PsH8aGOAVM0f4GMhP2xMpGnTGguJ9bkZv034gSs9g6Pg9Cwieey2_aBp>
Feedback-ID: i1568416f:Fastmail
Date: Sat, 25 Oct 2025 14:23:23 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Slow (higher scheduling latency?) system after S3 - regression 4.17
 -> 4.19 ?
Message-ID: <aPzBO_eW8mQHM66u@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="A1SV/O2zRZEmtWwj"
Content-Disposition: inline


--A1SV/O2zRZEmtWwj
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 25 Oct 2025 14:23:23 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Slow (higher scheduling latency?) system after S3 - regression 4.17
 -> 4.19 ?

Hi,

After updating from Xen 4.17 to 4.19 it appears that I have some
performance issues if system was suspended before. For now this is just
vague observation, as I don't have much data yet.

Generally, the user observable effect is that audio playback (over
Qubes's PV audio thing) becomes very choppy, beyond usefulness (cannot
make audio calls anymore, music/video playback also becomes useless with
some players. For me this suggests some increased latency in scheduling
- maybe some timer fires too late?

This doesn't happen always, but I'd say quite often after S3, sometimes
may need two or three suspend cycles to trigger the issue. But it's
possible it is also some other factor, like which pCPU the VM gets
scheduled on, maybe? But for now I didn't hit this issue before
performing any S3. I don't have a reliable reproducer yet.

While I write it's related to 4.17 -> 4.19 update, there is also slight
possibility it's related to hardware change (CFL -> MTL). But, it's
unlikely, since I'd probably get much more bug reports about that (the
stable Qubes version uses 4.17, and we have many users on MTL).

What would be the method to collect some useful debugging info? Some
debug-keys (r? a?), some cmdline options?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--A1SV/O2zRZEmtWwj
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmj8wTsACgkQ24/THMrX
1yytNAf8CassPSpe1fiuiTOW9UxqT4+1Sc/TvSG/mYx6P+D268biE/3vqEl8Z5cW
kniCZAg9uxeAoBcjM2qUPyhP0AXxg1P4A4XmGFZG4xm8pdzi+0ezBHn9NNUUg2nC
O1g4dpNpSFGcYCVhl8EyzSnPWqEJaoiOOaJzp8NypM3nP1ARVxBeUJWQDtJFukRY
ceDCCwEWtYP5kWnPpG0M5D4TzMJ4GDTjkYdv7QyK5rR2r3Gr3n17Cxo4uOY2bzVz
8S4bVQq8bv20ALZhxbV4pHY1a+HYj3UpDHwwKoX0EMoDsOiFLBeMJ9zcCHG0TDIA
/5QIG/q7/zc2ZmbXtwsHm3/1n/Az+Q==
=vgOB
-----END PGP SIGNATURE-----

--A1SV/O2zRZEmtWwj--

