Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CD23C174B
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 18:45:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153234.283102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1X8c-0000oh-Jy; Thu, 08 Jul 2021 16:44:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153234.283102; Thu, 08 Jul 2021 16:44:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1X8c-0000ml-Ff; Thu, 08 Jul 2021 16:44:34 +0000
Received: by outflank-mailman (input) for mailman id 153234;
 Thu, 08 Jul 2021 16:44:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CMl4=MA=kernel.org=will@srs-us1.protection.inumbo.net>)
 id 1m1X8b-0000mf-7Q
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 16:44:33 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c4cf171c-e00b-11eb-859d-12813bfff9fa;
 Thu, 08 Jul 2021 16:44:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 88F256145A;
 Thu,  8 Jul 2021 16:44:23 +0000 (UTC)
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
X-Inumbo-ID: c4cf171c-e00b-11eb-859d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1625762671;
	bh=W3zJ1dUIVfwK2RD5Gb/pjjaY8IvTpKuqVuwPdbuz25M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sp+30VCoqVzKdRCHxsdjheJ32Al4GyKkdqY67UI3HBglP9/4ElBHuP/C2H/FyWKo7
	 e/R4/9B3d7vhaPNlh1DPVXpIf7uT6p/REBIACdKpJwJF9GZS42ymRBAxS0kVUi63dX
	 LFzIygW0HZtu2Ulg0IazOQ0jJMqOOsCWNLsNFVLNWlAdaw+e6puTS7FlMwyfD5gEdI
	 lFB3Rrin6g2B0nXBBJNO+PUuvd4DpkVlBGoDw/jR5Tje1HakbrKaEjYhMjAxMq0G0/
	 9JUb/J7ll5Lxx3f7sEDifcv8wjoDYV7KpD0n+YA4MYDlWDIvbopDufBoyo/NtyqWxC
	 FAtOTP/W4ikEQ==
Date: Thu, 8 Jul 2021 17:44:19 +0100
From: Will Deacon <will@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
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
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	maarten.lankhorst@linux.intel.com, airlied@linux.ie,
	Dan Williams <dan.j.williams@intel.com>,
	linuxppc-dev@lists.ozlabs.org, jani.nikula@linux.intel.com,
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
Message-ID: <20210708164418.GB23598@willie-the-truck>
References: <0f7bd903-e309-94a0-21d7-f0e8e9546018@arm.com>
 <YN/7xcxt/XGAKceZ@Ryzen-9-3900X.localdomain>
 <20210705190352.GA19461@willie-the-truck>
 <20210706044848.GA13640@lst.de>
 <20210706132422.GA20327@willie-the-truck>
 <a59f771f-3289-62f0-ca50-8f3675d9b166@arm.com>
 <20210706140513.GA26498@lst.de>
 <bb32d5a6-2b34-4524-e171-3e9f5f4d3a94@arm.com>
 <20210706170657.GD20750@willie-the-truck>
 <e1c026c6-22c7-8979-4941-de9cfab3863a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1c026c6-22c7-8979-4941-de9cfab3863a@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Jul 06, 2021 at 12:14:16PM -0700, Nathan Chancellor wrote:
> On 7/6/2021 10:06 AM, Will Deacon wrote:
> > On Tue, Jul 06, 2021 at 04:39:11PM +0100, Robin Murphy wrote:
> > > On 2021-07-06 15:05, Christoph Hellwig wrote:
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
> > > Ah yes, that had slipped my mind, and it's a fair point indeed. Since we're
> > > not concerned with a minimal fix for backports anyway I'm more than happy to
> > > focus on Will's approach. Another thing is that that looks to take us a
> > > quiet step closer to the possibility of dynamically resizing a SWIOTLB pool,
> > > which is something that some of the hypervisor protection schemes looking to
> > > build on top of this series may want to explore at some point.
> > 
> > Ok, I'll split that nasty diff I posted up into a reviewable series and we
> > can take it from there.
> 
> For what it's worth, I attempted to boot Will's diff on top of Konrad's
> devel/for-linus-5.14 and it did not work; in fact, I got no output on my
> monitor period, even with earlyprintk=, and I do not think this machine has
> a serial console.

Looking back at the diff, I completely messed up swiotlb_exit() by mixing up
physical and virtual addresses.

> Robin's fix does work, it survived ten reboots with no issues getting to X
> and I do not see the KASAN and slub debug messages anymore but I understand
> that this is not the preferred solution it seems (although Konrad did want
> to know if it works).
> 
> I am happy to test any further patches or follow ups as needed, just keep me
> on CC.

Cheers. Since this isn't 5.14 material any more, I'll CC you on a series
next week.

Will

