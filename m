Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8E6ACC4AC
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 12:51:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004219.1383887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMPEr-0005pe-WA; Tue, 03 Jun 2025 10:51:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004219.1383887; Tue, 03 Jun 2025 10:51:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMPEr-0005o7-S9; Tue, 03 Jun 2025 10:51:25 +0000
Received: by outflank-mailman (input) for mailman id 1004219;
 Tue, 03 Jun 2025 10:51:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zlp/=YS=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uMPEq-0005iK-4s
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 10:51:24 +0000
Received: from fhigh-a6-smtp.messagingengine.com
 (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b02467ee-4068-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 12:51:23 +0200 (CEST)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 477F711400D8;
 Tue,  3 Jun 2025 06:51:22 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Tue, 03 Jun 2025 06:51:22 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Jun 2025 06:51:21 -0400 (EDT)
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
X-Inumbo-ID: b02467ee-4068-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1748947882;
	 x=1749034282; bh=A7s43Gt3U95U8A+lN2BlegnNS+gkbNUde2mvHC0ZhpU=; b=
	TT7PUxyh1UV/qcFbQFRugdpcSH3nwz0KOWi9d5qACsBfnKLvYZjCBLkXLgL/u/YR
	+jpiMjZLlmhd4eYop4Z+3Buw3cURfHzpUtq2nPkkLSbctvwXV7An8dkeKJzWSU9A
	XCJmX8mZyUH6dkL5rwUtJjn5ckQiPXNSlb1vxrBM3S6gPaZqyfxQEZvQT0qjkPv6
	gJtrufZNpid9dgpmLw8TGUiwY905rij5QgOP4oT48Z7FJ5ZOsVGzGNfV6JdpBUxA
	mriaCVln3L4JtxLxYS5GISaZVWSVxVyPTzQjqdVP+htiitkThtgQur1qeG5rlY3r
	TrRh88Qv54AityQLTOVYBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1748947882; x=1749034282; bh=A7s43Gt3U95U8A+lN2BlegnNS+gkbNUde2m
	vHC0ZhpU=; b=ovNTfvDg5PL/s7riHwCIKJHjJs+nxF1LSbAjoSp/4jsA3bvqYJV
	k29LuMznmQTU3lrIX7kY95776hdYKps6M38E96eMZGe7UbAvfpdOnCQKWvNDWNsq
	iZwXU3gamvtAVL4N3Yu/qB6glnSLoy7dsYpgCbZmc7y+0nwGOM3pcXSI7iWYsLoQ
	b9Acw4SDQKWv/HGg3qRtqXtqiO+bVeRkuCqLcJ0VbNQuH3tx9rKvqBXGeOy/F2Lo
	3JwygzzozRdKKVMPUf/HSgqMATZoXc5yurTOzpqr5yOz06TGH7sxRMjOc/6EHKef
	+hcjPFihNmigvQrUnHfNU/0DdhxhHxwnbTA==
X-ME-Sender: <xms:qtM-aDxs4T6PtVkhn4RTjvo0HqkbAR5xpaovxON8axOXcY5KAJ7eGg>
    <xme:qtM-aLQZf2QdH_2soby8EjV6r62w5CkeJPZ3oj2YP30-_fNnHi8cVnI2i7ruYGbbg
    y9fETUZGxQXwg>
X-ME-Received: <xmr:qtM-aNUBhrxl256KmbmViENTGnu1pkei5B5qsYMa4sXmExdRAA-rmsaBSreCaNdFtrA4luGnAOmiPZcYNZ6IVA1dXnrjMAXbPf0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddtgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecu
    hfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrg
    hrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffr
    rghtthgvrhhnpefgudelteefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegue
    etfeejudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsg
    gprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhgurhgv
    fidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtohepgigvnhdquggvvh
    gvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnthhh
    ohhnhidrphgvrhgrrhgusehvrghtvghsrdhtvggthhdprhgtphhtthhopehsshhtrggsvg
    hllhhinhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmihgthhgrlhdrohhriigv
    lhesrghmugdrtghomh
X-ME-Proxy: <xmx:qtM-aNiR81UFfTS4n-FW30O3CXxO3WU2F59JPUnt1hJqDyKLZr39yw>
    <xmx:qtM-aFDtIG0Dp5TJkhxIV-hqxu25lR1v8FWbVWcIK5WXF0wHKX37Lw>
    <xmx:qtM-aGKH4bLQCbuegB6cgiGFth0irOmC-k3E6aYIGVFE5ub9IDONFQ>
    <xmx:qtM-aEBCngZVg_TfOVDC1AKPfNNWaOZSX4YgJJQ6f_2MthXN66dceQ>
    <xmx:qtM-aLxY2ViuUlJefLArZmyzoCCWmwHiWhq7wLBWG9kfGvN6eev9nqDw>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 3 Jun 2025 12:51:19 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH 2/2] CI: Adjust how domU is packaged in dom0
Message-ID: <aD7Tp5BEkz0h0gyw@mail-itl>
References: <20250602174618.2641439-1-andrew.cooper3@citrix.com>
 <20250602174618.2641439-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4TOChwVca9ELR8ro"
Content-Disposition: inline
In-Reply-To: <20250602174618.2641439-3-andrew.cooper3@citrix.com>


--4TOChwVca9ELR8ro
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 3 Jun 2025 12:51:19 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH 2/2] CI: Adjust how domU is packaged in dom0

On Mon, Jun 02, 2025 at 06:46:18PM +0100, Andrew Cooper wrote:
> Package domU for dom0 and insert into the uncompressed part of dom0's roo=
tfs,
> rather than recompressing it as part of the overlay.
>=20
> For Qubes, this avoids putting the domU kernel in dom0's rootfs for tests
> which aren't going to boot a guest.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>

> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
>=20
> v2:
>  * Rebase over dom0_rootfs_extra_{un,}comp changes
>  * Move back into boot.  There seem to be objections to having it in root.
> ---
>  automation/scripts/qubes-x86-64.sh             | 17 ++++++++++++-----
>  automation/scripts/xilinx-smoke-dom0-x86_64.sh | 14 +++++++++++---
>  2 files changed, 23 insertions(+), 8 deletions(-)
>=20
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qube=
s-x86-64.sh
> index 5ec6eff6c469..d9ecc569c956 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -156,7 +156,7 @@ esac
>  domU_config=3D"
>  type =3D '${domU_type}'
>  name =3D 'domU'
> -kernel =3D '/boot/vmlinuz'
> +kernel =3D '/boot/vmlinuz-domU'
>  ramdisk =3D '/boot/initrd-domU'
>  cmdline =3D 'root=3D/dev/ram0 console=3Dhvc0'
>  memory =3D 512
> @@ -187,6 +187,17 @@ Kernel \r on an \m (\l)
>      find . | cpio -H newc -o | gzip >> ../binaries/domU-rootfs.cpio.gz
>      cd ..
>      rm -rf rootfs
> +
> +    # Package domU kernel+rootfs in /boot for dom0 (uncompressed)
> +    mkdir -p rootfs/boot
> +    cd rootfs
> +    cp ../binaries/bzImage boot/vmlinuz-domU
> +    cp ../binaries/domU-rootfs.cpio.gz boot/initrd-domU
> +    find . | cpio -H newc -o > ../binaries/domU-in-dom0.cpio
> +    cd ..
> +    rm -rf rootfs
> +
> +    dom0_rootfs_extra_uncomp+=3D(binaries/domU-in-dom0.cpio)
>  fi
> =20
>  # Dom0 rootfs.  The order or concatination is important; ucode wants to =
come
> @@ -241,10 +252,6 @@ mkdir -p etc/default
>  echo "XENCONSOLED_TRACE=3Dall" >> etc/default/xencommons
>  echo "QEMU_XEN=3D/bin/false" >> etc/default/xencommons
>  mkdir -p var/log/xen/console
> -cp ../binaries/bzImage boot/vmlinuz
> -if [ -n "$domU_check" ]; then
> -    cp ../binaries/domU-rootfs.cpio.gz boot/initrd-domU
> -fi
>  find . | cpio -H newc -o | gzip >> ../binaries/dom0-rootfs.cpio.gz
>  cd ..
> =20
> diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/=
scripts/xilinx-smoke-dom0-x86_64.sh
> index 45121f39400a..8981aee5d4f2 100755
> --- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
> +++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
> @@ -22,7 +22,7 @@ DOMU_CMD=3D""
>  DOMU_CFG=3D'
>  type =3D "pvh"
>  name =3D "domU"
> -kernel =3D "/boot/vmlinuz"
> +kernel =3D "/boot/vmlinuz-domU"
>  ramdisk =3D "/boot/initrd-domU"
>  extra =3D "root=3D/dev/ram0 console=3Dhvc0"
>  memory =3D 512
> @@ -106,10 +106,20 @@ find . | cpio -H newc -o | gzip >> ../binaries/domU=
-rootfs.cpio.gz
>  cd ..
>  rm -rf rootfs
> =20
> +# Package domU kernel+rootfs in /boot for dom0 (uncompressed)
> +mkdir -p rootfs/boot
> +cd rootfs
> +cp ../binaries/bzImage boot/vmlinuz-domU
> +cp ../binaries/domU-rootfs.cpio.gz boot/initrd-domU
> +find . | cpio -H newc -o > ../binaries/domU-in-dom0.cpio
> +cd ..
> +rm -rf rootfs
> +
>  # Dom0 rootfs.  The order or concatination is important; ucode wants to =
come
>  # first, and all uncompressed must be ahead of compressed.
>  dom0_rootfs_parts=3D(
>      binaries/ucode.cpio
> +    binaries/domU-in-dom0.cpio
>      "${dom0_rootfs_extra_uncomp[@]}"
>      binaries/rootfs.cpio.gz
>      binaries/xen-tools.cpio.gz
> @@ -131,8 +141,6 @@ echo "${DOMU_CFG}${DOMU_CFG_EXTRA}" > etc/xen/domU.cfg
>  echo "XENCONSOLED_TRACE=3Dall" >> etc/default/xencommons
>  echo "QEMU_XEN=3D/bin/false" >> etc/default/xencommons
>  mkdir -p var/log/xen/console
> -cp ../binaries/bzImage boot/vmlinuz
> -cp ../binaries/domU-rootfs.cpio.gz boot/initrd-domU
>  find . | cpio -H newc -o | gzip >> ../binaries/dom0-rootfs.cpio.gz
>  cd ..
> =20
> --=20
> 2.39.5
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--4TOChwVca9ELR8ro
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmg+06cACgkQ24/THMrX
1yzVqgf/QPy6lxz0dQ51KPTS4zJN2eRvoN6eY6Fb0qsWcE+4eC71+CADAoUSVbq+
kOUdq+AzRdMYXXXbkJj/3uHA7QWAvEOLsCBtn8CSoVtpL6K1F9frPBNzQLmyHE4L
j8uUJpWsuqkmwUw6vbfcL5SE8dEBxGyYZzZOMh6ec2ifr6qO3LdAlKDLHt6Z/8lt
HI2wVFu0HusNhIOzIit3FKQ5nQ6ausaEoK1XB4RsTsGi5uHyMIp1m8nKIoz3WKTN
Y1hskMnDOnU6G73sOhXMBMtgoMMMn/ZgPWm43FRT/POxQ9n8S0RxihEz+ndX+OyO
ZmGfZYwRzt6yhx5u2mPeC8QdOKHF0w==
=S/49
-----END PGP SIGNATURE-----

--4TOChwVca9ELR8ro--

