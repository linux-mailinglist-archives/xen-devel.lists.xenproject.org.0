Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC8337AC38
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 18:43:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125821.236855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgVTD-00025o-4e; Tue, 11 May 2021 16:42:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125821.236855; Tue, 11 May 2021 16:42:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgVTD-000225-0J; Tue, 11 May 2021 16:42:55 +0000
Received: by outflank-mailman (input) for mailman id 125821;
 Tue, 11 May 2021 16:42:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zMp2=KG=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lgVTB-0001hY-GC
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 16:42:53 +0000
Received: from mail-il1-x12e.google.com (unknown [2607:f8b0:4864:20::12e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 050f473c-5752-4b4d-a2bb-9a2dbe2cde7b;
 Tue, 11 May 2021 16:42:52 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id w13so5561926ilv.11
 for <xen-devel@lists.xenproject.org>; Tue, 11 May 2021 09:42:52 -0700 (PDT)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com.
 [209.85.166.44])
 by smtp.gmail.com with ESMTPSA id h14sm9744499ils.13.2021.05.11.09.42.50
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 09:42:51 -0700 (PDT)
Received: by mail-io1-f44.google.com with SMTP id z24so18806291ioj.7
 for <xen-devel@lists.xenproject.org>; Tue, 11 May 2021 09:42:50 -0700 (PDT)
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
X-Inumbo-ID: 050f473c-5752-4b4d-a2bb-9a2dbe2cde7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ll12iwWOH+g7rF+Qcvmc/ZPVWK50RY5A+TnwOnViek8=;
        b=jF9yywweDau5byF0sr7SVkFA9hoYDaWzF8iy+wyA9wHf9oOaCvA+67rLL4jVjSY9gn
         QoY25mdgO7IV1eEXpAEk5s63+vTygeFS39HRXfLrmhNXD74fIDm9qeLodCWWHbiJG3ic
         G2KrYNbeLupAhGANRLweLDvdOuGV9VrSQUJi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ll12iwWOH+g7rF+Qcvmc/ZPVWK50RY5A+TnwOnViek8=;
        b=sKPwvuxVX4eKie7Ocggs0RJvxLIz2PXwrJWaMU5KGxJS4Y45Flh4gqgAEX8wahj+u4
         Bi9JCxVOWHBynAbLtCGRhnoERXSjhzzr5kDsygcltGoj0j1BXGExCA14HkesIr2WK4A0
         Kkbknk7IuoYrlBG3Bm7olKRiG0JpVEuGoQx2KV2gxsCgVjgBOzQ0DgrHoKcVUklsgi/B
         APxy4MxD1H3dyfv4k0d3GYxRlsDRnxITvwBTcORZa43ktOVpZbkFZ6TrQNZsyWkjQUK8
         ul0VUTQSdXDozz4kUfP8zyHWvZ/wkfyHQ+jZNhkNdgayLcmrGO2/mGKI1B+MlT/ri3Us
         Jsjw==
X-Gm-Message-State: AOAM533LZHjmtfxtaHSz/NN8KVatpRqfaRC8/dDiP2bMJWAjQPONikfj
	s2K5iRYg3x5ZRFAO+BKRU2PnCHxRhK6klQ==
X-Google-Smtp-Source: ABdhPJyX5PM2ls3gC0Yqw37UDScBGrMqLOzONvLWeu4F5s1UFJw36+Tem/TNHfJ5s/PH6W2P0pfRAA==
X-Received: by 2002:a92:650d:: with SMTP id z13mr12888687ilb.193.1620751371621;
        Tue, 11 May 2021 09:42:51 -0700 (PDT)
X-Received: by 2002:a05:6e02:e82:: with SMTP id t2mr17831684ilj.18.1620751359226;
 Tue, 11 May 2021 09:42:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210510095026.3477496-1-tientzu@chromium.org>
 <20210510095026.3477496-5-tientzu@chromium.org> <20210510150256.GC28066@lst.de>
In-Reply-To: <20210510150256.GC28066@lst.de>
From: Claire Chang <tientzu@chromium.org>
Date: Wed, 12 May 2021 00:42:28 +0800
X-Gmail-Original-Message-ID: <CALiNf28jgAU7zN4pwgPKgaecM-KXRHHqwHj4sPXVf_3M0-goMQ@mail.gmail.com>
Message-ID: <CALiNf28jgAU7zN4pwgPKgaecM-KXRHHqwHj4sPXVf_3M0-goMQ@mail.gmail.com>
Subject: Re: [PATCH v6 04/15] swiotlb: Add restricted DMA pool initialization
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
> > +#ifdef CONFIG_DMA_RESTRICTED_POOL
> > +#include <linux/io.h>
> > +#include <linux/of.h>
> > +#include <linux/of_fdt.h>
> > +#include <linux/of_reserved_mem.h>
> > +#include <linux/slab.h>
> > +#endif
>
> I don't think any of this belongs into swiotlb.c.  Marking
> swiotlb_init_io_tlb_mem non-static and having all this code in a separate
> file is probably a better idea.

Will do in the next version.

>
> > +#ifdef CONFIG_DMA_RESTRICTED_POOL
> > +static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
> > +                                 struct device *dev)
> > +{
> > +     struct io_tlb_mem *mem = rmem->priv;
> > +     unsigned long nslabs = rmem->size >> IO_TLB_SHIFT;
> > +
> > +     if (dev->dma_io_tlb_mem)
> > +             return 0;
> > +
> > +     /* Since multiple devices can share the same pool, the private data,
> > +      * io_tlb_mem struct, will be initialized by the first device attached
> > +      * to it.
> > +      */
>
> This is not the normal kernel comment style.

Will fix this in the next version.

>
> > +#ifdef CONFIG_ARM
> > +             if (!PageHighMem(pfn_to_page(PHYS_PFN(rmem->base)))) {
> > +                     kfree(mem);
> > +                     return -EINVAL;
> > +             }
> > +#endif /* CONFIG_ARM */
>
> And this is weird.  Why would ARM have such a restriction?  And if we have
> such rstrictions it absolutely belongs into an arch helper.

Now I think the CONFIG_ARM can just be removed?
The goal here is to make sure we're using linear map and can safely
use phys_to_dma/dma_to_phys.

>
> > +             swiotlb_init_io_tlb_mem(mem, rmem->base, nslabs, false);
> > +
> > +             rmem->priv = mem;
> > +
> > +#ifdef CONFIG_DEBUG_FS
> > +             if (!debugfs_dir)
> > +                     debugfs_dir = debugfs_create_dir("swiotlb", NULL);
> > +
> > +             swiotlb_create_debugfs(mem, rmem->name, debugfs_dir);
>
> Doesn't the debugfs_create_dir belong into swiotlb_create_debugfs?  Also
> please use IS_ENABLEd or a stub to avoid ifdefs like this.

Will move it into swiotlb_create_debugfs and use IS_ENABLED in the next version.

