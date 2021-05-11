Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 431BE37AC39
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 18:43:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125820.236842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgVT7-0001li-RU; Tue, 11 May 2021 16:42:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125820.236842; Tue, 11 May 2021 16:42:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgVT7-0001jH-N9; Tue, 11 May 2021 16:42:49 +0000
Received: by outflank-mailman (input) for mailman id 125820;
 Tue, 11 May 2021 16:42:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zMp2=KG=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lgVT6-0001hY-G9
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 16:42:48 +0000
Received: from mail-il1-x132.google.com (unknown [2607:f8b0:4864:20::132])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d915ebd-c94f-43c5-ac1c-c15f2298bbad;
 Tue, 11 May 2021 16:42:44 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id e14so17682783ils.12
 for <xen-devel@lists.xenproject.org>; Tue, 11 May 2021 09:42:44 -0700 (PDT)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com.
 [209.85.166.175])
 by smtp.gmail.com with ESMTPSA id e12sm9510029ilu.75.2021.05.11.09.42.43
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 09:42:43 -0700 (PDT)
Received: by mail-il1-f175.google.com with SMTP id e14so17682746ils.12
 for <xen-devel@lists.xenproject.org>; Tue, 11 May 2021 09:42:43 -0700 (PDT)
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
X-Inumbo-ID: 3d915ebd-c94f-43c5-ac1c-c15f2298bbad
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k6jrKLJf+SUK032/zz9tWYcN5Rhay3mFZvhqIWgxNBs=;
        b=L/Y31OZjVAvXas4gAOFGDpY1O+WckxTleHtLR2a6rScOLannRZ4axVg75JGljNN3EA
         40xB287W01zuvyDHYZFS2WLSs1CG9A82KNV8OVT7o92X2FrRRw8J292qbL27/DexCkE7
         qg4XvM9gaQyzYYNGyObKTqbnr0WqygwnwiYxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k6jrKLJf+SUK032/zz9tWYcN5Rhay3mFZvhqIWgxNBs=;
        b=qi9HAk2mZKOK7azzeL1ApiPC6ZUiyLlDxDxHB2Z4yfVxR/d5iza+XLLkuAfxkl+vMA
         oYG7geV1Kwe8/cHIDGb3sp6HGI/gOEAftBj0E0Ebb/zBg8wKx60eNSRufSdDoGBYOig1
         9QXnUYrRTeOAuYuAcUzDDIidGmC7f5Kx72RIz+bEue8XaZ/nzZUaKRICAhpdgbd8eOSf
         Bo2YkolWYF8ziW35VJqdzrFaNUD6RES+RggMMWuSAk+bYWL2xxzfTsh5A3RTEEgDMUAC
         Hu51CdwirMqiMBq6exBGa2vvrnLeXO6iTvzFjue++6cVainroyWKH95cJjTGNe7Rs2ze
         yfbw==
X-Gm-Message-State: AOAM532U6YZp36/6zcvIQ43dDm5uO4duXt6yGFKVZnIkkZ9ld83qgBch
	IeGuUbxur0ySE+Q+xKM6X/7V9ES3cqdVpg==
X-Google-Smtp-Source: ABdhPJyA7xOvwHKtF7Olq5cAg7RoArKuUB7s4jupLnPyLDy7B8jFQJMzAuWn8oWUqWKGVlxHH5+q0A==
X-Received: by 2002:a05:6e02:10c5:: with SMTP id s5mr28665397ilj.88.1620751363980;
        Tue, 11 May 2021 09:42:43 -0700 (PDT)
X-Received: by 2002:a6b:7b08:: with SMTP id l8mr22174004iop.50.1620751352978;
 Tue, 11 May 2021 09:42:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210510095026.3477496-1-tientzu@chromium.org>
 <20210510095026.3477496-6-tientzu@chromium.org> <20210510150342.GD28066@lst.de>
In-Reply-To: <20210510150342.GD28066@lst.de>
From: Claire Chang <tientzu@chromium.org>
Date: Wed, 12 May 2021 00:42:22 +0800
X-Gmail-Original-Message-ID: <CALiNf2_7mHuMG5DTQD0GsriN=vuX0ytyUn4rxEmsK2iP3PKV+w@mail.gmail.com>
Message-ID: <CALiNf2_7mHuMG5DTQD0GsriN=vuX0ytyUn4rxEmsK2iP3PKV+w@mail.gmail.com>
Subject: Re: [PATCH v6 05/15] swiotlb: Add a new get_io_tlb_mem getter
To: Christoph Hellwig <hch@lst.de>
Cc: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com, jgross@suse.com, 
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
	matthew.auld@intel.com, nouveau@lists.freedesktop.org, rodrigo.vivi@intel.com, 
	thomas.hellstrom@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

On Mon, May 10, 2021 at 11:03 PM Christoph Hellwig <hch@lst.de> wrote:
>
> > +static inline struct io_tlb_mem *get_io_tlb_mem(struct device *dev)
> > +{
> > +#ifdef CONFIG_DMA_RESTRICTED_POOL
> > +     if (dev && dev->dma_io_tlb_mem)
> > +             return dev->dma_io_tlb_mem;
> > +#endif /* CONFIG_DMA_RESTRICTED_POOL */
> > +
> > +     return io_tlb_default_mem;
>
> Given that we're also looking into a not addressing restricted pool
> I'd rather always assign the active pool to dev->dma_io_tlb_mem and
> do away with this helper.

Where do you think is the proper place to do the assignment? First
time calling swiotlb_map? or in of_dma_configure_id?

