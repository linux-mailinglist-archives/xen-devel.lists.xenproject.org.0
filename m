Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2B499038F
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 15:08:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810393.1223094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swi28-0008Ma-MX; Fri, 04 Oct 2024 13:07:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810393.1223094; Fri, 04 Oct 2024 13:07:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swi28-0008KO-JF; Fri, 04 Oct 2024 13:07:48 +0000
Received: by outflank-mailman (input) for mailman id 810393;
 Fri, 04 Oct 2024 13:07:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v+dN=RA=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1swi26-0008If-QS
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 13:07:46 +0000
Received: from fhigh-a5-smtp.messagingengine.com
 (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3118647-8251-11ef-a0bb-8be0dac302b0;
 Fri, 04 Oct 2024 15:07:44 +0200 (CEST)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal
 [10.202.2.52])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 8F40911401DA;
 Fri,  4 Oct 2024 09:07:40 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-12.internal (MEProxy); Fri, 04 Oct 2024 09:07:40 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Oct 2024 09:07:39 -0400 (EDT)
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
X-Inumbo-ID: a3118647-8251-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1728047260; x=1728133660; bh=2N
	cX0jHSCgfN9L5WNlnDgOC4yrQEEz7nSps6JqoB5wM=; b=XKhxLBVgreU484AoVV
	+4grawtWitdURDKSFI4TKq4BM8KsHq2EerTWuhdjAqdxKqukJ8yd+IGHK3v14Wws
	oiyX/rrdyJx5SutcLclxxbawjtnBmb9GFzHMeJzbKnIDZhI0so7sf1zmJ2/RxF37
	UxM/6bIgVVrwhttq4XTvzVewmTkfWNK7l3pPPunfBX8qCzuaptSb60QSw3ikb6iZ
	WOmhSZlyW4CrzA4dnFKNCYidTeaLOOXAd3tSWZdt2pCFa2DKPSBk9p/y8bGj9CUi
	rL5mbOzH8wr3LKXTzsfpVGZDMikTDG9jdQn5i3eTF7+foz72nx7mY5N0BaPOP1Vz
	lb/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1728047260; x=1728133660; bh=2NcX0jHSCgfN9L5WNlnDgOC4yrQEEz7nSps
	6JqoB5wM=; b=Wq271bZ5E+KJNPv859vGqmFT/oyz+WLzU7mrjoqdWx4wKvdhBQQ
	9D827EZeYJdLcLU7WpHdxVp4CFX7dTXwi+9+l5L3YYKt6HX5KE8/B92P2ZXuadNd
	AQIwoPniBLSs2YhzLefupR7vg1akHHrNgvko4w2nDzVOtG56nzSrBZnRHP0AtPNU
	ZJYDqOJDcervuL4QxxRPZWI5N3Eiq3JuDneqOWLIh45HXey85sTeUBxrcGL4pZo2
	tStuJBQBbP4qThTC7agHEmTuUuKknSVIb3T5CKunDNvcGoOCUsY2tYdVL7LgR8w0
	glZLjd0t+MYimN876pFkDV6YB0H+5ZW89Hg==
X-ME-Sender: <xms:nOj_Zvm55qxJPUcCQzq1FaUANE0JsCg0-Qax43aryIkhmKWeIPEa7g>
    <xme:nOj_Zi0B1ZAUAQlgFlytav-oG9zpb93mmhdpvhCGjUIo3yg_35_vk0urg4JnOhJEj
    LRWOKUuZyQ_IQ>
X-ME-Received: <xmr:nOj_ZlpGnBzEfVKZzKjq1F5g4ll5TvrRMBbvqy9uQL1qcH2t8p-EFZ-IAuOb71VM4Agrt37GWCEY2dtgiIxOF9hWkqfN0Qu3cg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvfedgiedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvve
    fukfggtggusehgtderredttdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohif
    shhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefhteeuhfeigfdttdelgffggfeg
    veehtddvfeffuefgieeiieehfeetfeeggfegjeenucffohhmrghinhepghhithhhuhgsrd
    gtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    mhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspg
    hrtghpthhtohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepfihinhdqphhv
    qdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhope
    igvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrgh
X-ME-Proxy: <xmx:nOj_Znk8msFTmSN9K2zLBr7YBmHh0-rAyTup32WyNANEk5mPtZ_MLw>
    <xmx:nOj_Zt050OrRRa5MVn3HnR6t_VqR7hT8waZ9rPiWuVpqzr7C2d61tw>
    <xmx:nOj_ZmvNR426XrYQjInQD0e2VvPP4eW6E41vmpZsg7ZibebhDrzYwA>
    <xmx:nOj_ZhUqYkVv7wqLXIbxhHcytKOISYav3Rm4qkWfZfwFtlWfxPByJg>
    <xmx:nOj_Zu_9RMABc7wuoSSc0vm0Lm-aLk5qxKZDrLn-5y2J6U2Ui7zT2Bek>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 4 Oct 2024 15:07:37 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: win-pv-devel@lists.xenproject.org
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: xenvbd driver modifies in-flight data?
Message-ID: <Zv_omQjCFbw8sQRb@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1K61LwtFAmappi+0"
Content-Disposition: inline


--1K61LwtFAmappi+0
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 4 Oct 2024 15:07:37 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: win-pv-devel@lists.xenproject.org
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: xenvbd driver modifies in-flight data?

Hi,

I've got a bit worrying report[1], that using Windows PV block driver,
together with backing file opened with O_DIRECT on BTRFS results in
checksum errors. At this point it's unclear what exactly happens there,
it could be some BTRFS issue, some xen-blkback issue, but since
according to reports it happens only with Windows DomU, the most likely
culprit is PV driver inside Windows DomU. It was detected on BTRFS
because it does checksumming, but it isn't clear whether other file
systems are not affected too.=20

I guess using O_DIRECT is asking for troubles here, but nevertheless, it
looks like it might have uncovered some issue that would be silently
ignored otherwise.

[1] https://github.com/QubesOS/qubes-issues/issues/9488#issuecomment-238915=
2014

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--1K61LwtFAmappi+0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmb/6JkACgkQ24/THMrX
1yzZ0Qf7B6Xl0cPD5MjF0AAuw6NLe7U9/6s9sypNh26znx1dLLgB230Q0firIM3Y
5BKOFOHqqw1nZ5t1h4QyArfe0y35Mrrx+0iqJUR/8p59J+hnxESNNIwuTax9y+ZC
OnYR/gSD8n82pSXj0LW7CwB600CRcanoX0A9RFZjiN3jGcch670dFtJ55uXFJF7M
QY98JiKsCoFQftkWYOmQANyez4AJDkxJiyinUKkMSqW7az3cTTWm6w/3lh4bnPKi
GJO5lZQS6ADqCvuXbgyu9TgcLqZ6cCIKi6EKvT2VoyTMULsoUdpOk+ahKKqL2OVg
DH/zEvSh1t+xjCK6W7sfC9mdvIe27w==
=3dN4
-----END PGP SIGNATURE-----

--1K61LwtFAmappi+0--

