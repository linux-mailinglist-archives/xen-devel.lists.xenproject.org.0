Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AE0806830
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 08:22:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648936.1013046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAmEV-0002n2-Ga; Wed, 06 Dec 2023 07:22:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648936.1013046; Wed, 06 Dec 2023 07:22:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAmEV-0002kz-DS; Wed, 06 Dec 2023 07:22:11 +0000
Received: by outflank-mailman (input) for mailman id 648936;
 Wed, 06 Dec 2023 07:22:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sruh=HR=bombadil.srs.infradead.org=BATV+2d31c4bdfe93494595b7+7409+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1rAmEU-0002kr-II
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 07:22:10 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a2b0c6a-9408-11ee-98e5-6d05b1d4d9a1;
 Wed, 06 Dec 2023 08:22:09 +0100 (CET)
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1rAmDz-009HyE-2v; Wed, 06 Dec 2023 07:21:39 +0000
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
X-Inumbo-ID: 2a2b0c6a-9408-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qmCAsGLsB31X5J4lJ2nHtJS8+MwGW1F5WEYO0jIziI0=; b=hhRbaenXZsjRyFtp5oCl7ZLapp
	PGbBHBMazopo9x7zLycOLomgyozjMFDmXz0mBlHcwPG5BI6SfQiEYs2RFIxTkHszoMBIB5fp7RvF5
	vaqpcOeQKcUjsuqauqy5BsIY31xjg/0sVfUccDbi5kKXOZc7fS1d0vbSOWjK1ECcJERDPQIM6Icyq
	pZ82Y80XxVZAy+fiqCF56whvlLXWz/53NURq30p1NEOux+n0cJVqd1itpsG6+3wl1H+zQ95RNHzGZ
	8Wbn2E17f06JWnxiq2s6y4vOb2NT9ha36DJvWW/HkrWz3MeH9YEasxDh/aL/9GmJ56G3rYqKjOoGL
	m/NxJEIQ==;
Date: Tue, 5 Dec 2023 23:21:39 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: Christoph Hellwig <hch@infradead.org>, axboe@kernel.dk,
	roger.pau@citrix.com, colyli@suse.de, kent.overstreet@gmail.com,
	joern@lazybastard.org, miquel.raynal@bootlin.com, richard@nod.at,
	vigneshr@ti.com, sth@linux.ibm.com, hoeppner@linux.ibm.com,
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
	jejb@linux.ibm.com, martin.petersen@oracle.com, clm@fb.com,
	josef@toxicpanda.com, dsterba@suse.com, nico@fluxnic.net,
	xiang@kernel.org, chao@kernel.org, tytso@mit.edu,
	adilger.kernel@dilger.ca, agruenba@redhat.com, jack@suse.com,
	konishi.ryusuke@gmail.com, willy@infradead.org,
	akpm@linux-foundation.org, hare@suse.de, p.raghav@samsung.com,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-bcachefs@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-ext4@vger.kernel.org, gfs2@lists.linux.dev,
	linux-nilfs@vger.kernel.org, yi.zhang@huawei.com,
	yangerkun@huawei.com, "yukuai (C)" <yukuai3@huawei.com>
Subject: Re: [PATCH -next RFC 02/14] xen/blkback: use bdev api in
 xen_update_blkif_status()
Message-ID: <ZXAhA0WUXoF5YEq4@infradead.org>
References: <20231205123728.1866699-1-yukuai1@huaweicloud.com>
 <20231205123728.1866699-3-yukuai1@huaweicloud.com>
 <ZXAMwBD8pd48qwX/@infradead.org>
 <783b5515-db42-c77f-62ab-050f7cc8ef5e@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <783b5515-db42-c77f-62ab-050f7cc8ef5e@huaweicloud.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Wed, Dec 06, 2023 at 02:56:05PM +0800, Yu Kuai wrote:
> > > -	invalidate_inode_pages2(
> > > -			blkif->vbd.bdev_handle->bdev->bd_inode->i_mapping);
> > > +	invalidate_bdev(blkif->vbd.bdev_handle->bdev);
> > 
> > blkbak is a bdev exported.   I don't think it should ever call
> > invalidate_inode_pages2, through a wrapper or not.
> 
> I'm not sure about this. I'm not familiar with xen/blkback, but I saw
> that xen-blkback will open a bdev from xen_vbd_create(), hence this
> looks like a dm/md for me, hence it sounds reasonable to sync +
> invalidate the opened bdev while initialization. Please kindly correct
> me if I'm wrong.

I guess we have enough precedence for this, so the switchover here
isn't wrong.  But all this invalidating of the bdev cache seems to
be asking for trouble.


