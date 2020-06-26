Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4AE20B35D
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 16:17:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jopAB-0007GE-KX; Fri, 26 Jun 2020 14:17:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Q51=AH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jopAA-0007G9-6F
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 14:17:06 +0000
X-Inumbo-ID: b5e1c43e-b7b7-11ea-8496-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b5e1c43e-b7b7-11ea-8496-bc764e2007e4;
 Fri, 26 Jun 2020 14:17:05 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: U+C7AUTwewX4QFv6J22n3BMoAsv62KbOnDYUSRmS/h8iZ3xEAK1wUPj+fY/a6hCI8RbebRHvEX
 NnbiEbjxc+cHvaDoy4SsM5tlDLjDYywpnkKc5vHF1nlOvnvaCxOIRAhiVGf7H/LjSmQ7GlTosN
 RKP3jaeC3F8J/tmscjl+VDyFpXxloeiQpPL06MRxUTmKIV6uiXgvKrrQEODqOmwgIBgV7fWSFZ
 cc50W9FuISa9nb2D9/YAg93QmCgmFnt/Eqq+4bjafW8kXYA/GrzA7KF/voL4HDYlrdTzxef3cB
 SXo=
X-SBRS: 2.7
X-MesageID: 21334863
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,283,1589256000"; d="scan'208";a="21334863"
Date: Fri, 26 Jun 2020 16:16:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH for-4.14 v3] x86/tlb: fix assisted flush usage
Message-ID: <20200626141656.GC735@Air-de-Roger>
References: <20200625113041.81507-1-roger.pau@citrix.com>
 <551387c6-f45d-bf6c-a41e-b0920425db9f@xen.org>
 <20200626100745.GB735@Air-de-Roger>
 <5586cae5-8929-0c53-7a35-5dd6116c77c2@suse.com>
 <000b01d64bbc$a7822f30$f6868d90$@xen.org>
 <e8ec0350-af43-70a4-568d-5f19ff93d84b@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e8ec0350-af43-70a4-568d-5f19ff93d84b@xen.org>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 paul@xen.org, 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jun 26, 2020 at 02:58:21PM +0100, Julien Grall wrote:
> On 26/06/2020 14:21, Paul Durrant wrote:
> > > -----Original Message-----
> > > From: Jan Beulich <jbeulich@suse.com>
> > > Sent: 26 June 2020 14:11
> > > To: Roger Pau Monné <roger.pau@citrix.com>; paul@xen.org; Andrew Cooper <andrew.cooper3@citrix.com>
> > > Cc: Julien Grall <julien@xen.org>; xen-devel@lists.xenproject.org; Wei Liu <wl@xen.org>; George Dunlap
> > > <george.dunlap@citrix.com>; Ian Jackson <ian.jackson@eu.citrix.com>; Stefano Stabellini
> > > <sstabellini@kernel.org>; Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> > > Subject: Re: [PATCH for-4.14 v3] x86/tlb: fix assisted flush usage
> > > 
> > > On 26.06.2020 12:07, Roger Pau Monné wrote:
> > > > On Fri, Jun 26, 2020 at 10:38:11AM +0100, Julien Grall wrote:
> > > > > Hi Roger,
> > > > > 
> > > > > Sorry I didn't manage to answer to your question before you sent v3.
> > > > > 
> > > > > On 25/06/2020 12:30, Roger Pau Monne wrote:
> > > > > > diff --git a/xen/include/asm-arm/flushtlb.h b/xen/include/asm-arm/flushtlb.h
> > > > > > index ab1aae5c90..7ae0543885 100644
> > > > > > --- a/xen/include/asm-arm/flushtlb.h
> > > > > > +++ b/xen/include/asm-arm/flushtlb.h
> > > > > > @@ -27,6 +27,7 @@ static inline void page_set_tlbflush_timestamp(struct page_info *page)
> > > > > >    /* Flush specified CPUs' TLBs */
> > > > > >    void flush_tlb_mask(const cpumask_t *mask);
> > > > > > +#define flush_tlb_mask_sync flush_tlb_mask
> > > > > 
> > > > > Dropping the parameter 'sync' from filtered_flush_tlb_mask() is a nice
> > > > > improvement, but it unfortunately doesn't fully address my concern.
> > > > > 
> > > > > After this patch there is exactly one use of flush_tlb_mask() in common code
> > > > > (see grant_table.c). But without looking at the x86 code, it is not clear
> > > > > why this requires a different flush compare to the two other sites.
> > > > 
> > > > It's not dealing with page allocation or page type changes directly,
> > > > and hence doesn't need to use an IPI in order to prevent races with
> > > > spurious_page_fault.
> > > > 
> > > > > IOW, if I want to modify the common code in the future, how do I know which
> > > > > flush to call?
> > > > 
> > > > Unless you modify one of the specific areas mentioned above (page
> > > > allocation or page type changes) you should use flush_tlb_mask.
> > > > 
> > > > This is not ideal, and my aim will be to be able to use the assisted
> > > > flush everywhere if possible, so I would really like to get rid of the
> > > > interrupt disabling done in spurious_page_fault and this model where
> > > > x86 relies on blocking interrupts in order to prevent page type
> > > > changes or page freeing.
> > > > 
> > > > Such change however doesn't feel appropriate for a release freeze
> > > > period, and hence went with something smaller that restores the
> > > > previous behavior. Another option is to just disable assisted flushes
> > > > for the time being and re-enable them when a suitable solution is
> > > > found.
> > > 
> > > As I can understand Julien's concern, maybe this would indeed be
> > > the better approach for now? Andrew, Paul - thoughts?
> > > 
> > 
> > Julien's concern seems to be about long term usage whereas IIUC this patch does fix the issue at hand, so can we put this patch in now on the basis that Roger will do the re-work described after 4.14 (which I think will address Julien's concern)?
> Bear in mind that while this may be properly fixed in the next release, the
> hack will stay forever in Xen 4.14.
> 
> While I understand that disabling assisted flush is going to have a
> performance impact, we also need to make sure the interface make senses.
> 
> From a generic perspective, a TLB flush should have the exact same guarantee
> regardless where we call it in common/. So I would still strongly prefer if
> we have a single helper.
> 
> Is it possible to consider to replace all the flush_tlb_mask() in common
> code by arch_flush_tlb_mask()? On Arm, this would just be a rename. On x86,
> this would be an alias to flush_tlb_mask_sync()?

The TLB flush call in grant_table.c could still use a flush_tlb_mask,
but it will also work fine with a flush_tlb_mask_sync.

I can prepare a patch if that's acceptable, I guess it would be
slightly better than fully disabling assisted flush.

Roger.

