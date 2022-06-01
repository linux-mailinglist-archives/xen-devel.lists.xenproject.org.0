Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC7C53AC53
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 19:58:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340697.565791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwSbV-0005pd-H7; Wed, 01 Jun 2022 17:57:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340697.565791; Wed, 01 Jun 2022 17:57:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwSbV-0005nO-Dv; Wed, 01 Jun 2022 17:57:57 +0000
Received: by outflank-mailman (input) for mailman id 340697;
 Wed, 01 Jun 2022 17:57:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NYJT=WI=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1nwSbT-0005nF-II
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 17:57:55 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c2640f2-e1d4-11ec-bd2c-47488cf2e6aa;
 Wed, 01 Jun 2022 19:57:54 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id D34A568C4E; Wed,  1 Jun 2022 19:57:44 +0200 (CEST)
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
X-Inumbo-ID: 5c2640f2-e1d4-11ec-bd2c-47488cf2e6aa
Date: Wed, 1 Jun 2022 19:57:43 +0200
From: Christoph Hellwig <hch@lst.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org,
	x86@kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
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
Subject: Re: [PATCH 09/15] swiotlb: make the swiotlb_init interface more
 useful
Message-ID: <20220601175743.GA28082@lst.de>
References: <20220404050559.132378-1-hch@lst.de> <20220404050559.132378-10-hch@lst.de> <YpehC7BwBlnuxplF@dev-arch.thelio-3990X> <20220601173441.GB27582@lst.de> <YpemDuzdoaO3rijX@Ryzen-9-3900X.>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YpemDuzdoaO3rijX@Ryzen-9-3900X.>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Jun 01, 2022 at 10:46:54AM -0700, Nathan Chancellor wrote:
> On Wed, Jun 01, 2022 at 07:34:41PM +0200, Christoph Hellwig wrote:
> > Can you send me the full dmesg and the content of
> > /sys/kernel/debug/swiotlb/io_tlb_nslabs for a good and a bad boot?
> 
> Sure thing, they are attached! If there is anything else I can provide
> or test, I am more than happy to do so.

Nothing interesting.  But the performance numbers almost look like
swiotlb=force got ignored before (even if I can't explain why).
Do you get a similar performance with the new kernel without
swiotlb=force as the old one with that argument by any chance?


