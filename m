Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1136D995C5B
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 02:38:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813650.1226657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syKhS-0006vV-4y; Wed, 09 Oct 2024 00:37:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813650.1226657; Wed, 09 Oct 2024 00:37:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syKhS-0006tn-0C; Wed, 09 Oct 2024 00:37:10 +0000
Received: by outflank-mailman (input) for mailman id 813650;
 Wed, 09 Oct 2024 00:37:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3FS1=RF=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1syKhP-0006tf-K7
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 00:37:07 +0000
Received: from fhigh-a7-smtp.messagingengine.com
 (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b14c16c-85d6-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 02:37:05 +0200 (CEST)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfhigh.phl.internal (Postfix) with ESMTP id C0DD11140239;
 Tue,  8 Oct 2024 20:37:03 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Tue, 08 Oct 2024 20:37:03 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Oct 2024 20:37:02 -0400 (EDT)
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
X-Inumbo-ID: 9b14c16c-85d6-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1728434223; x=1728520623; bh=C8
	2pnmUZdeut8Z+QXHVtjsSEAsSsqhpYBlAKTxRITCY=; b=KU0cxg2g+IoO7RuwB/
	PuEAXQrv3tYvgHgtrlQrnGnf58cPqFK+pUWNvJB7jRCmTeZjYpMFozhsS6/wD1yw
	a3jAF3AVDC+R4YRdI/0UZ5PrBKp1q6CyvUMSEgEgj6Ed6Q7+T1p30By+zTBxH/TA
	9Dj3+eSm5cgsFG/BfCq1SZB9qqqMjWjfCJJ/EbpWI3z27glmQ9WwTzAM7VNT21C/
	0yeWiNL1DtVLmIUHDKF+/beab3OT/dr8EkG5kmwvmgKf32PqTR0TwrzHq4U2QbyD
	IbGuPNpRK54ODt+ahbvyQy1QjOMlPAm2+cpR35nkPugR8S2RC0O2Yn6eG/9NPsXF
	Ydow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1728434223; x=1728520623; bh=C82pnmUZdeut8Z+QXHVtjsSEAsSsqhpYBlA
	KTxRITCY=; b=Uti29CFKOWnpE/ZZr5VfOpgmiJGW6B8B2uAlL4KoH4CevzU+hR1
	XKtOXc9Ssfh1OJnCfXRSUUYkFLOY8Yrkit4n7Go8yrc4KW46yrIZ29Qx8eCiO1G/
	PJ9AjYbNG9HnEFkdjnnTX/jksJaN7aQ8JQ/m5GyrQ1zfAIWwi3eJJmOG2vTj3g8e
	j/zb1Grw81GYHW+arhTjDCBcIfPinNWFQqD31DaVY68diwP7nvt5UI9gdUrudBhz
	RR5uA8PyZeyGs9qw32dDSU+nDFa9Fu8pAWumLtX9TAOhq7Z3pPTEEcZRwQ4ba50E
	x0nqGW3vfobAUFFSXPPvznAvvGoL0uZo09Q==
X-ME-Sender: <xms:L9AFZ5mi6y05c6OrFUl_W9FUtBUQxHEVLHDI1CGApVztpFsHvPD1JQ>
    <xme:L9AFZ03NaxwyUV6GUxOTuYQD8OAeWXaP6d1hCv3ibnO-o_yBR_auSpOFds2rY0iSN
    LyFc9SPgXEHvA>
X-ME-Received: <xmr:L9AFZ_rvtfTvW70EJZj08UFBv7FnC7mB53UOmiBAIzVcpsJZqzx6vL-Nw4agKrr4hSVoQjqiwPsR6eE6nv6Vj0aV5DvyT3Gtzw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdefvddgfeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkgggtugesghdtreertddtjeenucfh
    rhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrh
    hmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgr
    thhtvghrnhepudfggfeileeuueektdfhffelvdfhjeeffeehueeikefhleduleejjeelge
    ejudffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    mhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspg
    hrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnhdquggv
    vhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepjhhgrh
    hoshhssehsuhhsvgdrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopeholhgvkhhsrghnughrpghthihshhgthhgvnhhkoh
    esvghprghmrdgtohhmpdhrtghpthhtohepjhhiqhhirghnrdgthhgvnhesrghmugdrtgho
    mh
X-ME-Proxy: <xmx:L9AFZ5k1bfJGbPupMyHp2tMzMVpaXIDi9ozlZdbrFAF3jN9Kj0evNA>
    <xmx:L9AFZ30M96nzkvPR76ooIsrX2OLLGuGvG7nBgivcvvIPzhwMf5XjQA>
    <xmx:L9AFZ4s7i736ihujEuu8Iw390lGMhygo3vtJCzHuGe1TyVTm7cVT0A>
    <xmx:L9AFZ7XNiKz3FYapFFfv317ahxVOBwhC2HPUT-V4dXNDpLT520GxbQ>
    <xmx:L9AFZyR-gLDfhISA7_qzki306lW91eLq18fRu6OV3dRdifknkzE7znEa>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 9 Oct 2024 02:36:59 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Jiqian Chen <Jiqian.Chen@amd.com>
Subject: Linux 6.12-rc2: xen-privcmd cannot be loaded in domU anymore
Message-ID: <ZwXQKzubX9Dj_vhc@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bj5tTNG7g/13THM0"
Content-Disposition: inline


--bj5tTNG7g/13THM0
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 9 Oct 2024 02:36:59 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Jiqian Chen <Jiqian.Chen@amd.com>
Subject: Linux 6.12-rc2: xen-privcmd cannot be loaded in domU anymore

Hi,

It looks like xen-privcmd now depends on xen-pciback, and the latter
(expectedly) fails to load in domU with -ENODEV. But that prevents
loading xen-privcmd too. And that's bad.

The dependency looks to be introduced by this commit:

commit 2fae6bb7be320270801b3c3b040189bd7daa8056
Author: Jiqian Chen <Jiqian.Chen@amd.com>
Date:   Tue Sep 24 14:14:37 2024 +0800

    xen/privcmd: Add new syscall to get gsi from dev
   =20
    On PVH dom0, when passthrough a device to domU, QEMU and xl tools
    want to use gsi number to do pirq mapping, see QEMU code
    xen_pt_realize->xc_physdev_map_pirq, and xl code
    pci_add_dm_done->xc_physdev_map_pirq, but in current codes, the gsi
    number is got from file /sys/bus/pci/devices/<sbdf>/irq, that is
    wrong, because irq is not equal with gsi, they are in different
    spaces, so pirq mapping fails.
    And in current linux codes, there is no method to get gsi
    for userspace.
   =20
    For above purpose, record gsi of pcistub devices when init
    pcistub and add a new syscall into privcmd to let userspace
    can get gsi when they have a need.
   =20
    Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
    Signed-off-by: Huang Rui <ray.huang@amd.com>
    Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    Message-ID: <20240924061437.2636766-4-Jiqian.Chen@amd.com>
    Signed-off-by: Juergen Gross <jgross@suse.com>


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--bj5tTNG7g/13THM0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmcF0CsACgkQ24/THMrX
1yy6IAf/W9XsmStGd9i+FK4Kxyp/j2WPfPThr1lAugLF/k9sIq+q+GYHazMCiwwH
Y07QbLlx01IyTfP67EX7TXf75TgyNvofNATqIt4tV0qafrefF4PwoEtTOesjbIPr
Ipfu1e6iHKQc5whhsiapA3C9329B3HsB87T3A6iBwqgm3WoukRtu/U+tLZLhzv/Z
vhZ7daqtMd7BiSQgVnCpbq6haWzStTPfyuQmWKWFnWX88kKcqD2Qh+cVxEhguziZ
Fvrb34nFzXj3DLwfw3aMuEneczVgwW3RtQ3xdAfeNk/i+bnez6vZISGmbnSh3X7d
ePC1u1Ld5wZPFjRV85AsKGE3+WxrOw==
=v4p0
-----END PGP SIGNATURE-----

--bj5tTNG7g/13THM0--

