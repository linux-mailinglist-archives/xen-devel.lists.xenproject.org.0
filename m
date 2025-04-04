Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B511A7B54F
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 03:09:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937702.1338610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0VYu-0006eB-06; Fri, 04 Apr 2025 01:09:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937702.1338610; Fri, 04 Apr 2025 01:09:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0VYt-0006bz-Tb; Fri, 04 Apr 2025 01:09:35 +0000
Received: by outflank-mailman (input) for mailman id 937702;
 Fri, 04 Apr 2025 01:09:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8oGR=WW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u0VYs-0006bt-HR
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 01:09:34 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 775c36b5-10f1-11f0-9eaa-5ba50f476ded;
 Fri, 04 Apr 2025 03:09:33 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C0DF86113B;
 Fri,  4 Apr 2025 01:09:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07FA1C4CEE3;
 Fri,  4 Apr 2025 01:09:29 +0000 (UTC)
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
X-Inumbo-ID: 775c36b5-10f1-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743728971;
	bh=f3IUdbus24FfNz8uOfqVdlG/NWA4NVaQvT2LwoGluzQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aXwZzZxgMInjuOsAUvwDxwGP6ojyH7GvkUEOh69mFqDHdlux2jIqljiFyC4dCT+PH
	 6fFhRlxNsSiBzDvFS3Ti97tZ8MR1PEFKqxGUAOkHZMR+F8hvKTbGdHuA31XAKl/NWt
	 9FC59pUlzfyvvFZ0WiLtmgzOaTxu1LNTi/OpKZD0ene5rO7ZQU1EZoPAEr5F87gg5l
	 sIqe09QRMyCrVFafrcsdqOpA0Ngej71GFkH8XjE4895QrZW9uqt72A6PUKHrkmORTG
	 TGL5GAT5w9t/fw4ZzjvcjsSW9P8IyAGVh+bIkQQsbCmJsA/W1faPb+IBtWgXQ76j32
	 LAlQLK8wPhkvA==
Date: Thu, 3 Apr 2025 18:09:28 -0700 (PDT)
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
Subject: Re: [PATCH v3 4/7] xen/arm: dom0less seed xenstore grant table
 entry
In-Reply-To: <20250403214608.152954-5-jason.andryuk@amd.com>
Message-ID: <alpine.DEB.2.22.394.2504031809200.3529306@ubuntu-linux-20-04-desktop>
References: <20250403214608.152954-1-jason.andryuk@amd.com> <20250403214608.152954-5-jason.andryuk@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 3 Apr 2025, Jason Andryuk wrote:
> xenstored maps other domains' xenstore pages.  Currently this relies on
> init-dom0less or xl to seed the grants from Dom0.  With split
> hardware/control/xenstore domains, this is problematic since we don't
> want the hardware domain to be able to map other domains' resources
> without their permission.  Instead have the hypervisor seed the grant
> table entry for every dom0less domain.  The grant is then accessible as
> normal.
> 
> C xenstored uses grants, so it can map the xenstore pages from a
> non-dom0 xenstore domain.  OCaml xenstored uses foreign mappings, so it
> can only run from a privileged domain (dom0).
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> v3:
> Expand commit message about C vs. OCaml xenstored.
> Remove __init and flags from gnttab_seed_entry()
> Change frame to uint32_t
> ASSERT gfn fits in a uint32_t
> Rebase on mem paging changes
> 
> v2:
> Tweak commit message
> Mark gnttab_seed_entry() __init and put inside CONFIG_DOM0LESS_BOOT
> Add ASSERT(!d->creation_finished) and ASSERT(gt->gt_version == 1);
> const struct domain & struct grant_table
> ---
>  xen/arch/arm/dom0less-build.c |  6 ++++++
>  xen/common/grant_table.c      | 14 ++++++++++++++
>  xen/include/xen/grant_table.h |  7 +++++++
>  3 files changed, 27 insertions(+)
> 
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index bb8cc3be43..284190d54f 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -788,6 +788,12 @@ static void __init initialize_domU_xenstore(void)
>          rc = alloc_xenstore_evtchn(d);
>          if ( rc < 0 )
>              panic("%pd: Failed to allocate xenstore_evtchn\n", d);
> +
> +        if ( gfn != ~0ULL )
> +        {
> +            ASSERT(gfn <= UINT_MAX);
> +            gnttab_seed_entry(d, GNTTAB_RESERVED_XENSTORE, xs_domid, gfn);
> +        }
>      }
>  }
>  
> diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
> index 6c77867f8c..e75ff98aff 100644
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -4346,6 +4346,20 @@ static void gnttab_usage_print(struct domain *rd)
>          printk("no active grant table entries\n");
>  }
>  
> +#ifdef CONFIG_DOM0LESS_BOOT
> +void __init gnttab_seed_entry(const struct domain *d, unsigned int idx,
> +                              domid_t be_domid, uint32_t frame)
> +{
> +    const struct grant_table *gt = d->grant_table;
> +
> +    ASSERT(!d->creation_finished);
> +    ASSERT(gt->gt_version == 1);
> +    shared_entry_v1(gt, idx).flags = GTF_permit_access;
> +    shared_entry_v1(gt, idx).domid = be_domid;
> +    shared_entry_v1(gt, idx).frame = frame;
> +}
> +#endif
> +
>  static void cf_check gnttab_usage_print_all(unsigned char key)
>  {
>      struct domain *d;
> diff --git a/xen/include/xen/grant_table.h b/xen/include/xen/grant_table.h
> index 50edfecfb6..936a52ff10 100644
> --- a/xen/include/xen/grant_table.h
> +++ b/xen/include/xen/grant_table.h
> @@ -45,6 +45,10 @@ void grant_table_destroy(
>      struct domain *d);
>  void grant_table_init_vcpu(struct vcpu *v);
>  
> +/* Seed a gnttab entry for Hyperlaunch/dom0less. */
> +void gnttab_seed_entry(const struct domain *d, unsigned int idx,
> +                       domid_t be_domid, uint32_t frame);
> +
>  /*
>   * Check if domain has active grants and log first 10 of them.
>   */
> @@ -85,6 +89,9 @@ static inline void grant_table_destroy(struct domain *d) {}
>  
>  static inline void grant_table_init_vcpu(struct vcpu *v) {}
>  
> +static inline void gnttab_seed_entry(struct domain *d, int idx,
> +                                     domid_t be_domid, uint32_t frame) {}
> +
>  static inline void grant_table_warn_active_grants(struct domain *d) {}
>  
>  static inline int gnttab_release_mappings(struct domain *d) { return 0; }
> -- 
> 2.49.0
> 

