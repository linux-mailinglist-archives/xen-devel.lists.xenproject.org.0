Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1CE1E804A
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 16:34:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeg4r-0008G8-Ta; Fri, 29 May 2020 14:33:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tJvr=7L=xen.org=roger@srs-us1.protection.inumbo.net>)
 id 1jeg4r-0008G3-7w
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 14:33:41 +0000
X-Inumbo-ID: 63c35c30-a1b9-11ea-a8c9-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 63c35c30-a1b9-11ea-a8c9-12813bfff9fa;
 Fri, 29 May 2020 14:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1dEu+DjDhOpoOSVMFjfq8dVN3zMfViUk4+4rbcwdu4Y=; b=sWRWxXI9bYXavpsZz1d7nLS3uo
 2EAjy3m7oQrezhe2kSj64KvnTP8f3us1U/hsuNrc51PhzAo9wEb3ukKaEghKi9r4aFRhnv278D2+p
 DoTlOZEKFp8oVu48w2bJpOwJws5SBSFlFEffiZZlVt7my1TgtFuKBthIqZaeHufpgSyg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xen.org>)
 id 1jeg4p-0006m5-VD; Fri, 29 May 2020 14:33:39 +0000
Received: from [212.230.157.105] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <roger@xen.org>)
 id 1jeg4p-0003ao-CA; Fri, 29 May 2020 14:33:39 +0000
Date: Fri, 29 May 2020 16:33:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xen.org>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: Re: [PATCH] x86/svm: do not try to handle recalc NPT faults
 immediately
Message-ID: <20200529143331.GO1195@Air-de-Roger>
References: <1590712553-7298-1-git-send-email-igor.druzhinin@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1590712553-7298-1-git-send-email-igor.druzhinin@citrix.com>
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
Cc: xen-devel@lists.xenproject.org, george.dunlap@citrix.com, wl@xen.org,
 jbeulich@suse.com, andrew.cooper3@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 29, 2020 at 01:35:53AM +0100, Igor Druzhinin wrote:
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

That seems like a good approach IMO.

Do you know whether this will make the code slower? (since there are
cases previously handled in a single vmexit that would take two
vmexits now)

> This covers a specific case of migration with vGPU assigned on AMD:
> global log-dirty is enabled and causes immediate recalculation NPT
> fault in MMIO area upon access.
> 
> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> This is a safer alternative to:
> https://lists.xenproject.org/archives/html/xen-devel/2020-05/msg01662.html
> and more correct approach from my PoV.
> ---
>  xen/arch/x86/hvm/svm/svm.c | 5 +++--
>  xen/arch/x86/mm/p2m-pt.c   | 8 ++++++--
>  2 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> index 46a1aac..7f6f578 100644
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
>          {
>              printk(XENLOG_G_ERR
>                     "%pv: Error %d handling NPF (gpa=%08lx ec=%04lx)\n",
> diff --git a/xen/arch/x86/mm/p2m-pt.c b/xen/arch/x86/mm/p2m-pt.c
> index 5c05017..377565b 100644
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

Nit: you can use the elvis operator here: return err ?: rc;

Also I couldn't spot any caller that would have troubles with the
function now returning 1 in certain conditions, can you confirm the
callers have been audited?

Thanks, Roger.

