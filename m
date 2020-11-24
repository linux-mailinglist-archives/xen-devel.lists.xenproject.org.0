Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0792C2723
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 14:29:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36012.67760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khYNV-00014L-NO; Tue, 24 Nov 2020 13:29:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36012.67760; Tue, 24 Nov 2020 13:29:05 +0000
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
	id 1khYNV-00013b-JT; Tue, 24 Nov 2020 13:29:05 +0000
Received: by outflank-mailman (input) for mailman id 36012;
 Tue, 24 Nov 2020 13:29:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=daQ6=E6=casper.srs.infradead.org=batv+cbe268a5dfa7b983a02e+6302+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1khYNU-0000Qf-1X
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 13:29:04 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eef56dca-15d9-43e0-b480-0ff9c313d056;
 Tue, 24 Nov 2020 13:28:31 +0000 (UTC)
Received: from [2001:4bb8:180:5443:c70:4a89:bc61:3] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khYMO-0006UA-S8; Tue, 24 Nov 2020 13:27:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=daQ6=E6=casper.srs.infradead.org=batv+cbe268a5dfa7b983a02e+6302+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1khYNU-0000Qf-1X
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 13:29:04 +0000
X-Inumbo-ID: eef56dca-15d9-43e0-b480-0ff9c313d056
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id eef56dca-15d9-43e0-b480-0ff9c313d056;
	Tue, 24 Nov 2020 13:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Q/MCT6maV/iKaSxRRRnLFBnoEWfPfC40ypgl1Ci8nRk=; b=pWcZmhed1VtM52P3q1JMqqjfxR
	GWMfkfGGh21/NCT85snknz3WDUM0FCyAbepRt+ZELj82dad4m3br4Sawb66pKbQxSAEUaJxSeL+Ll
	71lYUsvhjLKgY/YbGp0X++3PkxXh+KrssNfKTT0h2mCWPuefl+mBpjJwTcCV+e1SRjBbrscsDgFCm
	lMW8Geg/e4WV3fB64E9SDr1XU5cgwgMIdLeq0nWxNCx03aqe1+hiU2wmbmGncWiO1/xxhiOEuXkHa
	z9KSmzy5zBC51q81wbv9yHNv1xP232XeeVA1TEmOLWeYTbWgkPDrO0cmsehbzSHT+I2DtVpVX0ELT
	qGUkh4WA==;
Received: from [2001:4bb8:180:5443:c70:4a89:bc61:3] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khYMO-0006UA-S8; Tue, 24 Nov 2020 13:27:58 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Tejun Heo <tj@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Coly Li <colyli@suse.de>,
	Mike Snitzer <snitzer@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jan Kara <jack@suse.cz>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	dm-devel@redhat.com,
	Richard Weinberger <richard@nod.at>,
	Jan Kara <jack@suse.com>,
	linux-block@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 02/45] filemap: consistently use ->f_mapping over ->i_mapping
Date: Tue, 24 Nov 2020 14:27:08 +0100
Message-Id: <20201124132751.3747337-3-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201124132751.3747337-1-hch@lst.de>
References: <20201124132751.3747337-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Use file->f_mapping in all remaining places that have a struct file
available to properly handle the case where inode->i_mapping !=
file_inode(file)->i_mapping.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 mm/filemap.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/mm/filemap.c b/mm/filemap.c
index d5e7c2029d16b4..4f583489aa3c2a 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -2886,14 +2886,14 @@ EXPORT_SYMBOL(filemap_map_pages);
 
 vm_fault_t filemap_page_mkwrite(struct vm_fault *vmf)
 {
+	struct address_space *mapping = vmf->vma->vm_file->f_mapping;
 	struct page *page = vmf->page;
-	struct inode *inode = file_inode(vmf->vma->vm_file);
 	vm_fault_t ret = VM_FAULT_LOCKED;
 
-	sb_start_pagefault(inode->i_sb);
+	sb_start_pagefault(mapping->host->i_sb);
 	file_update_time(vmf->vma->vm_file);
 	lock_page(page);
-	if (page->mapping != inode->i_mapping) {
+	if (page->mapping != mapping) {
 		unlock_page(page);
 		ret = VM_FAULT_NOPAGE;
 		goto out;
@@ -2906,7 +2906,7 @@ vm_fault_t filemap_page_mkwrite(struct vm_fault *vmf)
 	set_page_dirty(page);
 	wait_for_stable_page(page);
 out:
-	sb_end_pagefault(inode->i_sb);
+	sb_end_pagefault(mapping->host->i_sb);
 	return ret;
 }
 
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


