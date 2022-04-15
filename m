Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE62E502E5D
	for <lists+xen-devel@lfdr.de>; Fri, 15 Apr 2022 19:41:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.305837.520929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfPwI-0005UK-OM; Fri, 15 Apr 2022 17:40:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 305837.520929; Fri, 15 Apr 2022 17:40:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfPwI-0005RW-KE; Fri, 15 Apr 2022 17:40:58 +0000
Received: by outflank-mailman (input) for mailman id 305837;
 Fri, 15 Apr 2022 17:40:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JP5O=UZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nfPwG-0005RQ-LZ
 for xen-devel@lists.xenproject.org; Fri, 15 Apr 2022 17:40:56 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 337ce481-bce3-11ec-a405-831a346695d4;
 Fri, 15 Apr 2022 19:40:55 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5A399B82E86;
 Fri, 15 Apr 2022 17:40:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEA12C385A5;
 Fri, 15 Apr 2022 17:40:52 +0000 (UTC)
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
X-Inumbo-ID: 337ce481-bce3-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650044453;
	bh=tWqCZ6POdjdIuth1uLtLWXsCD/lbgEQY/bea6jlGg18=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tenMTJ+m0TnYenmiypOhgcvCrusUkdJTXnjplnZ5BJ0HMvFnrY3sU9G+1vpmUpQsy
	 zpIFa0oZcadKrRhAGFmd8rTzmZCvXkwdpx4XLrH6MxBKMt9Kp7fW31dhXaRIIxw5uR
	 BWYOaEdqBnYhkWjangxJ8mrx5hRN/LtrMiysYEjtx/NuAvX9wItzGnFTH5WESku9oP
	 LI8pgJbiIKsBpkEdcFiZNZyV03uPBhFP+3hDi4xgNsIbqIXN76q2rzkvBuTJpj6K7f
	 TG9pq9CtInIMvtiOgIt62T4IFo/32qlhNDxWR0TnLKV1UCQPp65fnbb8YPgqhSHEnx
	 W8i222N5F92Hg==
Date: Fri, 15 Apr 2022 10:40:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Christoph Hellwig <hch@lst.de>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Rahul Singh <Rahul.Singh@arm.com>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, 
    Jan Beulich <jbeulich@suse.com>, "jgross@suse.com" <jgross@suse.com>, 
    "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
Subject: Re: xen-swiotlb issue when NVMe driver is enabled in Dom0 on ARM
In-Reply-To: <20220415063705.GA24262@lst.de>
Message-ID: <alpine.DEB.2.22.394.2204150917390.915916@ubuntu-linux-20-04-desktop>
References: <C82612B1-FED5-4139-9B87-FB33DD81F01A@arm.com> <alpine.DEB.2.22.394.2204131354190.3066615@ubuntu-linux-20-04-desktop> <8C511888-6183-421E-A4C7-B271DAF46696@arm.com> <alpine.DEB.2.22.394.2204141329290.894007@ubuntu-linux-20-04-desktop>
 <20220415063705.GA24262@lst.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 15 Apr 2022, Christoph Hellwig wrote:
> On Thu, Apr 14, 2022 at 01:39:23PM -0700, Stefano Stabellini wrote:
> > OK, now we know that the code path with Xen is correct and it is the
> > same code path taken (dma_alloc_direct) as when !CONFIG_XEN and !SMMU.
> > That is how it should be.
> > 
> > I cannot explain why dma_alloc_direct() would fail when called from
> > xen_swiotlb_alloc_coherent(), but it would succeed when called from
> > dma_alloc_attrs() without Xen.
> > 
> > I am not aware of any restrictions that xen or swiotlb-xen would
> > introduce in that regard. Unless you are just running out of memory
> > because dom0_mem too low.
> 
> The crash is deep down in the page allocator.  Even if memory was low
> it should no crash.  So there is some odd interaction between Xen
> and the page allocator going on.  I think nvme and dma-direct really
> are only the messenger here.


I cannot think of anything but if that is the case I guess it is more
likely related to reserved-memory not properly advertised or ACPI tables
not properly populated.


Rahul,

What happens if you boot Linux on Xen with swiotlb-xen disabled?


diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
index 93e87b287556..26d9da58f2c6 100644
--- a/arch/arm64/mm/dma-mapping.c
+++ b/arch/arm64/mm/dma-mapping.c
@@ -51,9 +51,4 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
 	dev->dma_coherent = coherent;
 	if (iommu)
 		iommu_setup_dma_ops(dev, dma_base, size);
-
-#ifdef CONFIG_XEN
-	if (xen_initial_domain())
-		dev->dma_ops = &xen_swiotlb_dma_ops;
-#endif
 }
 

I thought Bertrand said that "it works" but I can't imagine how
swiotlb-xen could be the cause of the Linux stacktrace now.

