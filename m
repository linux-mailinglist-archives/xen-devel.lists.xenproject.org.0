Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B3096543F
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 02:49:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786165.1195711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjpoL-0002Lc-Im; Fri, 30 Aug 2024 00:48:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786165.1195711; Fri, 30 Aug 2024 00:48:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjpoL-0002Im-Fh; Fri, 30 Aug 2024 00:48:21 +0000
Received: by outflank-mailman (input) for mailman id 786165;
 Fri, 30 Aug 2024 00:48:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D3iD=P5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sjpoK-000227-1L
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 00:48:20 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8bca3b53-6669-11ef-99a0-01e77a169b0f;
 Fri, 30 Aug 2024 02:48:18 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 011FFA43669;
 Fri, 30 Aug 2024 00:48:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD4A1C4CEC1;
 Fri, 30 Aug 2024 00:48:15 +0000 (UTC)
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
X-Inumbo-ID: 8bca3b53-6669-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724978896;
	bh=FhD1Iy6+epxCN6P5KzH6rco0gWQog9agnhpXvjrDO+0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YnZsKixc1Q6n2LtbU+2wVJLKbEkarlzbsvX7XkyOuft44TzNhLN0QBJ0O8bkVGmQ7
	 tzDlmfbCsRsMV6bVykxJy0rg+mFDNBgbPeKslHg9OEi2U7I4Y2NwjvSHr6D4hf/mq/
	 p52f8bCH6HYrso5sGbIcImxSlTprgwT1ABogTNbGAljlmg/rl/NaZqwi9LPuH8oBay
	 ISFGsOtJtJBYv3f8n7GUn7h+0gZgt2EvI36FllPMnDX6wYW+WbDWcauVWx4IM0GH/7
	 dzXnxMaOVZMt84RRrIdD1GPovCesUqi9DxzcmTGrPpTmdU2RKlz8/s5DZeItnPv9Eh
	 d3bCm8Bsysttw==
Date: Thu, 29 Aug 2024 17:48:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Victor Lira <victorm.lira@amd.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 2/2] automation: use expect utility in xilinx tests
In-Reply-To: <5bbea0bbf22b409dd047b93e2e8cebcab61d14d5.1724967614.git.victorm.lira@amd.com>
Message-ID: <alpine.DEB.2.22.394.2408291748070.53815@ubuntu-linux-20-04-desktop>
References: <cover.1724967614.git.victorm.lira@amd.com> <5bbea0bbf22b409dd047b93e2e8cebcab61d14d5.1724967614.git.victorm.lira@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 29 Aug 2024, victorm.lira@amd.com wrote:
> From: Victor Lira <victorm.lira@amd.com>
> 
> Fixes: 95764a0817a5 (automation: update xilinx test scripts (tty))
> This patch introduced a CI failure due to a timeout in xilinx-x86_64 test.
> 
> Change xilinx-x86_64 and xilinx-arm64 scripts to use "expect" utility
> to determine test result and allow early exit from tests.
> Add "expect" to xilinx container environment (dockerfile).
> Rename references to "QEMU" in "qemu-key.exp" expect script to "TEST" to be
> used by both QEMU and hardware tests.
> 
> Signed-off-by: Victor Lira <victorm.lira@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Julien Grall <julien@xen.org>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Michal Orzel <michal.orzel@amd.com>
> Cc: xen-devel@lists.xenproject.org
> ---
>  .../build/ubuntu/xenial-xilinx.dockerfile     |  1 +
>  automation/gitlab-ci/test.yaml                |  2 ++
>  .../scripts/{qemu-key.exp => console.exp}     |  8 +++----
>  automation/scripts/qemu-alpine-x86_64.sh      |  6 ++---
>  automation/scripts/qemu-smoke-dom0-arm32.sh   |  6 ++---
>  automation/scripts/qemu-smoke-dom0-arm64.sh   |  6 ++---
>  .../scripts/qemu-smoke-dom0less-arm32.sh      |  6 ++---
>  .../scripts/qemu-smoke-dom0less-arm64.sh      |  6 ++---
>  automation/scripts/qemu-smoke-ppc64le.sh      |  6 ++---
>  automation/scripts/qemu-smoke-riscv64.sh      |  6 ++---
>  automation/scripts/qemu-smoke-x86-64.sh       |  6 ++---
>  automation/scripts/qemu-xtf-dom0less-arm64.sh |  6 ++---
>  .../scripts/xilinx-smoke-dom0-x86_64.sh       | 22 +++++++++----------
>  .../scripts/xilinx-smoke-dom0less-arm64.sh    | 19 ++++++++--------
>  14 files changed, 54 insertions(+), 52 deletions(-)
>  rename automation/scripts/{qemu-key.exp => console.exp} (83%)
> 
> diff --git a/automation/build/ubuntu/xenial-xilinx.dockerfile b/automation/build/ubuntu/xenial-xilinx.dockerfile
> index f03d62e8bd3f..6107d8b7711f 100644
> --- a/automation/build/ubuntu/xenial-xilinx.dockerfile
> +++ b/automation/build/ubuntu/xenial-xilinx.dockerfile
> @@ -20,6 +20,7 @@ RUN apt-get update && \
>          git \
>          gzip \
>          file \
> +        expect \
>          && \
>          apt-get autoremove -y && \
>          apt-get clean && \
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 3b339f387fbe..e3ebe3745994 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -84,6 +84,7 @@
>    variables:
>      CONTAINER: ubuntu:xenial-xilinx
>      LOGFILE: qemu-smoke-xilinx.log
> +    TEST_TIMEOUT: 120
>    artifacts:
>      paths:
>        - smoke.serial
> @@ -103,6 +104,7 @@
>      LOGFILE: xilinx-smoke-x86_64.log
>      XEN_CMD_CONSOLE: "console=com2 com2=115200,8n1,0x2F8,4"
>      TEST_BOARD: "crater"
> +    TEST_TIMEOUT: 500
>    artifacts:
>      paths:
>        - smoke.serial
> diff --git a/automation/scripts/qemu-key.exp b/automation/scripts/console.exp
> similarity index 83%
> rename from automation/scripts/qemu-key.exp
> rename to automation/scripts/console.exp
> index 66c416483146..f538aa6bd06c 100755
> --- a/automation/scripts/qemu-key.exp
> +++ b/automation/scripts/console.exp
> @@ -1,16 +1,16 @@
>  #!/usr/bin/expect -f
> 
> -if {[info exists env(QEMU_TIMEOUT)]} {
> -    set timeout $env(QEMU_TIMEOUT)
> +if {[info exists env(TEST_TIMEOUT)]} {
> +    set timeout $env(TEST_TIMEOUT)
>  } else {
>      set timeout 1500
>  }
> 
> -log_file -a $env(QEMU_LOG)
> +log_file -a $env(TEST_LOG)
> 
>  match_max 10000
> 
> -eval spawn $env(QEMU_CMD)
> +eval spawn $env(TEST_CMD)
> 
>  expect_after {
>      -re "(.*)\r" {
> diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
> index 93914c41bc24..1ff689b577e3 100755
> --- a/automation/scripts/qemu-alpine-x86_64.sh
> +++ b/automation/scripts/qemu-alpine-x86_64.sh
> @@ -76,7 +76,7 @@ EOF
> 
>  # Run the test
>  rm -f smoke.serial
> -export QEMU_CMD="qemu-system-x86_64 \
> +export TEST_CMD="qemu-system-x86_64 \
>      -cpu qemu64,+svm \
>      -m 2G -smp 2 \
>      -monitor none -serial stdio \
> @@ -84,8 +84,8 @@ export QEMU_CMD="qemu-system-x86_64 \
>      -device virtio-net-pci,netdev=n0 \
>      -netdev user,id=n0,tftp=binaries,bootfile=/pxelinux.0"
> 
> -export QEMU_LOG="smoke.serial"
> +export TEST_LOG="smoke.serial"
>  export LOG_MSG="Domain-0"
>  export PASSED="BusyBox"
> 
> -./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
> +./automation/scripts/console.exp | sed 's/\r\+$//'
> diff --git a/automation/scripts/qemu-smoke-dom0-arm32.sh b/automation/scripts/qemu-smoke-dom0-arm32.sh
> index 7c282eff3a58..e1cd83880928 100755
> --- a/automation/scripts/qemu-smoke-dom0-arm32.sh
> +++ b/automation/scripts/qemu-smoke-dom0-arm32.sh
> @@ -77,7 +77,7 @@ git clone --depth 1 https://gitlab.com/xen-project/imagebuilder.git
>  bash imagebuilder/scripts/uboot-script-gen -t tftp -d . -c config
> 
>  rm -f ${serial_log}
> -export QEMU_CMD="./qemu-system-arm \
> +export TEST_CMD="./qemu-system-arm \
>     -machine virt \
>     -machine virtualization=true \
>     -smp 4 \
> @@ -91,8 +91,8 @@ export QEMU_CMD="./qemu-system-arm \
>     -bios /usr/lib/u-boot/qemu_arm/u-boot.bin"
> 
>  export UBOOT_CMD="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"
> -export QEMU_LOG="${serial_log}"
> +export TEST_LOG="${serial_log}"
>  export LOG_MSG="Domain-0"
>  export PASSED="/ #"
> 
> -../automation/scripts/qemu-key.exp | sed 's/\r\+$//'
> +../automation/scripts/console.exp | sed 's/\r\+$//'
> diff --git a/automation/scripts/qemu-smoke-dom0-arm64.sh b/automation/scripts/qemu-smoke-dom0-arm64.sh
> index 81f210f7f50e..4d22a124df11 100755
> --- a/automation/scripts/qemu-smoke-dom0-arm64.sh
> +++ b/automation/scripts/qemu-smoke-dom0-arm64.sh
> @@ -93,7 +93,7 @@ bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/conf
> 
>  # Run the test
>  rm -f smoke.serial
> -export QEMU_CMD="./binaries/qemu-system-aarch64 \
> +export TEST_CMD="./binaries/qemu-system-aarch64 \
>      -machine virtualization=true \
>      -cpu cortex-a57 -machine type=virt \
>      -m 2048 -monitor none -serial stdio \
> @@ -104,8 +104,8 @@ export QEMU_CMD="./binaries/qemu-system-aarch64 \
>      -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin"
> 
>  export UBOOT_CMD="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"
> -export QEMU_LOG="smoke.serial"
> +export TEST_LOG="smoke.serial"
>  export LOG_MSG="Domain-0"
>  export PASSED="BusyBox"
> 
> -./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
> +./automation/scripts/console.exp | sed 's/\r\+$//'
> diff --git a/automation/scripts/qemu-smoke-dom0less-arm32.sh b/automation/scripts/qemu-smoke-dom0less-arm32.sh
> index 38e8a0b0bd7d..41f6e5d8e615 100755
> --- a/automation/scripts/qemu-smoke-dom0less-arm32.sh
> +++ b/automation/scripts/qemu-smoke-dom0less-arm32.sh
> @@ -130,7 +130,7 @@ bash imagebuilder/scripts/uboot-script-gen -t tftp -d . -c config
> 
>  # Run the test
>  rm -f ${serial_log}
> -export QEMU_CMD="./qemu-system-arm \
> +export TEST_CMD="./qemu-system-arm \
>      -machine virt \
>      -machine virtualization=true \
>      -smp 4 \
> @@ -144,8 +144,8 @@ export QEMU_CMD="./qemu-system-arm \
>      -bios /usr/lib/u-boot/qemu_arm/u-boot.bin"
> 
>  export UBOOT_CMD="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"
> -export QEMU_LOG="${serial_log}"
> +export TEST_LOG="${serial_log}"
>  export LOG_MSG="${dom0_prompt}"
>  export PASSED="${passed}"
> 
> -../automation/scripts/qemu-key.exp | sed 's/\r\+$//'
> +../automation/scripts/console.exp | sed 's/\r\+$//'
> diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
> index ea67650e17da..83e1866ca6c5 100755
> --- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
> +++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
> @@ -204,7 +204,7 @@ bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/conf
> 
>  # Run the test
>  rm -f smoke.serial
> -export QEMU_CMD="./binaries/qemu-system-aarch64 \
> +export TEST_CMD="./binaries/qemu-system-aarch64 \
>      -machine virtualization=true \
>      -cpu cortex-a57 -machine type=virt,gic-version=$gic_version \
>      -m 2048 -monitor none -serial stdio \
> @@ -215,8 +215,8 @@ export QEMU_CMD="./binaries/qemu-system-aarch64 \
>      -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin"
> 
>  export UBOOT_CMD="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"
> -export QEMU_LOG="smoke.serial"
> +export TEST_LOG="smoke.serial"
>  export LOG_MSG="Welcome to Alpine Linux"
>  export PASSED="${passed}"
> 
> -./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
> +./automation/scripts/console.exp | sed 's/\r\+$//'
> diff --git a/automation/scripts/qemu-smoke-ppc64le.sh b/automation/scripts/qemu-smoke-ppc64le.sh
> index 49e189c37058..617096ad1fa8 100755
> --- a/automation/scripts/qemu-smoke-ppc64le.sh
> +++ b/automation/scripts/qemu-smoke-ppc64le.sh
> @@ -10,7 +10,7 @@ machine=$1
>  # Run the test
>  rm -f ${serial_log}
> 
> -export QEMU_CMD="qemu-system-ppc64 \
> +export TEST_CMD="qemu-system-ppc64 \
>      -bios skiboot.lid \
>      -M $machine \
>      -m 2g \
> @@ -21,7 +21,7 @@ export QEMU_CMD="qemu-system-ppc64 \
>      -serial stdio \
>      -kernel binaries/xen"
> 
> -export QEMU_LOG="${serial_log}"
> +export TEST_LOG="${serial_log}"
>  export PASSED="Hello, ppc64le!"
> 
> -./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
> +./automation/scripts/console.exp | sed 's/\r\+$//'
> diff --git a/automation/scripts/qemu-smoke-riscv64.sh b/automation/scripts/qemu-smoke-riscv64.sh
> index 422ee03e0d26..8f755d0a6a99 100755
> --- a/automation/scripts/qemu-smoke-riscv64.sh
> +++ b/automation/scripts/qemu-smoke-riscv64.sh
> @@ -5,14 +5,14 @@ set -ex -o pipefail
>  # Run the test
>  rm -f smoke.serial
> 
> -export QEMU_CMD="qemu-system-riscv64 \
> +export TEST_CMD="qemu-system-riscv64 \
>      -M virt \
>      -smp 1 \
>      -nographic \
>      -m 2g \
>      -kernel binaries/xen"
> 
> -export QEMU_LOG="smoke.serial"
> +export TEST_LOG="smoke.serial"
>  export PASSED="All set up"
> 
> -./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
> +./automation/scripts/console.exp | sed 's/\r\+$//'
> diff --git a/automation/scripts/qemu-smoke-x86-64.sh b/automation/scripts/qemu-smoke-x86-64.sh
> index 7495185d9fc6..da0c26cc2f82 100755
> --- a/automation/scripts/qemu-smoke-x86-64.sh
> +++ b/automation/scripts/qemu-smoke-x86-64.sh
> @@ -15,12 +15,12 @@ case $variant in
>  esac
> 
>  rm -f smoke.serial
> -export QEMU_CMD="qemu-system-x86_64 -nographic -kernel binaries/xen \
> +export TEST_CMD="qemu-system-x86_64 -nographic -kernel binaries/xen \
>          -initrd xtf/tests/example/$k \
>          -append \"loglvl=all console=com1 noreboot console_timestamps=boot $extra\" \
>          -m 512 -monitor none -serial stdio"
> 
> -export QEMU_LOG="smoke.serial"
> +export TEST_LOG="smoke.serial"
>  export PASSED="Test result: SUCCESS"
> 
> -./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
> +./automation/scripts/console.exp | sed 's/\r\+$//'
> diff --git a/automation/scripts/qemu-xtf-dom0less-arm64.sh b/automation/scripts/qemu-xtf-dom0less-arm64.sh
> index acef1637e25b..9608de6ec033 100755
> --- a/automation/scripts/qemu-xtf-dom0less-arm64.sh
> +++ b/automation/scripts/qemu-xtf-dom0less-arm64.sh
> @@ -50,7 +50,7 @@ bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/conf
> 
>  # Run the test
>  rm -f smoke.serial
> -export QEMU_CMD="./binaries/qemu-system-aarch64 \
> +export TEST_CMD="./binaries/qemu-system-aarch64 \
>      -machine virtualization=true \
>      -cpu cortex-a57 -machine type=virt \
>      -m 2048 -monitor none -serial stdio \
> @@ -61,7 +61,7 @@ export QEMU_CMD="./binaries/qemu-system-aarch64 \
>      -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin"
> 
>  export UBOOT_CMD="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"
> -export QEMU_LOG="smoke.serial"
> +export TEST_LOG="smoke.serial"
>  export PASSED="${passed}"
> 
> -./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
> +./automation/scripts/console.exp | sed 's/\r\+$//'
> diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
> index 4559e2b9ee1f..ef6e1361a95c 100755
> --- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
> +++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
> @@ -1,8 +1,8 @@
> -#!/bin/sh
> +#!/usr/bin/env bash
> 
>  # Run x86_64 dom0 tests on hardware.
> 
> -set -ex
> +set -ex -o pipefail
> 
>  fatal() {
>      echo "$(basename "$0") $*" >&2
> @@ -27,7 +27,6 @@ memory = 512
>  vif = [ "bridge=xenbr0", ]
>  disk = [ ]
>  '
> -TIMEOUT_SECONDS=200
> 
>  # Select test variant.
>  if [ "${TEST}" = "ping" ]; then
> @@ -125,20 +124,19 @@ boot
> 
>  # Power cycle board and collect serial port output.
>  SERIAL_DEV="/dev/serial/${TEST_BOARD}"
> -SERIAL_CMD="cat ${SERIAL_DEV} | tee smoke.serial | sed 's/\r//'"
>  sh /scratch/gitlab-runner/${TEST_BOARD}.sh 2
>  sleep 5
>  sh /scratch/gitlab-runner/${TEST_BOARD}.sh 1
>  sleep 5
>  set +e
>  stty -F ${SERIAL_DEV} 115200
> -timeout -k 1 ${TIMEOUT_SECONDS} nohup sh -c "${SERIAL_CMD}"
> -sh /scratch/gitlab-runner/${TEST_BOARD}.sh 2
> -
> -set -e
> 
> -if grep -q "${PASS_MSG}" smoke.serial; then
> -    exit 0
> -fi
> +# Capture test result and power off board before exiting.
> +export PASSED="${PASS_MSG}"
> +export TEST_CMD="cat ${SERIAL_DEV}"
> +export TEST_LOG="smoke.serial"
> 
> -fatal "Test failed"
> +./automation/scripts/console.exp | sed 's/\r\+$//'
> +TEST_RESULT=$?
> +sh "/scratch/gitlab-runner/${TEST_BOARD}.sh" 2
> +exit ${TEST_RESULT}
> diff --git a/automation/scripts/xilinx-smoke-dom0less-arm64.sh b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
> index 18aa07f0a273..b24ad11b8cac 100755
> --- a/automation/scripts/xilinx-smoke-dom0less-arm64.sh
> +++ b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
> @@ -1,6 +1,6 @@
>  #!/bin/bash
> 
> -set -ex
> +set -ex -o pipefail
> 
>  test_variant=$1
> 
> @@ -137,13 +137,14 @@ cd $START
>  SERIAL_DEV="/dev/serial/zynq"
>  set +e
>  stty -F ${SERIAL_DEV} 115200
> -timeout -k 1 120 nohup sh -c "cat ${SERIAL_DEV} | tee smoke.serial | sed 's/\r//'"
> 
> -# stop the board
> -cd /scratch/gitlab-runner
> -bash zcu102.sh 2
> -cd $START
> +# Capture test result and power off board before exiting.
> +export PASSED="${passed}"
> +export LOG_MSG="Welcome to Alpine Linux"
> +export TEST_CMD="cat ${SERIAL_DEV}"
> +export TEST_LOG="smoke.serial"
> 
> -set -e
> -(grep -q "^Welcome to Alpine Linux" smoke.serial && grep -q "${passed}" smoke.serial) || exit 1
> -exit 0
> +./automation/scripts/console.exp | sed 's/\r\+$//'
> +TEST_RESULT=$?
> +sh "/scratch/gitlab-runner/zcu102.sh" 2
> +exit ${TEST_RESULT}
> --
> 2.25.1
> 

