Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 186D8653E47
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 11:29:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468445.727553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8Ip6-0003kU-3r; Thu, 22 Dec 2022 10:29:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468445.727553; Thu, 22 Dec 2022 10:29:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8Ip6-0003i2-0A; Thu, 22 Dec 2022 10:29:12 +0000
Received: by outflank-mailman (input) for mailman id 468445;
 Thu, 22 Dec 2022 10:29:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s9VX=4U=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p8Ip4-0003hw-CE
 for xen-devel@lists.xenproject.org; Thu, 22 Dec 2022 10:29:10 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 772f1af9-81e3-11ed-8fd4-01056ac49cbb;
 Thu, 22 Dec 2022 11:29:08 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 8493432003AC;
 Thu, 22 Dec 2022 05:29:05 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 22 Dec 2022 05:29:06 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Dec 2022 05:29:04 -0500 (EST)
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
X-Inumbo-ID: 772f1af9-81e3-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1671704945; x=
	1671791345; bh=L4yI1yZ58K4rc6vHeu1U6m4D7thRdV4nUxEZJZUCj1E=; b=L
	6kqBKnfX1By08bhPTcfGxebfevKXIsSVhHXE1yFUZ5fzyl6hjV7PiSa2RR5F5VDA
	utYfJ2HKJ446j85ObxMPH3n8lgrYr9NLjQ08dHfnTCCEmfSIH0KDnQijD0MuIzF9
	zXQQw7JlJCpuEYmyGQUp4V3x90ABIqPUXIUkeVIbhnCcVkvKurZHEeKLLxGrVSW+
	pXmZG2KwdTTwr/MXfx0ABrXYNpugmLuFNrrVSnuqgmF93scGmW8gig1FBe0+dVqn
	TmW3UH7Dfbz0GFYNY1P15mffptfXJKaUHzdwdeFLq695elf6fqK0mmj1Bh4RmekU
	kG3VQAtstmed34DTT1XRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1671704945; x=1671791345; bh=L4yI1yZ58K4rc6vHeu1U6m4D7thR
	dV4nUxEZJZUCj1E=; b=rou+Q8ILbr26SKa1q8X/uRL3bxfGlui8MWl+mGESjMwM
	UxwjglIJnLcV94td6IzvqJj5dWOK1ZsPLH6Ar0YoFHo45qSSvXgvayN6TFi6Nw87
	jgAzHwKwPF4VPYQ4KLSgIx6KjTfHYLBd5KKSQDuiKi0LS+z2lau/Fiu7kDkJCuYP
	iWGZV8sLRuiQiTl+hm7dzuLthGEV0r8mlNncrGFFYZG73duzgsvZUQx9e/4PEIqK
	CutbhzRM/E5lNdW+l67jahoGEyk5gkrCXl0xwRkRM77qpuk2XDuZxLwA8eILs1Dk
	CzDJq4HOesMkXOdqZ0DY244D3dSUMmaViYyac3mxwA==
X-ME-Sender: <xms:cDGkYz7vibYT9UOLVXLB0YGqyy2KN_ImtTC8I5OCtTq9iBBTSqWHUg>
    <xme:cDGkY46tyj72-fn_3f16zDplkjhOlvXLxyI-pI4-S3Xuv2RiMN6h2quvEEMyYkGY1
    TJnqnZKIqX_oKw>
X-ME-Received: <xmr:cDGkY6fRge7fHDYk_CjAmfWqkaqOQgyvNZkuyocwXwnRT44_HaOBMp3BjoD7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrhedtgdduiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgfefhgfejffeuvdeiudfgfeejleeh
    geetlefhffefhfeuvedtleetkeeiteehffenucffohhmrghinhepmhgrrhgtrdhinhhfoh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeguvghm
    ihesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:cDGkY0K6eYz5h_3yoAnCtWHOkW39Qjqx1J1kwY1GcYe0BdRJQ7YHIw>
    <xmx:cDGkY3JeR1o6AbPQb8ylHmej3KCnxzEYHHTKkEzsBccGXJKt9tHxiA>
    <xmx:cDGkY9w-PP1Ej20TLt7Xfxi8X9pi7HvfDx17khRV5e8MsXdNma_nQw>
    <xmx:cTGkY4XvWeEKV0LUlyGeu8SLPdgEzxt72xiFlwl1-QF98s16LT78OA>
Feedback-ID: iac594737:Fastmail
Date: Thu, 22 Dec 2022 05:28:56 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Smith, Jackson" <rsmith@riversideresearch.org>
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
Message-ID: <Y6QxbXl31xe9sqR0@itl-email>
References: <b7a367d4-a9df-0733-5a11-6ba11043c6b5@xen.org>
 <BN0P110MB1642A6DCBD15780CD8767B8CCFE19@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
 <513d0cc3-a305-5029-32f7-67993ae83c55@xen.org>
 <alpine.DEB.2.22.394.2212151725090.315094@ubuntu-linux-20-04-desktop>
 <7a7a7156-138d-a53c-fb65-a210e14bd8c1@xen.org>
 <BN0P110MB16429FF1A9FF3507A684C5B2CFEA9@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
 <alpine.DEB.2.22.394.2212211638100.4079@ubuntu-linux-20-04-desktop>
 <6cf27ac5-6371-9a9c-2df4-7f33812993f1@xen.org>
 <Y6QuEp2cL7XFuon+@itl-email>
 <fbc12084-6b2d-d25d-9875-32a44db39c5b@xen.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aPYbfZ5UutsWayr2"
Content-Disposition: inline
In-Reply-To: <fbc12084-6b2d-d25d-9875-32a44db39c5b@xen.org>


--aPYbfZ5UutsWayr2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Dec 2022 05:28:56 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Smith, Jackson" <rsmith@riversideresearch.org>
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

On Thu, Dec 22, 2022 at 10:21:57AM +0000, Julien Grall wrote:
>=20
>=20
> On 22/12/2022 10:14, Demi Marie Obenour wrote:
> > On Thu, Dec 22, 2022 at 09:52:11AM +0000, Julien Grall wrote:
> > > Hi Stefano,
> > >=20
> > > On 22/12/2022 00:38, Stefano Stabellini wrote:
> > > > On Tue, 20 Dec 2022, Smith, Jackson wrote:
> > > > > > Hi Stefano,
> > > > > >=20
> > > > > > On 16/12/2022 01:46, Stefano Stabellini wrote:
> > > > > > > On Thu, 15 Dec 2022, Julien Grall wrote:
> > > > > > > > > > On 13/12/2022 19:48, Smith, Jackson wrote:
> > > > > > > > > Yes, we are familiar with the "secret-free hypervisor" wo=
rk. As
> > > > > you
> > > > > > > > > point out, both our work and the secret-free hypervisor r=
emove the
> > > > > > > > > directmap region to mitigate the risk of leaking sensitiv=
e guest
> > > > > > > > > secrets. However, our work is slightly different because =
it
> > > > > > > > > additionally prevents attackers from tricking Xen into re=
mapping a
> > > > > > guest.
> > > > > > > >=20
> > > > > > > > I understand your goal, but I don't think this is achieved =
(see
> > > > > > > > above). You would need an entity to prevent write to TTBR0_=
EL2 in
> > > > > > > > order to fully protect it.
> > > > > > >=20
> > > > > > > Without a way to stop Xen from reading/writing TTBR0_EL2, we
> > > > > > cannot
> > > > > > > claim that the guest's secrets are 100% safe.
> > > > > > >=20
> > > > > > > But the attacker would have to follow the sequence you outlin=
es
> > > > > > above
> > > > > > > to change Xen's pagetables and remap guest memory before
> > > > > > accessing it.
> > > > > > > It is an additional obstacle for attackers that want to steal=
 other
> > > > > > guests'
> > > > > > > secrets. The size of the code that the attacker would need to=
 inject
> > > > > > > in Xen would need to be bigger and more complex.
> > > > > >=20
> > > > > > Right, that's why I wrote with a bit more work. However, the nu=
ance
> > > > > > you mention doesn't seem to be present in the cover letter:
> > > > > >=20
> > > > > > "This creates what we call "Software Enclaves", ensuring that an
> > > > > > adversary with arbitrary code execution in the hypervisor STILL=
 cannot
> > > > > > read/write guest memory."
> > > > > >=20
> > > > > > So if the end goal if really to protect against *all* sort of
> > > > > arbitrary
> > > > > > code,
> > > > > > then I think we should have a rough idea how this will look lik=
e in
> > > > > Xen.
> > > > > >=20
> > > > > >    From a brief look, it doesn't look like it would be possible=
 to
> > > > > prevent
> > > > > > modification to TTBR0_EL2 (even from EL3). We would need to
> > > > > > investigate if there are other bits in the architecture to help=
 us.
> > > > > >=20
> > > > > > >=20
> > > > > > > Every little helps :-)
> > > > > >=20
> > > > > > I can see how making the life of the attacker more difficult is
> > > > > > appealing.
> > > > > > Yet, the goal needs to be clarified and the risk with the appro=
ach
> > > > > > acknowledged (see above).
> > > > > >=20
> > > > >=20
> > > > > You're right, we should have mentioned this weakness in our first=
 email.
> > > > > Sorry about the oversight! This is definitely still a limitation =
that we
> > > > > have not yet overcome. However, we do think that the increase in
> > > > > attacker workload that you and Stefano are discussing could still=
 be
> > > > > valuable to security conscious Xen users.
> > > > >=20
> > > > > It would nice to find additional architecture features that we ca=
n use
> > > > > to close this hole on arm, but there aren't any that stand out to=
 me
> > > > > either.
> > > > >=20
> > > > > With this limitation in mind, what are the next steps we should t=
ake to
> > > > > support this feature for the xen community? Is this increase in a=
ttacker
> > > > > workload meaningful enough to justify the inclusion of VMF in Xen?
> > > >=20
> > > > I think it could be valuable as an additional obstacle for the atta=
cker
> > > > to overcome. The next step would be to port your series on top of
> > > > Julien's "Remove the directmap" patch series
> > > > https://marc.info/?l=3Dxen-devel&m=3D167119090721116
> > > >=20
> > > > Julien, what do you think?
> > >=20
> > > If we want Xen to be used in confidential compute, then we need a com=
pelling
> > > story and prove that we are at least as secure as other hypervisors.
> > >=20
> > > So I think we need to investigate a few areas:
> > >     * Can we protect the TTBR? I don't think this can be done with th=
e HW.
> > > But maybe I overlook it.
> >=20
> > This can be done by running most of Xen at a lower EL, and having only a
> > small trusted (and hopefully formally verified) kernel run at EL2.
>=20
> This is what I hinted in my 3rd bullet. :) I didn't consider this for the
> first bullet because the goal of this question is to figure out whether we
> can leave all Xen running in EL2 and still have the same guarantee.

It should be possible (see Google Native Client) but whether or not it
is useful is questionable.  I expect the complexity of the needed
compiler patches and binary-level static analysis to be greater than
that of running most of Xen at a lower exception level.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--aPYbfZ5UutsWayr2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmOkMW4ACgkQsoi1X/+c
IsHRqhAAnZ7CdZXMEIuEOjzg/klzFwKHJweSvAx/W2qXVNH2wT7WA4Pb5zCzbAl/
Bupmb/UyaM/VOpc/MEXp/ej9KqwlaJVLtTlHpZAhiLK4Q2zN2LgU3y9oteeCm3/w
NHUJKFkyPNZGpWtvCUivP2z+BDsfL4LtL+q8zPKG/G+KWVBfuC+n25g0JIB6U4pG
zm23OmsU53C8IoA6YXmmVqjWt2xeyQR5XZi5+D7aHHO/38dYOmzG5fCjpnkhxG/o
y7EIvhZZpUVvPM+V4OLAMFub3Y74/lE0Q/cqg9CqUYSHwB2Quj9BEEQ+0XkzDw3z
uWUT/F9gSQ+gDYlvOs4Mwaq2GN0TwcI3ryop6qRfOve0DNMt9rWXpxkj5/M1/hfh
nUAZYgEy+lQerMIr+UA95eVmX4tWnC3YVY92exhxBtcJNMXInF7xxk+FXjGXNwO9
1K75BW8G5E4nrRoORnb6MReMz9PbMZ3cz1RnCC0S6wMQDYNGz9PqRyxJ+l+FmGuZ
dlJa8klledV2gAsw+vNIHkSaGd1eIxvnmbRXYzL10RJenbqtYQvBDJzbsBRT6Odx
voVRSkW//Q6ArIOlpSFwNZGvNTlS3KtRxuAE6FErWf7l07WasWn8ynMdEctsqGpt
rWnI6wQHEr80UZZ1MFjqTXf+nN1sMl8CV6zHr4M6NUerssfOqYA=
=tUF4
-----END PGP SIGNATURE-----

--aPYbfZ5UutsWayr2--

