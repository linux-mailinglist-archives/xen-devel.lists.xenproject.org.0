Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1DC8BDAB6
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 07:36:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717870.1120370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4DUr-0007gl-IV; Tue, 07 May 2024 05:36:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717870.1120370; Tue, 07 May 2024 05:36:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4DUr-0007ep-Fk; Tue, 07 May 2024 05:36:13 +0000
Received: by outflank-mailman (input) for mailman id 717870;
 Tue, 07 May 2024 05:36:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yupB=MK=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1s4DUp-0007ej-V2
 for xen-devel@lists.xenproject.org; Tue, 07 May 2024 05:36:11 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3fc7131-0c33-11ef-b4bb-af5377834399;
 Tue, 07 May 2024 07:36:07 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 66D67227A87; Tue,  7 May 2024 07:36:04 +0200 (CEST)
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
X-Inumbo-ID: b3fc7131-0c33-11ef-b4bb-af5377834399
Date: Tue, 7 May 2024 07:36:04 +0200
From: Christoph Hellwig <hch@lst.de>
To: mhklinux@outlook.com
Cc: robin.murphy@arm.com, joro@8bytes.org, will@kernel.org, jgross@suse.com,
	sstabellini@kernel.org, oleksandr_tyshchenko@epam.com, hch@lst.de,
	m.szyprowski@samsung.com, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	petr@tesarici.cz, roberto.sassu@huaweicloud.com
Subject: Re: [PATCH 2/2] iommu/dma: Fix zero'ing of bounce buffer padding
 used by untrusted devices
Message-ID: <20240507053604.GA31731@lst.de>
References: <20240408041142.665563-1-mhklinux@outlook.com> <20240408041142.665563-2-mhklinux@outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240408041142.665563-2-mhklinux@outlook.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Sun, Apr 07, 2024 at 09:11:42PM -0700, mhkelley58@gmail.com wrote:
> I've wondered if this code for zero'ing the pre- and post-padding
> should go in swiotlb_tbl_map_single(). The bounce buffer proper is
> already being initialized there. But swiotlb_tbl_map_single()
> would need to test for an untrusted device (or have a "zero the
> padding" flag passed in as part of the "attrs" argument), which
> adds complexity. Thoughts?

If we want to go down that route it should be the latter.  I'm
not sure if it is an improvement, but we'd have to implement it
to see if it does.

> The commit ID of Petr's patch is X'ed out above because Petr's patch
> hasn't gone into Linus' tree yet. We can add the real commit ID once
> this patch is ready to go in.

I've fixed that up and commit the series.

Thanks a lot!


