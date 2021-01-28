Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 131BC306E5B
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 08:15:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76666.138471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51WK-0005ur-1G; Thu, 28 Jan 2021 07:15:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76666.138471; Thu, 28 Jan 2021 07:15:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51WJ-0005uD-U4; Thu, 28 Jan 2021 07:15:11 +0000
Received: by outflank-mailman (input) for mailman id 76666;
 Thu, 28 Jan 2021 07:15:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YU/W=G7=wdc.com=prvs=655a99766=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1l51WI-0005tF-G3
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 07:15:10 +0000
Received: from esa6.hgst.iphmx.com (unknown [216.71.154.45])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 91f45b9b-21ad-4395-be2b-c0b57024cadd;
 Thu, 28 Jan 2021 07:15:09 +0000 (UTC)
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:15:09 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 22:59:28 -0800
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
 by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:15:08 -0800
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
X-Inumbo-ID: 91f45b9b-21ad-4395-be2b-c0b57024cadd
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611818109; x=1643354109;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MfH3EN2qKmNoDMJp2ceJniIXfb1rQ8RA/+9VrY6oRvA=;
  b=i0tcfM8LPDdJD76KNz+KebHt7aNu8dhDBYf/yXb5/+nYgQh0WMse7Sn9
   ozH9xc9Sc+UfsdK76ohaCN6GCCqFE6bAY2B1MPyc5DLSfnPLPwFnYTKgo
   C+OoNr6y2lvG3ysq55KlUUYx0SyWumd7F1WOxvIw9Fep6NoRLLh1itIGY
   olcxqnkChE8DQ21CN5uYlkYXOgVZGydZPzcofilVELDK1rCglBJtI88zl
   XslA1BLq6AxPBwEweAnxe/9kwmqcWSX4LyaLSH9Hi5ekxO6pVUVdSUFMV
   Lfq5RSA+OdcgwBD60MbPkiMMaeX9mBe48U+a84ScWlpFvvr5FvH74xaRT
   w==;
IronPort-SDR: MVQFyYLjFWsAAA5O5Dy+ub6EwOD/aNJuRXmtWJtHkpx69fSabq9PWNhA4FxDA90UCPJK66JP75
 SUCZ+lXAWkXE0fGEQoAXxRCOflLe6BF7HdAJrZjLTRZxTWS517/tVlWzqVG+CXikXh4SbTpsrX
 fEgumkePzcNY+V2PTrjLS4C39+E9NFtSIBoeFiL5N1tAhz3lo991wPrCRZD4H4IhDjeh75R1ny
 xjffUkofmAR2+iCCyrVoXU13U7jAUHPm2D2Oy/tmwbDChYoS1vItZdjBgDHSd7D4WdznfY8bVn
 BYY=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; 
   d="scan'208";a="159693988"
IronPort-SDR: BexLsnfigTHtojujt4NNUnpbUZb4Dpr0WxeI1mHbhFZUmmDNqVTYCFuGDokUn6FSASlG4XNmTg
 qRDNgSRrQ6L1qSDX8VVpwplpHJPhOxLsH05KRtXfEiPRfqpPyy8+7qVEPSUz1/HMkRighQ/CYp
 fjjpcr+H0ymjhdpHCTu+WAUBliYbfJsm1h/VzAnS8cBB/1EcXFszaOrjnDZ01pSuxctuPRQgVW
 EF9Rc8362YVHWEr75Cj3gBR4d+ylTR6JIYO3Vpi31EElWL7zz9nAcsCBpgv5hGpt9Mc2xZmzlz
 gtXVorEVhAlw3yy2EJFBxkbq
IronPort-SDR: +1TgXZ9HjoaS+86zh+aLwx6S7ZpAYQ4FpPhwS5t1uQfka+31mML1LQsLKCwFYYGr030vY+BCmC
 AGfrPosPVl95WjEssU5DCDJZAyR1khEX1jpqrqTT8P7u968xhLua2/lVUN5jQ7ABVZJAwAp2MY
 3XKOPyoMsT52VNuagfol6rCenkg2OIsIErUkF58mfwGPLsAlDeR+kVK0eqUX532NsUF4ctVre4
 Iqd0vyO+udw10x//vZBdiK4usAo9yvQxvOxxYG203IoYDBmyGC3oa9VGSQBs+2yVysQ7ZPCJPH
 kDc=
WDCIronportException: Internal
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	dm-devel@redhat.com,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com,
	xen-devel@lists.xenproject.org,
	linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-fscrypt@vger.kernel.org,
	jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org,
	ocfs2-devel@oss.oracle.com,
	linux-pm@vger.kernel.org,
	linux-mm@kvack.org
Cc: axboe@kernel.dk,
	philipp.reisner@linbit.com,
	lars.ellenberg@linbit.com,
	konrad.wilk@oracle.com,
	roger.pau@citrix.com,
	minchan@kernel.org,
	ngupta@vflare.org,
	sergey.senozhatsky.work@gmail.com,
	agk@redhat.com,
	snitzer@redhat.com,
	hch@lst.de,
	sagi@grimberg.me,
	chaitanya.kulkarni@wdc.com,
	martin.petersen@oracle.com,
	viro@zeniv.linux.org.uk,
	tytso@mit.edu,
	jaegeuk@kernel.org,
	ebiggers@kernel.org,
	djwong@kernel.org,
	shaggy@kernel.org,
	konishi.ryusuke@gmail.com,
	mark@fasheh.com,
	jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com,
	damien.lemoal@wdc.com,
	naohiro.aota@wdc.com,
	jth@kernel.org,
	rjw@rjwysocki.net,
	len.brown@intel.com,
	pavel@ucw.cz,
	akpm@linux-foundation.org,
	hare@suse.de,
	gustavoars@kernel.org,
	tiwai@suse.de,
	alex.shi@linux.alibaba.com,
	asml.silence@gmail.com,
	ming.lei@redhat.com,
	tj@kernel.org,
	osandov@fb.com,
	bvanassche@acm.org,
	jefflexu@linux.alibaba.com
Subject: [RFC PATCH 25/34] ocfs/cluster: use bio_new in dm-log-writes
Date: Wed, 27 Jan 2021 23:11:24 -0800
Message-Id: <20210128071133.60335-26-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
References: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 fs/ocfs2/cluster/heartbeat.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/ocfs2/cluster/heartbeat.c b/fs/ocfs2/cluster/heartbeat.c
index 0179a73a3fa2..b34518036446 100644
--- a/fs/ocfs2/cluster/heartbeat.c
+++ b/fs/ocfs2/cluster/heartbeat.c
@@ -515,12 +515,13 @@ static struct bio *o2hb_setup_one_bio(struct o2hb_region *reg,
 	unsigned int cs = *current_slot;
 	struct bio *bio;
 	struct page *page;
+	sector_t sect = (reg->hr_start_block + cs) << (bits - 9);
 
 	/* Testing has shown this allocation to take long enough under
 	 * GFP_KERNEL that the local node can get fenced. It would be
 	 * nicest if we could pre-allocate these bios and avoid this
 	 * all together. */
-	bio = bio_alloc(GFP_ATOMIC, 16);
+	bio = bio_new(reg->hr_bdev, sect, op, op_flags, 16, GFP_ATOMIC);
 	if (!bio) {
 		mlog(ML_ERROR, "Could not alloc slots BIO!\n");
 		bio = ERR_PTR(-ENOMEM);
@@ -528,11 +529,8 @@ static struct bio *o2hb_setup_one_bio(struct o2hb_region *reg,
 	}
 
 	/* Must put everything in 512 byte sectors for the bio... */
-	bio->bi_iter.bi_sector = (reg->hr_start_block + cs) << (bits - 9);
-	bio_set_dev(bio, reg->hr_bdev);
 	bio->bi_private = wc;
 	bio->bi_end_io = o2hb_bio_end_io;
-	bio_set_op_attrs(bio, op, op_flags);
 
 	vec_start = (cs << bits) % PAGE_SIZE;
 	while(cs < max_slots) {
-- 
2.22.1


