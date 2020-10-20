Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 297A8293FCC
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 17:44:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9710.25562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUtob-0002wp-Ug; Tue, 20 Oct 2020 15:44:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9710.25562; Tue, 20 Oct 2020 15:44:45 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUtob-0002wQ-Qs; Tue, 20 Oct 2020 15:44:45 +0000
Received: by outflank-mailman (input) for mailman id 9710;
 Tue, 20 Oct 2020 15:44:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yF9C=D3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kUtoZ-0002wL-IE
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 15:44:43 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cb82a996-8857-4b99-8268-92d7f18a9fd0;
 Tue, 20 Oct 2020 15:44:42 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=yF9C=D3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kUtoZ-0002wL-IE
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 15:44:43 +0000
X-Inumbo-ID: cb82a996-8857-4b99-8268-92d7f18a9fd0
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id cb82a996-8857-4b99-8268-92d7f18a9fd0;
	Tue, 20 Oct 2020 15:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603208682;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=QfxXeBR/5loKw62lVjegBNzmhEv6ZY5V35qXRj3FuNg=;
  b=CdgqPmqgqH3oh3xdfqXYsxDI5/YsrkcWFhqDVJ4eWW2CEaexD7IDlvJM
   l0OTWjiDXhwXDhzn3qMw6z8XAyuQUQu99ZuFLkixSxUPSR4cO+J6JdU2D
   7gRW+kUXCvjpNQnxCqyMD3e+FW5HgNnFy7MkNhcc4H/4CgnswZQISUoOu
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: W3gz1SiEe/rT6/AP9VZUGD/Dr42dHiP5xIRBWoSZYRR/sa9C6ZXygAUA8GGL4qLOXtCaICoeZG
 SWC1+1SpHjHAMA3mNjFjeETiT7vKjLNUEgSG1Qx+PQ88U4EyuLVtdjre0onRHB/1AC5agYMHc+
 7gyJOMYHPDQ/RalylnUDMUjKAtfy88OVEDTrUOeDXdIfkQC7M6hnKkOQnmqhGXnhls/mT/ZxIU
 ZiZyHd41kfNvQ0dFD3vNAux1jGk15Re+u3koldGxrsngvFUU79qjbeKHCQlj0sbLXx+fABj6g3
 JN0=
X-SBRS: None
X-MesageID: 29641765
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,397,1596513600"; 
   d="scan'208";a="29641765"
Subject: Re: [PATCH] x86/pv: Flush TLB in response to paging structure changes
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20201020152405.26892-1-andrew.cooper3@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <03262d2d-7bc2-98a2-3d7f-bc5ab8a69d6b@citrix.com>
Date: Tue, 20 Oct 2020 16:44:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201020152405.26892-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 20/10/2020 16:24, Andrew Cooper wrote:
> With MMU_UPDATE, a PV guest can make changes to higher level pagetables.  This
> is from Xen's point of view (as the update only affects guest mappings), and
> the guest is required to flush suitably after making updates.
>
> However, Xen's use of linear pagetables (UPDATE_VA_MAPPING, GNTTABOP_map,
> writeable pagetables, etc.) is an implementation detail outside of the
> API/ABI.
>
> Changes in the paging structure require invalidations in the linear pagetable
> range for subsequent accesses into the linear pagetables to access non-stale
> mappings.  Xen must provide suitable flushing to prevent intermixed guest
> actions from accidentally accessing/modifying the wrong pagetable.
>
> For all L2 and higher modifications, flush the full TLB.  (This could in
> principle be an order 39 flush starting at LINEAR_PT_VIRT_START, but no such
> mechanism exists in practice.)
>
> As this combines with sync_guest for XPTI L4 "shadowing", replace the
> sync_guest boolean with flush_flags and accumulate flags.  The sync_guest case
> now always needs to flush, there is no point trying to exclude the current CPU
> from the flush mask.  Use pt_owner->dirty_cpumask directly.
>
> This is XSA-286.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
>
> A couple of minor points.
>
>  * PV guests can create global mappings.  I can't reason any safe way to relax
>    FLUSH_TLB_GLOBAL to just FLUSH_TLB.

Sorry - forgot one of the points here.

We could in principle relax the flush entirely if we know that we're
editing from a not-present to present entry, but plumbing this up
through mod_l?_entry() isn't trivial, and its also not not obvious how
much of an optimisation it would be in practice.

~Andrew

>  * Performance tests are still ongoing, but so far is fairing better than the
>    embargoed alternative.
> ---
>  xen/arch/x86/mm.c | 31 +++++++++++++++----------------
>  1 file changed, 15 insertions(+), 16 deletions(-)
>
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index 918ee2bbe3..a6a7fcb56c 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -3883,11 +3883,10 @@ long do_mmu_update(
>      void *va = NULL;
>      unsigned long gpfn, gmfn;
>      struct page_info *page;
> -    unsigned int cmd, i = 0, done = 0, pt_dom;
> +    unsigned int cmd, i = 0, done = 0, pt_dom, flush_flags = 0;
>      struct vcpu *curr = current, *v = curr;
>      struct domain *d = v->domain, *pt_owner = d, *pg_owner;
>      mfn_t map_mfn = INVALID_MFN, mfn;
> -    bool sync_guest = false;
>      uint32_t xsm_needed = 0;
>      uint32_t xsm_checked = 0;
>      int rc = put_old_guest_table(curr);
> @@ -4037,6 +4036,8 @@ long do_mmu_update(
>                          break;
>                      rc = mod_l2_entry(va, l2e_from_intpte(req.val), mfn,
>                                        cmd == MMU_PT_UPDATE_PRESERVE_AD, v);
> +                    if ( !rc )
> +                        flush_flags |= FLUSH_TLB_GLOBAL;
>                      break;
>  
>                  case PGT_l3_page_table:
> @@ -4044,6 +4045,8 @@ long do_mmu_update(
>                          break;
>                      rc = mod_l3_entry(va, l3e_from_intpte(req.val), mfn,
>                                        cmd == MMU_PT_UPDATE_PRESERVE_AD, v);
> +                    if ( !rc )
> +                        flush_flags |= FLUSH_TLB_GLOBAL;
>                      break;
>  
>                  case PGT_l4_page_table:
> @@ -4051,6 +4054,8 @@ long do_mmu_update(
>                          break;
>                      rc = mod_l4_entry(va, l4e_from_intpte(req.val), mfn,
>                                        cmd == MMU_PT_UPDATE_PRESERVE_AD, v);
> +                    if ( !rc )
> +                        flush_flags |= FLUSH_TLB_GLOBAL;
>                      if ( !rc && pt_owner->arch.pv.xpti )
>                      {
>                          bool local_in_use = false;
> @@ -4071,7 +4076,7 @@ long do_mmu_update(
>                               (1 + !!(page->u.inuse.type_info & PGT_pinned) +
>                                mfn_eq(pagetable_get_mfn(curr->arch.guest_table_user),
>                                       mfn) + local_in_use) )
> -                            sync_guest = true;
> +                            flush_flags |= FLUSH_ROOT_PGTBL;
>                      }
>                      break;
>  
> @@ -4173,19 +4178,13 @@ long do_mmu_update(
>      if ( va )
>          unmap_domain_page(va);
>  
> -    if ( sync_guest )
> -    {
> -        /*
> -         * Force other vCPU-s of the affected guest to pick up L4 entry
> -         * changes (if any).
> -         */
> -        unsigned int cpu = smp_processor_id();
> -        cpumask_t *mask = per_cpu(scratch_cpumask, cpu);
> -
> -        cpumask_andnot(mask, pt_owner->dirty_cpumask, cpumask_of(cpu));
> -        if ( !cpumask_empty(mask) )
> -            flush_mask(mask, FLUSH_TLB_GLOBAL | FLUSH_ROOT_PGTBL);
> -    }
> +    /*
> +     * Flush TLBs if an L2 or higher was changed (invalidates the structure of
> +     * the linear pagetables), or an L4 in use by other CPUs was made (needs
> +     * to resync the XPTI copy of the table).
> +     */
> +    if ( flush_flags )
> +        flush_mask(pt_owner->dirty_cpumask, flush_flags);
>  
>      perfc_add(num_page_updates, i);
>  


