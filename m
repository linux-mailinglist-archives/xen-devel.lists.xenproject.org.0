Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E114974AFD0
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 13:29:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560447.876363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHjeN-0005eS-Ol; Fri, 07 Jul 2023 11:29:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560447.876363; Fri, 07 Jul 2023 11:29:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHjeN-0005bH-LN; Fri, 07 Jul 2023 11:29:23 +0000
Received: by outflank-mailman (input) for mailman id 560447;
 Fri, 07 Jul 2023 11:29:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ujok=CZ=bombadil.srs.infradead.org=BATV+5a4ca43f00c3395d7048+7257+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1qHjeK-0005bB-JA
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 11:29:22 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81c998c1-1cb9-11ee-8611-37d641c3527e;
 Fri, 07 Jul 2023 13:29:18 +0200 (CEST)
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qHjdh-004Vpz-0w; Fri, 07 Jul 2023 11:28:41 +0000
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
X-Inumbo-ID: 81c998c1-1cb9-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RUfYUy8/J6JDn9FoGNDP036sYhvQ7qr7NPrif4Grdk0=; b=W8BupQP6fTnw1maVtPw7n0FTsE
	YYE/luqofOMT0IhbP2TwnItjey780Gaej+IMiW55ud+2XaULxiO0l44TVjXxHDze0xRAuH+mluyhr
	7ui49FHiGFXBu/ov7yuPVdyKZ6eJKL+3QsdTV3Gb1KlNN/rv7nlB69UacHrPvm/XuXzbJNEgBM50m
	lj+5xIDBkcqtRkKNokX0ONlo/QTCRQkdYA2xSwzuGzgo4ax7OTAfgkKR0gXaMSjd0fblhIFZkcy3O
	uLWO9DupcrKt+pDlGpSx+Miz6qpzw/HtoMbVHr58WOYYIaYLstJnc/oPaBlHCJkaDsT5H35KaxEXD
	vOIi6ADg==;
Date: Fri, 7 Jul 2023 04:28:41 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jan Kara <jack@suse.cz>
Cc: Christoph Hellwig <hch@infradead.org>, linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	Alasdair Kergon <agk@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anna Schumaker <anna@kernel.org>, Chao Yu <chao@kernel.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Dave Kleikamp <shaggy@kernel.org>, David Sterba <dsterba@suse.com>,
	dm-devel@redhat.com, drbd-dev@lists.linbit.com,
	Gao Xiang <xiang@kernel.org>, Jack Wang <jinpu.wang@ionos.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	jfs-discussion@lists.sourceforge.net,
	Joern Engel <joern@lazybastard.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Kent Overstreet <kent.overstreet@gmail.com>,
	linux-bcache@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org,
	linux-mtd@lists.infradead.org, linux-nfs@vger.kernel.org,
	linux-nilfs@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-raid@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Mike Snitzer <snitzer@kernel.org>, Minchan Kim <minchan@kernel.org>,
	ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Song Liu <song@kernel.org>, Sven Schnelle <svens@linux.ibm.com>,
	target-devel@vger.kernel.org, Ted Tso <tytso@mit.edu>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 01/32] block: Provide blkdev_get_handle_* functions
Message-ID: <ZKf26fYMDHnTCb29@infradead.org>
References: <20230629165206.383-1-jack@suse.cz>
 <20230704122224.16257-1-jack@suse.cz>
 <ZKbgAG5OoHVyUKOG@infradead.org>
 <20230706161433.lj4apushiwguzvdd@quack3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230706161433.lj4apushiwguzvdd@quack3>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Thu, Jul 06, 2023 at 06:14:33PM +0200, Jan Kara wrote:
> > struct bdev_handle *bdev_open_by_path(dev_t dev, blk_mode_t mode,
> > 		void *holder, const struct blk_holder_ops *hops);
> > void bdev_release(struct bdev_handle *handle);
> 
> I'd maybe use bdev_close() instead of bdev_release() but otherwise I like
> the new naming.

We're using release everywhese else, but if Jens is fine with that I
can live with close.

