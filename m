Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E11E497B2D
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jan 2022 10:11:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259764.448337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBvNu-0001TE-A3; Mon, 24 Jan 2022 09:11:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259764.448337; Mon, 24 Jan 2022 09:11:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBvNu-0001QJ-48; Mon, 24 Jan 2022 09:11:34 +0000
Received: by outflank-mailman (input) for mailman id 259764;
 Mon, 24 Jan 2022 09:11:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4uJJ=SI=bombadil.srs.infradead.org=BATV+b18af077b488c69bdec9+6728+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nBvNs-0000If-Mv
 for xen-devel@lists.xenproject.org; Mon, 24 Jan 2022 09:11:32 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e9e7d5b-7cf5-11ec-bc18-3156f6d857e4;
 Mon, 24 Jan 2022 10:11:32 +0100 (CET)
Received: from [2001:4bb8:184:72a4:a337:a75f:a24e:7e39] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBvNg-002k1j-Gg; Mon, 24 Jan 2022 09:11:21 +0000
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
X-Inumbo-ID: 9e9e7d5b-7cf5-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=EcXfe+QJLbyEaBSYcI8IdLx+VpwVU+Twsx7L0heUO1Q=; b=i9tcmKqWExYwFyUC3GAfdvN0G9
	cAdpT77el2rpxNNIFlvamk56bpHBy6jnsKj8q3rJ8nawaJ8TV7+QPqH/vGIAki4ZzwrDeoVrlWY7x
	vTq6delBNM/Owx6rHpv19HnjVMkfSK+nS7d5zpnlMcNWTlhUuDN530jXcyf2m/kkhVEaI/q5ryfsX
	TE7hn5wlaJifpc3rpsnyGrrVENjdur2aPZNRi6GYDrfwvZ8ZzqzKcwpy2OdXl3O1Apcb1fKr2bKrL
	VVKEY6d77BVmOEMEhxPk3wlx64Im1KfTmaMpWNPoU4MCescTElKDFR4xumyfaYjlYFSg22uNUWoba
	n1ec9EKw==;
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Pavel Begunkov <asml.silence@gmail.com>,
	Mike Snitzer <snitzer@redhat.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Md . Haris Iqbal " <haris.iqbal@ionos.com>,
	Jack Wang <jinpu.wang@ionos.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.co>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	linux-block@vger.kernel.org,
	dm-devel@redhat.com,
	linux-fsdevel@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	linux-nilfs@vger.kernel.org,
	ntfs3@lists.linux.dev,
	xen-devel@lists.xenproject.org,
	drbd-dev@lists.linbit.com
Subject: [PATCH 04/19] ntfs3: remove ntfs_alloc_bio
Date: Mon, 24 Jan 2022 10:10:52 +0100
Message-Id: <20220124091107.642561-5-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220124091107.642561-1-hch@lst.de>
References: <20220124091107.642561-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

bio_alloc will never fail if it is allowed to sleep, so there is no
need for this loop.  Also remove the __GFP_HIGH specifier as it doesn't
make sense here given that we'll always fall back to the mempool anyway.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/ntfs3/fsntfs.c | 23 ++---------------------
 1 file changed, 2 insertions(+), 21 deletions(-)

diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
index 4de9acb169689..4a255e21ecf5f 100644
--- a/fs/ntfs3/fsntfs.c
+++ b/fs/ntfs3/fsntfs.c
@@ -1443,17 +1443,6 @@ int ntfs_write_bh(struct ntfs_sb_info *sbi, struct NTFS_RECORD_HEADER *rhdr,
 	return err;
 }
 
-static inline struct bio *ntfs_alloc_bio(u32 nr_vecs)
-{
-	struct bio *bio = bio_alloc(GFP_NOFS | __GFP_HIGH, nr_vecs);
-
-	if (!bio && (current->flags & PF_MEMALLOC)) {
-		while (!bio && (nr_vecs /= 2))
-			bio = bio_alloc(GFP_NOFS | __GFP_HIGH, nr_vecs);
-	}
-	return bio;
-}
-
 /*
  * ntfs_bio_pages - Read/write pages from/to disk.
  */
@@ -1496,11 +1485,7 @@ int ntfs_bio_pages(struct ntfs_sb_info *sbi, const struct runs_tree *run,
 		lbo = ((u64)lcn << cluster_bits) + off;
 		len = ((u64)clen << cluster_bits) - off;
 new_bio:
-		new = ntfs_alloc_bio(nr_pages - page_idx);
-		if (!new) {
-			err = -ENOMEM;
-			goto out;
-		}
+		new = bio_alloc(GFP_NOFS, nr_pages - page_idx);
 		if (bio) {
 			bio_chain(bio, new);
 			submit_bio(bio);
@@ -1599,11 +1584,7 @@ int ntfs_bio_fill_1(struct ntfs_sb_info *sbi, const struct runs_tree *run)
 		lbo = (u64)lcn << cluster_bits;
 		len = (u64)clen << cluster_bits;
 new_bio:
-		new = ntfs_alloc_bio(BIO_MAX_VECS);
-		if (!new) {
-			err = -ENOMEM;
-			break;
-		}
+		new = bio_alloc(GFP_NOFS, BIO_MAX_VECS);
 		if (bio) {
 			bio_chain(bio, new);
 			submit_bio(bio);
-- 
2.30.2


