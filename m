Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EF0A92A6E
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 20:51:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.958475.1351300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5UJv-0001D7-KV; Thu, 17 Apr 2025 18:50:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 958475.1351300; Thu, 17 Apr 2025 18:50:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5UJv-0001Bf-Gv; Thu, 17 Apr 2025 18:50:43 +0000
Received: by outflank-mailman (input) for mailman id 958475;
 Thu, 17 Apr 2025 18:50:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EnA5=XD=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u5UJt-0001AH-HW
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 18:50:41 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db122933-1bbc-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 20:50:39 +0200 (CEST)
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
X-Inumbo-ID: db122933-1bbc-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744915837; x=1745175037;
	bh=bqHu9y19rH22jiwnGmWmtb+SFPcnvbPelqrCs5eVtX8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=K8Jg2LiSpvdTLHFlQj0MS2j52Lt/bBVCe9zfCRx+RY61GTVi8sfOurwZTrDbSDAjP
	 pvv3I7ZLL5aPR2xe52kGcXrgYQaGAwgZhVgMYX5dYLCJcrxYCVwMvk9ReDA9HED7fT
	 ZX0cbVcckIXB2ks+PvBP3DMWvc+aF/OtXqHSAfZ43Ge9XEcLMhqtIHXnktGpNljEHP
	 ASQEYyJcWcM0IXBwjV4UtrRkEJhZ9kQdiLieeegb8YRTlIMEdHiRJskYTS1dim+G+G
	 FoCCyCgAgA331bxasq/NdfY8TdbpSQYHfqM9l2eXnuFkXaxtTE7ruhotYhWqhBr8y0
	 LTZMjBJYTYWeg==
Date: Thu, 17 Apr 2025 18:50:32 +0000
To: Stefano Stabellini <sstabellini@kernel.org>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, cardoe@cardoe.com, marmarek@invisiblethingslab.com, dmukhin@ford.com
Subject: Re: [PATCH v1 1/4] CI: unify x86 XTF test runner
Message-ID: <aAFNdAaBz7guR9iA@kraken>
In-Reply-To: <alpine.DEB.2.22.394.2504161609010.8008@ubuntu-linux-20-04-desktop>
References: <20250416053213.921444-1-dmukhin@ford.com> <20250416053213.921444-2-dmukhin@ford.com> <alpine.DEB.2.22.394.2504161609010.8008@ubuntu-linux-20-04-desktop>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 9cf1bfdf9fdb7c58b3b895ebfaf94b20a8b3d6bb
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 05:16:49PM -0700, Stefano Stabellini wrote:
> On Wed, 16 Apr 2025, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Add test runner script qemu-xtf.sh which is allows any XTF x86 test to =
be
> > easily executed. Test runner is invoked from the qemu-smoke* jobs with =
the
> > hardcoded parameters.
> >
> > Each x86 XTF job lead time is reduced a bit since only the test-related=
 code
> > is built, not the entire XTF project.
> >
> > Add .gitignore to avoid committing test artifacts by mistake.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> >  automation/gitlab-ci/test.yaml                |   8 +-
> >  automation/scripts/.gitignore                 |   6 +
> >  .../scripts/include/configs/xtf-x86-64-config |   0
> >  automation/scripts/include/xtf-runner         | 134 ++++++++++++++++++
> >  automation/scripts/include/xtf-x86-64         |  31 ++++
> >  automation/scripts/qemu-smoke-x86-64.sh       |  26 ----
> >  automation/scripts/qemu-xtf.sh                |  26 ++++
> >  7 files changed, 201 insertions(+), 30 deletions(-)
> >  create mode 100644 automation/scripts/.gitignore
> >  create mode 100644 automation/scripts/include/configs/xtf-x86-64-confi=
g
> >  create mode 100644 automation/scripts/include/xtf-runner
> >  create mode 100644 automation/scripts/include/xtf-x86-64
> >  delete mode 100755 automation/scripts/qemu-smoke-x86-64.sh
> >  create mode 100755 automation/scripts/qemu-xtf.sh
> >
> > diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test=
.yaml
> > index 5ce445b78f..3adc841335 100644
> > --- a/automation/gitlab-ci/test.yaml
> > +++ b/automation/gitlab-ci/test.yaml
> > @@ -659,28 +659,28 @@ qemu-alpine-x86_64-gcc:
> >  qemu-smoke-x86-64-gcc:
> >    extends: .qemu-smoke-x86-64
> >    script:
> > -    - ./automation/scripts/qemu-smoke-x86-64.sh pv 2>&1 | tee ${LOGFIL=
E}
> > +    - ./automation/scripts/qemu-xtf.sh x86-64 pv64 example 2>&1 | tee =
${LOGFILE}
> >    needs:
> >      - debian-12-x86_64-gcc-debug
> >
> >  qemu-smoke-x86-64-clang:
> >    extends: .qemu-smoke-x86-64
> >    script:
> > -    - ./automation/scripts/qemu-smoke-x86-64.sh pv 2>&1 | tee ${LOGFIL=
E}
> > +    - ./automation/scripts/qemu-xtf.sh x86-64 pv64 example 2>&1 | tee =
${LOGFILE}
> >    needs:
> >      - debian-12-x86_64-clang-debug
> >
> >  qemu-smoke-x86-64-gcc-pvh:
> >    extends: .qemu-smoke-x86-64
> >    script:
> > -    - ./automation/scripts/qemu-smoke-x86-64.sh pvh 2>&1 | tee ${LOGFI=
LE}
> > +    - ./automation/scripts/qemu-xtf.sh x86-64 hvm64 example 2>&1 | tee=
 ${LOGFILE}
> >    needs:
> >      - debian-12-x86_64-gcc-debug
> >
> >  qemu-smoke-x86-64-clang-pvh:
> >    extends: .qemu-smoke-x86-64
> >    script:
> > -    - ./automation/scripts/qemu-smoke-x86-64.sh pvh 2>&1 | tee ${LOGFI=
LE}
> > +    - ./automation/scripts/qemu-xtf.sh x86-64 hvm64 example 2>&1 | tee=
 ${LOGFILE}
> >    needs:
> >      - debian-12-x86_64-clang-debug
> >
> > diff --git a/automation/scripts/.gitignore b/automation/scripts/.gitign=
ore
> > new file mode 100644
> > index 0000000000..2f2d6e1ebd
> > --- /dev/null
> > +++ b/automation/scripts/.gitignore
> > @@ -0,0 +1,6 @@
> > +!include
> > +
> > +binaries
> > +smoke.serial
> > +xen
> > +xtf*/
>=20
> I am not sure this works as intended: I thought the paths are relative
> to the location of the .gitignore file, but I could be wrong.

git allows .gitignore at any level in the source tree so that lenghty
paths could be avoided.

>=20
>=20
> > diff --git a/automation/scripts/include/configs/xtf-x86-64-config b/aut=
omation/scripts/include/configs/xtf-x86-64-config
> > new file mode 100644
> > index 0000000000..e69de29bb2
> > diff --git a/automation/scripts/include/xtf-runner b/automation/scripts=
/include/xtf-runner
> > new file mode 100644
> > index 0000000000..55b7b34b89
> > --- /dev/null
> > +++ b/automation/scripts/include/xtf-runner
> > @@ -0,0 +1,134 @@
> > +#!/bin/bash
> > +#
> > +# XTF test utilities.
> > +#
> > +# Environment variables:
> > +#   BOOT_MSG: Expected boot message
> > +#   FW_PREFIX: Firmware images path including '/' at the end
> > +#   PASSED: XTF test printout in case of a pass
> > +#   QEMU_PREFIX: QEMU path including '/' at the end
> > +#   TEST_LOG: Output log file
> > +#   UBOOT_CMD: U-Boot command line
> > +#   WORKDIR: Test working directory
> > +#   XEN_BINARY: Xen binary location
> > +#   XEN_CONSOLE: Xen console device name
> > +#   XTF_SRC_CONFIG: XTF config file
> > +#   XTF_SRC_BRANCH: XTF branch
> > +#   XTF_SRC_URI: XTF source code URI
> > +
> > +function die()
> > +{
> > +    set +x
> > +    echo "FATAL: $*" >&2
> > +    exit 1
> > +}
> > +
> > +[ -z "$TOP" ] && die "\$TOP is not set"
> > +
> > +# Output log file
> > +TEST_LOG=3D"${TEST_LOG:-smoke.serial}"
> > +# XTF test printout in case of a pass
> > +PASSED=3D"${PASSED:-Test result: SUCCESS}"
> > +# Expected boot message
> > +BOOT_MSG=3D"${BOOT_MSG:-Latest ChangeSet: }"
> > +# Test working directory
> > +WORKDIR=3D"${WORKDIR:-binaries}"
> > +# XTF source code
> > +XTF_SRC_CONFIG=3D"${XTF_CONFIG:-${TOP}/include/configs/xtf-${ARCH}-con=
fig}"
>=20
> Should this be  XTF_SRC_CONFIG=3D"${XTF_SRC_CONFIG:-  ?

Thanks for the catch!

>=20
>=20
> > +# Build an XTF test binary.
> > +# $1 Test variant.
> > +# $2 Test name.
> > +function xtf_build_binary()
> > +{
> > +    local xtf_variant=3D$1
> > +    local xtf_name=3D$2
> > +    local xtf_dir=3D"xtf-${ARCH}"
> > +
> > +    # Crude check for local testing
> > +    if [ ! -d ${xtf_dir}/.git ]; then
> > +        git clone ${XTF_SRC_URI} ${xtf_dir} -b ${XTF_SRC_BRANCH}
> > +    fi
> > +
> > +    make \
> > +        -C ${xtf_dir} \
> > +        -j$(nproc) \
> > +        $(tr '\n' ' ' < ${XTF_SRC_CONFIG}) \
> > +        TESTS=3Dtests/${xtf_name}
> > +
> > +    export XTF_NAME=3D"${xtf_name}"
> > +    export XTF_VARIANT=3D"${xtf_variant}"
> > +    export XTF_WORKDIR=3D"$(readlink -f ${xtf_dir})"
> > +    export XTF_BINARY=3D"${XTF_WORKDIR}/tests/${xtf_name}/test-${xtf_v=
ariant}-${xtf_name}"
> > +}
> > +
> > +# Build Xen command line for running an XTF test.
> > +# $1 Test variant.
> > +# $2 Test name.
> > +function xtf_build_cmdline()
> > +{
> > +    local xtf_variant=3D$1
> > +    local xtf_name=3D$2
> > +    declare -a cmdline=3D()
> > +
> > +    cmdline+=3D("loglvl=3Dall noreboot console_timestamps=3Dboot")
> > +    cmdline+=3D("console=3D${XEN_CONSOLE}")
> > +
> > +    # NB: OK to have hvm64, which is x86-only variant
> > +    if [[ $xtf_variant =3D=3D "hvm64" ]]; then
> > +        cmdline+=3D("dom0-iommu=3Dnone dom0=3Dpvh")
> > +    fi
> > +
> > +    export XEN_CMDLINE=3D"${cmdline[@]}"
> > +}
> > +
> > +# Build an XTF test environment.
> > +# $1 Test variant.
> > +# $2 Test name.
> > +function xtf_build_test()
> > +{
> > +    local v=3D$1
> > +    local xtf_name=3D$2
> > +    local xtf_variant=3D""
> > +
> > +    for x in ${XTF_SRC_VARIANTS}; do
> > +        if [[ "${x}" =3D=3D "${v}" ]]; then
> > +            xtf_variant=3D${v}
> > +            break
> > +        fi
> > +    done
> > +    if [[ -z $xtf_variant ]]; then
> > +        die "unsupported test variant '$1', supported variants: ${XTF_=
SRC_VARIANTS}"
> > +    fi
> > +
> > +    xtf_build_binary ${xtf_variant} ${xtf_name}
> > +    xtf_build_cmdline ${xtf_variant} ${xtf_name}
> > +}
> > +
> > +# Execute an XTF test.
> > +function xtf_run_test()
> > +{
> > +    rm -f ${TEST_LOG}
> > +    export BOOT_MSG PASSED TEST_CMD TEST_LOG UBOOT_CMD
> > +    ${TOP}/console.exp | sed 's/\r\+$//'
> > +}
> > +
> > +# Setup environment and run an XTF test.
> > +# $1 Test variant.
> > +# $2 Test name.
> > +function xtf_test()
> > +{
> > +    # Out: FW_*, QEMU_*, XEN_{BINARY,CONSOLE}, XTF_SRC_*
> > +    xtf_arch_prepare
> > +
> > +    # In: XTF_SRC_*
> > +    # OUt: XTF_{BINARY,NAME,VARIANT,WORKDIR} and XEN_CMDLINE
> > +    xtf_build_test $@
> > +
> > +    # In: FW_*, QEMU_*, XTF_*, XEN_*
> > +    # Out: BOOT_MSG, PASSED, TEST_{CMD,LOG}, UBOOT_CMD
> > +    xtf_arch_setup
> > +
> > +    # In: BOOT_MSG, PASSED, TEST_{CMD,LOG}, UBOOT_CMD
> > +    xtf_run_test
> > +}
> > diff --git a/automation/scripts/include/xtf-x86-64 b/automation/scripts=
/include/xtf-x86-64
> > new file mode 100644
> > index 0000000000..edddf18b38
> > --- /dev/null
> > +++ b/automation/scripts/include/xtf-x86-64
> > @@ -0,0 +1,31 @@
> > +#!/bin/bash
> > +#
> > +# XTF test utilities (x86_64).
> > +#
> > +
> > +# Arch-specific environment overrides.
> > +function xtf_arch_prepare()
> > +{
> > +    export FW_PREFIX=3D"${FW_PREFIX:-}"
> > +    export QEMU_PREFIX=3D"${QEMU_PREFIX:-}"
>=20
> It looks like QEMU_PREFIX is only used within this file (and other
> similar files in later patches). If so, maybe for the sake of reducing
> global variables and variables in general we could get rid of
> QEMU_PREFIX.

Turned out that Arm and x86 CI jobs use different paths to QEMU binaries.
dev host may have some other location, that's why I parameterized QEMU
location.

>=20
>=20
> > +    export XEN_BINARY=3D"${XEN_BINARY:-${WORKDIR}/xen}"
> > +    export XEN_CONSOLE=3D"${XEN_CONSOLE:-com1}"
>=20
> Instead of XEN_CONSOLE, I'd suggest to have an arch-specific variable
> for Xen command line options where we can put the console as well as
> other things. However, it is also totally fine as is.

I initially did that, but then there's a big portion of command line parame=
ters
which is shared across all supported architectures, with console=3D pointin=
g to
arch-specific console device.

I will add arch-specific variable and drop XEN_CONSOLE.

>=20
> In fact, I think you went above and beyond in terms of generic
> abstractions, and I think it would have been OK to go with fewer
> variables, and more ad-hoc custom code.
>=20
>=20
> > +    export XTF_SRC_BRANCH=3D"${XTF_SRC_BRANCH:-master}"
> > +    export XTF_SRC_URI=3D"${XTF_SRC_URI:-https://xenbits.xen.org/git-h=
ttp/xtf.git}"
> > +    export XTF_SRC_VARIANTS=3D"hvm64 pv64"
> > +}
> > +
> > +# Perform arch-specific XTF environment setup.
> > +function xtf_arch_setup()
> > +{
> > +    export TEST_CMD=3D"${QEMU_PREFIX}qemu-system-x86_64 \
> > +        -no-reboot \
> > +        -nographic \
> > +        -monitor none \
> > +        -serial stdio \
> > +        -m 512 \
> > +        -kernel ${XEN_BINARY} \
> > +        -initrd ${XTF_BINARY} \
> > +        -append \"${XEN_CMDLINE}\" \
> > +    "
> > +}
> > diff --git a/automation/scripts/qemu-smoke-x86-64.sh b/automation/scrip=
ts/qemu-smoke-x86-64.sh
> > deleted file mode 100755
> > index da0c26cc2f..0000000000
> > --- a/automation/scripts/qemu-smoke-x86-64.sh
> > +++ /dev/null
> > @@ -1,26 +0,0 @@
> > -#!/bin/bash
> > -
> > -set -ex -o pipefail
> > -
> > -# variant should be either pv or pvh
> > -variant=3D$1
> > -
> > -# Clone and build XTF
> > -git clone https://xenbits.xen.org/git-http/xtf.git
> > -cd xtf && make -j$(nproc) && cd -
> > -
> > -case $variant in
> > -    pvh) k=3Dtest-hvm64-example    extra=3D"dom0-iommu=3Dnone dom0=3Dp=
vh" ;;
> > -    *)   k=3Dtest-pv64-example     extra=3D ;;
> > -esac
> > -
> > -rm -f smoke.serial
> > -export TEST_CMD=3D"qemu-system-x86_64 -nographic -kernel binaries/xen =
\
> > -        -initrd xtf/tests/example/$k \
> > -        -append \"loglvl=3Dall console=3Dcom1 noreboot console_timesta=
mps=3Dboot $extra\" \
> > -        -m 512 -monitor none -serial stdio"
> > -
> > -export TEST_LOG=3D"smoke.serial"
> > -export PASSED=3D"Test result: SUCCESS"
> > -
> > -./automation/scripts/console.exp | sed 's/\r\+$//'
> > diff --git a/automation/scripts/qemu-xtf.sh b/automation/scripts/qemu-x=
tf.sh
> > new file mode 100755
> > index 0000000000..2e16d4aece
> > --- /dev/null
> > +++ b/automation/scripts/qemu-xtf.sh
> > @@ -0,0 +1,26 @@
> > +#!/bin/bash
> > +#
> > +# XTF test runner (QEMU).
> > +#
> > +
> > +set -e -o pipefail
> > +
> > +if [ $# -lt 3 ]; then
> > +    echo "Usage: $(basename $0) ARCH XTF-VARIANT XTF-NAME"
> > +    exit 1
> > +fi
> > +
> > +export ARCH=3D"$1"
> > +shift
> > +
> > +export TOP=3D"$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd=
)"
> > +if [ ! -f "${TOP}/include/xtf-${ARCH}" ]; then
> > +    echo "unsupported architecture '${ARCH}'" >&2
> > +    exit 1
> > +fi
>=20
> This seems a bit complex.. maybe we can assume that we are in xen.git/ ?

Will do that.


>=20
>=20
> > +set -x
> > +source ${TOP}/include/xtf-runner
> > +source ${TOP}/include/xtf-${ARCH}
>=20
> So here we could do:
>=20
> source automation/scripts/include/xtf-runner
>=20
> ? Or is it important to be able to detect and calculate the directory?
> If so, why not use TOP=3D$(pwd) or TOP=3D${PWD} or TOP=3D$(dirname "$0")?
> By the way, if we need a variable for the top directory I would call it
> XEN_ROOT instead of TOP.
>=20
> I see the patches are using both TOP and WORKDIR, maybe we can get rid
> of one of them? This is only a matter of taste but I think it would be
> simpler with fewer variables and most of  the others look unavoidable.

I will try to eliminate TOP uses.

>=20
> Everything else looks OK to me.
>=20
>=20
> > +xtf_test $@
> > --
> > 2.34.1
> >
> >


