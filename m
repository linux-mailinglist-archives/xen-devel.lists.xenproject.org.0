Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97608194367
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 16:41:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHUbx-0008IC-Fs; Thu, 26 Mar 2020 15:40:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ColY=5L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jHUbw-0008I6-Gq
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 15:40:00 +0000
X-Inumbo-ID: 0ce49ca8-6f78-11ea-8813-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0ce49ca8-6f78-11ea-8813-12813bfff9fa;
 Thu, 26 Mar 2020 15:39:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8A431ABF6;
 Thu, 26 Mar 2020 15:39:58 +0000 (UTC)
To: julien@xen.org
References: <20200322161418.31606-1-julien@xen.org>
 <20200322161418.31606-6-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b0d29ded-f0e8-013b-de43-22788cd8f599@suse.com>
Date: Thu, 26 Mar 2020 16:39:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200322161418.31606-6-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH 05/17] xen/x86: Remove the non-typesafe
 version of pagetable_* helpers
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.03.2020 17:14, julien@xen.org wrote:
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -952,25 +952,27 @@ int arch_set_info_guest(
>      }
>      else
>      {
> -        unsigned long pfn = pagetable_get_pfn(v->arch.guest_table);
> +        mfn_t mfn = pagetable_get_mfn(v->arch.guest_table);
>          bool fail;
>  
>          if ( !compat )
>          {
> -            fail = xen_pfn_to_cr3(pfn) != c.nat->ctrlreg[3];
> +            fail = mfn_to_cr3(mfn) != c.nat->ctrlreg[3];

The patch, besides a few other comments further down, looks fine
on its own, but I don't think it can be acked without seeing the
effects of the adjustments pending to the patch introducing
mfn_to_cr3() and friends.

> @@ -3116,24 +3116,24 @@ int vcpu_destroy_pagetables(struct vcpu *v)
>  
>      /* Free that page if non-zero */
>      do {
> -        if ( mfn )
> +        if ( !mfn_eq(mfn, _mfn(0)) )

I admit I'm not fully certain either, but at the first glance

        if ( mfn_x(mfn) )

would seem more in line with the original code to me (and then
also elsewhere).

> @@ -3560,19 +3561,18 @@ long do_mmuext_op(
>              if ( unlikely(rc) )
>                  break;
>  
> -            old_mfn = pagetable_get_pfn(curr->arch.guest_table_user);
> +            old_mfn = pagetable_get_mfn(curr->arch.guest_table_user);
>              /*
>               * This is particularly important when getting restarted after the
>               * previous attempt got preempted in the put-old-MFN phase.
>               */
> -            if ( old_mfn == op.arg1.mfn )
> +            if ( mfn_eq(old_mfn, new_mfn) )
>                  break;
>  
> -            if ( op.arg1.mfn != 0 )
> +            if ( !mfn_eq(new_mfn, _mfn(0)) )

At least here I would clearly prefer the old code to be kept.

> @@ -3580,19 +3580,19 @@ long do_mmuext_op(
>                      else if ( rc != -ERESTART )
>                          gdprintk(XENLOG_WARNING,
>                                   "Error %d installing new mfn %" PRI_mfn "\n",
> -                                 rc, op.arg1.mfn);
> +                                 rc, mfn_x(new_mfn));

Here I'm also not sure I see the point of the conversion.

> @@ -2351,11 +2351,11 @@ int sh_safe_not_to_sync(struct vcpu *v, mfn_t gl1mfn)
>      ASSERT(mfn_valid(smfn));
>  #endif
>  
> -    if ( pagetable_get_pfn(v->arch.shadow_table[0]) == mfn_x(smfn)
> +    if ( mfn_eq(pagetable_get_mfn(v->arch.shadow_table[0]), smfn)
>  #if (SHADOW_PAGING_LEVELS == 3)
> -         || pagetable_get_pfn(v->arch.shadow_table[1]) == mfn_x(smfn)
> -         || pagetable_get_pfn(v->arch.shadow_table[2]) == mfn_x(smfn)
> -         || pagetable_get_pfn(v->arch.shadow_table[3]) == mfn_x(smfn)
> +         || mfn_eq(pagetable_get_mfn(v->arch.shadow_table[1]), smfn)
> +         || mfn_eq(pagetable_get_mfn(v->arch.shadow_table[2]), smfn)
> +         || mfn_eq(pagetable_get_mfn(v->arch.shadow_table[3]), smfn)
>  #endif
>          )

While here moving the || to their designated places would make
the code look worse overall, ...

> @@ -3707,7 +3707,7 @@ sh_update_linear_entries(struct vcpu *v)
>  
>      /* Don't try to update the monitor table if it doesn't exist */
>      if ( shadow_mode_external(d)
> -         && pagetable_get_pfn(v->arch.monitor_table) == 0 )
> +         && pagetable_is_null(v->arch.monitor_table) )

... could I talk you into moving the && here to the end of the
previous line, as you're touching this anyway?

Also, seeing there's quite a few conversions to pagetable_is_null()
and also seeing that this patch is quite big - could this
conversion be split out?

> @@ -213,17 +214,17 @@ static inline l4_pgentry_t l4e_from_paddr(paddr_t pa, unsigned int flags)
>  #ifndef __ASSEMBLY__
>  
>  /* Page-table type. */
> -typedef struct { u64 pfn; } pagetable_t;
> -#define pagetable_get_paddr(x)  ((paddr_t)(x).pfn << PAGE_SHIFT)
> +typedef struct { mfn_t mfn; } pagetable_t;
> +#define PAGETABLE_NULL_MFN      _mfn(0)

I'd prefer to get away without this constant.

Jan

