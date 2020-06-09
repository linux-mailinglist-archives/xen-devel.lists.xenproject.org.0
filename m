Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 587071F338B
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 07:40:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiWzO-000597-KH; Tue, 09 Jun 2020 05:39:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OzdP=7W=bombadil.srs.infradead.org=batv+0efb7c18612ba92a370e+6134+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1jiWzN-000591-Bx
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 05:39:57 +0000
X-Inumbo-ID: a4471d52-aa13-11ea-bca7-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a4471d52-aa13-11ea-bca7-bc764e2007e4;
 Tue, 09 Jun 2020 05:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=9d5I29beiuD8NWd2IsPtQEkt8LGPlWEkqusG+bWe9Kc=; b=g1VsEAhWGLq6aDTVOGdfeDkonX
 y1gSr98rgZ2hcxCxV2zauJeM6hdWqvsFQnaSSQijOhtGEoNVA1aa07WMA42IHEOMq/RDPmo8hSeGi
 pSUOrrie20eynxqznnGZXRmEu1/qMjG58X0vq16YJiVur+7QfzhxYdh5LepnWkJE+y5Q2YhkQtlnN
 f+kBccJFktcR9xtsq7y6zdcC/88HnUpcCFZZumhRWXz6fTNUYIiGw1gf1PjM+9l6RRrNGSXBRyODQ
 Sq35sayJTmQD1/WhSvbwCL5ruGavLLTd3hYDtD9ueSN+BLG5UPao6Wl5u0Sf3OSSe+KU5/xRDXFQi
 YiB520Nw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jiWzF-0006xo-UR; Tue, 09 Jun 2020 05:39:49 +0000
Date: Mon, 8 Jun 2020 22:39:49 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 10/11] xen/arm: introduce phys/dma translations in
 xen_dma_sync_for_*
Message-ID: <20200609053949.GA26473@infradead.org>
References: <alpine.DEB.2.21.2006031506590.6774@sstabellini-ThinkPad-T480s>
 <20200603222247.11681-10-sstabellini@kernel.org>
 <20200608071221.GF15742@infradead.org>
 <alpine.DEB.2.21.2006081614530.2815@sstabellini-ThinkPad-T480s>
 <20200609053802.GB3015@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200609053802.GB3015@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: jgross@suse.com, tamas@tklengyel.com, konrad.wilk@oracle.com,
 roman@zededa.com, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, xen-devel@lists.xenproject.org,
 boris.ostrovsky@oracle.com, Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jun 08, 2020 at 10:38:02PM -0700, Christoph Hellwig wrote:
> On Mon, Jun 08, 2020 at 05:38:28PM -0700, Stefano Stabellini wrote:
> > Yeah, the pfn_valid check is a bit weird by definition because we are
> > using it to understand whether the address belong to us or to another
> > VM. To do the pfn_valid check we need to translate the dma address into
> > something the CPU understands, hence, the dma_to_phys call.
> > 
> > Why can't we use the already-provided paddr? Because paddr has been
> > translated twice:
> > 1) from dma to maybe-foreign phys address (could be ours, or another VM)
> > 2) from maybe-foreign address to local (using our local mapping of the foreign page)
> > 
> > In fact, it would be clearer if we had all three addresses as parameters
> > of xen_dma_sync_for_cpu: the dma address, the maybe-foreign physical
> > address (we tend to call it xenbus address, baddr), the local physical
> > address. Something like:
> 
> I think instead we should move the arch_sync_dma_for_{device,cpu}
> calls from xen_dma_sync_for_{device,cpu} into the callers, as they
> are provided by the generic dma-noncoherent.h and optimized out for
> coherent architectures like x86.  Then the swiotlb-xen.c code only
> need to call dma_cache_maint as the interface (which would have to
> grow a better name), which should then only need a single kind of
> address.

... actually I'd keep the xen_dma_sync_for_{device,cpu} names for the
low-level interface, just move the arch_sync_dma_for_{device,cpu}
calls up.

