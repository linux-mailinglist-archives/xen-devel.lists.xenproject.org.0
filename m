Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 858761A47F8
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2020 17:49:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMvtk-0001I4-OR; Fri, 10 Apr 2020 15:48:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GzMl=52=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jMvtj-0001Hz-FM
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2020 15:48:51 +0000
X-Inumbo-ID: c5dffd30-7b42-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c5dffd30-7b42-11ea-b58d-bc764e2007e4;
 Fri, 10 Apr 2020 15:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=MbjZiJT4MsHufnABM9++cHzByJdCSvF0l4Esc+wq8YE=; b=sxRA2SjCj5SwXMktMdh6bBSmo1
 JIMO0bkQJet9MXbjHmUQ6U9z0O1VS0g+Ex5nVqKnL7ZKGCFIRcEB9DaGA3PhLewzqmwD1M5OE/CFd
 sY8p7y8zLzdATtuAuo9iecqOWLI3JmFTs7kNoFtSO6bSIB9FwOYyg+6P/uaSJ8NvRTI4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jMvte-0001DV-DN; Fri, 10 Apr 2020 15:48:46 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jMvte-00032J-3T; Fri, 10 Apr 2020 15:48:46 +0000
Date: Fri, 10 Apr 2020 16:48:43 +0100
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v9 1/3] x86/tlb: introduce a flush HVM ASIDs flag
Message-ID: <20200410154843.ocpl4gpqt5hsifba@debian>
References: <20200406105703.79201-1-roger.pau@citrix.com>
 <20200406105703.79201-2-roger.pau@citrix.com>
 <30062a0c-6587-a16e-2b31-de0dd6bf4c9a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30062a0c-6587-a16e-2b31-de0dd6bf4c9a@suse.com>
User-Agent: NeoMutt/20180716
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Apr 09, 2020 at 01:54:40PM +0200, Jan Beulich wrote:
> On 06.04.2020 12:57, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/mm/hap/hap.c
> > +++ b/xen/arch/x86/mm/hap/hap.c
> > @@ -118,7 +118,7 @@ int hap_track_dirty_vram(struct domain *d,
> >              p2m_change_type_range(d, begin_pfn, begin_pfn + nr,
> >                                    p2m_ram_rw, p2m_ram_logdirty);
> >  
> > -            flush_tlb_mask(d->dirty_cpumask);
> > +            hap_flush_tlb_mask(d->dirty_cpumask);
> >  
> >              memset(dirty_bitmap, 0xff, size); /* consider all pages dirty */
> >          }
> > @@ -205,7 +205,7 @@ static int hap_enable_log_dirty(struct domain *d, bool_t log_global)
> >           * to be read-only, or via hardware-assisted log-dirty.
> >           */
> >          p2m_change_entry_type_global(d, p2m_ram_rw, p2m_ram_logdirty);
> > -        flush_tlb_mask(d->dirty_cpumask);
> > +        hap_flush_tlb_mask(d->dirty_cpumask);
> >      }
> >      return 0;
> >  }
> > @@ -234,7 +234,7 @@ static void hap_clean_dirty_bitmap(struct domain *d)
> >       * be read-only, or via hardware-assisted log-dirty.
> >       */
> >      p2m_change_entry_type_global(d, p2m_ram_rw, p2m_ram_logdirty);
> > -    flush_tlb_mask(d->dirty_cpumask);
> > +    hap_flush_tlb_mask(d->dirty_cpumask);
> >  }
> >  
> >  /************************************************/
> > @@ -798,7 +798,7 @@ hap_write_p2m_entry(struct p2m_domain *p2m, unsigned long gfn, l1_pgentry_t *p,
> >  
> >      safe_write_pte(p, new);
> >      if ( old_flags & _PAGE_PRESENT )
> > -        flush_tlb_mask(d->dirty_cpumask);
> > +        hap_flush_tlb_mask(d->dirty_cpumask);
> >  
> >      paging_unlock(d);
> >  
> 
> Following up on my earlier mail about paging_log_dirty_range(), I'm
> now of the opinion that all of these flushes should go away too. I
> can only assume that they got put where they are when HAP code was
> cloned from the shadow one. These are only p2m operations, and hence
> p2m level TLB flushing is all that's needed here.
> 
> > --- a/xen/arch/x86/mm/hap/nested_hap.c
> > +++ b/xen/arch/x86/mm/hap/nested_hap.c
> > @@ -84,7 +84,7 @@ nestedp2m_write_p2m_entry(struct p2m_domain *p2m, unsigned long gfn,
> >      safe_write_pte(p, new);
> >  
> >      if (old_flags & _PAGE_PRESENT)
> > -        flush_tlb_mask(p2m->dirty_cpumask);
> > +        hap_flush_tlb_mask(p2m->dirty_cpumask);
> 
> Same here then presumably.
> 
> As suggested in my earlier reply, the plain removals of flush
> invocations would probably better be split out into a separate
> patch.
> 
> > --- a/xen/arch/x86/mm/hap/private.h
> > +++ b/xen/arch/x86/mm/hap/private.h
> > @@ -47,4 +47,9 @@ unsigned long hap_p2m_ga_to_gfn_4_levels(struct vcpu *v,
> >      struct p2m_domain *p2m, unsigned long cr3,
> >      paddr_t ga, uint32_t *pfec, unsigned int *page_order);
> >  
> > +static inline void hap_flush_tlb_mask(const cpumask_t *mask)
> > +{
> > +    flush_mask(mask, FLUSH_HVM_ASID_CORE);
> > +}
> 
> With the above introduction of this would then become unnecessary.

I had planned to make the required adjustment(s) and commit v9 today.
But seeing your comment it appears v10 is warranted.

Wei.

> 
> Jan

