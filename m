Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FD8A5E860
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 00:27:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910996.1317566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsVTW-0007b8-MG; Wed, 12 Mar 2025 23:26:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910996.1317566; Wed, 12 Mar 2025 23:26:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsVTW-0007ZR-JG; Wed, 12 Mar 2025 23:26:58 +0000
Received: by outflank-mailman (input) for mailman id 910996;
 Wed, 12 Mar 2025 23:26:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K94u=V7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tsVTU-0007ZL-Lz
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 23:26:56 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c155784-ff99-11ef-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 00:26:55 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6D941A4497F;
 Wed, 12 Mar 2025 23:21:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C57BAC4CEDD;
 Wed, 12 Mar 2025 23:26:51 +0000 (UTC)
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
X-Inumbo-ID: 7c155784-ff99-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741822014;
	bh=jgGDYFyPYWK1XeqbrR282ah0b/LUzx1VyhUn5vHjfaE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ii4gbfGpoSk6skUTTaYMTP9UVKFdaECmf0TY6EuylBRBVvlZgrfNQ3zpkRoh01JCx
	 TFdzHPRIzZ0zY1G2ScDCZ6PgvwJIADgeGOwtUvV8eJjQDdjogwFvnfG493CKUCumEl
	 2t6oMstZmxNmsjMhaLJO26sPvBOdDs7KrvqqeMhka+TUQBSWkJ9dapX+QVIhEdhA8Y
	 QP7CKSBO/SFgQLk80EKIv69DCJHuC4LOFhMRqYOTtC5/pPHeS14BFsBzkUVOXddIih
	 mHF/6xOQeU/y1BJi4ijFd580IiepYu11JeAVrMyEUDOMGzzYGzRr5Jiz8VBkpBLETE
	 zyLYuLPEyHEBA==
Date: Wed, 12 Mar 2025 16:26:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@amd.com>
cc: xen-devel@lists.xenproject.org, xen-devel@dornerworks.com, 
    ray.huang@amd.com, Nathan Studer <nathan.studer@dornerworks.com>, 
    Stewart Hildebrand <stewart@stew.dk>, Dario Faggioli <dfaggioli@suse.com>, 
    Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v1 13/19] xen/sysctl: wrap around
 XEN_SYSCTL_scheduler_op
In-Reply-To: <20250312040632.2853485-14-Penny.Zheng@amd.com>
Message-ID: <alpine.DEB.2.22.394.2503121626160.3477110@ubuntu-linux-20-04-desktop>
References: <20250312040632.2853485-1-Penny.Zheng@amd.com> <20250312040632.2853485-14-Penny.Zheng@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 12 Mar 2025, Penny Zheng wrote:
> Function sched_adjust_global is designed for XEN_SYSCTL_scheduler_op, so
> itself and its calling flow, like .adjust_global, shall all be wrapped.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/common/sched/arinc653.c | 6 ++++++
>  xen/common/sched/core.c     | 2 ++
>  xen/common/sched/credit.c   | 4 ++++
>  xen/common/sched/credit2.c  | 4 ++++
>  xen/common/sched/private.h  | 4 ++++
>  xen/include/xen/sched.h     | 6 +++++-
>  xen/include/xsm/dummy.h     | 2 ++
>  xen/include/xsm/xsm.h       | 4 ++++
>  xen/xsm/dummy.c             | 2 ++
>  xen/xsm/flask/hooks.c       | 4 ++++
>  10 files changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c
> index a82c0d7314..3a2c349d38 100644
> --- a/xen/common/sched/arinc653.c
> +++ b/xen/common/sched/arinc653.c
> @@ -214,6 +214,7 @@ static void update_schedule_units(const struct scheduler *ops)
>                        SCHED_PRIV(ops)->schedule[i].unit_id);
>  }
>  
> +#ifdef CONFIG_SYSCTL
>  /**
>   * This function is called by the adjust_global scheduler hook to put
>   * in place a new ARINC653 schedule.
> @@ -328,6 +329,7 @@ arinc653_sched_get(
>  
>      return 0;
>  }
> +#endif /* CONFIG_SYSCTL */
>  
>  /**************************************************************************
>   * Scheduler callback functions                                           *
> @@ -648,6 +650,7 @@ a653_switch_sched(struct scheduler *new_ops, unsigned int cpu,
>      return &sr->_lock;
>  }
>  
> +#ifdef CONFIG_SYSCTL
>  /**
>   * Xen scheduler callback function to perform a global (not domain-specific)
>   * adjustment. It is used by the ARINC 653 scheduler to put in place a new
> @@ -687,6 +690,7 @@ a653sched_adjust_global(const struct scheduler *ops,
>  
>      return rc;
>  }
> +#endif /* CONFIG_SYSCTL */
>  
>  /**
>   * This structure defines our scheduler for Xen.
> @@ -721,7 +725,9 @@ static const struct scheduler sched_arinc653_def = {
>      .switch_sched   = a653_switch_sched,
>  
>      .adjust         = NULL,
> +#ifdef CONFIG_SYSCTL
>      .adjust_global  = a653sched_adjust_global,
> +#endif
>  
>      .dump_settings  = NULL,
>      .dump_cpu_state = NULL,
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index ea452d8b3e..e528909e5d 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -2095,6 +2095,7 @@ long sched_adjust(struct domain *d, struct xen_domctl_scheduler_op *op)
>      return ret;
>  }
>  
> +#ifdef CONFIG_SYSCTL
>  long sched_adjust_global(struct xen_sysctl_scheduler_op *op)
>  {
>      struct cpupool *pool;
> @@ -2123,6 +2124,7 @@ long sched_adjust_global(struct xen_sysctl_scheduler_op *op)
>  
>      return rc;
>  }
> +#endif /* CONFIG_SYSCTL */
>  
>  static void vcpu_periodic_timer_work_locked(struct vcpu *v)
>  {
> diff --git a/xen/common/sched/credit.c b/xen/common/sched/credit.c
> index a6bb321e7d..6dcf6b2c8b 100644
> --- a/xen/common/sched/credit.c
> +++ b/xen/common/sched/credit.c
> @@ -1256,6 +1256,7 @@ __csched_set_tslice(struct csched_private *prv, unsigned int timeslice_ms)
>      prv->credit = prv->credits_per_tslice * prv->ncpus;
>  }
>  
> +#ifdef CONFIG_SYSCTL
>  static int cf_check
>  csched_sys_cntl(const struct scheduler *ops,
>                          struct xen_sysctl_scheduler_op *sc)
> @@ -1298,6 +1299,7 @@ csched_sys_cntl(const struct scheduler *ops,
>      out:
>      return rc;
>  }
> +#endif /* CONFIG_SYSCTL */
>  
>  static void *cf_check
>  csched_alloc_domdata(const struct scheduler *ops, struct domain *dom)
> @@ -2288,7 +2290,9 @@ static const struct scheduler sched_credit_def = {
>  
>      .adjust         = csched_dom_cntl,
>      .adjust_affinity= csched_aff_cntl,
> +#ifdef CONFIG_SYSCTL
>      .adjust_global  = csched_sys_cntl,
> +#endif
>  
>      .pick_resource  = csched_res_pick,
>      .do_schedule    = csched_schedule,
> diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
> index 0a83f23725..0b3b61df57 100644
> --- a/xen/common/sched/credit2.c
> +++ b/xen/common/sched/credit2.c
> @@ -3131,6 +3131,7 @@ csched2_aff_cntl(const struct scheduler *ops, struct sched_unit *unit,
>          __clear_bit(__CSFLAG_pinned, &svc->flags);
>  }
>  
> +#ifdef CONFIG_SYSCTL
>  static int cf_check csched2_sys_cntl(
>      const struct scheduler *ops, struct xen_sysctl_scheduler_op *sc)
>  {
> @@ -3162,6 +3163,7 @@ static int cf_check csched2_sys_cntl(
>  
>      return 0;
>  }
> +#endif /* CONFIG_SYSCTL */
>  
>  static void *cf_check
>  csched2_alloc_domdata(const struct scheduler *ops, struct domain *dom)
> @@ -4232,7 +4234,9 @@ static const struct scheduler sched_credit2_def = {
>  
>      .adjust         = csched2_dom_cntl,
>      .adjust_affinity= csched2_aff_cntl,
> +#ifdef CONFIG_SYSCTL
>      .adjust_global  = csched2_sys_cntl,
> +#endif
>  
>      .pick_resource  = csched2_res_pick,
>      .migrate        = csched2_unit_migrate,
> diff --git a/xen/common/sched/private.h b/xen/common/sched/private.h
> index c0e7c96d24..d6884550cd 100644
> --- a/xen/common/sched/private.h
> +++ b/xen/common/sched/private.h
> @@ -356,8 +356,10 @@ struct scheduler {
>                                      struct sched_unit *unit,
>                                      const struct cpumask *hard,
>                                      const struct cpumask *soft);
> +#ifdef CONFIG_SYSCTL
>      int          (*adjust_global)  (const struct scheduler *ops,
>                                      struct xen_sysctl_scheduler_op *sc);
> +#endif
>      void         (*dump_settings)  (const struct scheduler *ops);
>      void         (*dump_cpu_state) (const struct scheduler *ops, int cpu);
>      void         (*move_timers)    (const struct scheduler *ops,
> @@ -510,11 +512,13 @@ static inline int sched_adjust_dom(const struct scheduler *s, struct domain *d,
>      return s->adjust ? s->adjust(s, d, op) : 0;
>  }
>  
> +#ifdef CONFIG_SYSCTL
>  static inline int sched_adjust_cpupool(const struct scheduler *s,
>                                         struct xen_sysctl_scheduler_op *op)
>  {
>      return s->adjust_global ? s->adjust_global(s, op) : 0;
>  }
> +#endif
>  
>  static inline void sched_move_timers(const struct scheduler *s,
>                                       struct sched_resource *sr)
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index ea81832c50..5a065b3624 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -848,10 +848,14 @@ void sched_destroy_vcpu(struct vcpu *v);
>  int  sched_init_domain(struct domain *d, unsigned int poolid);
>  void sched_destroy_domain(struct domain *d);
>  long sched_adjust(struct domain *d, struct xen_domctl_scheduler_op *op);
> -long sched_adjust_global(struct xen_sysctl_scheduler_op *op);
>  #ifdef CONFIG_SYSCTL
> +long sched_adjust_global(struct xen_sysctl_scheduler_op *op);
>  int  scheduler_id(void);
>  #else
> +static inline long sched_adjust_global(struct xen_sysctl_scheduler_op *op)
> +{
> +    return -EOPNOTSUPP;
> +}
>  static inline int scheduler_id(void)
>  {
>      return -EOPNOTSUPP;
> diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
> index 5f89fc98fc..826db1fc69 100644
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -148,11 +148,13 @@ static XSM_INLINE int cf_check xsm_domctl_scheduler_op(
>      return xsm_default_action(action, current->domain, d);
>  }
>  
> +#ifdef CONFIG_SYSCTL
>  static XSM_INLINE int cf_check xsm_sysctl_scheduler_op(XSM_DEFAULT_ARG int cmd)
>  {
>      XSM_ASSERT_ACTION(XSM_HOOK);
>      return xsm_default_action(action, current->domain, NULL);
>  }
> +#endif
>  
>  static XSM_INLINE int cf_check xsm_set_target(
>      XSM_DEFAULT_ARG struct domain *d, struct domain *e)
> diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
> index d6f27aa977..d413a12897 100644
> --- a/xen/include/xsm/xsm.h
> +++ b/xen/include/xsm/xsm.h
> @@ -57,7 +57,9 @@ struct xsm_ops {
>      int (*domain_create)(struct domain *d, uint32_t ssidref);
>      int (*getdomaininfo)(struct domain *d);
>      int (*domctl_scheduler_op)(struct domain *d, int op);
> +#ifdef CONFIG_SYSCTL
>      int (*sysctl_scheduler_op)(int op);
> +#endif
>      int (*set_target)(struct domain *d, struct domain *e);
>      int (*domctl)(struct domain *d, unsigned int cmd, uint32_t ssidref);
>  #ifdef CONFIG_SYSCTL
> @@ -246,10 +248,12 @@ static inline int xsm_domctl_scheduler_op(
>      return alternative_call(xsm_ops.domctl_scheduler_op, d, cmd);
>  }
>  
> +#ifdef CONFIG_SYSCTL
>  static inline int xsm_sysctl_scheduler_op(xsm_default_t def, int cmd)
>  {
>      return alternative_call(xsm_ops.sysctl_scheduler_op, cmd);
>  }
> +#endif
>  
>  static inline int xsm_set_target(
>      xsm_default_t def, struct domain *d, struct domain *e)
> diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
> index aa89ee5331..6270bef308 100644
> --- a/xen/xsm/dummy.c
> +++ b/xen/xsm/dummy.c
> @@ -19,7 +19,9 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
>      .domain_create                 = xsm_domain_create,
>      .getdomaininfo                 = xsm_getdomaininfo,
>      .domctl_scheduler_op           = xsm_domctl_scheduler_op,
> +#ifdef CONFIG_SYSCTL
>      .sysctl_scheduler_op           = xsm_sysctl_scheduler_op,
> +#endif
>      .set_target                    = xsm_set_target,
>      .domctl                        = xsm_domctl,
>  #ifdef CONFIG_SYSCTL
> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
> index 9819cd407d..aefb7681cb 100644
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -626,6 +626,7 @@ static int cf_check flask_domctl_scheduler_op(struct domain *d, int op)
>      }
>  }
>  
> +#ifdef CONFIG_SYSCTL
>  static int cf_check flask_sysctl_scheduler_op(int op)
>  {
>      switch ( op )
> @@ -640,6 +641,7 @@ static int cf_check flask_sysctl_scheduler_op(int op)
>          return avc_unknown_permission("sysctl_scheduler_op", op);
>      }
>  }
> +#endif
>  
>  static int cf_check flask_set_target(struct domain *d, struct domain *t)
>  {
> @@ -1887,7 +1889,9 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
>      .domain_create = flask_domain_create,
>      .getdomaininfo = flask_getdomaininfo,
>      .domctl_scheduler_op = flask_domctl_scheduler_op,
> +#ifdef CONFIG_SYSCTL
>      .sysctl_scheduler_op = flask_sysctl_scheduler_op,
> +#endif
>      .set_target = flask_set_target,
>      .domctl = flask_domctl,
>  #ifdef CONFIG_SYSCTL
> -- 
> 2.34.1
> 

