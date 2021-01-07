Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F922ED605
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jan 2021 18:50:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63023.111862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxZQM-0002Cz-CM; Thu, 07 Jan 2021 17:50:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63023.111862; Thu, 07 Jan 2021 17:50:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxZQM-0002CZ-95; Thu, 07 Jan 2021 17:50:14 +0000
Received: by outflank-mailman (input) for mailman id 63023;
 Thu, 07 Jan 2021 17:50:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lGT/=GK=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1kxZQL-0002CU-8O
 for xen-devel@lists.xenproject.org; Thu, 07 Jan 2021 17:50:13 +0000
Received: from mail-pg1-x52f.google.com (unknown [2607:f8b0:4864:20::52f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e5280d3-a89f-45ca-9dd1-d62fa17897ba;
 Thu, 07 Jan 2021 17:50:11 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id q7so3540106pgm.5
 for <xen-devel@lists.xenproject.org>; Thu, 07 Jan 2021 09:50:11 -0800 (PST)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com.
 [209.85.210.182])
 by smtp.gmail.com with ESMTPSA id s29sm7235403pgn.65.2021.01.07.09.50.10
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 09:50:10 -0800 (PST)
Received: by mail-pf1-f182.google.com with SMTP id h186so4333527pfe.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Jan 2021 09:50:10 -0800 (PST)
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
X-Inumbo-ID: 1e5280d3-a89f-45ca-9dd1-d62fa17897ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6Eoqk68P1Bcb0VR3W1zmVx5ceWjyA10pZm4KhVQJdAs=;
        b=GM+iTlQ3BQkvH1ob8TdUxcmAsi46pi2mtWELHUgZFyyPO+EndHkxYi6Efkg3O18Tku
         edQt8UB0Llti6Epm5pi7gQD7Rvjj2XwfVndg2ehauNbNVLy3PAXR8NhD8ppHMDSgrEjB
         eTe/tAn9d2RFhHsPSUNMdpOJeoKvJtOqJ4IiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6Eoqk68P1Bcb0VR3W1zmVx5ceWjyA10pZm4KhVQJdAs=;
        b=do1xqb5t9Viy9MNaaHnSb3YQoX0Yd7GjTpNG5Mv00KY/k9nTiokTLc1/cpW5Hu2Ccn
         KeXSRVOBUP2/J5f8quRo8cimWiDXe/g3caseWfpSp37ZJgDxbm7TEELL7pIfAeYsby0H
         luJaImZzo7JdJZPtl44VFyCeZ5VkTfeA+ozJQtMTs3WZytRnw+MiiUsiSUcTBbWHSZ6o
         Jk8JuDKKt7PbYHnl6PcwZkiz6Expnk64HJu+gGviHTn9t69a9HZTXS2els6cjTb2BbdJ
         MgiU+bWBCpT8x4om1f8xrNU6MOL9rMOqBGaQ/LcOTCZu/MGoRz2mm1CQmfiFoX8qpMi6
         nBmg==
X-Gm-Message-State: AOAM530VuH4gTFoyzqT+TfibJUSuBXxhwozICi8TpJEj3xsgDwuCu3lX
	m8XCWZ2uwvY8DUfvyrkrUfM59GJ6iJzqI74i
X-Google-Smtp-Source: ABdhPJwpQz9sfB/RPAcfbSz7mI2OwL81VuCDiB22CkIrerXIS9VNnzuNUR2Tzzn6lsyH4GK75dQ6iA==
X-Received: by 2002:a63:4e17:: with SMTP id c23mr2902404pgb.439.1610041810749;
        Thu, 07 Jan 2021 09:50:10 -0800 (PST)
X-Received: by 2002:a92:d592:: with SMTP id a18mr8620iln.64.1610041335740;
 Thu, 07 Jan 2021 09:42:15 -0800 (PST)
MIME-Version: 1.0
References: <20210106034124.30560-1-tientzu@chromium.org> <d7043239-12cf-3636-4726-2e3b90917dc6@gmail.com>
In-Reply-To: <d7043239-12cf-3636-4726-2e3b90917dc6@gmail.com>
From: Claire Chang <tientzu@chromium.org>
Date: Fri, 8 Jan 2021 01:42:04 +0800
X-Gmail-Original-Message-ID: <CALiNf28sU1VtGB7LeTXExkMwQiCeg8N5arqyEjw0CPZP72R4dg@mail.gmail.com>
Message-ID: <CALiNf28sU1VtGB7LeTXExkMwQiCeg8N5arqyEjw0CPZP72R4dg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/6] Restricted DMA
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
	Tomasz Figa <tfiga@chromium.org>, Nicolas Boichat <drinkcat@chromium.org>, 
	Jim Quinlan <james.quinlan@broadcom.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 7, 2021 at 2:48 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> Hi,
>
> First of all let me say that I am glad that someone is working on a
> upstream solution for this issue, would appreciate if you could CC and
> Jim Quinlan on subsequent submissions.

Sure!

>
> On 1/5/21 7:41 PM, Claire Chang wrote:
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
> > usually done at firmware level, e.g. in ATF on some ARM platforms).
>
> Can you explain how ATF gets involved and to what extent it does help,
> besides enforcing a secure region from the ARM CPU's perpsective? Does
> the PCIe root complex not have an IOMMU but can somehow be denied access
> to a region that is marked NS=0 in the ARM CPU's MMU? If so, that is
> still some sort of basic protection that the HW enforces, right?

We need the ATF support for memory MPU (memory protection unit).
Restricted DMA (with reserved-memory in dts) makes sure the predefined memory
region is for PCIe DMA only, but we still need MPU to locks down PCIe access to
that specific regions.

>
> On Broadcom STB SoCs we have had something similar for a while however
> and while we don't have an IOMMU for the PCIe bridge, we do have a a
> basic protection mechanism whereby we can configure a region in DRAM to
> be PCIe read/write and CPU read/write which then gets used as the PCIe
> inbound region for the PCIe EP. By default the PCIe bridge is not
> allowed access to DRAM so we must call into a security agent to allow
> the PCIe bridge to access the designated DRAM region.
>
> We have done this using a private CMA area region assigned via Device
> Tree, assigned with a and requiring the PCIe EP driver to use
> dma_alloc_from_contiguous() in order to allocate from this device
> private CMA area. The only drawback with that approach is that it
> requires knowing how much memory you need up front for buffers and DMA
> descriptors that the PCIe EP will need to process. The problem is that
> it requires driver modifications and that does not scale over the number
> of PCIe EP drivers, some we absolutely do not control, but there is no
> need to bounce buffer. Your approach scales better across PCIe EP
> drivers however it does require bounce buffering which could be a
> performance hit.

Only the streaming DMA (map/unmap) needs bounce buffering.
I also added alloc/free support in this series
(https://lore.kernel.org/patchwork/patch/1360995/), so dma_direct_alloc() will
try to allocate memory from the predefined memory region.

As for the performance hit, it should be similar to the default swiotlb.
Here are my experiment results. Both SoCs lack IOMMU for PCIe.

PCIe wifi vht80 throughput -

  MTK SoC                  tcp_tx     tcp_rx    udp_tx   udp_rx
  w/o Restricted DMA  244.1     134.66   312.56   350.79
  w/ Restricted DMA    246.95   136.59   363.21   351.99

  Rockchip SoC           tcp_tx     tcp_rx    udp_tx   udp_rx
  w/o Restricted DMA  237.87   133.86   288.28   361.88
  w/ Restricted DMA    256.01   130.95   292.28   353.19

The CPU usage doesn't increase too much either.
Although I didn't measure the CPU usage very precisely, it's ~3% with a single
big core (Cortex-A72) and ~5% with a single small core (Cortex-A53).

Thanks!

>
> Thanks!
> --
> Florian

