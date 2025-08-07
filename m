Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC904B1D3B1
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 09:49:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072603.1435612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujvNZ-0007mm-Cn; Thu, 07 Aug 2025 07:49:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072603.1435612; Thu, 07 Aug 2025 07:49:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujvNZ-0007lJ-8u; Thu, 07 Aug 2025 07:49:37 +0000
Received: by outflank-mailman (input) for mailman id 1072603;
 Thu, 07 Aug 2025 07:49:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ybbA=2T=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ujvNW-0007lD-DC
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 07:49:35 +0000
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch
 [79.135.106.31]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e13b50f-7363-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 09:49:32 +0200 (CEST)
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
X-Inumbo-ID: 0e13b50f-7363-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1754552971; x=1754812171;
	bh=sK0q8LHiEeboW+yR7qN4ExejpcaZADbLso5ZIIG2rjI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=hJTVxqkrPLOJ2LxoYCrnM8MgTxBXhJzF/rYBZ4YdVFPMh/DGwG5V3NSbv98zdMs1D
	 mpxqhqp6qtTqQhP6NcsvF9G4LlRiuoApV4LdW0Rp5XFazY+ekHdUeMN16YLGnfNeaI
	 v1vfaZXWMO2EWpm/h+f9swAC4UysUWv/o0DboxpxJyRK1xKv26hzorbRKMheUvtXjv
	 FZhFyAPXTVWQx97/4N9SWvVTQhq8/4Jvkq0CWn4llGhsk82imFhmUzrfdKz47mGK/J
	 bZvj2cB4SbG9x3xFwBx3Sp+oFpdDJnLsI3eNxDS9wpr4GK9gCPedoZiC0WZBIXJshL
	 ERoVNb/WbcZ0w==
Date: Thu, 07 Aug 2025 07:49:26 +0000
To: =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 1/2] CI: Add driver domains tests
Message-ID: <aJRagWBzU+FC7wvK@kraken>
In-Reply-To: <4595a5aaa66e8d26ff9851496624ceb9c734ee4c.1754525202.git-series.marmarek@invisiblethingslab.com>
References: <cover.a3ae44ad160fb5827451cd35aa8ebbd546cf3866.1754525202.git-series.marmarek@invisiblethingslab.com> <4595a5aaa66e8d26ff9851496624ceb9c734ee4c.1754525202.git-series.marmarek@invisiblethingslab.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: ad206df7e30e8103fec34f2a9a895287760e13bc
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 07, 2025 at 02:06:49AM +0200, Marek Marczykowski-G=C3=B3recki w=
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
> ---
>  automation/gitlab-ci/test.yaml                  |   8 +-
>  automation/scripts/qemu-driverdomains-x86_64.sh | 116 +++++++++++++++++-
>  2 files changed, 124 insertions(+)
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
> index 000000000000..1caaede7722e
> --- /dev/null
> +++ b/automation/scripts/qemu-driverdomains-x86_64.sh
> @@ -0,0 +1,116 @@
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
> +echo "#!/bin/bash
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
> +    until ping -c 10 192.168.0.1; do

I would limit the number of iterations (60?), otherwise in the worst case t=
he
test will execute intil the test job timeout, which AFAIU is undesired if
anything goes wrong.

> +        sleep 1
> +    done
> +    echo \"${passed}\"
> +fi
> +
> +" > etc/local.d/xen.start

For the block generating xen.start: suggest switching to heredoc like for
pxelinux.0 config below, this way escaping will not be needed.

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
> +echo "name=3D\"backend\"
> +memory=3D512
> +vcpus=3D1
> +kernel=3D\"/root/bzImage\"
> +extra=3D\"console=3Dhvc0 root=3D/dev/xvda net.ifnames=3D0 test=3Dbackend=
\"
> +disk=3D[ '/root/domU-rootfs-b.img,raw,xvda,rw' ]
> +" > root/backend.cfg
> +echo "name=3D\"frontend\"
> +memory=3D512
> +vcpus=3D1
> +kernel=3D\"/root/bzImage\"
> +extra=3D\"console=3Dhvc0 root=3D/dev/xvda net.ifnames=3D0 test=3Dfronten=
d\"
> +disk=3D[ '/root/domU-rootfs-f.img,raw,xvda,rw' ]
> +vif=3D[ 'bridge=3Dxenbr0,backend=3Dbackend' ]
> +" > root/frontend.cfg

.. and heredoc here ^^ ?

> +echo "#!/bin/bash
> +
> +set -x
> +
> +bash /etc/init.d/xencommons start
> +
> +xl list
> +
> +tail -F /var/log/xen/console/guest-backend.log 2>/dev/null | sed -e \"s/=
^/(backend) /\" &
> +tail -F /var/log/xen/console/guest-frontend.log 2>/dev/null | sed -e \"s=
/^/(frontend) /\" &
> +xl -vvv create /root/backend.cfg
> +xl -vvv create /root/frontend.cfg
> +" > etc/local.d/xen.start

.. and heredoc here ^^ ?

> +chmod +x etc/local.d/xen.start
> +
> +cp ../domU-rootfs.img ./root/domU-rootfs-b.img
> +cp ../domU-rootfs.img ./root/domU-rootfs-f.img
                                            ^
Perhaps use "backend" and "frontend" suffixes for clarify?

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
> +export PASSED=3D"$passed"
> +
> +./automation/scripts/console.exp | sed 's/\r\+$//'
> --
> git-series 0.9.1
>=20


