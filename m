Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7E91A1FCA
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 13:25:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jM8pa-00040i-H7; Wed, 08 Apr 2020 11:25:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=N8iV=5Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jM8pY-00040c-HI
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 11:25:16 +0000
X-Inumbo-ID: 9e6951d8-798b-11ea-81d0-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9e6951d8-798b-11ea-81d0-12813bfff9fa;
 Wed, 08 Apr 2020 11:25:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 21824AF2C;
 Wed,  8 Apr 2020 11:25:14 +0000 (UTC)
Subject: Re: [PATCH v9 1/3] x86/tlb: introduce a flush HVM ASIDs flag
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200406105703.79201-1-roger.pau@citrix.com>
 <20200406105703.79201-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9c7ec98b-bd2d-4fbf-530a-2164dbbee200@suse.com>
Date: Wed, 8 Apr 2020 13:25:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200406105703.79201-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 06.04.2020 12:57, Roger Pau Monne wrote:
> Introduce a specific flag to request a HVM guest linear TLB flush,
> which is an ASID/VPID tickle that forces a guest linear to guest
> physical TLB flush for all HVM guests.
> 
> This was previously unconditionally done in each pre_flush call, but
> that's not required: HVM guests not using shadow don't require linear
> TLB flushes as Xen doesn't modify the guest page tables in that case
> (ie: when using HAP). Note that shadow paging code already takes care
> of issuing the necessary flushes when the shadow page tables are
> modified.
> 
> In order to keep the previous behavior modify all shadow code TLB
> flushes to also flush the guest linear to physical TLB if the guest is
> HVM. I haven't looked at each specific shadow code TLB flush in order
> to figure out whether it actually requires a guest TLB flush or not,
> so there might be room for improvement in that regard.
> 
> Also perform ASID/VPID flushes when modifying the p2m tables as it's a
> requirement for AMD hardware. Finally keep the flush in
> switch_cr3_cr4, as it's not clear whether code could rely on
> switch_cr3_cr4 also performing a guest linear TLB flush. A following
> patch can remove the ASID/VPID tickle from switch_cr3_cr4 if found to
> not be necessary.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one really minor remark:

> --- a/xen/arch/x86/mm/paging.c
> +++ b/xen/arch/x86/mm/paging.c
> @@ -613,7 +613,8 @@ void paging_log_dirty_range(struct domain *d,
>  
>      p2m_unlock(p2m);
>  
> -    flush_tlb_mask(d->dirty_cpumask);
> +    flush_mask(d->dirty_cpumask, (!hap_enabled(d) ? FLUSH_TLB : 0) |
> +                                 FLUSH_HVM_ASID_CORE);

In cases where one case is assumed to be more likely than the other
putting the more likely one first can be viewed as a mild hint to
the compiler, and hence an extra ! may be warranted in an if() or
a conditional expression. Here, however, I don't think we can
really consider one case more likely than the other, and hence I'd
suggest to avoid the !, flipping the other two expressions
accordingly. I may take the liberty to adjust this while committing
(if I'm to be the one).

Jan

