Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C0A1F491E
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 23:51:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jim94-0007T0-Lj; Tue, 09 Jun 2020 21:50:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aF9f=7W=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jim93-0007Sv-2D
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 21:50:57 +0000
X-Inumbo-ID: 4c410ebe-aa9b-11ea-b7bb-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4c410ebe-aa9b-11ea-b7bb-bc764e2007e4;
 Tue, 09 Jun 2020 21:50:56 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CA7DA206D5;
 Tue,  9 Jun 2020 21:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591739456;
 bh=XTv0AfIhSGBAVmR///EPvXgZuQrSzUx+9M9fNndpuWk=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=FYWiwtT8vtIEdZWsACy6EuABQDJ0EERJh8aI4qNJOssQy+ay6qAz2Fpj54hAfTRYk
 Pqi/iPfoRC8DmBrdNc7Q9R2XGnptCIOoQyHTgvCUxRcDfsz2ZOHMHOmtRMmZehUJLU
 tRk1KzKwczMBaTpRMv5gKpCGKc9zkgacd3vmwPxo=
Date: Tue, 9 Jun 2020 14:50:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v2 10/11] xen/arm: introduce phys/dma translations in
 xen_dma_sync_for_*
In-Reply-To: <20200609053949.GA26473@infradead.org>
Message-ID: <alpine.DEB.2.21.2006091326380.2815@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2006031506590.6774@sstabellini-ThinkPad-T480s>
 <20200603222247.11681-10-sstabellini@kernel.org>
 <20200608071221.GF15742@infradead.org>
 <alpine.DEB.2.21.2006081614530.2815@sstabellini-ThinkPad-T480s>
 <20200609053802.GB3015@infradead.org>
 <20200609053949.GA26473@infradead.org>
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
> On Mon, Jun 08, 2020 at 10:38:02PM -0700, Christoph Hellwig wrote:
> > On Mon, Jun 08, 2020 at 05:38:28PM -0700, Stefano Stabellini wrote:
> > > Yeah, the pfn_valid check is a bit weird by definition because we are
> > > using it to understand whether the address belong to us or to another
> > > VM. To do the pfn_valid check we need to translate the dma address into
> > > something the CPU understands, hence, the dma_to_phys call.
> > > 
> > > Why can't we use the already-provided paddr? Because paddr has been
> > > translated twice:
> > > 1) from dma to maybe-foreign phys address (could be ours, or another VM)
> > > 2) from maybe-foreign address to local (using our local mapping of the foreign page)
> > > 
> > > In fact, it would be clearer if we had all three addresses as parameters
> > > of xen_dma_sync_for_cpu: the dma address, the maybe-foreign physical
> > > address (we tend to call it xenbus address, baddr), the local physical
> > > address. Something like:
> > 
> > I think instead we should move the arch_sync_dma_for_{device,cpu}
> > calls from xen_dma_sync_for_{device,cpu} into the callers, as they
> > are provided by the generic dma-noncoherent.h and optimized out for
> > coherent architectures like x86.  Then the swiotlb-xen.c code only
> > need to call dma_cache_maint as the interface (which would have to
> > grow a better name), which should then only need a single kind of
> > address.
> 
> ... actually I'd keep the xen_dma_sync_for_{device,cpu} names for the
> low-level interface, just move the arch_sync_dma_for_{device,cpu}
> calls up.

I can do that.

