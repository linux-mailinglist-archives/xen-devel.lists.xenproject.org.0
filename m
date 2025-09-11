Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A244B52681
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 04:34:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119148.1464655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwX8X-0005Yw-4X; Thu, 11 Sep 2025 02:34:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119148.1464655; Thu, 11 Sep 2025 02:34:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwX8X-0005Wh-1j; Thu, 11 Sep 2025 02:34:13 +0000
Received: by outflank-mailman (input) for mailman id 1119148;
 Thu, 11 Sep 2025 02:34:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5SW2=3W=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uwX8V-0005WY-6t
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 02:34:11 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id caf0febb-8eb7-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 04:34:09 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BBD3B6013D;
 Thu, 11 Sep 2025 02:34:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6A04C4CEEB;
 Thu, 11 Sep 2025 02:34:06 +0000 (UTC)
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
X-Inumbo-ID: caf0febb-8eb7-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757558047;
	bh=G8ibN61BRsROOmQoOnw6M9us1ny3T8uTx3GCsJ3GOXs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gSDc/8EllrrT1VYdp/Yw9mWuEZxp7oqLWV38WLgGs0LAva3oYQMpIWympQfClSf0H
	 a33fi8VH4zLqgJIyYMcjNjVVjbOHfgMPqHefYh2KZx4FfCLo7IU46gOv2qDbrb3j2i
	 9yVkoQXNlt3GExAqphiqyQjKFESwemIzx/kIY5/gDkpAwPNhyaMOH/G3CFiKLrnXYr
	 k4WaQm6PGuNlCVDzEIFb3v7cJC3pWKTvSRXjZvw60dNxq68in7wRAkt6Om2NxOzGTD
	 QdDh34Hk2Wlh8u7qsZULx+WrTPM4hQBug/874nNfkNsOZkHbRoGUR7Vu3sNG1/t2NQ
	 awdyuROGw3bGQ==
Date: Wed, 10 Sep 2025 19:34:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@amd.com>
cc: xen-devel@lists.xenproject.org, ray.huang@amd.com, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 15/26] xen/domctl: wrap xsm_{irq_permission,iomem_permission}
 with CONFIG_MGMT_HYPERCALLS
In-Reply-To: <20250910073827.3622177-16-Penny.Zheng@amd.com>
Message-ID: <alpine.DEB.2.22.394.2509101933490.52703@ubuntu-linux-20-04-desktop>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com> <20250910073827.3622177-16-Penny.Zheng@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 10 Sep 2025, Penny Zheng wrote:
> The following functions are invoked only under
> XEN_DOMCTL_{irq_permission,iomem_permission} domctl-op, and shall be wrapped
> with CONFIG_MGMT_HYPERCALLS:
> - xsm_irq_permission
> - xsm_iomem_permission
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
> v1 -> v2:
> - adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
> ---
>  xen/include/xsm/xsm.h | 10 ++++++++++
>  xen/xsm/dummy.c       |  2 ++
>  xen/xsm/flask/hooks.c |  4 ++++
>  3 files changed, 16 insertions(+)

there is no change to domctl.c ?


> diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
> index 4d332ceca2..1fcd945336 100644
> --- a/xen/include/xsm/xsm.h
> +++ b/xen/include/xsm/xsm.h
> @@ -113,9 +113,11 @@ struct xsm_ops {
>      int (*unmap_domain_irq)(struct domain *d, int irq, const void *data);
>      int (*bind_pt_irq)(struct domain *d, struct xen_domctl_bind_pt_irq *bind);
>      int (*unbind_pt_irq)(struct domain *d, struct xen_domctl_bind_pt_irq *bind);
> +#ifdef CONFIG_MGMT_HYPERCALLS
>      int (*irq_permission)(struct domain *d, int pirq, uint8_t allow);
>      int (*iomem_permission)(struct domain *d, uint64_t s, uint64_t e,
>                              uint8_t allow);
> +#endif
>      int (*iomem_mapping)(struct domain *d, uint64_t s, uint64_t e,
>                           uint8_t allow);
>      int (*pci_config_permission)(struct domain *d, uint32_t machine_bdf,
> @@ -508,13 +510,21 @@ static inline int xsm_unbind_pt_irq(
>  static inline int xsm_irq_permission(
>      xsm_default_t def, struct domain *d, int pirq, uint8_t allow)
>  {
> +#ifdef CONFIG_MGMT_HYPERCALLS
>      return alternative_call(xsm_ops.irq_permission, d, pirq, allow);
> +#else
> +    return -EOPNOTSUPP;
> +#endif
>  }
>  
>  static inline int xsm_iomem_permission(
>      xsm_default_t def, struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
>  {
> +#ifdef CONFIG_MGMT_HYPERCALLS
>      return alternative_call(xsm_ops.iomem_permission, d, s, e, allow);
> +#else
> +    return -EOPNOTSUPP;
> +#endif
>  }
>  
>  static inline int xsm_iomem_mapping(
> diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
> index 2c878999a3..b216894579 100644
> --- a/xen/xsm/dummy.c
> +++ b/xen/xsm/dummy.c
> @@ -73,8 +73,10 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
>      .unmap_domain_irq              = xsm_unmap_domain_irq,
>      .bind_pt_irq                   = xsm_bind_pt_irq,
>      .unbind_pt_irq                 = xsm_unbind_pt_irq,
> +#ifdef CONFIG_MGMT_HYPERCALLS
>      .irq_permission                = xsm_irq_permission,
>      .iomem_permission              = xsm_iomem_permission,
> +#endif
>      .iomem_mapping                 = xsm_iomem_mapping,
>      .pci_config_permission         = xsm_pci_config_permission,
>      .get_vnumainfo                 = xsm_get_vnumainfo,
> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
> index e8a4deb2ea..198053be77 100644
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -1111,12 +1111,14 @@ static int cf_check flask_unbind_pt_irq(
>      return current_has_perm(d, SECCLASS_RESOURCE, RESOURCE__REMOVE);
>  }
>  
> +#ifdef CONFIG_MGMT_HYPERCALLS
>  static int cf_check flask_irq_permission(
>      struct domain *d, int pirq, uint8_t access)
>  {
>      /* the PIRQ number is not useful; real IRQ is checked during mapping */
>      return current_has_perm(d, SECCLASS_RESOURCE, resource_to_perm(access));
>  }
> +#endif /* CONFIG_MGMT_HYPERCALLS */
>  
>  struct iomem_has_perm_data {
>      uint32_t ssid;
> @@ -1943,8 +1945,10 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
>      .unmap_domain_irq = flask_unmap_domain_irq,
>      .bind_pt_irq = flask_bind_pt_irq,
>      .unbind_pt_irq = flask_unbind_pt_irq,
> +#ifdef CONFIG_MGMT_HYPERCALLS
>      .irq_permission = flask_irq_permission,
>      .iomem_permission = flask_iomem_permission,
> +#endif
>      .iomem_mapping = flask_iomem_mapping,
>      .pci_config_permission = flask_pci_config_permission,
>  
> -- 
> 2.34.1
> 
> 

