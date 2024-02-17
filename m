Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D7C858D0F
	for <lists+xen-devel@lfdr.de>; Sat, 17 Feb 2024 04:24:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682371.1061527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rbBI1-0006lj-Ri; Sat, 17 Feb 2024 03:22:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682371.1061527; Sat, 17 Feb 2024 03:22:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rbBI1-0006ir-Nl; Sat, 17 Feb 2024 03:22:57 +0000
Received: by outflank-mailman (input) for mailman id 682371;
 Sat, 17 Feb 2024 03:22:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1kna=J2=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rbBI0-0006ij-3e
 for xen-devel@lists.xenproject.org; Sat, 17 Feb 2024 03:22:56 +0000
Received: from wfout6-smtp.messagingengine.com
 (wfout6-smtp.messagingengine.com [64.147.123.149])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4d93698-cd43-11ee-98f5-efadbce2ee36;
 Sat, 17 Feb 2024 04:22:52 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailfout.west.internal (Postfix) with ESMTP id F22F11C0008B;
 Fri, 16 Feb 2024 22:22:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 16 Feb 2024 22:22:50 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 Feb 2024 22:22:48 -0500 (EST)
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
X-Inumbo-ID: d4d93698-cd43-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1708140169;
	 x=1708226569; bh=Yf01G1o+UqIKYBUWB3l3I2awerZSH20vNqLMgLnpFvQ=; b=
	SJex7i+3Guapf/FPfjKqWk1wTYsbEushu7ikiT0korY2KlM7lsdrp+CfJyDAQSzV
	NVNO3DCJqhSTbGyf/zOEuG2w+3GSFBin9X2ECG+l6vu9DcKzj6CkbvyptRfZTjd/
	0ithZ2XMUKWPmjS+tCGflCTjsbhkY4uzfQLWNCz4dMFd3U9r1wKRWpqE947F6DdZ
	hrDX1gZUd1YTB5bYkHrP+H25XwZIzkmD3yGyDUgwMslk+LMj9foaxwryfUo2hwvI
	9CHIOXbpgE8B6FJpSmJmEGvKpev3hz5OegidlUGUT0bXfSop6L+MqwSlsQk25zUK
	Qay7AZ78REEGjHycXyy6pw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1708140169; x=1708226569; bh=Yf01G1o+UqIKYBUWB3l3I2awerZS
	H20vNqLMgLnpFvQ=; b=LGriUFRndYn0Gg2wp4qY+gFliYUL2uQMMZgSsk8x05jZ
	g5ktO6+oCLVdCwVGKQpU0aCRT6fCKl8zGu428AN15dgCuNKgoFc49b+sznJFitsM
	9wqt6juyVlff73uZJz8jFwDevfZ6mvya891R/qLoXOMwBpPKcQcvs6/rhbzxGpoq
	AdSCaOSAPV6XQzzLI5f8R5dYy0+1BbcbmvW6DhUlksL3qa9mzrGDs9f/yk70KQAG
	uoBxoYpxGKHbUN7Ya4p0z44FfBGYWLo5evkJYd97IUuj5bgKsrT8oLMLMDitU6tf
	FYzZAebXInWdng+FG8KuWyGLE7QZxWEKBobaqcXCvg==
X-ME-Sender: <xms:iSbQZQcqpsay7yvJxp9_Pm1TEPol9MRujNIGxRjFaowNq8yZ3buGmA>
    <xme:iSbQZSNL7PbLgqa-NLJXxXq5h5P5qFq6_GBSZ__TQxcySQSWlNwV-ZczEtkS3dUXv
    dFITWVf79UvIg>
X-ME-Received: <xmr:iSbQZRjIwQPj1sTMJCdfvGrUpT3gFmoCC-XbuV0r4KwiOgGXX2ptm3laVVvWa1YAlXvj12Gae_Q2sqdie36t0MYFWWHlCa-lQQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdefgdehjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeiledu
    vdekjeeukefhffetgeefiefffeejjedvieejvdfgjeehteduvdekffduieenucffohhmrg
    hinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomh
X-ME-Proxy: <xmx:iSbQZV8uSz6GQnw7nVs9Y0WQ_psCsKufUIz9NONY6gZkIvCn1FtBgA>
    <xmx:iSbQZcvcg29hJ2z1lYcNMaqgamj1buP9i7CN71fj0w2ilIlu3NW4VA>
    <xmx:iSbQZcEAjglVTN0iS_frc707OY3RaEnEM8PQ5hLpmulln4kju3Hyjw>
    <xmx:iSbQZWWBcOgr93FKOl_1VGuzQpo5Nv3UqSNdqWdumhBQPVLB-FHoyor9y7I>
Feedback-ID: i1568416f:Fastmail
Date: Sat, 17 Feb 2024 04:22:45 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] i386: load kernel on xen using DMA
Message-ID: <ZdAmhqse3AyEbE82@mail-itl>
References: <20210426034709.595432-1-marmarek@invisiblethingslab.com>
 <87sg1feemf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Q0+3eHKn/djYPxYa"
Content-Disposition: inline
In-Reply-To: <87sg1feemf.fsf@linaro.org>


--Q0+3eHKn/djYPxYa
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Feb 2024 04:22:45 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] i386: load kernel on xen using DMA

On Fri, Jun 18, 2021 at 09:54:14AM +0100, Alex Benn=C3=A9e wrote:
>=20
> Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com> writes:
>=20
> > Kernel on Xen is loaded via fw_cfg. Previously it used non-DMA version,
> > which loaded the kernel (and initramfs) byte by byte. Change this
> > to DMA, to load in bigger chunks.
> > This change alone reduces load time of a (big) kernel+initramfs from
> > ~10s down to below 1s.
> >
> > This change was suggested initially here:
> > https://lore.kernel.org/xen-devel/20180216204031.000052e9@gmail.com/
> > Apparently this alone is already enough to get massive speedup.
> >
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> >  hw/i386/pc.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> > index 8a84b25a03..14e43d4da4 100644
> > --- a/hw/i386/pc.c
> > +++ b/hw/i386/pc.c
> > @@ -839,7 +839,8 @@ void xen_load_linux(PCMachineState *pcms)
> > =20
> >      assert(MACHINE(pcms)->kernel_filename !=3D NULL);
> > =20
> > -    fw_cfg =3D fw_cfg_init_io(FW_CFG_IO_BASE);
> > +    fw_cfg =3D fw_cfg_init_io_dma(FW_CFG_IO_BASE, FW_CFG_IO_BASE + 4,
> > +                                &address_space_memory);
> >      fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, x86ms->boot_cpus);
> >      rom_set_fw(fw_cfg);
>=20
> Gentle ping. The fix looks perfectly sane to me but I don't have any x86
> Xen HW to test this one. Are the x86 maintainers happy to take this on?

Ping...

>=20
> FWIW:
>=20
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>=20
> --=20
> Alex Benn=C3=A9e
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Q0+3eHKn/djYPxYa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmXQJoYACgkQ24/THMrX
1yymZAf8ChLekrtLpigwAq1cK/g9+kUbjLWHksGz666MCdEgd5P+Zy0KSbfa4A/6
PR2754T9zgqf5JCGFkaE9uCKYG3AtQpqXvQO7tLI4GicrIBO1YHYp094OV2F97oT
KTxdR97aYPbKJ78SfRf4phU6lFq1BFFEMs9SsPEYF/g+i1AsP8m+F40AHw7CiK/G
vCznXYoHwIhRFHPbf/lEkBVLHE7L7J12hMXM1Q0j7n3MMGHWMhmN9WL1T4EfSjHf
oGs+2CrWIJ70LW8BbdklCZpEmH692PmuY/br+CiyauL+l4EioPtvZrm3NAlLdKet
509POMwoSg+3YNbl8aRAD1wkx7+baQ==
=IVfk
-----END PGP SIGNATURE-----

--Q0+3eHKn/djYPxYa--

