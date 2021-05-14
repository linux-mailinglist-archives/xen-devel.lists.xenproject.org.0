Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F11EB380735
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 12:30:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127326.239285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhV4y-00008k-Pj; Fri, 14 May 2021 10:30:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127326.239285; Fri, 14 May 2021 10:30:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhV4y-00006j-Mc; Fri, 14 May 2021 10:30:00 +0000
Received: by outflank-mailman (input) for mailman id 127326;
 Fri, 14 May 2021 10:29:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bqrj=KJ=kernel.org=cmarinas@srs-us1.protection.inumbo.net>)
 id 1lhV4x-00006d-9s
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 10:29:59 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c42e3c97-8764-40f5-a4ec-2e6367d52c77;
 Fri, 14 May 2021 10:29:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 918BC61396;
 Fri, 14 May 2021 10:29:56 +0000 (UTC)
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
X-Inumbo-ID: c42e3c97-8764-40f5-a4ec-2e6367d52c77
Date: Fri, 14 May 2021 11:29:54 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
	jgross@suse.com, hch@lst.de, will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v2 2/3] arm64: do not set SWIOTLB_NO_FORCE when swiotlb
 is required
Message-ID: <20210514102953.GA855@arm.com>
References: <alpine.DEB.2.21.2105121313060.5018@sstabellini-ThinkPad-T480s>
 <20210512201823.1963-2-sstabellini@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210512201823.1963-2-sstabellini@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, May 12, 2021 at 01:18:22PM -0700, Stefano Stabellini wrote:
> From: Christoph Hellwig <hch@lst.de>
> 
> Although SWIOTLB_NO_FORCE is meant to allow later calls to swiotlb_init,
> today dma_direct_map_page returns error if SWIOTLB_NO_FORCE.
> 
> For now, without a larger overhaul of SWIOTLB_NO_FORCE, the best we can
> do is to avoid setting SWIOTLB_NO_FORCE in mem_init when we know that it
> is going to be required later (e.g. Xen requires it).
> 
> CC: boris.ostrovsky@oracle.com
> CC: jgross@suse.com
> CC: catalin.marinas@arm.com
> CC: will@kernel.org
> CC: linux-arm-kernel@lists.infradead.org
> Fixes: 2726bf3ff252 ("swiotlb: Make SWIOTLB_NO_FORCE perform no allocation")
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

