Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25572368B4A
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 04:53:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115864.221110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZlwb-00029Z-BV; Fri, 23 Apr 2021 02:53:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115864.221110; Fri, 23 Apr 2021 02:53:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZlwb-00029A-87; Fri, 23 Apr 2021 02:53:25 +0000
Received: by outflank-mailman (input) for mailman id 115864;
 Fri, 23 Apr 2021 02:53:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6fiG=JU=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lZlwZ-000294-2H
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 02:53:23 +0000
Received: from mail-pj1-x1034.google.com (unknown [2607:f8b0:4864:20::1034])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 76c447c3-3565-493a-9f5b-bd598b913b0f;
 Fri, 23 Apr 2021 02:53:22 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 y22-20020a17090a8b16b0290150ae1a6d2bso493643pjn.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Apr 2021 19:53:22 -0700 (PDT)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com.
 [209.85.215.172])
 by smtp.gmail.com with ESMTPSA id u12sm6556784pji.45.2021.04.22.19.53.20
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 19:53:20 -0700 (PDT)
Received: by mail-pg1-f172.google.com with SMTP id f29so34216405pgm.8
 for <xen-devel@lists.xenproject.org>; Thu, 22 Apr 2021 19:53:20 -0700 (PDT)
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
X-Inumbo-ID: 76c447c3-3565-493a-9f5b-bd598b913b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=40nhsz+kltJTf7tq6pLLkes92lT1dy5Rll207DlKzWM=;
        b=HdsQJQRkixDre+dpQSVR58nl8K7T4MbrI4XmlnSivkYb875qGKmhwngqhS/XX43exh
         bg5Ne9Oub0puKLH8FRaSSn/FCuQxwpgf1ynisAFuTF4Wvjhe+t5iF+WotV6g96hB8Oro
         fWaQA0hAXWZxawu4WTORJsnwcVbFEg+0cCZO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=40nhsz+kltJTf7tq6pLLkes92lT1dy5Rll207DlKzWM=;
        b=MZsZ4pSPJ4dCVZHls6VtxP38cfYfnsQ7Bom6r+3BCIFm4701zGD4ar8Ehysye8QiLR
         D4md2hTJFvtQL8ULbgsW/2RSz3/00a9eyMPQXozVYffEtm7Yy/sZlcZhRCnMMQ0jZMf5
         MH5ksKnaIgYlN7DEM/L+WDuPXcsSOBQjLteVAXbPXVlZ0SsbPOc3oQ60hAA2sBIDX5aE
         IdWFJ8lDvIEcDUpqgfXbd64zgsaW+SscBAlgbCBOKx51cgLeC/0osLH+fGPUkObn7ZnY
         7YQLD0Vzi7zXAgmxaLJT9EOXn67KZI0HsdrBylZMNsL2TVb4DwQz39pKHN5JPLz76txk
         Gcvg==
X-Gm-Message-State: AOAM531mq1IdS6LJmsJts1cuZMkGQD+iwq2wRGCdZyS6/9QfunIOu+Zw
	kkLBAfLedatjODGVEmZ4s8+9fDNRtZWt4g==
X-Google-Smtp-Source: ABdhPJzWnUCvHFfO+w/TiuDRjCZ3wO/0KPZ96zCBEM4eWzT8b7FPGbUB5wyBYDOY8gwW5n4uPwDTbw==
X-Received: by 2002:a17:90a:6b4f:: with SMTP id x15mr3272223pjl.227.1619146400919;
        Thu, 22 Apr 2021 19:53:20 -0700 (PDT)
X-Received: by 2002:a6b:c913:: with SMTP id z19mr1627785iof.50.1619146389385;
 Thu, 22 Apr 2021 19:53:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210422081508.3942748-1-tientzu@chromium.org> <20210422081508.3942748-17-tientzu@chromium.org>
In-Reply-To: <20210422081508.3942748-17-tientzu@chromium.org>
From: Claire Chang <tientzu@chromium.org>
Date: Fri, 23 Apr 2021 10:52:58 +0800
X-Gmail-Original-Message-ID: <CALiNf29NzRTRB-0JbCL7=0qF0SAiER_pJ_-SCtVRA7DHCsSpEg@mail.gmail.com>
Message-ID: <CALiNf29NzRTRB-0JbCL7=0qF0SAiER_pJ_-SCtVRA7DHCsSpEg@mail.gmail.com>
Subject: Re: [PATCH v5 16/16] of: Add plumbing for restricted DMA pool
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, 
	boris.ostrovsky@oracle.com, jgross@suse.com, Christoph Hellwig <hch@lst.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: benh@kernel.crashing.org, paulus@samba.org, 
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
	Tomasz Figa <tfiga@chromium.org>, bskeggs@redhat.com, bhelgaas@google.com, 
	chris@chris-wilson.co.uk, daniel@ffwll.ch, airlied@linux.ie, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	jani.nikula@linux.intel.com, jxgao@google.com, 
	joonas.lahtinen@linux.intel.com, linux-pci@vger.kernel.org, 
	maarten.lankhorst@linux.intel.com, matthew.auld@intel.com, 
	nouveau@lists.freedesktop.org, rodrigo.vivi@intel.com, 
	thomas.hellstrom@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 22, 2021 at 4:17 PM Claire Chang <tientzu@chromium.org> wrote:
>
> If a device is not behind an IOMMU, we look up the device node and set
> up the restricted DMA when the restricted-dma-pool is presented.
>
> Signed-off-by: Claire Chang <tientzu@chromium.org>
> ---
>  drivers/of/address.c    | 25 +++++++++++++++++++++++++
>  drivers/of/device.c     |  3 +++
>  drivers/of/of_private.h |  5 +++++
>  3 files changed, 33 insertions(+)
>
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index 54f221dde267..fff3adfe4986 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -8,6 +8,7 @@
>  #include <linux/logic_pio.h>
>  #include <linux/module.h>
>  #include <linux/of_address.h>
> +#include <linux/of_reserved_mem.h>
>  #include <linux/pci.h>
>  #include <linux/pci_regs.h>
>  #include <linux/sizes.h>
> @@ -1109,6 +1110,30 @@ bool of_dma_is_coherent(struct device_node *np)
>  }
>  EXPORT_SYMBOL_GPL(of_dma_is_coherent);
>
> +int of_dma_set_restricted_buffer(struct device *dev)
> +{
> +       struct device_node *node;
> +       int count, i;
> +
> +       if (!dev->of_node)
> +               return 0;
> +
> +       count = of_property_count_elems_of_size(dev->of_node, "memory-region",
> +                                               sizeof(phandle));
> +       for (i = 0; i < count; i++) {
> +               node = of_parse_phandle(dev->of_node, "memory-region", i);
> +               /* There might be multiple memory regions, but only one
> +                * restriced-dma-pool region is allowed.
> +                */
> +               if (of_device_is_compatible(node, "restricted-dma-pool") &&
> +                   of_device_is_available(node))
> +                       return of_reserved_mem_device_init_by_idx(
> +                               dev, dev->of_node, i);
> +       }
> +
> +       return 0;
> +}
> +
>  /**
>   * of_mmio_is_nonposted - Check if device uses non-posted MMIO
>   * @np:        device node
> diff --git a/drivers/of/device.c b/drivers/of/device.c
> index c5a9473a5fb1..d8d865223e51 100644
> --- a/drivers/of/device.c
> +++ b/drivers/of/device.c
> @@ -165,6 +165,9 @@ int of_dma_configure_id(struct device *dev, struct device_node *np,
>
>         arch_setup_dma_ops(dev, dma_start, size, iommu, coherent);
>
> +       if (!iommu)
> +               return of_dma_set_restricted_buffer(dev);
> +
>         return 0;
>  }
>  EXPORT_SYMBOL_GPL(of_dma_configure_id);
> diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
> index d717efbd637d..e9237f5eff48 100644
> --- a/drivers/of/of_private.h
> +++ b/drivers/of/of_private.h
> @@ -163,12 +163,17 @@ struct bus_dma_region;
>  #if defined(CONFIG_OF_ADDRESS) && defined(CONFIG_HAS_DMA)
>  int of_dma_get_range(struct device_node *np,
>                 const struct bus_dma_region **map);
> +int of_dma_set_restricted_buffer(struct device *dev);
>  #else
>  static inline int of_dma_get_range(struct device_node *np,
>                 const struct bus_dma_region **map)
>  {
>         return -ENODEV;
>  }
> +static inline int of_dma_get_restricted_buffer(struct device *dev)

This one should be of_dma_set_restricted_buffer. Sorry for the typo.

> +{
> +       return -ENODEV;
> +}
>  #endif
>
>  #endif /* _LINUX_OF_PRIVATE_H */
> --
> 2.31.1.368.gbe11c130af-goog
>

