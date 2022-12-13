Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD7064BF4A
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 23:22:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461266.719339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Dfc-00047k-OL; Tue, 13 Dec 2022 22:22:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461266.719339; Tue, 13 Dec 2022 22:22:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Dfc-00044j-Kz; Tue, 13 Dec 2022 22:22:40 +0000
Received: by outflank-mailman (input) for mailman id 461266;
 Tue, 13 Dec 2022 22:22:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mJcE=4L=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p5Dfc-00044d-1R
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 22:22:40 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6655dac-7b34-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 23:22:38 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 96EF132003C0;
 Tue, 13 Dec 2022 17:22:36 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 13 Dec 2022 17:22:37 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Dec 2022 17:22:34 -0500 (EST)
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
X-Inumbo-ID: a6655dac-7b34-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1670970156; x=
	1671056556; bh=XnBVA0h1DUnwb9MFZ4Gxd4oEQ3gITguNU9qteIZbzqw=; b=V
	DemX/jxOFeRB+oQwc2RVyW7aHDuklaNaQ3anESoZUK3658OaAcPIm1FvMQMxiX1/
	VltIcfxs0pZ0t3qRzWWctNZFkb6OUdNu0oSNf1AiFBeNvaaoYvSnfssRbe2qJW4o
	DU2DX5hcHMKiT417AW/FfQ9ZOkRzVtQy/1OSLh//P3mn0kskjVmdyNBw+Zc0OaO0
	wtzfW8xLFnj2G2g/hZRlZZ7H7IaHR/irzpJHrlPE1Q2gckiCspJq+Akm+Bt4nSUh
	ORvdXOLHOA1yySAsjP5F4BlS2lAt2VJYGiostFgp58NygcRj+s/0YioaB2ezBqrn
	H85p4WQBDe9oVeZMAGmjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1670970156; x=1671056556; bh=XnBVA0h1DUnwb9MFZ4Gxd4oEQ3gI
	TguNU9qteIZbzqw=; b=Sx/oYsY2fznTH/A0DWdTuyPgMkLeMxqiUw0FIiRATTmv
	j98zZOY0qYem+TSvKsXEnUC/jDKLKe73Mwj0OlFVeWjV56KXK/5rjnoUTORn/BR/
	rNPJ9THE75ujnRQC6/llCxlwhkWVykrxfhoeTzjjrKwVKzjz/Cp2wcWEjYiPyq7B
	f10MCj0xPSbuoBZ7huANHBgTOQkpBWyL/Deh6/Txh7G+5g64GCdPAQgXHyt96E9F
	NdrbOsCz9vte0R1ASfGHHKQK8hETRI8tr1HEWXVHYVYLMemPIyAkr/msmGEsBWl9
	cUjwj3oBNcmS5w5NyY9+EujgqChujFEabC2TZ3MMBA==
X-ME-Sender: <xms:K_uYY9r6ZoNQ4_cYXEM5KdnNYeZH8OqkYcQAN9dNmOyg8TeCVwEIBw>
    <xme:K_uYY_rGJg0QCmF3GBE-s5FmfFagv3ogpRx0dEEPb7SPzP_S0c6CWrWnHihFKGjmz
    sOQ6ypI7hQkV3I>
X-ME-Received: <xmr:K_uYY6OsH6JyP2r0nwYjH2Q4eiy_QE47yESaw4D3V1qV59nl2GCk-APfV0cY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedugdekiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvjeetgeekhfetudfhgfetffegfffg
    uddvgffhffeifeeikeektdehgeetheffleenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:K_uYY45fvkGXg0waSPIXDQ7K3D2hd6WoTj6Ri1nQ8KfXgSFOA-Dafg>
    <xmx:K_uYY84HFH9AqVjJtpAT3pjWOmoa4ZakMISOludugyGYpfvq_LFtxw>
    <xmx:K_uYYwgDWXEISo_MQMtgXVzAUjj637jXE7_RN1Qr2lAZGPTB2qtoZQ>
    <xmx:LPuYY9F_gtcgVz-6k0uVDA35LIJ7QY2ZHDV7jowkqyJ81bDImrIQ5A>
Feedback-ID: iac594737:Fastmail
Date: Tue, 13 Dec 2022 17:22:32 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Julien Grall <julien@xen.org>,
	"Smith, Jackson" <rsmith@riversideresearch.org>
Cc: "Brookes, Scott" <sbrookes@riversideresearch.org>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"bertrand.marquis@arm.com" <bertrand.marquis@arm.com>,
	"jbeulich@suse.com" <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>
Subject: Re: [RFC 0/4] Adding Virtual Memory Fuses to Xen
Message-ID: <Y5j7KQ9g5Yb/ufn+@itl-email>
References: <BN0P110MB1642835E0DE845205B5EA59CCFE39@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
 <b7a367d4-a9df-0733-5a11-6ba11043c6b5@xen.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zIRSLsV3K51aFaBD"
Content-Disposition: inline
In-Reply-To: <b7a367d4-a9df-0733-5a11-6ba11043c6b5@xen.org>


--zIRSLsV3K51aFaBD
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Dec 2022 17:22:32 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Julien Grall <julien@xen.org>,
	"Smith, Jackson" <rsmith@riversideresearch.org>
Cc: "Brookes, Scott" <sbrookes@riversideresearch.org>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"bertrand.marquis@arm.com" <bertrand.marquis@arm.com>,
	"jbeulich@suse.com" <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>
Subject: Re: [RFC 0/4] Adding Virtual Memory Fuses to Xen

On Tue, Dec 13, 2022 at 08:55:28PM +0000, Julien Grall wrote:
> On 13/12/2022 19:48, Smith, Jackson wrote:
> > Hi Xen Developers,
>=20
> Hi Jackson,
>=20
> Thanks for sharing the prototype with the community. Some questions/remar=
ks
> below.

[snip]

> > With this technique, we protect the integrity and confidentiality of
> > guest memory. However, a compromised hypervisor can still read/write
> > register state during traps, or refuse to schedule a guest, denying
> > service. We also recognize that because this technique precludes
> > modifying Xen's page tables after startup, it may not be compatible
> > with all of Xen's potential use cases. On the other hand, there are
> > some uses cases (in particular statically defined embedded systems)
> > where our technique could be adopted with minimal friction.
>=20
> From what you wrote, this sounds very much like the project Citrix and
> Amazon worked on called "Secret-free hypervisor" with a twist. In your ca=
se,
> you want to prevent the hypervisor to map/unmap the guest memory.
>=20
> You can find some details in [1]. The code is x86 only, but I don't see a=
ny
> major blocker to port it on arm64.

Is there any way the secret-free hypervisor code could be upstreamed?
My understanding is that it would enable guests to use SMT without
risking the host, which would be amazing.

> > 	Virtualized MMIO on arm needs to decode certain load/store
> > 	instructions
>=20
> On Arm, this can be avoided of the guest OS is not using such instruction.
> In fact they were only added to cater "broken" guest OS.
>=20
> Also, this will probably be a lot more difficult on x86 as, AFAIK, there =
is
> no instruction syndrome. So you will need to decode the instruction in or=
der
> to emulate the access.

Is requiring the guest to emulate such instructions itself an option?
=CE=BCXen, SEV-SNP, and TDX all do this.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--zIRSLsV3K51aFaBD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmOY+ygACgkQsoi1X/+c
IsGT/Q/+NL531LE5Pgxvxpc98/qW0WKIyefcqJl/mVyV0yFYncb6qwyAXM6g6NnL
V+pYrLsXKAH6R3FjgISVRdpDGzAUo/kRMVHWoYeP+uykWdsN/yWhFXtGWcyETHAV
oy3KgBxm+WlJiXNtN+Z1lFFAzMrTCtDV2HMeWJDs8Uur6B4bxkP2srwgU+Bz/i5h
BC/afejv3OYVfQDkvuZOTBi/xBs0NRrVnEJXfnlJJswOJ+f6EvHp2gn32qVoRqMV
N+5Fq9HmalYK5uR6ub5LgQLqCW1Cx17YbG4s22PJt3N7wVq24AGBz3P/eCj94dNJ
rhAUQv7NYGNlELqAVudkVsSCGmNRT62rU3X8cMhDtYpTFbpD1in2Sle7f4yYrry3
VYm9HtZ6ONSZ1B08zcAsdIatUJ1MFYQ4BL1jp1x7bDsai0U2nnEVWYI/FkQ1emBr
3nc9uOPkm6daSnikqB2SMOm9vV0duOTBC1DoxUz6fWT641hsBZoxxavhHuC/Mvyh
ncv5BRvsSena0HVf8ndyKvZGpB6vJqyl11M8sVqClwkm51HcT4neejO3ZAhvF0pS
U2JL6HI5hhp3ZIl0wNzK8rxIaWWOrq0OHwo3rPPUXWDOr+uoq7tfEe/qLukZKUh2
N2UhWx8uWE+eZXb1DBjqMGehCgHCRIC46JaT2IAG/TQwWzmwlMQ=
=hcFn
-----END PGP SIGNATURE-----

--zIRSLsV3K51aFaBD--

