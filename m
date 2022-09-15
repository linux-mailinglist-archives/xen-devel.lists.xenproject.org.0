Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 969505B9984
	for <lists+xen-devel@lfdr.de>; Thu, 15 Sep 2022 13:25:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407332.649800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYmzN-0000xl-UF; Thu, 15 Sep 2022 11:25:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407332.649800; Thu, 15 Sep 2022 11:25:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYmzN-0000vB-QY; Thu, 15 Sep 2022 11:25:01 +0000
Received: by outflank-mailman (input) for mailman id 407332;
 Thu, 15 Sep 2022 11:25:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vOd1=ZS=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1oYmzM-0000v5-A9
 for xen-devel@lists.xenproject.org; Thu, 15 Sep 2022 11:25:00 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 065ad3bc-34e9-11ed-a31c-8f8a9ae3403f;
 Thu, 15 Sep 2022 13:24:57 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 5653F5C00F7;
 Thu, 15 Sep 2022 07:24:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 15 Sep 2022 07:24:55 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Sep 2022 07:24:53 -0400 (EDT)
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
X-Inumbo-ID: 065ad3bc-34e9-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1663241095; x=1663327495; bh=t+5vlnNWFl
	2cjjReriBwLnwpXRazfTk790i5QhRRZaA=; b=v7tTZRGgEJqA3Pz+g2giCGbDVu
	7APyzzCJxaI6Bkb52fI/BZvhLqpuFhoNmzxSE2fp9CqIfVCzw53WkcWn4xFK+GRU
	p2BmvZbYUHhraxPe44HEY5ClIzPltANy7dc2Bo3o4HXrzvOF3xwQkkNhitR3iPMT
	gnCy7Eglr2IqoMpw0gegb59JeGAAyB1toylMkvvU5TvRvHAP1PgU2iqfjYr5x3mv
	JI3oFPgeTKNbzn+TCmMLkN8x5znFaKtbyp8vpJE8OxwEbacR26AKLONMwlbHpYVF
	8bX6vfACWDvbAxht9rV9i67EjIIPsvTJ4uDjAVNcBdFp94NlFxp6CTjZE29w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663241095; x=
	1663327495; bh=t+5vlnNWFl2cjjReriBwLnwpXRazfTk790i5QhRRZaA=; b=Z
	e9rQ101PeXDYpED+/5tfpQ+eS4R/80rz8/W+oxnKQa0CE6d1Y2nkHF3Hv10LCQt3
	9CgIgHvq4CSOll6VPHL2SY6ek7JjSEss3/r8aUZ9v+fAYzOfU7Cq6eRKQ0NzvuSN
	+iqkLPWoZUutIqqhhwa0Pk5+4R3tlLoSG4f98ZmOkD6P9DL8HFNPWm6n7ZTMtL+q
	QQ/TfeTYKTLZ/lUws9svU0ZcPllSI4NDGfzWvZnY4cmSOD+TrSzZrTtPxiV5+dgr
	69GnsJS4wJNntxUuTr/2zgVb0Y7uVHQ04vMQISZoQnAsUPzq5WaSn8rhfoTchGcG
	kETDfY/VOQWjko4Qsu61Q==
X-ME-Sender: <xms:hgsjY4GiBYX9oZ_ZPMZSudDQBLYFFXs8J2GsghipA_xL9MTYdREzXA>
    <xme:hgsjYxUzSKhC8zFdb126z-dtRL9xpZADRm0llbQGjtNX1qd_7DiIU5bxHUxcW2I0j
    s8zKZWZ9-i0X9w>
X-ME-Received: <xmr:hgsjYyL2Xsmcg_CQ0y8TuGMnvrDKsE3PaIJb3PUkcb5t-LnPRORgOuN41WO0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedukedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtgfgjgesthhqredttddtvdenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepieegtefggfektefhvdeuudeuieff
    heekuefhgeeilefgieehleduueetveefteejnecuffhomhgrihhnpehinhhtvghlrdgtoh
    hmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggv
    mhhisehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:hgsjY6HEzLaHZaVOOpjXwn7vSLkmNEeUpJMTEsxNrT-3ZwZ7ny4DKA>
    <xmx:hgsjY-UiiOxlej60woW6DhPHag4gkhfcApbfYpn1sVjvZIIjz9vndA>
    <xmx:hgsjY9M1U0eIwY6SejqtRBWLj-hR_5TmneaL_m89GFWNDH9KF1Xx2w>
    <xmx:hwsjY6RPkJmyJcoRyW0aB2pYe9EmZ9O99zvHLY9WYvR6A8hK899xEQ>
Feedback-ID: iac594737:Fastmail
Date: Thu, 15 Sep 2022 07:24:51 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Qubes OS Development Mailing List <qubes-devel@googlegroups.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Henry Wang <Henry.Wang@arm.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Simon Gaiser <simon@invisiblethingslab.com>
Subject: Re: [PATCH for-4.17?] x86: support data operand independent timing
 mode
Message-ID: <YyMLg7KbeOT1MMpH@itl-email>
References: <f793ef22-54d4-a74e-b01b-4ebca58b2abd@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; x-action=pgp-signed
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <f793ef22-54d4-a74e-b01b-4ebca58b2abd@suse.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

On Thu, Sep 15, 2022 at 12:04:55PM +0200, Jan Beulich wrote:
> [1] specifies a long list of instructions which are intended to exhibit
> timing behavior independent of the data they operate on. On certain
> hardware this independence is optional, controlled by a bit in a new
> MSR. Provide a command line option to control the mode Xen and its
> guests are to operate in, with a build time control over the default.
> Longer term we may want to allow guests to control this.
>=20
> Since Arm64 supposedly also has such a control, put command line option
> and Kconfig control in common files.
>=20
> [1] https://www.intel.com/content/www/us/en/developer/articles/technical/=
software-security-guidance/best-practices/data-operand-independent-timing-i=
sa-guidance.html
>=20
> Requested-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Thanks for the patch, Jan!

> This may be viewed as a new feature, and hence be too late for 4.17. It
> may, however, also be viewed as security relevant, which is why I'd like
> to propose to at least consider it.

I consider it security relevant indeed, which is why I was so insistent
on it.  Whether it is worth a full XSA is up to the Xen Security Team.
If it could be backported to stable releases, that would be great.

Marek, Simon, would you consider backporting this to R4.1?

> Slightly RFC, in particular for whether the Kconfig option should
> default to Y or N.

I think it should default to Y as long as guests do not have the ability
to control this.  Otherwise any cryptographic code in the guests thinks
it is constant time when it may not be.  Once guests have the ability to
control this I would be open to reconsidering this.
- --=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmMjC4MACgkQsoi1X/+c
IsELUg//fTRCauj/woVL8a3NpcB/2T2/gM06Lhg/eT7DsW4aJEIinB+jZ1mQ4oUb
MWEe3Ljwo0bxhbWbbQt2Xqp0pRM1MsDT7D0Boe0qEbpFYCgs8NrRvNE+MrtXG24x
B+2E/KZBIesjLV26S3uWTItHfUiFbqo5xzJURCDNHZqZiDnvCs4adiCMNDfroXyL
4UnP1slglrL/x/WqU9VKsWOOJAHTId2cBFd5FDlCQ7UX/GQISUIk7NZqCvutbtny
nJpSlbYoUcuQ3IfB4S7zDE4sN2YatCDqojZsAYuwRCRCRgM4nmZJUvK5KwzR1k6Z
0DfvZ0R4h5gdSrylqABzteEwLbob2icXxY89QHhssh/737R0HE5sRK2HKOPRZgUz
bmdlismQMqAuzUceAFreIGoPsIQUongF2xZJIY6AtGLudvaB8GZVyeJCgvH/eYyA
N05zybw3brLDgTjLN+HXTtsH4X7t4/ktCbGCLZWUytu5h4tr/wg/IXhd84uCu88n
3oLHLuqtpJUNItDYSmLSNQ7KO3Py4pbGjV7ienUl4fGpLS9MKG6raCTj12xO5nq8
5C/vMuzCRiJF3lEvHOrkVjH7vANk/8pfnqoHoMHs4lM2QnlskdOsjCPa17ZZWHs0
knT9OrN4hL7GgA2aU33rfhvgtDq6p7n5Xg2+YbNAbj7lSydjSho=3D
=3Ddfry
-----END PGP SIGNATURE-----

