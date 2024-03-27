Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8131388D496
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 03:35:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698283.1089778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpJ75-0006Do-PV; Wed, 27 Mar 2024 02:34:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698283.1089778; Wed, 27 Mar 2024 02:34:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpJ75-0006BS-Mr; Wed, 27 Mar 2024 02:34:03 +0000
Received: by outflank-mailman (input) for mailman id 698283;
 Wed, 27 Mar 2024 02:34:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Klda=LB=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rpJ73-0006BM-Qf
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 02:34:02 +0000
Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com
 [103.168.172.146]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 764720db-ebe2-11ee-a1ef-f123f15fe8a2;
 Wed, 27 Mar 2024 03:33:58 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailfout.nyi.internal (Postfix) with ESMTP id F32AC1380178;
 Tue, 26 Mar 2024 22:33:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 26 Mar 2024 22:33:56 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Mar 2024 22:33:55 -0400 (EDT)
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
X-Inumbo-ID: 764720db-ebe2-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1711506836;
	 x=1711593236; bh=E7aAgdvO75mggR3x5H4bZ6aJFCvNIKsUDAzOI7Nh3aQ=; b=
	YPHC2KsDENfY3I43g355ZE3/flfFzRU+/t9LlVJaK0vWLBOBAU5Z4kmSVZXzMLFl
	kZX0bRM0NxCiWHCvnp96NSSCqany538TsymZou43ywH8C+DqeIpalefEjKi5CUmU
	mJFkhr2yDWy0BgjjiB96APs4KMh5Fr5DxDoSVw97nQGyfZdQVZ1whU5dzjUTBCLz
	iNfv5WaoU5b9eMLRpgYsXJYcdBise+feCPrKYx43K/oCmbxRRMkan1Ycr5849pQy
	44EMECdFswoDauTqMUSaiHo4qlyxABQrnMGnwKGN8X+VwJy7O4uh2jYO2vn7y/Yt
	ADJEeBPGMzkgD9oahEmrbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1711506836; x=1711593236; bh=E7aAgdvO75mggR3x5H4bZ6aJFCvN
	IKsUDAzOI7Nh3aQ=; b=v46wYyVUQTj6mVsij51NhHY6hezlh5Gm8DX0i5ZhGdvZ
	p9AAQ0XK2FGYOARexUg1VD7DpSRSmTvp+uxSis/o2wshue2s3ZFIb+Gsuqq5Znja
	fHyGEDDNoswsTI7Sy+nF6QK7AkD0qHcxlGHC/GSfbcqCpQQTw0qMEfYsL2FnIfLP
	gYrvc/OTlymYf3dzMxPo0n/caq6VSrUy2z8faNBdEkkftr9g+vcm1UT73Yip4gEc
	CzCySdMHXINbHXwpNzgVRL6qpd3L8bjkI70rkckOWO6it45dnODI6YxVZnJpm0g4
	1+yWibOeiBoLv7+k+10zds5CWJRpRXipFUu701JPTA==
X-ME-Sender: <xms:lIUDZqI5qcE_XkdQ4Nm0AeGBEbUDtdON4xRRHg_BUFyufKN6aoz4Yg>
    <xme:lIUDZiIyI2QEYHn2lGKOSZ-ktXT7uDxorZtRHvgrmN5m11itdJWo2ItnLf0mNrd3E
    zqB6XIc2CzbXQ>
X-ME-Received: <xmr:lIUDZqs8v-xF526Axl30HOjhlk1aM3eyuxp-NuP00BstSqvC6bD2203Prr1j64nvs3s4LZqmIktJY2VAhSGs7T4tymjRJyetXQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledruddugedggeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:lIUDZvbidRr7WJRe_ZjPqaGD3ZOG7wgBr7-2uCB-7UFDXZwenHl9tA>
    <xmx:lIUDZhZrJvlXS6koEdEiS0uTJpj4wSEHkrE-EnFcUX-q_8nFoQpWFA>
    <xmx:lIUDZrD4v-bLl2T2KYny87h7AtgB4uXHlVELz9_sq963FqJTRyxdVw>
    <xmx:lIUDZnaUCA4bM9tFiu7li9Qd4aKp1fzRwsQTuLr6qArNGMKxuMPmAg>
    <xmx:lIUDZgX8Tzd6zM-g73GiYv-hnvg36TXxAxA0Dkw9yLrTVb_XDnh-tw>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 27 Mar 2024 03:33:52 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/2] drivers/char: mark extra reserved device memory
 in memory map
Message-ID: <ZgOFkYXtU0IDqvTq@mail-itl>
References: <20240312162541.384793-1-marmarek@invisiblethingslab.com>
 <20240312162541.384793-2-marmarek@invisiblethingslab.com>
 <351eebc2-7da3-4082-830b-d8e764e2066a@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="O4P5yuvFpJTGEmtt"
Content-Disposition: inline
In-Reply-To: <351eebc2-7da3-4082-830b-d8e764e2066a@suse.com>


--O4P5yuvFpJTGEmtt
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 Mar 2024 03:33:52 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/2] drivers/char: mark extra reserved device memory
 in memory map

On Mon, Mar 18, 2024 at 02:48:09PM +0100, Jan Beulich wrote:
> On 12.03.2024 17:25, Marek Marczykowski-G=C3=B3recki wrote:
> > The IOMMU driver checks if RMRR/IVMD are marked as reserved in memory
> > map. This should be true for addresses coming from the firmware, but
> > when extra pages used by Xen itself are included in the mapping, those
> > are taken from usable RAM used. Mark those pages as reserved too.
> >=20
> > Not marking the pages as reserved didn't caused issues before due to
> > another a bug in IOMMU driver code, that was fixed in 83afa3135830
> > ("amd-vi: fix IVMD memory type checks").
> >=20
> > Failing to reserve memory will lead to panic in IOMMU setup code. And
> > not including the page in IOMMU mapping will lead to broken console (due
> > to IOMMU faults). The pages chosen by the XHCI console driver should
> > still be usable by the CPU though, and the console code already can deal
> > with too slow console by dropping characters (and console not printing
> > anything is a special case of "slow"). When reserving fails print an er=
ror
> > message showing which pages failed and who requested them. This should
> > be enough hint to find why XHCI console doesn't work.
> >=20
> > Fixes: 3a1a7b809ffa "drivers/char: mark DMA buffers as reserved for the=
 XHCI"
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> > Alternative error handling could be a panic, but with this version I
> > think it can be avoided. And not panicing gives a better chance to
> > actually see the error message (from the hopefully started dom0),
> > especially as the affected driver is the console one.
> >=20
> > The reserve_e820_ram() is x86-specific. Is there some equivalent API for
> > ARM, or maybe even some abstract one? That said, I have no way to test
> > XHCI console on ARM, I don't know if such hardware even exists...
>=20
> These are normal PCI devices, so I don't see why they shouldn't be usable
> on non-x86 systems. But this is all okay as long as XHCI depends on X86
> in Kconfig.

That's why I'm asking for similar API for ARM. The x86-specific part
here is only about IOMMU, other parts should work just fine (but as I
said, I have no way to test).

Anyway, I'll leave it to whoever will need this driver on ARM (or other
arch).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--O4P5yuvFpJTGEmtt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmYDhZEACgkQ24/THMrX
1yyJywf8Cbi1qMrPJACvxwJcW9u8fxCmlPduNELJIjiA72FnRtMeKdA9uDwZToam
R5gvHc3jgSbrvnBDE10ZYG6pjF4MfibNxTKO3tIDyhpUikMD3ZkINAPNKbBpRJad
CpbaZJc/00ou3BgCtujmYXkgsV6QziqbmxBGJvCLtPGHvJC59QnSVYkCRj7vqZ3F
dcaARbhm1uoQJvYWGNhLhCQmceRzc2whM/9TySliFGZ1oU6WeBqBrgTBgaakeys1
vKCyCu/jIPZSbFg8sUBDMBtrp4m0/mNZKzddXHgRb7vq4MKzvj0YpjFNYRvr2ogo
8PHwLY6cYmOgqUQGirYPnGQZF7o3Kw==
=Wquh
-----END PGP SIGNATURE-----

--O4P5yuvFpJTGEmtt--

