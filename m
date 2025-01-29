Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C72A216FC
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2025 04:47:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878889.1289087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcz3C-0007Km-LG; Wed, 29 Jan 2025 03:47:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878889.1289087; Wed, 29 Jan 2025 03:47:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcz3C-0007Ht-IZ; Wed, 29 Jan 2025 03:47:38 +0000
Received: by outflank-mailman (input) for mailman id 878889;
 Wed, 29 Jan 2025 03:47:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ri1h=UV=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tcz3A-0007Hn-Py
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2025 03:47:36 +0000
Received: from fout-a5-smtp.messagingengine.com
 (fout-a5-smtp.messagingengine.com [103.168.172.148])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5ca9ce7-ddf3-11ef-99a4-01e77a169b0f;
 Wed, 29 Jan 2025 04:47:34 +0100 (CET)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal
 [10.202.2.48])
 by mailfout.phl.internal (Postfix) with ESMTP id 42D0713810B0;
 Tue, 28 Jan 2025 22:47:33 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-08.internal (MEProxy); Tue, 28 Jan 2025 22:47:33 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Jan 2025 22:47:30 -0500 (EST)
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
X-Inumbo-ID: c5ca9ce7-ddf3-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1738122453;
	 x=1738208853; bh=o/1Pq66neLKeF3uzOf3AklSlktzoEb7gsLHB0A1fQMc=; b=
	NONUYCTT3uKA5H2Dy+HXhrloi+CdBqOUY4ukgbmSpaQ0OfU/14Wdx/FuxOc24wPl
	6yscww1n2JwGz4Cy/hJ8bD06HacU75RfKY4nWswSGZ+LgQ4k4pU/H5yGbb4aIZuI
	gk08bFpstHGW4gDDFyO0okI/Aw/4BsLIxL8O1wBEUp8DCdg7CZ67EHxALiR6ZgeB
	QmKG/eT0+IX+csth6TnAJvJAzXBTDfYtTiZfS1g5dqtOO9Hy/N0bDS3HN1aNAXXy
	O8u2TKVo5Y13EeB1EZDUTfkR0gWg+YteQVMOTWBfmwtIRRQAFy3VBQzLTbjMY6qZ
	24CRQbsDVh8V42JZQhi4GQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1738122453; x=1738208853; bh=o/1Pq66neLKeF3uzOf3AklSlktzoEb7gsLH
	B0A1fQMc=; b=TM4pHChTAekVyb75Y9zF2M4yGbrVgX19HcjTRtwgZ7wW3RXudb+
	Qfpi8XB4or0NN8+p8Zj4OMTyEqO8BUYyRZiNXQskN4sg2GuKwt0ujgIEFzn49uXU
	g1HLQ7YBdcqA4F0VatOTv56fbv52XaciRcrJFTiu+XQ5JktUyZunf7+rQw+Lkx0C
	9S4urxLmUkBDwLiRT/VVchGdQdUDmMF3hp+3Y4FlIe5w80hT303OiXL40NWsFGYG
	DZ8g4pKCCWR9Zvj7Z4H7h0u2OlHxC8O+rFYEZ0jPZpZYVnItr2G8H8hHbb8ZfQXa
	z8TecXg/hw0C5TZvXxGQljtjM621D+ox94g==
X-ME-Sender: <xms:1KSZZ13ZfgNkun5W8b0ONvIUFymvnsahaUwx4glxJ2OPdbD0EO_tFg>
    <xme:1KSZZ8E2_sONjGRDobSD_NxvDFczQn1qPfFtXGOM_jN8wD-PSNA6Ct7LqkDPg3mNg
    Ku15XST0my7Qw>
X-ME-Received: <xmr:1KSZZ14Ou6evhyt-4rWHBegMBpedxfwmb6ykxv5G46BgAd7loHUsLj-WrvOmpVeyWci-l8zi4MevsQhjymWxtrktKunzbq5Ajg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduleehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepvedthedtheekhfeiudelfffgheegfedttdeiudevudejfeelgeekhf
    dvfedvvddunecuffhomhgrihhnpehgihhthhhusgdrtghomhdpgigvnhdrohhrghdpkhgv
    rhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtgho
    mhdpnhgspghrtghpthhtohepuddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhope
    hhvghlghgrrghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegshhgvlhhgrggrshes
    ghhoohhglhgvrdgtohhmpdhrtghpthhtohepjhhgrhhoshhssehsuhhsvgdrtghomhdprh
    gtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomhdprhgtphhtthhopegs
    ohhrihhsrdhoshhtrhhovhhskhihsehorhgrtghlvgdrtghomhdprhgtphhtthhopeigvg
    hnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthho
    pehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehrvghgrhgvshhsihhonhhssehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthht
    ohepnhgsugesnhgsugdrnhgrmhgv
X-ME-Proxy: <xmx:1KSZZy3-GIEB8tFjmJxoGuB_Zyoh3IqiGxIPQB5_fs4PiU0ggnBnbg>
    <xmx:1KSZZ4FrwP-qMVaOMGwp3Tck6D-MWkOrTKO5BRCKH-NTdHIQk_r3NQ>
    <xmx:1KSZZz9IVj_Gfzl0usFjFH3GRbCZMhKyBmMLqAL31NOqn1vKKDVvDQ>
    <xmx:1KSZZ1nuVis6_sETM3Anf092AdCvJYU3cwdr9r98xGCQzC9a2tUTYA>
    <xmx:1aSZZ_c277VQrGGvpBzr7TdTQFiyvNw4in-oJDuQR1mZ-N5TxHISn-Id>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 29 Jan 2025 04:47:28 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org
Subject: Re: Config space access to Mediatek MT7922 doesn't work after device
 reset in Xen PV dom0 (regression, Linux 6.12)
Message-ID: <Z5mk0K5xltK6iZXN@mail-itl>
References: <Z5mfA32bvEn6yD-C@mail-itl>
 <20250129034018.GA398969@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7HtAp5iYbaAmPKI3"
Content-Disposition: inline
In-Reply-To: <20250129034018.GA398969@bhelgaas>


--7HtAp5iYbaAmPKI3
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jan 2025 04:47:28 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org
Subject: Re: Config space access to Mediatek MT7922 doesn't work after device
 reset in Xen PV dom0 (regression, Linux 6.12)

On Tue, Jan 28, 2025 at 09:40:18PM -0600, Bjorn Helgaas wrote:
> I guess the code at [2] is running in user mode and uses Linux
> syscalls for config access?  Is it straceable?

Nope, it's running as the hypervisor and mediates Linux's access to the
hardware. In fact, Linux PV kernel (which dom0 is by default under Xen)
is running in ring 3...

But I can add some more logging there.

> Can you reproduce this without Xen at all?  If so, can you post a
> complete dmesg and complete lspci -vv somewhere?

I haven't managed to reproduce it without Xen so far. But I can't
exclude it's some race condition that is simply unlikely to hit when
Linux runs natively.=20

> > > [1] https://github.com/QubesOS/qubes-issues/issues/9689#issuecomment-=
2582927149
> >=20
> > [2] https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3Dxen/arch/x=
86/pv/emul-priv-op.c;h=3D70150c27227661baa253af8693ff00f2ab640a98;hb=3DHEAD=
#l295
>=20
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/drivers/pci/probe.c?id=3Dv6.13#n1208

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--7HtAp5iYbaAmPKI3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmeZpNAACgkQ24/THMrX
1yyzZgf+NFIFR+LpsTBUlwEyR+b9DhblSPdvomnx7u3lNOlRGrdkrFsdqTkMnOE/
mAgHDjmiK5Dfz+8IiAtKNjvz78klTW2+VCwHAwZi7vu1x9YgJL5Yn6hejG3JOgEQ
knJaEarUmzkdmYZrrseSV5n+/SGKRflXKm0VG8M0dDCm8c//GieJIhc5q9TJdAlh
efkH3E54iieRcvlae6NmmKZUZmhUnsHJxmUgurjgoL8BWN1rqZgaP4tIzFPDyV2g
nGu3aK2D4oFu6aQTclHqkoPqUWw29ywLOnXNH4Uf9rBeTw17vsxSJAWy8JEtmA+X
UPDcdOmnHXWyeUqQCweCD6Q9u6OFLQ==
=FIrq
-----END PGP SIGNATURE-----

--7HtAp5iYbaAmPKI3--

