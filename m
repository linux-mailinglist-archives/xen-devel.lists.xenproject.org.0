Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCDEAB0670
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 01:16:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979628.1366144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDAS9-00037R-Pa; Thu, 08 May 2025 23:14:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979628.1366144; Thu, 08 May 2025 23:14:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDAS9-00035y-LK; Thu, 08 May 2025 23:14:57 +0000
Received: by outflank-mailman (input) for mailman id 979628;
 Thu, 08 May 2025 23:14:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QXoN=XY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uDAS8-00035s-KZ
 for xen-devel@lists.xenproject.org; Thu, 08 May 2025 23:14:56 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3fb04f68-2c62-11f0-9eb4-5ba50f476ded;
 Fri, 09 May 2025 01:14:54 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CE8E949E37;
 Thu,  8 May 2025 23:14:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58903C4CEE7;
 Thu,  8 May 2025 23:14:51 +0000 (UTC)
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
X-Inumbo-ID: 3fb04f68-2c62-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746746092;
	bh=b/rZbBu/kd8miGQyME180cFglbDpC6omgZiTM3EgZvE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=muucR9EJAc7m4NJf2H9VIUt1waSHNztv2dI0HxkkiYDyNzgZ20+vhc/hLIi7SplRQ
	 G/ZPN5ry52zgZV+Vy47H0TIG4563fxjhHcXUBYyAYxlAjqhbcgRqxvlyD1DGFPaAjH
	 nETZt1r3fGNF266oTJ4K9isd8g//Ojqy5xKqH8OqZtCMOzhr+KtQ31IFHTQp9E02u3
	 2MtaMfiq0j0cxwK5ApE6IbFR6GxooQJ6iLlPTNt9NXt8sjoFhsphLeZFhltN1du7CH
	 cj74y0Cb8lHczM05duqYh5D9W4mwdas5K17oxFuno1yqYfSgDDRfCE3lht3rlTwQH8
	 BPK+YOn1pH/qw==
Date: Thu, 8 May 2025 16:14:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Christoph Hellwig <hch@infradead.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    John Ernberg <john.ernberg@actia.se>, Juergen Gross <jgross@suse.com>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Catalin Marinas <catalin.marinas@arm.com>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "iommu@lists.linux.dev" <iommu@lists.linux.dev>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
    "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH 2/2] xen: swiotlb: Implement map_resource callback
In-Reply-To: <aBwvrLKD_VJapYkB@infradead.org>
Message-ID: <alpine.DEB.2.22.394.2505081614450.3879245@ubuntu-linux-20-04-desktop>
References: <20250502114043.1968976-1-john.ernberg@actia.se> <20250502114043.1968976-3-john.ernberg@actia.se> <alpine.DEB.2.22.394.2505021007460.3879245@ubuntu-linux-20-04-desktop> <75266eb7-66a4-4477-ae8a-cbd1ebbee8db@actia.se>
 <alpine.DEB.2.22.394.2505071602570.3879245@ubuntu-linux-20-04-desktop> <aBwvrLKD_VJapYkB@infradead.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 7 May 2025, Christoph Hellwig wrote:
> On Wed, May 07, 2025 at 04:09:15PM -0700, Stefano Stabellini wrote:
> > > This mapping is not for a RAM backed address. In the eDMA case for the 
> > > iMX8QXP the `phys` coming in here is the address of a register.
> > 
> > Ok, this information is important :-)
> > 
> > I am not certain whether the map_resource interface can only be called
> > for MMIO addresses or if it can also be called for RAM-backed addresses
> > with a size > PAGE_SIZE. In the latter case, we could run into the issue
> > I was describing.
> 
> map_resource is intended for MMIO regions, although those could be >
> PAGE_SIZE.  It must not be called on RAM.

In that case, John, you can just use dma_direct_map_resource().

That's because MMIO regions:
- are 1:1 mapped on ARM
- are 1:1 mapped on x86 for PV Dom0
- might not be 1:1 mapped on x86 for PVH Dom0, but in this case we rely
  on the IOMMU to do address translation

In none of these cases xen_phys_to_dma would give us any interesting
results.  It would be the same as calling phys_to_dma.

