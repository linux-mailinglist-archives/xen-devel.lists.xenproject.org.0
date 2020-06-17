Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C121FCA48
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 11:58:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlUph-00028f-Rq; Wed, 17 Jun 2020 09:58:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RQSQ=76=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jlUpg-00028a-Ri
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 09:58:12 +0000
X-Inumbo-ID: 0db546c4-b081-11ea-bb8b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0db546c4-b081-11ea-bb8b-bc764e2007e4;
 Wed, 17 Jun 2020 09:58:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0885AACF1;
 Wed, 17 Jun 2020 09:58:14 +0000 (UTC)
Subject: Re: [PATCH for-4.14] x86/hap: use get_gfn_type in
 hap_update_paging_modes
To: Tamas K Lengyel <tamas.lengyel@intel.com>
References: <6a2ae3bae4a4ad32bc7caecd8af2655a76a9fb19.1592335579.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a35d0df9-ca56-1d64-99a0-d2d744ab2186@suse.com>
Date: Wed, 17 Jun 2020 11:58:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <6a2ae3bae4a4ad32bc7caecd8af2655a76a9fb19.1592335579.git.tamas.lengyel@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16.06.2020 21:31, Tamas K Lengyel wrote:
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
> now due to the heavy use of mem_sharing with VM forks.

I'm unconvinced that commit is the origin of the problem. Before that,
get_gfn_unshare() was used, which aiui had/has similar locking
properties. In fact I'm having trouble seeing how this works at all,
i.e. with or without mem-sharing: p2m_get_page_from_gfn() at the very
least uses p2m_read_lock(), which also doesn't nest inside the paging
lock. What am I overlooking?

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

Nit: Please re-flow such that the first line isn't very noticeably
shorter than the later ones.

> +    if ( hvm_pae_enabled(v) && !hvm_long_mode_active(v) )
> +        q |= P2M_UNSHARE;
> +
> +    (void)get_gfn_type(d, cr3_gfn, &t, q);

Imo this then wants to be accompanied by dropping the unsharing
attempt from vmx_load_pdptrs(). By using get_gfn_query_unlocked()
there (assuming all code paths hold the paging lock) the lock
order issue could be addressed in full then. (If taking this
route, the comment ahead of get_gfn_query_unlocked()'s declaration
will want adjusting, to drop mentioning shadow mode explicitly as
leveraging already holding the paging lock.)

If there are code paths of both kinds, which approach to use in
vmx_load_pdptrs() may need to be chosen based on what
paging_locked_by_me() returns. Or perhaps an unlocked query is
fine in either case?

Jan

