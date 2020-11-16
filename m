Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8962B48B3
	for <lists+xen-devel@lfdr.de>; Mon, 16 Nov 2020 16:10:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.28183.57133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1keg9c-0004I2-GN; Mon, 16 Nov 2020 15:10:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28183.57133; Mon, 16 Nov 2020 15:10:52 +0000
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
	id 1keg9b-0004C3-EW; Mon, 16 Nov 2020 15:10:51 +0000
Received: by outflank-mailman (input) for mailman id 28183;
 Mon, 16 Nov 2020 15:10:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DM7u=EW=casper.srs.infradead.org=batv+29a21e8ca386e11a5a78+6294+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1keg4H-0006ni-Dn
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 15:05:21 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 14af5499-b809-4547-becc-abc358585705;
 Mon, 16 Nov 2020 15:00:12 +0000 (UTC)
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kefz6-0004Ja-4t; Mon, 16 Nov 2020 15:00:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DM7u=EW=casper.srs.infradead.org=batv+29a21e8ca386e11a5a78+6294+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1keg4H-0006ni-Dn
	for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 15:05:21 +0000
X-Inumbo-ID: 14af5499-b809-4547-becc-abc358585705
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 14af5499-b809-4547-becc-abc358585705;
	Mon, 16 Nov 2020 15:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=hht0IJxm0Atonm6wFAUEQs4XOgcCelxMQ4knV7FOtuU=; b=OnR7Hl4Gn8Cqes4fUGZG09Ou5b
	wkdlpWME3XUZyniKD0u6+LvQEZ4jfV5KI0bvgOdKoKy/avRVN1ICpG3ayLr7y9f7mbweYvyb5dtf9
	LB6vxsD9CHKtKypIkEHeVB91GzwQLjRfxlTFqOarpX4O1io/JrahYaGlAejJ9Wdq1/ICyENnWPCND
	K6zRNnIdtyLJMuh8Hr4Sfe2rN4rdYR4DXOl0KacL5GfpL0QuIaqSWtKXdNYNYLVFnm5vnjYokZj+O
	0vQqQ4fnqy8Lr9QzB4VCWPgAQgxp0yphr6N7aK0gOpCB0lKFL+g2IP94YJiiFkRNGuFpsWI78KvwO
	vmSnReZw==;
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kefz6-0004Ja-4t; Mon, 16 Nov 2020 15:00:00 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Justin Sanders <justin@coraid.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	Jack Wang <jinpu.wang@cloud.ionos.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Minchan Kim <minchan@kernel.org>,
	Mike Snitzer <snitzer@redhat.com>,
	Song Liu <song@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com,
	linux-block@vger.kernel.org,
	drbd-dev@lists.linbit.com,
	nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-raid@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 76/78] filemap: use ->f_mapping over ->i_mapping consistently
Date: Mon, 16 Nov 2020 15:58:07 +0100
Message-Id: <20201116145809.410558-77-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201116145809.410558-1-hch@lst.de>
References: <20201116145809.410558-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Use file->f_mapping in all functions that have a struct file available
to properly handle the case where file_inode(file)->i_mapping !=
inode->i_mapping.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 mm/filemap.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/mm/filemap.c b/mm/filemap.c
index d5e7c2029d16b4..3e3531a757f8db 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -2887,13 +2887,13 @@ EXPORT_SYMBOL(filemap_map_pages);
 vm_fault_t filemap_page_mkwrite(struct vm_fault *vmf)
 {
 	struct page *page = vmf->page;
-	struct inode *inode = file_inode(vmf->vma->vm_file);
+	struct inode *inode = vmf->vma->vm_file->f_mapping->host;
 	vm_fault_t ret = VM_FAULT_LOCKED;
 
 	sb_start_pagefault(inode->i_sb);
 	file_update_time(vmf->vma->vm_file);
 	lock_page(page);
-	if (page->mapping != inode->i_mapping) {
+	if (page->mapping != vmf->vma->vm_file->f_mapping) {
 		unlock_page(page);
 		ret = VM_FAULT_NOPAGE;
 		goto out;
@@ -3149,10 +3149,9 @@ void dio_warn_stale_pagecache(struct file *filp)
 {
 	static DEFINE_RATELIMIT_STATE(_rs, 86400 * HZ, DEFAULT_RATELIMIT_BURST);
 	char pathname[128];
-	struct inode *inode = file_inode(filp);
 	char *path;
 
-	errseq_set(&inode->i_mapping->wb_err, -EIO);
+	errseq_set(&filp->f_mapping->wb_err, -EIO);
 	if (__ratelimit(&_rs)) {
 		path = file_path(filp, pathname, sizeof(pathname));
 		if (IS_ERR(path))
@@ -3179,7 +3178,7 @@ generic_file_direct_write(struct kiocb *iocb, struct iov_iter *from)
 
 	if (iocb->ki_flags & IOCB_NOWAIT) {
 		/* If there are pages to writeback, return */
-		if (filemap_range_has_page(inode->i_mapping, pos,
+		if (filemap_range_has_page(file->f_mapping, pos,
 					   pos + write_len - 1))
 			return -EAGAIN;
 	} else {
-- 
2.29.2


