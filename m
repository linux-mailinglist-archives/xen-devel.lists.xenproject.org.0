Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D686BDDFD
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 02:13:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510850.789329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcyeZ-00067g-Ac; Fri, 17 Mar 2023 01:13:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510850.789329; Fri, 17 Mar 2023 01:13:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcyeZ-00064n-7G; Fri, 17 Mar 2023 01:13:07 +0000
Received: by outflank-mailman (input) for mailman id 510850;
 Fri, 17 Mar 2023 01:13:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mGfD=7J=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pcyeX-00064O-NZ
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 01:13:05 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd03eee3-c460-11ed-b464-930f4c7d94ae;
 Fri, 17 Mar 2023 02:13:02 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8E3C8B822F4;
 Fri, 17 Mar 2023 01:13:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A452FC433D2;
 Fri, 17 Mar 2023 01:12:59 +0000 (UTC)
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
X-Inumbo-ID: dd03eee3-c460-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679015580;
	bh=OwwlbKxwdkIfBXc6LNeZD6MZmi/9GyYkDgrsPTDP9yI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=enMCDxS1XV47DQgXThb4LbSaa6NglXLEFnLdlBHMKMs6O6LcBI8LTUzDiPDIrsF4x
	 OX8qn83S+tivOoZ/ntBU0U1Rb5M/BptAxiBzPlk1yqQub1yN0ediaEV1iyv+08WNVf
	 WhySiA7F5Wu01GtbOaS9LrBcsjBHvyzg0+2knMnOAvdIIeFuDeUilRgOnjy1kwFxeB
	 i7coOIB90xuxCwL11Q5ekcYCttvMH7Tn9Kw0tS+Rb+3sfAy6hjos3hAPGN7C0LEcmp
	 STtVcvB0b3KrMnYkY3cGPrZQPlPjzcaZGDv5J0Sg1+YDmkHCKsElk9YmJP7/VZ1Zb5
	 KbVQz8yFTlhmg==
Date: Thu, 16 Mar 2023 18:12:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "jiamei.xie" <jiamei.xie@arm.com>
cc: xen-devel@lists.xenproject.org, wei.chen@arm.com, sstabellini@kernel.org
Subject: Re: [ImageBuilder][PATCH v2 2/2] uboot-script-gen: add support for
 static shared memory
In-Reply-To: <20230316090921.338472-3-jiamei.xie@arm.com>
Message-ID: <alpine.DEB.2.22.394.2303161808110.3359@ubuntu-linux-20-04-desktop>
References: <20230316090921.338472-1-jiamei.xie@arm.com> <20230316090921.338472-3-jiamei.xie@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 16 Mar 2023, jiamei.xie wrote:
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

The patch is good just a couple of minor comments


> ---
> Changes from v1:
>  - Rather than two separate properties and just use one like follows:
>    Change
>      DOMU_SHARED_MEM[0]="0x50000000 0x6000000 0x10000000"
>      DOMU_SHARED_MEM_ID[0]="my-shared-mem-0"
>    to
>      DOMU_SHARED_MEM[0]="my-shared-mem-0 0x50000000 0x6000000 0x10000000"
> - Use split_value function instead of opencoding it.
> ---
>  README.md                | 17 +++++++++++++++++
>  scripts/uboot-script-gen | 27 +++++++++++++++++++++++++++
>  2 files changed, 44 insertions(+)
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
> index cca3e59..46ea7e5 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -204,6 +204,28 @@ function add_device_tree_xen_static_heap()
>      dt_set "$path" "xen,static-heap" "hex" "${cells[*]}"
>  }
>  
> +function add_device_tree_static_shared_mem()
> +{
> +    local path=$1
> +    local domid=$2

I don't think we need a "domid" parameter, do we? Given that the node
name has the address in it, it cannot conflict anyway with other similar
nodes. So, the following should work?

dt_set "${path}/shared-mem@${shared_mem_host}" "compatible" "str" "xen,domain-shared-memory-v1"


> +    local shared_mem=$3
> +    local SHARED_MEM_ID=${shared_mem%% *}
> +    local regions="${shared_mem#* }"
> +    local cells=()
> +    local SHARED_MEM_HOST=${regions%% *}

please use lower capital letters for local variables, so shared_mem_host
instead of SHARED_MEM_HOST


> +    dt_mknode "${path}" "domU${domid}-shared-mem@${SHARED_MEM_HOST}"
> +
> +    for val in ${regions[@]}
> +    do
> +        cells+=("$(split_value $val)")
> +    done
> +
> +    dt_set "${path}/domU${domid}-shared-mem@${SHARED_MEM_HOST}" "compatible" "str" "xen,domain-shared-memory-v1"
> +    dt_set "${path}/domU${domid}-shared-mem@${SHARED_MEM_HOST}" "xen,shm-id" "str" "${SHARED_MEM_ID}"
> +    dt_set "${path}/domU${domid}-shared-mem@${SHARED_MEM_HOST}" "xen,shared-mem" "hex" "${cells[*]}"
> +}
> +
>  function add_device_tree_cpupools()
>  {
>      local cpu
> @@ -329,6 +351,11 @@ function xen_device_tree_editing()
>              dt_set "/chosen/domU$i" "xen,enhanced" "str" "enabled"
>          fi
>  
> +        if test -n "${DOMU_SHARED_MEM[i]}"
> +        then
> +            add_device_tree_static_shared_mem "/chosen/domU${i}" "${i}" "${DOMU_SHARED_MEM[i]}"
> +        fi

The reason why I suggested to remove the "domid" parameter above is
that ${i} here is not actually the domid, it is just the numeric order
of the domain in the ImageBuilder config file. It happens often in my
tests that Xen assigns different domids to the domains compared to the
order they appear in the ImageBuilder config file and in device tree.


>          if test "${DOMU_COLORS[$i]}"
>          then
>              local startcolor=$(echo "${DOMU_COLORS[$i]}"  | cut -d "-" -f 1)
> -- 
> 2.25.1
> 

