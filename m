Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A013CB29D
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jul 2021 08:31:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156994.289725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4HNm-0005hA-Vj; Fri, 16 Jul 2021 06:31:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156994.289725; Fri, 16 Jul 2021 06:31:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4HNm-0005ef-ST; Fri, 16 Jul 2021 06:31:34 +0000
Received: by outflank-mailman (input) for mailman id 156994;
 Fri, 16 Jul 2021 06:31:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=acOe=MI=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1m4HNl-0005eT-2T
 for xen-devel@lists.xenproject.org; Fri, 16 Jul 2021 06:31:33 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 74d2996a-e5ff-11eb-894d-12813bfff9fa;
 Fri, 16 Jul 2021 06:31:30 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 3C31267373; Fri, 16 Jul 2021 08:31:28 +0200 (CEST)
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
X-Inumbo-ID: 74d2996a-e5ff-11eb-894d-12813bfff9fa
Date: Fri, 16 Jul 2021 08:31:27 +0200
From: Christoph Hellwig <hch@lst.de>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	iommu@lists.linux-foundation.org, linux-parisc@vger.kernel.org,
	xen-devel@lists.xenproject.org, Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Stephen Bates <sbates@raithlin.com>,
	Martin Oliveira <martin.oliveira@eideticom.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v1 04/16] dma-iommu: Return error code from
 iommu_dma_map_sg()
Message-ID: <20210716063127.GB13345@lst.de>
References: <20210715164544.6827-1-logang@deltatee.com> <20210715164544.6827-5-logang@deltatee.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210715164544.6827-5-logang@deltatee.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Careful here. What do all these errors from the low-level code mean
here?  I think we need to clearly standardize on what we actually
return from ->map_sg and possibly document what the callers expect and
can do, and enforce that only those error are reported.

