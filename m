Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17822607EAA
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 21:09:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427956.677613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olxNf-0008Us-2P; Fri, 21 Oct 2022 19:08:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427956.677613; Fri, 21 Oct 2022 19:08:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olxNe-0008Rv-VQ; Fri, 21 Oct 2022 19:08:30 +0000
Received: by outflank-mailman (input) for mailman id 427956;
 Fri, 21 Oct 2022 19:08:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QljK=2W=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1olxNc-0008Rp-Vg
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 19:08:29 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bcdfb8de-5173-11ed-8fd0-01056ac49cbb;
 Fri, 21 Oct 2022 21:08:26 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 51E9961F3C;
 Fri, 21 Oct 2022 19:08:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 102EAC433C1;
 Fri, 21 Oct 2022 19:08:22 +0000 (UTC)
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
X-Inumbo-ID: bcdfb8de-5173-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666379303;
	bh=vsquIKFbPGFjQLcdz5lPZnbWtZFyrvdvchLUS9v9ONM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XG8HqBZGj5MHALBw2RK03qvuK7kigga8Du+ZFAu2etdNpNMRqzD6fWgiaC2UfOZdn
	 YJrQFKQJhYj+1HXGDnNvX6lvjSq3BJVXsf0MiHOEwZcGRz2IPkT9YR3VnxrWNaPh+D
	 RS77+jwHJpRr1I9JOM9H2V84hWku/MzIqwpWCtLjsp2iQ0I9QEDX7BzvLHzVOEyC/2
	 YE2w896GnLEgXKAeOtqWpPY2jvLaQ30e1wDnAdPEiYZ46rEhpGOVeKXVjqLB+yUsWy
	 dJmaER8tEfroWVYbezXl/8ED0WDrCOiHFIoG/3xwS/MJtSfT/3LH5W5agPkFFY+tWX
	 wKq+Mhb8buwvg==
Date: Fri, 21 Oct 2022 12:08:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Henry Wang <Henry.Wang@arm.com>
Subject: Re: [for-4.17] automation: Build Xen according to the type of the
 job
In-Reply-To: <20221021132238.16056-1-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2210211208140.3873@ubuntu-linux-20-04-desktop>
References: <20221021132238.16056-1-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 21 Oct 2022, Michal Orzel wrote:
> All the build jobs exist in two flavors: debug and non-debug, where the
> former sets 'debug' variable to 'y' and the latter to 'n'. This variable
> is only being recognized by the toolstack, because Xen requires
> enabling/disabling debug build via e.g. menuconfig/config file.
> As a corollary, we end up building/testing Xen with CONFIG_DEBUG always
> set to a default value ('y' for unstable and 'n' for stable branches),
> regardless of the type of the build job.
> 
> Fix this behavior by setting CONFIG_DEBUG according to the 'debug' value.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Xen used debug variable to control the build type before switching to Kconfig.
> Support for GitLab CI was added later, which means that this issue was always
> present. This is a low risk for 4.17 with a benefit of being able to test Xen
> in both debug and non-debug versions.
> ---
>  automation/scripts/build | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/automation/scripts/build b/automation/scripts/build
> index 8c0882f3aa33..a5934190634b 100755
> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -21,12 +21,13 @@ if [[ "${RANDCONFIG}" == "y" ]]; then
>      make -j$(nproc) -C xen KCONFIG_ALLCONFIG=tools/kconfig/allrandom.config randconfig
>      hypervisor_only="y"
>  else
> +    echo "CONFIG_DEBUG=${debug}" > xen/.config
> +
>      if [[ -n "${EXTRA_XEN_CONFIG}" ]]; then
> -        echo "${EXTRA_XEN_CONFIG}" > xen/.config
> -        make -j$(nproc) -C xen olddefconfig
> -    else
> -        make -j$(nproc) -C xen defconfig
> +        echo "${EXTRA_XEN_CONFIG}" >> xen/.config
>      fi
> +
> +    make -j$(nproc) -C xen olddefconfig
>  fi
>  
>  # Save the config file before building because build failure causes the script
> -- 
> 2.25.1
> 

