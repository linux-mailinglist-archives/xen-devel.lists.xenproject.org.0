Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9A564C1E9
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 02:38:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461534.719631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5GjC-0007Eg-TU; Wed, 14 Dec 2022 01:38:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461534.719631; Wed, 14 Dec 2022 01:38:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5GjC-0007BL-N4; Wed, 14 Dec 2022 01:38:34 +0000
Received: by outflank-mailman (input) for mailman id 461534;
 Wed, 14 Dec 2022 01:38:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IksU=4M=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p5GjB-0007BF-LQ
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 01:38:33 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03717c09-7b50-11ed-8fd2-01056ac49cbb;
 Wed, 14 Dec 2022 02:38:31 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id AF7D45C017F;
 Tue, 13 Dec 2022 20:38:30 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 13 Dec 2022 20:38:30 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Dec 2022 20:38:29 -0500 (EST)
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
X-Inumbo-ID: 03717c09-7b50-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1670981910; x=
	1671068310; bh=4EvO4EjpuT5PqkbOxBE4XWZGMp84vpwN7Pun9n+xRcI=; b=a
	IOZhlGIE8oMthkLWBTV6tNwWPJg5pRfUGCy+ijcWlwdIETOmnZrM4xgDkEiI+esl
	Gq6e1QAcEGcbj2ZMNTdPIhenqVyJ193ISuR6ktwS7IXxstdSeSwacrj1+QGR1wLS
	jwhHq0S2Bq/grD3F91TOMFmJCA9eXOkODTbJuEFe1r42KlvlAJIQ/4OaGzT0pfDq
	2sZbckvLMTIWTa1tLBxIU1RvEOaKg93IXZaiXWaeG/Jm+Tde29v+8y1NRW0aeG+8
	VRSh2UaZOIqIm1ZsgQMKdQq7sJuObssDre5d3e9/LA1CSa5kLbiGnKfq89nj5O2c
	4bpWFIV5EWZ4e/PqnwHuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1670981910; x=1671068310; bh=4EvO4EjpuT5PqkbOxBE4XWZGMp84
	vpwN7Pun9n+xRcI=; b=Zu7G7Xcr/fOJFOJYLNuXNbLBHNGoW6FpPSenJzbiRE2E
	Rspx9ZSnXcwIuT8e7dxVuSZt2yze8kzvBO0dzaiFWjKUrWI/uj2w71NRy3pLNqWI
	2sRoku420nURgZwpN5nQbBKYW+wJXJnszps2B9D3Tuu86h23lZWpZ5fdIHqCxHYy
	ASDXsWaODIZSYNARw1WYXyaLlcokBXsMV8ascTvReRSzSnw/O7lx5fVbCr11bR1K
	RssSdWeAcH2IQpX0MnhySqDFRUQ6TiG4KplTZtQZ1WsHy0DWQjPB7ZCDqeJWcSqx
	v21TF9jmcuFejJB/Pc7i3hla13dBDVGRxM0gzTWN+A==
X-ME-Sender: <xms:FimZY2pvclI1egvormuLfCPzVofvXa3DjPxXm0g75EII98DY5cIY1Q>
    <xme:FimZY0rIgNQSPo1UBMSxLrExwFcF2MipQEDKP1R87ZvBTiWIW_a6QHTtaaN5VokIn
    yDyGhT2e1NDi0g>
X-ME-Received: <xmr:FimZY7MbYPb3xrPpOy2273F_qg-YH555dB-GfHIODXBJXglFA8m98WACA18N>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedvgdefhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvjeetgeekhfetudfhgfetffegfffg
    uddvgffhffeifeeikeektdehgeetheffleenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:FimZY14Jtkfbcv7NO7TXXLXrKMbbpbVoYfgUilN2PZj1ZZm64fVwbg>
    <xmx:FimZY1412He-oRdklh7clnI0WqWUGjtORemAEJa2NQG0l0NBx094ZQ>
    <xmx:FimZY1jJj36TlEnUR_5VVDgjEz95CnlMCAgT5aRHZ-pwktHRQoDfFw>
    <xmx:FimZY6E9-DxwRe2zph_85BICrWUyeKlaVibRb0dkyEQSSO7Qb2QuXw>
Feedback-ID: iac594737:Fastmail
Date: Tue, 13 Dec 2022 20:38:26 -0500
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
Subject: Re: [RFC 3/4] Add xen superpage splitting support to arm
Message-ID: <Y5kpFMp38Yg7If/Y@itl-email>
References: <BN0P110MB1642835E0DE845205B5EA59CCFE39@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
 <BN0P110MB1642CCC518921DC7F2BB3BB3CFE39@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
 <c8f9e15a-81d1-ef8c-0baf-1758e7d89eee@xen.org>
 <Y5j5/qinMwxizxMc@itl-email>
 <dd6a05d5-5c3d-7a65-9951-b9c0aabadc81@xen.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M6mo/HmIjDqfcmrC"
Content-Disposition: inline
In-Reply-To: <dd6a05d5-5c3d-7a65-9951-b9c0aabadc81@xen.org>


--M6mo/HmIjDqfcmrC
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Dec 2022 20:38:26 -0500
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
Subject: Re: [RFC 3/4] Add xen superpage splitting support to arm

On Tue, Dec 13, 2022 at 11:07:55PM +0000, Julien Grall wrote:
> Hi Demi,
>=20
> On 13/12/2022 22:17, Demi Marie Obenour wrote:
> > On Tue, Dec 13, 2022 at 09:15:49PM +0000, Julien Grall wrote:

[snip]

> > > > +
> > > > +    /*
> > > > +     * Generate the entry for this new table we created,
> > > > +     * and write it back in place of the superpage entry.
> > > > +     */
> > >=20
> > > I am afraid this is not compliant with the Arm Arm. If you want to up=
date
> > > valid entry (e.g. shattering a superpage), then you need to follow the
> > > break-before-make sequence. This means that:
> > >    1. Replace the valid entry with an entry with an invalid one
> > >    2. Flush the TLBs
> > >    3. Write the new entry
> > >=20
> > > Those steps will make your code compliant but it also means that a vi=
rtual
> > > address will be temporarily invalid so you could take a fault in the =
middle
> > > of your split if your stack or the table was part of the region. The =
same
> > > could happen for the other running CPUs but this is less problematic =
as they
> > > could spin on the page-table lock.
> >=20
> > Could this be worked around by writing the critical section in
> > assembler?
>=20
> Everything is feasible. Is this worth it? I don't think so. There are way=
 we
> can avoid the shattering at first by simply not mapping all the RAM.

Good point.  I do wonder what would go wrong if one replaced one live
PTE with another that pointed to the same physical address.  Is this
merely a case of =E2=80=9Cspec doesn=E2=80=99t allow it=E2=80=9D, or does i=
t actually break on
real hardware?

> > The assembler code would never access the stack and would
> > run with interrupts disabled.  There could also be BUG() checks for
> > attempting to shatter a PTE that was needed to access the PTE in
> > question, though I suspect one can work around this with a temporary
> > PTE.  That said, shattering large pages requires allocating memory,
> > which might fail.  What happens if the allocation does fail?
>=20
> If this is only done during boot, then I would argue you will want to cra=
sh
> Xen.

Fair!  Even NASA=E2=80=99s coding standards for spacecraft allow for dynamic
allocation during initialization.  After all, initialization is
typically deterministic and easy to test.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--M6mo/HmIjDqfcmrC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmOZKRMACgkQsoi1X/+c
IsEZOQ//SaV7lrEwUq406S9M54mcBzrcJCwa6BajG7QysXxDypFV+vr6F83JV0Vb
DfGq6j9NXBy3BU3LNDt4JfwEacoSacBy7xWb+TcBbqFtTC3qc3oMHj5EYqRoWylE
I5SKwp/G/SiDFKOfrol7fJylbUKqJUHuXVaScolkxSt5ejP/j8fWmVMObHowTvjJ
s003hd2gTTvjB9IpElv2eMD7P3PW/kvlZKJMQPpR+WdjIG+9A/t3VWtt+AISJDt1
7A7wnr4tcXIDQ+qygD3hs/Ki9tuhrn7w7z9WEFfkj1DnApT5A7s7PR45AWFjOnmV
lGt+a58HnGIo3U6h7yx8Y2tJIR1RhZM2kUSdiZoTkSrRzuPnH/nY+s6Y2wEL+nL9
iSpBiS2DadvFU64to/Hrk0ci8eIW0zzMDVES0XPWWarc6L9p5sxkCi26kID67NsA
d/WyHFGBqMGPICP4QWt99HX6JiVKqERJGj1RXkLWGfYDckTGhcFHa/3Yqzd288fD
6t2i11l1fN7nBNr56qhfoY8qwwRTOrFQWT3btXlmUR5elprC/Wu0vsr8P99PcvV6
aYE031fPjqh5UavyzMZNvhQUXvbWdo/AOsf7wNkBx9g665JOgoVuK0fR2RpZQ1cb
4WvnthWzhz8QzwSlvrV9LjtlBrAzp6m9S0r0AGMUFkiFR45Vhlc=
=vZvL
-----END PGP SIGNATURE-----

--M6mo/HmIjDqfcmrC--

