Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C373BDBBF
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 18:58:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151553.280080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0oO8-0004ER-Ad; Tue, 06 Jul 2021 16:57:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151553.280080; Tue, 06 Jul 2021 16:57:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0oO8-0004Ce-7V; Tue, 06 Jul 2021 16:57:36 +0000
Received: by outflank-mailman (input) for mailman id 151553;
 Tue, 06 Jul 2021 16:57:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ZJM=L6=kernel.org=will@srs-us1.protection.inumbo.net>)
 id 1m0oO6-0004CY-E8
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 16:57:34 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a1364207-0f3a-43aa-a374-a8c5773fd9ff;
 Tue, 06 Jul 2021 16:57:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 027E761A0F;
 Tue,  6 Jul 2021 16:57:24 +0000 (UTC)
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
X-Inumbo-ID: a1364207-0f3a-43aa-a374-a8c5773fd9ff
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1625590652;
	bh=5up8/Bb0rLsCNavkU95AUJkD0QYWqQ8IKvDM0S2EuWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BdlCeYWdA0LGQqw4NCthGEImHDcykOTXLbRY0p2OzfXTSjVjgAkalkpSZRdXk7myS
	 ggdoMpep1HYdBLP4alpxbeLY2vbW4R6HTU/Vi4e5HLBlWUzcqfaGM7iFoc0a6mvwIQ
	 OtryjDMBpvdg7dJuiMXwOl88SmpKdFQmz0rw3SopyQp4YNJrpHbSZzb5034J5yMjTF
	 8iEUr6dVhZVSqKBvB0pDdDElb2vQPGkIFBQxZHqD6FxdW2DFwsOiJcnDaYmQKnMJGl
	 2f5cYXW5YDte/kZj3tp146452h4FgBzYXIDAdb4rsa2LksEi8bwpu2LbdNX+D444o2
	 b9VQWPtZ1e95g==
Date: Tue, 6 Jul 2021 17:57:21 +0100
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
Message-ID: <20210706165720.GC20750@willie-the-truck>
References: <ea28db1f-846e-4f0a-4f13-beb67e66bbca@kernel.org>
 <20210702135856.GB11132@willie-the-truck>
 <0f7bd903-e309-94a0-21d7-f0e8e9546018@arm.com>
 <YN/7xcxt/XGAKceZ@Ryzen-9-3900X.localdomain>
 <20210705190352.GA19461@willie-the-truck>
 <20210706044848.GA13640@lst.de>
 <20210706132422.GA20327@willie-the-truck>
 <a59f771f-3289-62f0-ca50-8f3675d9b166@arm.com>
 <20210706140513.GA26498@lst.de>
 <YORsr0h7u5l9DZwh@char.us.oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YORsr0h7u5l9DZwh@char.us.oracle.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Jul 06, 2021 at 10:46:07AM -0400, Konrad Rzeszutek Wilk wrote:
> On Tue, Jul 06, 2021 at 04:05:13PM +0200, Christoph Hellwig wrote:
> > On Tue, Jul 06, 2021 at 03:01:04PM +0100, Robin Murphy wrote:
> > > FWIW I was pondering the question of whether to do something along those 
> > > lines or just scrap the default assignment entirely, so since I hadn't got 
> > > round to saying that I've gone ahead and hacked up the alternative 
> > > (similarly untested) for comparison :)
> > >
> > > TBH I'm still not sure which one I prefer...
> > 
> > Claire did implement something like your suggestion originally, but
> > I don't really like it as it doesn't scale for adding multiple global
> > pools, e.g. for the 64-bit addressable one for the various encrypted
> > secure guest schemes.
> 
> Couple of things:
>  - I am not pushing to Linus the Claire's patchset until we have a
>    resolution on this. I hope you all agree that is a sensible way
>    forward as much as I hate doing that.

Sure, it's a pity but we could clearly use a bit more time to get these
just right and we've run out of time for 5.14.

I think the main question I have is how would you like to see patches for
5.15? i.e. as patches on top of devel/for-linus-5.14 or something else?

Cheers,

Will

