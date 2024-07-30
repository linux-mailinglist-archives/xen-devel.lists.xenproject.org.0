Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01156941380
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 15:48:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767820.1178531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYnBk-0004ZF-Gd; Tue, 30 Jul 2024 13:46:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767820.1178531; Tue, 30 Jul 2024 13:46:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYnBk-0004W7-Du; Tue, 30 Jul 2024 13:46:52 +0000
Received: by outflank-mailman (input) for mailman id 767820;
 Tue, 30 Jul 2024 13:46:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VcTV=O6=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sYnBj-0004Vl-Dw
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 13:46:51 +0000
Received: from fhigh6-smtp.messagingengine.com
 (fhigh6-smtp.messagingengine.com [103.168.172.157])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29e9afec-4e7a-11ef-bc01-fd08da9f4363;
 Tue, 30 Jul 2024 15:46:48 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 2187311400FB;
 Tue, 30 Jul 2024 09:46:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 30 Jul 2024 09:46:44 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 Jul 2024 09:46:42 -0400 (EDT)
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
X-Inumbo-ID: 29e9afec-4e7a-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1722347204;
	 x=1722433604; bh=q9ARzUbkCi3KwhQgJhpiDDsPjoLnU55CcaOs5n2E7fA=; b=
	trjFRrLHYplRSCKuxPLBZMLZTodWf45H1tNH//P8briGlt4NByxZa/A29j8TplL3
	9O9pa40ghUr3dFNx7RNvuOKRowKe4Q9tBdkiosX4bNDdPJdtOBGJDS6PF48lgMPV
	wjHdfYZdZ1BMc44qQBT8VkSag3YdYgbjScJyzRISEQlzIR5gR/CdupFlAzOmpoGc
	QTkIulk3NJfZxoEZOrS10aHc0zajJCxapxjd1kkDS0mw8jTTWufWImv6XniqQ7td
	Pz9DeodBjGwt1yEpQ0j0y4b8Ofe1pM21w8gyyR/FFOD5CQR1IbRTTZgqWsowYB5k
	R/7OxWb2ewDFfaSS10Rq9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1722347204; x=1722433604; bh=q9ARzUbkCi3KwhQgJhpiDDsPjoLn
	U55CcaOs5n2E7fA=; b=fk8Kk8PEZmtyK/CEHl/pvCmhydndBitB9Ask3hlFlGf+
	qs5uh2tsk2nfWDEJrHkFSjnt3S1UShd0mpmfLin3u2AxbDrLcD5gvw4YcOHnQWUH
	ph7zlpESwMsWi6OpoW5JbP3sNXjwXPx9ddITAeQzErQESVhG9C+Zx89wwVbFXkjf
	cEFT5E6STfd2aADoa+f8WECtpQlU1mNufT6c631Fg/bjjfLIXLfDUNaQdWYBKw2f
	yILYgYmC2WU8jF0D01vOys6SUzls5uyElDEwdRLV4TKB0aKFgewYvWPkitDCxKJT
	54BCI2znImNeKEsT5F0Zg/qIHHxxcvuEiSGcHlLoeA==
X-ME-Sender: <xms:w-6oZnvIcA9gBBjzOmLIuRHupnD48r_58cWmKrYGccqaCC8NvPDBXw>
    <xme:w-6oZof6faqyjXNikeTFU3gHR73RTFPvAuuoViFV-wapRMUC8vdtURF4yx5XJgFO-
    I0mc9DjGxyHhw>
X-ME-Received: <xmr:w-6oZqxNjcQ54e1TEwCmCqdcvJTD4IAFYimmjEb7wClyHNqaQJ7zYo4nZjoELFrEDq3YGwXUsGc-6cQcx60jsIZkZCxYycSlXg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrjeeggdeilecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeevueej
    teegleelteduueevhfetgfffjeevtddvgfeiveehteehleegueelvdejveenucffohhmrg
    hinhepghhithhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomhdpnhgspghrtghpthhtoheptd
X-ME-Proxy: <xmx:w-6oZmMGZquZ-oFTRYCSBq80ZVi7SySEsL3JYEAETCTkRIIAcIU-cA>
    <xmx:w-6oZn9utZ01mJ6bwY-QA9Q0TshvNnSfAkLXyw6NOPQ2Yj9oZEb5aA>
    <xmx:w-6oZmXCgKcJ9jTk3MDj4sYFEcE4WpC6eQuP6UBNpk-fRgZtZvhnKg>
    <xmx:w-6oZocUMz5cu9_OqLcaFvTgB5dsJNCbu5Mswb3AKwzSMT3ZWeZJ5A>
    <xmx:xO6oZqYvl0kFW4ZdWLEMu6FMZqq-q__SSwEOuxyKO3tVVYQVibepVlCW>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 30 Jul 2024 15:46:38 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	cardoe@cardoe.com
Subject: Re: [PATCH v2] automation: upgrade Yocto to scarthgap
Message-ID: <ZqjuvjUtmNU7Ud8g@mail-itl>
References: <alpine.DEB.2.22.394.2407261639190.4857@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/kuNONbh+hsUL5z8"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2407261639190.4857@ubuntu-linux-20-04-desktop>


--/kuNONbh+hsUL5z8
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jul 2024 15:46:38 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	cardoe@cardoe.com
Subject: Re: [PATCH v2] automation: upgrade Yocto to scarthgap

On Fri, Jul 26, 2024 at 05:19:42PM -0700, Stefano Stabellini wrote:
> Upgrade Yocto to a newer version. Use ext4 as image format for testing
> with QEMU on ARM and ARM64 as the default is WIC and it is not available
> for our xen-image-minimal target.
>=20
> Also update the tar.bz2 filename for the rootfs.
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>

> ---
>=20
> all yocto tests pass:
> https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/1390081=
173
>=20
> Changes in v2:
> - s/EXT4/IMAGE_FMT/
> - set IMAGE_FMT before the call to project_build
> - also update the filename xen-image-minimal-qemuarm.rootfs.tar.bz2
> ---
>  automation/build/yocto/build-yocto.sh       | 15 ++++++++++++---
>  automation/build/yocto/yocto.inc            |  4 ++--
>  automation/gitlab-ci/build.yaml             |  2 +-
>  automation/scripts/qemu-smoke-dom0-arm32.sh |  2 +-
>  4 files changed, 16 insertions(+), 7 deletions(-)
>=20
> diff --git a/automation/build/yocto/build-yocto.sh b/automation/build/yoc=
to/build-yocto.sh
> index 93ce81ce82..e1e69f2bb5 100755
> --- a/automation/build/yocto/build-yocto.sh
> +++ b/automation/build/yocto/build-yocto.sh
> @@ -25,6 +25,7 @@ TARGET_SUPPORTED=3D"qemuarm qemuarm64 qemux86-64"
>  VERBOSE=3D"n"
>  TARGETLIST=3D""
>  BUILDJOBS=3D"8"
> +IMAGE_FMT=3D""
> =20
>  # actions to do
>  do_clean=3D"n"
> @@ -38,8 +39,9 @@ build_result=3D0
>  # layers to include in the project
>  build_layerlist=3D"poky/meta poky/meta-poky poky/meta-yocto-bsp \
>                   meta-openembedded/meta-oe meta-openembedded/meta-python=
 \
> +                 meta-openembedded/meta-networking \
>                   meta-openembedded/meta-filesystems \
> -                 meta-openembedded/meta-networking meta-virtualization"
> +                 meta-virtualization"
> =20
>  # yocto image to build
>  build_image=3D"xen-image-minimal"
> @@ -175,7 +177,7 @@ function project_build() {
>                  mkdir -p $OUTPUTDIR
>                  cp $BUILDDIR/tmp/deploy/images/qemuarm/zImage $OUTPUTDIR
>                  cp $BUILDDIR/tmp/deploy/images/qemuarm/xen-qemuarm $OUTP=
UTDIR
> -                cp $BUILDDIR/tmp/deploy/images/qemuarm/xen-image-minimal=
-qemuarm.tar.bz2 $OUTPUTDIR
> +                cp $BUILDDIR/tmp/deploy/images/qemuarm/xen-image-minimal=
-qemuarm.rootfs.tar.bz2 $OUTPUTDIR
>              fi
>          fi
>      ) || return 1
> @@ -196,7 +198,7 @@ function project_run() {
> =20
>          /usr/bin/expect <<EOF
>  set timeout 1000
> -spawn bash -c "runqemu serialstdio nographic slirp"
> +spawn bash -c "runqemu serialstdio nographic slirp ${IMAGE_FMT}"
> =20
>  expect_after {
>      -re "(.*)\r" {
> @@ -356,6 +358,13 @@ for f in ${TARGETLIST}; do
>          run_task project_create "${f}"
>      fi
>      if [ -f "${BUILDDIR}/${f}/conf/local.conf" ]; then
> +        # Set the right image target
> +        if [ "$f" =3D "qemux86-64" ]; then
> +            IMAGE_FMT=3D""
> +        else
> +            IMAGE_FMT=3D"ext4"
> +        fi
> +
>          if [ "${do_build}" =3D "y" ]; then
>              run_task project_build "${f}"
>          fi
> diff --git a/automation/build/yocto/yocto.inc b/automation/build/yocto/yo=
cto.inc
> index 2f3b1a5b2a..209df7dde9 100644
> --- a/automation/build/yocto/yocto.inc
> +++ b/automation/build/yocto/yocto.inc
> @@ -6,10 +6,10 @@
>  # YOCTOVERSION-TARGET for x86_64 hosts
>  # YOCTOVERSION-TARGET-arm64v8 for arm64 hosts
>  # For example you can build an arm64 container with the following comman=
d:
> -# make yocto/kirkstone-qemuarm64-arm64v8
> +# make yocto/scarthgap-qemuarm64-arm64v8
> =20
>  # Yocto versions we are currently using.
> -YOCTO_VERSION =3D kirkstone
> +YOCTO_VERSION =3D scarthgap
> =20
>  # Yocto BSPs we want to build for.
>  YOCTO_TARGETS =3D qemuarm64 qemuarm qemux86-64
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build=
=2Eyaml
> index 7ce88d38e7..32045cef0c 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -212,7 +212,7 @@
>    script:
>      - ./automation/build/yocto/build-yocto.sh -v --log-dir=3D./logs --xe=
n-dir=3D`pwd` ${YOCTO_BOARD} ${YOCTO_OUTPUT}
>    variables:
> -    YOCTO_VERSION: kirkstone
> +    YOCTO_VERSION: scarthgap
>      CONTAINER: yocto:${YOCTO_VERSION}-${YOCTO_BOARD}${YOCTO_HOST}
>    artifacts:
>      paths:
> diff --git a/automation/scripts/qemu-smoke-dom0-arm32.sh b/automation/scr=
ipts/qemu-smoke-dom0-arm32.sh
> index 31c05cc840..eaaea5a982 100755
> --- a/automation/scripts/qemu-smoke-dom0-arm32.sh
> +++ b/automation/scripts/qemu-smoke-dom0-arm32.sh
> @@ -8,7 +8,7 @@ cd binaries
> =20
>  mkdir rootfs
>  cd rootfs
> -tar xvf ../xen-image-minimal-qemuarm.tar.bz2
> +tar xvf ../xen-image-minimal-qemuarm.rootfs.tar.bz2
>  mkdir -p ./root
>  echo "name=3D\"test\"
>  memory=3D400
> --=20
> 2.25.1
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--/kuNONbh+hsUL5z8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmao7r4ACgkQ24/THMrX
1yycYAf5ATKu2X7fLU/bblQOfrX6KcSzmQkcqQ5hJAjFpXnoXcMswAO5Xossb+uq
y2GJP3+bjNOTwkBrk6plkUy7da7jXhO4lAJ6vRfbgKmlhWO5xvD0ZIP/5TocyPzr
vh/mzY2+gFp49SgmLx93g2yWo4VU3YjR6XmQwpKi/eJ8WStOYrgk66FVvHyptKGI
eloZxm1gxUvL8lujr5EOvyMzPN28kvxRzRHftu//3+OKWOdwQ2HLjN9gvdZTOaB5
0XR07S7qGZnTzzwZM7xRj4szgnCA9N2egiz38qBLAACJWCkjPPLkJATyvVFhuUvc
S8GMW51XzjsCbF4vkjVOgQmkLmHOvw==
=q3Pf
-----END PGP SIGNATURE-----

--/kuNONbh+hsUL5z8--

