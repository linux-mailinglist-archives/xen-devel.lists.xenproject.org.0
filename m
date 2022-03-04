Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD854CD930
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 17:35:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284356.483577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQAt5-000290-1y; Fri, 04 Mar 2022 16:34:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284356.483577; Fri, 04 Mar 2022 16:34:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQAt4-000279-V6; Fri, 04 Mar 2022 16:34:38 +0000
Received: by outflank-mailman (input) for mailman id 284356;
 Fri, 04 Mar 2022 16:34:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2+cs=TP=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1nQAt3-000273-D0
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 16:34:37 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa0ec7de-9bd8-11ec-8eba-a37418f5ba1a;
 Fri, 04 Mar 2022 17:34:35 +0100 (CET)
Received: by verein.lst.de (Postfix, from userid 2407)
 id E2BFF68AFE; Fri,  4 Mar 2022 17:34:30 +0100 (CET)
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
X-Inumbo-ID: fa0ec7de-9bd8-11ec-8eba-a37418f5ba1a
Date: Fri, 4 Mar 2022 17:34:30 +0100
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org,
	x86@kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>, Joerg Roedel <joro@8bytes.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org, linux-ia64@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-hyperv@vger.kernel.org, tboot-devel@lists.sourceforge.net,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH 11/12] swiotlb: merge swiotlb-xen initialization into
 swiotlb
Message-ID: <20220304163430.GA12317@lst.de>
References: <20220301105311.885699-1-hch@lst.de> <20220301105311.885699-12-hch@lst.de> <alpine.DEB.2.22.394.2203011720150.3261@ubuntu-linux-20-04-desktop> <20220302081500.GB23075@lst.de> <alpine.DEB.2.22.394.2203021709470.3261@ubuntu-linux-20-04-desktop> <20220303105931.GA15137@lst.de> <alpine.DEB.2.22.394.2203031447120.3261@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2203031447120.3261@ubuntu-linux-20-04-desktop>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Mar 03, 2022 at 02:49:29PM -0800, Stefano Stabellini wrote:
> On Thu, 3 Mar 2022, Christoph Hellwig wrote:
> > On Wed, Mar 02, 2022 at 05:25:10PM -0800, Stefano Stabellini wrote:
> > > Thinking more about it we actually need to drop the xen_initial_domain()
> > > check otherwise some cases won't be functional (Dom0 not 1:1 mapped, or
> > > DomU 1:1 mapped).
> > 
> > Hmm, but that would be the case even before this series, right?
> 
> Before this series we only have the xen_swiotlb_detect() check in
> xen_mm_init, we don't have a second xen_initial_domain() check.
> 
> The issue is that this series is adding one more xen_initial_domain()
> check in xen_mm_init.

In current mainline xen_mm_init calls xen_swiotlb_init unconditionally.
But xen_swiotlb_init then calls xen_swiotlb_fixup after allocating
the memory, which in turn calls xen_create_contiguous_region.
xen_create_contiguous_region fails with -EINVAL for the
!xen_initial_domain() and thus caues xen_swiotlb_fixup and
xen_swiotlb_init to unwind and return -EINVAL.

So as far as I can tell there is no change in behavior, but maybe I'm
missing something subtle?

