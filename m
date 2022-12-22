Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 572A1653E14
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 11:15:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468429.727531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8IbF-0001bH-MW; Thu, 22 Dec 2022 10:14:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468429.727531; Thu, 22 Dec 2022 10:14:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8IbF-0001Yd-JA; Thu, 22 Dec 2022 10:14:53 +0000
Received: by outflank-mailman (input) for mailman id 468429;
 Thu, 22 Dec 2022 10:14:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s9VX=4U=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p8IbE-0001YX-46
 for xen-devel@lists.xenproject.org; Thu, 22 Dec 2022 10:14:52 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 771a7347-81e1-11ed-91b6-6bf2151ebd3b;
 Thu, 22 Dec 2022 11:14:50 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 5EE3F32002B6;
 Thu, 22 Dec 2022 05:14:46 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 22 Dec 2022 05:14:47 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Dec 2022 05:14:44 -0500 (EST)
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
X-Inumbo-ID: 771a7347-81e1-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1671704085; x=
	1671790485; bh=d4hQQOKy6iJ8av61TnhqJDsEqSJLdzv2T/PAZ6luOGw=; b=Z
	stogLlCJGcqYzW9thp0CdpCUTrw5V1y+OTeerCf3od5s0JZVDsbpI+U5sqKaDcFj
	0HFbY4aCKGNsiM1aoOrAEd53qr7G6tqvVWaJGXb+06uss6sNXsBsp4QZ7wdp1w5u
	X1B/krXD9roSYOrIVTraxQEi6JldPRcmcRp3MQTSFcANHi+yAZcg7txgBbGzbHi1
	wi6D7sr79oi9eyZqeKgIPz1Pbq/7Iol9zW0pnqLCfEZjiWIVXL+3rRSiH2rQpD7o
	J++Wmo1wJA9nfMN0tWx1VdCLx5qIQaTNKvWMgMVOWEdVXDZ1iUG1s8gCoLBIhezY
	1IZwj3BqtLrWPzhl7tfhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1671704085; x=1671790485; bh=d4hQQOKy6iJ8av61TnhqJDsEqSJL
	dzv2T/PAZ6luOGw=; b=UVeV3hllV4+M/8mJQsTscNH7hR9CXDJ3IpK9/bb780ug
	gsIcTxoccw8U5aj9hR4UJ/vUk6JMFV7sqzNLGG0GYSHTYIpWRVW6823jTumN7YO3
	9pu3Da9cHOoU4KmIRM0f2zK27fqW/fUC0xFi1vMsdXcTUoLEVfojb03gxWObsxzi
	TBFzEMDjb1DOBm1bTBphCCsISSvBkV6pX+WeBn+x7zfON017JOX5srOck0//l8T8
	GV42imGm3KyHkZlmFs/nbMNkAOb0HyvVoLCdl0cisHcZendizui0mbsUaD2z/A9Q
	dKwf9zAYFMubiBJhWPryXGtpVYKMSC2/KbN04eh81g==
X-ME-Sender: <xms:FS6kYzM39aLvu2sKe4fjvkAXHntBWr5I1ttqi1JBEHcA9YkUp936cA>
    <xme:FS6kY99u-hYljtSF_Uf65s-5ItUrWWDpfEtz_xuSzOpA0ilP974BJBiOMiIl4tFFu
    kwi5UDjvKk5Gnc>
X-ME-Received: <xmr:FS6kYyTnMVdF4akLHO50Y6JpIbrclXPd8pBAT9NvGI3CGOSRQAnNlpO5sn1e>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrhedtgdduvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeevteeilefhveetgfegueekjedtgfdv
    feelleeigedtheevhfdufedufeeffeejjeenucffohhmrghinhepmhgrrhgtrdhinhhfoh
    dplhifnhdrnhgvthenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:FS6kY3su_Yd-gl1LRQa538qZBcuCI740UEsbUXtF86U0BRbYyptW1g>
    <xmx:FS6kY7cQNx4yz0lTHq-z2KcP_4LB-dR1sQ0ql-oXv1HNMFb6QU3C6g>
    <xmx:FS6kYz0kEfLgET8QK8uKpNP_vapMj1AKSFBQy6wMeRnhuPMDTft8jg>
    <xmx:FS6kY_7jds5lzap1HBczkfKJpQ6ShthEgHoFeiLAJL4dG7ILGdLP-w>
Feedback-ID: iac594737:Fastmail
Date: Thu, 22 Dec 2022 05:14:38 -0500
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
Message-ID: <Y6QuEp2cL7XFuon+@itl-email>
References: <BN0P110MB1642835E0DE845205B5EA59CCFE39@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
 <b7a367d4-a9df-0733-5a11-6ba11043c6b5@xen.org>
 <BN0P110MB1642A6DCBD15780CD8767B8CCFE19@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
 <513d0cc3-a305-5029-32f7-67993ae83c55@xen.org>
 <alpine.DEB.2.22.394.2212151725090.315094@ubuntu-linux-20-04-desktop>
 <7a7a7156-138d-a53c-fb65-a210e14bd8c1@xen.org>
 <BN0P110MB16429FF1A9FF3507A684C5B2CFEA9@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
 <alpine.DEB.2.22.394.2212211638100.4079@ubuntu-linux-20-04-desktop>
 <6cf27ac5-6371-9a9c-2df4-7f33812993f1@xen.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g7zOSGDJOtCNweLt"
Content-Disposition: inline
In-Reply-To: <6cf27ac5-6371-9a9c-2df4-7f33812993f1@xen.org>


--g7zOSGDJOtCNweLt
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Dec 2022 05:14:38 -0500
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

On Thu, Dec 22, 2022 at 09:52:11AM +0000, Julien Grall wrote:
> Hi Stefano,
>=20
> On 22/12/2022 00:38, Stefano Stabellini wrote:
> > On Tue, 20 Dec 2022, Smith, Jackson wrote:
> > > > Hi Stefano,
> > > >=20
> > > > On 16/12/2022 01:46, Stefano Stabellini wrote:
> > > > > On Thu, 15 Dec 2022, Julien Grall wrote:
> > > > > > > > On 13/12/2022 19:48, Smith, Jackson wrote:
> > > > > > > Yes, we are familiar with the "secret-free hypervisor" work. =
As
> > > you
> > > > > > > point out, both our work and the secret-free hypervisor remov=
e the
> > > > > > > directmap region to mitigate the risk of leaking sensitive gu=
est
> > > > > > > secrets. However, our work is slightly different because it
> > > > > > > additionally prevents attackers from tricking Xen into remapp=
ing a
> > > > guest.
> > > > > >=20
> > > > > > I understand your goal, but I don't think this is achieved (see
> > > > > > above). You would need an entity to prevent write to TTBR0_EL2 =
in
> > > > > > order to fully protect it.
> > > > >=20
> > > > > Without a way to stop Xen from reading/writing TTBR0_EL2, we
> > > > cannot
> > > > > claim that the guest's secrets are 100% safe.
> > > > >=20
> > > > > But the attacker would have to follow the sequence you outlines
> > > > above
> > > > > to change Xen's pagetables and remap guest memory before
> > > > accessing it.
> > > > > It is an additional obstacle for attackers that want to steal oth=
er
> > > > guests'
> > > > > secrets. The size of the code that the attacker would need to inj=
ect
> > > > > in Xen would need to be bigger and more complex.
> > > >=20
> > > > Right, that's why I wrote with a bit more work. However, the nuance
> > > > you mention doesn't seem to be present in the cover letter:
> > > >=20
> > > > "This creates what we call "Software Enclaves", ensuring that an
> > > > adversary with arbitrary code execution in the hypervisor STILL can=
not
> > > > read/write guest memory."
> > > >=20
> > > > So if the end goal if really to protect against *all* sort of
> > > arbitrary
> > > > code,
> > > > then I think we should have a rough idea how this will look like in
> > > Xen.
> > > >=20
> > > >   From a brief look, it doesn't look like it would be possible to
> > > prevent
> > > > modification to TTBR0_EL2 (even from EL3). We would need to
> > > > investigate if there are other bits in the architecture to help us.
> > > >=20
> > > > >=20
> > > > > Every little helps :-)
> > > >=20
> > > > I can see how making the life of the attacker more difficult is
> > > > appealing.
> > > > Yet, the goal needs to be clarified and the risk with the approach
> > > > acknowledged (see above).
> > > >=20
> > >=20
> > > You're right, we should have mentioned this weakness in our first ema=
il.
> > > Sorry about the oversight! This is definitely still a limitation that=
 we
> > > have not yet overcome. However, we do think that the increase in
> > > attacker workload that you and Stefano are discussing could still be
> > > valuable to security conscious Xen users.
> > >=20
> > > It would nice to find additional architecture features that we can use
> > > to close this hole on arm, but there aren't any that stand out to me
> > > either.
> > >=20
> > > With this limitation in mind, what are the next steps we should take =
to
> > > support this feature for the xen community? Is this increase in attac=
ker
> > > workload meaningful enough to justify the inclusion of VMF in Xen?
> >=20
> > I think it could be valuable as an additional obstacle for the attacker
> > to overcome. The next step would be to port your series on top of
> > Julien's "Remove the directmap" patch series
> > https://marc.info/?l=3Dxen-devel&m=3D167119090721116
> >=20
> > Julien, what do you think?
>=20
> If we want Xen to be used in confidential compute, then we need a compell=
ing
> story and prove that we are at least as secure as other hypervisors.
>=20
> So I think we need to investigate a few areas:
>    * Can we protect the TTBR? I don't think this can be done with the HW.
> But maybe I overlook it.

This can be done by running most of Xen at a lower EL, and having only a
small trusted (and hopefully formally verified) kernel run at EL2.

>    * Can VMF be extended to more use-cases? For instances, for hypercalls,
> we could have bounce buffer.
>    * If we can't fully secure VMF, can the attack surface be reduced (e.g.
> disable hypercalls at runtime/compile time)? Could we use a different
> architecture (I am thinking something like pKVM [1])?
>=20
> Cheers,
>=20
> [1] https://lwn.net/Articles/836693/

pKVM has been formally verified already, in the form of seKVM.  So there
very much is precident for this.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--g7zOSGDJOtCNweLt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmOkLhMACgkQsoi1X/+c
IsEAaA/7B2XFIv6QNRi5gn6zwBQv6PsOZEslydU3ZIxDZalFzWudnJWhwpVKdQJs
iBueWZ2AaWA0kJOIhSID/2csAb/sr/CulJCWFYVDIkJP7/5G1NBbLB7SNSpg5F8V
Sq1sVne3/LOFCeC+r0+lWN8C5fzJPejMPzZJjTSQ5tf/P4GB+ujJe+maTmb1ylgN
d+Q3JT+XpnG1a+55HtdWyWcWpH0syHXek6QSf8KrZ/94If4W2G627jcXtY9O2lus
71LjasQUK/W8AKnwRYC2TdXcCQS1ZNhuytWdA2NoAcge7rMNLgAOlsGS0Coboz1H
ORQVx9hJr2Xo2Df0JWem6j1WeW3qQHL1KJq4QNsH2AGYDz9rT8fEzjlOzd2lC8AD
w3KyLUiy/xc/RJ2tOevYELWMxITCifQYb11umhAR8nuVyeaMGiOgCfYDfmOxo1xd
cBaEkZHVCBAyjy/EjPGyPTbgOvZDq0ixf0GODYvMhM33bYSB0OgGimCeutGfzWwZ
cOUYFEj1TENbYcmOOkdF3TyBue3+kqin/eJHxBmuc2vvKwYA2UNrn1bWv44AqUzq
Tlj9fvUquQ5BmsweXibhkmQ+2WcQdACIgbgTm+s5inipHeMXp+hoamhG3iB/7fhI
u3fvv+Fr+OFdv8dwAxMGgNwJoOeAf9oyXmEw62TxKjazyvwANFc=
=sY2p
-----END PGP SIGNATURE-----

--g7zOSGDJOtCNweLt--

