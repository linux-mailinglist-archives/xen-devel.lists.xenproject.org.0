Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2794F5E6EE3
	for <lists+xen-devel@lfdr.de>; Thu, 22 Sep 2022 23:54:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410475.653487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obU8h-0006if-Qv; Thu, 22 Sep 2022 21:53:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410475.653487; Thu, 22 Sep 2022 21:53:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obU8h-0006fg-OB; Thu, 22 Sep 2022 21:53:47 +0000
Received: by outflank-mailman (input) for mailman id 410475;
 Thu, 22 Sep 2022 21:53:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2OXb=ZZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1obU8g-0006fX-Ch
 for xen-devel@lists.xenproject.org; Thu, 22 Sep 2022 21:53:46 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 066c042a-3ac1-11ed-9374-c1cf23e5d27e;
 Thu, 22 Sep 2022 23:53:44 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3B814611C8;
 Thu, 22 Sep 2022 21:53:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13217C433D6;
 Thu, 22 Sep 2022 21:53:40 +0000 (UTC)
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
X-Inumbo-ID: 066c042a-3ac1-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663883621;
	bh=iL8KBH6SVIwOFlDViXYb7tdRg/YT1BPcXLmadJsby7c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SVjpFKn7/KrFWxc2W3lzqd7ilf+1r0d2XmLp9yWfnHFojyqXhJwmBXwkO/qg7bQwG
	 BoCCDK6VNjZxgVFqD3YgrwxOhO4js59truesI2fa4/MqKkARsA7YqMj/a3hDEObyMr
	 aEIfCtui3JxnIsMr4yjBoipUq7L2nByTfCnnV9UuJ8ls05YkKUM+tJ3rkoYA5Z+0Bt
	 GbgYsCAqM5pOCOnLXkSpXXvbMsbFhSBDrUW9TrKrkWrsItQGAzAxJEOXWtnSCyRYx6
	 8eB5rYHBUg1p8aWIl7uiBX5uPSPcghVX60McEjfPCoavRAqZHNICahLomQ32WXD3oN
	 4QqYo3pMuCOgQ==
Date: Thu, 22 Sep 2022 14:53:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 3/9] automation: Add debug versions of Arm tests
In-Reply-To: <20220922134058.1410-4-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2209221444340.65421@ubuntu-linux-20-04-desktop>
References: <20220922134058.1410-1-michal.orzel@amd.com> <20220922134058.1410-4-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 22 Sep 2022, Michal Orzel wrote:
> At the moment, all the tests are executed on non-debug Xen builds.
> To improve the coverage (e.g. we might catch some asserts), add new
> test jobs using debug Xen builds.

This is interesting. On one hand, I agree it is good to test DEBUG and
non-DEBUG builds in runtime tests too, on the other hand I am worried
about our test capacity.

I take you have tried a few pipelines -- are the additional tests
causing the pipeline to take longer? Do we still have "room" because x86
is slower? What's your thinking?

One idea would be to only do:
- qemu-alpine-arm64-gcc-debug
- qemu-smoke-arm64-gcc-debug

and not the others


> Take the opportunity to increase RAM size for QEMU from 1GB to 2GB
> in qemu-smoke-arm64.sh as the debug builds take more space and we might
> end up in a situation when there is not enough free space (especially
> during a static memory test that reserves some region in the middle).
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
>  automation/gitlab-ci/build.yaml        | 16 +++++
>  automation/gitlab-ci/test.yaml         | 93 ++++++++++++++++++++++++++
>  automation/scripts/qemu-smoke-arm64.sh |  6 +-
>  3 files changed, 112 insertions(+), 3 deletions(-)
> 
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index d931441b910a..6ce92531f61f 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -587,6 +587,15 @@ alpine-3.12-gcc-arm64-staticmem:
>        CONFIG_UNSUPPORTED=y
>        CONFIG_STATIC_MEMORY=y
>  
> +alpine-3.12-gcc-debug-arm64-staticmem:
> +  extends: .gcc-arm64-build-debug
> +  variables:
> +    CONTAINER: alpine:3.12-arm64v8
> +    EXTRA_XEN_CONFIG: |
> +      CONFIG_EXPERT=y
> +      CONFIG_UNSUPPORTED=y
> +      CONFIG_STATIC_MEMORY=y
> +
>  alpine-3.12-gcc-arm64-boot-cpupools:
>    extends: .gcc-arm64-build
>    variables:
> @@ -594,6 +603,13 @@ alpine-3.12-gcc-arm64-boot-cpupools:
>      EXTRA_XEN_CONFIG: |
>        CONFIG_BOOT_TIME_CPUPOOLS=y
>  
> +alpine-3.12-gcc-debug-arm64-boot-cpupools:
> +  extends: .gcc-arm64-build-debug
> +  variables:
> +    CONTAINER: alpine:3.12-arm64v8
> +    EXTRA_XEN_CONFIG: |
> +      CONFIG_BOOT_TIME_CPUPOOLS=y
> +
>  ## Test artifacts common
>  
>  .test-jobs-artifact-common:
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 4f96e6e322de..1b51030c6175 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -44,6 +44,25 @@ qemu-alpine-arm64-gcc:
>    tags:
>      - arm64
>  
> +qemu-alpine-arm64-gcc-debug:
> +  extends: .test-jobs-common
> +  variables:
> +    CONTAINER: debian:unstable-arm64v8
> +  script:
> +    - ./automation/scripts/qemu-alpine-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
> +  needs:
> +    - alpine-3.12-gcc-debug-arm64
> +    - alpine-3.12-arm64-rootfs-export
> +    - kernel-5.19-arm64-export
> +    - qemu-system-aarch64-6.0.0-arm64-export
> +  artifacts:
> +    paths:
> +      - smoke.serial
> +      - '*.log'
> +    when: always
> +  tags:
> +    - arm64
> +
>  qemu-alpine-x86_64-gcc:
>    extends: .test-jobs-common
>    variables:
> @@ -81,6 +100,25 @@ qemu-smoke-arm64-gcc:
>    tags:
>      - arm64
>  
> +qemu-smoke-arm64-gcc-debug:
> +  extends: .test-jobs-common
> +  variables:
> +    CONTAINER: debian:unstable-arm64v8
> +  script:
> +    - ./automation/scripts/qemu-smoke-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
> +  needs:
> +    - alpine-3.12-gcc-debug-arm64
> +    - alpine-3.12-arm64-rootfs-export
> +    - kernel-5.19-arm64-export
> +    - qemu-system-aarch64-6.0.0-arm64-export
> +  artifacts:
> +    paths:
> +      - smoke.serial
> +      - '*.log'
> +    when: always
> +  tags:
> +    - arm64
> +
>  qemu-smoke-arm64-gcc-staticmem:
>    extends: .test-jobs-common
>    variables:
> @@ -100,6 +138,25 @@ qemu-smoke-arm64-gcc-staticmem:
>    tags:
>      - arm64
>  
> +qemu-smoke-arm64-gcc-debug-staticmem:
> +  extends: .test-jobs-common
> +  variables:
> +    CONTAINER: debian:unstable-arm64v8
> +  script:
> +    - ./automation/scripts/qemu-smoke-arm64.sh static-mem 2>&1 | tee qemu-smoke-arm64.log
> +  needs:
> +    - alpine-3.12-gcc-debug-arm64-staticmem
> +    - alpine-3.12-arm64-rootfs-export
> +    - kernel-5.19-arm64-export
> +    - qemu-system-aarch64-6.0.0-arm64-export
> +  artifacts:
> +    paths:
> +      - smoke.serial
> +      - '*.log'
> +    when: always
> +  tags:
> +    - arm64
> +
>  qemu-smoke-arm64-gcc-boot-cpupools:
>    extends: .test-jobs-common
>    variables:
> @@ -119,6 +176,25 @@ qemu-smoke-arm64-gcc-boot-cpupools:
>    tags:
>      - arm64
>  
> +qemu-smoke-arm64-gcc-debug-boot-cpupools:
> +  extends: .test-jobs-common
> +  variables:
> +    CONTAINER: debian:unstable-arm64v8
> +  script:
> +    - ./automation/scripts/qemu-smoke-arm64.sh boot-cpupools 2>&1 | tee qemu-smoke-arm64.log
> +  needs:
> +    - alpine-3.12-gcc-debug-arm64-boot-cpupools
> +    - alpine-3.12-arm64-rootfs-export
> +    - kernel-5.19-arm64-export
> +    - qemu-system-aarch64-6.0.0-arm64-export
> +  artifacts:
> +    paths:
> +      - smoke.serial
> +      - '*.log'
> +    when: always
> +  tags:
> +    - arm64
> +
>  qemu-smoke-arm32-gcc:
>    extends: .test-jobs-common
>    variables:
> @@ -136,6 +212,23 @@ qemu-smoke-arm32-gcc:
>    tags:
>      - arm64
>  
> +qemu-smoke-arm32-gcc-debug:
> +  extends: .test-jobs-common
> +  variables:
> +    CONTAINER: debian:unstable-arm64v8
> +  script:
> +    - ./automation/scripts/qemu-smoke-arm32.sh 2>&1 | tee qemu-smoke-arm32.log
> +  needs:
> +    - debian-unstable-gcc-arm32-debug
> +    - qemu-system-aarch64-6.0.0-arm32-export
> +  artifacts:
> +    paths:
> +      - smoke.serial
> +      - '*.log'
> +    when: always
> +  tags:
> +    - arm64
> +
>  qemu-smoke-x86-64-gcc:
>    extends: .test-jobs-common
>    variables:
> diff --git a/automation/scripts/qemu-smoke-arm64.sh b/automation/scripts/qemu-smoke-arm64.sh
> index f803835779f4..dea26c6c0a8f 100755
> --- a/automation/scripts/qemu-smoke-arm64.sh
> +++ b/automation/scripts/qemu-smoke-arm64.sh
> @@ -52,7 +52,7 @@ curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
>  ./binaries/qemu-system-aarch64 \
>     -machine virtualization=true \
>     -cpu cortex-a57 -machine type=virt \
> -   -m 1024 -smp 2 -display none \
> +   -m 2048 -smp 2 -display none \
>     -machine dumpdtb=binaries/virt-gicv2.dtb
>  
>  # XXX disable pl061 to avoid Linux crash
> @@ -117,7 +117,7 @@ cd ..
>  
>  # ImageBuilder
>  echo 'MEMORY_START="0x40000000"
> -MEMORY_END="0x80000000"
> +MEMORY_END="0xC0000000"
>  
>  DEVICE_TREE="virt-gicv2.dtb"
>  XEN="xen"
> @@ -158,7 +158,7 @@ timeout -k 1 240 \
>  ./binaries/qemu-system-aarch64 \
>      -machine virtualization=true \
>      -cpu cortex-a57 -machine type=virt \
> -    -m 1024 -monitor none -serial stdio \
> +    -m 2048 -monitor none -serial stdio \
>      -smp 2 \
>      -no-reboot \
>      -device virtio-net-pci,netdev=n0 \

The changes to qemu-smoke-arm64.sh make sense, but could you move them
to a separate patch in case we need to do any backports?

Also I would change MEMORY_END to 0xC0000000 in qemu-alpine-arm64.sh too
for uniformity.

