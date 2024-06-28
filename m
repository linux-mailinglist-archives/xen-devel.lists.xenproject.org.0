Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 865DA91B6A0
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jun 2024 08:02:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.750492.1158612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sN4fz-0002EQ-On; Fri, 28 Jun 2024 06:01:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 750492.1158612; Fri, 28 Jun 2024 06:01:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sN4fz-0002Cs-L4; Fri, 28 Jun 2024 06:01:39 +0000
Received: by outflank-mailman (input) for mailman id 750492;
 Fri, 28 Jun 2024 06:01:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q1UJ=N6=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1sN4fy-0002Cm-D6
 for xen-devel@lists.xenproject.org; Fri, 28 Jun 2024 06:01:38 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0e08f94-3513-11ef-90a3-e314d9c70b13;
 Fri, 28 Jun 2024 08:01:37 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id C992B68D09; Fri, 28 Jun 2024 08:01:30 +0200 (CEST)
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
X-Inumbo-ID: e0e08f94-3513-11ef-90a3-e314d9c70b13
Date: Fri, 28 Jun 2024 08:01:29 +0200
From: "hch@lst.de" <hch@lst.de>
To: Michael Kelley <mhklinux@outlook.com>
Cc: "hch@lst.de" <hch@lst.de>,
	Petr =?utf-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"joro@8bytes.org" <joro@8bytes.org>,
	"will@kernel.org" <will@kernel.org>,
	"jgross@suse.com" <jgross@suse.com>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>,
	"oleksandr_tyshchenko@epam.com" <oleksandr_tyshchenko@epam.com>,
	"m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC 1/1] swiotlb: Reduce calls to swiotlb_find_pool()
Message-ID: <20240628060129.GA26206@lst.de>
References: <20240607031421.182589-1-mhklinux@outlook.com> <SN6PR02MB41577686D72E206DB0084E90D4D62@SN6PR02MB4157.namprd02.prod.outlook.com> <20240627060251.GA15590@lst.de> <20240627085216.556744c1@meshulam.tesarici.cz> <SN6PR02MB4157E61B49C8435E38AC968DD4D72@SN6PR02MB4157.namprd02.prod.outlook.com> <20240627152513.GA23497@lst.de> <SN6PR02MB4157D9B1A64FF78461D6A7EDD4D72@SN6PR02MB4157.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN6PR02MB4157D9B1A64FF78461D6A7EDD4D72@SN6PR02MB4157.namprd02.prod.outlook.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Jun 27, 2024 at 04:02:59PM +0000, Michael Kelley wrote:
> > > Conceptually, it's still being used as a boolean function based on
> > > whether the return value is NULL.  Renaming it to swiotlb_get_pool()
> > > more accurately describes the return value, but obscures the
> > > intent of determining if it is a swiotlb buffer.  I'll think about it.
> > > Suggestions are welcome.
> > 
> > Just keep is_swiotlb_buffer as a trivial inline helper that returns
> > bool.
> 
> I don't understand what you are suggesting.  Could you elaborate a bit?
> is_swiotlb_buffer() can't be trivial when CONFIG_SWIOTLB_DYNAMIC
> is set.

Call the main function that finds and retuns the pool swiotlb_find_pool,
and then have a is_swiotlb_buffer wrapper that just returns bool.


