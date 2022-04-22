Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E9950C49E
	for <lists+xen-devel@lfdr.de>; Sat, 23 Apr 2022 01:42:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.311325.528510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ni2uG-0003sq-AQ; Fri, 22 Apr 2022 23:41:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 311325.528510; Fri, 22 Apr 2022 23:41:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ni2uG-0003r1-7M; Fri, 22 Apr 2022 23:41:44 +0000
Received: by outflank-mailman (input) for mailman id 311325;
 Fri, 22 Apr 2022 23:41:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N0EE=VA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ni2uE-0003qv-OX
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 23:41:42 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2ae89cd-c295-11ec-8fc2-03012f2f19d4;
 Sat, 23 Apr 2022 01:41:41 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id ACA5CB83331;
 Fri, 22 Apr 2022 23:41:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2F7CC385A0;
 Fri, 22 Apr 2022 23:41:37 +0000 (UTC)
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
X-Inumbo-ID: c2ae89cd-c295-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650670898;
	bh=5QuYhRgFPxWY9VGWC+SG9+xWFlM8oS8TIbaKaKxgZB0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=D+xh1F195TEvbAJuowysu5xIR7e1kUcloQNyTbl1JcbIhWY91exZ5OyiR1wK/ktrp
	 FN+o1+SBz967teSr1wxswh2iCgqnHUPGI6ltbBDclj0sP6cRsA49MOZ8jnvQx2yg0p
	 E14oeoyKKH6sAeYpDrgViKYoV09yyLRtyqliG4p/Z5ChXKDJPN/S47MwhUwo0rnUpG
	 REAs6JnJYT3KcTnJD4jYKbi8rSOCTXCAI9sQpOvAsv3jfkolKm94YP2CQJKPfJHN9n
	 qzGQokzq9F/ck+T8evmkVlI1a64zyWj4xYvKGb8nXSkKs4vCYg5EZqxiTdDgiDJioi
	 aexHDGRF1BPtg==
Date: Fri, 22 Apr 2022 16:41:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Juergen Gross <jgross@suse.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v4] xen/iommu: cleanup iommu related domctl handling
In-Reply-To: <20220420055736.27901-1-jgross@suse.com>
Message-ID: <alpine.DEB.2.22.394.2204221640290.915916@ubuntu-linux-20-04-desktop>
References: <20220420055736.27901-1-jgross@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 20 Apr 2022, Juergen Gross wrote:
> Today iommu_do_domctl() is being called from arch_do_domctl() in the
> "default:" case of a switch statement. This has led already to crashes
> due to unvalidated parameters.
> 
> Fix that by moving the call of iommu_do_domctl() to the main switch
> statement of do_domctl().
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

For the ARM side:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


I have no opinion on the ENOSYS vs EOPNOTSUPP discussion.



> ---
> V3:
> - new patch
> V4:
> - add iommu_do_domctl() stub for !CONFIG_HAS_PASSTHROUGH (Andrew Cooper,
>   Jan Beulich)
> ---
>  xen/arch/arm/domctl.c   | 11 +----------
>  xen/arch/x86/domctl.c   |  2 +-
>  xen/common/domctl.c     |  7 +++++++
>  xen/include/xen/iommu.h | 12 +++++++++---
>  4 files changed, 18 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
> index 6245af6d0b..1baf25c3d9 100644
> --- a/xen/arch/arm/domctl.c
> +++ b/xen/arch/arm/domctl.c
> @@ -176,16 +176,7 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
>          return rc;
>      }
>      default:
> -    {
> -        int rc;
> -
> -        rc = subarch_do_domctl(domctl, d, u_domctl);
> -
> -        if ( rc == -ENOSYS )
> -            rc = iommu_do_domctl(domctl, d, u_domctl);
> -
> -        return rc;
> -    }
> +        return subarch_do_domctl(domctl, d, u_domctl);
>      }
>  }
>  
> diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
> index a6aae500a3..c9699bb868 100644
> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -1380,7 +1380,7 @@ long arch_do_domctl(
>          break;
>  
>      default:
> -        ret = iommu_do_domctl(domctl, d, u_domctl);
> +        ret = -ENOSYS;
>          break;
>      }
>  
> diff --git a/xen/common/domctl.c b/xen/common/domctl.c
> index 5879117580..0a866e3132 100644
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -871,6 +871,13 @@ long cf_check do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>              copyback = 1;
>          break;
>  
> +    case XEN_DOMCTL_assign_device:
> +    case XEN_DOMCTL_test_assign_device:
> +    case XEN_DOMCTL_deassign_device:
> +    case XEN_DOMCTL_get_device_group:
> +        ret = iommu_do_domctl(op, d, u_domctl);
> +        break;
> +
>      default:
>          ret = arch_do_domctl(op, d, u_domctl);
>          break;
> diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
> index 3a83981464..c6bbb65bbf 100644
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -341,8 +341,17 @@ struct domain_iommu {
>  /* Does the IOMMU pagetable need to be kept synchronized with the P2M */
>  #ifdef CONFIG_HAS_PASSTHROUGH
>  #define need_iommu_pt_sync(d)     (dom_iommu(d)->need_sync)
> +
> +int iommu_do_domctl(struct xen_domctl *domctl, struct domain *d,
> +                    XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
>  #else
>  #define need_iommu_pt_sync(d)     ({ (void)(d); false; })
> +
> +static inline int iommu_do_domctl(struct xen_domctl *domctl, struct domain *d,
> +                                  XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
> +{
> +    return -ENOSYS;
> +}
>  #endif
>  
>  int __must_check iommu_suspend(void);
> @@ -356,9 +365,6 @@ int iommu_do_pci_domctl(struct xen_domctl *, struct domain *d,
>                          XEN_GUEST_HANDLE_PARAM(xen_domctl_t));
>  #endif
>  
> -int iommu_do_domctl(struct xen_domctl *, struct domain *d,
> -                    XEN_GUEST_HANDLE_PARAM(xen_domctl_t));
> -
>  void iommu_dev_iotlb_flush_timeout(struct domain *d, struct pci_dev *pdev);
>  
>  /*
> -- 
> 2.34.1
> 

