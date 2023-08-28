Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F6778B302
	for <lists+xen-devel@lfdr.de>; Mon, 28 Aug 2023 16:24:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591542.923934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qad98-0001a8-OH; Mon, 28 Aug 2023 14:23:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591542.923934; Mon, 28 Aug 2023 14:23:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qad98-0001YC-Kc; Mon, 28 Aug 2023 14:23:14 +0000
Received: by outflank-mailman (input) for mailman id 591542;
 Mon, 28 Aug 2023 14:23:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MuY7=EN=bombadil.srs.infradead.org=BATV+b83d16e5cd0c301f07e4+7309+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1qad96-0001Y6-Iv
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 14:23:13 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68e7df0a-45ae-11ee-9b0c-b553b5be7939;
 Mon, 28 Aug 2023 16:23:10 +0200 (CEST)
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qad8H-009hsP-1H; Mon, 28 Aug 2023 14:22:21 +0000
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
X-Inumbo-ID: 68e7df0a-45ae-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9E44iiUNdZH1ZPxuMNvAhOTWH2tumtFNFWSYch117Sg=; b=nSz5L3dUuVsvh674z9OKAS8bJp
	zYSu+GQXXg9k+ExZpIBbHRWqabXZwd02n9vS97tlwdx5M9rbbC+J+KEnpZl7StHzVI1lt44f9QJWZ
	RhCLKSbzGCi4P76AWaT4yrVyFudAE8f1mHvZ/9LKJK5CDCAoQ07psSi8X80pfTQ2D+AXZbR9MC8+S
	wR1nAR5ReTWrG92vtaPega/Mum3q/1hkkMbL2GzcSxnC+t33sPMa720/D25kUK/+Hg62OBp9KLF6I
	aTXMdhkDY6yJQndP4Hyxm4zXDD+MmNGYu1+zD8ZvsnvzkuVZZ62wZGz7/VRA0T/x0Dhn8TItnvE/O
	R0TRfFaA==;
Date: Mon, 28 Aug 2023 07:22:21 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jan Kara <jack@suse.cz>
Cc: Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
	linux-block@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
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
	linux-xfs@vger.kernel.org,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Mike Snitzer <snitzer@kernel.org>, Minchan Kim <minchan@kernel.org>,
	ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Song Liu <song@kernel.org>, Sven Schnelle <svens@linux.ibm.com>,
	target-devel@vger.kernel.org, Ted Tso <tytso@mit.edu>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	xen-devel@lists.xenproject.org, Jens Axboe <axboe@kernel.dk>,
	Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH v2 0/29] block: Make blkdev_get_by_*() return handle
Message-ID: <ZOytnQV0CH+vEIrr@infradead.org>
References: <20230810171429.31759-1-jack@suse.cz>
 <20230825015843.GB95084@ZenIV>
 <20230825134756.o3wpq6bogndukn53@quack3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825134756.o3wpq6bogndukn53@quack3>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Fri, Aug 25, 2023 at 03:47:56PM +0200, Jan Kara wrote:
> I can see the appeal of not having to introduce the new bdev_handle type
> and just using struct file which unifies in-kernel and userspace block
> device opens. But I can see downsides too - the last fput() happening from
> task work makes me a bit nervous whether it will not break something
> somewhere with exclusive bdev opens. Getting from struct file to bdev is
> somewhat harder but I guess a helper like F_BDEV() would solve that just
> fine.
> 
> So besides my last fput() worry about I think this could work and would be
> probably a bit nicer than what I have. But before going and redoing the whole
> series let me gather some more feedback so that we don't go back and forth.
> Christoph, Christian, Jens, any opinion?

I did think about the file a bit.  The fact that we'd need something
like an anon_file for the by_dev open was always a huge turn off for
me, but maybe my concern is overblown.  Having a struct file would
actually be really useful for a bunch of users.


