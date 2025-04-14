Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C3FA889E4
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 19:34:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.951036.1347180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4NhS-0004iF-Od; Mon, 14 Apr 2025 17:34:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 951036.1347180; Mon, 14 Apr 2025 17:34:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4NhS-0004g1-Kc; Mon, 14 Apr 2025 17:34:26 +0000
Received: by outflank-mailman (input) for mailman id 951036;
 Mon, 14 Apr 2025 17:34:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JTEa=XA=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u4NhQ-0004fv-Nf
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 17:34:24 +0000
Received: from fhigh-b8-smtp.messagingengine.com
 (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3d799ba-1956-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 19:34:23 +0200 (CEST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfhigh.stl.internal (Postfix) with ESMTP id C1AFC2540303;
 Mon, 14 Apr 2025 13:34:21 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Mon, 14 Apr 2025 13:34:21 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Apr 2025 13:34:20 -0400 (EDT)
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
X-Inumbo-ID: b3d799ba-1956-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1744652061;
	 x=1744738461; bh=1RAz5KmrtapVqSH1EEqiyRb+ejXjn7NcblKFbTaTJLs=; b=
	fOIlJoR06I33ZlPrVjhdM+F0y1k9MYfXtrYPCnhZJJqDXNOG4r+wEqLbJPDivvIm
	2ANt2qvbkRBDv2gwsPzXuadbIzHWG0hlJyfuwMDYPGFL78nAq6PP1x32Lm7VBSI9
	cPpxGW2PXgQXsYvv5tkvOMD1AG/8gRvEjw/+pMd2P+q5QudWDnQev6ZPdgbNsZ6D
	qtAr9nzaDSyaeOK6CpGNfz6D9GTDW9b3el7JUjhx02lfrGepFoQJFIi4dSUzEV5+
	nXfL07ULajd9LcHHrA235SACvenQ6rQ1+Zrk9uX+COoRxUQewIbHr9BfI2Q+cuwl
	yXMI4euSXfsB4V2H3hzreg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744652061; x=1744738461; bh=1RAz5KmrtapVqSH1EEqiyRb+ejXjn7NcblK
	FbTaTJLs=; b=hAx4p3EH/AkhSd8tLR6ljk1WXka/RUCcanPBuTReOAIk541U1fz
	7lA7OnEBwmhdy5HiXlFoRmNyWjMsoDpU9PlvzCe/dRO/Zh5i1YsCC4PyqSW3Pjyl
	DLtTpLZ0W0RNvnMoI+v/UnWpeOjlvxGE3NSZPCHm4G8ZQVMH2GNbeneQH8DUp/Pw
	iHUHceY9vcNHHgHmRBi5OyQBMUNZ4PVoeSVQEBmMaPXNNzptw5y6OFop0uyJS8XI
	ssmTAQ3evVaUXOivXlWdIFIgbmu8ktBz2/HA/xHJnTA0BrmkTvdW1qhq6hy2yLGZ
	YO3SAUumSotMxw8FXqboCWxfgyZWmsaJhTg==
X-ME-Sender: <xms:HUf9ZyU6KY6yxE0eRa8GRxJaXOs_qUqSeaqzXgYDWR-Ocbvmy8F0vA>
    <xme:HUf9Z-kb3Ylzlsm6pfXtnWs9ASBPkT7IesxpkmjTRji5i1tDwUKjPdjsvSU8Pg6vr
    4_JacwCfVsQww>
X-ME-Received: <xmr:HUf9Z2aQZBpq92qv5CJOlDPMm7d6-yCbJ1l3ZmPMdzuZpgmhBIDCeBD7GT3jej2pc0-AoR4QCZGsRWo8N7VAlgT2acGi54QsxQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdduudejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettd
    dvgeeuteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    dpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghn
    ughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopeigvghnqd
    guvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopegr
    nhhthhhonhihrdhpvghrrghrugesvhgrthgvshdrthgvtghhpdhrtghpthhtohepshhsth
    grsggvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhhitghhrghlrdho
    rhiivghlsegrmhgurdgtohhmpdhrtghpthhtoheptggrrhguohgvsegtrghrughovgdrtg
    homh
X-ME-Proxy: <xmx:HUf9Z5WLeG256QXl3kp3cg9bZY8XwCz6c2MmXfLt12s_UfpVSTwQDg>
    <xmx:HUf9Z8kQWwknwxYGlyqd6pK3p58F3BBUCU-as4GxMq1nlkDDqSL4cQ>
    <xmx:HUf9Z-dXDRWogmD-ptTiILWhD-tME71-FLI94ph6zivF4MA8s-tspw>
    <xmx:HUf9Z-GIOcFNA6tuSAgQu1egZ-sMRgUWa8gBJKUtkkAi_ZiR8JI9Bg>
    <xmx:HUf9Z27GLaXBp1eZ81tQSAfjpK0tz_DgORbZuzCuFEslLbALsnO5utR4>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 14 Apr 2025 19:34:17 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH RFC 7/6] CI: Adjust how domU is packaged in dom0
Message-ID: <Z_1HGkdHM549yqu8@mail-itl>
References: <20250414110903.2355303-1-andrew.cooper3@citrix.com>
 <20250414124715.2358883-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="I9ctgYq1LSuAgd4g"
Content-Disposition: inline
In-Reply-To: <20250414124715.2358883-1-andrew.cooper3@citrix.com>


--I9ctgYq1LSuAgd4g
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Apr 2025 19:34:17 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH RFC 7/6] CI: Adjust how domU is packaged in dom0

On Mon, Apr 14, 2025 at 01:47:15PM +0100, Andrew Cooper wrote:
> Package domU in /boot for dom0 and insert into the uncompressed part of d=
om0's
> rootfs, rather than recompressing it as part of the overlay.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Doug Goldstein <cardoe@cardoe.com>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
>=20
> A little RFC.  It wants extending to the other tests too.
> ---
>  automation/scripts/qubes-x86-64.sh | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>=20
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qube=
s-x86-64.sh
> index 1f90e7002c73..7ce077dfeaee 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -185,10 +185,22 @@ Kernel \r on an \m (\l)
>      find . | cpio -H newc -o | gzip >> ../binaries/domU-rootfs.cpio.gz
>      cd ..
>      rm -rf rootfs
> +
> +    # Package domU kernel+rootfs in /boot for dom0 (uncompressed)
> +    mkdir -p rootfs/boot
> +    cd rootfs
> +    cp ../binaries/bzImage boot/vmlinuz
> +    cp ../binaries/domU-rootfs.cpio.gz boot/

This changes the name of domU rootfs - was initrd-domU, yet the domU.cfg
is not updated.

> +    find . | cpio -H newc -o > ../binaries/domU-in-dom0.cpio
> +    cd ..
> +    rm -rf rootfs
>  fi
> =20
>  # Dom0 rootfs
>  cp binaries/ucode.cpio binaries/dom0-rootfs.cpio.gz
> +if [ -e binaries/domU-in-dom0.cpio ]; then
> +    cat binaries/domU-in-dom0.cpio >> binaries/dom0-rootfs.cpio.gz
> +fi
>  cat binaries/rootfs.cpio.gz >> binaries/dom0-rootfs.cpio.gz
>  cat binaries/xen-tools.cpio.gz >> binaries/dom0-rootfs.cpio.gz
> =20
> @@ -236,10 +248,6 @@ mkdir -p etc/default
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
> --=20
> 2.39.5
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--I9ctgYq1LSuAgd4g
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmf9RxoACgkQ24/THMrX
1yxCGAgAgoUUHDraxKm6p9sosgnRpoSot+KJQXyyCNFNUuXs/A+gH4pr3RYVjuah
6VyEdymRNCH35cC7StYhY/sep1qMqiPrFBLtHPFQo3QgmwMY8lgDWv/PNo65vQeF
+l3915nf+scHxek+4hbTH1UjSjxs65CiI5HrTr7Fsz1B5HKqLNA5ybAxpRB57UX/
0gW0rSWK90+9xDk2Yvp65e8j/CWi6e97hFd4OJAXcXSBCeq4iCI9BzBUFuZdrjZ9
93eENl48TBKSbdeTnpXjWWwVxrQNTYWUnrNUVYZ0CRQAHxTC/6UW2Ppl7fS7j1d+
3llPtaNBORTdW3ByKQEdc+Yj86lNOA==
=2Yad
-----END PGP SIGNATURE-----

--I9ctgYq1LSuAgd4g--

