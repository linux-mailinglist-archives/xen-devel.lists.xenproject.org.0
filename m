Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5BD1E8049
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 16:34:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeg5X-0008In-6v; Fri, 29 May 2020 14:34:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jeg5V-0008Ie-TA
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 14:34:21 +0000
X-Inumbo-ID: 7bad2dbc-a1b9-11ea-a8c9-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7bad2dbc-a1b9-11ea-a8c9-12813bfff9fa;
 Fri, 29 May 2020 14:34:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AAE7DB001;
 Fri, 29 May 2020 14:34:19 +0000 (UTC)
Subject: Re: [PATCH] x86/svm: do not try to handle recalc NPT faults
 immediately
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1590712553-7298-1-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bb934c0c-3f0d-df7e-1720-8dbbdbf7691d@suse.com>
Date: Fri, 29 May 2020 16:34:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1590712553-7298-1-git-send-email-igor.druzhinin@citrix.com>
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
Cc: xen-devel@lists.xenproject.org, roger.pau@citrix.com,
 george.dunlap@citrix.com, wl@xen.org, andrew.cooper3@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29.05.2020 02:35, Igor Druzhinin wrote:
> A recalculation NPT fault doesn't always require additional handling
> in hvm_hap_nested_page_fault(), moreover in general case if there is no
> explicit handling done there - the fault is wrongly considered fatal.
> 
> Instead of trying to be opportunistic - use safer approach and handle
> P2M recalculation in a separate NPT fault by attempting to retry after
> making the necessary adjustments. This is aligned with Intel behavior
> where there are separate VMEXITs for recalculation and EPT violations
> (faults) and only faults are handled in hvm_hap_nested_page_fault().
> Do it by also unifying do_recalc return code with Intel implementation
> where returning 1 means P2M was actually changed.
> 
> This covers a specific case of migration with vGPU assigned on AMD:
> global log-dirty is enabled and causes immediate recalculation NPT
> fault in MMIO area upon access.

To be honest, from this last paragraph I still can't really derive
what goes wrong exactly why, before this change.

> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> ---
> This is a safer alternative to:
> https://lists.xenproject.org/archives/html/xen-devel/2020-05/msg01662.html
> and more correct approach from my PoV.

Indeed - I was about to reply there, but then I thought I'd first
look at this patch, in case it was a replacement.

> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -2923,9 +2923,10 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
>              v->arch.hvm.svm.cached_insn_len = vmcb->guest_ins_len & 0xf;
>          rc = vmcb->exitinfo1 & PFEC_page_present
>               ? p2m_pt_handle_deferred_changes(vmcb->exitinfo2) : 0;
> -        if ( rc >= 0 )
> +        if ( rc == 0 )
> +            /* If no recal adjustments were being made - handle this fault */
>              svm_do_nested_pgfault(v, regs, vmcb->exitinfo1, vmcb->exitinfo2);
> -        else
> +        else if ( rc < 0 )

So from going through the code and judging by the comment in
finish_type_change() (which btw you will need to update, to avoid
it becoming stale) the >= here was there just in case, without
there actually being any case where a positive value would be
returned. It that's also the conclusion you've drawn, then I
think it would help mentioning this in the description.

It is also desirable to mention finish_type_change() not being
affected, as already dealing with the > 0 case.

> --- a/xen/arch/x86/mm/p2m-pt.c
> +++ b/xen/arch/x86/mm/p2m-pt.c
> @@ -340,7 +340,7 @@ static int do_recalc(struct p2m_domain *p2m, unsigned long gfn)
>      unsigned long gfn_remainder = gfn;
>      unsigned int level = 4;
>      l1_pgentry_t *pent;
> -    int err = 0;
> +    int err = 0, rc = 0;
>  
>      table = map_domain_page(pagetable_get_mfn(p2m_get_pagetable(p2m)));
>      while ( --level )
> @@ -402,6 +402,8 @@ static int do_recalc(struct p2m_domain *p2m, unsigned long gfn)
>                  clear_recalc(l1, e);
>                  err = p2m->write_p2m_entry(p2m, gfn, pent, e, level + 1);
>                  ASSERT(!err);
> +
> +                rc = 1;
>              }
>          }
>          unmap_domain_page((void *)((unsigned long)pent & PAGE_MASK));
> @@ -448,12 +450,14 @@ static int do_recalc(struct p2m_domain *p2m, unsigned long gfn)
>              clear_recalc(l1, e);
>          err = p2m->write_p2m_entry(p2m, gfn, pent, e, level + 1);
>          ASSERT(!err);
> +
> +        rc = 1;
>      }
>  
>   out:
>      unmap_domain_page(table);
>  
> -    return err;
> +    return err ? err : rc;

Typically we write this as "err ?: rc". I'd like to ask that "rc" also
be renamed, to something like "recalc_done", and then to become bool.

Jan

