Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2494F2F439C
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 06:24:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66295.117712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzYch-0005U7-1C; Wed, 13 Jan 2021 05:23:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66295.117712; Wed, 13 Jan 2021 05:23:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzYcg-0005TR-Qt; Wed, 13 Jan 2021 05:23:10 +0000
Received: by outflank-mailman (input) for mailman id 66295;
 Wed, 13 Jan 2021 04:32:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4uzN=GQ=chromium.org=tfiga@srs-us1.protection.inumbo.net>)
 id 1kzXpC-0000YR-0G
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 04:32:02 +0000
Received: from mail-lj1-x230.google.com (unknown [2a00:1450:4864:20::230])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3010525d-42d0-40ba-a98e-bff4daa210e3;
 Wed, 13 Jan 2021 04:32:00 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id w26so1068096ljo.4
 for <xen-devel@lists.xenproject.org>; Tue, 12 Jan 2021 20:32:00 -0800 (PST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com.
 [209.85.167.48])
 by smtp.gmail.com with ESMTPSA id l3sm76308lfd.119.2021.01.12.20.31.58
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 20:31:58 -0800 (PST)
Received: by mail-lf1-f48.google.com with SMTP id o10so774568lfl.13
 for <xen-devel@lists.xenproject.org>; Tue, 12 Jan 2021 20:31:58 -0800 (PST)
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
X-Inumbo-ID: 3010525d-42d0-40ba-a98e-bff4daa210e3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qd8hOVRYaVRyWNGRjHwo8wnN48NoVMjkXuMdDYJPYxc=;
        b=cUL+OIdnJx4G27gKvv1kHgGhT/slNCHswvbi3BuicuPQK2CUGcm0qVdh+9o8kjC/EK
         SNX+36UrRAN9XTvqxA+bDb4zE1ip5M/Md1KqkddIPS827Ih0ruD0qLwi/Bm2QcxOkH5H
         8Ph19hD0ZaKeMRKRHdsA/toCspDEeybtcuDi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qd8hOVRYaVRyWNGRjHwo8wnN48NoVMjkXuMdDYJPYxc=;
        b=aUy7PV7l9LyaR0tRGRflFIJjrJCraGtPn34eF1DKvlJLhyQHPK22arCa1zRT/7Iy6E
         w2Yd+NbA05LTA2sJPfC2Xr/ZNGd8Vi8SmzS071J0aCGqWjqJ+2nLHkXNWF97yU4PBfKt
         30OzfCeHYnv1jwGGRSqZI3ZyfeHNUXkMiIwyENfvGaQeiQe989EUmaWvP1ooOEU1cNie
         2PvbMCVB2vQkwaCtM5Woh7SU3DvG2lnwHkQi1pRwrvBjXv9WoEwnlDuuH0ir8SAHPG54
         GgEzs4Gb1795JG6unrFIJzoYVYKpm1M/mqLuednjzBgDWsoyzBVHgaNjq1P40tWBd+ht
         j5ew==
X-Gm-Message-State: AOAM533Y3lLp5uTVKHjctN017FXU/tNbMCk5WhAMEeza8NouPoLy8dnY
	YUksuwjxLKFNedkLfHViRBES1KF+2wZrSwif
X-Google-Smtp-Source: ABdhPJy2N0tdnQR97/wbRf6Ze6S8KmQbr4lvnoXbT+U4u6iP41dTGar2J4hITP0j+WKaOhqq9UybUw==
X-Received: by 2002:a2e:b055:: with SMTP id d21mr124003ljl.68.1610512319165;
        Tue, 12 Jan 2021 20:31:59 -0800 (PST)
X-Received: by 2002:adf:fa86:: with SMTP id h6mr380594wrr.103.1610511938864;
 Tue, 12 Jan 2021 20:25:38 -0800 (PST)
MIME-Version: 1.0
References: <20210106034124.30560-1-tientzu@chromium.org> <d7043239-12cf-3636-4726-2e3b90917dc6@gmail.com>
 <CALiNf28sU1VtGB7LeTXExkMwQiCeg8N5arqyEjw0CPZP72R4dg@mail.gmail.com>
 <78871151-947d-b085-db03-0d0bd0b55632@gmail.com> <CALiNf29_PmLJTVLksSHp3NFAaL52idqehSMOtatJ=jaM2Muq1g@mail.gmail.com>
 <23a09b9a-70fc-a7a8-f3ea-b0bfa60507f0@gmail.com> <CAAFQd5DX=AdaYSYQbxgnrYYojkM5q7EE_Qs-BYPOiNjcQWbN1A@mail.gmail.com>
 <c7f7941d-b8bd-f0f3-4e40-b899a77188bf@gmail.com>
In-Reply-To: <c7f7941d-b8bd-f0f3-4e40-b899a77188bf@gmail.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 13 Jan 2021 13:25:27 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AGm4U8hD4jHmw10S7MRS1-ZUSq7eGgoUifMMyfZgP2NA@mail.gmail.com>
Message-ID: <CAAFQd5AGm4U8hD4jHmw10S7MRS1-ZUSq7eGgoUifMMyfZgP2NA@mail.gmail.com>
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

On Wed, Jan 13, 2021 at 12:56 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
>
>
> On 1/12/2021 6:29 PM, Tomasz Figa wrote:
> > Hi Florian,
> >
> > On Wed, Jan 13, 2021 at 3:01 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
> >>
> >> On 1/11/21 11:48 PM, Claire Chang wrote:
> >>> On Fri, Jan 8, 2021 at 1:59 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
> >>>>
> >>>> On 1/7/21 9:42 AM, Claire Chang wrote:
> >>>>
> >>>>>> Can you explain how ATF gets involved and to what extent it does help,
> >>>>>> besides enforcing a secure region from the ARM CPU's perpsective? Does
> >>>>>> the PCIe root complex not have an IOMMU but can somehow be denied access
> >>>>>> to a region that is marked NS=0 in the ARM CPU's MMU? If so, that is
> >>>>>> still some sort of basic protection that the HW enforces, right?
> >>>>>
> >>>>> We need the ATF support for memory MPU (memory protection unit).
> >>>>> Restricted DMA (with reserved-memory in dts) makes sure the predefined memory
> >>>>> region is for PCIe DMA only, but we still need MPU to locks down PCIe access to
> >>>>> that specific regions.
> >>>>
> >>>> OK so you do have a protection unit of some sort to enforce which region
> >>>> in DRAM the PCIE bridge is allowed to access, that makes sense,
> >>>> otherwise the restricted DMA region would only be a hint but nothing you
> >>>> can really enforce. This is almost entirely analogous to our systems then.
> >>>
> >>> Here is the example of setting the MPU:
> >>> https://github.com/ARM-software/arm-trusted-firmware/blob/master/plat/mediatek/mt8183/drivers/emi_mpu/emi_mpu.c#L132
> >>>
> >>>>
> >>>> There may be some value in standardizing on an ARM SMCCC call then since
> >>>> you already support two different SoC vendors.
> >>>>
> >>>>>
> >>>>>>
> >>>>>> On Broadcom STB SoCs we have had something similar for a while however
> >>>>>> and while we don't have an IOMMU for the PCIe bridge, we do have a a
> >>>>>> basic protection mechanism whereby we can configure a region in DRAM to
> >>>>>> be PCIe read/write and CPU read/write which then gets used as the PCIe
> >>>>>> inbound region for the PCIe EP. By default the PCIe bridge is not
> >>>>>> allowed access to DRAM so we must call into a security agent to allow
> >>>>>> the PCIe bridge to access the designated DRAM region.
> >>>>>>
> >>>>>> We have done this using a private CMA area region assigned via Device
> >>>>>> Tree, assigned with a and requiring the PCIe EP driver to use
> >>>>>> dma_alloc_from_contiguous() in order to allocate from this device
> >>>>>> private CMA area. The only drawback with that approach is that it
> >>>>>> requires knowing how much memory you need up front for buffers and DMA
> >>>>>> descriptors that the PCIe EP will need to process. The problem is that
> >>>>>> it requires driver modifications and that does not scale over the number
> >>>>>> of PCIe EP drivers, some we absolutely do not control, but there is no
> >>>>>> need to bounce buffer. Your approach scales better across PCIe EP
> >>>>>> drivers however it does require bounce buffering which could be a
> >>>>>> performance hit.
> >>>>>
> >>>>> Only the streaming DMA (map/unmap) needs bounce buffering.
> >>>>
> >>>> True, and typically only on transmit since you don't really control
> >>>> where the sk_buff are allocated from, right? On RX since you need to
> >>>> hand buffer addresses to the WLAN chip prior to DMA, you can allocate
> >>>> them from a pool that already falls within the restricted DMA region, right?
> >>>>
> >>>
> >>> Right, but applying bounce buffering to RX will make it more secure.
> >>> The device won't be able to modify the content after unmap. Just like what
> >>> iommu_unmap does.
> >>
> >> Sure, however the goals of using bounce buffering equally applies to RX
> >> and TX in that this is the only layer sitting between a stack (block,
> >> networking, USB, etc.) and the underlying device driver that scales well
> >> in order to massage a dma_addr_t to be within a particular physical range.
> >>
> >> There is however room for improvement if the drivers are willing to
> >> change their buffer allocation strategy. When you receive Wi-Fi frames
> >> you need to allocate buffers for the Wi-Fi device to DMA into, and that
> >> happens ahead of the DMA transfers by the Wi-Fi device. At buffer
> >> allocation time you could very well allocate these frames from the
> >> restricted DMA region without having to bounce buffer them since the
> >> host CPU is in control over where and when to DMA into.
> >>
> >
> > That is, however, still a trade-off between saving that one copy and
> > protection from the DMA tampering with the packet contents when the
> > kernel is reading them. Notice how the copy effectively makes a
> > snapshot of the contents, guaranteeing that the kernel has a
> > consistent view of the packet, which is not true if the DMA could
> > modify the buffer contents in the middle of CPU accesses.
>
> I would say that the window just became so much narrower for the PCIe
> end-point to overwrite contents with the copy because it would have to
> happen within the dma_unmap_{page,single} time and before the copy is
> finished to the bounce buffer.

Not only. Imagine this:

a) Without bouncing:

- RX interrupt
- Pass the packet to the network stack
- Network stack validates the packet
- DMA overwrites the packet
- Network stack goes boom, because the packet changed after validation

b) With bouncing:

- RX interrupt
- Copy the packet to a DMA-inaccessible buffer
- Network stack validates the packet
- Network stack is happy, because the packet is guaranteed to stay the
same after validation

Best regards,
Tomasz

