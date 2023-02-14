Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B39866971CD
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 00:26:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495631.766006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pS4gb-0006Qq-5l; Tue, 14 Feb 2023 23:26:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495631.766006; Tue, 14 Feb 2023 23:26:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pS4gb-0006P9-2l; Tue, 14 Feb 2023 23:26:09 +0000
Received: by outflank-mailman (input) for mailman id 495631;
 Tue, 14 Feb 2023 23:26:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nHuR=6K=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pS4gZ-0006P3-SF
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 23:26:07 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f36e302d-acbe-11ed-933c-83870f6b2ba8;
 Wed, 15 Feb 2023 00:26:06 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 908CDCE22E1;
 Tue, 14 Feb 2023 23:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47CA7C433EF;
 Tue, 14 Feb 2023 23:26:01 +0000 (UTC)
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
X-Inumbo-ID: f36e302d-acbe-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676417161;
	bh=nUvcyiJlKmZkMgK5GqF5FKbuAwgp/PxaYQIA5L+m3is=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kXsZfIO6iEHL/5RZFreDBsH0xXbUXXx4Vs5o1FFqm1QKTprIcyFpMpJfatU0BkkLE
	 WhNIxJUghrqdKHBE8TWZ7sruynGh1CsfPD1lGD1MGtYunYVITYMMzKuFWz2rtVHfi5
	 DeN8qO11N2/hgwQS7uxvl/uD+jiNf3l3VqytPHo0CZ7tX1GIk5c6S5lAymZdW9FT6T
	 tlNft+MFhZ3FesFuGFs+ZDTImhULmuLAbXQD2N6OAP1nrQtetFkbh9Q5hXp+Q5G279
	 dSPSVjd9bFGUwc9lwSjWxA5clQhh4MgWVeZQKPYazRt2ae64l04YZUmdYMfCO6saLc
	 cpeZlDz5Zv9gw==
Date: Tue, 14 Feb 2023 15:25:59 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] automation: Add container and build jobs to run
 cppcheck analysis
In-Reply-To: <20230214153945.15719-1-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2302141525500.2025117@ubuntu-linux-20-04-desktop>
References: <20230214153945.15719-1-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 14 Feb 2023, Michal Orzel wrote:
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
> Changes in v2:
>  - use arm64 container instead of x86 to make pipeline faster
>  - explicitly set HYPERVISOR_ONLY=y for cppcheck jobs
> 
> For convenience and own testing, I built and pushed the new container
> to registry. CI pipeline including dom0less series:
> https://gitlab.com/xen-project/people/morzel/xen-orzelmichal/-/pipelines/777181033
> ---
>  .../build/debian/unstable-cppcheck.dockerfile | 37 ++++++++++++++++
>  automation/gitlab-ci/build.yaml               | 43 +++++++++++++++++++
>  automation/scripts/build                      | 11 ++++-
>  3 files changed, 90 insertions(+), 1 deletion(-)
>  create mode 100644 automation/build/debian/unstable-cppcheck.dockerfile
> 
> diff --git a/automation/build/debian/unstable-cppcheck.dockerfile b/automation/build/debian/unstable-cppcheck.dockerfile
> new file mode 100644
> index 000000000000..54b99f87dfec
> --- /dev/null
> +++ b/automation/build/debian/unstable-cppcheck.dockerfile
> @@ -0,0 +1,37 @@
> +FROM arm64v8/debian:unstable
> +LABEL maintainer.name="The Xen Project" \
> +      maintainer.email="xen-devel@lists.xenproject.org"
> +
> +ENV DEBIAN_FRONTEND=noninteractive
> +ENV CPPCHECK_VERSION=2.7
> +ENV USER root
> +
> +RUN mkdir /build
> +WORKDIR /build
> +
> +# dependencies for cppcheck and Xen-only build/cross-build
> +RUN apt-get update && \
> +    apt-get --quiet --yes install \
> +        build-essential \
> +        curl \
> +        python-is-python3 \
> +        libpcre3-dev \
> +        flex \
> +        bison \
> +        gcc-arm-linux-gnueabihf \
> +        gcc-x86-64-linux-gnu
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
> +# clean
> +RUN apt-get autoremove -y && \
> +    apt-get clean && \
> +    rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/* && \
> +    rm -rf cppcheck-"$CPPCHECK_VERSION"* "$CPPCHECK_VERSION".tar.gz
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index 079e9b73f659..1441b7dbb6fa 100644
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
> @@ -699,6 +717,31 @@ archlinux-current-gcc-riscv64-debug-randconfig:
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

