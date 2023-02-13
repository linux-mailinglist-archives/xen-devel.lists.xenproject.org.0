Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98765695515
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 00:58:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494894.765065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRih1-0002p3-G4; Mon, 13 Feb 2023 23:57:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494894.765065; Mon, 13 Feb 2023 23:57:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRih1-0002lg-D8; Mon, 13 Feb 2023 23:57:07 +0000
Received: by outflank-mailman (input) for mailman id 494894;
 Mon, 13 Feb 2023 23:57:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i+K/=6J=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pRih0-0002lW-8k
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 23:57:06 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ca9f1b2-abfa-11ed-933c-83870f6b2ba8;
 Tue, 14 Feb 2023 00:57:04 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id E8D03CE0B18;
 Mon, 13 Feb 2023 23:57:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFCB6C433EF;
 Mon, 13 Feb 2023 23:56:59 +0000 (UTC)
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
X-Inumbo-ID: 1ca9f1b2-abfa-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676332620;
	bh=ooG84o3Fy2ttUBPRj/D/CuBk20QbKBTFeLh70y8Iqi8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cV2b5FBj3UMizrspCC4XDHZJDFS8i4w/Fhw12GLGloz7Vr/67qfq2mJ+3bdLIFWMH
	 qR3d6uu0hezC8AlFPEh1qRGAEO2D6hjQd5W2cAEUt/F76ByvAMAXZ1WRD5C7gPj3Ge
	 0kxpRRQhVgk55ggVX0CR6TJ/S9Zuy7mkB8Uez5ArY3ye394+2373X56cnHW+SsbvO6
	 Z4ZXahVWz8g0uY+RnQdfGofvhkkhbaARW3hfmZPZhLIg+3zWhYxiI4FwuBHxgPi9wS
	 d9r1FfrU1Xy8KPlYNTWHt5zoi+tA5qa9x/lC/5ROKElHj9f5Q4heJLWKGTjmXWXwsF
	 MuYZ+p+Mhlwvg==
Date: Mon, 13 Feb 2023 15:56:58 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] automation: Add container and build jobs to run cppcheck
 analysis
In-Reply-To: <20230213142312.11806-1-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2302131551430.4661@ubuntu-linux-20-04-desktop>
References: <20230213142312.11806-1-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 13 Feb 2023, Michal Orzel wrote:
> Add a debian container with cppcheck installation routine inside,
> capable of performing cppcheck analysis on Xen-only build including
> cross-builds for arm32 and arm64.
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

Thanks for the patch, very nice!


> ---
> For those interested in, here is a sample pipeline:
> https://gitlab.com/xen-project/people/morzel/xen-orzelmichal/-/pipelines/775769167
> ---
>  .../build/debian/unstable-cppcheck.dockerfile | 37 +++++++++++++++++
>  automation/gitlab-ci/build.yaml               | 40 +++++++++++++++++++
>  automation/scripts/build                      | 11 ++++-
>  3 files changed, 87 insertions(+), 1 deletion(-)
>  create mode 100644 automation/build/debian/unstable-cppcheck.dockerfile
> 
> diff --git a/automation/build/debian/unstable-cppcheck.dockerfile b/automation/build/debian/unstable-cppcheck.dockerfile
> new file mode 100644
> index 000000000000..39bcc50673c8
> --- /dev/null
> +++ b/automation/build/debian/unstable-cppcheck.dockerfile
> @@ -0,0 +1,37 @@
> +FROM debian:unstable
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
> +        gcc-aarch64-linux-gnu
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
> index a053c5c7325d..c8831ccbec7a 100644
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
> @@ -145,6 +146,23 @@
>    variables:
>      <<: *gcc
>  
> +.arm64-cross-build-tmpl:
> +  <<: *build
> +  variables:
> +    XEN_TARGET_ARCH: arm64
> +  tags:
> +    - x86_64
> +
> +.arm64-cross-build:
> +  extends: .arm64-cross-build-tmpl
> +  variables:
> +    debug: n
> +
> +.gcc-arm64-cross-build:
> +  extends: .arm64-cross-build
> +  variables:
> +    <<: *gcc
> +
>  .arm64-build-tmpl:
>    <<: *build
>    variables:
> @@ -679,6 +697,28 @@ archlinux-current-gcc-riscv64-debug-randconfig:
>      EXTRA_FIXED_RANDCONFIG:
>        CONFIG_COVERAGE=n
>  
> +# Cppcheck analysis jobs
> +
> +debian-unstable-gcc-cppcheck:
> +  extends: .gcc-x86-64-build
> +  variables:
> +    CONTAINER: debian:unstable-cppcheck
> +    CPPCHECK: y
> +
> +debian-unstable-gcc-arm32-cppcheck:
> +  extends: .gcc-arm32-cross-build
> +  variables:
> +    CONTAINER: debian:unstable-cppcheck
> +    CROSS_COMPILE: /usr/bin/arm-linux-gnueabihf-
> +    CPPCHECK: y
> +
> +debian-unstable-gcc-arm64-cppcheck:
> +  extends: .gcc-arm64-cross-build
> +  variables:
> +    CONTAINER: debian:unstable-cppcheck
> +    CROSS_COMPILE: /usr/bin/aarch64-linux-gnu-
> +    CPPCHECK: y
> +
>  ## Test artifacts common
>  
>  .test-jobs-artifact-common:
> diff --git a/automation/scripts/build b/automation/scripts/build
> index f2f5e55bc04f..c219752d553e 100755
> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -38,7 +38,16 @@ cp xen/.config xen-config
>  # Directory for the artefacts to be dumped into
>  mkdir binaries
>  
> -if [[ "${HYPERVISOR_ONLY}" == "y" ]]; then
> +if [[ "${CPPCHECK}" == "y" ]]; then
> +    # Cppcheck analysis invokes Xen-only build.

Given that when $CPPCHECK == y we are doing a hypervisor-only build,
what do you think of also specifying $HYPERVISOR_ONLY == y in these
cases?

We could set both CPPCHECK=y and HYPERVISOR_ONLY=y in build.yaml and
then here also check for both.


> +    # Known limitation: cppcheck generates inconsistent reports when running
> +    # in parallel mode, therefore do not specify -j<n>.

I take you tried -j$(nproc) on gitlab-ci and didn't work well? I tested
-j$(nproc) in my native arm64 environment and seemed to work well.


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

