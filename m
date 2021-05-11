Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 390CD37AC5D
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 18:49:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125838.236877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgVZf-0003wC-69; Tue, 11 May 2021 16:49:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125838.236877; Tue, 11 May 2021 16:49:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgVZf-0003uM-32; Tue, 11 May 2021 16:49:35 +0000
Received: by outflank-mailman (input) for mailman id 125838;
 Tue, 11 May 2021 16:49:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zMp2=KG=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lgVZc-0003uC-Pz
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 16:49:32 +0000
Received: from mail-pl1-x629.google.com (unknown [2607:f8b0:4864:20::629])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0ad1915d-8cff-49f4-a766-d6be041b6bad;
 Tue, 11 May 2021 16:49:32 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id t4so11116120plc.6
 for <xen-devel@lists.xenproject.org>; Tue, 11 May 2021 09:49:32 -0700 (PDT)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com.
 [209.85.210.178])
 by smtp.gmail.com with ESMTPSA id x79sm14157839pfc.57.2021.05.11.09.49.30
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 09:49:30 -0700 (PDT)
Received: by mail-pf1-f178.google.com with SMTP id h127so16492772pfe.9
 for <xen-devel@lists.xenproject.org>; Tue, 11 May 2021 09:49:30 -0700 (PDT)
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
X-Inumbo-ID: 0ad1915d-8cff-49f4-a766-d6be041b6bad
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I574vs+oxpmw2RaQkdeqT3TmVa8C0vE6HCQzgLmVaEk=;
        b=EO4zcKQD13cnMpJi5k5sqZg36m/uhjFrv+x7tUEK/JnHkDgZTOULzljGCah93D1FN5
         SwmaT+lt9As201TL9V65C0BiJShCnGyDe8UgjgY5Jm1YBpkuQxrN8+e9OJjS8RpeP4ih
         4tasAkIoShr42ndvrMVih2QtviIwqYbb0WQHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I574vs+oxpmw2RaQkdeqT3TmVa8C0vE6HCQzgLmVaEk=;
        b=iii7wuCT3ZKQpkHdp4/6kEwB/wtf6+jyIune2L3kUAzHi3VwGE+H/z6eIs9KG63JyI
         nQGKwUKfWWH0E21nOUEbYu/76X59hUhP9zTo8B/sgbN3xEjm4ZePz3EUdqaH+yGKjDc4
         +hEror5q+ZC8gKI2cpMr9uv43cjJKOE8OOpYumhAoKbOn8J46QSVzlhknpiFIIviHHs0
         1Qaoaz8hS7GlMgRe6HjWJmM+qLpegmgDKA7hsqxuwAfnQfZjrBQoKiSfsSBtyug+mfSQ
         n+VykFN+oS81iackGuQfELn4w3S41EPPDpivWoDDYM/wxiy1jUb7ex02X6GZmywQvxE9
         GjIw==
X-Gm-Message-State: AOAM532wXhY9uSMFSeIcFr2Zb7e+D436d4SNilKbZ6xNV8ct1uEhRKMR
	LKVZLCUZWjlWDHCrzWT5z3NQIvQxwiVhZg==
X-Google-Smtp-Source: ABdhPJxrq5k00V/RrBKmsXNm082mXlCv+Nhe0rWGHJ6nPslNifdFpP8hZewMIx2MUkFHrWSPY5KPdQ==
X-Received: by 2002:a17:902:9f88:b029:ee:b4e5:64d4 with SMTP id g8-20020a1709029f88b02900eeb4e564d4mr30389356plq.41.1620751771058;
        Tue, 11 May 2021 09:49:31 -0700 (PDT)
X-Received: by 2002:a92:6804:: with SMTP id d4mr27241366ilc.5.1620751346868;
 Tue, 11 May 2021 09:42:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210510095026.3477496-1-tientzu@chromium.org>
 <20210510095026.3477496-9-tientzu@chromium.org> <20210510150516.GE28066@lst.de>
In-Reply-To: <20210510150516.GE28066@lst.de>
From: Claire Chang <tientzu@chromium.org>
Date: Wed, 12 May 2021 00:42:15 +0800
X-Gmail-Original-Message-ID: <CALiNf2-x8Gw0TPLdeRnfPmUTeuK9dsLbDXN4hPnc08y21uuUXQ@mail.gmail.com>
Message-ID: <CALiNf2-x8Gw0TPLdeRnfPmUTeuK9dsLbDXN4hPnc08y21uuUXQ@mail.gmail.com>
Subject: Re: [PATCH v6 08/15] swiotlb: Bounce data from/to restricted DMA pool
 if available
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

On Mon, May 10, 2021 at 11:05 PM Christoph Hellwig <hch@lst.de> wrote:
>
> > +static inline bool is_dev_swiotlb_force(struct device *dev)
> > +{
> > +#ifdef CONFIG_DMA_RESTRICTED_POOL
> > +     if (dev->dma_io_tlb_mem)
> > +             return true;
> > +#endif /* CONFIG_DMA_RESTRICTED_POOL */
> > +     return false;
> > +}
> > +
>
> >       /* If SWIOTLB is active, use its maximum mapping size */
> >       if (is_swiotlb_active(dev) &&
> > -         (dma_addressing_limited(dev) || swiotlb_force == SWIOTLB_FORCE))
> > +         (dma_addressing_limited(dev) || swiotlb_force == SWIOTLB_FORCE ||
> > +          is_dev_swiotlb_force(dev)))
>
> This is a mess.  I think the right way is to have an always_bounce flag
> in the io_tlb_mem structure instead.  Then the global swiotlb_force can
> go away and be replace with this and the fact that having no
> io_tlb_mem structure at all means forced no buffering (after a little
> refactoring).

Will do in the next version.

