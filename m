Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA897B0088
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 11:35:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608775.947485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlQwS-0001gI-RQ; Wed, 27 Sep 2023 09:34:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608775.947485; Wed, 27 Sep 2023 09:34:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlQwS-0001aC-O2; Wed, 27 Sep 2023 09:34:48 +0000
Received: by outflank-mailman (input) for mailman id 608775;
 Wed, 27 Sep 2023 09:34:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yPii=FL=suse.cz=jack@srs-se1.protection.inumbo.net>)
 id 1qlQwR-0001XY-8r
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 09:34:47 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1782fe29-5d19-11ee-9b0d-b553b5be7939;
 Wed, 27 Sep 2023 11:34:44 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 967601FD5E;
 Wed, 27 Sep 2023 09:34:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 779CF13A74;
 Wed, 27 Sep 2023 09:34:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YqW3HDP3E2X+EgAAMHmgww
 (envelope-from <jack@suse.cz>); Wed, 27 Sep 2023 09:34:43 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id DAA33A07C9; Wed, 27 Sep 2023 11:34:42 +0200 (CEST)
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
X-Inumbo-ID: 1782fe29-5d19-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1695807283; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8yq/EWr5xgyIq2expGTOm/a8E50tdoL6jyUvlCURtkA=;
	b=AFBlD5DhZEt1NESHiYyz8SkegLzofp7eJ1WULrYqvNawr6FwYRs8YvfnxMMuueLH4oaPAr
	4/E8CfUtgD9JCSYdgqDNPTGf3WDqWggCkDqswdM4bg88sfMPDeWHH5NIlB2Bfj+JpMt9FG
	ZcOWlzLEUXG/bpJ8Kbaqy4vRi+qRmpA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1695807283;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8yq/EWr5xgyIq2expGTOm/a8E50tdoL6jyUvlCURtkA=;
	b=mg4W9cwL1b35dhDAXFy+IpXoqDtwwHWZKy46oqV5YDeY2A866tqG4ZHrqCDezVtTxVLjRN
	B2SqzI+xFxiJavDw==
From: Jan Kara <jack@suse.cz>
To: Christian Brauner <brauner@kernel.org>
Cc: <linux-fsdevel@vger.kernel.org>,
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
Subject: [PATCH v4 0/29] block: Make blkdev_get_by_*() return handle
Date: Wed, 27 Sep 2023 11:34:06 +0200
Message-Id: <20230818123232.2269-1-jack@suse.cz>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3761; i=jack@suse.cz; h=from:subject:message-id; bh=szriGynEGZ/XhMNms+k06ASpRGig2ulDzrbrydRWx/Q=; b=owEBbQGS/pANAwAIAZydqgc/ZEDZAcsmYgBlE/cIrHCVKGuvNFZzgT9xiRfuRKr6Es2Qs4om7G7p jp8k2rmJATMEAAEIAB0WIQSrWdEr1p4yirVVKBycnaoHP2RA2QUCZRP3CAAKCRCcnaoHP2RA2XGWB/ 4+O+K19fPnUyIouL+A+izJvDBxQbTCWLdn5TEMu5YdIMbi0dvnwAfknt+NWIhJaTQX2oqlgt3Z+UIT peMYb+jQZabj8X4xHMMy3Sfq64tRwodJHlZby5Ux9AfTZe49zDp4M4B3yxQqarEhmz6e4FJUGDaSej vcJmLz6AuSnYuAh4QK/3jCXQrEElZRTjarZjfbunWocM/2dQ7CB+rOSwKJcRMoDpqntU8QyArxca4l q6I2pBMNjnYMgjtG+ABGSBtTrj87TuJSTB3V8qtI38sfCYjMVVEoQiJKuUm1GMh2sPOFelwVMXMCJH mKs8UbSjcFd3wsbJXc8EOKLxzYparl
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

The series is based on Btrfs tree's for-next branch [2] as of today as the
series depends on Christoph's changes to btrfs device handling.  Patches have
passed some reasonable testing - I've tested block changes, md, dm, bcache,
xfs, btrfs, ext4, swap. More testing or review is always welcome. Thanks! I've
pushed out the full branch to:

git://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git bdev_handle

to ease review / testing. Christian, can you pull the patches to your tree
to get some exposure in linux-next as well? Thanks!

Changes since v3:
* Rebased on top on btrfs tree

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
[2] git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next

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

