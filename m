Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83894A9D3E0
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 23:09:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968605.1358130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8QI6-00044c-Re; Fri, 25 Apr 2025 21:08:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968605.1358130; Fri, 25 Apr 2025 21:08:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8QI6-00041d-Oo; Fri, 25 Apr 2025 21:08:58 +0000
Received: by outflank-mailman (input) for mailman id 968605;
 Fri, 25 Apr 2025 21:08:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Y3Op=XL=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u8QI5-00041X-3f
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 21:08:58 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e522755-2219-11f0-9ffb-bf95429c2676;
 Fri, 25 Apr 2025 23:08:54 +0200 (CEST)
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
X-Inumbo-ID: 7e522755-2219-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745615331; x=1745874531;
	bh=ljd39QNg9pV4Ew9T3CAqOyTIjU0M6H1dFaQSOJTzn48=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=ijrP1e+Jc41LgslXhWUksjKYvrl7j5kahF3rnHoyaKmmgSzZ00wZmYzbSaVv5BouQ
	 dKezcG3UqqPPCGgIorSLQ5tq/seDgZncgq31A/gd4iZE2Y37Qe8uoHXw0QtUeJzINM
	 476LOelHfl/4GSH+FvorcReV3RjQwxP+4ty6S0pfU3+av50od0aoaAM2fJyOw1HSuG
	 sh9w6Epua+ysOf0WJIk101u9Q8MWla0zIrGKMDtdHOzj4nmMhl2qt4VvIf3zNtB80p
	 xs6Vt4d42Rf0vr044PpYw9y5v4L9n6xiFvZY9nlsUabR1egN5eGkLYltsqthkDyILd
	 9IgaRukcxWfWA==
Date: Fri, 25 Apr 2025 21:08:46 +0000
To: Stefano Stabellini <sstabellini@kernel.org>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrei.cherechesu@nxp.com, michal.orzel@amd.com, jason.andryuk@amd.com
Subject: Re: [PATCH v6] uboot-script-gen: Dynamically compute addr and size when loading binaries
Message-ID: <aAv52lhC+IaGIkgk@starscream>
In-Reply-To: <alpine.DEB.2.22.394.2504251239380.785180@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2504251239380.785180@ubuntu-linux-20-04-desktop>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 194edb483e8a598a74eeb14cda4ddc98e2360216
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 12:40:40PM -0700, Stefano Stabellini wrote:
> From: Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>
>=20
> Normally, the Imagebuilder would precompute the sizes of the loaded
> binaries and addresses where they are loaded before generating the
> script, and the sizes and addresses that needed to be provided to
> Xen via /chosen would be hardcoded in the boot script.
>=20
> Added an option via "-s" parameter to avoid hardcoding any
> address in the boot script, and dynamically compute the
> loading addresses for binaries. The first loading address is based
> on the MEMORY_START parameter and after loading each binary,
> the loading address and the size of the binary are stored in
> variables with corresponding names. Then, the loading address
> for the next binary is computed and aligned to 0x200000.
>=20
> If the "-s" parameter is not used, the normal flow is executed,
> where the loading addresses and sizes for each binaries are
> precomputed and hardcoded inside the script, but the loading
> addresses and sizes for each binary are now also stored for eventual
> later use.
>=20
> Reserved memory regions are left TBD in the -s case.
>=20
> Link: https://lists.xenproject.org/archives/html/xen-devel/2022-09/msg018=
62.html
> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
> Changes in v6:
> - make initial ${memaddr} setting depending on CALC
>=20
> This patch adds quite a bit of complexity which is the reason why I
> didn't originally commit it. Now that we are enabling ImageBuilder in
> Yocto, it turns out this patch is required because Yocto invokes
> ImageBuilder before all the binaries are ready and available.
>=20
> Andrei, sorry for taking so long to realize why it is essential, but we
> are getting there now.
>=20
> The changes I made to the original patch are purely to make it simpler
> to maintain.
> ---
>  README.md                |   2 +
>  scripts/uboot-script-gen | 180 ++++++++++++++++++++++++++++++++-------
>  2 files changed, 151 insertions(+), 31 deletions(-)
>=20
> diff --git a/README.md b/README.md
> index f8039ec..28c9e6b 100644
> --- a/README.md
> +++ b/README.md
> @@ -356,6 +356,8 @@ Where:\
>     can only be used  in combination with the -k option.  This adds the
>     public key into the dtb.  Then one can add this dtb back into the
>     u-boot bin or elf.\
> +-s addresses and sizes are calculated dynamically from U-Boot, hence
> +   binaries don't need to be available at the time of invocation.\
>=20
>  ### Signed FIT images
>=20
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index 638154a..9ec0e20 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -1,8 +1,11 @@
>  #!/bin/bash

Unrelated, but I think it is worth adding `set -e` and `set -o pipefail`
to the script.

>=20
>  offset=3D$((2*1024*1024))
> +PADDING_MASK=3D`printf "0x%X\n" $(($offset - 1))`
> +PADDING_MASK_INV=3D`printf "0x%X\n" $((~$PADDING_MASK))`

I would use $(...) form for command substitution instead of `...` for
readability, although the script uses both styles already.

>  filesize=3D0
>  prog_req=3D(mkimage file fdtput mktemp awk od)
> +CALC=3D""
>=20
>  function cleanup_and_return_err()
>  {
> @@ -100,17 +103,42 @@ function dt_set()
>      fi
>  }
>=20
> +function dt_set_calc()
> +{
> +    local path=3D$1
> +    local var=3D$2
> +    local name_var=3D$3
> +
> +    addr_var=3D"$name_var"_addr
> +    size_var=3D"$name_var"_size

       ^ I think these two variables should be `local` too.

> +
> +    # Split data_addr_var into high/low
> +    echo "setexpr addr_hi \${"$addr_var"} / 0x100000000" >> $UBOOT_SOURC=
E
> +    echo "setexpr addr_lo \${"$addr_var"} \& 0xFFFFFFFF" >> $UBOOT_SOURC=
E
> +
> +    # Split data_size_var into high/low
> +    echo "setexpr size_hi \${"$size_var"} / 0x100000000" >> $UBOOT_SOURC=
E
> +    echo "setexpr size_lo \${"$size_var"} \& 0xFFFFFFFF" >> $UBOOT_SOURC=
E
> +
> +    echo "fdt set $path $var <0x\${addr_hi} 0x\${addr_lo} 0x\${size_hi} =
0x\${size_lo}>" >> $UBOOT_SOURCE

I think using heredoc will simplify the code a bit, e.g.:

       cat >> $UBOOT_SOURCE <<EOF
# Split data_addr_var into high/low
setexpr addr_hi \${"$addr_var"} / 0x100000000
setexpr addr_lo \${"$addr_var"} \& 0xFFFFFFFF

# Split data_size_var into high/low
setexpr size_hi \${"$size_var"} / 0x100000000
setexpr size_lo \${"$size_var"} \& 0xFFFFFFFF

fdt set $path $var <0x\${addr_hi} 0x\${addr_lo} 0x\${size_hi} 0x\${size_lo}=
>
EOF

> +}
> +
>  function add_device_tree_kernel()
>  {
>      local path=3D$1
> -    local addr=3D$2
> -    local size=3D$3
> -    local bootargs=3D$4
> +    local name=3D$2
> +    local addr=3D$3
> +    local size=3D$4
> +    local bootargs=3D$5
>      local node_name=3D"module@${addr#0x}"
>=20
>      dt_mknode "$path" "$node_name"
>      dt_set "$path/$node_name" "compatible" "str_a" "multiboot,kernel mul=
tiboot,module"
> -    dt_set "$path/$node_name" "reg" "hex"  "$(split_addr_size $addr $siz=
e)"
> +    if test "$CALC"; then
> +        dt_set_calc "$path/$node_name" "reg" $name
> +    else
> +        dt_set "$path/$node_name" "reg" "hex"  "$(split_addr_size $addr =
$size)"
> +    fi
>      dt_set "$path/$node_name" "bootargs" "str" "$bootargs"
>  }
>=20
> @@ -118,26 +146,36 @@ function add_device_tree_kernel()
>  function add_device_tree_ramdisk()
>  {
>      local path=3D$1
> -    local addr=3D$2
> -    local size=3D$3
> +    local name=3D$2
> +    local addr=3D$3
> +    local size=3D$4
>      local node_name=3D"module@${addr#0x}"
>=20
>      dt_mknode "$path"  "$node_name"
>      dt_set "$path/$node_name" "compatible" "str_a" "multiboot,ramdisk mu=
ltiboot,module"
> -    dt_set "$path/$node_name" "reg" "hex"  "$(split_addr_size $addr $siz=
e)"
> +    if test "$CALC"; then
> +        dt_set_calc "$path/$node_name" "reg" $name
> +    else
> +        dt_set "$path/$node_name" "reg" "hex"  "$(split_addr_size $addr =
$size)"
> +    fi
>  }
>=20
>=20
>  function add_device_tree_passthrough()
>  {
>      local path=3D$1
> -    local addr=3D$2
> -    local size=3D$3
> +    local name=3D$2
> +    local addr=3D$3
> +    local size=3D$4
>      local node_name=3D"module@${addr#0x}"
>=20
>      dt_mknode "$path"  "$node_name"
>      dt_set "$path/$node_name" "compatible" "str_a" "multiboot,device-tre=
e multiboot,module"
> -    dt_set "$path/$node_name" "reg" "hex"  "$(split_addr_size $addr $siz=
e)"
> +    if test "$CALC"; then
> +        dt_set_calc "$path/$node_name" "reg" $name
> +    else
> +        dt_set "$path/$node_name" "reg" "hex"  "$(split_addr_size $addr =
$size)"
> +    fi
>  }
>=20
>  function add_device_tree_mem()
> @@ -358,7 +396,11 @@ function xen_device_tree_editing()
>=20
>          dt_mknode "/chosen" "$node_name"
>          dt_set "/chosen/$node_name" "compatible" "str_a" "xen,xsm-policy=
 xen,multiboot-module multiboot,module"
> -        dt_set "/chosen/$node_name" "reg" "hex" "$(split_addr_size $xen_=
policy_addr $xen_policy_size)"
> +        if test "$CALC"; then
> +            dt_set_calc "/chosen/$node_name" "reg" "xen_policy"
> +        else
> +            dt_set "/chosen/$node_name" "reg" "hex" "$(split_addr_size $=
xen_policy_addr $xen_policy_size)"
> +        fi
>      fi
>=20
>      if test "$DOM0_KERNEL"
> @@ -367,7 +409,11 @@ function xen_device_tree_editing()
>=20
>          dt_mknode "/chosen" "$node_name"
>          dt_set "/chosen/$node_name" "compatible" "str_a" "xen,linux-zima=
ge xen,multiboot-module multiboot,module"
> -        dt_set "/chosen/$node_name" "reg" "hex" "$(split_addr_size $dom0=
_kernel_addr $dom0_kernel_size)"
> +        if test "$CALC"; then
> +            dt_set_calc "/chosen/$node_name" "reg" "dom0_linux"
> +        else
> +            dt_set "/chosen/$node_name" "reg" "hex" "$(split_addr_size $=
dom0_kernel_addr $dom0_kernel_size)"
> +        fi
>          dt_set "/chosen" "xen,dom0-bootargs" "str" "$DOM0_CMD"
>      fi
>=20
> @@ -377,7 +423,11 @@ function xen_device_tree_editing()
>=20
>          dt_mknode "/chosen" "$node_name"
>          dt_set "/chosen/$node_name" "compatible" "str_a" "xen,linux-init=
rd xen,multiboot-module multiboot,module"
> -        dt_set "/chosen/$node_name" "reg" "hex" "$(split_addr_size $ramd=
isk_addr $ramdisk_size)"
> +        if test "$CALC"; then
> +            dt_set_calc "/chosen/$node_name" "reg" "dom0_ramdisk"
> +        else
> +            dt_set "/chosen/$node_name" "reg" "hex" "$(split_addr_size $=
ramdisk_addr $ramdisk_size)"
> +        fi
>      fi
>=20
>      i=3D0
> @@ -464,14 +514,14 @@ function xen_device_tree_editing()
>=20
>          xen_dt_domu_add_vcpu_nodes "/chosen/domU$i" $i ${DOMU_VCPUS[$i]}
>=20
> -        add_device_tree_kernel "/chosen/domU$i" ${domU_kernel_addr[$i]} =
${domU_kernel_size[$i]} "${DOMU_CMD[$i]}"
> +        add_device_tree_kernel "/chosen/domU$i" "domU${i}_kernel" ${domU=
_kernel_addr[$i]} ${domU_kernel_size[$i]} "${DOMU_CMD[$i]}"
>          if test "${domU_ramdisk_addr[$i]}"
>          then
> -            add_device_tree_ramdisk "/chosen/domU$i" ${domU_ramdisk_addr=
[$i]} ${domU_ramdisk_size[$i]}
> +            add_device_tree_ramdisk "/chosen/domU$i" "domU${i}_ramdisk" =
${domU_ramdisk_addr[$i]} ${domU_ramdisk_size[$i]}
>          fi
>          if test "${domU_passthrough_dtb_addr[$i]}"
>          then
> -            add_device_tree_passthrough "/chosen/domU$i" ${domU_passthro=
ugh_dtb_addr[$i]} ${domU_passthrough_dtb_size[$i]}
> +            add_device_tree_passthrough "/chosen/domU$i" "domU${i}_fdt" =
${domU_passthrough_dtb_addr[$i]} ${domU_passthrough_dtb_size[$i]}
>          fi
>          i=3D$(( $i + 1 ))
>      done
> @@ -504,7 +554,11 @@ function device_tree_editing()
>=20
>      if test $UBOOT_SOURCE
>      then
> -        echo "fdt addr $device_tree_addr" >> $UBOOT_SOURCE
> +        if test "$CALC"; then
> +            echo "fdt addr \${host_fdt_addr}" >> $UBOOT_SOURCE
> +        else
> +            echo "fdt addr $device_tree_addr" >> $UBOOT_SOURCE
> +        fi
>          echo "fdt resize 1024" >> $UBOOT_SOURCE
>=20
>          if test $NUM_DT_OVERLAY && test $NUM_DT_OVERLAY -gt 0
> @@ -512,7 +566,11 @@ function device_tree_editing()
>              i=3D0
>              while test $i -lt $NUM_DT_OVERLAY
>              do
> -                echo "fdt apply ${dt_overlay_addr[$i]}" >> $UBOOT_SOURCE
> +                if test "$CALC"; then
> +                    echo "fdt apply \${host_fdto${i}_addr}" >> $UBOOT_SO=
URCE
> +                else
> +                    echo "fdt apply ${dt_overlay_addr[$i]}" >> $UBOOT_SO=
URCE
> +                fi
>                  i=3D$(( $i + 1 ))
>              done
>          fi
> @@ -530,8 +588,12 @@ function fill_reserved_spaces_from_dtb()
>  {
>      if [ ! -f $DEVICE_TREE ]
>      then
> -        echo "File $DEVICE_TREE doesn't exist, exiting";
> -        cleanup_and_return_err
> +        if test "$CALC"; then
> +            return
> +        else
> +            echo "File $DEVICE_TREE doesn't exist, exiting";
> +            cleanup_and_return_err
> +        fi
>      fi
>=20
>      # Check if reserved-memory node exists
> @@ -613,7 +675,7 @@ function get_image_size()
>      printf "%u" $effective_size
>  }
>=20
> -function add_size()
> +function add_size_from_file()
>  {
>      local filename=3D$1
>      local size=3D`stat -L --printf=3D"%s" $filename`
> @@ -645,6 +707,24 @@ function add_size()
>      filesize=3D$size
>  }
>=20
> +function add_size_calculate()
> +{
> +    local fit_scr_name=3D$1
> +
> +    echo "setenv "$fit_scr_name"_addr \${memaddr}" >> $UBOOT_SOURCE
> +    echo "setenv "$fit_scr_name"_size \${filesize}" >> $UBOOT_SOURCE
> +    echo "setexpr memaddr \${memaddr} \+ \${filesize}" >> $UBOOT_SOURCE
> +    echo "setexpr memaddr \${memaddr} \+ $PADDING_MASK" >> $UBOOT_SOURCE
> +    echo "setexpr memaddr \${memaddr} \& $PADDING_MASK_INV" >> $UBOOT_SO=
URCE
> +
> +    # TODO: missing ${RESERVED_MEM_SPACES[@]} check
> +
> +    # The following are updated to avoid collisions in node names, but
> +    # they are not actively used.
> +    memaddr=3D$((memaddr + offset))
> +    filesize=3D$offset
> +}
> +
>  function load_file()
>  {
>      local filename=3D$1
> @@ -657,10 +737,16 @@ function load_file()
>      if test "$FIT"
>      then
>          echo "imxtract \$fit_addr $fit_scr_name $memaddr" >> $UBOOT_SOUR=
CE
> +        add_size_from_file $filename
>      else
> -        echo "$LOAD_CMD $memaddr ${prepend_path:+$prepend_path/}$relativ=
e_path" >> $UBOOT_SOURCE
> +        if test "$CALC"; then
> +            echo "$LOAD_CMD \${memaddr} ${prepend_path:+$prepend_path/}$=
relative_path" >> $UBOOT_SOURCE
> +            add_size_calculate $fit_scr_name
> +        else
> +            echo "$LOAD_CMD $memaddr ${prepend_path:+$prepend_path/}$rel=
ative_path" >> $UBOOT_SOURCE
> +            add_size_from_file $filename
> +        fi
>      fi
> -    add_size $filename
>  }
>=20
>  function check_file_type()
> @@ -670,8 +756,13 @@ function check_file_type()
>=20
>      if [ ! -f $filename ]
>      then
> -        echo "File $filename doesn't exist, exiting";
> -        cleanup_and_return_err
> +        if test "$CALC"
> +        then
> +            return
> +        else
> +            echo "File $filename doesn't exist, exiting";
> +            cleanup_and_return_err
> +        fi
>      fi
>=20
>      # if file doesn't know what it is, it outputs data, so include that
> @@ -705,8 +796,13 @@ function check_compressed_file_type()
>=20
>      if [ ! -f $filename ]
>      then
> -        echo "File $filename doesn't exist, exiting";
> -        cleanup_and_return_err
> +        if test "$CALC"
> +        then
> +            return
> +        else
> +            echo "File $filename doesn't exist, exiting";
> +            cleanup_and_return_err
> +        fi
>      fi
>=20
>      file_type=3D$( file -L $filename )
> @@ -872,6 +968,12 @@ function linux_config()
>  generate_uboot_images()
>  {
>      local arch=3D$(file -L $XEN | grep -E 'ARM64|Aarch64')
> +
> +    if test "$CALC"
> +    then
> +        echo "bootm is not compatible with -s"
> +        cleanup_and_return_err
> +    fi
>=20
>      if test "$arch"
>      then
> @@ -997,7 +1099,11 @@ bitstream_load_and_config()
>          if test "$UBOOT_SOURCE"
>          then
>              # we assume the FPGA device is 0 here
> -            echo "fpga load 0 $bitstream_addr $bitstream_size" >> "$UBOO=
T_SOURCE"
> +            if test "$CALC"; then
> +                echo "fpga load 0 \${fpga_bitstream_addr} \${fpga_bitstr=
eam_size}" >> "$UBOOT_SOURCE"
> +            else
> +                echo "fpga load 0 $bitstream_addr $bitstream_size" >> "$=
UBOOT_SOURCE"
> +            fi
>          fi
>      fi
>  }
> @@ -1271,7 +1377,7 @@ function print_help
>  {
>      script=3D`basename "$0"`
>      echo "usage:"
> -    echo "=09$script -c CONFIG_FILE -d DIRECTORY [-t LOAD_CMD] [-o FILE]=
 [-k KEY_DIR/HINT [-u U-BOOT_DTB]] [-e] [-f] [-p PREPEND_PATH]"
> +    echo "=09$script -c CONFIG_FILE -d DIRECTORY [-t LOAD_CMD] [-o FILE]=
 [-k KEY_DIR/HINT [-u U-BOOT_DTB]] [-e] [-f] [-p PREPEND_PATH] [-s]"
>      echo "=09$script -h"
>      echo "where:"
>      echo "=09CONFIG_FILE - configuration file"
> @@ -1288,6 +1394,7 @@ function print_help
>      echo "=09U-BOOT_DTB - u-boot control dtb so that the public key gets=
 added to it"
>      echo "=09-f - enable generating a FIT image"
>      echo "=09PREPEND_PATH - path to be appended before file names to mat=
ch deploy location within rootfs"
> +    echo "=09-s - enable dynamic loading of binaries by storing their ad=
dresses and sizes u-boot env variables"

I would update description to something like:
 =20
  let U-Boot calculate binary images load addresses/sizes dynamically

?

Also, I would make all options sorted alphabetically.

>      echo "=09-h - prints out the help message and exits "
>      echo "Defaults:"
>      echo "=09CONFIG_FILE=3D$cfg_file, UBOOT_TYPE=3D\"LOAD_CMD\" env var,=
 DIRECTORY=3D$uboot_dir"
> @@ -1295,7 +1402,7 @@ function print_help
>      echo "=09$script -c ../config -d ./build42 -t \"scsi load 1:1\""
>  }
>=20
> -while getopts ":c:t:d:ho:k:u:fp:" opt; do
> +while getopts ":c:t:d:ho:k:u:fp:s" opt; do
>      case ${opt} in
>      t )
>          case $OPTARG in
> @@ -1340,6 +1447,9 @@ while getopts ":c:t:d:ho:k:u:fp:" opt; do
>      p )
>          prepend_path=3D"$OPTARG"
>          ;;
> +    s )
> +        CALC=3Dy
> +        ;;
>      h )
>          print_help
>          exit 0
> @@ -1533,6 +1643,10 @@ uboot_addr=3D$memaddr
>  # 2MB are enough for a uboot script
>  memaddr=3D$(( $memaddr + $offset ))
>  memaddr=3D`printf "0x%X\n" $memaddr`
> +if test "$CALC"
> +then
> +    echo "setenv memaddr $memaddr" >> $UBOOT_SOURCE
> +fi
>=20
>  fill_reserved_spaces_from_dtb
>=20
> @@ -1583,7 +1697,11 @@ fi
>=20
>  if [ "$BOOT_CMD" !=3D "none" ]
>  then
> -    echo "$BOOT_CMD $kernel_addr $([ "$BOOT_CMD" =3D "bootefi" ] || echo=
 '-') $device_tree_addr" >> $UBOOT_SOURCE
> +    if test "$CALC"; then
> +        echo "$BOOT_CMD \${host_kernel_addr} $([ "$BOOT_CMD" =3D "bootef=
i" ] || echo '-') \${host_fdt_addr}" >> $UBOOT_SOURCE
> +    else
> +        echo "$BOOT_CMD $kernel_addr $([ "$BOOT_CMD" =3D "bootefi" ] || =
echo '-') $device_tree_addr" >> $UBOOT_SOURCE
> +    fi
>  else
>      # skip boot command but store load addresses to be used later
>      echo "setenv host_kernel_addr $kernel_addr" >> $UBOOT_SOURCE
> --
> 2.25.1
>=20
>=20


