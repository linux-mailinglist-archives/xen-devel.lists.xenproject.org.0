Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 580CCA6639F
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 01:24:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918362.1323060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuKkx-0003jj-TE; Tue, 18 Mar 2025 00:24:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918362.1323060; Tue, 18 Mar 2025 00:24:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuKkx-0003i9-QM; Tue, 18 Mar 2025 00:24:31 +0000
Received: by outflank-mailman (input) for mailman id 918362;
 Tue, 18 Mar 2025 00:24:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gc9A=WF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tuKkw-0003i1-Lb
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 00:24:30 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a189994-038f-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 01:24:28 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 32D39A48E39;
 Tue, 18 Mar 2025 00:18:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2621C4CEE3;
 Tue, 18 Mar 2025 00:24:25 +0000 (UTC)
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
X-Inumbo-ID: 5a189994-038f-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742257466;
	bh=vNwctSOoZVtWHlheg6s31GNG/WsQzY/MUc8VlzhdwFo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=s3L4t1uNCqNlnAmfF3jnn6TKQleL9jBNyt4c0wKa3P+8jEFPipCGgsYhDihlRWCMe
	 g6MUd/aRcw4oZCBwcolYLAq+7yL5TN9Aa+k6+ysphCwgIG1czQjGCpO7wrK1e82A7w
	 99Die8V2fmzYGXiGoQN3qWcPoSP4ohH7kmFdu/0W84m/kaG67rTgvYkr9I5hyI1TWx
	 G2TFd7NM3mC3CcDLov9FQoxYn68SD4N7H67vmpHv52fYXC+kIO+OogXNQHyxpq5jNi
	 GWE7s0hQaCf6ivggomItVQXR1bVoUkCz7E3mH3gDLwn1mcauRaTFa4UWmCIN+Un3Jn
	 0O2UFNyHoYCBw==
Date: Mon, 17 Mar 2025 17:24:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: gragst.linux@gmail.com
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: [ImageBuilder][PATCH] uboot-script-gen: add ability to cfg vcpu
 hard affinity
In-Reply-To: <20250317141909.2502496-1-grygorii_strashko@epam.com>
Message-ID: <alpine.DEB.2.22.394.2503171723440.3477110@ubuntu-linux-20-04-desktop>
References: <20250317141909.2502496-1-grygorii_strashko@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 17 Mar 2025, gragst.linux@gmail.com wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Add DOMU_VCPU_HARD_AFFINITY[number,vcpu] configuration file string option
> specifying the hard affinity configuration for the VM vCPU(vcpu) in DT.
> 
> The format is a comma-separated list of pCPUs or ranges of pCPUs. Ranges
> are hyphen-separated intervals (such as 0-4) and are inclusive on both
> sides. The numbers refer to logical pCPU ids.
> 
> For example:
> DOMU_VCPUS[0]="2"
> DOMU_VCPU_HARD_AFFINITY[0,0]="1"
> 
> will be reflected in domU0/vcpu0 DT node with "hard-affinity" set:
> vcpu0 {
> 	hard-affinity = "1";
> 	id = <0x00000000>;
> 	compatible = "xen,vcpu";
> };
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---
>  README.md                | 11 +++++++++++
>  scripts/uboot-script-gen |  4 ++++
>  scripts/xen_dt_domu      | 39 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 54 insertions(+)
>  create mode 100644 scripts/xen_dt_domu
> 
> diff --git a/README.md b/README.md
> index 5b75018ea956..262022c665be 100644
> --- a/README.md
> +++ b/README.md
> @@ -186,6 +186,17 @@ Where:
>  
>  - DOMU_VCPUS[number] is the number of vcpus for the VM, default 1
>  
> +- DOMU_VCPU_HARD_AFFINITY[number,vcpu] optional, is the A string
> +  specifying the hard affinity configuration for the VM vCPU(vcpu):
> +  a comma-separated list of pCPUs or ranges of pCPUs is used.
> +  Ranges are hyphen-separated intervals (such as `0-4`) and are inclusive
> +  on both sides. The numbers refer to logical pCPU ids. Below is an example:
> +```
> +      DOMU_VCPUS[number]=2
> +      DOMU_VCPU_HARD_AFFINITY[number,0]="0-2"
> +      DOMU_VCPU_HARD_AFFINITY[number,1]="3"
> +```
> +
>  - DOMU_COLORS[number] specifies the colors (cache coloring) to be used
>    for the domain and is in the format startcolor-endcolor
>  
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index 74e3b076910c..9229f9af567b 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -392,6 +392,8 @@ function xen_device_tree_editing()
>              dt_set "/chosen/domU$i" "colors" "hex" "$(printf "0x%x" $bitcolors)"
>          fi
>  
> +        xen_dt_domu_add_vcpu_nodes "/chosen/domU$i" $i ${DOMU_VCPUS[$i]}
> +
>          add_device_tree_kernel "/chosen/domU$i" ${domU_kernel_addr[$i]} ${domU_kernel_size[$i]} "${DOMU_CMD[$i]}"
>          if test "${domU_ramdisk_addr[$i]}"
>          then
> @@ -1164,10 +1166,12 @@ fi
>  
>  check_depends
>  
> +declare -A DOMU_VCPU_HARD_AFFINITY
>  source "$cfg_file"
>  
>  SCRIPT_PATH=$(dirname "$0")
>  source "$SCRIPT_PATH/common"
> +source "$SCRIPT_PATH/xen_dt_domu"
>  
>  # command line overrides
>  LOAD_CMD=${load_opt:-$LOAD_CMD}
> diff --git a/scripts/xen_dt_domu b/scripts/xen_dt_domu
> new file mode 100644
> index 000000000000..e1cb2376c37e
> --- /dev/null
> +++ b/scripts/xen_dt_domu
> @@ -0,0 +1,39 @@
> +#!/bin/bash
> +
> +# uses:
> +# DOMU_VCPU_HARD_AFFINITY
> +function xen_dt_domu_add_vcpu_nodes()
> +{
> +    # $1 - dt path
> +    local path=$1
> +    # $2 - domain number
> +    local dom_num=$2
> +    # $3 - number of vcpus for the domain
> +    local vcpus=$3
> +    local hard_affinity=""
> +    local gen_vcpu=""
> +
> +    for (( vcpu=0; vcpu<${vcpus}; vcpu++ ))
> +    do
> +        gen_vcpu=""
> +        if test "${DOMU_VCPU_HARD_AFFINITY[$dom_num,$vcpu]}"
> +        then
> +            hard_affinity=${DOMU_VCPU_HARD_AFFINITY[$dom_num,$vcpu]}
> +            gen_vcpu="1"
> +        fi
> +
> +        if test -z $gen_vcpu

I would prefer to use quotes ("$gen_vcpu")


> +        then
> +            continue
> +        fi
> +
> +        dt_mknode "${path}" "vcpu$vcpu"
> +        dt_set "${path}/vcpu$vcpu" "compatible" "str_a" "xen,vcpu"
> +        dt_set "${path}/vcpu$vcpu" "id" "int"  "$vcpu"
> +
> +        if test -n $hard_affinity

also here. I'll fix it on commit


> +        then
> +            dt_set "${path}/vcpu$vcpu" "hard-affinity" "str" "$hard_affinity"
> +        fi
> +    done
> +}
> -- 
> 2.34.1
> 

