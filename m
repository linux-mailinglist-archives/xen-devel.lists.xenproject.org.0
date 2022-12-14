Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F8A64C1D9
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 02:29:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461524.719617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5GZv-0005dz-Sr; Wed, 14 Dec 2022 01:28:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461524.719617; Wed, 14 Dec 2022 01:28:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5GZv-0005bO-Q7; Wed, 14 Dec 2022 01:28:59 +0000
Received: by outflank-mailman (input) for mailman id 461524;
 Wed, 14 Dec 2022 01:28:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IksU=4M=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p5GZt-0005bH-QG
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 01:28:58 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id abcf4636-7b4e-11ed-91b6-6bf2151ebd3b;
 Wed, 14 Dec 2022 02:28:55 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 85A405C018C;
 Tue, 13 Dec 2022 20:28:53 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 13 Dec 2022 20:28:53 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Dec 2022 20:28:52 -0500 (EST)
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
X-Inumbo-ID: abcf4636-7b4e-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1670981333; x=
	1671067733; bh=bW+6nZ6X+HdfQiDzZQYpMKlivPvU5Aik6D+P6x0U79M=; b=P
	dkkJ87pVs+hEttzhzQjcoBpHRjiRtcXcwHmleT0JLGmNzcsSqt47k9x1q9HbNivu
	r0dhzwFA6ZqgP/jTYoYf0CZSZBcG3HjA+Egib6uUoXxS9D/Iccwl6//hTjFmW3MN
	SwwdbVFywTvtgFvxGZh87Anj+ujBJzgbhdDXQwPN9h82cL+WSlcw6wgJIHK5CTT2
	4kLXgfJ9veO1Sh7uejT/srgGPvpW50jqhgWMcD1eqjQmf4NL/O/wLLKc+3ZrxUJY
	+UheW5pT/h3QZrEBUmFfS6wJN2dqhR5V1ADe2GGsTeCicTu/IhBJgpWeHAYApagk
	4xLiGe43eGGnoacc+5H5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1670981333; x=1671067733; bh=bW+6nZ6X+HdfQiDzZQYpMKlivPvU
	5Aik6D+P6x0U79M=; b=F7PtiWsUNbm5eBiwijb/8yUVC6zEmaTiwjS6EUJQJhbj
	W+oXJ0loppxx7yT6IS9feLDaWPfn0UyOZVbIK5Pr7dnmw0voYcSXGVvlqI+cmhXD
	7omaPjLQ/c7kCTk7aRl9hf84LimDsdGIOVbbFIBGwITmtoyz9VqaaXwP89/fP8l+
	Dnm6plJXuWrBy0Ac2n8yXm8UbCt6RFyjkmJpWdJZk0r20PkzQGCdQPhZ1JBTcTzM
	VGKNXZ6N0Uoc/0oLfOHzDzLKbcK+JQTVE5ivRsXWzYAslxk4oO/KmnX0IWW72gNI
	yRw1PN3VKrvWCw3XQabMUSyLbFpfAZU0jQp+KKP2CQ==
X-ME-Sender: <xms:1SaZYxmBRYYlHEHOXwJUwSUGU4GRG1TdHwTSlFCZ6QHzd7DXMtMraw>
    <xme:1SaZY82Jlpa5pVKIdKbq0uTkXNWHg1lpWO1GRyxZjrobukY7BpZ5Tx3VIFU6623N3
    0w8V08Qr71iXO0>
X-ME-Received: <xmr:1SaZY3oyQyQiGXKKmxxfHjlJATQDVR30TENa5-wWnjHsYaR-t-j5sJqrOXYB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedvgdeffecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvjeetgeekhfetudfhgfetffegfffg
    uddvgffhffeifeeikeektdehgeetheffleenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:1SaZYxmGUWm0T2ajjd8bqye5zY02xB0TOv6Ybzsll4RyRDbac7ihBA>
    <xmx:1SaZY_1SgJ8B17Cc_n5599VSSc-MHzswVKoKSLzi4pTBpW0iCTNYAQ>
    <xmx:1SaZYwtAVZxXQ4cmvcH4TbiARWfT1nyHJcvIo5e4M61MWhR52GEUpw>
    <xmx:1SaZY4ueRYvWTyD3HM73i_iL8z174d33xuRqt8b5JvDwpb-EEklrKg>
Feedback-ID: iac594737:Fastmail
Date: Tue, 13 Dec 2022 20:28:45 -0500
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
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [RFC 0/4] Adding Virtual Memory Fuses to Xen
Message-ID: <Y5km0/9Nb7gJTxGq@itl-email>
References: <BN0P110MB1642835E0DE845205B5EA59CCFE39@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
 <b7a367d4-a9df-0733-5a11-6ba11043c6b5@xen.org>
 <Y5j7KQ9g5Yb/ufn+@itl-email>
 <901d2088-49e7-634f-f55b-e4ea2e706fed@xen.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iRoJtQnmne3JpMVv"
Content-Disposition: inline
In-Reply-To: <901d2088-49e7-634f-f55b-e4ea2e706fed@xen.org>


--iRoJtQnmne3JpMVv
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Dec 2022 20:28:45 -0500
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
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [RFC 0/4] Adding Virtual Memory Fuses to Xen

On Tue, Dec 13, 2022 at 11:05:49PM +0000, Julien Grall wrote:
> Hi Demi,
>=20
> On 13/12/2022 22:22, Demi Marie Obenour wrote:
> > On Tue, Dec 13, 2022 at 08:55:28PM +0000, Julien Grall wrote:
> > > On 13/12/2022 19:48, Smith, Jackson wrote:
> > > > Hi Xen Developers,
> > >=20
> > > Hi Jackson,
> > >=20
> > > Thanks for sharing the prototype with the community. Some questions/r=
emarks
> > > below.
> >=20
> > [snip]
> >=20
> > > > With this technique, we protect the integrity and confidentiality of
> > > > guest memory. However, a compromised hypervisor can still read/write
> > > > register state during traps, or refuse to schedule a guest, denying
> > > > service. We also recognize that because this technique precludes
> > > > modifying Xen's page tables after startup, it may not be compatible
> > > > with all of Xen's potential use cases. On the other hand, there are
> > > > some uses cases (in particular statically defined embedded systems)
> > > > where our technique could be adopted with minimal friction.
> > >=20
> > >  From what you wrote, this sounds very much like the project Citrix a=
nd
> > > Amazon worked on called "Secret-free hypervisor" with a twist. In you=
r case,
> > > you want to prevent the hypervisor to map/unmap the guest memory.
> > >=20
> > > You can find some details in [1]. The code is x86 only, but I don't s=
ee any
> > > major blocker to port it on arm64.
> >=20
> > Is there any way the secret-free hypervisor code could be upstreamed?
> This has been in my todo list for more than year but didn't yet find anyo=
ne
> to finish the work.
>=20
> I need to have a look how much left the original work it is left to do.
> Would you be interested to contribute?

That=E2=80=99s up to Marek.  My understanding is that it would allow guests=
 to
use SMT if (and only if) they do not rely on any form of in-guest
sandboxing (at least as far as confidentiality is concerned).  In Qubes
OS, most guests should satisfy this criterion.  The main exception are
guests that run a web browser or that use the sandboxed indexing
functionality of tracker3.  In particular, Marek=E2=80=99s builders and oth=
er
qubes that do CPU-intensive workloads could benefit significantly.

> > My understanding is that it would enable guests to use SMT without
> > risking the host, which would be amazing.
> >=20
> > > > 	Virtualized MMIO on arm needs to decode certain load/store
> > > > 	instructions
> > >=20
> > > On Arm, this can be avoided of the guest OS is not using such instruc=
tion.
> > > In fact they were only added to cater "broken" guest OS.
> > >=20
> > > Also, this will probably be a lot more difficult on x86 as, AFAIK, th=
ere is
> > > no instruction syndrome. So you will need to decode the instruction i=
n order
> > > to emulate the access.
> >=20
> > Is requiring the guest to emulate such instructions itself an option?
> > =CE=BCXen, SEV-SNP, and TDX all do this.
>=20
>=20
> I am not very familiar with this. So a few questions:
>  * Does this mean the OS needs to be modified?

Any form of confidential computing requires that the OS be modified to
treat the devices (such as disk and network interfaces) that it receives
=66rom the host as untrusted, so such modification will be needed anyway.
Therefore, this is not an obstacle.  Conversely, cases where modifying
the guest is not possible invariably consider the host to be trusted,
unless I am missing something.

In contexts where the host is trusted, and the goal is to e.g. get rid
of the hypervisor=E2=80=99s instruction emulator, one approach would be inj=
ect
some emulation code into the guest that runs with guest kernel
privileges and has full R/W over all guest memory.  The emulation code
would normally be hidden by second-level page tables, but when the
hypervisor needs to emulate an instruction, the hypervisor switches to a
second-level page table in which this code and its stack are visible.
The emulation logic then does the needed emulation and returns to the
hypervisor, without the guest ever being aware that anything unusual has
happened.  While the emulation logic runs in the guest, it is normally
hidden by second-level page tables, so even the guest kernel cannot
observe or tamper with it.

>  * What happen for emulated device?

Using emulated devices in a setup where the emulator is not trusted
makes no sense anyway, so I don=E2=80=99t think this question is relevant. =
 The
only reason to use emulated devices is legacy compatibility, and the
legacy OSs that require them will consider them to be trusted.
Therefore, relying on emulated devices would defeat the purpose.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--iRoJtQnmne3JpMVv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmOZJtEACgkQsoi1X/+c
IsEQNQ/9G0MlrtKsmmrWsax1fjzqpKzVRJp8oFmXTT1M7IX5ycJkWJSqTufufZH9
SwCE2vjh+b0jeRkIsGwPOm4l/VOX5LSB3eYk9f3edp/aqS/nRlENQzZCEZkPEkWG
6SSEzU+7M5bBhVnl8cOJYC/2F5z8D9b+PPc3GDHgm5a7tMiO/YfdMNxyu2TfwD/r
1xzyjm61+xR4Mvb4BjlKNWutCQnSglaiWUR1HfPE5IV5dN1hSKiqRfvSGTVWtPOW
5w9Xo3m1fM926fwQwobm/UYg51NYdERoQDuJHoWr/QIRsdxRwihioK93xnKayL9L
YK+vggiQr26aLRVZ3lLlGis9V5OZQAY37IzjIwBjJFmXdkWGJLUv1HUakeDgArzq
hJbNfPAYMT3Yx//4B8LWSgDzQeTLFV1xPLZL0WFVp0lQMjPBoeCY4rWbspYP2OWt
AukQBOIQVJuvi0/dCBT8ONNiZxHZ+WFnW4rn5CSOEiDGpgIowvgDlTLO5Rgn57jW
LXawByavWp9IVO2eYcfqquj01Mcpd5CvbfKHe4vw3FRzT+d+b0DnvfXAELqltpB+
MImhoqsjbr8aLa/9tClO5huhdYXHMH7DlsTWSstQVfzA86FkWJp0D5GI3BEL3Lz3
2z9QVibX3G05UR/D/nEeJJUBmv0j49XjCZZmhtjm18v72d/3NFE=
=XBb6
-----END PGP SIGNATURE-----

--iRoJtQnmne3JpMVv--

