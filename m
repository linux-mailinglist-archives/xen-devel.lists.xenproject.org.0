Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0682A55D4D
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 02:47:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904526.1312407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqMoV-0003ZD-5t; Fri, 07 Mar 2025 01:47:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904526.1312407; Fri, 07 Mar 2025 01:47:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqMoV-0003XM-3G; Fri, 07 Mar 2025 01:47:47 +0000
Received: by outflank-mailman (input) for mailman id 904526;
 Fri, 07 Mar 2025 01:47:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nrba=V2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tqMoU-0003XG-Ek
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 01:47:46 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 223b3297-faf6-11ef-9898-31a8f345e629;
 Fri, 07 Mar 2025 02:47:32 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0E9905C5B44;
 Fri,  7 Mar 2025 01:45:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DB07C4CEE0;
 Fri,  7 Mar 2025 01:47:29 +0000 (UTC)
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
X-Inumbo-ID: 223b3297-faf6-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741312050;
	bh=GRXPYX/QzIEkqiLL3rrayFFIMnq7YT3TfzKxQgIvKKg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CXb6TdpWIagy33hXzJFrhKE3cXKNnVfx27XxDxE9ipRYYVIVsGBbIbvGgv+pnWUoJ
	 GvPa4u4iUeB8eo4NHM74pK9rPm69oewnd2WcUjUMzNpdxLOnq9JJCNsZfosTBIaCjG
	 LT0yGYg1JMVk/P2DqHQkDhlg50acZJZRqQ63BzDOlAZF2ySMB+NNRt+uStQmHb8hjz
	 fTtLmfBFKla1QXhhkp/Rje8T7ixeidel09gbhBfYFJ24y6q6lViIPG9p6Zt/lkqHX7
	 iQfCxdxLLLDdOZNJjZaRCzG+GtqFQqbaJv1RxmeBh7f/7fJiGaj+6pHfZOztnPShXW
	 uzSDMtLAdDLmQ==
Date: Thu, 6 Mar 2025 17:47:28 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Andryuk <jason.andryuk@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 08/23] xen/arm: dom0less seed xenstore grant table
 entry
In-Reply-To: <20250306220343.203047-9-jason.andryuk@amd.com>
Message-ID: <alpine.DEB.2.22.394.2503061744590.2600338@ubuntu-linux-20-04-desktop>
References: <20250306220343.203047-1-jason.andryuk@amd.com> <20250306220343.203047-9-jason.andryuk@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 6 Mar 2025, Jason Andryuk wrote:
> With a split hardware and control domain, the control domain may still
> want and xenstore access.  Currently this relies on init-dom0less to
> seed the grants.  This is problematic since we don't want hardware
> domain to be able to map the control domain's resources.  Instead have
> the hypervisor see the grant table entry.  The grant is then accessible
> as normal.
> 
> This is also useful with a xenstore stubdom to setup the xenbus page
> much earlier.

Reading the patch, it seems that what is doing is letting the xenstore
domain map the domU's grant table page. Is that correct?

If so, I would suggest to update the commit message as follows:

With split hardware/control/xenstore domains, the xenstore domain may
still want to access other domains' xenstore page. Currently this relies
on init-dom0less to seed the grants from Dom0.  This is problematic
since we don't want the hardware domain to be able to map other domains'
resources without their permission.  Instead have the hypervisor seed
the grant table entry for every dom0less domain.  The grant is then
accessible as normal.


> This works with C xenstored.  OCaml xenstored does not use grants and
> would fail to foreign map the page.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
>  xen/arch/arm/dom0less-build.c |  9 +++++++++
>  xen/common/grant_table.c      | 10 ++++++++++
>  xen/include/xen/grant_table.h |  8 ++++++++
>  3 files changed, 27 insertions(+)
> 
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 068bf99294..f1d5bbb097 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -21,6 +21,8 @@
>  #include <asm/static-memory.h>
>  #include <asm/static-shmem.h>
>  
> +static domid_t __initdata xs_domid = DOMID_INVALID;
> +
>  bool __init is_dom0less_mode(void)
>  {
>      struct bootmodules *mods = &bootinfo.modules;
> @@ -753,6 +755,10 @@ static int __init alloc_xenstore_page(struct domain *d)
>      interface->connection = XENSTORE_RECONNECT;
>      unmap_domain_page(interface);
>  
> +    if ( xs_domid != DOMID_INVALID )
> +        gnttab_seed_entry(d, GNTTAB_RESERVED_XENSTORE, xs_domid,
> +                          gfn_x(gfn), GTF_permit_access);
> +
>      return 0;
>  }
>  
> @@ -1173,6 +1179,9 @@ void __init create_domUs(void)
>          if ( rc )
>              panic("Could not set up domain %s (rc = %d)\n",
>                    dt_node_name(node), rc);
> +
> +        if ( d_cfg.flags & XEN_DOMCTL_CDF_xs_domain )
> +            xs_domid = d->domain_id;
>      }
>  }
>  
> diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
> index 6c77867f8c..ba93cdcbca 100644
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -4346,6 +4346,16 @@ static void gnttab_usage_print(struct domain *rd)
>          printk("no active grant table entries\n");
>  }
>  
> +void gnttab_seed_entry(struct domain *d, int idx, domid_t be_domid,
> +                       uint64_t frame, unsigned int flags)
> +{
> +    struct grant_table *gt = d->grant_table;
> +
> +    shared_entry_v1(gt, idx).flags = flags;
> +    shared_entry_v1(gt, idx).domid = be_domid;
> +    shared_entry_v1(gt, idx).frame = frame;
> +}
> +
>  static void cf_check gnttab_usage_print_all(unsigned char key)
>  {
>      struct domain *d;
> diff --git a/xen/include/xen/grant_table.h b/xen/include/xen/grant_table.h
> index 50edfecfb6..63150fa497 100644
> --- a/xen/include/xen/grant_table.h
> +++ b/xen/include/xen/grant_table.h
> @@ -45,6 +45,10 @@ void grant_table_destroy(
>      struct domain *d);
>  void grant_table_init_vcpu(struct vcpu *v);
>  
> +/* Seed a gnttab entry for Hyperlaunch/dom0less. */
> +void gnttab_seed_entry(struct domain *d, int idx, domid_t be_domid,
> +                       uint64_t frame, unsigned int flags);
> +
>  /*
>   * Check if domain has active grants and log first 10 of them.
>   */
> @@ -85,6 +89,10 @@ static inline void grant_table_destroy(struct domain *d) {}
>  
>  static inline void grant_table_init_vcpu(struct vcpu *v) {}
>  
> +static inline void gnttab_seed_entry(struct domain *d, int idx,
> +                                     domid_t be_domid, uint64_t frame,
> +                                     unsigned int flags) {}
> +
>  static inline void grant_table_warn_active_grants(struct domain *d) {}
>  
>  static inline int gnttab_release_mappings(struct domain *d) { return 0; }
> -- 
> 2.48.1
> 
> 

