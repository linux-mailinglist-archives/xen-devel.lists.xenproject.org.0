Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C551FC87A
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 10:24:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlTMP-0002AF-2J; Wed, 17 Jun 2020 08:23:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jIsh=76=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jlTMN-0002A8-Pc
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 08:23:51 +0000
X-Inumbo-ID: df7280ea-b073-11ea-b9a7-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id df7280ea-b073-11ea-b9a7-12813bfff9fa;
 Wed, 17 Jun 2020 08:23:51 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Yf04g/K2zQAYOiVFaYAWop5x5T9/Z1/Nc2LsWVgFWbfIeKdAYXwSJfdO0m13ailsvE3Rh4R8fN
 r7F2DZwY8Z/ym37F4zvK7t7V7X1dihwq4vuZs/7QGxxO5k3VdMA8zxr4bRwhKBwNprmFT7CfRM
 Oh1vdPfdwh5jfAcvNFSAvrLb7LUmwiq8IIFTsai/eyHbv8Q6KcBbXug4gmVEI5M8XxFXanYT5T
 z8DwkSbz9CYhC/+x4PcDMzJWZWFLgtZS5hIM7JNBMjlFeoAFfvF8+80/B8IciDVjbV+M4oKl6Y
 +Rs=
X-SBRS: 2.7
X-MesageID: 20548223
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,522,1583211600"; d="scan'208";a="20548223"
Date: Wed, 17 Jun 2020 10:23:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Subject: Re: [PATCH for-4.14] x86/hap: use get_gfn_type in
 hap_update_paging_modes
Message-ID: <20200617082340.GV735@Air-de-Roger>
References: <6a2ae3bae4a4ad32bc7caecd8af2655a76a9fb19.1592335579.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <6a2ae3bae4a4ad32bc7caecd8af2655a76a9fb19.1592335579.git.tamas.lengyel@intel.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 16, 2020 at 12:31:06PM -0700, Tamas K Lengyel wrote:
> While forking VMs running a small RTOS systems (Zephyr) a Xen crash has been
> observed due to a mm-lock order violation while copying the HVM CPU context
> from the parent. This issue has been identified to be due to
> hap_update_paging_modes getting a lock on the gfn using get_gfn. This call also
> creates a shared entry in the fork's memory map for the cr3 gfn. The function
> later calls hap_update_cr3 while holding the paging_lock, which results in the
> lock-order violation in vmx_load_pdptrs when it tries to unshare the above entry.
> 
> This issue has not affected VMs running other OS's as a call to vmx_load_pdptrs
> is benign if PAE is not enabled or if EFER_LMA is set and returns before
> trying to unshare and map the page.
> 
> Using get_gfn_type to get a lock on the gfn avoids this problem as we can
> populate the fork's gfn with a copied page instead of a shared entry if its
> needed, thus avoiding the lock order violation while holding paging_lock.
> 
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> ---
> The bug seems to have been present since commit 4cb6c4f4941, only discovered
> now due to the heavy use of mem_sharing with VM forks. As this is a simple
> bug-fix it would be nice to include it in the 4.14 release.

I agree it seems like a candidate bugfix to be included. I've added
Paul to the Cc so he is aware.

> ---
>  xen/arch/x86/mm/hap/hap.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
> index 7f84d0c6ea..9ae4c3ae6e 100644
> --- a/xen/arch/x86/mm/hap/hap.c
> +++ b/xen/arch/x86/mm/hap/hap.c
> @@ -748,12 +748,19 @@ static void hap_update_paging_modes(struct vcpu *v)
>      struct domain *d = v->domain;
>      unsigned long cr3_gfn = v->arch.hvm.guest_cr[3] >> PAGE_SHIFT;
>      p2m_type_t t;
> +    p2m_query_t q = P2M_ALLOC;
>  
> -    /* We hold onto the cr3 as it may be modified later, and
> -     * we need to respect lock ordering. No need for 
> -     * checks here as they are performed by vmx_load_pdptrs
> -     * (the potential user of the cr3) */
> -    (void)get_gfn(d, cr3_gfn, &t);
> +    /*
> +     * We hold onto the cr3 as it may be modified later, and
> +     * we need to respect lock ordering. Unshare here if we have to as to avoid
> +     * a lock-order violation later while we are holding the paging_lock.
> +     * Further checks are performed by vmx_load_pdptrs (the potential user of
> +     * the cr3).
> +     */
> +    if ( hvm_pae_enabled(v) && !hvm_long_mode_active(v) )
> +        q |= P2M_UNSHARE;
> +
> +    (void)get_gfn_type(d, cr3_gfn, &t, q);

While there I think you can drop the cast to void.

In order for this to be more resilient, maybe it would be better to
just use get_gfn_unshare directly and avoid checking what paging mode
the guest is currently using?

Or would that be too expensive in terms of performance for the not
affected case?

I feel like relying on the internals of vmx_load_pdptrs here is
fragile.

Thanks, Roger.

