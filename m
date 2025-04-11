Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1640A86262
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 17:53:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947603.1345191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3Gh2-0002Cn-RJ; Fri, 11 Apr 2025 15:53:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947603.1345191; Fri, 11 Apr 2025 15:53:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3Gh2-0002BL-OW; Fri, 11 Apr 2025 15:53:24 +0000
Received: by outflank-mailman (input) for mailman id 947603;
 Fri, 11 Apr 2025 15:53:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vbRy=W5=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u3Gh0-0002BF-Sm
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 15:53:23 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1699f79e-16ed-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 17:53:19 +0200 (CEST)
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
X-Inumbo-ID: 1699f79e-16ed-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744386797; x=1744645997;
	bh=/lQPWvbIwhsx4tizVgVKuuHOW/ThZO4jYZyRewSO0nQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=WpPCTGd1o/CboW/AgNwVwPUPwzi46JpTCaGJxJyJVKz+hDJofp4zFxfsIvVXWAx8h
	 2r1wFeOnUd1F7fCdUsJaOMTuNhgywS1ouBcYFvrRDbcPu0G9iPg1KOe2zYbBBI80Uy
	 1Bwye1v9IPCg/ST9z36leEA2acsYn1zre6HAWKIZ24QP3DCZ1XwufjiZvy7vYbn7EG
	 f2yDuE1Tmfh/kVra01Q+la2241nDV0T9LMa0Z9yRY3mdkCI9uogbMTK9yOLdPvk8QX
	 Mi3e+/A5cL2B4j7EMDP6w4GN1uaZriwoWCLhXkGNpDFThg3Xy+OVH+eCd2gqTT1qTs
	 0OKNoDOsIu6DQ==
Date: Fri, 11 Apr 2025 15:53:12 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Anthony PERARD <anthony.perard@vates.tech>, Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>, =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH 1/3] Rework rootfs generation to make a cpio archive
Message-ID: <Z0-Vwr2two0iaVg5FoxYWjiImFDeS3tDPssc0X1D0iAcnbK2X4TpJlSRbwugx0mW2_nWjgKQ5nSioBtuRNkjLG3mhDzhuDmZCa3Mz2e5R-E=@proton.me>
In-Reply-To: <20250411105217.2141356-2-andrew.cooper3@citrix.com>
References: <20250411105217.2141356-1-andrew.cooper3@citrix.com> <20250411105217.2141356-2-andrew.cooper3@citrix.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 163903897d9af93aa4020ae0ff58fc76327dbb76
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Friday, April 11th, 2025 at 3:52 AM, Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:

>=20
>=20
> Rename the script as we're going to use it for ARM64 shortly, and have it=
 take
> a tar or cpio parameter to determine the output format.
>=20
> Turn it into a proper bash script, and provide the cpio form under the ne=
w
> artefact naming scheme.
>=20
> No functional change.
>=20
> Signed-off-by: Andrew Cooper andrew.cooper3@citrix.com
>=20
> ---
> CC: Anthony PERARD anthony.perard@vates.tech
>=20
> CC: Stefano Stabellini sstabellini@kernel.org
>=20
> CC: Michal Orzel michal.orzel@amd.com
>=20
> CC: Doug Goldstein cardoe@cardoe.com
>=20
> CC: Marek Marczykowski-G=C3=B3recki marmarek@invisiblethingslab.com
>=20
> ---
> .gitlab-ci.yml | 9 +++++++-
> ...6_64-rootfs-alpine.sh =3D> alpine-rootfs.sh} | 21 +++++++++++++++++--
>=20
> 2 files changed, 27 insertions(+), 3 deletions(-)
> rename scripts/{x86_64-rootfs-alpine.sh =3D> alpine-rootfs.sh} (75%)
>=20
>=20
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 1d2c72b268a3..916c5ae9d508 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -42,6 +42,13 @@ linux-6.6.86-arm64:
> #
> # x86_64 artifacts
> #
> +alpine-3.18-x86_64-rootfs:
> + extends: .x86_64-artifacts
> + script:
> + - ./scripts/alpine-rootfs.sh cpio
> + variables:
> + CONTAINER: alpine:3.18-x86_64-base
> +
> linux-6.6.56-x86_64:
> extends: .x86_64-artifacts
> script: ./scripts/build-linux.sh
> @@ -62,7 +69,7 @@ x86_64-kernel-linux-6.6.56:
> x86_64-rootfs-alpine-3.18:
> extends: .x86_64-artifacts
> script:
> - - . scripts/x86_64-rootfs-alpine.sh
> + - ./scripts/alpine-rootfs.sh tar
> variables:
> CONTAINER: alpine:3.18-x86_64-base
>=20
> diff --git a/scripts/x86_64-rootfs-alpine.sh b/scripts/alpine-rootfs.sh
> similarity index 75%
> rename from scripts/x86_64-rootfs-alpine.sh
> rename to scripts/alpine-rootfs.sh
> index b70b3a54ede5..c29c92d1c682 100755
> --- a/scripts/x86_64-rootfs-alpine.sh
> +++ b/scripts/alpine-rootfs.sh
> @@ -1,4 +1,9 @@
> +#!/bin/bash
> +
> +set -eu
> +
> WORKDIR=3D"${PWD}"
> +COPYDIR=3D"${WORKDIR}/binaries"
>=20
> apk update
>=20
> @@ -56,5 +61,17 @@ passwd -d "root" root
>=20
> # Create rootfs
> cd /
> -tar cvzf "${WORKDIR}/binaries/initrd.tar.gz" \
> - bin dev etc home init lib mnt opt root sbin usr var
> +PATHS=3D"bin dev etc home init lib mnt opt root sbin usr var"
> +
> +case $1 in
> + cpio)
> + find $PATHS | cpio -o -H newc | gzip > "${COPYDIR}/rootfs.cpio.gz"
>=20
> +
> + # Print the contents for the build log
> + zcat "${COPYDIR}/rootfs.cpio.gz" | cpio -tv

Maybe allow $1 to be a filename? E. g. rootfs.cpio.gz or initrd.tar.gz.
This way $1 will contain an explicit output artifact format along with
the output filename.

What do you think?

> + ;;
> +
> + tar)
> + tar cvzf "${COPYDIR}/initrd.tar.gz" $PATHS
> + ;;

I would add the default case and error out in case of possible mis-use.

> +esac
> --
> 2.39.5

