Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B55F5A7E7F4
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 19:15:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940721.1340386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1q4R-00057g-Kq; Mon, 07 Apr 2025 17:15:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940721.1340386; Mon, 07 Apr 2025 17:15:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1q4R-00055S-I9; Mon, 07 Apr 2025 17:15:39 +0000
Received: by outflank-mailman (input) for mailman id 940721;
 Mon, 07 Apr 2025 17:15:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uyK1=WZ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u1q4P-0004cn-RU
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 17:15:37 +0000
Received: from fout-a3-smtp.messagingengine.com
 (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb95c3e3-13d3-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 19:15:36 +0200 (CEST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfout.phl.internal (Postfix) with ESMTP id 97D3B1380213;
 Mon,  7 Apr 2025 13:15:35 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Mon, 07 Apr 2025 13:15:35 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Apr 2025 13:15:33 -0400 (EDT)
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
X-Inumbo-ID: eb95c3e3-13d3-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1744046135;
	 x=1744132535; bh=qj8TCDCpmlYdT7b3QX/qcCPXxmCBlt/tr41GIjIAxv4=; b=
	b1mgqCGNWhkysWvvOkdoW/27KO2WLVSjCdsRo+duhN2kuZBh/ZQTc4Mige3HuP6B
	QAbmzTizBbhaoqC02NA4lKdJPS8LSaOz/4SkRxLYWvbUWchDHnM1KpjjU5V5itR/
	Fb7wmIJVISeT1N3dzi6FD8+JiVaQuQsQtszOYNhRVLi4ERSFFHWt4K8ioZrRzKaW
	BcFcRHOZfiHxv/gv+xpI6vlGik/YbpsjH04ULZeaSAOjOmyzLLkWotrPB9JREKes
	cedkxQOE9S68GN4tLloOEuzESLpQGjWg3/GH4V4Uxqq0WNFLhVWBcqkvmJNFptDx
	ylUlbsCCRoAuHpyhzvi6JA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744046135; x=1744132535; bh=qj8TCDCpmlYdT7b3QX/qcCPXxmCBlt/tr41
	GIjIAxv4=; b=HrEfC4pGwmGc5tQUv39mp0dKANDigaAn3vLO6MhgLC951M+P3Im
	41cejfUrQ1Je8iE4k/LRqvjDLCLngEOpYAFNLu5jGAOHBK/s7XmZ1QqU60K88OjG
	jnfn8TnK8r/dCbRaXs6TI1ewrwIzXCcvM/QbqMyCB95QlIqblgRWqbzpMB0zq4xl
	XOHtbAmQ2jN8FjgzcyxDAumcdUfqGeHLVXdmzxKCPiKuJgtP4PQy3i4a9R4Jio0/
	miAQaI/m8DsGO+P4QYqksvcnBoarpeoAwmRzBH2YlG0IEBHph/wFO3meHYQdjXSx
	9L0vY6W8eBxeV2EBcerX8MJAuC32N96sdtw==
X-ME-Sender: <xms:Nwj0Zxb4e8oXcf4uo8HuPpjznt3xyctA99qPXN7H8UXf8vhWgGm1CQ>
    <xme:Nwj0Z4aB6qf_d0MJF1zSuVtpdYyP2Lwj6_npOjSyw3QMKQvxTj9Ddk95A98OxRj94
    YX00HpmDM8c-Q>
X-ME-Received: <xmr:Nwj0Zz_iH8K4HsgnsMcGCEk2GVo-EXPHeNIPodsnUkUIGicilecnhyFBPhZbPT4jlpTpfgSb-JVG3Q36sg8NitIKGCzudtFuMw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtjeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettd
    dvgeeuteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    dpnhgspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghn
    ughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopeigvghnqd
    guvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehs
    shhtrggsvghllhhinhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhhthhhonh
    ihrdhpvghrrghrugesvhgrthgvshdrthgvtghhpdhrtghpthhtohepmhhitghhrghlrdho
    rhiivghlsegrmhgurdgtohhmpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtg
    homhdprhgtphhtthhopehjuhhlihgvnhesgigvnhdrohhrghdprhgtphhtthhopehrohhg
    vghrrdhprghusegtihhtrhhigidrtghomh
X-ME-Proxy: <xmx:Nwj0Z_paz8WnX2g6Z4QYe2cZiMMbfI_hXxqxfJwEZ_R9bL8Cb1GOUA>
    <xmx:Nwj0Z8ocwmtrMSo8jo9gWqMPejbdRlqQN279278BpoQ_00j1s5ofMQ>
    <xmx:Nwj0Z1Raon5UEBG_GKcF6KGV_eT5XPiskcxEc8CIMaW0xYCL3W7iFQ>
    <xmx:Nwj0Z0p_VVjHoBRMjYIefpDsip7wLyi456PSmQmoZpSclBMpu7urrg>
    <xmx:Nwj0Z69p900UoXIcIUcBiOZ5BF3ORqQ8aUzXCwZL3o2RtdhhxldIe9xr>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 7 Apr 2025 19:15:31 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH test-artifacts v2 14/12] scripts: build initrd cpio
Message-ID: <Z_QIM8TBRXLeqACa@mail-itl>
References: <cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com>
 <20250407123448.1520451-2-marmarek@invisiblethingslab.com>
 <16f91d01-ea1c-43ec-a5d8-a55bb84fe94b@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FSG6cy5SZ83uMMP7"
Content-Disposition: inline
In-Reply-To: <16f91d01-ea1c-43ec-a5d8-a55bb84fe94b@citrix.com>


--FSG6cy5SZ83uMMP7
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 7 Apr 2025 19:15:31 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH test-artifacts v2 14/12] scripts: build initrd cpio

On Mon, Apr 07, 2025 at 06:11:29PM +0100, Andrew Cooper wrote:
> On 07/04/2025 1:31 pm, Marek Marczykowski-G=C3=B3recki wrote:
> > Build initrd format directly digestable by the kernel. Additionally,
> > include it itself inside as boot/initrd-domU file, for domU booting in
> > tests.
> > This should avoid the need to repack tar -> cpio as part of the test
> > job.
> >
> > Keep generating initrd.tar.gz as that's still used by older branches.
> >
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> >  scripts/x86_64-rootfs-alpine.sh | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/scripts/x86_64-rootfs-alpine.sh b/scripts/x86_64-rootfs-al=
pine.sh
> > index b70b3a5..13e85fa 100755
> > --- a/scripts/x86_64-rootfs-alpine.sh
> > +++ b/scripts/x86_64-rootfs-alpine.sh
> > @@ -58,3 +58,8 @@ passwd -d "root" root
> >  cd /
> >  tar cvzf "${WORKDIR}/binaries/initrd.tar.gz" \
> >      bin dev etc home init lib mnt opt root sbin usr var
> > +mkdir boot
> > +find bin dev etc home init lib mnt opt root sbin usr var |\
> > +    cpio -o -H newc | gzip > boot/initrd-domU
> > +find bin boot dev etc home init lib mnt opt root sbin usr var |\
> > +    cpio -o -H newc | gzip > "${WORKDIR}/binaries/initrd.cpio.gz" \
>=20
> So, after looking at this a bit more, a few notes.
>=20
> Trailing \ needs dropping.
>=20
> initrd-domU probably ought to be named initrd-domU-base.cpio.gz so it's
> clear what it is.=C2=A0 These are easy to fix up.

Technically, it's useful as is already if you just want to check if domU
starts.

> Looking through the current initrd.tar.gz, we've got:
>=20
> $ ls -lah ./var/cache/apk/
> total 1.9M
> drwxr-xr-x 2 andrew andrew 4.0K Nov=C2=A0 8 15:12 .
> drwxr-xr-x 4 andrew andrew 4.0K Sep=C2=A0 6=C2=A0 2024 ..
> -rw-r--r-- 1 andrew andrew 425K Nov=C2=A0 8 15:12 APKINDEX.73fc500b.tar.gz
> -rw-r--r-- 1 andrew andrew 1.4M Nov=C2=A0 8 15:12 APKINDEX.eb46142e.tar.gz
>=20
> which (alone) is 5% of the size of the initrd.=C2=A0 I'll submit a patch
> separately to drop this.

Makes sense.

> But doesn't this result in initrd.tar.gz being included in initrd-domU,
> and then (doubly) in initrd.cpio.gz ?

No, find (same as tar earlier) has explicit list of dirs to look at,
which don't include initrd.* nor "binaries".

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--FSG6cy5SZ83uMMP7
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmf0CDMACgkQ24/THMrX
1ywQvQf/Wtly33pfYqMHyWh0TH11N9OEKp3BjUf+95E8fuf2bJhk1j9KHQ3VQAsq
taWwWmH6WGaTH4xJrt+BPhoQMml7tOP630YR5k5I588HfJi8z6fAeG6xmoSxEile
Fo4fisF7Vh5uGuPoGnFjHhEyA064EaEBEV2xoDSyxMYVUc1H2rzDqbE6cDk9EgSU
xrnegIfiN8NUUmDYmfhbBSYL8v6KOM3TlykHHzCg4y7sW8OD/B3hPmufYFJ4uekl
+G5iPJDgNrvtMdAJVdOgO91PLXxCmbHvHFfbM7QLDn7broM/Vm5MwYybb3QzboB1
YO5SaUE6eHv+M1gDCQuTves++TF42A==
=W10d
-----END PGP SIGNATURE-----

--FSG6cy5SZ83uMMP7--

