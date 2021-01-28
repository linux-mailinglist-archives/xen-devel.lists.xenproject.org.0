Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F807306E8C
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 08:16:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76699.138543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51XD-0006gh-7v; Thu, 28 Jan 2021 07:16:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76699.138543; Thu, 28 Jan 2021 07:16:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51XD-0006gA-2j; Thu, 28 Jan 2021 07:16:07 +0000
Received: by outflank-mailman (input) for mailman id 76699;
 Thu, 28 Jan 2021 07:16:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YU/W=G7=wdc.com=prvs=655a99766=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1l51XC-0006fc-0X
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 07:16:06 +0000
Received: from esa3.hgst.iphmx.com (unknown [216.71.153.141])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e38a72d0-0936-4680-bed6-26e690e5690e;
 Thu, 28 Jan 2021 07:16:05 +0000 (UTC)
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:16:04 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 23:00:24 -0800
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
 by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:16:04 -0800
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
X-Inumbo-ID: e38a72d0-0936-4680-bed6-26e690e5690e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611818165; x=1643354165;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gllqHMP2deuE0vZ0qLUvAasM9UgJt1wGssSRSahQx/E=;
  b=hOGHLilUmvGxftol4u3kaHh/IdpbjeATrhmzK2p5u3wlcOEAGVolUwiC
   ijbbza2rMpSD0nIG909thINsbBpAouH+uSekpnwnBUg93ZAO3U5auD88H
   CFORGFo1Pr7Xk67T7/tcRqjkXscVFk6dzsxMBM3CoKEb9K0KOU9o7mBFJ
   IsOW2SrDDadHEZSq75JiQrHdn930EF8m8WAAkQvrdsRQfGVQoLs7M15rS
   eZRPONG5dBLWI5EafB+spMp9kR+MX7PmUiZNoXZcTeDAEJLwPYPyQD0aK
   YM92r0meR2GBK9vsqgfmuJsMzaGILCu1X5kJ7zgepRUgzohRH4kNV/HO2
   A==;
IronPort-SDR: PwpobEfXVFVYNxMCZW+s8LVBPiIroXcPwZX8FsLdcKpxpVwRvuvW8IxtYWUzqCVHRY/5nTUVrA
 bnFe824/o1W4WGh4wkGnbGNJbZa9ZH5hGcRmZ0tVfK+77nknCuBKmONRJLJVmlhJz9zFkAZq0D
 2QwQUoWX/E4ZB1cmKz3edOYGQlOaoAFpFOLU1WpssxuBMvNRjbWM13gmN+wwsxJjKdRrM6WC+v
 z+rQsbXUnmuuv+oPaLMjcsox/TTCqFa9HnAWZszr9ScwmQ91U6TTDiXcQhPfuwXgTeFTwCoFY9
 BgE=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; 
   d="scan'208";a="162963502"
IronPort-SDR: VEKRuFcsLm/Q0MjdY0M9eudgf0sjdnap8GzqN+mYX7s9bFJ6JK/Lk6mcInC89eqa6HqMn5b3CL
 IS17IOKmVfx3NQgvZS3LzAlRy8oM8E9oU2pCPa/gjLxWlriFnUHrqdWRe4L9kT9hiDYyT0vSYK
 gQLGKep8e3Fl79Z4Lp0Xxpl+AiNbkB1UyDUpzVgBvh4gB9gB4J7ryDFMtZsmhFJXwVqHB3Nwl7
 mPvIp9iX6uaPUswlkKwt0kv6hofeW7ceB/FrBvyI1QGxbZ4wnrkGASe4PQgYV+CtK0omxAC8DS
 3ee4eekYGKVP0QITOlQYPj6y
IronPort-SDR: Grws0RkRukNGo7nyou8ZmIctRPf+YpsLcKEKHc3Y9j2gH1wu+DvtqTycxE/+Um75XSsvYHsJz2
 XuCl7g+xJPknbJtkfE6+aL2ksGkx9esZlvJSCaOOok8lPoOpNpuMTJUvJF76PXh6twtzc4hV4l
 Ck271Nzyl0bN3jPxPpXSp854weGQ+wyoheQ1qJh2ewh7GEZUQlec6Cx5gMyzUS7NDfOacpsNSA
 i4cQzL4qbQiTmP11yVUjlWBUXU4/5eKNIGO+C/0onsAsvTsPxAAYkHYwd4fug7gJV2TpCU6JnF
 3ZY=
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
Subject: [RFC PATCH 32/34] mm: use bio_new in __swap_writepage
Date: Wed, 27 Jan 2021 23:11:31 -0800
Message-Id: <20210128071133.60335-33-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
References: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 mm/page_io.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/mm/page_io.c b/mm/page_io.c
index 92f7941c6d01..25b321489703 100644
--- a/mm/page_io.c
+++ b/mm/page_io.c
@@ -342,10 +342,8 @@ int __swap_writepage(struct page *page, struct writeback_control *wbc,
 		return 0;
 	}
 
-	bio = bio_alloc(GFP_NOIO, 1);
-	bio_set_dev(bio, sis->bdev);
-	bio->bi_iter.bi_sector = swap_page_sector(page);
-	bio->bi_opf = REQ_OP_WRITE | REQ_SWAP | wbc_to_write_flags(wbc);
+	bio = bio_alloc(sis->bdev, swap_page_sector(page), REQ_OP_WRITE,
+			REQ_SWAP | wbc_to_write_flags(wbc), 1, GFP_NOIO);
 	bio->bi_end_io = end_write_func;
 	bio_add_page(bio, page, thp_size(page), 0);
 
-- 
2.22.1


