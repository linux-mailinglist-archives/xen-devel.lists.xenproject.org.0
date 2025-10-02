Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F68BB23BC
	for <lists+xen-devel@lfdr.de>; Thu, 02 Oct 2025 03:14:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1135226.1472490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v47sQ-0008N9-Eq; Thu, 02 Oct 2025 01:12:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1135226.1472490; Thu, 02 Oct 2025 01:12:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v47sQ-0008K5-92; Thu, 02 Oct 2025 01:12:58 +0000
Received: by outflank-mailman (input) for mailman id 1135226;
 Thu, 02 Oct 2025 01:12:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TuKI=4L=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1v47sP-0008Jz-Op
 for xen-devel@lists.xenproject.org; Thu, 02 Oct 2025 01:12:57 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea19e06e-9f2c-11f0-9809-7dc792cee155;
 Thu, 02 Oct 2025 03:12:51 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 87AF841A2B;
 Thu,  2 Oct 2025 01:12:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B55D7C4CEF7;
 Thu,  2 Oct 2025 01:12:48 +0000 (UTC)
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
X-Inumbo-ID: ea19e06e-9f2c-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759367569;
	bh=khlVyLO7EWTnutYERtHhUFucjYfNiHlK6/Kp/ki/lfk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=eqQ1JyqHPl5zq7lJhTa1LvsD1sAjGd3OpTglXa7srYtfh+BxlwBEgkFehHVIqdotW
	 ny9M0haILH1SrFlgzNe11Yq+Ca1kg/3P4Coc0nmBEnX9fjtC0bLQitd7cU1HgeRcj6
	 KfoII8L7gIRVi08V650vRusQr4V3GKEdICYG2Zmyt7g6CEVD9pN0mLAg2+IabQPfYw
	 mU3EsQXwbWztSqE4S0zhNJPVWxd9udE+UV+eBbug+CdJPe8LIsTRoig4K1XTkZPTrf
	 EyPxwNAzVYakcI988cF8ZEOkX+/z86WiVe3pSxqlw6sU3R7NooE7QF8f3go4z8wMOW
	 V2rfLV3JB/89Q==
Date: Wed, 1 Oct 2025 18:12:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Michal Orzel <michal.orzel@amd.com>, Ayan Kumar Halder <ayankuma@amd.com>, 
    Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [ImageBuilder][PATCH V2] uboot-script-gen: Add ability to
 configure static event channels
In-Reply-To: <20250930174421.2329608-1-oleksandr_tyshchenko@epam.com>
Message-ID: <alpine.DEB.2.22.394.2510011812370.7465@ubuntu-linux-20-04-desktop>
References: <20250930174421.2329608-1-oleksandr_tyshchenko@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 30 Sep 2025, Oleksandr Tyshchenko wrote:
> Add DOMU_STATIC_EVTCHNS[number]="local_port remote_dom_idx remote_port; ..."
> configuration file string option specifying the static event channel
> definitions for domain.
> 
> For the following example:
> DOMU_STATIC_EVTCHNS[0]="10 1 11; 12 1 13"
> DOMU_STATIC_EVTCHNS[1]="11 0 10; 13 0 12"
> 
> it generates:
> fdt mknod /chosen/domU0 evtchn@10
> fdt set /chosen/domU0/evtchn@10 phandle <0xfffffffe>
> fdt set /chosen/domU0/evtchn@10 compatible "xen,evtchn-v1"
> fdt set /chosen/domU0/evtchn@10 xen,evtchn <10 0xfffffffd>
> fdt mknod /chosen/domU0 evtchn@12
> fdt set /chosen/domU0/evtchn@12 phandle <0xfffffffc>
> fdt set /chosen/domU0/evtchn@12 compatible "xen,evtchn-v1"
> fdt set /chosen/domU0/evtchn@12 xen,evtchn <12 0xfffffffb>
> ...
> fdt mknod /chosen/domU1 evtchn@11
> fdt set /chosen/domU1/evtchn@11 phandle <0xfffffffd>
> fdt set /chosen/domU1/evtchn@11 compatible "xen,evtchn-v1"
> fdt set /chosen/domU1/evtchn@11 xen,evtchn <11 0xfffffffe>
> fdt mknod /chosen/domU1 evtchn@13
> fdt set /chosen/domU1/evtchn@13 phandle <0xfffffffb>
> fdt set /chosen/domU1/evtchn@13 compatible "xen,evtchn-v1"
> fdt set /chosen/domU1/evtchn@13 xen,evtchn <13 0xfffffffc>
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>   V2:
>    - completely rework based on Stefano-s suggestion at:
>      https://patchew.org/Xen/20250929180746.1881872-1-oleksandr._5Ftyshchenko@epam.com/
> ---
> ---
>  README.md                |  21 ++++++++
>  scripts/uboot-script-gen |   7 +++
>  scripts/xen_dt_domu      | 103 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 131 insertions(+)
> 
> diff --git a/README.md b/README.md
> index 7b68cf5..2efac97 100644
> --- a/README.md
> +++ b/README.md
> @@ -218,6 +218,27 @@ Where:
>        DOMU_VCPU_HARD_AFFINITY[number,1]="3"
>  ```
>  
> +- DOMU_STATIC_EVTCHNS[number]="local_port remote_dom_idx remote_port; ..."
> +  if specified, this parameter allows the configuration of static event channels
> +  for inter-domain communication. Each entry in DOMU_STATIC_EVTCHNS[number]
> +  specifies one or more event channels for a particular domain.
> +  The configuration format for each event channel definition is a set of
> +  three values:
> +    - local_port: The numeric port number for the local domain's endpoint.
> +      This value must be unique within current domain.
> +    - remote_dom_idx: The array index of the remote domain (e.g., if
> +      connecting to DomU1, this would be `1`).
> +    - remote_port: The numeric port number for the remote domain's endpoint.
> +
> +  Multiple event channel definitions for a single domain can be provided by
> +  separating them with a semicolon (;).
> +
> +  Below is an example that creates two pairs of bidirectional channels between
> +  two domains:
> +  NUM_DOMUS=2
> +  DOMU_STATIC_EVTCHNS[0]="10 1 11; 12 1 13"
> +  DOMU_STATIC_EVTCHNS[1]="11 0 10; 13 0 12"
> +
>  - DOMU_COLORS[number] specifies the colors (cache coloring) to be used
>    for the domain and is in the format startcolor-endcolor
>  
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index 4f92610..e319de8 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -428,6 +428,8 @@ function xen_device_tree_editing()
>          fi
>      fi
>  
> +    xen_dt_build_evtchns_map
> +
>      i=0
>      while test $i -lt $NUM_DOMUS
>      do
> @@ -512,6 +514,11 @@ function xen_device_tree_editing()
>  
>          xen_dt_domu_add_vcpu_nodes "/chosen/domU$i" $i ${DOMU_VCPUS[$i]}
>  
> +        if test "${DOMU_STATIC_EVTCHNS[$i]}"
> +        then
> +            xen_dt_domu_add_evtchns "/chosen/domU$i" "$i" "${DOMU_STATIC_EVTCHNS[$i]}"
> +        fi
> +
>          add_device_tree_kernel "/chosen/domU$i" "domU${i}_kernel" ${domU_kernel_addr[$i]} ${domU_kernel_size[$i]} "${DOMU_CMD[$i]}"
>          if test "${domU_ramdisk_addr[$i]}"
>          then
> diff --git a/scripts/xen_dt_domu b/scripts/xen_dt_domu
> index 8134896..45891b3 100644
> --- a/scripts/xen_dt_domu
> +++ b/scripts/xen_dt_domu
> @@ -37,3 +37,106 @@ function xen_dt_domu_add_vcpu_nodes()
>          fi
>      done
>  }
> +
> +declare -A EVTCHN_ENDPOINT_TO_PHANDLE_MAP
> +
> +function xen_dt_build_evtchns_map()
> +{
> +    local def
> +    local local_dom_idx
> +    local local_port remote_dom_idx remote_port
> +    local new_phandle
> +    local local_key remote_key
> +
> +    for (( local_dom_idx=0; local_dom_idx<$NUM_DOMUS; local_dom_idx++ ))
> +    do
> +        local evtchn_str=${DOMU_STATIC_EVTCHNS[$local_dom_idx]}
> +        if test -z "$evtchn_str"
> +        then
> +            continue
> +        fi
> +
> +        IFS=';' read -ra evtchn_defs <<< "$evtchn_str"
> +
> +        # Loop over each definition and process both endpoints of the connection
> +        for def in "${evtchn_defs[@]}"
> +        do
> +            read -r local_port remote_dom_idx remote_port <<< "$def"
> +            if test -z "$local_port" || test -z "$remote_dom_idx" || test -z "$remote_port"
> +            then
> +                echo "Malformed evtchn definition: '$def' in DOMU_STATIC_EVTCHNS[$local_dom_idx]"
> +                cleanup_and_return_err
> +            fi
> +
> +            # Define keys for both endpoints of the connection
> +            local_key="$local_dom_idx,$local_port"
> +            remote_key="$remote_dom_idx,$remote_port"
> +
> +            if [[ "$local_key" == "$remote_key" ]]; then
> +                echo "Invalid evtchn definition: '$def' in DOMU_STATIC_EVTCHNS[$local_dom_idx]"
> +                cleanup_and_return_err
> +            fi
> +
> +            # For each key, if it is not already in our map, assign it a new phandle
> +            if [[ ! -v EVTCHN_ENDPOINT_TO_PHANDLE_MAP[$local_key] ]]
> +            then
> +                get_next_phandle new_phandle
> +                EVTCHN_ENDPOINT_TO_PHANDLE_MAP[$local_key]=$new_phandle
> +                echo "Local endpoint '$local_key' is assigned phandle '$new_phandle'"
> +            fi
> +
> +            if [[ ! -v EVTCHN_ENDPOINT_TO_PHANDLE_MAP[$remote_key] ]]
> +            then
> +                get_next_phandle new_phandle
> +                EVTCHN_ENDPOINT_TO_PHANDLE_MAP[$remote_key]=$new_phandle
> +                echo "Remote endpoint '$remote_key' is assigned phandle '$new_phandle'"
> +            fi
> +        done
> +    done
> +}
> +
> +function xen_dt_domu_add_evtchns()
> +{
> +    # $1 - dt path
> +    local path=$1
> +    # $2 - index of the current domain
> +    local local_dom_idx=$2
> +    # $3 - full event channel definition string
> +    local evtchn_str=$3
> +
> +    local def
> +    local local_port remote_dom_idx remote_port
> +    local local_phandle remote_phandle
> +    local local_key remote_key
> +
> +    IFS=';' read -ra evtchn_defs <<< "$evtchn_str"
> +
> +    # Loop over each definition and create a node for it
> +    for def in "${evtchn_defs[@]}"
> +    do
> +        read -r local_port remote_dom_idx remote_port <<< "$def"
> +        if test -z "$local_port" || test -z "$remote_dom_idx" || test -z "$remote_port"
> +        then
> +            echo "Malformed evtchn definition: '$def' in DOMU_STATIC_EVTCHNS[$local_dom_idx]"
> +            cleanup_and_return_err
> +        fi
> +
> +        # Re-create the keys for both endpoints of the connection to look up the phandles
> +        local_key="$local_dom_idx,$local_port"
> +        remote_key="$remote_dom_idx,$remote_port"
> +
> +        local_phandle=${EVTCHN_ENDPOINT_TO_PHANDLE_MAP[$local_key]}
> +        remote_phandle=${EVTCHN_ENDPOINT_TO_PHANDLE_MAP[$remote_key]}
> +
> +        if test -z "$local_phandle" || test -z "$remote_phandle"
> +        then
> +            echo "Could not find phandle for endpoint '$local_key' or '$remote_key'"
> +            cleanup_and_return_err
> +        fi
> +
> +        dt_mknode "${path}" "evtchn@$local_port"
> +        dt_set "${path}/evtchn@$local_port" "phandle" "hex" "$local_phandle"
> +        dt_set "${path}/evtchn@$local_port" "compatible" "str" "xen,evtchn-v1"
> +        dt_set "${path}/evtchn@$local_port" "xen,evtchn" "hex" "$local_port $remote_phandle"
> +    done
> +}
> -- 
> 2.34.1
> 

