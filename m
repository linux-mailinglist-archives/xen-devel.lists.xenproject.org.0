Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3964A86DA3
	for <lists+xen-devel@lfdr.de>; Sat, 12 Apr 2025 16:19:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.948264.1345630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3bhc-0003Vr-Ib; Sat, 12 Apr 2025 14:19:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 948264.1345630; Sat, 12 Apr 2025 14:19:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3bhc-0003TP-Fk; Sat, 12 Apr 2025 14:19:24 +0000
Received: by outflank-mailman (input) for mailman id 948264;
 Sat, 12 Apr 2025 14:19:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E+MK=W6=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u3bhb-0003TI-Em
 for xen-devel@lists.xenproject.org; Sat, 12 Apr 2025 14:19:23 +0000
Received: from fout-a3-smtp.messagingengine.com
 (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 200c1e1a-17a9-11f0-9eae-5ba50f476ded;
 Sat, 12 Apr 2025 16:19:21 +0200 (CEST)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfout.phl.internal (Postfix) with ESMTP id B533A1380228;
 Sat, 12 Apr 2025 10:19:19 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-11.internal (MEProxy); Sat, 12 Apr 2025 10:19:19 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 12 Apr 2025 10:19:18 -0400 (EDT)
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
X-Inumbo-ID: 200c1e1a-17a9-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1744467559;
	 x=1744553959; bh=kdy9YcbRixYr38eG/yxPHaxk84zlq538sH/+3WCX7eU=; b=
	krvEGEKDHDgQVApWRUDjxu2ydmqjF9vuOUoLJS0B9DloMq0+A1dyeCeU+GkCNpGk
	Zx2yA94vq7mFuM0EITJ6Oo8F2RgPOg98cvZHfaer+MiFOP+SRWgnuD79/pDj2Q1g
	7Imdl21RmiKQU1t70vpoyMEHZDyXJMyqGAOtFhEL4CzhifFqjl5Muq7qc+3Wypmj
	BzcY8sV8wXVetyj6hS0pOL2XlOBPH/qcsdB7z05BbZa3dcZ8id6T+FSm7EgOwADy
	o23BrxNuqgmHFf6MFRtFulGdGJ4Y7Cn6CtIe3qRWuzu9Nm+nSagArhtkafxQlFCw
	vxtnnEi3K0UmuZ+xwysIzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744467559; x=1744553959; bh=kdy9YcbRixYr38eG/yxPHaxk84zlq538sH/
	+3WCX7eU=; b=cT5/w5mFgKUUShhSoIA7lc8SJr0MhNJ/PfyaDUfMH4TjZGmj6Sm
	avtPl8Amn7ty+Kylqoxh1Je+TlpNfR1Q9KZ8spnIEPIw/9MOV6d1c6AsqMQ4R/O6
	P9OExhCQeJmdpAJ/UBk3O4g3EMUW0m+Gz3hOG5F6MOdKTPnZsy5NTLxyuVbSq8gj
	00sGn5RlgJlr2qA/Mwmzh2Q76yOGvAnkNE6q601sLYezzkQ3WiFx9U4MQxs0heEY
	zyq2v93tTQjYjjGT1IEf1zEG9gpujY8bSd4BahcO479teyZSebzJj7xRsmzIELvL
	mQ7sVeockHjVtLqr4x/vGr0Z19EYz9OUT8g==
X-ME-Sender: <xms:Z3b6Z-OADuryoFLmgO_0Wi9DfrAVCea6RjGpjyPI5S0DnPu4H0-RCA>
    <xme:Z3b6Z8_uMqNM2TQ8pm_uFWNqXSDDwMyuVky2uxIq3f7zCYr0ztjA5dObOVrUctSaS
    qupOrxVFtzwSg>
X-ME-Received: <xmr:Z3b6Z1QAct8LqHZKnoYw0CeG2l5eNPlCZug_vNv2oy85cMaIZ_1phiDwwIJuKmUU5jxH84nlOYOskWGJw5Lez9QsyhizVLqfiQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvudegleehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettd
    dvgeeuteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    dpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghn
    ughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopeigvghnqd
    guvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopegt
    rghrughovgestggrrhguohgvrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhnih
    eskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Z3b6Z-sHKfquZQGLEatmwFQ2AQ3xFp9PL-mZDK5nrAkz3BTvVt5s-Q>
    <xmx:Z3b6Z2dFfbMuziJFz2VEbn6cHwHj-uq1FWgvJ4g_TX5GypQ2K7EiUw>
    <xmx:Z3b6Zy2zi8aCrYLh8am7djYjMfzXGjsezM_WVDqUnGfghQjAJM1GLA>
    <xmx:Z3b6Z69Jj7Iyjqs_y8ftsDQrnZ6Dy70X29pVsM5dPYJpA8l5UyUSWA>
    <xmx:Z3b6Z_vR9DOUk4UvzfTD0hMhNe4IBn4k1dnWAG8STDGKniP5EHDliAgp>
Feedback-ID: i1568416f:Fastmail
Date: Sat, 12 Apr 2025 16:19:15 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 5/7] CI: avoid repacking initrd as part of the test job
Message-ID: <Z_p2Y8tgLujBxGF3@mail-itl>
References: <cover.146eb3617cc9cf442dd4fc7a0a8950fb1bc191c8.1744403499.git-series.marmarek@invisiblethingslab.com>
 <c7bd8aa95e8bd85f3e42ed4f07d69444f5435e25.1744403499.git-series.marmarek@invisiblethingslab.com>
 <b1ffc4df-bd79-47ec-b80c-8bd935f5f2ed@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uf6Cu/I+VvJoSbeU"
Content-Disposition: inline
In-Reply-To: <b1ffc4df-bd79-47ec-b80c-8bd935f5f2ed@citrix.com>


--uf6Cu/I+VvJoSbeU
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Apr 2025 16:19:15 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 5/7] CI: avoid repacking initrd as part of the test job

On Sat, Apr 12, 2025 at 03:05:13PM +0100, Andrew Cooper wrote:
> On 11/04/2025 9:32 pm, Marek Marczykowski-G=C3=B3recki wrote:
> > @@ -28,16 +28,15 @@ cd initrd
> >  find . | cpio --create --format=3D'newc' | gzip > ../initrd.cpio.gz
> >  cd ..
> > =20
> > -# initrd.tar.gz is Dom0 rootfs
> > +# Dom0 rootfs - overlay on top of rootfs.cpio.gz
> >  mkdir -p rootfs
> >  cd rootfs
> > -tar xvzf ../initrd.tar.gz
> >  mkdir proc
> >  mkdir run
> >  mkdir srv
> >  mkdir sys
> > -rm var/run
>=20
> I'm not sure why we need to make proc, run, srv, sys in the overlay
> image, but this is repeated everywhere.
>=20
> srv is just a plain empty dir.=C2=A0 It's missing from $PATHS in the root=
fs
> generation, so that's easy.

srv is indeed likely not needed, but there is enough changes here
already.

> proc, run and sys are more complicated, because we don't want to simply
> copy them from the rootfs generation environment.

As for those mountpoints, they looks to be necessary - in a job that
failed to unpack this overlay part, openrc failed to mount those
filesystems and crashed rather badly (especially without /run...).
I'm not sure if that's something that is missing in the base archive, or
is a problem for another reason, but it seems to be necessary to have it
here, at least without changes elsewhere.
Looking at PATHS in alpine-rootfs.sh they may be simply skipped there.

> dev is also in the same boat, and what we do now seems to cause openrc
> not to seed it normally, which seems unwise.

It mounts devtmpfs there anyway, no?

> I'll see what I can do to clean this all up.
>=20
> > diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automatio=
n/scripts/xilinx-smoke-dom0-x86_64.sh
> > index 4db249530823..52a0e05e3f1b 100755
> > --- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
> > +++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
> > @@ -80,6 +80,7 @@ argo-exec -l -p 28333 -- /bin/echo
> >  "
> >  copy_dom0_files ()
> >  {
> > +    mkdir -p root usr/local/lib
> >      cp "${WORKDIR}/binaries/xen-argo.ko" "root/"
> >      cp -ar "${WORKDIR}/binaries/lib/"* "usr/local/lib/"
> >      cp "${WORKDIR}/binaries/argo-exec" "usr/local/bin/"
>=20
> This would be better based on top of my patch to switch to the new argo,
> at which point it will simply be to append argo.cpio.gz.
>=20
> ~Andrew

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--uf6Cu/I+VvJoSbeU
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmf6dmMACgkQ24/THMrX
1yx6yggAg5NpZyM60JavJLduFAytSjafps1HR+7tMKOBtkQGYZygWwgc+YJkrkqv
YaJER97MPxPoakSM+ySsIioyLIPU/nFKJ2Rm5sk80dDAXBhy/tq8JxjVFQqO6L8o
spUiajmwkc1ag+f2MWVQdD9pu1Oq6bnYBK+my3lr6dxlkamLxdcCUVAPI37iQCoz
X5UfFAT/BnVFsRuGZFnyXOV3wNr0WS6i76z9oo2rZK17sha0+JEJ4Km6HeQR5GNo
Arv0ES/7DvVljUOl8Gh070rKJ5u5IFEHn7nIfOZT4NOs0xIgXpZSrz51PWnrmuaH
4CCRE0htWyVCoTddUh1G1O0Wpn/bmQ==
=zurd
-----END PGP SIGNATURE-----

--uf6Cu/I+VvJoSbeU--

