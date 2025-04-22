Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40212A972C0
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 18:29:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963328.1354331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7GVL-0001DV-RO; Tue, 22 Apr 2025 16:29:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963328.1354331; Tue, 22 Apr 2025 16:29:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7GVL-0001AR-OZ; Tue, 22 Apr 2025 16:29:51 +0000
Received: by outflank-mailman (input) for mailman id 963328;
 Tue, 22 Apr 2025 16:29:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8D33=XI=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u7GVK-0000qu-5H
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 16:29:50 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 028ef47b-1f97-11f0-9eb0-5ba50f476ded;
 Tue, 22 Apr 2025 18:29:49 +0200 (CEST)
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
X-Inumbo-ID: 028ef47b-1f97-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745339388; x=1745598588;
	bh=8MxSXmL1a16x1YVjgT64BgEUVKM+WEFMs/mIAXtdUZo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=MdKr/Y7OetxcolQnwsbZcXZ67L3O8bpkaLKC0UpWOg5LrlC8k9NDtdynQF9LGCGwS
	 K/sDAJlvhWrkb233dH3Mo6X0gNhs6NUDLsgWm7HqKFxfZQttvQB5931h3vyq8e6cj4
	 FbpVwcPtDxr0pR1PbKnhm6W9HUnkuFzTcN+UTW1Gica9gkILLJ6+QD1nEh4PoK9U4U
	 TVTVNr2R29w9aE70KuOQcRSwEq7SdrGspGTn3NWORQmUBbR9VYDwJLidjdODXlRF4y
	 a2yL0fYLufaVDA45Yuqk78yqfK4WOFfQBIr07TqbJv0JxDFei5dqQ74GhrYKgSdljA
	 4tg0DQZDpkGWA==
Date: Tue, 22 Apr 2025 16:29:42 +0000
To: Stefano Stabellini <sstabellini@kernel.org>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, cardoe@cardoe.com, marmarek@invisiblethingslab.com, dmukhin@ford.com
Subject: Re: [PATCH v2 2/4] CI: switch x86 EFI smoke test runner to qemu-xtf.sh
Message-ID: <aAfD8qmJtsFiRX8D@starscream>
In-Reply-To: <alpine.DEB.2.22.394.2504211338190.785180@ubuntu-linux-20-04-desktop>
References: <20250419010319.2572518-1-dmukhin@ford.com> <20250419010319.2572518-3-dmukhin@ford.com> <alpine.DEB.2.22.394.2504211338190.785180@ubuntu-linux-20-04-desktop>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 303af7d351e22cb09d470353af2c7a03b018df91
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 01:39:32PM -0700, Stefano Stabellini wrote:
> On Sat, 19 Apr 2025, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Use qemu-xtf.sh for qemu-smoke-x86-64-gcc-efi job.
> >
> > Lead time is reduced a bit since not all XTF code base is built, just t=
he
> > required test.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Changes since v2:
> > - removed TOP
> > - dropped XEN_CONSOLE in favor of XEN_CMDLINE
> > ---
> >  automation/gitlab-ci/test.yaml                |  2 +-
> >  .../include/configs/xtf-x86-64-efi-config     |  0
> >  automation/scripts/include/xtf-x86-64-efi     | 52 +++++++++++++++++++
> >  automation/scripts/qemu-smoke-x86-64-efi.sh   | 43 ---------------
> >  4 files changed, 53 insertions(+), 44 deletions(-)
> >  create mode 100644 automation/scripts/include/configs/xtf-x86-64-efi-c=
onfig
> >  create mode 100644 automation/scripts/include/xtf-x86-64-efi
> >  delete mode 100755 automation/scripts/qemu-smoke-x86-64-efi.sh
> >
> > diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test=
.yaml
> > index 3adc841335..ca1e4eb528 100644
> > --- a/automation/gitlab-ci/test.yaml
> > +++ b/automation/gitlab-ci/test.yaml
> > @@ -687,7 +687,7 @@ qemu-smoke-x86-64-clang-pvh:
> >  qemu-smoke-x86-64-gcc-efi:
> >    extends: .qemu-smoke-x86-64
> >    script:
> > -    - ./automation/scripts/qemu-smoke-x86-64-efi.sh pv 2>&1 | tee ${LO=
GFILE}
> > +    - ./automation/scripts/qemu-xtf.sh x86-64-efi hvm64 example 2>&1 |=
 tee ${LOGFILE}
>=20
> Isn't it supposed to be pv64 as variant of the test to match what we had
> before?

Yes, that should be pv64; thanks!

>=20
>=20
> >    needs:
> >      - debian-12-x86_64-gcc-debug
> >
> > diff --git a/automation/scripts/include/configs/xtf-x86-64-efi-config b=
/automation/scripts/include/configs/xtf-x86-64-efi-config
> > new file mode 100644
> > index 0000000000..e69de29bb2
> > diff --git a/automation/scripts/include/xtf-x86-64-efi b/automation/scr=
ipts/include/xtf-x86-64-efi
> > new file mode 100644
> > index 0000000000..e0d821b3f6
> > --- /dev/null
> > +++ b/automation/scripts/include/xtf-x86-64-efi
> > @@ -0,0 +1,52 @@
> > +#!/bin/bash
> > +#
> > +# XTF test utilities (x86_64, EFI).
> > +#
> > +
> > +# Arch-specific environment overrides.
> > +function xtf_arch_prepare()
> > +{
> > +    export FW_PREFIX=3D"${FW_PREFIX:-/usr/share/OVMF/}"
> > +    export QEMU_PREFIX=3D"${QEMU_PREFIX:-}"
> > +    export XEN_BINARY=3D"${XEN_BINARY:-${WORKDIR}/xen.efi}"
> > +    export XEN_CMDLINE=3D"${XEN_CMDLINE:-loglvl=3Dall noreboot console=
_timestamps=3Dboot console=3Dcom1}"
> > +    export XTF_SRC_BRANCH=3D"${XTF_SRC_BRANCH:-master}"
> > +    export XTF_SRC_URI=3D"${XTF_SRC_URI:-https://xenbits.xen.org/git-h=
ttp/xtf.git}"
> > +    export XTF_SRC_VARIANTS=3D"hvm64 pv64"
> > +}
> > +
> > +# Perform arch-specific XTF environment setup.
> > +function xtf_arch_setup()
> > +{
> > +    local esp_dir=3D"${WORKDIR}/boot-esp"
> > +    local efi_dir=3D"${esp_dir}/EFI/BOOT"
> > +
> > +    # Generate EFI boot environment
> > +    mkdir -p ${efi_dir}
> > +    cp ${XEN_BINARY} ${efi_dir}/BOOTX64.EFI
> > +    cp ${XTF_BINARY} ${efi_dir}/kernel
> > +
> > +    cat > ${efi_dir}/BOOTX64.cfg <<EOF
> > +[global]
> > +default=3Dtest
> > +
> > +[test]
> > +options=3D${XEN_CMDLINE}
> > +kernel=3Dkernel
> > +EOF
> > +
> > +    # NB: OVMF_CODE.fd is read-only, no need to copy
> > +    cp ${FW_PREFIX}OVMF_VARS.fd ${WORKDIR}
> > +
> > +    export TEST_CMD=3D"${QEMU_PREFIX}qemu-system-x86_64 \
> > +        -no-reboot \
> > +        -nographic \
> > +        -monitor none \
> > +        -serial stdio \
> > +        -m 512 \
> > +        -M q35,kernel-irqchip=3Dsplit \
> > +        -drive if=3Dpflash,format=3Draw,readonly=3Don,file=3D${FW_PREF=
IX}OVMF_CODE.fd \
> > +        -drive if=3Dpflash,format=3Draw,file=3D${WORKDIR}/OVMF_VARS.fd=
 \
> > +        -drive file=3Dfat:rw:${esp_dir},media=3Ddisk,index=3D0,format=
=3Draw \
> > +    "
> > +}
> > diff --git a/automation/scripts/qemu-smoke-x86-64-efi.sh b/automation/s=
cripts/qemu-smoke-x86-64-efi.sh
> > deleted file mode 100755
> > index 7572722be6..0000000000
> > --- a/automation/scripts/qemu-smoke-x86-64-efi.sh
> > +++ /dev/null
> > @@ -1,43 +0,0 @@
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
> > -mkdir -p boot-esp/EFI/BOOT
> > -cp binaries/xen.efi boot-esp/EFI/BOOT/BOOTX64.EFI
> > -cp xtf/tests/example/$k boot-esp/EFI/BOOT/kernel
> > -
> > -cat > boot-esp/EFI/BOOT/BOOTX64.cfg <<EOF
> > -[global]
> > -default=3Dtest
> > -
> > -[test]
> > -options=3Dloglvl=3Dall console=3Dcom1 noreboot console_timestamps=3Dbo=
ot $extra
> > -kernel=3Dkernel
> > -EOF
> > -
> > -cp /usr/share/OVMF/OVMF_CODE.fd OVMF_CODE.fd
> > -cp /usr/share/OVMF/OVMF_VARS.fd OVMF_VARS.fd
> > -
> > -rm -f smoke.serial
> > -export TEST_CMD=3D"qemu-system-x86_64 -nographic -M q35,kernel-irqchip=
=3Dsplit \
> > -        -drive if=3Dpflash,format=3Draw,readonly=3Don,file=3DOVMF_CODE=
.fd \
> > -        -drive if=3Dpflash,format=3Draw,file=3DOVMF_VARS.fd \
> > -        -drive file=3Dfat:rw:boot-esp,media=3Ddisk,index=3D0,format=3D=
raw \
> > -        -m 512 -monitor none -serial stdio"
> > -
> > -export TEST_LOG=3D"smoke.serial"
> > -export PASSED=3D"Test result: SUCCESS"
> > -
> > -./automation/scripts/console.exp | sed 's/\r\+$//'
> > --
> > 2.34.1
> >
> >


