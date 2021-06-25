Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC563B3A38
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 02:43:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147021.270714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwZv2-0000jf-4k; Fri, 25 Jun 2021 00:42:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147021.270714; Fri, 25 Jun 2021 00:42:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwZv2-0000gx-1C; Fri, 25 Jun 2021 00:42:04 +0000
Received: by outflank-mailman (input) for mailman id 147021;
 Fri, 25 Jun 2021 00:42:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hc5c=LT=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lwZv0-0000gr-AJ
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 00:42:02 +0000
Received: from mail-il1-x135.google.com (unknown [2607:f8b0:4864:20::135])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 998e538c-58e0-48ee-9a65-f3f5ba9856d2;
 Fri, 25 Jun 2021 00:42:01 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id s19so8233409ilj.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jun 2021 17:42:01 -0700 (PDT)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com.
 [209.85.166.174])
 by smtp.gmail.com with ESMTPSA id y205sm2519374iof.1.2021.06.24.17.41.58
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 17:41:59 -0700 (PDT)
Received: by mail-il1-f174.google.com with SMTP id z1so8268414ils.0
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jun 2021 17:41:58 -0700 (PDT)
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
X-Inumbo-ID: 998e538c-58e0-48ee-9a65-f3f5ba9856d2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EqlrFHdkETA6GW6RTp23OD25mZ9+t6ZRMvVFoaOPoUc=;
        b=bWcnQFoaV8XnWx2CmMqEub8uZpXzFMse4FkKs/6K7fAcmnfM33tj2MQVZVMqk8lHor
         cnCu5fEy9K2Coqappl8ZOF4ctPyliF3MamPmCDoyKpou7w8OAoAQjHS8393soCVU2vwe
         MHeea8kRyeqRwy1slhC35EkQWOKLuZs+gqotQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EqlrFHdkETA6GW6RTp23OD25mZ9+t6ZRMvVFoaOPoUc=;
        b=VIB7n3Brdk3T8a9xrY4Z9SpIAa4kQqeBAhfR8Y22ifwsZCYn8S7+TkzS8lHDsa5kp2
         6LeBfSvT5M31nt/f7k6YM6Al4+b/lgAINtKloGJXNNDQWMoSlmr+/C0Uq8P+XrH75q70
         4o9uDIhOOnfVGgX+647pjG/HEbvRX6BgzCqXX5y3qpSpupdA2wklSvwCFbF1mrsOSgyN
         jhAs6LbbDRrQfMKM7bDFMAr/OZiIQA8AzXC0rRmObMx+jQKhPkcZWw8n+xv4CP2NZJIs
         RhkrDiErvk+G31TWWug8cmvm5F4PH3aTyVs5KNwYfV0YA8pzPsxDGkH6wEDNtr+KJO+h
         63Wg==
X-Gm-Message-State: AOAM5336xN0pJIiOFUvzhi54y6WstPJ3T9fJiVsy39qlT7RXLJmJw9Vh
	9QpABYIbEML7PKEH0N05jOJQxYSdAL8N6g==
X-Google-Smtp-Source: ABdhPJzPY+eeeaFQi1hhCsQWGRVV7BvEQ812Q7522o3m0yG6WwQxs+kuTmkx+pE+mW3LUpaBsTD4PA==
X-Received: by 2002:a92:b746:: with SMTP id c6mr61633ilm.81.1624581720542;
        Thu, 24 Jun 2021 17:42:00 -0700 (PDT)
X-Received: by 2002:a05:6602:1546:: with SMTP id h6mr6334034iow.34.1624581707960;
 Thu, 24 Jun 2021 17:41:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210624155526.2775863-1-tientzu@chromium.org> <YNTa1C5uvz+qWryf@char.us.oracle.com>
In-Reply-To: <YNTa1C5uvz+qWryf@char.us.oracle.com>
From: Claire Chang <tientzu@chromium.org>
Date: Fri, 25 Jun 2021 08:41:37 +0800
X-Gmail-Original-Message-ID: <CALiNf297ep9C8-3s=F-xRDud=QB9geMfCMKTqLzPJKEdYnfbXQ@mail.gmail.com>
Message-ID: <CALiNf297ep9C8-3s=F-xRDud=QB9geMfCMKTqLzPJKEdYnfbXQ@mail.gmail.com>
Subject: Re: [PATCH v15 00/12] Restricted DMA
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
	thomas.hellstrom@linux.intel.com, Tom Lendacky <thomas.lendacky@amd.com>, 
	Qian Cai <quic_qiancai@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 25, 2021 at 3:20 AM Konrad Rzeszutek Wilk
<konrad.wilk@oracle.com> wrote:
>
> On Thu, Jun 24, 2021 at 11:55:14PM +0800, Claire Chang wrote:
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
> >
> > v15:
> > - Apply Will's diff (https://lore.kernel.org/patchwork/patch/1448957/#1647521)
> >   to fix the crash reported by Qian.
> > - Add Stefano's Acked-by tag for patch 01/12 from v14
>
> That all should be now be on
>
> https://git.kernel.org/pub/scm/linux/kernel/git/konrad/swiotlb.git/
> devel/for-linus-5.14 (and linux-next)
>

devel/for-linus-5.14 looks good. Thanks!

