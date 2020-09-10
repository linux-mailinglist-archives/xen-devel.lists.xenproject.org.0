Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 652F226454F
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 13:26:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGKho-00039t-5e; Thu, 10 Sep 2020 11:25:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5vjA=CT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kGKhm-00039o-VF
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 11:25:30 +0000
X-Inumbo-ID: e3665be2-0cd0-4364-b0e3-c6f509437cb6
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e3665be2-0cd0-4364-b0e3-c6f509437cb6;
 Thu, 10 Sep 2020 11:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599737129;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=iOBnIO9+EvKU2Kmvz+govGYFUzjcpBxMpx+sPCXR1Dc=;
 b=FEteppKfsBxiPHwID8LskBbwSet1ZzC03MQmJ7f00kq4D5KBnxOqVI7L
 iTAgmJ+/NuzHLaRsoyXw+h1KYvNOUw5YJ65C2eI/3Su4kEJiMhMXl0yx1
 fB2+QFRcgPyO+RMOXf6+GaCcNzGq5Agn5HprdMF32qmAlmOoCIclvz1t2 c=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 2U51+oD23A6Wy9J6StQvohQGicuB753dJLIeHESU/5gZ4zUIZAFFePCZs5fEgqhSXMDPl9Tx19
 RcMhsZ3mNGN11WzXx4L4K0ZOioRtBvhg/GfNHaubW2MN0u0+SYfHnzJsiYhUd8OmoD/v+TjY8h
 6aYhAhwRR9n8ZZIZ0Bxm9hX56ZQtdtZEPXxUDO68KiUv+9+RK28EVFppU9DJqnrklEvWyiAbAB
 vdL0QQFgSMHfjMZHQnZG3YOY6io43cAARxGNLHZ1FkYCQNJyAC8TVipe78rug8D8kC6xhE1tqS
 fxg=
X-SBRS: 2.7
X-MesageID: 26395028
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,412,1592884800"; d="scan'208";a="26395028"
Date: Thu, 10 Sep 2020 13:25:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <paul@xen.org>
CC: 'Jan Beulich' <jbeulich@suse.com>, <xen-devel@lists.xenproject.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Wei Liu' <wl@xen.org>
Subject: Re: [PATCH] x86/hvm: don't treat MMIO pages as special ones
 regarding cache attributes
Message-ID: <20200910112521.GY753@Air-de-Roger>
References: <20200909145058.72066-1-roger.pau@citrix.com>
 <c865b08b-b2cc-eb86-0780-34492ffa9187@suse.com>
 <20200910103455.GV753@Air-de-Roger>
 <002901d68760$93a6a330$baf3e990$@xen.org>
 <20200910110400.GX753@Air-de-Roger>
 <002a01d68763$79c67690$6d5363b0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <002a01d68763$79c67690$6d5363b0$@xen.org>
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

On Thu, Sep 10, 2020 at 12:13:55PM +0100, Paul Durrant wrote:
> > -----Original Message-----
> > From: Roger Pau Monné <roger.pau@citrix.com>
> > Sent: 10 September 2020 12:06
> > To: paul@xen.org
> > Cc: 'Jan Beulich' <jbeulich@suse.com>; xen-devel@lists.xenproject.org; 'Andrew Cooper'
> > <andrew.cooper3@citrix.com>; 'Wei Liu' <wl@xen.org>
> > Subject: Re: [PATCH] x86/hvm: don't treat MMIO pages as special ones regarding cache attributes
> > 
> > On Thu, Sep 10, 2020 at 11:53:10AM +0100, Paul Durrant wrote:
> > > > -----Original Message-----
> > > > From: Roger Pau Monné <roger.pau@citrix.com>
> > > > Sent: 10 September 2020 11:35
> > > > To: Jan Beulich <jbeulich@suse.com>
> > > > Cc: xen-devel@lists.xenproject.org; Andrew Cooper <andrew.cooper3@citrix.com>; Wei Liu
> > <wl@xen.org>;
> > > > Paul Durrant <paul@xen.org>
> > > > Subject: Re: [PATCH] x86/hvm: don't treat MMIO pages as special ones regarding cache attributes
> > > >
> > > > On Thu, Sep 10, 2020 at 11:27:49AM +0200, Jan Beulich wrote:
> > > > > On 09.09.2020 16:50, Roger Pau Monne wrote:
> > > > > > MMIO regions below the maximum address on the memory map can have a
> > > > > > backing page struct that's shared with dom_io (see x86
> > > > > > arch_init_memory and it's usage of share_xen_page_with_guest), and
> > > > > > thus also fulfill the is_special_page check because the page has the
> > > > > > Xen heap bit set.
> > > > > >
> > > > > > This is incorrect for MMIO regions when is_special_page is used by
> > > > > > epte_get_entry_emt, as it will force direct MMIO regions mapped into
> > > > > > the guest p2m to have the cache attributes set to write-back.
> > > > > >
> > > > > > Add an extra check in epte_get_entry_emt in order to detect pages
> > > > > > shared with dom_io (ie: MMIO regions) and don't force them to
> > > > > > write-back cache type on that case.
> > > > >
> > > > > Did you consider the alternative of not marking those pages as Xen
> > > > > heap ones? In particular when looking at it from this angle I
> > > > > consider it at least odd for non-RAM (or more precisely non-heap)
> > > > > pages to get marked this way.
> > > >
> > > > I wasn't sure whether this could cause issues in other places of the
> > > > code that would rely on this fact and such change seemed more risky
> > > > IMO.
> > > >
> > > > > And I can't currently see anything
> > > > > requiring them to be marked as such - them being owned by DomIO is
> > > > > all that's needed as it seems.
> > > >
> > > > Should those pages then simply be assigned to dom_io and set the
> > > > appropriate flags (PGC_allocated | 1), or should
> > > > share_xen_page_with_guest be modified to not set the PGC_xen_heap
> > > > flag?
> > > >
> > > > I see that such addition was done in a2b4b8c2041, but I'm afraid I
> > > > don't fully understand why share_xen_page_with_guest needs to mark
> > > > pages as Xen heap.
> > > >
> > >
> > > In general they are not marked Xen heap then they will be considered domheap and will go through the
> > normal free-ing path on domain destruction. Of course this doesn't apply for a system domain that
> > never gets destroyed.
> > 
> > Hm, OK, the original commit (a2b4b8c2041) mentions that marking them
> > as Xen heap is done to signal that the virtual address for those is
> > not needed (and not available?).
> > 
> > For the MMIO regions I'm not sure it matters much, since those are not
> > assigned to the domain, but just mapped into it. The MMIO regions are
> > not shared with the domain accessing them, but rather with dom_io.
> > 
> > It's still not clear to me what option would be better: modify
> > share_xen_page_with_guest to not mark pages as Xen heap, or implement
> > something different to assign MMIO pages to dom_io without setting
> > the Xen heap flag.
> 
> Would using map_mmio_regions() work?

If you mean using map_mmio_regions against dom_io, then no, that won't
work because dom_io is not a translated domain so that would be a
noop.

Also I don't think map_mmio_regions takes any reference or changes the
ownership of MMIO pages, so even if it could be used against a
non-translated domain it's likely not what we want.

Thanks, Roger.

