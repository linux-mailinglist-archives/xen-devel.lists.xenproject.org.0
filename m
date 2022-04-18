Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7E5505ED1
	for <lists+xen-devel@lfdr.de>; Mon, 18 Apr 2022 22:04:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307575.522743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngXbw-0003Sz-90; Mon, 18 Apr 2022 20:04:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307575.522743; Mon, 18 Apr 2022 20:04:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngXbw-0003QO-5v; Mon, 18 Apr 2022 20:04:36 +0000
Received: by outflank-mailman (input) for mailman id 307575;
 Mon, 18 Apr 2022 20:04:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hjWk=U4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ngXbv-0003QI-43
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 20:04:35 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3c70b10-bf52-11ec-8fbe-03012f2f19d4;
 Mon, 18 Apr 2022 22:04:33 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2218DB80EC4;
 Mon, 18 Apr 2022 20:04:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44B36C385A7;
 Mon, 18 Apr 2022 20:04:31 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: c3c70b10-bf52-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650312271;
	bh=LAVQiVUq2UceX5cUJmduKFr0nYCl3IkCjZt6Is7HFfo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Mbz5kWV/SyTJwKusKFqk4tNewLSmibDGEkBZq/8wf/9WiihgXummVpsXzMOXv8dHc
	 rFCe7ld8Vxyzm+8/8YlCNiGG53/iORdxSMmQSHjdoODtIRjHEY0Dw3huj69zS/yo1r
	 3hdVkFpoWRV6fz7iTiUPHcD+61wHf5CRW/3tuTNmpxZij8MERAl1HyBd8QVtC+jmpD
	 /Yg5zFGVOK4sMLLna6vAqEhz5dGX+RItPYJexvT/Nn8n2fC8kvoZ2TcByKJdK8zHS0
	 IOyur6sjv3Nwptyib0I78s60dBlZlFmNsuBdwtRDHP1xv30xk6odKjg6M5E5i/yisX
	 MOPCkbcMi9Pkw==
Date: Mon, 18 Apr 2022 13:04:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Rahul Singh <Rahul.Singh@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Christoph Hellwig <hch@lst.de>, xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, 
    Jan Beulich <jbeulich@suse.com>, "jgross@suse.com" <jgross@suse.com>, 
    "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
Subject: Re: xen-swiotlb issue when NVMe driver is enabled in Dom0 on ARM
In-Reply-To: <4BC65913-EB0A-441C-A09C-4175697BDE9D@arm.com>
Message-ID: <alpine.DEB.2.22.394.2204181225340.915916@ubuntu-linux-20-04-desktop>
References: <C82612B1-FED5-4139-9B87-FB33DD81F01A@arm.com> <alpine.DEB.2.22.394.2204131354190.3066615@ubuntu-linux-20-04-desktop> <8C511888-6183-421E-A4C7-B271DAF46696@arm.com> <alpine.DEB.2.22.394.2204141329290.894007@ubuntu-linux-20-04-desktop>
 <20220415063705.GA24262@lst.de> <alpine.DEB.2.22.394.2204150917390.915916@ubuntu-linux-20-04-desktop> <4BC65913-EB0A-441C-A09C-4175697BDE9D@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 17 Apr 2022, Rahul Singh wrote:
> > On 15 Apr 2022, at 6:40 pm, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > On Fri, 15 Apr 2022, Christoph Hellwig wrote:
> >> On Thu, Apr 14, 2022 at 01:39:23PM -0700, Stefano Stabellini wrote:
> >>> OK, now we know that the code path with Xen is correct and it is the
> >>> same code path taken (dma_alloc_direct) as when !CONFIG_XEN and !SMMU.
> >>> That is how it should be.
> >>> 
> >>> I cannot explain why dma_alloc_direct() would fail when called from
> >>> xen_swiotlb_alloc_coherent(), but it would succeed when called from
> >>> dma_alloc_attrs() without Xen.
> >>> 
> >>> I am not aware of any restrictions that xen or swiotlb-xen would
> >>> introduce in that regard. Unless you are just running out of memory
> >>> because dom0_mem too low.
> >> 
> >> The crash is deep down in the page allocator.  Even if memory was low
> >> it should no crash.  So there is some odd interaction between Xen
> >> and the page allocator going on.  I think nvme and dma-direct really
> >> are only the messenger here.
> > 
> > 
> > I cannot think of anything but if that is the case I guess it is more
> > likely related to reserved-memory not properly advertised or ACPI tables
> > not properly populated.
> 
> I am not sure if it is true as we are able to boot with the same reserved memory or
> the same ACPI table populated if we boot without swiotlb-xen dma ops.
> 
> > 
> > 
> > Rahul,
> > 
> > What happens if you boot Linux on Xen with swiotlb-xen disabled?
> 
> Linux boots fine without any issue if we disable swiotlb-xen as mentioned below.

The plot thinkens.

Without swiotlb-xen, Linux boots fine. With swiotlb-xen it crashes.
However, in both cases, the very same memory allocation function is
used: dma_direct_alloc. In one case it works, in the other case it
crashes.  Everything else is the same.

There are a couple of questionable things with dma masks in
xen_swiotlb_alloc_coherent, but they are *after* the call to
xen_alloc_coherent_pages, which is the one that crashes. So they cannot
be the cause of the crash.

Before the call to xen_alloc_coherent_pages, there is only:

  1) flags &= ~(__GFP_DMA | __GFP_HIGHMEM);
  2) size = 1UL << (order + XEN_PAGE_SHIFT);


1) is already done by dma_alloc_attrs, so it is superfluous. I couldn't
explain how 2) could possibly trigger the crash.  XEN_PAGE_SHIFT is
always 12 even on 64K pages kernels. You can try removing 2) from
xen_swiotlb_alloc_coherent, but we are really wandering in the dark
here.

Then there is xen_swiotlb_init() which allocates some memory for
swiotlb-xen at boot. It could lower the total amount of memory
available, but if you disabled swiotlb-xen like I suggested,
xen_swiotlb_init() still should get called and executed anyway at boot
(it is called from arch/arm/xen/mm.c:xen_mm_init). So xen_swiotlb_init()
shouldn't be the one causing problems.

That's it -- there is nothing else in swiotlb-xen that I can think of.

I don't have any good ideas, so I would only suggest to add more printks
and report the results, for instance:


diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 2b385c1b4a99..c81f9dc7e5a0 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -284,6 +284,7 @@ xen_swiotlb_alloc_coherent(struct device *hwdev, size_t size,
 	phys_addr_t phys;
 	dma_addr_t dev_addr;
 
+	printk("DEBUG %s %d size=%lu flags=%x attr=%lx\n",__func__,__LINE__,size,flags,attrs);
 	/*
 	* Ignore region specifiers - the kernel's ideas of
 	* pseudo-phys memory layout has nothing to do with the
@@ -295,6 +296,8 @@ xen_swiotlb_alloc_coherent(struct device *hwdev, size_t size,
 	/* Convert the size to actually allocated. */
 	size = 1UL << (order + XEN_PAGE_SHIFT);
 
+	printk("DEBUG %s %d size=%lu flags=%x attr=%lx\n",__func__,__LINE__,size,flags,attrs);
+
 	/* On ARM this function returns an ioremap'ped virtual address for
 	 * which virt_to_phys doesn't return the corresponding physical
 	 * address. In fact on ARM virt_to_phys only works for kernel direct
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 51bb8fa8eb89..549b2c85999c 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -429,9 +429,11 @@ void *dma_alloc_attrs(struct device *dev, size_t size, dma_addr_t *dma_handle,
 	if (dma_alloc_from_dev_coherent(dev, size, dma_handle, &cpu_addr))
 		return cpu_addr;
 
+	printk("DEBUG %s %d size=%lu flags=%x attr=%lx\n",__func__,__LINE__,size,flags,attrs);
 	/* let the implementation decide on the zone to allocate from: */
 	flag &= ~(__GFP_DMA | __GFP_DMA32 | __GFP_HIGHMEM);
 
+	printk("DEBUG %s %d size=%lu flags=%x attr=%lx\n",__func__,__LINE__,size,flags,attrs);
 	if (dma_alloc_direct(dev, ops))
 		cpu_addr = dma_direct_alloc(dev, size, dma_handle, flag, attrs);
 	else if (ops->alloc)

