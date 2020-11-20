Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A6C2BAF70
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 17:00:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.32489.63512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg8ph-0006Kz-BN; Fri, 20 Nov 2020 16:00:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32489.63512; Fri, 20 Nov 2020 16:00:21 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg8ph-0006Kd-8J; Fri, 20 Nov 2020 16:00:21 +0000
Received: by outflank-mailman (input) for mailman id 32489;
 Fri, 20 Nov 2020 16:00:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XFvM=E2=infradead.org=willy@srs-us1.protection.inumbo.net>)
 id 1kg8pe-0006Fd-Ru
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 16:00:20 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c5f657c-938a-475d-a25f-05b23056ced8;
 Fri, 20 Nov 2020 16:00:15 +0000 (UTC)
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kg8pI-0005Bl-Jz; Fri, 20 Nov 2020 15:59:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=XFvM=E2=infradead.org=willy@srs-us1.protection.inumbo.net>)
	id 1kg8pe-0006Fd-Ru
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 16:00:20 +0000
X-Inumbo-ID: 2c5f657c-938a-475d-a25f-05b23056ced8
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 2c5f657c-938a-475d-a25f-05b23056ced8;
	Fri, 20 Nov 2020 16:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=K5DwT3XZlV3t3RqqSgbM35Y3HrzhNkm8y+Dk2IlqgSg=; b=dKbyJHe0CTU5aQ7qzS3y+R7HzS
	IKnP9HvhkePlkizqwksisFX9ItaAwMtV42JJBmP3ZX68rybYyhhyxN6HF+4s2kqLrzwOxCN590LXF
	ym0WaBVLMdq9rLFtADBHBTFGjcyPZEqJfC7pbYTLnera5pnBeS3gKB7QoEHsSi8lIOiJp2cbk5Dht
	3B0uQlIfZ8f/1YczBdK4QRRNeBKzTo4B1VHMay+VPY7OTUi8keSXIo2ShWdFB8ho8zwbUkIe8+1eP
	wuIgrB00p1rgPw8SIw6y1czXZtN+QrCR9MWZkdKvvhRmCPfud3TmejnBZGx0dJq2Oq4i98pjwEUY2
	dBwSlL3g==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg8pI-0005Bl-Jz; Fri, 20 Nov 2020 15:59:56 +0000
Date: Fri, 20 Nov 2020 15:59:56 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Jan Kara <jack@suse.cz>, Jens Axboe <axboe@kernel.dk>,
	Tejun Heo <tj@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Coly Li <colyli@suse.de>, Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com, Richard Weinberger <richard@nod.at>,
	Jan Kara <jack@suse.com>, linux-block@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 14/20] block: remove the nr_sects field in struct
 hd_struct
Message-ID: <20201120155956.GB4327@casper.infradead.org>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-15-hch@lst.de>
 <20201119120525.GW1981@quack2.suse.cz>
 <20201120090820.GD21715@lst.de>
 <20201120112121.GB15537@quack2.suse.cz>
 <20201120153253.GA18990@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201120153253.GA18990@lst.de>

On Fri, Nov 20, 2020 at 04:32:53PM +0100, Christoph Hellwig wrote:
> On Fri, Nov 20, 2020 at 12:21:21PM +0100, Jan Kara wrote:
> > > > AFAICT bd_size_lock is pointless after these changes so we can just remove
> > > > it?
> > > 
> > > I don't think it is, as reuqiring bd_mutex for size updates leads to
> > > rather awkward lock ordering problems.
> > 
> > OK, let me ask differently: What is bd_size_lock protecting now? Ah, I see,
> > on 32-bit it is needed to prevent torn writes to i_size, right?
> 
> Exactly.  In theory we could skip it for 64-bit, but as updating the
> size isn't a fast path, and struct block_device isn't super size critical
> I'd rather keep the same code for 32 vs 64-bit builds.

Is it better to switch to i_size_write() / i_size_read()?

