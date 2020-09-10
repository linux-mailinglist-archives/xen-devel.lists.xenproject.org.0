Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9848B264B3C
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 19:28:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGQM3-0004pQ-Rb; Thu, 10 Sep 2020 17:27:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5vjA=CT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kGQM1-0004pL-Vo
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 17:27:26 +0000
X-Inumbo-ID: 59387a27-771d-42c1-98dc-17378e06e683
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 59387a27-771d-42c1-98dc-17378e06e683;
 Thu, 10 Sep 2020 17:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599758844;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=aYYrBec2mGp0cdPuCj5CtDR+sI8DHqw4Q42H0iahyCM=;
 b=YOJDHffYRSDesfAKVr3QVIBvvU7BNiwol+XPiYcqMQcfeC3yMTfDx8Yx
 eel4usr5V3BZ2JsPSJmc0hEDdvcTyQyVcHuCdWNjfVO+vOnLZOCrIfVJq
 kj6mImNXpEw/6t8s2wMKBHxF9BMuQ/D9158rXfi6AEgsGBlaDnae1Qbes s=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: NufIuovQ/T1RV74Aj2G9/5p3o2ZP5F9+flWvfQOdV78de+/y2JOJohsMv0UsJ/XH5sDY5fos6a
 m5vF6HPvTBsH4KqJyZvzlWa4kRt1N7Q3dVqbgK1QGq623ZbRxcAp/L7WZvcxvFVhjsDh1InzHZ
 X+RjxawJQnqT7vhcRpb1XPewVBVQp47APCDsvack5V+H1f/75gh1Ck9vQGJ57yGrCqYRn6kx+6
 5ui/GKYwm9mNxYh9/FD1VxJq3SMR22fGW4vsOD5PWr8KDdXaaHbklgHHa5UN3zK8sTpUf4DEkJ
 kNE=
X-SBRS: 2.7
X-MesageID: 26555015
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,413,1592884800"; d="scan'208";a="26555015"
Date: Thu, 10 Sep 2020 19:27:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
 <paul@xen.org>
Subject: Re: [PATCH] x86/mm: do not mark IO regions as Xen heap
Message-ID: <20200910172438.GA753@Air-de-Roger>
References: <20200910133514.82155-1-roger.pau@citrix.com>
 <4d6c3e64-c70a-0400-e01f-9244c63ab0df@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d6c3e64-c70a-0400-e01f-9244c63ab0df@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Sep 10, 2020 at 04:41:41PM +0200, Jan Beulich wrote:
> On 10.09.2020 15:35, Roger Pau Monne wrote:
> > arch_init_memory will treat all the gaps on the physical memory map
> > between RAM regions as MMIO and use share_xen_page_with_guest in order
> > to assign them to dom_io. This has the side effect of setting the Xen
> > heap flag on such pages, and thus is_special_page would then return
> > true which is an issue in epte_get_entry_emt because such pages will
> > be forced to use write-back cache attributes.
> > 
> > Fix this by introducing a new helper to assign the MMIO regions to
> > dom_io without setting the Xen heap flag on the pages, so that
> > is_special_page will return false and the pages won't be forced to use
> > write-back cache attributes.
> > 
> > Fixes: 81fd0d3ca4b2cd ('x86/hvm: simplify 'mmio_direct' check in epte_get_entry_emt()')
> > Suggested-by: Jan Beulich <jbeulich@suse.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> albeit I'm inclined to add, while committing, a comment ...
> 
> > --- a/xen/arch/x86/mm.c
> > +++ b/xen/arch/x86/mm.c
> > @@ -271,6 +271,18 @@ static l4_pgentry_t __read_mostly split_l4e;
> >  #define root_pgt_pv_xen_slots ROOT_PAGETABLE_PV_XEN_SLOTS
> >  #endif
> >  
> > +static void __init assign_io_page(struct page_info *page)
> > +{
> > +    set_gpfn_from_mfn(mfn_x(page_to_mfn(page)), INVALID_M2P_ENTRY);
> > +
> > +    /* The incremented type count pins as writable. */
> > +    page->u.inuse.type_info = PGT_writable_page | PGT_validated | 1;
> > +
> > +    page_set_owner(page, dom_io);
> > +
> > +    page->count_info |= PGC_allocated | 1;
> > +}
> 
> ... clarifying its relationship with share_xen_page_with_guest().

Sure, I think the relation is quite vague now, since this is no longer
sharing the page (as it's not added to xenpage_list) but rather
assigning it to dom_io.

In general I feel this is all quite confusing, and would benefit from
having some clear rules about what flags and assigned domains non-RAM
pages have, and how they should be added to the p2m.

Thanks, Roger.

