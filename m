Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C90D5B21791
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 23:39:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078106.1439108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulaDo-0004HB-5E; Mon, 11 Aug 2025 21:38:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078106.1439108; Mon, 11 Aug 2025 21:38:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulaDo-0004Es-2f; Mon, 11 Aug 2025 21:38:24 +0000
Received: by outflank-mailman (input) for mailman id 1078106;
 Mon, 11 Aug 2025 21:38:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6XhN=2X=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ulaDm-0004Em-Ot
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 21:38:22 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f373f0a-76fb-11f0-a327-13f23c93f187;
 Mon, 11 Aug 2025 23:38:20 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 65C4E4181E;
 Mon, 11 Aug 2025 21:38:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBD33C4CEED;
 Mon, 11 Aug 2025 21:38:17 +0000 (UTC)
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
X-Inumbo-ID: 7f373f0a-76fb-11f0-a327-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754948298;
	bh=Z46roxxNQTj+XRgBojXDWGrX1V5j73TFMR8XlHuXHHc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jEspwoscK3iOAW+yN3/NqIrDCRuGxK+Ih0RScQZEddPtBgri4ihWvccNE4EfOV8Tr
	 HomxBYvYz9zHbXn9S6SU9Y1Y1CEI/vqm0ns8gvbU0ijr+7gKtCWw9aflWQoYjTwcxu
	 J/6UTvM+8FSvQ75ovVygX8Xkrxn9RenIfJkXi+6Yowcw6NZZ864kcmj8H7B9iJqtnL
	 tZsKXIvuSi0KC/lRj5Gly4jkXNCosJHrSUSmOrWA1uUGXQQ2do1GS+EHPWXN2DjbjL
	 Yq+t9jKIx36UPgk40jxvQm/RMdavh+/iadVEwADD6oa39AqIVWTMNJmEhoKDlIMmTu
	 APBaBssGuHTqA==
Date: Mon, 11 Aug 2025 14:38:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com
Subject: Re: [ImageBuilder] Add config option to use separate load commands
 for Xen, DOM0 and DOMU binaries
In-Reply-To: <20250806123352.15852-1-ayan.kumar.halder@amd.com>
Message-ID: <alpine.DEB.2.22.394.2508111428490.2883419@ubuntu-linux-20-04-desktop>
References: <20250806123352.15852-1-ayan.kumar.halder@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 6 Aug 2025, Ayan Kumar Halder wrote:
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

The patch is correct and the new config options look good. Two things.

The following check should be removed or, better, modified to account
for the new options:

    if test ! "$LOAD_CMD"
    then
        echo "LOAD_CMD not set, either specify it in the config or set it with the -t option"
        exit 1
    fi

Thanks to this patch, it shouldn't be necessary to specify LOAD_CMD any
longer.

find_root_dev and fit are the only two remaining users of LOAD_CMD.
While I think it makes sense to keep LOAD_CMD for fit, find_root_dev
should probably use DOM0_LOAD instead.

This incremental change (untested) should work. What do you think?



diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index 9e97944..867876f 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -824,10 +824,10 @@ function check_compressed_file_type()
 
 function find_root_dev()
 {
-
-    local dev=${LOAD_CMD%:*}
+    local load_cmd=$1
+    local dev=${load_cmd%:*}
     dev=${dev##* }
-    local par=${LOAD_CMD#*:}
+    local par=${load_cmd#*:}
 
     if [ -z "$dev" ] || [ -z "$par" ]
     then
@@ -838,10 +838,10 @@ function find_root_dev()
 
     par=$((par + 1))
 
-    if [[ $LOAD_CMD =~ mmc ]]
+    if [[ $load_cmd =~ mmc ]]
     then
         root_dev="/dev/mmcblk${dev}p${par}"
-    elif [[ $LOAD_CMD =~ scsi ]]
+    elif [[ $load_cmd =~ scsi ]]
     then
         # converts number to a scsi device character
         dev=$((dev + 97))
@@ -912,7 +912,7 @@ function xen_config()
         then
             DOM0_CMD="$DOM0_CMD root=/dev/ram0"
         else
-            find_root_dev
+            find_root_dev "$DOM0_LOAD"
             # $root_dev is set by find_root_dev
             DOM0_CMD="$DOM0_CMD root=$root_dev"
         fi
@@ -960,7 +960,7 @@ function linux_config()
         then
             LINUX_CMD="$LINUX_CMD root=/dev/ram0"
         else
-            find_root_dev
+            find_root_dev "$LOAD_CMD"
             # $root_dev is set by find_root_dev
             LINUX_CMD="$LINUX_CMD root=$root_dev"
         fi
@@ -990,10 +990,6 @@ generate_uboot_images()
 
 xen_file_loading()
 {
-    if test -z "$DOM0_LOAD"
-    then
-        DOM0_LOAD="$LOAD_CMD"
-    fi
     if test "$DOM0_KERNEL"
     then
         check_compressed_file_type $DOM0_KERNEL "executable\|uImage"
@@ -1065,11 +1061,6 @@ xen_file_loading()
         generate_uboot_images
     fi
 
-    if test -z "${XEN_LOAD}"
-    then
-        XEN_LOAD="$LOAD_CMD"
-    fi
-
     kernel_addr=$memaddr
     kernel_path=$XEN
     load_file "$XEN" "host_kernel" "$XEN_LOAD"
@@ -1518,12 +1509,22 @@ then
     FIT="${UBOOT_SOURCE%.source}.fit"
 fi
 
-if test ! "$LOAD_CMD"
+if test ! "$LOAD_CMD" && ! test "$XEN_LOAD"
 then
     echo "LOAD_CMD not set, either specify it in the config or set it with the -t option"
     exit 1
 fi
 
+if test -z "$DOM0_LOAD"
+then
+    DOM0_LOAD="$LOAD_CMD"
+fi
+
+if test -z "${XEN_LOAD}"
+then
+    XEN_LOAD="$LOAD_CMD"
+fi
+
 if test ! "$BOOT_CMD"
 then
     BOOT_CMD="booti"

