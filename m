Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B932E1A794D
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 13:19:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOJb6-0001pD-Go; Tue, 14 Apr 2020 11:19:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=18iO=56=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jOJb5-0001p6-AI
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 11:19:19 +0000
X-Inumbo-ID: c7db885a-7e41-11ea-9e09-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c7db885a-7e41-11ea-9e09-bc764e2007e4;
 Tue, 14 Apr 2020 11:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586863158;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1O7/TP4Hquw+S6YKfNy8yt/djg5QOKDWKw1HD8/6W3o=;
 b=CBctiAoeP+eqCPAL8dnKVH0Ki8nxBm6sYF+DA4wE0f9IHwj5STrc2jI+
 nmBKMwi2PsGy1yFMGi7rdEagGBu06HL/DB6PEtFKUfskbtBkCyTVAh34q
 JiZ6jBH9wN2i7iGDbzKX0V6sTV0orlUqTNpKlFegz3/mAin7xyzNsmNEb 4=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +40fODGd5LLGlF8T3LwGC+yx5zc9gzXOR/bC5nnrk33Lw/y2Q6lpszkGvzRLwfkO4pHUtNh6u5
 /NXFevh9T5F8XbV2ZNMd7MWF4NYyEyJX9HHWiU6Vcsd+9+BrWfLHbfR/jwVSNiAcBnEJSR5fiv
 TICU7yOM6/YpmAWHdgd/HNQkcXuVKzhG+nTW4irDVPZmXX+ayKsJQp3XuuS/fMyFx7xNgB7N1N
 n6zw0RkYnQ/QQdwxA3sctJM+X3NP5VI1AkidEAJPbXZ5/5Hfy6Cl+wqm/bCAG//QlT0Ubw7pm9
 nkk=
X-SBRS: 2.7
X-MesageID: 16305962
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,382,1580792400"; d="scan'208";a="16305962"
Date: Tue, 14 Apr 2020 13:19:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v9 1/3] x86/tlb: introduce a flush HVM ASIDs flag
Message-ID: <20200414111911.GI28601@Air-de-Roger>
References: <20200406105703.79201-1-roger.pau@citrix.com>
 <20200406105703.79201-2-roger.pau@citrix.com>
 <30062a0c-6587-a16e-2b31-de0dd6bf4c9a@suse.com>
 <20200414075245.GC28601@Air-de-Roger>
 <92a4ff05-9dcf-1d50-b9b2-bde39c4e3e8d@suse.com>
 <20200414100213.GH28601@Air-de-Roger>
 <389afe02-1747-1583-e642-6e4025b402aa@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <389afe02-1747-1583-e642-6e4025b402aa@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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

On Tue, Apr 14, 2020 at 12:13:04PM +0200, Jan Beulich wrote:
> On 14.04.2020 12:02, Roger Pau Monné wrote:
> > On Tue, Apr 14, 2020 at 11:01:06AM +0200, Jan Beulich wrote:
> >> On 14.04.2020 09:52, Roger Pau Monné wrote:
> >>> On Thu, Apr 09, 2020 at 01:54:40PM +0200, Jan Beulich wrote:
> >>>> On 06.04.2020 12:57, Roger Pau Monne wrote:
> >>>>> --- a/xen/arch/x86/mm/hap/hap.c
> >>>>> +++ b/xen/arch/x86/mm/hap/hap.c
> >>>>> @@ -118,7 +118,7 @@ int hap_track_dirty_vram(struct domain *d,
> >>>>>              p2m_change_type_range(d, begin_pfn, begin_pfn + nr,
> >>>>>                                    p2m_ram_rw, p2m_ram_logdirty);
> >>>>>  
> >>>>> -            flush_tlb_mask(d->dirty_cpumask);
> >>>>> +            hap_flush_tlb_mask(d->dirty_cpumask);
> >>>>>  
> >>>>>              memset(dirty_bitmap, 0xff, size); /* consider all pages dirty */
> >>>>>          }
> >>>>> @@ -205,7 +205,7 @@ static int hap_enable_log_dirty(struct domain *d, bool_t log_global)
> >>>>>           * to be read-only, or via hardware-assisted log-dirty.
> >>>>>           */
> >>>>>          p2m_change_entry_type_global(d, p2m_ram_rw, p2m_ram_logdirty);
> >>>>> -        flush_tlb_mask(d->dirty_cpumask);
> >>>>> +        hap_flush_tlb_mask(d->dirty_cpumask);
> >>>>>      }
> >>>>>      return 0;
> >>>>>  }
> >>>>> @@ -234,7 +234,7 @@ static void hap_clean_dirty_bitmap(struct domain *d)
> >>>>>       * be read-only, or via hardware-assisted log-dirty.
> >>>>>       */
> >>>>>      p2m_change_entry_type_global(d, p2m_ram_rw, p2m_ram_logdirty);
> >>>>> -    flush_tlb_mask(d->dirty_cpumask);
> >>>>> +    hap_flush_tlb_mask(d->dirty_cpumask);
> >>>>>  }
> >>>>>  
> >>>>>  /************************************************/
> >>>>> @@ -798,7 +798,7 @@ hap_write_p2m_entry(struct p2m_domain *p2m, unsigned long gfn, l1_pgentry_t *p,
> >>>>>  
> >>>>>      safe_write_pte(p, new);
> >>>>>      if ( old_flags & _PAGE_PRESENT )
> >>>>> -        flush_tlb_mask(d->dirty_cpumask);
> >>>>> +        hap_flush_tlb_mask(d->dirty_cpumask);
> >>>>>  
> >>>>>      paging_unlock(d);
> >>>>>  
> >>>>
> >>>> Following up on my earlier mail about paging_log_dirty_range(), I'm
> >>>> now of the opinion that all of these flushes should go away too. I
> >>>> can only assume that they got put where they are when HAP code was
> >>>> cloned from the shadow one. These are only p2m operations, and hence
> >>>> p2m level TLB flushing is all that's needed here.
> >>>
> >>> IIRC without those ASID flushes NPT won't work correctly, as I think
> >>> it relies on those flushes when updating the p2m.
> >>
> >> Hmm, yes - at least for this last one (in patch context) I definitely
> >> agree: NPT's TLB invalidation is quite different from EPT's (and I
> >> was too focused on the latter when writing the earlier reply).
> >> Therefore how about keeping hap_flush_tlb_mask() (and its uses), but
> >> teaching it to do nothing for EPT, while doing an ASID based flush
> >> for NPT?
> > 
> > I could give that a try. I'm slightly worried that EPT code might rely
> > on some of those ASID/VPID flushes. It seems like it's trying to do
> > VPID flushes when needed, but issues could be masked by the ASID/VPID
> > flushes done by the callers.
> 
> I can't seem to find any EPT code doing VPID flushes, and I'd also
> not expect to. There's VMX code doing so, yes. EPT should be fully
> agnostic to guest virtual address space.

I got confused.

> >> There may then even be the option to have a wider purpose helper,
> >> dealing with most (all?) of the flushes needed from underneath
> >> x86/mm/, setting the TLB and HVM_ASID_CORE flags as appropriate. In
> >> the EPT case the function would still be a no-op (afaict).
> > 
> > That seems nice, we would have to be careful however as reducing the
> > number of ASID/VPID flushes could uncover issues in the existing code.
> > I guess you mean something like:
> > 
> > static inline void guest_flush_tlb_mask(const struct domain *d,
> >                                         const cpumask_t *mask)
> > {
> >     flush_mask(mask, (is_pv_domain(d) || shadow_mode_enabled(d) ? FLUSH_TLB
> >                                                                 : 0) |
> >     		     (is_hvm_domain(d) && cpu_has_svm ? FLUSH_HVM_ASID_CORE
> > 		                                      : 0));
> > }
> 
> Almost - is_hvm_domain(d) && cpu_has_svm seems to wide for me. I'd
> rather use hap_enabled() && cpu_has_svm, which effectively means NPT.
> Or am I overlooking a need to do ASID flushes also in shadow mode?

I think so, I've used is_hvm_domain in order to cover for HVM domains
running in shadow mode on AMD hardware, I think those also need the
ASID flushes.

> Also I'd suggest to calculate the flags up front, to avoid calling
> flush_mask() in the first place in case (EPT) neither bit is set.
> 
> > I think this should work, but I would rather do it in a separate
> > patch.
> 
> Yes, just like the originally (wrongly, as you validly say) suggested
> full removal of them, putting this in a separate patch would indeed
> seem better.

Would you like me to resend with the requested fix to
paging_log_dirty_range (ie: drop the FLUSH_TLB and only call
flush_mask for HAP guests running on AMD) then?

Thanks, Roger.

