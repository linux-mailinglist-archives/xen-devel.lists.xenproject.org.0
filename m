Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EED5B2A5E
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 01:30:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403706.645902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWQyF-0005vd-Kp; Thu, 08 Sep 2022 23:30:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403706.645902; Thu, 08 Sep 2022 23:30:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWQyF-0005rI-G4; Thu, 08 Sep 2022 23:30:07 +0000
Received: by outflank-mailman (input) for mailman id 403706;
 Thu, 08 Sep 2022 23:30:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5KOk=ZL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oWQyD-0004Yv-4d
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 23:30:05 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29e82542-2fce-11ed-a31c-8f8a9ae3403f;
 Fri, 09 Sep 2022 01:30:04 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 959F661E2C;
 Thu,  8 Sep 2022 23:30:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FC85C433D6;
 Thu,  8 Sep 2022 23:30:01 +0000 (UTC)
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
X-Inumbo-ID: 29e82542-2fce-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662679802;
	bh=L1YSSix3xXj61NlJxyWdGWcNtiMESTR/GuUUP6tSWU8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pwj1E2sUmHs82nLkK9hZLtj/y/vHsNlzID01d0MH/DAKxCXu9hn+W8rhRK2TAfi+o
	 bsFGOGSsTU7IvhSKGRRudoglpVG/NxkB6qGFqQLLU/7QMgbxOBU0B9x+fvyCGhFx5t
	 OM3BJyAttic3MtNo3AWSSL0ieGU1ThE8igczokoXM9Ot0nbUmYvN0ChYSA0icXZoYn
	 zXD6JLvFVRB2k0mrof2enQHL+5rsL6obOXOJu9oCQD3xBRmaQE/CZBRcAFBWftZk5g
	 mAzYEkk78howHo0UOFvWwsJe3dsPl87XR4fcQfGZWGMEZ4MCVKj6q2AThX63m8jNIq
	 Ai59AgGoGhyUA==
Date: Thu, 8 Sep 2022 16:30:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [for-4.17 v2 3/3] automation: Add a new job for testing boot
 time cpupools on arm64
In-Reply-To: <20220908092230.21421-4-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2209081629510.157835@ubuntu-linux-20-04-desktop>
References: <20220908092230.21421-1-michal.orzel@amd.com> <20220908092230.21421-4-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 8 Sep 2022, Michal Orzel wrote:
> Add a new test job qemu-smoke-arm64-gcc-boot-cpupools that will execute
> script qemu-smoke-arm64.sh to test boot time cpupools feature.
> Enable CONFIG_BOOT_TIME_CPUPOOLS for the arm64 build and add a new test
> case in qemu-smoke-arm64.sh that if selected will make use of the
> ImageBuilder feature to create cpupool with cpu@1, null scheduler and
> assign it to domU. Add a check in dom0 xen.start to see if domU is
> assigned a Pool-1 with null scheduler.
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

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
> - use ImageBuilder feature to create boot-time cpupools
> - also check if the scheduler is set up properly
> ---
>  automation/gitlab-ci/test.yaml         | 19 ++++++++++++++
>  automation/scripts/build               |  3 ++-
>  automation/scripts/qemu-smoke-arm64.sh | 36 +++++++++++++++++++-------
>  3 files changed, 48 insertions(+), 10 deletions(-)
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
> index 7ac96027760d..f803835779f4 100755
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
> @@ -26,6 +28,16 @@ fi
>  "
>  fi
>  
> +if [[ "${test_variant}" == "boot-cpupools" ]]; then
> +    # Check if domU0 (id=1) is assigned to Pool-1 with null scheduler
> +    passed="${test_variant} test passed"
> +    dom0_check="
> +if xl list -c 1 | grep -q Pool-1 && xl cpupool-list Pool-1 | grep -q Pool-1; then
> +    echo ${passed}
> +fi
> +"
> +fi
> +
>  export DEBIAN_FRONTENT=noninteractive
>  apt-get -qy update
>  apt-get -qy install --no-install-recommends u-boot-qemu \
> @@ -42,11 +54,9 @@ curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
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
>  
>  # Busybox
>  mkdir -p initrd
> @@ -66,7 +76,7 @@ echo "#!/bin/sh
>  mount -t proc proc /proc
>  mount -t sysfs sysfs /sys
>  mount -t devtmpfs devtmpfs /dev
> -${check}
> +${domU_check}
>  /bin/sh" > initrd/init
>  chmod +x initrd/init
>  cd initrd
> @@ -98,6 +108,7 @@ ifconfig xenbr0 up
>  ifconfig xenbr0 192.168.0.1
>  
>  xl network-attach 1 type=vif
> +${dom0_check}
>  " > etc/local.d/xen.start
>  chmod +x etc/local.d/xen.start
>  echo "rc_verbose=yes" >> etc/rc.conf
> @@ -127,6 +138,13 @@ if [[ "${test_variant}" == "static-mem" ]]; then
>      echo -e "\nDOMU_STATIC_MEM[0]=\"0x${domu_base} 0x${domu_size}\"" >> binaries/config
>  fi
>  
> +if [[ "${test_variant}" == "boot-cpupools" ]]; then
> +    echo '
> +CPUPOOL[0]="cpu@1 null"
> +DOMU_CPUPOOL[0]=0
> +NUM_CPUPOOLS=1' >> binaries/config
> +fi
> +
>  rm -rf imagebuilder
>  git clone https://gitlab.com/ViryaOS/imagebuilder
>  bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/config
> @@ -148,5 +166,5 @@ timeout -k 1 240 \
>      -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin |& tee smoke.serial
>  
>  set -e
> -(grep -q "^Welcome to Alpine Linux" smoke.serial && grep -q "DOM1: ${passed}" smoke.serial) || exit 1
> +(grep -q "^Welcome to Alpine Linux" smoke.serial && grep -q "${passed}" smoke.serial) || exit 1
>  exit 0
> -- 
> 2.25.1
> 

