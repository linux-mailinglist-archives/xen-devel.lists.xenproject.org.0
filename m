Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9E0306E46
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 08:13:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76609.138314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51Uc-0004Qa-C2; Thu, 28 Jan 2021 07:13:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76609.138314; Thu, 28 Jan 2021 07:13:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51Uc-0004Q1-7q; Thu, 28 Jan 2021 07:13:26 +0000
Received: by outflank-mailman (input) for mailman id 76609;
 Thu, 28 Jan 2021 07:13:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YU/W=G7=wdc.com=prvs=655a99766=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1l51Ub-0004PH-CX
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 07:13:25 +0000
Received: from esa5.hgst.iphmx.com (unknown [216.71.153.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2bff9af5-6690-46e6-b969-e22fddc219a4;
 Thu, 28 Jan 2021 07:13:24 +0000 (UTC)
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:13:23 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 22:55:41 -0800
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
 by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:13:23 -0800
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
X-Inumbo-ID: 2bff9af5-6690-46e6-b969-e22fddc219a4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611818004; x=1643354004;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=g8HJbcPmpqxtxJgQpVgZEQpuhn8q+oe36W4m3E0vxow=;
  b=XI0ykKj/3zgNK4sf+v7xp9lq/h6L+2YFPel83iOYaHKerDSqtKOr+24f
   fa5MlVF00jCXb5UG4SV5lp1cMfen1eryHuczjkB60XCYCSsPdrKXjL6GH
   3hcrRhOA6kMe5XWR0x/kiTndQXq3S+VMVi3Fr63rdMzkwCd7ye7KNubKp
   mckYbemMizhDK1jtXZSrCnrHJjtEqNIls5ba8ZAZqgFtAciV5Hi1jI2rl
   2qr0jNty/KqiuY6FzEOynYNDpr1/8PpxGHL4SHgM+FPEkfvQDoljmpFws
   MxUDS2URF+mWm9ZEsqM6pKEZOMrlpOreqW/9hvJjE2MBDSePRYASFJ7RS
   Q==;
IronPort-SDR: gMMIgLRWoA0kmMJTYcDO81ywU4FXxgKVIiLHY635ulh68Ny8yLx2KvlgWa9bxC26Iv0hG9NxTI
 RIUKcbtVuIh6ZvJY5Q4sfaavA3J9/NDqwn9VCfu2CXbRpWKGHqZWFxcBElzHpZuY66xTKbRU48
 T2M6KLaC0he/At2L1WB9sUEZ7ayAicelEZBTl83dLQeuBHgu+wkbbfYG5kgdJYncXjBpf8v+uM
 mIjpPu5o7nDusuGm++tqkCutlSZjjOeLQTA6e8H8gXdE9OFfOSHKbBHUZuoOrFP5DQtRg9KgYK
 tXk=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; 
   d="scan'208";a="158518181"
IronPort-SDR: EVL53SHQAGGz4+/T8Z4t2naSbYMMVq3mSslAq/C1JOCONexXTaXAF4c20Lz1T0M4kJ9GrWUgYG
 s41dv4NS6yInfJp/Rrx1MdVSe8hhiKgY9GWKcENFcrxZIyRgkAb+MObGpxOeg7450sG1oURiR9
 mieR0493GXlfy7m2jUy0js8gflGaRbSZVVwDKAWL8AlnSCs+OUWC1QGjbMSxylPPyoBMbILk70
 FGirdJdeRM4bIZrasMK1ElXb2eadqHB8+yzT6nJWZew8uUiZKPsA09SeroSSF3+U4DL7tkQFPY
 Gji0Dr29K5Gnd6kFCahsnkeh
IronPort-SDR: S7K4kJLXzJBN+TtdhPMN6TP/Dffs+zSa3G/de5+S1/PIJxe5GMDYhILg7ObwZaeQtAx8NJxvkl
 nIc5LC+mPpv7TI+pptGOuvqvgXc2tzfVFCEyc5+LFgl+ipYQILMS5NCsDr+0Wgl54XSWETlfzh
 gHkg4ZggWJkUuTGFtq5ayNdqurKZ4tOlkNjJtnTH4tbAn7NSWqg+Ok++T//Bdn23FoUZxk+NbJ
 AQUU7LKb9NmxAxDMj2VCc1ROkgf8sOKgTR+MW0zxXzuua4VhN6N1CvrlPe6fa6RhDqhXPf7MuT
 aTA=
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
Subject: [RFC PATCH 11/34] nvmet: use bio_new in nvmet_bdev_execute_rw
Date: Wed, 27 Jan 2021 23:11:10 -0800
Message-Id: <20210128071133.60335-12-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
References: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 drivers/nvme/target/io-cmd-bdev.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/nvme/target/io-cmd-bdev.c b/drivers/nvme/target/io-cmd-bdev.c
index bf6e0ac9ad28..f5fd93a796a6 100644
--- a/drivers/nvme/target/io-cmd-bdev.c
+++ b/drivers/nvme/target/io-cmd-bdev.c
@@ -225,6 +225,7 @@ static int nvmet_bdev_alloc_bip(struct nvmet_req *req, struct bio *bio,
 
 static void nvmet_bdev_execute_rw(struct nvmet_req *req)
 {
+	struct block_device *bdev = req->ns->bdev;
 	int sg_cnt = req->sg_cnt;
 	struct bio *bio;
 	struct scatterlist *sg;
@@ -265,7 +266,7 @@ static void nvmet_bdev_execute_rw(struct nvmet_req *req)
 	} else {
 		bio = bio_alloc(GFP_KERNEL, min(sg_cnt, BIO_MAX_PAGES));
 	}
-	bio_set_dev(bio, req->ns->bdev);
+	bio_set_dev(bio, bdev);
 	bio->bi_iter.bi_sector = sector;
 	bio->bi_private = req;
 	bio->bi_end_io = nvmet_bio_done;
@@ -290,11 +291,7 @@ static void nvmet_bdev_execute_rw(struct nvmet_req *req)
 				}
 			}
 
-			bio = bio_alloc(GFP_KERNEL, min(sg_cnt, BIO_MAX_PAGES));
-			bio_set_dev(bio, req->ns->bdev);
-			bio->bi_iter.bi_sector = sector;
-			bio->bi_opf = op;
-
+			bio = bio_new(bdev, sector, op, 0, sg_cnt, GFP_KERNEL);
 			bio_chain(bio, prev);
 			submit_bio(prev);
 		}
-- 
2.22.1


