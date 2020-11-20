Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 136302BAF73
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 17:01:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.32493.63524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg8r0-0006Rr-MR; Fri, 20 Nov 2020 16:01:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32493.63524; Fri, 20 Nov 2020 16:01:42 +0000
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
	id 1kg8r0-0006RV-JI; Fri, 20 Nov 2020 16:01:42 +0000
Received: by outflank-mailman (input) for mailman id 32493;
 Fri, 20 Nov 2020 16:01:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tRH+=E2=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1kg8qz-0006RQ-D4
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 16:01:41 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cc9f6f15-29c8-47c4-afe5-32f5be2f3bd0;
 Fri, 20 Nov 2020 16:01:40 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 776B867373; Fri, 20 Nov 2020 17:01:37 +0100 (CET)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=tRH+=E2=lst.de=hch@srs-us1.protection.inumbo.net>)
	id 1kg8qz-0006RQ-D4
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 16:01:41 +0000
X-Inumbo-ID: cc9f6f15-29c8-47c4-afe5-32f5be2f3bd0
Received: from verein.lst.de (unknown [213.95.11.211])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id cc9f6f15-29c8-47c4-afe5-32f5be2f3bd0;
	Fri, 20 Nov 2020 16:01:40 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 776B867373; Fri, 20 Nov 2020 17:01:37 +0100 (CET)
Date: Fri, 20 Nov 2020 17:01:37 +0100
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Cc: Christoph Hellwig <hch@lst.de>, Jan Kara <jack@suse.cz>,
	Jens Axboe <axboe@kernel.dk>, Tejun Heo <tj@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Coly Li <colyli@suse.de>, Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com, Richard Weinberger <richard@nod.at>,
	Jan Kara <jack@suse.com>, linux-block@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 14/20] block: remove the nr_sects field in struct
 hd_struct
Message-ID: <20201120160137.GA20984@lst.de>
References: <20201118084800.2339180-1-hch@lst.de> <20201118084800.2339180-15-hch@lst.de> <20201119120525.GW1981@quack2.suse.cz> <20201120090820.GD21715@lst.de> <20201120112121.GB15537@quack2.suse.cz> <20201120153253.GA18990@lst.de> <20201120155956.GB4327@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201120155956.GB4327@casper.infradead.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Nov 20, 2020 at 03:59:56PM +0000, Matthew Wilcox wrote:
> > Exactly.  In theory we could skip it for 64-bit, but as updating the
> > size isn't a fast path, and struct block_device isn't super size critical
> > I'd rather keep the same code for 32 vs 64-bit builds.
> 
> Is it better to switch to i_size_write() / i_size_read()?

I think we've stopped updating the size from contexts that can't block,
so it is worth pursuing. I'd rather do it after this series is done
and merged, though.

