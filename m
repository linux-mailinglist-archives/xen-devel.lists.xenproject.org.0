Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60192BA73BC
	for <lists+xen-devel@lfdr.de>; Sun, 28 Sep 2025 17:17:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1132516.1470851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v2t9e-0008Qp-FL; Sun, 28 Sep 2025 15:17:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1132516.1470851; Sun, 28 Sep 2025 15:17:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v2t9e-0008Oy-Cd; Sun, 28 Sep 2025 15:17:38 +0000
Received: by outflank-mailman (input) for mailman id 1132516;
 Sun, 28 Sep 2025 15:17:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vhgl=4H=ravnborg.org=sam@srs-se1.protection.inumbo.net>)
 id 1v2t9a-0008Op-Ve
 for xen-devel@lists.xenproject.org; Sun, 28 Sep 2025 15:17:36 +0000
Received: from mailrelay-egress4.pub.mailoutpod2-cph3.one.com
 (mailrelay-egress4.pub.mailoutpod2-cph3.one.com [2a02:2350:5:403::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f035aab-9c7e-11f0-9809-7dc792cee155;
 Sun, 28 Sep 2025 17:17:28 +0200 (CEST)
Received: from ravnborg.org (2-105-16-150-cable.dk.customer.tdc.net
 [2.105.16.150])
 by mailrelay6.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
 id 3c50089e-9c7e-11f0-840e-494313b7f784;
 Sun, 28 Sep 2025 15:17:27 +0000 (UTC)
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
X-Inumbo-ID: 3f035aab-9c7e-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1759072648; x=1759677448;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=/Q5hJNgUVt5SsKvfCGB08N5MVmcUGqA0PZ6u8vFRIRA=;
	b=XDrJz48OIBYo3Q7svVdb5rADtr4uzPeBqjzvjdBidN0feLc/fG5FyC6+FiXnHOkn55ys5B7oUM9TU
	 wNSnamick0obcSvJhF96XXEZuoST1AXGIm/ETF3M+aEeXyHZD/Uy94xCWNukoXKrPvaVVSyuR/mSdp
	 KB96525b2afYqAiKmysXETY5dzfEWAwGX0eJNU7vM+m4GXoo64rXvhOnauh357csMR2l9engULsyz3
	 5PXk1+lrLbhu0QL4HC7CtjxC4UA5AqK0Qya1KK4CYFDrDKU3YZgpLD4h/rFGJ9D+9noDpVHH5zdKCH
	 rr1+z6bhES67FvuiiyDFZXKzWF0+L1g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1759072648; x=1759677448;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=/Q5hJNgUVt5SsKvfCGB08N5MVmcUGqA0PZ6u8vFRIRA=;
	b=2W7jKc5o1qHQ2HRmyzqFqhAdPo7FUm8FqIPGGW/HvkJ0QqhXxxc9Hji379Sr1nafpwrNl2oS4qsP7
	 wU9ELx/Ag==
X-HalOne-ID: 3c50089e-9c7e-11f0-840e-494313b7f784
Date: Sun, 28 Sep 2025 17:17:25 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Leon Romanovsky <leonro@nvidia.com>,
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
Message-ID: <20250928151725.GA135708@ravnborg.org>
References: <cover.1759071169.git.leon@kernel.org>
 <27727b8ef9b3ad55a3a28f9622a62561c9988335.1759071169.git.leon@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27727b8ef9b3ad55a3a28f9622a62561c9988335.1759071169.git.leon@kernel.org>

Hi Leon.

On Sun, Sep 28, 2025 at 06:02:29PM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> After conversion of arch code to use physical address mapping,
> there are no users of .map_page() and .unmap_page() callbacks,
> so let's remove them.
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  include/linux/dma-map-ops.h |  7 -------
>  kernel/dma/mapping.c        | 12 ------------
>  kernel/dma/ops_helpers.c    |  8 +-------
>  3 files changed, 1 insertion(+), 26 deletions(-)

It looks like you missed a few sparc32 bits:
mm/iommu.c:
static const struct dma_map_ops sbus_iommu_dma_gflush_ops = {
#ifdef CONFIG_SBUS
        .alloc                  = sbus_iommu_alloc,
        .free                   = sbus_iommu_free,
#endif
        .map_page               = sbus_iommu_map_page_gflush,
        .unmap_page             = sbus_iommu_unmap_page,
        .map_sg                 = sbus_iommu_map_sg_gflush,

mm/io-unit.c:
static const struct dma_map_ops iounit_dma_ops = {
#ifdef CONFIG_SBUS
        .alloc                  = iounit_alloc,
        .free                   = iounit_free,
#endif
        .map_page               = iounit_map_page,
        .unmap_page             = iounit_unmap_page,
        .map_sg                 = iounit_map_sg,

I did not compile test, but from a quick look they need to be updated.

	Sam

