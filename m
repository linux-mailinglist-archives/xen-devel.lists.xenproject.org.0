Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBCF1B23AC
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 12:21:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQq1l-0006mH-H7; Tue, 21 Apr 2020 10:21:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OiHr=6F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jQq1j-0006mC-UR
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 10:21:15 +0000
X-Inumbo-ID: d463a788-83b9-11ea-9123-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d463a788-83b9-11ea-9123-12813bfff9fa;
 Tue, 21 Apr 2020 10:21:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 36466ABAD;
 Tue, 21 Apr 2020 10:21:12 +0000 (UTC)
Subject: Re: [PATCH v10 1/3] x86/tlb: introduce a flush HVM ASIDs flag
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200416135909.16155-1-roger.pau@citrix.com>
 <20200416135909.16155-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <80288e76-aff6-61d5-71aa-ae7c8e9d9a65@suse.com>
Date: Tue, 21 Apr 2020 12:21:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200416135909.16155-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: xen-devel@lists.xenproject.org, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16.04.2020 15:59, Roger Pau Monne wrote:
> Introduce a specific flag to request a HVM guest linear TLB flush,
> which is an ASID/VPID tickle that forces a guest linear to guest
> physical TLB flush for all HVM guests.
> 
> This was previously unconditionally done in each pre_flush call, but
> that's not required: HVM guests not using shadow don't require linear
> TLB flushes as Xen doesn't modify the guest page tables in that case
> (ie: when using HAP).

I'm afraid I'm being confused by this: Even in shadow mode Xen
doesn't modify guest page tables, does it?

> @@ -254,3 +257,14 @@ unsigned int flush_area_local(const void *va, unsigned int flags)
>  
>      return flags;
>  }
> +
> +void guest_flush_tlb_mask(const struct domain *d, const cpumask_t *mask)
> +{
> +    unsigned int flags = (is_pv_domain(d) || paging_mode_shadow(d) ? FLUSH_TLB
> +                                                                   : 0) |
> +                         (is_hvm_domain(d) && cpu_has_svm ? FLUSH_HVM_ASID_CORE
> +                                                          : 0);

Why the is_pv_domain() part of the condition? Afaict for PV
domains you can get here only if they have shadow mode enabled.

> --- a/xen/arch/x86/mm/shadow/private.h
> +++ b/xen/arch/x86/mm/shadow/private.h
> @@ -818,6 +818,12 @@ static inline int sh_check_page_has_no_refs(struct page_info *page)
>  bool shadow_flush_tlb(bool (*flush_vcpu)(void *ctxt, struct vcpu *v),
>                        void *ctxt);
>  
> +static inline void sh_flush_local(const struct domain *d)
> +{
> +    flush_local(FLUSH_TLB |
> +                (is_hvm_domain(d) && cpu_has_svm ? FLUSH_HVM_ASID_CORE : 0));
> +}

I think the right side of | wants folding with its counterpart in
guest_flush_tlb_mask(). Doing so would avoid guest_flush_tlb_mask()
getting updated but this one forgotten. Perhaps split out
guest_flush_tlb_flags() from guest_flush_tlb_mask()?

I also think this function should move into multi.c as long as it's
needed only there.

Jan

