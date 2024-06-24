Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C98914F14
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 15:48:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746660.1153774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLk3K-0001qK-50; Mon, 24 Jun 2024 13:48:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746660.1153774; Mon, 24 Jun 2024 13:48:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLk3K-0001o1-1m; Mon, 24 Jun 2024 13:48:14 +0000
Received: by outflank-mailman (input) for mailman id 746660;
 Mon, 24 Jun 2024 13:48:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6zbB=N2=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sLk3J-0001nv-4s
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 13:48:13 +0000
Received: from fhigh7-smtp.messagingengine.com
 (fhigh7-smtp.messagingengine.com [103.168.172.158])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64d5af78-3230-11ef-90a3-e314d9c70b13;
 Mon, 24 Jun 2024 15:48:11 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id C2CEA1140227;
 Mon, 24 Jun 2024 09:48:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 24 Jun 2024 09:48:09 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Jun 2024 09:48:07 -0400 (EDT)
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
X-Inumbo-ID: 64d5af78-3230-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1719236889; x=1719323289; bh=m1
	ygcSpOcgz8PRMolKj0zus6mRL+uXQvw8SdE2416+E=; b=fzWpmH1hpKsWe0Nj1X
	/7ks6k8nCu+EubdtqWUrzgRMEl+Ipc03jgI9I4zSe3y01Uq/T0wS6098HI8MFbAN
	pDyOWt7cpf/gE3iyqfEO3vu67ltsbLbyWVOcmyPHttUtgU9/PA/vogQDd73cPcMm
	V+J+VHxpvGaJ5uGVHlOoQWCAf68gS7AFlOBf4xKUkv26CFa8s7MlKOJGc7EcIj80
	RaEBjPDoTQxkJvpsYJrMBBGrs1vEJ6wOpWTjdfG/0Y9XSZHeeBTJjpaECN+pQ8no
	wL9CwhKc57Wg1DoocF6N4fft6yN/5Ov79cpf4E3n139DxHxt/VWjWLjTwK90ryBL
	nh5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1719236889; x=1719323289; bh=m1ygcSpOcgz8PRMolKj0zus6mRL+uXQvw8S
	dE2416+E=; b=kJ5y7ctrz70i1raqTos7bxx9TqfZriVT8sPywXo+ER/RZhrxhLC
	oGVV6s54dYNPeLBZ4+ajOm3fvg7VV2e/NGhClqaagbd3GqAs/C+5rjFk25isjX2Z
	/MR0bbP8teefcbvsw7Ak56b4D6OtQ5ymJPiJRYaRUPZBQbo6+MLuSDaOvc18Mblg
	rgyCyQ24WersBgY+47XXTjH1vrPWLRxZL7xtvB3egVxpPSod1u2D9+WnmE353IMM
	pOYd26/Iw70YB1YkucJbejiI+AW7VLAYWH45ZkL1usKeYMkgDM220JkzTXt9eXIY
	kFChZxx/okmg/cLzVXEnuGdnHNhXg4Uwavg==
X-ME-Sender: <xms:GXl5Zn04JyJeR_4i-OP_aYUIODz9nDWcwgf9B2LYD0KxYUX2dpsQ6Q>
    <xme:GXl5ZmF3pYhqtUbqKmdjKPHJPvbJRszPqmieA6Quoo7CwntI5zm_ZKGz24OrkuvgQ
    rxEu0XAD0GNZg>
X-ME-Received: <xmr:GXl5Zn5SgfpfJUeBww96Oh8tuTAxmIl0StN2gKMgp_kdJDHT_B8Ag9GUGSXxdXg2d5iuR_cFb-7wEOLcrHzYL0ytBsLpR2MEvQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeeguddgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkgggtugesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgefhfeff
    uefhffdvheeugfefleehvdeiueekudeuveeljeehgeffteehgffggeelnecuffhomhgrih
    hnpehgihhthhhusgdrtghomhdpkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:GXl5Zs2_OG4ozr579RiPt9-1hSba8Y5wgy7n7dvKoAFOgvNcSKVR5A>
    <xmx:GXl5ZqGcu73kEowIXBlOxdzIuSujbb9xi15vS1AFz9R5-dNA_1SCfw>
    <xmx:GXl5Zt_y7No2iPxQfqr6gjhlRrPsujOToifFwvguwEnYVqITnYCwsw>
    <xmx:GXl5ZnlUSdMm9KfUrAl4Lf6LTwz3sZCzCIO8B0U9glOfTggydG4AKQ>
    <xmx:GXl5ZmiZWXmSR-RFYjDeD1Dgan8xBzTJmQf6r3krGx39WuVS7HVsOm1A>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 24 Jun 2024 15:48:05 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Christoph Hellwig <hch@lst.de>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>
Subject: Regression in xen-blkfront regarding sector sizes
Message-ID: <Znl5FYI9CC37jJLX@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5QbWF5RurAf+2VDd"
Content-Disposition: inline


--5QbWF5RurAf+2VDd
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Jun 2024 15:48:05 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Christoph Hellwig <hch@lst.de>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>
Subject: Regression in xen-blkfront regarding sector sizes

Hi,

Some Qubes users report a regression in xen-blkfront regarding block
size reporting. It works fine on 6.8.8, but appears broken on 6.9.2.

The specific problem is that blkfront reports block size of 512, even for
backend devices of 4096. This, for example, fails 512-bytes reads with
O_DIRECT, and appears to break mounting a filesystem on such a device
(at least xfs one).

For example it looks like this:

    [user@dom0 ~]$ head /sys/block/loop12/queue/*_block_size
    =3D=3D> /sys/block/loop12/queue/logical_block_size <=3D=3D
    4096

    =3D=3D> /sys/block/loop12/queue/physical_block_size <=3D=3D
    4096

    [user@dom0 bin]$ qvm-run -p the-vm 'head /sys/block/xvdi/queue/*_block_=
size'
    =3D=3D> /sys/block/xvdi/queue/logical_block_size <=3D=3D
    512

    =3D=3D> /sys/block/xvdi/queue/physical_block_size <=3D=3D
    512

and then:

    $ sudo dd if=3D/dev/xvdi of=3D/dev/null count=3D1 status=3Dprogress ifl=
ag=3Ddirect
    /usr/bin/dd: error reading '/dev/xvdi': Input/output error
    0+0 records in
    0+0 records out
    0 bytes copied, 0.000170858 s, 0.0 kB/s

and mounting fails like this:

    [   68.055045] SGI XFS with ACLs, security attributes, realtime, scrub,=
 quota, no debug enabled
    [   68.057308] I/O error, dev xvdi, sector 0 op 0x0:(READ) flags 0x1000=
 phys_seg 1 prio class 0
    [   68.057333] XFS (xvdi): SB validate failed with error -5.

More details at https://github.com/QubesOS/qubes-issues/issues/9293

Rusty suspects it's related to
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/d=
rivers/block/xen-blkfront.c?id=3Dba3f67c1163812b5d7ec33705c31edaa30ce6c51,
so I'm cc-ing people mentioned there too.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--5QbWF5RurAf+2VDd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmZ5eRUACgkQ24/THMrX
1yzhVwf+KP6Njl2Qp0s1yEbrTFIzpgQkPJqQ7YFHoYOss3N65lEk1XS5f6j0MKoE
7BpuQcNtti9+9guVhoSTaOnp2ittNLj6GP478E/zrOCly8Ta5G5HVz+XIMha++eO
8anR0i0V9yQr7lCetluey+WYA5VgVlwWb5CnG8S7fDfDOXn0ZW0ok1qU/CSVJJ/z
xpwkn0fo27cj3cac+Bp1RvYo5XXZ6oXURaTyHx71Ov/+WiHawiiUtAll2IV8BAxV
1DvSCbd8ggPCC+F0mLMpXnqnaITdbkP77ca0PB3Ge+vd+wa3ibLJWEIefTLXfICl
IiKkAju3aylRai7xySrRhbXCxfnxlg==
=hp8c
-----END PGP SIGNATURE-----

--5QbWF5RurAf+2VDd--

