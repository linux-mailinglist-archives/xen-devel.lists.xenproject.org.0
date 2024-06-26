Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EF3917606
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 04:09:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748268.1155887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMI63-0002u7-Po; Wed, 26 Jun 2024 02:09:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748268.1155887; Wed, 26 Jun 2024 02:09:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMI63-0002rg-Mw; Wed, 26 Jun 2024 02:09:19 +0000
Received: by outflank-mailman (input) for mailman id 748268;
 Wed, 26 Jun 2024 02:09:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dBdT=N4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sMI62-0002ra-6C
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 02:09:18 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1539a843-3361-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 04:09:16 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 553DCCE1FF1;
 Wed, 26 Jun 2024 02:09:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D007C32781;
 Wed, 26 Jun 2024 02:09:09 +0000 (UTC)
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
X-Inumbo-ID: 1539a843-3361-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719367749;
	bh=ZiQ3Iy25aBjlBx/M4Y26r8sltgMfPN3mtOiGBPcuwJc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sVvfDyrcAcZhV2AfHau3Ku/DPXE2nLGggpB9EWAC4RYPQ1fM5hB+bCdKasgjTyLE1
	 ZJyrGFHGbFTaQ5Y5a838GffnnMSb3iEy2apgKXJc9oO+dgyFoW5Se0GG63P5FT2MAV
	 KHZeMB5aLNyqQpLU+Ivs26DehC0nwwcousr4nD220v+g0gAE2afgVDdDxaHJJER8HI
	 LvyqZnFxXg/of7Q/mLXZfgSuC5LUmlAjNHeZ0PVTE9rTYLYooHyf0ghqil/g+bn5hF
	 UInCFHDClnmonog4Eoqhj5KeKgqs1hJlKqEAtz965ZLORODtLo5sv6Ezems/1pdgrJ
	 vihMQafCPxrUA==
Date: Tue, 25 Jun 2024 19:09:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org
Subject: Re: [ImageBuilder] Add support for omitting host paddr for static
 shmem regions
In-Reply-To: <20240624075559.15484-1-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2406251908590.3635@ubuntu-linux-20-04-desktop>
References: <20240624075559.15484-1-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Jun 2024, Michal Orzel wrote:
> Reflect the latest Xen support to be able to omit the host physical
> address for static shared memory regions, in which case the address will
> come from the Xen heap.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  README.md                |  7 ++++---
>  scripts/uboot-script-gen | 19 +++++++++++++------
>  2 files changed, 17 insertions(+), 9 deletions(-)
> 
> diff --git a/README.md b/README.md
> index 7683492a6f7f..4fcd908c2c2f 100644
> --- a/README.md
> +++ b/README.md
> @@ -199,9 +199,10 @@ Where:
>  
>  - DOMU_SHARED_MEM[number]="SHM-ID HPA GPA size"
>    if specified, indicate SHM-ID represents the unique identifier of the shared
> -  memory region, the host physical address HPA will get mapped at guest
> -  address GPA in domU and the memory of size will be reserved to be shared
> -  memory. The shared memory is used between two dom0less domUs.
> +  memory region. The host physical address HPA is optional, if specified, will
> +  get mapped at guest address GPA in domU (otherwise it will come from Xen heap)
> +  and the memory of size will be reserved to be shared memory. The shared memory
> +  is used between two dom0less domUs.
>  
>    Below is an example:
>    NUM_DOMUS=2
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index 20cc6ef7f892..8b664e711b10 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -211,18 +211,25 @@ function add_device_tree_static_shared_mem()
>      local shared_mem_id=${shared_mem%% *}
>      local regions="${shared_mem#* }"
>      local cells=()
> -    local shared_mem_host=${regions%% *}
> -
> -    dt_mknode "${path}" "shared-mem@${shared_mem_host}"
> +    local node_name=
>  
>      for val in ${regions[@]}
>      do
>          cells+=("$(split_value $val)")
>      done
>  
> -    dt_set "${path}/shared-mem@${shared_mem_host}" "compatible" "str" "xen,domain-shared-memory-v1"
> -    dt_set "${path}/shared-mem@${shared_mem_host}" "xen,shm-id" "str" "${shared_mem_id}"
> -    dt_set "${path}/shared-mem@${shared_mem_host}" "xen,shared-mem" "hex" "${cells[*]}"
> +    # Less than 3 cells means host address not provided
> +    if [ ${#cells[@]} -lt 3 ]; then
> +        node_name="shared-mem-${shared_mem_id}"
> +    else
> +        node_name="shared-mem@${regions%% *}"
> +    fi
> +
> +    dt_mknode "${path}" "${node_name}"
> +
> +    dt_set "${path}/${node_name}" "compatible" "str" "xen,domain-shared-memory-v1"
> +    dt_set "${path}/${node_name}" "xen,shm-id" "str" "${shared_mem_id}"
> +    dt_set "${path}/${node_name}" "xen,shared-mem" "hex" "${cells[*]}"
>  }
>  
>  function add_device_tree_cpupools()
> -- 
> 2.25.1
> 

