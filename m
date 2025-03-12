Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7353FA5E85A
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 00:24:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910985.1317556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsVQa-00073h-96; Wed, 12 Mar 2025 23:23:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910985.1317556; Wed, 12 Mar 2025 23:23:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsVQa-00071Z-6K; Wed, 12 Mar 2025 23:23:56 +0000
Received: by outflank-mailman (input) for mailman id 910985;
 Wed, 12 Mar 2025 23:23:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K94u=V7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tsVQY-00071T-Qt
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 23:23:54 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fa1d5b1-ff99-11ef-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 00:23:53 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AD01BA448EE;
 Wed, 12 Mar 2025 23:18:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DF9AC4CEDD;
 Wed, 12 Mar 2025 23:23:50 +0000 (UTC)
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
X-Inumbo-ID: 0fa1d5b1-ff99-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741821832;
	bh=oSZI3+DRQzg9rjwjwh4VEfp0HrKqBYFXce+AyF7pLs0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CnnjwejwQ2tSI4voayyyMLU6zPjzKuKTr+u8cdUn29PO+rgDKV8FstWSToj3JsDR+
	 ySdsXM1ZTPn60F+s5dODSBW9qkR4eNeUnkcAHcxsOYYx8xy7v3HNin2wpdVDDx6ppt
	 x0hh0lgLTJ/XprYYaEHNcqW5+3qvDEhUC63zgog3TJe7uc2ewjuu6HrVXnAASoCdCo
	 BFzNm1B4KC4nde5a8Fcx1oSwppRjyHQfIUq53z6lU3irRnKmi18bk1RrQ0tUzv5ebz
	 5+R9dl4jFXBtqxQbRHl2EImOHLFilrkIgLREdvf8b8cYXrsv9MufmHQL7plOzz0TOU
	 s+BJshQwPXXZw==
Date: Wed, 12 Mar 2025 16:23:48 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@amd.com>
cc: xen-devel@lists.xenproject.org, ray.huang@amd.com, 
    Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, 
    George Dunlap <gwd@xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 12/19] xen/sysctl: wrap around XEN_SYSCTL_cpupool_op
In-Reply-To: <20250312040632.2853485-13-Penny.Zheng@amd.com>
Message-ID: <alpine.DEB.2.22.394.2503121623420.3477110@ubuntu-linux-20-04-desktop>
References: <20250312040632.2853485-1-Penny.Zheng@amd.com> <20250312040632.2853485-13-Penny.Zheng@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 12 Mar 2025, Penny Zheng wrote:
> Function cpupool_do_sysctl is designed for doing
> cpupool related sysctl operations, and shall be
> wrapped.
> 
> The following static functions are only called by cpupool_do_sysctl(), then
> shall be wrapped too:
> - cpupool_get_next_by_id
> - cpupool_destroy
> - cpupool_unassign_cpu_helper
> - cpupool_unassign_cpu
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>


Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/common/sched/cpupool.c | 9 +++++++++
>  xen/include/xen/sched.h    | 7 +++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
> index 3d02c7b706..0efd8a4591 100644
> --- a/xen/common/sched/cpupool.c
> +++ b/xen/common/sched/cpupool.c
> @@ -241,10 +241,12 @@ struct cpupool *cpupool_get_by_id(unsigned int poolid)
>      return __cpupool_get_by_id(poolid, true);
>  }
>  
> +#ifdef CONFIG_SYSCTL
>  static struct cpupool *cpupool_get_next_by_id(unsigned int poolid)
>  {
>      return __cpupool_get_by_id(poolid, false);
>  }
> +#endif /* CONFIG_SYSCTL */
>  
>  void cpupool_put(struct cpupool *pool)
>  {
> @@ -352,6 +354,8 @@ static struct cpupool *cpupool_create(unsigned int poolid,
>  
>      return ERR_PTR(ret);
>  }
> +
> +#ifdef CONFIG_SYSCTL
>  /*
>   * destroys the given cpupool
>   * returns 0 on success, 1 else
> @@ -379,6 +383,7 @@ static int cpupool_destroy(struct cpupool *c)
>      debugtrace_printk("cpupool_destroy(pool=%u)\n", c->cpupool_id);
>      return 0;
>  }
> +#endif /* CONFIG_SYSCTL */
>  
>  /*
>   * Move domain to another cpupool
> @@ -568,6 +573,7 @@ static int cpupool_unassign_cpu_start(struct cpupool *c, unsigned int cpu)
>      return ret;
>  }
>  
> +#ifdef CONFIG_SYSCTL
>  static long cf_check cpupool_unassign_cpu_helper(void *info)
>  {
>      struct cpupool *c = info;
> @@ -633,6 +639,7 @@ static int cpupool_unassign_cpu(struct cpupool *c, unsigned int cpu)
>      }
>      return continue_hypercall_on_cpu(work_cpu, cpupool_unassign_cpu_helper, c);
>  }
> +#endif /* CONFIG_SYSCTL */
>  
>  /*
>   * add a new domain to a cpupool
> @@ -810,6 +817,7 @@ static void cpupool_cpu_remove_forced(unsigned int cpu)
>      rcu_read_unlock(&sched_res_rculock);
>  }
>  
> +#ifdef CONFIG_SYSCTL
>  /*
>   * do cpupool related sysctl operations
>   */
> @@ -975,6 +983,7 @@ int cpupool_do_sysctl(struct xen_sysctl_cpupool_op *op)
>  
>      return ret;
>  }
> +#endif /* CONFIG_SYSCTL */
>  
>  unsigned int cpupool_get_id(const struct domain *d)
>  {
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 9bdeb85aa4..ea81832c50 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -1259,7 +1259,14 @@ static always_inline bool is_cpufreq_controller(const struct domain *d)
>  }
>  
>  int cpupool_move_domain(struct domain *d, struct cpupool *c);
> +#ifdef CONFIG_SYSCTL
>  int cpupool_do_sysctl(struct xen_sysctl_cpupool_op *op);
> +#else
> +static inline int cpupool_do_sysctl(struct xen_sysctl_cpupool_op *op)
> +{
> +    return -EOPNOTSUPP;
> +}
> +#endif
>  unsigned int cpupool_get_id(const struct domain *d);
>  const cpumask_t *cpupool_valid_cpus(const struct cpupool *pool);
>  
> -- 
> 2.34.1
> 

