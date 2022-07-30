Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0379E5857C5
	for <lists+xen-devel@lfdr.de>; Sat, 30 Jul 2022 03:31:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377958.611292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHbJI-00057a-Pb; Sat, 30 Jul 2022 01:30:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377958.611292; Sat, 30 Jul 2022 01:30:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHbJI-00054q-MT; Sat, 30 Jul 2022 01:30:32 +0000
Received: by outflank-mailman (input) for mailman id 377958;
 Sat, 30 Jul 2022 01:30:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=klDL=YD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oHbJG-00054k-VZ
 for xen-devel@lists.xenproject.org; Sat, 30 Jul 2022 01:30:30 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 316cf2dc-0fa7-11ed-bd2d-47488cf2e6aa;
 Sat, 30 Jul 2022 03:30:29 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9B73161CEE;
 Sat, 30 Jul 2022 01:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AE1DC433D6;
 Sat, 30 Jul 2022 01:30:26 +0000 (UTC)
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
X-Inumbo-ID: 316cf2dc-0fa7-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659144627;
	bh=x98hx+nXW+NyRpONjLXqJeGNcgcO9WnjuDaMpyLpXNw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=P4uorzhWraIM8zhI4r3lshu2ZdX6QcqZ8G0RzIJp4p1lp8sLik8hsTnOuv2dVci71
	 3o28Tqid8rhv+o4EWbtNPQFVgQY2mfbzbeDR6OQeza2LKx4a7WgPmqTjH8Qwk4hi1a
	 Q8SdOfHc5WdlnWw7p9A7nauvogrTGImAx0anzeQVgp3Li7IHdHW4mKKSXcjZnUIab5
	 rhv4h0W0A673rpCtkZ1n5rKL3NDMDPL+dHnbb9nt3czaNU0Nd3ZFyb8O7mKvSCjqJ1
	 BkKkTnIcJeTEELoHvH4yu0qVgIPiHLX02F0KWzOaa15RKgbXQ59H1yKJ72TvFsvfA8
	 FZ2uSj/9f4uaA==
Date: Fri, 29 Jul 2022 18:30:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
cc: xen-devel@lists.xenproject.org, viryaos-discuss@lists.sourceforge.net, 
    sstabellini@kernel.org, Andrei Cherechesu <andrei.cherechesu@nxp.com>, 
    ayan.kumar.halder@amd.com
Subject: Re: [ImageBuilder][PATCH v3 1/3] uboot-script-gen: Dynamically
 compute addr and size when loading binaries
In-Reply-To: <20220713163044.3541661-2-andrei.cherechesu@oss.nxp.com>
Message-ID: <alpine.DEB.2.22.394.2207291825460.4648@ubuntu-linux-20-04-desktop>
References: <20220713163044.3541661-1-andrei.cherechesu@oss.nxp.com> <20220713163044.3541661-2-andrei.cherechesu@oss.nxp.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 13 Jul 2022, Andrei Cherechesu (OSS) wrote:
> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> 
> Normally, the script would precompute the sizes of the loaded binaries
> and addresses where they are loaded before generating the script,
> and the sizes and addresses that needed to be provided to Xen via
> /chosen would be hardcoded in the boot script.
> 
> Added option via "-s" parameter to use the ${filesize} variable
> in u-boot, which is set automatically after a *load command.
> The value stored by filesize is now stored in a u-boot env variable
> with the name corresponding to the binary that was loaded before.
> The newly set variables are now used in setting the /chosen node,
> instead of the hardcoded values.
> 
> Also, the loading addresses for the files are dynamically computed
> and aligned to 0x200000 using the `setexpr` u-boot command. Basically,
> if the option is used, there are zero hardcoded addresses inside the
> boot script, and everything is determined based on the MEMORY_START
> parameter and each binary's size.
> 
> If the "-s" parameter is not used, the script does not store the
> binaries' sizes and addresses in variables and uses the precomputed
> ones when advertising them in the /chosen node.
> 
> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>

This patch is difficult :-)

I like the idea but it makes the code significantly more complex due to
the additional $dynamic_loading_opt case handled everywhere. Initially I
thought about only retain the code path using u-boot variables, at least
after loading the files. However, I realize that it would break the
FDTEDIT case, which I think it would be good to keep working. Also it is
nice to be able to edit the device tree at build time putting in the
right values.

So I tried to eliminated most of the new "if" statements in another way.
The best I could come up with is the below, using eval and additional
bash variables to look up the address and size based on the variable
name (e.g. dom0_kernel). If we want the address, we use the value of
$dom0_kernel_addr, if we want the u-boot variable we use ${dom0_kernel}.

This is untested, just to show the idea. What do you think? Is it
better? Do you prefer the original patch? Other ideas or opinions? 


diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index 18c0ce1..cee22f6 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -4,6 +4,9 @@ offset=$((2*1024*1024))
 filesize=0
 prog_req=(mkimage file fdtput mktemp awk)
 
+padding_mask=`printf "0x%X\n" $(($offset - 1))`
+padding_mask_inv=`printf "0x%X\n" $((~$padding_mask))`
+
 function cleanup_and_return_err()
 {
     rm -f $UBOOT_SOURCE $UBOOT_SCRIPT
@@ -28,6 +31,7 @@ function dt_mknode()
 #   str
 #   str_a
 #   bool
+#   var
 function dt_set()
 {
     local path=$1
@@ -35,11 +39,21 @@ function dt_set()
     local data_type=$3
     local data=$4
 
+    if test $data_type = "var"
+    then
+        eval data_addr_var="$data"_addr
+        eval data_addr=\$"$data_addr_var"
+        eval data_size_var="$data"_size
+        eval data_size=\$"$data_size_var"
+    fi
 
     if test "$UBOOT_SOURCE" && test ! "$FIT"
     then
         var=${var/\#/\\#}
-        if test $data_type = "hex" || test $data_type = "int"
+        if test $data_type = "var"
+        then
+            echo "fdt set $path $var <0x0 0x\${"$data_addr_var"} 0x0 0x\${"$data_size_var"}>" >> $UBOOT_SOURCE
+        elif test $data_type = "hex" || test $data_type = "int"
         then
             echo "fdt set $path $var <$data>" >> $UBOOT_SOURCE
         elif test $data_type = "str_a"
@@ -63,7 +77,10 @@ function dt_set()
 
     if test $FDTEDIT
     then
-        if test $data_type = "hex"
+        if test $data_type = "var"
+        then
+            fdtput $FDTEDIT -p -t x $path $var 0x0 "$data_addr" 0x0 "$data_size"
+        elif test $data_type = "hex"
         then
             fdtput $FDTEDIT -p -t x $path $var $data
         elif test $data_type = "int"
@@ -87,38 +104,35 @@ function dt_set()
 function add_device_tree_kernel()
 {
     local path=$1
-    local addr=$2
-    local size=$3
-    local bootargs=$4
+    local varname=$2
+    local bootargs=$3
 
-    dt_mknode "$path" "module$addr"
-    dt_set "$path/module$addr" "compatible" "str_a" "multiboot,kernel multiboot,module"
-    dt_set "$path/module$addr" "reg" "hex"  "0x0 $addr 0x0 $(printf "0x%x" $size)"
-    dt_set "$path/module$addr" "bootargs" "str" "$bootargs"
+    dt_mknode "$path" "module-$varname"
+    dt_set "$path/module-$varname" "compatible" "str_a" "multiboot,kernel multiboot,module"
+    dt_set "$path/module-$varname" "reg" "var"  "$varname"
+    dt_set "$path/module-$varname" "bootargs" "str" "$bootargs"
 }
 
 
 function add_device_tree_ramdisk()
 {
     local path=$1
-    local addr=$2
-    local size=$3
+    local varname=$2
 
-    dt_mknode "$path"  "module$addr"
-    dt_set "$path/module$addr" "compatible" "str_a" "multiboot,ramdisk multiboot,module"
-    dt_set "$path/module$addr" "reg" "hex"  "0x0 $addr 0x0 $(printf "0x%x" $size)"
+    dt_mknode "$path" "module-$varname"
+    dt_set "$path/module-$varname" "compatible" "str_a" "multiboot,ramdisk multiboot,module"
+    dt_set "$path/module-$varname" "reg" "var"  "$varname"
 }
 
 
 function add_device_tree_passthrough()
 {
     local path=$1
-    local addr=$2
-    local size=$3
+    local varname=$2
 
-    dt_mknode "$path"  "module$addr"
-    dt_set "$path/module$addr" "compatible" "str_a" "multiboot,device-tree multiboot,module"
-    dt_set "$path/module$addr" "reg" "hex"  "0x0 $addr 0x0 $(printf "0x%x" $size)"
+    dt_mknode "$path" "module-$varname"
+    dt_set "$path/module-$varname" "compatible" "str_a" "multiboot,device-tree multiboot,module"
+    dt_set "$path/module-$varname" "reg" "var"  "$varname"
 }
 
 function add_device_tree_mem()
@@ -186,7 +200,7 @@ function xen_device_tree_editing()
     then
         dt_mknode "/chosen" "dom0"
         dt_set "/chosen/dom0" "compatible" "str_a" "xen,linux-zimage xen,multiboot-module multiboot,module"
-        dt_set "/chosen/dom0" "reg" "hex" "0x0 $dom0_kernel_addr 0x0 $(printf "0x%x" $dom0_kernel_size)"
+        dt_set "/chosen/dom0" "reg" "var" "dom0_linux"
         dt_set "/chosen" "xen,dom0-bootargs" "str" "$DOM0_CMD"
     fi
 
@@ -194,7 +208,7 @@ function xen_device_tree_editing()
     then
         dt_mknode "/chosen" "dom0-ramdisk"
         dt_set "/chosen/dom0-ramdisk" "compatible" "str_a" "xen,linux-initrd xen,multiboot-module multiboot,module"
-        dt_set "/chosen/dom0-ramdisk" "reg" "hex" "0x0 $ramdisk_addr 0x0 $(printf "0x%x" $ramdisk_size)"
+        dt_set "/chosen/dom0-ramdisk" "reg" "var" "dom0_ramdisk"
     fi
 
     i=0
@@ -241,14 +255,14 @@ function xen_device_tree_editing()
             dt_set "/chosen/domU$i" "colors" "hex" "$(printf "0x%x" $bitcolors)"
         fi
 
-        add_device_tree_kernel "/chosen/domU$i" ${domU_kernel_addr[$i]} ${domU_kernel_size[$i]} "${DOMU_CMD[$i]}"
+        add_device_tree_kernel "/chosen/domU$i" "domU${i}_kernel" "${DOMU_CMD[$i]}"
         if test "${domU_ramdisk_addr[$i]}"
         then
-            add_device_tree_ramdisk "/chosen/domU$i" ${domU_ramdisk_addr[$i]} ${domU_ramdisk_size[$i]}
+            add_device_tree_ramdisk "/chosen/domU$i" "domU${i}_ramdisk"
         fi
         if test "${domU_passthrough_dtb_addr[$i]}"
         then
-            add_device_tree_passthrough "/chosen/domU$i" ${domU_passthrough_dtb_addr[$i]} ${domU_passthrough_dtb_size[$i]}
+            add_device_tree_passthrough "/chosen/domU$i" "domU${i}_fdt"
         fi
         i=$(( $i + 1 ))
     done
@@ -271,7 +285,7 @@ function device_tree_editing()
 
     if test $UBOOT_SOURCE
     then
-        echo "fdt addr $device_tree_addr" >> $UBOOT_SOURCE
+        echo "fdt addr \${host_fdt_addr}" >> $UBOOT_SOURCE
         echo "fdt resize 1024" >> $UBOOT_SOURCE
 
         if test $NUM_DT_OVERLAY && test $NUM_DT_OVERLAY -gt 0
@@ -296,11 +310,25 @@ function device_tree_editing()
 function add_size()
 {
     local filename=$1
+    local fit_scr_name=$2
+    local binary_name_addr="${fit_scr_name}_addr"
+    local binary_name_size="${fit_scr_name}_size"
+    eval "$fit_scr_name"_addr=$memaddr
+
+    echo "setenv $binary_name_addr \${memaddr}" >> $UBOOT_SOURCE
+    echo "setenv $binary_name_size \${filesize}" >> $UBOOT_SOURCE
+    # Compute load addr for next binary dynamically
+    echo "setexpr memaddr \${memaddr} \+ \${filesize}" >> $UBOOT_SOURCE
+    echo "setexpr memaddr \${memaddr} \+ $padding_mask" >> $UBOOT_SOURCE
+    echo "setexpr memaddr \${memaddr} \& $padding_mask_inv" >> $UBOOT_SOURCE
+
     local size=`stat -L --printf="%s" $filename`
     memaddr=$(( $memaddr + $size + $offset - 1))
     memaddr=$(( $memaddr & ~($offset - 1) ))
     memaddr=`printf "0x%X\n" $memaddr`
     filesize=$size
+
+    eval "$fit_scr_name"_size=`printf "0x%X\n" $size`
 }
 
 function load_file()
@@ -315,10 +343,13 @@ function load_file()
     if test "$FIT"
     then
         echo "imxtract \$fit_addr $fit_scr_name $memaddr" >> $UBOOT_SOURCE
+    elif test "$dynamic_loading_opt"
+    then
+        echo "$LOAD_CMD \${memaddr} ${prepend_path:+$prepend_path/}$relative_path" >> $UBOOT_SOURCE
     else
         echo "$LOAD_CMD $memaddr ${prepend_path:+$prepend_path/}$relative_path" >> $UBOOT_SOURCE
     fi
-    add_size $filename
+    add_size $filename $fit_scr_name
 }
 
 function check_file_type()
@@ -899,7 +930,7 @@ function print_help
 {
     script=`basename "$0"`
     echo "usage:"
-    echo "	$script -c CONFIG_FILE -d DIRECTORY [-t LOAD_CMD] [-o FILE] [-k KEY_DIR/HINT [-u U-BOOT_DTB]] [-e] [-f] [-p PREPEND_PATH]"
+    echo "	$script -c CONFIG_FILE -d DIRECTORY [-t LOAD_CMD] [-o FILE] [-k KEY_DIR/HINT [-u U-BOOT_DTB]] [-e] [-f] [-p PREPEND_PATH] [-s]"
     echo "	$script -h"
     echo "where:"
     echo "	CONFIG_FILE - configuration file"
@@ -916,6 +947,7 @@ function print_help
     echo "	U-BOOT_DTB - u-boot control dtb so that the public key gets added to it"
     echo "	-f - enable generating a FIT image"
     echo "	PREPEND_PATH - path to be appended before file names to match deploy location within rootfs"
+    echo "	-s - enable dynamic loading of binaries by storing their addresses and sizes u-boot env variables"
     echo "	-h - prints out the help message and exits "
     echo "Defaults:"
     echo "	CONFIG_FILE=$cfg_file, UBOOT_TYPE=\"LOAD_CMD\" env var, DIRECTORY=$uboot_dir"
@@ -923,7 +955,7 @@ function print_help
     echo "	$script -c ../config -d ./build42 -t \"scsi load 1:1\""
 }
 
-while getopts ":c:t:d:ho:k:u:fp:" opt; do
+while getopts ":c:t:d:ho:k:u:fp:s" opt; do
     case ${opt} in
     t )
         case $OPTARG in
@@ -965,6 +997,9 @@ while getopts ":c:t:d:ho:k:u:fp:" opt; do
     p )
         prepend_path="$OPTARG"
         ;;
+    s )
+        dynamic_loading_opt=y
+        ;;
     h )
         print_help
         exit 0
@@ -1126,6 +1161,7 @@ uboot_addr=$memaddr
 # 2MB are enough for a uboot script
 memaddr=$(( $memaddr + $offset ))
 memaddr=`printf "0x%X\n" $memaddr`
+echo "setenv memaddr $memaddr" >> $UBOOT_SOURCE
 
 if test "$os" = "xen"
 then
@@ -1169,11 +1205,7 @@ fi
 
 if [ "$BOOT_CMD" != "none" ]
 then
-    echo "$BOOT_CMD $kernel_addr - $device_tree_addr" >> $UBOOT_SOURCE
-else
-    # skip boot command but store load addresses to be used later
-    echo "setenv host_kernel_addr $kernel_addr" >> $UBOOT_SOURCE
-    echo "setenv host_fdt_addr $device_tree_addr" >> $UBOOT_SOURCE
+    echo "$BOOT_CMD \${host_kernel_addr} - \${host_fdt_addr}" >> $UBOOT_SOURCE
 fi
 
 if test "$FIT"

