Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8065F3B1675
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jun 2021 11:07:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146173.268920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvyqY-0000sD-Qr; Wed, 23 Jun 2021 09:06:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146173.268920; Wed, 23 Jun 2021 09:06:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvyqY-0000qK-Ml; Wed, 23 Jun 2021 09:06:58 +0000
Received: by outflank-mailman (input) for mailman id 146173;
 Wed, 23 Jun 2021 09:06:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cw8P=LR=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lvyqW-0000pO-Mo
 for xen-devel@lists.xenproject.org; Wed, 23 Jun 2021 09:06:56 +0000
Received: from mail-qk1-x72c.google.com (unknown [2607:f8b0:4864:20::72c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a113d435-c3ca-4a81-b146-0afc8af513da;
 Wed, 23 Jun 2021 09:06:55 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id c138so3346864qkg.5
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jun 2021 02:06:55 -0700 (PDT)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com.
 [209.85.160.173])
 by smtp.gmail.com with ESMTPSA id r6sm3406353qtx.89.2021.06.23.02.06.55
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 02:06:55 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id g12so1534524qtb.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jun 2021 02:06:55 -0700 (PDT)
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
X-Inumbo-ID: a113d435-c3ca-4a81-b146-0afc8af513da
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=13Gr0i1MTKRVJOLYjbaQS0t+sJQavN2HZYVSf9igv0I=;
        b=SA9G17LOrb34DyVZWPMTTHIONdcJ/5ZbZWqssqBb4aWqa4vseTx3+V6CkFU4RvePBr
         YNNS8jqCGxfTDXRduKfQQMwLt3JL1m3nr4PNVWIksCr6YiJm78aGWUxZDo4V4hXGS1bN
         zAH4ZuRlx4WIbGetsYgzQvT1yucBC3KtrF3U0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=13Gr0i1MTKRVJOLYjbaQS0t+sJQavN2HZYVSf9igv0I=;
        b=RSP0TaNPiqFCPhsm30u1De6RRjfJS/B5UNGuKATnDMa5XjDqyGkGlDT0FobcPGmJ8k
         QcNm1wwXZLFQ5gJ+ETv3Ek/9xwjT72xrT4VkpKYtTzOy3E1PcmFu8FeX8bGWocP9xN2R
         DX6gzJ/wrdH31My6lFEsIsh4pJU2cS23BONN3OPIyQFVlTihUkI2ZI2wE9zIV/ucNxz4
         D4ArUCIutkGGKc75cixA0oTxe9PAEGht85LhQA1f8zc7qGvbK0TP5pAwWWaOSLGLHlf2
         8c+KRlnVDqJBs6MvGN9AAekKY3+PNvDBlWhO/n6Sf/KkpoYmxF9T2VtXm/8plw9UAvih
         MU+A==
X-Gm-Message-State: AOAM531lgprUaliWXIt/6nQCAjYNwm9EH/yJQ86PEqO/vW8kr7ed1mro
	vSoig7Ux9gBnhRgzulG8lkmjuj5PrrzEMg==
X-Google-Smtp-Source: ABdhPJxmi7LbVr6jESnI4VkdvdqvMC1q8m3WInQVl31MMJkE7IKnwh14vDANLWQmnkMZl+fwBLYHpw==
X-Received: by 2002:a37:44f:: with SMTP id 76mr9235947qke.161.1624439215410;
        Wed, 23 Jun 2021 02:06:55 -0700 (PDT)
X-Received: by 2002:a02:4b46:: with SMTP id q67mr7991027jaa.84.1624438886886;
 Wed, 23 Jun 2021 02:01:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210619034043.199220-1-tientzu@chromium.org> <YNLy7z0Zq1AXKLng@char.us.oracle.com>
In-Reply-To: <YNLy7z0Zq1AXKLng@char.us.oracle.com>
From: Claire Chang <tientzu@chromium.org>
Date: Wed, 23 Jun 2021 17:01:16 +0800
X-Gmail-Original-Message-ID: <CALiNf28U9xaqth99u=hB45b=qWMYaSoe2DGgNVFrHXze6wNmdQ@mail.gmail.com>
Message-ID: <CALiNf28U9xaqth99u=hB45b=qWMYaSoe2DGgNVFrHXze6wNmdQ@mail.gmail.com>
Subject: Re: [PATCH v14 00/12] Restricted DMA
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>, boris.ostrovsky@oracle.com, 
	jgross@suse.com, Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	benh@kernel.crashing.org, paulus@samba.org, 
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
	thomas.hellstrom@linux.intel.com, Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 23, 2021 at 4:38 PM Konrad Rzeszutek Wilk
<konrad.wilk@oracle.com> wrote:
>
> On Sat, Jun 19, 2021 at 11:40:31AM +0800, Claire Chang wrote:
> > This series implements mitigations for lack of DMA access control on
> > systems without an IOMMU, which could result in the DMA accessing the
> > system memory at unexpected times and/or unexpected addresses, possibly
> > leading to data leakage or corruption.
> >
> > For example, we plan to use the PCI-e bus for Wi-Fi and that PCI-e bus is
> > not behind an IOMMU. As PCI-e, by design, gives the device full access to
> > system memory, a vulnerability in the Wi-Fi firmware could easily escalate
> > to a full system exploit (remote wifi exploits: [1a], [1b] that shows a
> > full chain of exploits; [2], [3]).
> >
> > To mitigate the security concerns, we introduce restricted DMA. Restricted
> > DMA utilizes the existing swiotlb to bounce streaming DMA in and out of a
> > specially allocated region and does memory allocation from the same region.
> > The feature on its own provides a basic level of protection against the DMA
> > overwriting buffer contents at unexpected times. However, to protect
> > against general data leakage and system memory corruption, the system needs
> > to provide a way to restrict the DMA to a predefined memory region (this is
> > usually done at firmware level, e.g. MPU in ATF on some ARM platforms [4]).
> >
> > [1a] https://googleprojectzero.blogspot.com/2017/04/over-air-exploiting-broadcoms-wi-fi_4.html
> > [1b] https://googleprojectzero.blogspot.com/2017/04/over-air-exploiting-broadcoms-wi-fi_11.html
> > [2] https://blade.tencent.com/en/advisories/qualpwn/
> > [3] https://www.bleepingcomputer.com/news/security/vulnerabilities-found-in-highly-popular-firmware-for-wifi-chips/
> > [4] https://github.com/ARM-software/arm-trusted-firmware/blob/master/plat/mediatek/mt8183/drivers/emi_mpu/emi_mpu.c#L132
>
> Heya Claire,
>
> I put all your patches on
> https://git.kernel.org/pub/scm/linux/kernel/git/konrad/swiotlb.git/log/?h=devel/for-linus-5.14
>
> Please double-check that they all look ok.
>
> Thank you!

They look fine. Thank you!

