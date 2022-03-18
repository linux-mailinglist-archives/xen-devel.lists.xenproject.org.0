Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB6A4DD2B0
	for <lists+xen-devel@lfdr.de>; Fri, 18 Mar 2022 03:00:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291814.495573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nV1ts-0008VO-Me; Fri, 18 Mar 2022 01:59:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291814.495573; Fri, 18 Mar 2022 01:59:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nV1ts-0008S4-J8; Fri, 18 Mar 2022 01:59:32 +0000
Received: by outflank-mailman (input) for mailman id 291814;
 Fri, 18 Mar 2022 01:59:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3xU5=T5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nV1tq-0008RA-N8
 for xen-devel@lists.xenproject.org; Fri, 18 Mar 2022 01:59:30 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a6ba6d8-a65f-11ec-853c-5f4723681683;
 Fri, 18 Mar 2022 02:59:28 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 74B536165B;
 Fri, 18 Mar 2022 01:59:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CFDDC340E9;
 Fri, 18 Mar 2022 01:59:25 +0000 (UTC)
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
X-Inumbo-ID: 0a6ba6d8-a65f-11ec-853c-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647568765;
	bh=D870f2akXcYYehhYxVv5esgQBHZsiBNnMan/qZLhs0Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EQZmWlJepU5E+gndVRDr4LdmGLv0PeuFUHhSRaTssQKcDdrHHod40IaRq9Q4qqChh
	 2Wnn0GKNiKRQYZSNDRuDFQJXYcFUWONyXz9pBNAJfD/t8g9Ykl780FR+PPKjizxo2Y
	 ldgLl3htSlVyJ60qM5NzFDbxcXSixWG0CemNSNIYJQKWEHp+/0lO3MWKWDYRXiXkeX
	 kArFGLBsOlRjvnMhH1wMH4ZlZYr43keVjHaAIQP9BoLMkARo9XZJfCsOqctDyCVTcs
	 5FAnuZ9EXd2gyhWwFyzyEma3QPpsrI+/NT50yMFDz7el42SZqE7whN+ExQrBX0TiEK
	 vlzeacw1EjUPw==
Date: Thu, 17 Mar 2022 18:59:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@arm.com>
cc: xen-devel@lists.xenproject.org, nd@arm.com, 
    Penny Zheng <penzhe01@a011292.shanghai.arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v1 02/13] xen/arm: introduce a special domain
 DOMID_SHARED
In-Reply-To: <20220311061123.1883189-3-Penny.Zheng@arm.com>
Message-ID: <alpine.DEB.2.22.394.2203171645450.3497@ubuntu-linux-20-04-desktop>
References: <20220311061123.1883189-1-Penny.Zheng@arm.com> <20220311061123.1883189-3-Penny.Zheng@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 11 Mar 2022, Penny Zheng wrote:
> From: Penny Zheng <penzhe01@a011292.shanghai.arm.com>
> 
> In case to own statically shared pages when owner domain is not
> explicitly defined, this commits propose a special domain DOMID_SHARED,
> and we assign it 0x7FF5, as one of the system domains.
> 
> Statically shared memory reuses the same way of initialization with static
> memory, hence this commits proposes a new Kconfig CONFIG_STATIC_SHM to wrap
> related codes, and this option depends on static memory(CONFIG_STATIC_MEMORY).

Why does it depend on CONFIG_STATIC_MEMORY? This is a genuine question,
I am not trying to scope-creep the series. Is there an actual technical
dependency on CONFIG_STATIC_MEMORY? If not, it would be super useful to
be able to share memory statically even between normal dom0less guests
(of course it would be responsibility of the user to provide the right
addresses and avoid mapping clashes.) I know that some of our users have
requested this feature in the past.


> We intends to do shared domain creation after setup_virt_paging so shared
> domain could successfully do p2m initialization.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>  xen/arch/arm/Kconfig              |  7 +++++++
>  xen/arch/arm/domain.c             | 12 ++++++++++--
>  xen/arch/arm/include/asm/domain.h |  6 ++++++
>  xen/arch/arm/setup.c              | 22 ++++++++++++++++++++++
>  xen/common/domain.c               | 11 +++++++----
>  xen/common/page_alloc.c           |  5 +++++
>  xen/common/vsprintf.c             |  9 +++++----
>  xen/include/public/xen.h          |  6 ++++++
>  xen/include/xen/sched.h           |  2 ++
>  9 files changed, 70 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index ecfa6822e4..c54accefb1 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -106,6 +106,13 @@ config TEE
>  
>  source "arch/arm/tee/Kconfig"
>  
> +config STATIC_SHM
> +       bool "Statically shared memory on a dom0less system" if UNSUPPORTED
> +       depends on STATIC_MEMORY
> +       default n
> +       help
> +         This option enables statically shared memory on a dom0less system.
> +
>  endmenu
>  
>  menu "ARM errata workaround via the alternative framework"
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 8110c1df86..1ff1df5d3f 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -44,6 +44,10 @@
>  
>  DEFINE_PER_CPU(struct vcpu *, curr_vcpu);
>  
> +#ifdef CONFIG_STATIC_SHM
> +struct domain *__read_mostly dom_shared;
> +#endif

This one should probably go to xen/common/domain.c to stay close to the
other special domains.


>  static void do_idle(void)
>  {
>      unsigned int cpu = smp_processor_id();
> @@ -703,7 +707,7 @@ int arch_domain_create(struct domain *d,
>      if ( is_idle_domain(d) )
>          return 0;
>  
> -    ASSERT(config != NULL);
> +    ASSERT(is_shared_domain(d) ? config == NULL : config != NULL);
>  
>  #ifdef CONFIG_IOREQ_SERVER
>      ioreq_domain_init(d);
> @@ -712,12 +716,16 @@ int arch_domain_create(struct domain *d,
>      d->arch.directmap = flags & CDF_directmap;
>  
>      /* p2m_init relies on some value initialized by the IOMMU subsystem */
> -    if ( (rc = iommu_domain_init(d, config->iommu_opts)) != 0 )
> +    if ( (rc = iommu_domain_init(d, is_shared_domain(d) ? 0 : config->iommu_opts)) != 0 )
>          goto fail;
>  
>      if ( (rc = p2m_init(d)) != 0 )
>          goto fail;
>  
> +    /* DOMID_shared is sufficiently constructed after p2m initialization. */
> +    if ( is_shared_domain(d) )
> +        return 0;
> +
>      rc = -ENOMEM;
>      if ( (d->shared_info = alloc_xenheap_pages(0, 0)) == NULL )
>          goto fail;
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index c56f6e4398..ea7a7219a3 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -31,6 +31,12 @@ enum domain_type {
>  
>  #define is_domain_direct_mapped(d) (d)->arch.directmap
>  
> +#ifdef CONFIG_STATIC_SHM
> +extern struct domain *dom_shared;
> +#else
> +#define dom_shared NULL
> +#endif

I think this should probably go to xen/include/xen/mm.h to stay close to
the others (dom_xen, dom_io and dom_cow).


>  /*
>   * Is the domain using the host memory layout?
>   *
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index d5d0792ed4..f6a3b04958 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -855,6 +855,20 @@ static bool __init is_dom0less_mode(void)
>      return ( !dom0found && domUfound );
>  }
>  
> +#ifdef CONFIG_STATIC_SHM
> +static void __init setup_shared_domain(void)
> +{
> +    /*
> +     * Initialise our DOMID_SHARED domain.
> +     * This domain owns statically shared pages when owner domain is not
> +     * explicitly defined.
> +     */
> +    dom_shared = domain_create(DOMID_SHARED, NULL, CDF_directmap);
> +    if ( IS_ERR(dom_shared) )
> +        panic("Failed to create d[SHARED]: %ld\n", PTR_ERR(dom_shared));
> +}
> +#endif
> +
>  size_t __read_mostly dcache_line_bytes;
>  
>  /* C entry point for boot CPU */
> @@ -1022,6 +1036,14 @@ void __init start_xen(unsigned long boot_phys_offset,
>      apply_alternatives_all();
>      enable_errata_workarounds();
>  
> +#ifdef CONFIG_STATIC_SHM
> +    /*
> +     * This needs to be called **after** setup_virt_paging so shared
> +     * domains could successfully do p2m initialization.
          ^ domain

I take you are talking about DOMID_SHARED rather than any domain sharing
memory statically. Maybe it clearer if you say "so DOMID_SHARED could
successfully do p2m initialization".


> +     */
> +    setup_shared_domain();
> +#endif
> +
>      /* Create initial domain 0. */
>      if ( !is_dom0less_mode() )
>          create_dom0();
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 3742322d22..5cdd0b9f5b 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -643,11 +643,14 @@ struct domain *domain_create(domid_t domid,
>  
>      rangeset_domain_initialise(d);
>  
> -    /* DOMID_{XEN,IO,etc} (other than IDLE) are sufficiently constructed. */
> -    if ( is_system_domain(d) && !is_idle_domain(d) )
> +    /*
> +     * DOMID_{XEN,IO,etc} (other than IDLE and DOMID_shared) are
> +     * sufficiently constructed.
> +     */
> +    if ( is_system_domain(d) && !is_idle_domain(d) && !is_shared_domain(d) )
>          return d;
>  
> -    if ( !is_idle_domain(d) )
> +    if ( !is_idle_domain(d) && !is_shared_domain(d) )
>      {
>          if ( !is_hardware_domain(d) )
>              d->nr_pirqs = nr_static_irqs + extra_domU_irqs;
> @@ -663,7 +666,7 @@ struct domain *domain_create(domid_t domid,
>          goto fail;
>      init_status |= INIT_arch;
>  
> -    if ( !is_idle_domain(d) )
> +    if ( !is_idle_domain(d) && !is_shared_domain(d) )
>      {
>          watchdog_domain_init(d);
>          init_status |= INIT_watchdog;
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index f8749b0787..e5e357969d 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -2616,6 +2616,11 @@ struct domain *get_pg_owner(domid_t domid)
>  
>      switch ( domid )
>      {
> +#ifdef CONFIG_STATIC_SHM
> +    case DOMID_SHARED:
> +        pg_owner = rcu_lock_domain(dom_shared);
> +        break;
> +#endif
>      case DOMID_IO:
>          pg_owner = rcu_lock_domain(dom_io);
>          break;
> diff --git a/xen/common/vsprintf.c b/xen/common/vsprintf.c
> index b278961cc3..a22854001b 100644
> --- a/xen/common/vsprintf.c
> +++ b/xen/common/vsprintf.c
> @@ -359,10 +359,11 @@ static char *print_domain(char *str, const char *end, const struct domain *d)
>  
>      switch ( d->domain_id )
>      {
> -    case DOMID_IO:   name = "[IO]";   break;
> -    case DOMID_XEN:  name = "[XEN]";  break;
> -    case DOMID_COW:  name = "[COW]";  break;
> -    case DOMID_IDLE: name = "[IDLE]"; break;
> +    case DOMID_IO:     name = "[IO]";     break;
> +    case DOMID_XEN:    name = "[XEN]";    break;
> +    case DOMID_COW:    name = "[COW]";    break;
> +    case DOMID_IDLE:   name = "[IDLE]";   break;
> +    case DOMID_SHARED: name = "[SHARED]"; break;
>          /*
>           * In principle, we could ASSERT_UNREACHABLE() in the default case.
>           * However, this path is used to print out crash information, which
> diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
> index e373592c33..2e00741f09 100644
> --- a/xen/include/public/xen.h
> +++ b/xen/include/public/xen.h
> @@ -612,6 +612,12 @@ DEFINE_XEN_GUEST_HANDLE(mmuext_op_t);
>  /* DOMID_INVALID is used to identify pages with unknown owner. */
>  #define DOMID_INVALID        xen_mk_uint(0x7FF4)
>  
> +/*
> + * DOMID_SHARED is used as the owner of statically shared pages, when
> + * owner is not explicitly defined.
> + */
> +#define DOMID_SHARED         xen_mk_uint(0x7FF5)
> +
>  /* Idle domain. */
>  #define DOMID_IDLE           xen_mk_uint(0x7FFF)
>  
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 24a9a87f83..2fb236f4ea 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -618,6 +618,8 @@ static inline bool is_system_domain(const struct domain *d)
>      return d->domain_id >= DOMID_FIRST_RESERVED;
>  }
>  
> +#define is_shared_domain(d) ((d)->domain_id == DOMID_SHARED)
> +
>  #define DOMAIN_DESTROYED (1u << 31) /* assumes atomic_t is >= 32 bits */
>  #define put_domain(_d) \
>    if ( atomic_dec_and_test(&(_d)->refcnt) ) domain_destroy(_d)
> -- 
> 2.25.1
> 

