Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02667A5E87C
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 00:36:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911033.1317596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsVc4-0001pt-VN; Wed, 12 Mar 2025 23:35:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911033.1317596; Wed, 12 Mar 2025 23:35:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsVc4-0001nx-Ru; Wed, 12 Mar 2025 23:35:48 +0000
Received: by outflank-mailman (input) for mailman id 911033;
 Wed, 12 Mar 2025 23:35:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K94u=V7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tsVc4-0001bl-2s
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 23:35:48 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6a10ff8-ff9a-11ef-9898-31a8f345e629;
 Thu, 13 Mar 2025 00:35:43 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4B090A44E25;
 Wed, 12 Mar 2025 23:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D038FC4CEDD;
 Wed, 12 Mar 2025 23:35:39 +0000 (UTC)
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
X-Inumbo-ID: b6a10ff8-ff9a-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741822541;
	bh=sMsVV3EOdF1ZV5JdnLlnHRCKVt4P7SqAgXeaUQ59QpY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pEE2kJnBuN3fWxlJHXLirSfb7L9JuM9/FArWbJ/h2dBLGqDm5GZF7X3sjrfPNHfPc
	 4pG8FqkotVrzlQ4POXODX5NjuLUTXHqA3AofrnyZ5leUbhttuGFu2H3debHqcLAKWM
	 IEdiVpGRbtrZdEA9fQ3uvPnGOV/vIXQOt16AfDQBEfuU+AdVoqjvIWfChW0mcUW++I
	 1P9ydWrUvSISYa7KiAkBrIxoBdIQZH/alrvyQoakIPrgecfGGU0X+OBYXWQiHWOwod
	 5u//PUi1RdwxCgamETgoY6F7NtG8Y30omMe0IthZHpSTh2r7+7dq4gehAMH5LwzPYe
	 6EURrOUN90IZw==
Date: Wed, 12 Mar 2025 16:35:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@amd.com>
cc: xen-devel@lists.xenproject.org, ray.huang@amd.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Alistair Francis <alistair.francis@wdc.com>, 
    Bob Eshleman <bobbyeshleman@gmail.com>, 
    Connor Davis <connojdavis@gmail.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v1 15/19] xen/sysctl: wrap around XEN_SYSCTL_physinfo
In-Reply-To: <20250312040632.2853485-16-Penny.Zheng@amd.com>
Message-ID: <alpine.DEB.2.22.394.2503121634530.3477110@ubuntu-linux-20-04-desktop>
References: <20250312040632.2853485-1-Penny.Zheng@amd.com> <20250312040632.2853485-16-Penny.Zheng@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 12 Mar 2025, Penny Zheng wrote:
> The following functions are only used to deal with XEN_SYSCTL_physinfo,
> then they shall be wrapped:
> - arch_do_physinfo
> - get_outstanding_claims
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
>  xen/arch/arm/sysctl.c   | 2 ++
>  xen/arch/riscv/stubs.c  | 2 ++
>  xen/arch/x86/sysctl.c   | 2 ++
>  xen/common/page_alloc.c | 5 +++++
>  xen/include/xen/mm.h    | 5 +++++
>  xen/include/xen/sched.h | 4 ++++
>  6 files changed, 20 insertions(+)
> 
> diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
> index 32cab4feff..2d350b700a 100644
> --- a/xen/arch/arm/sysctl.c
> +++ b/xen/arch/arm/sysctl.c
> @@ -15,6 +15,7 @@
>  #include <asm/arm64/sve.h>
>  #include <public/sysctl.h>
>  
> +#ifdef CONFIG_SYSCTL
>  void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>  {
>      pi->capabilities |= XEN_SYSCTL_PHYSCAP_hvm | XEN_SYSCTL_PHYSCAP_hap;
> @@ -22,6 +23,7 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>      pi->arch_capabilities |= MASK_INSR(sve_encode_vl(get_sys_vl_len()),
>                                         XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
>  }
> +#endif
>  
>  long arch_do_sysctl(struct xen_sysctl *sysctl,
>                      XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
> diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
> index 5951b0ce91..0321ad57f0 100644
> --- a/xen/arch/riscv/stubs.c
> +++ b/xen/arch/riscv/stubs.c
> @@ -328,10 +328,12 @@ long arch_do_sysctl(struct xen_sysctl *sysctl,
>      BUG_ON("unimplemented");
>  }
>  
> +#ifdef CONFIG_SYSCTL
>  void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>  {
>      BUG_ON("unimplemented");
>  }
> +#endif
>  
>  /* p2m.c */
>  
> diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
> index 1b04947516..d7da476379 100644
> --- a/xen/arch/x86/sysctl.c
> +++ b/xen/arch/x86/sysctl.c
> @@ -91,6 +91,7 @@ static long cf_check smt_up_down_helper(void *data)
>      return ret;
>  }
>  
> +#ifdef CONFIG_SYSCTL
>  void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>  {
>      memcpy(pi->hw_cap, boot_cpu_data.x86_capability,
> @@ -104,6 +105,7 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>      if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
>          pi->capabilities |= XEN_SYSCTL_PHYSCAP_shadow;
>  }
> +#endif
>  
>  long arch_do_sysctl(
>      struct xen_sysctl *sysctl, XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 5e710cc9a1..d1c4db57a5 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -581,6 +581,8 @@ out:
>      return ret;
>  }
>  
> +#ifdef CONFIG_SYSCTL
> +static unsigned long avail_domheap_pages(void);

This part here should be in the previous patch. I would add it at the
top of the page_alloc.c file, ideally without the #ifdef, I am guessing
it is not required for a forward declaration.


>  void get_outstanding_claims(uint64_t *free_pages, uint64_t *outstanding_pages)
>  {
>      spin_lock(&heap_lock);
> @@ -588,6 +590,7 @@ void get_outstanding_claims(uint64_t *free_pages, uint64_t *outstanding_pages)
>      *free_pages =  avail_domheap_pages();
>      spin_unlock(&heap_lock);
>  }
> +#endif
>  
>  static bool __read_mostly first_node_initialised;
>  #ifndef CONFIG_SEPARATE_XENHEAP
> @@ -2796,12 +2799,14 @@ unsigned long avail_domheap_pages_region(
>      return avail_heap_pages(zone_lo, zone_hi, node);
>  }
>  
> +#ifdef CONFIG_SYSCTL
>  static unsigned long avail_domheap_pages(void)
>  {
>      return avail_heap_pages(MEMZONE_XEN + 1,
>                              NR_ZONES - 1,
>                              -1);
>  }
> +#endif
>  
>  unsigned long avail_node_heap_pages(unsigned int nodeid)
>  {
> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> index cbb9f2dfdb..a63e063a46 100644
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -131,7 +131,12 @@ int populate_pt_range(unsigned long virt, unsigned long nr_mfns);
>  unsigned long __must_check domain_adjust_tot_pages(struct domain *d,
>      long pages);
>  int domain_set_outstanding_pages(struct domain *d, unsigned long pages);
> +#ifdef CONFIG_SYSCTL
>  void get_outstanding_claims(uint64_t *free_pages, uint64_t *outstanding_pages);
> +#else
> +static inline void get_outstanding_claims(uint64_t *free_pages,
> +                                          uint64_t *outstanding_pages) {}
> +#endif /* CONFIG_SYSCTL */
>  
>  /* Domain suballocator. These functions are *not* interrupt-safe.*/
>  void init_domheap_pages(paddr_t ps, paddr_t pe);
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 5a065b3624..df39c0465a 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -1291,7 +1291,11 @@ struct cpupool *cpupool_create_pool(unsigned int pool_id, int sched_id);
>  
>  extern void cf_check dump_runq(unsigned char key);
>  
> +#ifdef CONFIG_SYSCTL
>  void arch_do_physinfo(struct xen_sysctl_physinfo *pi);
> +#else
> +static inline void arch_do_physinfo(struct xen_sysctl_physinfo *pi) {};
> +#endif /* CONFIG_SYSCTL */
>  
>  #ifdef CONFIG_BOOT_TIME_CPUPOOLS
>  void btcpupools_allocate_pools(void);
> -- 
> 2.34.1
> 

