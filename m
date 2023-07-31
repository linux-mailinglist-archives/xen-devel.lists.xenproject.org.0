Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D94376A297
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 23:25:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573461.898184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQaO5-0008Db-9d; Mon, 31 Jul 2023 21:25:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573461.898184; Mon, 31 Jul 2023 21:25:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQaO5-0008BV-6v; Mon, 31 Jul 2023 21:25:09 +0000
Received: by outflank-mailman (input) for mailman id 573461;
 Mon, 31 Jul 2023 21:25:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bj4f=DR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qQaO4-0008BN-0H
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 21:25:08 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6f68ada-2fe8-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 23:25:05 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B580E612D6;
 Mon, 31 Jul 2023 21:25:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3A85C433C8;
 Mon, 31 Jul 2023 21:25:01 +0000 (UTC)
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
X-Inumbo-ID: b6f68ada-2fe8-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690838703;
	bh=KGnD3msMReyKTOzstEIixPQuRNy4ermLgrzW6q8P4l0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ceebZu9nTju61/iSF0cZVsAPBjecr8RIa/DpqLUvDsnwgTsX9AJEC3t0saPF/jZ9n
	 nvMuzgKqzwzgQoLMbrpM+G+mzSY+6z0Q8CIuNViMVvTUQGu681ss8e5sxe3UtTnJcH
	 pLWe2JapeVLJxIG1pb84nY6WhGqhYUg9WVT6iBCwm3nZSAwe7Ya7csic94D3Yh8vLT
	 fY1ICCvmf9Djg/49+mEBz5TvlPLBVafQqrsOFIFU+QEQIZGor8Un9JMFeDmYmCpWQp
	 HdS/l5qeQjtTZ73YRH/UZGAdqX/p8BBUThnQcpz6MhRPQy0CuI7YWLyOFj9MpmDxrN
	 L0t7fTlv2IndQ==
Date: Mon, 31 Jul 2023 14:24:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    George Dunlap <george.dunlap@citrix.com>, 
    Dario Faggioli <dfaggioli@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH] xen/sched: address violations of MISRA C:2012 Rules
 8.2 and 8.3
In-Reply-To: <072d163857101f4cdaf61b6336b2d8f2e65d7360.1690800014.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2307311424490.1972086@ubuntu-linux-20-04-desktop>
References: <072d163857101f4cdaf61b6336b2d8f2e65d7360.1690800014.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 31 Jul 2023, Federico Serafini wrote:
> Give a name to unnamed parameters to address violations of
> MISRA C:2012 Rule 8.2 ("Function types shall be in prototype form with
> named parameters").
> Keep consistency between parameter names and types used in function
> declarations and the ones used in the corresponding function
> definitions, thus addressing violations of MISRA C:2012 Rule 8.3
> ("All declarations of an object or function shall use the same names
> and type qualifiers").
> 
> No functional changes.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/common/sched/compat.c  |  2 +-
>  xen/common/sched/credit2.c |  3 ++-
>  xen/common/sched/private.h |  2 +-
>  xen/include/xen/sched.h    | 10 +++++-----
>  4 files changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/common/sched/compat.c b/xen/common/sched/compat.c
> index 040b4caca2..a596e3a226 100644
> --- a/xen/common/sched/compat.c
> +++ b/xen/common/sched/compat.c
> @@ -39,7 +39,7 @@ static int compat_poll(struct compat_sched_poll *compat)
>  
>  #include "core.c"
>  
> -int compat_set_timer_op(u32 lo, s32 hi)
> +int compat_set_timer_op(uint32_t lo, int32_t hi)
>  {
>      return do_set_timer_op(((s64)hi << 32) | lo);
>  }
> diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
> index 87a1e31ee9..7e23fabebb 100644
> --- a/xen/common/sched/credit2.c
> +++ b/xen/common/sched/credit2.c
> @@ -1480,7 +1480,8 @@ static inline void runq_remove(struct csched2_unit *svc)
>      list_del_init(&svc->runq_elem);
>  }
>  
> -void burn_credits(struct csched2_runqueue_data *rqd, struct csched2_unit *, s_time_t);
> +void burn_credits(struct csched2_runqueue_data *rqd, struct csched2_unit *svc,
> +                  s_time_t now);
>  
>  static inline void
>  tickle_cpu(unsigned int cpu, struct csched2_runqueue_data *rqd)
> diff --git a/xen/common/sched/private.h b/xen/common/sched/private.h
> index 0527a8c70d..c516976c37 100644
> --- a/xen/common/sched/private.h
> +++ b/xen/common/sched/private.h
> @@ -629,7 +629,7 @@ int cpu_disable_scheduler(unsigned int cpu);
>  int schedule_cpu_add(unsigned int cpu, struct cpupool *c);
>  struct cpu_rm_data *alloc_cpu_rm_data(unsigned int cpu, bool aff_alloc);
>  void free_cpu_rm_data(struct cpu_rm_data *mem, unsigned int cpu);
> -int schedule_cpu_rm(unsigned int cpu, struct cpu_rm_data *mem);
> +int schedule_cpu_rm(unsigned int cpu, struct cpu_rm_data *data);
>  int sched_move_domain(struct domain *d, struct cpupool *c);
>  void sched_migrate_timers(unsigned int cpu);
>  struct cpupool *cpupool_get_by_id(unsigned int poolid);
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 854f3e32c0..5be61bb252 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -789,8 +789,8 @@ int  sched_init_vcpu(struct vcpu *v);
>  void sched_destroy_vcpu(struct vcpu *v);
>  int  sched_init_domain(struct domain *d, unsigned int poolid);
>  void sched_destroy_domain(struct domain *d);
> -long sched_adjust(struct domain *, struct xen_domctl_scheduler_op *);
> -long sched_adjust_global(struct xen_sysctl_scheduler_op *);
> +long sched_adjust(struct domain *d, struct xen_domctl_scheduler_op *op);
> +long sched_adjust_global(struct xen_sysctl_scheduler_op *op);
>  int  sched_id(void);
>  
>  /*
> @@ -831,11 +831,11 @@ void context_switch(
>  
>  /*
>   * As described above, context_switch() must call this function when the
> - * local CPU is no longer running in @prev's context, and @prev's context is
> + * local CPU is no longer running in @vprev's context, and @vprev's context is
>   * saved to memory. Alternatively, if implementing lazy context switching,
> - * ensure that invoking sync_vcpu_execstate() will switch and commit @prev.
> + * ensure that invoking sync_vcpu_execstate() will switch and commit @vprev.
>   */
> -void sched_context_switched(struct vcpu *prev, struct vcpu *vnext);
> +void sched_context_switched(struct vcpu *vprev, struct vcpu *vnext);
>  
>  /* Called by the scheduler to continue running the current VCPU. */
>  void continue_running(
> -- 
> 2.34.1
> 

