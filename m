Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A14D678752
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 21:13:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483199.749205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK3Bs-0000eV-PE; Mon, 23 Jan 2023 20:13:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483199.749205; Mon, 23 Jan 2023 20:13:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK3Bs-0000cT-MH; Mon, 23 Jan 2023 20:13:16 +0000
Received: by outflank-mailman (input) for mailman id 483199;
 Mon, 23 Jan 2023 20:13:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QMpG=5U=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pK3Br-0000cL-2A
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 20:13:15 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ca0cf35-9b5a-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 21:13:12 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E180CB80DE1;
 Mon, 23 Jan 2023 20:13:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3D57C433EF;
 Mon, 23 Jan 2023 20:13:09 +0000 (UTC)
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
X-Inumbo-ID: 5ca0cf35-9b5a-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674504790;
	bh=P7/uM5QvtaIxmCuQb5zfjRw6WzYKyJDmoPb4RNinqSc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oXUQ5yirGysZOUfIoK5GFG/sxB7DaVmj/5Vk3mkpinW+KSqXkvpHJdt+zZ9Uu5cr7
	 +Potjph8v1HOGuox9fp7QPvi8sIK7IfRleX7TrhS9yr0IKQi/EDxq436LBIkqF27Zd
	 2wlIKMLUzu+KcT9Ooy/Ny8/PoVspP8UUsXKJu61kbujRSoFw4pX8SmC8x7bTEtXNZI
	 DKJpa6sBWdmrRPhyYQZVIr43+QNebGL/s7xoUh7PqixMtrGqN2D61z/tKLRqtW12+o
	 oKrTPslPzz8jUkUo5+NiVZ6A27u0fE3Mt4n6Z9HDgyt3Shhm8gqKyFKQ1Isy/y9fPK
	 ie7IyqjkDNdFg==
Date: Mon, 23 Jan 2023 12:12:58 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org, 
    ayankuma@amd.com
Subject: Re: [PATCH] automation: Modify static-mem check in
 qemu-smoke-dom0less-arm64.sh
In-Reply-To: <20230123131023.9408-1-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2301231212510.1978264@ubuntu-linux-20-04-desktop>
References: <20230123131023.9408-1-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 23 Jan 2023, Michal Orzel wrote:
> At the moment, the static-mem check relies on the way Xen exposes the
> memory banks in device tree. As this might change, the check should be
> modified to be generic and not to rely on device tree. In this case,
> let's use /proc/iomem which exposes the memory ranges in %08x format
> as follows:
> <start_addr>-<end_addr> : <description>
> 
> This way, we can grep in /proc/iomem for an entry containing memory
> region defined by the static-mem configuration with "System RAM"
> description. If it exists, mark the test as passed. Also, take the
> opportunity to add 0x prefix to domu_{base,size} definition rather than
> adding it in front of each occurence.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Patch made as part of the discussion:
> https://lore.kernel.org/xen-devel/ba37ee02-c07c-2803-0867-149c779890b6@amd.com/
> 
> CC: Julien, Ayan
> ---
>  automation/scripts/qemu-smoke-dom0less-arm64.sh | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
> index 2b59346fdcfd..182a4b6c18fc 100755
> --- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
> +++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
> @@ -16,14 +16,13 @@ fi
>  
>  if [[ "${test_variant}" == "static-mem" ]]; then
>      # Memory range that is statically allocated to DOM1
> -    domu_base="50000000"
> -    domu_size="10000000"
> +    domu_base="0x50000000"
> +    domu_size="0x10000000"
>      passed="${test_variant} test passed"
>      domU_check="
> -current=\$(hexdump -e '16/1 \"%02x\"' /proc/device-tree/memory@${domu_base}/reg 2>/dev/null)
> -expected=$(printf \"%016x%016x\" 0x${domu_base} 0x${domu_size})
> -if [[ \"\${expected}\" == \"\${current}\" ]]; then
> -	echo \"${passed}\"
> +mem_range=$(printf \"%08x-%08x\" ${domu_base} $(( ${domu_base} + ${domu_size} - 1 )))
> +if grep -q -x \"\${mem_range} : System RAM\" /proc/iomem; then
> +    echo \"${passed}\"
>  fi
>  "
>  fi
> @@ -126,7 +125,7 @@ UBOOT_SOURCE="boot.source"
>  UBOOT_SCRIPT="boot.scr"' > binaries/config
>  
>  if [[ "${test_variant}" == "static-mem" ]]; then
> -    echo -e "\nDOMU_STATIC_MEM[0]=\"0x${domu_base} 0x${domu_size}\"" >> binaries/config
> +    echo -e "\nDOMU_STATIC_MEM[0]=\"${domu_base} ${domu_size}\"" >> binaries/config
>  fi
>  
>  if [[ "${test_variant}" == "boot-cpupools" ]]; then
> -- 
> 2.25.1
> 

