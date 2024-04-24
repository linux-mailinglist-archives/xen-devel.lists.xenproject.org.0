Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC138B177B
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 01:53:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711711.1111895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzmQA-0004Wa-9h; Wed, 24 Apr 2024 23:53:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711711.1111895; Wed, 24 Apr 2024 23:53:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzmQA-0004UC-6u; Wed, 24 Apr 2024 23:53:02 +0000
Received: by outflank-mailman (input) for mailman id 711711;
 Wed, 24 Apr 2024 23:53:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nv0e=L5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rzmQ8-0004PI-FZ
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 23:53:00 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c65a6f49-0295-11ef-b4bb-af5377834399;
 Thu, 25 Apr 2024 01:52:58 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9D850613EF;
 Wed, 24 Apr 2024 23:52:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5F43C113CD;
 Wed, 24 Apr 2024 23:52:55 +0000 (UTC)
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
X-Inumbo-ID: c65a6f49-0295-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714002776;
	bh=Si0oPYrdfXWwamGfuE7rR6t81acbFybLl34/d5TSgUA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SnIuZW2D+xBRknweYEUf8oDr43/DW9+8EqhRC4mM4ifsX+x1MOwnVwF6ywWRDQ6BZ
	 E3wNNN/DMH08HhKoiskycsMLwwPvohrUW8Mp7ZUzlCsddFLXKU/59c2DHjY42xCBmn
	 vgclevDNDMtgd45v3ZHAJpswF5ppBQCzpzIRpcVYOyOLwtNzyjV2VfJOHxxjFaVHOk
	 BhUTMcNH5p1vfz60WKdPOzLlUw9rgwZmxJ3RDlWYYBhxKNbBHy225fT80+tzCfMGdG
	 kjmAg4YZugETPJ/h6eVfZvC7efxG0gyTqMrluRSeo3cuuEd8OzHoOVCS3TD/MdOSPz
	 adB5QJtjTKCNA==
Date: Wed, 24 Apr 2024 16:52:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 3/3] automation: Add arm64 test for running Xen with
 GICv3
In-Reply-To: <20240423161121.138536-4-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2404241652480.3940@ubuntu-linux-20-04-desktop>
References: <20240423161121.138536-1-michal.orzel@amd.com> <20240423161121.138536-4-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 23 Apr 2024, Michal Orzel wrote:
> At the moment, all the Arm64 Qemu tests use GICv2 which is the default
> GIC version used by Qemu. Improve the coverage by adding a new test in
> which Qemu will be configured to have GICv3.
> 
> Rename host device tree name to "virt.dtb" to be GIC version agnostic.
> Use "gic-version" Qemu option to select the version to use. Unless the
> test variant is set to "gicv3", version 2 will be used.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/gitlab-ci/test.yaml                |  8 ++++++++
>  .../scripts/qemu-smoke-dom0less-arm64.sh      | 19 ++++++++++++++-----
>  2 files changed, 22 insertions(+), 5 deletions(-)
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 1e5d86763f6c..ad249fa0a5d9 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -255,6 +255,14 @@ qemu-smoke-dom0less-arm64-gcc-debug:
>      - *arm64-test-needs
>      - alpine-3.18-gcc-debug-arm64
>  
> +qemu-smoke-dom0less-arm64-gcc-debug-gicv3:
> +  extends: .qemu-arm64
> +  script:
> +    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh gicv3 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *arm64-test-needs
> +    - alpine-3.18-gcc-debug-arm64
> +
>  qemu-smoke-dom0less-arm64-gcc-debug-staticmem:
>    extends: .qemu-arm64
>    script:
> diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
> index fc943a1a622c..292c38a56147 100755
> --- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
> +++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
> @@ -4,6 +4,9 @@ set -ex
>  
>  test_variant=$1
>  
> +# Default GIC version
> +gic_version="2"
> +
>  if [ -z "${test_variant}" ]; then
>      passed="ping test passed"
>      domU_check="
> @@ -66,16 +69,22 @@ if [[ "${test_variant}" == "earlyprintk" ]]; then
>      passed="\- Ready \-"
>  fi
>  
> +if [[ "${test_variant}" == "gicv3" ]]; then
> +    gic_version=3
> +    passed="${test_variant} test passed"
> +    domU_check="echo \"${passed}\""
> +fi
> +
>  # XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
>  curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
>  ./binaries/qemu-system-aarch64 \
>     -machine virtualization=true \
> -   -cpu cortex-a57 -machine type=virt \
> +   -cpu cortex-a57 -machine type=virt,gic-version=$gic_version \
>     -m 2048 -smp 2 -display none \
> -   -machine dumpdtb=binaries/virt-gicv2.dtb
> +   -machine dumpdtb=binaries/virt.dtb
>  
>  # XXX disable pl061 to avoid Linux crash
> -fdtput binaries/virt-gicv2.dtb -p -t s /pl061@9030000 status disabled
> +fdtput binaries/virt.dtb -p -t s /pl061@9030000 status disabled
>  
>  # Busybox
>  mkdir -p initrd
> @@ -138,7 +147,7 @@ cd ..
>  echo 'MEMORY_START="0x40000000"
>  MEMORY_END="0x50000000"
>  
> -DEVICE_TREE="virt-gicv2.dtb"
> +DEVICE_TREE="virt.dtb"
>  XEN="xen"
>  DOM0_KERNEL="Image"
>  DOM0_RAMDISK="dom0-rootfs.cpio.gz"
> @@ -200,7 +209,7 @@ echo "  virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"| \
>  timeout -k 1 240 \
>  ./binaries/qemu-system-aarch64 \
>      -machine virtualization=true \
> -    -cpu cortex-a57 -machine type=virt \
> +    -cpu cortex-a57 -machine type=virt,gic-version=$gic_version \
>      -m 2048 -monitor none -serial stdio \
>      -smp 2 \
>      -no-reboot \
> -- 
> 2.25.1
> 

