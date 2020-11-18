Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F0F2B793C
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 09:48:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29442.58864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfJ8y-0006uD-KX; Wed, 18 Nov 2020 08:48:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29442.58864; Wed, 18 Nov 2020 08:48:48 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfJ8y-0006tW-Ee; Wed, 18 Nov 2020 08:48:48 +0000
Received: by outflank-mailman (input) for mailman id 29442;
 Wed, 18 Nov 2020 08:48:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7bqw=EY=casper.srs.infradead.org=batv+9f981d017e6f7609177a+6296+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1kfJ8x-0006e0-1n
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 08:48:47 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e015755b-a763-43f0-9ad7-d5e4d6a30097;
 Wed, 18 Nov 2020 08:48:26 +0000 (UTC)
Received: from [2001:4bb8:18c:31ba:32b1:ec66:5459:36a] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfJ8H-0007kQ-Oc; Wed, 18 Nov 2020 08:48:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=7bqw=EY=casper.srs.infradead.org=batv+9f981d017e6f7609177a+6296+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1kfJ8x-0006e0-1n
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 08:48:47 +0000
X-Inumbo-ID: e015755b-a763-43f0-9ad7-d5e4d6a30097
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e015755b-a763-43f0-9ad7-d5e4d6a30097;
	Wed, 18 Nov 2020 08:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=TGRxj3P5fN3QWbEKVTDt35+3igPcA4rCa+2EvBLtC8g=; b=PneJaAwHQHJWZMHR7k5+0kk3SW
	A637+tLVo0+wFYquvEJFrDmJGArQtG1KOZwaGCDcb5uwjoCpzXm5p38WC3Z79c3W1Swj1SNUBRNa6
	rcFaHgHlsCggXHjqeabUB4vl/TxH3BbslIfvIWOw76bNGryHFS0oOO6QGe02Z/szHszDuZfZaVGF7
	23TDL9jueG8glTxv5jhe+z4KkCNXNKIuP3jUqJ8Fp21K4ZBhqs9AfHyhYybRkG2we41vboVqG0XXs
	mAy1tiCpbrwoXa0Ibko7TJrxx/UZnZMUdAbbu4bn9DFirVnGNcjP7fIL0fwtGBVYjU1KM/a0NOzqV
	GyvwqgEA==;
Received: from [2001:4bb8:18c:31ba:32b1:ec66:5459:36a] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfJ8H-0007kQ-Oc; Wed, 18 Nov 2020 08:48:06 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Tejun Heo <tj@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Coly Li <colyli@suse.de>,
	Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com,
	Richard Weinberger <richard@nod.at>,
	Jan Kara <jack@suse.com>,
	linux-block@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 02/20] block: remove a duplicate __disk_get_part prototype
Date: Wed, 18 Nov 2020 09:47:42 +0100
Message-Id: <20201118084800.2339180-3-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201118084800.2339180-1-hch@lst.de>
References: <20201118084800.2339180-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/genhd.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index 46553d6d602563..22f5b9fd96f8bf 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -250,7 +250,6 @@ static inline dev_t part_devt(struct hd_struct *part)
 	return part_to_dev(part)->devt;
 }
 
-extern struct hd_struct *__disk_get_part(struct gendisk *disk, int partno);
 extern struct hd_struct *disk_get_part(struct gendisk *disk, int partno);
 
 static inline void disk_put_part(struct hd_struct *part)
-- 
2.29.2


