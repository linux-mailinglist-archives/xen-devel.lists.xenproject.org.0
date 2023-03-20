Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C7B6C22A4
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 21:28:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512121.791816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peM73-0006XV-GP; Mon, 20 Mar 2023 20:28:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512121.791816; Mon, 20 Mar 2023 20:28:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peM73-0006VF-De; Mon, 20 Mar 2023 20:28:13 +0000
Received: by outflank-mailman (input) for mailman id 512121;
 Mon, 20 Mar 2023 20:28:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uSrZ=7M=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1peM72-0006V7-8P
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 20:28:12 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9e5e325-c75d-11ed-b464-930f4c7d94ae;
 Mon, 20 Mar 2023 21:28:09 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D0DACB810C2;
 Mon, 20 Mar 2023 20:28:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E18AAC4339C;
 Mon, 20 Mar 2023 20:28:05 +0000 (UTC)
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
X-Inumbo-ID: b9e5e325-c75d-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679344086;
	bh=t27e7lzzJdpdv3310dLYIhe+jtc06iWP2gDO8wMDM2k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=eYGSSgHVRgcSjs2DIGk4RdEoSfmbMiaO9kdrEoFbEawc1w8zovDJ3Ms5OrkUwZLuF
	 1IlOmu0PMyTwrwS7Znfo20wTyqnmVtMiZOlaJr61IVufZy2noznpb5g1Na7bFHqB/G
	 ti2x3l5Z5ejLKZ8V32WTxiCg0IBpl9ysefag5drtQN9oZ9b9gpnePr05ZqD6GsYoYz
	 yZI2xgJTx2zcc7OOAyjnu38CeKpvVHUIFTMORSOQxP33Tc04+UycZ7MvX12JoxSymd
	 jwBtsDaWAyIvxeWzhRYEIWLpfjgFcrx2/yXvnw8zVWTrMADsGM9fGrpdSwNcyCKyO9
	 ICN1UCYrVGewA==
Date: Mon, 20 Mar 2023 13:28:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "jiamei.xie" <jiamei.xie@arm.com>
cc: xen-devel@lists.xenproject.org, wei.chen@arm.com, sstabellini@kernel.org
Subject: Re: [ImageBuilder][PATCH v3 2/2] uboot-script-gen: add support for
 static shared memory
In-Reply-To: <20230320062718.365896-3-jiamei.xie@arm.com>
Message-ID: <alpine.DEB.2.22.394.2303201327200.3359@ubuntu-linux-20-04-desktop>
References: <20230320062718.365896-1-jiamei.xie@arm.com> <20230320062718.365896-3-jiamei.xie@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 20 Mar 2023, jiamei.xie wrote:
> Introduce support for creating shared-mem node for dom0less domUs in
> the device tree. Add the following option:
> - DOMU_SHARED_MEM[number]="SHM-ID HPA GPA size"
>   if specified, indicate the unique identifier of the shared memory
>   region is SHM-ID, the host physical address HPA will get mapped at
>   guest address GPA in domU and the memory of size will be reserved to
>   be shared memory.
> 
> The static shared memory is used between two dom0less domUs.
> 
> Below is an example:
> NUM_DOMUS=2
> DOMU_SHARED_MEM[0]="my-shared-mem-0 0x50000000 0x6000000 0x10000000"
> DOMU_SHARED_MEM[1]="my-shared-mem-0 0x50000000 0x6000000 0x10000000"
> 
> This static shared memory region is identified as "my-shared-mem-0",
> host physical address starting at 0x50000000 of 256MB will be reserved
> to be shared between two domUs. It will get mapped at 0x6000000 in both
> guest physical address space. Both DomUs are the borrower domain, the
> owner domain is the default owner domain DOMID_IO.
> 
> Signed-off-by: jiamei.xie <jiamei.xie@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes from v2:
>  - Remove "domid" parameter
>  - Use lower capital letters for local variables
> Changes from v1:
>  - Rather than two separate properties and just use one like follows:
>    Change
>      DOMU_SHARED_MEM[0]="0x50000000 0x6000000 0x10000000"
>      DOMU_SHARED_MEM_ID[0]="my-shared-mem-0"
>    to
>      DOMU_SHARED_MEM[0]="my-shared-mem-0 0x50000000 0x6000000 0x10000000"
>  - Use split_value function instead of opencoding it.
> ---
>  README.md                | 17 +++++++++++++++++
>  scripts/uboot-script-gen | 26 ++++++++++++++++++++++++++
>  2 files changed, 43 insertions(+)
> 
> diff --git a/README.md b/README.md
> index 78b83f1..fe5d205 100644
> --- a/README.md
> +++ b/README.md
> @@ -196,6 +196,23 @@ Where:
>    if specified, indicates the host physical address regions
>    [baseaddr, baseaddr + size) to be reserved to the VM for static allocation.
>  
> +- DOMU_SHARED_MEM[number]="SHM-ID HPA GPA size"
> +  if specified, indicate SHM-ID represents the unique identifier of the shared
> +  memory region, the host physical address HPA will get mapped at guest
> +  address GPA in domU and the memory of size will be reserved to be shared
> +  memory. The shared memory is used between two dom0less domUs.
> +
> +  Below is an example:
> +  NUM_DOMUS=2
> +  DOMU_SHARED_MEM[0]="my-shared-mem-0 0x50000000 0x6000000 0x10000000"
> +  DOMU_SHARED_MEM[1]="my-shared-mem-0 0x50000000 0x6000000 0x10000000"
> +
> +  This static shared memory region is identified as "my-shared-mem-0", host
> +  physical address starting at 0x50000000 of 256MB will be reserved to be
> +  shared between two domUs. It will get mapped at 0x6000000 in both guest
> +  physical address space. Both DomUs are the borrower domain, the owner
> +  domain is the default owner domain DOMID_IO.
> +
>  - DOMU_DIRECT_MAP[number] can be set to 1 or 0.
>    If set to 1, the VM is direct mapped. The default is 1.
>    This is only applicable when DOMU_STATIC_MEM is specified.
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index cca3e59..9656a45 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -204,6 +204,27 @@ function add_device_tree_xen_static_heap()
>      dt_set "$path" "xen,static-heap" "hex" "${cells[*]}"
>  }
>  
> +function add_device_tree_static_shared_mem()
> +{
> +    local path=$1
> +    local shared_mem=$2
> +    local shared_mem_id=${shared_mem%% *}
> +    local regions="${shared_mem#* }"
> +    local cells=()
> +    local shared_mem_host=${regions%% *}
> +
> +    dt_mknode "${path}" "shared-mem@${shared_mem_host}"
> +
> +    for val in ${regions[@]}
> +    do
> +        cells+=("$(split_value $val)")
> +    done
> +
> +    dt_set "${path}/shared-mem@${shared_mem_host}" "compatible" "str" "xen,domain-shared-memory-v1"
> +    dt_set "${path}/shared-mem@${shared_mem_host}" "xen,shm-id" "str" "${shared_mem_id}"
> +    dt_set "${path}/shared-mem@${shared_mem_host}" "xen,shared-mem" "hex" "${cells[*]}"
> +}
> +
>  function add_device_tree_cpupools()
>  {
>      local cpu
> @@ -329,6 +350,11 @@ function xen_device_tree_editing()
>              dt_set "/chosen/domU$i" "xen,enhanced" "str" "enabled"
>          fi
>  
> +        if test -n "${DOMU_SHARED_MEM[i]}"
> +        then
> +            add_device_tree_static_shared_mem "/chosen/domU${i}" "${DOMU_SHARED_MEM[i]}"
> +        fi
> +
>          if test "${DOMU_COLORS[$i]}"
>          then
>              local startcolor=$(echo "${DOMU_COLORS[$i]}"  | cut -d "-" -f 1)
> -- 
> 2.25.1
> 

