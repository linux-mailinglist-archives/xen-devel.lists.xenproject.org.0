Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A561DD80B
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 22:09:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbrUy-0005VQ-Jk; Thu, 21 May 2020 20:09:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RqGm=7D=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jbrUw-0005VI-UB
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 20:08:59 +0000
X-Inumbo-ID: e756c012-9b9e-11ea-ab61-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e756c012-9b9e-11ea-ab61-12813bfff9fa;
 Thu, 21 May 2020 20:08:58 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F3C84207D3;
 Thu, 21 May 2020 20:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590091737;
 bh=vEJTuttOxs4JpAIMsGvnSXLjxqVm1B/URIYI7oYtQbk=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=TRQaadxHYfti3eW2b+FoYOFMPyROpwEIbtKj2CuoXe/gsth2rSYpPkyxC2bCY2ld+
 H7f7yW0zmuCF4wvtXlGgLOeG46DSJIRKkfz3SK4yZfm4ElplcFkB5qoxb2rU/gC/SL
 1ne6kHxu9PzSY7msjlXmfe6JAp5tY2tYcMpikrms=
Date: Thu, 21 May 2020 13:08:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 09/10] xen/arm: introduce phys/dma translations in
 xen_dma_sync_for_*
In-Reply-To: <83c1120f-fe63-dc54-7b82-15a91c748de8@xen.org>
Message-ID: <alpine.DEB.2.21.2005211247461.27502@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2005201628330.27502@sstabellini-ThinkPad-T480s>
 <20200520234520.22563-9-sstabellini@kernel.org>
 <83c1120f-fe63-dc54-7b82-15a91c748de8@xen.org>
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
 konrad.wilk@oracle.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, 21 May 2020, Julien Grall wrote:
> > @@ -97,8 +98,7 @@ bool xen_arch_need_swiotlb(struct device *dev,
> >   			   phys_addr_t phys,
> >   			   dma_addr_t dev_addr)
> >   {
> > -	unsigned int xen_pfn = XEN_PFN_DOWN(phys);
> > -	unsigned int bfn = XEN_PFN_DOWN(dev_addr);
> > +	unsigned int bfn = XEN_PFN_DOWN(dma_to_phys(dev, dev_addr));
> >     	/*
> >   	 * The swiotlb buffer should be used if
> > @@ -115,7 +115,7 @@ bool xen_arch_need_swiotlb(struct device *dev,
> >   	 * require a bounce buffer because the device doesn't support coherent
> >   	 * memory and we are not able to flush the cache.
> >   	 */
> > -	return (!hypercall_cflush && (xen_pfn != bfn) &&
> > +	return (!hypercall_cflush && !pfn_valid(bfn) &&
> 
> I believe this change is incorrect. The bfn is a frame based on Xen page
> granularity (always 4K) while pfn_valid() is expecting a frame based on the
> Kernel page granularity.

Given that kernel granularity >= xen granularity it looks like it would
be safe to use PFN_DOWN instead of XEN_PFN_DOWN:

  unsigned int bfn = PFN_DOWN(dma_to_phys(dev, dev_addr));
  return (!hypercall_cflush && !pfn_valid(bfn) &&

