Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C416A86597
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 20:37:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947726.1345333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3JFJ-0006lS-W6; Fri, 11 Apr 2025 18:36:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947726.1345333; Fri, 11 Apr 2025 18:36:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3JFJ-0006jd-TC; Fri, 11 Apr 2025 18:36:57 +0000
Received: by outflank-mailman (input) for mailman id 947726;
 Fri, 11 Apr 2025 18:36:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vbRy=W5=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u3JFJ-0006jX-4X
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 18:36:57 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1a1e023-1703-11f0-9eae-5ba50f476ded;
 Fri, 11 Apr 2025 20:36:55 +0200 (CEST)
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
X-Inumbo-ID: f1a1e023-1703-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744396613; x=1744655813;
	bh=2ENsjGaaRV8XV8RObaKXEhsj3sVXvrMmmCYo1BwUIwQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=J6zbRtHxwLq6+snH78zEWl+zNKjAOCTLYgV/utPBjJbJAgYK+VlKmmZZpngA9qvOs
	 LHaR0CIyYneexpP6EnKEoji1KJdexiSkujD9e3F2d1ww8nW9nVtM8dz2f+lyJTWsYc
	 gM7qaXmLrapIY46lxm5hD7s+r3xEJmIJYjP6067HfHMhyBGEfmM6zaokSjIn30M0ET
	 d2a9t0lGtUrh5IHhRvh411uGwX3PS5/gQFs0gVLiQ6MHeN53Zr/EXhzvKV0KL4xBWu
	 y//6I5OxjUfmw6dy+gusKKhw3nwOB3TQ2mUwyVW9r99jolS9bIkYYIQV1ExG95leX+
	 wcOy2mBwLMIGg==
Date: Fri, 11 Apr 2025 18:36:46 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Anthony PERARD <anthony.perard@vates.tech>, Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>, =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH 1/3] Rework rootfs generation to make a cpio archive
Message-ID: <okAnTwrHNhozl60kXBtwU0Fwn11f4cgeqg6lzYbb10_5P5vWvzpgHJ2lSF9wRB8LzC88znNxALzP29cwQupUVX-XkhjA2ikWpCYJIFAsu3E=@proton.me>
In-Reply-To: <20250411105217.2141356-2-andrew.cooper3@citrix.com>
References: <20250411105217.2141356-1-andrew.cooper3@citrix.com> <20250411105217.2141356-2-andrew.cooper3@citrix.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: dbb079f1312d5892b50dbbb026dc4f54f5a139d7
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

Reviewed-by: Denis Mukhin <dmukhin@ford.com>

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
> + ;;
> +
> + tar)
> + tar cvzf "${COPYDIR}/initrd.tar.gz" $PATHS
> + ;;
> +esac
> --
> 2.39.5

