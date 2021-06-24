Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 817823B3390
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jun 2021 18:07:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146963.270604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwRsJ-00018X-UN; Thu, 24 Jun 2021 16:06:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146963.270604; Thu, 24 Jun 2021 16:06:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwRsJ-00015U-Ql; Thu, 24 Jun 2021 16:06:43 +0000
Received: by outflank-mailman (input) for mailman id 146963;
 Thu, 24 Jun 2021 16:06:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a5fo=LS=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lwRsH-00015I-1r
 for xen-devel@lists.xenproject.org; Thu, 24 Jun 2021 16:06:42 +0000
Received: from mail-pl1-x62d.google.com (unknown [2607:f8b0:4864:20::62d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 64e1dff4-a842-45fe-95e9-ab5128ff3e64;
 Thu, 24 Jun 2021 16:06:40 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id v12so3186921plo.10
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jun 2021 09:06:40 -0700 (PDT)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com.
 [209.85.210.175])
 by smtp.gmail.com with ESMTPSA id q3sm3279035pfj.89.2021.06.24.09.06.38
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 09:06:38 -0700 (PDT)
Received: by mail-pf1-f175.google.com with SMTP id g21so3874747pfc.11
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jun 2021 09:06:38 -0700 (PDT)
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
X-Inumbo-ID: 64e1dff4-a842-45fe-95e9-ab5128ff3e64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OUC0E76X92PmzUvBM3M58z5qjgzPKxJvrlMYIlH3t/A=;
        b=V1DUMk4pWXUrJHEg/9Kd4ukoLxbJGeXfb8ZAhSFnF6RVbF8t2Z5J1ymG4niuoHNq4v
         lR13PRE87YP1jrN3LaPEaViS+9EA9qGG/k81iCPvzgmr34ySIt4SvvmFKyoWhdSPE98X
         KaxkIr3Pk6gTC5BkELMIeQJS2sWcVoDywrhkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OUC0E76X92PmzUvBM3M58z5qjgzPKxJvrlMYIlH3t/A=;
        b=sb4PGzdTPP9plLw5ouJHRfs5XEmwCAQJdJyILbeSmNVy+FzDvYei05P2YGvXiewz+J
         7gxnLYdx3CkadwrfUG2YP6t3RoGvUYiaBzhWXFJpq/G1jM/UY1AFnToXMNMwWa9LlGq/
         Vl7QiNmrhHEnGZphPX+cyXXE/g6HyqCUsCHv03OsLaHqT/e2tD9yjn8cbHSkNd/LhzdQ
         nKgY2sHgzDnRqXeElV4Iedovq7tRyIiqQgwgX48HyP2ppU0sjdbDpJuQgxmBsyLZLRRT
         BltybfSUpsvPOVhiLK5UMjmfo+NHlKPLF7btuGqvyobfnXkadcWRl+3XLI6j8MVFVZ0D
         Bw5Q==
X-Gm-Message-State: AOAM5310qHjdlz77/AdMOhDFuSx7KS6j30mlOsZwgmbWo3RAw+egwk17
	/WQEQBXwrBinlc0VDjHoNMgJY5cj9NaFhw==
X-Google-Smtp-Source: ABdhPJz3iN10gF0cioqR3Fy/orVLXZKic7Pb77x/JfPVqt5y/jL50Pj1KroF4RWqfFSV5FZ/+IVFbw==
X-Received: by 2002:a17:90b:a05:: with SMTP id gg5mr6197748pjb.181.1624550799179;
        Thu, 24 Jun 2021 09:06:39 -0700 (PDT)
X-Received: by 2002:a92:9509:: with SMTP id y9mr4122371ilh.18.1624550347935;
 Thu, 24 Jun 2021 08:59:07 -0700 (PDT)
MIME-Version: 1.0
References: <76c3343d-72e5-9df3-8924-5474ee698ef4@quicinc.com>
 <20210623183736.GA472@willie-the-truck> <19d4c7a2-744d-21e0-289c-a576e1f0e6f3@quicinc.com>
 <20210624054315.GA25381@lst.de> <CALiNf288ZLMhY3E8E3N+z9rkwi1viWNLm1wwMEwT4rNwh3FfwQ@mail.gmail.com>
 <364e6715-eafd-fc4a-e0af-ce2a042756b4@arm.com> <20210624111855.GA1382@willie-the-truck>
 <452155d2-c98e-23f6-86d6-3a2ff2e74783@arm.com> <20210624114829.GB1382@willie-the-truck>
 <43ec9dd6-12c0-98ec-8d5d-b2904292721e@quicinc.com> <YNSq56zyJ7EYdTcI@char.us.oracle.com>
In-Reply-To: <YNSq56zyJ7EYdTcI@char.us.oracle.com>
From: Claire Chang <tientzu@chromium.org>
Date: Thu, 24 Jun 2021 23:58:57 +0800
X-Gmail-Original-Message-ID: <CALiNf2_WCVodEZJz9PaCTgk_c8LpOAcD4=YZTLDMVyorJs3ESQ@mail.gmail.com>
Message-ID: <CALiNf2_WCVodEZJz9PaCTgk_c8LpOAcD4=YZTLDMVyorJs3ESQ@mail.gmail.com>
Subject: Re: [PATCH v14 06/12] swiotlb: Use is_swiotlb_force_bounce for
 swiotlb data bouncing
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Qian Cai <quic_qiancai@quicinc.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>, Rob Herring <robh+dt@kernel.org>, 
	mpe@ellerman.id.au, Joerg Roedel <joro@8bytes.org>, Frank Rowand <frowand.list@gmail.com>, 
	boris.ostrovsky@oracle.com, jgross@suse.com, 
	Marek Szyprowski <m.szyprowski@samsung.com>, heikki.krogerus@linux.intel.com, 
	thomas.hellstrom@linux.intel.com, peterz@infradead.org, 
	benh@kernel.crashing.org, joonas.lahtinen@linux.intel.com, 
	dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk, 
	grant.likely@arm.com, paulus@samba.org, mingo@kernel.org, 
	Jianxiong Gao <jxgao@google.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, xypron.glpk@gmx.de, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com, linux-pci@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Thierry Reding <treding@nvidia.com>, 
	intel-gfx@lists.freedesktop.org, matthew.auld@intel.com, 
	linux-devicetree <devicetree@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>, airlied@linux.ie, 
	maarten.lankhorst@linux.intel.com, linuxppc-dev@lists.ozlabs.org, 
	jani.nikula@linux.intel.com, Nicolas Boichat <drinkcat@chromium.org>, rodrigo.vivi@intel.com, 
	Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Greg KH <gregkh@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>, 
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, Jim Quinlan <james.quinlan@broadcom.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, bauerman@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 24, 2021 at 11:56 PM Konrad Rzeszutek Wilk
<konrad.wilk@oracle.com> wrote:
>
> On Thu, Jun 24, 2021 at 10:10:51AM -0400, Qian Cai wrote:
> >
> >
> > On 6/24/2021 7:48 AM, Will Deacon wrote:
> > > Ok, diff below which attempts to tackle the offset issue I mentioned as
> > > well. Qian Cai -- please can you try with these changes?
> >
> > This works fine.
>
> Cool. Let me squash this patch in #6 and rebase the rest of them.
>
> Claire, could you check the devel/for-linus-5.14 say by end of today to
> double check that I didn't mess anything up please?

I just submitted v15 here
(https://lore.kernel.org/patchwork/cover/1451322/) in case it's
helpful.
I'll double check of course. Thanks for the efforts!

>
> Will,
>
> Thank you for generating the fix! I am going to run it on x86 and Xen
> to make sure all is good (granted last time I ran devel/for-linus-5.14
> on that setup I didn't see any errors so I need to double check
> I didn't do something silly like run a wrong kernel).
>
>
> >
> > >
> > > Will
> > >
> > > --->8
> > >
> > > diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> > > index 175b6c113ed8..39284ff2a6cd 100644
> > > --- a/include/linux/swiotlb.h
> > > +++ b/include/linux/swiotlb.h
> > > @@ -116,7 +116,9 @@ static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
> > >
> > >  static inline bool is_swiotlb_force_bounce(struct device *dev)
> > >  {
> > > -       return dev->dma_io_tlb_mem->force_bounce;
> > > +       struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
> > > +
> > > +       return mem && mem->force_bounce;
> > >  }
> > >
> > >  void __init swiotlb_exit(void);
> > > diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> > > index 44be8258e27b..0ffbaae9fba2 100644
> > > --- a/kernel/dma/swiotlb.c
> > > +++ b/kernel/dma/swiotlb.c
> > > @@ -449,6 +449,7 @@ static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
> > >                 dma_get_min_align_mask(dev) & ~(IO_TLB_SIZE - 1);
> > >         unsigned int nslots = nr_slots(alloc_size), stride;
> > >         unsigned int index, wrap, count = 0, i;
> > > +       unsigned int offset = swiotlb_align_offset(dev, orig_addr);
> > >         unsigned long flags;
> > >
> > >         BUG_ON(!nslots);
> > > @@ -497,7 +498,7 @@ static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
> > >         for (i = index; i < index + nslots; i++) {
> > >                 mem->slots[i].list = 0;
> > >                 mem->slots[i].alloc_size =
> > > -                       alloc_size - ((i - index) << IO_TLB_SHIFT);
> > > +                       alloc_size - (offset + ((i - index) << IO_TLB_SHIFT));
> > >         }
> > >         for (i = index - 1;
> > >              io_tlb_offset(i) != IO_TLB_SEGSIZE - 1 &&
> > >

