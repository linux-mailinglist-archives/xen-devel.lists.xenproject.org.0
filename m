Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBF01C7C11
	for <lists+xen-devel@lfdr.de>; Wed,  6 May 2020 23:12:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWRKw-0000EK-5E; Wed, 06 May 2020 21:12:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=POZY=6U=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1jWRKv-0000EE-7C
 for xen-devel@lists.xenproject.org; Wed, 06 May 2020 21:12:13 +0000
X-Inumbo-ID: 41113ca8-8fde-11ea-ae69-bc764e2007e4
Received: from mail-qv1-xf41.google.com (unknown [2607:f8b0:4864:20::f41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 41113ca8-8fde-11ea-ae69-bc764e2007e4;
 Wed, 06 May 2020 21:12:12 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id v18so1581991qvx.9
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2020 14:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v0M0geFf2CIFOdjuI4WtDFPTDw9uIxElYDkiHB5MMOY=;
 b=ip7SgBctBhYte9yPUa73ivSsmvvFI9de3s3qPGbObX60tts6VHu6qwiurwpt7hm2lY
 7hjE6Cl7rWz67Q19xfHfw+XW/JtV9LAPutuazimZWxV9aHjSKG+/xgz1Y2OMikRw399u
 Yk5qqrGzcAwufu1dKjr62NkGCIFmmtnZIbhZygIlLurHHzUZjPIxitwHQFIVaSKLO+mg
 slWvdEZJa1Rnd0YgDl6/Qba0bH53/pRrLvVmjLt0DGwRiOtZ2f07SUu4VK2f2YtzLvV1
 WvobQNEDxRvJfKtP5UGkQFa6vaWZabBFe9HuQ7RJlaLm0vFTeINQZ5dUkRjPCbYjBFFy
 SOug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v0M0geFf2CIFOdjuI4WtDFPTDw9uIxElYDkiHB5MMOY=;
 b=cYPaTEEtZLmHeALU/QxFY+OC2TCuimefLCvRcdixInA5q3Q3vRbVm9WDsTSUsZxmi1
 cH3M6FzmXGWN2OiJsjoyNdXEogfWju+g4u3HwbEAJbd51mPXTjRmvwcTYJbiFiPp7GYw
 sMTfqFwJR/8jZTYMQ8KmCsuPXOym9Ej2NXmqlOkPhuT6et0FPNWch2Wil3nRid9eqsIX
 /MF+EjsQmd0sKQr/GS+MSqaXTjO1g78bZezDI1WmSPis736ohlN2Shs5Y58Or8bf7VPB
 hpUv7BUfepKlkEZHDiR68HADilhTEilBvX5G+LAiCFt5jZiFBkOhblvDCM8VnmBrmEa0
 e2bA==
X-Gm-Message-State: AGi0Puam1gD8kOvIiX/gzl9V5QhRw67Z1b3hkKhBkE4eXyDa+saP/PIX
 Hr0Wz05Fcfd2qMZSlhFrzNJhV6Lvk8JANLGqGnHwfTU4VEM=
X-Google-Smtp-Source: APiQypKJ4ZEXM05uFEqDd94l5YhOHtYXStiuFx2ERrJkboRvaAXx5ZL++jF6mfzFEvQZHyFYlai2j2lZEncnoFIhrCk=
X-Received: by 2002:ad4:452d:: with SMTP id l13mr10263875qvu.19.1588799532193; 
 Wed, 06 May 2020 14:12:12 -0700 (PDT)
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
 <alpine.DEB.2.21.2005060956120.14706@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2005060956120.14706@sstabellini-ThinkPad-T480s>
From: Roman Shaposhnik <roman@zededa.com>
Date: Wed, 6 May 2020 14:12:00 -0700
Message-ID: <CAMmSBy_wcSD3BVcVFJVR1y1CtvxA9xMkobKwbsdf8dGxS5Hcbw@mail.gmail.com>
Subject: Re: Troubles running Xen on Raspberry Pi 4 with 5.6.1 DomU
To: Stefano Stabellini <sstabellini@kernel.org>
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
 Peng Fan <peng.fan@nxp.com>, Julien Grall <julien@xen.org>,
 "minyard@acm.org" <minyard@acm.org>,
 "jeff.kubascik@dornerworks.com" <jeff.kubascik@dornerworks.com>,
 Julien Grall <julien.grall@arm.com>,
 Nataliya Korovkina <malus.brandywine@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, May 6, 2020 at 10:34 AM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> On Wed, 6 May 2020, Nataliya Korovkina wrote:
> > On Wed, May 6, 2020 at 9:43 AM Boris Ostrovsky
> > <boris.ostrovsky@oracle.com> wrote:
> > >
> > >
> > > On 5/6/20 9:08 AM, Nataliya Korovkina wrote:
> > > > Hello,
> > > >
> > > > What I found out: rpi_firmware_property_list() allocates memory from
> > > > dma_atomic_pool which was mapped to VMALLOC region, so virt_to_page()
> > > > is not eligible in this case.
> > >
> > >
> > > So then it seems it didn't go through xen_swiotlb_alloc_coherent(). In
> > > which case it has no business calling xen_swiotlb_free_coherent().
> > >
> > >
> > > -boris
> > >
> > >
> > >
> > >
> >
> > It does go.
> > dma_alloc_coherent() indirectly calls xen_swiotlb_alloc_coherent(),
> > then  xen_alloc_coherent_pages() eventually calls arch_dma_alloc() in
> > remap.c which successfully allocates pages from atomic pool.
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
> Ah! So this is the crux of the issue. I saw this kind of problem before
> on ARM32 (in fact there are several comments warning not to use
> virt_to_phys on ARM in drivers/xen/swiotlb-xen.c).
>
>
> So, to recap we have 2 issues as far as I can tell:
>
> - virt_to_page not working in some cases on ARM, leading to a crash
> - WARN_ON for range_straddles_page_boundary which is normal on ARM
>
> The appended patch addresses them by:
>
> - using pfn_to_page instead virt_to_page
> - moving the WARN_ON under a #ifdef (Juergen might have a better
>   suggestion on how to rework the WARN_ON)
>
> Please let me know if this patch works!
>
> Cheers,
>
> Stefano
>
>
> diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> index b6d27762c6f8..0a40ac332a4c 100644
> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -322,7 +322,7 @@ xen_swiotlb_alloc_coherent(struct device *hwdev, size_t size,
>                         xen_free_coherent_pages(hwdev, size, ret, (dma_addr_t)phys, attrs);
>                         return NULL;
>                 }
> -               SetPageXenRemapped(virt_to_page(ret));
> +               SetPageXenRemapped(pfn_to_page(PFN_DOWN(phys)));
>         }
>         memset(ret, 0, size);
>         return ret;
> @@ -346,9 +346,14 @@ xen_swiotlb_free_coherent(struct device *hwdev, size_t size, void *vaddr,
>         /* Convert the size to actually allocated. */
>         size = 1UL << (order + XEN_PAGE_SHIFT);
>
> -       if (!WARN_ON((dev_addr + size - 1 > dma_mask) ||
> -                    range_straddles_page_boundary(phys, size)) &&
> -           TestClearPageXenRemapped(virt_to_page(vaddr)))
> +#ifdef CONFIG_X86
> +       if (WARN_ON(dev_addr + size - 1 > dma_mask) ||
> +                   range_straddles_page_boundary(phys, size)) {
> +           return;
> +       }
> +#endif
> +
> +       if (TestClearPageXenRemapped(pfn_to_page(PFN_DOWN(phys))))
>                 xen_destroy_contiguous_region(phys, order);
>
>         xen_free_coherent_pages(hwdev, size, vaddr, (dma_addr_t)phys, attrs);

Stefano, with your patch applied, I'm still getting:

[    0.590705] Unable to handle kernel paging request at virtual
address fffffe0003700000

However, Boris' patch seems to get us much closer. It would be awesome if you
can take a look at that (plus the additional DMA issue that seems to
be dependent
on how much memory I allocate to Dom0).

Thanks,
Roman.

