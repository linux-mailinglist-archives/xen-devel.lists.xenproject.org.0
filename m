Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C77509432
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 02:38:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309719.526170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhKov-0002HO-Dj; Thu, 21 Apr 2022 00:37:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309719.526170; Thu, 21 Apr 2022 00:37:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhKov-0002F5-AP; Thu, 21 Apr 2022 00:37:17 +0000
Received: by outflank-mailman (input) for mailman id 309719;
 Thu, 21 Apr 2022 00:37:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=45zg=U7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nhKou-0002Ez-7E
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 00:37:16 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2fba6094-c10b-11ec-8fbf-03012f2f19d4;
 Thu, 21 Apr 2022 02:37:13 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7EE4361B94;
 Thu, 21 Apr 2022 00:37:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49D9EC385A0;
 Thu, 21 Apr 2022 00:37:11 +0000 (UTC)
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
X-Inumbo-ID: 2fba6094-c10b-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650501431;
	bh=CoWODmOl9M5wMVTRWAcJI6GU0GPuMAlTEzkQj6mW1NI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EVMN0c6LyZo1wyHTjN0XvZDBPYNKlG9UuFGRwmS2Xo0+5mYQmtS6C0iIqfjQbQOwm
	 fAPX/3CaK8jVjxBSSvlc5Mp81ksorPNB/iiWJOOiZWqCpTIHZ/ePB+Ui4R26vWFEwb
	 6I0vreTf3Ojwh9XPzrmKiQYqrjGDM9ZjfgYftG+tG5NwAyLHqUBF4XXtaVh2FyEhDZ
	 bNnuunrksbjX4s8kbbtgBcVzXBV9sVmBZS4p2ZYI01ywoc6WLrzK5uDmoqU1WY6Qk9
	 nFE0sgc4fXO6cf4lZCqVTic1C1OJzkshli3JJy6lMXwply8Yg3NZr10XYYP2phzMF/
	 A/sZmdEjuI8Ow==
Date: Wed, 20 Apr 2022 17:37:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Wei Chen <wei.chen@arm.com>
cc: xen-devel@lists.xenproject.org, nd@arm.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 05/10] xen/x86: Use ASSERT instead of VIRTUAL_BUG_ON
 for phys_to_nid
In-Reply-To: <20220418090735.3940393-6-wei.chen@arm.com>
Message-ID: <alpine.DEB.2.22.394.2204201736030.915916@ubuntu-linux-20-04-desktop>
References: <20220418090735.3940393-1-wei.chen@arm.com> <20220418090735.3940393-6-wei.chen@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 18 Apr 2022, Wei Chen wrote:
> VIRTUAL_BUG_ON is an empty macro used in phys_to_nid. This
> results in two lines of error-checking code in phys_to_nid
> that is not actually working and causing two compilation
> errors:
> 1. error: "MAX_NUMNODES" undeclared (first use in this function).
>    This is because in the common header file, "MAX_NUMNODES" is
>    defined after the common header file includes the ARCH header
>    file, where phys_to_nid has attempted to use "MAX_NUMNODES".
>    This error was resolved when we moved the definition of
>    "MAX_NUMNODES" to x86 ARCH header file. And we reserve the
>    "MAX_NUMNODES" definition in common header file through a
>    conditional compilation for some architectures that don't
>    need to define "MAX_NUMNODES" in their ARCH header files.
> 2. error: wrong type argument to unary exclamation mark.
>    This is because, the error-checking code contains !node_data[nid].
>    But node_data is a data structure variable, it's not a pointer.
> 
> So, in this patch, we use ASSERT instead of VIRTUAL_BUG_ON to
> enable the two lines of error-checking code. And fix the left
> compilation errors by replacing !node_data[nid] to
> !node_data[nid].node_spanned_pages.
> 
> Because when node_spanned_pages is 0, this node has no memory,
> numa_scan_node will print warning message for such kind of nodes:
> "Firmware Bug or mis-configured hardware?".
>
> Signed-off-by: Wei Chen <wei.chen@arm.com>

This patch looks OK to me but the x86 changes would benefit from a
review from one of the x86 maintainers


> ---
> v1 -> v2:
> 1. Use ASSERT to replace VIRTUAL_BUG_ON in phys_to_nid.
> 2. Adjust the conditional express for ASSERT.
> 3. Move MAX_NUMNODES from xen/numa.h to asm/numa.h for x86.
> 4. Use conditional macro to gate MAX_NUMNODES for other architectures.
> ---
>  xen/arch/x86/include/asm/numa.h | 6 +++---
>  xen/include/xen/numa.h          | 2 ++
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/numa.h b/xen/arch/x86/include/asm/numa.h
> index bada2c0bb9..1f268ce77d 100644
> --- a/xen/arch/x86/include/asm/numa.h
> +++ b/xen/arch/x86/include/asm/numa.h
> @@ -4,6 +4,7 @@
>  #include <xen/cpumask.h>
>  
>  #define NODES_SHIFT 6
> +#define MAX_NUMNODES    (1 << NODES_SHIFT)
>  
>  typedef u8 nodeid_t;
>  
> @@ -26,7 +27,6 @@ extern int compute_hash_shift(struct node *nodes, int numnodes,
>  extern nodeid_t pxm_to_node(unsigned int pxm);
>  
>  #define ZONE_ALIGN (1UL << (MAX_ORDER+PAGE_SHIFT))
> -#define VIRTUAL_BUG_ON(x) 
>  
>  extern void numa_add_cpu(int cpu);
>  extern void numa_init_array(void);
> @@ -62,9 +62,9 @@ extern struct node_data node_data[];
>  static inline __attribute__((pure)) nodeid_t phys_to_nid(paddr_t addr)
>  { 
>  	nodeid_t nid;
> -	VIRTUAL_BUG_ON((paddr_to_pdx(addr) >> memnode_shift) >= memnodemapsize);
> +	ASSERT((paddr_to_pdx(addr) >> memnode_shift) < memnodemapsize);
>  	nid = memnodemap[paddr_to_pdx(addr) >> memnode_shift]; 
> -	VIRTUAL_BUG_ON(nid >= MAX_NUMNODES || !node_data[nid]); 
> +	ASSERT(nid < MAX_NUMNODES && node_data[nid].node_spanned_pages);
>  	return nid; 
>  } 
>  
> diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
> index 7aef1a88dc..91b25c5617 100644
> --- a/xen/include/xen/numa.h
> +++ b/xen/include/xen/numa.h
> @@ -10,7 +10,9 @@
>  #define NUMA_NO_NODE     0xFF
>  #define NUMA_NO_DISTANCE 0xFF
>  
> +#ifndef MAX_NUMNODES
>  #define MAX_NUMNODES    (1 << NODES_SHIFT)
> +#endif
>  
>  #define vcpu_to_node(v) (cpu_to_node((v)->processor))
>  
> -- 
> 2.25.1
> 

