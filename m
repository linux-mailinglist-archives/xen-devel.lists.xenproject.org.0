Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F0E1F1328
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 09:04:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiBpg-00083W-Kr; Mon, 08 Jun 2020 07:04:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ohtu=7V=bombadil.srs.infradead.org=batv+c8e86b2099343dd9fc1e+6133+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1jiBpf-00082n-2K
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 07:04:31 +0000
X-Inumbo-ID: 4429b7bc-a956-11ea-96fb-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4429b7bc-a956-11ea-96fb-bc764e2007e4;
 Mon, 08 Jun 2020 07:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=kOgcUHX0zNsLgrzKIZZVZ5HbxzYUV6u6MWDbb+56ot4=; b=K6P/0nS7ZwAPQ6b6LI1ZuIGzyy
 ZsIOCpn8sIKiwGcRm/viCmJMlJo1qAUGgZGwQiu6PxEL0xZYhDh1APKzKZmtiFiyds86D/Jy++Q2J
 obCYjtQP8fFufQa0NW/FUBuBr3eplMnoM1YyDMB+VqppJJ1pxfKZDFUc9V0Ma4EfL2d64Ok5cSzLv
 ymfhxvD2A20eHhIay4/PnULLqqE3bh19DaICVqjssKuxl4nIN0T2TBnA9p+u+TRd1jQoNtzOmbmOD
 o2F1k1ZEvu/MlL9t7pjju9m0J/YJoZBe5fIonIAs2eTO+qHFoWilwSzMI/oWm6SCU77ywPLyTbth7
 +jNXKQNg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jiBpL-0000kv-Rr; Mon, 08 Jun 2020 07:04:11 +0000
Date: Mon, 8 Jun 2020 00:04:11 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 01/11] swiotlb-xen: use vmalloc_to_page on vmalloc
 virt addresses
Message-ID: <20200608070411.GA15742@infradead.org>
References: <alpine.DEB.2.21.2006031506590.6774@sstabellini-ThinkPad-T480s>
 <20200603222247.11681-1-sstabellini@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200603222247.11681-1-sstabellini@kernel.org>
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

Well, this isn't just RPi4, but basically any ARM or ARM64 system
with non-coherent DMA (which is most of them).

> +	struct page *pg;

Please spell out page.

>  
>  	if (hwdev && hwdev->coherent_dma_mask)
>  		dma_mask = hwdev->coherent_dma_mask;
> @@ -346,9 +347,11 @@ xen_swiotlb_free_coherent(struct device *hwdev, size_t size, void *vaddr,
>  	/* Convert the size to actually allocated. */
>  	size = 1UL << (order + XEN_PAGE_SHIFT);
>  
> +	pg = is_vmalloc_addr(vaddr) ? vmalloc_to_page(vaddr) :
> +				      virt_to_page(vaddr);

Please use plain old if/else to make this more readable.

