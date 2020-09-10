Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDFA26443A
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 12:35:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGJv5-0006nw-8Z; Thu, 10 Sep 2020 10:35:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5vjA=CT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kGJv3-0006nr-J4
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 10:35:09 +0000
X-Inumbo-ID: 5198be34-9dee-419f-95b2-24b5c659b918
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5198be34-9dee-419f-95b2-24b5c659b918;
 Thu, 10 Sep 2020 10:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599734106;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3aQ3yv1Cogk/pURM/2uGLqfvbafcKpBcS41k6jWRAFE=;
 b=NxzGQVS2iysVBZwnyLKfYzI1fJQ5WvIi7UFEPq4iD6uq8OfZ0ldXsveo
 eJoWIJ0399cSM401/nLEf4c9gVoIn58UeQkRUi/W6/sj+BQ0gNkMVMaf8
 5mNbq0GjcBXNN1UIT+PK5xKjH0d7aXmp+mZ3UWUpEgLokz5VbQHhCtxIb s=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Ca4A715GkGiqWJfUowPOrdniPFKLBfrEOR4TyuQDTdOflTZi6I8lWFac8A0WCr6XScgbgQQO3V
 3TeGvzJkNemRnt+tP9JYzt6/SPKeMftg/D+eo5bO/WgZZLBAU8xf1vjgzlAzLv6V+DtSbYe0+z
 FvhqPjNIfzSUMw3ijYLKUoZzwKM42vkT4zxx5d+g2YDF0n8Lb+uRFW7slOyCxC+jLbohdetkQt
 GxL4t3UKLU1o3ytdFTaWC4wdPOJ47WZODGpNH7Cr7ICGGnNA3YNvCa6kiY/OlOgGOacwhGZuxn
 ICs=
X-SBRS: 2.7
X-MesageID: 27358474
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,412,1592884800"; d="scan'208";a="27358474"
Date: Thu, 10 Sep 2020 12:34:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
 <paul@xen.org>
Subject: Re: [PATCH] x86/hvm: don't treat MMIO pages as special ones
 regarding cache attributes
Message-ID: <20200910103455.GV753@Air-de-Roger>
References: <20200909145058.72066-1-roger.pau@citrix.com>
 <c865b08b-b2cc-eb86-0780-34492ffa9187@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <c865b08b-b2cc-eb86-0780-34492ffa9187@suse.com>
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

On Thu, Sep 10, 2020 at 11:27:49AM +0200, Jan Beulich wrote:
> On 09.09.2020 16:50, Roger Pau Monne wrote:
> > MMIO regions below the maximum address on the memory map can have a
> > backing page struct that's shared with dom_io (see x86
> > arch_init_memory and it's usage of share_xen_page_with_guest), and
> > thus also fulfill the is_special_page check because the page has the
> > Xen heap bit set.
> > 
> > This is incorrect for MMIO regions when is_special_page is used by
> > epte_get_entry_emt, as it will force direct MMIO regions mapped into
> > the guest p2m to have the cache attributes set to write-back.
> > 
> > Add an extra check in epte_get_entry_emt in order to detect pages
> > shared with dom_io (ie: MMIO regions) and don't force them to
> > write-back cache type on that case.
> 
> Did you consider the alternative of not marking those pages as Xen
> heap ones? In particular when looking at it from this angle I
> consider it at least odd for non-RAM (or more precisely non-heap)
> pages to get marked this way.

I wasn't sure whether this could cause issues in other places of the
code that would rely on this fact and such change seemed more risky
IMO.

> And I can't currently see anything
> requiring them to be marked as such - them being owned by DomIO is
> all that's needed as it seems.

Should those pages then simply be assigned to dom_io and set the
appropriate flags (PGC_allocated | 1), or should
share_xen_page_with_guest be modified to not set the PGC_xen_heap
flag?

I see that such addition was done in a2b4b8c2041, but I'm afraid I
don't fully understand why share_xen_page_with_guest needs to mark
pages as Xen heap.

Thanks, Roger.

