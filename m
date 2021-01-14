Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5F52F5D10
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 10:16:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66895.119014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzyjY-0003Cu-QG; Thu, 14 Jan 2021 09:16:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66895.119014; Thu, 14 Jan 2021 09:16:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzyjY-0003CV-Mj; Thu, 14 Jan 2021 09:16:00 +0000
Received: by outflank-mailman (input) for mailman id 66895;
 Thu, 14 Jan 2021 09:15:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xoDU=GR=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1kzyjX-0003CP-KH
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 09:15:59 +0000
Received: from mail-io1-xd2a.google.com (unknown [2607:f8b0:4864:20::d2a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 879f667b-f9b3-4bc8-8a5a-021b6ee743bc;
 Thu, 14 Jan 2021 09:15:58 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id z5so9737492iob.11
 for <xen-devel@lists.xenproject.org>; Thu, 14 Jan 2021 01:15:58 -0800 (PST)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com.
 [209.85.166.53])
 by smtp.gmail.com with ESMTPSA id 1sm3361888ilv.37.2021.01.14.01.15.57
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 01:15:57 -0800 (PST)
Received: by mail-io1-f53.google.com with SMTP id z5so9737421iob.11
 for <xen-devel@lists.xenproject.org>; Thu, 14 Jan 2021 01:15:57 -0800 (PST)
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
X-Inumbo-ID: 879f667b-f9b3-4bc8-8a5a-021b6ee743bc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XoX/j54i0jG8qEsxZKby76Lqj61QzippjPHzsTsj+5Y=;
        b=nY1GnsLlZi0Sxxm+zSGIGaqKpSxx6JueftrzPps7oTAcG91/bM9YfHLXW3YxSFcLzK
         y6cH1olpZ/FXA0Mp0cE9+mqoheJMPU0KT0091/GVtf67wUxU6MGGIWncH2X6oPgNN5KO
         QvrKMhyV8u8UB5lLj67P7d++Su0Uyq/z5gAtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XoX/j54i0jG8qEsxZKby76Lqj61QzippjPHzsTsj+5Y=;
        b=ecIwTEZFA1gcBY3mm0WGRqDnpbRqkTt1CLyPv4GdzMWcMFUqe9kFq5nReUJKQ1HaiX
         XZyLgb3e4In+GmzGLAHg78ftjKVEB1vkOz3mb8icapoxE+FqH/naF9J+2n34urpLQ3eh
         66TyBpMY2GdPg9enKX/9uQzxmZHMFIRnL0d8jncT6Vk8fM0hCfYEEYKiMj8EiAa3EshX
         e/3ELvUEmyTh2aqG6PYsuXy7FigNnC+WeNbd43sONvF+BphyQ1PRWgKbaLgIObPOkKll
         sqCX6ltflTAsOGeHzA8XCKUBkVQCGEHuE39Tu8K8JsKtqk5rdXOzS6St/u7TH9SZhtG1
         VN7Q==
X-Gm-Message-State: AOAM530dQLEaCh75W/xAMor/lGw3AAIyyuhC2KeKYcO6eRF8sIWQTRTH
	YuECA+KQ0w3pje7jG18VjEXEOop3Rncipg==
X-Google-Smtp-Source: ABdhPJyHJduQNPYElVsHVtLk5QKEO3UgY0mCa/wfEjP2+6Mc+vbVqlswiVNcrQHYQJFrIGTySRx20A==
X-Received: by 2002:a02:caac:: with SMTP id e12mr5532360jap.45.1610615758092;
        Thu, 14 Jan 2021 01:15:58 -0800 (PST)
X-Received: by 2002:a92:c206:: with SMTP id j6mr5789564ilo.189.1610615314989;
 Thu, 14 Jan 2021 01:08:34 -0800 (PST)
MIME-Version: 1.0
References: <20210106034124.30560-1-tientzu@chromium.org> <20210106034124.30560-7-tientzu@chromium.org>
 <95e6dd76-5e18-e445-c351-19fba18f36de@gmail.com>
In-Reply-To: <95e6dd76-5e18-e445-c351-19fba18f36de@gmail.com>
From: Claire Chang <tientzu@chromium.org>
Date: Thu, 14 Jan 2021 17:08:24 +0800
X-Gmail-Original-Message-ID: <CALiNf29+8Yi93RacsZHr=qYBhQRwqujW6KZVVD=9xPMhpLH5pA@mail.gmail.com>
Message-ID: <CALiNf29+8Yi93RacsZHr=qYBhQRwqujW6KZVVD=9xPMhpLH5pA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 6/6] of: Add plumbing for restricted DMA pool
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au, benh@kernel.crashing.org, 
	paulus@samba.org, 
	"list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg Roedel <joro@8bytes.org>," <joro@8bytes.org>, will@kernel.org, Frank Rowand <frowand.list@gmail.com>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com, jgross@suse.com, 
	sstabellini@kernel.org, Christoph Hellwig <hch@lst.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, grant.likely@arm.com, 
	xypron.glpk@gmx.de, Thierry Reding <treding@nvidia.com>, mingo@kernel.org, 
	bauerman@linux.ibm.com, peterz@infradead.org, 
	Greg KH <gregkh@linuxfoundation.org>, Saravana Kannan <saravanak@google.com>, 
	rafael.j.wysocki@intel.com, heikki.krogerus@linux.intel.com, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, rdunlap@infradead.org, 
	dan.j.williams@intel.com, Bartosz Golaszewski <bgolaszewski@baylibre.com>, 
	linux-devicetree <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, 
	linuxppc-dev@lists.ozlabs.org, 
	"list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>, xen-devel@lists.xenproject.org, 
	Tomasz Figa <tfiga@chromium.org>, Nicolas Boichat <drinkcat@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 13, 2021 at 7:48 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> On 1/5/21 7:41 PM, Claire Chang wrote:
> > If a device is not behind an IOMMU, we look up the device node and set
> > up the restricted DMA when the restricted-dma-pool is presented.
> >
> > Signed-off-by: Claire Chang <tientzu@chromium.org>
> > ---
>
> [snip]
>
> > +int of_dma_set_restricted_buffer(struct device *dev)
> > +{
> > +     struct device_node *node;
> > +     int count, i;
> > +
> > +     if (!dev->of_node)
> > +             return 0;
> > +
> > +     count = of_property_count_elems_of_size(dev->of_node, "memory-region",
> > +                                             sizeof(phandle));
>
> You could have an early check for count < 0, along with an error
> message, if that is deemed useful.
>
> > +     for (i = 0; i < count; i++) {
> > +             node = of_parse_phandle(dev->of_node, "memory-region", i);
> > +             if (of_device_is_compatible(node, "restricted-dma-pool"))
>
> And you may want to add here an of_device_is_available(node). A platform
> that provides the Device Tree firmware and try to support multiple
> different SoCs may try to determine if an IOMMU is present, and if it
> is, it could be marking the restriced-dma-pool region with a 'status =
> "disabled"' property, or any variant of that scheme.

This function is called only when there is no IOMMU present (check in
drivers/of/device.c). I can still add of_device_is_available(node)
here if you think it's helpful.

>
> > +                     return of_reserved_mem_device_init_by_idx(
> > +                             dev, dev->of_node, i);
>
> This does not seem to be supporting more than one memory region, did not
> you want something like instead:
>
>                 ret = of_reserved_mem_device_init_by_idx(...);
>                 if (ret)
>                         return ret;
>

Yes. This implement only supports one restriced-dma-pool memory region
with the assumption that there is only one memory region with the
compatible string, restricted-dma-pool, in the dts. IIUC, it's similar
to shared-dma-pool.


> > +     }
> > +
> > +     return 0;
> > +}
> > diff --git a/drivers/of/device.c b/drivers/of/device.c
> > index aedfaaafd3e7..e2c7409956ab 100644
> > --- a/drivers/of/device.c
> > +++ b/drivers/of/device.c
> > @@ -182,6 +182,10 @@ int of_dma_configure_id(struct device *dev, struct device_node *np,
> >       arch_setup_dma_ops(dev, dma_start, size, iommu, coherent);
> >
> >       dev->dma_range_map = map;
> > +
> > +     if (!iommu)
> > +             return of_dma_set_restricted_buffer(dev);
> > +
> >       return 0;
> >  }
> >  EXPORT_SYMBOL_GPL(of_dma_configure_id);
> > diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
> > index d9e6a324de0a..28a2dfa197ba 100644
> > --- a/drivers/of/of_private.h
> > +++ b/drivers/of/of_private.h
> > @@ -161,12 +161,17 @@ struct bus_dma_region;
> >  #if defined(CONFIG_OF_ADDRESS) && defined(CONFIG_HAS_DMA)
> >  int of_dma_get_range(struct device_node *np,
> >               const struct bus_dma_region **map);
> > +int of_dma_set_restricted_buffer(struct device *dev);
> >  #else
> >  static inline int of_dma_get_range(struct device_node *np,
> >               const struct bus_dma_region **map)
> >  {
> >       return -ENODEV;
> >  }
> > +static inline int of_dma_get_restricted_buffer(struct device *dev)
> > +{
> > +     return -ENODEV;
> > +}
> >  #endif
> >
> >  #endif /* _LINUX_OF_PRIVATE_H */
> >
>
>
> --
> Florian

