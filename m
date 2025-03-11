Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C485A5D27D
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 23:24:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909479.1316416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts810-00088r-Eq; Tue, 11 Mar 2025 22:23:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909479.1316416; Tue, 11 Mar 2025 22:23:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts810-00086e-C0; Tue, 11 Mar 2025 22:23:58 +0000
Received: by outflank-mailman (input) for mailman id 909479;
 Tue, 11 Mar 2025 22:23:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NzKm=V6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ts80z-00086X-3Z
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 22:23:57 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84a97b5d-fec7-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 23:23:55 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 81B0D5C0EDA;
 Tue, 11 Mar 2025 22:21:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 898BEC4CEE9;
 Tue, 11 Mar 2025 22:23:53 +0000 (UTC)
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
X-Inumbo-ID: 84a97b5d-fec7-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741731834;
	bh=qPLwOL4nPpcjqjxtTsXC7gZJIkx/wGSIIUdYdkvwBkE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nTW45xF0l5AVC3w1o0PIoQRHamvZILpYZXp9drfwAQ0wrSJSUaoQ91QudO/cFE0Xn
	 COFbZtOW6ZPtb4BjhQCP0f+zCGidam8CmGfo6SikuJ7Z8vkQ8bcGJZ912aqRB2wYrw
	 tuRjlFEjFmr/UJisGj9dRZ1HCDLyyidZle+LNJ2G+OelAqznY0C+BYaaRpMH+X7nI/
	 75J9IspCLfC3Tfc+5FQ2KPfCj5gIczNvO3TFjLtAVWW7j/oAzMzWkESjm44taXSt2x
	 REG9no1vHS3WuZLVgQWSp4Kh21dC4rmi4g8clSMueTFH1vHrYbk6ntRWDEx64X0RL5
	 Vr3yDZjpmDPWQ==
Date: Tue, 11 Mar 2025 15:23:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Miccio <luca.miccio@amd.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org
Subject: Re: [ImageBuilder][PATCH v2] uboot-script-gen: handle reserved memory
 regions
In-Reply-To: <20250311111548.3696851-1-luca.miccio@amd.com>
Message-ID: <alpine.DEB.2.22.394.2503111523450.3090675@ubuntu-linux-20-04-desktop>
References: <20250311111548.3696851-1-luca.miccio@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 11 Mar 2025, Luca Miccio wrote:
> Currently, the uboot-script-gen does not account for reserved memory
> regions in the device tree. This oversight can lead to scenarios where
> one or more boot modules overlap with a reserved region. As a result,
> Xen will always crash upon detecting this overlap. However, the crash
> will be silent (without output) if earlyprintk is not enabled, which is
> the default setting at the moment.
> 
> To address this issue, add a function that iterates over the
> reserved-memory nodes if any and populates an array. This array will
> be used later to calculate the load address for any given file.
> 
> Signed-off-by: Luca Miccio <luca.miccio@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> v1->v2
>  - added local
>  - check if reserved node exists
>  - handle fdtget errors
>  - use numeric check for duplicates
> ---
>  scripts/uboot-script-gen | 84 ++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 81 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index db2c011..edc6a4c 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -468,6 +468,67 @@ function device_tree_editing()
>      fi
>  }
>  
> +function fill_reserved_spaces_from_dtb()
> +{
> +    if [ ! -f $DEVICE_TREE ]
> +    then
> +        echo "File $DEVICE_TREE doesn't exist, exiting";
> +        cleanup_and_return_err
> +    fi
> +
> +    # Check if reserved-memory node exists
> +    if ! fdtget -l $DEVICE_TREE /reserved-memory &> /dev/null
> +    then
> +        return
> +    fi
> +
> +    local addr_cells=$(fdtget -t x $DEVICE_TREE /reserved-memory '#address-cells' 2> /dev/null\
> +                    || fdtget -t x $DEVICE_TREE / '#address-cells' 2> /dev/null)
> +    local size_cells=$(fdtget -t x $DEVICE_TREE /reserved-memory '#size-cells' 2> /dev/null\
> +                    || fdtget -t x $DEVICE_TREE / '#size-cells' 2> /dev/null)
> +
> +    if [ -z "$addr_cells" ] || [ -z "$size_cells" ]; then
> +        echo "Could not find #address-cells or #size-cells properties for reserved-memory node in $DEVICE_TREE"
> +        cleanup_and_return_err
> +    fi
> +
> +    for node in $(fdtget -l $DEVICE_TREE /reserved-memory); do
> +        local reg_values=($(fdtget -t x $DEVICE_TREE /reserved-memory/$node reg))
> +        local i=0
> +        for ((i=0; i<${#reg_values[@]}; i+=addr_cells+size_cells)); do
> +            local addr=0
> +            local size=0
> +            local j=0
> +
> +            for ((j=0; j<addr_cells; j++)); do
> +                addr=$((addr << 32 | 0x${reg_values[i+j]}))
> +            done
> +
> +            for ((j=0; j<size_cells; j++)); do
> +                size=$((size << 32 | 0x${reg_values[i+addr_cells+j]}))
> +            done
> +
> +            addr=$(printf "0x%X" $addr)
> +            size=$(printf "0x%X" $size)
> +        done
> +
> +        # Add the reserved space to the list and avoid duplicates
> +        local duplicate=0
> +        for reserved_space in "${RESERVED_MEM_SPACES[@]}"; do
> +            local reserved_start=${reserved_space%,*}
> +            local reserved_size=${reserved_space#*,}
> +
> +            if [[ $addr -eq $reserved_start ]] && [[ $size -eq $reserved_size ]]; then
> +                duplicate=1
> +                break
> +            fi
> +        done
> +        if [ $duplicate -eq 0 ]; then
> +            RESERVED_MEM_SPACES+=("${addr},${size}")
> +        fi
> +    done
> +}
> +
>  # Read effective image size from a header, which may be larger than the filesize
>  # due to noload sections, e.g. bss.
>  function get_image_size()
> @@ -505,9 +566,24 @@ function add_size()
>          size=${image_size}
>      fi
>  
> -    memaddr=$(( $memaddr + $size + $offset - 1))
> -    memaddr=$(( $memaddr & ~($offset - 1) ))
> -    memaddr=`printf "0x%X\n" $memaddr`
> +    # Try to place the file at the first available space...
> +    local new_memaddr=$(( (memaddr + size + offset - 1) & ~(offset - 1) ))
> +
> +    # ...then check if it overlaps with any reserved space
> +    for reserved_space in "${RESERVED_MEM_SPACES[@]}"; do
> +        local reserved_start=${reserved_space%,*}
> +        local reserved_size=${reserved_space#*,}
> +        local reserved_end=$((reserved_start + reserved_size))
> +
> +        if [[ $new_memaddr -le $reserved_end ]] && \
> +           [[ $((new_memaddr + size)) -ge $reserved_start ]]; then
> +            # In that case, place the file at the next available space
> +            # after the reserved one
> +            new_memaddr=$(( (reserved_end + offset) & ~(offset - 1) ))
> +        fi
> +    done
> +
> +    memaddr=$(printf "0x%X\n" $new_memaddr)
>      filesize=$size
>  }
>  
> @@ -1373,6 +1449,8 @@ uboot_addr=$memaddr
>  memaddr=$(( $memaddr + $offset ))
>  memaddr=`printf "0x%X\n" $memaddr`
>  
> +fill_reserved_spaces_from_dtb
> +
>  if test "$os" = "xen"
>  then
>      xen_file_loading
> -- 
> 2.25.1
> 

