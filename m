Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA56507EFF
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 04:42:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308670.524481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh0Hw-0005mo-3n; Wed, 20 Apr 2022 02:41:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308670.524481; Wed, 20 Apr 2022 02:41:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh0Hv-0005k2-U6; Wed, 20 Apr 2022 02:41:51 +0000
Received: by outflank-mailman (input) for mailman id 308670;
 Wed, 20 Apr 2022 02:41:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HBwa=U6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nh0Cv-0000eu-1W
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 02:36:41 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b43f5801-c052-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 04:36:39 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 01C0F615A4;
 Wed, 20 Apr 2022 02:36:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8762C385A5;
 Wed, 20 Apr 2022 02:36:36 +0000 (UTC)
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
X-Inumbo-ID: b43f5801-c052-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650422197;
	bh=n6fUiwY5cUeV/2+c5RHqtGzf+nZ4s2cGnOrO1GfdEe8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=D0xlD03sW7FW+35G64kb/KoosNEJ2tvPRcy7dG/mcBZqzHccRtpcHctWY+UmHr/Tm
	 O8lLEtro+48WAcOOi2ryfmqk++SPnTYjHzr5xGyLQ+xgIsaSUcLyAv4juStMOV+jZ9
	 g40LFZL1qNqUFMVKiYTrnKzA3+LG+6ydxSXH+m0bgQkAhN/xik4IcXDVX7JXQCEYDI
	 nMhqO70kPicUQPc2N6UiB2TMgA8PXGWWb+hjNw9nZJWD0S5ycE+wmmKCJowk1a+opK
	 axASYlIfgmouow1x2OngjI922JSFIPSwPp5CmOOmYRZAL1+q9XTznhizDPSi2HXbsZ
	 YMo6akpfd628g==
Date: Tue, 19 Apr 2022 19:36:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Rahul Singh <Rahul.Singh@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Christoph Hellwig <hch@lst.de>, xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, 
    Jan Beulich <jbeulich@suse.com>, "jgross@suse.com" <jgross@suse.com>, 
    "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
Subject: Re: xen-swiotlb issue when NVMe driver is enabled in Dom0 on ARM
In-Reply-To: <49E3535A-5672-4047-AF86-05D5597C7019@arm.com>
Message-ID: <alpine.DEB.2.22.394.2204191933450.915916@ubuntu-linux-20-04-desktop>
References: <C82612B1-FED5-4139-9B87-FB33DD81F01A@arm.com> <alpine.DEB.2.22.394.2204131354190.3066615@ubuntu-linux-20-04-desktop> <8C511888-6183-421E-A4C7-B271DAF46696@arm.com> <alpine.DEB.2.22.394.2204141329290.894007@ubuntu-linux-20-04-desktop>
 <20220415063705.GA24262@lst.de> <alpine.DEB.2.22.394.2204150917390.915916@ubuntu-linux-20-04-desktop> <4BC65913-EB0A-441C-A09C-4175697BDE9D@arm.com> <alpine.DEB.2.22.394.2204181225340.915916@ubuntu-linux-20-04-desktop>
 <49E3535A-5672-4047-AF86-05D5597C7019@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

> > Then there is xen_swiotlb_init() which allocates some memory for
> > swiotlb-xen at boot. It could lower the total amount of memory
> > available, but if you disabled swiotlb-xen like I suggested,
> > xen_swiotlb_init() still should get called and executed anyway at boot
> > (it is called from arch/arm/xen/mm.c:xen_mm_init). So xen_swiotlb_init()
> > shouldn't be the one causing problems.
> >
> > That's it -- there is nothing else in swiotlb-xen that I can think of.
> >
> > I don't have any good ideas, so I would only suggest to add more printks
> > and report the results, for instance:
> 
> As suggested I added the more printks but only difference I see is the size apart
> from that everything looks same .
> 
> Please find the attached logs for xen and native linux boot.

One difference is that the order of the allocations is significantly
different after the first 3 allocations. It is very unlikely but
possible that this is an unrelated concurrency bug that only occurs on
Xen. I doubt it.

I think you could try booting native and Xen with only 1 CPU enabled in
both cases.

For native, you can do that with maxcpus, e.g. maxcpus=1.
For Xen, you can do that with dom0_max_vcpus=1. I don't think we need to
reduce the number of pCPUs seen by Xen, but it could be useful to pass
sched=null to avoid any scheduler effects. This is just for debugging of
course.


In reality, the most likely explanation is that the issue is a memory
corruption. Something somewhere is corrupting Linux memory and it just
happens that we see it when calling dma_direct_alloc. This means it is
going to be difficult to find as the only real clue is that it is
swiotlb-xen that is causing it.


I added more printks with the goal of detecting swiotlb-xen code paths
that shouldn't be taken in a normal dom0 boot without domUs. For
instance, range_straddles_page_boundary should always return zero and
the dma_mask check in xen_swiotlb_alloc_coherent should always succeed.

Fingers crossed we'll notice that the wrong path is taken just before
the crash.


diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 2b385c1b4a99..aab45ba4e9ef 100644
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
@@ -315,15 +318,18 @@ xen_swiotlb_alloc_coherent(struct device *hwdev, size_t size,
 	phys = dma_to_phys(hwdev, *dma_handle);
 	dev_addr = xen_phys_to_dma(hwdev, phys);
 	if (((dev_addr + size - 1 <= dma_mask)) &&
-	    !range_straddles_page_boundary(phys, size))
+	    !range_straddles_page_boundary(phys, size)) {
 		*dma_handle = dev_addr;
-	else {
+		printk("DEBUG %s %d phys=%llx dev_addr=%llx\n",__func__,__LINE__,phys,dev_addr);
+	} else {
+		printk("DEBUG %s %d phys=%llx dev_addr=%llx\n",__func__,__LINE__,phys,dev_addr);
 		if (xen_create_contiguous_region(phys, order,
 						 fls64(dma_mask), dma_handle) != 0) {
 			xen_free_coherent_pages(hwdev, size, ret, (dma_addr_t)phys, attrs);
 			return NULL;
 		}
 		*dma_handle = phys_to_dma(hwdev, *dma_handle);
+		printk("DEBUG %s %d phys=%llx dev_addr=%llx\n",__func__,__LINE__,phys,*dma_handle);
 		SetPageXenRemapped(virt_to_page(ret));
 	}
 	memset(ret, 0, size);
@@ -388,8 +394,12 @@ static dma_addr_t xen_swiotlb_map_page(struct device *dev, struct page *page,
 	    !range_straddles_page_boundary(phys, size) &&
 		!xen_arch_need_swiotlb(dev, phys, dev_addr) &&
 		swiotlb_force != SWIOTLB_FORCE)
+	{
+		printk("DEBUG %s %d phys=%llx dev_addr=%llx\n",__func__,__LINE__,phys,dev_addr);
 		goto done;
+	}
 
+	printk("DEBUG %s %d phys=%llx dev_addr=%llx\n",__func__,__LINE__,phys,dev_addr);
 	/*
 	 * Oh well, have to allocate and map a bounce buffer.
 	 */
@@ -413,10 +423,13 @@ static dma_addr_t xen_swiotlb_map_page(struct device *dev, struct page *page,
 
 done:
 	if (!dev_is_dma_coherent(dev) && !(attrs & DMA_ATTR_SKIP_CPU_SYNC)) {
-		if (pfn_valid(PFN_DOWN(dma_to_phys(dev, dev_addr))))
+		if (pfn_valid(PFN_DOWN(dma_to_phys(dev, dev_addr)))) {
+			printk("DEBUG %s %d phys=%llx dev_addr=%llx\n",__func__,__LINE__,phys,dev_addr);
 			arch_sync_dma_for_device(phys, size, dir);
-		else
+		} else {
+			printk("DEBUG %s %d phys=%llx dev_addr=%llx\n",__func__,__LINE__,phys,dev_addr);
 			xen_dma_sync_for_device(dev, dev_addr, size, dir);
+		}
 	}
 	return dev_addr;
 }
@@ -437,15 +450,20 @@ static void xen_swiotlb_unmap_page(struct device *hwdev, dma_addr_t dev_addr,
 	BUG_ON(dir == DMA_NONE);
 
 	if (!dev_is_dma_coherent(hwdev) && !(attrs & DMA_ATTR_SKIP_CPU_SYNC)) {
-		if (pfn_valid(PFN_DOWN(dma_to_phys(hwdev, dev_addr))))
+		if (pfn_valid(PFN_DOWN(dma_to_phys(hwdev, dev_addr)))) {
+			printk("DEBUG %s %d phys=%llx dev_addr=%llx\n",__func__,__LINE__,paddr,dev_addr);
 			arch_sync_dma_for_cpu(paddr, size, dir);
-		else
+		} else {
+			printk("DEBUG %s %d phys=%llx dev_addr=%llx\n",__func__,__LINE__,paddr,dev_addr);
 			xen_dma_sync_for_cpu(hwdev, dev_addr, size, dir);
+		}
 	}
 
 	/* NOTE: We use dev_addr here, not paddr! */
-	if (is_xen_swiotlb_buffer(hwdev, dev_addr))
+	if (is_xen_swiotlb_buffer(hwdev, dev_addr)) {
+		printk("DEBUG %s %d phys=%llx dev_addr=%llx\n",__func__,__LINE__,paddr,dev_addr);
 		swiotlb_tbl_unmap_single(hwdev, paddr, size, size, dir, attrs);
+	}
 }
 
 static void
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 51bb8fa8eb89..fdddeaf1b7cd 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -429,9 +429,11 @@ void *dma_alloc_attrs(struct device *dev, size_t size, dma_addr_t *dma_handle,
 	if (dma_alloc_from_dev_coherent(dev, size, dma_handle, &cpu_addr))
 		return cpu_addr;
 
+	printk("DEBUG %s %d size=%lu flags=%x attr=%lx\n",__func__,__LINE__,size,flag,attrs);
 	/* let the implementation decide on the zone to allocate from: */
 	flag &= ~(__GFP_DMA | __GFP_DMA32 | __GFP_HIGHMEM);
 
+	printk("DEBUG %s %d size=%lu flags=%x attr=%lx\n",__func__,__LINE__,size,flag,attrs);
 	if (dma_alloc_direct(dev, ops))
 		cpu_addr = dma_direct_alloc(dev, size, dma_handle, flag, attrs);
 	else if (ops->alloc)

