Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 028F35ABB65
	for <lists+xen-devel@lfdr.de>; Sat,  3 Sep 2022 01:49:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397998.638746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oUGPW-0000s3-Hd; Fri, 02 Sep 2022 23:49:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397998.638746; Fri, 02 Sep 2022 23:49:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oUGPW-0000p4-EN; Fri, 02 Sep 2022 23:49:18 +0000
Received: by outflank-mailman (input) for mailman id 397998;
 Fri, 02 Sep 2022 23:49:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WoFT=ZF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oUGPU-0000ow-M8
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 23:49:16 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9a55b32-2b19-11ed-82f2-63bd783d45fa;
 Sat, 03 Sep 2022 01:49:15 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CB30061FFA;
 Fri,  2 Sep 2022 23:49:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0E7FC433C1;
 Fri,  2 Sep 2022 23:49:12 +0000 (UTC)
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
X-Inumbo-ID: d9a55b32-2b19-11ed-82f2-63bd783d45fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662162553;
	bh=ik3thNg7dTQ8AhGyWYMWMEz36RuPncLzi0M44FIfYkY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gB+dlJEEuAFGKzH8+7znd9dDQbx34URZ6ZWqfMwK87BesCr4V6aFW5wzcwQGZeXsw
	 XoDNEz3Z83YYR3M9aRFgXCatEIj42RPfSopSKY5ghgMWben4ZyRc2NJiOk4jpVKgEm
	 6u5+z4Sld1cF/u/vIR9YyRGb9JqdIVs0kep0nzS5Lz22+sTfOP3Ed6f+ZGGvR2MGfI
	 4X6oTntYVHpmhG+MVis/iCR9lqRmwHkJeUazBjS5V733DA22EznC5/GTqwErO+DyWq
	 bDYqNjb38uri6KvwiTrRZHqw3Qw9aVtdXMGbTNgiIJx3oQYL3QKrqElUCnvgM1f3d1
	 /rb517pL7t8UA==
Date: Fri, 2 Sep 2022 16:49:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [for-4.17 3/3] automation: Add a new job for testing boot time
 cpupools on arm64
In-Reply-To: <20220902070905.1262-4-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2209021645160.3931@ubuntu-linux-20-04-desktop>
References: <20220902070905.1262-1-michal.orzel@amd.com> <20220902070905.1262-4-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 2 Sep 2022, Michal Orzel wrote:
> Add a new test job qemu-smoke-arm64-gcc-boot-cpupools that will execute
> script qemu-smoke-arm64.sh to test boot time cpupools feature.
> Enable CONFIG_BOOT_TIME_CPUPOOLS for the arm64 build and add a new test
> case in qemu-smoke-arm64.sh that if selected will:
>  - create a device tree cpupool node with cpu@1
>  - assign created cpupool to domU0
>  - add a check in dom0 xen.start to see if domU is assigned a Pool-1
> 
> Take the opportunity to refactor the qemu-smoke-arm64.sh script as
> follows:
>  - use domU_check to store the test's commands to be run from domU
>  - use dom0_check to store the test's commands to be run from dom0
>  - use fdtput instead of sed to perform dtb modifications
>  - use more meaningful messages for "passed" variable. This way we can
>    grep for messages reported either by domU or dom0 and get rid of
>    assumption that tests can only be run from domU
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
>  automation/gitlab-ci/test.yaml         | 19 +++++++++++++++
>  automation/scripts/build               |  3 ++-
>  automation/scripts/qemu-smoke-arm64.sh | 33 +++++++++++++++++++-------
>  3 files changed, 45 insertions(+), 10 deletions(-)
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 07209820b474..d899b3bdbf7a 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -100,6 +100,25 @@ qemu-smoke-arm64-gcc-staticmem:
>    tags:
>      - arm64
>  
> +qemu-smoke-arm64-gcc-boot-cpupools:
> +  extends: .test-jobs-common
> +  variables:
> +    CONTAINER: debian:unstable-arm64v8
> +  script:
> +    - ./automation/scripts/qemu-smoke-arm64.sh boot-cpupools 2>&1 | tee qemu-smoke-arm64.log
> +  needs:
> +    - alpine-3.12-gcc-arm64
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
> diff --git a/automation/scripts/build b/automation/scripts/build
> index 2b9f2d2b541a..2f15ab3198e6 100755
> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -19,7 +19,8 @@ else
>          echo "
>  CONFIG_EXPERT=y
>  CONFIG_UNSUPPORTED=y
> -CONFIG_STATIC_MEMORY=y" > xen/.config
> +CONFIG_STATIC_MEMORY=y
> +CONFIG_BOOT_TIME_CPUPOOLS=y" > xen/.config
>          make -j$(nproc) -C xen olddefconfig
>      else
>          make -j$(nproc) -C xen defconfig
> diff --git a/automation/scripts/qemu-smoke-arm64.sh b/automation/scripts/qemu-smoke-arm64.sh
> index 7ac96027760d..c2184850293c 100755
> --- a/automation/scripts/qemu-smoke-arm64.sh
> +++ b/automation/scripts/qemu-smoke-arm64.sh
> @@ -4,20 +4,22 @@ set -ex
>  
>  test_variant=$1
>  
> -passed="passed"
> -check="
> +if [ -z "${test_variant}" ]; then
> +    passed="ping test passed"
> +    domU_check="
>  until ifconfig eth0 192.168.0.2 &> /dev/null && ping -c 10 192.168.0.1; do
>      sleep 30
>  done
>  echo \"${passed}\"
>  "
> +fi
>  
>  if [[ "${test_variant}" == "static-mem" ]]; then
>      # Memory range that is statically allocated to DOM1
>      domu_base="50000000"
>      domu_size="10000000"
>      passed="${test_variant} test passed"
> -    check="
> +    domU_check="
>  current=\$(hexdump -e '16/1 \"%02x\"' /proc/device-tree/memory@${domu_base}/reg 2>/dev/null)
>  expected=$(printf \"%016x%016x\" 0x${domu_base} 0x${domu_size})
>  if [[ \"\${expected}\" == \"\${current}\" ]]; then
> @@ -42,11 +44,23 @@ curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
>     -cpu cortex-a57 -machine type=virt \
>     -m 1024 -smp 2 -display none \
>     -machine dumpdtb=binaries/virt-gicv2.dtb
> -# XXX disable pl061 to avoid Linux crash
> -dtc -I dtb -O dts binaries/virt-gicv2.dtb > binaries/virt-gicv2.dts
> -sed 's/compatible = "arm,pl061.*/status = "disabled";/g' binaries/virt-gicv2.dts > binaries/virt-gicv2-edited.dts
> -dtc -I dts -O dtb binaries/virt-gicv2-edited.dts > binaries/virt-gicv2.dtb
>  
> +# XXX disable pl061 to avoid Linux crash
> +fdtput binaries/virt-gicv2.dtb -p -t s /pl061@9030000 status disabled

Currently this test fails with:

+ fdtput binaries/virt-gicv2.dtb -p -t s /pl061@9030000 status disabled
+ [[ boot-cpupools == \b\o\o\t\-\c\p\u\p\o\o\l\s ]]
++ fdtget binaries/virt-gicv2.dtb -t x /cpus/cpu@1 phandle
Error at 'phandle': FDT_ERR_NOTFOUND

Given my other comment below, I would leave this code as is.


> +if [[ "${test_variant}" == "boot-cpupools" ]]; then
> +    # Create cpupool node and assign it to domU0
> +    cpu_phandle="$(fdtget binaries/virt-gicv2.dtb -t x /cpus/cpu@1 phandle)"
> +    cpupool_phandle="0xffffff"
> +    fdtput binaries/virt-gicv2.dtb -p -t s /chosen/cpupool compatible xen,cpupool
> +    fdtput binaries/virt-gicv2.dtb -p -t x /chosen/cpupool cpupool-cpus $cpu_phandle
> +    fdtput binaries/virt-gicv2.dtb -p -t x /chosen/cpupool phandle $cpupool_phandle
> +    fdtput binaries/virt-gicv2.dtb -p -t x /chosen/domU0 domain-cpupool $cpupool_phandle
> +
> +    # Check if domU0 (id=1) is assigned to Pool-1
> +    passed="${test_variant} test passed"
> +    dom0_check="if xl list -c 1 | grep -q Pool-1; then echo ${passed}; fi"
> +fi

I would prefer to keep the device tree editing here to a minimum and
instead add boot-cpupool support in ImageBuilder and add CPUPOOL* config
options to the existing config file for ImageBuilder created in this
file below. This way, we keep this test cleaner and we help more the
user by proving a way to set boot-cpupools more easily in general, also
useful outside gitlab-ci.

