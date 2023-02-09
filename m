Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5C4690F52
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 18:35:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492860.762625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQApG-0000u1-TZ; Thu, 09 Feb 2023 17:35:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492860.762625; Thu, 09 Feb 2023 17:35:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQApG-0000rb-Q0; Thu, 09 Feb 2023 17:35:14 +0000
Received: by outflank-mailman (input) for mailman id 492860;
 Thu, 09 Feb 2023 17:35:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TKJk=6F=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pQAkS-0005qC-B1
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 17:30:16 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68a5b7a5-a89f-11ed-933c-83870f6b2ba8;
 Thu, 09 Feb 2023 18:30:14 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id BDF27320095C;
 Thu,  9 Feb 2023 12:30:10 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 09 Feb 2023 12:30:11 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Feb 2023 12:30:08 -0500 (EST)
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
X-Inumbo-ID: 68a5b7a5-a89f-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1675963810; x=
	1676050210; bh=9ONn4jeJnzY4RbURezybz2EzV94m+2kzfhLz2FCfSBY=; b=g
	WL3QGUa6EwSfV+nxEOefuDMWruOCV9Vil+RQew9uWZm+SChcvcDNqia+f3eZLNYG
	aaAuqGzILm7l/YJhpvyNsmIevy5bBIbvvHK1DydQ2lJHRengMCqgDPh/I9wa7xVz
	BbKaxmtk7YBiv8KHjMM+09JmBo5QtiWv9AjljqULDJToS2y2GPBmD97psgJBznKj
	JTiTISBjh9N+zhk4tKasppinJb9TgosglzWZwF46cXuIBLWfypmrcRIxvie5NG1O
	Mr+Iu/uT9e1ZGRf4G41b55wMxrF9BfuNqN6jHEsGCvpuWDa1+C+OjJXv57qDixiH
	YdD6AHtuxSAztqCTDobvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1675963810; x=1676050210; bh=9ONn4jeJnzY4RbURezybz2EzV94m
	+2kzfhLz2FCfSBY=; b=Y7z7THhBNglzTPpV0DN6kPMP2NO1hhBJXjht21BOWSbP
	UnxI1cyejB9wEX2KpQoFhAGh/MuALicDF7oUyx3mfeGbFMKmfvSJ8xSMJ7B2ipDY
	XmdOAC5+2ecGNqIPx6Dwad+oLJtgKEI7HyIFGiagIB7pesVgsdeEbzg1NNoVF+vi
	l2FyV401otsdkvyfhYX8xbIt6VptmQSVK6HBGFoyCMcFpmC/Z7bCTr9gNMrD/Bnd
	vi9AFSiPwYwr5k7+sY3VfR/vW4CRwXbMV8JM1FDD5l3o5c+mHSpuPr/J/mvKY0ZZ
	px+wdIXXUQv154XFcsM9DrbWGvlIx+ZXGsiIuUnkbQ==
X-ME-Sender: <xms:oi3lY-JG887YzTWVNV0iUq00eo9OIdIpAEFrum4au-vLZ93JyK1N1g>
    <xme:oi3lY2JWkktlnkHZKAfQMeCBsoRZnLKJpxs69CvAEUAlgP4UhZRO0PdFywR0EL54o
    yJMC0ikrdjwlRE>
X-ME-Received: <xmr:oi3lY-srozyjocRbPRo-if4mrQaaVYpoG1dmHV7MVItbZbgSs4Q_lJWmyTw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudehfedguddttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeehkefhiefgffeileffieekkedv
    kedufeeuteekiefgiedufeehfeeifefhvdekleenucffohhmrghinhepshhouhhrtggvfi
    grrhgvrdhorhhgpdhrvgguhhgrthdrtghomhenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhm
X-ME-Proxy: <xmx:oi3lYzZBdvbFYDMVeeLjsUVJk-LJf8_gBTl95yJZHKw5Hq4h-Dxayw>
    <xmx:oi3lY1YM_FzjKRxmlZW_qFpuxmkf5ehkDIlgZnnVKcs3U65d-O4suw>
    <xmx:oi3lY_AglX5iweNGD4kKFM46eCMLdmO53mbymffLOjac2Fpux6ey4Q>
    <xmx:oi3lYx49pis7eqFvcyLn2hoL18zgKF69zgz1OMTeOO1T999CFColKw>
Feedback-ID: iac594737:Fastmail
Date: Thu, 9 Feb 2023 12:30:03 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: George Dunlap <george.dunlap@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2 1/4] Build system: Replace git:// and http:// with
 https://
Message-ID: <Y+UtnvFpwv9DduST@itl-email>
References: <cover.1675889601.git.demi@invisiblethingslab.com>
 <75d91def8234bceb41548147ee8af5fea52bd1d6.1675889602.git.demi@invisiblethingslab.com>
 <CA+zSX=a68fwMjAVRYC52894L4VsaHz9KACRVoewAyBTiNKJuYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HYepDk4+IANRBz0A"
Content-Disposition: inline
In-Reply-To: <CA+zSX=a68fwMjAVRYC52894L4VsaHz9KACRVoewAyBTiNKJuYw@mail.gmail.com>


--HYepDk4+IANRBz0A
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 9 Feb 2023 12:30:03 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: George Dunlap <george.dunlap@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2 1/4] Build system: Replace git:// and http:// with
 https://

On Thu, Feb 09, 2023 at 02:01:52PM +0000, George Dunlap wrote:
> On Wed, Feb 8, 2023 at 8:58 PM Demi Marie Obenour <
> demi@invisiblethingslab.com> wrote:
>=20
> > Obtaining code over an insecure transport is a terrible idea for
> > blatently obvious reasons.  Even for non-executable data, insecure
> > transports are considered deprecated.
> >
> > This patch enforces the use of secure transports in the build system.
> >
> > Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> >
>=20
> Hey Demi,
>=20
> Thanks for this series -- we definitely want the build system to use secu=
re
> transports when available.  Can you confirm that you've tested the "+s"
> versions of all the URLs in this patch, and verified that they actually
> work?

I had not, but a subsequent review indicated that most do work.  The
exceptions are:

- Neither the PolarSSL nor TPM emulator links work, but the http://
  verison of these links is also broken.  I added an AC_MSG_ERROR to
  fail the TPM emulator build if they would be used, but a Xen committer
  will need to regenerate configure.

- the newlib url should be https://sourceware.org/ftp/newlib, not
  https://source.redhat.com/ftp/newlib.  This was changed in
  configure.ac but not in configure.

> If you haven't, I realize that may be somewhat tedious, but I think it's
> pretty important.  You should be able to automate  a lot of it using `curl
> --head --fail`. [1]

That does not work for the Xen git repositories, but those all do work.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--HYepDk4+IANRBz0A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmPlLZ8ACgkQsoi1X/+c
IsHTTQ/+PQkqXyTptUZxmAn9zU/a2jLEJSR7vRpHN4M9qmezFoal36y35Phk2XRN
7OrdkHqhYEnkOX8PrPW8tY0wULH8aZsveve+RQRrq6R9Fkiw/ALwaPs+0WkRqCbd
qPhOmS5fqi+9xoS9gOsv9RGpdlGJdBGur0+Erd2MTUdmLlm416DeVCCtWLh7rulN
z2ruBGMmBkTZHRDj7J5w81RaJOzx5Pgez9jXKiuC6CI6zWNK2EQtOkUqglWG9oVy
nssRervVahjofqg9crDrSS+ao7JRzqjEFEl9PlE1u+ivS2mTAkgv6IOuonmDm/ry
Vb2oMA6vHYSgW36pDVLe2Z8W+hAuC6z3OyvvNOKBEX7TllErApGpVOAbC1+5+h+O
BrePYk2WjOj90ZFccISakxU4BW4nfObf77i76fsm3I7UFeXoI+QJOXet+f7XSxwd
8CFHZDwLuQjdUyOTaGwhi3q7LRf9FA63Sb9BBGsJ8/Uuahh790ad2Sqd3/Czt0u4
3LKUHQnAR4dqbvyrGcCWpFzVvwMlPAJKs2kgUKJi1Rdpvqs1q7A0+Us5yCOcqAgo
czCe1IlCBNjyT5yHUleXMFSLey947uI/LtMDF/pCpo5Nb2Lrf0BeeMWvr3DznqAU
bcCy0KhqfIcZDOnXhpiBNro3Tb19xvSJo1MI3xlGGhPrVze2tss=
=iPFj
-----END PGP SIGNATURE-----

--HYepDk4+IANRBz0A--

