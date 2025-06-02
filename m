Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C85AACBD7D
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 00:49:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003868.1383486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMDyG-0003tw-06; Mon, 02 Jun 2025 22:49:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003868.1383486; Mon, 02 Jun 2025 22:49:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMDyF-0003rN-TP; Mon, 02 Jun 2025 22:49:31 +0000
Received: by outflank-mailman (input) for mailman id 1003868;
 Mon, 02 Jun 2025 22:49:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rm0f=YR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uMDyE-0003rF-DV
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 22:49:30 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6409f79-4003-11f0-b894-0df219b8e170;
 Tue, 03 Jun 2025 00:49:28 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7B13E614BA;
 Mon,  2 Jun 2025 22:49:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5156EC4CEEB;
 Mon,  2 Jun 2025 22:49:25 +0000 (UTC)
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
X-Inumbo-ID: d6409f79-4003-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748904566;
	bh=ansHrRPspkZxJyjqUC6llvz8ffhfoqC8ss5bw8iix8k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NO+0vbAUaMO6vKs8AV4BMQcXiHbXXBumgrQIG8dBJnzXklI4qXSBq7m7w8S2YaU0/
	 b5z3vKXozBxq9Y+ITlOd5poWTDUwJVloU+7ODwL9FtAuMI5PnPJWPnNa35e/4JXaeN
	 z1lQshbCtLHnymD8iyCdgPlrdsWcHtGQr/bLb4ngHrYQ8Mobj9K2vDy29XBLkg0hOe
	 gN1qHiS4R5aw0YBsQZ6yOkpKXgLK+8uU8GK/DBOqAuBhJRnXc2yAP6SlTcGxi0Jjv6
	 qZZlidrdljD+kEugjN+uroc8vvrYI2iUPZuu8YL+ZMSBG34WMmznkpsNdrcQFrvCed
	 S7SOITGPIySKA==
Date: Mon, 2 Jun 2025 15:49:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH 1/2] CI: Use bash arrays to simplfy dom0 rootfs
 construction
In-Reply-To: <20250602174618.2641439-2-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2506021549180.1147082@ubuntu-linux-20-04-desktop>
References: <20250602174618.2641439-1-andrew.cooper3@citrix.com> <20250602174618.2641439-2-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2053582876-1748904566=:1147082"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2053582876-1748904566=:1147082
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 2 Jun 2025, Andrew Cooper wrote:
> For Qubes, this requires switching from sh to bash.
> 
> This reduces the number of times the target filename needs to be written to 1.
> 
> Expand the comment to explain the concatination constraints.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> 
> v2:
>  * Use dom0_rootfs_extra_{un,}comp arrays
> ---
>  automation/scripts/qubes-x86-64.sh            | 18 ++++++++++++-----
>  .../scripts/xilinx-smoke-dom0-x86_64.sh       | 20 ++++++++++++-------
>  2 files changed, 26 insertions(+), 12 deletions(-)
> 
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> index 8e86940c6eff..5ec6eff6c469 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>  
>  set -ex -o pipefail
>  
> @@ -22,6 +22,8 @@ domU_type="pvh"
>  domU_vif="'bridge=xenbr0',"
>  domU_extra_config=
>  retrieve_xml=
> +dom0_rootfs_extra_comp=()
> +dom0_rootfs_extra_uncomp=()
>  
>  case "${test_variant}" in
>      ### test: smoke test & smoke test PVH & smoke test HVM & smoke test PVSHIM
> @@ -187,10 +189,16 @@ Kernel \r on an \m (\l)
>      rm -rf rootfs
>  fi
>  
> -# Dom0 rootfs
> -cp binaries/ucode.cpio binaries/dom0-rootfs.cpio.gz
> -cat binaries/rootfs.cpio.gz >> binaries/dom0-rootfs.cpio.gz
> -cat binaries/xen-tools.cpio.gz >> binaries/dom0-rootfs.cpio.gz
> +# Dom0 rootfs.  The order or concatination is important; ucode wants to come
> +# first, and all uncompressed must be ahead of compressed.
> +dom0_rootfs_parts=(
> +    binaries/ucode.cpio
> +    "${dom0_rootfs_extra_uncomp[@]}"
> +    binaries/rootfs.cpio.gz
> +    binaries/xen-tools.cpio.gz
> +    "${dom0_rootfs_extra_comp[@]}"
> +)
> +cat "${dom0_rootfs_parts[@]}" > binaries/dom0-rootfs.cpio.gz
>  
>  # test-local configuration
>  mkdir -p rootfs
> diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
> index 8f02fa73bd06..45121f39400a 100755
> --- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
> +++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
> @@ -28,6 +28,8 @@ extra = "root=/dev/ram0 console=hvc0"
>  memory = 512
>  '
>  DOMU_CFG_EXTRA=""
> +dom0_rootfs_extra_comp=()
> +dom0_rootfs_extra_uncomp=()
>  
>  # Select test variant.
>  if [ "${TEST}" = "ping" ]; then
> @@ -71,6 +73,7 @@ do
>    sleep 1
>  done | argo-exec -p 28333 -d 0 -- /bin/echo
>  "
> +    dom0_rootfs_extra_comp+=(binaries/argo.cpio.gz)
>      DOM0_CMD="
>  insmod /lib/modules/\$(uname -r)/updates/xen-argo.ko
>  xl -vvv create /etc/xen/domU.cfg
> @@ -103,13 +106,16 @@ find . | cpio -H newc -o | gzip >> ../binaries/domU-rootfs.cpio.gz
>  cd ..
>  rm -rf rootfs
>  
> -# Dom0 rootfs
> -cp binaries/ucode.cpio binaries/dom0-rootfs.cpio.gz
> -cat binaries/rootfs.cpio.gz >> binaries/dom0-rootfs.cpio.gz
> -cat binaries/xen-tools.cpio.gz >> binaries/dom0-rootfs.cpio.gz
> -if [[ "${TEST}" == argo ]]; then
> -    cat binaries/argo.cpio.gz >> binaries/dom0-rootfs.cpio.gz
> -fi
> +# Dom0 rootfs.  The order or concatination is important; ucode wants to come
> +# first, and all uncompressed must be ahead of compressed.
> +dom0_rootfs_parts=(
> +    binaries/ucode.cpio
> +    "${dom0_rootfs_extra_uncomp[@]}"
> +    binaries/rootfs.cpio.gz
> +    binaries/xen-tools.cpio.gz
> +    "${dom0_rootfs_extra_comp[@]}"
> +)
> +cat "${dom0_rootfs_parts[@]}" > binaries/dom0-rootfs.cpio.gz
>  
>  # test-local configuration
>  mkdir -p rootfs
> -- 
> 2.39.5
> 
--8323329-2053582876-1748904566=:1147082--

