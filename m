Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7FC76C177
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 02:24:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574637.900103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQzf9-0007fh-BW; Wed, 02 Aug 2023 00:24:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574637.900103; Wed, 02 Aug 2023 00:24:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQzf9-0007e3-7Q; Wed, 02 Aug 2023 00:24:27 +0000
Received: by outflank-mailman (input) for mailman id 574637;
 Wed, 02 Aug 2023 00:24:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pqe9=DT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qQzf7-0007dx-JB
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 00:24:25 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed4fd8ac-30ca-11ee-8613-37d641c3527e;
 Wed, 02 Aug 2023 02:24:22 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0CC726177B;
 Wed,  2 Aug 2023 00:24:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF1A3C433C7;
 Wed,  2 Aug 2023 00:24:18 +0000 (UTC)
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
X-Inumbo-ID: ed4fd8ac-30ca-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690935860;
	bh=IU56Re5B1oCRydK/QbSInlmtW9Qv3T7gpkgBQPxJCQU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=d9mPKEZerNrgr/GdxmP4WqxygB/gERXpg6z2H6N7n4neeyqvHW8q8j8v/7PAAXDrR
	 bSDyjNovjASvQATQMlgpAanEF5C2wmYuI3bKhPU7Tmbi7FxQzvvs5i3zBjTjEgREMH
	 HPeD4oHsn+NCofu/gWC6ebyPey3ubvKcDAxGDEMYE25fMoibKHFB/5+e2tuph2WRl3
	 t2cS8B4b8ECv6JONy1RhUZmniosWryR4Npy3qWetZ3uno6djoWB/yIGENmu9zE2vfo
	 N2aK/kLmF2KLa0yid+NWD6+P/PRxIZyeydhpknL3kzo0wN2mRrI1/zu6g1lbqinM8s
	 OHe9o+KM3UllQ==
Date: Tue, 1 Aug 2023 17:24:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
cc: xen-devel@lists.xenproject.org, xen-devel@dornerworks.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>, Nathan Studer <nathan.studer@dornerworks.com>, 
    Stewart Hildebrand <stewart@stew.dk>, Dario Faggioli <dfaggioli@suse.com>, 
    roberto.bagnara@bugseng.com
Subject: Re: [RFC 1/6] dom0: replace explict zero checks
In-Reply-To: <20230801202006.20322-2-dpsmith@apertussolutions.com>
Message-ID: <alpine.DEB.2.22.394.2308011721030.2127516@ubuntu-linux-20-04-desktop>
References: <20230801202006.20322-1-dpsmith@apertussolutions.com> <20230801202006.20322-2-dpsmith@apertussolutions.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 1 Aug 2023, Daniel P. Smith wrote:
> A legacy concept is that the initial domain will have a domain id of zero. As a
> result there are places where a check that a domain is the inital domain is
> determined by an explicit check that the domid is zero.
> 
> This commit seeks to abstract this check into a function call and replace all
> check locations with the function call.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Thanks for the patch, this is a good cleanup!


> ---
>  xen/common/domain.c         | 4 ++--
>  xen/common/sched/arinc653.c | 2 +-
>  xen/common/sched/core.c     | 4 ++--
>  xen/include/xen/sched.h     | 7 +++++++
>  4 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 304aa04fa6..8fb3c052f5 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -309,7 +309,7 @@ static int late_hwdom_init(struct domain *d)
>      struct domain *dom0;
>      int rv;
>  
> -    if ( d != hardware_domain || d->domain_id == 0 )
> +    if ( d != hardware_domain || is_initial_domain(d) )
>          return 0;
>  
>      rv = xsm_init_hardware_domain(XSM_HOOK, d);
> @@ -612,7 +612,7 @@ struct domain *domain_create(domid_t domid,
>      d->is_privileged = flags & CDF_privileged;
>  
>      /* Sort out our idea of is_hardware_domain(). */
> -    if ( domid == 0 || domid == hardware_domid )
> +    if ( is_initial_domain(d) || domid == hardware_domid )
>      {
>          if ( hardware_domid < 0 || hardware_domid >= DOMID_FIRST_RESERVED )
>              panic("The value of hardware_dom must be a valid domain ID\n");
> diff --git a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c
> index a82c0d7314..31e8270af3 100644
> --- a/xen/common/sched/arinc653.c
> +++ b/xen/common/sched/arinc653.c
> @@ -404,7 +404,7 @@ a653sched_alloc_udata(const struct scheduler *ops, struct sched_unit *unit,
>       * Add every one of dom0's units to the schedule, as long as there are
>       * slots available.
>       */
> -    if ( unit->domain->domain_id == 0 )
> +    if ( is_initial_domain(unit->domain) )
>      {
>          entry = sched_priv->num_schedule_entries;
>  
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index 022f548652..210ad30f94 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -585,7 +585,7 @@ int sched_init_vcpu(struct vcpu *v)
>           */
>          sched_set_affinity(unit, cpumask_of(0), cpumask_of(0));
>      }
> -    else if ( d->domain_id == 0 && opt_dom0_vcpus_pin )
> +    else if ( is_initial_domain(d) && opt_dom0_vcpus_pin )
>      {
>          /*
>           * If dom0_vcpus_pin is specified, dom0 vCPUs are pinned 1:1 to
> @@ -594,7 +594,7 @@ int sched_init_vcpu(struct vcpu *v)
>          sched_set_affinity(unit, cpumask_of(processor), &cpumask_all);
>      }
>  #ifdef CONFIG_X86
> -    else if ( d->domain_id == 0 )
> +    else if ( is_initial_domain(d) )
>      {
>          /*
>           * In absence of dom0_vcpus_pin instead, the hard and soft affinity of
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 854f3e32c0..a9276a7bed 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -1058,6 +1058,13 @@ void scheduler_disable(void);
>  void watchdog_domain_init(struct domain *d);
>  void watchdog_domain_destroy(struct domain *d);
>  
> +static always_inline bool is_initial_domain(const struct domain *d)

I know you used always_inline only because is_hardware_domain just below
also uses it, but I wonder if we need it.

Also, Robero, it looks like always_inline is missing from
docs/misra/C-language-toolchain.rst? Or do we plan to get rid of it?


> +{
> +    static int init_domain_id = 0;

I take it is done this way because you plan to make it configurable?


> +    return d->domain_id == init_domain_id;
> +}
> +
>  /*
>   * Use this check when the following are both true:
>   *  - Using this feature or interface requires full access to the hardware
> -- 
> 2.20.1
> 

