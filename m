Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CDE789374
	for <lists+xen-devel@lfdr.de>; Sat, 26 Aug 2023 04:31:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591055.923448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZj3d-0003ot-HM; Sat, 26 Aug 2023 02:29:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591055.923448; Sat, 26 Aug 2023 02:29:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZj3d-0003nG-Cb; Sat, 26 Aug 2023 02:29:49 +0000
Received: by outflank-mailman (input) for mailman id 591055;
 Sat, 26 Aug 2023 02:29:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6rpc=EL=ftp.linux.org.uk=viro@srs-se1.protection.inumbo.net>)
 id 1qZj3a-0003nA-Vp
 for xen-devel@lists.xenproject.org; Sat, 26 Aug 2023 02:29:47 +0000
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk
 [2a03:a000:7:0:5054:ff:fe1c:15ff])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a6a8101-43b8-11ee-8783-cb3800f73035;
 Sat, 26 Aug 2023 04:29:44 +0200 (CEST)
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qZj2i-0010QB-1S; Sat, 26 Aug 2023 02:28:52 +0000
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
X-Inumbo-ID: 6a6a8101-43b8-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=kRz17k12DLtH5ptlx3fiiancvtShyoQwDvuAAOUED4Y=; b=mPm/qZCa7MWW4zdrpIjhXYeIS6
	8cbIgOvCf/9Y6gIxhhuc7MbOClbX1o3H4gTlXLJmOpOyil1pufLmdD8oxm6VhlxB4x6C/OQmKz1OC
	9Sg7eN60e8HGn0pn/DtWEZ2zi7uHlJyyQNolWeGdXQEgqn78/62UYsbUB8gsUgOw68YkPTd36+fo0
	kPzizyM3mKJ55bukbV99w6F1Yx4exn0ELF0EHA2mn4TEClpd2hjjcTiwEbEGv+vsWkEq4IC7ejHjR
	rO8uE9/3ipL5VpLJjGdd7WJssIdQ5Tj/z+j2E3fQDWI0Qb9TMLDhfRhfBXk5sw2QK4rJI42xn3tDe
	SBJa1VHw==;
Date: Sat, 26 Aug 2023 03:28:52 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Jan Kara <jack@suse.cz>
Cc: linux-fsdevel@vger.kernel.org, linux-block@vger.kernel.org,
	Christoph Hellwig <hch@infradead.org>,
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
Message-ID: <20230826022852.GO3390869@ZenIV>
References: <20230810171429.31759-1-jack@suse.cz>
 <20230825015843.GB95084@ZenIV>
 <20230825134756.o3wpq6bogndukn53@quack3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825134756.o3wpq6bogndukn53@quack3>
Sender: Al Viro <viro@ftp.linux.org.uk>

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

Redoing is not an issue - it can be done on top of your series just
as well.  Async behaviour of fput() might be, but...  need to look
through the actual users; for a lot of them it's perfectly fine.

FWIW, from a cursory look there appears to be a missing primitive: take
an opened bdev (or bdev_handle, with your variant, or opened file if we
go that way eventually) and claim it.

I mean, look at claim_swapfile() for example:
                p->bdev = blkdev_get_by_dev(inode->i_rdev,
                                   FMODE_READ | FMODE_WRITE | FMODE_EXCL, p);
                if (IS_ERR(p->bdev)) {
                        error = PTR_ERR(p->bdev);
                        p->bdev = NULL;
                        return error;
                }
                p->old_block_size = block_size(p->bdev);
                error = set_blocksize(p->bdev, PAGE_SIZE);
                if (error < 0)
                        return error;
we already have the file opened, and we keep it opened all the way until
the swapoff(2); here we have noticed that it's a block device and we
	* open the fucker again (by device number), this time claiming
it with our swap_info_struct as holder, to be closed at swapoff(2) time
(just before we close the file)
	* flip the block size to PAGE_SIZE, to be reverted at swapoff(2)
time That really looks like it ought to be
	* take the opened file, see that it's a block device
	* try to claim it with that holder
	* on success, flip the block size
with close_filp() in the swapoff(2) (or failure exit path in swapon(2))
doing what it would've done for an O_EXCL opened block device.
The only difference from O_EXCL userland open is that here we would
end up with holder pointing not to struct file in question, but to our
swap_info_struct.  It will do the right thing.

This extra open is entirely due to "well, we need to claim it and the
primitive that does that happens to be tied to opening"; feels rather
counter-intuitive.

For that matter, we could add an explicit "unclaim" primitive - might
be easier to follow.  That would add another example where that could
be used - in blkdev_bszset() we have an opened block device (it's an
ioctl, after all), we want to change block size and we *really* don't
want to have that happen under a mounted filesystem.  So if it's not
opened exclusive, we do a temporary exclusive open of own and act on
that instead.   Might as well go for a temporary claim...

BTW, what happens if two threads call ioctl(fd, BLKBSZSET, &n)
for the same descriptor that happens to have been opened O_EXCL?
Without O_EXCL they would've been unable to claim the sucker at the same
time - the holder we are using is the address of a function argument,
i.e. something that points to kernel stack of the caller.  Those would
conflict and we either get set_blocksize() calls fully serialized, or
one of the callers would eat -EBUSY.  Not so in "opened with O_EXCL"
case - they can very well overlap and IIRC set_blocksize() does *not*
expect that kind of crap...  It's all under CAP_SYS_ADMIN, so it's not
as if it was a meaningful security hole anyway, but it does look fishy.

