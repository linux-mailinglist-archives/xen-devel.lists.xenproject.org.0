Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E338A306E47
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 08:13:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76614.138327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51Uk-0004Xr-NH; Thu, 28 Jan 2021 07:13:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76614.138327; Thu, 28 Jan 2021 07:13:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51Uk-0004X8-Ik; Thu, 28 Jan 2021 07:13:34 +0000
Received: by outflank-mailman (input) for mailman id 76614;
 Thu, 28 Jan 2021 07:13:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YU/W=G7=wdc.com=prvs=655a99766=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1l51Uj-0004WH-0Q
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 07:13:33 +0000
Received: from esa1.hgst.iphmx.com (unknown [68.232.141.245])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 745505db-b1a4-4ccc-9537-0981ff37795c;
 Thu, 28 Jan 2021 07:13:32 +0000 (UTC)
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:13:31 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 22:57:51 -0800
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
 by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:13:31 -0800
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
X-Inumbo-ID: 745505db-b1a4-4ccc-9537-0981ff37795c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611818012; x=1643354012;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5eayPzy70EKVB5mFbuCcXtyHCS4v72l8k3GegXWivXI=;
  b=gjv9D3mADvHpA+LqUN1+c+ixsCLpRda/g/1RcAhfbilIGKRQDAKHCy5q
   8qLJ55npy8pen8HfkPJIvsE/IWDduVvt0ZQbFzvF8J/ZW8VlJbs8+DSaj
   eeODw3fBQF+v1N/VjY4G4RT2FyM9hwTs6NnP0vx2IZNpONhNYE2qqJ7Ft
   PT6F0eD//qfEbTYxdU/yyij8ekped/wOXpmZYzqKaVkNSGGjrKnIXhmMG
   OhHn95OsvNfyeZNPMsEAcM53OBnkgCMIXCHlZLgRwIb12jcKvUo9HUXbA
   LcCpcedt2YixJYqSjjS3S33m98UXyiK0d+xB/Lnmn99nLI6C+OD8NnFz5
   g==;
IronPort-SDR: c0+kqDwrZmCsY9dagEnynkfOF0UdpeUy9AwFFFJWZV+llPbvKJ2rIEFZFnPnPFha2iInk+bTe3
 1kZdETF9FL860rv5Yrx18tdT36wjoIRTn6mSj2YmConSrCFcm8WG4i8MPbB/e/aPsmI1neLvJ9
 FWD+Md+J3PPpBrwWKQx7b/pN2bO3AF2hH0T3ss3ShU0/f47ScMmtDunAERK0/eXDbpsjaNZxw9
 ghMT2CVWFnyc2R0/sJRGH1/podBG/RKyyOmkz4+Ls8t6Ageuunz+eDW4rDUkYVjCJwz9hgz3t3
 Mc8=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; 
   d="scan'208";a="268892469"
IronPort-SDR: HQeR5anHBqx5KzDK1rlK6ymmz3C1kJ5bsv/Led8WAUkaAplaINN65VwIofvLtef51YL3xanujg
 yoAxfhfvHV3YUlnp6Ix209i7+A57HZJmI0KlZzmSvuFJEvB11UatlRz1qd25cj1KvwqCNa/GCo
 meTa82G0EYNkqbVO1NhUS5sB+z0OL0L40R5dO50oqz++00H6v0LfK0UcIxuor75fcWITOljuiC
 JWANqXLqyQdroUt5vlcLo3jsbv6RzK9LVkoGNP0uhv6mU/ISheL1B6twtKYr36I5Z2gZR/D1dL
 +NrcMiFjlj+xn++vzI9k8t1K
IronPort-SDR: VOVmzSzF+PFJ5cIlwEfer9zopXRJVevtkqTAdV/vkmWi5tqY25x0d3LuGTyYENdxWXzay1z5UI
 3lglUXeUdXrgV2kjosRDVsxHgPX3JmYCMkybSp7dVFiY2NtJizGeP3Ns2Zua+ztPSx29L5AtLA
 s1r4WqMcMEF5NenjfW/yptNoTwylDj+qb8oKvyina3WsNVkg0wovZeJk89NSPRf5yUzOMPXVB7
 hd4QqToWmHIoH7o5yPqPfXS+LYwCHRus+XuP8hoEESu425XNxiI+t6Xi0EnlRBN9AYDyemp/IQ
 NGk=
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
Subject: [RFC PATCH 12/34] scsi: target/iblock: use bio_new
Date: Wed, 27 Jan 2021 23:11:11 -0800
Message-Id: <20210128071133.60335-13-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
References: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 drivers/target/target_core_iblock.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/target/target_core_iblock.c b/drivers/target/target_core_iblock.c
index 8ed93fd205c7..f1264918aee1 100644
--- a/drivers/target/target_core_iblock.c
+++ b/drivers/target/target_core_iblock.c
@@ -379,10 +379,9 @@ iblock_execute_sync_cache(struct se_cmd *cmd)
 	if (immed)
 		target_complete_cmd(cmd, SAM_STAT_GOOD);
 
-	bio = bio_alloc(GFP_KERNEL, 0);
+	bio = bio_new(ib_dev->ibd_bd, 0, REQ_OP_WRITE, REQ_PREFLUSH, 0,
+		      GFP_KERNEL);
 	bio->bi_end_io = iblock_end_io_flush;
-	bio_set_dev(bio, ib_dev->ibd_bd);
-	bio->bi_opf = REQ_OP_WRITE | REQ_PREFLUSH;
 	if (!immed)
 		bio->bi_private = cmd;
 	submit_bio(bio);
-- 
2.22.1


