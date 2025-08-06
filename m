Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A46B1C432
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 12:24:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071564.1434991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujbJU-0008SP-3l; Wed, 06 Aug 2025 10:24:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071564.1434991; Wed, 06 Aug 2025 10:24:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujbJU-0008Q2-10; Wed, 06 Aug 2025 10:24:04 +0000
Received: by outflank-mailman (input) for mailman id 1071564;
 Wed, 06 Aug 2025 10:24:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G2Yn=2S=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ujbJS-0008Pw-H3
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 10:24:02 +0000
Received: from fout-a8-smtp.messagingengine.com
 (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7712d689-72af-11f0-a322-13f23c93f187;
 Wed, 06 Aug 2025 12:24:00 +0200 (CEST)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfout.phl.internal (Postfix) with ESMTP id CCFB8EC0182;
 Wed,  6 Aug 2025 06:23:58 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Wed, 06 Aug 2025 06:23:58 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Aug 2025 06:23:57 -0400 (EDT)
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
X-Inumbo-ID: 7712d689-72af-11f0-a322-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1754475838; x=1754562238; bh=Wz
	wHwkzc50ERBeJ6ZeKJqSpHzrrx9f+t6zaJsJmt9H8=; b=sqHlOQhbQp443K7LFr
	LxLE+YzW2ixgAe7ac0mXb7Lkjj9LeLVclIuMCI+Z61KGfg1jpHj1bMrc+u98K5/X
	d2AXh27QaRvVjPY4foGQI5wXulmXcQBI5WKVtTnLSbyQ+Sk8npWz3NWrNljKhenw
	ppzfEeT5KNJmDSlfKWfNw7coJWq12utLSa31sovRqHaLw0dz0C6H9VEqb/7qFxjj
	tuutbq8p3k4vDWs+/u7E/nN/BlwJX2fkzUGcQVySR7ykiEufFEQBDLS6pdgDAdqe
	Z6um3DQAqK0PSxrbm+QQkgEw7Ci0cKvoxC/ulStp+wdkZoboHJ13OQferzoYtPdu
	Ml1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1754475838; x=
	1754562238; bh=WzwHwkzc50ERBeJ6ZeKJqSpHzrrx9f+t6zaJsJmt9H8=; b=G
	o7PvN0jDlLmQ/XRffKkUUuQ3NI8m1y8ZcODy/G14tToBBah2Eqlk+0LN2knXL5du
	cRLt1wMzlEurMb2SgD0hPWB3gAt6GIQu0ekLI2UuDnOynWaKGJr8pHgSjSgYiaBt
	qgaOxVDzDoGU2BfxLroctOYY/BM3R/K+XA5uAuzyb9fB9CIODhxtTJdZ40PpoHcI
	S8rBlMWFkbP+25k/EcwE3DlgmhRGEfSKqNmki0tjuWfCVD9kGHqub8cUmOqRpqNn
	K926u3pmCQSki/UKjjVt7P9YA3FmDIaKNJd3bbB8AypHSmC7pCWjY5ge3ZpbmINC
	+yQ0RNTHt0rEFoHr/RzWQ==
X-ME-Sender: <xms:Pi2TaHYyP0ut2vte9PIUublszpeFFm-RJkmGE3vKxfB3bHSq-71utA>
    <xme:Pi2TaGl2T94A8svCSuJKWJt4Ng8Uwc0q52rgkSrJ_kNa-CPFLWXJ4i4u9jRd4zKWD
    tFYixMEKPV_Yg>
X-ME-Received: <xmr:Pi2TaLwJ3mq8Wo4gVNSbTzeEixBtPpGnuK_t6Tyyfkq21yxRwSVb6WZRZtbAoBVjBxH-7c1z7gCrY_V4--UyY8qn0SuQIylAALw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudejkedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkgggtugesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgr
    rhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhephfetuefhiefg
    tddtlefggffggeevhedtvdefffeugfeiieeiheefteefgefggeejnecuffhomhgrihhnpe
    hgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
    gtohhmpdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    peigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtph
    htthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhm
X-ME-Proxy: <xmx:Pi2TaMOKX-jnYJidwHFUY-fQ7pKjUYDKMPaoT8X_w8o8un_OTCBoRA>
    <xmx:Pi2TaHQytWox1tmCCEPYbWXmGtjve2Ug0JkLwHvj7YJpsA_N730jzA>
    <xmx:Pi2TaCZm_zDbX_Lsr9UJ-gexi6nNVjVokel-9MXt-3zNeyGUSI47wQ>
    <xmx:Pi2TaM2ZXiNv5xa93v5oGOOwtNlWsOKnobGgTSxQ0UvIHBoW5lTqEA>
    <xmx:Pi2TaJLEA3s-Ex-x4tZQaQ3OTJT2z-PeyVQ_z-N9FApGbwxnbC-lEoNK>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 6 Aug 2025 12:23:56 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: S3 regression related to XSA-471 patches
Message-ID: <aJMtPLNqQFbGg5cs@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="COT8wTur3wgaNPW/"
Content-Disposition: inline


--COT8wTur3wgaNPW/
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 6 Aug 2025 12:23:56 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: S3 regression related to XSA-471 patches

Hi,

We've got several reports that S3 reliability recently regressed. We
identified it's definitely related to XSA-471 patches, and bisection
points at "x86/idle: Remove broken MWAIT implementation". I don't have
reliable reproduction steps, so I'm not 100% sure if it's really this
patch, or maybe an earlier one - but it's definitely already broken at
this point in the series. Most reports are about Xen 4.17 (as that's
what stable Qubes OS version currently use), but I think I've seen
somebody reporting the issue on 4.19 too (but I don't have clear
evidence, especially if it's the same issue).

The problem manifests in system freezing on S3 resume. Sometimes it
manages to show the screenlocker password prompt, and sometimes one can
interact with it for a second or two. But then it freezes, mouse stops
moving etc (but no reboot).
One time I managed to get pass the screenlocker and interact with dom0
for a few minutes before it frozen. Resuming domUs didn't happen (the
qubes-specific script doing so resume hanged), and also no logs
persisted on the disk from this case (on disk it looked like it never
resumed). Generally it looked like some CPUs were stuck.

It appears to be more likely to hit the issue if some domUs are active
at the suspend/resume time. While Qubes OS does suspend (not just pause)
them for the host S3 time, some activity before/after does appear to
matter. My test case that has ~30-40% reproduction rate involves several
firefox instances playing youtube videos.

I've talked with Andrew about it a bit, with not much conclusions.
Initial reports mentioned only MTL and RPL systems, so we focused on
something related to weird topology. But just today I've got a report
of the same happening on KBL too...

Another observation (possibly invalidated by today's report...) is that
all reports were about systems running Coreboot (but not only Dasharo
flavor - at least one was Star Labs).=20

Most reports are collected at https://github.com/QubesOS/qubes-issues/issue=
s/10110

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--COT8wTur3wgaNPW/
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmiTLTwACgkQ24/THMrX
1yyHJQf+NGvZq6zdoaRqoLAZSueUHcTZ5WGaaKlgRz2tmEEj2Fp1Cj5lPfeXnGgz
+4N3mdKYpeRRlz7R1+MbRsmhcc2c5gnVIxmLzf30nopNN9HXfBdb7sBmmBwgvHvb
LGjxnoI6RafMNBrVChHk+Ya9hqb9O1ACGQ2eq/Syut73V6sMQHGvi6gJjO0ce46C
7FpuDhLJAbd3NKz04eVy/vH9c6j6PaAmXsKoIaATYdzK5EUXg/UkjROsPOCpel7P
VUN5FYgEHQLTmJ7+V4qMwcuBKVycLke34PADgmQi0luIokkIEpg4L7nBTkhgDisf
eppTdW7De+aJY7EUZMa1nFSrdzyJ5g==
=OZV8
-----END PGP SIGNATURE-----

--COT8wTur3wgaNPW/--

