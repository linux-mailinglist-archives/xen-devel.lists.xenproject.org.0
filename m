Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DF1610E4F
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 12:23:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431891.684549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooMVe-0001wD-Pr; Fri, 28 Oct 2022 10:22:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431891.684549; Fri, 28 Oct 2022 10:22:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooMVe-0001tJ-My; Fri, 28 Oct 2022 10:22:42 +0000
Received: by outflank-mailman (input) for mailman id 431891;
 Fri, 28 Oct 2022 10:22:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IcqW=25=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ooMVd-0001tD-0L
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 10:22:41 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71945715-56aa-11ed-91b5-6bf2151ebd3b;
 Fri, 28 Oct 2022 12:22:38 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 7346D5C0073;
 Fri, 28 Oct 2022 06:22:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 28 Oct 2022 06:22:36 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 28 Oct 2022 06:22:34 -0400 (EDT)
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
X-Inumbo-ID: 71945715-56aa-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1666952556; x=
	1667038956; bh=LQTrCQ1SmBiYMtTtcTNZ6a86ZIztFd+ZsK2jWKD8/hw=; b=B
	L48UI05TXtVtXyiJ7VqO7IoT81CGwCNPasYNoptIIuqNAjTkmkwLDF8jKzqLYr5v
	nWb2e0phsrlHsinbsP/cG+/4wplfCpSiTEgmI438w7trvyLCnTwaq5QDRVOBhlFc
	iexnGzAkc9VzmwsSrYqkuoXFWQdgrfwsYt++y/QHWNrZoz6nPpK/HaTDBXToK0dF
	wgnZdAP2HOrWFEgGD7kExbbM91cptOPDZSZ2YcmjxWFyXB4DhkT3HOniwwLZWNbf
	YZVNdcAGo1bdGo6nNlx0a8gTJX38WbJ+vXyYuL2zf9St6v5wlgYcOhMOPIFgiG8k
	JM8dqVWjMezSCzy4c3Djw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1666952556; x=1667038956; bh=LQTrCQ1SmBiYMtTtcTNZ6a86ZIzt
	Fd+ZsK2jWKD8/hw=; b=BuPCIX3pgX6U/YlebhmYeaDQO8ukMQ71hn8upA5me+Os
	Ud2XaqTf8sJ0/ruTGDC1O1tmcnuh9OQ+XcVZWYjvNbGxmiDpwV8oZlwDUD2CzS7K
	407ZKug+zsXZV1sR+Ofule44jHQGc+H+nB/WGSYTMxNbwZcjd+KuQL4Hz5oNZe1q
	GhK9NtSRqRi2Ya8slZYeUOqERbWVe2WtQbhIKZcZ35qm2O+g0yBaYmnTW6qpgWpk
	wFUcQvW6b06WkPf1OsNbBw/sMGRqA1ILs7t53cy89ixJsjo5V6NWuljPrA7HHYgB
	ZbOU9ZfSG9aT/0wgmgETafmq5ZZap+Mp34ZfYVffnw==
X-ME-Sender: <xms:bK1bYzL_0gH5OUmSnGoqub7QpBQhtmOmuBzufXj0fn8NKGQtoyFk4g>
    <xme:bK1bY3KwKz53ZD53kXBk0m-eV6AleB5uoDcbgbwoLe11_5JjMejqcR9hL9B2oLFJj
    ITV72kVNXhsnw>
X-ME-Received: <xmr:bK1bY7vkmDVUcADB_cRok8Qc7jYsd1Bhym6cOn9Nm6wrH9QP8RkVudhB5zzq_1_lD2Gncyf25YKn7a87sfJYWr6r3tVJqQ_pSGNJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtdeigddviecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeukeet
    teeggffgkeduheetgeeileejjeeiiefhjeegvefhtefggfetueetteeuteenucffohhmrg
    hinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomh
X-ME-Proxy: <xmx:bK1bY8bR4HpI6hWZeq3juHDbHtQv9zkucnGpA2FwwfG031TFpNPUjA>
    <xmx:bK1bY6b5_KDVoTXTLUcKw4bEMu6al_JJIhonn_vKCfZVjREvxFTCbQ>
    <xmx:bK1bYwAM8G1ivjO4wr5oYskNDdiYJ-GmjrR3djs8gYaJm0Mf8xNEUg>
    <xmx:bK1bYxUnBkXFTirBg56viCKu1kGGtlK9w2S7krVEqQmflSvD_lt6QQ>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 28 Oct 2022 12:22:29 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	George Dunlap <George.Dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>, Meng Xu <mengxu@cis.upenn.edu>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH-for-4.17] xen/sched: migrate timers to correct cpus after
 suspend
Message-ID: <Y1utZequY2IC9Apw@mail-itl>
References: <20221021145357.17931-1-jgross@suse.com>
 <Y1rKLJP/p+E+eVi7@mail-itl>
 <4977c33a-fe11-172a-11be-17acb01d61bb@suse.com>
 <901fa58e-6693-ca2e-9231-447f989d614d@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5KRzSUE2BoJpADaP"
Content-Disposition: inline
In-Reply-To: <901fa58e-6693-ca2e-9231-447f989d614d@citrix.com>


--5KRzSUE2BoJpADaP
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Oct 2022 12:22:29 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	George Dunlap <George.Dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>, Meng Xu <mengxu@cis.upenn.edu>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH-for-4.17] xen/sched: migrate timers to correct cpus after
 suspend

On Fri, Oct 28, 2022 at 10:12:36AM +0000, Andrew Cooper wrote:
> On 28/10/2022 11:08, Juergen Gross wrote:
> > On 27.10.22 20:13, Marek Marczykowski-G=C3=B3recki wrote:
> >
> > This is very weird. The data suggests that the scheduling resource
> > pointer
> > for cpu 1 was NULL, but I can't see how this can be the case without
> > causing
> > similar crashes without this patch.
> >
> > Are there any additional patches related to cpu on/offlining or
> > suspend/resume
> > in the hypervisor?

No such patches, it was this:
https://github.com/marmarek/xen/commits/master-credit-timers

> QubesOS runs with smt=3D0 by default.=C2=A0 Siblings ought to be parked a=
t this
> point.

Yes, indeed this test was with smt=3Doff.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--5KRzSUE2BoJpADaP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmNbrWUACgkQ24/THMrX
1yxfigf9HwIx/DDg6yHOiG9tf2VFYfWAuomfIjGOX7CrygSreAXhDsWPRF4DLGjJ
XwzVq/c3lb9CVRNwlRfd+T9mhKAsyzVXltqfJsQncoRQjvbtNj72D3dPXalfURYx
S0kW4CuBT5QT6Fh/owQGujTm/ffkxePAlRhxlZIxuTVpHZniXyQQr4xsDnR5ToSv
ZgsDHA+MUFuwaGE7bUUGLLXUhPjoOjB5R15j103Cc5t9vGc2x7ehehXF1ua48O9U
/6gT2ltGpjaBBn0CanmbzuuhOysjoOV/lHemMNsQx66dv7C2PFQPIBhvxqmoJDbs
y/QmNX9Y9mJXd0Vb3cYeqYR0KK0X6A==
=Y2d5
-----END PGP SIGNATURE-----

--5KRzSUE2BoJpADaP--

