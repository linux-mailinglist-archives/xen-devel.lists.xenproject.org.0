Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A405B9054
	for <lists+xen-devel@lfdr.de>; Wed, 14 Sep 2022 23:59:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407063.649504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYaOO-0007ks-3p; Wed, 14 Sep 2022 21:58:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407063.649504; Wed, 14 Sep 2022 21:58:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYaOO-0007i7-0c; Wed, 14 Sep 2022 21:58:00 +0000
Received: by outflank-mailman (input) for mailman id 407063;
 Wed, 14 Sep 2022 21:57:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YHGQ=ZR=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oYaOL-0007hz-PL
 for xen-devel@lists.xenproject.org; Wed, 14 Sep 2022 21:57:58 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46731bc5-3478-11ed-a31c-8f8a9ae3403f;
 Wed, 14 Sep 2022 23:57:54 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id DEA1332008C3;
 Wed, 14 Sep 2022 17:57:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 14 Sep 2022 17:57:49 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Sep 2022 17:57:47 -0400 (EDT)
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
X-Inumbo-ID: 46731bc5-3478-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1663192668; x=
	1663279068; bh=OAN5LsID3X71jX+maQj61gzzhE9IyV63Ed8vjoMSWx4=; b=z
	Fzw/DwONX7hs/U9wEbASRlN3//lMDPn7bYw+Fm1tj6lktozMnd1J5WbqK7M+yK8H
	+i+BsH+q2wiyDGrqtqM3cILm/Ofsz+yMBdCoLfrLol1NuBtCM6bCa42z7zCbIwEI
	LtHtOok5ezNc93vieePOuPpSg/0j+qE2n06dPdJiVTk9n7SG3F+3y3S6io7BIiUY
	u59mBMKUgh2kPr7dbcmXrlOgavmMXBRmExbBr1rXmXVgSPmAuamcF8SqVVPAZ13g
	sMQ5le3U+gr9wo1bqh9Zr3+lIIg2S/1YdVLS4P5011dctyVtx7xk9uJltSPMhgWX
	Tpe/0ktsaZM5pLVEjIOBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663192668; x=1663279068; bh=OAN5LsID3X71jX+maQj61gzzhE9I
	yV63Ed8vjoMSWx4=; b=tdlBH7aM2qB8z8kWHk9BZlp4I3QcNDRGE+DBqWRNBCaK
	hZhZtSE3Qvyr/V9vynEbvRx2AAZML1tN8acDh29n3R7KjBi382VRRByRTL3GIz3n
	URISdmAHZNc2MjVm+y21Mkcz+TBfUF4RGQRbJfpQWE30zRsvwoytIrYeF0xckpWg
	Qorb1jRLfwMTZUihbCs3SGuxem7YJhlgl0QYPvVqETh/M2P9NwMTYYiaQG9MJya4
	j3HUmLohWX1V1F/7e3M/diGeGxPcAS2WqVwzOWqUU1i3idRmqH2NW2k93j4XWTkV
	a6Ak6zXTjd0r07wHUpP1KxeLkdQbibnkDLNhJrG3NA==
X-ME-Sender: <xms:XE4iY5jxv6tG0815--K0tqfyvYj0fNZAJdxsIC5iHafbn2Tsk7_qlA>
    <xme:XE4iY-CJ3mOHFRvNl8U7i2eqxx9p_tY6G7kqBG2dyON8qNmdhYGpjCPE2vfFpGAOo
    VFu4vVTGHWfwQ>
X-ME-Received: <xmr:XE4iY5FMgMeU0Iysi6xdynBgnTJYRfJtGRnMvcQFLan7MiDoaLKU2oi9KhAerTjBQitdx118EqrhLrIp6-jBGTLYuu8flVu6kQ7B>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedujedgtdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:XE4iY-RL-s5EOHUou0uZPxyawpikILr4tUli-_jNkOgVUm8EdpmTDw>
    <xmx:XE4iY2zsNOu8dsUkfptjJgsMqo6x0XmueQub86n7bPhO09HqoxSwtg>
    <xmx:XE4iY05OaM7ypODuEsXUyYmxisvDUlQEP7cIpkdpTzpP-fNNv9AguA>
    <xmx:XE4iY7sYdpQwGt0yFT1lvhZioS1F6NkW8ajkrc0RIhljqwy_iQYEBA>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 14 Sep 2022 23:57:44 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Console output stops on dbgp=xhci
Message-ID: <YyJOWDWYVpShtAU9@mail-itl>
References: <CABfawhmXWouFVRVrtX82Dh+8maaJqnDSDL=Me7_fzBGdM4oE2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aVpFiCEGh7y89z61"
Content-Disposition: inline
In-Reply-To: <CABfawhmXWouFVRVrtX82Dh+8maaJqnDSDL=Me7_fzBGdM4oE2Q@mail.gmail.com>


--aVpFiCEGh7y89z61
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Sep 2022 23:57:44 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Console output stops on dbgp=xhci

On Wed, Sep 14, 2022 at 02:18:34PM -0400, Tamas K Lengyel wrote:
> Hi Marek,
> I'm testing the latest Xen master git branch
> (942ac5fc15ecc2f7ef1d9331c76d89d2cef10e5c) with the now merged xue
> patches.  My current boot command line includes dbgp=3Dxhci@pci00:14.0
> console=3Ddbgp and this works in that the Xen boot log shows up on the
> other side of the debug cable:
>=20
> ...
>=20
> (XEN) Dom0 has maximum 8 VCPUs
>=20
> (XEN) ELF: phdr 0 at 0xffffffff81000000 -> 0xffffffff82c5cdac
>=20
> (XEN) ELF: phdr 1 at 0xffffffff82e00000 -> 0xffffffff831a1000
>=20
> (XEN) ELF: phdr 2 at 0xffffffff831a1000 -> 0xffffffff831d5000
>=20
> (XEN) ELF: phdr 3 at 0xffffffff831d5000 -> 0xffffffff84000000
>=20
> However, debug output on the USB3 port stops at this point. I would
> expect to see the same as xl dmesg shows:
>=20
> (XEN) Dom0 has maximum 8 VCPUs
> (XEN) ELF: phdr 0 at 0xffffffff81000000 -> 0xffffffff82c5cdac
> (XEN) ELF: phdr 1 at 0xffffffff82e00000 -> 0xffffffff831a1000
> (XEN) ELF: phdr 2 at 0xffffffff831a1000 -> 0xffffffff831d5000
> (XEN) ELF: phdr 3 at 0xffffffff831d5000 -> 0xffffffff84000000
> (XEN) Initial low memory virq threshold set at 0x4000 pages.
> (XEN) Scrubbing Free RAM in background
> (XEN) Std. Loglevel: All
> (XEN) Guest Loglevel: All
> (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
> (XEN) Freed 2048kB init memory
> ...
>=20
> Do you have any idea what might be going on and preventing the output
> from showing over USB3 afterwards? The /dev/ttyUSB0 device is still
> present on the receiving side, just nothing is being received over it.

There are few more patches in the series that are de facto required.
Especially those about IOMMU, otherwise it can only possibly work with
iommu=3D0 (which I'm not sure if even is enough).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--aVpFiCEGh7y89z61
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmMiTlgACgkQ24/THMrX
1yzg3wf/cz+gkgHuT38bh2EO5E51EJKMvP0iDXyh4vyMpszXHYPtprrP9ZT6mVY1
TefFFuWxFOp///7iRzwMqRQgaVHe1UhK2ec7LzwbWxuP+U30BWyzM9bgSHtxaHKk
2qZvjcB9gVdBHqpUGRukidWHFVWAPW2zSwd0zojqKUQdftApTG6JqjDz85f0U+/H
uh945c4YfDSyj46dMdfqAhZM2dhA1sONsmXjPM5jfe0wHMdP/lQ4hWpVpyxhZpig
JSeqcFz5OCZdjArxKrVTKAD+ISANyNhJzR3cnEspCapXll84G8N/vceJdBiQOEj1
ElgfWIBm3sQ1qHC3DyrBgXf1y6Um+g==
=TCXG
-----END PGP SIGNATURE-----

--aVpFiCEGh7y89z61--

