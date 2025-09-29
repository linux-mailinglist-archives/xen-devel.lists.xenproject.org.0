Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD000BAA881
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 21:53:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133355.1471486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Jvk-0007tc-4k; Mon, 29 Sep 2025 19:53:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133355.1471486; Mon, 29 Sep 2025 19:53:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Jvk-0007r8-22; Mon, 29 Sep 2025 19:53:04 +0000
Received: by outflank-mailman (input) for mailman id 1133355;
 Mon, 29 Sep 2025 19:53:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ONJG=4I=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1v3Jvi-0007r2-J2
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 19:53:02 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e690c9cf-9d6d-11f0-9d14-b5c5bf9af7f9;
 Mon, 29 Sep 2025 21:53:00 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BAC8648A65;
 Mon, 29 Sep 2025 19:52:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1256C4CEF4;
 Mon, 29 Sep 2025 19:52:57 +0000 (UTC)
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
X-Inumbo-ID: e690c9cf-9d6d-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759175578;
	bh=yaK3NWvIhH77kqF52JIxXBhOidWQDdPna23D7prhFhM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XUUiKRNWX29jDkKYRGlHSBtLNcH4tyJnzhfzyfRp28OsOX4Le3cYNNPfWjndrx/F/
	 z/OYZIkUN0a/qBkb544LVneoJvwIxiC/1dpp3q99Hxz7o9e/EDwG3XQkHbBLveh/Aa
	 xKwx4PAEomPwedTFNeNjp8kEnEaFOa4KPiN8p7fOGLP0GMEYUDVOeavlAQEVTW89+t
	 HSir27mROUHMIZfdSQ9TFo5ZZ8yKTZCezQ4ixO8mU7CEKjAS0ONOmQV/61jaQHUYjM
	 aZDrGxQE+O5zMc/dMOf4ahEjvgiULeF0F5fbIS40unpaKvMj63I1J+nu4ya0pQTHwo
	 8RaIL12015sVw==
Date: Mon, 29 Sep 2025 12:52:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Michal Orzel <michal.orzel@amd.com>, Ayan Kumar Halder <ayankuma@amd.com>, 
    Stefano Stabellini <stefano.stabellini@amd.com>, sstabellini@kernel.org
Subject: Re: [ImageBuilder] uboot-script-gen: Add ability to configure static
 event channels
In-Reply-To: <20250929180746.1881872-1-oleksandr_tyshchenko@epam.com>
Message-ID: <alpine.DEB.2.22.394.2509291238340.937823@ubuntu-linux-20-04-desktop>
References: <20250929180746.1881872-1-oleksandr_tyshchenko@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 29 Sep 2025, Oleksandr Tyshchenko wrote:
> Add DOMU_STATIC_EVTCHNS[number]="local_id local_port remote_id; ..."
> configuration file string option specifying the static event channel
> definitions for domain.
> 
> The build script uses simple IDs to automatically and safely
> generate the required unique phandle numbers for the device tree.
> The user only needs to define simple numeric IDs and does not need
> to manage complex phandle values.
> 
> For the following example:
> DOMU_STATIC_EVTCHNS[0]="1 10 2; 3 12 4"
> DOMU_STATIC_EVTCHNS[1]="2 11 1; 4 13 3"
> 
> it generates:
> fdt mknod /chosen/domU0 evtchn@1
> fdt set /chosen/domU0/evtchn@1 phandle <0xfffffffe>
> fdt set /chosen/domU0/evtchn@1 compatible "xen,evtchn-v1"
> fdt set /chosen/domU0/evtchn@1 xen,evtchn <10 0xfffffffd>
> fdt mknod /chosen/domU0 evtchn@3
> fdt set /chosen/domU0/evtchn@3 phandle <0xfffffffc>
> fdt set /chosen/domU0/evtchn@3 compatible "xen,evtchn-v1"
> fdt set /chosen/domU0/evtchn@3 xen,evtchn <12 0xfffffffb>
> ...
> fdt mknod /chosen/domU1 evtchn@2
> fdt set /chosen/domU1/evtchn@2 phandle <0xfffffffd>
> fdt set /chosen/domU1/evtchn@2 compatible "xen,evtchn-v1"
> fdt set /chosen/domU1/evtchn@2 xen,evtchn <11 0xfffffffe>
> fdt mknod /chosen/domU1 evtchn@4
> fdt set /chosen/domU1/evtchn@4 phandle <0xfffffffb>
> fdt set /chosen/domU1/evtchn@4 compatible "xen,evtchn-v1"
> fdt set /chosen/domU1/evtchn@4 xen,evtchn <13 0xfffffffc>

I'd like to make an alternative suggestion. The user specifies triplets:
DOMU_STATIC_EVTCHNS[0]="local-id remote-domid remote-id

To generate the example above:

DOMU_STATIC_EVTCHNS[0]="10 1 11; 12 1 13"
DOMU_STATIC_EVTCHNS[1]="11 0 10; 13 0 12"

I think this is better because it doesn't require to invent (useless)
unique numbers as references. Instead, it focuses on the data that
actually matters to the user: the event channel IDs at both ends and
the domains involved. These are things the user must know anyway.

The only catch with this suggesion is the definition of "remote-domid":
in reality the DOMU array index is not the domid in dom0less so we would
have to clarify. Maybe we could define it as remote-domain-index or
something like that.

What do you think?


In ImageBuilder so far we have not used separators like ';' here but I
think it does improve readability so I would keep it.


> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
>  README.md                | 21 ++++++++++
>  scripts/uboot-script-gen |  7 ++++
>  scripts/xen_dt_domu      | 89 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 117 insertions(+)
> 
> diff --git a/README.md b/README.md
> index 7b68cf5..52ed1f7 100644
> --- a/README.md
> +++ b/README.md
> @@ -218,6 +218,27 @@ Where:
>        DOMU_VCPU_HARD_AFFINITY[number,1]="3"
>  ```
>  
> +- DOMU_STATIC_EVTCHNS[number]="local_id local_port remote_id; ..."
> +  if specified, this parameter allows the configuration of static event channels
> +  for inter-domain communication. Each entry in DOMU_STATIC_EVTCHNS[number]
> +  specifies one or more event channels for a particular domain.
> +  The configuration format for each event channel definition is a set of
> +  three values:
> +    - local_id: A simple, unique integer that identifies the local endpoint of
> +      the event channel. This ID must be unique across all domains.
> +    - local_port: The numeric port number for the local endpoint.
> +    - remote_id: The ID of the corresponding remote endpoint to which this
> +      the local port connects.
> +
> +  Multiple event channel definitions for a single domain can be provided by
> +  separating them with a semicolon (;).
> +
> +  Below is an example that creates two pairs of bidirectional channels between
> +  two domains:
> +  NUM_DOMUS=2
> +  DOMU_STATIC_EVTCHNS[0]="1 10 2; 3 12 4"
> +  DOMU_STATIC_EVTCHNS[1]="2 11 1; 4 13 3"
> +
>  - DOMU_COLORS[number] specifies the colors (cache coloring) to be used
>    for the domain and is in the format startcolor-endcolor
>  
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index 4f92610..003a622 100755
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
> +            xen_dt_domu_add_evtchns "/chosen/domU$i" "${DOMU_STATIC_EVTCHNS[$i]}"
> +        fi
> +
>          add_device_tree_kernel "/chosen/domU$i" "domU${i}_kernel" ${domU_kernel_addr[$i]} ${domU_kernel_size[$i]} "${DOMU_CMD[$i]}"
>          if test "${domU_ramdisk_addr[$i]}"
>          then
> diff --git a/scripts/xen_dt_domu b/scripts/xen_dt_domu
> index 8134896..97c5325 100644
> --- a/scripts/xen_dt_domu
> +++ b/scripts/xen_dt_domu
> @@ -37,3 +37,92 @@ function xen_dt_domu_add_vcpu_nodes()
>          fi
>      done
>  }
> +
> +declare -A EVTCHN_ID_TO_PHANDLE_MAP
> +
> +function xen_dt_build_evtchns_map()
> +{
> +    local i
> +    local evtchn_str # The full event channel definition string
> +    local def
> +    local local_id remote_id id
> +    local new_phandle
> +
> +    for (( i=0; i<$NUM_DOMUS; i++ ))
> +    do
> +        evtchn_str=${DOMU_STATIC_EVTCHNS[$i]}
> +        if test -z "$evtchn_str"
> +        then
> +            continue
> +        fi
> +
> +        IFS=';' read -ra evtchn_defs <<< "$evtchn_str"
> +
> +        # Loop over each definition and process both local and remote IDs
> +        for def in "${evtchn_defs[@]}"
> +        do
> +            read -r local_id _ remote_id <<< "$def"
> +            if test -z "$local_id" || test -z "$remote_id"
> +            then
> +                echo "Malformed evtchn definition: '$def'"
> +                cleanup_and_return_err
> +            fi
> +
> +            if [[ "$local_id" == "$remote_id" ]]
> +            then
> +                echo "Invalid evtchn definition: '$def'"
> +                cleanup_and_return_err
> +            fi
> +
> +            for id in $local_id $remote_id
> +            do
> +                # If this ID is not already in our map, assign it a new phandle
> +                if [[ ! -v EVTCHN_ID_TO_PHANDLE_MAP[$id] ]]
> +                then
> +                    get_next_phandle new_phandle
> +                    EVTCHN_ID_TO_PHANDLE_MAP[$id]=$new_phandle
> +                    echo "evtchn ID '$id' is assigned phandle '$new_phandle'"
> +                fi
> +            done
> +        done
> +    done
> +}
> +
> +function xen_dt_domu_add_evtchns()
> +{
> +    # $1 - dt path
> +    local path=$1
> +    # $2 - The full event channel definition string
> +    local evtchn_str=$2
> +
> +    local def
> +    local local_id local_port remote_id
> +    local local_phandle remote_phandle
> +
> +    IFS=';' read -ra evtchn_defs <<< "$evtchn_str"
> +
> +    # Loop over each definition and create a node for it
> +    for def in "${evtchn_defs[@]}"
> +    do
> +        read -r local_id local_port remote_id <<< "$def"
> +        if test -z "$local_id" || test -z "$local_port" || test -z "$remote_id"
> +        then
> +            echo "Malformed evtchn definition: '$def'"
> +            cleanup_and_return_err
> +        fi
> +
> +        # Look up the phandles from our globally-populated map
> +        local_phandle=${EVTCHN_ID_TO_PHANDLE_MAP[$local_id]}
> +        remote_phandle=${EVTCHN_ID_TO_PHANDLE_MAP[$remote_id]}
> +        if test -z "$local_phandle" || test -z "$remote_phandle"
> +        then
> +            echo "Could not find phandle for evtchn ID '$local_id' or '$remote_id'"
> +            cleanup_and_return_err
> +        fi
> +
> +        dt_mknode "${path}" "evtchn@$local_id"
> +        dt_set "${path}/evtchn@$local_id" "phandle" "hex" "$local_phandle"
> +        dt_set "${path}/evtchn@$local_id" "compatible" "str" "xen,evtchn-v1"
> +        dt_set "${path}/evtchn@$local_id" "xen,evtchn" "hex" "$local_port $remote_phandle"
> +    done
> +}
> -- 
> 2.34.1
> 

