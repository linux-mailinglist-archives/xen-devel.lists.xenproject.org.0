Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4A99296D4
	for <lists+xen-devel@lfdr.de>; Sun,  7 Jul 2024 08:37:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.754853.1163161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQLVa-0007UO-EI; Sun, 07 Jul 2024 06:36:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 754853.1163161; Sun, 07 Jul 2024 06:36:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQLVa-0007RE-Av; Sun, 07 Jul 2024 06:36:26 +0000
Received: by outflank-mailman (input) for mailman id 754853;
 Sun, 07 Jul 2024 06:36:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qAAL=OH=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1sQLVY-0007R8-VH
 for xen-devel@lists.xenproject.org; Sun, 07 Jul 2024 06:36:24 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39d98ff9-3c2b-11ef-bbfb-fd08da9f4363;
 Sun, 07 Jul 2024 08:36:23 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id A847E68AFE; Sun,  7 Jul 2024 08:36:19 +0200 (CEST)
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
X-Inumbo-ID: 39d98ff9-3c2b-11ef-bbfb-fd08da9f4363
Date: Sun, 7 Jul 2024 08:36:19 +0200
From: Christoph Hellwig <hch@lst.de>
To: Michael Kelley <mhklinux@outlook.com>
Cc: Christoph Hellwig <hch@lst.de>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"joro@8bytes.org" <joro@8bytes.org>,
	"will@kernel.org" <will@kernel.org>,
	"jgross@suse.com" <jgross@suse.com>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>,
	"oleksandr_tyshchenko@epam.com" <oleksandr_tyshchenko@epam.com>,
	"m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
	"petr@tesarici.cz" <petr@tesarici.cz>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/1] swiotlb: Reduce swiotlb pool lookups
Message-ID: <20240707063619.GA387@lst.de>
References: <20240701165746.1358-1-mhklinux@outlook.com> <20240706055019.GA13280@lst.de> <SN6PR02MB4157141FBF8252BDEAD831C1D4D92@SN6PR02MB4157.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SN6PR02MB4157141FBF8252BDEAD831C1D4D92@SN6PR02MB4157.namprd02.prod.outlook.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Sun, Jul 07, 2024 at 02:11:48AM +0000, Michael Kelley wrote:
> This works pretty well. It certainly avoids the messiness of declaring
> a "pool" local variable and needing a separate assignment before the
> "if" statement, in each of the 9 call sites. The small downside is that
> it looks like a swiotlb function is called every time, even though
> there's usually an inline bailout. But that pattern occurs throughout
> the kernel, so not a big deal.
> 
> I initially coded this change as a separate patch that goes first. But
> the second patch ends up changing about 20 lines that are changed
> by the first patch. It's hard to cleanly tease them apart. So I've gone
> back to a single unified patch. But let me know if you think it's worth
> the extra churn to break them apart.

I think it's perfectly fine to keep one big patch.

> Yes, this works as long as the declarations for the __swiotlb_foo
> functions are *not* under CONFIG_SWIOTLB. But when compiling with
> !CONFIG_SWIOTLB on arm64 with gcc-8.5.0, two tangentially related
> compile errors occur. iommu_dma_map_page() references
> swiotlb_tlb_map_single(). The declaration for the latter is under
> CONFIG_SWIOTLB. A similar problem occurs with dma_direct_map_page()
> and swiotlb_map(). Do later versions of gcc not complain when the
> reference is in dead code? Or are these just bugs that occurred because
> !CONFIG_SWIOTLB is rare? If the latter, I can submit a separate patch to
> move the declarations out from under CONFIG_SWIOTLB.

A reference to dead code is fine as long as the condition is a compile
time one.  I think your next mail sugests you've sorted this out, but
if not let me know or just shared your current work in progress patch.

> > 	if (IS_ENABLED(CONFIG_SWIOTLB_DYNAMIC)) {
> 
> The "IS_ENABLED" doesn't work because the dma_uses_io_tlb
> field in struct dev is under CONFIG_SWIOTLB_DYNAMIC. I guess
> it could be moved out, but that's going further afield. So I'm back
> to using #ifdef.

Yes, we'd need the field definition.

> Petr Tesařík had commented [1] on my original RFC suggesting that
> __swiotlb_find_pool() be used here instead of open coding it. With
> the changes you suggest, __swiotlb_find_pool() is needed only in
> the CONFIG_SWIOTLB_DYNAMIC case, and I would be fine with just
> open coding the address of defpool here. Petr -- are you OK with
> removing __swiotlb_find_pool when !CONFIG_SWIOTLB_DYNAMIC,
> since this is the only place it would be used?

Yes.  That was indeed the intent behind the suggstion.

