Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A277D3D119E
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jul 2021 16:47:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159408.293228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6DV1-0001xs-Sv; Wed, 21 Jul 2021 14:47:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159408.293228; Wed, 21 Jul 2021 14:47:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6DV1-0001vJ-Pu; Wed, 21 Jul 2021 14:47:03 +0000
Received: by outflank-mailman (input) for mailman id 159408;
 Wed, 21 Jul 2021 14:47:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m6DV0-0001vC-VT
 for xen-devel@lists.xenproject.org; Wed, 21 Jul 2021 14:47:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m6DUy-0004AY-Ep; Wed, 21 Jul 2021 14:47:00 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m6DUy-0002Am-8d; Wed, 21 Jul 2021 14:47:00 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=mIhEhIM1OV7Gb+ZMrTaJMWMEIGHVNONpqYbwxI8BjqM=; b=o7tSCWmuOh0CYxzj8KFpwiCmmV
	3fliNIuEDZZQnVDPnyVTn15LFoIJID/MZ4yk/mK2/DnK5d5xQ8seVqYVRgBP1hGDYNfEGZN6ofntZ
	8wXJ8v4imHfrEHK/jxbVuwUy6YB2eXBbFMS1Ki9V9ZNnDD/9HXENtfxQ8Uc8ezocFa0M=;
Subject: Re: [PATCH RESEND 2/2] gitlab-ci: add an ARM32 qemu-based smoke test
To: Stefano Stabellini <sstabellini@kernel.org>, cardoe@cardoe.com,
 wl@xen.org, andrew.cooper3@citrix.com
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20210714004854.31135-2-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Message-ID: <2aaddfc5-0502-fd0a-6393-63a17c7f6778@xen.org>
Date: Wed, 21 Jul 2021 15:46:58 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210714004854.31135-2-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 14/07/2021 01:48, Stefano Stabellini wrote:
> Add a minimal ARM32 smoke test based on qemu-system-arm, as provided by
> the test-artifacts qemu container. The minimal test simply boots Xen
> (built from previous build stages) and Dom0. The test is fetching the
> Dom0 kernel and initrd from Debian Jessie: they work just fine and this
> way we don't have to maintain a build for them too.

Debian Jessie is not in LTS anymore. I am entirely sure how long this 
will still be available (older release seems to have disappeared). I 
would suggest to use Bullseye or at least Buster.

> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> ---
>   automation/gitlab-ci/test.yaml         | 23 ++++++++
>   automation/scripts/qemu-smoke-arm32.sh | 72 ++++++++++++++++++++++++++
>   2 files changed, 95 insertions(+)
>   create mode 100755 automation/scripts/qemu-smoke-arm32.sh
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index d3b670b156..7f942dd64b 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -71,6 +71,29 @@ qemu-smoke-arm64-gcc:
>       - /^coverity-tested\/.*/
>       - /^stable-.*/
>   
> +qemu-smoke-arm32-gcc:
> +  stage: test
> +  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
> +  variables:
> +    CONTAINER: debian:unstable-arm64v8
> +  script:
> +    - ./automation/scripts/qemu-smoke-arm32.sh 2>&1 | tee qemu-smoke-arm32.log
> +  dependencies:
> +    - debian-unstable-gcc-arm32
> +    - qemu-system-aarch64-6.0.0-arm32-export
> +  artifacts:
> +    paths:
> +      - smoke.serial
> +      - '*.log'
> +    when: always
> +  tags:
> +    - arm64
> +  except:
> +    - master
> +    - smoke
> +    - /^coverity-tested\/.*/
> +    - /^stable-.*/
> +
>   qemu-smoke-x86-64-gcc:
>     stage: test
>     image: registry.gitlab.com/xen-project/xen/${CONTAINER}
> diff --git a/automation/scripts/qemu-smoke-arm32.sh b/automation/scripts/qemu-smoke-arm32.sh
> new file mode 100755
> index 0000000000..4126be2042
> --- /dev/null
> +++ b/automation/scripts/qemu-smoke-arm32.sh
> @@ -0,0 +1,72 @@
> +#!/bin/bash
> +
> +set -ex
> +
> +# Install QEMU

The bits below doesn't seem to install QEMU. Do you mean "prepare the 
image"?

> +export DEBIAN_FRONTENT=noninteractive
> +apt-get -qy update
> +apt-get -qy install --no-install-recommends device-tree-compiler \
> +                                            curl
> +
> +cd binaries
> +curl -fsSLO http://http.us.debian.org/debian/dists/jessie/main/installer-armhf/current/images/netboot/vmlinuz
> +curl -fsSLO http://http.us.debian.org/debian/dists/jessie/main/installer-armhf/current/images/netboot/initrd.gz

OOI, does this mean all our instances are running in the US?


> +
> +kernel=`stat -L --printf="%s" vmlinuz`
> +initrd=`stat -L --printf="%s" initrd.gz`
> +

NIT: I would suggest to add a comment similar to:

# For Xen, we need a couple of more node. Dump the DT from QEMU and add them

> +# XXX QEMU looks for "efi-virtio.rom" even if it is unneeded

Is this a problem with the package?

> +curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
> +./qemu-system-arm \
> +   -machine virt-6.0 \
> +   -machine virtualization=true \
> +   -smp 4 \
> +   -m 2048 \
> +   -serial stdio \
> +   -monitor none \
> +   -display none \
> +   -machine dumpdtb=virt.dtb
> +
> +dtc -I dtb -O dts virt.dtb > virt.dts

IIRC, Alex was working on add multiboot support in QEMU. Do you know 
what's the state?

> +
> +cat >> virt.dts << EOF
> +/ {
> +	chosen {
> +		#address-cells = <0x2>;
> +		#size-cells = <0x2>;
> +		stdout-path = "/pl011@9000000";
> +        xen,xen-bootargs = "console=dtuart dtuart=/pl011@9000000 dom0_mem=1G dom0_max_vcpus=1 bootscrub=0";

Given that QEMU will expose 4 CPUs, any reason to limit dom0 to 1?

> +		xen,dom0-bootargs = "console=tty0 console=hvc0 earlyprintk clk_ignore_unused root=/dev/ram0 rdinit=/bin/sh init=/bin/sh";
> +		dom0 {
> +			compatible = "xen,linux-zimage", "xen,multiboot-module";
> +			reg = <0x0 0x1000000 0x0 $kernel>;
> +		};
> +        dom0-ramdisk {
> +			compatible = "xen,linux-initrd", "xen,multiboot-module";
> +			reg = <0x0 0x3200000 0x0 $initrd>;
> +		};
> +	};
> +};
> +EOF
> +dtc -I dts -O dtb virt.dts > virt.dtb
> +
> +rm -f smoke.serial
> +set +e
> +timeout -k 1 240 \
> +./qemu-system-arm \
> +   -machine virt-6.0 \
> +   -machine virtualization=true \
> +   -smp 4 \
> +   -m 2048 \

Given seem to be a bit wasteful (and will definitely slow down Xen 
boot). As this is a smoke, can we consider to drop to 512?

> +   -serial stdio \
> +   -monitor none \
> +   -display none \
> +   -dtb virt.dtb \
> +   -no-reboot \
> +   -kernel ./xen \
> +   -device loader,file=./vmlinuz,addr=0x1000000 \
> +   -device loader,file=./initrd.gz,addr=0x3200000 |& tee smoke.serial
> +
> +set -e
> +(grep -q "^BusyBox" smoke.serial) || exit 1

So this look for "BusyBox" anywhere in the log. What if there is a crash 
just after "BusyBox"? Is there something different we can grep?

> +exit 0 >

Cheers,

-- 
Julien Grall

