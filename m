Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1FFA5E808
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 00:10:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910918.1317506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsVCy-0001Lg-5z; Wed, 12 Mar 2025 23:09:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910918.1317506; Wed, 12 Mar 2025 23:09:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsVCy-0001Jp-2g; Wed, 12 Mar 2025 23:09:52 +0000
Received: by outflank-mailman (input) for mailman id 910918;
 Wed, 12 Mar 2025 23:09:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K94u=V7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tsVCw-0001Jb-TG
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 23:09:50 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18279701-ff97-11ef-9898-31a8f345e629;
 Thu, 13 Mar 2025 00:09:48 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 04D39A42660;
 Wed, 12 Mar 2025 23:04:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD49DC4CEDD;
 Wed, 12 Mar 2025 23:09:45 +0000 (UTC)
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
X-Inumbo-ID: 18279701-ff97-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741820987;
	bh=XxvHmP3PKnMjISWZrgSBT28edtn3wk/uXTxXBDS/nT8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HebTx8StVY4z1LRuWtzchEo9GK3TSZC4k1xFyyP3rGjRiOUcAZmFCRqU6RPekNo0w
	 lltjK/vx+bmKGtiCAjK7LoaMd6n1QlAE5vkqq+op7KPbJsNETRYLDdr9izuujvpm0y
	 qnX62E5bVsvKmodGEX0tpBJSoabnVA2kCe/BdVRII8wNdUihMNk8hmH0NRnC1k5/L4
	 eTdkgxrunKnZA0HO0MoLNh3yqQdBxCKi5sI7X/Bnfz9vgOTTHRGr53y2lEcxph2quu
	 tByw+oMDSaN9qMMBAPgaRuZfXpf93hz0P5xSwAKd9r4MKcGs3hSamzDu/Bn6EkK4Uh
	 ZxM8tVq4xhitQ==
Date: Wed, 12 Mar 2025 16:09:43 -0700 (PDT)
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
Subject: Re: [PATCH v1 05/19] xen/sysctl: wrap around XEN_SYSCTL_sched_id
In-Reply-To: <20250312040632.2853485-6-Penny.Zheng@amd.com>
Message-ID: <alpine.DEB.2.22.394.2503121609270.3477110@ubuntu-linux-20-04-desktop>
References: <20250312040632.2853485-1-Penny.Zheng@amd.com> <20250312040632.2853485-6-Penny.Zheng@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 12 Mar 2025, Penny Zheng wrote:
> The following function shall be wrapped:
> - scheduler_id
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/common/sched/core.c | 2 ++
>  xen/include/xen/sched.h | 7 +++++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index d6296d99fd..ea452d8b3e 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -2052,11 +2052,13 @@ long do_set_timer_op(s_time_t timeout)
>      return 0;
>  }
>  
> +#ifdef CONFIG_SYSCTL
>  /* scheduler_id - fetch ID of current scheduler */
>  int scheduler_id(void)
>  {
>      return operations.sched_id;
>  }
> +#endif
>  
>  /* Adjust scheduling parameter for a given domain. */
>  long sched_adjust(struct domain *d, struct xen_domctl_scheduler_op *op)
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 559d201e0c..9bdeb85aa4 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -849,7 +849,14 @@ int  sched_init_domain(struct domain *d, unsigned int poolid);
>  void sched_destroy_domain(struct domain *d);
>  long sched_adjust(struct domain *d, struct xen_domctl_scheduler_op *op);
>  long sched_adjust_global(struct xen_sysctl_scheduler_op *op);
> +#ifdef CONFIG_SYSCTL
>  int  scheduler_id(void);
> +#else
> +static inline int scheduler_id(void)
> +{
> +    return -EOPNOTSUPP;
> +}
> +#endif
>  
>  /*
>   * sched_get_id_by_name - retrieves a scheduler id given a scheduler name
> -- 
> 2.34.1
> 

