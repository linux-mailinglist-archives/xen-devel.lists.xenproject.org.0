Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B4C6E4737
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 14:11:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522025.811138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poNhQ-0008JD-OU; Mon, 17 Apr 2023 12:11:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522025.811138; Mon, 17 Apr 2023 12:11:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poNhQ-0008Gt-Ln; Mon, 17 Apr 2023 12:11:12 +0000
Received: by outflank-mailman (input) for mailman id 522025;
 Mon, 17 Apr 2023 12:11:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YIcH=AI=invisiblethingslab.com=simon@srs-se1.protection.inumbo.net>)
 id 1poNhO-0008Gn-Oh
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 12:11:10 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee31c078-dd18-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 14:11:09 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 14A853200063;
 Mon, 17 Apr 2023 08:11:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 17 Apr 2023 08:11:05 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Apr 2023 08:11:02 -0400 (EDT)
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
X-Inumbo-ID: ee31c078-dd18-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1681733464; x=1681819864; bh=wV1CyrKzAueO3Q0Ub+JKxlmobwzQ6Wd5szN
	iDhr2RRY=; b=aAGRFNpmDru8IQP6U8cJxD0r+63nulegR+IY7hTPK6M4U/47QBF
	6xUMPJXSSMHQ+VZFYo0cwZG3mpFkQ0DS/8ek1/Kdsl6hMTbkISJCN5jKhiGAhdio
	76O8VRGgpi/WWPAQCZrAVDxLvSdGTqQITUQbgcRXzsE5sDejikjaY/otEx3x9R/s
	G/4dmDWdWEIGnNtEQ768SlSHSIxyjBVtvo9EcKygdFdmUgU83axyD504Dal9JiGv
	nGc5FDYrl7ofRFKzeiOhWRROAyGDMBJpAXm6x0pspfAK7+uW0r0QaOnqTTYLEsOl
	icNzV7ZJcsFIYDQRo64GCi61ZluHIXQte4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1681733464; x=1681819864; bh=wV1CyrKzAueO3
	Q0Ub+JKxlmobwzQ6Wd5szNiDhr2RRY=; b=EubID4dbR/4sZkmJCqcjfLhmsTFmY
	0QbIB32GS1kBc5oBmOmEBh9guNm3K43eyn97b2HdnCcvho6Hj0bWTYVBv0g6lWyt
	y1N+ofh35N6r/tMsU11F/T22bM3YdSZuy50etIXnFWZqWpiQ4Cw/fIljbn2jewoQ
	UlNaGN0D+W1D8oaAYZf3ih0qutvQPiQPZV9E1L9ESA46dUxlzRQaFzV7TC/KovMu
	AzXavwAZp5GjkmjjlJ83ywiyzs5LVbUDX46kWNeDZ0n385A4tQQil/5kIWr4ljGS
	wd6NrXcyeCKpcDPilCNeDmD6EpQi2kCprn9QxxhVTh34P8Le6qhMK1XmQ==
X-ME-Sender: <xms:WDc9ZGhTj-0YYVKhNGLoeadKrq_hjruC3CXoOgbNsT-iQZS3GEcHIA>
    <xme:WDc9ZHAPzEYU6YMRhQbgMQfuw7YGcxUtksbR8agHZ5AMvetjl4LSs19OX5lTcd40t
    5BJHi6okbg0VxU>
X-ME-Received: <xmr:WDc9ZOGKYc2MV8dG7NsyKGIMT49JdtC9XhJgYcu11byCvELDO9MjoiJmyDT7ODeODvRpnPMadZeSWmkZYSVCQhqLOw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeliedggeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffggfuvfevfhfhjggtsehgtderredttdejnecuhfhrohhmpefuihhmohhn
    ucfirghishgvrhcuoehsihhmohhnsehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtg
    homheqnecuggftrfgrthhtvghrnhepkeeuffeitdegffelgeelhfeltdefgfeitdevieff
    gefhgfeltdevhefhudfgteevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepshhimhhonhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgt
    ohhm
X-ME-Proxy: <xmx:WDc9ZPSznX_pBxyLN1r8iKOGA4d-liOmKu-iekvQhgpvJyLQHwI4hg>
    <xmx:WDc9ZDybBr-Dq3ZHiCwVdbMTqtItp451Gk9Xp8_TRbuKtEM-GesdRA>
    <xmx:WDc9ZN6cfulhbL2_dEjDftPQb4wgGMQBvEf9vkii_qSaC9ZTux0SOg>
    <xmx:WDc9ZBbDpgj3vY61qTG44LjjqUL8kTX8TADlHU15UEoeLO0NRqgFYQ>
Feedback-ID: idc5945a3:Fastmail
Message-ID: <87a2e249-4dd6-ddd7-680b-dfc21e57e638@invisiblethingslab.com>
Date: Mon, 17 Apr 2023 14:10:35 +0200
MIME-Version: 1.0
Subject: Re: RFC: disable HPET legacy mode after timer check
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <cb408368-077d-edb5-b4ad-f80086db48c1@invisiblethingslab.com>
 <0ac3fce6-dcd2-4521-6207-ede4d90e656b@citrix.com>
Content-Language: en-US
From: Simon Gaiser <simon@invisiblethingslab.com>
In-Reply-To: <0ac3fce6-dcd2-4521-6207-ede4d90e656b@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------a0w7qVAi99JZJ9x0F80MJVVp"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------a0w7qVAi99JZJ9x0F80MJVVp
Content-Type: multipart/mixed; boundary="------------xRuodBTeRS0m0l3XA2JPsUtY";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Message-ID: <87a2e249-4dd6-ddd7-680b-dfc21e57e638@invisiblethingslab.com>
Subject: Re: RFC: disable HPET legacy mode after timer check
References: <cb408368-077d-edb5-b4ad-f80086db48c1@invisiblethingslab.com>
 <0ac3fce6-dcd2-4521-6207-ede4d90e656b@citrix.com>
In-Reply-To: <0ac3fce6-dcd2-4521-6207-ede4d90e656b@citrix.com>

--------------xRuodBTeRS0m0l3XA2JPsUtY
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Andrew Cooper:
[...]
>> It reaches low power states only for a fraction of the suspend to idle=

>> time, so something still makes the CPU/chipset think it should leave t=
he
>> low power mode, but that's another topic.
>=20
> Do you have any further info here?  There are a range of possibilities,=

> from excess timers in Xen (e.g. PV guests default to a 100Hz timer even=

> though no guests actually want it AFAICT), or the 1s TSC rendezvous
> (which isn't actually needed on modern systems), all the way to the
> platform devices not entering d3hot.

So in the meantime I got some progress here.

What helps a lot is setting cpufreq to powersave before going to s2idle.
With that I get residency of about 88 % (everything is still tested with
only dom0 running). Not yet the > 99 % that a native Linux manages, but
much better than before (<< 50 %).

While, based on your and Marek's feedback, I was already looking at
active timers, I first ignored the cpufreq dbs timer since the idle
driver suspend it and I assumed it was active because I wake things up
when triggering the debug key. But turns out disabling the ondemand
governor has a big effect. But not sure if it's the timer itself or some
other part of it.

I tried to disable the time calibration timer. While eyeballing on the
power meter I first thought it brings some improvement there's no
difference according to the residency counters (will need to improve my
power measurement setup).

Other timers I see active:

common/sched/core.c#vcpu_singleshot_timer_fn:
If I understand correctly those are configure by the domain (so dom0
here). So Linux should do this right. But I will have to have a closer
look.

arch/x86/cpu/mcheck/non-fatal.c#mce_work_fn:
Triggers only seldom (something >> 1 s), so unlikely. But will try
disabling.

arch/x86/time.c#plt_overflow:
Dito.

Simon

--------------xRuodBTeRS0m0l3XA2JPsUtY--

--------------a0w7qVAi99JZJ9x0F80MJVVp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAmQ9Nz0ACgkQkO9xfO/x
ly8kHRAAp9lLysWFjmSNsOs5x5zBGrIiiiF7xmOZ4U7UGNlmeN2Olre/5ASBhoQg
fgGQNAvHViHIMVTw4pyb52udCFQnJOTQSoQEQJb67JSA9gWczLK0lsk1K8ikwyB3
oQBUxAF0jaxVctRVb0cgONy23r9XlWl6aWYhjSQ9JqoRjk1qq7fn4JttvzjH8pbM
xuXPhQzs7T2QXn50/S831aROvAfHwicF0sDUVczL9z452QphiPKjjVCJInm/3Lyo
JEYhu0zOXNX/xTKLynhha2gvJQ6tZZEWU91PYoioMcAO6Arxw/aYZUyb0jGCruY1
87UNg6iC6DR3hbqC2gFKd3ocUo3hEHRHKiaf/AcWjv65g+r37WNT3kk0qhCElHOS
293AgA3eCv388msUr7AE/33rdDg4pqiJs5t78sMBYEnei4aKhI/ThruJrd68Jatf
gOM8rVXUXatX/gJJBl6VmyktQV5mw9pep65YdYisrjK5EASoel8BD0fweq3gie7J
ITFSexNPR7AtWPhSZGwqoLNtC5mAp3slAzGLEjavwN3JmA2bT8RCS7omCDVshRut
EmuF768prQAkZses77E02JsrDH5ZeSZaQPuFIpSPsALtERncdVxUGq15BeYJNUZ+
tfJNINQcShJS6Sipegq+pKYkpBYy/rLFU3ZxkFAlSbN1iDkcuWQ=
=rjUA
-----END PGP SIGNATURE-----

--------------a0w7qVAi99JZJ9x0F80MJVVp--

