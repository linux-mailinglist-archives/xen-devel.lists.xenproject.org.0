Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E755AF96F
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 03:45:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400706.642321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVk6S-0004p9-QN; Wed, 07 Sep 2022 01:43:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400706.642321; Wed, 07 Sep 2022 01:43:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVk6S-0004nP-Lg; Wed, 07 Sep 2022 01:43:44 +0000
Received: by outflank-mailman (input) for mailman id 400706;
 Wed, 07 Sep 2022 01:43:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b9Or=ZK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oVk6R-0004nJ-VD
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 01:43:44 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 803c38d4-2e4e-11ed-af93-0125da4c0113;
 Wed, 07 Sep 2022 03:43:42 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D17706168D;
 Wed,  7 Sep 2022 01:43:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD0E7C433D7;
 Wed,  7 Sep 2022 01:43:39 +0000 (UTC)
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
X-Inumbo-ID: 803c38d4-2e4e-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662515020;
	bh=pIQ7CzoQIWvBC9kI0XwUVB0Gk6PP72e9L19w0qI7g7w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qtUtHW2nAAzZxAeEZ6GLGeZ6u7fN+mCil43a3fW6myNduT8qpcRSKRkKDoAZiDty8
	 myiIqFSbVMp6AREvZ65ub+Lo3MH1FusnQFY6EdwF1xsF+kFh3QVG6VVpYiz6g7NDGw
	 hVdyevZwpo6qRulFIFnA8CC2nK1CMgLe69JpXigaNY0M44XyF6dVcTW/23Z/Upnv2Y
	 06glFz8ckcnYi2pZ71e7RUrV9m3dZescd1JAcL2kd4V4wvtfBYAY/xt8MiFHVgpTv8
	 3VDFxc28X5Ei+MD8PvciwuhlQ7t4WEXFv3XQ1OwszVxdib7fKg2R//oFOjJUTbIuaI
	 jJAEc7j32M7og==
Date: Tue, 6 Sep 2022 18:43:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org
Subject: Re: [ImageBuilder] Add support for Xen boot-time cpupools
In-Reply-To: <20220906111214.26912-1-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2209061819310.157835@ubuntu-linux-20-04-desktop>
References: <20220906111214.26912-1-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 6 Sep 2022, Michal Orzel wrote:
> Introduce support for creating boot-time cpupools in the device tree and
> assigning them to dom0less domUs. Add the following options:
>  - CPUPOOL[number]="cpu1_path,...,cpuN_path scheduler" to specify the
>    list of cpus and the scheduler to be used to create cpupool
>  - NUM_CPUPOOLS to specify the number of cpupools to create
>  - DOMU_CPUPOOL[number]="<id>" to specify the id of the cpupool to
>    assign to domU
> 
> Example usage:
> CPUPOOL[0]="/cpus/cpu@1,/cpus/cpu@2 null"
> DOMU_CPUPOOL[0]=0
> NUM_CPUPOOLS=1
> 
> The above example will create a boot-time cpupool (id=0) with 2 cpus:
> cpu@1, cpu@2 and the null scheduler. It will assign the cpupool with
> id=0 to domU0.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Great patch in record time, thanks Michal!


On the CPUPOOL string format: do you think we actually need the device
tree path or could we get away with something like:

CPUPOOL[0]="cpu@1,cpu@2 null"

All the cpus have to be under the top-level /cpus node per the device
tree spec, so maybe the node name should be enough?



> ---
>  README.md                | 10 +++++
>  scripts/uboot-script-gen | 80 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 90 insertions(+)
> 
> diff --git a/README.md b/README.md
> index bd9dac924b44..44abb2193142 100644
> --- a/README.md
> +++ b/README.md
> @@ -181,6 +181,9 @@ Where:
>    present. If set to 1, the VM can use PV drivers. Older Linux kernels
>    might break.
>  
> +- DOMU_CPUPOOL[number] specifies the id of the cpupool (created using
> +  CPUPOOL[number] option, where number == id) that will be assigned to domU.
> +
>  - LINUX is optional but specifies the Linux kernel for when Xen is NOT
>    used.  To enable this set any LINUX\_\* variables and do NOT set the
>    XEN variable.
> @@ -223,6 +226,13 @@ Where:
>    include the public key in.  This can only be used with
>    FIT_ENC_KEY_DIR.  See the -u option below for more information.
>  
> +- CPUPOOL[number]="cpu1_path,...,cpuN_path scheduler"
> +  specifies the list of cpus (separated by commas) and the scheduler to be
> +  used to create boot-time cpupool. If no scheduler is set, the Xen default
> +  one will be used.
> +
> +- NUM_CPUPOOLS specifies the number of boot-time cpupools to create.
> +
>  Then you can invoke uboot-script-gen as follows:
>  
>  ```
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index 18c0ce10afb4..2e1c80a92ce1 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -176,6 +176,81 @@ function add_device_tree_static_mem()
>      dt_set "$path" "xen,static-mem" "hex" "${cells[*]}"
>  }
>  
> +function add_device_tree_cpupools()
> +{
> +    local num=$1
> +    local phandle_next="0xfffffff"

I think phandle_next is a good idea, and I would make it a global
variable at the top of the uboot-script-gen file or at the top of
scripts/common.

The highest valid phandle is actually 0xfffffffe.



> +    local cpus
> +    local scheduler
> +    local cpu_list
> +    local phandle
> +    local cpu_phandles
> +    local i
> +    local j
> +
> +    i=0
> +    while test $i -lt $num

I don't think there is much value in passing NUM_CPUPOOLS as argument to
this function given that the function is also accessing CPUPOOL[]
directly. I would remove $num and just do:

    while test $i -lt $NUM_CPUPOOLS


> +    do
> +        cpus=$(echo ${CPUPOOL[$i]} | awk '{print $1}')
> +        scheduler=$(echo ${CPUPOOL[$i]} | awk '{print $NF}')
> +        cpu_phandles=
> +
> +        for cpu in ${cpus//,/ }
> +        do
> +            # check if cpu exists
> +            if ! fdtget "${DEVICE_TREE}" "$cpu" "reg" &> /dev/null
> +            then
> +                echo "$cpu does not exist"
> +                cleanup_and_return_err
> +            fi
> +
> +            # check if cpu is already assigned
> +            if [[ "$cpu_list" == *"$cpu"* ]]
> +            then
> +                echo "$cpu already assigned to another cpupool"
> +                cleanup_and_return_err
> +            fi
> +
> +            # set phandle for a cpu if there is none
> +            if ! phandle=$(fdtget -t x "${DEVICE_TREE}" "$cpu" "phandle" 2> /dev/null)
> +            then
> +                phandle=$(printf "0x%x" $phandle_next)
> +                phandle_next=$(( $phandle_next -1 ))
> +            fi
> +
> +            dt_set "$cpu" "phandle" "hex" "$phandle"
> +            cpu_phandles="$cpu_phandles $phandle"
> +            cpu_list="$cpu_list $cpu"
> +        done
> +
> +        # create cpupool node
> +        phandle="$(printf "0x%x" $phandle_next)"
> +        phandle_next=$(( $phandle_next -1 ))
> +        dt_mknode "/chosen" "cpupool_$i"
> +        dt_set "/chosen/cpupool_$i" "phandle" "hex" "$phandle"
> +        dt_set "/chosen/cpupool_$i" "compatible" "str" "xen,cpupool"
> +        dt_set "/chosen/cpupool_$i" "cpupool-cpus" "hex" "$cpu_phandles"
> +
> +        if test "$scheduler" != "$cpus"
> +        then
> +            dt_set "/chosen/cpupool_$i" "cpupool-sched" "str" "$scheduler"
> +        fi
> +
> +        j=0
> +        while test $j -lt $NUM_DOMUS
> +        do
> +            # assign cpupool to domU
> +            if test "${DOMU_CPUPOOL[$j]}" -eq "$i"
> +            then
> +                dt_set "/chosen/domU$j" "domain-cpupool" "hex" "$phandle"
> +            fi
> +            j=$(( $j + 1 ))
> +        done
> +
> +        i=$(( $i + 1 ))
> +    done
> +}
> +
>  function xen_device_tree_editing()
>  {
>      dt_set "/chosen" "#address-cells" "hex" "0x2"
> @@ -252,6 +327,11 @@ function xen_device_tree_editing()
>          fi
>          i=$(( $i + 1 ))
>      done
> +
> +    if test "$NUM_CPUPOOLS" && test "$NUM_CPUPOOLS" -gt 0
> +    then
> +        add_device_tree_cpupools "$NUM_CPUPOOLS"
> +    fi
>  }
>  
>  function linux_device_tree_editing()
> -- 
> 2.25.1
> 

