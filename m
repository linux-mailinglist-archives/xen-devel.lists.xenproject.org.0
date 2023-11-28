Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BDF7FB191
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 06:50:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642734.1002380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7qy1-0003wI-4D; Tue, 28 Nov 2023 05:49:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642734.1002380; Tue, 28 Nov 2023 05:49:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7qy1-0003uG-1a; Tue, 28 Nov 2023 05:49:05 +0000
Received: by outflank-mailman (input) for mailman id 642734;
 Tue, 28 Nov 2023 05:49:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Me7v=HJ=bombadil.srs.infradead.org=BATV+011e5a6fe4263adb6d23+7401+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1r7qxy-0003u9-T7
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 05:49:03 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1ede11b-8db1-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 06:48:59 +0100 (CET)
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1r7qxI-004BPZ-2N; Tue, 28 Nov 2023 05:48:20 +0000
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
X-Inumbo-ID: d1ede11b-8db1-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=piX6sU8uUfRdM3HI4C5o5RtKyEk7LebUsWmX5nAnS9s=; b=zxF6+s0SCn2mTM1F5sDGatwdiD
	r+J5EdNg/JbVc8/TEwBGrSiUOrPltOv0SB5DHqEzye3x5UYQ3y43F+9CYP+YH9zZju4MAnIxN7jLr
	52H6aTiRg9m6ogsTbJ455qxXjn6rKf3EheShZA+8TlQ0nbft+l3Lre4a0bU7FkEs+H18O/xb4HfZ2
	DcIkdp3IB1Vc74yjq/SGmA7ZBc/H0ChYb2skCnNlw+1loprwzCvOOZXqJXWMJW983aVx/FvifwWE8
	GXy6mVkavESjy4cQk0Ees741WqX1/u5t1i6oo5VnA69qG8fgQUNZnB/k4V2ZDGbJGb/SxQnB+AlVf
	iSo+n9HA==;
Date: Mon, 27 Nov 2023 21:48:20 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: Christoph Hellwig <hch@infradead.org>, ming.lei@redhat.com,
	axboe@kernel.dk, roger.pau@citrix.com, colyli@suse.de,
	kent.overstreet@gmail.com, joern@lazybastard.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	sth@linux.ibm.com, hoeppner@linux.ibm.com, hca@linux.ibm.com,
	gor@linux.ibm.com, agordeev@linux.ibm.com, jejb@linux.ibm.com,
	martin.petersen@oracle.com, clm@fb.com, josef@toxicpanda.com,
	dsterba@suse.com, viro@zeniv.linux.org.uk, brauner@kernel.org,
	nico@fluxnic.net, xiang@kernel.org, chao@kernel.org, tytso@mit.edu,
	adilger.kernel@dilger.ca, agruenba@redhat.com, jack@suse.com,
	konishi.ryusuke@gmail.com, dchinner@redhat.com,
	linux@weissschuh.net, min15.li@samsung.com, dlemoal@kernel.org,
	willy@infradead.org, akpm@linux-foundation.org, hare@suse.de,
	p.raghav@samsung.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-bcachefs@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-ext4@vger.kernel.org, gfs2@lists.linux.dev,
	linux-nilfs@vger.kernel.org, yi.zhang@huawei.com,
	yangerkun@huawei.com, "yukuai (C)" <yukuai3@huawei.com>
Subject: Re: [PATCH block/for-next v2 01/16] block: add a new helper to get
 inode from block_device
Message-ID: <ZWV/JBxrrGXzY0gr@infradead.org>
References: <20231127062116.2355129-1-yukuai1@huaweicloud.com>
 <20231127062116.2355129-2-yukuai1@huaweicloud.com>
 <ZWRDeQ4K8BiYnV+X@infradead.org>
 <6acdeece-7163-3219-95e2-827e54eadd0c@huaweicloud.com>
 <ZWTErvnMf7HiO1Wj@infradead.org>
 <bc64da80-e9bd-84cb-f173-876623303131@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc64da80-e9bd-84cb-f173-876623303131@huaweicloud.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Tue, Nov 28, 2023 at 09:35:56AM +0800, Yu Kuai wrote:
> Thanks for the advice! In case I'm understanding correctly, do you mean
> that all other fs/drivers that is using pages versions can safely switch
> to folio versions now?

If you never allocate a high-order folio pages are identical to folios.
So yes, we can do folio based interfaces only, and also use that as
an opportunity to convert over the callers.

> By the way, my orginal idea was trying to add a new field 'bd_flags'
> in block_devcie, and then add a new bit so that bio_check_ro() will
> only warn once for each partition. Now that this patchset will be quite
> complex, I'll add a new bool field 'bd_ro_warned' to fix the above
> problem first, and then add 'bd_flags' once this patchset is done.

Yes, please do a minimal version if you can find space where the
rmw cycles don't cause damage to neighbouring fields.  Or just leave
the current set of warnings in if it's too hard.


