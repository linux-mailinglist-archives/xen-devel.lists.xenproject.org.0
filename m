Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BF2AC85D0
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 02:58:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000334.1380649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKo4X-00057S-6R; Fri, 30 May 2025 00:58:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000334.1380649; Fri, 30 May 2025 00:58:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKo4X-00054N-3O; Fri, 30 May 2025 00:58:09 +0000
Received: by outflank-mailman (input) for mailman id 1000334;
 Fri, 30 May 2025 00:58:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z72a=YO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uKo4V-00054H-MG
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 00:58:07 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24a8c7ac-3cf1-11f0-a2ff-13f23c93f187;
 Fri, 30 May 2025 02:58:05 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3713560010;
 Fri, 30 May 2025 00:58:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5651C4CEE7;
 Fri, 30 May 2025 00:58:02 +0000 (UTC)
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
X-Inumbo-ID: 24a8c7ac-3cf1-11f0-a2ff-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748566683;
	bh=sjXzh/yTT6qQS9h48xgcDoW1vrlKnZoqiUhBQkmDgWQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PFTPYANfcAGwDC8jg5EeSQNPSpPW1jLSJnc63g4Yfmo83pt9vQ4zVjiAet3je+Ucx
	 9vKfFap4ldxZ2du/JnEwj/5zEBdrEj3IsT7yJ59pOpahG7IeBwWcYJLxmuz4/ZwVIs
	 S+VpTfDp4pdkV/znEKTkMJclQpWPRTKT7k1Aqw6Jpl/Q6CMo7EyOHMOBUmNkBc6W89
	 zXAQ7B0/4ho7goT8KQkUWldaq13HoaEhatuW+OXD2ZJ4IQXrOVQopXZmyD68++bqO5
	 7g4sbYy3hfOeIsYi6mcpoCNJrEameAItwIQhefMUCh5xfJLYS5tOuFd5FsaWRWL0lq
	 nnQq76wu4RWcQ==
Date: Thu, 29 May 2025 17:58:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Denis Mukhin <dmkhn@proton.me>
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v4 2/4] xen/console: introduce console input permission
In-Reply-To: <20250529000848.2675903-3-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2505291736530.135336@ubuntu-linux-20-04-desktop>
References: <20250529000848.2675903-1-dmukhin@ford.com> <20250529000848.2675903-3-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 29 May 2025, dmkhn@proton.me wrote:
> Add new flag to domain structure for marking permission to intercept
> the physical console input by the domain.
> 
> Update console input switch logic accordingly.
> 
> No functional change intended.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v3:
> - rebased
> ---
>  xen/arch/arm/vpl011.c      |  2 ++
>  xen/arch/x86/pv/shim.c     |  2 ++
>  xen/common/domain.c        |  2 ++
>  xen/drivers/char/console.c | 18 +++++++++++++++++-
>  xen/include/xen/sched.h    |  8 +++++++-
>  5 files changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
> index 66047bf33c..147958eee8 100644
> --- a/xen/arch/arm/vpl011.c
> +++ b/xen/arch/arm/vpl011.c
> @@ -737,6 +737,8 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
>      register_mmio_handler(d, &vpl011_mmio_handler,
>                            vpl011->base_addr, GUEST_PL011_SIZE, NULL);
>  
> +    d->console.input_allowed = true;

This should be set only when backend_in_domain = false.


>      return 0;
>  
>  out1:
> diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
> index c506cc0bec..bc2a7dd5fa 100644
> --- a/xen/arch/x86/pv/shim.c
> +++ b/xen/arch/x86/pv/shim.c
> @@ -238,6 +238,8 @@ void __init pv_shim_setup_dom(struct domain *d, l4_pgentry_t *l4start,
>       * guest from depleting the shim memory pool.
>       */
>      d->max_pages = domain_tot_pages(d);
> +
> +    d->console.input_allowed = true;
>  }
>  
>  static void write_start_info(struct domain *d)
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 87e5be35e5..9bc66d80c4 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -835,6 +835,8 @@ struct domain *domain_create(domid_t domid,
>          flags |= CDF_hardware;
>          if ( old_hwdom )
>              old_hwdom->cdf &= ~CDF_hardware;
> +
> +        d->console.input_allowed = true;
>      }
>  
>      /* Holding CDF_* internal flags. */
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index 30701ae0b0..8a0bcff78f 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -512,9 +512,21 @@ static unsigned int __read_mostly console_rx = 0;
>  
>  struct domain *console_get_domain(void)
>  {
> +    struct domain *d;
> +
>      if ( console_rx == 0 )
>              return NULL;
> -    return rcu_lock_domain_by_id(console_rx - 1);
> +
> +    d = rcu_lock_domain_by_id(console_rx - 1);
> +    if ( !d )
> +        return NULL;
> +
> +    if ( d->console.input_allowed )
> +        return d;
> +
> +    rcu_unlock_domain(d);
> +
> +    return NULL;

The original idea was to skip over domains that cannot have any input so
I don't think we should get in this situation. We could even have an
assert.


>  }
>  
>  void console_put_domain(struct domain *d)
> @@ -551,6 +563,10 @@ static void console_switch_input(void)
>          if ( d )
>          {
>              rcu_unlock_domain(d);
> +
> +            if ( !d->console.input_allowed )
> +                break;

shouldn't this be continue instead of break?


>              console_rx = next_rx;
>              printk("*** Serial input to DOM%u", domid);
>              break;
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 559d201e0c..e91c99a8f3 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -512,7 +512,7 @@ struct domain
>      bool             auto_node_affinity;
>      /* Is this guest fully privileged (aka dom0)? */
>      bool             is_privileged;
> -    /* Can this guest access the Xen console? */
> +    /* XSM: permission to use HYPERCALL_console_io hypercall */
>      bool             is_console;

While I am in favor of this direction and we certainly need a better way
to distinguish domains that can use HYPERCALL_console_io hypercall from
others, could we simplify this and just assume that "is_console" implies
input_allowed and also set is_console = true in all the same places you
are setting input_allowed = true in this patch?

For clarity, I am suggesting:
- do not add input_allowed
- set is_console = true in domain_vpl011_init, pv_shim_setup_dom, etc.

The only side effect is that we would allow domains with vpl011 to also
use console hypercalls but I don't think there is any harm in that?

I don't feel strongly about this, I am just trying to find ways to make
things simple. I apologize if it was already discussed during review of
one of the previous versions.

I am also OK with this approach.


>      /* Is this guest being debugged by dom0? */
>      bool             debugger_attached;
> @@ -651,6 +651,12 @@ struct domain
>      unsigned int num_llc_colors;
>      const unsigned int *llc_colors;
>  #endif
> +
> +    /* Console settings. */
> +    struct {
> +        /* Permission to take ownership of the physical console input. */
> +        bool input_allowed;
> +    } console;
>  } __aligned(PAGE_SIZE);
>  
>  static inline struct page_list_head *page_to_list(
> -- 
> 2.34.1
> 
> 

