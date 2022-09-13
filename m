Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF4C5B64F6
	for <lists+xen-devel@lfdr.de>; Tue, 13 Sep 2022 03:14:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406087.648484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXuUZ-0003og-I8; Tue, 13 Sep 2022 01:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406087.648484; Tue, 13 Sep 2022 01:13:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXuUZ-0003mB-F1; Tue, 13 Sep 2022 01:13:35 +0000
Received: by outflank-mailman (input) for mailman id 406087;
 Tue, 13 Sep 2022 01:13:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MVF+=ZQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oXuUY-0003m5-Ay
 for xen-devel@lists.xenproject.org; Tue, 13 Sep 2022 01:13:34 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47a1c0d8-3301-11ed-a31c-8f8a9ae3403f;
 Tue, 13 Sep 2022 03:13:31 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3A6FC612CC;
 Tue, 13 Sep 2022 01:13:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E574C433C1;
 Tue, 13 Sep 2022 01:13:28 +0000 (UTC)
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
X-Inumbo-ID: 47a1c0d8-3301-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663031609;
	bh=CYyhikYDYUyrkYL8cB3aVHd5f9cMk6sNJ/S/LNxSRzw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QmCU9vns4xsvuRc/aQ9UOP9uAvDIrkmrDCfuqv9FWHhxWfJxhx+Ll6rHTdPRB10Y7
	 pyHhK+OHQDZAc4NZdcXsnF6rMwStgWlf/i3wvwSxmYsPXrIC5gBqinkeADwFbdNSCO
	 Eku64kZfYUUxpV8yLHNpyXdsUF2cUzuMT+i1aquUW1vtK0soFrt5rei7YltmdByHsg
	 u4cGyz33kvTRodU548esMCJwjZWv35eqQtma+7sTJAO8doo7v3hNsRdXVsa7Qi+Zk7
	 stSWQUlP3084TDVS+aBf6sK+CpPHFHeo3cg/5fl6T4+mqy00sNeVCFGTbIgOUU9J3v
	 brxrC5TtLcveQ==
Date: Mon, 12 Sep 2022 18:13:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org
Subject: Re: [ImageBuilder 2/2] Add support for lopper to generate partial
 dts
In-Reply-To: <20220912115934.19552-3-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2209121758280.157835@ubuntu-linux-20-04-desktop>
References: <20220912115934.19552-1-michal.orzel@amd.com> <20220912115934.19552-3-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 12 Sep 2022, Michal Orzel wrote:
> Currently ImageBuilder can compile and merge partial dts obtained from
> a repository specified using PASSTHROUGH_DTS_REPO. With the recent
> changes done in the lopper, we can use it to generate partial dts
> automatically (to some extent as this is still an early support).
> 
> Introduce LOPPER_PATH option to specify a path to a lopper.py script,
> that if set, will invoke lopper to generate partial dts for the
> passthrough devices specified in DOMU_PASSTHROUGH_PATHS.
> 
> Introduce LOPPER_CMD option to specify custom command line arguments
> (if needed) for lopper's extract assist.
> 
> Example usage:
> LOPPER_PATH="/home/user/lopper/lopper.py"
> DOMU_PASSTHROUGH_PATHS[0]="/axi/spi@ff0f0000 /axi/serial@ff010000"

Is lopper.py this file?

https://github.com/devicetree-org/lopper/blob/master/lopper.py

If so, it would be good to specify in the README that this is not just
an arbitrary lopper.py script, but the main entry point of Lopper as a
project. For instance:

---
Introduce LOPPER_PATH option to specify a path to a lopper.py script,
the main script in the Lopper repository
(https://github.com/devicetree-org/lopper). If set, ....
---


> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
>  README.md                | 22 ++++++++++++--
>  scripts/common           | 64 ++++++++++++++++++++++++++++++----------
>  scripts/uboot-script-gen | 17 +++++++++--
>  3 files changed, 83 insertions(+), 20 deletions(-)
> 
> diff --git a/README.md b/README.md
> index da9ba788a3bf..aaee0939b589 100644
> --- a/README.md
> +++ b/README.md
> @@ -128,6 +128,19 @@ Where:
>  - DT_OVERLAY[number] specifies the path to the hosts device tree overlays
>    to be added at boot time in u-boot
>  
> +- LOPPER_PATH specifies the path to lopper.py script. This is optional.
> +  However, if this is specified, then DOMU_PASSTHROUGH_PATHS[number] need
> +  to be specified. uboot-script-gen will invoke lopper to generate the partial
> +  device trees which have been specified in DOMU_PASSTHROUGH_PATHS[number].
> +  This option is currently in experimental state as the corresponding lopper
> +  changes are still in an early support state.
> +
> +- LOPPER_CMD specifies the command line arguments for lopper's extract assist.
> +  This is optional and only applicable when LOPPER_PATH is specified. Only to be
> +  used to specify which nodes to include (using -i <node_name>) and which
> +  nodes/properties to exclude (using -x <regex>). If not set at all, the default
> +  one is used applicable for ZynqMP MPSoC boards.
> +
>  - NUM_DOMUS specifies how many Dom0-less DomUs to load
>  
>  - DOMU_KERNEL[number] specifies the DomU kernel to use.
> @@ -140,7 +153,7 @@ Where:
>  - DOMU_PASSTHROUGH_PATHS[number] specifies the passthrough devices (
>    separated by spaces). It adds "xen,passthrough" to the corresponding
>    dtb nodes in xen device tree blob.
> -  This option is valid in the following two cases:
> +  This option is valid in the following cases:
>  
>    1. When PASSTHROUGH_DTS_REPO is provided.
>    With this option, the partial device trees (corresponding to the
> @@ -149,7 +162,12 @@ Where:
>    Note it assumes that the names of the partial device trees will match
>    to the names of the devices specified here.
>  
> -  2. When DOMU_NOBOOT[number] is provided. In this case, it will only
> +  2. When LOPPER_PATH is provided.
> +  With this option, the partial device trees (corresponding to the
> +  passthrough devices) are generated by the lopper and then compiled and merged
> +  by ImageBuilder to be used as DOMU[number] device tree blob.
> +
> +  3. When DOMU_NOBOOT[number] is provided. In this case, it will only
>    add "xen,passthrough" as mentioned before.
>  
>  - DOMU_PASSTHROUGH_DTB[number] specifies the passthrough device trees
> diff --git a/scripts/common b/scripts/common
> index ccad03d82b30..680c5090cd07 100644
> --- a/scripts/common
> +++ b/scripts/common
> @@ -9,6 +9,9 @@
>  # - NUM_DOMUS
>  # - DOMU_PASSTHROUGH_PATHS
>  # - DOMU_PASSTHROUGH_DTB
> +# - LOPPER_PATH
> +# - LOPPER_CMD
> +# - DEVICE_TREE
>  
>  tmp_files=()
>  tmp_dirs=()
> @@ -99,31 +102,41 @@ function compile_merge_partial_dts()
>      local tmp
>      local tmpdts
>      local file
> +    local node
>      local i
>      local j
>  
> -    if [[ "$repo" =~ .*@.*:.* ]]
> +    if test "$repo"
>      then
> -        tmp=`mktemp -d`
> -        tmp_dirs+=($tmp)
> -
> -        echo "Cloning git repo \"$git_repo\""
> -        git clone "$repo" $tmp
> -        if test $? -ne 0
> +        # Partial dts will be obtained from PASSTHROUGH_DTS_REPO
> +        if [[ "$repo" =~ .*@.*:.* ]]
>          then
> -            echo "Error occurred while cloning \"$git_repo\""
> -            return 1
> -        fi
> +            tmp=`mktemp -d`
> +            tmp_dirs+=($tmp)
>  
> -        repo=$tmp
> -    fi
> +            echo "Cloning git repo \"$git_repo\""
> +            git clone "$repo" $tmp
> +            if test $? -ne 0
> +            then
> +                echo "Error occurred while cloning \"$git_repo\""
> +                return 1
> +            fi
>  
> -    if test -z "$dir"
> -    then
> -        dir="."
> +            repo=$tmp
> +        fi
> +
> +        if test -z "$dir"
> +        then
> +            dir="."
> +        fi
> +        partial_dts_dir="$repo"/"$dir"
> +    else
> +        # Partial dts will be generated by the lopper
> +        tmp=`mktemp -d`
> +        tmp_dirs+=($tmp)

setting tmp and tmp_dirs can be moved outside of the if


> +        partial_dts_dir="$tmp"
>      fi
>  
> -    partial_dts_dir="$repo"/"$dir"
>      i=0
>      while test $i -lt $NUM_DOMUS
>      do
> @@ -133,6 +146,25 @@ function compile_merge_partial_dts()
>              return 1
>          fi
>  
> +        if test -z "$repo"
> +        then
> +            # Generate partial dts using lopper
> +            for devpath in ${DOMU_PASSTHROUGH_PATHS[$i]}
> +            do
> +                node=${devpath##*/}
> +                file="$partial_dts_dir"/"$node".dts

This is a minor NIT. As we do below: 

            file=${devpath##*/}
            file="$partial_dts_dir"/"$file".dts

Can you change the code below to use node and file as you do here for
consistency?


> +                $LOPPER_PATH --permissive -f $DEVICE_TREE \
> +                -- extract -t $devpath $LOPPER_CMD \
> +                -- extract-xen -t $node -o $file
> +
> +                if test $? -ne 0
> +                then
> +                    return 1
> +                fi
> +            done
> +        fi
> +
>          sanity_check_partial_dts "${DOMU_PASSTHROUGH_PATHS[$i]}" "$partial_dts_dir"
>          if test $? -ne 0
>          then
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index 1f8ab5ffd193..84a68d6bd0b0 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -1138,10 +1138,23 @@ fi
>  # tftp or move the files to a partition
>  cd "$uboot_dir"
>  
> -if test "$PASSTHROUGH_DTS_REPO"
> +# If both PASSTHROUGH_DTS_REPO and LOPPER_PATH options are specified,
> +# the former takes precedence because the partial device trees are already
> +# created (probably tested), hence the reliability is higher than using lopper.
> +if test "$PASSTHROUGH_DTS_REPO" || test "$LOPPER_PATH"
>  then
>      output_dir=`mktemp -d "partial-dtbs-XXX"`
> -    compile_merge_partial_dts $output_dir "$PASSTHROUGH_DTS_REPO"
> +    if test "$PASSTHROUGH_DTS_REPO"
> +    then
> +        compile_merge_partial_dts $output_dir "$PASSTHROUGH_DTS_REPO"
> +    else
> +        if test -z "$LOPPER_CMD"
> +        then
> +            # Default for ZynqMP MPSoC
> +            LOPPER_CMD="-i zynqmp-firmware -x interrupt-controller -x pinctrl -x power-domains -x resets -x current-speed"
> +        fi
> +        compile_merge_partial_dts $output_dir
> +    fi
>      if test $? -ne 0
>      then
>          # Remove the output dir holding the partial dtbs in case of any error
> -- 
> 2.25.1
> 

