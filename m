Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D811E92637D
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 16:35:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753122.1161398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP13k-0000CT-K4; Wed, 03 Jul 2024 14:34:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753122.1161398; Wed, 03 Jul 2024 14:34:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP13k-000094-GN; Wed, 03 Jul 2024 14:34:12 +0000
Received: by outflank-mailman (input) for mailman id 753122;
 Wed, 03 Jul 2024 14:34:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=znpO=OD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sP13i-00008y-JX
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 14:34:10 +0000
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [2607:f8b0:4864:20::830])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4dcf4eca-3949-11ef-8776-851b0ebba9a2;
 Wed, 03 Jul 2024 16:34:07 +0200 (CEST)
Received: by mail-qt1-x830.google.com with SMTP id
 d75a77b69052e-447bfa82882so3728931cf.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 07:34:07 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-446513d40eesm50700491cf.16.2024.07.03.07.34.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 07:34:06 -0700 (PDT)
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
X-Inumbo-ID: 4dcf4eca-3949-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720017247; x=1720622047; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OkEU2sTfiwkSw/DcBnlzRIrZKfsk6Ni21u8FMS/6uz4=;
        b=mHOqriXlIodZXYsnO8w91WmBNQqDwHn/Pg7ovCVaC1cFHk3gsrOFSKZAlXVSKmd022
         dRW8tE3I7yJ4c+GSRP9XxlYbNUpbKBnpNnTAyCYMC50+SO84cVfGwLZH5VjFbZTOK4KZ
         8ntoo+iTpP73/OYOA+s2E3L2QDYQqGM9yBmT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720017247; x=1720622047;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OkEU2sTfiwkSw/DcBnlzRIrZKfsk6Ni21u8FMS/6uz4=;
        b=pmbg29ipSFGMNIL0RmxYGQtMCkXe+W6zlNJmz0qN7Z+A2VupD6QhgtgD043+1VH4Ps
         uewf/aipKkpeyZTbFFUKmGhzHsoF4ZTf6QO3uLWk/FvP2yNGxigJg5+lCN9JBJJjRj1O
         V5lqqsFjulo2fdy8hlDZT5khQVKGZqwkwYQ0KSSMilZE/6j2owivo8c82NbZo1h9xIIF
         OAaSxS5T0rcnlD/IfOezjNtXT6JJAEjkTNwWefKKLnLb9TuujZairQeU00CS8F4zCFdQ
         15agTv/VzEhvO5g7f1hoBqKlNqxC8EZ+Qkuf3kFYWTNo3cG0Z0RHM9Lg7vfxQtbMqZTf
         rBPg==
X-Gm-Message-State: AOJu0Yz1Hr2ion8vdJWAznxxvXslMb5s9oBTlYwQeBIveNF/vE9O2D6l
	Wrwy5bJgkY/Tz19TSlJLR/T/qzjTl4hjzEzlvC1mPqLtyO+eQrs9Kis4ZMfHFiQ=
X-Google-Smtp-Source: AGHT+IH9tyviVXYTncO3rVq1kMfK07kJOZY5PbG/Bfi88dBvAq8uigjl9Xx7DyP54xxD48TJC+MDsQ==
X-Received: by 2002:ac8:7fcd:0:b0:446:59dd:b574 with SMTP id d75a77b69052e-44662e5749emr141855961cf.41.1720017246472;
        Wed, 03 Jul 2024 07:34:06 -0700 (PDT)
Date: Wed, 3 Jul 2024 16:34:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.19 1/4] CI: Formalise the use of heredocs
Message-ID: <ZoVhXGF7sknROnS0@macbook.local>
References: <20240703142002.1662874-1-andrew.cooper3@citrix.com>
 <20240703142002.1662874-2-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240703142002.1662874-2-andrew.cooper3@citrix.com>

On Wed, Jul 03, 2024 at 03:19:59PM +0100, Andrew Cooper wrote:
> Commit b5739330d7f4 introduced the use of heredocs in the jessie/stretch
> dockerfiles.
> 
> It turns out this was introduced by BuildKit in 2018 along with a
> standardisation of Dockerfile syntax, and has subsequently been adopted by the
> docker community.
> 
> Annotate all dockerfiles with a statement of the syntax in use, and extend
> README.md details including how to activate BuildKit when it's available but
> off by default.
> 
> This allows the containers to be rebuilt following commit a0e29b316363 ("CI:
> Drop glibc-i386 from the build containers").
> 
> Fixes: b5739330d7f4 ("automation: fix jessie/stretch images to use archive.debian.org apt repos")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Doug Goldstein <cardoe@cardoe.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  automation/build/README.md                             | 10 +++++++++-
>  automation/build/alpine/3.18-arm64v8.dockerfile        |  1 +
>  automation/build/alpine/3.18.dockerfile                |  1 +
>  automation/build/archlinux/current-riscv64.dockerfile  |  1 +
>  automation/build/archlinux/current.dockerfile          |  1 +
>  automation/build/centos/7.dockerfile                   |  1 +
>  .../build/debian/bookworm-arm64v8-arm32-gcc.dockerfile |  1 +
>  automation/build/debian/bookworm-arm64v8.dockerfile    |  1 +
>  automation/build/debian/bookworm-cppcheck.dockerfile   |  1 +
>  automation/build/debian/bookworm-i386.dockerfile       |  1 +
>  automation/build/debian/bookworm.dockerfile            |  1 +
>  automation/build/debian/bullseye-ppc64le.dockerfile    |  1 +
>  automation/build/debian/buster-gcc-ibt.dockerfile      |  1 +
>  automation/build/debian/jessie-i386.dockerfile         |  1 +
>  automation/build/debian/jessie.dockerfile              |  1 +
>  automation/build/debian/stretch-i386.dockerfile        |  1 +
>  automation/build/debian/stretch.dockerfile             |  1 +
>  automation/build/fedora/29.dockerfile                  |  1 +
>  automation/build/suse/opensuse-leap.dockerfile         |  1 +
>  automation/build/suse/opensuse-tumbleweed.dockerfile   |  1 +
>  automation/build/ubuntu/bionic.dockerfile              |  1 +
>  automation/build/ubuntu/focal.dockerfile               |  1 +
>  automation/build/ubuntu/trusty.dockerfile              |  1 +
>  automation/build/ubuntu/xenial-xilinx.dockerfile       |  1 +
>  automation/build/ubuntu/xenial.dockerfile              |  1 +
>  automation/build/yocto/yocto.dockerfile.in             |  2 ++
>  .../tests-artifacts/alpine/3.18-arm64v8.dockerfile     |  1 +
>  automation/tests-artifacts/alpine/3.18.dockerfile      |  1 +
>  .../tests-artifacts/kernel/5.19-arm64v8.dockerfile     |  1 +
>  automation/tests-artifacts/kernel/6.1.19.dockerfile    |  1 +
>  .../qemu-system-aarch64/6.0.0-arm64v8.dockerfile       |  1 +
>  .../qemu-system-ppc64/8.1.0-ppc64.dockerfile           |  1 +
>  32 files changed, 41 insertions(+), 1 deletion(-)
> 
> diff --git a/automation/build/README.md b/automation/build/README.md
> index 1c040533fdd8..12a2b4af1807 100644
> --- a/automation/build/README.md
> +++ b/automation/build/README.md
> @@ -81,7 +81,14 @@ Building a container
>  
>  There is a makefile to make this process easier. You should be
>  able to run `make DISTRO/VERSION` to have Docker build the container
> -for you. If you define the `PUSH` environment variable when running the
> +for you.
> +
> +Xen's dockerfiles use heredocs, which depend on the standardised dockerfile
> +syntax introduced by [BuiltKit].  This should work by default starting with
> +docker 23.0, or podman/buildah v1.33.  For older versions of docker, it can be
> +activated with `DOCKER_BUILDKIT=1` in the environment.
> +
> +If you define the `PUSH` environment variable when running the
>  former `make` command, it will push the container to the [registry] if
>  you have access to do so and have your Docker logged into the registry.
>  
> @@ -101,6 +108,7 @@ env CONTAINER_NO_PULL=1 \
>  make -C automation/build suse/opensuse-tumbleweed PUSH=1
>  ```
>  
> +[BuildKit]: https://docs.docker.com/build/buildkit/
>  [registry]: https://gitlab.com/xen-project/xen/container_registry
>  [registry help]: https://gitlab.com/help/user/project/container_registry
>  
> diff --git a/automation/build/alpine/3.18-arm64v8.dockerfile b/automation/build/alpine/3.18-arm64v8.dockerfile
> index 91e90220240f..19fe46f8418f 100644
> --- a/automation/build/alpine/3.18-arm64v8.dockerfile
> +++ b/automation/build/alpine/3.18-arm64v8.dockerfile
> @@ -1,3 +1,4 @@
> +# syntax=docker/dockerfile:1

Will this fail to parse if not using BuildKit?

Thanks, Roger.

