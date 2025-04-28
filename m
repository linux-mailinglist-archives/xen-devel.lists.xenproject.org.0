Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91764A9FA43
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 22:13:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971149.1359634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9UrK-0006VM-1s; Mon, 28 Apr 2025 20:13:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971149.1359634; Mon, 28 Apr 2025 20:13:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9UrJ-0006SM-VM; Mon, 28 Apr 2025 20:13:45 +0000
Received: by outflank-mailman (input) for mailman id 971149;
 Mon, 28 Apr 2025 20:13:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u4d+=XO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u9UrI-0006SE-QT
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 20:13:44 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4716fd2a-246d-11f0-9ffb-bf95429c2676;
 Mon, 28 Apr 2025 22:13:42 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A763B5C04FC;
 Mon, 28 Apr 2025 20:11:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CF61C4CEE4;
 Mon, 28 Apr 2025 20:13:39 +0000 (UTC)
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
X-Inumbo-ID: 4716fd2a-246d-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745871220;
	bh=0vOekQTbls2azYaGMx2HD/SDFkWASciwYaUBpMUArow=;
	h=Date:From:To:cc:Subject:From;
	b=tlhIYiDdym941cBD1oA5eVNvufHCt8x7cKmtQ4lSAF4EHvFgzP3Y0lIzdonBv4Z7P
	 JiqDBzRuOeEm+Wpze6UoSBqlzjdkcqPI//oGQse4qEShlE3yqLjvQOWrwwuH/r0etR
	 p8kCoPPtCEVWYeXhwhMDvUKp6wAdB4UK1MVi5iunwaVh/kDb947zxRaMYtM876LFoZ
	 Ptfk5nf/h76sZuQft4GAbEEEpmX9R2gVi9cqXZYzWrh7khmc+Hpi5e5Q4YlvrhsbBG
	 K3BzoY9II7dS+zroWt0LYkCEVroTJX5fq5icaMy4rTxCXknBD1N9ZEG6BFQ/Zg2peK
	 JGSUmEJX4swaw==
Date: Mon, 28 Apr 2025 13:13:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, andrei.cherechesu@nxp.com, dmukhin@ford.com, 
    michal.orzel@amd.com, jason.andryuk@amd.com, S32@nxp.com
Subject: [PATCH v8] uboot-script-gen: Dynamically compute addr and size when
 loading binaries
Message-ID: <alpine.DEB.2.22.394.2504281312280.785180@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

From: Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>

Normally, the Imagebuilder would precompute the sizes of the loaded
binaries and addresses where they are loaded before generating the
script, and the sizes and addresses that needed to be provided to
Xen via /chosen would be hardcoded in the boot script.

Added an option via "-s" parameter to avoid hardcoding any
address in the boot script, and dynamically compute the
loading addresses for binaries. The first loading address is based
on the MEMORY_START parameter and after loading each binary,
the loading address and the size of the binary are stored in
variables with corresponding names. Then, the loading address
for the next binary is computed and aligned to 0x200000.

If the "-s" parameter is not used, the normal flow is executed,
where the loading addresses and sizes for each binaries are
precomputed and hardcoded inside the script, but the loading
addresses and sizes for each binary are now also stored for eventual
later use.

Reserved memory regions are left TBD in the -s case.

Link: https://lists.xenproject.org/archives/html/xen-devel/2022-09/msg01862.html
Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
Reviewed-by: Denis Mukhin <dmukhin@ford.com>
---
Changes in v8:
- remove quotes in heredoc
- change memaddr to hex for readability

Changes in v7:
- use $()
- better description and alphabetical order
- use heredoc

Changes in v6:
- make initial ${memaddr} setting depending on CALC

This patch adds quite a bit of complexity which is the reason why I
didn't originally commit it. Now that we are enabling ImageBuilder in
Yocto, it turns out this patch is required because Yocto invokes
ImageBuilder before all the binaries are ready and available.

Andrei, sorry for taking so long to realize why it is essential, but we
are getting there now.

The changes I made to the original patch are purely to make it simpler
to maintain.
---
 README.md                |   2 +
 scripts/uboot-script-gen | 181 ++++++++++++++++++++++++++++++++-------
 2 files changed, 152 insertions(+), 31 deletions(-)

diff --git a/README.md b/README.md
index f8039ec..28c9e6b 100644
--- a/README.md
+++ b/README.md
@@ -356,6 +356,8 @@ Where:\
    can only be used  in combination with the -k option.  This adds the
    public key into the dtb.  Then one can add this dtb back into the
    u-boot bin or elf.\
+-s addresses and sizes are calculated dynamically from U-Boot, hence
+   binaries don't need to be available at the time of invocation.\
 
 ### Signed FIT images
 
diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index 638154a..dfa154e 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -1,8 +1,11 @@
 #!/bin/bash
 
 offset=$((2*1024*1024))
+PADDING_MASK=$(printf "0x%X\n" $(($offset - 1)))
+PADDING_MASK_INV=$(printf "0x%X\n" $((~$PADDING_MASK)))
 filesize=0
 prog_req=(mkimage file fdtput mktemp awk od)
+CALC=""
 
 function cleanup_and_return_err()
 {
@@ -100,17 +103,40 @@ function dt_set()
     fi
 }
 
+function dt_set_calc()
+{
+    local path=$1
+    local var=$2
+    local name_var=$3
+ 
+    local addr_var="$name_var"_addr
+    local size_var="$name_var"_size
+
+    cat >> $UBOOT_SOURCE <<- EOF
+	setexpr addr_hi \${$addr_var} / 0x100000000
+	setexpr addr_lo \${$addr_var} \& 0xFFFFFFFF
+	setexpr size_hi \${$size_var} / 0x100000000
+	setexpr size_lo \${$size_var} \& 0xFFFFFFFF
+	fdt set $path $var <0x\${addr_hi} 0x\${addr_lo} 0x\${size_hi} 0x\${size_lo}>
+	EOF
+}
+
 function add_device_tree_kernel()
 {
     local path=$1
-    local addr=$2
-    local size=$3
-    local bootargs=$4
+    local name=$2
+    local addr=$3
+    local size=$4
+    local bootargs=$5
     local node_name="module@${addr#0x}"
 
     dt_mknode "$path" "$node_name"
     dt_set "$path/$node_name" "compatible" "str_a" "multiboot,kernel multiboot,module"
-    dt_set "$path/$node_name" "reg" "hex"  "$(split_addr_size $addr $size)"
+    if test "$CALC"; then
+        dt_set_calc "$path/$node_name" "reg" $name
+    else
+        dt_set "$path/$node_name" "reg" "hex"  "$(split_addr_size $addr $size)"
+    fi
     dt_set "$path/$node_name" "bootargs" "str" "$bootargs"
 }
 
@@ -118,26 +144,36 @@ function add_device_tree_kernel()
 function add_device_tree_ramdisk()
 {
     local path=$1
-    local addr=$2
-    local size=$3
+    local name=$2
+    local addr=$3
+    local size=$4
     local node_name="module@${addr#0x}"
 
     dt_mknode "$path"  "$node_name"
     dt_set "$path/$node_name" "compatible" "str_a" "multiboot,ramdisk multiboot,module"
-    dt_set "$path/$node_name" "reg" "hex"  "$(split_addr_size $addr $size)"
+    if test "$CALC"; then
+        dt_set_calc "$path/$node_name" "reg" $name
+    else
+        dt_set "$path/$node_name" "reg" "hex"  "$(split_addr_size $addr $size)"
+    fi
 }
 
 
 function add_device_tree_passthrough()
 {
     local path=$1
-    local addr=$2
-    local size=$3
+    local name=$2
+    local addr=$3
+    local size=$4
     local node_name="module@${addr#0x}"
 
     dt_mknode "$path"  "$node_name"
     dt_set "$path/$node_name" "compatible" "str_a" "multiboot,device-tree multiboot,module"
-    dt_set "$path/$node_name" "reg" "hex"  "$(split_addr_size $addr $size)"
+    if test "$CALC"; then
+        dt_set_calc "$path/$node_name" "reg" $name
+    else
+        dt_set "$path/$node_name" "reg" "hex"  "$(split_addr_size $addr $size)"
+    fi
 }
 
 function add_device_tree_mem()
@@ -358,7 +394,11 @@ function xen_device_tree_editing()
 
         dt_mknode "/chosen" "$node_name"
         dt_set "/chosen/$node_name" "compatible" "str_a" "xen,xsm-policy xen,multiboot-module multiboot,module"
-        dt_set "/chosen/$node_name" "reg" "hex" "$(split_addr_size $xen_policy_addr $xen_policy_size)"
+        if test "$CALC"; then
+            dt_set_calc "/chosen/$node_name" "reg" "xen_policy"
+        else
+            dt_set "/chosen/$node_name" "reg" "hex" "$(split_addr_size $xen_policy_addr $xen_policy_size)"
+        fi
     fi
 
     if test "$DOM0_KERNEL"
@@ -367,7 +407,11 @@ function xen_device_tree_editing()
 
         dt_mknode "/chosen" "$node_name"
         dt_set "/chosen/$node_name" "compatible" "str_a" "xen,linux-zimage xen,multiboot-module multiboot,module"
-        dt_set "/chosen/$node_name" "reg" "hex" "$(split_addr_size $dom0_kernel_addr $dom0_kernel_size)"
+        if test "$CALC"; then
+            dt_set_calc "/chosen/$node_name" "reg" "dom0_linux"
+        else
+            dt_set "/chosen/$node_name" "reg" "hex" "$(split_addr_size $dom0_kernel_addr $dom0_kernel_size)"
+        fi
         dt_set "/chosen" "xen,dom0-bootargs" "str" "$DOM0_CMD"
     fi
 
@@ -377,7 +421,11 @@ function xen_device_tree_editing()
 
         dt_mknode "/chosen" "$node_name"
         dt_set "/chosen/$node_name" "compatible" "str_a" "xen,linux-initrd xen,multiboot-module multiboot,module"
-        dt_set "/chosen/$node_name" "reg" "hex" "$(split_addr_size $ramdisk_addr $ramdisk_size)"
+        if test "$CALC"; then
+            dt_set_calc "/chosen/$node_name" "reg" "dom0_ramdisk"
+        else
+            dt_set "/chosen/$node_name" "reg" "hex" "$(split_addr_size $ramdisk_addr $ramdisk_size)"
+        fi
     fi
 
     i=0
@@ -464,14 +512,14 @@ function xen_device_tree_editing()
 
         xen_dt_domu_add_vcpu_nodes "/chosen/domU$i" $i ${DOMU_VCPUS[$i]}
 
-        add_device_tree_kernel "/chosen/domU$i" ${domU_kernel_addr[$i]} ${domU_kernel_size[$i]} "${DOMU_CMD[$i]}"
+        add_device_tree_kernel "/chosen/domU$i" "domU${i}_kernel" ${domU_kernel_addr[$i]} ${domU_kernel_size[$i]} "${DOMU_CMD[$i]}"
         if test "${domU_ramdisk_addr[$i]}"
         then
-            add_device_tree_ramdisk "/chosen/domU$i" ${domU_ramdisk_addr[$i]} ${domU_ramdisk_size[$i]}
+            add_device_tree_ramdisk "/chosen/domU$i" "domU${i}_ramdisk" ${domU_ramdisk_addr[$i]} ${domU_ramdisk_size[$i]}
         fi
         if test "${domU_passthrough_dtb_addr[$i]}"
         then
-            add_device_tree_passthrough "/chosen/domU$i" ${domU_passthrough_dtb_addr[$i]} ${domU_passthrough_dtb_size[$i]}
+            add_device_tree_passthrough "/chosen/domU$i" "domU${i}_fdt" ${domU_passthrough_dtb_addr[$i]} ${domU_passthrough_dtb_size[$i]}
         fi
         i=$(( $i + 1 ))
     done
@@ -504,7 +552,11 @@ function device_tree_editing()
 
     if test $UBOOT_SOURCE
     then
-        echo "fdt addr $device_tree_addr" >> $UBOOT_SOURCE
+        if test "$CALC"; then
+            echo "fdt addr \${host_fdt_addr}" >> $UBOOT_SOURCE
+        else
+            echo "fdt addr $device_tree_addr" >> $UBOOT_SOURCE
+        fi
         echo "fdt resize 1024" >> $UBOOT_SOURCE
 
         if test $NUM_DT_OVERLAY && test $NUM_DT_OVERLAY -gt 0
@@ -512,7 +564,11 @@ function device_tree_editing()
             i=0
             while test $i -lt $NUM_DT_OVERLAY
             do
-                echo "fdt apply ${dt_overlay_addr[$i]}" >> $UBOOT_SOURCE
+                if test "$CALC"; then
+                    echo "fdt apply \${host_fdto${i}_addr}" >> $UBOOT_SOURCE
+                else
+                    echo "fdt apply ${dt_overlay_addr[$i]}" >> $UBOOT_SOURCE
+                fi
                 i=$(( $i + 1 ))
             done
         fi
@@ -530,8 +586,12 @@ function fill_reserved_spaces_from_dtb()
 {
     if [ ! -f $DEVICE_TREE ]
     then
-        echo "File $DEVICE_TREE doesn't exist, exiting";
-        cleanup_and_return_err
+        if test "$CALC"; then
+            return
+        else
+            echo "File $DEVICE_TREE doesn't exist, exiting";
+            cleanup_and_return_err
+        fi
     fi
 
     # Check if reserved-memory node exists
@@ -613,7 +673,7 @@ function get_image_size()
     printf "%u" $effective_size
 }
 
-function add_size()
+function add_size_from_file()
 {
     local filename=$1
     local size=`stat -L --printf="%s" $filename`
@@ -645,6 +705,27 @@ function add_size()
     filesize=$size
 }
 
+function add_size_calculate()
+{
+    local fit_scr_name=$1
+
+    cat >> $UBOOT_SOURCE <<- EOF
+	setenv ${fit_scr_name}_addr \${memaddr}
+	setenv ${fit_scr_name}_size \${filesize}
+	setexpr memaddr \${memaddr} \+ \${filesize}
+	setexpr memaddr \${memaddr} \+ $PADDING_MASK
+	setexpr memaddr \${memaddr} \& $PADDING_MASK_INV
+	EOF
+
+    # TODO: missing ${RESERVED_MEM_SPACES[@]} check
+
+    # The following are updated to avoid collisions in node names, but
+    # they are not actively used.
+    memaddr=$((memaddr + offset))
+    memaddr=$(printf "0x%X\n" $memaddr)
+    filesize=$offset
+}
+
 function load_file()
 {
     local filename=$1
@@ -657,10 +738,16 @@ function load_file()
     if test "$FIT"
     then
         echo "imxtract \$fit_addr $fit_scr_name $memaddr" >> $UBOOT_SOURCE
+        add_size_from_file $filename
     else
-        echo "$LOAD_CMD $memaddr ${prepend_path:+$prepend_path/}$relative_path" >> $UBOOT_SOURCE
+        if test "$CALC"; then
+            echo "$LOAD_CMD \${memaddr} ${prepend_path:+$prepend_path/}$relative_path" >> $UBOOT_SOURCE
+            add_size_calculate $fit_scr_name
+        else
+            echo "$LOAD_CMD $memaddr ${prepend_path:+$prepend_path/}$relative_path" >> $UBOOT_SOURCE
+            add_size_from_file $filename
+        fi
     fi
-    add_size $filename
 }
 
 function check_file_type()
@@ -670,8 +757,13 @@ function check_file_type()
 
     if [ ! -f $filename ]
     then
-        echo "File $filename doesn't exist, exiting";
-        cleanup_and_return_err
+        if test "$CALC"
+        then
+            return
+        else
+            echo "File $filename doesn't exist, exiting";
+            cleanup_and_return_err
+        fi
     fi
 
     # if file doesn't know what it is, it outputs data, so include that
@@ -705,8 +797,13 @@ function check_compressed_file_type()
 
     if [ ! -f $filename ]
     then
-        echo "File $filename doesn't exist, exiting";
-        cleanup_and_return_err
+        if test "$CALC"
+        then
+            return
+        else
+            echo "File $filename doesn't exist, exiting";
+            cleanup_and_return_err
+        fi
     fi
 
     file_type=$( file -L $filename )
@@ -872,6 +969,12 @@ function linux_config()
 generate_uboot_images()
 {
     local arch=$(file -L $XEN | grep -E 'ARM64|Aarch64')
+    
+    if test "$CALC"
+    then
+        echo "bootm is not compatible with -s"
+        cleanup_and_return_err
+    fi
 
     if test "$arch"
     then
@@ -997,7 +1100,11 @@ bitstream_load_and_config()
         if test "$UBOOT_SOURCE"
         then
             # we assume the FPGA device is 0 here
-            echo "fpga load 0 $bitstream_addr $bitstream_size" >> "$UBOOT_SOURCE"
+            if test "$CALC"; then
+                echo "fpga load 0 \${fpga_bitstream_addr} \${fpga_bitstream_size}" >> "$UBOOT_SOURCE"
+            else
+                echo "fpga load 0 $bitstream_addr $bitstream_size" >> "$UBOOT_SOURCE"
+            fi
         fi
     fi
 }
@@ -1271,7 +1378,7 @@ function print_help
 {
     script=`basename "$0"`
     echo "usage:"
-    echo "	$script -c CONFIG_FILE -d DIRECTORY [-t LOAD_CMD] [-o FILE] [-k KEY_DIR/HINT [-u U-BOOT_DTB]] [-e] [-f] [-p PREPEND_PATH]"
+    echo "	$script -c CONFIG_FILE -d DIRECTORY [-t LOAD_CMD] [-o FILE] [-k KEY_DIR/HINT [-u U-BOOT_DTB]] [-e] [-f] [-p PREPEND_PATH] [-s]"
     echo "	$script -h"
     echo "where:"
     echo "	CONFIG_FILE - configuration file"
@@ -1289,13 +1396,14 @@ function print_help
     echo "	-f - enable generating a FIT image"
     echo "	PREPEND_PATH - path to be appended before file names to match deploy location within rootfs"
     echo "	-h - prints out the help message and exits "
+    echo "	-s - let U-Boot calculate binary images load addresses/sizes dynamically"
     echo "Defaults:"
     echo "	CONFIG_FILE=$cfg_file, UBOOT_TYPE=\"LOAD_CMD\" env var, DIRECTORY=$uboot_dir"
     echo "Example:"
     echo "	$script -c ../config -d ./build42 -t \"scsi load 1:1\""
 }
 
-while getopts ":c:t:d:ho:k:u:fp:" opt; do
+while getopts ":c:t:d:ho:k:u:fp:s" opt; do
     case ${opt} in
     t )
         case $OPTARG in
@@ -1340,6 +1448,9 @@ while getopts ":c:t:d:ho:k:u:fp:" opt; do
     p )
         prepend_path="$OPTARG"
         ;;
+    s )
+        CALC=y
+        ;;
     h )
         print_help
         exit 0
@@ -1533,6 +1644,10 @@ uboot_addr=$memaddr
 # 2MB are enough for a uboot script
 memaddr=$(( $memaddr + $offset ))
 memaddr=`printf "0x%X\n" $memaddr`
+if test "$CALC"
+then
+    echo "setenv memaddr $memaddr" >> $UBOOT_SOURCE
+fi
 
 fill_reserved_spaces_from_dtb
 
@@ -1583,7 +1698,11 @@ fi
 
 if [ "$BOOT_CMD" != "none" ]
 then
-    echo "$BOOT_CMD $kernel_addr $([ "$BOOT_CMD" = "bootefi" ] || echo '-') $device_tree_addr" >> $UBOOT_SOURCE
+    if test "$CALC"; then
+        echo "$BOOT_CMD \${host_kernel_addr} $([ "$BOOT_CMD" = "bootefi" ] || echo '-') \${host_fdt_addr}" >> $UBOOT_SOURCE
+    else
+        echo "$BOOT_CMD $kernel_addr $([ "$BOOT_CMD" = "bootefi" ] || echo '-') $device_tree_addr" >> $UBOOT_SOURCE
+    fi
 else
     # skip boot command but store load addresses to be used later
     echo "setenv host_kernel_addr $kernel_addr" >> $UBOOT_SOURCE
-- 
2.25.1


