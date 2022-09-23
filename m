Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 000825E85A3
	for <lists+xen-devel@lfdr.de>; Sat, 24 Sep 2022 00:13:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410954.654136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obquk-0003jp-Sj; Fri, 23 Sep 2022 22:12:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410954.654136; Fri, 23 Sep 2022 22:12:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obquk-0003h2-PP; Fri, 23 Sep 2022 22:12:54 +0000
Received: by outflank-mailman (input) for mailman id 410954;
 Fri, 23 Sep 2022 22:12:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wNmR=Z2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1obquj-0003fu-6N
 for xen-devel@lists.xenproject.org; Fri, 23 Sep 2022 22:12:53 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ddbfb770-3b8c-11ed-9374-c1cf23e5d27e;
 Sat, 24 Sep 2022 00:12:52 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 72C3EB82398;
 Fri, 23 Sep 2022 22:12:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4E50C433D6;
 Fri, 23 Sep 2022 22:12:49 +0000 (UTC)
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
X-Inumbo-ID: ddbfb770-3b8c-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663971170;
	bh=4OzxfWs995lq7cEiFbubZ3KzTx0HQxvLVGhqZkgINdU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QaaKZoXU4rgOMZTzcIP1wLNE5gxkKzQmlPbxu5r03aFzy3i4MZqdIgmUjTmW8vT1b
	 4O0sBnzwFeuAy92KmVdWRtLkfXX/CepB8nMBHKJOmkKB9otWJRM1pOFxD4Xq8frt+V
	 Nsoaj5uQEWq1UFYM38JbI5c28Ij4KPztIlDs4IqbDyDvTsTsgj6VnNE9DxlrZkGagC
	 bq2tRtkd8zqJ3aVv9KJkt5qoMmgGCiuoJhyvfbz5tdzePB5nAhrfjQm3QBd0Odi6Uc
	 hGKjoqKX4TAbMNlnXflMQX8y0J5zFd6wISqhVOdUfCzmyLYUXvxnj6JgN+w6ryyf9a
	 jQpO1UNFqni7g==
Date: Fri, 23 Sep 2022 15:12:48 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 5/9] automation: qemu-smoke-arm32.sh: Modify script to
 use ImageBuilder
In-Reply-To: <69d8193b-12e2-459e-6921-e84f0f3775d7@amd.com>
Message-ID: <alpine.DEB.2.22.394.2209231512220.65421@ubuntu-linux-20-04-desktop>
References: <20220922134058.1410-1-michal.orzel@amd.com> <20220922134058.1410-6-michal.orzel@amd.com> <alpine.DEB.2.22.394.2209221507480.65421@ubuntu-linux-20-04-desktop> <69d8193b-12e2-459e-6921-e84f0f3775d7@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 23 Sep 2022, Michal Orzel wrote:
> Hi Stefano,
> 
> On 23/09/2022 00:13, Stefano Stabellini wrote:
> > 
> > 
> > On Thu, 22 Sep 2022, Michal Orzel wrote:
> >> Take an example from arm64 qemu test scripts and use ImageBuilder
> >> to generate u-boot script automatically. Calculating the addresses
> >> manually is quite error prone and also we will be able to benefit
> >> from using ImageBuilder when adding domUs to this test in the future.
> >>
> >> Install and use u-boot from the debian package.
> >> Modify the script so that binaries are loaded from u-boot via tftp.
> > 
> > Great patch! It makes the test a lot better!
> > 
> > 
> >> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> >> ---
> >>  automation/scripts/qemu-smoke-arm32.sh | 57 ++++++++++++--------------
> >>  1 file changed, 27 insertions(+), 30 deletions(-)
> >>
> >> diff --git a/automation/scripts/qemu-smoke-arm32.sh b/automation/scripts/qemu-smoke-arm32.sh
> >> index 530f3892fdd3..765facbe4d66 100755
> >> --- a/automation/scripts/qemu-smoke-arm32.sh
> >> +++ b/automation/scripts/qemu-smoke-arm32.sh
> >> @@ -4,7 +4,9 @@ set -ex
> >>
> >>  export DEBIAN_FRONTENT=noninteractive
> >>  apt-get -qy update
> >> -apt-get -qy install --no-install-recommends device-tree-compiler \
> >> +apt-get -qy install --no-install-recommends u-boot-qemu \
> >> +                                            u-boot-tools \
> >> +                                            device-tree-compiler \
> >>                                              curl \
> >>                                              cpio
> >>
> >> @@ -20,10 +22,6 @@ tar xvzf ../initrd.tar.gz
> >>  find . | cpio -H newc -o | gzip > ../initrd.gz
> >>  cd ..
> >>
> >> -kernel=`stat -L --printf="%s" vmlinuz`
> >> -initrd=`stat -L --printf="%s" initrd.gz`
> >> -
> >> -# For Xen, we need a couple of more node. Dump the DT from QEMU and add them
> >>  # XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
> >>  curl -fsSLO https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fqemu%2Fqemu%2Fraw%2Fv5.2.0%2Fpc-bios%2Fefi-virtio.rom&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7Cd33d5c4c08934fac0cc208da9ce7a3fb%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637994815957091528%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=JuEapfYVLj5P3S5yY%2BAa47Nk4zgbdymjjsiUTmoTmyk%3D&amp;reserved=0
> >>  ./qemu-system-arm \
> >> @@ -36,31 +34,31 @@ curl -fsSLO https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fqemu%2Fqemu%2Fraw%2Fv5.2.0%2Fpc-bios%2Fefi-virtio.rom&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7Cd33d5c4c08934fac0cc208da9ce7a3fb%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637994815957091528%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=JuEapfYVLj5P3S5yY%2BAa47Nk4zgbdymjjsiUTmoTmyk%3D&amp;reserved=0
> >>     -display none \
> >>     -machine dumpdtb=virt.dtb
> >>
> >> -dtc -I dtb -O dts virt.dtb > virt.dts
> >> +# ImageBuilder
> >> +echo 'MEMORY_START="0x40000000"
> >> +MEMORY_END="0x80000000"
> >> +
> >> +DEVICE_TREE="virt.dtb"
> >> +XEN="xen"
> >> +DOM0_KERNEL="vmlinuz"
> >> +DOM0_RAMDISK="initrd.gz"
> >> +DOM0_CMD="console=hvc0 earlyprintk clk_ignore_unused root=/dev/ram0 rdinit=/bin/sh"
> >> +XEN_CMD="console=dtuart dom0_mem=512M bootscrub=0"
> > 
> > This is missing dtuart=/pl011@9000000 compared to the original
> 
> Actually this is not needed because we always have stdout-path defined in chosen to point to /pl011@...

Ah OK, in that case just add a note to the commit message


> but I can add this.

no need


> > 
> > 
> >> +NUM_DOMUS=0
> >> +
> >> +LOAD_CMD="tftpb"
> >> +BOOT_CMD="bootm"
> > 
> > "bootm" because "booti" is not available on arm32, right?
> 
> Exactly.
> > 
> > 
> >> +UBOOT_SOURCE="boot.source"
> >> +UBOOT_SCRIPT="boot.scr"' > config
> >>
> >> -cat >> virt.dts << EOF
> >> -/ {
> >> -     chosen {
> >> -             #address-cells = <0x2>;
> >> -             #size-cells = <0x2>;
> >> -             stdout-path = "/pl011@9000000";
> >> -        xen,xen-bootargs = "console=dtuart dtuart=/pl011@9000000 dom0_mem=512M bootscrub=0";
> >> -             xen,dom0-bootargs = "console=tty0 console=hvc0 earlyprintk clk_ignore_unused root=/dev/ram0 rdinit=/bin/sh";
> >> -             dom0 {
> >> -                     compatible = "xen,linux-zimage", "xen,multiboot-module";
> >> -                     reg = <0x0 0x1000000 0x0 $kernel>;
> >> -             };
> >> -        dom0-ramdisk {
> >> -                     compatible = "xen,linux-initrd", "xen,multiboot-module";
> >> -                     reg = <0x0 0x3200000 0x0 $initrd>;
> >> -             };
> >> -     };
> >> -};
> >> -EOF
> >> -dtc -I dts -O dtb virt.dts > virt.dtb
> >> +rm -rf imagebuilder
> >> +git clone https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.com%2FViryaOS%2Fimagebuilder&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7Cd33d5c4c08934fac0cc208da9ce7a3fb%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637994815957091528%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=i5N8DXMjn%2F80mdXtc%2FwDGJw6ImUrUAjOg0SJp9CkRdQ%3D&amp;reserved=0
> >> +bash imagebuilder/scripts/uboot-script-gen -t tftp -d . -c config
> >>
> >>  rm -f smoke.serial
> >>  set +e
> >> +echo "  virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"| \
> >>  timeout -k 1 240 \
> >>  ./qemu-system-arm \
> >>     -machine virt \
> >> @@ -70,11 +68,10 @@ timeout -k 1 240 \
> >>     -serial stdio \
> >>     -monitor none \
> >>     -display none \
> >> -   -dtb virt.dtb \
> >>     -no-reboot \
> >> -   -kernel ./xen \
> >> -   -device loader,file=./vmlinuz,addr=0x1000000 \
> >> -   -device loader,file=./initrd.gz,addr=0x3200000 |& tee smoke.serial
> >> +   -device virtio-net-pci,netdev=n0 \
> >> +   -netdev user,id=n0,tftp=./ \
> >> +   -bios /usr/lib/u-boot/qemu_arm/u-boot.bin |& tee smoke.serial
> >>
> >>  set -e
> >>  (grep -q "^/ #" smoke.serial) || exit 1
> >> --
> >> 2.25.1
> >>
> 
> ~Michal
> 

