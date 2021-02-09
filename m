Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D72314A81
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 09:42:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83169.154171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9OZv-0000cs-Fu; Tue, 09 Feb 2021 08:40:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83169.154171; Tue, 09 Feb 2021 08:40:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9OZv-0000cT-CE; Tue, 09 Feb 2021 08:40:59 +0000
Received: by outflank-mailman (input) for mailman id 83169;
 Tue, 09 Feb 2021 08:40:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TLR6=HL=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1l9OZt-0000cO-ED
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 08:40:57 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e785b8ec-0630-489f-8e4b-3fe257e332de;
 Tue, 09 Feb 2021 08:40:55 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 711FD68AFE; Tue,  9 Feb 2021 09:40:51 +0100 (CET)
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
X-Inumbo-ID: e785b8ec-0630-489f-8e4b-3fe257e332de
Date: Tue, 9 Feb 2021 09:40:50 +0100
From: Christoph Hellwig <hch@lst.de>
To: Claire Chang <tientzu@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	boris.ostrovsky@oracle.com, jgross@suse.com,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	benh@kernel.crashing.org, paulus@samba.org,
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
	sstabellini@kernel.org, Robin Murphy <robin.murphy@arm.com>,
	grant.likely@arm.com, xypron.glpk@gmx.de,
	Thierry Reding <treding@nvidia.com>, mingo@kernel.org,
	bauerman@linux.ibm.com, peterz@infradead.org,
	Greg KH <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	heikki.krogerus@linux.intel.com,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	linux-devicetree <devicetree@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
	xen-devel@lists.xenproject.org,
	Nicolas Boichat <drinkcat@chromium.org>,
	Jim Quinlan <james.quinlan@broadcom.com>
Subject: Re: [PATCH v4 01/14] swiotlb: Remove external access to
 io_tlb_start
Message-ID: <20210209084050.GA32212@lst.de>
References: <20210209062131.2300005-1-tientzu@chromium.org> <20210209062131.2300005-2-tientzu@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210209062131.2300005-2-tientzu@chromium.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Feb 09, 2021 at 02:21:18PM +0800, Claire Chang wrote:
> This can be dropped if Christoph's swiotlb cleanups are landed.
> https://lore.kernel.org/linux-iommu/20210207160934.2955931-1-hch@lst.de/T/#m7124f29b6076d462101fcff6433295157621da09 

FYI, I've also started looking into additional cleanups based on your
struct in this branch, but I'd like to wait for all the previous
changes to settle first:

http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/swiotlb-struct

