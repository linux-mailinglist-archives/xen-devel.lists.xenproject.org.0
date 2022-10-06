Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 795165F7131
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 00:36:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417301.661947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogZS7-00026u-6v; Thu, 06 Oct 2022 22:34:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417301.661947; Thu, 06 Oct 2022 22:34:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogZS7-00023y-3x; Thu, 06 Oct 2022 22:34:51 +0000
Received: by outflank-mailman (input) for mailman id 417301;
 Thu, 06 Oct 2022 22:34:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UgdD=2H=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ogZS4-00023o-VO
 for xen-devel@lists.xenproject.org; Thu, 06 Oct 2022 22:34:49 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 145d5702-45c7-11ed-9377-c1cf23e5d27e;
 Fri, 07 Oct 2022 00:34:46 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 78A3AB81F8D;
 Thu,  6 Oct 2022 22:34:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5F4CC433C1;
 Thu,  6 Oct 2022 22:34:43 +0000 (UTC)
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
X-Inumbo-ID: 145d5702-45c7-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665095684;
	bh=Us9jKarHUrWZaZ07PLhLpOakqYYxovDLZSIjVDvgKG0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hfyTPLBGqv+ZHIhTMa2Hsp+QGhSXSDPjFDyoZGZUAlrlxUpeE3T91/e5mDyHBQAib
	 +SFPbl4HEeh0QCaW4mNzgmzKDfW4A1I32o57XVxhWaJVYpAoRJe15R5DnzAyS1fms2
	 cO90vdB+wVM+c+GzabdK2uK4oN0rblovXtvYSC0mWs1WgRvCu21O7dPJLw8uz+SPW2
	 Jom+1WfBbSb8aJDQp20vGJK9J6MlmFoQfaHeLRDpIy1/zBUKDmpqxDKaq16bEVkf/C
	 rQQWrQJt4AVzM7wPht/EvTA1zUxLznjc3ELv0qYCCx/tc2zS0N/KUchGIhphW9C5ih
	 zNmJMX5v16E5A==
Date: Thu, 6 Oct 2022 15:34:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: stefano.stabellini@amd.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] ImageBuilder: Add support for 64-bit addresses
In-Reply-To: <20221006102035.16281-1-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2210061349110.3690179@ubuntu-linux-20-04-desktop>
References: <20221006102035.16281-1-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

+xen-devel

On Thu, 6 Oct 2022, Michal Orzel wrote:
> At the moment, ImageBuilder assumes that all addresses/sizes are
> 32-bit max. It sets #{address,size}-cells to 0x2 and puts 0x0 as the
> value for the first cell. Because of that, we cannot specify MEMORY_START
> and MEMORY_END to be above 32-bits (e.g. to place the images in the
> upper memory bank).
> 
> Add support to properly handle 64-bit addresses:
>  - add function split_into_halves to split the value passed as a first
>    argument into upper and lower halves. These are then set as values for
>    variables passed respetively as the second and third argument,
>  - whenever there is a variable storing the full 64-bit number with
>    "addr" or "size" in name, introduce two additional variables with
>    "addr1,addr2"/"size1,size2" in name to store the halves. These are
>    then used to properly set cells.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>
> ---
>  scripts/uboot-script-gen | 60 +++++++++++++++++++++++++++++++++++-----
>  1 file changed, 53 insertions(+), 7 deletions(-)
> 
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index 16269f02f1e7..4c6525a910f3 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -25,6 +25,14 @@ function dt_mknode()
>      fi
>  }
>  
> +# Usage:
> +# split_into_halves <value> <variable_to_store_upper> <variable_to_store_lower>
> +function split_into_halves()
> +{
> +    eval "$2=$(printf "0x%X\n" $(($1 >> 32)))"
> +    eval "$3=$(printf "0x%X\n" $(($1 & 0xFFFFFFFF)))"
> +}

I know it is the same thing, but I would prefer the following version
because it makes it easier to read:

# Usage:
# split_into_halves <value> <variable_to_store_upper> <variable_to_store_lower>
function split_into_halves()
{
    local value=$1
    local upper=$2
    local lower=$3

    eval "$upper=$(printf "0x%X\n" $(($value >> 32)))"
    eval "$lower=$(printf "0x%X\n" $(($value & 0xFFFFFFFF)))"
}


> +
>  # data_type is either
>  #   int
>  #   hex
> @@ -41,10 +49,14 @@ function dt_set()
>  
>      if test $data_type = "var"
>      then
> -        eval data_addr_var="$data"_addr
> -        eval data_addr=\$"$data_addr_var"
> -        eval data_size_var="$data"_size
> -        eval data_size=\$"$data_size_var"
> +        eval data_addr1_var="$data"_addr1
> +        eval data_addr2_var="$data"_addr2
> +        eval data_addr1=\$"$data_addr1_var"
> +        eval data_addr2=\$"$data_addr2_var"
> +        eval data_size1_var="$data"_size1
> +        eval data_size2_var="$data"_size2
> +        eval data_size1=\$"$data_size1_var"
> +        eval data_size2=\$"$data_size2_var"

To avoid making the code more complex, is it possible to stick with just
a single data_addr variable in u-boot and calculate the upper and lower
32-bit using u-boot commands?

That way, we can keep the current scheme of address and size variable
storage, which I think is already complex enough, and just add the
calculation when needed.

So we could do for the dynamic case:

setexpr data_addr1 \${"$data_addr_var"} / 0x100000000
setexpr data_addr2 \${"$data_addr_var"} \& 0xffffffff

And it could be moved into split_into_halves, so that split_into_halves
can be called for both the dynamic case and the non-dynamic case maybe.

This should reduce the amount of changes significantly.


>      fi
>  
>      if test "$UBOOT_SOURCE" && test ! "$FIT"
> @@ -54,9 +66,9 @@ function dt_set()
>          then
>              if test $dynamic_loading_opt
>              then
> -                echo "fdt set $path $var <0x0 0x\${"$data_addr_var"} 0x0 0x\${"$data_size_var"}>" >> $UBOOT_SOURCE
> +                echo "fdt set $path $var <0x\${"$data_addr1_var"} 0x\${"$data_addr2_var"} 0x\${"$data_size1_var"} 0x\${"$data_size2_var"}>" >> $UBOOT_SOURCE
>              else
> -                echo "fdt set $path $var <0x0 $data_addr 0x0 $data_size>" >> $UBOOT_SOURCE
> +                echo "fdt set $path $var <$data_addr1 $data_addr2 $data_size1 $data_size2>" >> $UBOOT_SOURCE
>              fi
>          elif test $data_type = "hex" || test $data_type = "int"
>          then
> @@ -84,7 +96,7 @@ function dt_set()
>      then
>          if test $data_type = "var"
>          then
> -            fdtput $FDTEDIT -p -t x $path $var 0x0 "$data_addr" 0x0 "$data_size"
> +            fdtput $FDTEDIT -p -t x $path $var "$data_addr1" "$data_addr2" "$data_size1" "$data_size2"
>          elif test $data_type = "hex"
>          then
>              fdtput $FDTEDIT -p -t x $path $var $data
> @@ -396,18 +408,38 @@ function add_size()
>      local filename=$1
>      local fit_scr_name=$2
>      local binary_name_addr="${fit_scr_name}_addr"
> +    local binary_name_addr1="${fit_scr_name}_addr1"
> +    local binary_name_addr2="${fit_scr_name}_addr2"
>      local binary_name_size="${fit_scr_name}_size"
> +    local binary_name_size1="${fit_scr_name}_size1"
> +    local binary_name_size2="${fit_scr_name}_size2"
> +
> +    split_into_halves $memaddr memaddr1 memaddr2
>      eval "$fit_scr_name"_addr=$memaddr
> +    eval "$fit_scr_name"_addr1=$memaddr1
> +    eval "$fit_scr_name"_addr2=$memaddr2
>  
>      local size=`stat -L --printf="%s" $filename`
>      filesize=$size
> +    split_into_halves $size size1 size2
>      eval "$fit_scr_name"_size=`printf "0x%X\n" $size`
> +    eval "$fit_scr_name"_size1=$size1
> +    eval "$fit_scr_name"_size2=$size2
>      eval binary_name_size_value=\$"$binary_name_size"
> +    split_into_halves $binary_name_size_value binary_name_size_value1 binary_name_size_value2
>      
>      if test $dynamic_loading_opt
>      then
> +        echo "setexpr memaddr1 \${memaddr} \/ 0x100000000" >> $UBOOT_SOURCE
> +        echo "setexpr memaddr2 \${memaddr} \& 0xFFFFFFFF" >> $UBOOT_SOURCE
> +        echo "setexpr filesize1 \${filesize} \/ 0x100000000" >> $UBOOT_SOURCE
> +        echo "setexpr filesize2 \${filesize} \& 0xFFFFFFFF" >> $UBOOT_SOURCE
>          echo "setenv $binary_name_addr \${memaddr}" >> $UBOOT_SOURCE
> +        echo "setenv $binary_name_addr1 \${memaddr1}" >> $UBOOT_SOURCE
> +        echo "setenv $binary_name_addr2 \${memaddr2}" >> $UBOOT_SOURCE
>          echo "setenv $binary_name_size \${filesize}" >> $UBOOT_SOURCE
> +        echo "setenv $binary_name_size1 \${filesize1}" >> $UBOOT_SOURCE
> +        echo "setenv $binary_name_size2 \${filesize2}" >> $UBOOT_SOURCE
>          # Compute load addr for next binary dynamically
>          echo "setexpr memaddr \${memaddr} \+ \${filesize}" >> $UBOOT_SOURCE
>          echo "setexpr memaddr \${memaddr} \+ $padding_mask" >> $UBOOT_SOURCE
> @@ -415,7 +447,11 @@ function add_size()
>      else
>          # Store load addr and size as literals
>          echo "setenv $binary_name_addr $memaddr" >> $UBOOT_SOURCE
> +        echo "setenv $binary_name_addr1 $memaddr1" >> $UBOOT_SOURCE
> +        echo "setenv $binary_name_addr2 $memaddr2" >> $UBOOT_SOURCE
>          echo "setenv $binary_name_size $binary_name_size_value" >> $UBOOT_SOURCE
> +        echo "setenv $binary_name_size1 $binary_name_size_value1" >> $UBOOT_SOURCE
> +        echo "setenv $binary_name_size2 $binary_name_size_value2" >> $UBOOT_SOURCE
>      fi
>  
>      memaddr=$(( $memaddr + $size + $offset - 1))
> @@ -666,16 +702,20 @@ xen_file_loading()
>      then
>          check_compressed_file_type $DOM0_KERNEL "executable"
>          dom0_kernel_addr=$memaddr
> +        split_into_halves $dom0_kernel_addr dom0_kernel_addr1 dom0_kernel_addr2
>          load_file $DOM0_KERNEL "dom0_linux"
>          dom0_kernel_size=$filesize
> +        split_into_halves $dom0_kernel_size dom0_kernel_size1 dom0_kernel_size2
>      fi
>      if test "$DOM0_RAMDISK"
>      then
>          check_compressed_file_type $DOM0_RAMDISK "cpio archive"
>          ramdisk_addr=$memaddr
> +        split_into_halves $ramdisk_addr ramdisk_addr1 ramdisk_addr2
>          ramdisk_path=$DOM0_RAMDISK
>          load_file "$DOM0_RAMDISK" "dom0_ramdisk"
>          ramdisk_size=$filesize
> +        split_into_halves $ramdisk_size ramdisk_size1 ramdisk_size2
>      else
>          ramdisk_addr="-"
>      fi
> @@ -701,21 +741,27 @@ xen_file_loading()
>  
>          check_compressed_file_type ${DOMU_KERNEL[$i]} "executable"
>          domU_kernel_addr[$i]=$memaddr
> +        split_into_halves ${domU_kernel_addr[$i]} domU_kernel_addr1[$i] domU_kernel_addr2[$i]
>          load_file ${DOMU_KERNEL[$i]} "domU${i}_kernel"
>          domU_kernel_size[$i]=$filesize
> +        split_into_halves ${domU_kernel_size[$i]} domU_kernel_size1[$i] domU_kernel_size2[$i]
>          if test "${DOMU_RAMDISK[$i]}"
>          then
>              check_compressed_file_type ${DOMU_RAMDISK[$i]} "cpio archive"
>              domU_ramdisk_addr[$i]=$memaddr
> +            split_into_halves ${domU_ramdisk_addr[$i]} domU_ramdisk_addr1[$i] domU_ramdisk_addr2[$i]
>              load_file ${DOMU_RAMDISK[$i]} "domU${i}_ramdisk"
>              domU_ramdisk_size[$i]=$filesize
> +            split_into_halves ${domU_ramdisk_size[$i]} domU_ramdisk_size1[$i] domU_ramdisk_size2[$i]
>          fi
>          if test "${DOMU_PASSTHROUGH_DTB[$i]}"
>          then
>              check_compressed_file_type ${DOMU_PASSTHROUGH_DTB[$i]} "Device Tree Blob"
>              domU_passthrough_dtb_addr[$i]=$memaddr
> +            split_into_halves ${domU_passthrough_dtb_addr[$i]} domU_passthrough_dtb_addr1[$i] domU_passthrough_dtb_addr2[$i]
>              load_file ${DOMU_PASSTHROUGH_DTB[$i]} "domU${i}_fdt"
>              domU_passthrough_dtb_size[$i]=$filesize
> +            split_into_halves ${domU_passthrough_dtb_size[$i]} domU_passthrough_dtb_size1[$i] domU_passthrough_dtb_size2[$i]
>          fi
>          i=$(( $i + 1 ))
>      done
> -- 
> 2.25.1
> 
> 

