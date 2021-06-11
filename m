Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7CE3A4596
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jun 2021 17:38:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.140532.259628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrjEl-0001Zn-J5; Fri, 11 Jun 2021 15:38:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 140532.259628; Fri, 11 Jun 2021 15:38:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrjEl-0001X8-Fx; Fri, 11 Jun 2021 15:38:23 +0000
Received: by outflank-mailman (input) for mailman id 140532;
 Fri, 11 Jun 2021 15:38:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9xgm=LF=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lrjEk-0001X2-KE
 for xen-devel@lists.xenproject.org; Fri, 11 Jun 2021 15:38:22 +0000
Received: from mail-qk1-x733.google.com (unknown [2607:f8b0:4864:20::733])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 346940d3-df7f-42d8-b61d-194b104e03b9;
 Fri, 11 Jun 2021 15:38:21 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id i68so27785135qke.3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Jun 2021 08:38:21 -0700 (PDT)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com.
 [209.85.222.182])
 by smtp.gmail.com with ESMTPSA id m6sm1443914qtu.11.2021.06.11.08.38.20
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 08:38:20 -0700 (PDT)
Received: by mail-qk1-f182.google.com with SMTP id i67so31355426qkc.4
 for <xen-devel@lists.xenproject.org>; Fri, 11 Jun 2021 08:38:20 -0700 (PDT)
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
X-Inumbo-ID: 346940d3-df7f-42d8-b61d-194b104e03b9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=89FDdm5otB6kfSIY1wN8GtI+ciQx5v+glSl+A+k1+x0=;
        b=UdgbVNlCM2Z2m4AZZMvHuq5iZqq6a6B1k1NgNWN8Vbr0FhlXEkOMcXQOmqkTt81W9l
         ZZvZ8qEfilw4IVJQmcyphxlOFoGk0yzalYprjSKjTm0i0iDciVsO4hDbAAQ2CGlI10y9
         ZbSgy3asVidQE8sG2vEkYEnh2JJM0V3DCy6O0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=89FDdm5otB6kfSIY1wN8GtI+ciQx5v+glSl+A+k1+x0=;
        b=YHqtc7qxT7LVIJE3jt3gDQElnWEtvnlL5+sLz9HKx3J16HnYKqt4rpbgNz/Ba4ADG7
         o3xT9Z4CA0TvGQDfYfPZt7PUMW240yh/exKYUaFn24XdA1x2VB4unnc2hGRmZXOyyeFd
         9C7ePzrLGXdEkOylOZ7Wntsv35qAogEojfVvEm/4uSNRy76GgHFn5fp3WrGgp8mLqCEQ
         YzsS1i7Rm2WvK6YUQyHolEZFKmpChK16IhTagcqSSKT9tNmK1shK5zo5yDUu+wT6O/ts
         bb70np+s/+kRH+fdOcjBDgpZ8M/VKgNm189gAqdTDTP24YJAiGKUP/G6ZrYhLAzH/VhI
         OO0g==
X-Gm-Message-State: AOAM531p42v15/ZjRYPqxB//ZLDV6uHzpjvTVFmA8omYscynUG+DU9Mo
	k1UPkHIEd42wV/Gig4rW1R9jAzUwZlojnQ==
X-Google-Smtp-Source: ABdhPJwMC1prIQvPDYrypw8NApA4dBm6Sd0gXpL8QAl8rTywG+b5yUOwR/7o5F0qlG19UvrTnhRvKA==
X-Received: by 2002:a05:620a:2148:: with SMTP id m8mr4447125qkm.190.1623425901157;
        Fri, 11 Jun 2021 08:38:21 -0700 (PDT)
X-Received: by 2002:a05:6638:151:: with SMTP id y17mr4471864jao.128.1623425522838;
 Fri, 11 Jun 2021 08:32:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210527125845.1852284-1-tientzu@chromium.org>
 <20210604174818.GC3703@willie-the-truck> <CALiNf29=z2uBM1ZA_GTu04iFS2dJwH0npdGvid1PL5KQM_HrxA@mail.gmail.com>
In-Reply-To: <CALiNf29=z2uBM1ZA_GTu04iFS2dJwH0npdGvid1PL5KQM_HrxA@mail.gmail.com>
From: Claire Chang <tientzu@chromium.org>
Date: Fri, 11 Jun 2021 23:31:52 +0800
X-Gmail-Original-Message-ID: <CALiNf29RGoFq7L+t_Bi6TsE-93-=m49DdV6QrVBV=pvoAjKsvw@mail.gmail.com>
Message-ID: <CALiNf29RGoFq7L+t_Bi6TsE-93-=m49DdV6QrVBV=pvoAjKsvw@mail.gmail.com>
Subject: Re: [PATCH v8 00/15] Restricted DMA
To: Will Deacon <will@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au, Joerg Roedel <joro@8bytes.org>, 
	Frank Rowand <frowand.list@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, 
	boris.ostrovsky@oracle.com, jgross@suse.com, Christoph Hellwig <hch@lst.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, benh@kernel.crashing.org, paulus@samba.org, 
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, sstabellini@kernel.org, 
	Robin Murphy <robin.murphy@arm.com>, grant.likely@arm.com, xypron.glpk@gmx.de, 
	Thierry Reding <treding@nvidia.com>, mingo@kernel.org, bauerman@linux.ibm.com, 
	peterz@infradead.org, Greg KH <gregkh@linuxfoundation.org>, 
	Saravana Kannan <saravanak@google.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, 
	heikki.krogerus@linux.intel.com, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Dan Williams <dan.j.williams@intel.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, 
	linux-devicetree <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, 
	linuxppc-dev@lists.ozlabs.org, xen-devel@lists.xenproject.org, 
	Nicolas Boichat <drinkcat@chromium.org>, Jim Quinlan <james.quinlan@broadcom.com>, 
	Tomasz Figa <tfiga@chromium.org>, bskeggs@redhat.com, 
	Bjorn Helgaas <bhelgaas@google.com>, chris@chris-wilson.co.uk, 
	Daniel Vetter <daniel@ffwll.ch>, airlied@linux.ie, dri-devel@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com, 
	Jianxiong Gao <jxgao@google.com>, joonas.lahtinen@linux.intel.com, 
	linux-pci@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
	matthew.auld@intel.com, rodrigo.vivi@intel.com, 
	thomas.hellstrom@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

v9 here: https://lore.kernel.org/patchwork/cover/1445081/

On Mon, Jun 7, 2021 at 11:28 AM Claire Chang <tientzu@chromium.org> wrote:
>
> On Sat, Jun 5, 2021 at 1:48 AM Will Deacon <will@kernel.org> wrote:
> >
> > Hi Claire,
> >
> > On Thu, May 27, 2021 at 08:58:30PM +0800, Claire Chang wrote:
> > > This series implements mitigations for lack of DMA access control on
> > > systems without an IOMMU, which could result in the DMA accessing the
> > > system memory at unexpected times and/or unexpected addresses, possibly
> > > leading to data leakage or corruption.
> > >
> > > For example, we plan to use the PCI-e bus for Wi-Fi and that PCI-e bus is
> > > not behind an IOMMU. As PCI-e, by design, gives the device full access to
> > > system memory, a vulnerability in the Wi-Fi firmware could easily escalate
> > > to a full system exploit (remote wifi exploits: [1a], [1b] that shows a
> > > full chain of exploits; [2], [3]).
> > >
> > > To mitigate the security concerns, we introduce restricted DMA. Restricted
> > > DMA utilizes the existing swiotlb to bounce streaming DMA in and out of a
> > > specially allocated region and does memory allocation from the same region.
> > > The feature on its own provides a basic level of protection against the DMA
> > > overwriting buffer contents at unexpected times. However, to protect
> > > against general data leakage and system memory corruption, the system needs
> > > to provide a way to restrict the DMA to a predefined memory region (this is
> > > usually done at firmware level, e.g. MPU in ATF on some ARM platforms [4]).
> > >
> > > [1a] https://googleprojectzero.blogspot.com/2017/04/over-air-exploiting-broadcoms-wi-fi_4.html
> > > [1b] https://googleprojectzero.blogspot.com/2017/04/over-air-exploiting-broadcoms-wi-fi_11.html
> > > [2] https://blade.tencent.com/en/advisories/qualpwn/
> > > [3] https://www.bleepingcomputer.com/news/security/vulnerabilities-found-in-highly-popular-firmware-for-wifi-chips/
> > > [4] https://github.com/ARM-software/arm-trusted-firmware/blob/master/plat/mediatek/mt8183/drivers/emi_mpu/emi_mpu.c#L132
> > >
> > > v8:
> > > - Fix reserved-memory.txt and add the reg property in example.
> > > - Fix sizeof for of_property_count_elems_of_size in
> > >   drivers/of/address.c#of_dma_set_restricted_buffer.
> > > - Apply Will's suggestion to try the OF node having DMA configuration in
> > >   drivers/of/address.c#of_dma_set_restricted_buffer.
> > > - Fix typo in the comment of drivers/of/address.c#of_dma_set_restricted_buffer.
> > > - Add error message for PageHighMem in
> > >   kernel/dma/swiotlb.c#rmem_swiotlb_device_init and move it to
> > >   rmem_swiotlb_setup.
> > > - Fix the message string in rmem_swiotlb_setup.
> >
> > Thanks for the v8. It works for me out of the box on arm64 under KVM, so:
> >
> > Tested-by: Will Deacon <will@kernel.org>
> >
> > Note that something seems to have gone wrong with the mail threading, so
> > the last 5 patches ended up as a separate thread for me. Probably worth
> > posting again with all the patches in one place, if you can.
>
> Thanks for testing.
>
> Christoph also added some comments in v7, so I'll prepare v9.
>
> >
> > Cheers,
> >
> > Will

