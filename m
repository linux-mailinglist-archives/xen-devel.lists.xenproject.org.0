Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA27340C6C4
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 15:53:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187677.336625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQVLs-0006KX-3H; Wed, 15 Sep 2021 13:53:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187677.336625; Wed, 15 Sep 2021 13:53:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQVLr-0006HO-Vv; Wed, 15 Sep 2021 13:53:27 +0000
Received: by outflank-mailman (input) for mailman id 187677;
 Wed, 15 Sep 2021 13:53:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wsiD=OF=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1mQVLq-0006HI-Ly
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 13:53:26 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 46135c73-c01a-49b5-a8d3-c099aa8769b2;
 Wed, 15 Sep 2021 13:53:24 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id AC35C67357; Wed, 15 Sep 2021 15:53:21 +0200 (CEST)
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
X-Inumbo-ID: 46135c73-c01a-49b5-a8d3-c099aa8769b2
Date: Wed, 15 Sep 2021 15:53:21 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roman Skakun <rm.skakun@gmail.com>,
	Andrii Anisov <andrii_anisov@epam.com>,
	Roman Skakun <roman_skakun@epam.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Muchun Song <songmuchun@bytedance.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Mike Rapoport <rppt@kernel.org>, Will Deacon <will@kernel.org>,
	xen-devel@lists.xenproject.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	iommu <iommu@lists.linux-foundation.org>
Subject: Re: [PATCH] swiotlb: set IO TLB segment size via cmdline
Message-ID: <20210915135321.GA15216@lst.de>
References: <20210914151016.3174924-1-Roman_Skakun@epam.com> <7c04db79-7de1-93ff-0908-9bad60a287b9@suse.com> <CADu_u-Ou08tMFm5xU871ae8ct+2YOuvn4rQ=83CMTbg2bx87Pg@mail.gmail.com> <84ef7ff7-2c9c-113a-4a2c-cef54a6ded51@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84ef7ff7-2c9c-113a-4a2c-cef54a6ded51@suse.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Sep 15, 2021 at 03:49:52PM +0200, Jan Beulich wrote:
> But the question remains: Why does the framebuffer need to be mapped
> in a single giant chunk?

More importantly: if you use dynamic dma mappings for your framebuffer
you're doing something wrong.

