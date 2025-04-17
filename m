Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDDBA92A74
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 20:51:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.958482.1351311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5UKR-0001im-Ty; Thu, 17 Apr 2025 18:51:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 958482.1351311; Thu, 17 Apr 2025 18:51:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5UKR-0001da-Q9; Thu, 17 Apr 2025 18:51:15 +0000
Received: by outflank-mailman (input) for mailman id 958482;
 Thu, 17 Apr 2025 18:51:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EnA5=XD=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u5UKP-0001AH-NZ
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 18:51:13 +0000
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch
 [79.135.106.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee7334df-1bbc-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 20:51:11 +0200 (CEST)
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
X-Inumbo-ID: ee7334df-1bbc-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744915870; x=1745175070;
	bh=fLWzeNXOQKyBjYOSvSxIMxKbfsoO66cF462stcAfBp0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=LDxRc0Dfyr8rRwiV5juQ9AfBssDk6h89s39+xCayF32IZSTfrJnujPHs7/GtoqOXW
	 +DRrI0khpIORjSrys57fsLrNdb+uPylKzFcQ8+c8wZ6NjBxoFwObP+AiZJIIVB9DFD
	 AFbnFk2HFms4eGzfYxNxKRqbXfmrKyZKB/gBODcyiw0HvkQsDZwP7GdgWjZ9GCTYcE
	 A03UB8yx/XzDNLK1Cfjh3D3gakNVA+r8YIdwWxguEWov3JgWeHKYZllhftWqH9mrPu
	 p3LeW92nut6SgcayizsjUEEcrYdERAoApEqWaVr5FnpeRlGdB6+IqZF39VQmdsHH+B
	 Uw/la3SeEarSQ==
Date: Thu, 17 Apr 2025 18:51:05 +0000
To: Stefano Stabellini <sstabellini@kernel.org>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, cardoe@cardoe.com, marmarek@invisiblethingslab.com, dmukhin@ford.com
Subject: Re: [PATCH v1 3/4] CI: switch arm64 XTF test runner to qemu-xtf.sh
Message-ID: <aAFNluwjIrVS7Mxg@kraken>
In-Reply-To: <alpine.DEB.2.22.394.2504161641250.8008@ubuntu-linux-20-04-desktop>
References: <20250416053213.921444-1-dmukhin@ford.com> <20250416053213.921444-4-dmukhin@ford.com> <alpine.DEB.2.22.394.2504161641250.8008@ubuntu-linux-20-04-desktop>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 1f0fc63dafd525e3e3703530191d4722f3c4c89a
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 05:12:55PM -0700, Stefano Stabellini wrote:
> On Wed, 16 Apr 2025, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Hook arm64 QEMU configuration to qemu-xtf.sh and use new script in arm6=
4 CI
> > jobs.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
>=20
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Thanks!

>=20
>=20
> > ---
> >  automation/gitlab-ci/test.yaml                |  4 +-
> >  automation/scripts/.gitignore                 |  3 +
> >  .../scripts/include/configs/xtf-arm64-config  |  2 +
> >  automation/scripts/include/xtf-arm64          | 81 +++++++++++++++++++
> >  automation/scripts/qemu-xtf-dom0less-arm64.sh | 68 ----------------
> >  5 files changed, 88 insertions(+), 70 deletions(-)
> >  create mode 100644 automation/scripts/include/configs/xtf-arm64-config
> >  create mode 100644 automation/scripts/include/xtf-arm64
> >  delete mode 100755 automation/scripts/qemu-xtf-dom0less-arm64.sh
> >
> > diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test=
.yaml
> > index ca1e4eb528..d6e4a0a622 100644
> > --- a/automation/gitlab-ci/test.yaml
> > +++ b/automation/gitlab-ci/test.yaml
> > @@ -571,7 +571,7 @@ qemu-smoke-dom0less-arm64-gcc-debug-earlyprintk:
> >  qemu-xtf-dom0less-arm64-gcc-hyp-xen-version:
> >    extends: .qemu-arm64
> >    script:
> > -    - ./automation/scripts/qemu-xtf-dom0less-arm64.sh hyp-xen-version =
2>&1 | tee ${LOGFILE}
> > +    - ./automation/scripts/qemu-xtf.sh arm64 mmu64le hyp-xen-version 2=
>&1 | tee ${LOGFILE}
> >    needs:
> >      - alpine-3.18-gcc-arm64
> >      - qemu-system-aarch64-6.0.0-arm64-export
> > @@ -579,7 +579,7 @@ qemu-xtf-dom0less-arm64-gcc-hyp-xen-version:
> >  qemu-xtf-dom0less-arm64-gcc-debug-hyp-xen-version:
> >    extends: .qemu-arm64
> >    script:
> > -    - ./automation/scripts/qemu-xtf-dom0less-arm64.sh hyp-xen-version =
2>&1 | tee ${LOGFILE}
> > +    - ./automation/scripts/qemu-xtf.sh arm64 mmu64le hyp-xen-version 2=
>&1 | tee ${LOGFILE}
> >    needs:
> >      - alpine-3.18-gcc-debug-arm64
> >      - qemu-system-aarch64-6.0.0-arm64-export
> > diff --git a/automation/scripts/.gitignore b/automation/scripts/.gitign=
ore
> > index 2f2d6e1ebd..f853da4d89 100644
> > --- a/automation/scripts/.gitignore
> > +++ b/automation/scripts/.gitignore
> > @@ -1,6 +1,9 @@
> >  !include
> >
> >  binaries
> > +imagebuilder
> >  smoke.serial
> >  xen
> >  xtf*/
> > +
> > +*.rom
> > diff --git a/automation/scripts/include/configs/xtf-arm64-config b/auto=
mation/scripts/include/configs/xtf-arm64-config
> > new file mode 100644
> > index 0000000000..9942740927
> > --- /dev/null
> > +++ b/automation/scripts/include/configs/xtf-arm64-config
> > @@ -0,0 +1,2 @@
> > +CONFIG_GICV2=3Dy
> > +CONFIG_SBSA_UART=3Dy
> > diff --git a/automation/scripts/include/xtf-arm64 b/automation/scripts/=
include/xtf-arm64
> > new file mode 100644
> > index 0000000000..68487fe617
> > --- /dev/null
> > +++ b/automation/scripts/include/xtf-arm64
> > @@ -0,0 +1,81 @@
> > +#!/bin/bash
> > +#
> > +# XTF test utilities (arm64).
> > +#
> > +
> > +# Arch-specific environment overrides.
> > +function xtf_arch_prepare()
> > +{
> > +    export FW_PREFIX=3D"${FW_PREFIX:-/usr/lib/u-boot/qemu_arm64/}"
> > +    export QEMU_PREFIX=3D"${QEMU_PREFIX:-${WORKDIR}/}"
> > +    export XEN_BINARY=3D"${XEN_BINARY:-${WORKDIR}/xen}"
> > +    export XEN_CONSOLE=3D"${XEN_CONSOLE:-dtuart}"
> > +    export XTF_SRC_BRANCH=3D"${XTF_SRC_BRANCH:-xtf-arm}"
> > +    export XTF_SRC_URI=3D"${XTF_SRC_URI:-https://gitlab.com/xen-projec=
t/fusa/xtf.git}"
> > +    export XTF_SRC_VARIANTS=3D"mmu64le"
> > +}
> > +
> > +# Perform arch-specific XTF environment setup.
> > +function xtf_arch_setup()
> > +{
> > +    # QEMU looks for "efi-virtio.rom" even if it is unneeded
> > +    curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-vi=
rtio.rom
> > +
> > +    # Crude check for local testing
> > +    if [ ! -d imagebuilder/.git ]; then
> > +        git clone --depth 1 https://gitlab.com/xen-project/imagebuilde=
r.git
> > +    fi
> > +
> > +    cat > ${WORKDIR}/config <<EOF
> > +MEMORY_START=3D"0x40000000"
> > +MEMORY_END=3D"0xC0000000"
> > +
> > +XEN=3D"xen"
> > +DEVICE_TREE=3D"virt-gicv2.dtb"
> > +
> > +XEN_CMD=3D"${XEN_CMDLINE}"
> > +
> > +DOMU_KERNEL[0]=3D"xtf-test"
> > +DOMU_MEM[0]=3D"128"
> > +
> > +NUM_DOMUS=3D1
> > +
> > +LOAD_CMD=3D"tftpb"
> > +UBOOT_SOURCE=3D"boot.source"
> > +UBOOT_SCRIPT=3D"boot.scr"
> > +EOF
> > +    cp ${XTF_BINARY} ${WORKDIR}/xtf-test
> > +
> > +    # Generate virt-gicv2.dtb
> > +    ${WORKDIR}/qemu-system-aarch64 \
> > +        -machine virtualization=3Dtrue \
> > +        -cpu cortex-a57 \
> > +        -machine type=3Dvirt \
> > +        -m 2048 \
> > +        -smp 2 \
> > +        -display none \
> > +        -machine dumpdtb=3D${WORKDIR}/virt-gicv2.dtb
> > +
> > +    # Generate U-Boot environment
> > +    bash -x imagebuilder/scripts/uboot-script-gen \
> > +        -t tftp \
> > +        -d ${WORKDIR}/ \
> > +        -c ${WORKDIR}/config
> > +
> > +    export TEST_CMD=3D"${QEMU_PREFIX}qemu-system-aarch64 \
> > +        -machine virtualization=3Dtrue \
> > +        -cpu cortex-a57 \
> > +        -machine type=3Dvirt \
> > +        -no-reboot \
> > +        -nographic \
> > +        -monitor none \
> > +        -serial stdio \
> > +        -m 2048 \
> > +        -smp 2 \
> > +        -device virtio-net-pci,netdev=3Dn0 \
> > +        -netdev user,id=3Dn0,tftp=3D${WORKDIR} \
> > +        -bios ${FW_PREFIX}u-boot.bin \
> > +    "
> > +
> > +    export UBOOT_CMD=3D"virtio scan; dhcp; tftpb 0x40000000 boot.scr; =
source 0x40000000"
> > +}
> > diff --git a/automation/scripts/qemu-xtf-dom0less-arm64.sh b/automation=
/scripts/qemu-xtf-dom0less-arm64.sh
> > deleted file mode 100755
> > index 436f460c3c..0000000000
> > --- a/automation/scripts/qemu-xtf-dom0less-arm64.sh
> > +++ /dev/null
> > @@ -1,68 +0,0 @@
> > -#!/bin/bash
> > -
> > -set -ex -o pipefail
> > -
> > -# Name of the XTF test
> > -xtf_test=3D$1
> > -
> > -# Message returned by XTF in case of success
> > -passed=3D"Test result: SUCCESS"
> > -
> > -# XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
> > -curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio=
.rom
> > -./binaries/qemu-system-aarch64 \
> > -   -machine virtualization=3Dtrue \
> > -   -cpu cortex-a57 -machine type=3Dvirt \
> > -   -m 2048 -smp 2 -display none \
> > -   -machine dumpdtb=3Dbinaries/virt-gicv2.dtb
> > -
> > -# XTF
> > -# Build a single XTF test passed as a first parameter to the script.
> > -# Build XTF with GICv2 support to match Qemu configuration and with SB=
SA UART
> > -# support, so that the test will use an emulated UART for printing mes=
sages.
> > -# This will allow us to run the test on both debug and non-debug Xen b=
uilds.
> > -rm -rf xtf
> > -git clone https://gitlab.com/xen-project/fusa/xtf.git -b xtf-arm
> > -make -C xtf TESTS=3Dtests/${xtf_test} CONFIG_SBSA_UART=3Dy CONFIG_GICV=
2=3Dy -j$(nproc)
> > -cp xtf/tests/${xtf_test}/test-mmu64le-${xtf_test} binaries/xtf-test
> > -
> > -# ImageBuilder
> > -echo 'MEMORY_START=3D"0x40000000"
> > -MEMORY_END=3D"0xC0000000"
> > -
> > -XEN=3D"xen"
> > -DEVICE_TREE=3D"virt-gicv2.dtb"
> > -
> > -XEN_CMD=3D"console=3Ddtuart console_timestamps=3Dboot"
> > -
> > -DOMU_KERNEL[0]=3D"xtf-test"
> > -DOMU_MEM[0]=3D"128"
> > -
> > -NUM_DOMUS=3D1
> > -
> > -LOAD_CMD=3D"tftpb"
> > -UBOOT_SOURCE=3D"boot.source"
> > -UBOOT_SCRIPT=3D"boot.scr"' > binaries/config
> > -
> > -rm -rf imagebuilder
> > -git clone --depth 1 https://gitlab.com/xen-project/imagebuilder.git
> > -bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c bin=
aries/config
> > -
> > -# Run the test
> > -rm -f smoke.serial
> > -export TEST_CMD=3D"./binaries/qemu-system-aarch64 \
> > -    -machine virtualization=3Dtrue \
> > -    -cpu cortex-a57 -machine type=3Dvirt \
> > -    -m 2048 -monitor none -serial stdio \
> > -    -smp 2 \
> > -    -no-reboot \
> > -    -device virtio-net-pci,netdev=3Dn0 \
> > -    -netdev user,id=3Dn0,tftp=3Dbinaries \
> > -    -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin"
> > -
> > -export UBOOT_CMD=3D"virtio scan; dhcp; tftpb 0x40000000 boot.scr; sour=
ce 0x40000000"
> > -export BOOT_MSG=3D"Latest ChangeSet: "
> > -export TEST_LOG=3D"smoke.serial"
> > -export PASSED=3D"${passed}"
> > -
> > -./automation/scripts/console.exp | sed 's/\r\+$//'
> > --
> > 2.34.1
> >
> >


