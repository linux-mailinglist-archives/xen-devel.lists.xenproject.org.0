Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A27D5919EFE
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 08:03:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749722.1157960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMiDo-0002cY-9R; Thu, 27 Jun 2024 06:03:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749722.1157960; Thu, 27 Jun 2024 06:03:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMiDo-0002a2-6R; Thu, 27 Jun 2024 06:03:04 +0000
Received: by outflank-mailman (input) for mailman id 749722;
 Thu, 27 Jun 2024 06:03:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/xp/=N5=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1sMiDn-0002Zw-E0
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 06:03:03 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e65037cf-344a-11ef-b4bb-af5377834399;
 Thu, 27 Jun 2024 08:02:57 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 65F8768C4E; Thu, 27 Jun 2024 08:02:52 +0200 (CEST)
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
X-Inumbo-ID: e65037cf-344a-11ef-b4bb-af5377834399
Date: Thu, 27 Jun 2024 08:02:51 +0200
From: "hch@lst.de" <hch@lst.de>
To: Michael Kelley <mhklinux@outlook.com>
Cc: "robin.murphy@arm.com" <robin.murphy@arm.com>,
	"joro@8bytes.org" <joro@8bytes.org>,
	"will@kernel.org" <will@kernel.org>,
	"jgross@suse.com" <jgross@suse.com>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>,
	"oleksandr_tyshchenko@epam.com" <oleksandr_tyshchenko@epam.com>,
	"hch@lst.de" <hch@lst.de>,
	"m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
	"petr@tesarici.cz" <petr@tesarici.cz>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC 1/1] swiotlb: Reduce calls to swiotlb_find_pool()
Message-ID: <20240627060251.GA15590@lst.de>
References: <20240607031421.182589-1-mhklinux@outlook.com> <SN6PR02MB41577686D72E206DB0084E90D4D62@SN6PR02MB4157.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN6PR02MB41577686D72E206DB0084E90D4D62@SN6PR02MB4157.namprd02.prod.outlook.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Jun 26, 2024 at 11:58:13PM +0000, Michael Kelley wrote:
> > This patch trades off making many of the core swiotlb APIs take
> > an additional argument in order to avoid duplicating calls to
> > swiotlb_find_pool(). The current code seems rather wasteful in
> > making 6 calls per round-trip, but I'm happy to accept others'
> > judgment as to whether getting rid of the waste is worth the
> > additional code complexity.
> 
> Quick ping on this RFC.  Is there any interest in moving forward?
> Quite a few lines of code are affected because of adding the
> additional "pool" argument to several functions, but the change
> is conceptually pretty simple.

Yes, this looks sensible to me.  I'm tempted to apply it.


