Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEA6306E57
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 08:14:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76647.138423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51Vs-0005U5-G9; Thu, 28 Jan 2021 07:14:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76647.138423; Thu, 28 Jan 2021 07:14:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51Vs-0005TT-Bc; Thu, 28 Jan 2021 07:14:44 +0000
Received: by outflank-mailman (input) for mailman id 76647;
 Thu, 28 Jan 2021 07:14:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YU/W=G7=wdc.com=prvs=655a99766=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1l51Vq-0005SZ-DS
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 07:14:42 +0000
Received: from esa5.hgst.iphmx.com (unknown [216.71.153.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id de89d92e-d6ec-4adf-acaa-b3c2fcfc750f;
 Thu, 28 Jan 2021 07:14:41 +0000 (UTC)
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:14:40 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 22:59:00 -0800
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
 by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:14:40 -0800
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
X-Inumbo-ID: de89d92e-d6ec-4adf-acaa-b3c2fcfc750f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611818081; x=1643354081;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1876bf0CQ4oKwKjrcbLTUHkm2JuWaJTsdB558+rHPRs=;
  b=qpz7jonHFeG1AFZhnniZkdOeJsA8GEE1IDzVyDwYqpbcLbW9W081BCiz
   +1ZWEiNZrYdqCQ2xBwn/V37w0nTlzVo/o6t7DRLKbse/28pLil9OrRHku
   HOuLPsn2uqaEC3scPiG0rl1epYXJLj+4EQ7Ta8Iakroq9ncoXMBEaB3Bp
   F6G+xIqMn3GKhfIcbqKpryHTI9YHFEC0JMAPovoRnx/ftr65T6SVXUZtl
   9wEMcKme3sxzXFo4seM/pi8MyA1+4zxIzfpxzXoY4md9e5PsVCdP4hEh7
   +DEYgwhOqExwVvKM/nqy+gPwgaVlHPN0Osy8IgrehJhvc6xLNFjgylmRZ
   g==;
IronPort-SDR: RRY+ZGtwij9SsA4Mo57KjtEZ1PgJySsoiQgxfr5BzfAGzPCSGJ4EOiSD9bLbmx6OEWuXdsHG02
 Iz/QtfDgCHsvKLUtNsuag8/kpXi5IRusLgaCXkSiwy34XNHeQkqrlQ3uS1HEJK8b3FUbZtQV45
 fnGj9qmkrn3caYIgGfVW8j6r+x9vWgG7Hk1lx2Cbqy1adbZOk51q+doWppSeTWIBxGa7d3EVPh
 BbWf8WfiKbQ9TbmQ3KLJP/AjDLaGOLTV76lzXCtINecKcRcjqcFleaS6xugCHc6Y9ZStdVL9Z5
 sKY=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; 
   d="scan'208";a="158518314"
IronPort-SDR: pnrFcT3jy6zyRhgBO65y9U+V/An9wsNd7jAAA1OJu//w4sNdy3uAVQWKHLytgWqQXWJY2Iw2HB
 WreAIc8DGfbG7OORiXj1gZRpCheBj5D09oDLSsRznzxd7c9aNO2uFNevBGca7t9dx0A+h07Mbx
 gptEDUplV9D7deBVMK80s2GrfXVIv6lOFI6IQ/vNKNcEl7B44zv/Dk+bHc77e12lF8JkmnESek
 iRIjbSHsdtWNFG85HrniClf3XGtfpcnusd1vTQnddIV13SAcuxTu7XYYY6RJrvmuUG4DTXqRVN
 PALSx/O6llAja0jYxcBNnWZq
IronPort-SDR: AZlMO6gj0EkPLCOgk+c5DT4WNDhjCfw45MtadZ5/GiFEmQsvwhsbRFXpLpdTLbQmQEemYM6EDm
 tOJGHTOsUuwCnKWQp1EvZsc2vVv2mGBlVwctpi8EDm1Wy6X1cWP44qswXm3cNGjgKR2lWgrabH
 PKyOztqBt3vFXNBi+4zXssLa4rCI5pehsTeRPvX3Q8KhjR216EOs3fiNJCh3n7IcfWfe8KNrrp
 msksZa1Bq+VYcOk7PDniLMLHnLtDMI1z0ihKaVt3jNoNuACs7lGXhymeE4zWEV78rp7w4D786X
 hJ8=
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
Subject: [RFC PATCH 21/34] fs/jfs/jfs_metapage.c: use bio_new in metapage_writepage
Date: Wed, 27 Jan 2021 23:11:20 -0800
Message-Id: <20210128071133.60335-22-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
References: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 fs/jfs/jfs_metapage.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/jfs/jfs_metapage.c b/fs/jfs/jfs_metapage.c
index 176580f54af9..3fa09d9a0b94 100644
--- a/fs/jfs/jfs_metapage.c
+++ b/fs/jfs/jfs_metapage.c
@@ -416,12 +416,11 @@ static int metapage_writepage(struct page *page, struct writeback_control *wbc)
 		}
 		len = min(xlen, (int)JFS_SBI(inode->i_sb)->nbperpage);
 
-		bio = bio_alloc(GFP_NOFS, 1);
-		bio_set_dev(bio, inode->i_sb->s_bdev);
-		bio->bi_iter.bi_sector = pblock << (inode->i_blkbits - 9);
+		bio = bio_new(inode->i_sb->s_bdev,
+			      pblock << (inode->i_blkbits - 9), REQ_OP_WRITE,
+			      0, 1, GFP_NOFS);
 		bio->bi_end_io = metapage_write_end_io;
 		bio->bi_private = page;
-		bio_set_op_attrs(bio, REQ_OP_WRITE, 0);
 
 		/* Don't call bio_add_page yet, we may add to this vec */
 		bio_offset = offset;
-- 
2.22.1


