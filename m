Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9327013C8
	for <lists+xen-devel@lfdr.de>; Sat, 13 May 2023 03:43:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534113.831362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxeHx-0006dL-4f; Sat, 13 May 2023 01:43:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534113.831362; Sat, 13 May 2023 01:43:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxeHx-0006ap-1R; Sat, 13 May 2023 01:43:13 +0000
Received: by outflank-mailman (input) for mailman id 534113;
 Sat, 13 May 2023 01:43:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cp9A=BC=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pxeHv-0006aj-V2
 for xen-devel@lists.xenproject.org; Sat, 13 May 2023 01:43:12 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8257891c-f12f-11ed-8611-37d641c3527e;
 Sat, 13 May 2023 03:43:08 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id BCB475C025F;
 Fri, 12 May 2023 21:43:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 12 May 2023 21:43:06 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 May 2023 21:43:05 -0400 (EDT)
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
X-Inumbo-ID: 8257891c-f12f-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1683942186; x=1684028586; bh=SeVijPJA3lT5I/vF0gZ0HZNMDzmtJKZk7U6
	iPzdbV0Y=; b=k1E40neXOXAuUps7OL9tFHwiMVQveii+c5eE3GitDARpVa3PW8C
	4iqiYqniv796yzbYfUDr8WWYne19pOcVa6/bO1jMQ94D2/Cc/p+9KiV2n6pmW+XN
	hAuPSieR6mOyWKoc7QdRIOmRvN6ohR0vWOvSTfRw035kccfIfroTDNrxTIlJbYHP
	WjJxC3RiS/B1bLiQ8fV1S4AXo3Owxq1k+UV58CULJTT8Q1jvvehnvedrteEzpq0r
	NNd5pRrjv3TAtrBewmhA2GlCJs5+A8Md722dMFAYD9+sSqgf+2mJRKibuUQlt+YT
	NSAqIUg5VhbZE6mJKuEUkyLArR54zBhoZNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1683942186; x=1684028586; bh=SeVijPJA3lT5I
	/vF0gZ0HZNMDzmtJKZk7U6iPzdbV0Y=; b=ULPsbxsv0YE3wYa+TyUN2hcwj/QtU
	2OKyGSjxMWa2q4djc+erVL3O6fJAfCC+ib6jS3c/YICktrdyDlur4oVbGyheTbTp
	RoFXYf48lpJ5BsDiWntw2kajts1OZ16wuF/rXThotEyYq2p5cm0iJBI9zIq3eJAE
	uk3cfqh/xFMmy87kj0CVznYFta5UglGonOEHHtfjEGWpXkmShdqDI58Qh7efQqNU
	HAsjD71PSeM2P653znWYjY6j5hTKOg6CWlwIgX1FLGKTBKePuPJVfN8ht+CDupuH
	MlWiBuYX1jqfClWPIl8n11tFeEbQtr+CwSjI8+33VzrMLIUKBWBmakjvw==
X-ME-Sender: <xms:KuteZBEI9B8PllmZeZKJ7Cv6N9w0QoAxrx2nxtJMrWY6P7UgUvz_8w>
    <xme:KuteZGXRyE9knWiC-QoHkY03ozoNo6dkxauuIIltsD1BnTeikaR25lpsIZg0o9Vmq
    DeJAB-Rh49_Qw>
X-ME-Received: <xmr:KuteZDI-HvsF3ClRe3uJ7TdnbaD0ufTf8wGPJ_O6EQkVUCx76SkOMwWGV_Yc4gzp_3RwtYu51cMaBwShp0mR4904ayxXhdD3Soc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeehuddgheduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:KuteZHHTvA49vT5tqT4MVzVrhgRTlsaeEKyJSz4qIgE469RV1gXOgQ>
    <xmx:KuteZHVRzRKWbHFwFqrmEptR7lUmXLvvRELTNUY9B69RU_2ZOECzqg>
    <xmx:KuteZCNpXYeXtUAye1vXWxBKH_ntHScK87hx6A_x2JjJ2FL3T8BjSw>
    <xmx:KuteZOd7VgebqLhlwidQSkghYOuZR4iJlAkyu4ZKS08uCWmK_pr25Q>
Feedback-ID: i1568416f:Fastmail
Date: Sat, 13 May 2023 03:43:02 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, cardoe@cardoe.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH] automation: add a Dom0 PVH test based on Qubes' runner
Message-ID: <ZF7rJggPX6rOfeiS@mail-itl>
References: <20230513012833.3980872-1-sstabellini@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="f2H6d/DJQANNBQfA"
Content-Disposition: inline
In-Reply-To: <20230513012833.3980872-1-sstabellini@kernel.org>


--f2H6d/DJQANNBQfA
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 13 May 2023 03:43:02 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, cardoe@cardoe.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH] automation: add a Dom0 PVH test based on Qubes' runner

On Fri, May 12, 2023 at 06:28:33PM -0700, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
>=20
> Straightforward Dom0 PVH test based on the existing basic Smoke test for
> the Qubes runner.
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>  automation/gitlab-ci/test.yaml     |  8 ++++++++
>  automation/scripts/qubes-x86-64.sh | 14 +++++++++-----
>  2 files changed, 17 insertions(+), 5 deletions(-)
>=20
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.y=
aml
> index 55ca0c27dc..9c0e08d456 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -149,6 +149,14 @@ adl-smoke-x86-64-gcc-debug:
>      - *x86-64-test-needs
>      - alpine-3.12-gcc-debug
> =20
> +adl-smoke-x86-64-dom0pvh-gcc-debug:
> +  extends: .adl-x86-64
> +  script:
> +    - ./automation/scripts/qubes-x86-64.sh dom0pvh 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *x86-64-test-needs
> +    - alpine-3.12-gcc-debug
> +
>  adl-suspend-x86-64-gcc-debug:
>    extends: .adl-x86-64
>    script:
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qube=
s-x86-64.sh
> index 056faf9e6d..35b9386e5d 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -5,6 +5,7 @@ set -ex
>  test_variant=3D$1
> =20
>  ### defaults
> +dom0pvh=3D

Maybe better name it extra_xen_opts=3D? I can see it useful in other tests
in the future too.

>  wait_and_wakeup=3D
>  timeout=3D120
>  domU_config=3D'
> @@ -18,8 +19,8 @@ vif =3D [ "bridge=3Dxenbr0", ]
>  disk =3D [ ]
>  '
> =20
> -### test: smoke test
> -if [ -z "${test_variant}" ]; then
> +### test: smoke test & smoke test PVH
> +if [ -z "${test_variant}" ] || [ "${test_variant}" =3D "dom0pvh" ]; then
>      passed=3D"ping test passed"
>      domU_check=3D"
>  ifconfig eth0 192.168.0.2
> @@ -36,6 +37,9 @@ done
>  tail -n 100 /var/log/xen/console/guest-domU.log
>  echo \"${passed}\"
>  "
> +if [ "${test_variant}" =3D "dom0pvh" ]; then
> +    dom0pvh=3D"dom0=3Dpvh"
> +fi
> =20
>  ### test: S3
>  elif [ "${test_variant}" =3D "s3" ]; then
> @@ -184,11 +188,11 @@ cd ..
>  TFTP=3D/scratch/gitlab-runner/tftp
>  CONTROLLER=3Dcontrol@thor.testnet
> =20
> -echo '
> -multiboot2 (http)/gitlab-ci/xen console=3Dcom1 com1=3D115200,8n1 loglvl=
=3Dall guest_loglvl=3Dall dom0_mem=3D4G
> +echo "
> +multiboot2 (http)/gitlab-ci/xen console=3Dcom1 com1=3D115200,8n1 loglvl=
=3Dall guest_loglvl=3Dall dom0_mem=3D4G $dom0pvh
>  module2 (http)/gitlab-ci/vmlinuz console=3Dhvc0 root=3D/dev/ram0
>  module2 (http)/gitlab-ci/initrd-dom0
> -' > $TFTP/grub.cfg
> +" > $TFTP/grub.cfg
> =20
>  cp -f binaries/xen $TFTP/xen
>  cp -f binaries/bzImage $TFTP/vmlinuz
> --=20
> 2.25.1
>=20
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--f2H6d/DJQANNBQfA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmRe6yYACgkQ24/THMrX
1yyHBQf/ZuZuWiV5FUg2rY+g9fndhIpRAaddR1DawyWYigfS60X/WOjs+ZE+F+vE
jsF56zSn94W19TeBkVKm6O8jv6EtYrBKa5HWdmLtxhOSoi98X7mqj/CftkrywI6m
9LlcajrLPsV/L5adpuLkP6oHWpCuHfqsPNSvEUr4TiiT+C81qR4x+5rAVr/hgrxY
aPrXRhzawn/AzpCgLNVgZH20HTTvxN5jpKqdx2yAg377rm2uwmLgq6BeBhJqkE7/
cSmhJlg52BedqJD4ibtJT/+YuXW1MWzG7AWhGX33/Pm0tlagVFVTgFZMTQPpUzr5
P5hMkakWt+poJcr+6h8h5WkD5EFJ0g==
=N17w
-----END PGP SIGNATURE-----

--f2H6d/DJQANNBQfA--

