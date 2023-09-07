Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB04796E19
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 02:41:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596973.931123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qe35C-00021c-KV; Thu, 07 Sep 2023 00:41:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596973.931123; Thu, 07 Sep 2023 00:41:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qe35C-0001yy-HP; Thu, 07 Sep 2023 00:41:18 +0000
Received: by outflank-mailman (input) for mailman id 596973;
 Thu, 07 Sep 2023 00:41:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Shnx=EX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qe35B-0001xM-10
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 00:41:17 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f015223-4d17-11ee-8783-cb3800f73035;
 Thu, 07 Sep 2023 02:41:14 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 4DB87CE188A;
 Thu,  7 Sep 2023 00:41:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98D7FC433C8;
 Thu,  7 Sep 2023 00:41:05 +0000 (UTC)
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
X-Inumbo-ID: 3f015223-4d17-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694047266;
	bh=Zu7Bgu0NwVdycqcEuFJ3hFovWshfpAIqPpkfO5JB4ss=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DEHlPD6pr9rBys0vshmPQs0pjSdkWKCpOBHXGoHCPv+lIaZ+JoXLghpFJe9+8eh/S
	 7g1BnheTiiUzx9QlWAlQwXoxSkzn1Ak7CKQCZkEFokZa43UpZ3Zcbgm8jlMcui0P/1
	 wZjhSR9gnxS8C2kO0N64pQyZaLQyZBexJzVZT4adXSuCFMLiQHtEDa8dOyj8iKuB2+
	 pAZ350730OHdOyCrB5sm9N9eMNR0UqQiT7eXiCoZkRj6OknO/Ua50c73+rQT6tZgnz
	 gWs7l8OsFOiY84QWxYXNrcl2AQ3swgwzV9itZCPnLG4h2/FsLhbX0WYsSugzUOg5Py
	 Pns2AtZbaKx+w==
Date: Wed, 6 Sep 2023 17:41:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Shawn Anastasio <sanastasio@raptorengineering.com>
cc: xen-devel@lists.xenproject.org, 
    Timothy Pearson <tpearson@raptorengineering.com>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 1/2] automation: Switch ppc64le tests to PowerNV
 machine type
In-Reply-To: <85b53762ba04a349ba099cf5629e7ac24f496d69.1694044614.git.sanastasio@raptorengineering.com>
Message-ID: <alpine.DEB.2.22.394.2309061739490.6458@ubuntu-linux-20-04-desktop>
References: <cover.1694044614.git.sanastasio@raptorengineering.com> <85b53762ba04a349ba099cf5629e7ac24f496d69.1694044614.git.sanastasio@raptorengineering.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 6 Sep 2023, Shawn Anastasio wrote:
> Run ppc64le tests with the PowerNV machine type (bare metal) instead of
> the paravirtualized pseries machine. This requires a more modern version
> of QEMU than is present in debian bullseye's repository, so update the
> dockerfile to build QEMU from source.
> 
> Support for booting on pseries was broken by 74b725a64d80 ('xen/ppc:
> Implement initial Radix MMU support') which resulted in CI failures. In
> preparation for removing pseries support entirely, switch the CI
> infrastructure to the PowerNV machine type.
> 
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> ---
>  .../build/debian/bullseye-ppc64le.dockerfile  | 37 ++++++++++++++++++-
>  automation/gitlab-ci/test.yaml                |  2 +-
>  2 files changed, 36 insertions(+), 3 deletions(-)
> 
> diff --git a/automation/build/debian/bullseye-ppc64le.dockerfile b/automation/build/debian/bullseye-ppc64le.dockerfile
> index 8fad26e903..15827bbcf4 100644
> --- a/automation/build/debian/bullseye-ppc64le.dockerfile
> +++ b/automation/build/debian/bullseye-ppc64le.dockerfile
> @@ -1,4 +1,36 @@
> +FROM debian:bullseye-slim AS builder
> +
> +ENV DEBIAN_FRONTEND=noninteractive
> +ENV QEMU_TAG=stable-8.1
> +ENV USER root
> +
> +# dependencies for qemu build
> +RUN apt-get update && \
> +    apt-get --quiet --yes install \
> +        git \
> +        build-essential \
> +        python3-minimal \
> +        python3-elementpath \
> +        python3-pip \
> +        ninja-build \
> +        libglib2.0-dev \
> +        libpixman-1-dev
> +
> +RUN mkdir /build
> +WORKDIR /build
> +
> +# QEMU build from git
> +RUN git clone --depth 1 --branch "${QEMU_TAG}" https://github.com/qemu/qemu && \
> +    mkdir qemu/build && \
> +    cd qemu/build && \
> +    ../configure --target-list=ppc64-softmmu && \
> +    ninja && \
> +    ninja install

It is totally find to build your QEMU but please use a test-artifact
instead, see automation/tests-artifacts/qemu-system-aarch64/ and
qemu-system-aarch64-6.0.0-arm64-export as an example.


>  FROM debian:bullseye-slim
> +COPY --from=builder /usr/local/bin/qemu-system-ppc64 /usr/local/bin/qemu-system-ppc64
> +COPY --from=builder /usr/local/share/qemu/skiboot.lid /usr/local/share/qemu/skiboot.lid
> +
>  LABEL maintainer.name="The Xen Project" \
>        maintainer.email="xen-devel@lists.xenproject.org"
>  
> @@ -22,8 +54,9 @@ RUN apt-get update && \
>          gcc-powerpc64le-linux-gnu \
>          make \
>          python3-minimal \
> -        # for test phase
> -        qemu-system-ppc \
> +        # QEMU runtime dependencies
> +        libglib2.0-0 \
> +        libpixman-1-0 \
>          && \
>          apt-get autoremove -y && \
>          apt-get clean && \
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 9aa8deabea..9b26ccd907 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -457,6 +457,6 @@ qemu-smoke-riscv64-gcc:
>  qemu-smoke-ppc64le-pseries-gcc:
>    extends: .qemu-ppc64le
>    script:
> -    - ./automation/scripts/qemu-smoke-ppc64le.sh pseries-5.2 2>&1 | tee ${LOGFILE}
> +    - ./automation/scripts/qemu-smoke-ppc64le.sh powernv9 2>&1 | tee ${LOGFILE}
>    needs:
>      - debian-bullseye-gcc-ppc64le-debug
> -- 
> 2.30.2
> 

