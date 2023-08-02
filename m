Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBE876C1B0
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 02:55:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574643.900112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR08K-0002h8-Kc; Wed, 02 Aug 2023 00:54:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574643.900112; Wed, 02 Aug 2023 00:54:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR08K-0002fU-HV; Wed, 02 Aug 2023 00:54:36 +0000
Received: by outflank-mailman (input) for mailman id 574643;
 Wed, 02 Aug 2023 00:54:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pqe9=DT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qR08J-0002fO-8I
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 00:54:35 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 242ecbf4-30cf-11ee-b25d-6b7b168915f2;
 Wed, 02 Aug 2023 02:54:32 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 24A7D61781;
 Wed,  2 Aug 2023 00:54:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 297FEC433C8;
 Wed,  2 Aug 2023 00:54:29 +0000 (UTC)
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
X-Inumbo-ID: 242ecbf4-30cf-11ee-b25d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690937670;
	bh=kPIPs0tagdc7wz6cqm078wsT0VP4Nz7bEp25hTn+ynA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lngzkikAvDJmbubFKAzWHvjOPc6IjSc7iAoyxhdR7mMkwGaCFpw+aiH74wZlPxtk2
	 ekTUbGcQ+AF/y5Tm1cVAofeUOZvG1kKkroqMIgZzo75bL7orToucWfqvZrBWbFdfcW
	 3yQybtUYbBi0xQD94xF0woYiGbZl5gVyYO4vbR/iwOk6oJCNRCjITmWfPhC3oXeP8H
	 zW8oZ4fyTuTYSwDxSGnG4BuILRYPVkT+Dr8yuvyT9lxDMh4BTd3WBeFvOnJL9JnssK
	 oK4qybVevErV7TsIJpmsnYlyWZLNRwSKEN2rG6oJ1N9U44SDflKZodM09uHXT3PX8O
	 s6hjVxW/ffoJg==
Date: Tue, 1 Aug 2023 17:54:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>, 
    xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [RFC 2/6] roles: provide abstraction for the possible domain
 roles
In-Reply-To: <20230801202006.20322-3-dpsmith@apertussolutions.com>
Message-ID: <alpine.DEB.2.22.394.2308011726170.2127516@ubuntu-linux-20-04-desktop>
References: <20230801202006.20322-1-dpsmith@apertussolutions.com> <20230801202006.20322-3-dpsmith@apertussolutions.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 1 Aug 2023, Daniel P. Smith wrote:
> The existing concepts such as unbounded domain, ie. all powerful, control
> domain and hardware domain are, effectively, roles the domains provide for the
> system. Currently, these are represented with booleans within `struct domain`
> or global domid variables that are compared against. This patch begins to
> formalize these roles by replacing the `is_control` and `is_console`, along
> with expanding the check against the global `hardware_domain` with a single
> encapsulating role attribute in `struct domain`.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

This is definitely heading in the right direction


> ---
>  xen/arch/arm/domain_build.c |  2 ++
>  xen/arch/x86/setup.c        |  2 ++
>  xen/common/domain.c         | 14 +++++++++++++-
>  xen/include/xen/sched.h     | 16 +++++++++-------
>  xen/include/xsm/dummy.h     |  4 ++--
>  xen/xsm/flask/hooks.c       | 12 ++++++------
>  6 files changed, 34 insertions(+), 16 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 39b4ee03a5..51b4daefe1 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -4201,6 +4201,8 @@ void __init create_dom0(void)
>      if ( IS_ERR(dom0) )
>          panic("Error creating domain 0 (rc = %ld)\n", PTR_ERR(dom0));
>  
> +    dom0->role |= ROLE_UNBOUNDED_DOMAIN;

I am not a fan of "UNBOUNDED". Maybe "PRIMARY"? "PRIVILEGED"? "SUPER"?
"ROOT"?

I also recognize I am not good at naming things so I'll stop here and
let other provide better feedback :-)


Also, do we actually need unbounded given that it gets replaced with
control_domain pretty soon?

I am asking because I think that at least from a safety perspective it
would be a problem to run a domain as "unbounded". In a safety system,
we wouldn't want anything to be unbounded, not even temporarily at boot.
If "unbounded" is removed before running dom0, then of course it is no
problem because actually dom0 never gets to run with "unbounded" set.

(I am currently thinking of solving the privilege issue by using XSM and
removing most privileges from Dom0.) 


>      if ( alloc_dom0_vcpu0(dom0) == NULL )
>          panic("Error creating domain 0 vcpu0\n");
>  
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 2dbe9857aa..4e20edc3bf 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -905,6 +905,8 @@ static struct domain *__init create_dom0(const module_t *image,
>      if ( IS_ERR(d) )
>          panic("Error creating d%u: %ld\n", domid, PTR_ERR(d));
>  
> +    d->role |= ROLE_UNBOUNDED_DOMAIN;
> +
>      init_dom0_cpuid_policy(d);
>  
>      if ( alloc_dom0_vcpu0(d) == NULL )
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 8fb3c052f5..0ff1d52e3d 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -340,6 +340,14 @@ static int late_hwdom_init(struct domain *d)
>      setup_io_bitmap(dom0);
>  #endif
>  
> +    /*
> +     * "dom0" may have been created under the unbounded role, demote it from
> +     * that role, reducing it to the control domain role and any other roles it
> +     * may have been given.
> +     */
> +    dom0->role &= ~(ROLE_UNBOUNDED_DOMAIN & ROLE_HARDWARE_DOMAIN);
> +    dom0->role |= ROLE_CONTROL_DOMAIN;

I think we need a better definition of the three roles to understand
what this mean.


>      rcu_unlock_domain(dom0);
>  
>      iommu_hwdom_init(d);
> @@ -609,7 +617,10 @@ struct domain *domain_create(domid_t domid,
>      }
>  
>      /* Sort out our idea of is_control_domain(). */
> -    d->is_privileged = flags & CDF_privileged;
> +    if ( flags & CDF_privileged )
> +        d->role |= ROLE_CONTROL_DOMAIN;
> +    else
> +        d->role &= ~ROLE_CONTROL_DOMAIN; /*ensure not set */
>  
>      /* Sort out our idea of is_hardware_domain(). */
>      if ( is_initial_domain(d) || domid == hardware_domid )
> @@ -619,6 +630,7 @@ struct domain *domain_create(domid_t domid,
>  
>          old_hwdom = hardware_domain;
>          hardware_domain = d;
> +        d->role |= ROLE_HARDWARE_DOMAIN;
>      }
>  
>      TRACE_1D(TRC_DOM0_DOM_ADD, d->domain_id);
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index a9276a7bed..695f240326 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -467,8 +467,10 @@ struct domain
>  #endif
>      /* is node-affinity automatically computed? */
>      bool             auto_node_affinity;
> -    /* Is this guest fully privileged (aka dom0)? */
> -    bool             is_privileged;
> +#define ROLE_UNBOUNDED_DOMAIN  (1U<<0)
> +#define ROLE_CONTROL_DOMAIN    (1U<<1)
> +#define ROLE_HARDWARE_DOMAIN   (1U<<2)

This is a great step in the right direction but I think at least a short
in-code comment to explain the difference between the three


> +    uint8_t          role;
>      /* Can this guest access the Xen console? */
>      bool             is_console;
>      /* Is this guest being debugged by dom0? */
> @@ -1060,9 +1062,7 @@ void watchdog_domain_destroy(struct domain *d);
>  
>  static always_inline bool is_initial_domain(const struct domain *d)
>  {
> -    static int init_domain_id = 0;
> -
> -    return d->domain_id == init_domain_id;
> +    return d->role & ROLE_UNBOUNDED_DOMAIN;
>  }

As far as I can tell this is the only functional change in this patch:
given that dom0 loses unbounded soon after boot, the "is_initial_domain"
checks will start to fail?

We have a few of them in the code and I couldn't rule out that at least
these 3 could happen at runtime:

xen/common/sched/core.c:    else if ( is_initial_domain(d) && opt_dom0_vcpus_pin )
xen/common/sched/core.c:    else if ( is_initial_domain(d) )
xen/common/sched/arinc653.c:    if ( is_initial_domain(unit->domain) )

Maybe they need to be changed to control_domain checks?


>  /*
> @@ -1076,7 +1076,8 @@ static always_inline bool is_hardware_domain(const struct domain *d)
>      if ( IS_ENABLED(CONFIG_PV_SHIM_EXCLUSIVE) )
>          return false;
>  
> -    return evaluate_nospec(d == hardware_domain);
> +    return evaluate_nospec(((d->role & ROLE_HARDWARE_DOMAIN) ||
> +        is_initial_domain(d)) && (d == hardware_domain));
>  }
>  
>  /* This check is for functionality specific to a control domain */
> @@ -1085,7 +1086,8 @@ static always_inline bool is_control_domain(const struct domain *d)
>      if ( IS_ENABLED(CONFIG_PV_SHIM_EXCLUSIVE) )
>          return false;
>  
> -    return evaluate_nospec(d->is_privileged);
> +    return evaluate_nospec((d->role & ROLE_CONTROL_DOMAIN) ||
> +        is_initial_domain(d));
>  }
>  
>  #define VM_ASSIST(d, t) (test_bit(VMASST_TYPE_ ## t, &(d)->vm_assist))
> diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
> index 8671af1ba4..18f1ddd127 100644
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -108,7 +108,7 @@ static XSM_INLINE int cf_check xsm_set_system_active(void)
>  {
>      struct domain *d = current->domain;
>  
> -    ASSERT(d->is_privileged);
> +    ASSERT(d->role & ROLE_CONTROL_DOMAIN);
>  
>      if ( d->domain_id != DOMID_IDLE )
>      {
> @@ -116,7 +116,7 @@ static XSM_INLINE int cf_check xsm_set_system_active(void)
>          return -EPERM;
>      }
>  
> -    d->is_privileged = false;
> +    d->role &= ~ROLE_CONTROL_DOMAIN;
>  
>      return 0;
>  }
> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
> index 78225f68c1..0a31719f43 100644
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -193,7 +193,7 @@ static int cf_check flask_domain_alloc_security(struct domain *d)
>      default:
>          if ( domain_sid(current->domain) == SECINITSID_XENBOOT )
>          {
> -            if ( d->is_privileged )
> +            if ( d->role & ROLE_CONTROL_DOMAIN )
>                  dsec->sid = SECINITSID_DOM0;
>              else if ( pv_shim )
>                  dsec->sid = SECINITSID_DOMU;
> @@ -213,7 +213,7 @@ static int cf_check flask_set_system_active(void)
>  
>      dsec = d->ssid;
>  
> -    ASSERT(d->is_privileged);
> +    ASSERT(d->role & ROLE_CONTROL_DOMAIN);
>      ASSERT(dsec->sid == SECINITSID_XENBOOT);
>      ASSERT(dsec->self_sid == SECINITSID_XENBOOT);
>  
> @@ -224,11 +224,11 @@ static int cf_check flask_set_system_active(void)
>      }
>  
>      /*
> -     * While is_privileged has no significant meaning under flask, set to false
> -     * as is_privileged is not only used for a privilege check but also as a
> -     * type of domain check, specifically if the domain is the control domain.
> +     * While domain roles have no significant meaning under flask, mask out
> +     * control domain role as it is not only used for a privilege check but
> +     * also as a type of domain check.
>       */
> -    d->is_privileged = false;
> +    d->role &= ~ROLE_CONTROL_DOMAIN;
>  
>      dsec->self_sid = dsec->sid = SECINITSID_XEN;
>  
> -- 
> 2.20.1
> 

