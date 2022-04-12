Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CC94FCF6B
	for <lists+xen-devel@lfdr.de>; Tue, 12 Apr 2022 08:22:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303442.517703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ne9u4-0001QC-UX; Tue, 12 Apr 2022 06:21:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303442.517703; Tue, 12 Apr 2022 06:21:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ne9u4-0001N8-QU; Tue, 12 Apr 2022 06:21:28 +0000
Received: by outflank-mailman (input) for mailman id 303442;
 Tue, 12 Apr 2022 06:21:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KbYP=UW=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1ne9u2-0001N0-VR
 for xen-devel@lists.xenproject.org; Tue, 12 Apr 2022 06:21:26 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c69e12f9-ba28-11ec-8fbc-03012f2f19d4;
 Tue, 12 Apr 2022 08:21:24 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id CD9FC68AA6; Tue, 12 Apr 2022 08:21:20 +0200 (CEST)
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
X-Inumbo-ID: c69e12f9-ba28-11ec-8fbc-03012f2f19d4
Date: Tue, 12 Apr 2022 08:21:20 +0200
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org,
	x86@kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
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
Subject: Re: [PATCH 10/15] swiotlb: add a SWIOTLB_ANY flag to lift the low
 memory restriction
Message-ID: <20220412062120.GA7796@lst.de>
References: <20220404050559.132378-1-hch@lst.de> <20220404050559.132378-11-hch@lst.de> <Yk4vfAd0J5u+wUsq@char.us.oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yk4vfAd0J5u+wUsq@char.us.oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Apr 06, 2022 at 08:25:32PM -0400, Konrad Rzeszutek Wilk wrote:
> > diff --git a/arch/powerpc/platforms/pseries/svm.c b/arch/powerpc/platforms/pseries/svm.c
> > index c5228f4969eb2..3b4045d508ec8 100644
> > --- a/arch/powerpc/platforms/pseries/svm.c
> > +++ b/arch/powerpc/platforms/pseries/svm.c
> > @@ -28,7 +28,7 @@ static int __init init_svm(void)
> >  	 * need to use the SWIOTLB buffer for DMA even if dma_capable() says
> >  	 * otherwise.
> >  	 */
> > -	swiotlb_force = SWIOTLB_FORCE;
> > +	ppc_swiotlb_flags |= SWIOTLB_ANY | SWIOTLB_FORCE;
> 
> This is the only place you set the ppc_swiotlb_flags.. so I wonder why
> the '|=' instead of just '=' ?

Preparing for setting others and not clobbering the value.

