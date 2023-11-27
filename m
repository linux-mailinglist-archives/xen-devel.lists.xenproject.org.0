Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7978E7F9ADA
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 08:23:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641624.1000332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Vwt-00030c-LN; Mon, 27 Nov 2023 07:22:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641624.1000332; Mon, 27 Nov 2023 07:22:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Vwt-0002z5-Hq; Mon, 27 Nov 2023 07:22:31 +0000
Received: by outflank-mailman (input) for mailman id 641624;
 Mon, 27 Nov 2023 07:22:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sMaF=HI=bombadil.srs.infradead.org=BATV+6fdacddc1aa5db9ef0e1+7400+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1r7Vws-0002yz-Go
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 07:22:31 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b72048e0-8cf5-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 08:22:28 +0100 (CET)
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1r7Vvt-001iAl-0W; Mon, 27 Nov 2023 07:21:29 +0000
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
X-Inumbo-ID: b72048e0-8cf5-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bbFcmB19INmvUTx5j+M9jRyJXBnU+PmCLplmYes7xKg=; b=HmhTUB6Bgh7OnZuv3MNiTVnfXC
	c22YIG8T5br8hsKMu41mjZ9/cx++C8wVTWDYSvUAH36xMkip5/yiTG260lY2rrIM/r+C0G+isp9uF
	etkeNOURS8fQD6aPmSdyzSSGKWF+pTqcC1ZGT7oZVvUTVk9QpHYUf0FBUrJw19CADdPVngmSrijuO
	IOMUdcJcEkdHTqMAdFx1L+mfGJd3fWDG081TsGYrqYpe4ADrF5w0LuzxW+1HqJjso+aXzjyCht+N2
	tYj8ta2d171C20L5JBM/BAzza5S6Fp5sV5ukto8ZE9jI63+MJW0c2xIdTP/sw0+cxDdqp7qdN9Sak
	f2DjTQ3g==;
Date: Sun, 26 Nov 2023 23:21:29 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: hch@infradead.org, ming.lei@redhat.com, axboe@kernel.dk,
	roger.pau@citrix.com, colyli@suse.de, kent.overstreet@gmail.com,
	joern@lazybastard.org, miquel.raynal@bootlin.com, richard@nod.at,
	vigneshr@ti.com, sth@linux.ibm.com, hoeppner@linux.ibm.com,
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
	jejb@linux.ibm.com, martin.petersen@oracle.com, clm@fb.com,
	josef@toxicpanda.com, dsterba@suse.com, viro@zeniv.linux.org.uk,
	brauner@kernel.org, nico@fluxnic.net, xiang@kernel.org,
	chao@kernel.org, tytso@mit.edu, adilger.kernel@dilger.ca,
	agruenba@redhat.com, jack@suse.com, konishi.ryusuke@gmail.com,
	dchinner@redhat.com, linux@weissschuh.net, min15.li@samsung.com,
	yukuai3@huawei.com, dlemoal@kernel.org, willy@infradead.org,
	akpm@linux-foundation.org, hare@suse.de, p.raghav@samsung.com,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-bcachefs@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
	gfs2@lists.linux.dev, linux-nilfs@vger.kernel.org,
	yi.zhang@huawei.com, yangerkun@huawei.com
Subject: Re: [PATCH block/for-next v2 01/16] block: add a new helper to get
 inode from block_device
Message-ID: <ZWRDeQ4K8BiYnV+X@infradead.org>
References: <20231127062116.2355129-1-yukuai1@huaweicloud.com>
 <20231127062116.2355129-2-yukuai1@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231127062116.2355129-2-yukuai1@huaweicloud.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Mon, Nov 27, 2023 at 02:21:01PM +0800, Yu Kuai wrote:
> From: Yu Kuai <yukuai3@huawei.com>
> 
> block_devcie is allocated from bdev_alloc() by bdev_alloc_inode(), and
> currently block_device contains a pointer that point to the address of
> inode, while such inode is allocated together:

This is going the wrong way.  Nothing outside of core block layer code
should ever directly use the bdev inode.  We've been rather sloppy
and added a lot of direct reference to it, but they really need to
go away and be replaced with well defined high level operation on
struct block_device.  Once that is done we can remove the bd_inode
pointer, but replacing it with something that pokes even more deeply
into bdev internals is a bad idea.

