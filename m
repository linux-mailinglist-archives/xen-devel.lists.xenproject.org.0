Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DA95B1096
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 01:39:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402357.644283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oW4dj-0000xA-Ia; Wed, 07 Sep 2022 23:39:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402357.644283; Wed, 07 Sep 2022 23:39:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oW4dj-0000uk-F0; Wed, 07 Sep 2022 23:39:27 +0000
Received: by outflank-mailman (input) for mailman id 402357;
 Wed, 07 Sep 2022 23:39:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b9Or=ZK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oW4di-0000Tm-CK
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 23:39:26 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4dfe98a9-2f06-11ed-af93-0125da4c0113;
 Thu, 08 Sep 2022 01:39:25 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D473961ACC;
 Wed,  7 Sep 2022 23:39:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAE24C433C1;
 Wed,  7 Sep 2022 23:39:22 +0000 (UTC)
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
X-Inumbo-ID: 4dfe98a9-2f06-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662593963;
	bh=aHcQig6B78HlsIc3k8URzCL5jbuYs/hzZzYbGc/m1qs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HhIZqeAoRhioa5y3V4xU+hkAMwDhAQemZahRE3t7HDALDUPiaQOMAdZhkuDSWL/e1
	 ZBpuKVZ9C8tdFkWCPFOioj9Yje9tYKVFhgSAMDt4jd2OU+MB5bS7i645IgrerlWMjC
	 wLoiqiL4HIRWNlrHbun1bKngiti+dLcg1mBG7ErNzJ1feh2fYtNgvAcJT6EomTp3nX
	 Fa0aZYBd1wzj5bogjlMHi/1ekHZJ8Y6okZq0lgO/JAtHlHx+koGL9GvbfvqS+366WB
	 VUCXzvgE84SZjyXhFgrxya0hovla7YMLKVpGkVPuWYzT73reUWc5IbvpLY7upkT3tX
	 KEj4MePatYrhg==
Date: Wed, 7 Sep 2022 16:39:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org
Subject: Re: [ImageBuilder v2 2/2] Add support for Xen boot-time cpupools
In-Reply-To: <20220907110852.5673-2-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2209071639140.157835@ubuntu-linux-20-04-desktop>
References: <20220907110852.5673-1-michal.orzel@amd.com> <20220907110852.5673-2-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 7 Sep 2022, Michal Orzel wrote:
> Introduce support for creating boot-time cpupools in the device tree and
> assigning them to dom0less domUs. Add the following options:
>  - CPUPOOL[number]="cpu@1,...,cpu@N scheduler" to specify the
>    list of cpus' node names and the scheduler to be used to create cpupool
>  - NUM_CPUPOOLS to specify the number of cpupools to create
>  - DOMU_CPUPOOL[number]="<id>" to specify the id of the cpupool to
>    assign to domU
> 
> Example usage:
> CPUPOOL[0]="cpu@1,cpu@2 null"
> DOMU_CPUPOOL[0]=0
> NUM_CPUPOOLS=1
> 
> The above example will create a boot-time cpupool (id=0) with 2 cpus:
> cpu@1, cpu@2 and the null scheduler. It will assign the cpupool with
> id=0 to domU0.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
> - make use of get_next_phandle
> - pass cpus' node names instead of paths to CPUPOOL
> - do not pass NUM_CPUPOOLS as an argument to add_device_tree_cpupools
> ---
>  README.md                | 10 +++++
>  scripts/uboot-script-gen | 79 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 89 insertions(+)
> 
> diff --git a/README.md b/README.md
> index bd9dac924b44..041818349954 100644
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
> +- CPUPOOL[number]="cpu@1,...,cpu@N scheduler"
> +  specifies the list of cpus' node names (separated by commas) and the scheduler
> +  to be used to create boot-time cpupool. If no scheduler is set, the Xen
> +  default one will be used.
> +
> +- NUM_CPUPOOLS specifies the number of boot-time cpupools to create.
> +
>  Then you can invoke uboot-script-gen as follows:
>  
>  ```
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index 18c0ce10afb4..1f8ab5ffd193 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -176,6 +176,80 @@ function add_device_tree_static_mem()
>      dt_set "$path" "xen,static-mem" "hex" "${cells[*]}"
>  }
>  
> +function add_device_tree_cpupools()
> +{
> +    local cpu
> +    local cpus
> +    local scheduler
> +    local cpu_list
> +    local phandle
> +    local cpu_phandles
> +    local i
> +    local j
> +
> +    i=0
> +    while test $i -lt $NUM_CPUPOOLS
> +    do
> +        cpus=$(echo ${CPUPOOL[$i]} | awk '{print $1}')
> +        scheduler=$(echo ${CPUPOOL[$i]} | awk '{print $NF}')
> +        cpu_phandles=
> +
> +        for cpu in ${cpus//,/ }
> +        do
> +            cpu="/cpus/$cpu"
> +
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
> +                get_next_phandle phandle
> +            fi
> +
> +            dt_set "$cpu" "phandle" "hex" "$phandle"
> +            cpu_phandles="$cpu_phandles $phandle"
> +            cpu_list="$cpu_list $cpu"
> +        done
> +
> +        # create cpupool node
> +        get_next_phandle phandle
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
> @@ -252,6 +326,11 @@ function xen_device_tree_editing()
>          fi
>          i=$(( $i + 1 ))
>      done
> +
> +    if test "$NUM_CPUPOOLS" && test "$NUM_CPUPOOLS" -gt 0
> +    then
> +        add_device_tree_cpupools
> +    fi
>  }
>  
>  function linux_device_tree_editing()
> -- 
> 2.25.1
> 

