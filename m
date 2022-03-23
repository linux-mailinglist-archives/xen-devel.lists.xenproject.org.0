Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4F84E4CDD
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 07:44:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293754.499140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWuhr-0003QD-Gl; Wed, 23 Mar 2022 06:42:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293754.499140; Wed, 23 Mar 2022 06:42:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWuhr-0003OO-Dc; Wed, 23 Mar 2022 06:42:55 +0000
Received: by outflank-mailman (input) for mailman id 293754;
 Wed, 23 Mar 2022 06:42:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/AEF=UC=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1nWuhq-0003OI-Gx
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 06:42:54 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7605b55e-aa74-11ec-8fbc-03012f2f19d4;
 Wed, 23 Mar 2022 07:42:51 +0100 (CET)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 8DA2C68AFE; Wed, 23 Mar 2022 07:42:48 +0100 (CET)
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
X-Inumbo-ID: 7605b55e-aa74-11ec-8fbc-03012f2f19d4
Date: Wed, 23 Mar 2022 07:42:48 +0100
From: Christoph Hellwig <hch@lst.de>
To: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>, Guenter Roeck <linux@roeck-us.net>,
	Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	linux-nilfs <linux-nilfs@vger.kernel.org>,
	Mike Snitzer <snitzer@redhat.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.co>,
	device-mapper development <dm-devel@redhat.com>,
	"Md . Haris Iqbal" <haris.iqbal@ionos.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	linux-fsdevel@vger.kernel.org, xen-devel@lists.xenproject.org,
	Andrew Morton <akpm@linux-foundation.org>, ntfs3@lists.linux.dev,
	Jack Wang <jinpu.wang@ionos.com>,
	Pavel Begunkov <asml.silence@gmail.com>, drbd-dev@lists.linbit.com
Subject: Re: [dm-devel] [PATCH 01/19] fs: remove mpage_alloc
Message-ID: <20220323064248.GA24874@lst.de>
References: <20220124091107.642561-1-hch@lst.de> <20220124091107.642561-2-hch@lst.de> <20220322211915.GA2413063@roeck-us.net> <CAKFNMonRd5QQMzLoH3T=M=C=2Q_j9d86EYzZeY4DU2HQAE3E8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKFNMonRd5QQMzLoH3T=M=C=2Q_j9d86EYzZeY4DU2HQAE3E8w@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Mar 23, 2022 at 06:38:22AM +0900, Ryusuke Konishi wrote:
> This looks because the mask of GFP_KERNEL is removed along with
> the removal of mpage_alloc().
> 

> The default value of the gfp flag is set to GFP_HIGHUSER_MOVABLE by
> inode_init_always().
> So, __GFP_HIGHMEM hits the gfp warning at bio_alloc() that
> do_mpage_readpage() calls.

Yeah.  Let's try this to match the iomap code:

diff --git a/fs/mpage.c b/fs/mpage.c
index 9ed1e58e8d70b..d465883edf719 100644
--- a/fs/mpage.c
+++ b/fs/mpage.c
@@ -148,13 +148,11 @@ static struct bio *do_mpage_readpage(struct mpage_readpage_args *args)
 	int op = REQ_OP_READ;
 	unsigned nblocks;
 	unsigned relative_block;
-	gfp_t gfp;
+	gfp_t gfp = mapping_gfp_constraint(page->mapping, GFP_KERNEL);
 
 	if (args->is_readahead) {
 		op |= REQ_RAHEAD;
-		gfp = readahead_gfp_mask(page->mapping);
-	} else {
-		gfp = mapping_gfp_constraint(page->mapping, GFP_KERNEL);
+		gfp |= __GFP_NORETRY | __GFP_NOWARN;
 	}
 
 	if (page_has_buffers(page))

