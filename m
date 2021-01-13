Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CC92F439B
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 06:23:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66261.117703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzYcg-0005TP-MO; Wed, 13 Jan 2021 05:23:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66261.117703; Wed, 13 Jan 2021 05:23:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzYcg-0005T0-JE; Wed, 13 Jan 2021 05:23:10 +0000
Received: by outflank-mailman (input) for mailman id 66261;
 Wed, 13 Jan 2021 02:30:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4uzN=GQ=chromium.org=tfiga@srs-us1.protection.inumbo.net>)
 id 1kzVvO-0005wA-LQ
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 02:30:18 +0000
Received: from mail-ed1-x536.google.com (unknown [2a00:1450:4864:20::536])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 650c8a40-2e27-4974-bdc9-fd1dc869b0ac;
 Wed, 13 Jan 2021 02:30:17 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id r5so229543eda.12
 for <xen-devel@lists.xenproject.org>; Tue, 12 Jan 2021 18:30:17 -0800 (PST)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com.
 [209.85.218.47])
 by smtp.gmail.com with ESMTPSA id j5sm196134edl.42.2021.01.12.18.30.15
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 18:30:15 -0800 (PST)
Received: by mail-ej1-f47.google.com with SMTP id e18so832294ejt.12
 for <xen-devel@lists.xenproject.org>; Tue, 12 Jan 2021 18:30:15 -0800 (PST)
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
X-Inumbo-ID: 650c8a40-2e27-4974-bdc9-fd1dc869b0ac
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Pt5UETlRzxEfmCNnvTax6McqJSupC0kHJNd5M5Tk3YM=;
        b=TsRjhDJkIvx/eu/8Dfs4u/eA7XHGiCILe+X3MR73vyisdMsXXh5PtmdLED/GVKRM+1
         LWflHDw8pdNICFvV071XU8B6r5bQq/1VBUv+Ec3de3hTbcADu8hsQUglrP6RJcjXqNAA
         ojQ8dIj4rncwInw25v4xZFWxyiQ12aaKWhq88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Pt5UETlRzxEfmCNnvTax6McqJSupC0kHJNd5M5Tk3YM=;
        b=SUBcnDC2Rk3SuA9simbpcCo5TDdYgXPqj/SO9/RxKPiOj9ADq+V8clIzSFESWYFRGr
         JEgEHsQ6ilkKG+70I+11hQaEJGrCY0m3QYqqdSvVGHcgpNa7JJoDjywelANsZfC3wBzc
         L00ds8eEzmvvciIX9mr3duTkSHADQuKfwXtjPt4KwNaMy7XzFw2g16/+j4UJqWQbQ5KG
         piBhVNrAJF8FCpaZULzNoxlpuqnUvnmR7/kLOGw+3jkdRJ4tOTxrfBbhigOS0FMFobwn
         2LOJ8Pwg//g/6hah3oUttcn8Kl/+IMsa76wtm/0cM9dl//QgmYwrHpS12uhGXhgKHRGM
         BtOQ==
X-Gm-Message-State: AOAM533QP49hEaCTRo9B3UnuGeRAqxSeOVfzDhny7Qh8kJoe+dZr3urU
	RuUKkVJLQ0DuR5fcD/IzQNSULv8tBdTB5w==
X-Google-Smtp-Source: ABdhPJw4B4LtcS9TNGP1KLPwYwx3ImaRgJQ/6u2Je26vFFxTWB/WoP5jmLGyRJ+qia/VSn1sNMS4ow==
X-Received: by 2002:aa7:d603:: with SMTP id c3mr857034edr.337.1610505016284;
        Tue, 12 Jan 2021 18:30:16 -0800 (PST)
X-Received: by 2002:adf:9b91:: with SMTP id d17mr94123wrc.32.1610505010644;
 Tue, 12 Jan 2021 18:30:10 -0800 (PST)
MIME-Version: 1.0
References: <20210106034124.30560-1-tientzu@chromium.org> <d7043239-12cf-3636-4726-2e3b90917dc6@gmail.com>
 <CALiNf28sU1VtGB7LeTXExkMwQiCeg8N5arqyEjw0CPZP72R4dg@mail.gmail.com>
 <78871151-947d-b085-db03-0d0bd0b55632@gmail.com> <CALiNf29_PmLJTVLksSHp3NFAaL52idqehSMOtatJ=jaM2Muq1g@mail.gmail.com>
 <23a09b9a-70fc-a7a8-f3ea-b0bfa60507f0@gmail.com>
In-Reply-To: <23a09b9a-70fc-a7a8-f3ea-b0bfa60507f0@gmail.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 13 Jan 2021 11:29:58 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DX=AdaYSYQbxgnrYYojkM5q7EE_Qs-BYPOiNjcQWbN1A@mail.gmail.com>
Message-ID: <CAAFQd5DX=AdaYSYQbxgnrYYojkM5q7EE_Qs-BYPOiNjcQWbN1A@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/6] Restricted DMA
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Claire Chang <tientzu@chromium.org>, Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au, 
	benh@kernel.crashing.org, paulus@samba.org, 
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com, jgross@suse.com, 
	sstabellini@kernel.org, Christoph Hellwig <hch@lst.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, grant.likely@arm.com, 
	xypron.glpk@gmx.de, Thierry Reding <treding@nvidia.com>, mingo@kernel.org, 
	bauerman@linux.ibm.com, peterz@infradead.org, 
	Greg KH <gregkh@linuxfoundation.org>, Saravana Kannan <saravanak@google.com>, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, heikki.krogerus@linux.intel.com, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Dan Williams <dan.j.williams@intel.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, 
	linux-devicetree <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, 
	linuxppc-dev@lists.ozlabs.org, xen-devel@lists.xenproject.org, 
	Nicolas Boichat <drinkcat@chromium.org>, Jim Quinlan <james.quinlan@broadcom.com>
Content-Type: text/plain; charset="UTF-8"

Hi Florian,

On Wed, Jan 13, 2021 at 3:01 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> On 1/11/21 11:48 PM, Claire Chang wrote:
> > On Fri, Jan 8, 2021 at 1:59 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
> >>
> >> On 1/7/21 9:42 AM, Claire Chang wrote:
> >>
> >>>> Can you explain how ATF gets involved and to what extent it does help,
> >>>> besides enforcing a secure region from the ARM CPU's perpsective? Does
> >>>> the PCIe root complex not have an IOMMU but can somehow be denied access
> >>>> to a region that is marked NS=0 in the ARM CPU's MMU? If so, that is
> >>>> still some sort of basic protection that the HW enforces, right?
> >>>
> >>> We need the ATF support for memory MPU (memory protection unit).
> >>> Restricted DMA (with reserved-memory in dts) makes sure the predefined memory
> >>> region is for PCIe DMA only, but we still need MPU to locks down PCIe access to
> >>> that specific regions.
> >>
> >> OK so you do have a protection unit of some sort to enforce which region
> >> in DRAM the PCIE bridge is allowed to access, that makes sense,
> >> otherwise the restricted DMA region would only be a hint but nothing you
> >> can really enforce. This is almost entirely analogous to our systems then.
> >
> > Here is the example of setting the MPU:
> > https://github.com/ARM-software/arm-trusted-firmware/blob/master/plat/mediatek/mt8183/drivers/emi_mpu/emi_mpu.c#L132
> >
> >>
> >> There may be some value in standardizing on an ARM SMCCC call then since
> >> you already support two different SoC vendors.
> >>
> >>>
> >>>>
> >>>> On Broadcom STB SoCs we have had something similar for a while however
> >>>> and while we don't have an IOMMU for the PCIe bridge, we do have a a
> >>>> basic protection mechanism whereby we can configure a region in DRAM to
> >>>> be PCIe read/write and CPU read/write which then gets used as the PCIe
> >>>> inbound region for the PCIe EP. By default the PCIe bridge is not
> >>>> allowed access to DRAM so we must call into a security agent to allow
> >>>> the PCIe bridge to access the designated DRAM region.
> >>>>
> >>>> We have done this using a private CMA area region assigned via Device
> >>>> Tree, assigned with a and requiring the PCIe EP driver to use
> >>>> dma_alloc_from_contiguous() in order to allocate from this device
> >>>> private CMA area. The only drawback with that approach is that it
> >>>> requires knowing how much memory you need up front for buffers and DMA
> >>>> descriptors that the PCIe EP will need to process. The problem is that
> >>>> it requires driver modifications and that does not scale over the number
> >>>> of PCIe EP drivers, some we absolutely do not control, but there is no
> >>>> need to bounce buffer. Your approach scales better across PCIe EP
> >>>> drivers however it does require bounce buffering which could be a
> >>>> performance hit.
> >>>
> >>> Only the streaming DMA (map/unmap) needs bounce buffering.
> >>
> >> True, and typically only on transmit since you don't really control
> >> where the sk_buff are allocated from, right? On RX since you need to
> >> hand buffer addresses to the WLAN chip prior to DMA, you can allocate
> >> them from a pool that already falls within the restricted DMA region, right?
> >>
> >
> > Right, but applying bounce buffering to RX will make it more secure.
> > The device won't be able to modify the content after unmap. Just like what
> > iommu_unmap does.
>
> Sure, however the goals of using bounce buffering equally applies to RX
> and TX in that this is the only layer sitting between a stack (block,
> networking, USB, etc.) and the underlying device driver that scales well
> in order to massage a dma_addr_t to be within a particular physical range.
>
> There is however room for improvement if the drivers are willing to
> change their buffer allocation strategy. When you receive Wi-Fi frames
> you need to allocate buffers for the Wi-Fi device to DMA into, and that
> happens ahead of the DMA transfers by the Wi-Fi device. At buffer
> allocation time you could very well allocate these frames from the
> restricted DMA region without having to bounce buffer them since the
> host CPU is in control over where and when to DMA into.
>

That is, however, still a trade-off between saving that one copy and
protection from the DMA tampering with the packet contents when the
kernel is reading them. Notice how the copy effectively makes a
snapshot of the contents, guaranteeing that the kernel has a
consistent view of the packet, which is not true if the DMA could
modify the buffer contents in the middle of CPU accesses.

Best regards,
Tomasz

> The issue is that each network driver may implement its own buffer
> allocation strategy, some may simply call netdev_alloc_skb() which gives
> zero control over where the buffer comes from unless you play tricks
> with NUMA node allocations and somehow declare that your restricted DMA
> region is a different NUMA node. If the driver allocates pages and then
> attaches a SKB to that page using build_skb(), then you have much more
> control over where that page comes from, and this is where using a
> device private CMA are helps, because you can just do
> dma_alloc_from_contiguous() and that will ensure that the pages are
> coming from your specific CMA area.
>
> Few questions on the implementation:
>
> - is there any warning or error being printed if the restricted DMA
> region is outside of a device's DMA addressable range?
>
> - are there are any helpful statistics that could be shown to indicate
> that the restricted DMA region was sized too small, e.g.: that
> allocation of a DMA buffer failed because we ran out of space in the
> swiotlb pool?
>
> >
> >>> I also added alloc/free support in this series
> >>> (https://lore.kernel.org/patchwork/patch/1360995/), so dma_direct_alloc() will
> >>> try to allocate memory from the predefined memory region.
> >>>
> >>> As for the performance hit, it should be similar to the default swiotlb.
> >>> Here are my experiment results. Both SoCs lack IOMMU for PCIe.
> >>>
> >>> PCIe wifi vht80 throughput -
> >>>
> >>>   MTK SoC                  tcp_tx     tcp_rx    udp_tx   udp_rx
> >>>   w/o Restricted DMA  244.1     134.66   312.56   350.79
> >>>   w/ Restricted DMA    246.95   136.59   363.21   351.99
> >>>
> >>>   Rockchip SoC           tcp_tx     tcp_rx    udp_tx   udp_rx
> >>>   w/o Restricted DMA  237.87   133.86   288.28   361.88
> >>>   w/ Restricted DMA    256.01   130.95   292.28   353.19
> >>
> >> How come you get better throughput with restricted DMA? Is it because
> >> doing DMA to/from a contiguous region allows for better grouping of
> >> transactions from the DRAM controller's perspective somehow?
> >
> > I'm not sure, but actually, enabling the default swiotlb for wifi also helps the
> > throughput a little bit for me.
>
> OK, it would be interesting if you could get to the bottom of why
> performance does increase with swiotlb.
> --
> Florian

