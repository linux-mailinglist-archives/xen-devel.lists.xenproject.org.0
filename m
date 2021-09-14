Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1247140B325
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 17:31:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186890.335643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQAOc-0003bn-6j; Tue, 14 Sep 2021 15:30:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186890.335643; Tue, 14 Sep 2021 15:30:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQAOc-0003Yg-2w; Tue, 14 Sep 2021 15:30:54 +0000
Received: by outflank-mailman (input) for mailman id 186890;
 Tue, 14 Sep 2021 15:30:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SMEH=OE=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1mQAOZ-0003YX-Oq
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 15:30:51 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bd686c22-1570-11ec-b44e-12813bfff9fa;
 Tue, 14 Sep 2021 15:30:50 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 375B567373; Tue, 14 Sep 2021 17:30:47 +0200 (CEST)
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
X-Inumbo-ID: bd686c22-1570-11ec-b44e-12813bfff9fa
Date: Tue, 14 Sep 2021 17:30:46 +0200
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
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org
Subject: Re: [PATCH] swiotlb: set IO TLB segment size via cmdline
Message-ID: <20210914153046.GB815@lst.de>
References: <20210914151016.3174924-1-Roman_Skakun@epam.com> <7c04db79-7de1-93ff-0908-9bad60a287b9@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c04db79-7de1-93ff-0908-9bad60a287b9@suse.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Sep 14, 2021 at 05:29:07PM +0200, Jan Beulich wrote:
> I'm not convinced the swiotlb use describe there falls under "intended
> use" - mapping a 1280x720 framebuffer in a single chunk? (As an aside,
> the bottom of this page is also confusing, as following "Then we can
> confirm the modified swiotlb size in the boot log:" there is a log
> fragment showing the same original size of 64Mb.

It doesn't.  We also do not add hacks to the kernel for whacky out
of tree modules.

