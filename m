Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D1D3F931D
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 05:51:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173379.316363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJSt4-0006I6-5j; Fri, 27 Aug 2021 03:50:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173379.316363; Fri, 27 Aug 2021 03:50:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJSt4-0006Fi-1c; Fri, 27 Aug 2021 03:50:38 +0000
Received: by outflank-mailman (input) for mailman id 173379;
 Fri, 27 Aug 2021 03:50:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v0Ss=NS=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1mJSt2-0006Fc-CT
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 03:50:36 +0000
Received: from mail-io1-xd32.google.com (unknown [2607:f8b0:4864:20::d32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e8a1ae0b-fb30-4a96-89e3-e9cda1086b10;
 Fri, 27 Aug 2021 03:50:35 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id n24so6798380ion.10
 for <xen-devel@lists.xenproject.org>; Thu, 26 Aug 2021 20:50:35 -0700 (PDT)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com.
 [209.85.166.175])
 by smtp.gmail.com with ESMTPSA id c5sm2930952ilr.54.2021.08.26.20.50.33
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 20:50:34 -0700 (PDT)
Received: by mail-il1-f175.google.com with SMTP id v2so5681458ilg.12
 for <xen-devel@lists.xenproject.org>; Thu, 26 Aug 2021 20:50:33 -0700 (PDT)
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
X-Inumbo-ID: e8a1ae0b-fb30-4a96-89e3-e9cda1086b10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aO31d1ja5MAKunYUAZZRLdfg9N4l+qmRykC9m1jC/pQ=;
        b=LHO3ECTKxrFvHrNircCd8rdZ+1fd28Cmb0yeGOAFZz7tvi23JfdsoKQlBQ/osBU2PS
         uSjlHhkxT55kRAddmfXWJAAOEApdxidxxDW04W+WXtBEpgeVUzkf4uqWPWAg7OHZiZJx
         7DqmkAUptTsy2yC8hMD6ce5SkESGfwW9yU/Tw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aO31d1ja5MAKunYUAZZRLdfg9N4l+qmRykC9m1jC/pQ=;
        b=AQu5jqUnHYECguRfTTHny0MfAszcbfgtilLUlwmUzr7E//nYx5e+j+mMNQEak5D7CQ
         PqVIQ2pQ8T+JPczvuZKZGrhiHiq44TjxYPpFtkfZPYwYOojEfsjG/dDw7Y3I3dIcwj4a
         qeGXmy00x0FWTWfP+p38Fvf6DmopLDodAxBe48z4z1NgD/d16cz2RP6QgMFXV87YM2KS
         GiPIJ5e1ZrQvV7qP5XWwF525NU7nHrAEjKmtNkZSsYGAfUX4P+AmjvSnybJe9XE2qY/1
         ZzCRp3XP3DQaFUu9gB93q6EC8ak8Ip90IsOD0E55iHB/uQrt1t6te3w2q8VKOV1Kbw90
         geAg==
X-Gm-Message-State: AOAM531e0MJhXmNPomQZqO7bIXvuAV7tiSzrc2CqTdmmYYE1rULLBQBs
	5NraYQN/aQSQg5WhiL6Eh13BigOXH9FoiA==
X-Google-Smtp-Source: ABdhPJwqeqmMhIu2KMjrWhGKngCbTzI1zexxBa4KUkYudUx+DMyBpZcQmjWKBa+GlR4xuFr0wgPfsQ==
X-Received: by 2002:a05:6602:20ce:: with SMTP id 14mr5864972ioz.204.1630036234554;
        Thu, 26 Aug 2021 20:50:34 -0700 (PDT)
X-Received: by 2002:a5d:9ada:: with SMTP id x26mr5606315ion.50.1630036221774;
 Thu, 26 Aug 2021 20:50:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210624155526.2775863-1-tientzu@chromium.org>
 <20210624155526.2775863-11-tientzu@chromium.org> <20210824142601.GA3393158@roeck-us.net>
In-Reply-To: <20210824142601.GA3393158@roeck-us.net>
From: Claire Chang <tientzu@chromium.org>
Date: Fri, 27 Aug 2021 11:50:10 +0800
X-Gmail-Original-Message-ID: <CALiNf2_NoJwU7UUT4mNkbKWRKsTP9R9E=9qBZzjdjOduO5WZDQ@mail.gmail.com>
Message-ID: <CALiNf2_NoJwU7UUT4mNkbKWRKsTP9R9E=9qBZzjdjOduO5WZDQ@mail.gmail.com>
Subject: Re: [PATCH v15 10/12] swiotlb: Add restricted DMA pool initialization
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com, jgross@suse.com, 
	Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, benh@kernel.crashing.org, 
	paulus@samba.org, 
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Robin Murphy <robin.murphy@arm.com>, grant.likely@arm.com, 
	xypron.glpk@gmx.de, Thierry Reding <treding@nvidia.com>, mingo@kernel.org, 
	bauerman@linux.ibm.com, peterz@infradead.org, 
	Greg KH <gregkh@linuxfoundation.org>, Saravana Kannan <saravanak@google.com>, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, heikki.krogerus@linux.intel.com, 
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
	thomas.hellstrom@linux.intel.com, Tom Lendacky <thomas.lendacky@amd.com>, 
	Qian Cai <quic_qiancai@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 24, 2021 at 10:26 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> Hi Claire,
>
> On Thu, Jun 24, 2021 at 11:55:24PM +0800, Claire Chang wrote:
> > Add the initialization function to create restricted DMA pools from
> > matching reserved-memory nodes.
> >
> > Regardless of swiotlb setting, the restricted DMA pool is preferred if
> > available.
> >
> > The restricted DMA pools provide a basic level of protection against the
> > DMA overwriting buffer contents at unexpected times. However, to protect
> > against general data leakage and system memory corruption, the system
> > needs to provide a way to lock down the memory access, e.g., MPU.
> >
> > Signed-off-by: Claire Chang <tientzu@chromium.org>
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > Tested-by: Stefano Stabellini <sstabellini@kernel.org>
> > Tested-by: Will Deacon <will@kernel.org>
> > ---
> >  include/linux/swiotlb.h |  3 +-
> >  kernel/dma/Kconfig      | 14 ++++++++
> >  kernel/dma/swiotlb.c    | 76 +++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 92 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> > index 3b9454d1e498..39284ff2a6cd 100644
> > --- a/include/linux/swiotlb.h
> > +++ b/include/linux/swiotlb.h
> > @@ -73,7 +73,8 @@ extern enum swiotlb_force swiotlb_force;
> >   *           range check to see if the memory was in fact allocated by this
> >   *           API.
> >   * @nslabs:  The number of IO TLB blocks (in groups of 64) between @start and
> > - *           @end. This is command line adjustable via setup_io_tlb_npages.
> > + *           @end. For default swiotlb, this is command line adjustable via
> > + *           setup_io_tlb_npages.
> >   * @used:    The number of used IO TLB block.
> >   * @list:    The free list describing the number of free entries available
> >   *           from each index.
> > diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
> > index 77b405508743..3e961dc39634 100644
> > --- a/kernel/dma/Kconfig
> > +++ b/kernel/dma/Kconfig
> > @@ -80,6 +80,20 @@ config SWIOTLB
> >       bool
> >       select NEED_DMA_MAP_STATE
> >
> > +config DMA_RESTRICTED_POOL
> > +     bool "DMA Restricted Pool"
> > +     depends on OF && OF_RESERVED_MEM
> > +     select SWIOTLB
>
> This makes SWIOTLB user configurable, which in turn results in
>
> mips64-linux-ld: arch/mips/kernel/setup.o: in function `arch_mem_init':
> setup.c:(.init.text+0x19c8): undefined reference to `plat_swiotlb_setup'
> make[1]: *** [Makefile:1280: vmlinux] Error 1
>
> when building mips:allmodconfig.
>
> Should this possibly be "depends on SWIOTLB" ?

Patch is sent here: https://lkml.org/lkml/2021/8/26/932

>
> Thanks,
> Guenter

Thanks,
Claire

