Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 935EB6A8D3B
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 00:49:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505483.778297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXsfN-0000rZ-Tg; Thu, 02 Mar 2023 23:48:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505483.778297; Thu, 02 Mar 2023 23:48:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXsfN-0000pr-Qp; Thu, 02 Mar 2023 23:48:53 +0000
Received: by outflank-mailman (input) for mailman id 505483;
 Thu, 02 Mar 2023 23:48:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4tCB=62=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pXsfM-0000pl-2q
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 23:48:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c70b6ae0-b954-11ed-a550-8520e6686977;
 Fri, 03 Mar 2023 00:48:49 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 98378615E7;
 Thu,  2 Mar 2023 23:48:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60F87C433EF;
 Thu,  2 Mar 2023 23:48:46 +0000 (UTC)
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
X-Inumbo-ID: c70b6ae0-b954-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677800927;
	bh=7a6IbtBRS8S5NBMck0JXQ0Fuo9CoQWI6Jn1MSWmC9Lg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=krzoh8v52XcldIok/HOrPqNKzrH4BLy9ogvg/ffLj6Doo1g/U4Cwv5J6sz0yjh4HJ
	 45x2THMTVsDe2EkTN75aEbmOz8s6X4oLK+OMnmfSSHfTDlew0kgjYD/XRTInuVXrb2
	 sA3b24At6CBJeuW4BZ559eKDlKWGaxyG5NUp0/5rmFlXmAYePP7YeBRCeC5ADe0BYa
	 IQlKB2bN1tCTrZ2Dahk5sAL5T3yjmNh3L8zaVhxnMpQq/tyK/EznbEeXdW5NLO9eem
	 CZ6RD3h5WPpoP1D/1LXq7ka39c6pEoRlkYRSwsRXFZEqFV0PU6doRGn1YPRVUCA1CQ
	 BDJtWjQI8O2Ng==
Date: Thu, 2 Mar 2023 15:48:44 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "jiamei.xie" <jiamei.xie@arm.com>
cc: xen-devel@lists.xenproject.org, wei.chen@arm.com, sstabellini@kernel.org
Subject: Re: [ImageBuilder][PATCH 2/2] uboot-script-gen: Add support for
 static shared memory
In-Reply-To: <20230302044606.136130-3-jiamei.xie@arm.com>
Message-ID: <alpine.DEB.2.22.394.2303021547030.863724@ubuntu-linux-20-04-desktop>
References: <20230302044606.136130-1-jiamei.xie@arm.com> <20230302044606.136130-3-jiamei.xie@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 2 Mar 2023, jiamei.xie wrote:
> Introduce support for creating shared-mem node for dom0less domUs in
> the device tree. Add the following options:
> - DOMU_SHARED_MEM[number]="HPA GPA size"
>   if specified, indicates the host physical address HPA will get mapped
>   at guest address GPA in domU and the memory of size will be reserved
>   to be shared memory.
> - DOMU_SHARED_MEM_ID[number]
>   An arbitrary string that represents the unique identifier of the shared
>   memory region, with a strict limit on the number of characters(\0
>   included)
> 
> The static shared memory is used between two dom0less domUs.
> 
> Below is an example:
> NUM_DOMUS=2
> DOMU_SHARED_MEM[0]="0x50000000 0x6000000 0x10000000"
> DOMU_SHARED_MEM_ID[0]="my-shared-mem-0"
> DOMU_SHARED_MEM[1]="0x50000000 0x6000000 0x10000000"
> DOMU_SHARED_MEM_ID[1]="my-shared-mem-0"

Rather than two separate properties, do you think it would make sense to
just use one as follows?

NUM_DOMUS=2
DOMU_SHARED_MEM[0]="my-shared-mem-0 0x50000000 0x6000000 0x10000000"
DOMU_SHARED_MEM[1]="my-shared-mem-0 0x50000000 0x6000000 0x10000000"

The good thing about bash is that it doesn't care if they are numbers or
strings :-)


> This static shared memory region is identified as "my-shared-mem-0", host
> physical address starting at 0x50000000 of 256MB will be reserved to be
> shared between two domUs. It will get mapped at 0x6000000 in both guest
> physical address space. Both DomUs are the borrower domain, the owner
> domain is the default owner domain DOMID_IO.
> 
> Signed-off-by: jiamei.xie <jiamei.xie@arm.com>
> ---
>  README.md                | 18 ++++++++++++++++++
>  scripts/uboot-script-gen | 26 ++++++++++++++++++++++++++
>  2 files changed, 44 insertions(+)
> 
> diff --git a/README.md b/README.md
> index 787f413..48044ee 100644
> --- a/README.md
> +++ b/README.md
> @@ -192,6 +192,24 @@ Where:
>    if specified, indicates the host physical address regions
>    [baseaddr, baseaddr + size) to be reserved to the VM for static allocation.
>  
> +- DOMU_SHARED_MEM[number]="HPA GPA size" and DOMU_SHARED_MEM_ID[number]
> +  if specified, indicate the host physical address HPA will get mapped at
> +  guest address GPA in domU and the memory of size will be reserved to be
> +  shared memory. The shared memory is used between two dom0less domUs.
> +
> +  Below is an example:
> +  NUM_DOMUS=2
> +  DOMU_SHARED_MEM[0]="0x50000000 0x6000000 0x10000000"
> +  DOMU_SHARED_MEM_ID[0]="my-shared-mem-0"
> +  DOMU_SHARED_MEM[1]="0x50000000 0x6000000 0x10000000"
> +  DOMU_SHARED_MEM_ID[1]="my-shared-mem-0"
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
> index 4775293..46215c8 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -204,6 +204,27 @@ function add_device_tree_static_heap()
>      dt_set "$path" "xen,static-heap" "hex" "${cells[*]}"
>  }
>  
> +function add_device_tree_static_shared_mem()
> +{
> +    local path=$1
> +    local domid=$2
> +    local regions=$3
> +    local SHARED_MEM_ID=$4
> +    local cells=()
> +    local SHARED_MEM_HOST=${regions%% *}
> +
> +    dt_mknode "${path}" "domU${domid}-shared-mem@${SHARED_MEM_HOST}"
> +
> +    for val in ${regions[@]}
> +    do
> +        cells+=("$(printf "0x%x 0x%x" $(($val >> 32)) $(($val & ((1 << 32) - 1))))")
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
> @@ -329,6 +350,11 @@ function xen_device_tree_editing()
>              dt_set "/chosen/domU$i" "xen,enhanced" "str" "enabled"
>          fi
>  
> +        if test -n "${DOMU_SHARED_MEM[i]}" -a -n "${DOMU_SHARED_MEM_ID[i]}"
> +        then
> +                add_device_tree_static_shared_mem "/chosen/domU${i}" "${i}" "${DOMU_SHARED_MEM[i]}" "${DOMU_SHARED_MEM_ID[i]}"
> +        fi
> +
>          if test "${DOMU_COLORS[$i]}"
>          then
>              local startcolor=$(echo "${DOMU_COLORS[$i]}"  | cut -d "-" -f 1)
> -- 
> 2.25.1
> 

