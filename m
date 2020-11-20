Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 069352BAEDD
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 16:33:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.32387.63401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg8PE-0001Jr-7G; Fri, 20 Nov 2020 15:33:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32387.63401; Fri, 20 Nov 2020 15:33:00 +0000
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
	id 1kg8PE-0001JS-42; Fri, 20 Nov 2020 15:33:00 +0000
Received: by outflank-mailman (input) for mailman id 32387;
 Fri, 20 Nov 2020 15:32:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tRH+=E2=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1kg8PD-0001JN-0K
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 15:32:59 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 209cd0d0-1788-45b3-a500-a7bd4ee488a5;
 Fri, 20 Nov 2020 15:32:56 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id ED47B67373; Fri, 20 Nov 2020 16:32:53 +0100 (CET)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=tRH+=E2=lst.de=hch@srs-us1.protection.inumbo.net>)
	id 1kg8PD-0001JN-0K
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 15:32:59 +0000
X-Inumbo-ID: 209cd0d0-1788-45b3-a500-a7bd4ee488a5
Received: from verein.lst.de (unknown [213.95.11.211])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 209cd0d0-1788-45b3-a500-a7bd4ee488a5;
	Fri, 20 Nov 2020 15:32:56 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id ED47B67373; Fri, 20 Nov 2020 16:32:53 +0100 (CET)
Date: Fri, 20 Nov 2020 16:32:53 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
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
Message-ID: <20201120153253.GA18990@lst.de>
References: <20201118084800.2339180-1-hch@lst.de> <20201118084800.2339180-15-hch@lst.de> <20201119120525.GW1981@quack2.suse.cz> <20201120090820.GD21715@lst.de> <20201120112121.GB15537@quack2.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201120112121.GB15537@quack2.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Nov 20, 2020 at 12:21:21PM +0100, Jan Kara wrote:
> > > AFAICT bd_size_lock is pointless after these changes so we can just remove
> > > it?
> > 
> > I don't think it is, as reuqiring bd_mutex for size updates leads to
> > rather awkward lock ordering problems.
> 
> OK, let me ask differently: What is bd_size_lock protecting now? Ah, I see,
> on 32-bit it is needed to prevent torn writes to i_size, right?

Exactly.  In theory we could skip it for 64-bit, but as updating the
size isn't a fast path, and struct block_device isn't super size critical
I'd rather keep the same code for 32 vs 64-bit builds.

