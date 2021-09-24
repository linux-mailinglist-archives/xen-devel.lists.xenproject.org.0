Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA46441697C
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 03:35:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194724.346964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTa6k-0002qX-Rr; Fri, 24 Sep 2021 01:34:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194724.346964; Fri, 24 Sep 2021 01:34:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTa6k-0002o5-O4; Fri, 24 Sep 2021 01:34:34 +0000
Received: by outflank-mailman (input) for mailman id 194724;
 Fri, 24 Sep 2021 01:34:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UhVx=OO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTa6j-0002nz-Lp
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 01:34:33 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ba2ad18-6209-4b54-b2ca-c184f914a455;
 Fri, 24 Sep 2021 01:34:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E0CB561211;
 Fri, 24 Sep 2021 01:34:31 +0000 (UTC)
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
X-Inumbo-ID: 7ba2ad18-6209-4b54-b2ca-c184f914a455
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632447272;
	bh=FQN+nMr8/U87vCJiePijUNnGt4KoccfGqtNT+UZamTU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XX6zcmJ1vetRjtZFkj2n/AQNIgB8cvQ7zPougum05LvEvKuZ9vXAo+yy0IDenFUrH
	 BxJzxAq0o2MyxSZnWSQUqOItdDzRvCLFGdG3+6i892+/O2l9ltA8ySGf208Z6ESBNx
	 WmLfGq4qxwDhGUgGQeQMgLVi9hJIKA4fmDSTBQjWRhQhYY6D+IpLBwHrQq5g8v/MvT
	 xzSw6QNJEQ3pXFnkh6OyQ+RUUGp1jn2tiva37bSjZ0Xw2ivGr68ue/4cDTcM/BySLz
	 dPkVTexNoceZI5dbYmNzIHbA8rGRkeZdzcyzNTLaDueMzYxLUaF0v/hz4thg8rH5bw
	 ly/wRmvN+kA4A==
Date: Thu, 23 Sep 2021 18:34:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <wei.chen@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    Bertrand.Marquis@arm.com
Subject: Re: [PATCH 22/37] xen/arm: use NR_MEM_BANKS to override default
 NR_NODE_MEMBLKS
In-Reply-To: <20210923120236.3692135-23-wei.chen@arm.com>
Message-ID: <alpine.DEB.2.21.2109231828310.17979@sstabellini-ThinkPad-T480s>
References: <20210923120236.3692135-1-wei.chen@arm.com> <20210923120236.3692135-23-wei.chen@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Sep 2021, Wei Chen wrote:
> As a memory range described in device tree cannot be split across
> multiple nodes. So we define NR_NODE_MEMBLKS as NR_MEM_BANKS in
> arch header.

This statement is true but what is the goal of this patch? Is it to
reduce code size and memory consumption?

I am asking because NR_MEM_BANKS is 128 and
NR_NODE_MEMBLKS=2*MAX_NUMNODES which is 64 by default so again
NR_NODE_MEMBLKS is 128 before this patch.

In other words, this patch alone doesn't make any difference; at least
doesn't make any difference unless CONFIG_NR_NUMA_NODES is increased.

So, is the goal to reduce memory usage when CONFIG_NR_NUMA_NODES is
higher than 64?


> And keep default NR_NODE_MEMBLKS in common header
> for those architectures NUMA is disabled.

This last sentence is not accurate: on x86 NUMA is enabled and
NR_NODE_MEMBLKS is still defined in xen/include/xen/numa.h (there is no
x86 definition of it)


> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>  xen/include/asm-arm/numa.h | 8 +++++++-
>  xen/include/xen/numa.h     | 2 ++
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/include/asm-arm/numa.h b/xen/include/asm-arm/numa.h
> index 8f1c67e3eb..21569e634b 100644
> --- a/xen/include/asm-arm/numa.h
> +++ b/xen/include/asm-arm/numa.h
> @@ -3,9 +3,15 @@
>  
>  #include <xen/mm.h>
>  
> +#include <asm/setup.h>
> +
>  typedef u8 nodeid_t;
>  
> -#ifndef CONFIG_NUMA
> +#ifdef CONFIG_NUMA
> +
> +#define NR_NODE_MEMBLKS NR_MEM_BANKS
> +
> +#else
>  
>  /* Fake one node for now. See also node_online_map. */
>  #define cpu_to_node(cpu) 0
> diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
> index 1978e2be1b..1731e1cc6b 100644
> --- a/xen/include/xen/numa.h
> +++ b/xen/include/xen/numa.h
> @@ -12,7 +12,9 @@
>  #define MAX_NUMNODES    1
>  #endif
>  
> +#ifndef NR_NODE_MEMBLKS
>  #define NR_NODE_MEMBLKS (MAX_NUMNODES*2)
> +#endif
>  
>  #define vcpu_to_node(v) (cpu_to_node((v)->processor))
>  
> -- 
> 2.25.1
> 

