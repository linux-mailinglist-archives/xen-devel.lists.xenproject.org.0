Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D67A7199C0A
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 18:47:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJK0q-000407-6B; Tue, 31 Mar 2020 16:45:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=57j9=5Q=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jJK0o-000400-BJ
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 16:45:14 +0000
X-Inumbo-ID: fd3fd651-736e-11ea-ba31-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fd3fd651-736e-11ea-ba31-12813bfff9fa;
 Tue, 31 Mar 2020 16:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585673113;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iwSNoFlusd+ybrSt+z/xqsPpnMj700JZYGghroZg4AU=;
 b=MQmB+G8bfInR57qIbM3zEi0CD3rsyBmBOBuX1OqIv9cStWC8P0hSy/hd
 A7jxRpgFIW9V75m5qVzsMl8DFdJeZFW6cuv8ndsUXJ6pzdFLQG3x8TRwE
 SnVOQ2XeBb141BN1dqGCyREO9+gtiUfx5AqIXbWNYKRap8y89DrxAgebe 8=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: mCPXjFHCdN3klFUdZcxHX+VwE6Vj1d/lCjYtirlYh14uh2vyZYpp668OlP34630Fqz7yothp0J
 m/tD/f30EdPAW4PoQuPyTDMDPl/VxsWQEOo+0L5YRvhvpqNLOrNUw34enEBGCu/MUOh4iyKdY+
 He02cD0VKpD8VlRAhBFyq6qVcoFz77QlXu+SFqX8KEayT8ewhzIMLlfY36rmLkwYTa4DNJSe2r
 rSAGaCkQL+tyfZE2NalFap3gTyWix29cfpwP9hd7NiBAD22LXJHJdOxTKcPCVbQK+49IBbLzuB
 91c=
X-SBRS: 2.7
X-MesageID: 14955694
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,328,1580792400"; d="scan'208";a="14955694"
Date: Tue, 31 Mar 2020 18:45:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v8 1/3] x86/tlb: introduce a flush HVM ASIDs flag
Message-ID: <20200331164500.GT28601@Air-de-Roger>
References: <20200320184240.41769-1-roger.pau@citrix.com>
 <20200320184240.41769-2-roger.pau@citrix.com>
 <ee1587a0-7a6c-a1f9-860e-ea93a05d8462@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <ee1587a0-7a6c-a1f9-860e-ea93a05d8462@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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

On Tue, Mar 31, 2020 at 05:40:59PM +0200, Jan Beulich wrote:
> On 20.03.2020 19:42, Roger Pau Monne wrote:
> > Introduce a specific flag to request a HVM guest linear TLB flush,
> > which is an ASID/VPID tickle that forces a guest linear to guest
> > physical TLB flush for all HVM guests.
> > 
> > This was previously unconditionally done in each pre_flush call, but
> > that's not required: HVM guests not using shadow don't require linear
> > TLB flushes as Xen doesn't modify the guest page tables in that case
> > (ie: when using HAP). Note that shadow paging code already takes care
> > of issuing the necessary flushes when the shadow page tables are
> > modified.
> > 
> > In order to keep the previous behavior modify all shadow code TLB
> > flushes to also flush the guest linear to physical TLB. I haven't
> > looked at each specific shadow code TLB flush in order to figure out
> > whether it actually requires a guest TLB flush or not, so there might
> > be room for improvement in that regard.
> > 
> > Also perform ASID/VPIT flushes when modifying the p2m tables as it's a
> > requirement for AMD hardware. Finally keep the flush in
> > switch_cr3_cr4, as it's not clear whether code could rely on
> > switch_cr3_cr4 also performing a guest linear TLB flush. A following
> > patch can remove the ASID/VPIT tickle from switch_cr3_cr4 if found to
> > not be necessary.
> 
> s/VPIT/VPID/ in this paragraph?

Right, sorry.

> > --- a/xen/arch/x86/mm/hap/hap.c
> > +++ b/xen/arch/x86/mm/hap/hap.c
> > @@ -118,7 +118,7 @@ int hap_track_dirty_vram(struct domain *d,
> >              p2m_change_type_range(d, begin_pfn, begin_pfn + nr,
> >                                    p2m_ram_rw, p2m_ram_logdirty);
> >  
> > -            flush_tlb_mask(d->dirty_cpumask);
> > +            flush_mask(d->dirty_cpumask, FLUSH_TLB | FLUSH_HVM_ASID_CORE);
> >  
> >              memset(dirty_bitmap, 0xff, size); /* consider all pages dirty */
> >          }
> > @@ -205,7 +205,7 @@ static int hap_enable_log_dirty(struct domain *d, bool_t log_global)
> >           * to be read-only, or via hardware-assisted log-dirty.
> >           */
> >          p2m_change_entry_type_global(d, p2m_ram_rw, p2m_ram_logdirty);
> > -        flush_tlb_mask(d->dirty_cpumask);
> > +        flush_mask(d->dirty_cpumask, FLUSH_TLB | FLUSH_HVM_ASID_CORE);
> >      }
> >      return 0;
> >  }
> > @@ -234,7 +234,7 @@ static void hap_clean_dirty_bitmap(struct domain *d)
> >       * be read-only, or via hardware-assisted log-dirty.
> >       */
> >      p2m_change_entry_type_global(d, p2m_ram_rw, p2m_ram_logdirty);
> > -    flush_tlb_mask(d->dirty_cpumask);
> > +    flush_mask(d->dirty_cpumask, FLUSH_TLB | FLUSH_HVM_ASID_CORE);
> >  }
> >  
> >  /************************************************/
> > @@ -798,7 +798,7 @@ hap_write_p2m_entry(struct p2m_domain *p2m, unsigned long gfn, l1_pgentry_t *p,
> >  
> >      safe_write_pte(p, new);
> >      if ( old_flags & _PAGE_PRESENT )
> > -        flush_tlb_mask(d->dirty_cpumask);
> > +        flush_mask(d->dirty_cpumask, FLUSH_TLB | FLUSH_HVM_ASID_CORE);
> 
> For all four - why FLUSH_TLB? Doesn't the flushing here solely care
> about guest translations?

Not on AMD, at least to my understanding, the AMD SDM states:

"If a hypervisor modifies a nested page table by decreasing permission
levels, clearing present bits, or changing address translations and
intends to return to the same ASID, it should use either TLB command
011b or 001b."

It's in section 15.16.1.

This to my understanding implies that on AMD hardware modifications to
the NPT require an ASID flush. I assume that on AMD ASIDs also cache
combined translations, guest linear -> host physical.

In fact without doing such flushes when modifying the nested page
tables XenRT was seeing multiple issues on AMD hardware.

> > --- a/xen/arch/x86/mm/hap/nested_hap.c
> > +++ b/xen/arch/x86/mm/hap/nested_hap.c
> > @@ -84,7 +84,7 @@ nestedp2m_write_p2m_entry(struct p2m_domain *p2m, unsigned long gfn,
> >      safe_write_pte(p, new);
> >  
> >      if (old_flags & _PAGE_PRESENT)
> > -        flush_tlb_mask(p2m->dirty_cpumask);
> > +        flush_mask(p2m->dirty_cpumask, FLUSH_TLB | FLUSH_HVM_ASID_CORE);
> 
> Same here then I guess.
> 
> > --- a/xen/arch/x86/mm/p2m-pt.c
> > +++ b/xen/arch/x86/mm/p2m-pt.c
> > @@ -896,7 +896,8 @@ static void p2m_pt_change_entry_type_global(struct p2m_domain *p2m,
> >      unmap_domain_page(tab);
> >  
> >      if ( changed )
> > -         flush_tlb_mask(p2m->domain->dirty_cpumask);
> > +         flush_mask(p2m->domain->dirty_cpumask,
> > +                    FLUSH_TLB | FLUSH_HVM_ASID_CORE);
> 
> Given that this code is used in shadow mode as well, perhaps
> better to keep it here. Albeit maybe FLUSH_TLB could be dependent
> upon !hap_enabled()?
> 
> > --- a/xen/arch/x86/mm/paging.c
> > +++ b/xen/arch/x86/mm/paging.c
> > @@ -613,7 +613,7 @@ void paging_log_dirty_range(struct domain *d,
> >  
> >      p2m_unlock(p2m);
> >  
> > -    flush_tlb_mask(d->dirty_cpumask);
> > +    flush_mask(d->dirty_cpumask, FLUSH_TLB | FLUSH_HVM_ASID_CORE);
> 
> Same here?

I'm fine with doing further refinements, but I would like to be on the
conservative side and keep such flushes.

> > @@ -993,7 +993,7 @@ static void shadow_blow_tables(struct domain *d)
> >                                 pagetable_get_mfn(v->arch.shadow_table[i]), 0);
> >  
> >      /* Make sure everyone sees the unshadowings */
> > -    flush_tlb_mask(d->dirty_cpumask);
> > +    flush_mask(d->dirty_cpumask, FLUSH_TLB | FLUSH_HVM_ASID_CORE);
> 
> Taking this as example, wouldn't it be more consistent overall if
> paths not being HVM-only would specify FLUSH_HVM_ASID_CORE only
> for HVM domains?

I think there's indeed room for improvement here, as it's likely
possible to drop some of the ASID/VPID flushes. Given that previous to
this patch we would flush ASIDs on every TLB flush I think the current
approach is safe, and as said above further improvements can be done
afterwards.

> Also, seeing the large number of conversions, perhaps have another
> wrapper, e.g. flush_tlb_mask_hvm(), at least for the cases where
> both flags get specified unconditionally?

That's fine for me, if you agree with the proposed naming
(flush_tlb_mask_hvm) I'm happy to introduce the helper.

Thanks, Roger.

