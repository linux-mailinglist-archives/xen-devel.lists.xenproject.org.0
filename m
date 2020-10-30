Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6B32A06AB
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 14:44:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15855.39095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYUh9-0005FG-4Y; Fri, 30 Oct 2020 13:43:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15855.39095; Fri, 30 Oct 2020 13:43:55 +0000
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
	id 1kYUh9-0005Em-0g; Fri, 30 Oct 2020 13:43:55 +0000
Received: by outflank-mailman (input) for mailman id 15855;
 Fri, 30 Oct 2020 13:43:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e1N+=EF=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1kYUh8-0005ET-0I
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 13:43:54 +0000
Received: from out1-smtp.messagingengine.com (unknown [66.111.4.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 54634419-eeba-4ce8-ac73-f5aad179b2e2;
 Fri, 30 Oct 2020 13:43:53 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 15BF85C00F5;
 Fri, 30 Oct 2020 09:43:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 30 Oct 2020 09:43:53 -0400
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de
 [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0F5033064680;
 Fri, 30 Oct 2020 09:43:51 -0400 (EDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=e1N+=EF=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
	id 1kYUh8-0005ET-0I
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 13:43:54 +0000
X-Inumbo-ID: 54634419-eeba-4ce8-ac73-f5aad179b2e2
Received: from out1-smtp.messagingengine.com (unknown [66.111.4.25])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 54634419-eeba-4ce8-ac73-f5aad179b2e2;
	Fri, 30 Oct 2020 13:43:53 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 15BF85C00F5;
	Fri, 30 Oct 2020 09:43:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 30 Oct 2020 09:43:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=JOOb/y
	iDDC1k50S9KOzfOAE43VJEtHLYbXHvm8rsAFE=; b=NU2J62bNArcboKjNRkB6HI
	jMBZyBwiLWJeopLZfKsDFF/dWdr9zTMLRAmzj/z8ZtcV1vZjAzt7HAo4XjIkjD2u
	KvS+B/AiYSUZ+9PN6u4/Q+M6mcv1tdwJwo+kdnLYQ3d7msJZB7z1Ic0a8lezR/Cy
	RxANojjAxWN5yFjqVVy2Hg9FiiS7cddKSZx0CAuNqwElhkgXYkWcmblzzwf/gtr1
	pnEx+HlQRdzR5K5g5yiHI+pVjkOwjDALKfcbr/9StD2cIF6Q1Y8bE7BlLkcu23Q3
	13T/I59DsqyiXzCbn6edau+giQHE8xkwwZd9rarjoLDnGKhICzlOYwToQJUOtb4Q
	==
X-ME-Sender: <xms:mBicX6yXCX6je8DjlbR_i5BPFbanCyPkwqHo0vpbozf8CpbuVZJBMQ>
    <xme:mBicX2Q44IpuGt04F-a0CMQBqfMr9ZDmimsiboCGqMdrJzf1uSPUfqWJfbRKKLhqP
    sSawD78EqjoYw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrleehgdehudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgeetvefh
    ueefueevkeduvdfftefhueetuddvkeehtdelvdevudffvefhteeluefgnecuffhomhgrih
    hnpehrvghprhhoughutghisghlvgdqsghuihhlughsrdhorhhgnecukfhppeeluddrieeg
    rddujedtrdekleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:mBicX8Uysj-CoB0PKXUogdpO-XaovFdOV70ZyV_hQgzFwj-Uevn3pg>
    <xmx:mBicXwgI_CABHB7URQqlhmKWPDRp-bClylMutxeL0xbomzQEV0VGGA>
    <xmx:mBicX8BfKg6ZqD2AVU5oO-a9wZHvE4_zng-bUJCkeqr8LRURJ_9NgQ>
    <xmx:mRicX_OkefglbCM2OKrh6Mfz0Fk_p2pSREMU8iw9xdwcw80F7FKwag>
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de [91.64.170.89])
	by mail.messagingengine.com (Postfix) with ESMTPA id 0F5033064680;
	Fri, 30 Oct 2020 09:43:51 -0400 (EDT)
Date: Fri, 30 Oct 2020 14:43:47 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	=?utf-8?Q?Fr=C3=A9d=C3=A9ric_Pierret_=28fepitre=29?= <frederic.pierret@qubes-os.org>,
	Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 1/2] No insert of the build timestamp into the x86 xen
 efi binary
Message-ID: <20201030134347.GB2532@mail-itl>
References: <cover.1603725003.git.frederic.pierret@qubes-os.org>
 <64fc67bc2227d6cf92e079228c9f8d2d6404b001.1603725003.git.frederic.pierret@qubes-os.org>
 <93b0b06e-cb73-66eb-3535-e7ab2ca60bf8@suse.com>
 <20201030122319.GA16953@mail-itl>
 <9b278993-08bb-7ad2-2dfd-743987a9fd6f@suse.com>
 <3ee68210-a0d4-a906-c502-4988d996e61c@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="U+BazGySraz5kW0T"
Content-Disposition: inline
In-Reply-To: <3ee68210-a0d4-a906-c502-4988d996e61c@citrix.com>


--U+BazGySraz5kW0T
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 1/2] No insert of the build timestamp into the x86 xen
 efi binary

On Fri, Oct 30, 2020 at 01:30:08PM +0000, Andrew Cooper wrote:
> On 30/10/2020 12:48, Jan Beulich wrote:
> > On 30.10.2020 13:23, Marek Marczykowski-G=C3=B3recki wrote:
> >> On Fri, Oct 30, 2020 at 01:08:44PM +0100, Jan Beulich wrote:
> >>> On 30.10.2020 13:03, Fr=C3=A9d=C3=A9ric Pierret (fepitre) wrote:
> >>>
> >>>> --- a/xen/arch/x86/Makefile
> >>>> +++ b/xen/arch/x86/Makefile
> >>>> @@ -170,6 +170,7 @@ EFI_LDFLAGS +=3D --major-image-version=3D$(XEN_V=
ERSION)
> >>>>  EFI_LDFLAGS +=3D --minor-image-version=3D$(XEN_SUBVERSION)
> >>>>  EFI_LDFLAGS +=3D --major-os-version=3D2 --minor-os-version=3D0
> >>>>  EFI_LDFLAGS +=3D --major-subsystem-version=3D2 --minor-subsystem-ve=
rsion=3D0
> >>>> +EFI_LDFLAGS +=3D --no-insert-timestamp
> >>> Generally I prefer binaries to carry timestamps, when they are
> >>> intended to do so (i.e. when they have a respective field). So
> >>> I think if no timestamp is wanted, it should be as an option
> >>> (not sure about the default).
> >> What about setting it to the SOURCE_DATE_EPOCH[1] variable value, if
> >> present? Of course if there is an option to set explicit timestamp
> >> value.
> >>
> >> [1] https://reproducible-builds.org/docs/source-date-epoch/
> > Why not.
>=20
> SOURCE_DATE_EPOCH is the right way to fix this.

Hmm, reading 'ld' man page, I don't see an option to set explicit value,
on --insert-timestamp / --no-insert-timestamp.

> It probably wants to default to something sane in the root Makefile, so
> it covers tools as well.

In practice, the package build system (deb, rpm, etc) do set it based on
last package changelog entry, so _for package build case_ it isn't
needed. But probably nice addition.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--U+BazGySraz5kW0T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl+cGJMACgkQ24/THMrX
1yzjNgf+Pa+cW0aa+ADNqXcCGsea/rQvNnd8r16/gt/9OQtjojMOGUxatsZQGHIK
fHNtX29BAV5beBvYPhvtc2KCnxnNSuI+1czJKNtgxPYEPaZy/gDL5RPPirHKbL5S
eWO9xlwR71/XJKN2VodBtIsE+re5jj+QKaHHz0VFbF416buIFAir52vhBRpT5whh
rBWIQnj+bh5TilP6hyL8yeVPq3+Nu9hOaB1rNSs29nN3T7cd5Z8grx5fS7t/c52K
Zp+iqTvFlJVXdEL3Kv1re8eA7ZBysq3rb8DE68T31QONohfbRoC+lAQs6CbVK035
CsMVUmb2jSeyAFaOFtf2IeCoEPl+Jw==
=zo7W
-----END PGP SIGNATURE-----

--U+BazGySraz5kW0T--

