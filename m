Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7213276946B
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 13:15:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572917.897041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQQqv-0001SR-G7; Mon, 31 Jul 2023 11:14:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572917.897041; Mon, 31 Jul 2023 11:14:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQQqv-0001Py-Ce; Mon, 31 Jul 2023 11:14:17 +0000
Received: by outflank-mailman (input) for mailman id 572917;
 Mon, 31 Jul 2023 11:14:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mhrd=DR=bombadil.srs.infradead.org=BATV+ff51347a1c0b75c11ce8+7281+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1qQQqt-0001Ps-Ch
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 11:14:16 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60f42010-2f93-11ee-b255-6b7b168915f2;
 Mon, 31 Jul 2023 13:14:13 +0200 (CEST)
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qQQpx-00FIz8-1F; Mon, 31 Jul 2023 11:13:17 +0000
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
X-Inumbo-ID: 60f42010-2f93-11ee-b255-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0eXexdRtzvf9o3AbbzOynMU9Oogrhvp6ybx0nEPZW1E=; b=vK1v9C4DYLEBKbiWf/PpEfbUOr
	ea0tKbtUfw+UjBx/HoPf26wPnlNR3k7A4MsVaVkdar3OIBATfQ3zHFcbH8P9ZuG4qU9LC9N5j1WXI
	1jFOwZPN5LFjM5C6XYSxyg6PIhoZ/4h6jEiKtDOt40sVd4EspDmE/0Bc3dDQT8tEqCoRhRKLz9maX
	raBlJVeHQO4UUZTV20wa+PJqkvDnQQ8hd7GU+O68QfUa/DM2K0gl+HVXCe6+FZ5xjes5Du5sz8UQy
	x/J/fQpupjKK/pfw7RVGPayWpw0xq+T79S7uS7ZMWJxaSbk7Su09Zyo3FaLXxQsJmvK1X6hzoRb5N
	/XYneCLA==;
Date: Mon, 31 Jul 2023 04:13:17 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jan Kara <jack@suse.cz>
Cc: Haris Iqbal <haris.iqbal@ionos.com>,
	Christoph Hellwig <hch@infradead.org>, linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	Alasdair Kergon <agk@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anna Schumaker <anna@kernel.org>, Chao Yu <chao@kernel.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Dave Kleikamp <shaggy@kernel.org>, David Sterba <dsterba@suse.com>,
	dm-devel@redhat.com, drbd-dev@lists.linbit.com,
	Gao Xiang <xiang@kernel.org>, Jack Wang <jinpu.wang@ionos.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	jfs-discussion@lists.sourceforge.net,
	Joern Engel <joern@lazybastard.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Kent Overstreet <kent.overstreet@gmail.com>,
	linux-bcache@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org,
	linux-mtd@lists.infradead.org, linux-nfs@vger.kernel.org,
	linux-nilfs@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-raid@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-xfs@vger.kernel.org, Mike Snitzer <snitzer@kernel.org>,
	Minchan Kim <minchan@kernel.org>, ocfs2-devel@oss.oracle.com,
	reiserfs-devel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Song Liu <song@kernel.org>, Sven Schnelle <svens@linux.ibm.com>,
	target-devel@vger.kernel.org, Ted Tso <tytso@mit.edu>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 01/32] block: Provide blkdev_get_handle_* functions
Message-ID: <ZMeXTUUyrOnaxGNG@infradead.org>
References: <20230629165206.383-1-jack@suse.cz>
 <20230704122224.16257-1-jack@suse.cz>
 <ZKbgAG5OoHVyUKOG@infradead.org>
 <CAJpMwyiUcw+mH0sZa8f8UJsaSZ7NSE65s2gZDEia+pASyP_gJQ@mail.gmail.com>
 <20230731105034.43skhi5ubze563c3@quack3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230731105034.43skhi5ubze563c3@quack3>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Mon, Jul 31, 2023 at 12:50:34PM +0200, Jan Kara wrote:
> I think the bdev_handle name is fine for the struct. After all it is
> equivalent of an open handle for the block device so IMHO bdev_handle
> captures that better than bdev_ctx.

Agreed.

