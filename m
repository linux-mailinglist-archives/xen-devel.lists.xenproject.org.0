Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAAFB23C35
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 01:10:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1079324.1440264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uly7z-0002uA-GN; Tue, 12 Aug 2025 23:09:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1079324.1440264; Tue, 12 Aug 2025 23:09:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uly7z-0002r7-DQ; Tue, 12 Aug 2025 23:09:59 +0000
Received: by outflank-mailman (input) for mailman id 1079324;
 Tue, 12 Aug 2025 23:09:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IykP=2Y=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uly7x-0002qy-BD
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 23:09:57 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72b59ffe-77d1-11f0-b898-0df219b8e170;
 Wed, 13 Aug 2025 01:09:51 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B35B043A4B;
 Tue, 12 Aug 2025 23:09:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8C74C4CEF0;
 Tue, 12 Aug 2025 23:09:48 +0000 (UTC)
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
X-Inumbo-ID: 72b59ffe-77d1-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755040189;
	bh=Lg3pJxWy2pokNOYK6XFZFBSQS4PpeZBsgD+GYZusrIM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ftx49h4gfEHQ3ag/mODNqSnkcK17bnW0wYCAyzOz3OEnY9uz7+3CwaYqd509Nfv7F
	 30jnXBFG8ffHd+3yEjQjdGm47J24aFy4ESgMUKDMY+OZroudVxEW8jszqc1tvD658e
	 1ZdOrczovRl+yHKRj/Xg3m+Q1Va3bFYMlpI22t+s9bH68HCZjsIFlHhbQ7Ni7cylP9
	 Zi0gdnHm5N1HWHPMkWSb0R8qAkceWaUK6Oay34E9ecDA0y06vk4vd8hRDn4ESRuu2b
	 +hh7pibgIOuLKaDokSxxYv8qMFU50LyQrtDdDudPaZ/HTbj7w1zpaTgGnD/eoWBSyc
	 ggPXJ8SIUMN0A==
Date: Tue, 12 Aug 2025 16:09:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, andrei.cherechesu@nxp.com, dmukhin@ford.com
Subject: Re: [ImageBuilder v2] Add config option to use separate load commands
 for Xen, DOM0 and DOMU binaries
In-Reply-To: <20250812151945.2430295-1-ayan.kumar.halder@amd.com>
Message-ID: <alpine.DEB.2.22.394.2508121609190.2883419@ubuntu-linux-20-04-desktop>
References: <20250812151945.2430295-1-ayan.kumar.halder@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 12 Aug 2025, Ayan Kumar Halder wrote:
> Introduce the following options :-
> 1. XEN_LOAD - This specifies command to load xen hypervisor binary and device
> tree.
> 2. DOM0_LOAD - This specifies command to load Dom0 binaries.
> 3. DOMU_LOAD[] - This specifies command to load DomU binaries.
> 
> There can be situations where Xen, Dom0 and DomU binaries are stored in
> different partitions. Thus, imagebuilder should provide a way the binaries
> using different commands.
> 
> If any of the above options are not specified, LOAD_CMD is used by default.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>


Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

with a small caveat: the exits should be exit 1 because they are due to
errors. I made the change on commit.


> ---
> This patch should be applied first.
> 
> Changes from :-
> 
> v1 - 1. Make LOAD_CMD optional when XEN is set
> 2. find_root_dev() should be invoked with either "$DOM0_CMD" or "$LOAD_CMD"
> depending on if it is invoked from xen_config() or linux_config().
> 3. User needs to set either LOAD_CMD or XEN_LOAD. If neither is set, throw
> an error. This is true for DOM0_LOAD and DOMU_LOAD[].
> 
>  README.md                | 18 +++++++++-
>  scripts/uboot-script-gen | 76 ++++++++++++++++++++++++++++------------
>  2 files changed, 71 insertions(+), 23 deletions(-)
> 
> diff --git a/README.md b/README.md
> index b7be268..59919df 100644
> --- a/README.md
> +++ b/README.md
> @@ -33,10 +33,12 @@ BOOT_CMD="booti"
>  
>  DEVICE_TREE="mpsoc.dtb"
>  XEN="xen"
> +XEN_LOAD="ext4load mmc 0:1"
>  XEN_CMD="console=dtuart dtuart=serial0 dom0_mem=1G dom0_max_vcpus=1 bootscrub=0 vwfi=native sched=null"
>  PASSTHROUGH_DTS_REPO="git@github.com:Xilinx/xen-passthrough-device-trees.git device-trees-2021.2/zcu102"
>  DOM0_KERNEL="Image-dom0"
>  DOM0_CMD="console=hvc0 earlycon=xen earlyprintk=xen clk_ignore_unused"
> +DOM0_LOAD="ext4load mmc 2:1"
>  DOM0_RAMDISK="dom0-ramdisk.cpio"
>  DOM0_MEM=1024
>  DOM0_VCPUS=1
> @@ -46,11 +48,13 @@ DT_OVERLAY[0]="host_dt_overlay.dtbo"
>  
>  NUM_DOMUS=2
>  DOMU_KERNEL[0]="zynqmp-dom1/Image-domU"
> +DOMU_LOAD[0]="ext4load mmc 4:1"
>  DOMU_PASSTHROUGH_PATHS[0]="/axi/ethernet@ff0e0000 /axi/serial@ff000000"
>  DOMU_CMD[0]="console=ttyPS0 earlycon console=ttyPS0,115200 clk_ignore_unused rdinit=/sbin/init root=/dev/ram0 init=/bin/sh"
>  DOMU_RAMDISK[0]="zynqmp-dom1/domU-ramdisk.cpio"
>  DOMU_COLORS[0]="6-14"
>  DOMU_KERNEL[1]="zynqmp-dom2/Image-domU"
> +DOMU_LOAD[1]="ext4load mmc 5:1"
>  DOMU_CMD[1]="console=ttyAMA0 clk_ignore_unused rdinit=/sbin/init root=/dev/ram0 init=/bin/sh"
>  DOMU_RAMDISK[1]="zynqmp-dom2/domU-ramdisk.cpio"
>  DOMU_MEM[1]=512
> @@ -77,7 +81,9 @@ Where:
>  - LOAD_CMD specifies the u-boot command used to load the binaries. This
>    can be left out of the config and be (over)written by the -t CLI
>    argument. It has to be set either in the config file or CLI argument
> -  though.
> +  though. This is optional when XEN is set as user can provide specific
> +  options (ie XEN_LOAD, DOM0_LOAD, DOMU_LOAD) to load Xen, Dom0 and DomU
> +  binaries.
>  
>  - BOOT_CMD specifies the u-boot command used to boot the binaries.
>    By default, it is 'booti'. The acceptable values are 'booti', 'bootm',
> @@ -99,6 +105,9 @@ Where:
>  - XEN_CMD specifies the command line arguments used for Xen.  If not
>    set, the default one will be used.
>  
> +- XEN_LOAD specifies the command to load XEN and DEVICE_TREE. If not set,
> +  LOAD_CMD will be used.
> +
>  - XEN_STATIC_HEAP="baseaddr1 size1 ... baseaddrN sizeN"
>    if specified, indicates the host physical address regions
>    [baseaddr, baseaddr + size) to be reserved as Xen static heap.
> @@ -109,6 +118,9 @@ Where:
>    uboot-script-gen will compile the partial device trees which have
>    been specified in DOMU_PASSTHROUGH_PATHS[number].
>  
> +- DOM0_LOAD specifies the command to load DOM0_KERNEL and DOM0_RAMDISK. If not
> +  set, LOAD_CMD will be used.
> +
>  - DOM0_KERNEL specifies the Dom0 kernel file to load.
>    For dom0less configurations, the parameter is optional.
>  
> @@ -159,6 +171,10 @@ Where:
>    kernel. If not set and DOMU_VPL011[number] is not set to 0, then
>    "console=ttyAMA0" is used.
>  
> +- DOMU_LOAD[number] specifies the command to load DOMU_KERNEL[number],
> +  DOMU_RAMDISK[number] and DOMU_PASSTHROUGH_DTB[number]. If not set, then
> +  LOAD_CMD is used.
> +
>  - DOMU_RAMDISK[number] specifies the DomU ramdisk to use.
>  
>  - DOMU_PASSTHROUGH_PATHS[number] specifies the passthrough devices (
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index b81e614..656de72 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -737,6 +737,7 @@ function load_file()
>  {
>      local filename=$1
>      local fit_scr_name=$2
> +    local load_cmd=$3
>  
>      local absolute_path="$(realpath --no-symlinks $filename)"
>      local base="$(realpath $PWD)"/
> @@ -748,10 +749,10 @@ function load_file()
>          add_size_from_file $filename
>      else
>          if test "$CALC"; then
> -            echo "$LOAD_CMD \${memaddr} ${prepend_path:+$prepend_path/}$relative_path" >> $UBOOT_SOURCE
> +            echo "$load_cmd \${memaddr} ${prepend_path:+$prepend_path/}$relative_path" >> $UBOOT_SOURCE
>              add_size_calculate $fit_scr_name
>          else
> -            echo "$LOAD_CMD $memaddr ${prepend_path:+$prepend_path/}$relative_path" >> $UBOOT_SOURCE
> +            echo "$load_cmd $memaddr ${prepend_path:+$prepend_path/}$relative_path" >> $UBOOT_SOURCE
>              add_size_from_file $filename
>          fi
>      fi
> @@ -830,10 +831,10 @@ function check_compressed_file_type()
>  
>  function find_root_dev()
>  {
> -
> -    local dev=${LOAD_CMD%:*}
> +    local load_cmd="$1"
> +    local dev=${load_cmd%:*}
>      dev=${dev##* }
> -    local par=${LOAD_CMD#*:}
> +    local par=${load_cmd#*:}
>  
>      if [ -z "$dev" ] || [ -z "$par" ]
>      then
> @@ -844,10 +845,10 @@ function find_root_dev()
>  
>      par=$((par + 1))
>  
> -    if [[ $LOAD_CMD =~ mmc ]]
> +    if [[ $load_cmd =~ mmc ]]
>      then
>          root_dev="/dev/mmcblk${dev}p${par}"
> -    elif [[ $LOAD_CMD =~ scsi ]]
> +    elif [[ $load_cmd =~ scsi ]]
>      then
>          # converts number to a scsi device character
>          dev=$((dev + 97))
> @@ -925,7 +926,7 @@ function xen_config()
>          then
>              DOM0_CMD="$DOM0_CMD root=/dev/ram0"
>          else
> -            find_root_dev
> +            find_root_dev "$DOM0_LOAD"
>              # $root_dev is set by find_root_dev
>              DOM0_CMD="$DOM0_CMD root=$root_dev"
>          fi
> @@ -973,7 +974,7 @@ function linux_config()
>          then
>              LINUX_CMD="$LINUX_CMD root=/dev/ram0"
>          else
> -            find_root_dev
> +            find_root_dev "$LOAD_CMD"
>              # $root_dev is set by find_root_dev
>              LINUX_CMD="$LINUX_CMD root=$root_dev"
>          fi
> @@ -1003,11 +1004,22 @@ generate_uboot_images()
>  
>  xen_file_loading()
>  {
> +    if test -z "$DOM0_LOAD"
> +    then
> +        if test "$LOAD_CMD"
> +        then
> +            DOM0_LOAD="$LOAD_CMD"
> +        else
> +            echo "Neither DOM0_LOAD nor LOAD_CMD is specified"
> +            exit
> +        fi
> +    fi
> +
>      if test "$DOM0_KERNEL"
>      then
>          check_compressed_file_type $DOM0_KERNEL "executable\|uImage"
>          dom0_kernel_addr=$memaddr
> -        load_file $DOM0_KERNEL "dom0_linux"
> +        load_file $DOM0_KERNEL "dom0_linux" "$DOM0_LOAD"
>          dom0_kernel_size=$filesize
>      fi
>      if test "$DOM0_RAMDISK"
> @@ -1015,7 +1027,7 @@ xen_file_loading()
>          check_compressed_file_type $DOM0_RAMDISK "cpio archive"
>          ramdisk_addr=$memaddr
>          ramdisk_path=$DOM0_RAMDISK
> -        load_file "$DOM0_RAMDISK" "dom0_ramdisk"
> +        load_file "$DOM0_RAMDISK" "dom0_ramdisk" "$DOM0_LOAD"
>          ramdisk_size=$filesize
>      else
>          ramdisk_addr="-"
> @@ -1024,6 +1036,16 @@ xen_file_loading()
>      i=0
>      while test $i -lt $NUM_DOMUS
>      do
> +        if test -z "${DOMU_LOAD[$i]}"
> +        then
> +            if test "$LOAD_CMD"
> +            then
> +                DOMU_LOAD[$i]="$LOAD_CMD"
> +            else
> +                echo "Neither DOMU_LOAD[] nor LOAD_CMD is specified"
> +                exit
> +            fi
> +        fi
>          if test "${DOMU_ROOTFS[$i]}" || test "${DOMU_NOBOOT[$i]}"
>          then
>              if test -z "${DOMU_NOBOOT[$i]}"
> @@ -1042,20 +1064,20 @@ xen_file_loading()
>  
>          check_compressed_file_type ${DOMU_KERNEL[$i]} "executable\|uImage"
>          domU_kernel_addr[$i]=$memaddr
> -        load_file ${DOMU_KERNEL[$i]} "domU${i}_kernel"
> +        load_file ${DOMU_KERNEL[$i]} "domU${i}_kernel" "${DOMU_LOAD[$i]}"
>          domU_kernel_size[$i]=$filesize
>          if test "${DOMU_RAMDISK[$i]}"
>          then
>              check_compressed_file_type ${DOMU_RAMDISK[$i]} "cpio archive"
>              domU_ramdisk_addr[$i]=$memaddr
> -            load_file ${DOMU_RAMDISK[$i]} "domU${i}_ramdisk"
> +            load_file ${DOMU_RAMDISK[$i]} "domU${i}_ramdisk" "${DOMU_LOAD[$i]}"
>              domU_ramdisk_size[$i]=$filesize
>          fi
>          if test "${DOMU_PASSTHROUGH_DTB[$i]}"
>          then
>              check_compressed_file_type ${DOMU_PASSTHROUGH_DTB[$i]} "Device Tree Blob"
>              domU_passthrough_dtb_addr[$i]=$memaddr
> -            load_file ${DOMU_PASSTHROUGH_DTB[$i]} "domU${i}_fdt"
> +            load_file ${DOMU_PASSTHROUGH_DTB[$i]} "domU${i}_fdt" "${DOMU_LOAD[$i]}"
>              domU_passthrough_dtb_size[$i]=$filesize
>          fi
>          i=$(( $i + 1 ))
> @@ -1070,9 +1092,20 @@ xen_file_loading()
>          generate_uboot_images
>      fi
>  
> +    if test -z "$XEN_LOAD"
> +    then
> +        if test "$LOAD_CMD"
> +        then
> +            XEN_LOAD="$LOAD_CMD"
> +        else
> +            echo "Neither XEN_LOAD nor LOAD_CMD is specified"
> +            exit
> +        fi
> +    fi
> +
>      kernel_addr=$memaddr
>      kernel_path=$XEN
> -    load_file "$XEN" "host_kernel"
> +    load_file "$XEN" "host_kernel" "$XEN_LOAD"
>  
>      xen_policy_addr="-"
>      if test -n "$XEN_POLICY"
> @@ -1518,12 +1551,6 @@ then
>      FIT="${UBOOT_SOURCE%.source}.fit"
>  fi
>  
> -if test ! "$LOAD_CMD"
> -then
> -    echo "LOAD_CMD not set, either specify it in the config or set it with the -t option"
> -    exit 1
> -fi
> -
>  if test ! "$BOOT_CMD"
>  then
>      BOOT_CMD="booti"
> @@ -1543,6 +1570,11 @@ then
>  elif test "$LINUX"
>  then
>      os="linux"
> +    if test ! "$LOAD_CMD"
> +    then
> +        echo "LOAD_CMD not set, either specify it in the config or set it with the -t option"
> +        exit 1
> +    fi
>      linux_config
>  else
>      echo "Neither a Xen or Linux kernel is specified, exiting"
> @@ -1691,7 +1723,7 @@ fi
>  
>  check_file_type $DEVICE_TREE "Device Tree Blob"
>  device_tree_addr=$memaddr
> -load_file $DEVICE_TREE "host_fdt"
> +load_file $DEVICE_TREE "host_fdt" "$XEN_LOAD"
>  bitstream_load_and_config  # bitstream is loaded last but used first
>  device_tree_editing $device_tree_addr
>  
> -- 
> 2.25.1
> 

