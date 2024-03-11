Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DAD8779CA
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 03:20:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691181.1076878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjVFu-0005MQ-6d; Mon, 11 Mar 2024 02:19:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691181.1076878; Mon, 11 Mar 2024 02:19:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjVFu-0005K1-3S; Mon, 11 Mar 2024 02:19:10 +0000
Received: by outflank-mailman (input) for mailman id 691181;
 Mon, 11 Mar 2024 02:19:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jdo/=KR=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rjVFs-0005Jv-8a
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 02:19:08 +0000
Received: from fhigh8-smtp.messagingengine.com
 (fhigh8-smtp.messagingengine.com [103.168.172.159])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba7efaf3-df4d-11ee-afdc-a90da7624cb6;
 Mon, 11 Mar 2024 03:19:05 +0100 (CET)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 7FD8C11400A3;
 Sun, 10 Mar 2024 22:19:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Sun, 10 Mar 2024 22:19:02 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 10 Mar 2024 22:19:01 -0400 (EDT)
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
X-Inumbo-ID: ba7efaf3-df4d-11ee-afdc-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1710123542;
	 x=1710209942; bh=VP2jc/P8qd46OULqCsZHqh9JHFNlEKiqUCBbplUrN3g=; b=
	DDg4xkWuZwLAh5CWDH2GvIkzlK+ZJhTz7j0S1kEnWXJP6H6Gb4Gu4fOyZS5mY/mM
	IaWekjvx1P5/IH/h7yYv3ZsumXnZog1X+0kGjjbXVPUwSfzgoSyCor+OuA+zUlZR
	Qk4Cfu61GqZTctvw3RuBb5KTNiaf88Si+4bhKLA9R9ZgakmjNuj3kOgNrQb2kb/+
	BtG5Gwc0tveJnfEar/uRIakJHq6qmQp0b7bYREXBb8ytozvjpTwTEfJpGFVEVeR8
	1QmoVZbdCdr+FDn7SagVrGplTgPmFug9xqEiLQnWTUoxDQgATwxn6/NiZTeJwkr/
	1pC8as0fl+KTcjNdWoVvxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1710123542; x=1710209942; bh=VP2jc/P8qd46OULqCsZHqh9JHFNl
	EKiqUCBbplUrN3g=; b=cZ0vIIrHx3SQ40cfpvKLEbw93iXiZbPb9CjH8RII9ynw
	aTU2x3tWhR6ySfkvjNPmwzOF6dS0vWm6WJPbcY7kBy8m+SJu95k3r28cpkfntlzX
	F4zzcFileAkNVRn0STIyzcPPi97EuTOgdt5jrUBOqZTTxB4frxOcxav7mPU9IaDx
	f+f4Ih4G2V9pav2ARxH79Gx2QxQjUEb8vZwVNu4mms7NDzxhcAO+j5wfJtsWaIA/
	3yLxtoyNaMK0dx/hSg75LOkDuqXH3WL/bUFymCa4Q3Z2e7jNfF290qG6CEjoyG/k
	HnLV0sEg9LEL3Xfq6eYSLOmEo9FCv5a+YH4HaoKJSA==
X-ME-Sender: <xms:FmruZS-WkU7RESLaKCWHwtJ0uYJtkKAt-_vn9R2UL7voAyTk0XnEdA>
    <xme:FmruZStINb61M1Esin0meli3W4ZGhDSASJSuciH3UyFSh6-DwNX8gLGc-1zXyOZ8C
    K8fkxd4dEc9cQ>
X-ME-Received: <xmr:FmruZYC0iqQfMLY9YX_Z5KxxAbg6RQL3zEDSF0ggFE9idosjTjMmWWgo77G0PBLpVl0QzCGCkLeWSPqNv7vgzgnP_ePy00N0sg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrjedtgdegiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetfeeu
    ueevvdeuvdefkeehhfegjefhtddvleefveegjeekfeevudevfeeljeefgeenucffohhmrg
    hinhepghhithhhuhgsrdgtohhmpdhgihhtlhgrsgdrtghomhenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:FmruZadGHVg0l_Ax85cY6KW2ZP0gw3VnZ_i9riUG-SCobeKb4Y_WUA>
    <xmx:FmruZXPjKAIya_AiYgnp-jyOKTN00QevxCQNsr6nRaU8QKnKJFGLCg>
    <xmx:FmruZUnGrJAOZXAZeCgpfRecG3QTsXq3A7JSjQl6fkZlV6ZTW38ARg>
    <xmx:FmruZcr7NoUleMyYLPWe-zmGiY3e-JffmgaWmG5d6hHHqKhxQrFb1w>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 11 Mar 2024 03:18:58 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, oxjo@proton.me
Subject: Regression with xhci console (was: [PATCH 1/4] amd-vi: fix IVMD
 memory type checks)
Message-ID: <Ze5qE9yBLG0chLm2@mail-itl>
References: <20240201170159.66330-1-roger.pau@citrix.com>
 <20240201170159.66330-2-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0K9+IosBBskMkRSx"
Content-Disposition: inline
In-Reply-To: <20240201170159.66330-2-roger.pau@citrix.com>


--0K9+IosBBskMkRSx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 Mar 2024 03:18:58 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, oxjo@proton.me
Subject: Regression with xhci console (was: [PATCH 1/4] amd-vi: fix IVMD
 memory type checks)

On Thu, Feb 01, 2024 at 06:01:56PM +0100, Roger Pau Monne wrote:
> The current code that parses the IVMD blocks is relaxed with regard to the
> restriction that such unity regions should always fall into memory ranges
> marked as reserved in the memory map.
>=20
> However the type checks for the IVMD addresses are inverted, and as a res=
ult
> IVMD ranges falling into RAM areas are accepted.  Note that having such r=
anges
> in the first place is a firmware bug, as IVMD should always fall into res=
erved
> ranges.
>=20
> Fixes: ed6c77ebf0c1 ('AMD/IOMMU: check / convert IVMD ranges for being / =
to be reserved')
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

FYI Xen 4.17.3 with this patch (but not others in the series) causes
panic on boot on Framework 14 AMD laptop:

    (XEN)  [0000000044570000, 000000005077efff] (usable)
    ...
    (XEN) AMD-Vi: Warning: IVMD: [4f83f000,4f880000) is not (entirely) in r=
eserved memory
    (XEN) AMD-Vi: Error: IVMD: page at 4f83f000 can't be converted
    ...
    (XEN) Xen BUG at drivers/passthrough/amd/iommu_init.c:1386

Full boot log at https://github.com/QubesOS/qubes-issues/issues/9030
4.17.2 worked fine.
I'll try the whole series (and the follow up one), but I don't expect
any difference.

This looks to be related to XHCI console, which does use the same API to
allow device to DMA into relevant buffers even when the rest of XHCI is
used by dom0 (or even other domain if 'share=3Dyes' is used):
https://gitlab.com/xen-project/xen/-/blob/staging/xen/drivers/char/xhci-dbc=
=2Ec?ref_type=3Dheads#L1421-1424

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--0K9+IosBBskMkRSx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmXuahMACgkQ24/THMrX
1yx3YAf/dhs2ytpdfDthEzokauYeBlsjAQyVzVsFnQlGDlYPg0gRCDVxZUQ85h6r
vQXqxjCEhKGH1XCr+rGwtzwNHUUBxuYaHlqAlIe0QVIy9/ZwqUcAtVEUpe63At6o
h8b8Bx4PTEeYl935cerpogU+ISttrWwfwZVf4nD72frPIOc998si8Mcr1O/4lj/p
/St7Mgy2VZn+bEm5xHbuvSRrEtiiMbi3cLTfrX/M1H2zfvFBEwTK9a4wT3TNPEtC
mDNBOA/CN7cBC3v3E1u+12qjSa0eeEa/0/6hizZJuSt0RLrLtDrIh+RmgR5SeQvS
nSLVAWKRHTMxqaS3fikfkhsEeG9g4Q==
=T+r4
-----END PGP SIGNATURE-----

--0K9+IosBBskMkRSx--

