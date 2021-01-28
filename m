Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E26CC306E52
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 08:14:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76625.138362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51V7-0004rA-QM; Thu, 28 Jan 2021 07:13:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76625.138362; Thu, 28 Jan 2021 07:13:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51V7-0004qR-Mm; Thu, 28 Jan 2021 07:13:57 +0000
Received: by outflank-mailman (input) for mailman id 76625;
 Thu, 28 Jan 2021 07:13:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YU/W=G7=wdc.com=prvs=655a99766=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1l51V5-0004pI-VL
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 07:13:55 +0000
Received: from esa2.hgst.iphmx.com (unknown [68.232.143.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a2d2eb70-8fc1-4b20-a3bd-ce1efdabf817;
 Thu, 28 Jan 2021 07:13:55 +0000 (UTC)
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:16:05 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 22:56:12 -0800
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
 by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:13:54 -0800
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
X-Inumbo-ID: a2d2eb70-8fc1-4b20-a3bd-ce1efdabf817
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611818166; x=1643354166;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wUwjN0vBouMAu1m5itQWMc9ceGIiyWjYqyXKNeHEsnQ=;
  b=nxzJflacH2hbguCGRxCBP9wduYQ3myDzwmPyGdPjQhY6sNVghRPXRdjj
   ikYM3FqSQvPqimwtOSoO2oHA9krYU8WLH1VbZhvIfVvxqB0VIbnWt4OO3
   LW7g5jCWJc7ZeTc0MqfI1dqccsxWNf8I6Oura1JvK8zN1P8yKik8cR+OT
   f6dwbGrduhi1BWQPyvGXXvhpiIW4yaaL7S9zUQvg0q0cnP2e0VVPuUHdG
   VnBWfnBrD4AEYV0zSYCnsEOlzQqe4EhIRoLV+6L1B172B43ZNFS//4/TA
   HIZM/XqVX+pX/lpJcRccqkVnWG1WwsfGXFyUOBT8pzMLENyY84OyQCD87
   g==;
IronPort-SDR: L9JRq0irKBoR/immUwJJk5MAs79tfhm5a9Nf0efAIcPDlTWveGHJ1lZLroh43J2FSFGVYhLuhG
 oYHLx3uTX3J8HyT3w+d/qPY4qa9SvOceJ9gjDmjIEh5JLNq8SPyInqvXWdr88m/x9SDGkSjU/x
 onDlSBVGOTHEwYLuE74oVLzY5nburvJWzJlGjrwxFk3HE40Tn5W9zfy6Df1PpWlI7ekUr+6g+A
 FtDXuzjsF1UVZ6BG4pFzlAlOcUgT3FImkJvb8ZFLF6XA2aybNi4OSY50Xs/eHJvkAn/YsTUWeU
 Kpc=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; 
   d="scan'208";a="262549028"
IronPort-SDR: bbV/rPEQomMPAyAfzgt/2nDhxQWlkmrixit6zLlYOAQKuYlEsk3dczL1e+4hLz3d5mute5trpt
 GHvoWPb0+lwuypKor8ukIqoBxcISsuxQA9D/TnsL5Zh2Gfx+oMHDcNF3HurIpxAKrFTKDdG7NH
 s0tuyuxfapfZock6Yr+n+Jx2miiyehTBngrvuy40asxV2TThbBDwqDkTW/oth+sZQSc9bTisDn
 IHJaAge3kVg3MpcirmZJcV1wwp3oSVVVBdcEtR/P5C1dYJhvpxutOGX5r1UBMSNpJs4P69nybI
 XSThmT0YoiKtEkYRtsXeExK6
IronPort-SDR: pB2cXSth9j9iO8qI9kro9aUnzxe7uC+CM4R5ezhi5mkNe3QJ3MeSZh+GGUOxW9ROBr/hgtgk35
 3kQYC2KUTB+4qbQnoUg89GyqXiUICL6Lbb6/fLgPHrp+IuvY60iwR3VPtR6IrHib1STZYvjFII
 G0U9LFUNwbOn5ju9S5MOKHMAKhFoQxnYNKdJKA68HgaqnFN4j9YRc5HgIY3H1XVVcQBHwY13od
 d8yfo6WXgScVxvO/+aDCj5bBUi8Qq8LHMuAKgJFuukK9k/tSzy9sPaWEv7Xl8jluo8DC44HSzF
 bXE=
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
Subject: [RFC PATCH 15/34] fscrypt: use bio_new in fscrypt_zeroout_range
Date: Wed, 27 Jan 2021 23:11:14 -0800
Message-Id: <20210128071133.60335-16-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
References: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 fs/crypto/bio.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/crypto/bio.c b/fs/crypto/bio.c
index b048a0e38516..20dab9bdf098 100644
--- a/fs/crypto/bio.c
+++ b/fs/crypto/bio.c
@@ -148,12 +148,11 @@ int fscrypt_zeroout_range(const struct inode *inode, pgoff_t lblk,
 		return -EINVAL;
 
 	/* This always succeeds since __GFP_DIRECT_RECLAIM is set. */
-	bio = bio_alloc(GFP_NOFS, nr_pages);
+	bio = bio_alloc(inode->i_sb->s_bdev, 0, REQ_OP_WRITE, 0, nr_pages,
+			GFP_NOFS);
 
 	do {
-		bio_set_dev(bio, inode->i_sb->s_bdev);
 		bio->bi_iter.bi_sector = pblk << (blockbits - 9);
-		bio_set_op_attrs(bio, REQ_OP_WRITE, 0);
 
 		i = 0;
 		offset = 0;
-- 
2.22.1


