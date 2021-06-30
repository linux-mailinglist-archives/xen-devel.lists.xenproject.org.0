Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A62813B7FE7
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jun 2021 11:24:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148168.273759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyWRT-0001si-SR; Wed, 30 Jun 2021 09:23:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148168.273759; Wed, 30 Jun 2021 09:23:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyWRT-0001qk-PC; Wed, 30 Jun 2021 09:23:35 +0000
Received: by outflank-mailman (input) for mailman id 148168;
 Wed, 30 Jun 2021 09:23:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+CRT=LY=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lyWRS-0001qe-MJ
 for xen-devel@lists.xenproject.org; Wed, 30 Jun 2021 09:23:34 +0000
Received: from mail-il1-x12b.google.com (unknown [2607:f8b0:4864:20::12b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e72c69c-5027-4572-9918-e454865a059e;
 Wed, 30 Jun 2021 09:23:33 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id i17so2196341ilj.11
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jun 2021 02:23:33 -0700 (PDT)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com.
 [209.85.166.47])
 by smtp.gmail.com with ESMTPSA id 17sm11381483iog.20.2021.06.30.02.23.32
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jun 2021 02:23:32 -0700 (PDT)
Received: by mail-io1-f47.google.com with SMTP id k16so2302937ios.10
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jun 2021 02:23:32 -0700 (PDT)
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
X-Inumbo-ID: 8e72c69c-5027-4572-9918-e454865a059e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SGxHKBuGZkCU1I+kyNcTwBrZAXyCdyYBNGIIT95dpcY=;
        b=PitW6imfDn0IzY3RG7JEiKUR+7Nsn4w2y1bEvPgW/HS2AbzJNtJNRONqnYjnNN01RO
         f4Cy3TS0FXR+ruq1aYhiZGEJMhWbD1l8vF9wU2uLP3NYm94onDiG0L+Sdwsda2NHyvii
         j6adVFIua9Ybkbk/RCb14aonwq2ISknAbeRG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SGxHKBuGZkCU1I+kyNcTwBrZAXyCdyYBNGIIT95dpcY=;
        b=bk35+AYC4mdBSsUpAPc9ChyQwI7OLlWhwfTFrYXT2w5noblFvzGf9qwZVnS9GNDjsJ
         rmLnAJgPCN1Zlwb3Jv4J2jP99Fzvqh/c+WCD5LIP5iQ112BM9lNiUlu13Tc57DpDG0b+
         +35pH1iznHyF2vvPQTVesXJTj4ysNDIPe7/QuT/Hwx4EcRzu9YkIPFO5xWcLV2C+L+bJ
         6kqp2XxuVjpfbfOrZcJtQPUOtv/CaH9mt14GB31HyuwxAcH91j4vqz+XZg9b1NsY73NU
         BG68b+gxolZfGcIURv0pRDRgvKgXQ9bWV/K1w+V9hyBbcj1GKlAnU6fXiWFS0M55RBgR
         apJA==
X-Gm-Message-State: AOAM532xt4HWH5ZS3/1hFKyomX97FzL2BDV+ePMKME4R4V4bQLn+QRdX
	nP8myJN4mg/QV8dt6IwhU1d3X/MtlzU/dw==
X-Google-Smtp-Source: ABdhPJx1yRoBZ4KHgIQJ66F5Sb9L2VUyXHcK3R2P38N2QniChZSsxOvjuZ6nNnK0pBCn4YK/yVbdfQ==
X-Received: by 2002:a05:6e02:bed:: with SMTP id d13mr23832857ilu.259.1625045012859;
        Wed, 30 Jun 2021 02:23:32 -0700 (PDT)
X-Received: by 2002:a6b:e013:: with SMTP id z19mr7163972iog.34.1625044658498;
 Wed, 30 Jun 2021 02:17:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210624155526.2775863-1-tientzu@chromium.org>
 <20210624155526.2775863-7-tientzu@chromium.org> <YNvMDFWKXSm4LRfZ@Ryzen-9-3900X.localdomain>
In-Reply-To: <YNvMDFWKXSm4LRfZ@Ryzen-9-3900X.localdomain>
From: Claire Chang <tientzu@chromium.org>
Date: Wed, 30 Jun 2021 17:17:27 +0800
X-Gmail-Original-Message-ID: <CALiNf2-a-haQN0-4+gX8+wa++52-0CnO2O4BEkxrQCxoTa_47w@mail.gmail.com>
Message-ID: <CALiNf2-a-haQN0-4+gX8+wa++52-0CnO2O4BEkxrQCxoTa_47w@mail.gmail.com>
Subject: Re: [PATCH v15 06/12] swiotlb: Use is_swiotlb_force_bounce for
 swiotlb data bouncing
To: Nathan Chancellor <nathan@kernel.org>
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

On Wed, Jun 30, 2021 at 9:43 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Thu, Jun 24, 2021 at 11:55:20PM +0800, Claire Chang wrote:
> > Propagate the swiotlb_force into io_tlb_default_mem->force_bounce and
> > use it to determine whether to bounce the data or not. This will be
> > useful later to allow for different pools.
> >
> > Signed-off-by: Claire Chang <tientzu@chromium.org>
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > Tested-by: Stefano Stabellini <sstabellini@kernel.org>
> > Tested-by: Will Deacon <will@kernel.org>
> > Acked-by: Stefano Stabellini <sstabellini@kernel.org>
>
> This patch as commit af452ec1b1a3 ("swiotlb: Use is_swiotlb_force_bounce
> for swiotlb data bouncing") causes my Ryzen 3 4300G system to fail to
> get to an X session consistently (although not every single time),
> presumably due to a crash in the AMDGPU driver that I see in dmesg.
>
> I have attached logs at af452ec1b1a3 and f127c9556a8e and I am happy
> to provide any further information, debug, or test patches as necessary.

Are you using swiotlb=force? or the swiotlb_map is called because of
!dma_capable? (https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/kernel/dma/direct.h#n93)

`BUG: unable to handle page fault for address: 00000000003a8290` and
the fact it crashed at `_raw_spin_lock_irqsave` look like the memory
(maybe dev->dma_io_tlb_mem) was corrupted?
The dev->dma_io_tlb_mem should be set here
(https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/pci/probe.c#n2528)
through device_initialize.

I can't tell what happened from the logs, but maybe we could try KASAN
to see if it provides more clue.

Thanks,
Claire

>
> Cheers,
> Nathan

