Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3099858B8A3
	for <lists+xen-devel@lfdr.de>; Sun,  7 Aug 2022 01:02:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381969.616831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oKSnr-0001hI-Ct; Sat, 06 Aug 2022 23:01:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381969.616831; Sat, 06 Aug 2022 23:01:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oKSnr-0001ei-9I; Sat, 06 Aug 2022 23:01:55 +0000
Received: by outflank-mailman (input) for mailman id 381969;
 Sat, 06 Aug 2022 23:01:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xclA=YK=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oKSnp-0001ec-NV
 for xen-devel@lists.xenproject.org; Sat, 06 Aug 2022 23:01:54 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfd7ee7a-15db-11ed-924f-1f966e50362f;
 Sun, 07 Aug 2022 01:01:50 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A14465C003D
 for <xen-devel@lists.xenproject.org>; Sat,  6 Aug 2022 19:01:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sat, 06 Aug 2022 19:01:47 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Sat, 6 Aug 2022 19:01:46 -0400 (EDT)
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
X-Inumbo-ID: bfd7ee7a-15db-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1659826907; x=1659913307; bh=ZBKQSKRMMC
	mzsCJlk0Mfty7Sz0g/6zAg7aYoTXrsjGU=; b=qVOMpX/anhdm00NRyWT6dbQT1W
	IgR9lZJQsQXYfg4Y8YN9py5Vdk0tP6Bwynw5rwqf2njUJPDDKndqpHhHK5wGNIWD
	oHNwPijFef+nLvZ1wxXAUisxZvyFpMS99z0D9ZgHKjCCj07IuVURTaVzgzIz+qip
	Vi93BSPILObRNpDvynTcVgtsgism0eeQKv8e8qThKPpOb3uT9CRxK67KrnD3t01A
	NFJmNyLR1HtDJjvX2aTM/bPn2cHCexpQ+Bs7rkmk8/yMhdtNUkwPas2cTSc3lnId
	/tx3i5p42AFL8O2W3Y4144HACnMD7NQATwCZwTHM4X0Di2kZRQkY4yDXgzNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:mime-version
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1659826907; x=
	1659913307; bh=ZBKQSKRMMCmzsCJlk0Mfty7Sz0g/6zAg7aYoTXrsjGU=; b=T
	fQaZsNtQYR9jjqKpyAQfCT7zqRapOxodeMAnWuANai484reW0ihyqBdLGBC7/HiI
	F+qcUVquBZlpDnAnjkYbvOTx3tq1lytZPVzbszJgEgZfH9gLEeyVo6SUiE4o5wHK
	uSUFYP2ECAb3wnO95INX5ZA82x1N6qPFZayHYEZ4idilbFixP/1XDfPijIZicY+o
	vrg823Dhf1MZ93ana1zNKo3ShUjhsesogK0oYnDapxOOD/nbPPZQUmaqg8TODK48
	FaJ62D1yP5YHMVSO76wws9Q/zUnJfdcLicWm5J7xcbeJzs6LGHc3CzVy0L5H8KKx
	0Yo0Y+oxsExLUO9RQ4E0A==
X-ME-Sender: <xms:2_LuYgXb0geHlNcTSVTcdHcKz3P0md5F7y35c6059WATwYHrzmFmHA>
    <xme:2_LuYknbH0z8t7v4g8tfgwxZUgDX6uOAr6Fiu1h1tAK-MMQwW1C6cHtR7NUH57z73
    22WQhPpUxoMcg>
X-ME-Received: <xmr:2_LuYkZMQHW7n6LiT_jh3W8eESto4KMQ749tzjf4oCAYhDm-WzVEwCO35sumEyN3W2t4v8R_EBClm9A_DvpGlc6teyBHwG6RVgQL>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdefgedgudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesghdtreertd
    dtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhi
    uceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqne
    cuggftrfgrthhtvghrnhepieffjeeuheeghfeutefftdeufefhieethfehveehteefgfeu
    udelffefffehledvnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:2_LuYvXJUvq2xTkj0sf7-JMgxUTTXJd5MDJQ3JoyARMlaQjmanfwaQ>
    <xmx:2_LuYqnf0da0zJKNyphZUlRmvb2kJ8pfqlKfjasQJERLK4AU13XMQQ>
    <xmx:2_LuYketAEV_Re3U6S1Qm1Dzl0bi1wP8_UmcTc1nKieXVbHgP1I4Lg>
    <xmx:2_LuYmzBP0f1S8Tglp8RJMDDZOKqN0XS6RQS843cGK0TfUsvjUWS5g>
Feedback-ID: i1568416f:Fastmail
Date: Sun, 7 Aug 2022 01:01:43 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: getting gitlab pipeline status
Message-ID: <Yu7y2LoNMI4wyUxb@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sUYoUiAsqHeLhFU3"
Content-Disposition: inline


--sUYoUiAsqHeLhFU3
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 7 Aug 2022 01:01:43 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: getting gitlab pipeline status

Hi,

Related to an IRC chat few days ago - here is how to get gitlab pipeline st=
atus:

# get latest pipeline of a branch
$ curl -s 'https://gitlab.com/api/v4/projects/xen-project%2Fxen/pipelines?r=
ef=3Dstaging' | jq -r '.[0].status'
success
# get latest pipeline of a commit (example of success and failure)
$ curl -s 'https://gitlab.com/api/v4/projects/xen-project%2Fxen/pipelines?s=
ha=3D6d6aee437e37fced0c49be97e08c30da873690fc' | jq -r '.[0].status'
success
$ curl -s 'https://gitlab.com/api/v4/projects/xen-project%2Fxen/pipelines?s=
ha=3Dda74c951e4e58080583daaad373b0d38a3f8bc83' | jq -r '.[0].status'
failed

Documentation:
https://docs.gitlab.com/ee/api/pipelines.html#list-project-pipelines

If making osstest push gate checking gitlab pipeline status is desirable
(IMO that would be helpful), the above should be enough. I'm not fluent
in osstest internals, but I hope it isn't too complex to add such
check...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--sUYoUiAsqHeLhFU3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmLu8tgACgkQ24/THMrX
1yxqoAf/Tuy3V/IQV11rTFuWQ6ySIODRL7dtD6mMPc+nQRd+lRXv5uGTYFUuSEo5
YxhYMCupEBeudgJtO52eYgOvbp+q333ETF2nJiuKfATi5lasAlV3U4F0YlYyrSGB
6eJ8KnAViTdUMH6pZXZDuM02sAEdoRyZuc5Rzkjpun1gfoMk2g67+/c156vIRbjY
8ktxd6X0fk90loiInVyGQbBr317weBNbKsdGF/VbvbFreGrkf+QwIsY37UqceHAq
N0Rb04hSxNu8XBpcleqb8X5Lg0Fi5aYAYUgXZrE9jwKKD0MTsbTaib2Kax0tVlvk
9ycYS+VHwlLWd20GZ6WVZTD6MQjafA==
=K/6z
-----END PGP SIGNATURE-----

--sUYoUiAsqHeLhFU3--

