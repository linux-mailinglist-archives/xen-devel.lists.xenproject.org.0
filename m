Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5222B703F84
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 23:20:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534848.832250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyfbF-0006t6-Vz; Mon, 15 May 2023 21:19:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534848.832250; Mon, 15 May 2023 21:19:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyfbF-0006qL-T4; Mon, 15 May 2023 21:19:21 +0000
Received: by outflank-mailman (input) for mailman id 534848;
 Mon, 15 May 2023 21:19:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u/nm=BE=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pyfbD-0006qD-VY
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 21:19:20 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2582250d-f366-11ed-b229-6b7b168915f2;
 Mon, 15 May 2023 23:19:18 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 247503200A27;
 Mon, 15 May 2023 17:19:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 15 May 2023 17:19:14 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 May 2023 17:19:12 -0400 (EDT)
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
X-Inumbo-ID: 2582250d-f366-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1684185553; x=1684271953; bh=OgtNy6SeWKcYOssXQEa/LBl3yzyAva65px6
	mmQPjocE=; b=Sc/MIHBOnZk5wjA3qVp5qucV3/yh7pXMevbDZSdn2On2j1JO6oO
	+t7IDBxe/FJJzOqFN9zWsgLqWcC+cu1MLWTQp0J8XzeLQLOrU3/siqG2BFYKjf/t
	lSCL6JWhT/PhbQzngBfBT1P0VmhypH9ZeqYHYgyyuYUYst3wAQFN476ns6WFCWO4
	wQJK+pe4/svWfVJORzkrlG+Ns9LlHeibNzyjvSZsZ03A9d6CmpjjgR4dUmw38A1j
	GtROIhV5D7UcEDhWT81sHYlVjrkvXz07jFK6OYSCdxFDI840G7wQIDlwTNj/PQmB
	oIXa84YMAFUPbXUQbqNYVsitdhjh2X2i7DA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1684185553; x=1684271953; bh=OgtNy6SeWKcYO
	ssXQEa/LBl3yzyAva65px6mmQPjocE=; b=kqriT+enfIi3UVirdTqw6mUuWYqpO
	SqI5PS4Ve1v+M8G9MaSJQGyf+MABxod9wjvWh2qtvDYlhZyaXgoKThkW0eFbOSU8
	0uyb9Fm3Kadfef4fXFhdl8pjxFZYNmYAIZ6DXUcTceVfReTKfA234e8NBAYFeGCS
	rpOQybGTOG77x8d6D9m8+cO/FY5H5CNvz3tj58SvsMf/kfarEX2MvxqPgzOs490r
	1QW/vEZoSZ+4QfUo0UlkS2SLOjKgHgIcLtUJ+tHx+f7AaOXhZ5HVCbF1nd9BYR7a
	CTiJQCWZGsLdLYHmG9qLSI89BwGpbvvJEQmcvhbBmHf1spPVix6pAqvbA==
X-ME-Sender: <xms:0aFiZHgYo7ubm-52Uf27Ue1HmToS2AFAi524QkHnEP-gVHA5kyk-fA>
    <xme:0aFiZEBXA1PAKgIFi5sFAN-HJUrqONyfqnvThqc-bjZDRwl2IwIjpwNAoji53hqv0
    TnFnUnE7kBJzg>
X-ME-Received: <xmr:0aFiZHH-Lz-VQA228-IqtN6pWRPkF-6nwUwo3SEy46ScgY8w_D9bK3EFgSbDI0KoTQHvljHOGcFU3YH53dWlBI1z3ShBbaxPo1c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeehjedgudeivdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    udelteefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:0aFiZERIGNlv4pRDLEoibSNn2YmcjuS-XLs8MFvxbQ6nuaHZLEGbyw>
    <xmx:0aFiZEyhNxP5Shc3c7tRIP9-yx39tVSV1y3ZUWRCP8mlHeB6Xh37-A>
    <xmx:0aFiZK6RkEQA_syw3GD5u9MXy4xhxwlkEQlk7B_qNlOoofv7aO87Mg>
    <xmx:0aFiZBqYLtqnXOl2Ba_prG06wSurB2FyyJjOLvtaYukwMUftZzD3fw>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 15 May 2023 23:19:09 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, cardoe@cardoe.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH v2] automation: add a Dom0 PVH test based on Qubes' runner
Message-ID: <ZGKhzYPupmzjH/h+@mail-itl>
References: <20230515204919.4174845-1-sstabellini@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GK4DG6VUkYPb4lb9"
Content-Disposition: inline
In-Reply-To: <20230515204919.4174845-1-sstabellini@kernel.org>


--GK4DG6VUkYPb4lb9
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 May 2023 23:19:09 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, cardoe@cardoe.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH v2] automation: add a Dom0 PVH test based on Qubes' runner

On Mon, May 15, 2023 at 01:49:19PM -0700, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
>=20
> Straightforward Dom0 PVH test based on the existing basic Smoke test for
> the Qubes runner.
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
> Changes in v2:
> - rename dom0pvh to extra_xen_opts
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
> index 056faf9e6d..4f17f1dd0b 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -5,6 +5,7 @@ set -ex
>  test_variant=3D$1
> =20
>  ### defaults
> +extra_xen_opts=3D
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
> +    extra_xen_opts=3D"dom0=3Dpvh"
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
=3Dall guest_loglvl=3Dall dom0_mem=3D4G $extra_xen_opts
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

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--GK4DG6VUkYPb4lb9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmRioc4ACgkQ24/THMrX
1yzSagf+MiMMMa7ap6mPghOsDZHxNpyYTiSQ4rMRjBodAdWPmXt3WtvNeSWbJDQP
BDpQLD+wv5Wzzr6KRcCbm3uV9hx43tT0mGsSHXO/l/ILR3yPVPSbPEFUyBGFZjJJ
55zOIsk2O3e3BIGnyIRCn55uNZ/XWT/kz47lirE7gYboLToQ3wyNsej9GLu9RpxT
Csn0O8jPi1QfmGL7U5Bw5WlkgQftJoxGT86PTFxF4unXr+czrGYchKg9UevIzs7t
6smuoWVZDR1SJmgOhZB10KEhSWwCwQDC65OqoudouVezmptiHFCyApwB8/jfgDtT
97lQL1oBI7aGe6yUbtjN8UDfUJmkXQ==
=WG9b
-----END PGP SIGNATURE-----

--GK4DG6VUkYPb4lb9--

