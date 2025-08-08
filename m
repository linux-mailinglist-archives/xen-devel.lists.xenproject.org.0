Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E91B1ED90
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 19:03:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074873.1437343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukQUU-0002vT-Ut; Fri, 08 Aug 2025 17:02:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074873.1437343; Fri, 08 Aug 2025 17:02:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukQUU-0002tq-RB; Fri, 08 Aug 2025 17:02:50 +0000
Received: by outflank-mailman (input) for mailman id 1074873;
 Fri, 08 Aug 2025 17:02:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hyIc=2U=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ukQUR-0002s0-MX
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 17:02:48 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8163c9ce-7479-11f0-a324-13f23c93f187;
 Fri, 08 Aug 2025 19:02:46 +0200 (CEST)
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
X-Inumbo-ID: 8163c9ce-7479-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=5fnnr7ct25cqfmen5z7rikb6zi.protonmail; t=1754672565; x=1754931765;
	bh=NT5uDmgXURs4R2qifQWh81lYqf3GVBj1s5TDaAnGFGo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=lppTQfQjqtWAykrczXzU8H+1BPOutmtFHBaqTW36NR2GLVAN2hB5J/MYCLVrjG87G
	 1jvmnFz4dPtBq5xrmQkJnvyjpp3K9LmNTxVHG9Z6/OPaaMPFNbHozdzL5zdP/bprJV
	 VPM1mqi8pLnZe22tP/V97opLyPGXWauTwN5diAeB4IWxZy1Nt7p3E3KDnp606RDNjp
	 kMBe2fhHNw/MMmkgfcqS7gaZyWrzKTmno1NF2gBP4OiPLf+/mVtnBfTIiQBZcNQ5ch
	 LJb4Sstxlw2tbqhh4wSyGsMxqLHcwtH5j/PEH1SfSOAXcFrY2EIHWKHkRw+WAtM5Ir
	 mkBOXTiFFbc5w==
Date: Fri, 08 Aug 2025 17:02:40 +0000
To: =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 1/3] CI: Add driver domains tests
Message-ID: <aJYtrF5jZLSftOLh@kraken>
In-Reply-To: <0243d946ec451ddf18a620dbcaaa45eba861810a.1754663560.git-series.marmarek@invisiblethingslab.com>
References: <cover.961bf2f7929562a899b182283446598d4c055149.1754663560.git-series.marmarek@invisiblethingslab.com> <0243d946ec451ddf18a620dbcaaa45eba861810a.1754663560.git-series.marmarek@invisiblethingslab.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 9dce6ccc4ceece617a9c45442342e044968590c8
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 08, 2025 at 04:32:41PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> Setup a simple two domU system. One with network backend, running
> xendriverdomain service, and one with frontend, trying to ping the
> backend.
>=20
> Contrary to other similar tests, use disk image instead of initrd, to
> allow bigger rootfs without adding more RAM (for both dom0 and domU).
> But keep using pxelinux as a bootloader as it's easier to setup than
> installing grub on the disk. Theoretically, it could be started via direc=
t
> kernel boot in QEMU, but pxelinux is slightly closer to real-world
> deployment.
>=20
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>

Reviewed-by: Denis Mukhin <dmukhin@ford.com>=20

> ---
> Changes in v2:
> - use heredoc
> - limit ping loop iterations
> - use full "backend" / "frontend" in disk image names
> - print domU consoles directly to /dev/console, to avoid systemd-added
>   messages prefix
> - terminate test on failure, don't wait for timeout
> ---
>  automation/gitlab-ci/test.yaml                  |   8 +-
>  automation/scripts/qemu-driverdomains-x86_64.sh | 130 +++++++++++++++++-
>  2 files changed, 138 insertions(+)
>  create mode 100755 automation/scripts/qemu-driverdomains-x86_64.sh
>=20
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.y=
aml
> index 1f0b27b2378a..5c4b2dc304b4 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -656,6 +656,14 @@ qemu-alpine-x86_64-gcc:
>      - *x86-64-test-needs
>      - alpine-3.18-gcc
>=20
> +qemu-alpine-driverdomains-x86_64-gcc:
> +  extends: .qemu-x86-64
> +  script:
> +    - ./automation/scripts/qemu-driverdomains-x86_64.sh 2>&1 | tee ${LOG=
FILE}
> +  needs:
> +    - *x86-64-test-needs
> +    - alpine-3.18-gcc
> +
>  qemu-smoke-x86-64-gcc:
>    extends: .qemu-smoke-x86-64
>    script:
> diff --git a/automation/scripts/qemu-driverdomains-x86_64.sh b/automation=
/scripts/qemu-driverdomains-x86_64.sh
> new file mode 100755
> index 000000000000..a8e2ceb33527
> --- /dev/null
> +++ b/automation/scripts/qemu-driverdomains-x86_64.sh
> @@ -0,0 +1,130 @@
> +#!/bin/bash
> +
> +set -ex -o pipefail
> +
> +dom0_rootfs_extra_comp=3D()
> +dom0_rootfs_extra_uncomp=3D()
> +
> +cd binaries
> +
> +# DomU rootfs
> +
> +mkdir -p rootfs
> +cd rootfs
> +mkdir -p etc/local.d
> +passed=3D"ping test passed"
> +failed=3D"TEST FAILED"
> +cat > etc/local.d/xen.start << EOF
> +#!/bin/bash
> +
> +set -x
> +
> +if grep -q test=3Dbackend /proc/cmdline; then
> +    brctl addbr xenbr0
> +    ip link set xenbr0 up
> +    ip addr add 192.168.0.1/24 dev xenbr0
> +    bash /etc/init.d/xendriverdomain start
> +    # log backend-related logs to the console
> +    tail -F /var/log/xen/xldevd.log /var/log/xen/xen-hotplug.log >>/dev/=
console 2>/dev/null &
> +else
> +    ip link set eth0 up
> +    ip addr add 192.168.0.2/24 dev eth0
> +    timeout=3D6 # 6*10s
> +    until ping -c 10 192.168.0.1; do
> +        sleep 1
> +        if [ \$timeout -le 0 ]; then
> +            echo "${failed}"
> +            exit 1
> +        fi
> +        ((timeout--))
> +    done
> +    echo "${passed}"
> +fi
> +EOF
> +chmod +x etc/local.d/xen.start
> +zcat ../rootfs.cpio.gz | cpio -imd
> +zcat ../xen-tools.cpio.gz | cpio -imd
> +mkfs.ext4 -d . ../domU-rootfs.img 1024M
> +cd ..
> +rm -rf rootfs
> +
> +# Dom0 rootfs
> +mkdir -p rootfs
> +cd rootfs
> +zcat ../rootfs.cpio.gz | cpio -imd
> +zcat ../xen-tools.cpio.gz | cpio -imd
> +mkdir -p root etc/local.d
> +cat > root/backend.cfg << EOF
> +name=3D"backend"
> +memory=3D512
> +vcpus=3D1
> +kernel=3D"/root/bzImage"
> +extra=3D"console=3Dhvc0 root=3D/dev/xvda net.ifnames=3D0 test=3Dbackend"
> +disk=3D[ '/root/domU-rootfs-backend.img,raw,xvda,rw' ]
> +EOF
> +cat > root/frontend.cfg << EOF
> +name=3D"frontend"
> +memory=3D512
> +vcpus=3D1
> +kernel=3D"/root/bzImage"
> +extra=3D"console=3Dhvc0 root=3D/dev/xvda net.ifnames=3D0 test=3Dfrontend=
"
> +disk=3D[ '/root/domU-rootfs-frontend.img,raw,xvda,rw' ]
> +vif=3D[ 'bridge=3Dxenbr0,backend=3Dbackend' ]
> +EOF
> +
> +cat > etc/local.d/xen.start << EOF
> +#!/bin/bash
> +
> +set -x
> +
> +bash /etc/init.d/xencommons start
> +
> +xl list
> +
> +tail -F /var/log/xen/console/guest-backend.log 2>/dev/null | sed -e "s/^=
/(backend) /" >>/dev/console &
> +tail -F /var/log/xen/console/guest-frontend.log 2>/dev/null | sed -e "s/=
^/(frontend) /" >>/dev/console &
> +xl -vvv create /root/backend.cfg
> +xl -vvv create /root/frontend.cfg
> +EOF
> +chmod +x etc/local.d/xen.start
> +
> +cp ../domU-rootfs.img ./root/domU-rootfs-backend.img
> +cp ../domU-rootfs.img ./root/domU-rootfs-frontend.img
> +cp ../bzImage ./root/
> +mkdir -p etc/default
> +echo 'XENCONSOLED_TRACE=3Dall' >> etc/default/xencommons
> +mkdir -p var/log/xen/console
> +mkfs.ext4 -d . ../dom0-rootfs.img 2048M
> +cd ..
> +rm -rf rootfs
> +
> +cd ..
> +
> +cat >> binaries/pxelinux.0 << EOF
> +#!ipxe
> +
> +kernel xen console=3Dcom1 console_timestamps=3Dboot
> +module bzImage console=3Dhvc0 root=3D/dev/sda net.ifnames=3D0
> +boot
> +EOF
> +
> +# Run the test
> +rm -f smoke.serial
> +export TEST_CMD=3D"qemu-system-x86_64 \
> +    -cpu qemu64,+svm \
> +    -m 2G -smp 2 \
> +    -monitor none -serial stdio \
> +    -nographic \
> +    -device virtio-net-pci,netdev=3Dn0 \
> +    -netdev user,id=3Dn0,tftp=3Dbinaries,bootfile=3D/pxelinux.0 \
> +    -drive file=3Dbinaries/dom0-rootfs.img,format=3Draw"
> +
> +export TEST_LOG=3D"smoke.serial"
> +export BOOT_MSG=3D"Latest ChangeSet: "
> +export LOG_MSG=3D"Domain-0"
> +# exit early on test failure too, check if it was success below
> +export PASSED=3D"$passed|$failed"
> +
> +./automation/scripts/console.exp | sed 's/\r\+$//'
> +
> +grep "$passed" smoke.serial
> --
> git-series 0.9.1
>=20


