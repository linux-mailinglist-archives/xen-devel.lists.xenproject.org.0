Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 476BA306E59
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 08:15:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76654.138447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51W6-0005hB-4w; Thu, 28 Jan 2021 07:14:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76654.138447; Thu, 28 Jan 2021 07:14:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51W6-0005gO-09; Thu, 28 Jan 2021 07:14:58 +0000
Received: by outflank-mailman (input) for mailman id 76654;
 Thu, 28 Jan 2021 07:14:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YU/W=G7=wdc.com=prvs=655a99766=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1l51W4-0005fl-K1
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 07:14:56 +0000
Received: from esa4.hgst.iphmx.com (unknown [216.71.154.42])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 961fcd9f-e928-4591-9cb8-63839c181e13;
 Thu, 28 Jan 2021 07:14:55 +0000 (UTC)
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:14:54 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 22:57:12 -0800
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
 by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:14:54 -0800
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
X-Inumbo-ID: 961fcd9f-e928-4591-9cb8-63839c181e13
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611818095; x=1643354095;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XPaYjcRaIFpnYMD3YBMMFWgQznGRHjSurwf/uHFVwCI=;
  b=SDKTSJBx1LDuT+ovpg7fbM1obKQGt0ELwHjkPJ1R6+e+SbEYeYRSNqqE
   o+eKG/MzL7uW502w7slZ1s1ufnYm5lsTlfmbxj+yPxIJ/16y6J11jaYpH
   tAOABVX1/+ObhwmtqOD/DRGC1ZRhOc+XL7cRkcpwzd0U6w3SlulcGnXaf
   pQgenO7GD/RB74w+nwtOTdKibbPpCnbavE/t+JBP7pwnDF8hRlTAoFvkn
   Ex/F70h2Yxs8V6vmg3qZBYo9qakH5trmnAEp0soYC9YPc5m6/toJ9Jf5q
   WtfFQQadH9aV+9okqxsEOMIc4pLqO2SO2VkUjs4tpYDmXV0SmsZwvzVdv
   A==;
IronPort-SDR: hwOLTmryUt0Lx9A36ifW1rTkgfcsCotwfj4Y1ICJ4hQQoAME6TuGizY6WGIaDlQ1gLiy/NxP78
 bXLiYWugv0n1dFMGGPewJi6D+daMPSrjKcPdh4s+4/uskuYbXqwD2Mx15ew1C8KyBN8OxylL1g
 nxfga7ppS0N1o+z1D3DTfd0p8kJtBh9Veyv93oBaYuIZ7L1cvuXv7SvS3fZy/29h/CtfdxXYja
 l/J4ykj5pvVGyB4AHB7qvcnY8aNsjW9u0CD4z2P6iwPvIx5dzO+VtsU2NnAP1DMNpNg5dSLFxt
 xhg=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; 
   d="scan'208";a="158517478"
IronPort-SDR: UKs4V9LardU8lNj40XjaXERGH0tnfgv5OHGYK0r/4K4O23rke65FJhlfLUpqiDIK8Su1GynH4v
 +Q6xJ7vf5O/hvxGdRZMwhO0D3k2SQLn5LpL0jIncOjSfY+du1cFVCLxOJy3gZP5YSBuctedBlU
 fPTlFcY5RprWsGUP01xwK1hvUVDyqc16xHAx8h6kaDji+HLrCt3J7NzE9jTNGoHTMtcuQNv3Nx
 ifKJHJoHicjH8cD8Vmbk5iAjWtX+ES8FSLrP6CEXlvvcRtk7Bzzq8aF8LsJ2/lUViZgwMOPYh0
 Q4RjXO1l4LonOEoG1PxSQWFr
IronPort-SDR: m1TZ+g0HqYnNuuEaVgIMmloDXGiOQeWVkBatefSwdP931h6/Qc9uK8rnz+JHWAn0f3QBmOsUC2
 fXJ41UlgQQnfdBQndrwCq+hQtl7mr6AQW85+ZjLVP2rPUrLfDej915AJE+NjNtCGI740sa3D8g
 UGQ9bx3fpoJbY98zSPHF13CT5IYtiyfyvVxvvVA5VfTuNLKWU4ZEgYs5jdqkUbRYa6sajX3DSU
 E+nFYRIRokBPoO+x05JGw6lqTR47HYfSK6LYXKwXfQUKv6zaLN0igntqoauBJYDwbicxGnznwF
 roE=
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
Subject: [RFC PATCH 23/34] fs/mpage.c: use bio_new mpage_alloc
Date: Wed, 27 Jan 2021 23:11:22 -0800
Message-Id: <20210128071133.60335-24-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
References: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 fs/mpage.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/fs/mpage.c b/fs/mpage.c
index 830e6cc2a9e7..01725126e81f 100644
--- a/fs/mpage.c
+++ b/fs/mpage.c
@@ -68,25 +68,21 @@ static struct bio *mpage_bio_submit(int op, int op_flags, struct bio *bio)
 }
 
 static struct bio *
-mpage_alloc(struct block_device *bdev,
-		sector_t first_sector, int nr_vecs,
-		gfp_t gfp_flags)
+mpage_alloc(struct block_device *bdev, sector_t first_sector, int nr_vecs,
+	    gfp_t gfp_flags)
 {
 	struct bio *bio;
 
 	/* Restrict the given (page cache) mask for slab allocations */
 	gfp_flags &= GFP_KERNEL;
-	bio = bio_alloc(gfp_flags, nr_vecs);
+	bio = bio_new(bdev, first_sector, 0, 0, nr_vecs, gfp_flags);
 
 	if (bio == NULL && (current->flags & PF_MEMALLOC)) {
 		while (!bio && (nr_vecs /= 2))
-			bio = bio_alloc(gfp_flags, nr_vecs);
+			bio = bio_new(bdev, first_sector, 0, 0, nr_vecs,
+					gfp_flags);
 	}
 
-	if (bio) {
-		bio_set_dev(bio, bdev);
-		bio->bi_iter.bi_sector = first_sector;
-	}
 	return bio;
 }
 
@@ -304,9 +300,7 @@ static struct bio *do_mpage_readpage(struct mpage_readpage_args *args)
 				goto out;
 		}
 		args->bio = mpage_alloc(bdev, blocks[0] << (blkbits - 9),
-					min_t(int, args->nr_pages,
-					      BIO_MAX_PAGES),
-					gfp);
+					args->nr_pages, gfp);
 		if (args->bio == NULL)
 			goto confused;
 	}
-- 
2.22.1


