Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84351652911
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 23:32:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467452.726530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7l8j-0003hF-3Q; Tue, 20 Dec 2022 22:31:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467452.726530; Tue, 20 Dec 2022 22:31:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7l8j-0003dp-0E; Tue, 20 Dec 2022 22:31:13 +0000
Received: by outflank-mailman (input) for mailman id 467452;
 Tue, 20 Dec 2022 22:31:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tFeQ=4S=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p7l8g-0003dj-PH
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 22:31:11 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc594072-80b5-11ed-91b6-6bf2151ebd3b;
 Tue, 20 Dec 2022 23:31:06 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 0126C32003D3;
 Tue, 20 Dec 2022 17:31:00 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 20 Dec 2022 17:31:01 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Dec 2022 17:30:59 -0500 (EST)
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
X-Inumbo-ID: fc594072-80b5-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1671575460; x=
	1671661860; bh=qbqrv5HgOtrJhdQAcZ9zgpaQ/NrarXwMcm7RJaQjumE=; b=n
	7e/y6jHRliAMpmovWwIYq0+w9Z4A+ep8aCRdjy7f2Bk4p5ak1SKZ9uNmdpWIFKgk
	RsL+Co114bqiEqNHaegDhVujxHWafgmV8ny1MJfij909DFhZWg3ju4Ol5jXEVMtn
	ImVGCevO2pWn6smPGkXm3kANglMtpudXD50sHUwy9gAvb61/dtN0tn/OVO9jWWiz
	ckUKBak9MRK2UjwZADuXzS/o4wj9AHIQuGXrDCvVxd8uqzzSOGrgiIBK8z9X+6bo
	jCQ3J72Xxfc3OS3YVfyHfZJjMlZNS0jEKqYN1IMRdCpTdtHra6iUchUbUiplOY+q
	N02S27oUm0z9uSiy57f+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1671575460; x=1671661860; bh=qbqrv5HgOtrJhdQAcZ9zgpaQ/Nra
	rXwMcm7RJaQjumE=; b=aUziJtIhi6KlwcTMPavjmVvp9m5jT8oFvxwqvpa+RPTh
	aUnHh0jG6EaNrEESZAwltaWJhhwj82dj2LQzrIxCZRvF3xYUi1qxIn5xRR2iaEon
	YTdgfq8FLJhDNX+bwBG7Z6vKbrSomhmES9O/1bnwz4BZsuPiHyfBkoQMnHolqpyK
	rYcZJuxWAhEvGyexPPPn0KRaHywB+c8k2+kVGVwycJx+FPlirBxcpT/IyiFDop3e
	lvneVZwCi/V7h/SfZkGGsIAFO40AnHrrIWCpt7kZbn1jaLMr2PRzCRYk/4fmqZoJ
	yFXTE5DNtxbVXvoWfV5fhU9spEEVkbXVIZ5xLTYdoQ==
X-ME-Sender: <xms:pDeiY4104p0UQC6wT0BJ_BhDl_6fIfjPaMUFYmwPOgunWoepPl6_7w>
    <xme:pDeiYzFqFK4rfapy3EtHFTotjyuVcgJocyV6f_NHUyLCPptT2GO-I1CqGs2gFk9wu
    UZKmLP7O4184qg>
X-ME-Received: <xmr:pDeiYw6VpdBIU0QdoFx4iFGGlIHyohKLgXSxxDGHf4teIEA8dWCSnQHTWm7C>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeeigddufeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepvdejteegkefhteduhffgteffgeff
    gfduvdfghfffieefieekkedtheegteehffelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:pDeiYx13NmyHPUNvb5JHbDsA7giQrtZe272-Wo3fDZzE8KkrVQNlCQ>
    <xmx:pDeiY7GJNDOLC81dC-ntI7er8dQ44_48ByIjy1r2K6cWLxx4-hfTIw>
    <xmx:pDeiY69CJu_xWN9dWRkimgUEmhLdy2SGJYmiOKU2ZeExBh5XvpsNJQ>
    <xmx:pDeiYyCZ-9yCqbFshc0IO7xG506L3NExQIVHL4gkq1n9VYIMnZEviA>
Feedback-ID: iac594737:Fastmail
Date: Tue, 20 Dec 2022 17:30:55 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: "Smith, Jackson" <rsmith@riversideresearch.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Cc: "Brookes, Scott" <sbrookes@riversideresearch.org>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	"bertrand.marquis@arm.com" <bertrand.marquis@arm.com>,
	"jbeulich@suse.com" <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>
Subject: Re: [RFC 0/4] Adding Virtual Memory Fuses to Xen
Message-ID: <Y6I3oqYdTKa/57I/@itl-email>
References: <BN0P110MB1642835E0DE845205B5EA59CCFE39@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
 <b7a367d4-a9df-0733-5a11-6ba11043c6b5@xen.org>
 <BN0P110MB1642A6DCBD15780CD8767B8CCFE19@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
 <513d0cc3-a305-5029-32f7-67993ae83c55@xen.org>
 <alpine.DEB.2.22.394.2212151725090.315094@ubuntu-linux-20-04-desktop>
 <7a7a7156-138d-a53c-fb65-a210e14bd8c1@xen.org>
 <BN0P110MB16429FF1A9FF3507A684C5B2CFEA9@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n1jso5Mq3pAfkhgA"
Content-Disposition: inline
In-Reply-To: <BN0P110MB16429FF1A9FF3507A684C5B2CFEA9@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>


--n1jso5Mq3pAfkhgA
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Dec 2022 17:30:55 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: "Smith, Jackson" <rsmith@riversideresearch.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Cc: "Brookes, Scott" <sbrookes@riversideresearch.org>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	"bertrand.marquis@arm.com" <bertrand.marquis@arm.com>,
	"jbeulich@suse.com" <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>
Subject: Re: [RFC 0/4] Adding Virtual Memory Fuses to Xen

On Tue, Dec 20, 2022 at 10:17:24PM +0000, Smith, Jackson wrote:
> -----Original Message-----
> > From: Julien Grall <julien@xen.org>
> > Sent: Friday, December 16, 2022 3:39 AM
> >
> > Hi Stefano,
> >
> > On 16/12/2022 01:46, Stefano Stabellini wrote:
> > > On Thu, 15 Dec 2022, Julien Grall wrote:
> > >>>> On 13/12/2022 19:48, Smith, Jackson wrote:
> > >>> Yes, we are familiar with the "secret-free hypervisor" work. As
> you
> > >>> point out, both our work and the secret-free hypervisor remove the
> > >>> directmap region to mitigate the risk of leaking sensitive guest
> > >>> secrets. However, our work is slightly different because it
> > >>> additionally prevents attackers from tricking Xen into remapping a
> > guest.
> > >>
> > >> I understand your goal, but I don't think this is achieved (see
> > >> above). You would need an entity to prevent write to TTBR0_EL2 in
> > >> order to fully protect it.
> > >
> > > Without a way to stop Xen from reading/writing TTBR0_EL2, we
> > cannot
> > > claim that the guest's secrets are 100% safe.
> > >
> > > But the attacker would have to follow the sequence you outlines
> > above
> > > to change Xen's pagetables and remap guest memory before
> > accessing it.
> > > It is an additional obstacle for attackers that want to steal other
> > guests'
> > > secrets. The size of the code that the attacker would need to inject
> > > in Xen would need to be bigger and more complex.
> >
> > Right, that's why I wrote with a bit more work. However, the nuance
> > you mention doesn't seem to be present in the cover letter:
> >
> > "This creates what we call "Software Enclaves", ensuring that an
> > adversary with arbitrary code execution in the hypervisor STILL cannot
> > read/write guest memory."
> >
> > So if the end goal if really to protect against *all* sort of
> arbitrary=20
> > code,
> > then I think we should have a rough idea how this will look like in
> Xen.
> >
> >  From a brief look, it doesn't look like it would be possible to
> prevent
> > modification to TTBR0_EL2 (even from EL3). We would need to
> > investigate if there are other bits in the architecture to help us.
> >
> > >
> > > Every little helps :-)
> >
> > I can see how making the life of the attacker more difficult is=20
> > appealing.
> > Yet, the goal needs to be clarified and the risk with the approach
> > acknowledged (see above).
> >
>=20
> You're right, we should have mentioned this weakness in our first email.
> Sorry about the oversight! This is definitely still a limitation that we
> have not yet overcome. However, we do think that the increase in
> attacker workload that you and Stefano are discussing could still be
> valuable to security conscious Xen users.
>=20
> It would nice to find additional architecture features that we can use
> to close this hole on arm, but there aren't any that stand out to me
> either.
>=20
> With this limitation in mind, what are the next steps we should take to
> support this feature for the xen community? Is this increase in attacker
> workload meaningful enough to justify the inclusion of VMF in Xen?

Personally, I don=E2=80=99t think so.  The kinds of workloads VMF is usable
for (no hypercalls) are likely easily portable to other hypervisors,
including formally verified microkernels such as seL4 that provide a
significantly higher level of assurance.  seL4=E2=80=99s proofs do need to =
be
ported to each particular board, but this is fairly simple.  Conversely,
workloads that need Xen=E2=80=99s features cannot use VMF, so VMF again is =
not
suitable.

Have you considered other approaches to improving security, such as
fuzzing Xen=E2=80=99s hypercall interface or even using formal methods?  Th=
ose
would benefit all users of Xen, not merely a small subset who already
have alternatives available.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--n1jso5Mq3pAfkhgA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmOiN6AACgkQsoi1X/+c
IsEh1g/9GRJUM84zR6nqYuGwxXwRpGY988B9kzr8CW5VBiSEL/KEkSf9ebUpWPtF
1YRw2p04Bv+u55g7skENot7ud1yvcbs0aXSrz0gaTRnKpPgLfqM9qjVAdY+Ab95t
rTqR2Gdr7bdnmgHKsUVyN9IOcRnkCAB2OIl8e4z0AEGHmmFmtL3Nt+E07Ax2aFsp
cN8wmpQ/p2boWKHx/fKK2SrVaOrwHl2fOeH+h8TXC+lTrwXYU0SSW/+YVYL134M+
XvbqHwKg6KC97l6a1YoDobKBCxflufJqopviCwW1bJeIhUU5C4lbC6nbJtkx6IRt
2UUMcxnWE2/YVpX7YIyCezjoHviZ+/0kq6XdOY4YGcmg4rwde1cvwMlgirrkuuD6
rgYTMLO9ygu5miQZaxJr0/IxwDE6ePFCXrRk6dl84I8e4z87hI9bubNECOaPJnuP
wwWJaAMjLKJmn8GGM4xgGuqLF/ffpcA4LuvX/GZ0DNEbwmkA6XbX2NnHhWOKKZH/
C/JzYo6Rruf5MySax0sVe2t8bM1rUT1jska3PCKCEQgqUKrsYlhu4RMoeVVXihpL
KjyWP3vmsXHwwNBANEsDz1XjPH0JiOr23JRHsEaPgPAfgqPZX4DjPq6DT1iBMtFk
Cg65KK2960XeekRTAC18ZHw/smQ5ArtMH9JJ92WKOzEEZ2w3Ceg=
=NzXP
-----END PGP SIGNATURE-----

--n1jso5Mq3pAfkhgA--

