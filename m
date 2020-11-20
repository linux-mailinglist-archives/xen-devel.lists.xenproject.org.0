Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6512BB63D
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 21:06:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.32645.63747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kgCfI-0000vg-VE; Fri, 20 Nov 2020 20:05:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32645.63747; Fri, 20 Nov 2020 20:05:52 +0000
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
	id 1kgCfI-0000vH-Ry; Fri, 20 Nov 2020 20:05:52 +0000
Received: by outflank-mailman (input) for mailman id 32645;
 Fri, 20 Nov 2020 20:05:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ulUS=E2=suse.cz=jack@srs-us1.protection.inumbo.net>)
 id 1kgCfH-0000vC-JF
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 20:05:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0f869ad6-fd6c-412f-8998-b832ff1c357a;
 Fri, 20 Nov 2020 20:05:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2C646AE1F;
 Fri, 20 Nov 2020 20:05:49 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id C910C1E1319; Fri, 20 Nov 2020 21:05:48 +0100 (CET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ulUS=E2=suse.cz=jack@srs-us1.protection.inumbo.net>)
	id 1kgCfH-0000vC-JF
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 20:05:51 +0000
X-Inumbo-ID: 0f869ad6-fd6c-412f-8998-b832ff1c357a
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0f869ad6-fd6c-412f-8998-b832ff1c357a;
	Fri, 20 Nov 2020 20:05:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 2C646AE1F;
	Fri, 20 Nov 2020 20:05:49 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id C910C1E1319; Fri, 20 Nov 2020 21:05:48 +0100 (CET)
Date: Fri, 20 Nov 2020 21:05:48 +0100
From: Jan Kara <jack@suse.cz>
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
Message-ID: <20201120200548.GA27360@quack2.suse.cz>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-15-hch@lst.de>
 <20201119120525.GW1981@quack2.suse.cz>
 <20201120090820.GD21715@lst.de>
 <20201120112121.GB15537@quack2.suse.cz>
 <20201120153253.GA18990@lst.de>
 <20201120155956.GB4327@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201120155956.GB4327@casper.infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri 20-11-20 15:59:56, Matthew Wilcox wrote:
> On Fri, Nov 20, 2020 at 04:32:53PM +0100, Christoph Hellwig wrote:
> > On Fri, Nov 20, 2020 at 12:21:21PM +0100, Jan Kara wrote:
> > > > > AFAICT bd_size_lock is pointless after these changes so we can just remove
> > > > > it?
> > > > 
> > > > I don't think it is, as reuqiring bd_mutex for size updates leads to
> > > > rather awkward lock ordering problems.
> > > 
> > > OK, let me ask differently: What is bd_size_lock protecting now? Ah, I see,
> > > on 32-bit it is needed to prevent torn writes to i_size, right?
> > 
> > Exactly.  In theory we could skip it for 64-bit, but as updating the
> > size isn't a fast path, and struct block_device isn't super size critical
> > I'd rather keep the same code for 32 vs 64-bit builds.
> 
> Is it better to switch to i_size_write() / i_size_read()?

The code is already switched to it AFAICT (the lock is really only used in
the two places that write i_size). But the problem is that in theory two
i_size_write() calls can race in a way that the resulting stored i_size is a
mix of two stored sizes. Now I have hard time imagining how this could
happen for a block device and if two reconfigurations of a block device
could race like that we'd have a large problems anyway...

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

