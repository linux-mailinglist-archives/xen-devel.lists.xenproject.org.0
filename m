Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 233073BDBF0
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 19:07:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151565.280109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0oXQ-0006Iu-JL; Tue, 06 Jul 2021 17:07:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151565.280109; Tue, 06 Jul 2021 17:07:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0oXQ-0006GK-GJ; Tue, 06 Jul 2021 17:07:12 +0000
Received: by outflank-mailman (input) for mailman id 151565;
 Tue, 06 Jul 2021 17:07:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ZJM=L6=kernel.org=will@srs-us1.protection.inumbo.net>)
 id 1m0oXP-0006GE-QW
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 17:07:11 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 99b02bb0-de7c-11eb-84ad-12813bfff9fa;
 Tue, 06 Jul 2021 17:07:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D8BEB61C3B;
 Tue,  6 Jul 2021 17:07:01 +0000 (UTC)
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
X-Inumbo-ID: 99b02bb0-de7c-11eb-84ad-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1625591229;
	bh=VhhzIH6gzRT8gtRsisto5IDFaHK+/13p4/dNI43mqXQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hl0xCyjFbo3wnMVlDA8LcQL8eHToHXmUMr23zuNOTdipVfwNhivzNpi8rpTly6eYi
	 yPd2oC5omfpzshqqnFMLEQGIyy9TAQeSgCgSvFYmHpKLsM30eMNC98TPrdW8hja8Kb
	 4m1fjoFjCWorTG/lEoPVyDyK3SJHLMjyzybho2CdMauS/azg7sMbNbYLaDlqMOER13
	 ALFzRBBx8Uq7Drdf4gPPQLMEsDVKJLDGxMmwxLH7I7ZcRSFV8ffeda6f2WQMZefhG6
	 DGh52bATmGicYuUcNyMSkAeHgzE8e4+s/u25yglW+hkrikwQu6kPAYHnUHYwEX7ru4
	 L8ww7+blLmJBA==
Date: Tue, 6 Jul 2021 18:06:58 +0100
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Christoph Hellwig <hch@lst.de>, heikki.krogerus@linux.intel.com,
	thomas.hellstrom@linux.intel.com, peterz@infradead.org,
	benh@kernel.crashing.org, joonas.lahtinen@linux.intel.com,
	dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
	grant.likely@arm.com, paulus@samba.org,
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
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
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
Message-ID: <20210706170657.GD20750@willie-the-truck>
References: <ea28db1f-846e-4f0a-4f13-beb67e66bbca@kernel.org>
 <20210702135856.GB11132@willie-the-truck>
 <0f7bd903-e309-94a0-21d7-f0e8e9546018@arm.com>
 <YN/7xcxt/XGAKceZ@Ryzen-9-3900X.localdomain>
 <20210705190352.GA19461@willie-the-truck>
 <20210706044848.GA13640@lst.de>
 <20210706132422.GA20327@willie-the-truck>
 <a59f771f-3289-62f0-ca50-8f3675d9b166@arm.com>
 <20210706140513.GA26498@lst.de>
 <bb32d5a6-2b34-4524-e171-3e9f5f4d3a94@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb32d5a6-2b34-4524-e171-3e9f5f4d3a94@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Jul 06, 2021 at 04:39:11PM +0100, Robin Murphy wrote:
> On 2021-07-06 15:05, Christoph Hellwig wrote:
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
> Ah yes, that had slipped my mind, and it's a fair point indeed. Since we're
> not concerned with a minimal fix for backports anyway I'm more than happy to
> focus on Will's approach. Another thing is that that looks to take us a
> quiet step closer to the possibility of dynamically resizing a SWIOTLB pool,
> which is something that some of the hypervisor protection schemes looking to
> build on top of this series may want to explore at some point.

Ok, I'll split that nasty diff I posted up into a reviewable series and we
can take it from there.

Will

