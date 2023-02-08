Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DE768FB16
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 00:21:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492053.761448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPtki-0002lA-9N; Wed, 08 Feb 2023 23:21:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492053.761448; Wed, 08 Feb 2023 23:21:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPtki-0002jM-6T; Wed, 08 Feb 2023 23:21:24 +0000
Received: by outflank-mailman (input) for mailman id 492053;
 Wed, 08 Feb 2023 23:21:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mMba=6E=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pPtkg-0002jG-I5
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 23:21:22 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a498852-a807-11ed-933c-83870f6b2ba8;
 Thu, 09 Feb 2023 00:21:20 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id D35AD5C0110;
 Wed,  8 Feb 2023 18:21:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 08 Feb 2023 18:21:17 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Feb 2023 18:21:14 -0500 (EST)
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
X-Inumbo-ID: 4a498852-a807-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1675898477; x=
	1675984877; bh=bKBpNMNaZlqzKjlPvpCySfuqS5eEM4ZOMXPseCuUqYI=; b=M
	STq6MfnG95qDHkYvBIpAmRAz6ytJ8Sobe3oEgXfMdmI0W+q6LKlMpNVeOCkYzgJs
	hvAlPORzF8ctam2dp22+aJm4zcKqhAQfLs16WlnVIcZzP8SfW/wfHOfTT51+8xsc
	dnG+22o2JLxTPHIrgS+0MMu01hMlRjcYI002qq49Mr/O/BCuM5gMbDUC29zELTaR
	f+QxxALJSbk0Y9zxsM05lh06eHW3B0aBQYD5bzKOysfkQ3I7rL+WKorZb7MrCgKe
	WUKN9QcGtXM9MtGsDmssgU15KGlJ3YuZyhZc6c3uKVe3IJqElGVLo+VWnIvdMUDC
	LRfdaFJMPtPZ/Lh/IxQ+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1675898477; x=1675984877; bh=bKBpNMNaZlqzKjlPvpCySfuqS5eE
	M4ZOMXPseCuUqYI=; b=ZoUR7HNBekGqfBFoxf8+F60YCgohU7kXAwJ9ypNTyXQ4
	+cZ7lAwZAPcPMN9kB45arxry/Rtl9rFzdW2P4VpAzHEaPrtyd8LjFp9QWXw6PUN3
	uEtfMqXBbVrNahOeNl6QXEHfACAQR9UlXj7nPAWODoDAUvOegwEzkw0LFRK9Sh+j
	6uZtiR2pbgYSPuvWbIHr9tqNXJc0n0sZaVhns8MYsKPcr7YO6gUtOq6eqxOtwUp4
	6SmvhItroS9rvV8O8k1QPhUQVlJPPTlUjwD2v3JTLWJe2FhTGUEm0yO3ykoHxPHB
	Q06PDmorSjdfTDxWNbON8+lWePGJFCJmU2L688RCjQ==
X-ME-Sender: <xms:bS7kY5FyNBv5UdFEEMldwh2HubmY122AC6xft0_Y8Qd3p5mCj7vy5A>
    <xme:bS7kY-Up5VfwTiMZPCwGn43Q-Nx3iofmN0JD54DVtERxVUnRlwYp3ddwIIBBEsqLv
    OxIFxqa3ofDiOs>
X-ME-Received: <xmr:bS7kY7LssnwKG-hQcK91jasuGOAUHbwObmn8VpVIHieWChxFB3D0kX-pxZU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudehuddguddtlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeiteevfeeuuefgtdevuedvjedt
    geejteelheehueevgfejteehfffftdeuvdeuieenucffohhmrghinhepghhnuhdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeguvghm
    ihesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:bS7kY_Ef0q29Th4IE1ScNRpi25LUG7gkSuSD5U5yVw3KCxeM8JVILw>
    <xmx:bS7kY_XjmXeGQzJc5eZmUIxtMDNj0W9QLDf50hLUgJpJwgiBfyxU3g>
    <xmx:bS7kY6PJFkw6N5qw1aF7Iv66kI1SATSNX8rcKbgI3ufejLPacCsEqA>
    <xmx:bS7kY5jBeVU0mGWZIVUXHlGo2dVPWj2ZNRpSQy3RQubCk_UhZ4HKag>
Feedback-ID: iac594737:Fastmail
Date: Wed, 8 Feb 2023 18:21:08 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,	Quan Xu <quan.xu0@gmail.com>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,	Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jun Nakajima <jun.nakajima@intel.com>,	Kevin Tian <kevin.tian@intel.com>,
 Paul Durrant <paul@xen.org>,	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,	Tim Deegan <tim@xen.org>,
	Christopher Clark <christopher.w.clark@gmail.com>,
	Dario Faggioli <dfaggioli@suse.com>,	Rahul Singh <rahul.singh@arm.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 4/4] GPL License Boilerplate: Switch from HTTP to HTTPS
Message-ID: <Y+QuaDrn6EUti0ZR@itl-email>
References: <cover.1675889601.git.demi@invisiblethingslab.com>
 <6ff3e64e1dafd869caf23660cafdd46070209e2e.1675889602.git.demi@invisiblethingslab.com>
 <alpine.DEB.2.22.394.2302081456060.4661@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XW67PB3rWBKnfQ2K"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2302081456060.4661@ubuntu-linux-20-04-desktop>


--XW67PB3rWBKnfQ2K
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 8 Feb 2023 18:21:08 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,	Quan Xu <quan.xu0@gmail.com>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,	Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jun Nakajima <jun.nakajima@intel.com>,	Kevin Tian <kevin.tian@intel.com>,
 Paul Durrant <paul@xen.org>,	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,	Tim Deegan <tim@xen.org>,
	Christopher Clark <christopher.w.clark@gmail.com>,
	Dario Faggioli <dfaggioli@suse.com>,	Rahul Singh <rahul.singh@arm.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 4/4] GPL License Boilerplate: Switch from HTTP to HTTPS

On Wed, Feb 08, 2023 at 02:58:38PM -0800, Stefano Stabellini wrote:
> On Wed, 8 Feb 2023, Demi Marie Obenour wrote:
> > Obtaining code over an insecure transport is a terrible idea for
> > blatently obvious reasons.  Even for non-executable data, insecure
> > transports are considered deprecated.
> >=20
> > This patch changes GPL boilerplate.
> >=20
> > Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
>=20
> For the licensing boilerplate, I think it would be better to switch to
> SPDX instead.
>=20
> That said, given that you have already done the work to covert the GPL
> boilerplate everywhere, I think this is OK. But if you have time and
> energy I would love to see a patch switching to SPDX in as many places
> as possible.

The only part of this patch I actually wrote is the commit message.  The
rest was generatedy by:

    git ls-files -z |
    xargs -0 -- sed -Ei -- 's@(http)(://www\.gnu\.org)@\1s\2@g'

followed by the usual git stuff.  Do you know of a similar automated
tool for SPDX conversion?
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--XW67PB3rWBKnfQ2K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmPkLmgACgkQsoi1X/+c
IsEKRw//W22Z2zX2t7k3Fz9Fhmd5gKTaRiil22nAIRkg68VVcKBhQhh+lO13i5L/
nWNH4W7MBLvdiJxTIh7Fs7l3HrJoVb4LX/xCe4RRqpx4yUeQgaBsUEPnpw9LdqrO
dMxkxlSivgp4qDTtx8lN3q29rlxJCKym1V+BUdNG6gE3rP/jeZxZknb+nV6vzu/0
juig8OLPhVNDnBN291bC8M7ubLZ+a8IRrscWj9KnHH9h5jTLbeSbnZgqEx7tPyBA
3xYuEzFJksmtDEgKJIvjSG9KRwwP03x4itoFaJo90JG1nZXA8YJcAD70Y5GeV51g
U4RI2b4jxr6VmMpUjnQaI/Yqlq0xw93ErdbVKNCKzqmZsa6uKI1E50W07Evza8Gq
VEOLL74uv7xB2ck1oEZsejG8xmarI8gPpxsMh7qEaUwYN0H3oZwp5A6FBkBWvCoJ
O/YjL/cQwoG3O9WilTw1sCcApJW6E2DnK6Dxz8XfYnWX6PFW2KeWpGaQE4AmmFOE
P/EfyqxuPJaDkbn6pcAcofDDucD3CUsAw2KpSaNyzQXsTlVR+Tu3d1hEpFw+GbGD
KTsk1dbSQmQrpWaIHBgTqrx5ceX2uiUcmuidTPpAFDMIjwv9qvuhOn7FLs8dII/5
63RnppaVLXYpNmid539EzLyXy6AH0hZCaF3w/4ArGw7dHN+lTaE=
=8f2c
-----END PGP SIGNATURE-----

--XW67PB3rWBKnfQ2K--

