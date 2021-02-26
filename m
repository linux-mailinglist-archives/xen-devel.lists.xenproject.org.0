Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D54A8325CF5
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 06:18:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90065.170325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFVVa-000775-Vn; Fri, 26 Feb 2021 05:17:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90065.170325; Fri, 26 Feb 2021 05:17:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFVVa-00076g-So; Fri, 26 Feb 2021 05:17:46 +0000
Received: by outflank-mailman (input) for mailman id 90065;
 Fri, 26 Feb 2021 05:17:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kQax=H4=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1lFVVZ-00076b-CY
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 05:17:45 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cb6c6d5f-485f-43bb-b75d-1e5aa86a1d47;
 Fri, 26 Feb 2021 05:17:44 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 001F968BEB; Fri, 26 Feb 2021 06:17:40 +0100 (CET)
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
X-Inumbo-ID: cb6c6d5f-485f-43bb-b75d-1e5aa86a1d47
Date: Fri, 26 Feb 2021 06:17:40 +0100
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
Subject: Re: [PATCH v4 12/14] swiotlb: Add restricted DMA alloc/free
 support.
Message-ID: <20210226051740.GB2072@lst.de>
References: <20210209062131.2300005-1-tientzu@chromium.org> <20210209062131.2300005-13-tientzu@chromium.org> <CALiNf298+DLjTK6ALe0mYrRuCP_LtztMGuQQCS90ubDctbS0kw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALiNf298+DLjTK6ALe0mYrRuCP_LtztMGuQQCS90ubDctbS0kw@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Feb 26, 2021 at 12:17:50PM +0800, Claire Chang wrote:
> Do you think I should fix this and rebase on the latest linux-next
> now? I wonder if there are more factor and clean up coming and I
> should wait after that.

Here is my preferred plan:

 1) wait for my series to support the min alignment in swiotlb to
    land in Linus tree
 2) I'll resend my series with the further swiotlb cleanup and
    refactoring, which includes a slightly rebased version of your
    patch to add the io_tlb_mem structure
 3) resend your series on top of that as a baseline

This is my current WIP tree for 2:

  http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/swiotlb-struct

