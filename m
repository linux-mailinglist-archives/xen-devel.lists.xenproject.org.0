Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C31403485
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 08:52:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181463.328581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNrRR-0002S1-UN; Wed, 08 Sep 2021 06:52:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181463.328581; Wed, 08 Sep 2021 06:52:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNrRR-0002P9-Qo; Wed, 08 Sep 2021 06:52:17 +0000
Received: by outflank-mailman (input) for mailman id 181463;
 Wed, 08 Sep 2021 06:52:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EHX5=N6=casper.srs.infradead.org=BATV+2e9f3f7219a4df6f1e93+6590+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1mNrRQ-0002P3-Cl
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 06:52:16 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f72cfd4-adc1-47cb-8b8a-010e1f42024e;
 Wed, 08 Sep 2021 06:52:15 +0000 (UTC)
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1mNrPl-008Ztv-5x; Wed, 08 Sep 2021 06:50:43 +0000
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
X-Inumbo-ID: 2f72cfd4-adc1-47cb-8b8a-010e1f42024e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dBfrdwNivWqqlCKmJ0ASZqHL/mKJ+iqsG8FTGZNie28=; b=D6unVWGGt0nhN9vNLt5bPN4XJ6
	H5YeTJ6wPEjXfqN4OQvde23ebXYK4ScG4iV7RuMd/m2BDecE+805+QIOyDDJIjDMyQpo4eYaj4QmT
	F5gpCSBn3mbFzriE/4gNmiFAEKCw8EFJTlqjfosMVn+/7NyuTmPOcaj/pSI3twWgrK3D3gLCgPrMe
	ka5oWI1awXDsLFEZBWksAMt1lCG3nYEk5JDPx/M4rxdsFFQs1qr52K4DUKb7c+e381aB2rZA5g8eZ
	E72vmwrF3bYOH4V0FUjxdhgtQPxBvK92pTAIHZbOja/YjfQKbYEWK4Z0FzwpkGP7d/t2qsuf7If0X
	4CAEntbw==;
Date: Wed, 8 Sep 2021 07:50:33 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 02/12] swiotlb-xen: fix late init retry
Message-ID: <YThdOdg3VoPAl7xI@infradead.org>
References: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com>
 <778299d6-9cfd-1c13-026e-25ee5d14ecb3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <778299d6-9cfd-1c13-026e-25ee5d14ecb3@suse.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

On Tue, Sep 07, 2021 at 02:04:47PM +0200, Jan Beulich wrote:
> The commit referenced below removed the assignment of "bytes" from
> xen_swiotlb_init() without - like done for xen_swiotlb_init_early() -
> adding an assignment on the retry path, thus leading to excessively
> sized allocations upon retries.
> 
> Fixes: 2d29960af0be ("swiotlb: dynamically allocate io_tlb_default_mem")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Cc: stable@vger.kernel.org

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

