Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E13AD1C780B
	for <lists+xen-devel@lfdr.de>; Wed,  6 May 2020 19:35:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWNwb-0007Xe-K7; Wed, 06 May 2020 17:34:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZA5M=6U=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jWNwa-0007XZ-7U
 for xen-devel@lists.xenproject.org; Wed, 06 May 2020 17:34:52 +0000
X-Inumbo-ID: e3d6f9d8-8fbf-11ea-9e9c-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e3d6f9d8-8fbf-11ea-9e9c-12813bfff9fa;
 Wed, 06 May 2020 17:34:51 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 907A3208DB;
 Wed,  6 May 2020 17:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588786491;
 bh=l2feMkeFS934VyyRnn8p8wtcjjDqVIr8WQ/8tuUm/yA=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=sKy0N27nidrypjU5T3up89YU8vhjekMOOnsBeD4d35nR6Xpm2yXIK7EBLZ7J6UE3o
 7xHPc9LG9XFmgjnvAmKVm5E012Bn/np5iJiYFzQFJp9s2er3Dve2977boP2tTHKCkY
 Lylr6zSC73KaXZ4IgFS/Ju+NSbJuULKqv0gpkgUU=
Date: Wed, 6 May 2020 10:34:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Nataliya Korovkina <malus.brandywine@gmail.com>
Subject: Re: Troubles running Xen on Raspberry Pi 4 with 5.6.1 DomU
In-Reply-To: <CADz_WD68bYj-0CSm_zib+LRiMGd1+1eoNLgiJj=vHog685Khsw@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2005060956120.14706@sstabellini-ThinkPad-T480s>
References: <CAMmSBy_A4xJmCo-PiWukv0+vkEhXXDpYwZAKAiJ=mmpuY1CbMA@mail.gmail.com>
 <20200501114201.GE9902@minyard.net>
 <CAMmSBy_h9=5cjMv3+-BKHYhBikgna731DoA+t-8FK-2tbPUH-A@mail.gmail.com>
 <20200502021647.GG9902@minyard.net>
 <4f6ef562-e213-8952-66d6-0f083bf8c593@xen.org>
 <20200502173529.GH9902@minyard.net>
 <ed02b555-dbaa-2ebf-d09f-0474e1a7a745@xen.org>
 <20200504124453.GI9902@minyard.net>
 <CAMmSBy-w1HOyGGCjB_nJcn2xw+4sNdDrtJ8PC3foaxJOtdRmnQ@mail.gmail.com>
 <alpine.DEB.2.21.2005042004500.14706@sstabellini-ThinkPad-T480s>
 <CAMmSBy-yymEGQcuUBHZi-tL9ra7x9nDv+ms8SLiZr1H=BpHUiQ@mail.gmail.com>
 <alpine.DEB.2.21.2005051508180.14706@sstabellini-ThinkPad-T480s>
 <9ee0fb6f-98df-d993-c42e-f47270bf2eaa@suse.com>
 <DB6PR0402MB2760AF88FE7E3DF47401BE5988A40@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <CADz_WD5Ln7Pe1WAFp73d2Mz9wxspzTE3WgAJusp5S8LX4=83Bw@mail.gmail.com>
 <2187cd7c-4d48-986b-77d6-4428e8178404@oracle.com>
 <CADz_WD68bYj-0CSm_zib+LRiMGd1+1eoNLgiJj=vHog685Khsw@mail.gmail.com>
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
Cc: =?UTF-8?Q?J=C3=BCrgen_Gro=C3=9F?= <jgross@suse.com>,
 Peng Fan <peng.fan@nxp.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, "minyard@acm.org" <minyard@acm.org>,
 Roman Shaposhnik <roman@zededa.com>,
 "jeff.kubascik@dornerworks.com" <jeff.kubascik@dornerworks.com>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, 6 May 2020, Nataliya Korovkina wrote:
> On Wed, May 6, 2020 at 9:43 AM Boris Ostrovsky
> <boris.ostrovsky@oracle.com> wrote:
> >
> >
> > On 5/6/20 9:08 AM, Nataliya Korovkina wrote:
> > > Hello,
> > >
> > > What I found out: rpi_firmware_property_list() allocates memory from
> > > dma_atomic_pool which was mapped to VMALLOC region, so virt_to_page()
> > > is not eligible in this case.
> >
> >
> > So then it seems it didn't go through xen_swiotlb_alloc_coherent(). In
> > which case it has no business calling xen_swiotlb_free_coherent().
> >
> >
> > -boris
> >
> >
> >
> >
> 
> It does go.
> dma_alloc_coherent() indirectly calls xen_swiotlb_alloc_coherent(),
> then  xen_alloc_coherent_pages() eventually calls arch_dma_alloc() in
> remap.c which successfully allocates pages from atomic pool.
> 
> The patch Julien offered for domian_build.c moved Dom0 banks in the
> first G of RAM.
> So it covered the previous symptom (a crash during allocation) because
> now we avoid pathway  when we mark a page "XenMapped".
> 
> But the symptom still remains in xen_swiotlb_free_coherent() because
> "TestPage..." is called unconditionally. virt_to_page() is not
> applicable to such allocations.

Ah! So this is the crux of the issue. I saw this kind of problem before
on ARM32 (in fact there are several comments warning not to use
virt_to_phys on ARM in drivers/xen/swiotlb-xen.c).


So, to recap we have 2 issues as far as I can tell:

- virt_to_page not working in some cases on ARM, leading to a crash
- WARN_ON for range_straddles_page_boundary which is normal on ARM

The appended patch addresses them by:

- using pfn_to_page instead virt_to_page
- moving the WARN_ON under a #ifdef (Juergen might have a better
  suggestion on how to rework the WARN_ON)

Please let me know if this patch works!

Cheers,

Stefano


diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index b6d27762c6f8..0a40ac332a4c 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -322,7 +322,7 @@ xen_swiotlb_alloc_coherent(struct device *hwdev, size_t size,
 			xen_free_coherent_pages(hwdev, size, ret, (dma_addr_t)phys, attrs);
 			return NULL;
 		}
-		SetPageXenRemapped(virt_to_page(ret));
+		SetPageXenRemapped(pfn_to_page(PFN_DOWN(phys)));
 	}
 	memset(ret, 0, size);
 	return ret;
@@ -346,9 +346,14 @@ xen_swiotlb_free_coherent(struct device *hwdev, size_t size, void *vaddr,
 	/* Convert the size to actually allocated. */
 	size = 1UL << (order + XEN_PAGE_SHIFT);
 
-	if (!WARN_ON((dev_addr + size - 1 > dma_mask) ||
-		     range_straddles_page_boundary(phys, size)) &&
-	    TestClearPageXenRemapped(virt_to_page(vaddr)))
+#ifdef CONFIG_X86
+	if (WARN_ON(dev_addr + size - 1 > dma_mask) ||
+	            range_straddles_page_boundary(phys, size)) {
+	    return;
+	}
+#endif
+
+	if (TestClearPageXenRemapped(pfn_to_page(PFN_DOWN(phys))))
 		xen_destroy_contiguous_region(phys, order);
 
 	xen_free_coherent_pages(hwdev, size, vaddr, (dma_addr_t)phys, attrs);

