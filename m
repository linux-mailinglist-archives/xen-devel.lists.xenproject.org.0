Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F4FAC504E
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 15:56:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998460.1379185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJum8-0001YW-EQ; Tue, 27 May 2025 13:55:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998460.1379185; Tue, 27 May 2025 13:55:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJum8-0001Vo-Bm; Tue, 27 May 2025 13:55:28 +0000
Received: by outflank-mailman (input) for mailman id 998460;
 Tue, 27 May 2025 13:55:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IdP1=YL=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uJum6-0001Vg-Ha
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 13:55:26 +0000
Received: from fout-a7-smtp.messagingengine.com
 (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39d9a2a1-3b02-11f0-b894-0df219b8e170;
 Tue, 27 May 2025 15:55:20 +0200 (CEST)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal
 [10.202.2.43])
 by mailfout.phl.internal (Postfix) with ESMTP id 51B921383AAF;
 Tue, 27 May 2025 09:55:19 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Tue, 27 May 2025 09:55:19 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 May 2025 09:55:17 -0400 (EDT)
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
X-Inumbo-ID: 39d9a2a1-3b02-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1748354119;
	 x=1748440519; bh=nFL9UMqLY6lge/cznspNadDv3MceWLjgTiSDAGd2w/w=; b=
	uA3NzNqKnpYK2lrqFO+i9hdd+xeWyp9S+nx/o3Bo8UZa9ppGu3FZa4GYp3i5maJR
	7Mqh3KnPSAjj+JPbNjM9ZxMj8RDi7AlweoCn3rKRyHxiID/9a/M2o3TnmlXx4Qvm
	4r9nGFnAWWNot82fyv0x5Y0ot7XeNLyoe9WWGkqlXK7//xePiayzkkQ6CEWzB+oO
	5JmP0Rs6vdtKroFhDJ5E2cdFFBtKjUKeb9uk6djWR8Y8sGnDnS9G2V0v3/h79gkE
	xDMctJ20lPG3o78f6ayvIBdQOHWhjYb5KKJG5dRZh7+cEpcjeH0CeDVpg8caRqt3
	8NxaB3ZXsiiggrzP1GsWUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1748354119; x=1748440519; bh=nFL9UMqLY6lge/cznspNadDv3MceWLjgTiS
	DAGd2w/w=; b=CcfbgyodLn/0SfXDc0y4A6nyElMBCEnpREtYiuwiDgeRiPBkTvA
	I8S3nYXnBcnB2grBynK4zLJJ0J7HwxJbSJUtLbXR+4UvF9xTos0XFD2dmuc/xujL
	zS1oNEr7yBnPwAANevzMmm88K1LlFBoxX5j1Pn0EmYUAg3nkDIxPsd521vBl8RxY
	jQTXSc/ngkhH4pwL46XVPrlvYK4kxYNbTNs/KAx79LF1lVeqfdp/fQn0HOzs/RuC
	1CoTC/C3ztWArqt+W1S2Rfip129FqyyOCv9oHwKLrN62XL71jlWsCA0GIZm0fqhW
	V09G7nVGSvo8XSPrMGlES32e65MF3DKCA3Q==
X-ME-Sender: <xms:RsQ1aKMkW_KiHXkE0KsKAml4izSHNSwxSxe4PIWzqMqjy7ytTNLazQ>
    <xme:RsQ1aI8n83v6LY5WqjQ4hk3sNwAQ59PLTxRFJSHeDMuRMagyNIfC5AE2e92-OjgXg
    -Rzdu6STLnJFA>
X-ME-Received: <xmr:RsQ1aBSqRq2ub2RT79e5T-xu3kNpTrgZXLjgRU84G0NK-zKIvPk-a_6Zf0rDUP6hIlHzE5ObQLohpcB92_xydbibJxtv7_hb5rE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvtdehheculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhf
    gggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifsh
    hkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhg
    shhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudelteefvefhfeehieetleeihf
    ejhfeludevteetkeevtedtvdegueetfeejudenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthh
    hinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpd
    hrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdho
    rhhgpdhrtghpthhtoheprghnthhhohhnhidrphgvrhgrrhgusehvrghtvghsrdhtvggthh
    dprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehmihgthhgrlhdrohhriigvlhesrghmugdrtghomh
X-ME-Proxy: <xmx:RsQ1aKvON6uyjdt2hyXrl4TZlTRa1c6zg2EVpgnAFWhE3aoEXoXMbg>
    <xmx:RsQ1aCdlWBa2jQP2Gj2PNW1CSP4J3rcSru2H564wdB8CHsgnbNFFDw>
    <xmx:RsQ1aO23XoHyDJL0XOL7L5Nj7i7Xb2mjsGMingVDCmUSvNbwcExP1w>
    <xmx:RsQ1aG_PrLXG-iodoAhw-o5oBqiNOJQMPoiqQBKC2Sn7RapPV7wEtA>
    <xmx:R8Q1aM-AQ-c1STQbkCsO7mK7msHKtHfmkJV6vpXtgNyef4xONond_3nP>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 27 May 2025 15:55:15 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH 3/3] CI: Adjust how domU is packaged in dom0
Message-ID: <aDXERF8V2DQcyJoy@mail-itl>
References: <20250522173640.575452-1-andrew.cooper3@citrix.com>
 <20250522173640.575452-4-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="p3jWn/E45DBNiCxB"
Content-Disposition: inline
In-Reply-To: <20250522173640.575452-4-andrew.cooper3@citrix.com>


--p3jWn/E45DBNiCxB
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 May 2025 15:55:15 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH 3/3] CI: Adjust how domU is packaged in dom0

On Thu, May 22, 2025 at 06:36:40PM +0100, Andrew Cooper wrote:
> Package domU in /root for dom0 and insert into the uncompressed part of d=
om0's
> rootfs, rather than recompressing it as part of the overlay.

It doesn't really need moving to /root to achieve this, no? The
domU-in-dom0.cpio can very well contain boot/* files.

> For Qubes, this avoids putting the domU kernel in dom0's rootfs for tests
> which aren't going to boot a guest.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> ---
>  automation/scripts/qubes-x86-64.sh            | 20 +++++++++++++------
>  .../scripts/xilinx-smoke-dom0-x86_64.sh       | 16 +++++++++++----
>  2 files changed, 26 insertions(+), 10 deletions(-)
>=20
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qube=
s-x86-64.sh
> index 1dd3f48b3d29..17a37134f46a 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -154,8 +154,8 @@ esac
>  domU_config=3D"
>  type =3D '${domU_type}'
>  name =3D 'domU'
> -kernel =3D '/boot/vmlinuz'
> -ramdisk =3D '/boot/initrd-domU'
> +kernel =3D '/root/vmlinuz-domU'
> +ramdisk =3D '/root/initrd-domU'
>  cmdline =3D 'root=3D/dev/ram0 console=3Dhvc0'
>  memory =3D 512
>  vif =3D [ ${domU_vif} ]
> @@ -185,12 +185,24 @@ Kernel \r on an \m (\l)
>      find . | cpio -H newc -o | gzip >> ../binaries/domU-rootfs.cpio.gz
>      cd ..
>      rm -rf rootfs
> +
> +    # Package domU kernel+rootfs in /root for dom0 (uncompressed)
> +    mkdir -p rootfs/root
> +    cd rootfs
> +    cp ../binaries/bzImage root/vmlinuz-domU
> +    cp ../binaries/domU-rootfs.cpio.gz root/initrd-domU
> +    find . | cpio -H newc -o > ../binaries/domU-in-dom0.cpio
> +    cd ..
> +    rm -rf rootfs
>  fi
> =20
>  # Dom0 rootfs.  The order or concatination is important; ucode wants to =
come
>  # first, and all uncompressed must be ahead of compressed.
>  parts=3D(
>      binaries/ucode.cpio
> +)
> +[ -n "$domU_check" ] && parts+=3D(binaries/domU-in-dom0.cpio)
> +parts+=3D(
>      binaries/rootfs.cpio.gz
>      binaries/xen-tools.cpio.gz
>  )
> @@ -238,10 +250,6 @@ mkdir -p etc/default
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
> index 0fbabb41054a..29817ff81d0a 100755
> --- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
> +++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
> @@ -22,8 +22,8 @@ DOMU_CMD=3D""
>  DOMU_CFG=3D'
>  type =3D "pvh"
>  name =3D "domU"
> -kernel =3D "/boot/vmlinuz"
> -ramdisk =3D "/boot/initrd-domU"
> +kernel =3D "/root/vmlinuz-domU"
> +ramdisk =3D "/root/initrd-domU"
>  extra =3D "root=3D/dev/ram0 console=3Dhvc0"
>  memory =3D 512
>  '
> @@ -103,10 +103,20 @@ find . | cpio -H newc -o | gzip >> ../binaries/domU=
-rootfs.cpio.gz
>  cd ..
>  rm -rf rootfs
> =20
> +# Package domU kernel+rootfs in /root for dom0 (uncompressed)
> +mkdir -p rootfs/root
> +cd rootfs
> +cp ../binaries/bzImage root/vmlinuz-domU
> +cp ../binaries/domU-rootfs.cpio.gz root/initrd-domU
> +find . | cpio -H newc -o > ../binaries/domU-in-dom0.cpio
> +cd ..
> +rm -rf rootfs
> +
>  # Dom0 rootfs.  The order or concatination is important; ucode wants to =
come
>  # first, and all uncompressed must be ahead of compressed.
>  parts=3D(
>      binaries/ucode.cpio
> +    binaries/domU-in-dom0.cpio
>      binaries/rootfs.cpio.gz
>      binaries/xen-tools.cpio.gz
>  )
> @@ -127,8 +137,6 @@ echo "${DOMU_CFG}${DOMU_CFG_EXTRA}" > etc/xen/domU.cfg
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

--p3jWn/E45DBNiCxB
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmg1xEQACgkQ24/THMrX
1yxnZQf8CcIqAT9+qIN1TkU1D+rJbFFe8mval3SeokAdxJlmN0huM2mJYcfKmWLp
esqhotPZY6BaWv79qsdrn8ueq+qEAQk72SYGjOpQLrbiWs/+npSC6SHcxsIEHSON
K0lIsZ7oZ4Am3dNh6GinWfxO+rQ7dacaXgTKmQsgZzyZJHEbwFydp22YwfpQ3WLj
TUsrtGlLOP3pDFhxjQKXUO1YJ4zQtLlJa6WffkrKmCSE83mitPbKBRL0ruazlGaA
d1LK5sKyjUOkBJjJdz5Ub/KnMV/0qKSS1SxFrQm9eAfSq5wkXkeSJaJt5Hkt77aP
5XB8HuwGHFlmXR+pmI30ZtVw6dCbgg==
=UHsO
-----END PGP SIGNATURE-----

--p3jWn/E45DBNiCxB--

