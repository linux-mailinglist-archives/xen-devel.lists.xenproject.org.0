Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7C85ED20F
	for <lists+xen-devel@lfdr.de>; Wed, 28 Sep 2022 02:30:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413072.656554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odKxd-0002vI-HT; Wed, 28 Sep 2022 00:30:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413072.656554; Wed, 28 Sep 2022 00:30:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odKxd-0002sr-DB; Wed, 28 Sep 2022 00:30:01 +0000
Received: by outflank-mailman (input) for mailman id 413072;
 Wed, 28 Sep 2022 00:30:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uH3I=Z7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1odKxc-0002cG-DA
 for xen-devel@lists.xenproject.org; Wed, 28 Sep 2022 00:30:00 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aec6a5f0-3ec4-11ed-9374-c1cf23e5d27e;
 Wed, 28 Sep 2022 02:29:59 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0E0E161C14;
 Wed, 28 Sep 2022 00:29:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DF66C433D6;
 Wed, 28 Sep 2022 00:29:56 +0000 (UTC)
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
X-Inumbo-ID: aec6a5f0-3ec4-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664324997;
	bh=8TGSMLeg/MbeYf6qeKqB64NxPViVdqiDJeTw5wrJfC4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pvDpqqbhoRhw5mUIqpi8jLuWzK9Ev2Z6nlzRLCRZu5MN/LzVvXwU3kVG/La86dRfq
	 SFoA48yRfcSt0xsarnYYa+rwxRI6cpg6lXauYbn9Nc4RQM7oiFB+Z/ASMrvzbYb6jV
	 8vSD8C9Ki80teJqe+bIl3HSLNYsjkoNTiwTYbk9BF80jNgVOUwTrrlhUx3/RGXHW35
	 pJKMjW1dKGq7KMM9bBAq2x2TX5zm/nMSx/87bnqF5hWhPvqyZozNuTUFr93H2/UVAv
	 hilJR/aFc7HYHMQCRwJIPxzkNJS5Jx3leCpldf0ycTuq5fnQADoMn3KT1FfdAsDUbG
	 a8wgZfAL+bKcg==
Date: Tue, 27 Sep 2022 17:29:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 07/10] automation: qemu-alpine-arm64: Cleanup and
 fixes
In-Reply-To: <20220927094727.12762-8-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2209271553480.922084@ubuntu-linux-20-04-desktop>
References: <20220927094727.12762-1-michal.orzel@amd.com> <20220927094727.12762-8-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 27 Sep 2022, Michal Orzel wrote:
> Perform the following cleanup:
> - rename the device tree from virt-gicv3 to virt-gicv2 as the GIC version
>   used in this test is v2,
> - use fdtput to perform modifications on the dtb,
> - use DEBIAN_FRONTEND=noninteractive to prevent interactive prompt being
>   stuck waiting for answer other than "yes",
> - fix the number of cpus in the device tree because currently we generate
>   it with a single cpu and try to run QEMU with two,
> - fix the memory size we pass when generating QEMU device tree as it does
>   not match the memory size with what we run QEMU.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

I pushed patches 2-10 to a "next" branch on my personal gitlab with the
intention of merging it back as soon as staging reopens:

https://gitlab.com/xen-project/people/sstabellini/xen



> ---
> Changes in v3:
> - s/DEBIAN_FRONTENT/DEBIAN_FRONTEND/, drop Ack
> Changes in v2:
> - none
> ---
>  automation/scripts/qemu-alpine-arm64.sh | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/automation/scripts/qemu-alpine-arm64.sh b/automation/scripts/qemu-alpine-arm64.sh
> index f4ac2d856fa0..9004c537e325 100755
> --- a/automation/scripts/qemu-alpine-arm64.sh
> +++ b/automation/scripts/qemu-alpine-arm64.sh
> @@ -2,6 +2,7 @@
>  
>  set -ex
>  
> +export DEBIAN_FRONTEND=noninteractive
>  apt-get -qy update
>  apt-get -qy install --no-install-recommends u-boot-qemu \
>                                              u-boot-tools \
> @@ -73,18 +74,17 @@ curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
>  ./binaries/qemu-system-aarch64 \
>     -machine virtualization=true \
>     -cpu cortex-a57 -machine type=virt \
> -   -m 1024 -display none \
> -   -machine dumpdtb=binaries/virt-gicv3.dtb
> +   -m 2048 -smp 2 -display none \
> +   -machine dumpdtb=binaries/virt-gicv2.dtb
> +
>  # XXX disable pl061 to avoid Linux crash
> -dtc -I dtb -O dts binaries/virt-gicv3.dtb > binaries/virt-gicv3.dts
> -sed 's/compatible = "arm,pl061.*/status = "disabled";/g' binaries/virt-gicv3.dts > binaries/virt-gicv3-edited.dts
> -dtc -I dts -O dtb binaries/virt-gicv3-edited.dts > binaries/virt-gicv3.dtb
> +fdtput binaries/virt-gicv2.dtb -p -t s /pl061@9030000 status disabled
>  
>  # ImageBuilder
>  echo 'MEMORY_START="0x40000000"
> -MEMORY_END="0x80000000"
> +MEMORY_END="0xC0000000"
>  
> -DEVICE_TREE="virt-gicv3.dtb"
> +DEVICE_TREE="virt-gicv2.dtb"
>  XEN="xen"
>  DOM0_KERNEL="Image"
>  DOM0_RAMDISK="xen-rootfs.cpio.gz"
> -- 
> 2.25.1
> 

