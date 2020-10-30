Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE312A0545
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 13:23:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15771.38910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYTRH-0005Uv-HP; Fri, 30 Oct 2020 12:23:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15771.38910; Fri, 30 Oct 2020 12:23:27 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYTRH-0005UY-ER; Fri, 30 Oct 2020 12:23:27 +0000
Received: by outflank-mailman (input) for mailman id 15771;
 Fri, 30 Oct 2020 12:23:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e1N+=EF=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1kYTRF-0005UT-9A
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 12:23:25 +0000
Received: from out5-smtp.messagingengine.com (unknown [66.111.4.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3ec2294a-fc3b-4917-821d-2e6810213d68;
 Fri, 30 Oct 2020 12:23:24 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 686D45C00F8;
 Fri, 30 Oct 2020 08:23:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 30 Oct 2020 08:23:24 -0400
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de
 [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id 309943064680;
 Fri, 30 Oct 2020 08:23:23 -0400 (EDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=e1N+=EF=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
	id 1kYTRF-0005UT-9A
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 12:23:25 +0000
X-Inumbo-ID: 3ec2294a-fc3b-4917-821d-2e6810213d68
Received: from out5-smtp.messagingengine.com (unknown [66.111.4.29])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3ec2294a-fc3b-4917-821d-2e6810213d68;
	Fri, 30 Oct 2020 12:23:24 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 686D45C00F8;
	Fri, 30 Oct 2020 08:23:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 30 Oct 2020 08:23:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=pYlWoI
	HBkx76rcoqE72ZS3cHrDn/k/jdYN8WkyOhYOg=; b=C4AJSjmLgNRYmLCN3koEyK
	JIJ4P1WtJBvOrV+jCFnxYIjC6wf4kB76ht7kwHSQSZYfm/8v16IW3zdZV2JnvBfm
	u+hWpSme6giyWIKxmDY9vA0hHjUNoqJQMvlfzcMN0b3JhbGCEIF1oAlMVwSJIqa1
	Et0j9QJKKfdsl7oKMi0foZupWwZpXSSnmCWH2i9dcXuV/a2UqzFJ8pCceV/gFAqA
	fMBG+L1RKkYU+BLNyf3ObzGiTWoaH9GbNVh5inzEp0DqHgQ8HB0Ky5AHAOhNuX+Q
	5NVVVmqMKn3eK1e7DQR5S6e5c0fllw8YSi2K3OgOZ1Agph9Uc4Gag1RMgLF0o95w
	==
X-ME-Sender: <xms:vAWcXxchoVnHUzTrsxsZaW3zMddJq411tkCdK0gryC3MO05-cPPLyA>
    <xme:vAWcX_Pcf6gLSIPSkCryJ5nOvdX9T52Es5nSm_e6Iltdf-6cSvMfcfNK39TP5Wcpq
    MA5H0fwDlz4ZQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrleehgdefjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgeetvefh
    ueefueevkeduvdfftefhueetuddvkeehtdelvdevudffvefhteeluefgnecuffhomhgrih
    hnpehrvghprhhoughutghisghlvgdqsghuihhlughsrdhorhhgnecukfhppeeluddrieeg
    rddujedtrdekleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:vAWcX6i9VwAk9Baqn3zHD-uPgN5PktAkGcMMWedWp76JeYnKVRhf-w>
    <xmx:vAWcX68chMXxVS6UBu18UzDgiMCAWRLQpEQq1P4VaM1XJWLjT6a1_g>
    <xmx:vAWcX9s0nTp-YK-4T5kbC84UaWASG-PbV4bxBlW9rOVwxGjPxQP3Bw>
    <xmx:vAWcX27iiZeQpMaAz8T5O3nr8qzZuAmbySGnIT7fKp7oZpoNGc95qg>
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de [91.64.170.89])
	by mail.messagingengine.com (Postfix) with ESMTPA id 309943064680;
	Fri, 30 Oct 2020 08:23:23 -0400 (EDT)
Date: Fri, 30 Oct 2020 13:23:19 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: =?utf-8?Q?Fr=C3=A9d=C3=A9ric_Pierret_=28fepitre=29?= <frederic.pierret@qubes-os.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 1/2] No insert of the build timestamp into the x86 xen
 efi binary
Message-ID: <20201030122319.GA16953@mail-itl>
References: <cover.1603725003.git.frederic.pierret@qubes-os.org>
 <64fc67bc2227d6cf92e079228c9f8d2d6404b001.1603725003.git.frederic.pierret@qubes-os.org>
 <93b0b06e-cb73-66eb-3535-e7ab2ca60bf8@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Content-Disposition: inline
In-Reply-To: <93b0b06e-cb73-66eb-3535-e7ab2ca60bf8@suse.com>


--wRRV7LY7NUeQGEoC
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 1/2] No insert of the build timestamp into the x86 xen
 efi binary

On Fri, Oct 30, 2020 at 01:08:44PM +0100, Jan Beulich wrote:
> On 30.10.2020 13:03, Fr=C3=A9d=C3=A9ric Pierret (fepitre) wrote:
>=20
> > --- a/xen/arch/x86/Makefile
> > +++ b/xen/arch/x86/Makefile
> > @@ -170,6 +170,7 @@ EFI_LDFLAGS +=3D --major-image-version=3D$(XEN_VERS=
ION)
> >  EFI_LDFLAGS +=3D --minor-image-version=3D$(XEN_SUBVERSION)
> >  EFI_LDFLAGS +=3D --major-os-version=3D2 --minor-os-version=3D0
> >  EFI_LDFLAGS +=3D --major-subsystem-version=3D2 --minor-subsystem-versi=
on=3D0
> > +EFI_LDFLAGS +=3D --no-insert-timestamp
>=20
> Generally I prefer binaries to carry timestamps, when they are
> intended to do so (i.e. when they have a respective field). So
> I think if no timestamp is wanted, it should be as an option
> (not sure about the default).

What about setting it to the SOURCE_DATE_EPOCH[1] variable value, if
present? Of course if there is an option to set explicit timestamp
value.

[1] https://reproducible-builds.org/docs/source-date-epoch/

> This said, I didn't think time stamps got meaningfully in the
> way of reproducible builds - ignoring the minor differences
> cause by them, especially when they sit at well known offsets
> in the binaries, shouldn't be a big deal.

It is a big deal. There is a huge difference between running sha256sum
(or your other favorite hash) on two build artifacts, and using a
specialized tool/script to compare each file separately. Note the
xen.efi may be buried very deep in the thing you compare, for example
inside deb/rpm and then ISO image (installation image), at which point
it's far from "they sit at well known offsets".

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl+cBbYACgkQ24/THMrX
1yy9QAf+MMtxtyqczE/lrrkRz58C6qrJyls5kWd5ZSkOjaSkkHkEgyAphd99EX9v
iSdMjCvpXWlvRnA1YzZ74fBMgnPEOZd88bKM05MohotmoAsMbFUnHAFPDKb2H+P5
nvdpd6hYinqVZ+OJdW8covmH/gEu1dXV3ZH+2C0WM2OVpKtkpv2yxm6WoBpHN5Lq
xjB9uxsXjiT+a+IsEe6GpGRCjU2jvCO5bjA3OapyWLbMTr/hPIhXbG6pcACexAfr
i/LNx2FWoew2a6LcrBFLt3982b7rfHxz6uk162MGzHdQ3QD+86RIJwSYqkYDewCd
cpZcrR+RJ/FMGe9Ol43uMv7T69BvxA==
=JH4j
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--

