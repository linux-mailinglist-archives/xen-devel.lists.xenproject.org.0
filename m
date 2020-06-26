Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DFA20AF6B
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 12:09:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jolHF-0000zr-SZ; Fri, 26 Jun 2020 10:08:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Q51=AH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jolHD-0000zm-UI
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 10:08:07 +0000
X-Inumbo-ID: eb0cff34-b794-11ea-8290-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eb0cff34-b794-11ea-8290-12813bfff9fa;
 Fri, 26 Jun 2020 10:08:02 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ktY2q2Gx0g+BeTZoRkAIOFKciZwyBg37LkMpxKT+KwLR0Ct27kV1NX/IzoFVnjNeXu+Huyr6wF
 KP+QIj22db/tLsfs1jUUG1cZwFgenUdoQpudkjgq9+lv8uY7gldkdQCNB7RfHSVQ22YlLO7tqr
 AgpKCfJ08bY7fs+1+IL3Nj73brjsiW3/KHGl1v3P1uP0CrTN9oD0JSAnXQCVCPFjK3wMyGyndz
 +c4LqSsRlOM5IvY09WKBGSZuZXsZRPmjIBW7ZNub1eLQhxsth4Ey2MofxKzTKArdbdcziZK0RW
 K9I=
X-SBRS: 2.7
X-MesageID: 21811658
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,283,1589256000"; d="scan'208";a="21811658"
Date: Fri, 26 Jun 2020 12:07:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH for-4.14 v3] x86/tlb: fix assisted flush usage
Message-ID: <20200626100745.GB735@Air-de-Roger>
References: <20200625113041.81507-1-roger.pau@citrix.com>
 <551387c6-f45d-bf6c-a41e-b0920425db9f@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <551387c6-f45d-bf6c-a41e-b0920425db9f@xen.org>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jun 26, 2020 at 10:38:11AM +0100, Julien Grall wrote:
> Hi Roger,
> 
> Sorry I didn't manage to answer to your question before you sent v3.
> 
> On 25/06/2020 12:30, Roger Pau Monne wrote:
> > diff --git a/xen/include/asm-arm/flushtlb.h b/xen/include/asm-arm/flushtlb.h
> > index ab1aae5c90..7ae0543885 100644
> > --- a/xen/include/asm-arm/flushtlb.h
> > +++ b/xen/include/asm-arm/flushtlb.h
> > @@ -27,6 +27,7 @@ static inline void page_set_tlbflush_timestamp(struct page_info *page)
> >   /* Flush specified CPUs' TLBs */
> >   void flush_tlb_mask(const cpumask_t *mask);
> > +#define flush_tlb_mask_sync flush_tlb_mask
> 
> Dropping the parameter 'sync' from filtered_flush_tlb_mask() is a nice
> improvement, but it unfortunately doesn't fully address my concern.
> 
> After this patch there is exactly one use of flush_tlb_mask() in common code
> (see grant_table.c). But without looking at the x86 code, it is not clear
> why this requires a different flush compare to the two other sites.

It's not dealing with page allocation or page type changes directly,
and hence doesn't need to use an IPI in order to prevent races with
spurious_page_fault.

> IOW, if I want to modify the common code in the future, how do I know which
> flush to call?

Unless you modify one of the specific areas mentioned above (page
allocation or page type changes) you should use flush_tlb_mask.

This is not ideal, and my aim will be to be able to use the assisted
flush everywhere if possible, so I would really like to get rid of the
interrupt disabling done in spurious_page_fault and this model where
x86 relies on blocking interrupts in order to prevent page type
changes or page freeing.

Such change however doesn't feel appropriate for a release freeze
period, and hence went with something smaller that restores the
previous behavior. Another option is to just disable assisted flushes
for the time being and re-enable them when a suitable solution is
found.

Roger.

