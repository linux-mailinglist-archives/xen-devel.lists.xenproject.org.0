Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E69E1503200
	for <lists+xen-devel@lfdr.de>; Sat, 16 Apr 2022 02:16:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.305992.521160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfW5n-0004f2-Gu; Sat, 16 Apr 2022 00:15:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 305992.521160; Sat, 16 Apr 2022 00:15:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfW5n-0004bq-D8; Sat, 16 Apr 2022 00:15:11 +0000
Received: by outflank-mailman (input) for mailman id 305992;
 Sat, 16 Apr 2022 00:15:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ijIa=U2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nfW5l-0004bk-6c
 for xen-devel@lists.xenproject.org; Sat, 16 Apr 2022 00:15:09 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 444da34f-bd1a-11ec-a405-831a346695d4;
 Sat, 16 Apr 2022 02:15:07 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0B24C622CA;
 Sat, 16 Apr 2022 00:15:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02A5EC385A5;
 Sat, 16 Apr 2022 00:15:03 +0000 (UTC)
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
X-Inumbo-ID: 444da34f-bd1a-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650068104;
	bh=RMCqUIyu+8cc8+ChZ/FDO02YYsUXmU0lQ+m6Z7MF/Zo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=S1ei9TslvEm1hbhqkxfWBr7y2oW8uKYxCqaRVwvVQBT/+K3aEtk0jQntdmWMgu1p4
	 138Jct3Jv2/+YpI0fd4vLA/CDU7RMlYVxOkNjLsuzRhHVgFQOdza9536oRBxSMLAz2
	 73iV4CgVBS5Pr9N3qFCzjFDE+7xTaiz1+w+VKBSbXI7XUbo+caCx6XN5TIOTa3UGrd
	 ipvKVC3d0nV4ALSbtdYP6NqqirCUAD4jTvaEchKK1NKBYoPNBvYazAM8gdGn6NH5Ex
	 ZXTQKQPyu3jrl8P/wq2fArgxvJgYAx2aAALdjfZRVPL0oMMU2x+YMJjFAGv9Ljrgp6
	 QYRcyEbTKyb+g==
Date: Fri, 15 Apr 2022 17:15:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, cardoe@cardoe.com, wl@xen.org, 
    andrew.cooper3@citrix.com, anthony.perard@citrix.com, 
    bertrand.marquis@arm.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v4 2/2] gitlab-ci: add an ARM32 qemu-based smoke test
In-Reply-To: <49c9d0b5-308c-59ea-cd7a-4d369156ffed@arm.com>
Message-ID: <alpine.DEB.2.22.394.2204151714250.915916@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2203221337230.2910984@ubuntu-linux-20-04-desktop> <20220322203854.420940-2-sstabellini@kernel.org> <49c9d0b5-308c-59ea-cd7a-4d369156ffed@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 23 Mar 2022, Michal Orzel wrote:
> Hi Stefano,

Hi Michal,

I addressed both points below. Sorry for taking so long but the CI-loop
was blocked on ARM. Now it is running again.



> On 22.03.2022 21:38, Stefano Stabellini wrote:
> > Add a minimal ARM32 smoke test based on qemu-system-arm, as provided by
> > the test-artifacts qemu container. The minimal test simply boots Xen
> > (built from previous build stages) and Dom0.
> > 
> > The test needs a working kernel and minimal initrd for dom0. Instead of
> > building our own kernel and initrd, which would mean maintaining one or
> > two more builting scripts under automation/, we borrow a kernel and
> > initrd from distros.
> > 
> > For the kernel we pick the Debian Bullseye kernel, which has everything
> > we need already built-in. However, we cannot use the Debian Bullseye
> > initrd because it is 22MB and the large size causes QEMU to core dump.
> > 
> > Instead, use the tiny busybox-based rootfs provided by Alpine Linux,
> > which is really minimal: just 2.5MB. Note that we cannot use the Alpine
> > Linux kernel because that doesn't boot on Xen.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > ---
> > Changes in v4:
> > - improve commit message
> > - use Debian Bullseye kernel
> > - use Alpine Linux initrd
> > ---
> >  automation/gitlab-ci/test.yaml         | 23 ++++++++
> >  automation/scripts/qemu-smoke-arm32.sh | 81 ++++++++++++++++++++++++++
> >  2 files changed, 104 insertions(+)
> >  create mode 100755 automation/scripts/qemu-smoke-arm32.sh
> > 
> > diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> > index ec2a2e1607..42cd725a12 100644
> > --- a/automation/gitlab-ci/test.yaml
> > +++ b/automation/gitlab-ci/test.yaml
> > @@ -95,6 +95,29 @@ qemu-smoke-arm64-gcc:
> >      - /^coverity-tested\/.*/
> >      - /^stable-.*/
> >  
> > +qemu-smoke-arm32-gcc:
> > +  stage: test
> > +  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
> > +  variables:
> > +    CONTAINER: debian:unstable-arm64v8
> > +  script:
> > +    - ./automation/scripts/qemu-smoke-arm32.sh 2>&1 | tee qemu-smoke-arm32.log
> > +  dependencies:
> > +    - debian-unstable-gcc-arm32
> > +    - qemu-system-aarch64-6.0.0-arm32-export
> > +  artifacts:
> > +    paths:
> > +      - smoke.serial
> > +      - '*.log'
> > +    when: always
> > +  tags:
> > +    - arm64
> > +  except:
> > +    - master
> > +    - smoke
> > +    - /^coverity-tested\/.*/
> > +    - /^stable-.*/
> > +
> >  qemu-smoke-x86-64-gcc:
> >    stage: test
> >    image: registry.gitlab.com/xen-project/xen/${CONTAINER}
> > diff --git a/automation/scripts/qemu-smoke-arm32.sh b/automation/scripts/qemu-smoke-arm32.sh
> > new file mode 100755
> > index 0000000000..d554de7939
> > --- /dev/null
> > +++ b/automation/scripts/qemu-smoke-arm32.sh
> > @@ -0,0 +1,81 @@
> > +#!/bin/bash
> > +
> > +set -ex
> > +
> > +export DEBIAN_FRONTENT=noninteractive
> > +apt-get -qy update
> > +apt-get -qy install --no-install-recommends device-tree-compiler \
> > +                                            curl \
> > +                                            cpio
> > +
> > +cd binaries
> > +# Use the kernel from Debian
> > +curl --fail --silent --show-error --location --output vmlinuz http://http.us.debian.org/debian/dists/bullseye/main/installer-armhf/current/images/netboot/vmlinuz
> > +# Use a tiny initrd based on busybox from Alpine Linux
> > +curl --fail --silent --show-error --location --output initrd.tar.gz https://dl-cdn.alpinelinux.org/alpine/v3.15/releases/armhf/alpine-minirootfs-3.15.1-armhf.tar.gz
> > +
> > +mkdir rootfs
> > +cd rootfs
> > +tar xvzf ../initrd.tar.gz
> > +find . | cpio -H newc -o | gzip > ../initrd.gz
> > +cd ..
> > +
> > +kernel=`stat -L --printf="%s" vmlinuz`
> > +initrd=`stat -L --printf="%s" initrd.gz`
> > +
> > +# For Xen, we need a couple of more node. Dump the DT from QEMU and add them
> > +# XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
> > +curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
> > +./qemu-system-arm \
> > +   -machine virt-6.0 \
> Can't we just use "virt" as an alias to the latest virt machine available?
> 
> > +   -machine virtualization=true \
> > +   -smp 4 \
> > +   -m 1024 \
> > +   -serial stdio \
> > +   -monitor none \
> > +   -display none \
> > +   -machine dumpdtb=virt.dtb
> > +
> > +dtc -I dtb -O dts virt.dtb > virt.dts
> > +
> > +cat >> virt.dts << EOF
> > +/ {
> > +	chosen {
> > +		#address-cells = <0x2>;
> > +		#size-cells = <0x2>;
> > +		stdout-path = "/pl011@9000000";
> > +        xen,xen-bootargs = "console=dtuart dtuart=/pl011@9000000 dom0_mem=512M bootscrub=0";
> > +		xen,dom0-bootargs = "console=tty0 console=hvc0 earlyprintk clk_ignore_unused root=/dev/ram0 rdinit=/bin/sh init=/bin/sh";
> As you are using initrd, rdinit is the correct option.
> Specyfing both rdinit and init does not make a lot of sense as the kernel won't reach init= parsing.
> 
> > +		dom0 {
> > +			compatible = "xen,linux-zimage", "xen,multiboot-module";
> > +			reg = <0x0 0x1000000 0x0 $kernel>;
> > +		};
> > +        dom0-ramdisk {
> > +			compatible = "xen,linux-initrd", "xen,multiboot-module";
> > +			reg = <0x0 0x3200000 0x0 $initrd>;
> > +		};
> > +	};
> > +};
> > +EOF
> > +dtc -I dts -O dtb virt.dts > virt.dtb
> > +
> > +rm -f smoke.serial
> > +set +e
> > +timeout -k 1 240 \
> > +./qemu-system-arm \
> > +   -machine virt-6.0 \
> > +   -machine virtualization=true \
> > +   -smp 4 \
> > +   -m 1024 \
> > +   -serial stdio \
> > +   -monitor none \
> > +   -display none \
> > +   -dtb virt.dtb \
> > +   -no-reboot \
> > +   -kernel ./xen \
> > +   -device loader,file=./vmlinuz,addr=0x1000000 \
> > +   -device loader,file=./initrd.gz,addr=0x3200000 |& tee smoke.serial
> > +
> > +set -e
> > +(grep -q "^/ #" smoke.serial) || exit 1
> > +exit 0
> 
> Cheers,
> Michal
> 

