Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBAD5E6F81
	for <lists+xen-devel@lfdr.de>; Fri, 23 Sep 2022 00:17:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410498.653530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obUVL-0002w6-IZ; Thu, 22 Sep 2022 22:17:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410498.653530; Thu, 22 Sep 2022 22:17:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obUVL-0002tL-Ft; Thu, 22 Sep 2022 22:17:11 +0000
Received: by outflank-mailman (input) for mailman id 410498;
 Thu, 22 Sep 2022 22:17:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2OXb=ZZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1obUVK-0002tD-Ph
 for xen-devel@lists.xenproject.org; Thu, 22 Sep 2022 22:17:10 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ce4497b-3ac4-11ed-9647-05401a9f4f97;
 Fri, 23 Sep 2022 00:17:09 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5A4E8B80DFF;
 Thu, 22 Sep 2022 22:17:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F0ABC433D6;
 Thu, 22 Sep 2022 22:17:07 +0000 (UTC)
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
X-Inumbo-ID: 4ce4497b-3ac4-11ed-9647-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663885028;
	bh=s5uT+JUCb3kcH+WXkLo+IVTTPypd9jxZYm4UzkJ4HMY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Zv269zCOYmHWSdTKant3rDSBxXw2Lq1IAY3oRn2U34joNOC1FPJxvJp+G+P2fXyD1
	 Utq69j1uRiNR82fSllPgjhS+eqyRGV7DwmjLszzCaIUwCkxLzzd1X5G2AeM5rS7Npz
	 rUWri33EgTbjbPbQddPJuoLUd8/1ur43xsbh1qoRRoKVcf8inC/R1M9r5nh0nsDDLM
	 4QBwpBiiWo9MPLgAVCRm0Flr6nIMEFA7oWujq9MuQhgsDVYRQWuDUcmpshemGYH84c
	 zVm24GpeE0PG2UnnwDp1eEG4C+UmENdgFoebCc1jt5tBMnxOpMho9dzUZkBtQwb4U1
	 eamWKhgBFKIVQ==
Date: Thu, 22 Sep 2022 15:17:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 6/9] automation: qemu-alpine-arm64: Cleanup and fixes
In-Reply-To: <20220922134058.1410-7-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2209221515550.65421@ubuntu-linux-20-04-desktop>
References: <20220922134058.1410-1-michal.orzel@amd.com> <20220922134058.1410-7-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 22 Sep 2022, Michal Orzel wrote:
> Perform the following cleanup:
> - rename the device tree from virt-gicv3 to virt-gicv2 as the GIC version
>   used in this test is v2,
> - use fdtput to perform modifications on the dtb,
> - use DEBIAN_FRONTENT=noninteractive to prevent interactive prompt being
>   stuck waiting for answer other than "yes",
> - fix the number of cpus in the device tree because currently we generate
>   it with a single cpu and try to run QEMU with two,
> - fix the memory size we pass when generating QEMU device tree as it does
>   not match the memory size with what we run QEMU.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/scripts/qemu-alpine-arm64.sh | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/automation/scripts/qemu-alpine-arm64.sh b/automation/scripts/qemu-alpine-arm64.sh
> index f4ac2d856fa0..7b52d77d3c84 100755
> --- a/automation/scripts/qemu-alpine-arm64.sh
> +++ b/automation/scripts/qemu-alpine-arm64.sh
> @@ -2,6 +2,7 @@
>  
>  set -ex
>  
> +export DEBIAN_FRONTENT=noninteractive
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

