Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EA0416896
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 01:46:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194637.346756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTYPE-00054s-LQ; Thu, 23 Sep 2021 23:45:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194637.346756; Thu, 23 Sep 2021 23:45:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTYPE-000535-IR; Thu, 23 Sep 2021 23:45:32 +0000
Received: by outflank-mailman (input) for mailman id 194637;
 Thu, 23 Sep 2021 23:45:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/SRu=ON=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTYPD-00052z-3X
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 23:45:31 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0b3f7f2f-4c46-4171-87e7-ecaf100f97e0;
 Thu, 23 Sep 2021 23:45:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0A1DE610FD;
 Thu, 23 Sep 2021 23:45:28 +0000 (UTC)
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
X-Inumbo-ID: 0b3f7f2f-4c46-4171-87e7-ecaf100f97e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632440729;
	bh=jOSq/3ovecOYuSTTpHKQ/vVhAqVUUrdiwVGeYsonii4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RuoA0uDz67utqpVotYZPg6ZDNuYqNc7MFWYPI8b4Ne/y5mrn60usoNUcSu8UEHOl0
	 Y+O28pMUOTDyUCSaGj2B728Ubm77i1coPGBDjRbTqRXDmGQ1TMakXFD8+ivtWAriXm
	 GfN1JwjLFd/nvi/JJarCAQ5Cggn9Im5mozKNVGHCU+GF13KQcSkJaxvSBrVY9VRPKD
	 ccMc/GuVUIsScAnjDt/QHxZqg6QBhIY9LCq0DOeBAOeL2nn3GIKbCJHno4Ezwp/spB
	 yhPqvXI/t3FpPE8N6UiB8m3aqoxhb51laVwMyvhd+xhAL6rdG2vYbJDEG2mptQrgyG
	 wiCQZuR+P3+gA==
Date: Thu, 23 Sep 2021 16:45:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <wei.chen@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    Bertrand.Marquis@arm.com
Subject: Re: [PATCH 02/37] xen: introduce a Kconfig option to configure NUMA
 nodes number
In-Reply-To: <20210923120236.3692135-3-wei.chen@arm.com>
Message-ID: <alpine.DEB.2.21.2109231639110.17979@sstabellini-ThinkPad-T480s>
References: <20210923120236.3692135-1-wei.chen@arm.com> <20210923120236.3692135-3-wei.chen@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Sep 2021, Wei Chen wrote:
> Current NUMA nodes number is a hardcode configuration. This
> configuration is difficult for an administrator to change
> unless changing the code.
> 
> So in this patch, we introduce this new Kconfig option for
> administrators to change NUMA nodes number conveniently.
> Also considering that not all architectures support NUMA,
> this Kconfig option only can be visible on NUMA enabled
> architectures. Non-NUMA supported architectures can still
> use 1 as MAX_NUMNODES.

This is OK but I think you should also mention in the commit message
that you are taking the opportunity to remove NODES_SHIFT because it is
currently unused.

With that:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>  xen/arch/Kconfig           | 11 +++++++++++
>  xen/include/asm-x86/numa.h |  2 --
>  xen/include/xen/numa.h     | 10 +++++-----
>  3 files changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
> index f16eb0df43..8a20da67ed 100644
> --- a/xen/arch/Kconfig
> +++ b/xen/arch/Kconfig
> @@ -17,3 +17,14 @@ config NR_CPUS
>  	  For CPU cores which support Simultaneous Multi-Threading or similar
>  	  technologies, this the number of logical threads which Xen will
>  	  support.
> +
> +config NR_NUMA_NODES
> +	int "Maximum number of NUMA nodes supported"
> +	range 1 4095
> +	default "64"
> +	depends on NUMA
> +	help
> +	  Controls the build-time size of various arrays and bitmaps
> +	  associated with multiple-nodes management. It is the upper bound of
> +	  the number of NUMA nodes the scheduler, memory allocation and other
> +	  NUMA-aware components can handle.
> diff --git a/xen/include/asm-x86/numa.h b/xen/include/asm-x86/numa.h
> index bada2c0bb9..3cf26c2def 100644
> --- a/xen/include/asm-x86/numa.h
> +++ b/xen/include/asm-x86/numa.h
> @@ -3,8 +3,6 @@
>  
>  #include <xen/cpumask.h>
>  
> -#define NODES_SHIFT 6
> -
>  typedef u8 nodeid_t;
>  
>  extern int srat_rev;
> diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
> index 7aef1a88dc..52950a3150 100644
> --- a/xen/include/xen/numa.h
> +++ b/xen/include/xen/numa.h
> @@ -3,14 +3,14 @@
>  
>  #include <asm/numa.h>
>  
> -#ifndef NODES_SHIFT
> -#define NODES_SHIFT     0
> -#endif
> -
>  #define NUMA_NO_NODE     0xFF
>  #define NUMA_NO_DISTANCE 0xFF
>  
> -#define MAX_NUMNODES    (1 << NODES_SHIFT)
> +#ifdef CONFIG_NR_NUMA_NODES
> +#define MAX_NUMNODES CONFIG_NR_NUMA_NODES
> +#else
> +#define MAX_NUMNODES    1
> +#endif
>  
>  #define vcpu_to_node(v) (cpu_to_node((v)->processor))
>  
> -- 
> 2.25.1
> 

