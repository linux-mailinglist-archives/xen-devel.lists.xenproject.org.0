Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB9FACC4A8
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 12:51:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004217.1383876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMPEX-0005O7-NL; Tue, 03 Jun 2025 10:51:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004217.1383876; Tue, 03 Jun 2025 10:51:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMPEX-0005M8-KZ; Tue, 03 Jun 2025 10:51:05 +0000
Received: by outflank-mailman (input) for mailman id 1004217;
 Tue, 03 Jun 2025 10:51:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zlp/=YS=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uMPEW-0005M2-DU
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 10:51:04 +0000
Received: from fhigh-a6-smtp.messagingengine.com
 (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3cbfa94-4068-11f0-b894-0df219b8e170;
 Tue, 03 Jun 2025 12:51:02 +0200 (CEST)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 8FB331140110;
 Tue,  3 Jun 2025 06:51:01 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Tue, 03 Jun 2025 06:51:01 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Jun 2025 06:51:00 -0400 (EDT)
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
X-Inumbo-ID: a3cbfa94-4068-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1748947861;
	 x=1749034261; bh=zUI3kzG1Nt/W2ueMOc7+YFtXPhLR/wqWeu6WRS2IapA=; b=
	ZW91Y2ZkZtlvkgTB02Gt395TjVH5vR8Y3P/JsjK8xArScqRT4rc2aptTuSYtPeRu
	KTzHjIxR6bVZp/YUbcWII+BIK1tz1iTU2P2DMkkFlqAtokBMVHfC7PhDLdEp/7gH
	rkG5Sx9MMN5MjXZQRdCwY0yp0jd1VfJbh6iQW1iPeBLlX8kCGu9YbD4L7qdMtZig
	cUY5XR6t6ghjEaQvBieG2xelVedeSrtrJ5WvawkMmpDxE7P2o5kFhdHIOJHQ75CE
	OItusas3phYiwAequCNEjUlAq/Db1L1vDXGei4bmNR/WpzLz5giFPaPCyKn5tzFj
	ohCsnG8mFscJtEt/CPD+1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1748947861; x=1749034261; bh=zUI3kzG1Nt/W2ueMOc7+YFtXPhLR/wqWeu6
	WRS2IapA=; b=E9bT6qRWB+oWeFH+MMCVupmO6vb5+m63mxb9SUsYOcdzDxACENn
	ReuvXHp/Tioo3ubvDWie7SOTUVrvqv50WKSy3uJrbaooOmJW+cWjcWBThBJ1iVHf
	GzEeVoenJbr3ZWkOV2QY1Xk2+oY6dBljgkH+Qa9+cP8BDW0d6+gmHhlwmcPVTvmg
	OFDtfbHDvyvORcMr4JQlNIzOB3MMK40UtzkjVZBHTEcC6ofq6fhAIUDk33nE8GTD
	6aLrt03nnfwqwZWqN3pVwXgs6QNIQIDwGxE6E9+dwEE09EUNL8A9h8g/8PWp5rTp
	0cUJERQx2BZkSxDH3ZkFA5uPW9m9HeJBlNA==
X-ME-Sender: <xms:ldM-aCSyM6k4Tt2WlVLGsRa7QmXLzmOdHRWeEp7Zyu9qJApHt5jS5A>
    <xme:ldM-aHxNNTY5kCxIbmuIJ8-MkJTrp1HgpAEyJ_u5SMOCERkpOB7nKqGYu4p2N_DFZ
    934lnB3kBiPlQ>
X-ME-Received: <xmr:ldM-aP29_-UKvlx2JzgIzzyA97YaLw3VYmxymoHH6y-3lJdBQoYd5Dg6u7LBguKBxscQqJ7a8L6a0Zejlz_JBAr0PwnIS7XHLaY>
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
X-ME-Proxy: <xmx:ldM-aOCetII9LKXhVD1PJJoqY8xCzYvHIkE-0el9F7Ksy6IJccqFtw>
    <xmx:ldM-aLipaOAr39PP2lT3-583I0AjkIgJcgdzafGwrICwJI9en7VZqA>
    <xmx:ldM-aKovkhtExly-_GWibM6nfAo1HgY6r9v2ThgvUslAiUC6sgwH0A>
    <xmx:ldM-aOiYZuNWAmiiynpD0cV4luI-v95TqVG9k7_3vlzlYw1cO7h-Uw>
    <xmx:ldM-aMQjSk5NqlpwI_ZvhT6MXH4t5CBO-GS46FiuGpC-lzivEIFo_5f2>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 3 Jun 2025 12:50:58 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH 1/2] CI: Use bash arrays to simplfy dom0 rootfs
 construction
Message-ID: <aD7TkroMOfAmZf3p@mail-itl>
References: <20250602174618.2641439-1-andrew.cooper3@citrix.com>
 <20250602174618.2641439-2-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GPtApHH0LFsiAuht"
Content-Disposition: inline
In-Reply-To: <20250602174618.2641439-2-andrew.cooper3@citrix.com>


--GPtApHH0LFsiAuht
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 3 Jun 2025 12:50:58 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH 1/2] CI: Use bash arrays to simplfy dom0 rootfs
 construction

On Mon, Jun 02, 2025 at 06:46:17PM +0100, Andrew Cooper wrote:
> For Qubes, this requires switching from sh to bash.
>=20
> This reduces the number of times the target filename needs to be written =
to 1.
>=20
> Expand the comment to explain the concatination constraints.
>=20
> No functional change.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

With typo below fixed:

Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>

> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
>=20
> v2:
>  * Use dom0_rootfs_extra_{un,}comp arrays
> ---
>  automation/scripts/qubes-x86-64.sh            | 18 ++++++++++++-----
>  .../scripts/xilinx-smoke-dom0-x86_64.sh       | 20 ++++++++++++-------
>  2 files changed, 26 insertions(+), 12 deletions(-)
>=20
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qube=
s-x86-64.sh
> index 8e86940c6eff..5ec6eff6c469 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
> =20
>  set -ex -o pipefail
> =20
> @@ -22,6 +22,8 @@ domU_type=3D"pvh"
>  domU_vif=3D"'bridge=3Dxenbr0',"
>  domU_extra_config=3D
>  retrieve_xml=3D
> +dom0_rootfs_extra_comp=3D()
> +dom0_rootfs_extra_uncomp=3D()
> =20
>  case "${test_variant}" in
>      ### test: smoke test & smoke test PVH & smoke test HVM & smoke test =
PVSHIM
> @@ -187,10 +189,16 @@ Kernel \r on an \m (\l)
>      rm -rf rootfs
>  fi
> =20
> -# Dom0 rootfs
> -cp binaries/ucode.cpio binaries/dom0-rootfs.cpio.gz
> -cat binaries/rootfs.cpio.gz >> binaries/dom0-rootfs.cpio.gz
> -cat binaries/xen-tools.cpio.gz >> binaries/dom0-rootfs.cpio.gz
> +# Dom0 rootfs.  The order or concatination is important; ucode wants to =
come

                             of

> +# first, and all uncompressed must be ahead of compressed.
> +dom0_rootfs_parts=3D(
> +    binaries/ucode.cpio
> +    "${dom0_rootfs_extra_uncomp[@]}"
> +    binaries/rootfs.cpio.gz
> +    binaries/xen-tools.cpio.gz
> +    "${dom0_rootfs_extra_comp[@]}"
> +)
> +cat "${dom0_rootfs_parts[@]}" > binaries/dom0-rootfs.cpio.gz
> =20
>  # test-local configuration
>  mkdir -p rootfs
> diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/=
scripts/xilinx-smoke-dom0-x86_64.sh
> index 8f02fa73bd06..45121f39400a 100755
> --- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
> +++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
> @@ -28,6 +28,8 @@ extra =3D "root=3D/dev/ram0 console=3Dhvc0"
>  memory =3D 512
>  '
>  DOMU_CFG_EXTRA=3D""
> +dom0_rootfs_extra_comp=3D()
> +dom0_rootfs_extra_uncomp=3D()
> =20
>  # Select test variant.
>  if [ "${TEST}" =3D "ping" ]; then
> @@ -71,6 +73,7 @@ do
>    sleep 1
>  done | argo-exec -p 28333 -d 0 -- /bin/echo
>  "
> +    dom0_rootfs_extra_comp+=3D(binaries/argo.cpio.gz)
>      DOM0_CMD=3D"
>  insmod /lib/modules/\$(uname -r)/updates/xen-argo.ko
>  xl -vvv create /etc/xen/domU.cfg
> @@ -103,13 +106,16 @@ find . | cpio -H newc -o | gzip >> ../binaries/domU=
-rootfs.cpio.gz
>  cd ..
>  rm -rf rootfs
> =20
> -# Dom0 rootfs
> -cp binaries/ucode.cpio binaries/dom0-rootfs.cpio.gz
> -cat binaries/rootfs.cpio.gz >> binaries/dom0-rootfs.cpio.gz
> -cat binaries/xen-tools.cpio.gz >> binaries/dom0-rootfs.cpio.gz
> -if [[ "${TEST}" =3D=3D argo ]]; then
> -    cat binaries/argo.cpio.gz >> binaries/dom0-rootfs.cpio.gz
> -fi
> +# Dom0 rootfs.  The order or concatination is important; ucode wants to =
come
> +# first, and all uncompressed must be ahead of compressed.
> +dom0_rootfs_parts=3D(
> +    binaries/ucode.cpio
> +    "${dom0_rootfs_extra_uncomp[@]}"
> +    binaries/rootfs.cpio.gz
> +    binaries/xen-tools.cpio.gz
> +    "${dom0_rootfs_extra_comp[@]}"
> +)
> +cat "${dom0_rootfs_parts[@]}" > binaries/dom0-rootfs.cpio.gz
> =20
>  # test-local configuration
>  mkdir -p rootfs
> --=20
> 2.39.5
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--GPtApHH0LFsiAuht
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmg+05IACgkQ24/THMrX
1ywlhAgAgh84yOeeFL195HFesOGNvc44j44m46bUUh8Q/cclE6dBvMTJTQFTgxMk
Yd9nVfsRwaA7IlZkFkA9b1pAAf0eNE4U6AtQ5Tt8MaLtGkiGe0Bre7JsYt+x4JXM
9AegYM8FMYcVWdvc5udkEfccxA0mz8fVYxE7YbVcRX86uyiHnh0l+wcx1MvIARef
sNuEcwc8BrkmBrriAqouxTjoqyLDUHnlC9bVJ/1nw0ihpuIHAtbuXgaJKxSB3sBP
yWD5oiqH/b3Auk1RHcqdihp6flZPSaaoc0Ns7BVwFjWbQGusUAkhmsR/lLx+C3AT
7LwArpck4pFYrulFPattIB7IkYZSGA==
=R0vr
-----END PGP SIGNATURE-----

--GPtApHH0LFsiAuht--

