Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B2B6CB2CF
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 02:33:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515491.798421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgxGp-0004fZ-Nz; Tue, 28 Mar 2023 00:33:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515491.798421; Tue, 28 Mar 2023 00:33:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgxGp-0004cZ-KL; Tue, 28 Mar 2023 00:33:03 +0000
Received: by outflank-mailman (input) for mailman id 515491;
 Tue, 28 Mar 2023 00:33:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=by25=7U=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pgxGo-0004cT-IS
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 00:33:02 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 183e9628-cd00-11ed-85db-49a42c6b2330;
 Tue, 28 Mar 2023 02:33:01 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4153AB819ED;
 Tue, 28 Mar 2023 00:33:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46D99C433D2;
 Tue, 28 Mar 2023 00:32:58 +0000 (UTC)
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
X-Inumbo-ID: 183e9628-cd00-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679963579;
	bh=DuJIqtLusLEkE88kdfcYiTRfUxxzAPVtYwv8bhOl068=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=g097HBIb1aWf1KJG790w8pfWvlOtd3QmemSGRej/8z/6YsdPx11BzOp/TYrfy+DYP
	 /S2vkpb/SAZBVL/ztqJ50J/wpO65wnpaAtRgbwGbi/t5avYIt0XDDHYvvTu26wU0an
	 3UIcR4235J4SZz12WDmy5WaU8DsPCxkJfQ+svSGVWMUwN65vzbqJKGitJ+eVN7irkA
	 CejRPGg31/efNbqZ+g8i1wSWvcFK/nsKKiLtPVf28wCAt/V/Y/t+4P5J56iHl5Ti84
	 rFO0zzdIM79uezqpKkICVJekgz3tNkPMOfMwAeXkk03zTsiLyAksJsehcjXXG8yC2/
	 FFtprxJZpPi4w==
Date: Mon, 27 Mar 2023 17:32:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 1/2] automation: update x86-64 tests to Linux 6.1.19
In-Reply-To: <cd3c32a9e013ff4f9442eccb17c3fc698a862bbf.1679778534.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2303271732480.4066@ubuntu-linux-20-04-desktop>
References: <cover.21e1254a0c5cb3256afbc6b7bd44e8f347d7c08f.1679778534.git-series.marmarek@invisiblethingslab.com> <cd3c32a9e013ff4f9442eccb17c3fc698a862bbf.1679778534.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-805764948-1679963579=:4066"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-805764948-1679963579=:4066
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sat, 25 Mar 2023, Marek Marczykowski-Górecki wrote:
> It will be used in tests added in subsequent patches.
> Enable config options needed for those tests.
> While at it, migrate all the x86 tests to the newer kernel, and
> introduce x86-64-test-needs to allow deduplication later (for now it's
> used only once).
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> v2:
>  - replace 5.10.74 with 6.1.19 in all the tests
>  - introduce x86-64-test-needs
> ---
>  automation/gitlab-ci/build.yaml                      |  4 +-
>  automation/gitlab-ci/test.yaml                       |  7 +-
>  automation/tests-artifacts/kernel/5.10.74.dockerfile | 38 +------------
>  automation/tests-artifacts/kernel/6.1.19.dockerfile  | 40 +++++++++++++-
>  4 files changed, 47 insertions(+), 42 deletions(-)
>  delete mode 100644 automation/tests-artifacts/kernel/5.10.74.dockerfile
>  create mode 100644 automation/tests-artifacts/kernel/6.1.19.dockerfile
> 
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index 820cc0af83bd..0817f110556e 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -798,9 +798,9 @@ alpine-3.12-rootfs-export:
>    tags:
>      - x86_64
>  
> -kernel-5.10.74-export:
> +kernel-6.1.19-export:
>    extends: .test-jobs-artifact-common
> -  image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:5.10.74
> +  image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:6.1.19
>    script:
>      - mkdir binaries && cp /bzImage binaries/bzImage
>    artifacts:
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index d75662358f34..ee9e3210772b 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -15,6 +15,10 @@
>  .arm32-test-needs: &arm32-test-needs
>    - qemu-system-aarch64-6.0.0-arm32-export
>  
> +.x86-64-test-needs: &x86-64-test-needs
> +  - alpine-3.12-rootfs-export
> +  - kernel-6.1.19-export
> +
>  .qemu-arm64:
>    extends: .test-jobs-common
>    variables:
> @@ -299,9 +303,8 @@ qemu-alpine-x86_64-gcc:
>    script:
>      - ./automation/scripts/qemu-alpine-x86_64.sh 2>&1 | tee ${LOGFILE}
>    needs:
> +    - *x86-64-test-needs
>      - alpine-3.12-gcc
> -    - alpine-3.12-rootfs-export
> -    - kernel-5.10.74-export
>  
>  qemu-smoke-x86-64-gcc:
>    extends: .qemu-x86-64
> diff --git a/automation/tests-artifacts/kernel/5.10.74.dockerfile b/automation/tests-artifacts/kernel/5.10.74.dockerfile
> deleted file mode 100644
> index 112e27fe45e1..000000000000
> --- a/automation/tests-artifacts/kernel/5.10.74.dockerfile
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -FROM debian:unstable
> -LABEL maintainer.name="The Xen Project" \
> -      maintainer.email="xen-devel@lists.xenproject.org"
> -
> -ENV DEBIAN_FRONTEND=noninteractive
> -ENV LINUX_VERSION=5.10.74
> -ENV USER root
> -
> -RUN mkdir /build
> -WORKDIR /build
> -
> -# build depends
> -RUN apt-get update && \
> -    apt-get --quiet --yes install \
> -        build-essential \
> -        libssl-dev \
> -        bc \
> -        curl \
> -        flex \
> -        bison \
> -        libelf-dev \
> -        && \
> -    apt-get autoremove -y && \
> -    apt-get clean && \
> -    rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
> -
> -# Build the kernel
> -RUN curl -fsSLO https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-"$LINUX_VERSION".tar.xz && \
> -    tar xvJf linux-"$LINUX_VERSION".tar.xz && \
> -    cd linux-"$LINUX_VERSION" && \
> -    make defconfig && \
> -    make xen.config && \
> -    cp .config .config.orig && \
> -    cat .config.orig | grep XEN | grep =m |sed 's/=m/=y/g' >> .config && \
> -    make -j$(nproc) bzImage && \
> -    cp arch/x86/boot/bzImage / && \
> -    cd /build && \
> -    rm -rf linux-"$LINUX_VERSION"*
> diff --git a/automation/tests-artifacts/kernel/6.1.19.dockerfile b/automation/tests-artifacts/kernel/6.1.19.dockerfile
> new file mode 100644
> index 000000000000..c2171555a0a6
> --- /dev/null
> +++ b/automation/tests-artifacts/kernel/6.1.19.dockerfile
> @@ -0,0 +1,40 @@
> +FROM debian:unstable
> +LABEL maintainer.name="The Xen Project" \
> +      maintainer.email="xen-devel@lists.xenproject.org"
> +
> +ENV DEBIAN_FRONTEND=noninteractive
> +ENV LINUX_VERSION=6.1.19
> +ENV USER root
> +
> +RUN mkdir /build
> +WORKDIR /build
> +
> +# build depends
> +RUN apt-get update && \
> +    apt-get --quiet --yes install \
> +        build-essential \
> +        libssl-dev \
> +        bc \
> +        curl \
> +        flex \
> +        bison \
> +        libelf-dev \
> +        && \
> +    apt-get autoremove -y && \
> +    apt-get clean && \
> +    rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
> +
> +# Build the kernel
> +RUN curl -fsSLO https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-"$LINUX_VERSION".tar.xz && \
> +    tar xvJf linux-"$LINUX_VERSION".tar.xz && \
> +    cd linux-"$LINUX_VERSION" && \
> +    make defconfig && \
> +    make xen.config && \
> +    scripts/config --enable BRIDGE && \
> +    scripts/config --enable IGC && \
> +    cp .config .config.orig && \
> +    cat .config.orig | grep XEN | grep =m |sed 's/=m/=y/g' >> .config && \
> +    make -j$(nproc) bzImage && \
> +    cp arch/x86/boot/bzImage / && \
> +    cd /build && \
> +    rm -rf linux-"$LINUX_VERSION"*
> -- 
> git-series 0.9.1
> 
--8323329-805764948-1679963579=:4066--

