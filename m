Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A784B1C7C10
	for <lists+xen-devel@lfdr.de>; Wed,  6 May 2020 23:12:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWRJu-0000AF-QM; Wed, 06 May 2020 21:11:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=POZY=6U=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1jWRJt-0000AA-BW
 for xen-devel@lists.xenproject.org; Wed, 06 May 2020 21:11:09 +0000
X-Inumbo-ID: 1ade0426-8fde-11ea-b9cf-bc764e2007e4
Received: from mail-qv1-xf43.google.com (unknown [2607:f8b0:4864:20::f43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ade0426-8fde-11ea-b9cf-bc764e2007e4;
 Wed, 06 May 2020 21:11:08 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id v10so1592871qvr.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2020 14:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YCKsd7vQTI2DrN3+bSBaktJZhRsZLMdEUxM/uGHPzSY=;
 b=dtVb/aesF3jYzY7SMImdHHXdPNLlzBUTlRJurxB1eelQ8Av5yBt9sTeBbHmIWbfANX
 U+TYQbXJ751gzf6WEGWkWlprH2iZ6BmAaC6YfmcBoYru67+8BGtqqCyX08x8Wi98zGNj
 SU3bW1ejIG2bkj01QyEMEfVwK2dpUQWIkX6u1oSyCbB153RgRqPqhUA0Cn1v9sGPR0O6
 UPROdSZ1LcRghtfBLl6XrcxDe6FsuyynAP27FnpQKRzPNgCL1b3T9Yfbujn81piaJELu
 vkXJfN9sd4jjFPFTp2/9l1vqTnYPTAllkCBBi3tm29R04BXsvVT40h+wgmJ19uz4gNZs
 V84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YCKsd7vQTI2DrN3+bSBaktJZhRsZLMdEUxM/uGHPzSY=;
 b=Vd9VhGsRAb1VAUL6bOYHUXtN7MH8LwrzcPsp2NOxVuBZzfV+D3MM4j594p0n1nvzZd
 YdDkNumq9IPR29gPaOgWdGCIzd7t4g4U5iRtWVdYAN/3D7sK0Gy1KiBk57eUIoAAbqCO
 uBmVGKpJCsBGRFEN3bs/9J7sqMGz5nvS7LSBn0otj6ZnYoAIa3Gbq3+UmwUO8M9HPjNY
 jCmzaBm+8a2gi2PHl11QQYOmtEJqHlkPid/k2IUSfDC8aJkSpOPb6A3cBnluYdgV/Ha7
 KgOgPKoPTkE8Gxnsob0WAd4LKVM9HEuoPSy50oBpqQ3rk0Bwl5J2YKAivsq8ueE9KuKh
 w8Ow==
X-Gm-Message-State: AGi0PubZ+FywEoJVp17RhM3BFZH8ym0lih2jk32oAg/S/Rtq5eT0MKYm
 Q9vJGdDXFBXZKM4ifxbJWCpK+6sj9nT2I1LoRcEPXw==
X-Google-Smtp-Source: APiQypKoJFNQ7KZcQOonxz5ICneu5FS6xlsQzr6mQUbkGKNetEAotUCUkFyVjcp5gsDstAHZpAsjl2IBm/vQmN/0GXs=
X-Received: by 2002:a05:6214:3e2:: with SMTP id
 cf2mr9520302qvb.193.1588799468059; 
 Wed, 06 May 2020 14:11:08 -0700 (PDT)
MIME-Version: 1.0
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
 <a802a0d5-3ae3-97f5-af58-2e58123fec22@oracle.com>
In-Reply-To: <a802a0d5-3ae3-97f5-af58-2e58123fec22@oracle.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Wed, 6 May 2020 14:10:56 -0700
Message-ID: <CAMmSBy_2o6tsE1fsu_9=h8erOd9yHV-+ZkduTGqa-Gw7ra3mVQ@mail.gmail.com>
Subject: Re: Troubles running Xen on Raspberry Pi 4 with 5.6.1 DomU
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Peng Fan <peng.fan@nxp.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, "minyard@acm.org" <minyard@acm.org>,
 "jeff.kubascik@dornerworks.com" <jeff.kubascik@dornerworks.com>,
 Julien Grall <julien.grall@arm.com>,
 Nataliya Korovkina <malus.brandywine@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, May 6, 2020 at 10:36 AM Boris Ostrovsky
<boris.ostrovsky@oracle.com> wrote:
>
>
> On 5/6/20 12:14 PM, Nataliya Korovkina wrote:
> > On Wed, May 6, 2020 at 9:43 AM Boris Ostrovsky
> > <boris.ostrovsky@oracle.com> wrote:
> >>
> >> On 5/6/20 9:08 AM, Nataliya Korovkina wrote:
> >>> Hello,
> >>>
> >>> What I found out: rpi_firmware_property_list() allocates memory from
> >>> dma_atomic_pool which was mapped to VMALLOC region, so virt_to_page()
> >>> is not eligible in this case.
> >>
> >> So then it seems it didn't go through xen_swiotlb_alloc_coherent(). In
> >> which case it has no business calling xen_swiotlb_free_coherent().
> >>
> >>
> >> -boris
> >>
> >>
> >>
> >>
> > It does go.
> > dma_alloc_coherent() indirectly calls xen_swiotlb_alloc_coherent(),
> > then  xen_alloc_coherent_pages() eventually calls arch_dma_alloc() in
> > remap.c which successfully allocates pages from atomic pool.
>
>
> Yes, I was looking at x86's implementation of xen_alloc_coherent_pages().
>
>
> >
> > The patch Julien offered for domian_build.c moved Dom0 banks in the
> > first G of RAM.
> > So it covered the previous symptom (a crash during allocation) because
> > now we avoid pathway  when we mark a page "XenMapped".
> >
> > But the symptom still remains in xen_swiotlb_free_coherent() because
> > "TestPage..." is called unconditionally. virt_to_page() is not
> > applicable to such allocations.
>
>
> Perhaps we just need to make sure we are using right virt-to-page
> method. Something like
>
>
> diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> index b6d2776..f224e69 100644
> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -335,6 +335,7 @@ int __ref xen_swiotlb_init(int verbose, bool early)
>         int order = get_order(size);
>         phys_addr_t phys;
>         u64 dma_mask = DMA_BIT_MASK(32);
> +       struct page *pg;
>
>         if (hwdev && hwdev->coherent_dma_mask)
>                 dma_mask = hwdev->coherent_dma_mask;
> @@ -346,9 +347,12 @@ int __ref xen_swiotlb_init(int verbose, bool early)
>         /* Convert the size to actually allocated. */
>         size = 1UL << (order + XEN_PAGE_SHIFT);
>
> +       pg = is_vmalloc_addr(vaddr) ? vmalloc_to_page(vaddr) :
> virt_to_page(vaddr);
> +       BUG_ON(!pg);
> +
>         if (!WARN_ON((dev_addr + size - 1 > dma_mask) ||
>                      range_straddles_page_boundary(phys, size)) &&
> -           TestClearPageXenRemapped(virt_to_page(vaddr)))
> +           TestClearPageXenRemapped(pg))
>                 xen_destroy_contiguous_region(phys, order);
>
>         xen_free_coherent_pages(hwdev, size, vaddr, (dma_addr_t)phys,
> attrs);
>
>
> (I have not tested this at all)

That's where I come in ;-)

It appears that your patch gets us closest to a fully functional 5.6.x
kernel under Xen on RPi4.

Thank you so much for that!

However, here's an interesting side-effect I'm now observing -- with
your patch + original
patch from Stefano (the one that only applies to
include/xen/arm/page-coherent.h) I can
now boot my RPi4 into a pretty functional system.

However, it is only possible if I allocate 512M (or fewer) memory
chunk to Dom0. If I try
to go higher (820M for example) and all the way to 1G -- I start getting:

[    3.195851] mmc0: unrecognised SCR structure version 7
[    3.200454] mmc0: error -22 whilst initialising SD card

and my SD card stays offline.

This is pretty reliable, and I guess is still related to some kind of
a DMA issue perhaps?

Thanks,
Roman.

