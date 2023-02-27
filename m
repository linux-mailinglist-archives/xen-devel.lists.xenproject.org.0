Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 601706A4EE6
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 23:49:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502974.775055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWmIU-0003zZ-7a; Mon, 27 Feb 2023 22:48:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502974.775055; Mon, 27 Feb 2023 22:48:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWmIU-0003x1-3Z; Mon, 27 Feb 2023 22:48:42 +0000
Received: by outflank-mailman (input) for mailman id 502974;
 Mon, 27 Feb 2023 22:48:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7o+2=6X=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pWmIS-0003wv-HL
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 22:48:40 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df813511-b6f0-11ed-a550-8520e6686977;
 Mon, 27 Feb 2023 23:48:38 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 67758B80DC5;
 Mon, 27 Feb 2023 22:48:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69F8BC433D2;
 Mon, 27 Feb 2023 22:48:35 +0000 (UTC)
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
X-Inumbo-ID: df813511-b6f0-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677538116;
	bh=hRktmfAmZkwVdjFyjizrJlsqcCs1N4kdnbLwS3QO1D0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=l5dLTb2LuDZfP7to7pVmx6nw4b/YokW7jPBekeAWleesBHvpLdiokEf4HMagbN5E6
	 S79aWfMD+nCndTUNIDBjXNhjGXOOonNocJqWCIh3hlQ9/A+/+uOEf6hSeos/kXWCXg
	 FoIVUTc+J6aCXspNgnDvfu6a9L2pnKmFoLq5SnK9BGLpsO9jReW9Vwtfiizfxt+jjM
	 kQN5M9OZp9WLktxtWMKctMngYh2xdD/in6BFJM08mPeCZoJwJ/sagVMqimH+UEnsDA
	 5/tr+Xh0ZkMjElilsvhtwD4VQWcflFphYLFjt8baGMUi8mDwD/jJWi3SGl2ejmdzE/
	 0+yb+OAT3PY3g==
Date: Mon, 27 Feb 2023 14:48:33 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3] automation: Add container and build jobs to run
 cppcheck analysis
In-Reply-To: <20230224101700.9032-1-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2302271448260.3680@ubuntu-linux-20-04-desktop>
References: <20230224101700.9032-1-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 24 Feb 2023, Michal Orzel wrote:
> Add a debian container with cppcheck installation routine inside,
> capable of performing cppcheck analysis on Xen-only build including
> cross-builds for arm32 and x86_64.
> 
> Populate build jobs making use of that container to run cppcheck
> analysis to produce a text report (xen-cppcheck.txt) containing the list
> of all the findings.
> 
> This patch does not aim at performing any sort of bisection. Cppcheck is
> imperfect and for now, our goal is to at least be aware of its reports,
> so that we can compare them with the ones produced by better tools and
> to be able to see how these reports change as a result of further
> infrastructure improvements (e.g. exception list, rules exclusion).
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v3:
>  - use multi-stage build to reduce the size of container
>  - drop Stefano Rb as a result of dockefile changes
> 
> Changes in v2:
>  - use arm64 container instead of x86 to make pipeline faster
>  - explicitly set HYPERVISOR_ONLY=y for cppcheck jobs
> ---
>  .../build/debian/unstable-cppcheck.dockerfile | 53 +++++++++++++++++++
>  automation/gitlab-ci/build.yaml               | 43 +++++++++++++++
>  automation/scripts/build                      | 11 +++-
>  3 files changed, 106 insertions(+), 1 deletion(-)
>  create mode 100644 automation/build/debian/unstable-cppcheck.dockerfile
> 
> diff --git a/automation/build/debian/unstable-cppcheck.dockerfile b/automation/build/debian/unstable-cppcheck.dockerfile
> new file mode 100644
> index 000000000000..adc192cea645
> --- /dev/null
> +++ b/automation/build/debian/unstable-cppcheck.dockerfile
> @@ -0,0 +1,53 @@
> +FROM arm64v8/debian:unstable AS builder
> +
> +ENV DEBIAN_FRONTEND=noninteractive
> +ENV CPPCHECK_VERSION=2.7
> +ENV USER root
> +
> +# dependencies for cppcheck build
> +RUN apt-get update && \
> +    apt-get --quiet --yes install \
> +        curl \
> +        build-essential \
> +        python-is-python3 \
> +        libpcre3-dev
> +
> +RUN mkdir /build
> +WORKDIR /build
> +
> +# cppcheck release build (see cppcheck readme.md)
> +RUN curl -fsSLO https://github.com/danmar/cppcheck/archive/"$CPPCHECK_VERSION".tar.gz && \
> +    tar xvzf "$CPPCHECK_VERSION".tar.gz && \
> +    cd cppcheck-"$CPPCHECK_VERSION" && \
> +    make install -j$(nproc) \
> +        MATCHCOMPILER=yes \
> +        FILESDIR=/usr/share/cppcheck \
> +        HAVE_RULES=yes CXXFLAGS="-O2 -DNDEBUG -Wall -Wno-sign-compare -Wno-unused-function"
> +
> +FROM arm64v8/debian:unstable
> +COPY --from=builder /usr/bin/cppcheck /usr/bin/cppcheck
> +COPY --from=builder /usr/share/cppcheck /usr/share/cppcheck
> +
> +LABEL maintainer.name="The Xen Project" \
> +      maintainer.email="xen-devel@lists.xenproject.org"
> +
> +ENV DEBIAN_FRONTEND=noninteractive
> +ENV USER root
> +
> +RUN mkdir /build
> +WORKDIR /build
> +
> +# dependencies for cppcheck analysis including Xen-only build/cross-build
> +RUN apt-get update && \
> +    apt-get --quiet --yes install \
> +        build-essential \
> +        python-is-python3 \
> +        libpcre3-dev \
> +        flex \
> +        bison \
> +        gcc-arm-linux-gnueabihf \
> +        gcc-x86-64-linux-gnu \
> +        && \
> +        apt-get autoremove -y && \
> +        apt-get clean && \
> +        rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index 22ce1c45e7cd..0835b7a65190 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -7,6 +7,7 @@
>      paths:
>        - binaries/
>        - xen-config
> +      - xen-cppcheck.txt
>        - '*.log'
>        - '*/*.log'
>      when: always
> @@ -199,6 +200,23 @@
>    variables:
>      <<: *gcc
>  
> +.x86-64-cross-build-tmpl:
> +  <<: *build
> +  variables:
> +    XEN_TARGET_ARCH: x86_64
> +  tags:
> +    - arm64
> +
> +.x86-64-cross-build:
> +  extends: .x86-64-cross-build-tmpl
> +  variables:
> +    debug: n
> +
> +.gcc-x86-64-cross-build:
> +  extends: .x86-64-cross-build
> +  variables:
> +    <<: *gcc
> +
>  # Jobs below this line
>  
>  archlinux-gcc:
> @@ -679,6 +697,31 @@ archlinux-current-gcc-riscv64-debug-randconfig:
>      EXTRA_FIXED_RANDCONFIG:
>        CONFIG_COVERAGE=n
>  
> +# Cppcheck analysis jobs
> +
> +debian-unstable-gcc-cppcheck:
> +  extends: .gcc-x86-64-cross-build
> +  variables:
> +    CONTAINER: debian:unstable-cppcheck
> +    CROSS_COMPILE: /usr/bin/x86_64-linux-gnu-
> +    CPPCHECK: y
> +    HYPERVISOR_ONLY: y
> +
> +debian-unstable-gcc-arm32-cppcheck:
> +  extends: .gcc-arm32-cross-build
> +  variables:
> +    CONTAINER: debian:unstable-cppcheck
> +    CROSS_COMPILE: /usr/bin/arm-linux-gnueabihf-
> +    CPPCHECK: y
> +    HYPERVISOR_ONLY: y
> +
> +debian-unstable-gcc-arm64-cppcheck:
> +  extends: .gcc-arm64-build
> +  variables:
> +    CONTAINER: debian:unstable-cppcheck
> +    CPPCHECK: y
> +    HYPERVISOR_ONLY: y
> +
>  ## Test artifacts common
>  
>  .test-jobs-artifact-common:
> diff --git a/automation/scripts/build b/automation/scripts/build
> index f2f5e55bc04f..7d1b19c4250d 100755
> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -38,7 +38,16 @@ cp xen/.config xen-config
>  # Directory for the artefacts to be dumped into
>  mkdir binaries
>  
> -if [[ "${HYPERVISOR_ONLY}" == "y" ]]; then
> +if [[ "${CPPCHECK}" == "y" ]] && [[ "${HYPERVISOR_ONLY}" == "y" ]]; then
> +    # Cppcheck analysis invokes Xen-only build.
> +    # Known limitation: cppcheck generates inconsistent reports when running
> +    # in parallel mode, therefore do not specify -j<n>.
> +    xen/scripts/xen-analysis.py --run-cppcheck --cppcheck-misra
> +
> +    # Preserve artefacts
> +    cp xen/xen binaries/xen
> +    cp xen/cppcheck-report/xen-cppcheck.txt xen-cppcheck.txt
> +elif [[ "${HYPERVISOR_ONLY}" == "y" ]]; then
>      # Xen-only build
>      make -j$(nproc) xen
>  
> -- 
> 2.25.1
> 

