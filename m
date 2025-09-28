Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71169BA6F74
	for <lists+xen-devel@lfdr.de>; Sun, 28 Sep 2025 12:54:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1132302.1470691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v2p2x-000399-Hr; Sun, 28 Sep 2025 10:54:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1132302.1470691; Sun, 28 Sep 2025 10:54:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v2p2x-00036e-Eg; Sun, 28 Sep 2025 10:54:27 +0000
Received: by outflank-mailman (input) for mailman id 1132302;
 Sun, 28 Sep 2025 10:54:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zTFj=4H=kernel.org=leon@srs-se1.protection.inumbo.net>)
 id 1v2p2w-00036Y-2e
 for xen-devel@lists.xenproject.org; Sun, 28 Sep 2025 10:54:26 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7bf53825-9c59-11f0-9809-7dc792cee155;
 Sun, 28 Sep 2025 12:54:20 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8337662154;
 Sun, 28 Sep 2025 10:54:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88B2DC4CEF7;
 Sun, 28 Sep 2025 10:54:17 +0000 (UTC)
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
X-Inumbo-ID: 7bf53825-9c59-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759056858;
	bh=P7S8PfmMkN3lCLtx7ABMG78NQs7Q7Zq/Vrda3oeN91k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mi76TWNG7HtOxJ1wO470x2VvF26PVkc0OUNi1F1RmLvGmfrX5GsbtT4ztSWcWdTni
	 FwYt6EmiA9itKcukLOannrDDB26moF9wBf8RU6TCGr/7cNnSu/FGTcUkvY+esiPpjV
	 oDLLLJl0fuYyVanNuHzmOc5s+1VKasRLE9HsLmVxXaiXt6vgjBky/N71dJAy5Uepir
	 CU4p5RSWXOVizbnnPH00WVYjvJCU/KyNrn5gikLy+JzpNEoKRAxowD/z3vbxg6zA5c
	 Ln0RqRBJAFveWdcmsx7QgSb7xt9/rHKWmyrxxdJkXonjrmbRxHKqYef4JoF7gHahEg
	 9RAEVJXjqdX3A==
Date: Sun, 28 Sep 2025 13:54:13 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geoff Levand <geoff@infradead.org>, Helge Deller <deller@gmx.de>,
	Ingo Molnar <mingo@redhat.com>, iommu@lists.linux.dev,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Jason Wang <jasowang@redhat.com>, Juergen Gross <jgross@suse.com>,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Matt Turner <mattst88@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	sparclinux@vger.kernel.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	virtualization@lists.linux.dev, x86@kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/9] alpha: Convert mapping routine to rely on physical
 address
Message-ID: <20250928105413.GE12165@unreal>
References: <cover.1758219786.git.leon@kernel.org>
 <0c64474985af55b1aa934b857808068a0e609c6e.1758219787.git.leon@kernel.org>
 <CA+=Fv5Q8dVUFVBh82mAe=fy3mV6mWtQT_0pBPLQwLNBt3f8E1g@mail.gmail.com>
 <20250923171819.GM10800@unreal>
 <CA+=Fv5SJcQ5C4UeX2+deV9mPAe5QxrocMG8EJ2eVcYjbLE5U+A@mail.gmail.com>
 <20250923235318.GD2617119@nvidia.com>
 <CA+=Fv5Tg7sQACpeG8aMZF6_E6dbRnN5ifg0aiHityXadxiHoPA@mail.gmail.com>
 <CA+=Fv5Sze_BNmHqzypmCh8p2JO6gytXH4E6hXv3gZdfoSJsMUQ@mail.gmail.com>
 <CA+=Fv5TF+RTPEkQEmVd0_=B9xbqKycLz3ck3UwcPDqacezYfFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+=Fv5TF+RTPEkQEmVd0_=B9xbqKycLz3ck3UwcPDqacezYfFQ@mail.gmail.com>

On Sun, Sep 28, 2025 at 12:23:48PM +0200, Magnus Lindholm wrote:
> > After reverting the above commits, I'm able to build a working kernel,
> > that is, no filesystem corruption occurs. I'll take a closer look at this
> > after the weekend.
> >
> 
> Short update,  It is enough to revert the following commits, in order to
> have a working kernel on alpha:
> 
> e78a9d72517a88faa6f16dab4d1c6f966ed378ae
> (dma-mapping: remove unused map_page callback)
> 
> d459e3b80ad1c81bf596d63d2e3347cf8c7bb0d9
> (alpha: Convert mapping routine to rely on physical address)

Thanks for the effort.

Can you please check the following change instead of reverting the patches?

diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci_iommu.c
index b62d9937d1d3a..3e4f631a1f27d 100644
--- a/arch/alpha/kernel/pci_iommu.c
+++ b/arch/alpha/kernel/pci_iommu.c
@@ -229,6 +229,7 @@ pci_map_single_1(struct pci_dev *pdev, phys_addr_t paddr, size_t size,
 {
        struct pci_controller *hose = pdev ? pdev->sysdata : pci_isa_hose;
        dma_addr_t max_dma = pdev ? pdev->dma_mask : ISA_DMA_MASK;
+       unsigned long offset = offset_in_page(paddr);
        struct pci_iommu_arena *arena;
        long npages, dma_ofs, i;
        dma_addr_t ret;
@@ -287,7 +288,7 @@ pci_map_single_1(struct pci_dev *pdev, phys_addr_t paddr, size_t size,
                arena->ptes[i + dma_ofs] = mk_iommu_pte(paddr);

        ret = arena->dma_base + dma_ofs * PAGE_SIZE;
-       ret += offset_in_page(paddr);
+       ret += offset;

        DBGA2("pci_map_single: [%pa,%zx] np %ld -> sg %llx from %ps\n",
              &paddr, size, npages, ret, __builtin_return_address(0));
~


> 
> 
> /Magnus

