Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D77C5A8518A
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 04:23:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946545.1344402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u342N-0006z4-RU; Fri, 11 Apr 2025 02:22:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946545.1344402; Fri, 11 Apr 2025 02:22:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u342N-0006wf-OW; Fri, 11 Apr 2025 02:22:35 +0000
Received: by outflank-mailman (input) for mailman id 946545;
 Fri, 11 Apr 2025 02:22:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vbRy=W5=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u342L-0006wZ-7Q
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 02:22:34 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d223a6fa-167b-11f0-9ead-5ba50f476ded;
 Fri, 11 Apr 2025 04:22:31 +0200 (CEST)
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
X-Inumbo-ID: d223a6fa-167b-11f0-9ead-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744338148; x=1744597348;
	bh=D5QPqp3tVroZiLmq2yLVV5UP1gY3K0swbHcuTIFG+cw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=M8o6MqS1dww3bXUuXx72yMuVwiI+PK/qDWpiePpNXc63xXGdVSUTpQ89DU8H+KBwZ
	 uV2ftXmc9GB+Ol73F3jfbVAUo38Hjjiw8fu+oN5FUmhfNbQDhNFytb3/Ac0yc15nUk
	 Tf+JIXtf0Iac138p2fqvsti60THRVKq+0BG2An9IoRtRqDs0zcxqRRIUsRSwXPuKr/
	 mirzQvyypyWitP4WVaRuryjzHxRgaMAjzQH/Pg2wclSK4fp+hd4I6Mop5xiio+1s3P
	 ih0vysijHEqr5bFhp0Ibab8JsY9fJnIvZjAuCA7ZBmU2IqqcQKR20ybQ22TgScjxpF
	 RrrechEsf+MWQ==
Date: Fri, 11 Apr 2025 02:22:23 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Anthony PERARD <anthony.perard@vates.tech>, Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>, =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, Jason Andryuk <jason.andryuk@amd.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 2/4] Overhaul how Argo is built and packged
Message-ID: <YPFuP6hQq0myBCOddL4tzFCBWAxGuKFkxdWlMOo5EkBkQVOjBoimEYoBywJD4vXGRatlf81hAvyLekktbrbH1zvWyEH_OUY97aF0YZtEfnA=@proton.me>
In-Reply-To: <20250410213724.2098383-3-andrew.cooper3@citrix.com>
References: <20250410213724.2098383-1-andrew.cooper3@citrix.com> <20250410213724.2098383-3-andrew.cooper3@citrix.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 9795aab1b2c9d217c95823a8944a1f72206f4407
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thursday, April 10th, 2025 at 2:37 PM, Andrew Cooper <andrew.cooper3@cit=
rix.com> wrote:

>=20
>=20
> Right now, the argo artefacts are a pile of files which the test has to t=
urn
> back into something which resembles a filesystem. Furthermore, because we=
 do
> not build modules for the main kernel, it is extra important to make sure=
 that
> xen-argo.ko doesn't get out of sync.
>=20
> Build argo unconditionally as part of the linux artefact. It's ~100kb all
> together, compared to ~14M for the kernel.
>=20
> Produce a single argo.cpio.gz with xen-argo.ko in the standard location.
> Prune userspace down to just the executables and libraries.
>=20
> This is cribbed from the existing scripts/x86_64-linux-argo.sh, which sta=
ys in
> place in the short term until Xen can be updated to use the new scheme.
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
> CC: Jason Andryuk jason.andryuk@amd.com
>=20
> CC: Daniel P. Smith dpsmith@apertussolutions.com
>=20
>=20
> I tried to make MODPOST work properly, but we don't build enough of it fo=
r the
> kernel, and I didn't feel like adding an extra 10 mins to the build (all
> modules) just to get the metadata right.
> ---
> .gitlab-ci.yml | 2 ++
> scripts/build-argo.sh | 67 ++++++++++++++++++++++++++++++++++++++++++
> scripts/build-linux.sh | 6 +++-
> 3 files changed, 74 insertions(+), 1 deletion(-)
> create mode 100644 scripts/build-argo.sh
>=20
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index fb997cc62162..790a6d9f9896 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -47,6 +47,8 @@ linux-6.6.56-x86_64:
> script: ./scripts/build-linux.sh
> variables:
> LINUX_VERSION: 6.6.56
> + ARGO_SHA: "705a7a8a624b42e13e655d3042059b8a85cdf6a3"
> + ARGOEXEC_SHA: "d900429f6640acc6f68a3d3a4c945d7da60625d8"
>=20
> #
> # The jobs below here are legacy and being phased out.
> diff --git a/scripts/build-argo.sh b/scripts/build-argo.sh
> new file mode 100644
> index 000000000000..0b4005f3b9a0
> --- /dev/null
> +++ b/scripts/build-argo.sh
> @@ -0,0 +1,67 @@
> +#
> +# This is a partial script, sourced by build-linux.sh
> +# It has expectations about the environment
> +#
> +
> +cd "${WORKDIR}"
> +
> +#
> +# We're going to collect everything in argo.cpio.gz. Construct it under
> +# $ARGODIR as we go.
> +#
> +ARGODIR=3D"${WORKDIR}/argo-root"
> +
> +git clone https://github.com/OpenXT/linux-xen-argo.git --depth=3D1
> +git -C "${WORKDIR}/linux-xen-argo" fetch origin "${ARGO_SHA}"
> +git -C "${WORKDIR}/linux-xen-argo" switch --detach FETCH_HEAD
> +
> +# Build xen-argo.ko against the target kernel, and install it. Install
> +# linux/argo.h too because userspace needs it.
> +make -C "linux-${LINUX_VERSION}" \
> + M=3D"${WORKDIR}/linux-xen-argo/argo-linux" \
> + KBUILD_MODPOST_WARN=3D1 \
> + CFLAGS_MODULE=3D"-Wno-error" \

Suggest adding `W=3De` for catching problems and `V=3D1` to help debugging =
a bit.

> + modules
> +install -D -m644 "${WORKDIR}/linux-xen-argo/argo-linux/xen-argo.ko" \
> + "${ARGODIR}/lib/modules/${LINUX_VERSION}/updates/xen-argo.ko"
> +install -D -m644 "${WORKDIR}/linux-xen-argo/argo-linux/include/linux/arg=
o.h" \
> + "${ARGODIR}/usr/include/linux/argo.h"
> +
> +# Build and install libargo, applying fixes to build in Alpine Linux
> +cd "${WORKDIR}/linux-xen-argo/libargo"
> +sed -e "s|AM_INIT_AUTOMAKE|AC_CONFIG_AUX_DIR(.)\nAM_INIT_AUTOMAKE|" \
> + -i configure.ac
> +sed -e "s/_SOCKADDR_COMMON (sxenargo)/sa_family_t sxenargo_family/" \
> + -e "s/__SOCKADDR_COMMON_SIZE/(sizeof (unsigned short int))/" \
> + -i src/libargo.h
> +
> +autoreconf --install
> +./configure --prefix=3D/usr CPPFLAGS=3D"-I${PWD}/../argo-linux/include"
> +make

Perhaps add something like `make -j$(nproc)`?

> +make install DESTDIR=3D"${ARGODIR}"
> +
> +# Build and install argo-exec, modifying for xilinx argo test
> +cd "${WORKDIR}"
> +curl -fsSLO \
> + https://raw.githubusercontent.com/OpenXT/xenclient-oe/${ARGOEXEC_SHA}/r=
ecipes-openxt/argo-exec/argo-exec/argo-exec.c
> +sed -e "/#include <xen\/xen.h>/d" \
>=20
> + -e "s|ret =3D shuffle(s, fds\[0\], fds\[1\]);|ret =3D shuffle(s, 0, 1);=
|" \
> + -i argo-exec.c
> +
> +gcc -I"${ARGODIR}/usr/include" -L"${ARGODIR}/usr/lib/" \
> + argo-exec.c -o "${ARGODIR}/usr/bin/argo-exec" -largo
> +
> +#
> +# Building is now complete. Strip the devel components and the nointerpo=
ser
> +# lib, which we don't care to deploy to the test system.
> +#
> +cd $ARGODIR
> +rm -r usr/include usr/lib/pkgconfig
> +find usr/lib -name \nointerposer\ -delete
> +find usr/lib \( -name \.a -o -name \.so -o -name \*.la \) -delete
> +
> +# Package everything up
> +find . | cpio -R 0:0 -H newc -o | gzip > "$COPYDIR/argo.cpio.gz"
>=20
> +
> +# Print the contents for the build log
> +zcat "$COPYDIR/argo.cpio.gz" | cpio -tv
> diff --git a/scripts/build-linux.sh b/scripts/build-linux.sh
> index 652fdba7b9d1..49b5ebed6424 100755
> --- a/scripts/build-linux.sh
> +++ b/scripts/build-linux.sh
> @@ -8,7 +8,7 @@ fi
> set -ex -o pipefail
>=20
> WORKDIR=3D"${PWD}"
> -COPYDIR=3D"${WORKDIR}/binaries/"
> +COPYDIR=3D"${WORKDIR}/binaries"
> UNAME=3D$(uname -m)
>=20
> # Build Linux
> @@ -45,6 +45,10 @@ case $UNAME in
> x86_64)
> make -j$(nproc) bzImage
> cp arch/x86/boot/bzImage "${COPYDIR}"
> +
> + # Build argo
> + make modules_prepare
> + . "${WORKDIR}/scripts/build-argo.sh"

Nit: I would use `source` instead of `.` which is simple to overlook.

> ;;
>=20
> aarch64)
> --
> 2.39.5

