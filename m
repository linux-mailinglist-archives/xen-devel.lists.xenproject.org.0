Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC68A8AD08
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 02:52:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.954759.1348734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4r0C-0005gz-3i; Wed, 16 Apr 2025 00:51:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 954759.1348734; Wed, 16 Apr 2025 00:51:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4r0C-0005eU-0h; Wed, 16 Apr 2025 00:51:44 +0000
Received: by outflank-mailman (input) for mailman id 954759;
 Wed, 16 Apr 2025 00:51:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RcVf=XC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u4r0A-0005eI-9P
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 00:51:42 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ecfa20b1-1a5c-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 02:51:26 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BA025A4079A;
 Wed, 16 Apr 2025 00:45:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54596C4CEE7;
 Wed, 16 Apr 2025 00:51:24 +0000 (UTC)
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
X-Inumbo-ID: ecfa20b1-1a5c-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744764685;
	bh=vagw2PVVaBWvACu7BqsQyep+qvn52E7S3xmMg3NAi8M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TWL91K5kJpasnxfMxNdNy8p/3NVBmP+bU05sCENMgvWb3GlRkdxEpdGhQf/hAKgWh
	 FRqOQIZSelHsHwI1ymaciY0kipI8oPV0UoFTl1Zvpennmp8SNjDcZTkeXSphn5fYpc
	 Yl1ZQZGBkqIsIJvawZDCnW/v1sf4UINt7R4ZT3f7kny+ROFx6Z/p/pVFzDPO7hdQhK
	 YZQwL2V/RRpNsKhz5lyoi/M++CqeiJvANvVJGYe+RsuHriZcHP6aZjQGsJhM22jQkP
	 fIeYj4/Gw3Hjd8V2s+sxCSIBLnQznj/42xFUztUxQCPc/O2xNU0VPzREsPUuWzi1Ro
	 uSEWeUkhFZMMA==
Date: Tue, 15 Apr 2025 17:51:22 -0700 (PDT)
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
Subject: Re: [PATCH v4 4/7] xen/arm: dom0less seed xenstore grant table
 entry
In-Reply-To: <20250407194038.83860-5-jason.andryuk@amd.com>
Message-ID: <alpine.DEB.2.22.394.2504151751140.8008@ubuntu-linux-20-04-desktop>
References: <20250407194038.83860-1-jason.andryuk@amd.com> <20250407194038.83860-5-jason.andryuk@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 7 Apr 2025, Jason Andryuk wrote:
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
> Add a define to indicate the late alloc xsentore PFN, to better indicate
> what is being checked.  Use UINT64_MAX instead of ~0ULL as the HVM_PARAM
> field is a uint64_t.  UINT64_MAX is not defined, so add it.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> v4:
> ASSERT gfn against UINT32_MAX and use < to avoid INVALID_GFN on 32bit
> builds
> Stefano gave R-b, but holding off addition because of changes
> Use IS_ENABLED(CONFIG_GRANT_TABLE) instead of wrapper
> Add XENSTORE_PFN_LATE_ALLOC
> Add UINT64_MAX
> 
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
>  xen/arch/arm/dom0less-build.c | 10 +++++++++-
>  xen/common/grant_table.c      | 14 ++++++++++++++
>  xen/include/xen/grant_table.h |  4 ++++
>  xen/include/xen/types.h       |  1 +
>  4 files changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index bb8cc3be43..188ef40b52 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -20,6 +20,8 @@
>  #include <asm/static-memory.h>
>  #include <asm/static-shmem.h>
>  
> +#define XENSTORE_PFN_LATE_ALLOC UINT64_MAX
> +
>  static domid_t __initdata xs_domid = DOMID_INVALID;
>  static bool __initdata need_xenstore;
>  
> @@ -756,7 +758,7 @@ static int __init alloc_xenstore_params(struct kernel_info *kinfo)
>  
>      if ( (kinfo->dom0less_feature & (DOM0LESS_XENSTORE | DOM0LESS_XS_LEGACY))
>                                   == (DOM0LESS_XENSTORE | DOM0LESS_XS_LEGACY) )
> -        d->arch.hvm.params[HVM_PARAM_STORE_PFN] = ~0ULL;
> +        d->arch.hvm.params[HVM_PARAM_STORE_PFN] = XENSTORE_PFN_LATE_ALLOC;
>      else if ( kinfo->dom0less_feature & DOM0LESS_XENSTORE )
>      {
>          rc = alloc_xenstore_page(d);
> @@ -788,6 +790,12 @@ static void __init initialize_domU_xenstore(void)
>          rc = alloc_xenstore_evtchn(d);
>          if ( rc < 0 )
>              panic("%pd: Failed to allocate xenstore_evtchn\n", d);
> +
> +        if ( gfn != XENSTORE_PFN_LATE_ALLOC && IS_ENABLED(CONFIG_GRANT_TABLE) )
> +        {
> +            ASSERT(gfn < UINT32_MAX);
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
> index 50edfecfb6..297d7669e9 100644
> --- a/xen/include/xen/grant_table.h
> +++ b/xen/include/xen/grant_table.h
> @@ -33,6 +33,10 @@
>  
>  struct grant_table;
>  
> +/* Seed a gnttab entry for Hyperlaunch/dom0less. */
> +void gnttab_seed_entry(const struct domain *d, unsigned int idx,
> +                       domid_t be_domid, uint32_t frame);
> +
>  #ifdef CONFIG_GRANT_TABLE
>  
>  extern unsigned int opt_gnttab_max_version;
> diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
> index e8d419b954..73ddccbbd5 100644
> --- a/xen/include/xen/types.h
> +++ b/xen/include/xen/types.h
> @@ -44,6 +44,7 @@ typedef __UINTPTR_TYPE__ uintptr_t;
>  #define UINT8_MAX       (255)
>  #define UINT16_MAX      (65535)
>  #define UINT32_MAX      (4294967295U)
> +#define UINT64_MAX      (18446744073709551615ULL)
>  
>  #define INT_MAX         ((int)(~0U>>1))
>  #define INT_MIN         (-INT_MAX - 1)
> -- 
> 2.49.0
> 

