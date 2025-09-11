Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F47B5268E
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 04:37:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119181.1464686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwXBa-0007QX-0Z; Thu, 11 Sep 2025 02:37:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119181.1464686; Thu, 11 Sep 2025 02:37:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwXBZ-0007NN-Tc; Thu, 11 Sep 2025 02:37:21 +0000
Received: by outflank-mailman (input) for mailman id 1119181;
 Thu, 11 Sep 2025 02:37:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5SW2=3W=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uwXBY-0007N0-Po
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 02:37:20 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b85c426-8eb8-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 04:37:18 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1C36E43902;
 Thu, 11 Sep 2025 02:37:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CA92C4CEEB;
 Thu, 11 Sep 2025 02:37:16 +0000 (UTC)
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
X-Inumbo-ID: 3b85c426-8eb8-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757558237;
	bh=WThbnJgbo3znvlWkt4R9hHIR3Wl4SZolIIO9gH+Uayo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hnJYHJGdXA7MyfwLGnFP8sm6PJ6tIP6c63RsTEdT0QmMg6XVbAzfR4dPG9EYQbYVu
	 8uM9U+MZCLZ+Mm/jDiOjZ+a6cNLRxmgTvMIC19LE4oBIjvL5aZp0thUHYeF0sUFkWc
	 0IhewvEhKZlRfziBRxsBFikisZtU0V0CK643ky9pD1mxK5tTP7YQME1snd/utZo3NN
	 RgjfOjHOAkBc/2b9Wg0+0npUpiMMSwQbryQ2DCdnlTzjNU3Qh7k6Du9uqlUNzTZv3L
	 79Z/bTpsUxgjoEPjzliN9vXnSb6ottsCIWTbFZVDyDRRWGyQcc9QrKFvBEQAyoAbsp
	 6UycwqilxFQ1w==
Date: Wed, 10 Sep 2025 19:37:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@amd.com>
cc: xen-devel@lists.xenproject.org, ray.huang@amd.com, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 17/26] xen/domctl: wrap xsm_set_target() with
 CONFIG_MGMT_HYPERCALLS
In-Reply-To: <20250910073827.3622177-18-Penny.Zheng@amd.com>
Message-ID: <alpine.DEB.2.22.394.2509101937040.52703@ubuntu-linux-20-04-desktop>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com> <20250910073827.3622177-18-Penny.Zheng@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 10 Sep 2025, Penny Zheng wrote:
> Function xsm_set_target() is only invoked under XEN_DOMCTL_set_target
> domctl-op, and shall be wrapped with CONFIG_MGMT_HYPERCALLS.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
> v1 -> v2:
> - adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
> ---
>  xen/include/xsm/xsm.h | 6 +++++-
>  xen/xsm/dummy.c       | 2 +-
>  xen/xsm/flask/hooks.c | 4 ++--
>  3 files changed, 8 insertions(+), 4 deletions(-)

No change to domctl.c ?


> diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
> index 1fcd945336..678cb0f346 100644
> --- a/xen/include/xsm/xsm.h
> +++ b/xen/include/xsm/xsm.h
> @@ -59,8 +59,8 @@ struct xsm_ops {
>  #ifdef CONFIG_MGMT_HYPERCALLS
>      int (*domctl_scheduler_op)(struct domain *d, int op);
>      int (*sysctl_scheduler_op)(int op);
> -#endif
>      int (*set_target)(struct domain *d, struct domain *e);
> +#endif
>      int (*domctl)(struct domain *d, unsigned int cmd, uint32_t ssidref);
>      int (*sysctl)(int cmd);
>      int (*readconsole)(uint32_t clear);
> @@ -258,7 +258,11 @@ static inline int xsm_sysctl_scheduler_op(xsm_default_t def, int cmd)
>  static inline int xsm_set_target(
>      xsm_default_t def, struct domain *d, struct domain *e)
>  {
> +#ifdef CONFIG_MGMT_HYPERCALLS
>      return alternative_call(xsm_ops.set_target, d, e);
> +#else
> +    return -EOPNOTSUPP;
> +#endif
>  }
>  
>  static inline int xsm_domctl(xsm_default_t def, struct domain *d,
> diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
> index b216894579..f6986dd2bb 100644
> --- a/xen/xsm/dummy.c
> +++ b/xen/xsm/dummy.c
> @@ -21,8 +21,8 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
>  #ifdef CONFIG_MGMT_HYPERCALLS
>      .domctl_scheduler_op           = xsm_domctl_scheduler_op,
>      .sysctl_scheduler_op           = xsm_sysctl_scheduler_op,
> -#endif
>      .set_target                    = xsm_set_target,
> +#endif
>      .domctl                        = xsm_domctl,
>  #ifdef CONFIG_MGMT_HYPERCALLS
>      .sysctl                        = xsm_sysctl,
> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
> index 198053be77..ed4e466302 100644
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -641,7 +641,6 @@ static int cf_check flask_sysctl_scheduler_op(int op)
>          return avc_unknown_permission("sysctl_scheduler_op", op);
>      }
>  }
> -#endif /* CONFIG_MGMT_HYPERCALLS */
>  
>  static int cf_check flask_set_target(struct domain *d, struct domain *t)
>  {
> @@ -666,6 +665,7 @@ static int cf_check flask_set_target(struct domain *d, struct domain *t)
>                                   &dsec->target_sid);
>      return rc;
>  }
> +#endif /* CONFIG_MGMT_HYPERCALLS */
>  
>  static int cf_check flask_domctl(struct domain *d, unsigned int cmd,
>                                   uint32_t ssidref)
> @@ -1893,8 +1893,8 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
>  #ifdef CONFIG_MGMT_HYPERCALLS
>      .domctl_scheduler_op = flask_domctl_scheduler_op,
>      .sysctl_scheduler_op = flask_sysctl_scheduler_op,
> -#endif
>      .set_target = flask_set_target,
> +#endif
>      .domctl = flask_domctl,
>  #ifdef CONFIG_MGMT_HYPERCALLS
>      .sysctl = flask_sysctl,
> -- 
> 2.34.1
> 
> 

