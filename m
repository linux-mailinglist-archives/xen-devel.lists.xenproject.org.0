Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF032F2925
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 08:48:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65499.116065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzEPp-0000Wg-9B; Tue, 12 Jan 2021 07:48:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65499.116065; Tue, 12 Jan 2021 07:48:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzEPp-0000WG-4d; Tue, 12 Jan 2021 07:48:33 +0000
Received: by outflank-mailman (input) for mailman id 65499;
 Tue, 12 Jan 2021 07:48:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YNLj=GP=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1kzEPo-0000WA-33
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 07:48:32 +0000
Received: from mail-io1-xd2b.google.com (unknown [2607:f8b0:4864:20::d2b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 04f8e8f9-dc61-49e3-86f1-b67b1ffd5e7b;
 Tue, 12 Jan 2021 07:48:31 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id w18so2167973iot.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Jan 2021 23:48:31 -0800 (PST)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com.
 [209.85.166.48])
 by smtp.gmail.com with ESMTPSA id r21sm1427051ioa.20.2021.01.11.23.48.29
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 23:48:29 -0800 (PST)
Received: by mail-io1-f48.google.com with SMTP id u17so2155299iow.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Jan 2021 23:48:29 -0800 (PST)
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
X-Inumbo-ID: 04f8e8f9-dc61-49e3-86f1-b67b1ffd5e7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M6gti34JNoWz5z3B8Kij1up+0ymqSqmekx/99+4faKU=;
        b=X6l/XLromsTlU6NHa0DWJ/v5avCPE+tbWy6cx1R1IpoHKfbhgU6MF+gZNi4A3oZMQA
         aDXLX9RnsLGW3PS+TKQP3dv3P0XkS3dWXlHp8BVT2WpAIYitmTledVhp8sQu29+3epTn
         3vsNGErl3t1pJGKPEpwPU9LYUv1Ianz/yayzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M6gti34JNoWz5z3B8Kij1up+0ymqSqmekx/99+4faKU=;
        b=GfCjVjA3wk2G0DNTq1MO8zOmGJT0BCL3yvyJ/ZWBKGvmxFDgPzN+rf8TsFTgrdR3fJ
         nIUR1iaQZ19UhRy3+eddJCExE6EtSeGxEQT5m+jBiFLCtD9g4Yt1NJq78mvtvPAUgjoC
         0ZjpuQDGvhloFkfx3xxNYtGyR0XSjjg5tpDXiz0vHt9NkMF9MLq/CH8S2upwqZRgwkK1
         s9DQ+EXiM/mj6tB2UdNTy9b1xJafSjSXY0m7IV9cKXH/o86g6ISyhZnJWbY/5wA0hApS
         w5B1U1GWGeaZEWe3Ix8JaFkg1yJuNzMhJBpQxXeCdjnrSorr1gxxXwnnwawFSWd5jYzZ
         peaQ==
X-Gm-Message-State: AOAM530gDbcpPLiqyhCwWQibsEGCUlkXv2AljxyE5HIpRaJZxJZKeKSF
	iIsJXgS2dSX+bVNNZEKbCnygJkBoHqJ4Gzsv
X-Google-Smtp-Source: ABdhPJwV2CrauIDef7iD6KqZAS3Y6a5g3bf2yWZotqHmbTbstSDuHWrWfhguk7+2EMCVdXAFbcp4ng==
X-Received: by 2002:a92:180b:: with SMTP id 11mr2859179ily.30.1610437710216;
        Mon, 11 Jan 2021 23:48:30 -0800 (PST)
X-Received: by 2002:a6b:7f0b:: with SMTP id l11mr2402150ioq.34.1610437707606;
 Mon, 11 Jan 2021 23:48:27 -0800 (PST)
MIME-Version: 1.0
References: <20210106034124.30560-1-tientzu@chromium.org> <d7043239-12cf-3636-4726-2e3b90917dc6@gmail.com>
 <CALiNf28sU1VtGB7LeTXExkMwQiCeg8N5arqyEjw0CPZP72R4dg@mail.gmail.com> <78871151-947d-b085-db03-0d0bd0b55632@gmail.com>
In-Reply-To: <78871151-947d-b085-db03-0d0bd0b55632@gmail.com>
From: Claire Chang <tientzu@chromium.org>
Date: Tue, 12 Jan 2021 15:48:16 +0800
X-Gmail-Original-Message-ID: <CALiNf29_PmLJTVLksSHp3NFAaL52idqehSMOtatJ=jaM2Muq1g@mail.gmail.com>
Message-ID: <CALiNf29_PmLJTVLksSHp3NFAaL52idqehSMOtatJ=jaM2Muq1g@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/6] Restricted DMA
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au, benh@kernel.crashing.org, 
	paulus@samba.org, 
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, Joerg Roedel <joro@8bytes.org>, will@kernel.org, 
	Frank Rowand <frowand.list@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, 
	boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org, 
	Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, grant.likely@arm.com, xypron.glpk@gmx.de, 
	Thierry Reding <treding@nvidia.com>, mingo@kernel.org, bauerman@linux.ibm.com, 
	peterz@infradead.org, Greg KH <gregkh@linuxfoundation.org>, 
	Saravana Kannan <saravanak@google.com>, rafael.j.wysocki@intel.com, 
	heikki.krogerus@linux.intel.com, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, rdunlap@infradead.org, 
	dan.j.williams@intel.com, Bartosz Golaszewski <bgolaszewski@baylibre.com>, 
	linux-devicetree <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, 
	linuxppc-dev@lists.ozlabs.org, xen-devel@lists.xenproject.org, 
	Tomasz Figa <tfiga@chromium.org>, Nicolas Boichat <drinkcat@chromium.org>, 
	Jim Quinlan <james.quinlan@broadcom.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 8, 2021 at 1:59 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> On 1/7/21 9:42 AM, Claire Chang wrote:
>
> >> Can you explain how ATF gets involved and to what extent it does help,
> >> besides enforcing a secure region from the ARM CPU's perpsective? Does
> >> the PCIe root complex not have an IOMMU but can somehow be denied access
> >> to a region that is marked NS=0 in the ARM CPU's MMU? If so, that is
> >> still some sort of basic protection that the HW enforces, right?
> >
> > We need the ATF support for memory MPU (memory protection unit).
> > Restricted DMA (with reserved-memory in dts) makes sure the predefined memory
> > region is for PCIe DMA only, but we still need MPU to locks down PCIe access to
> > that specific regions.
>
> OK so you do have a protection unit of some sort to enforce which region
> in DRAM the PCIE bridge is allowed to access, that makes sense,
> otherwise the restricted DMA region would only be a hint but nothing you
> can really enforce. This is almost entirely analogous to our systems then.

Here is the example of setting the MPU:
https://github.com/ARM-software/arm-trusted-firmware/blob/master/plat/mediatek/mt8183/drivers/emi_mpu/emi_mpu.c#L132

>
> There may be some value in standardizing on an ARM SMCCC call then since
> you already support two different SoC vendors.
>
> >
> >>
> >> On Broadcom STB SoCs we have had something similar for a while however
> >> and while we don't have an IOMMU for the PCIe bridge, we do have a a
> >> basic protection mechanism whereby we can configure a region in DRAM to
> >> be PCIe read/write and CPU read/write which then gets used as the PCIe
> >> inbound region for the PCIe EP. By default the PCIe bridge is not
> >> allowed access to DRAM so we must call into a security agent to allow
> >> the PCIe bridge to access the designated DRAM region.
> >>
> >> We have done this using a private CMA area region assigned via Device
> >> Tree, assigned with a and requiring the PCIe EP driver to use
> >> dma_alloc_from_contiguous() in order to allocate from this device
> >> private CMA area. The only drawback with that approach is that it
> >> requires knowing how much memory you need up front for buffers and DMA
> >> descriptors that the PCIe EP will need to process. The problem is that
> >> it requires driver modifications and that does not scale over the number
> >> of PCIe EP drivers, some we absolutely do not control, but there is no
> >> need to bounce buffer. Your approach scales better across PCIe EP
> >> drivers however it does require bounce buffering which could be a
> >> performance hit.
> >
> > Only the streaming DMA (map/unmap) needs bounce buffering.
>
> True, and typically only on transmit since you don't really control
> where the sk_buff are allocated from, right? On RX since you need to
> hand buffer addresses to the WLAN chip prior to DMA, you can allocate
> them from a pool that already falls within the restricted DMA region, right?
>

Right, but applying bounce buffering to RX will make it more secure.
The device won't be able to modify the content after unmap. Just like what
iommu_unmap does.

> > I also added alloc/free support in this series
> > (https://lore.kernel.org/patchwork/patch/1360995/), so dma_direct_alloc() will
> > try to allocate memory from the predefined memory region.
> >
> > As for the performance hit, it should be similar to the default swiotlb.
> > Here are my experiment results. Both SoCs lack IOMMU for PCIe.
> >
> > PCIe wifi vht80 throughput -
> >
> >   MTK SoC                  tcp_tx     tcp_rx    udp_tx   udp_rx
> >   w/o Restricted DMA  244.1     134.66   312.56   350.79
> >   w/ Restricted DMA    246.95   136.59   363.21   351.99
> >
> >   Rockchip SoC           tcp_tx     tcp_rx    udp_tx   udp_rx
> >   w/o Restricted DMA  237.87   133.86   288.28   361.88
> >   w/ Restricted DMA    256.01   130.95   292.28   353.19
>
> How come you get better throughput with restricted DMA? Is it because
> doing DMA to/from a contiguous region allows for better grouping of
> transactions from the DRAM controller's perspective somehow?

I'm not sure, but actually, enabling the default swiotlb for wifi also helps the
throughput a little bit for me.

>
> >
> > The CPU usage doesn't increase too much either.
> > Although I didn't measure the CPU usage very precisely, it's ~3% with a single
> > big core (Cortex-A72) and ~5% with a single small core (Cortex-A53).
> >
> > Thanks!
> >
> >>
> >> Thanks!
> >> --
> >> Florian
>
>
> --
> Florian

