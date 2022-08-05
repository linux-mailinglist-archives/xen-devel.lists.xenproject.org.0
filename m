Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 188C458B16E
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 23:54:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381591.616300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oK5Gf-00066j-9Z; Fri, 05 Aug 2022 21:54:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381591.616300; Fri, 05 Aug 2022 21:54:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oK5Gf-00064h-6n; Fri, 05 Aug 2022 21:54:05 +0000
Received: by outflank-mailman (input) for mailman id 381591;
 Fri, 05 Aug 2022 21:54:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eWLc=YJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oK5Gd-0005UP-Ox
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 21:54:03 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1dced501-1509-11ed-924f-1f966e50362f;
 Fri, 05 Aug 2022 23:54:02 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7406A61B16;
 Fri,  5 Aug 2022 21:54:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 998EFC433D6;
 Fri,  5 Aug 2022 21:54:00 +0000 (UTC)
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
X-Inumbo-ID: 1dced501-1509-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659736440;
	bh=HeOpmd8EG5oGFipfWTztXdQH0uU/mZ5HzFtt2bvbKdM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=T33Gl+apZL8P8AHI+ZnluPcj6h7PK0kATrsXs31qN2YGexGtavc37qTCTf0G/ybRn
	 n3oK/kYPJZkGxTIRVGPVaBE4nFRNPsD3KaZrTixmIOtEkhkJPOLsSAuPJd/t+CAemF
	 qNJ5QWqajFfqlu7jnqYqErMJvtMpDyKYgeLFMRce0M8OrK4h7G1QAV4ElfkhdKFAu3
	 fD2hJRQeBQrIA5RYowoyY9q+HAPWazqAYIqCJYgPvUi7zifOQw32rFW0aM4YNmhBUh
	 znTU7x4zEq/kMgB2u4eqZloL6A+wam80+tdFQ/+uWs415wRIsUcQ/2Z3jGNoDlvIF3
	 eRYFUSwtut9Rw==
Date: Fri, 5 Aug 2022 14:53:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Xenia Ragiadakou <burzalodowa@gmail.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/2] automation: qemu-smoke-arm64: Run ping test over a
 pv network interface
In-Reply-To: <20220805211741.1869068-3-burzalodowa@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2208051453020.3147284@ubuntu-linux-20-04-desktop>
References: <20220805211741.1869068-1-burzalodowa@gmail.com> <20220805211741.1869068-3-burzalodowa@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 6 Aug 2022, Xenia Ragiadakou wrote:
> This patch modified the test in the following way
> - Dom0 is booted with an alpine linux rootfs with the xen tools.
> - Once Dom0 is booted, it starts xenstored, calls init-dom0less to setup
> the xenstore interface for the dom0less Dom1, setups the bridged network
> and attaches a pv network interface to Dom1.
> - In the meantime, Dom1 in its init script tries to assign an ip to eth0
> and ping Dom0,
> - If Dom1 manages to ping Dom0, it prints 'passed'.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> ---
>  automation/gitlab-ci/test.yaml         |  6 ++--
>  automation/scripts/qemu-smoke-arm64.sh | 43 +++++++++++++++++++++++---
>  2 files changed, 43 insertions(+), 6 deletions(-)
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index aa633fb655..2eb6c3866e 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -69,7 +69,8 @@ qemu-smoke-arm64-gcc:
>    script:
>      - ./automation/scripts/qemu-smoke-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
>    needs:
> -    - debian-unstable-gcc-arm64
> +    - alpine-3.12-gcc-arm64
> +    - alpine-3.12-arm64-rootfs-export
>      - kernel-5.19-arm64-export
>      - qemu-system-aarch64-6.0.0-arm64-export
>    artifacts:
> @@ -87,7 +88,8 @@ qemu-smoke-arm64-gcc-staticmem:
>    script:
>      - ./automation/scripts/qemu-smoke-arm64.sh static-mem 2>&1 | tee qemu-smoke-arm64.log
>    needs:
> -    - debian-unstable-gcc-arm64
> +    - alpine-3.12-gcc-arm64
> +    - alpine-3.12-arm64-rootfs-export
>      - kernel-5.19-arm64-export
>      - qemu-system-aarch64-6.0.0-arm64-export
>    artifacts:
> diff --git a/automation/scripts/qemu-smoke-arm64.sh b/automation/scripts/qemu-smoke-arm64.sh
> index b48a20988f..0d19ad52cc 100755
> --- a/automation/scripts/qemu-smoke-arm64.sh
> +++ b/automation/scripts/qemu-smoke-arm64.sh
> @@ -4,8 +4,13 @@ set -ex
>  
>  test_variant=$1
>  
> -passed="BusyBox"
> -check=""
> +passed="passed"
> +check="
> +until ifconfig eth0 192.168.0.2 && ping -c 10 192.168.0.1; do
> +    sleep 30
> +done
> +echo \"${passed}\"
> +"
>  
>  if [[ "${test_variant}" == "static-mem" ]]; then
>      # Memory range that is statically allocated to DOM1
> @@ -68,6 +73,36 @@ cd initrd
>  find . | cpio --create --format='newc' | gzip > ../binaries/initrd
>  cd ..
>  
> +# DOM0 rootfs
> +mkdir -p rootfs
> +cd rootfs
> +tar xzf ../binaries/initrd.tar.gz
> +mkdir proc
> +mkdir run
> +mkdir srv
> +mkdir sys
> +rm var/run
> +cp -ar ../binaries/dist/install/* .
> +
> +echo "#!/bin/bash
> +
> +export LD_LIBRARY_PATH=/usr/local/lib
> +bash /etc/init.d/xencommons start
> +
> +/usr/local/lib/xen/bin/init-dom0less
> +
> +brctl addbr xenbr0
> +brctl addif xenbr0 eth0
> +ifconfig eth0 up
> +ifconfig xenbr0 up
> +ifconfig xenbr0 192.168.0.1
> +
> +xl network-attach 1 type=vif
> +" > etc/local.d/xen.start
> +chmod +x etc/local.d/xen.start
> +echo "rc_verbose=yes" >> etc/rc.conf
> +find . | cpio -H newc -o | gzip > ../binaries/dom0-rootfs.cpio.gz
> +cd ..
>  
>  # ImageBuilder
>  echo 'MEMORY_START="0x40000000"
> @@ -76,7 +111,7 @@ MEMORY_END="0x80000000"
>  DEVICE_TREE="virt-gicv2.dtb"
>  XEN="xen"
>  DOM0_KERNEL="Image"
> -DOM0_RAMDISK="initrd"
> +DOM0_RAMDISK="dom0-rootfs.cpio.gz"
>  XEN_CMD="console=dtuart dom0_mem=512M"
>  
>  NUM_DOMUS=1
> @@ -113,5 +148,5 @@ timeout -k 1 240 \
>      -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin |& tee smoke.serial
>  
>  set -e
> -(grep -q "^BusyBox" smoke.serial && grep -q "DOM1: ${passed}" smoke.serial) || exit 1
> +(grep -q "^Welcome to Alpine Linux 3.12" smoke.serial && grep -q "DOM1: ${passed}" smoke.serial) || exit 1
>  exit 0

This patch looks great! One minor comment: Should we great only for
"^Welcome to Alpine Linux" without the version (3.12) to make it easier
to upgrade in the future?

If you are OK with it, I can remove "3.12" on commit.

