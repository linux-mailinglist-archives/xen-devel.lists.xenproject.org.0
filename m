Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6773FC094
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 03:53:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175424.319611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKsxn-00024T-65; Tue, 31 Aug 2021 01:53:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175424.319611; Tue, 31 Aug 2021 01:53:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKsxn-00022g-34; Tue, 31 Aug 2021 01:53:23 +0000
Received: by outflank-mailman (input) for mailman id 175424;
 Tue, 31 Aug 2021 01:53:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QH02=NW=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mKsxm-00022Y-5o
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 01:53:22 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3816d568-09fe-11ec-acb4-12813bfff9fa;
 Tue, 31 Aug 2021 01:53:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 58F2460724;
 Tue, 31 Aug 2021 01:53:20 +0000 (UTC)
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
X-Inumbo-ID: 3816d568-09fe-11ec-acb4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630374800;
	bh=m2Q/n6eTrNbY+hQWA8G97Hw942APQq9RCmw+JK0zAV4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=L4UJvU4bZA5BPfeSxPaUbgRkkFjiKONlPB1jg2656mPbBYOTOX0sVO74gemWVwuQz
	 Gmrt0aH/yrhP23e3Z8HVCwlDonbLnEDjagKUIztfHF3omQNC+m1Qrhxvrp5MoT3TNJ
	 qoK2zA8GoaBvyDzAZukEMR9fhyY0xcvMkQ8szP+8ba/pYugofkfMpR4tmgYNwHrrI8
	 7QB1UDLF1nTMhQUE/o93pdb/aDmfnxO0QJIQjrmaM+n5oi3NsIm1tAHjtB5/MxHIo0
	 4yX+2St4DkPsy9Ectuk1VrGdTdJyswc84UhZMpExNywjklFNUpe4fZeFdkvleG4KNe
	 1BWWkgDS4wQlA==
Date: Mon, 30 Aug 2021 18:53:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <wei.chen@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    jbeulich@suse.com, Bertrand.Marquis@arm.com
Subject: Re: [XEN RFC PATCH 39/40] xen/x86: move numa_setup to common to
 support NUMA switch in command line
In-Reply-To: <20210811102423.28908-40-wei.chen@arm.com>
Message-ID: <alpine.DEB.2.21.2108301852380.17851@sstabellini-ThinkPad-T480s>
References: <20210811102423.28908-1-wei.chen@arm.com> <20210811102423.28908-40-wei.chen@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 11 Aug 2021, Wei Chen wrote:
> Xen x86 has created a command line parameter "numa" as NUMA switch for
> user to turn on/off NUMA. As device tree based NUMA has been enabled
> for Arm, this parameter can be reused by Arm. So in this patch, we move
> this parameter to common.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>  xen/arch/x86/numa.c    | 34 ----------------------------------
>  xen/common/numa.c      | 35 ++++++++++++++++++++++++++++++++++-
>  xen/include/xen/numa.h |  1 -
>  3 files changed, 34 insertions(+), 36 deletions(-)
> 
> diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
> index 8b43be4aa7..380d8ed6fd 100644
> --- a/xen/arch/x86/numa.c
> +++ b/xen/arch/x86/numa.c
> @@ -11,7 +11,6 @@
>  #include <xen/nodemask.h>
>  #include <xen/numa.h>
>  #include <xen/keyhandler.h>
> -#include <xen/param.h>
>  #include <xen/time.h>
>  #include <xen/smp.h>
>  #include <xen/pfn.h>
> @@ -19,9 +18,6 @@
>  #include <xen/sched.h>
>  #include <xen/softirq.h>
>  
> -static int numa_setup(const char *s);
> -custom_param("numa", numa_setup);
> -
>  #ifndef Dprintk
>  #define Dprintk(x...)
>  #endif
> @@ -50,35 +46,6 @@ void numa_set_node(int cpu, nodeid_t node)
>      cpu_to_node[cpu] = node;
>  }
>  
> -/* [numa=off] */
> -static __init int numa_setup(const char *opt)
> -{
> -    if ( !strncmp(opt,"off",3) )
> -        numa_off = true;
> -    else if ( !strncmp(opt,"on",2) )
> -        numa_off = false;
> -#ifdef CONFIG_NUMA_EMU
> -    else if ( !strncmp(opt, "fake=", 5) )
> -    {
> -        numa_off = false;
> -        numa_fake = simple_strtoul(opt+5,NULL,0);
> -        if ( numa_fake >= MAX_NUMNODES )
> -            numa_fake = MAX_NUMNODES;
> -    }
> -#endif
> -#ifdef CONFIG_ACPI_NUMA
> -    else if ( !strncmp(opt,"noacpi",6) )
> -    {
> -        numa_off = false;
> -        acpi_numa = -1;
> -    }
> -#endif
> -    else
> -        return -EINVAL;
> -
> -    return 0;
> -} 
> -
>  /*
>   * Setup early cpu_to_node.
>   *
> @@ -287,4 +254,3 @@ static __init int register_numa_trigger(void)
>      return 0;
>  }
>  __initcall(register_numa_trigger);
> -

spurious change

