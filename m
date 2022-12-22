Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D4A653B51
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 05:34:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468195.727255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8DGw-0004sH-AP; Thu, 22 Dec 2022 04:33:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468195.727255; Thu, 22 Dec 2022 04:33:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8DGw-0004ph-7l; Thu, 22 Dec 2022 04:33:34 +0000
Received: by outflank-mailman (input) for mailman id 468195;
 Thu, 22 Dec 2022 04:33:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s9VX=4U=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p8DGu-0004pb-Oc
 for xen-devel@lists.xenproject.org; Thu, 22 Dec 2022 04:33:33 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c82cdfe4-81b1-11ed-91b6-6bf2151ebd3b;
 Thu, 22 Dec 2022 05:33:29 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 93FB73200913;
 Wed, 21 Dec 2022 23:33:26 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 21 Dec 2022 23:33:27 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Dec 2022 23:33:25 -0500 (EST)
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
X-Inumbo-ID: c82cdfe4-81b1-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1671683606; x=
	1671770006; bh=yxURv5WPUrvXMm5xttfE+Wtca1FDuYyDbhvNAavxqWk=; b=l
	EHi012hWirdLArh/D1oRyLTIoGNsk+HznKca5pYoTABRKu6QQXymZ16NQ67tYu6G
	HX/My3b4pYQkNrz2rDr2gFkwDXqVf3EaPIRxcGXPW3GkBYREfGYMDT1fLBOfTC1w
	DM7Ca0DfdobzE/U/vUqKOE/MTdPlHZ9kazribgl923IsWkwDlRPnk0RQFPTEuNAN
	kVZc4t+QqX34OPMBp0LfaIKI2rZDVNsVRLfQ+5s2j/zo2CIiVL/dudSnqCU2WMdi
	20YtBpfULRKJbKZgTCaha0oEcltl1SsNdMBnOczq28uZn/dxpdOXBIvjoIUiSGmM
	d7kKXR9aY0DArgIYsUK5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1671683606; x=1671770006; bh=yxURv5WPUrvXMm5xttfE+Wtca1FD
	uYyDbhvNAavxqWk=; b=IHlFPd6AjMHNGsvgUVE+XnBiqqmYeanubNxmGq6/MSbi
	JG3ve0iKQK9B5Nt8DP8P+TZtGAHU9cSItAcC4vulUfGJ1lLp05FRP5xz11GX6BXp
	KYTlvFAhwj19pKXzgsKZISKJA4rD8vC72BLyNmIGb8sTgosoiPY9Ooew6XGVNj33
	Ozwn132HZ3NYExpA+Cy+bfzgA2j3G7LkBbTNfJf3CTabD94v+zUculWRb54WChJX
	CmE0lFPeT48jWrZUpOvoh2on6OdGpsraU9ZO666Uqcx4i7Olue8DCXIwBzBfmF2m
	ZkFz8jSmsjpvDzihEVOS4Ov+IqJmUwVUKXx9dPN9ww==
X-ME-Sender: <xms:Fd6jY-8S5r_ReJB0mfx7E9ZyTva7ydljRlpso6Yin_b_mB3RJhYatg>
    <xme:Fd6jY-vlQmg1j_g2wTnyBeRhf6AhQkzOdkrdVCdHTkFTdrmJbGRPdTQeGuMOzZTc1
    RcFMInbOaiAmkg>
X-ME-Received: <xmr:Fd6jY0BfETXn9w-56jotmqjs6C_N8jlpP8TfrW3y1K4ODGCNKs3-HXui9u8v>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeelgdejhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvjeetgeekhfetudfhgfetffegfffg
    uddvgffhffeifeeikeektdehgeetheffleenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:Fd6jY2d63Mel_QFeQJtVAE0NJ47Fb0ssX7uOUIg12gPtYK2w2obO3g>
    <xmx:Fd6jYzNsEJShu-Gr9MLvfErU0Cb7qCsPsE5dSYsil3_52pFmvkX0Hg>
    <xmx:Fd6jYwmAHkYEEkNOyn11Zz9IZcA_XtoTANhmhwxpLDe2Z0tivLe09A>
    <xmx:Ft6jY-oCsatzQPX8b7uQPdX987ysrlb1nAn85wLDjWBIGXkT0tGsRQ>
Feedback-ID: iac594737:Fastmail
Date: Wed, 21 Dec 2022 23:33:19 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: "Smith, Jackson" <rsmith@riversideresearch.org>,
	Julien Grall <julien@xen.org>,
	"Brookes, Scott" <sbrookes@riversideresearch.org>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	"bertrand.marquis@arm.com" <bertrand.marquis@arm.com>,
	"jbeulich@suse.com" <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>
Subject: Re: [RFC 0/4] Adding Virtual Memory Fuses to Xen
Message-ID: <Y6PeE3Gtq7e1Z1hD@itl-email>
References: <BN0P110MB1642835E0DE845205B5EA59CCFE39@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
 <b7a367d4-a9df-0733-5a11-6ba11043c6b5@xen.org>
 <BN0P110MB1642A6DCBD15780CD8767B8CCFE19@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
 <513d0cc3-a305-5029-32f7-67993ae83c55@xen.org>
 <alpine.DEB.2.22.394.2212151725090.315094@ubuntu-linux-20-04-desktop>
 <7a7a7156-138d-a53c-fb65-a210e14bd8c1@xen.org>
 <BN0P110MB16429FF1A9FF3507A684C5B2CFEA9@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
 <Y6I3oqYdTKa/57I/@itl-email>
 <alpine.DEB.2.22.394.2212211639070.4079@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="inoC5Ff6QM7O1xw6"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2212211639070.4079@ubuntu-linux-20-04-desktop>


--inoC5Ff6QM7O1xw6
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Dec 2022 23:33:19 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: "Smith, Jackson" <rsmith@riversideresearch.org>,
	Julien Grall <julien@xen.org>,
	"Brookes, Scott" <sbrookes@riversideresearch.org>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	"bertrand.marquis@arm.com" <bertrand.marquis@arm.com>,
	"jbeulich@suse.com" <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>
Subject: Re: [RFC 0/4] Adding Virtual Memory Fuses to Xen

On Wed, Dec 21, 2022 at 04:53:46PM -0800, Stefano Stabellini wrote:
> On Tue, 20 Dec 2022, Demi Marie Obenour wrote:
> > On Tue, Dec 20, 2022 at 10:17:24PM +0000, Smith, Jackson wrote:
> > > > Hi Stefano,
> > > >
> > > > On 16/12/2022 01:46, Stefano Stabellini wrote:
> > > > > On Thu, 15 Dec 2022, Julien Grall wrote:
> > > > >>>> On 13/12/2022 19:48, Smith, Jackson wrote:
> > > > >>> Yes, we are familiar with the "secret-free hypervisor" work. As
> > > you
> > > > >>> point out, both our work and the secret-free hypervisor remove =
the
> > > > >>> directmap region to mitigate the risk of leaking sensitive guest
> > > > >>> secrets. However, our work is slightly different because it
> > > > >>> additionally prevents attackers from tricking Xen into remappin=
g a
> > > > guest.
> > > > >>
> > > > >> I understand your goal, but I don't think this is achieved (see
> > > > >> above). You would need an entity to prevent write to TTBR0_EL2 in
> > > > >> order to fully protect it.
> > > > >
> > > > > Without a way to stop Xen from reading/writing TTBR0_EL2, we
> > > > cannot
> > > > > claim that the guest's secrets are 100% safe.
> > > > >
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
> > > >
> > > > Right, that's why I wrote with a bit more work. However, the nuance
> > > > you mention doesn't seem to be present in the cover letter:
> > > >
> > > > "This creates what we call "Software Enclaves", ensuring that an
> > > > adversary with arbitrary code execution in the hypervisor STILL can=
not
> > > > read/write guest memory."
> > > >
> > > > So if the end goal if really to protect against *all* sort of
> > > arbitrary=20
> > > > code,
> > > > then I think we should have a rough idea how this will look like in
> > > Xen.
> > > >
> > > >  From a brief look, it doesn't look like it would be possible to
> > > prevent
> > > > modification to TTBR0_EL2 (even from EL3). We would need to
> > > > investigate if there are other bits in the architecture to help us.
> > > >
> > > > >
> > > > > Every little helps :-)
> > > >
> > > > I can see how making the life of the attacker more difficult is=20
> > > > appealing.
> > > > Yet, the goal needs to be clarified and the risk with the approach
> > > > acknowledged (see above).
> > > >
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
> > Personally, I don=E2=80=99t think so.  The kinds of workloads VMF is us=
able
> > for (no hypercalls) are likely easily portable to other hypervisors,
> > including formally verified microkernels such as seL4 that provide...=
=20
>=20
> What other hypervisors might or might not do should not be a factor in
> this discussion and it would be best to leave it aside.

Indeed so, sorry.

> From an AMD/Xilinx point of view, most of our customers using Xen in
> productions today don't use any hypercalls in one or more of their VMs.
> Xen is great for these use-cases and it is rather common in embedded.
> It is certainly a different configuration from what most are come to
> expect from Xen on the server/desktop x86 side. There is no question
> that guests without hypercalls are important for Xen on ARM.

I was completely unaware of this.

> As a Xen community we have a long history and strong interest in making
> Xen more secure and also, more recently, safer (in the ISO 26262
> safety-certification sense). The VMF work is very well aligned with both
> of these efforts and any additional burder to attackers is certainly
> good for Xen.

That it is.

> Now the question is what changes are necessary and how to make them to
> the codebase. And if it turns out that some of the changes are not
> applicable or too complex to accept, the decision will be made purely
> from a code maintenance point of view and will have nothing to do with
> VMs making no hypercalls being unimportant (i.e. if we don't accept one
> or more patches is not going to have anything to do with the use-case
> being unimportant or what other hypervisors might or might not do).

--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--inoC5Ff6QM7O1xw6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmOj3hIACgkQsoi1X/+c
IsGIwg/+OSpgJxbIkWz9qq8erp8oXV/sCyLUp0i83GEkfL7UGBX+muUBoIslBJcw
DnrrrahrduaVCVXAD7IM/k9f4BdnscYGHTA0OF4nVU0mDKuj7KOQQ0iqR7SthMcu
5TTt5l8sq8NNgmLJVh3q/gPz+6kH3bDaaMmCZWTNbQ3W43yOMFSZ4CyclNBqkC7a
Unst4C9VqfDnqdoBHuuhLu/aSLgYNq2mCZkf5FZv5n+LT8t7I0mOUfnySZoOjVnB
/nV1QJXKL5Z/qNvj8XziX4mnzVeLiyN/6+7ewgNCv5fhUmcr37jpAbBpMxFatm8r
/7QbeAh8RDKatqaye1Nrcq8CvHZfkxynV1lMJnIioacmF0CnHQF3TpGJesvat+ty
f9ej1WSiGrMVYURIPs68Con5Mb2vNKf6JEZzv4ksAp1idC1rPgrTsyUOfWOPDXiG
0LlNipAk7rhlZAD62zwXT8la+pY8Kuc65E3g+0eZubWoCrkoo4LNOFEQw7dbhDDl
kX4s7m5Y4gYkGhTTRUlJWkNV0HAIKH/KVwQQDWOTEMOWS/stXVm2EvVHLZBL9MM0
0PQvZ2BBx5p9xGAMtJzBWTiaPFwDbuJsLUaCvPCxzM1E05HrUaUTxWuCeag8F/T1
SqOy7yFUjus5oiwgBtYovTgNOxNNCBrt9qPRjgBAX7pxGroOCFA=
=sCdv
-----END PGP SIGNATURE-----

--inoC5Ff6QM7O1xw6--

