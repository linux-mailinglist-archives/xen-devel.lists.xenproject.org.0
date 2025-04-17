Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C29A9286E
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 20:34:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.958415.1351259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5U49-0004tz-MZ; Thu, 17 Apr 2025 18:34:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 958415.1351259; Thu, 17 Apr 2025 18:34:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5U49-0004rg-Jo; Thu, 17 Apr 2025 18:34:25 +0000
Received: by outflank-mailman (input) for mailman id 958415;
 Thu, 17 Apr 2025 18:34:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EnA5=XD=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u5U46-0004ra-Ja
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 18:34:23 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 931aede5-1bba-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 20:34:19 +0200 (CEST)
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
X-Inumbo-ID: 931aede5-1bba-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744914858; x=1745174058;
	bh=FjS29S0pS+V2rysusVkdt7J0m1ic6SwPeYtll5YK41I=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=nkJiG56AqRnLwA6uUyMvrAz1YXr3jKuQV2ttoRYDwQRK7J4fm9+Cosbno0l6ORbLg
	 Ppe38boKtym6WBU2CQXBpv7opexi/YFpb25q0D0uS/ZcPYLAzDMoW6PBp9h4rdQ7c3
	 55+btCDzaedleCTbu9tqwH1iMz49wzH0CQmzGRY1xVGr7204qys8J/QOqeidViUxzP
	 p8FYWa4Ci133j/4HhGVsYlehI1BVAdyZ7S0VlKhmGjjd+oBYrB3gGPjzz4C/B0F3+v
	 biWraLRC0Yl1tkuJpmG1rDF7VDfTNBIkHmPXcIL/bXbROaK4slbLgk8PJnlkeQCLP1
	 +PkL0Tono2S8Q==
Date: Thu, 17 Apr 2025 18:34:13 +0000
To: Stefano Stabellini <sstabellini@kernel.org>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, cardoe@cardoe.com, marmarek@invisiblethingslab.com, dmukhin@ford.com
Subject: Re: [PATCH v1 2/4] CI: switch x86 EFI smoke test runner to qemu-xtf.sh
Message-ID: <aAFJoVYqSLQ/9s2F@kraken>
In-Reply-To: <alpine.DEB.2.22.394.2504161632500.8008@ubuntu-linux-20-04-desktop>
References: <20250416053213.921444-1-dmukhin@ford.com> <20250416053213.921444-3-dmukhin@ford.com> <alpine.DEB.2.22.394.2504161632500.8008@ubuntu-linux-20-04-desktop>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 0cef335ddf150586c0c011f18ac470ea0731cbeb
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 05:14:41PM -0700, Stefano Stabellini wrote:
> On Wed, 16 Apr 2025, dmkhn@proton.me wrote:
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
> > index 0000000000..79622d5a6c
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
>=20
> Any chance we can avoid using WORKDIR? Or alternatively, we can remove
> TOP? Or remove both? :-)

Yeah, it grew a bit convoluted, but I decided to give it a try to collect
opinions.

Thanks for the feedback!

These two variables have different meanings:

- WORKDIR is a scratch location for keeping artifacts like DTB,
  EFI config, imagebuilder config.

- TOP (looks like at the very least needs a better name) is the helper
  variable pointint to the location of automation/scripts.
 =20
>=20
> Maybe it is best to keep WORKDIR and remove TOP, I am not sure. I am
> just trying to reduce the amount of variables used and that we depend
> upon.

I think it should be easy to drop TOP.

>=20
> I assume you tested the pipeline and it worked, right?

Yes, the pipeline is green:

  https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/1770437024

>=20
>=20
> > +    export XEN_CONSOLE=3D"${XEN_CONSOLE:-com1}"
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


