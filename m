Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 614C62BC084
	for <lists+xen-devel@lfdr.de>; Sat, 21 Nov 2020 17:24:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.32981.64064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kgVgP-0006px-En; Sat, 21 Nov 2020 16:24:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32981.64064; Sat, 21 Nov 2020 16:24:17 +0000
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
	id 1kgVgP-0006pY-BT; Sat, 21 Nov 2020 16:24:17 +0000
Received: by outflank-mailman (input) for mailman id 32981;
 Sat, 21 Nov 2020 16:24:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ondl=E3=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1kgVgN-0006pT-Qb
 for xen-devel@lists.xenproject.org; Sat, 21 Nov 2020 16:24:15 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 828d2389-1b39-4ece-a8a3-db04261d0f36;
 Sat, 21 Nov 2020 16:24:14 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 951F467373; Sat, 21 Nov 2020 17:24:11 +0100 (CET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ondl=E3=lst.de=hch@srs-us1.protection.inumbo.net>)
	id 1kgVgN-0006pT-Qb
	for xen-devel@lists.xenproject.org; Sat, 21 Nov 2020 16:24:15 +0000
X-Inumbo-ID: 828d2389-1b39-4ece-a8a3-db04261d0f36
Received: from verein.lst.de (unknown [213.95.11.211])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 828d2389-1b39-4ece-a8a3-db04261d0f36;
	Sat, 21 Nov 2020 16:24:14 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 951F467373; Sat, 21 Nov 2020 17:24:11 +0100 (CET)
Date: Sat, 21 Nov 2020 17:24:11 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Cc: Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@lst.de>,
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
Message-ID: <20201121162411.GA18475@lst.de>
References: <20201118084800.2339180-1-hch@lst.de> <20201118084800.2339180-15-hch@lst.de> <20201119120525.GW1981@quack2.suse.cz> <20201120090820.GD21715@lst.de> <20201120112121.GB15537@quack2.suse.cz> <20201120153253.GA18990@lst.de> <20201120155956.GB4327@casper.infradead.org> <20201120200548.GA27360@quack2.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201120200548.GA27360@quack2.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Nov 20, 2020 at 09:05:48PM +0100, Jan Kara wrote:
> The code is already switched to it AFAICT (the lock is really only used in
> the two places that write i_size). But the problem is that in theory two
> i_size_write() calls can race in a way that the resulting stored i_size is a
> mix of two stored sizes. Now I have hard time imagining how this could
> happen for a block device and if two reconfigurations of a block device
> could race like that we'd have a large problems anyway...

Now that you mention it, yes - i_size_write needs to be under i_rwsem
or an equivalent lock.  We could look into using i_rwsem also for block
device, but for now the spinlock seems to be doing fine.  Note that
in current mainline we only have such a lock protecting i_size of the
block_device inode, but none for the size in hd_struct.

