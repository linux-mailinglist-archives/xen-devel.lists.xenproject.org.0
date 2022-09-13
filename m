Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 794305B7B53
	for <lists+xen-devel@lfdr.de>; Tue, 13 Sep 2022 21:32:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406626.649014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYBeK-0006WA-MY; Tue, 13 Sep 2022 19:32:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406626.649014; Tue, 13 Sep 2022 19:32:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYBeK-0006SZ-JA; Tue, 13 Sep 2022 19:32:48 +0000
Received: by outflank-mailman (input) for mailman id 406626;
 Tue, 13 Sep 2022 19:32:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MVF+=ZQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oYBeJ-0006S2-PZ
 for xen-devel@lists.xenproject.org; Tue, 13 Sep 2022 19:32:47 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d76e9931-339a-11ed-a31c-8f8a9ae3403f;
 Tue, 13 Sep 2022 21:32:46 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ACEA561562;
 Tue, 13 Sep 2022 19:32:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 130F8C433C1;
 Tue, 13 Sep 2022 19:32:43 +0000 (UTC)
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
X-Inumbo-ID: d76e9931-339a-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663097564;
	bh=JfYzEoIygfy8CKHnNNxXnJCm52O6HXARQ6jS9spBjk4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Mx7bW5LZL5m7fmKuO1fDfbm+O/5fpsP6mcUG54q++TyAX/H0YrxVq40X5GHhiaXjY
	 YrTz1xYRmtOr+w5WM2BHAaCCvkrAFn7EoNvTTYVWv2DmbVyoE1qBp6LvFaK1axgcui
	 qK91W0rQx3yLUPTcsiNynmJX1bJ/rIfDiiLdIZf+/9sPHv0GbcAraV5CJ6UysQ73uL
	 yKbice9I+whCJeeIRHVBazp42GZ7X/v7qhTDjsKKOoG+vVsAwSf+zr/g72Cjza7gLS
	 rnsNvW2EGXk3Mw13zhXvcm3+ynmk/+D/MQU9SFlHpevvqmvkhBs6BVmd44ogCsRXOx
	 7EYRO13Kb8sbA==
Date: Tue, 13 Sep 2022 12:32:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org
Subject: Re: [ImageBuilder v2 2/2] Add support for lopper to generate partial
 dts
In-Reply-To: <20220913120918.31162-3-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2209131230590.157835@ubuntu-linux-20-04-desktop>
References: <20220913120918.31162-1-michal.orzel@amd.com> <20220913120918.31162-3-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 13 Sep 2022, Michal Orzel wrote:
> Currently ImageBuilder can compile and merge partial dts obtained from
> a repository specified using PASSTHROUGH_DTS_REPO. With the recent
> changes done in the lopper, we can use it to generate partial dts
> automatically (to some extent as this is still an early support).
> 
> Introduce LOPPER_PATH option to specify a path to a lopper.py script,
> the main script in the Lopper repository, that if set, will invoke lopper
> to generate partial dts for the passthrough devices specified in
> DOMU_PASSTHROUGH_PATHS.
> 
> Introduce LOPPER_CMD option to specify custom command line arguments
> (if needed) for lopper's extract assist.
> 
> Example usage:
> LOPPER_PATH="/home/user/lopper/lopper.py"
> DOMU_PASSTHROUGH_PATHS[0]="/axi/spi@ff0f0000 /axi/serial@ff010000"
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Given the state of the release I would commit these two patches to a
"master-next" branch to be merged into "master" later.

But I'll wait before committing to hear your thoughrs on the SRC_URI
suggestion in the other email.


> ---
> Changes in v2:
> - improve documentation
> - update commit msg
> - use node=${devpath##*/} instead of file=${devpath##*/}
> ---
>  README.md                | 23 ++++++++++--
>  scripts/common           | 77 ++++++++++++++++++++++++++++++----------
>  scripts/uboot-script-gen | 22 ++++++++++--
>  3 files changed, 100 insertions(+), 22 deletions(-)
> 
> diff --git a/README.md b/README.md
> index da9ba788a3bf..f4213d570033 100644
> --- a/README.md
> +++ b/README.md
> @@ -128,6 +128,20 @@ Where:
>  - DT_OVERLAY[number] specifies the path to the hosts device tree overlays
>    to be added at boot time in u-boot
>  
> +- LOPPER_PATH specifies the path to lopper.py script, the main script in the
> +  Lopper repository (https://github.com/devicetree-org/lopper). This is
> +  optional. However, if this is specified, then DOMU_PASSTHROUGH_PATHS[number]
> +  needs to be specified. uboot-script-gen will invoke lopper to generate the
> +  partial device trees for devices which have been listed in
> +  DOMU_PASSTHROUGH_PATHS[number]. This option is currently in experimental state
> +  as the corresponding lopper changes are still in an early support state.
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
> @@ -140,7 +154,7 @@ Where:
>  - DOMU_PASSTHROUGH_PATHS[number] specifies the passthrough devices (
>    separated by spaces). It adds "xen,passthrough" to the corresponding
>    dtb nodes in xen device tree blob.
> -  This option is valid in the following two cases:
> +  This option is valid in the following cases:
>  
>    1. When PASSTHROUGH_DTS_REPO is provided.
>    With this option, the partial device trees (corresponding to the
> @@ -149,7 +163,12 @@ Where:
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
> index ccad03d82b30..2dd98fb94d3e 100644
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
> +        partial_dts_dir="$tmp"
>      fi
>  
> -    partial_dts_dir="$repo"/"$dir"
>      i=0
>      while test $i -lt $NUM_DOMUS
>      do
> @@ -133,6 +146,34 @@ function compile_merge_partial_dts()
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
> +
> +                # Execute lopper with the following assists:
> +                # - extract: used to take the target node, extract it from the
> +                #   system device tree, chase the phandle references and place
> +                #   it in a new extracted tree structure,
> +                # - extract-xen: used to perform Xen specific modifications
> +                #   on the extracted tree structure e.g. adding "xen,path",
> +                #   "xen,reg", interrupt-parent properties.
> +                # For additional information, please see the lopper's README
> +                # file as well as usage of the mentioned assists.
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
> @@ -146,8 +187,8 @@ function compile_merge_partial_dts()
>  
>          for devpath in ${DOMU_PASSTHROUGH_PATHS[$i]}
>          do
> -            file=${devpath##*/}
> -            file="$partial_dts_dir"/"$file".dts
> +            node=${devpath##*/}
> +            file="$partial_dts_dir"/"$node".dts
>  
>              # All the subsequent dts files should not have dts version mentioned
>              if test $j -gt 1
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index 1f8ab5ffd193..b24dca2b7f7e 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -1138,10 +1138,28 @@ fi
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
> +            # Default for ZynqMP MPSoC.
> +            # The following command instructs lopper's extract assist to always
> +            # include zynqmp-firmware node (as it contains e.g. clock-controller
> +            # required by most of the devices) in the extracted tree structure
> +            # and to drop nodes/properties during the extraction process that
> +            # are not needed.
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

