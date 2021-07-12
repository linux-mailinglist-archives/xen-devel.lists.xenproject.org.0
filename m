Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DF53C5DDA
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jul 2021 15:58:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.154565.285585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2wQf-0002Jz-41; Mon, 12 Jul 2021 13:57:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154565.285585; Mon, 12 Jul 2021 13:57:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2wQf-0002Gb-0n; Mon, 12 Jul 2021 13:57:01 +0000
Received: by outflank-mailman (input) for mailman id 154565;
 Mon, 12 Jul 2021 13:56:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=p/tL=ME=kernel.org=will@srs-us1.protection.inumbo.net>)
 id 1m2wQc-0002GV-MK
 for xen-devel@lists.xenproject.org; Mon, 12 Jul 2021 13:56:58 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b905b8e8-b7c3-4c29-b8d1-447ab9edba85;
 Mon, 12 Jul 2021 13:56:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0A31561003;
 Mon, 12 Jul 2021 13:56:48 +0000 (UTC)
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
X-Inumbo-ID: b905b8e8-b7c3-4c29-b8d1-447ab9edba85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626098216;
	bh=KqwO5Vj/j6Fq4TmXSaTqESu5yHRQzrkv3vVFfvNbMGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=apLKxQ3ase69s99n1r/hg6FOeb+BIYvcXeks3TH0kXFsiV4vt4JUCfZRcjNqqJoI+
	 C/PtbYfC7V6I9+tFs23xYS40pB1IE1Ru0GO/sR7kIL+zLBxUujKnwvKpXUPJuSJZEH
	 W/rAB9EgGt57/FadwbxksE14xUlBKeyWZI/Wnb4Nnt0t5RD8RNJlUOkSuzegkOaEqs
	 Qc6OK9PK6WVdefs+A+PDuKLzETeUU+bVabgaTyboguU6s7wHGEC28+izJWHslIy77f
	 yr0fKTdfH84fcYgWwvMeJ8lGvcnMqQz4hxapleBU2sKhQTn0GZErsyzP3AbO0nm6/5
	 eLx4kI3jlwL/w==
Date: Mon, 12 Jul 2021 14:56:45 +0100
From: Will Deacon <will@kernel.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Christoph Hellwig <hch@lst.de>, Robin Murphy <robin.murphy@arm.com>,
	heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
	peterz@infradead.org, benh@kernel.crashing.org,
	joonas.lahtinen@linux.intel.com, dri-devel@lists.freedesktop.org,
	chris@chris-wilson.co.uk, grant.likely@arm.com, paulus@samba.org,
	Frank Rowand <frowand.list@gmail.com>, mingo@kernel.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Saravana Kannan <saravanak@google.com>, mpe@ellerman.id.au,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
	linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
	Thierry Reding <treding@nvidia.com>,
	intel-gfx@lists.freedesktop.org, matthew.auld@intel.com,
	linux-devicetree <devicetree@vger.kernel.org>,
	Jianxiong Gao <jxgao@google.com>, Daniel Vetter <daniel@ffwll.ch>,
	maarten.lankhorst@linux.intel.com, airlied@linux.ie,
	Dan Williams <dan.j.williams@intel.com>,
	linuxppc-dev@lists.ozlabs.org, jani.nikula@linux.intel.com,
	Nathan Chancellor <nathan@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, rodrigo.vivi@intel.com,
	Bjorn Helgaas <bhelgaas@google.com>,
	Claire Chang <tientzu@chromium.org>, boris.ostrovsky@oracle.com,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	jgross@suse.com, Nicolas Boichat <drinkcat@chromium.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Qian Cai <quic_qiancai@quicinc.com>,
	lkml <linux-kernel@vger.kernel.org>,
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
	Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
	Tom Lendacky <thomas.lendacky@amd.com>, bauerman@linux.ibm.com
Subject: Re: [PATCH v15 06/12] swiotlb: Use is_swiotlb_force_bounce for
 swiotlb data bouncing
Message-ID: <20210712135645.GA28881@willie-the-truck>
References: <0f7bd903-e309-94a0-21d7-f0e8e9546018@arm.com>
 <YN/7xcxt/XGAKceZ@Ryzen-9-3900X.localdomain>
 <20210705190352.GA19461@willie-the-truck>
 <20210706044848.GA13640@lst.de>
 <20210706132422.GA20327@willie-the-truck>
 <a59f771f-3289-62f0-ca50-8f3675d9b166@arm.com>
 <20210706140513.GA26498@lst.de>
 <YORsr0h7u5l9DZwh@char.us.oracle.com>
 <20210706165720.GC20750@willie-the-truck>
 <YOSMDZmtfXEKerpf@char.us.oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YOSMDZmtfXEKerpf@char.us.oracle.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Jul 06, 2021 at 12:59:57PM -0400, Konrad Rzeszutek Wilk wrote:
> On Tue, Jul 06, 2021 at 05:57:21PM +0100, Will Deacon wrote:
> > On Tue, Jul 06, 2021 at 10:46:07AM -0400, Konrad Rzeszutek Wilk wrote:
> > > On Tue, Jul 06, 2021 at 04:05:13PM +0200, Christoph Hellwig wrote:
> > > > On Tue, Jul 06, 2021 at 03:01:04PM +0100, Robin Murphy wrote:
> > > > > FWIW I was pondering the question of whether to do something along those 
> > > > > lines or just scrap the default assignment entirely, so since I hadn't got 
> > > > > round to saying that I've gone ahead and hacked up the alternative 
> > > > > (similarly untested) for comparison :)
> > > > >
> > > > > TBH I'm still not sure which one I prefer...
> > > > 
> > > > Claire did implement something like your suggestion originally, but
> > > > I don't really like it as it doesn't scale for adding multiple global
> > > > pools, e.g. for the 64-bit addressable one for the various encrypted
> > > > secure guest schemes.
> > > 
> > > Couple of things:
> > >  - I am not pushing to Linus the Claire's patchset until we have a
> > >    resolution on this. I hope you all agree that is a sensible way
> > >    forward as much as I hate doing that.
> > 
> > Sure, it's a pity but we could clearly use a bit more time to get these
> > just right and we've run out of time for 5.14.
> > 
> > I think the main question I have is how would you like to see patches for
> > 5.15? i.e. as patches on top of devel/for-linus-5.14 or something else?
> 
> Yes that would be perfect. If there are any dependencies on the rc1, I
> can rebase it on top of that.

Yes, please, rebasing would be very helpful. The broader rework of
'io_tlb_default_mem' is going to conflict quite badly otherwise.

Cheers,

Will

