Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A62D61BEC70
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 01:10:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTvpz-0001CT-N1; Wed, 29 Apr 2020 23:09:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hWzR=6N=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jTvpy-0001CO-5U
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 23:09:54 +0000
X-Inumbo-ID: 88ba721a-8a6e-11ea-9887-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 88ba721a-8a6e-11ea-9887-bc764e2007e4;
 Wed, 29 Apr 2020 23:09:53 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 94C52206D9;
 Wed, 29 Apr 2020 23:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588201793;
 bh=ogQClBdgkF4ZlfvC1m+J7l7r216UsRuYxc3VelIEtO4=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Qzp8c+9HNGyyh0YlFav0Ov0171e0EDWkJMhBiZd6/XU8s3aT2c42DUW0ilGsYca1P
 z0W3Mw0Z8U8jTvwAADMvlNDg61hC5t3sAxRlPFsF1Cr3zVgj6GHmfUIeo0/ZXmGlrq
 ZrQEy2Sx6R5atMU6GuHgyhnNlGwIRpTcufiNeNzI=
Date: Wed, 29 Apr 2020 16:09:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 04/12] xen: split alloc_heap_pages in two halves for
 reusability
In-Reply-To: <348994e9-7b32-33fc-0e40-f7e1a6543b92@suse.com>
Message-ID: <alpine.DEB.2.21.2004291609440.28941@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-4-sstabellini@kernel.org>
 <348994e9-7b32-33fc-0e40-f7e1a6543b92@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org,
 Wei Liu <wl@xen.org>, andrew.cooper3@citrix.com,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Volodymyr_Babchuk@epam.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 17 Apr 2020, Jan Beulich wrote:
> On 15.04.2020 03:02, Stefano Stabellini wrote:
> > --- a/xen/common/page_alloc.c
> > +++ b/xen/common/page_alloc.c
> > @@ -911,54 +911,18 @@ static struct page_info *get_free_buddy(unsigned int zone_lo,
> >      }
> >  }
> >  
> > -/* Allocate 2^@order contiguous pages. */
> > -static struct page_info *alloc_heap_pages(
> > -    unsigned int zone_lo, unsigned int zone_hi,
> > -    unsigned int order, unsigned int memflags,
> > -    struct domain *d)
> > +static void __alloc_heap_pages(struct page_info **pgo,
> > +                               unsigned int order,
> > +                               unsigned int memflags,
> > +                               struct domain *d)
> 
> Along the line of Wei's reply, I'd suggest the name to better reflect
> the difference to alloc_heap_pages() itself. Maybe
> alloc_pages_from_buddy() or alloc_buddy_pages()?
> 
> In addition
> - no double leading underscores please
> - instead of the function returning void and taking
>   struct page_info **pgo, why not have it take and return
>   struct page_info *?
> - add a comment about the non-standard locking behavior

I made all these changes

