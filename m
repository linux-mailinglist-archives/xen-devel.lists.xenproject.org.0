Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9882A9100E
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 02:17:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956829.1350097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Cw5-0005Wp-B8; Thu, 17 Apr 2025 00:16:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956829.1350097; Thu, 17 Apr 2025 00:16:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Cw5-0005Ug-8J; Thu, 17 Apr 2025 00:16:57 +0000
Received: by outflank-mailman (input) for mailman id 956829;
 Thu, 17 Apr 2025 00:16:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F/Gg=XD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u5Cw3-0005Ua-QI
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 00:16:55 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 436bcdc3-1b21-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 02:16:54 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 01D7249FA8;
 Thu, 17 Apr 2025 00:16:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ACFFC4CEE2;
 Thu, 17 Apr 2025 00:16:50 +0000 (UTC)
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
X-Inumbo-ID: 436bcdc3-1b21-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744849012;
	bh=DrnBQeM+omT38kGqHGAezxyTFQ+kRIksq6XS/9X9t7M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kApwmnEOCO4p4US5iETizN+IhSxNkYjK0nqI3YUZl27evyhXIOLiYDUjBEJ4ky+aR
	 qos0SB3vXJkTGT9qIllFt+2QhtljfMogg+jxy8Xu0naJFXTX6Vuy0prFRGacoDOj8j
	 X3zLYUnmiuf9MVJyEdAXm2ACmutbLioClwWGVJCTaRjA9KsG4T0+6/HvyrchdX0Jme
	 VNmfMGJuTBLNQjhJfK7VXjja+mqRP5OOXxB0NfnOfGoa1TYQryM05FQaFpKrFL35pA
	 ZXZGdD2Jg0kHnFOlb47s49oKDY4SnaG+tghT0gHYmkR5DetW17yeAuZzamKVgVf+YK
	 Z9J/ijHxpbyZQ==
Date: Wed, 16 Apr 2025 17:16:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmkhn@proton.me
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    cardoe@cardoe.com, marmarek@invisiblethingslab.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v1 1/4] CI: unify x86 XTF test runner
In-Reply-To: <20250416053213.921444-2-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2504161609010.8008@ubuntu-linux-20-04-desktop>
References: <20250416053213.921444-1-dmukhin@ford.com> <20250416053213.921444-2-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 16 Apr 2025, dmkhn@proton.me wrote:
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
>  automation/gitlab-ci/test.yaml                |   8 +-
>  automation/scripts/.gitignore                 |   6 +
>  .../scripts/include/configs/xtf-x86-64-config |   0
>  automation/scripts/include/xtf-runner         | 134 ++++++++++++++++++
>  automation/scripts/include/xtf-x86-64         |  31 ++++
>  automation/scripts/qemu-smoke-x86-64.sh       |  26 ----
>  automation/scripts/qemu-xtf.sh                |  26 ++++
>  7 files changed, 201 insertions(+), 30 deletions(-)
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
> +
> +binaries
> +smoke.serial
> +xen
> +xtf*/

I am not sure this works as intended: I thought the paths are relative
to the location of the .gitignore file, but I could be wrong.


> diff --git a/automation/scripts/include/configs/xtf-x86-64-config b/automation/scripts/include/configs/xtf-x86-64-config
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/automation/scripts/include/xtf-runner b/automation/scripts/include/xtf-runner
> new file mode 100644
> index 0000000000..55b7b34b89
> --- /dev/null
> +++ b/automation/scripts/include/xtf-runner
> @@ -0,0 +1,134 @@
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
> +function die()
> +{
> +    set +x
> +    echo "FATAL: $*" >&2
> +    exit 1
> +}
> +
> +[ -z "$TOP" ] && die "\$TOP is not set"
> +
> +# Output log file
> +TEST_LOG="${TEST_LOG:-smoke.serial}"
> +# XTF test printout in case of a pass
> +PASSED="${PASSED:-Test result: SUCCESS}"
> +# Expected boot message
> +BOOT_MSG="${BOOT_MSG:-Latest ChangeSet: }"
> +# Test working directory
> +WORKDIR="${WORKDIR:-binaries}"
> +# XTF source code
> +XTF_SRC_CONFIG="${XTF_CONFIG:-${TOP}/include/configs/xtf-${ARCH}-config}"

Should this be  XTF_SRC_CONFIG="${XTF_SRC_CONFIG:-  ?


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
> +    if [ ! -d ${xtf_dir}/.git ]; then
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
> +    cmdline+=("loglvl=all noreboot console_timestamps=boot")
> +    cmdline+=("console=${XEN_CONSOLE}")
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
> +    ${TOP}/console.exp | sed 's/\r\+$//'
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
> index 0000000000..edddf18b38
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

It looks like QEMU_PREFIX is only used within this file (and other
similar files in later patches). If so, maybe for the sake of reducing
global variables and variables in general we could get rid of
QEMU_PREFIX.


> +    export XEN_BINARY="${XEN_BINARY:-${WORKDIR}/xen}"
> +    export XEN_CONSOLE="${XEN_CONSOLE:-com1}"

Instead of XEN_CONSOLE, I'd suggest to have an arch-specific variable
for Xen command line options where we can put the console as well as
other things. However, it is also totally fine as is.

In fact, I think you went above and beyond in terms of generic
abstractions, and I think it would have been OK to go with fewer
variables, and more ad-hoc custom code.


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
> index 0000000000..2e16d4aece
> --- /dev/null
> +++ b/automation/scripts/qemu-xtf.sh
> @@ -0,0 +1,26 @@
> +#!/bin/bash
> +#
> +# XTF test runner (QEMU).
> +#
> +
> +set -e -o pipefail
> +
> +if [ $# -lt 3 ]; then
> +    echo "Usage: $(basename $0) ARCH XTF-VARIANT XTF-NAME"
> +    exit 1
> +fi
> +
> +export ARCH="$1"
> +shift
> +
> +export TOP="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
> +if [ ! -f "${TOP}/include/xtf-${ARCH}" ]; then
> +    echo "unsupported architecture '${ARCH}'" >&2
> +    exit 1
> +fi

This seems a bit complex.. maybe we can assume that we are in xen.git/ ?


> +set -x
> +source ${TOP}/include/xtf-runner
> +source ${TOP}/include/xtf-${ARCH}

So here we could do:

source automation/scripts/include/xtf-runner

? Or is it important to be able to detect and calculate the directory?
If so, why not use TOP=$(pwd) or TOP=${PWD} or TOP=$(dirname "$0")?
By the way, if we need a variable for the top directory I would call it
XEN_ROOT instead of TOP.

I see the patches are using both TOP and WORKDIR, maybe we can get rid
of one of them? This is only a matter of taste but I think it would be
simpler with fewer variables and most of  the others look unavoidable.

Everything else looks OK to me.


> +xtf_test $@
> -- 
> 2.34.1
> 
> 

