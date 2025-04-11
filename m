Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D0AA85D09
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 14:26:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947304.1344957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3DSP-0008HJ-8b; Fri, 11 Apr 2025 12:26:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947304.1344957; Fri, 11 Apr 2025 12:26:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3DSP-0008EB-46; Fri, 11 Apr 2025 12:26:05 +0000
Received: by outflank-mailman (input) for mailman id 947304;
 Fri, 11 Apr 2025 12:26:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JDlf=W5=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1u3DSN-0008Dz-S3
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 12:26:03 +0000
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [2607:f8b0:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1fe89f5a-16d0-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 14:26:00 +0200 (CEST)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-3f68460865aso1222483b6e.0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Apr 2025 05:26:00 -0700 (PDT)
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
X-Inumbo-ID: 1fe89f5a-16d0-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1744374359; x=1744979159; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yaRVlrUFdVqa8gu8hJW6Is51czIX+nXqo1cSMrKVN44=;
        b=lVTf3tQZ7tvzTqgMXadsy5j1rYMVLREfmziCIxdATfljLiCSLM5cVwCy9OmNgGOy4O
         J5sFFO1UwSIBtxmD1qjN5wHQiFUdpLFjd5Qw6Hr3xoztR3aOSC+rGUYxRObmvZZKoxX0
         u8mgcv8gfEZzRqsyra4BIIg7gd8lbhc6m8kqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744374359; x=1744979159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yaRVlrUFdVqa8gu8hJW6Is51czIX+nXqo1cSMrKVN44=;
        b=TYNHc5288i3i//tsj58b9sXcIz/CVaOK4o8HutUI4yerIQzfmVy+uKx0sf89L8JzLb
         EAXBH16vaNEXmV5286l9XTLoXVrR8kAMOuS+zDgUn0FNg72lcm+69pyqsqRjLEKgq8YN
         yjkzGsHrj4f//74x+hW41oZOoY2adrkvv4IidaCDrR6GIdzJkPc9YH3cE7JpXVope3SV
         l6N+njRkPCdpm1S9ZhqdD3xy7C7387A2yqPto7O6tse0i+57dGeCmMMYG2WZGJvDiI+y
         4Ilgqz9rLWePqPoz8b5oLWtrfHS0HB+iKma1YGwexq/qdXubA36KUswsdHZEUIprl8PR
         QWXQ==
X-Gm-Message-State: AOJu0YwWHGoWpxdU1BmSmXR5GQ9IZZnVuG490BKbdWC7L0nQABK3KVpO
	dBKig56S0OWKGzPW7FP5jgKKHufVyajIDEmtbqP9x2geV77kx4UQyvZOzQW581slYwjUQp8Y2V7
	reTj/L8usR/3CsaRQ43BucIAhWSYvlnS6EqfhzQ==
X-Gm-Gg: ASbGnctQZKmXZRAJMT5L8UH3bwcSv0H4yrLRKdfM4cB/bfItn1BX2THdZKy0cDI9TES
	EQPBWKduGUl4g43UBye9QbMTeaTzIFiGhljci/eCveBb5CqV7VKIM03y5aGA/8tuI+cTsbVO/yv
	6tA56Kz0I+8USdaOgbA30gng==
X-Google-Smtp-Source: AGHT+IEY3rI/yhuXks+861YpsSr/0mMQwRTXjoj4nVUdgTdlBglHQSTD91n9F5i4s/73v+mA0yxB7kwSqqAXIWeQoTE=
X-Received: by 2002:a05:6808:1312:b0:3f6:80e2:4b83 with SMTP id
 5614622812f47-400850df85amr1339050b6e.31.1744374358914; Fri, 11 Apr 2025
 05:25:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250411105217.2141356-1-andrew.cooper3@citrix.com> <20250411105217.2141356-2-andrew.cooper3@citrix.com>
In-Reply-To: <20250411105217.2141356-2-andrew.cooper3@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Fri, 11 Apr 2025 13:25:47 +0100
X-Gm-Features: ATxdqUGj1zP_Xe4HrCQO5nfBLNKxYkv4lCwgZxgYVuO8LLn9jUtSGVCjB20R7Jg
Message-ID: <CACHz=Zhs9jT8GDN=LUfewPJpX6Q2LNxBgpyv1wW-D-qv_K-qLA@mail.gmail.com>
Subject: Re: [PATCH 1/3] Rework rootfs generation to make a cpio archive
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Anthony PERARD <anthony.perard@vates.tech>, Stefano Stabellini <sstabellini@kernel.org>, 
	Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 11:52=E2=80=AFAM Andrew Cooper
<andrew.cooper3@citrix.com> wrote:
>
> Rename the script as we're going to use it for ARM64 shortly, and have it=
 take
> a tar or cpio parameter to determine the output format.
>
> Turn it into a proper bash script, and provide the cpio form under the ne=
w
> artefact naming scheme.
>
> No functional change.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Doug Goldstein <cardoe@cardoe.com>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> ---
>  .gitlab-ci.yml                                |  9 +++++++-
>  ...6_64-rootfs-alpine.sh =3D> alpine-rootfs.sh} | 21 +++++++++++++++++--
>  2 files changed, 27 insertions(+), 3 deletions(-)
>  rename scripts/{x86_64-rootfs-alpine.sh =3D> alpine-rootfs.sh} (75%)
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 1d2c72b268a3..916c5ae9d508 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -42,6 +42,13 @@ linux-6.6.86-arm64:
>  #
>  # x86_64 artifacts
>  #
> +alpine-3.18-x86_64-rootfs:
> +  extends: .x86_64-artifacts
> +  script:
> +    - ./scripts/alpine-rootfs.sh cpio
> +  variables:
> +    CONTAINER: alpine:3.18-x86_64-base
> +
>  linux-6.6.56-x86_64:
>    extends: .x86_64-artifacts
>    script: ./scripts/build-linux.sh
> @@ -62,7 +69,7 @@ x86_64-kernel-linux-6.6.56:
>  x86_64-rootfs-alpine-3.18:
>    extends: .x86_64-artifacts
>    script:
> -    - . scripts/x86_64-rootfs-alpine.sh
> +    - ./scripts/alpine-rootfs.sh tar
>    variables:
>      CONTAINER: alpine:3.18-x86_64-base
>
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
>  WORKDIR=3D"${PWD}"
> +COPYDIR=3D"${WORKDIR}/binaries"
>
>  apk update
>
> @@ -56,5 +61,17 @@ passwd -d "root" root
>
>  # Create rootfs
>  cd /
> -tar cvzf "${WORKDIR}/binaries/initrd.tar.gz" \
> -    bin dev etc home init lib mnt opt root sbin usr var
> +PATHS=3D"bin dev etc home init lib mnt opt root sbin usr var"
> +
> +case $1 in
> +    cpio)
> +        find $PATHS | cpio -o -H newc | gzip > "${COPYDIR}/rootfs.cpio.g=
z"
> +

Paranoia mode: -print0 for find and -0 for cpio to support weird file names=
?

> +        # Print the contents for the build log
> +        zcat "${COPYDIR}/rootfs.cpio.gz" | cpio -tv

I saw other comments about -v and busybox compatibility.
I suppose it depends how important are performances here, otherwise I
could suggest the usage of mkfifo before, use -F option to the fifo
and use an additional pipeline to compress the file.

mypipe=3D$(mktemp -u)
mkfifo $mypipe
gzip -c > "${COPYDIR}/rootfs.cpio.gz" < $mypipe &
find $PATHS -print0 | cpio -o -H newc -F $mypipe -0
wait # for gzip
rm $mypipe

> +        ;;
> +
> +    tar)
> +        tar cvzf "${COPYDIR}/initrd.tar.gz" $PATHS
> +        ;;
> +esac
> --
> 2.39.5
>
>

Frediano

