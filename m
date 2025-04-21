Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F85BA95767
	for <lists+xen-devel@lfdr.de>; Mon, 21 Apr 2025 22:39:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961442.1352855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6xvR-0005r1-Q4; Mon, 21 Apr 2025 20:39:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961442.1352855; Mon, 21 Apr 2025 20:39:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6xvR-0005oi-NI; Mon, 21 Apr 2025 20:39:33 +0000
Received: by outflank-mailman (input) for mailman id 961442;
 Mon, 21 Apr 2025 20:39:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nRXx=XH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u6xvQ-0005oc-MO
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 20:39:32 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6d7dc55-1ef0-11f0-9ffb-bf95429c2676;
 Mon, 21 Apr 2025 22:39:26 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CC1AF61154;
 Mon, 21 Apr 2025 20:39:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69A3CC4CEE4;
 Mon, 21 Apr 2025 20:39:23 +0000 (UTC)
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
X-Inumbo-ID: b6d7dc55-1ef0-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745267964;
	bh=djEi/NfnH1oKIaY+jTSzZ766wdlERVedtPGzonrxwto=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jJ5YdsLh6qJxJ3Sj9ElEcpCbFV2hFANI6o2D+K2vhQOfAgP4napgo0iRNNscNJrZb
	 oYJJQDO8VPX6FIDLyTLdzTWZxtYlDEqUWBEdYDtfr3J2+rTT/zZeP0bfTn76DeN993
	 pgrE04AFz42CqxR1VzbeO5GTysQ9Cw2g+n7zGGp9D2j18mnSJOWfS4DYN5DAFcjr09
	 33Fz5dn7pHmU3re/NJ6hNhHHNOv7PhZ/cKG+4s1elzRl0HmJ7CIVqASlIlfYA59+tD
	 ciGMhZ57g1tenPSGue8qmn5eP2GQlLqXyeJmbAm1tR9lFUoURFS9/6qvVpeigvlmjE
	 JkSpiZe95d8TA==
Date: Mon, 21 Apr 2025 13:39:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmkhn@proton.me
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    cardoe@cardoe.com, marmarek@invisiblethingslab.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v2 1/4] CI: unify x86 XTF test runner
In-Reply-To: <20250419010319.2572518-2-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2504211337580.785180@ubuntu-linux-20-04-desktop>
References: <20250419010319.2572518-1-dmukhin@ford.com> <20250419010319.2572518-2-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 19 Apr 2025, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Add test runner script qemu-xtf.sh which is allows any XTF x86 test to be
> easily executed. Test runner is invoked from the qemu-smoke* jobs with the
> hardcoded parameters.
> 
> Each x86 XTF job lead time is reduced a bit since only the test-related code
> is built, not the entire XTF project.
> 
> Add .gitignore to avoid committing test artifacts by mistake.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v2:
> - removed TOP
> - dropped XEN_CONSOLE in favor of XEN_CMDLINE
> - fixup for XTF_SRC_CONFIG

Much better!


> ---
>  automation/gitlab-ci/test.yaml                |   8 +-
>  automation/scripts/.gitignore                 |   6 +
>  .../scripts/include/configs/xtf-x86-64-config |   0
>  automation/scripts/include/xtf-runner         | 131 ++++++++++++++++++
>  automation/scripts/include/xtf-x86-64         |  31 +++++
>  automation/scripts/qemu-smoke-x86-64.sh       |  26 ----
>  automation/scripts/qemu-xtf.sh                |  28 ++++
>  7 files changed, 200 insertions(+), 30 deletions(-)
>  create mode 100644 automation/scripts/.gitignore
>  create mode 100644 automation/scripts/include/configs/xtf-x86-64-config
>  create mode 100644 automation/scripts/include/xtf-runner
>  create mode 100644 automation/scripts/include/xtf-x86-64
>  delete mode 100755 automation/scripts/qemu-smoke-x86-64.sh
>  create mode 100755 automation/scripts/qemu-xtf.sh
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 5ce445b78f..3adc841335 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -659,28 +659,28 @@ qemu-alpine-x86_64-gcc:
>  qemu-smoke-x86-64-gcc:
>    extends: .qemu-smoke-x86-64
>    script:
> -    - ./automation/scripts/qemu-smoke-x86-64.sh pv 2>&1 | tee ${LOGFILE}
> +    - ./automation/scripts/qemu-xtf.sh x86-64 pv64 example 2>&1 | tee ${LOGFILE}
>    needs:
>      - debian-12-x86_64-gcc-debug
>  
>  qemu-smoke-x86-64-clang:
>    extends: .qemu-smoke-x86-64
>    script:
> -    - ./automation/scripts/qemu-smoke-x86-64.sh pv 2>&1 | tee ${LOGFILE}
> +    - ./automation/scripts/qemu-xtf.sh x86-64 pv64 example 2>&1 | tee ${LOGFILE}
>    needs:
>      - debian-12-x86_64-clang-debug
>  
>  qemu-smoke-x86-64-gcc-pvh:
>    extends: .qemu-smoke-x86-64
>    script:
> -    - ./automation/scripts/qemu-smoke-x86-64.sh pvh 2>&1 | tee ${LOGFILE}
> +    - ./automation/scripts/qemu-xtf.sh x86-64 hvm64 example 2>&1 | tee ${LOGFILE}
>    needs:
>      - debian-12-x86_64-gcc-debug
>  
>  qemu-smoke-x86-64-clang-pvh:
>    extends: .qemu-smoke-x86-64
>    script:
> -    - ./automation/scripts/qemu-smoke-x86-64.sh pvh 2>&1 | tee ${LOGFILE}
> +    - ./automation/scripts/qemu-xtf.sh x86-64 hvm64 example 2>&1 | tee ${LOGFILE}
>    needs:
>      - debian-12-x86_64-clang-debug
>  
> diff --git a/automation/scripts/.gitignore b/automation/scripts/.gitignore
> new file mode 100644
> index 0000000000..2f2d6e1ebd
> --- /dev/null
> +++ b/automation/scripts/.gitignore
> @@ -0,0 +1,6 @@
> +!include

Why !include ?


> +binaries
> +smoke.serial
> +xen
> +xtf*/
> diff --git a/automation/scripts/include/configs/xtf-x86-64-config b/automation/scripts/include/configs/xtf-x86-64-config
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/automation/scripts/include/xtf-runner b/automation/scripts/include/xtf-runner
> new file mode 100644
> index 0000000000..320eb65dc8
> --- /dev/null
> +++ b/automation/scripts/include/xtf-runner
> @@ -0,0 +1,131 @@
> +#!/bin/bash
> +#
> +# XTF test utilities.
> +#
> +# Environment variables:
> +#   BOOT_MSG: Expected boot message
> +#   FW_PREFIX: Firmware images path including '/' at the end
> +#   PASSED: XTF test printout in case of a pass
> +#   QEMU_PREFIX: QEMU path including '/' at the end
> +#   TEST_LOG: Output log file
> +#   UBOOT_CMD: U-Boot command line
> +#   WORKDIR: Test working directory
> +#   XEN_BINARY: Xen binary location
> +#   XEN_CONSOLE: Xen console device name
> +#   XTF_SRC_CONFIG: XTF config file
> +#   XTF_SRC_BRANCH: XTF branch
> +#   XTF_SRC_URI: XTF source code URI
> +
> +# Output log file
> +TEST_LOG="${TEST_LOG:-${XEN_ROOT}/smoke.serial}"
> +# XTF test printout in case of a pass
> +PASSED="${PASSED:-Test result: SUCCESS}"
> +# Expected boot message
> +BOOT_MSG="${BOOT_MSG:-Latest ChangeSet: }"
> +# Test working directory
> +WORKDIR="${WORKDIR:-${XEN_ROOT}/binaries}"
> +# XTF source code
> +XTF_SRC_CONFIG="${XTF_SRC_CONFIG:-include/configs/xtf-${ARCH}-config}"
> +
> +function die()
> +{
> +    set +x
> +    echo "FATAL: $*" >&2
> +    exit 1
> +}
> +
> +# Build an XTF test binary.
> +# $1 Test variant.
> +# $2 Test name.
> +function xtf_build_binary()
> +{
> +    local xtf_variant=$1
> +    local xtf_name=$2
> +    local xtf_dir="xtf-${ARCH}"
> +
> +    # Crude check for local testing
> +    if [ ! -d ${xtf_dir} ]; then
> +        git clone ${XTF_SRC_URI} ${xtf_dir} -b ${XTF_SRC_BRANCH}
> +    fi
> +
> +    make \
> +        -C ${xtf_dir} \
> +        -j$(nproc) \
> +        $(tr '\n' ' ' < ${XTF_SRC_CONFIG}) \
> +        TESTS=tests/${xtf_name}
> +
> +    export XTF_NAME="${xtf_name}"
> +    export XTF_VARIANT="${xtf_variant}"
> +    export XTF_WORKDIR="$(readlink -f ${xtf_dir})"
> +    export XTF_BINARY="${XTF_WORKDIR}/tests/${xtf_name}/test-${xtf_variant}-${xtf_name}"
> +}
> +
> +# Build Xen command line for running an XTF test.
> +# $1 Test variant.
> +# $2 Test name.
> +function xtf_build_cmdline()
> +{
> +    local xtf_variant=$1
> +    local xtf_name=$2
> +    declare -a cmdline=()
> +
> +    cmdline+=("${XEN_CMDLINE}")
> +
> +    # NB: OK to have hvm64, which is x86-only variant
> +    if [[ $xtf_variant == "hvm64" ]]; then
> +        cmdline+=("dom0-iommu=none dom0=pvh")
> +    fi
> +
> +    export XEN_CMDLINE="${cmdline[@]}"
> +}
> +
> +# Build an XTF test environment.
> +# $1 Test variant.
> +# $2 Test name.
> +function xtf_build_test()
> +{
> +    local v=$1
> +    local xtf_name=$2
> +    local xtf_variant=""
> +
> +    for x in ${XTF_SRC_VARIANTS}; do
> +        if [[ "${x}" == "${v}" ]]; then
> +            xtf_variant=${v}
> +            break
> +        fi
> +    done
> +    if [[ -z $xtf_variant ]]; then
> +        die "unsupported test variant '$1', supported variants: ${XTF_SRC_VARIANTS}"
> +    fi
> +
> +    xtf_build_binary ${xtf_variant} ${xtf_name}
> +    xtf_build_cmdline ${xtf_variant} ${xtf_name}
> +}
> +
> +# Execute an XTF test.
> +function xtf_run_test()
> +{
> +    rm -f ${TEST_LOG}
> +    export BOOT_MSG PASSED TEST_CMD TEST_LOG UBOOT_CMD
> +    ./console.exp | sed 's/\r\+$//'
> +}
> +
> +# Setup environment and run an XTF test.
> +# $1 Test variant.
> +# $2 Test name.
> +function xtf_test()
> +{
> +    # Out: FW_*, QEMU_*, XEN_{BINARY,CONSOLE}, XTF_SRC_*
> +    xtf_arch_prepare
> +
> +    # In: XTF_SRC_*
> +    # OUt: XTF_{BINARY,NAME,VARIANT,WORKDIR} and XEN_CMDLINE
> +    xtf_build_test $@
> +
> +    # In: FW_*, QEMU_*, XTF_*, XEN_*
> +    # Out: BOOT_MSG, PASSED, TEST_{CMD,LOG}, UBOOT_CMD
> +    xtf_arch_setup
> +
> +    # In: BOOT_MSG, PASSED, TEST_{CMD,LOG}, UBOOT_CMD
> +    xtf_run_test
> +}
> diff --git a/automation/scripts/include/xtf-x86-64 b/automation/scripts/include/xtf-x86-64
> new file mode 100644
> index 0000000000..b1b0cc201e
> --- /dev/null
> +++ b/automation/scripts/include/xtf-x86-64
> @@ -0,0 +1,31 @@
> +#!/bin/bash
> +#
> +# XTF test utilities (x86_64).
> +#
> +
> +# Arch-specific environment overrides.
> +function xtf_arch_prepare()
> +{
> +    export FW_PREFIX="${FW_PREFIX:-}"
> +    export QEMU_PREFIX="${QEMU_PREFIX:-}"
> +    export XEN_BINARY="${XEN_BINARY:-${WORKDIR}/xen}"
> +    export XEN_CMDLINE="${XEN_CMDLINE:-loglvl=all noreboot console_timestamps=boot console=com1}"
> +    export XTF_SRC_BRANCH="${XTF_SRC_BRANCH:-master}"
> +    export XTF_SRC_URI="${XTF_SRC_URI:-https://xenbits.xen.org/git-http/xtf.git}"
> +    export XTF_SRC_VARIANTS="hvm64 pv64"
> +}
> +
> +# Perform arch-specific XTF environment setup.
> +function xtf_arch_setup()
> +{
> +    export TEST_CMD="${QEMU_PREFIX}qemu-system-x86_64 \
> +        -no-reboot \
> +        -nographic \
> +        -monitor none \
> +        -serial stdio \
> +        -m 512 \
> +        -kernel ${XEN_BINARY} \
> +        -initrd ${XTF_BINARY} \
> +        -append \"${XEN_CMDLINE}\" \
> +    "
> +}
> diff --git a/automation/scripts/qemu-smoke-x86-64.sh b/automation/scripts/qemu-smoke-x86-64.sh
> deleted file mode 100755
> index da0c26cc2f..0000000000
> --- a/automation/scripts/qemu-smoke-x86-64.sh
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -#!/bin/bash
> -
> -set -ex -o pipefail
> -
> -# variant should be either pv or pvh
> -variant=$1
> -
> -# Clone and build XTF
> -git clone https://xenbits.xen.org/git-http/xtf.git
> -cd xtf && make -j$(nproc) && cd -
> -
> -case $variant in
> -    pvh) k=test-hvm64-example    extra="dom0-iommu=none dom0=pvh" ;;
> -    *)   k=test-pv64-example     extra= ;;
> -esac
> -
> -rm -f smoke.serial
> -export TEST_CMD="qemu-system-x86_64 -nographic -kernel binaries/xen \
> -        -initrd xtf/tests/example/$k \
> -        -append \"loglvl=all console=com1 noreboot console_timestamps=boot $extra\" \
> -        -m 512 -monitor none -serial stdio"
> -
> -export TEST_LOG="smoke.serial"
> -export PASSED="Test result: SUCCESS"
> -
> -./automation/scripts/console.exp | sed 's/\r\+$//'
> diff --git a/automation/scripts/qemu-xtf.sh b/automation/scripts/qemu-xtf.sh
> new file mode 100755
> index 0000000000..55c221b36d
> --- /dev/null
> +++ b/automation/scripts/qemu-xtf.sh
> @@ -0,0 +1,28 @@
> +#!/bin/bash
> +#
> +# XTF test runner (QEMU).
> +#
> +
> +set -e -o pipefail
> +
> +if [ $# -lt 3 ]; then
> +    echo "Usage: $(basename $0) ARCH XTF-VARIANT XTF-NAME"
> +    exit 0
> +fi
> +
> +export ARCH="$1"
> +shift
> +
> +set -x
> +
> +export XEN_ROOT="${PWD}"
> +cd $(dirname $0)
> +
> +source include/xtf-runner
> +
> +if [ ! -f "include/xtf-${ARCH}" ]; then
> +    die "unsupported architecture '${ARCH}'"
> +fi
> +source include/xtf-${ARCH}
> +
> +xtf_test $@
> -- 
> 2.34.1
> 
> 

