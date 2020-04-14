Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 259A61A7800
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 12:02:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOIOe-00041f-0y; Tue, 14 Apr 2020 10:02:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=18iO=56=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jOIOc-00041Q-9O
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 10:02:22 +0000
X-Inumbo-ID: 07c3ae9e-7e37-11ea-b58d-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 07c3ae9e-7e37-11ea-b58d-bc764e2007e4;
 Tue, 14 Apr 2020 10:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586858541;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=G5uNYocRpsBr1j5w6I+PIhnuAsXZ72lLaoOpIIGMmhY=;
 b=MDlh+mYa7+t/wZ7yyQloaakloNW2C1GryqoJ+Iug7kj+XwOpnXS87OO0
 RjeWd3m+1cQ2SJeSOhzVnwrm5FbMyndMl/SMkUw7XWi6cAkA9jcnLsSU5
 pmmBrPk/9TP7DF/4QYRBbAZK0Gwsh70f4Z9kTjoMVod8R55LrM5bTGbNO w=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: r1BD1DtuLZf6zdyU9wx4Guc4zHRhHnW8URk32GudgnojCixHMzRBjyH0G/LAuse1rA1/GOLu8D
 KFgira0Q5OaPHwmxqrDjfo43Mb1FoUTsyXrAq3TJBI9hXNzdDRJ9TCCLUWXz3wmDNBXgrW6FGo
 d4HHUdJjy0KY0JZ4zOlwDhUHfFKez2lMYKnzvLYp4olUMmkKHXMbhKYFW80vPgPsTnQ794lSDE
 T/P+dDkmcf4u6+fYYIHfi6SLLdZbOyTTvSuCZog6tUURdOGulxFvnFk+WMhfrZO7EPxQQiG6wT
 4W8=
X-SBRS: 2.7
X-MesageID: 16032707
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,382,1580792400"; d="scan'208";a="16032707"
Date: Tue, 14 Apr 2020 12:02:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v9 1/3] x86/tlb: introduce a flush HVM ASIDs flag
Message-ID: <20200414100213.GH28601@Air-de-Roger>
References: <20200406105703.79201-1-roger.pau@citrix.com>
 <20200406105703.79201-2-roger.pau@citrix.com>
 <30062a0c-6587-a16e-2b31-de0dd6bf4c9a@suse.com>
 <20200414075245.GC28601@Air-de-Roger>
 <92a4ff05-9dcf-1d50-b9b2-bde39c4e3e8d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <92a4ff05-9dcf-1d50-b9b2-bde39c4e3e8d@suse.com>
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

On Tue, Apr 14, 2020 at 11:01:06AM +0200, Jan Beulich wrote:
> On 14.04.2020 09:52, Roger Pau Monné wrote:
> > On Thu, Apr 09, 2020 at 01:54:40PM +0200, Jan Beulich wrote:
> >> On 06.04.2020 12:57, Roger Pau Monne wrote:
> >>> --- a/xen/arch/x86/mm/hap/hap.c
> >>> +++ b/xen/arch/x86/mm/hap/hap.c
> >>> @@ -118,7 +118,7 @@ int hap_track_dirty_vram(struct domain *d,
> >>>              p2m_change_type_range(d, begin_pfn, begin_pfn + nr,
> >>>                                    p2m_ram_rw, p2m_ram_logdirty);
> >>>  
> >>> -            flush_tlb_mask(d->dirty_cpumask);
> >>> +            hap_flush_tlb_mask(d->dirty_cpumask);
> >>>  
> >>>              memset(dirty_bitmap, 0xff, size); /* consider all pages dirty */
> >>>          }
> >>> @@ -205,7 +205,7 @@ static int hap_enable_log_dirty(struct domain *d, bool_t log_global)
> >>>           * to be read-only, or via hardware-assisted log-dirty.
> >>>           */
> >>>          p2m_change_entry_type_global(d, p2m_ram_rw, p2m_ram_logdirty);
> >>> -        flush_tlb_mask(d->dirty_cpumask);
> >>> +        hap_flush_tlb_mask(d->dirty_cpumask);
> >>>      }
> >>>      return 0;
> >>>  }
> >>> @@ -234,7 +234,7 @@ static void hap_clean_dirty_bitmap(struct domain *d)
> >>>       * be read-only, or via hardware-assisted log-dirty.
> >>>       */
> >>>      p2m_change_entry_type_global(d, p2m_ram_rw, p2m_ram_logdirty);
> >>> -    flush_tlb_mask(d->dirty_cpumask);
> >>> +    hap_flush_tlb_mask(d->dirty_cpumask);
> >>>  }
> >>>  
> >>>  /************************************************/
> >>> @@ -798,7 +798,7 @@ hap_write_p2m_entry(struct p2m_domain *p2m, unsigned long gfn, l1_pgentry_t *p,
> >>>  
> >>>      safe_write_pte(p, new);
> >>>      if ( old_flags & _PAGE_PRESENT )
> >>> -        flush_tlb_mask(d->dirty_cpumask);
> >>> +        hap_flush_tlb_mask(d->dirty_cpumask);
> >>>  
> >>>      paging_unlock(d);
> >>>  
> >>
> >> Following up on my earlier mail about paging_log_dirty_range(), I'm
> >> now of the opinion that all of these flushes should go away too. I
> >> can only assume that they got put where they are when HAP code was
> >> cloned from the shadow one. These are only p2m operations, and hence
> >> p2m level TLB flushing is all that's needed here.
> > 
> > IIRC without those ASID flushes NPT won't work correctly, as I think
> > it relies on those flushes when updating the p2m.
> 
> Hmm, yes - at least for this last one (in patch context) I definitely
> agree: NPT's TLB invalidation is quite different from EPT's (and I
> was too focused on the latter when writing the earlier reply).
> Therefore how about keeping hap_flush_tlb_mask() (and its uses), but
> teaching it to do nothing for EPT, while doing an ASID based flush
> for NPT?

I could give that a try. I'm slightly worried that EPT code might rely
on some of those ASID/VPID flushes. It seems like it's trying to do
VPID flushes when needed, but issues could be masked by the ASID/VPID
flushes done by the callers.

> There may then even be the option to have a wider purpose helper,
> dealing with most (all?) of the flushes needed from underneath
> x86/mm/, setting the TLB and HVM_ASID_CORE flags as appropriate. In
> the EPT case the function would still be a no-op (afaict).

That seems nice, we would have to be careful however as reducing the
number of ASID/VPID flushes could uncover issues in the existing code.
I guess you mean something like:

static inline void guest_flush_tlb_mask(const struct domain *d,
                                        const cpumask_t *mask)
{
    flush_mask(mask, (is_pv_domain(d) || shadow_mode_enabled(d) ? FLUSH_TLB
                                                                : 0) |
    		     (is_hvm_domain(d) && cpu_has_svm ? FLUSH_HVM_ASID_CORE
		                                      : 0));
}

I think this should work, but I would rather do it in a separate
patch. I'm also not fully convinced guest_flush_tlb_mask is the best
name, but I couldn't think of anything else more descriptive of the
purpose of the function.

Thanks, Roger.

