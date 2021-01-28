Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD78E306E56
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 08:14:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76643.138411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51Vl-0005OT-79; Thu, 28 Jan 2021 07:14:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76643.138411; Thu, 28 Jan 2021 07:14:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51Vl-0005Nw-2g; Thu, 28 Jan 2021 07:14:37 +0000
Received: by outflank-mailman (input) for mailman id 76643;
 Thu, 28 Jan 2021 07:14:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YU/W=G7=wdc.com=prvs=655a99766=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1l51Vj-0005NJ-LI
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 07:14:35 +0000
Received: from esa6.hgst.iphmx.com (unknown [216.71.154.45])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a1b2f94e-f791-42c9-9d79-3621c749b1e9;
 Thu, 28 Jan 2021 07:14:34 +0000 (UTC)
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:14:33 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 22:58:53 -0800
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
 by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:14:33 -0800
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
X-Inumbo-ID: a1b2f94e-f791-42c9-9d79-3621c749b1e9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611818074; x=1643354074;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WN34YNrFVBX2exPMiNFaWJshviC5HdAH5Y1CjLjlB3Y=;
  b=P8OPFyb6+DRO2eMvGrO3ZFdfcGq9gKcZAkTUtEw7UFQiIRDVN6YdJenG
   qviqep58vKGmHKOk6+xi4akbk8a/fL8hKHtb2XVDVpdZYILhtwEXj+Laj
   6cqeWVZo6IaEdBGYSRhAUoWn50bjPdGQcmNj+f2jgJuCB774qpKEiGhoc
   tKEoYO+uD74GrI30eiBjbsF6T+wpZQZlOyz8tXkuAZNATooJci9g2yhE2
   t4ynFIeOFUelOs/m2IAlzwHqCGCEeSQ7h6AO+yn2ArteTzutzJ1yYM0mu
   0g8W1XKV4rPS3IoeGXQKXpN7fKdU3IuwS46WqunGRvxCAqm8Tm0RbwCFP
   w==;
IronPort-SDR: 8qaiRkGulLvOG5qjHxDkPJgEjUECT6TYlwGkIeueAE/XAaqMyzBxfuhfMWVXvvYx2nDYhk+dE6
 SuN8luAfu4RSWnDeAQOgag+ATZJxFRIbQo2vMg7dMhanwcbYyuoyWUDnbSkzfuWnI01Wgyiu0C
 xsVZBhzX65T6/osDm9avGeDSvMPRD3wT2N5TMcSNHJyby0BqMCB+/2H0CECX/O4tyTqEEVVqWk
 1q/Olzku3hfrFuVQxBkXd7aK3Mvk4ZjM9VxWRfz61pN057aoF1xosz/OHhNF0nwuTzp5mjAn2n
 8nI=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; 
   d="scan'208";a="159693929"
IronPort-SDR: rUniaWO92UoUVDNasq2Mg01K3ZD6eAX8KX0XBkhBiIhRHFDuaOSQPQAi2AFktih4P0lGSSV6u6
 1QJvr1titcHCS+WSLX73NY2dt1EDt0x/2IEl3+6kIi8fCD9JDkcwVkRNbBFaa5GZ7fpv1ZVw3f
 2rA0eyHovrbJ82FVztMfe/gs5sERauw4PpJZbjZNEoW1QXf3Gs2gzGg+nhIYH9WIGObuzob3hJ
 p4bN6g+yuya+t+E2qn1YRDsFrWgx1QPKIG9BafRaNjjRxwnydAGXq7juRoTKLyRxHK7I1bEI7i
 bLdoBOEHiYOaToZrg7OjMYlB
IronPort-SDR: hgdemKPG/3HHgXRADNUaRfIeto8NmW8LEHR468JLI5qNdwJ9I/Vz7EOVIHe6ux2OR8aMkXbCb+
 hHmOp4ZL4+H3N5KG2012DyI6S+0eAji83o59kSvMRJsf1lkWorl0McE4AqjKkZANcW6TxQu0db
 Rg6QKY68t8KKdoDxgIWM8St6Q8n+pLj6fbsJ1LpjtPi/SVOVdnUNhjzT9HNr2ak6ECZBXsF3YT
 a/oz2zpRpm0NjKofMt8jO2sCHWsfpktQx0L5tGvTxbU6SR20ACdGgmG00/Fl2WObQ2KsI7nqdc
 S2A=
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
Subject: [RFC PATCH 20/34] fs/jfs/jfs_logmgr.c: use bio_new in lbmStartIO
Date: Wed, 27 Jan 2021 23:11:19 -0800
Message-Id: <20210128071133.60335-21-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
References: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 fs/jfs/jfs_logmgr.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/jfs/jfs_logmgr.c b/fs/jfs/jfs_logmgr.c
index 4481f3e33a3f..bb25737d52f6 100644
--- a/fs/jfs/jfs_logmgr.c
+++ b/fs/jfs/jfs_logmgr.c
@@ -2121,16 +2121,14 @@ static void lbmStartIO(struct lbuf * bp)
 
 	jfs_info("lbmStartIO");
 
-	bio = bio_alloc(GFP_NOFS, 1);
-	bio->bi_iter.bi_sector = bp->l_blkno << (log->l2bsize - 9);
-	bio_set_dev(bio, log->bdev);
+	bio = bio_new(log->bdev, bp->l_blkno << (log->l2bsize - 9),
+			REQ_OP_WRITE | REQ_SYNC, 0, 1, GFP_NOFS);
 
 	bio_add_page(bio, bp->l_page, LOGPSIZE, bp->l_offset);
 	BUG_ON(bio->bi_iter.bi_size != LOGPSIZE);
 
 	bio->bi_end_io = lbmIODone;
 	bio->bi_private = bp;
-	bio->bi_opf = REQ_OP_WRITE | REQ_SYNC;
 
 	/* check if journaling to disk has been disabled */
 	if (log->no_integrity) {
-- 
2.22.1


