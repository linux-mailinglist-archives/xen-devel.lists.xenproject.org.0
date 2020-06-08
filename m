Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FED1F1352
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 09:12:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiBxK-0000zm-3y; Mon, 08 Jun 2020 07:12:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ohtu=7V=bombadil.srs.infradead.org=batv+c8e86b2099343dd9fc1e+6133+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1jiBxI-0000zf-Qe
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 07:12:24 +0000
X-Inumbo-ID: 66b40caa-a957-11ea-9ad7-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 66b40caa-a957-11ea-9ad7-bc764e2007e4;
 Mon, 08 Jun 2020 07:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=emLpIRFKODtAY8nraJqoNKwCIZphU+FBPDM0NtY/3Cg=; b=qKLVusHbJYznuKqC4wYTwNYxiq
 Xb6vUmAIBx0gFjK3PxshUq4aOfkih9+uu++SCVrvyUUF5llRcys6YJGKrp517NSaA1JJZ7bNS+09r
 tXPPUoOVLkozSIBGBOEzhUFUoCkjs9Hg8EpdQGxOKEi4WxCluYOlXDbEJSOUbc6v0ItEHJ/I3jaBs
 Dv89DRKpkXZiuuiTOZHep+TxL8cYs4ex18Xqp94Rx+vbQJpwXr/VaHpkErBL23hnksk3bs5mByiAh
 SgBM5UQujchw6Unrh83lvTzP8E86P7LrQhjrwnpE3ZZd1kHV2+IssHu6Jh2EeGhfooWhxvL/aTlgc
 WenzY0Ng==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jiBxF-0006OS-9X; Mon, 08 Jun 2020 07:12:21 +0000
Date: Mon, 8 Jun 2020 00:12:21 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 10/11] xen/arm: introduce phys/dma translations in
 xen_dma_sync_for_*
Message-ID: <20200608071221.GF15742@infradead.org>
References: <alpine.DEB.2.21.2006031506590.6774@sstabellini-ThinkPad-T480s>
 <20200603222247.11681-10-sstabellini@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200603222247.11681-10-sstabellini@kernel.org>
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
 roman@zededa.com, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 boris.ostrovsky@oracle.com, Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 03, 2020 at 03:22:46PM -0700, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> xen_dma_sync_for_cpu, xen_dma_sync_for_device, xen_arch_need_swiotlb are
> getting called passing dma addresses. On some platforms dma addresses
> could be different from physical addresses. Before doing any operations
> on these addresses we need to convert them back to physical addresses
> using dma_to_phys.
> 
> Add dma_to_phys calls to xen_dma_sync_for_cpu, xen_dma_sync_for_device,
> and xen_arch_need_swiotlb.
> 
> dma_cache_maint is fixed by the next patch.

The calling conventions because really weird now because
xen_dma_sync_for_{device,cpu} already get both a phys_addr_t and
a dma_addr_t.  

> 
> -	if (pfn_valid(PFN_DOWN(handle)))
> +	if (pfn_valid(PFN_DOWN(dma_to_phys(dev, handle))))

But here we translate the dma address to a phys addr

>  		arch_sync_dma_for_cpu(paddr, size, dir);

While this still uses the passed in paddr.  I think the uses of
addresses in this code really needs a major rethink.

