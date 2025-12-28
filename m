Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEB0CE518C
	for <lists+xen-devel@lfdr.de>; Sun, 28 Dec 2025 15:51:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1193804.1512388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vZs6a-0006uG-K7; Sun, 28 Dec 2025 14:50:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1193804.1512388; Sun, 28 Dec 2025 14:50:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vZs6a-0006s0-HR; Sun, 28 Dec 2025 14:50:48 +0000
Received: by outflank-mailman (input) for mailman id 1193804;
 Sun, 28 Dec 2025 14:50:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8FLo=7C=kernel.org=leon@srs-se1.protection.inumbo.net>)
 id 1vZs6Z-0006rs-PP
 for xen-devel@lists.xenproject.org; Sun, 28 Dec 2025 14:50:47 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9711a2f2-e3fc-11f0-b15c-2bf370ae4941;
 Sun, 28 Dec 2025 15:50:46 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2B69B43EC7;
 Sun, 28 Dec 2025 14:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CDB8C4CEFB;
 Sun, 28 Dec 2025 14:50:44 +0000 (UTC)
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
X-Inumbo-ID: 9711a2f2-e3fc-11f0-b15c-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766933445;
	bh=qbiHTFr5GuNGzRGenhnbtkv5WysSVwMoyJI42ZMBbjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uR1KTIMbxcfjIMp5BeqFx3rLg3y1/DslfD3E9dpTGsYLDXumEMvyTDlrtJexRliP8
	 4rMhxVlEgscTX6SMvyoGGbqBB9s3IhOyr0Dq1rOTTq9DRKyQCs5R4MMaiXq5SMJDv8
	 ypPf4xJu36IIq2elskChlmVCggK0X5P0P3iMsdzipt3Q/Pz09VtoJGRlajt3LsI+Wl
	 gbwuGIGXFZFArEze9cY3ogr29kq3DbeOzLDvfFkXuQM3i0eAPwqneC1a0xL9kATsPV
	 e7ey8Ht1VOWWZqIFGccgi1XAHIthQy1YRdTkX615ut3eBb5C2AjajZOKWeMy6qELr1
	 bfIt1iNGLWgqA==
Date: Sun, 28 Dec 2025 16:50:41 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Barry Song <21cnbao@gmail.com>
Cc: catalin.marinas@arm.com, m.szyprowski@samsung.com, robin.murphy@arm.com,
	will@kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Tangquan Zheng <zhengtangquan@oppo.com>
Subject: Re: [PATCH v2 5/8] dma-mapping: Support batch mode for
 dma_direct_sync_sg_for_*
Message-ID: <20251228145041.GS11869@unreal>
References: <20251226225254.46197-1-21cnbao@gmail.com>
 <20251226225254.46197-6-21cnbao@gmail.com>
 <20251227200933.GO11869@unreal>
 <CAGsJ_4yA83-K7PXiEtyidzF_j6qqKkt92z485KBS9+zGe_rjnw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4yA83-K7PXiEtyidzF_j6qqKkt92z485KBS9+zGe_rjnw@mail.gmail.com>

On Sun, Dec 28, 2025 at 09:52:05AM +1300, Barry Song wrote:
> On Sun, Dec 28, 2025 at 9:09 AM Leon Romanovsky <leon@kernel.org> wrote:
> >
> > On Sat, Dec 27, 2025 at 11:52:45AM +1300, Barry Song wrote:
> > > From: Barry Song <baohua@kernel.org>
> > >
> > > Instead of performing a flush per SG entry, issue all cache
> > > operations first and then flush once. This ultimately benefits
> > > __dma_sync_sg_for_cpu() and __dma_sync_sg_for_device().
> > >
> > > Cc: Leon Romanovsky <leon@kernel.org>
> > > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > > Cc: Will Deacon <will@kernel.org>
> > > Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > > Cc: Robin Murphy <robin.murphy@arm.com>
> > > Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> > > Cc: Ard Biesheuvel <ardb@kernel.org>
> > > Cc: Marc Zyngier <maz@kernel.org>
> > > Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> > > Cc: Ryan Roberts <ryan.roberts@arm.com>
> > > Cc: Suren Baghdasaryan <surenb@google.com>
> > > Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> > > Signed-off-by: Barry Song <baohua@kernel.org>
> > > ---
> > >  kernel/dma/direct.c | 14 +++++++-------
> > >  1 file changed, 7 insertions(+), 7 deletions(-)
> >
> > <...>
> >
> > > -             if (!dev_is_dma_coherent(dev)) {
> > > +             if (!dev_is_dma_coherent(dev))
> > >                       arch_sync_dma_for_device(paddr, sg->length,
> > >                                       dir);
> > > -                     arch_sync_dma_flush();
> > > -             }
> > >       }
> > > +     if (!dev_is_dma_coherent(dev))
> > > +             arch_sync_dma_flush();
> >
> > This patch should be squashed into the previous one. You introduced
> > arch_sync_dma_flush() there, and now you are placing it elsewhere.
> 
> Hi Leon,
> 
> The previous patch replaces all arch_sync_dma_for_* calls with
> arch_sync_dma_for_* plus arch_sync_dma_flush(), without any
> functional change. The subsequent patches then implement the
> actual batching. I feel this is a better approach for reviewing
> each change independently. Otherwise, the previous patch would
> be too large.

Don't worry about it. Your patches are small enough.

> 
> Thanks
> Barry

