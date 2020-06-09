Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEC71F491D
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 23:51:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jim8w-0007Sg-EA; Tue, 09 Jun 2020 21:50:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aF9f=7W=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jim8v-0007Sb-6n
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 21:50:49 +0000
X-Inumbo-ID: 4774ddd4-aa9b-11ea-b7bb-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4774ddd4-aa9b-11ea-b7bb-bc764e2007e4;
 Tue, 09 Jun 2020 21:50:48 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AA98B206D5;
 Tue,  9 Jun 2020 21:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591739448;
 bh=n8q6RBqf99l7e7L1EOCdjDHHs3POGMUOsceVpb6TqsY=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=lVBxOO94oJCocVzgGYmxBV/gu6l2FaYei13cIzYMryQHWhbZi9YaLr7cUz1MLaG/w
 0bRbjImP1w5xBQtTIIuvOMS2PPZMzHArb4ACkNEFsb07qxEhJdHgvYjszfQY3Gfyp9
 iAYY4qIeIYOHSZ7he94+zdY72e7wCdtwCk17qwBM=
Date: Tue, 9 Jun 2020 14:50:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v2 08/11] swiotlb-xen: introduce phys_to_dma/dma_to_phys
 translations
In-Reply-To: <20200609053240.GA3015@infradead.org>
Message-ID: <alpine.DEB.2.21.2006091246350.2815@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2006031506590.6774@sstabellini-ThinkPad-T480s>
 <20200603222247.11681-8-sstabellini@kernel.org>
 <20200608070850.GD15742@infradead.org>
 <alpine.DEB.2.21.2006081558400.2815@sstabellini-ThinkPad-T480s>
 <20200609053240.GA3015@infradead.org>
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
Cc: jgross@suse.com, Stefano Stabellini <sstabellini@kernel.org>,
 konrad.wilk@oracle.com, roman@zededa.com, linux-kernel@vger.kernel.org,
 tamas@tklengyel.com, xen-devel@lists.xenproject.org,
 boris.ostrovsky@oracle.com, Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, 8 Jun 2020, Christoph Hellwig wrote:
> On Mon, Jun 08, 2020 at 04:06:57PM -0700, Stefano Stabellini wrote:
> > I understand what you are suggesting about having something like:
> > 
> >     xen_phys_to_dma(...)
> >     {
> >         phys_addr_t phys = xen_phys_to_bus(dev, paddr)
> >         return phys_to_dma(phys);
> >     }
> > 
> > I thought about it myself. I'll do it.
> 
> "something", yes. Except that I think the bus is a little confusing,
> isn't it?  What is the Xen term for these addresses?

Xen reasons in terms of frame numbers. Xen calls them "dfn" for device
frame number. They were supposed to be called "bfn" but eventually they
settled for a different name when the series was committed.

I could s/bfn/dfn/g to match the terminology, if that helps.


> Also we probably don't need the extra local variable.

Sure


> > But I don't think I understood the comment about XEN_PFN_PHYS.
> 
> There is a comment above xen_phys_to_bus that it avoids using
> XEN_PFN_PHYS because XEN_PFN_PHYS of the phys_addr_t vs dma_addr_t
> mismatch.  But XEN_PFN_PHYS could just use a u64 instead of the
> phys_addr_t and then we could use it.   Especially as XEN_PFN_PHYS
> isn't actually used anywhere except in swiotlb-xen.c.  Or we could
> remove XEN_PFN_PHYS enirely, as it isn't all that useful to start
> with.

I'll remove it.

