Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 100A4785600
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 12:49:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589147.920922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYlQA-0004yo-OD; Wed, 23 Aug 2023 10:49:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589147.920922; Wed, 23 Aug 2023 10:49:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYlQA-0004w5-LP; Wed, 23 Aug 2023 10:49:06 +0000
Received: by outflank-mailman (input) for mailman id 589147;
 Wed, 23 Aug 2023 10:49:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lx4x=EI=suse.cz=jack@srs-se1.protection.inumbo.net>)
 id 1qYlQ8-0004h7-E8
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 10:49:04 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9ea6c99-41a2-11ee-9b0c-b553b5be7939;
 Wed, 23 Aug 2023 12:48:59 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1F89B21EDA;
 Wed, 23 Aug 2023 10:48:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0486813592;
 Wed, 23 Aug 2023 10:48:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hdjcABrk5WQsIAAAMHmgww
 (envelope-from <jack@suse.cz>); Wed, 23 Aug 2023 10:48:58 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 0E216A0774; Wed, 23 Aug 2023 12:48:57 +0200 (CEST)
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
X-Inumbo-ID: a9ea6c99-41a2-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1692787738; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=czbolVCNdiRIhtzRMydBVuDGtNoMVf0uK7rI8VUw4Wg=;
	b=cea+STFByaV36NWMjg8zifEKP9bUJaVFrhrdsQ1BHrDjc+6YKTyOk0XUYe/aGcn7z1GdBW
	Sp5Xg8/PcrR30C9G8GkmtNgleVHgoFT9VpO4HmYAD81nOJQ/2ts6Z2GJ97FCPouubZqTfM
	7Ki5cRwEgj/8O3iByHVAhCDVhrdgZS0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1692787738;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=czbolVCNdiRIhtzRMydBVuDGtNoMVf0uK7rI8VUw4Wg=;
	b=ccloVX/Tox8MPvEstSnU1swyihs7KV2puBqol0j3M4wpbT7Z67JF74RuKmYp8i9zsSQ2aK
	Q/J06H24OiSZjOBw==
From: Jan Kara <jack@suse.cz>
To: Christian Brauner <brauner@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>,
	<linux-fsdevel@vger.kernel.org>,
	<linux-block@vger.kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	Jan Kara <jack@suse.cz>,
	Alasdair Kergon <agk@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anna Schumaker <anna@kernel.org>,
	Chao Yu <chao@kernel.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Dave Kleikamp <shaggy@kernel.org>,
	David Sterba <dsterba@suse.com>,
	dm-devel@redhat.com,
	drbd-dev@lists.linbit.com,
	Gao Xiang <xiang@kernel.org>,
	Jack Wang <jinpu.wang@ionos.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	jfs-discussion@lists.sourceforge.net,
	Joern Engel <joern@lazybastard.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Kent Overstreet <kent.overstreet@gmail.com>,
	linux-bcache@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-erofs@lists.ozlabs.org,
	linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-mm@kvack.org,
	linux-mtd@lists.infradead.org,
	linux-nfs@vger.kernel.org,
	linux-nilfs@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-raid@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Minchan Kim <minchan@kernel.org>,
	ocfs2-devel@oss.oracle.com,
	reiserfs-devel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Song Liu <song@kernel.org>,
	Sven Schnelle <svens@linux.ibm.com>,
	target-devel@vger.kernel.org,
	Ted Tso <tytso@mit.edu>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v3 0/29] block: Make blkdev_get_by_*() return handle
Date: Wed, 23 Aug 2023 12:48:11 +0200
Message-Id: <20230818123232.2269-1-jack@suse.cz>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3781; i=jack@suse.cz; h=from:subject:message-id; bh=cMBb8bZk7tVGWo+BW5D78pH+ebOvNFFLsxdd3Uvzd/w=; b=owEBbQGS/pANAwAIAZydqgc/ZEDZAcsmYgBk5ePhrEMij+4xGF6e8K//xuADex0OXIFxlpO0VT6g 42vu5BeJATMEAAEIAB0WIQSrWdEr1p4yirVVKBycnaoHP2RA2QUCZOXj4QAKCRCcnaoHP2RA2RqoB/ 91nt6Qs4NSStbt9M1WXY1akBbAqu+Bv3ZXdZ6WMy9kKyYwY7zCnyQziikP60M2MjCrud4NP9os4YAr 4uXdyOyVcdJ9TjbciDgTyoYdfkFl7g+rZhj1pyPeep1xmvDMn3QtNJ28EbhLegdC+nkmL6+bxPGEwd IdsuBKGrdIIEryWwhBq0+BWowL3nzmQjs5GoDtXLoHADfHYhgC8RKYK/4FaML1/SsAZRvGJ/C8wFB4 JUGsDGFE4CJx9XgiRx407CSIGNSoCciqBpMaMA7x/dbq9Tu76xcqN4/DZrtT2qyG4I7GZYetndEl3F vWMZMQFPauZmB2S1r30HY+nn2IOCrM
X-Developer-Key: i=jack@suse.cz; a=openpgp; fpr=93C6099A142276A28BBE35D815BC833443038D8C
Content-Transfer-Encoding: 8bit

Hello,

this is a v3 of the patch series which implements the idea of blkdev_get_by_*()
calls returning bdev_handle which is then passed to blkdev_put() [1]. This
makes the get and put calls for bdevs more obviously matching and allows us to
propagate context from get to put without having to modify all the users
(again!). In particular I need to propagate used open flags to blkdev_put() to
be able count writeable opens and add support for blocking writes to mounted
block devices. I'll send that series separately.

The series is based on Christian's vfs tree as of today as there is quite
some overlap. Patches have passed some reasonable testing - I've tested block
changes, md, dm, bcache, xfs, btrfs, ext4, swap. More testing or review is
always welcome. Thanks! I've pushed out the full branch to:

git://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git bdev_handle

to ease review / testing. Since there were not many comments for v2 and
Christoph has acked the series I think we should start discussing how to merge
the series. Most collisions with this series seem to happen in the filesystems
area so VFS tree would seem as the least painful way to merge this. Jens,
are you OK with that?

Changes since v2:
* Rebased on top of current vfs tree
* Added some acks
* Reflected minor nits from Christoph
* Added missing conversion of blkdev_put() calls in cramfs and erofs
* Fixed possible leak of bdev handle in xfs if logdev is the same as fs dev

Changes since v1:
* Rebased on top of current vfs tree
* Renamed final functions to bdev_open_by_*() and bdev_release()
* Fixed detection of exclusive open in blkdev_ioctl() and blkdev_fallocate()
* Fixed swap conversion to properly reinitialize swap_info->bdev_handle
* Fixed xfs conversion to not oops with rtdev without logdev
* Couple other minor fixups

								Honza

[1] https://lore.kernel.org/all/ZJGNsVDhZx0Xgs2H@infradead.org

CC: Alasdair Kergon <agk@redhat.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Anna Schumaker <anna@kernel.org>
CC: Chao Yu <chao@kernel.org>
CC: Christian Borntraeger <borntraeger@linux.ibm.com>
CC: Coly Li <colyli@suse.de
CC: "Darrick J. Wong" <djwong@kernel.org>
CC: Dave Kleikamp <shaggy@kernel.org>
CC: David Sterba <dsterba@suse.com>
CC: dm-devel@redhat.com
CC: drbd-dev@lists.linbit.com
CC: Gao Xiang <xiang@kernel.org>
CC: Jack Wang <jinpu.wang@ionos.com>
CC: Jaegeuk Kim <jaegeuk@kernel.org>
CC: jfs-discussion@lists.sourceforge.net
CC: Joern Engel <joern@lazybastard.org>
CC: Joseph Qi <joseph.qi@linux.alibaba.com>
CC: Kent Overstreet <kent.overstreet@gmail.com>
CC: linux-bcache@vger.kernel.org
CC: linux-btrfs@vger.kernel.org
CC: linux-erofs@lists.ozlabs.org
CC: <linux-ext4@vger.kernel.org>
CC: linux-f2fs-devel@lists.sourceforge.net
CC: linux-mm@kvack.org
CC: linux-mtd@lists.infradead.org
CC: linux-nfs@vger.kernel.org
CC: linux-nilfs@vger.kernel.org
CC: linux-nvme@lists.infradead.org
CC: linux-pm@vger.kernel.org
CC: linux-raid@vger.kernel.org
CC: linux-s390@vger.kernel.org
CC: linux-scsi@vger.kernel.org
CC: linux-xfs@vger.kernel.org
CC: "Md. Haris Iqbal" <haris.iqbal@ionos.com>
CC: Mike Snitzer <snitzer@kernel.org>
CC: Minchan Kim <minchan@kernel.org>
CC: ocfs2-devel@oss.oracle.com
CC: reiserfs-devel@vger.kernel.org
CC: Sergey Senozhatsky <senozhatsky@chromium.org>
CC: Song Liu <song@kernel.org>
CC: Sven Schnelle <svens@linux.ibm.com>
CC: target-devel@vger.kernel.org
CC: Ted Tso <tytso@mit.edu>
CC: Trond Myklebust <trond.myklebust@hammerspace.com>
CC: xen-devel@lists.xenproject.org

Previous versions:
Link: http://lore.kernel.org/r/20230629165206.383-1-jack@suse.cz # v1
Link: http://lore.kernel.org/r/20230810171429.31759-1-jack@suse.cz # v2

