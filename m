Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66970BA7416
	for <lists+xen-devel@lfdr.de>; Sun, 28 Sep 2025 17:28:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1132543.1470871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v2tKN-0002lr-Pr; Sun, 28 Sep 2025 15:28:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1132543.1470871; Sun, 28 Sep 2025 15:28:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v2tKN-0002k1-MP; Sun, 28 Sep 2025 15:28:43 +0000
Received: by outflank-mailman (input) for mailman id 1132543;
 Sun, 28 Sep 2025 15:28:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zTFj=4H=kernel.org=leon@srs-se1.protection.inumbo.net>)
 id 1v2tKM-0002jv-Dx
 for xen-devel@lists.xenproject.org; Sun, 28 Sep 2025 15:28:42 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd08b0f3-9c7f-11f0-9809-7dc792cee155;
 Sun, 28 Sep 2025 17:28:37 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 756A46218E;
 Sun, 28 Sep 2025 15:28:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D567C4CEF0;
 Sun, 28 Sep 2025 15:28:34 +0000 (UTC)
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
X-Inumbo-ID: cd08b0f3-9c7f-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759073315;
	bh=j3dJ7dm9Jex7hj7zDSOs/rnehFATrVSGsSj9oi0KREM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f1YhjVPKUf7C/0/LxXAZBncp5RteetEhwJWXFm/vEFPUulFmvL8IxH077S1rMLJtr
	 d2ZgZgVpCx6rd1totAk5q+h7xqPmOOTtzW5w30YaKisVYvwJq5gRqIDGRHY5T/f4gQ
	 O0PYgjbB/cH7oJ1jFPBNLr3rGkOI2qMk/87YL11RjncJuK6Qjt9VPe0h+TqS18yZyA
	 BZqpYFUKRf23DvC6/+sd1BLnzDDD/hXAh8aUEZqIXh4WqdIZHr4zt3c9wvIaaQFzw4
	 UZD9hcw+AzQFsbXJe27so0nVBzGtUu2qhqiGBcZy6B5qFDuhtL/1hVaC8gTpWufr4a
	 sdkGg8+AkSuEw==
Date: Sun, 28 Sep 2025 18:28:30 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
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
	xen-devel@lists.xenproject.org, Magnus Lindholm <linmag7@gmail.com>
Subject: Re: [PATCH v1 9/9] dma-mapping: remove unused map_page callback
Message-ID: <20250928152830.GA324804@unreal>
References: <cover.1759071169.git.leon@kernel.org>
 <27727b8ef9b3ad55a3a28f9622a62561c9988335.1759071169.git.leon@kernel.org>
 <20250928151725.GA135708@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250928151725.GA135708@ravnborg.org>

On Sun, Sep 28, 2025 at 05:17:25PM +0200, Sam Ravnborg wrote:
> Hi Leon.
> 
> On Sun, Sep 28, 2025 at 06:02:29PM +0300, Leon Romanovsky wrote:
> > From: Leon Romanovsky <leonro@nvidia.com>
> > 
> > After conversion of arch code to use physical address mapping,
> > there are no users of .map_page() and .unmap_page() callbacks,
> > so let's remove them.
> > 
> > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > ---
> >  include/linux/dma-map-ops.h |  7 -------
> >  kernel/dma/mapping.c        | 12 ------------
> >  kernel/dma/ops_helpers.c    |  8 +-------
> >  3 files changed, 1 insertion(+), 26 deletions(-)
> 
> It looks like you missed a few sparc32 bits:
> mm/iommu.c:
> static const struct dma_map_ops sbus_iommu_dma_gflush_ops = {
> #ifdef CONFIG_SBUS
>         .alloc                  = sbus_iommu_alloc,
>         .free                   = sbus_iommu_free,
> #endif
>         .map_page               = sbus_iommu_map_page_gflush,
>         .unmap_page             = sbus_iommu_unmap_page,
>         .map_sg                 = sbus_iommu_map_sg_gflush,
> 
> mm/io-unit.c:
> static const struct dma_map_ops iounit_dma_ops = {
> #ifdef CONFIG_SBUS
>         .alloc                  = iounit_alloc,
>         .free                   = iounit_free,
> #endif
>         .map_page               = iounit_map_page,
>         .unmap_page             = iounit_unmap_page,
>         .map_sg                 = iounit_map_sg,
> 
> I did not compile test, but from a quick look they need to be updated.

There were updated, see patch #5.
https://lore.kernel.org/all/bac909dab3c82fc6a7a4f5a31f22bac9a69f7f07.1759071169.git.leon@kernel.org/T/#u

arch/sparc/mm/iommu.c:
  426 static const struct dma_map_ops sbus_iommu_dma_gflush_ops = {
  427 #ifdef CONFIG_SBUS
  428         .alloc                  = sbus_iommu_alloc,
  429         .free                   = sbus_iommu_free,
  430 #endif
  431         .map_phys               = sbus_iommu_map_phys_gflush,
  432         .unmap_phys             = sbus_iommu_unmap_phys,
  433         .map_sg                 = sbus_iommu_map_sg_gflush,
  434         .unmap_sg               = sbus_iommu_unmap_sg,
  435 };

arch/sparc/mm/io-unit.c:
  276 static const struct dma_map_ops iounit_dma_ops = {
  277 #ifdef CONFIG_SBUS
  278         .alloc                  = iounit_alloc,
  279         .free                   = iounit_free,
  280 #endif
  281         .map_phys               = iounit_map_phys,
  282         .unmap_phys             = iounit_unmap_phys,
  283         .map_sg                 = iounit_map_sg,
  284         .unmap_sg               = iounit_unmap_sg,
  285 };

Thanks

> 
> 	Sam
> 

