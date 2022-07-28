Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BE058367D
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 03:48:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376551.609411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGscL-0005eo-4b; Thu, 28 Jul 2022 01:47:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376551.609411; Thu, 28 Jul 2022 01:47:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGscL-0005c3-1V; Thu, 28 Jul 2022 01:47:13 +0000
Received: by outflank-mailman (input) for mailman id 376551;
 Thu, 28 Jul 2022 01:47:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M61b=YB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oGscJ-0005bx-9i
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 01:47:11 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3030e8ce-0e17-11ed-924f-1f966e50362f;
 Thu, 28 Jul 2022 03:47:08 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BA629617A9;
 Thu, 28 Jul 2022 01:47:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0CF3C433C1;
 Thu, 28 Jul 2022 01:47:05 +0000 (UTC)
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
X-Inumbo-ID: 3030e8ce-0e17-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658972826;
	bh=4BuM9UUBrMzehpctv26xVQjo1BpaMJnIU2W3i/gIt10=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=O8CzyyynWplGxjNpvy57PgQFR90c0XzxuCrm9rtX1WUozmXygsXP+IiU6SjYSAiPe
	 9IdU9p5ZcHzxziPuv2ov782sNt1hJm49QvNtjcBxKlSExc8BorVzNi4RnM5Imn8u2W
	 L+I7b3LaTNhWA9mJF7+5aLIEeD++ygYA4osPRAsMvqL817Pe1Oo886PeV9FJbbycLi
	 9TmSFpcCiqXjiQKIfuISfqsEJKsvCNJPGzLnQ71WmbCZgOQvweyBRIb82Ar0w5K516
	 dHivqALP494Lm3nSrZ1shd/rda2Bkoz1MwmRw8RGV0LsXNtVgT/nK7B6X5dyMpbzod
	 wPqAPMfvT75nQ==
Date: Wed, 27 Jul 2022 18:47:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Xenia Ragiadakou <burzalodowa@gmail.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 2/2] automation: arm64: Create a test job for testing
 static allocation on qemu
In-Reply-To: <20220726190701.1048824-3-burzalodowa@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2207271836220.4648@ubuntu-linux-20-04-desktop>
References: <20220726190701.1048824-1-burzalodowa@gmail.com> <20220726190701.1048824-3-burzalodowa@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 26 Jul 2022, Xenia Ragiadakou wrote:
> Enable CONFIG_STATIC_MEMORY in the existing arm64 build.
> 
> Create a new test job, called qemu-smoke-arm64-gcc-staticmem.
> 
> Adjust qemu-smoke-arm64.sh script to accomodate the static memory test as a
> new test variant. The test variant is determined based on the first argument
> passed to the script. For testing static memory, the argument is 'static-mem'.
> 
> The test configures DOM1 with a static memory region and adds a check in the
> init script.
> The check consists in comparing the contents of the /proc/device-tree
> memory entry with the static memory range with which DOM1 was configured.
> If the memory layout is correct, a message gets printed by DOM1.
> 
> At the end of the qemu run, the script searches for the specific message
> in the logs and fails if not found.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

This looks good, I only have a couple of minor comments about code style
and a small suggestion for improvements.


> ---
> 
> Changes in v2:
> - enable CONFIG_STATIC_MEMORY for all arm64 builds
> - use the existing qemu-smoke-arm64.sh with an argument passed for
>   distinguishing between tests, instead of creating a new script
> - test does not rely on kernel logs but prints a message itself on success
> - remove the part that enables custom configs for arm64 builds
> - add comments
> - adapt commit message
> 
>  automation/gitlab-ci/test.yaml         | 18 +++++++++++
>  automation/scripts/build               |  8 +++++
>  automation/scripts/qemu-smoke-arm64.sh | 42 ++++++++++++++++++++++++--
>  3 files changed, 65 insertions(+), 3 deletions(-)
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 26bdbcc3ea..6f9f64a8da 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -80,6 +80,24 @@ qemu-smoke-arm64-gcc:
>    tags:
>      - arm64
>  
> +qemu-smoke-arm64-gcc-staticmem:
> +  extends: .test-jobs-common
> +  variables:
> +    CONTAINER: debian:unstable-arm64v8
> +  script:
> +    - ./automation/scripts/qemu-smoke-arm64.sh static-mem 2>&1 | tee qemu-smoke-arm64.log
> +  needs:
> +    - debian-unstable-gcc-arm64
> +    - kernel-5.9.9-arm64-export
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
> diff --git a/automation/scripts/build b/automation/scripts/build
> index 21b3bc57c8..1941763315 100755
> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -18,6 +18,14 @@ else
>      make -j$(nproc) -C xen defconfig
>  fi
>  
> +if [[ "${XEN_TARGET_ARCH}" = "arm64" ]]; then
> +    echo "
> +CONFIG_EXPERT=y
> +CONFIG_UNSUPPORTED=y
> +CONFIG_STATIC_MEMORY=y" > xen/.config
> +    make -j$(nproc) -C xen olddefconfig
> +fi

I think we should do this within the not "${RANDCONFIG}" == "y" case
above to avoid calling make defconfig needlessly.


> +
>  # Save the config file before building because build failure causes the script
>  # to exit early -- bash is invoked with -e.
>  cp xen/.config xen-config
> diff --git a/automation/scripts/qemu-smoke-arm64.sh b/automation/scripts/qemu-smoke-arm64.sh
> index 53086a5ac7..48513a7832 100755
> --- a/automation/scripts/qemu-smoke-arm64.sh
> +++ b/automation/scripts/qemu-smoke-arm64.sh
> @@ -2,6 +2,15 @@
>  
>  set -ex
>  
> +test_variant=$1
> +
> +if [[ "${test_variant}" == "static-mem" ]]; then
> +    # Memory range that is statically allocated to DOM1
> +    domu_base="50000000"
> +    domu_size="10000000"
> +    passed="static-mem test passed"
> +fi

I think we should set passed to "BusyBox" for the regular case so that
we don't need an if/else at the bottom to check for passed


>  # Install QEMU
>  export DEBIAN_FRONTENT=noninteractive
>  apt-get -qy update
> @@ -42,8 +51,22 @@ echo "#!/bin/sh
>  
>  mount -t proc proc /proc
>  mount -t sysfs sysfs /sys
> -mount -t devtmpfs devtmpfs /dev
> -/bin/sh" > initrd/init
> +mount -t devtmpfs devtmpfs /dev" > initrd/init
> +
> +if [[ "${test_variant}" == "static-mem" ]]; then
> +    # Verify that DOM1 booted with the expected memory layout by checking the
> +    # contents of the memory entry in /proc/device-tree.
> +    echo "
> +current=\$(hexdump -e '16/1 \"%02x\"' /proc/device-tree/memory@${domu_base}/reg 2>/dev/null)
> +expected=\"$(printf \"%016x%016x\" 0x${domu_base} 0x${domu_size})\"

This works but it is hard to read. I am suggesting the follow to improve
readability:

---
echo "#!/bin/sh

mount -t proc proc /proc
mount -t sysfs sysfs /sys
mount -t devtmpfs devtmpfs /dev

current=\$(hexdump -e '16/1 \"%02x\"' /proc/device-tree/memory@${domu_base}/reg 2>/dev/null)
expected=\"$(printf \"%016x%016x\" 0x${domu_base} 0x${domu_size})\"
if [[ ${expected} == \"\${current}\" ]]; then
    echo \"${passed}\"
fi
" > initrd/init
---

I know that it is going to be a couple of extra instructions on the
non-static case to run inside QEMU but the advantage is that the init
script is identical between the two cases which makes the code easier.




> +if [[ ${expected} == \"\${current}\" ]]; then
> +	echo \"${passed}\"
> +fi" >> initrd/init
> +fi
> +
> +echo "
> +/bin/sh" >> initrd/init

Is this needed?


>  chmod +x initrd/init
>  cd initrd
>  find . | cpio --create --format='newc' | gzip > ../binaries/initrd
> @@ -68,6 +91,12 @@ DOMU_MEM[0]="256"
>  LOAD_CMD="tftpb"
>  UBOOT_SOURCE="boot.source"
>  UBOOT_SCRIPT="boot.scr"' > binaries/config
> +
> +if [[ "${test_variant}" == "static-mem" ]]; then
> +    echo "
> +DOMU_STATIC_MEM[0]=\"0x${domu_base} 0x${domu_size}\"" >> binaries/config

please keep it on a single line for readability (even if it will push it
above 80 chars):

    echo "DOMU_STATIC_MEM[0]=\"0x${domu_base} 0x${domu_size}\"" >> binaries/config


> +fi
> +
>  rm -rf imagebuilder
>  git clone https://gitlab.com/ViryaOS/imagebuilder
>  bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/config
> @@ -89,5 +118,12 @@ timeout -k 1 240 \
>      -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin |& tee smoke.serial
>  
>  set -e
> -(grep -q "^BusyBox" smoke.serial && grep -q "DOM1: BusyBox" smoke.serial) || exit 1
> +grep -q "^BusyBox" smoke.serial || exit 1
> +
> +if [[ "${test_variant}" == "static-mem" ]]; then
> +    grep -q "DOM1: ${passed}" smoke.serial || exit 1
> +else
> +    grep -q "DOM1: BusyBox" smoke.serial || exit 1
> +fi

No need for this if/else/fi if we set $passed in both cases at the top

